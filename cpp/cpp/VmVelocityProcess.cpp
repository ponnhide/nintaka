#include "libecs.hpp"
#include "Process.hpp"
#include "Model.hpp"       



USE_LIBECS;

LIBECS_DM_CLASS( VmVelocityProcess, Process )
{

 public:

    LIBECS_DM_OBJECT( VmVelocityProcess, Process )
    {
        INHERIT_PROPERTIES( Process ); 
    }
    
    VmVelocityProcess()
    {
        // do nothing
    }
    
    virtual void initialize()
    {
        Process::initialize();
	Vm_V    = getVariableReference( "Vm_V" ).getVariable();
	Vm_V_V  = getVariableReference( "Vm_V_V" ).getVariable(); 
	ODE     = getModel()->getStepper( "ODE" ); 
        _vm_v_b = Vm_V->getValue();
    }

    virtual void fire()
    {
	_vm_v_v = ( Vm_V->getValue() - _vm_v_b ) / ODE->getStepInterval();
	Vm_V_V->setValue( _vm_v_v );  
        _vm_v_b = Vm_V->getValue();                                                                 
    }

 protected: 
    Variable* Vm_V;
    Variable* Vm_V_V;
    Stepper*  ODE;
	
    

 private:
    Real _vm_v_v;
    Real _vm_v_b;

};
LIBECS_DM_INIT( VmVelocityProcess, Process ); 
