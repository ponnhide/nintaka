#include "libecs.hpp"
#include "Process.hpp"
#include "Model.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( ChangeStepClampProcess, Process )
{

 public:

    LIBECS_DM_OBJECT( ChangeStepClampProcess, Process )
    {
        INHERIT_PROPERTIES( Process ); 
        PROPERTYSLOT_SET_GET( Real, MaxStepInterval );
        PROPERTYSLOT_SET_GET( Real, MinStepInterval );  
        PROPERTYSLOT_SET_GET( Real, a );               
        PROPERTYSLOT_SET_GET( Real, amplitude );
        PROPERTYSLOT_SET_GET( Real, onset );
        PROPERTYSLOT_SET_GET( Real, offset );
        PROPERTYSLOT_SET_GET( Real, interval );

    }
    
    ChangeStepClampProcess()
        :
        MaxStepInterval( 0.01 ),
        MinStepInterval( 0.001 ),
        a( 1 ),
        amplitude( -52.0 ),
        onset( 10.0 ),
        offset( 11.0 ),
        interval( 1000.0 )
    {
        // do nothing
    }
    SIMPLE_SET_GET_METHOD( Real, MaxStepInterval );
    SIMPLE_SET_GET_METHOD( Real, MinStepInterval );
    SIMPLE_SET_GET_METHOD( Real, a );
    SIMPLE_SET_GET_METHOD( Real, amplitude );
    SIMPLE_SET_GET_METHOD( Real, onset );
    SIMPLE_SET_GET_METHOD( Real, offset );
    SIMPLE_SET_GET_METHOD( Real, interval );
    
    virtual void initialize()
    {
        Process::initialize();
        
        I       = getVariableReference( "I" ).getVariable();
        t       = getVariableReference( "t" ).getVariable();
        ODE     = getModel()->getStepper( "ODE" );
        //ODE -> setMaxStepInterval( MinStepInterval );
        b       = 0; 

        if ( onset >= t->getValue() ) {
        
            _nextOnset = onset;
        
        } else {

            _nextOnset = onset + floor( ( t->getValue() - onset ) / interval ) * interval;
        }

        _nextOffset = _nextOnset + offset - onset;

    }

    virtual void fire()
    {
        _t = t->getValue();
        //if( ODE->getStepInetrval() < MinStepInterval * 0.1  ){
        //    ODE->setNextTime(  _t + MinStepInterval );
        //}
        if( ( _nextOnset - _t <= onset * a ) && ( b == 0 ) ){
            ODE->setStepInterval( MinStepInterval );
            b = 1;
        }
        else if( ( _nextOnset - _t >=  interval - onset * a ) && ( b == 1 ) ){
            ODE->setStepInterval( MaxStepInterval );  
            b = 0; 
        } 

        if ( _t >= _nextOnset && _t <= _nextOffset ) {

            I->setValue( amplitude );

        } else I->setValue( 0.0 ); 

        if ( _t >= _nextOffset ) {
            _nextOnset  += interval;
            _nextOffset += interval;
        }
    }

 protected:

    Variable* I;
    Variable* t;
    Stepper* ODE;

    Real MaxStepInterval;
    Real MinStepInterval; 
    Real a;                 
    Real amplitude;
    Real onset;
    Real offset;    
    Real interval;
    Real b;


 private:
    
    Real _t;
    Real _nextOnset;
    Real _nextOffset;
};

LIBECS_DM_INIT( ChangeStepClampProcess, Process );

