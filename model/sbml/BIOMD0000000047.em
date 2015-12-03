
# created by eml2em program
# from file: BIOMD0000000047.eml, date: Thu Nov 12 20:16:10 2015
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
		Value	0.0;
	}
	
	Process ExpressionFluxProcess( Jch )
	{
		Name	"[CaER] -> [Ca_Cyt];";
		Fch_0	8.0;
		Expression	"Fch_0 * p1.Value * p2.Value * p3.Value";
		VariableReferenceList
			[ CaER   Variable:/Cytosol/Endoplasmic_Reticulum:CaER -1 ]
			[ Ca_Cyt Variable:/Cytosol:Ca_Cyt                     1  ]
			[ p1     Variable:/SBMLParameter:p1                   0  ]
			[ p2     Variable:/SBMLParameter:p2                   0  ]
			[ p3     Variable:/SBMLParameter:p3                   0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> Fch_0 </ci>
	    <ci> p1 </ci>
	    <ci> p2 </ci>
	    <ci> p3 </ci>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxProcess( Jleak )
	{
		Name	"[CaER] -> [Ca_Cyt];";
		Fleak	0.5;
		Expression	Fleak;
		VariableReferenceList
			[ CaER   Variable:/Cytosol/Endoplasmic_Reticulum:CaER -1 ]
			[ Ca_Cyt Variable:/Cytosol:Ca_Cyt                     1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <ci> Fleak </ci>
	</math>";
	}
	
	Process ExpressionFluxProcess( Jpump )
	{
		Name	"[Ca_Cyt] -> [CaER];";
		Fpump_0	2.0;
		Kpump	0.1;
		Expression	"Fpump_0 * Ca_Cyt.NumberConc / (Kpump + Ca_Cyt.NumberConc)";
		VariableReferenceList
			[ Ca_Cyt Variable:/Cytosol:Ca_Cyt                     -1 ]
			[ CaER   Variable:/Cytosol/Endoplasmic_Reticulum:CaER 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <ci> Fpump_0 </ci>
	      <ci> Ca_Cyt </ci>
	    </apply>
	    <apply>
	      <plus/>
	      <ci> Kpump </ci>
	      <ci> Ca_Cyt </ci>
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

System System( /Cytosol )
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
	
	Variable Variable( Ca_Cyt )
	{
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /Cytosol/Endoplasmic_Reticulum )
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
	
	Variable Variable( CaER )
	{
		NumberConc	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( n )
	{
		Value	1.0;
	}
	
	Variable Variable( n0 )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( kbN )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( kappa )
	{
		Value	5.0;
		Fixed	1;
	}
	
	Variable Variable( p1 )
	{
		Value	0.333333333333;
	}
	
	Variable Variable( p11 )
	{
		Value	0.2;
		Fixed	1;
	}
	
	Variable Variable( p12 )
	{
		Value	0.8;
		Fixed	1;
	}
	
	Variable Variable( K1 )
	{
		Value	5.0;
		Fixed	1;
	}
	
	Variable Variable( p2 )
	{
		Value	0.0;
	}
	
	Variable Variable( K2 )
	{
		Value	0.7;
		Fixed	1;
	}
	
	Variable Variable( p3 )
	{
		Value	0.95;
	}
	
	Variable Variable( k31 )
	{
		Value	0.5;
		Fixed	1;
	}
	
	Variable Variable( K3 )
	{
		Value	0.7;
		Fixed	1;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_n )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'n'";
		Expression	"n0.NumberConc * (exp(-kbN.NumberConc * time.Value) + kappa.NumberConc * (1 - exp(-kbN.NumberConc * time.Value)))";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> n0 </ci>
	    <apply>
	      <plus/>
	      <apply>
	        <exp/>
	        <apply>
	          <times/>
	          <apply>
	            <minus/>
	            <ci> kbN </ci>
	          </apply>
	          <csymbol encoding='text' definitionURL='http://www.sbml.org/sbml/symbols/time'> time </csymbol>
	        </apply>
	      </apply>
	      <apply>
	        <times/>
	        <ci> kappa </ci>
	        <apply>
	          <minus/>
	          <cn type='integer'> 1 </cn>
	          <apply>
	            <exp/>
	            <apply>
	              <times/>
	              <apply>
	                <minus/>
	                <ci> kbN </ci>
	              </apply>
	              <csymbol encoding='text' definitionURL='http://www.sbml.org/sbml/symbols/time'> time </csymbol>
	            </apply>
	          </apply>
	        </apply>
	      </apply>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ n     Variable:/SBMLParameter:n     1 ]
			[ n0    Variable:/SBMLParameter:n0    0 ]
			[ kbN   Variable:/SBMLParameter:kbN   0 ]
			[ kappa Variable:/SBMLParameter:kappa 0 ]
			[ time  :/:time                       0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_p1 )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'p1'";
		Expression	"p11.NumberConc + p12.NumberConc * n.NumberConc / (K1.NumberConc + n.NumberConc)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <plus/>
	    <ci> p11 </ci>
	    <apply>
	      <divide/>
	      <apply>
	        <times/>
	        <ci> p12 </ci>
	        <ci> n </ci>
	      </apply>
	      <apply>
	        <plus/>
	        <ci> K1 </ci>
	        <ci> n </ci>
	      </apply>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ p1  Variable:/SBMLParameter:p1  1 ]
			[ p11 Variable:/SBMLParameter:p11 0 ]
			[ p12 Variable:/SBMLParameter:p12 0 ]
			[ n   Variable:/SBMLParameter:n   0 ]
			[ K1  Variable:/SBMLParameter:K1  0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_p2 )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'p2'";
		Expression	"Ca_Cyt.NumberConc / (K2.NumberConc + Ca_Cyt.NumberConc)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <ci> Ca_Cyt </ci>
	    <apply>
	      <plus/>
	      <ci> K2 </ci>
	      <ci> Ca_Cyt </ci>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ p2     Variable:/SBMLParameter:p2 1 ]
			[ Ca_Cyt Variable:/Cytosol:Ca_Cyt   0 ]
			[ K2     Variable:/SBMLParameter:K2 0 ];
	}
	
	Process ExpressionFluxProcess( Rate_p3 )
	{
		Name	"Rate rule for 'p3'";
		Expression	"-(k31.NumberConc * Ca_Cyt.NumberConc * p3.NumberConc) + k31.NumberConc * K3.NumberConc * (1 - p3.NumberConc)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <plus/>
	    <apply>
	      <minus/>
	      <apply>
	        <times/>
	        <ci> k31 </ci>
	        <ci> Ca_Cyt </ci>
	        <ci> p3 </ci>
	      </apply>
	    </apply>
	    <apply>
	      <times/>
	      <ci> k31 </ci>
	      <ci> K3 </ci>
	      <apply>
	        <minus/>
	        <cn type='integer'> 1 </cn>
	        <ci> p3 </ci>
	      </apply>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ p3     Variable:/SBMLParameter:p3  1 ]
			[ k31    Variable:/SBMLParameter:k31 0 ]
			[ Ca_Cyt Variable:/Cytosol:Ca_Cyt    0 ]
			[ K3     Variable:/SBMLParameter:K3  0 ];
	}
	
	
}

