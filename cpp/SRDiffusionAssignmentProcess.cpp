#include "libecs.hpp"
#include "Process.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( SRDiffusionAssignmentProcess, Process )
{

 public:

	LIBECS_DM_OBJECT( SRDiffusionAssignmentProcess, Process )
	{
		INHERIT_PROPERTIES( Process ); 

		PROPERTYSLOT_SET_GET( Real, permeabilityCa );
	}
	
	SRDiffusionAssignmentProcess()
		:
		permeabilityCa( 0.3e+3 )
	{
		// do nothing
	}

	SIMPLE_SET_GET_METHOD( Real, permeabilityCa );
	
	virtual void initialize()
	{
		Process::initialize();
		
		I    = getVariableReference( "I" ).getVariable();
		Cai = getVariableReference( "Cai" ).getVariable();
		Cao  = getVariableReference( "Cao" ).getVariable();
		SR_f   = getVariableReference( "SR_f" ).getVariable();
		GX = getVariableReference( "GX" ).getVariable();
		Cm   = getVariableReference( "Cm" ).getVariable();
	}

	virtual void fire()
	{
	  I->setValue( SR_f->getValue() * GX->getValue() * permeabilityCa * ( Cao->getMolarConc() - Cai->getMolarConc() ) * Cm->getValue() );
	}

 protected:

	Variable* I;
	Variable* Cai;
	Variable* Cao;
	Variable* SR_f;
	Variable* GX;
	Variable* Cm;

	Real permeabilityCa;
};

LIBECS_DM_INIT( SRDiffusionAssignmentProcess, Process );

