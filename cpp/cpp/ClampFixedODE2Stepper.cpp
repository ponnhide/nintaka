#include <libecs/DifferentialStepper.hpp>
#include "Model.hpp"
#include "System.hpp"
#include "Variable.hpp"
#include "FullID.hpp"
#include <vector>

USE_LIBECS;

LIBECS_DM_CLASS( ClampFixedODE2Stepper, DifferentialStepper )
{
    
public:
    
    LIBECS_DM_OBJECT( ClampFixedODE2Stepper, Stepper )
    {
        INHERIT_PROPERTIES( DifferentialStepper );
        PROPERTYSLOT_SET_GET( Real, MaxStepInterval );
        PROPERTYSLOT_SET_GET( Real, MinStepInterval );
        PROPERTYSLOT_SET_GET( Real, a );
        PROPERTYSLOT_SET_GET( Real, b );
        PROPERTYSLOT_SET_GET( Real, c );  
        PROPERTYSLOT_SET_GET( Real, d );  
        PROPERTYSLOT_SET_GET( Real, e ); 
        PROPERTYSLOT_SET_GET( Real, t2s );  
        PROPERTYSLOT_SET_GET( Real, onset );
        PROPERTYSLOT_SET_GET( Real, offset );
        PROPERTYSLOT_SET_GET( Real, interval );
    }
    
    ClampFixedODE2Stepper()
        :
        MaxStepInterval( 0.01 ),
        MinStepInterval( 0.0001 ),
        a( 0.01 ),
        b( 0.1 ),
        onset( 10.0 ),
        offset( 11.0 ),
        interval( 1000.0 )
    {
        ; // do nothing
    }
    SIMPLE_SET_GET_METHOD( Real, MaxStepInterval );
    SIMPLE_SET_GET_METHOD( Real, MinStepInterval );
    SIMPLE_SET_GET_METHOD( Real, a ); 
    SIMPLE_SET_GET_METHOD( Real, b );
    SIMPLE_SET_GET_METHOD( Real, c );
    SIMPLE_SET_GET_METHOD( Real, d ); 
    SIMPLE_SET_GET_METHOD( Real, e );  
    SIMPLE_SET_GET_METHOD( Real, t2s );
    SIMPLE_SET_GET_METHOD( Real, onset );
    SIMPLE_SET_GET_METHOD( Real, offset );
    SIMPLE_SET_GET_METHOD( Real, interval );
    
    
    virtual ~ClampFixedODE2Stepper(){
    }
    virtual void initialize()
    {           
                DifferentialStepper::initialize();
                Path   = SystemPath( "/CELL/MEMBRANE" );
                root   = SystemPath( "/" );
                V_rest = getModel()->getSystem( Path )->getVariable( "V_rest" );
                Vm     = getModel()->getSystem( Path )->getVariable( "Vm" );
                time   = getModel()->getSystem( root )->getVariable( "t" );
		if ( onset >= getCurrentTime() ) {
		
			_nextOnset = onset;
                        _firstOnset = onset;
		
		} else {

			_nextOnset = onset + floor( ( getCurrentTime() - onset ) / interval ) * interval;
                        _firstOnset = onset;
		}

		_nextOffset = _nextOnset + offset - onset;  
                _stepinterval = 0; 
         //std::cout << _nextOnset << std::endl;    
        ; // do nothing
    }
    
    virtual void updateInternalState( Real aStepInterval )
    {
        _t = getCurrentTime();  
        //std::cout << _nextOnset << std::endl;   
        
        const VariableVector::size_type aSize( getReadOnlyVariableOffset() );  
        clearVariables();                       
        fireProcesses();
        setVariableVelocity( theTaylorSeries[ 0 ] );       
        DifferentialStepper::updateInternalState( aStepInterval );   
        //setNextTime( _t + 0.001 );  
        if ( ( V_rest->getValue() ) < -1.0 and ( time->getValue() > t2s ) ){ 
            if ( _t >= _nextOnset - a *  interval || _nextOnset - _t > interval - b * interval || _t < _firstOnset ){
                _stepinterval = MinStepInterval;
	        setNextTime( _t + MinStepInterval );
	    } 
            else{
                if( Vm->getValue() > V_rest->getValue() + e ){
                    if( _stepinterval <= d * MaxStepInterval ){
                        _stepinterval += MinStepInterval * c;
                        setNextTime( _t + _stepinterval );
                    }
                //std::cout << _t << std::endl; 
                    else  
                        setNextTime( _t + d * MaxStepInterval );
                }   
                else{ 
                    if( _stepinterval <  MaxStepInterval ){
                        _stepinterval += MinStepInterval  * c;
                        setNextTime( _t + _stepinterval );
                    } 
                    else  
                        setNextTime( _t +  MaxStepInterval );                   
                }  
            }
        }else setNextTime( _t + MinStepInterval );
        
        if ( _t >= _nextOffset ) {
            _nextOnset  += interval;
            _nextOffset += interval;
        }                           
    }
    
protected:
    Real MaxStepInterval;
    Real MinStepInterval;
    Real a;
    Real b;
    Real c;
    Real d;
    Real e; 
    Real t2s;
    Real onset;
    Real offset;
    Real interval;
    SystemPath Path;
    SystemPath root;
    Variable* V_rest;
    Variable* Vm;
    Variable* time;
    
    
    
private:
    Real _t;
    Real _nextOnset;
    Real _nextOffset;
    Real _stepinterval;
    Real _firstOnset;  

};

LIBECS_DM_INIT( ClampFixedODE2Stepper, Stepper );    
