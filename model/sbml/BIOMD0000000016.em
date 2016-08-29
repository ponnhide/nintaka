
# created by eml2em program
# from file: BIOMD0000000016.eml, date: Mon Feb 15 23:11:34 2016
#

Stepper ODEeventStepper( Default )
{
	# no property
}

Stepper DormandStepper( Radau_Dormmand )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1e-15;
		Fixed	1;
	}
	
	Variable Variable( EmptySet )
	{
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( time )
	{
		Value	0.0;
	}
	
	Process ExpressionFluxexProcess( rM )
	{
		Name	"transcription of PER";
		Vs	0.76;
		KI	1.0;
		n	4.0;
		Expression	"default.Value * Vs * pow(KI, n) / (pow(KI, n) + pow(Pn.NumberConc, n))";
		VariableReferenceList
			[ EmptySet Variable:/:EmptySet                        0 ]
			[ M        Variable:/CYTOPLASM:M                      1 ]
			[ Pn       Variable:/CYTOPLASM/compartment_0000004:Pn 0 ]
			[ default  Variable:/:SIZE                            0 ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <ci> default </ci>
	      <ci> Vs </ci>
	      <apply>
	        <power/>
	        <ci> KI </ci>
	        <ci> n </ci>
	      </apply>
	    </apply>
	    <apply>
	      <plus/>
	      <apply>
	        <power/>
	        <ci> KI </ci>
	        <ci> n </ci>
	      </apply>
	      <apply>
	        <power/>
	        <ci> Pn </ci>
	        <ci> n </ci>
	      </apply>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rTL )
	{
		Name	"translation of PER";
		ks	0.38;
		Expression	"ks * M.NumberConc * default.Value";
		VariableReferenceList
			[ EmptySet Variable:/:EmptySet    0 ]
			[ P0       Variable:/CYTOPLASM:P0 1 ]
			[ M        Variable:/CYTOPLASM:M  0 ]
			[ default  Variable:/:SIZE        0 ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> ks </ci>
	    <ci> M </ci>
	    <ci> default </ci>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rP01 )
	{
		Name	"first phosphorylation of PER";
		V1	3.2;
		K1	2.0;
		Expression	"CYTOPLASM.Value * V1 * P0.NumberConc / (K1 + P0.NumberConc)";
		VariableReferenceList
			[ P0        Variable:/CYTOPLASM:P0   -1 ]
			[ P1        Variable:/CYTOPLASM:P1   1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <ci> CYTOPLASM </ci>
	      <ci> V1 </ci>
	      <ci> P0 </ci>
	    </apply>
	    <apply>
	      <plus/>
	      <ci> K1 </ci>
	      <ci> P0 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rP10 )
	{
		Name	"removal of the first PER phosphate";
		V2	1.58;
		K2	2.0;
		Expression	"CYTOPLASM.Value * V2 * P1.NumberConc / (K2 + P1.NumberConc)";
		VariableReferenceList
			[ P1        Variable:/CYTOPLASM:P1   -1 ]
			[ P0        Variable:/CYTOPLASM:P0   1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <ci> CYTOPLASM </ci>
	      <ci> V2 </ci>
	      <ci> P1 </ci>
	    </apply>
	    <apply>
	      <plus/>
	      <ci> K2 </ci>
	      <ci> P1 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rP12 )
	{
		Name	"second phosphorylation of PER";
		V3	5.0;
		K3	2.0;
		Expression	"CYTOPLASM.Value * V3 * P1.NumberConc / (K3 + P1.NumberConc)";
		VariableReferenceList
			[ P1        Variable:/CYTOPLASM:P1   -1 ]
			[ P2        Variable:/CYTOPLASM:P2   1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <ci> CYTOPLASM </ci>
	      <ci> V3 </ci>
	      <ci> P1 </ci>
	    </apply>
	    <apply>
	      <plus/>
	      <ci> K3 </ci>
	      <ci> P1 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rP21 )
	{
		Name	"removal of the second PER phosphate";
		V4	2.5;
		K4	2.0;
		Expression	"CYTOPLASM.Value * V4 * P2.NumberConc / (K4 + P2.NumberConc)";
		VariableReferenceList
			[ P2        Variable:/CYTOPLASM:P2   -1 ]
			[ P1        Variable:/CYTOPLASM:P1   1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <ci> CYTOPLASM </ci>
	      <ci> V4 </ci>
	      <ci> P2 </ci>
	    </apply>
	    <apply>
	      <plus/>
	      <ci> K4 </ci>
	      <ci> P2 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rP2n )
	{
		Name	"translocation of PER to the nucleus";
		k1	1.9;
		Expression	"k1 * P2.NumberConc * CYTOPLASM.Value";
		VariableReferenceList
			[ P2        Variable:/CYTOPLASM:P2                     -1 ]
			[ Pn        Variable:/CYTOPLASM/compartment_0000004:Pn 1  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE                   0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> k1 </ci>
	    <ci> P2 </ci>
	    <ci> CYTOPLASM </ci>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rPn2 )
	{
		Name	"translocation of PER to the cytoplasm";
		k2	1.3;
		Expression	"k2 * Pn.NumberConc * compartment_0000004.Value";
		VariableReferenceList
			[ Pn                  Variable:/CYTOPLASM/compartment_0000004:Pn   -1 ]
			[ P2                  Variable:/CYTOPLASM:P2                       1  ]
			[ compartment_0000004 Variable:/CYTOPLASM/compartment_0000004:SIZE 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> k2 </ci>
	    <ci> Pn </ci>
	    <ci> compartment_0000004 </ci>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rmRNAd )
	{
		Name	"degradation of PER mRNA";
		Km	0.5;
		Vm	0.65;
		Expression	"Vm * M.NumberConc * CYTOPLASM.Value / (Km + M.NumberConc)";
		VariableReferenceList
			[ M         Variable:/CYTOPLASM:M    -1 ]
			[ EmptySet  Variable:/:EmptySet      0  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <ci> Vm </ci>
	      <ci> M </ci>
	      <ci> CYTOPLASM </ci>
	    </apply>
	    <apply>
	      <plus/>
	      <ci> Km </ci>
	      <ci> M </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rVd )
	{
		Name	"degradation of PER";
		Vd	0.95;
		Kd	0.2;
		Expression	"CYTOPLASM.Value * Vd * P2.NumberConc / (Kd + P2.NumberConc)";
		VariableReferenceList
			[ P2        Variable:/CYTOPLASM:P2   -1 ]
			[ EmptySet  Variable:/:EmptySet      0  ]
			[ CYTOPLASM Variable:/CYTOPLASM:SIZE 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <ci> CYTOPLASM </ci>
	      <ci> Vd </ci>
	      <ci> P2 </ci>
	    </apply>
	    <apply>
	      <plus/>
	      <ci> Kd </ci>
	      <ci> P2 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxProcess( time )
	{
		Expression	1.0;
		Priority	10;
		VariableReferenceList
			[ time :/:time 1 ];
	}
	
	
}

System System( /CYTOPLASM )
{
	StepperID	Default;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1e-15;
		Fixed	1;
	}
	
	Variable Variable( M )
	{
		Name	"PER mRNA";
		NumberConc	0.1;
		Fixed	0;
	}
	
	Variable Variable( P0 )
	{
		Name	"unphosphorylated PER";
		NumberConc	0.25;
		Fixed	0;
	}
	
	Variable Variable( P1 )
	{
		Name	"monophosphorylated PER";
		NumberConc	0.25;
		Fixed	0;
	}
	
	Variable Variable( P2 )
	{
		Name	"biphosphorylated PER";
		NumberConc	0.25;
		Fixed	0;
	}
	
	Variable Variable( Pt )
	{
		Name	"total PER";
		NumberConc	1.0;
		Fixed	0;
	}
	
	
}

System System( /CYTOPLASM/compartment_0000004 )
{
	StepperID	Default;
	Name	NUCLEUS;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1e-15;
		Fixed	1;
	}
	
	Variable Variable( Pn )
	{
		Name	"nuclear PER";
		NumberConc	0.25;
		Fixed	0;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentexProcess( Assignment_Pt )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'Pt'";
		Expression	"P0.NumberConc + P1.NumberConc + P2.NumberConc + Pn.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <plus/>
	    <ci> P0 </ci>
	    <ci> P1 </ci>
	    <ci> P2 </ci>
	    <ci> Pn </ci>
	  </apply>
	</math>";
		VariableReferenceList
			[ Pt Variable:/CYTOPLASM:Pt                     1 ]
			[ P0 Variable:/CYTOPLASM:P0                     0 ]
			[ P1 Variable:/CYTOPLASM:P1                     0 ]
			[ P2 Variable:/CYTOPLASM:P2                     0 ]
			[ Pn Variable:/CYTOPLASM/compartment_0000004:Pn 0 ];
	}
	
	
}

