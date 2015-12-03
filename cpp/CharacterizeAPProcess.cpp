#include "libecs.hpp"
#include "Process.hpp"
#include "Model.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( CharacterizeAPProcess, Process )
{

 public:

    LIBECS_DM_OBJECT( CharacterizeAPProcess, Process )
    {
        INHERIT_PROPERTIES( Process ); 
    }
    
    CharacterizeAPProcess()
    {
        // do nothing
    }
    
    virtual void initialize()
    {
        V        = getVariableReference( "V" ).getVariable();
        V_rest   = getVariableReference( "V_rest" ).getVariable();
        V_peak   = getVariableReference( "V_peak" ).getVariable();
        V_maxmin = getVariableReference( "V_maxmin" ).getVariable();
        V_minmax = getVariableReference( "V_minmax" ).getVariable();
        t_minmax = getVariableReference( "t_minmax" ).getVariable();
        i_stim   = getVariableReference( "i_Stim" ).getVariable();
        V_b      = V->getValue();
        V_b_v    = V->getVelocity();
        b        = 0;
        c        = 1;
    }

    virtual void fire()
    {
        if( ( i_stim->getValue() ) < 0 ){
            if( b == 0 ){
                c = 0;
                _v_rest = V_b;
            }   
            b += 1;
        }else 
            b = 0;

        if( V->getVelocity() * V_b_v <= 0 ){     
            if( ( c == 0 ) && ( V->getVelocity() < 0 ) ){
                _v_peak = V->getValue();
                c += 1;
            }else if( c == 1 ){ 
                _v_maxmin = _v_peak - V->getValue();
                _v1       = V ->getValue(); 
                _t0 = getModel()->getCurrentTime();
                c += 1;
            }else if( c == 2 ){ 
                _v_minmax = V->getValue() - _v1;
                _t_minmax = getModel()->getCurrentTime() - _t0;
                c += 1;
            }                  
        }
        V_rest->setValue( _v_rest );
        V_peak->setValue( _v_peak );
        V_maxmin->setValue( _v_maxmin );
        V_minmax->setValue( _v_minmax );
        t_minmax->setValue( _t_minmax );
        V_b   = V->getValue();
        V_b_v = V->getVelocity();    
                  
    }

 protected:
    Variable* i_stim;
    Variable* V;
    Variable* V_rest;
    Variable* V_peak;
    Variable* V_maxmin;
    Variable* V_minmax;
    Variable* t_minmax;
    Real V_b;
    Real V_b_v;
    Real b;
    Real c;

 private:
    Real _v_maxmin;
    Real _v_minmax;
    Real _v_peak;
    Real _v_rest;  
    Real _v1;
    Real _t_minmax; 
    Real _t0;
};

LIBECS_DM_INIT( CharacterizeAPProcess, Process );  
