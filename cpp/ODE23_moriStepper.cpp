//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//
//       This file is part of the E-Cell System
//
//       Copyright (C) 1996-2014 Keio University
//       Copyright (C) 2008-2014 RIKEN
//       Copyright (C) 2005-2009 The Molecular Sciences Institute
//
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//
//
// E-Cell System is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License as published by the Free Software Foundation; either
// version 2 of the License, or (at your option) any later version.
// 
// E-Cell System is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with E-Cell System -- see the file COPYING.
// If not, write to the Free Software Foundation, Inc.,
// 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
// 
//END_HEADER
//
// written by Koichi Takahashi <shafi@e-cell.org>,
// E-Cell Project.
//

#include <libecs/Variable.hpp>
#include <libecs/AdaptiveDifferentialStepper.hpp>

USE_LIBECS;

LIBECS_DM_CLASS( ODE23_moriStepper, AdaptiveDifferentialStepper )
{

public:

    LIBECS_DM_OBJECT( ODE23_moriStepper, Stepper )
    {
        INHERIT_PROPERTIES( AdaptiveDifferentialStepper );
    }
  
    ODE23_moriStepper( void );  
    virtual ~ODE23_moriStepper( void );
    virtual void initialize();           
    virtual void updateInternalState( Real aStepInterval ); 
    virtual bool calculate( Real aStepInterval );
    virtual GET_METHOD( Integer, Stage ) { return 3; }  
    Real Flag;
    void interIntegrate2();
  
protected:

};

LIBECS_DM_INIT( ODE23_moriStepper, Stepper );

ODE23_moriStepper::ODE23_moriStepper()
{
    ; // do nothing
}
                        
ODE23_moriStepper::~ODE23_moriStepper()
{
    ; // do nothing
}

void ODE23_moriStepper::initialize()
{
    AdaptiveDifferentialStepper::initialize();
    // theVelocityBuffer can be replaced by theK2
    // ODE23Stepper doesn't need it, but ODE45Stepper does for the efficiency 
}

void ODE23_moriStepper::interIntegrate2()
{
    Real const aCurrentTime( getCurrentTime() );
    for( VariableVector::size_type c( 0 );
         c != theVariableVector.size(); ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );

        aVariable->setValue( theValueBuffer[ c ] );
        aVariable->interIntegrate( aCurrentTime );
    }
}

bool ODE23_moriStepper::calculate( Real aStepInterval )
{
    const VariableVector::size_type aSize( getReadOnlyVariableOffset() );
    const Real eps_rel( getTolerance() );
    const Real eps_abs( getTolerance() * getAbsoluteToleranceFactor() );
    const Real a_y( getStateToleranceFactor() );
    const Real a_dydt( getDerivativeToleranceFactor() );
    const Real aCurrentTime( getCurrentTime() );
    theStateFlag = true;

    theTaylorSeries.reindex( 0 );

    // ========= 1 ===========
    interIntegrate2();
    fireProcesses();
    setVariableVelocity( theTaylorSeries[ 0 ] );

    // ========= 2 ===========
    setCurrentTime( aCurrentTime + aStepInterval );
    interIntegrate2();
    fireProcesses();
    setVariableVelocity( theTaylorSeries[ 1 ] );

    for( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        theTaylorSeries[ 1 ][ c ] -= theTaylorSeries[ 0 ][ c ];
    }

    // ========= 3 ===========
    setCurrentTime( aCurrentTime + aStepInterval * 0.5 );
    interIntegrate2();
    fireProcesses();
    setVariableVelocity( theTaylorSeries[ 2 ] );

    Real maxError( 1.0e-1 );

    // restore theValueBuffer
    for( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        theTaylorSeries[ 1 ][ c ] *= 0.5;
        const Real anExpectedVelocity( theTaylorSeries[ 0 ][ c ]
                                                                                 + theTaylorSeries[ 1 ][ c ] );

        // ( k1 + k2 + k3 * 4 ) / 6 for ~Yn+1
        // ( k1 + k2 - k3 * 2 ) / 3 for ( Yn+1 - ~Yn+1 ) as a local error
        const Real anEstimatedError(
            fabs( ( anExpectedVelocity - theTaylorSeries[ 2 ][ c ] ) 
                  * ( 2.0 / 3.0 ) ) * aStepInterval );

        const Real aTolerance( eps_rel *
                               ( a_y * fabs( theValueBuffer[ c ] ) 
                                 +  a_dydt * fabs( anExpectedVelocity ) * aStepInterval )
                               + eps_abs );

        const Real anError( anEstimatedError / aTolerance );
        std::cout<<anError<<std::endl;
        if( anError > maxError )
        {
            maxError = anError;
        }

        // restore x (original value)
        theVariableVector[ c ]->setValue( theValueBuffer[ c ] );
        theTaylorSeries[ 2 ][ c ] = 0.0;
    }
    setMaxErrorRatio( maxError );
    setCurrentTime( aCurrentTime );
    resetAll();

    if ( maxError > 1.1 )
    {
        reset();
        return false;
    }

    // set the error limit interval
    return true;
}   

void ODE23_moriStepper::updateInternalState( Real aStepInterval )
{
    theStateFlag = false;

    clearVariables();

    Integer theRejectedStepCounter( 0 );
    const Real maxError( getMaxErrorRatio() );

    while ( !calculate( aStepInterval ) )
    {
        if ( ++theRejectedStepCounter >= theTolerableRejectedStepCount )
        {
            THROW_EXCEPTION_INSIDE( SimulationError,
                String( "The times of rejections of step calculation "
                    "exceeded a maximum tolerable count (" )
                + stringCast( theTolerableRejectedStepCount ) + ")." );
        }
 
        // shrink it if the error exceeds 110%
        //aStepInterval = aStepInterval * safety * std::pow( maxError,
        //                                          -1.0 / getOrder() );       
        aStepInterval *= 0.9;
    }

    std::cout << 1 << std::endl;
    std::cout << maxError << std::endl;
    // an extra calculation for resetting the activities of processes
    fireProcesses();

    setTolerableStepInterval( aStepInterval );

    theStateFlag = true;

    // grow it if error is 50% less than desired
    Real aNewStepInterval( aStepInterval );
    if ( maxError < 0.5 )
    {
        aNewStepInterval = aNewStepInterval * safety * std::pow( maxError,
                                            -1.0 / ( getOrder() + 1 ) );
    }   

    setNextStepInterval( aNewStepInterval );

    DifferentialStepper::updateInternalState( aStepInterval );
}

