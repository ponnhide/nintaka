#include "libecs.hpp"
#include "Process.hpp"
#include "Model.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( CharacterizeCaProcess, Process )
{

 public:

    LIBECS_DM_OBJECT( CharacterizeCaProcess, Process )
    {
        INHERIT_PROPERTIES( Process ); 
    }
    
    CharacterizeCaProcess()
    {
        // do nothing
    }
    
    virtual void initialize()
    {
        Ca_rest   = getVariableReference( "Ca_rest"  ).getVariable();
	Ca_peak   = getVariableReference( "Ca_peak"  ).getVariable();
	Ca_amp    = getVariableReference( "Ca_amp" ).getVariable();
	t2peak    = getVariableReference( "t2peak").getVariable();
	decay     = getVariableReference( "decay" ).getVariable();
	Ca_i      = getVariableReference( "Ca_i" ).getVariable();
	i_stim    = getVariableReference( "i_Stim" ).getVariable();
	Ca_b      = Ca_i->getValue();
	Ca_b_v    = Ca_i->getVelocity();
        b         = 0;
        c         = 1;
    }

    virtual void fire()
    {
        if( ( i_stim->getValue() ) < 0 ){
            if( b == 0 ){
                c = 0;
		_ca_rest = Ca_b; 
		_t0 = getModel()->getCurrentTime(); 
	    }
            b += 1;
        }else 
            b = 0;

        if( Ca_i->getVelocity() * Ca_b_v <= 0 ){     
            if( ( c == 0 ) && ( Ca_i->getVelocity() <= 0 ) ){
                _ca_peak = Ca_i->getValue();
		_ca_amp  = _ca_peak - _ca_rest;
		_t1      = getModel()->getCurrentTime();
		_t2peak  = _t1 - _t0;
                c += 1;
            }
        }
        if( ( c == 1 ) && ( Ca_i->getValue() <= 0.5 * ( _ca_peak + _ca_rest ) ) ){ 
                _decay   = getModel()->getCurrentTime() - _t1;
                c += 1;
        }

        Ca_rest->setValue( _ca_rest );
        Ca_peak->setValue( _ca_peak );
	Ca_amp->setValue(  _ca_amp  );
	t2peak->setValue( _t2peak );
	decay->setValue( _decay );
        Ca_b   = Ca_i->getValue();   
	Ca_b_v = Ca_i->getVelocity();          
    }

 protected:
    Variable* i_stim;
    Variable* Ca_i;
    Variable* Ca_rest;
    Variable* Ca_peak;
    Variable* Ca_amp;
    Variable* t2peak;
    Variable* decay;
    Real Ca_b;
    Real Ca_b_v;
    Real b;
    Real c;

 private:
    Real _ca_peak;
    Real _ca_rest;
    Real _ca_amp;
    Real _decay;
    Real _t2peak;   
    Real _t1;
    Real _t0;
};

LIBECS_DM_INIT( CharacterizeCaProcess, Process );                   
