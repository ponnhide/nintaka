
# created by eml2em program
# from file: BIOMD0000000127.eml, date: Fri Nov 13 02:27:23 2015
#

Stepper DormandStepper( Default )
{
	# no property
}

Stepper ODE_DormandStepper( Radau_Dormmand )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Variable Variable( time )
	{
		Value	0.0;
	}
	
	Process ExpressionFluxProcess( time )
	{
		Expression	1.0;
		Priority	10;
		VariableReferenceList
			[ time :/:time 1 ];
	}
	
	
}

System System( /cell )
{
	StepperID	Default;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( a )
	{
		Value	0.02;
		Fixed	1;
	}
	
	Variable Variable( b )
	{
		Value	0.2;
		Fixed	1;
	}
	
	Variable Variable( c )
	{
		Value	-65.0;
		Fixed	1;
	}
	
	Variable Variable( d )
	{
		Value	8.0;
		Fixed	1;
	}
	
	Variable Variable( Vthresh )
	{
		Value	30.0;
		Fixed	1;
	}
	
	Variable Variable( i )
	{
		Value	0.0;
	}
	
	Variable Variable( v )
	{
		Value	-70.0;
	}
	
	Variable Variable( U )
	{
		Value	-14.0;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionFluxexProcess( Rate_v )
	{
		Name	"Rate rule for 'v'";
		Expression	"0.04 * pow(v.NumberConc, 2) + 5 * v.NumberConc + 140 - U.NumberConc + i.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <plus/>
	    <apply>
	      <minus/>
	      <apply>
	        <plus/>
	        <apply>
	          <times/>
	          <cn> 0.04 </cn>
	          <apply>
	            <power/>
	            <ci> v </ci>
	            <cn type='integer'> 2 </cn>
	          </apply>
	        </apply>
	        <apply>
	          <times/>
	          <cn type='integer'> 5 </cn>
	          <ci> v </ci>
	        </apply>
	        <cn type='integer'> 140 </cn>
	      </apply>
	      <ci> U </ci>
	    </apply>
	    <ci> i </ci>
	  </apply>
	</math>";
		VariableReferenceList
			[ v Variable:/SBMLParameter:v 1 ]
			[ U Variable:/SBMLParameter:U 0 ]
			[ i Variable:/SBMLParameter:i 0 ];
	}
	
	Process ExpressionFluxexProcess( Rate_U )
	{
		Name	"Rate rule for 'U'";
		Expression	"a.NumberConc * (b.NumberConc * v.NumberConc - U.NumberConc)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> a </ci>
	    <apply>
	      <minus/>
	      <apply>
	        <times/>
	        <ci> b </ci>
	        <ci> v </ci>
	      </apply>
	      <ci> U </ci>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ U Variable:/SBMLParameter:U 1 ]
			[ a Variable:/SBMLParameter:a 0 ]
			[ b Variable:/SBMLParameter:b 0 ]
			[ v Variable:/SBMLParameter:v 0 ];
	}
	
	
}

System System( /SBMLEvent )
{
	Name	"System for SBML Event";
	StepperID	Default;

	Process ExpressionEventRepeatableProcess( event_0000001 )
	{
		Priority	2;
		StepperID	Default;
		Name	event_0000001;
		EventAssignmentList
			[ v "c.NumberConc"                ]
			[ U "U.NumberConc + d.NumberConc" ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <gt/>
	    <ci> v </ci>
	    <ci> Vthresh </ci>
	  </apply>
	</math>";
		Trigger	"gt(v.NumberConc, Vthresh.NumberConc)";
		Delay	0;
		VariableReferenceList
			[ v       Variable:/SBMLParameter:v       1 ]
			[ c       Variable:/SBMLParameter:c       0 ]
			[ U       Variable:/SBMLParameter:U       1 ]
			[ d       Variable:/SBMLParameter:d       0 ]
			[ Vthresh Variable:/SBMLParameter:Vthresh 0 ];
	}
	
	Process ExpressionEventRepeatableProcess( event_0000002 )
	{
		Priority	2;
		StepperID	Default;
		Name	event_0000002;
		EventAssignmentList
			[ i 10 ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <gt/>
	    <csymbol encoding='text' definitionURL='http://www.sbml.org/sbml/symbols/time'> time </csymbol>
	    <cn type='integer'> 10 </cn>
	  </apply>
	</math>";
		RepeatFlag	false;
		Trigger	"gt(time.Value, 10)";
		Delay	0;
		VariableReferenceList
			[ i    Variable:/SBMLParameter:i 1 ]
			[ time :/:time                   0 ];
	}
	
	
}

