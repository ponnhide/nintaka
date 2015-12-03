#include "libecs.hpp"
#include "Process.hpp"
#include "Model.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( CharacterizeVmProcess, Process )
{

 public:

    LIBECS_DM_OBJECT( CharacterizeVmProcess, Process )
    {
        INHERIT_PROPERTIES( Process ); 
    }
    
    CharacterizeVmProcess()
    {
        // do nothing
    }
    
    virtual void initialize()
    {
        V        = getVariableReference( "Vm" ).getVariable();
        V_rest   = getVariableReference( "V_rest" ).getVariable();
        V_peak   = getVariableReference( "V_peak" ).getVariable();
        Max_Ve   = getVariableReference( "Max_Ve" ).getVariable();
        APD50    = getVariableReference( "APD50" ).getVariable();
        APD90    = getVariableReference( "APD90" ).getVariable();
        i_stim   = getVariableReference( "i_Stim" ).getVariable();
        V_b      = V->getValue();
        V_b_v    = V->getVelocity();
        b        = 0;
        c        = 1;
        d        = 0;
    }

    virtual void fire()
    {
        if( ( i_stim->getValue() ) < 0 ){
            if( b == 0 ){
                c = 0;
                d = 0;
                _v_rest = V_b;
                _t0 = getModel()->getCurrentTime(); 
                _max_ve_b = _max_ve;
                _max_ve = V->getVelocity();
            }     
            b += 1;
        }else 
            b = 0;

        if( c == 0 ){
            if( V->getVelocity() > _max_ve  ){ 
                _max_ve = V->getVelocity(); 
            }   
            Max_Ve->setValue( _max_ve_b );         
        }else{
            Max_Ve->setValue( _max_ve ); 
        }        

        if( V->getVelocity() * V_b_v <= 0 ){     
            if( ( c == 0 ) && ( V->getVelocity() < 0 ) ){
                _v_peak = V->getValue();
                c += 1;
            }         
        }
        
        if( b == 0 && c == 1 ){ 
            if( ( V->getValue() <= _v_rest + ( _v_peak - _v_rest ) * 0.5 ) && ( d == 0 ) ){
                _apd50 = getModel()->getCurrentTime() - _t0; 
                d += 1;
            } 
            if( ( V->getValue() <= _v_rest + ( _v_peak - _v_rest ) * 0.1 ) && ( d == 1 ) ){
                _apd90 = getModel()->getCurrentTime() - _t0;
                d += 1;
            } 
        } 
        
        V_rest->setValue( _v_rest );
        V_peak->setValue( _v_peak ); 
        APD90->setValue( _apd90 );
        APD50->setValue( _apd50 ); 
        V_b   = V->getValue();
        V_b_v = V->getVelocity();                       
    }

 protected:
    Variable* i_stim;
    Variable* V;
    Variable* Max_Ve;
    Variable* V_rest;
    Variable* V_peak;
    Variable* APD90;
    Variable* APD50;
    Real V_b;
    Real V_b_v;
    Real b;
    Real c;
    Real d;

 private:
    Real _v_peak;
    Real _v_rest;
    Real _max_ve;
    Real _max_ve_b;
    Real _apd90;
    Real _apd50;
    Real _t0;
};

LIBECS_DM_INIT( CharacterizeVmProcess, Process ); 
