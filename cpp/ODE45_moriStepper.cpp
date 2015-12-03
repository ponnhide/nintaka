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
#include <libecs/Interpolant.hpp>
#include <libecs/AdaptiveDifferentialStepper.hpp>
#include <cmath>

USE_LIBECS;

LIBECS_DM_CLASS( ODE45_moriStepper, AdaptiveDifferentialStepper )
{

public:

    LIBECS_DM_OBJECT( ODE45_moriStepper, Stepper )
    {
        INHERIT_PROPERTIES( AdaptiveDifferentialStepper );

        PROPERTYSLOT_GET_NO_LOAD_SAVE( Real, SpectralRadius );
    }

    ODE45_moriStepper();
    virtual ~ODE45_moriStepper();

    virtual void initialize();
    virtual void updateInternalState( Real aStepInterval );
    virtual bool calculate( Real aStepInterval );      
    virtual GET_METHOD( Integer, Order ) { return 4; }
    virtual GET_METHOD( Integer, Stage ) { return 5; }
    GET_METHOD( Real, SpectralRadius )
    {
      return theSpectralRadius;
    }

    SET_METHOD( Real, SpectralRadius )
    {
      theSpectralRadius = value;
    }

protected:

    Real theSpectralRadius;

    RealMatrix theRungeKuttaBuffer;

    Integer count;

private:
    //Real maxError;

};

LIBECS_DM_INIT( ODE45_moriStepper, Stepper );


ODE45_moriStepper::ODE45_moriStepper()
    :
    theSpectralRadius( 0.0 ),
    count( 0 )
{
    ; // do nothing
}
                        
ODE45_moriStepper::~ODE45_moriStepper()
{
    ; // do nothing
}

void ODE45_moriStepper::initialize()
{
    AdaptiveDifferentialStepper::initialize();
    theRungeKuttaBuffer.resize( boost::extents[ 6 ][ getReadOnlyVariableOffset() ] );
}
           
bool ODE45_moriStepper::calculate( Real aStepInterval )
{
    const VariableVector::size_type aSize( getReadOnlyVariableOffset() );

    const Real eps_rel( getTolerance() );
    const Real eps_abs( getTolerance() * getAbsoluteToleranceFactor() );
    const Real a_y( getStateToleranceFactor() );
    const Real a_dydt( getDerivativeToleranceFactor() );

    const Real aCurrentTime( getCurrentTime() );

    // ========= 1 ===========

    if ( isInterrupted )
    {
        interIntegrate();
        fireProcesses();
        setVariableVelocity( theTaylorSeries[ 0 ] );

        for( VariableVector::size_type c( 0 ); c < aSize; ++c )
        {
            Variable* const aVariable( theVariableVector[ c ] );
        
            aVariable->setValue( theTaylorSeries[ 0 ][ c ] * ( 1.0 / 5.0 )
                                  * aStepInterval + theValueBuffer[ c ] );
        }
    }
    else
    {
        for( VariableVector::size_type c( 0 ); c < aSize; ++c )
        {
            Variable* const aVariable( theVariableVector[ c ] );
        
            // get k1
            theTaylorSeries[ 0 ][ c ] = theRungeKuttaBuffer[ 5 ][ c ];

            aVariable->setValue( theTaylorSeries[ 0 ][ c ] * ( 1.0 / 5.0 )
                                  * aStepInterval + theValueBuffer[ c ] );
        }
    }

    // ========= 2 ===========
    setCurrentTime( aCurrentTime + aStepInterval * 0.2 );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theRungeKuttaBuffer[ 0 ] );

    for ( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );
            
        aVariable ->setValue( ( theTaylorSeries[ 0 ][ c ] * ( 3.0 / 40.0 ) 
                                 + theRungeKuttaBuffer[ 0 ][ c ] * ( 9.0 / 40.0 ) )
                               * aStepInterval + theValueBuffer[ c ] );
    }

    // ========= 3 ===========
    setCurrentTime( aCurrentTime + aStepInterval * 0.3 );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theRungeKuttaBuffer[ 1 ] );

    for( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );
            
        aVariable->setValue(
            ( theTaylorSeries[ 0 ][ c ] * ( 44.0 / 45.0 ) 
              - theRungeKuttaBuffer[ 0 ][ c ] * ( 56.0 / 15.0 )
              + theRungeKuttaBuffer[ 1 ][ c ] * ( 32.0 / 9.0 ) ) * aStepInterval
            + theValueBuffer[ c ] );
    }

    // ========= 4 ===========
    setCurrentTime( aCurrentTime + aStepInterval * 0.8 );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theRungeKuttaBuffer[ 2 ] );

    for( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );
            
        aVariable->setValue(
            ( theTaylorSeries[ 0 ][ c ] * ( 19372.0 / 6561.0 ) 
              - theRungeKuttaBuffer[ 0 ][ c ] * ( 25360.0 / 2187.0 )
              + theRungeKuttaBuffer[ 1 ][ c ] * ( 64448.0 / 6561.0 )
              - theRungeKuttaBuffer[ 2 ][ c ] * ( 212.0 / 729.0 ) ) * aStepInterval
            + theValueBuffer[ c ] );
    }

    // ========= 5 ===========
    setCurrentTime( aCurrentTime + aStepInterval * ( 8.0 / 9.0 ) );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theRungeKuttaBuffer[ 3 ] );

    for( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );
            
        // temporarily set Y^6
        theTaylorSeries[ 1 ][ c ] =
                theTaylorSeries[ 0 ][ c ] * ( 9017.0 / 3168.0 ) 
                    - theRungeKuttaBuffer[ 0 ][ c ] * ( 355.0 / 33.0 )
                    + theRungeKuttaBuffer[ 1 ][ c ] * ( 46732.0 / 5247.0 )
                    + theRungeKuttaBuffer[ 2 ][ c ] * ( 49.0 / 176.0 )
                    - theRungeKuttaBuffer[ 3 ][ c ] * ( 5103.0 / 18656.0 );

        aVariable->setValue( theTaylorSeries[ 1 ][ c ] * aStepInterval
                              + theValueBuffer[ c ] );
    }

    // ========= 6 ===========

    // estimate stiffness
    Real aDenominator( 0.0 );
    Real aSpectralRadius( 0.0 );

    setCurrentTime( aCurrentTime + aStepInterval );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theRungeKuttaBuffer[ 4 ] );

    for( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );
            
        theTaylorSeries[ 2 ][ c ] =
            theTaylorSeries[ 0 ][ c ] * ( 35.0 / 384.0 )
                // + theRungeKuttaBuffer[ 0 ][ c ] * 0.0
                + theRungeKuttaBuffer[ 1 ][ c ] * ( 500.0 / 1113.0 )
                + theRungeKuttaBuffer[ 2 ][ c ] * ( 125.0 / 192.0 )
                + theRungeKuttaBuffer[ 3 ][ c ] * ( -2187.0 / 6784.0 )
                + theRungeKuttaBuffer[ 4 ][ c ] * ( 11.0 / 84.0 );

        aDenominator += (
                theTaylorSeries[ 2 ][ c ]
                - theTaylorSeries[ 1 ][ c ] ) *
                ( theTaylorSeries[ 2 ][ c ] - theTaylorSeries[ 1 ][ c ] );

        aVariable->setValue( theTaylorSeries[ 2 ][ c ] * aStepInterval
                              + theValueBuffer[ c ] );
    }

    // ========= 7 ===========
    setCurrentTime( aCurrentTime + aStepInterval );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theRungeKuttaBuffer[ 5 ] );

    // evaluate error
    Real maxError = 1.0e-5;

    for( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        // calculate error
        const Real anEstimatedError(
            ( theTaylorSeries[ 0 ][ c ] * ( 71.0 / 57600.0 )
                    + theRungeKuttaBuffer[ 1 ][ c ] * ( -71.0 / 16695.0 )
                    + theRungeKuttaBuffer[ 2 ][ c ] * ( 71.0 / 1920.0 )
                    + theRungeKuttaBuffer[ 3 ][ c ] * ( -17253.0 / 339200.0 )
                    + theRungeKuttaBuffer[ 4 ][ c ] * ( 22.0 / 525.0 )
                    + theRungeKuttaBuffer[ 5 ][ c ] * ( -1.0 / 40.0 ) )
            * aStepInterval );

        aSpectralRadius +=
            ( theRungeKuttaBuffer[ 5 ][ c ]
              - theRungeKuttaBuffer[ 4 ][ c ] ) *
            ( theRungeKuttaBuffer[ 5 ][ c ] - theRungeKuttaBuffer[ 4 ][ c ] );

        // calculate velocity for Xn+.5
        theTaylorSeries[ 1 ][ c ] =
            theTaylorSeries[ 0 ][ c ] * ( 6025192743.0 / 30085553152.0 )
            + theRungeKuttaBuffer[ 1 ][ c ] * ( 51252292925.0 / 65400821598.0 )
            + theRungeKuttaBuffer[ 2 ][ c ] * ( -2691868925.0 / 45128329728.0 )
            + theRungeKuttaBuffer[ 3 ][ c ] * ( 187940372067.0 / 1594534317056.0 )
            + theRungeKuttaBuffer[ 4 ][ c ] * ( -1776094331.0 / 19743644256.0 )
            + theRungeKuttaBuffer[ 5 ][ c ] * ( 11237099.0 / 235043384.0 );

        const Real aTolerance( eps_rel * ( a_y * fabs( theValueBuffer[ c ] ) 
                               + a_dydt * fabs( theTaylorSeries[ 2 ][ c ] )
                                 * aStepInterval )
                               + eps_abs );

        const Real anError( fabs( anEstimatedError / aTolerance ) );
        //std::cout << anError << std::endl;
        if( anError > maxError )
        {
            maxError = anError;
        }
    }

    aSpectralRadius /= aDenominator;
    aSpectralRadius    = sqrt( aSpectralRadius );
    setMaxErrorRatio( maxError );     
    setCurrentTime( aCurrentTime );
    resetAll(); // reset all value
    if( maxError > 1.1 )
    {
        // reset the stepper current time
        reset();    
        isInterrupted = true;
        return false;
    }

    for( VariableVector::size_type c( 0 ); c < aSize; ++c )
    {
        const Real k1( theTaylorSeries[ 0 ][ c ] );
        const Real v_2( theTaylorSeries[ 1 ][ c ] );
        const Real v1( theTaylorSeries[ 2 ][ c ] );
        const Real k7( theRungeKuttaBuffer[ 5 ][ c ] );

        theTaylorSeries[ 1 ][ c ] = -4.0 * k1 + 8.0 * v_2 - 5.0 * v1 + k7;
        theTaylorSeries[ 2 ][ c ] = 5.0 * k1 - 16.0 * v_2 + 14.0 * v1 - 3.0 * k7;
        theTaylorSeries[ 3 ][ c ] = -2.0 * k1 + 8.0 * v_2 - 8.0 * v1 + 2.0 * k7;
    }

    // set the error limit interval
    isInterrupted = false;

    setSpectralRadius( aSpectralRadius / aStepInterval );

    return true;
}
void ODE45_moriStepper::updateInternalState( Real aStepInterval )
{
    
    theStateFlag = false;
    clearVariables();
    Integer theRejectedStepCounter( 0 );
    //maxError = getMaxErrorRatio();
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
        Real maxError( getMaxErrorRatio() ); 
        aStepInterval = aStepInterval * safety * std::pow( maxError,-1.0 / getOrder() );       
    }
    // an extra calculation for resetting the activities of processes 
    fireProcesses();                                    

    setTolerableStepInterval( aStepInterval ); 

    theStateFlag = true;

    // grow it if error is 50% less than desired
    Real aNewStepInterval( aStepInterval );         
    //std::cout << maxError << std::endl;    
    if ( getMaxErrorRatio() < 0.01 )
    {
        aNewStepInterval = aNewStepInterval * safety * std::pow( getMaxErrorRatio(),
                                            -1.0 / ( getOrder() + 1 ) );
    }   

    setNextStepInterval( aNewStepInterval );

    DifferentialStepper::updateInternalState( aStepInterval );
}
