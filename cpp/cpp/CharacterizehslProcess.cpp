#include "libecs.hpp"
#include "Process.hpp"
#include "Model.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( CharacterizehslProcess, Process )
{

 public:

    LIBECS_DM_OBJECT( CharacterizehslProcess, Process )
    {
        INHERIT_PROPERTIES( Process ); 
    }
    
    CharacterizehslProcess()
    {
        // do nothing
    }
    
    virtual void initialize()
    {
        hsl             = getVariableReference( "hsl" ).getVariable();
        hsl_v           = getVariableReference( "hsl_v" ).getVariable();
        hsl_normal      = getVariableReference( "hsl_normal" ).getVariable();
        hsl_contraction = getVariableReference( "hsl_contraction" ).getVariable();
        hsl_amplitude   = getVariableReference( "hsl_amplitude" ).getVariable();
        t2peak          = getVariableReference( "t2peak" ).getVariable();
        decay_time      = getVariableReference( "decay_time" ).getVariable();
        i_stim          = getVariableReference( "i_Stim" ).getVariable();
        hsl_b           = hsl->getValue();
        hsl_v_b         = hsl_v->getValue();
        b               = 0;
        c               = 0;
    }

    virtual void fire()
    {
        if( ( i_stim->getValue() ) < 0 ){
            if( b == 0 ){
                c = 0;
		_hsl_normal = hsl_b; 
		_t0 = getModel()->getCurrentTime(); 
	    }
            b += 1;
        }else 
            b = 0;   

        if( hsl_v->getValue() * hsl_v_b <= 0 ){
            if( ( c== 0  ) && hsl_v->getValue() >= 0 ){ 
                _hsl_contraction = hsl->getValue();
                _hsl_amplitude   = _hsl_normal - _hsl_contraction;
                _t1              = getModel()->getCurrentTime();
                _t2peak          = getModel()->getCurrentTime() - _t0;
                c += 1;
            } 
        } 
        
        if( ( c== 1 ) && hsl->getValue() >= ( _hsl_contraction + ( _hsl_normal - _hsl_contraction ) * 0.5 ) ){
                _decay_time = getModel()->getCurrentTime() - _t1;
                c += 1;
        } 
  
        hsl_normal->setValue( _hsl_normal );
        hsl_contraction->setValue( _hsl_contraction );
        hsl_amplitude->setValue( _hsl_amplitude );        
        t2peak->setValue( _t2peak );
        decay_time->setValue( _decay_time );
        hsl_b = hsl->getValue();    
        hsl_v_b = hsl_v->getValue();
    }

 protected:
    Variable* i_stim;
    Variable* hsl;
    Variable* hsl_v;
    Variable* hsl_normal;
    Variable* hsl_contraction;
    Variable* hsl_amplitude;
    Variable* t2peak;                                       
    Variable* decay_time;
    Real hsl_b;
    Real hsl_v_b;
    Real b; 
    Real c;

 private:
    Real _hsl_normal;   
    Real _hsl_contraction;
    Real _hsl_amplitude;
    Real _t2peak;
    Real _t0;   
    Real _t1;
    Real _decay_time;  
};

LIBECS_DM_INIT( CharacterizehslProcess, Process );               
