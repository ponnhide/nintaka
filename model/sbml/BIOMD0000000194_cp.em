
# created by eml2em program
# from file: BIOMD0000000194_cp.eml, date: Fri Nov 13 00:42:30 2015
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
	
	Process ExpressionFluxProcess( R6 )
	{
		Name	"[Mad1_CMad2] + [OMad2] <-> [Mad1_CMad2_OMad2];";
		Expression	"Cytoplasm.Value * (u.Value * alpha_T.Value * Mad1_CMad2.NumberConc * OMad2.NumberConc - beta_T.Value * Mad1_CMad2_OMad2.NumberConc)";
		VariableReferenceList
			[ Mad1_CMad2       Variable:/Cytoplasm:Mad1_CMad2       -1 ]
			[ OMad2            Variable:/Cytoplasm:OMad2            -1 ]
			[ Mad1_CMad2_OMad2 Variable:/Cytoplasm:Mad1_CMad2_OMad2 1  ]
			[ Cytoplasm        Variable:/Cytoplasm:SIZE             0  ]
			[ u                Variable:/SBMLParameter:u            0  ]
			[ alpha_T          Variable:/SBMLParameter:alpha_T      0  ]
			[ beta_T           Variable:/SBMLParameter:beta_T       0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> Cytoplasm </ci>
	    <apply>
	      <minus/>
	      <apply>
	        <times/>
	        <ci> u </ci>
	        <ci> alpha_T </ci>
	        <ci> Mad1_CMad2 </ci>
	        <ci> OMad2 </ci>
	      </apply>
	      <apply>
	        <times/>
	        <ci> beta_T </ci>
	        <ci> Mad1_CMad2_OMad2 </ci>
	      </apply>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxProcess( R7 )
	{
		Name	"[Mad1_CMad2_OMad2] + [Cdc20] -> [Mad1_CMad2] + [Cdc20_CMad2];";
		Expression	"Cytoplasm.Value * u.Value * gamma_T.Value * Mad1_CMad2_OMad2.NumberConc * Cdc20.NumberConc";
		VariableReferenceList
			[ Mad1_CMad2_OMad2 Variable:/Cytoplasm:Mad1_CMad2_OMad2 -1 ]
			[ Cdc20            Variable:/Cytoplasm:Cdc20            -1 ]
			[ Mad1_CMad2       Variable:/Cytoplasm:Mad1_CMad2       1  ]
			[ Cdc20_CMad2      Variable:/Cytoplasm:Cdc20_CMad2      1  ]
			[ Cytoplasm        Variable:/Cytoplasm:SIZE             0  ]
			[ u                Variable:/SBMLParameter:u            0  ]
			[ gamma_T          Variable:/SBMLParameter:gamma_T      0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> Cytoplasm </ci>
	    <ci> u </ci>
	    <ci> gamma_T </ci>
	    <ci> Mad1_CMad2_OMad2 </ci>
	    <ci> Cdc20 </ci>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxProcess( R8 )
	{
		Name	"[Cdc20_CMad2] -> [Cdc20] + [OMad2];";
		Expression	"Cytoplasm.Value * eta_T.Value * Cdc20_CMad2.NumberConc";
		VariableReferenceList
			[ Cdc20_CMad2 Variable:/Cytoplasm:Cdc20_CMad2 -1 ]
			[ Cdc20       Variable:/Cytoplasm:Cdc20       1  ]
			[ OMad2       Variable:/Cytoplasm:OMad2       1  ]
			[ Cytoplasm   Variable:/Cytoplasm:SIZE        0  ]
			[ eta_T       Variable:/SBMLParameter:eta_T   0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> Cytoplasm </ci>
	    <ci> eta_T </ci>
	    <ci> Cdc20_CMad2 </ci>
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

System System( /Cytoplasm )
{
	StepperID	Default;
	Name	Cytoplasm;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Mad1_CMad2 )
	{
		Name	"Mad1:C-Mad2";
		Value	5e-08;
		Fixed	0;
	}
	
	Variable Variable( OMad2 )
	{
		Name	"O-Mad2";
		Value	1.5e-07;
		Fixed	0;
	}
	
	Variable Variable( Mad1_CMad2_OMad2 )
	{
		Name	"Mad1:C-Mad2:O-Mad2*";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Cdc20 )
	{
		Name	Cdc20;
		Value	2.2e-07;
		Fixed	0;
	}
	
	Variable Variable( Cdc20_CMad2 )
	{
		Name	"Cdc20:C-Mad2";
		Value	0.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( eta_T )
	{
		Value	0.01;
		Fixed	1;
	}
	
	Variable Variable( gamma_T )
	{
		Value	1000000000.0;
		Fixed	1;
	}
	
	Variable Variable( alpha_T )
	{
		Value	200000.0;
		Fixed	1;
	}
	
	Variable Variable( beta_T )
	{
		Value	0.2;
		Fixed	1;
	}
	
	Variable Variable( u )
	{
		Value	1.0;
	}
	
	Variable Variable( const_val_0 )
	{
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( const_val_1 )
	{
		Value	1.0;
		Fixed	1;
	}
	
	
}

System System( /SBMLEvent )
{
	Name	"System for SBML Event";
	StepperID	Default;

	Process ExpressionEventRepeatableProcess( mt_attachment )
	{
		Priority	2;
		StepperID	Default;
		Name	mt_attachment;
		EventAssignmentList
			[ u "const_val_0.NumberConc" ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <gt/>
	    <csymbol encoding='text' definitionURL='http://www.sbml.org/sbml/symbols/time'> time </csymbol>
	    <cn> 2000 </cn>
	  </apply>
	</math>";
		RepeatFlag	false;
		Trigger	"gt(time.Value, 2000)";
		Delay	0;
		VariableReferenceList
			[ u           Variable:/SBMLParameter:u           1 ]
			[ const_val_0 Variable:/SBMLParameter:const_val_0 0 ]
			[ time        :/:time                             0 ];
	}
	
	
}

