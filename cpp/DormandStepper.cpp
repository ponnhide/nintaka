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
// written by Koichi Takahashi <shafi@e-cell.org> at
// E-Cell Project, Lab. for Bioinformatics, Keio University.
//

#define GSL_RANGE_CHECK_OFF
#include <gsl/gsl_linalg.h>
#include <gsl/gsl_complex.h>
#include <gsl/gsl_complex_math.h>

#include <cmath>

#include <libecs/Variable.hpp>
#include <libecs/Process.hpp>

#include <libecs/AdaptiveDifferentialStepper.hpp>

USE_LIBECS;

LIBECS_DM_CLASS( DormandStepper, AdaptiveDifferentialStepper )
{
public:
    LIBECS_DM_OBJECT( DormandStepper, Stepper )
    {
        INHERIT_PROPERTIES( AdaptiveDifferentialStepper );

        PROPERTYSLOT_SET_GET( Integer, MaxIterationNumber );
        PROPERTYSLOT_SET_GET( Real, Uround );
        
        PROPERTYSLOT( Real, Tolerance,
                      &DormandStepper::initializeTolerance,
                      &AdaptiveDifferentialStepper::getTolerance );

        PROPERTYSLOT( Real, AbsoluteToleranceFactor,
                      &DormandStepper::initializeAbsoluteToleranceFactor,
                      &AdaptiveDifferentialStepper::getAbsoluteToleranceFactor );
        
        PROPERTYSLOT_GET_NO_LOAD_SAVE( Real, Stiffness );
        PROPERTYSLOT_SET_GET( Real, JacobianRecalculateTheta );

        PROPERTYSLOT( Integer, isStiff,
                      &DormandStepper::setIntegrationType,
                      &DormandStepper::getIntegrationType );

        PROPERTYSLOT_SET_GET( Integer, CheckIntervalCount );
        PROPERTYSLOT_SET_GET( Integer, SwitchingCount );
        PROPERTYSLOT_SET_GET( Real, EventStepInterval ); 
    }

    DormandStepper( void );
    virtual ~DormandStepper( void );
    Real judgeEvent( Real aStepInterval, Real aCurrentTime );
    SET_METHOD( Integer, MaxIterationNumber )
    {
        theMaxIterationNumber = value;
    }

    GET_METHOD( Integer, MaxIterationNumber )
    {
        return theMaxIterationNumber;
    }

    SIMPLE_SET_GET_METHOD( Real, Uround );

    SIMPLE_SET_GET_METHOD( Integer, CheckIntervalCount );
    SIMPLE_SET_GET_METHOD( Integer, SwitchingCount );
    SIMPLE_SET_GET_METHOD( Real, EventStepInterval );
    void setIntegrationType( Integer value )
    {
        isStiff = static_cast<bool>( value );
        initializeStepper();
    }

    Integer getIntegrationType() const { return isStiff; }
    
    SET_METHOD( Real, JacobianRecalculateTheta )
    {
        theJacobianRecalculateTheta = value;
    }

    GET_METHOD( Real, JacobianRecalculateTheta )
    {
        return theJacobianRecalculateTheta;
    }

    GET_METHOD( Real, Stiffness )
    {
        return 3.3 / theSpectralRadius;
    }

    GET_METHOD( Real, SpectralRadius )
    {
        return theSpectralRadius;
    }

    SET_METHOD( Real, SpectralRadius )
    {
        theSpectralRadius = value;
    }

    virtual void initialize();
    virtual void updateInternalState( Real aStepInterval );
    virtual bool calculate( Real aStepInterval );

    void initializeStepper();


    void initializeTolerance( libecs::Param<Real>::type value )
    {
        setTolerance( value ); // AdaptiveDifferentialStepper::
        rtoler = 0.1 * pow( getTolerance(), 2.0 / 3.0 );
        atoler = rtoler * getAbsoluteToleranceFactor();
    }

    void initializeAbsoluteToleranceFactor( libecs::Param<Real>::type value )
    {
        setAbsoluteToleranceFactor( value ); // AdaptiveDifferentialStepper::
        atoler = rtoler * getAbsoluteToleranceFactor();
    }

    virtual GET_METHOD( Integer, Order )
    {
        if ( isStiff ) return 3;
        else return 4;
    }

    virtual GET_METHOD( Integer, Stage )
    {
        return 4;
    }

protected:

    Real alpha, beta, gamma;

    VariableVector::size_type theSystemSize;

    RealMatrix           theJacobian, theW;
    RealVector           theEigenVector, theTempVector;

    gsl_matrix*          theJacobianMatrix1;
    gsl_permutation*     thePermutation1;
    gsl_vector*          theVelocityVector1;
    gsl_vector*          theSolutionVector1;

    gsl_matrix_complex* theJacobianMatrix2;
    gsl_permutation*    thePermutation2;
    gsl_vector_complex* theVelocityVector2;
    gsl_vector_complex* theSolutionVector2;

    UnsignedInteger theMaxIterationNumber;
    Real theStoppingCriterion;
    Real eta, Uround;

    Real rtoler, atoler;

    Real theAcceptedError, theAcceptedStepInterval;

    Real theJacobianRecalculateTheta;
    Real theSpectralRadius;

    Integer theStiffnessCounter, theRejectedStepCounter;
    Integer CheckIntervalCount, SwitchingCount;
    Real EventStepInterval;
    bool theFirstStepFlag, theJacobianCalculateFlag;
    bool isStiff;
    Real maxError;
    Real normalMaxStepInterval;
};


LIBECS_DM_INIT( DormandStepper, Stepper );

#define SQRT6 2.4494897427831779

DormandStepper::DormandStepper()
    : theSystemSize( -1 ),
      theJacobianMatrix1( 0 ),
      thePermutation1( 0 ),
      theVelocityVector1( 0 ),
      theSolutionVector1( 0 ),
      theJacobianMatrix2( 0 ),
      thePermutation2( 0 ),
      theVelocityVector2( 0 ),
      theSolutionVector2( 0 ),
      theMaxIterationNumber( 7 ),
      theStoppingCriterion( 0.0 ),
      eta( 1.0 ),
      Uround( 1e-10 ),
      rtoler( 1e-6 ),
      atoler( 1e-6 ),
      theAcceptedError( 0.0 ),
      theAcceptedStepInterval( 0.0 ),
      theJacobianRecalculateTheta( 0.001 ),
      theSpectralRadius( 0.0 ),
      theStiffnessCounter( 0 ),
      theRejectedStepCounter( 0 ),
      CheckIntervalCount( 100 ),
      SwitchingCount( 20 ),
      EventStepInterval(1.0e-2),
      theFirstStepFlag( true ),
      theJacobianCalculateFlag( true ),
      isStiff( true )
{
    const Real pow913( pow( 9.0, 1.0 / 3.0 ) );

    alpha = ( 12.0 - pow913 * pow913 + pow913 ) / 60.0;
    beta = ( pow913 * pow913 + pow913 ) * sqrt( 3.0 ) / 60.0;
    gamma = ( 6.0 + pow913 * pow913 - pow913 ) / 30.0;

    const Real aNorm( alpha * alpha + beta * beta );

    alpha /= aNorm;
    beta /= aNorm;
    gamma = 1.0 / gamma;

    rtoler = 0.1 * pow( getTolerance(), 2.0 / 3.0 );
    atoler = rtoler * getAbsoluteToleranceFactor();
}

DormandStepper::~DormandStepper()
{
    if ( theJacobianMatrix1 )
    {
        gsl_matrix_free( theJacobianMatrix1 );
    }
    if ( thePermutation1 )
    {
        gsl_permutation_free( thePermutation1 );
    }
    if ( theVelocityVector1 )
    {
        gsl_vector_free( theVelocityVector1 );
    }
    if ( theSolutionVector1 )
    {
        gsl_vector_free( theSolutionVector1 );
    }
    if ( theJacobianMatrix2 )
    {
        gsl_matrix_complex_free( theJacobianMatrix2 );
    }
    if ( thePermutation2 )
    {
        gsl_permutation_free( thePermutation2 );
    }
    if ( theVelocityVector2 ) 
    {
        gsl_vector_complex_free( theVelocityVector2 );
    }
    if ( theSolutionVector2 )
    {
        gsl_vector_complex_free( theSolutionVector2 );
    }
}

void DormandStepper::initialize()
{
    AdaptiveDifferentialStepper::initialize();
    initializeStepper();
    normalMaxStepInterval = theMaxStepInterval;
}

void DormandStepper::initializeStepper()
{
    isStiff = true;
    theStiffnessCounter = 0;

    const VariableVector::size_type aSize( getReadOnlyVariableOffset() );

    if ( aSize != theSystemSize )
        theW.resize( boost::extents[ 6 ][ aSize ] );

    theSystemSize = aSize;
}



bool DormandStepper::calculate( Real aStepInterval )
{
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

        for( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
        {
            Variable* const aVariable( theVariableVector[ c ] );

            aVariable->setValue( theTaylorSeries[ 0 ][ c ] * ( 1.0 / 5.0 )
                                  * aStepInterval
                                  + theValueBuffer[ c ] );
        }
    }
    else
    {
        for( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
        {
            Variable* const aVariable( theVariableVector[ c ] );

            // get k1
            theTaylorSeries[ 0 ][ c ] = theW[ 5 ][ c ];

            aVariable->setValue( theTaylorSeries[ 0 ][ c ] * ( 1.0 / 5.0 )
                                  * aStepInterval + theValueBuffer[ c ] );
        }
    }

    // ========= 2 ===========
    setCurrentTime( aCurrentTime + aStepInterval * 0.2 );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theW[ 0 ] );

    for( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );

        aVariable->setValue( ( theTaylorSeries[ 0 ][ c ] * ( 3.0 / 40.0 )
                                         + theW[ 0 ][ c ] * ( 9.0 / 40.0 ) )
                              * aStepInterval + theValueBuffer[ c ] );
    }

    // ========= 3 ===========
    setCurrentTime( aCurrentTime + aStepInterval * 0.3 );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theW[ 1 ] );

    for( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );

        aVariable->setValue( ( theTaylorSeries[ 0 ][ c ] * ( 44.0 / 45.0 )
                                 - theW[ 0 ][ c ] * ( 56.0 / 15.0 )
                                 + theW[ 1 ][ c ] * ( 32.0 / 9.0 ) )
                              * aStepInterval + theValueBuffer[ c ] );
    }

    // ========= 4 ===========
    setCurrentTime( aCurrentTime + aStepInterval * 0.8 );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theW[ 2 ] );

    for( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );

        aVariable->setValue( ( theTaylorSeries[ 0 ][ c ] * ( 19372.0 / 6561.0 )
                                - theW[ 0 ][ c ] * ( 25360.0 / 2187.0 )
                                + theW[ 1 ][ c ] * ( 64448.0 / 6561.0 )
                                - theW[ 2 ][ c ] * ( 212.0 / 729.0 ) )
                              * aStepInterval + theValueBuffer[ c ] );
    }

    // ========= 5 ===========
    setCurrentTime( aCurrentTime + aStepInterval * ( 8.0 / 9.0 ) );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theW[ 3 ] );

    for( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );

        // temporarily set Y^6
        theTaylorSeries[ 1 ][ c ] = theTaylorSeries[ 0 ][ c ] * ( 9017.0 / 3168.0 )
                - theW[ 0 ][ c ] * ( 355.0 / 33.0 )
                + theW[ 1 ][ c ] * ( 46732.0 / 5247.0 )
                + theW[ 2 ][ c ] * ( 49.0 / 176.0 )
                - theW[ 3 ][ c ] * ( 5103.0 / 18656.0 );

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
    setVariableVelocity( theW[ 4 ] );

    for ( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
    {
        Variable* const aVariable( theVariableVector[ c ] );

        theTaylorSeries[ 2 ][ c ] =
                theTaylorSeries[ 0 ][ c ] * ( 35.0 / 384.0 )
                // + theW[ 0 ][ c ] * 0.0
                + theW[ 1 ][ c ] * ( 500.0 / 1113.0 )
                + theW[ 2 ][ c ] * ( 125.0 / 192.0 )
                + theW[ 3 ][ c ] * ( -2187.0 / 6784.0 )
                + theW[ 4 ][ c ] * ( 11.0 / 84.0 );

        aDenominator +=
                ( theTaylorSeries[ 2 ][ c ] - theTaylorSeries[ 1 ][ c ] )
                * ( theTaylorSeries[ 2 ][ c ] - theTaylorSeries[ 1 ][ c ] );

        aVariable->setValue( theTaylorSeries[ 2 ][ c ] * aStepInterval
                              + theValueBuffer[ c ] );
    }

    // ========= 7 ===========
    setCurrentTime( aCurrentTime + aStepInterval );
    interIntegrate();
    fireProcesses();
    setVariableVelocity( theW[ 5 ] );

    // evaluate error
    //Real maxError( 0.0 );
    maxError = 1.0e-5;
    for( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
    {
        // calculate error
        const Real anEstimatedError(
                ( theTaylorSeries[ 0 ][ c ] * ( 71.0 / 57600.0 )
                + theW[ 1 ][ c ] * ( -71.0 / 16695.0 )
                + theW[ 2 ][ c ] * ( 71.0 / 1920.0 )
                + theW[ 3 ][ c ] * ( -17253.0 / 339200.0 )
                + theW[ 4 ][ c ] * ( 22.0 / 525.0 )
                + theW[ 5 ][ c ] * ( -1.0 / 40.0 ) ) * aStepInterval );

        aSpectralRadius +=
                ( theW[ 5 ][ c ] - theW[ 4 ][ c ] ) *
                    ( theW[ 5 ][ c ] - theW[ 4 ][ c ] );

        // calculate velocity for Xn+.5
        theTaylorSeries[ 1 ][ c ] =
            theTaylorSeries[ 0 ][ c ] * ( 6025192743.0 / 30085553152.0 )
            + theW[ 1 ][ c ] * ( 51252292925.0 / 65400821598.0 )
            + theW[ 2 ][ c ] * ( -2691868925.0 / 45128329728.0 )
            + theW[ 3 ][ c ] * ( 187940372067.0 / 1594534317056.0 )
            + theW[ 4 ][ c ] * ( -1776094331.0 / 19743644256.0 )
            + theW[ 5 ][ c ] * ( 11237099.0 / 235043384.0 );

        const Real aTolerance( eps_rel *
                               ( a_y * fabs( theValueBuffer[ c ] )
                                 + a_dydt * fabs( theTaylorSeries[ 2 ][ c ] ) *
                                   aStepInterval )
                               + eps_abs );

        const Real anError( fabs( anEstimatedError / aTolerance ) );

        if ( anError > maxError )
        {
            maxError = anError;
        }
    }

    aSpectralRadius /= aDenominator;
    aSpectralRadius    = sqrt( aSpectralRadius );

    resetAll(); // reset all value

    setMaxErrorRatio( maxError );
    setCurrentTime( aCurrentTime );

    if( maxError > 1.1 )
    {
        // reset the stepper current time
        reset();
        isInterrupted = true;
        return false;
    }

    for( VariableVector::size_type c( 0 ); c < theSystemSize; ++c )
    {
        const Real k1( theTaylorSeries[ 0 ][ c ] );
        const Real v_2( theTaylorSeries[ 1 ][ c ] );
        const Real v1( theTaylorSeries[ 2 ][ c ] );
        const Real k7( theW[ 5 ][ c ] );

        theTaylorSeries[ 1 ][ c ] = -4.0 * k1 + 8.0 * v_2 - 5.0 * v1 + k7;
        theTaylorSeries[ 2 ][ c ] = 5.0 * k1 - 16.0 * v_2 + 14.0 * v1 - 3.0 * k7;
        theTaylorSeries[ 3 ][ c ] = -2.0 * k1 + 8.0 * v_2 - 8.0 * v1 + 2.0 * k7;
    }

    // set the error limit interval
    isInterrupted = false;

    setSpectralRadius( aSpectralRadius / aStepInterval );

    return true;
}

Real DormandStepper::judgeEvent( Real aStepInterval, Real aCurrentTime )
{
    for( ProcessVector::size_type c( 0 ); c < theProcessVector.size(); ++c )
    {
        Process* const aProcess( theProcessVector[ c ] );
        libecs::String className;
        className = aProcess->getPropertyInterface().getClassName();
	if(className == "ExpressionEventRepeatableProcess" || className == "PiecewiseProcess" ){
            //std::cout<<aProcess->getProperty("FireFlag")<<aProcess->getProperty("TriggerFlag") <<std::endl;  
            theMaxStepInterval = normalMaxStepInterval;
            if(aProcess->getProperty("FireFlag") == "true" && aProcess->getProperty("TriggerFlag") == "false" ){   
                //std::cout<<aProcess->getProperty("Name")<<getCurrentTime()<<std::endl;  
                theMaxStepInterval = EventStepInterval;
                isStiff = 0;
                if( aStepInterval>theMaxStepInterval){  
                    aStepInterval = theMaxStepInterval * 0.01;  
                    //std::cout<<aProcess->getProperty("Name")<<getCurrentTime()<<std::endl; 
                }//std::cout<<aProcess->getProperty("Name")<<getCurrentTime()<<std::endl;
            }
        }
    }
    return aStepInterval;
}

void DormandStepper::updateInternalState( Real aStepInterval )
{
    theStateFlag = false;
    clearVariables();
    Integer theRejectedStepCounter( 0 );
    //const Real maxError( getMaxErrorRatio() );
    while ( !calculate( aStepInterval ) )
    {
        if ( ++theRejectedStepCounter >= theTolerableRejectedStepCount )
        {
            THROW_EXCEPTION_INSIDE( SimulationError,
                String( "The times of rejections of step calculation "
                    "exceeded a maximum tolerable count (" )
                + stringCast( theTolerableRejectedStepCount ) + ")." );
        }
        Real maxError = getMaxErrorRatio();
        // shrink it if the error exceeds 110%
        aStepInterval = aStepInterval * safety * std::pow( maxError,-1.0 / getOrder() );       
        //aStepInterval *= 0.99;
    }

    // an extra calculation for resetting the activities of processes
    const Real aCurrentTime( getCurrentTime() );
    aStepInterval = judgeEvent( aStepInterval, aCurrentTime );
    setCurrentTime( aCurrentTime );
    fireProcesses();                                    
    setTolerableStepInterval( aStepInterval );

    theStateFlag = true;

    // grow it if error is 50% less than desired
    Real aNewStepInterval( aStepInterval );
    if ( getMaxErrorRatio() < 0.005 )
    {
        aNewStepInterval = aNewStepInterval * safety * std::pow( getMaxErrorRatio(),
                                            -1.0 / ( getOrder() + 1 ) );
    }   

    setNextStepInterval( aNewStepInterval );
    DifferentialStepper::updateInternalState( aStepInterval ); 
}       
