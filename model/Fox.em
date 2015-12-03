
# created by eml2em program
# from file: BIOMD0000000296.eml, date: Fri Jul  3 14:35:28 2015
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( J0 )
	{
		Name	"predator growth";
		Expression	"environment.Value * kc1.Value * C1.NumberConc * (1 - (C1.NumberConc + C2.NumberConc) / Cm.Value)";
		VariableReferenceList
			[ source      Variable:/environment:source -1 ]
			[ C1          Variable:/environment:C1     1  ]
			[ C2          Variable:/environment:C2     0  ]
			[ environment Variable:/environment:SIZE   0  ]
			[ kc1         Variable:/SBMLParameter:kc1  0  ]
			[ Cm          Variable:/SBMLParameter:Cm   0  ];
	}
	
	Process ExpressionFluxProcess( J1 )
	{
		Name	"predator death";
		Expression	"environment.Value * (D.Value + d1.Value * K1.Value / ( K1.Value )) * C1.NumberConc";
		VariableReferenceList
			[ C1          Variable:/environment:C1   -1 ]
			[ sink        Variable:/environment:sink 1  ]
			[ environment Variable:/environment:SIZE 0  ]
			[ D           Variable:/SBMLParameter:D  0  ]
			[ d1          Variable:/SBMLParameter:d1 0  ]
			[ K1          Variable:/SBMLParameter:K1 0  ];
	}
	
	Process ExpressionFluxProcess( J2 )
	{
		Name	"prey growth";
		Expression	"environment.Value * kc2.Value * C2.NumberConc * (1 - (C1.NumberConc + C2.NumberConc) / Cm.Value)";
		VariableReferenceList
			[ source      Variable:/environment:source -1 ]
			[ C2          Variable:/environment:C2     1  ]
			[ C1          Variable:/environment:C1     0  ]
			[ environment Variable:/environment:SIZE   0  ]
			[ kc2         Variable:/SBMLParameter:kc2  0  ]
			[ Cm          Variable:/SBMLParameter:Cm   0  ];
	}
	
	Process ExpressionFluxProcess( J3 )
	{
		Name	"prey death";
		Expression	"environment.Value * (D.Value + d2.Value * pow(A1.NumberConc, -2) / (K2.Value + pow(A1.NumberConc, -2))) * C2.NumberConc";
		VariableReferenceList
			[ C2          Variable:/environment:C2   -1 ]
			[ sink        Variable:/environment:sink 1  ]
			[ A1          Variable:/environment:A1   0  ]
			[ environment Variable:/environment:SIZE 0  ]
			[ D           Variable:/SBMLParameter:D  0  ]
			[ d2          Variable:/SBMLParameter:d2 0  ]
			[ K2          Variable:/SBMLParameter:K2 0  ];
	}
	
	Process ExpressionFluxProcess( J4 )
	{
		Name	"3OC12HSL synthesis";
		Expression	"environment.Value * kA1.Value * C1.NumberConc";
		VariableReferenceList
			[ source      Variable:/environment:source -1 ]
			[ A1          Variable:/environment:A1     1  ]
			[ C1          Variable:/environment:C1     0  ]
			[ environment Variable:/environment:SIZE   0  ]
			[ kA1         Variable:/SBMLParameter:kA1  0  ];
	}
	
	Process ExpressionFluxProcess( J5 )
	{
		Name	"3OC12HSL removal";
		Expression	"environment.Value * (dAA1.Value + D.Value) * A1.NumberConc";
		VariableReferenceList
			[ A1          Variable:/environment:A1     -1 ]
			[ sink        Variable:/environment:sink   1  ]
			[ environment Variable:/environment:SIZE   0  ]
			[ dAA1        Variable:/SBMLParameter:dAA1 0  ]
			[ D           Variable:/SBMLParameter:D    0  ];
	}
		
	
}

System System( /environment )
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
	
	Variable Variable( IPTG )
	{
		NumberConc	5.0;
		Fixed	1;
	}
	
	Variable Variable( C1 )
	{
		Name "clostoridium";
                NumberConc	20.0;
		Fixed	0;
	}
	
	Variable Variable( C2 )
	{
		NumberConc	20.0;
		Fixed	0;
	}
	
	Variable Variable( A1 )
	{
		NumberConc	0.1;
		Fixed	0;
	}
	
	
	Variable Variable( sink )
	{
		NumberConc	0.0;
		Fixed	0;
	}
	
	Variable Variable( source )
	{
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( kc1 )
	{
		Value	0.8;
		Fixed	1;
	}
	
	Variable Variable( kc2 )
	{
		Value	0.4;
		Fixed	1;
	}
	
	Variable Variable( Cm )
	{
		Value	100;
		Fixed	1;
	}
	
	Variable Variable( D )
	{
		Value	0.1125;
		Fixed	1;
	}
	
	Variable Variable( kA1 )
	{
		Value	0.1;
		Fixed	1;
	}
	
	
	Variable Variable( d2 )
	{
		Value	2.0;
		Fixed	1;
	}
	
	Variable Variable( K2 )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( d1 )
	{
		Value	1.0;
	}
	
	Variable Variable( K1 )
	{
		Value	10.0;
		Fixed	1;
	}
	
	Variable Variable( dAA1 )
	{
		Value	0.017;
		Fixed	1;
	}
	
	Variable Variable( dAA2 )
	{
		Value	0.11;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_d1 )
	{
		StepperID	Default;
		Name	"Assignment rule for 'd1'";
		Expression	" 0.1 + pow(A1.NumberConc, 2) / (pow(5, 2) + pow(A1.NumberConc, 2))";
		VariableReferenceList
			[ d1   Variable:/SBMLParameter:d1 1 ]
			[ A1   Variable:/environment:A1   0 ];
	}

	
}

