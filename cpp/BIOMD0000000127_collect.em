
# created by eml2em program
# from file: BIOMD0000000127.eml, date: Wed Nov 11 08:43:25 2015
#

Stepper DormandStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Variable Variable( time )
	{
		Value	0;
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

	Process ExpressionFluxProcess( Rate_v )
	{
		Name	"Rate rule for 'v'";
		Expression	"0.04 * pow(v.NumberConc, 2) + 5 * v.NumberConc + 140 - U.NumberConc + i.NumberConc";
		VariableReferenceList
			[ v Variable:/SBMLParameter:v 1 ]
			[ U Variable:/SBMLParameter:U 0 ]
			[ i Variable:/SBMLParameter:i 0 ];
	}
	
	Process ExpressionFluxProcess( Rate_U )
	{
		Name	"Rate rule for 'U'";
		Expression	"a.NumberConc * (b.NumberConc * v.NumberConc - U.NumberConc)";
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
		RepeatFlag	false;
		Trigger	"gt(time.Value, 10)";
		Delay	0;
		VariableReferenceList
			[ i    Variable:/SBMLParameter:i 1 ]
			[ time :/:time                   0 ];
	}
	
	
}

