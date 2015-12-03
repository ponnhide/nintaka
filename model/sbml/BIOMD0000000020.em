
# created by eml2em program
# from file: BIOMD0000000020.eml, date: Thu Nov 12 19:00:19 2015
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

System System( /unit_compartment )
{
	StepperID	Default;
	Name	unit_compartment;

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

	Variable Variable( V )
	{
		Name	V;
		Value	0.0;
	}
	
	Variable Variable( V_neg )
	{
		Name	V_neg;
		Value	1.0;
	}
	
	Variable Variable( E )
	{
		Name	E;
		Value	-75.0;
	}
	
	Variable Variable( I )
	{
		Name	I;
		Value	0.0;
		Fixed	1;
	}
	
	Variable Variable( i_Na )
	{
		Name	i_Na;
		Value	1.22002208011;
	}
	
	Variable Variable( i_K )
	{
		Name	i_K;
		Value	-4.39990442724;
	}
	
	Variable Variable( i_L )
	{
		Name	i_L;
		Value	3.1839;
	}
	
	Variable Variable( m )
	{
		Name	m;
		Value	0.052932;
	}
	
	Variable Variable( h )
	{
		Name	h;
		Value	0.59612;
	}
	
	Variable Variable( n )
	{
		Name	n;
		Value	0.31768;
	}
	
	Variable Variable( E_R )
	{
		Name	E_R;
		Value	-75.0;
		Fixed	1;
	}
	
	Variable Variable( Cm )
	{
		Name	Cm;
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( g_Na )
	{
		Name	g_Na;
		Value	120.0;
		Fixed	1;
	}
	
	Variable Variable( g_K )
	{
		Name	g_K;
		Value	36.0;
		Fixed	1;
	}
	
	Variable Variable( g_L )
	{
		Name	g_L;
		Value	0.3;
		Fixed	1;
	}
	
	Variable Variable( E_Na )
	{
		Name	E_Na;
		Value	-190.0;
		Fixed	1;
	}
	
	Variable Variable( E_K )
	{
		Name	E_K;
		Value	-63.0;
		Fixed	1;
	}
	
	Variable Variable( E_L )
	{
		Name	E_L;
		Value	-85.613;
		Fixed	1;
	}
	
	Variable Variable( V_Na )
	{
		Name	V_Na;
		Value	-115.0;
	}
	
	Variable Variable( V_K )
	{
		Name	V_K;
		Value	12.0;
	}
	
	Variable Variable( V_L )
	{
		Name	V_L;
		Value	-10.613;
	}
	
	Variable Variable( alpha_m )
	{
		Name	alpha_m;
		Value	0.223563724585;
	}
	
	Variable Variable( beta_m )
	{
		Name	beta_m;
		Value	4.0;
	}
	
	Variable Variable( alpha_h )
	{
		Name	"auxiliary alpha_h";
		Value	0.07;
	}
	
	Variable Variable( beta_h )
	{
		Name	beta_h;
		Value	0.0474258731776;
	}
	
	Variable Variable( alpha_n )
	{
		Name	alpha_n;
		Value	0.0581976706869;
	}
	
	Variable Variable( beta_n )
	{
		Name	beta_n;
		Value	0.125;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_V_neg )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'V_neg'";
		Expression	"-V.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <minus/>
	    <ci> V </ci>
	  </apply>
	</math>";
		VariableReferenceList
			[ V_neg Variable:/SBMLParameter:V_neg 1 ]
			[ V     Variable:/SBMLParameter:V     0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_E )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'E'";
		Expression	"V.NumberConc + E_R.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <plus/>
	    <ci> V </ci>
	    <ci> E_R </ci>
	  </apply>
	</math>";
		VariableReferenceList
			[ E   Variable:/SBMLParameter:E   1 ]
			[ V   Variable:/SBMLParameter:V   0 ]
			[ E_R Variable:/SBMLParameter:E_R 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_V_L )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'V_L'";
		Expression	"E_L.NumberConc - E_R.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <minus/>
	    <ci> E_L </ci>
	    <ci> E_R </ci>
	  </apply>
	</math>";
		VariableReferenceList
			[ V_L Variable:/SBMLParameter:V_L 1 ]
			[ E_L Variable:/SBMLParameter:E_L 0 ]
			[ E_R Variable:/SBMLParameter:E_R 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_beta_n )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'beta_n'";
		Expression	"0.125 * exp(V.NumberConc / 80)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <cn> 0.125 </cn>
	    <apply>
	      <exp/>
	      <apply>
	        <divide/>
	        <ci> V </ci>
	        <cn> 80 </cn>
	      </apply>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ beta_n Variable:/SBMLParameter:beta_n 1 ]
			[ V      Variable:/SBMLParameter:V      0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_alpha_h )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'alpha_h'";
		Expression	"0.07 * exp(V.NumberConc / 20)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <cn> 0.07 </cn>
	    <apply>
	      <exp/>
	      <apply>
	        <divide/>
	        <ci> V </ci>
	        <cn> 20 </cn>
	      </apply>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ alpha_h Variable:/SBMLParameter:alpha_h 1 ]
			[ V       Variable:/SBMLParameter:V       0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_V_Na )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'V_Na'";
		Expression	"E_Na.NumberConc - E_R.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <minus/>
	    <ci> E_Na </ci>
	    <ci> E_R </ci>
	  </apply>
	</math>";
		VariableReferenceList
			[ V_Na Variable:/SBMLParameter:V_Na 1 ]
			[ E_Na Variable:/SBMLParameter:E_Na 0 ]
			[ E_R  Variable:/SBMLParameter:E_R  0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_V_K )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'V_K'";
		Expression	"E_K.NumberConc - E_R.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <minus/>
	    <ci> E_K </ci>
	    <ci> E_R </ci>
	  </apply>
	</math>";
		VariableReferenceList
			[ V_K Variable:/SBMLParameter:V_K 1 ]
			[ E_K Variable:/SBMLParameter:E_K 0 ]
			[ E_R Variable:/SBMLParameter:E_R 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_i_K )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'i_K'";
		Expression	"g_K.NumberConc * pow(n.NumberConc, 4) * (V.NumberConc - V_K.NumberConc)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> g_K </ci>
	    <apply>
	      <power/>
	      <ci> n </ci>
	      <cn> 4 </cn>
	    </apply>
	    <apply>
	      <minus/>
	      <ci> V </ci>
	      <ci> V_K </ci>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ i_K Variable:/SBMLParameter:i_K 1 ]
			[ g_K Variable:/SBMLParameter:g_K 0 ]
			[ n   Variable:/SBMLParameter:n   0 ]
			[ V   Variable:/SBMLParameter:V   0 ]
			[ V_K Variable:/SBMLParameter:V_K 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_i_Na )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'i_Na'";
		Expression	"g_Na.NumberConc * pow(m.NumberConc, 3) * h.NumberConc * (V.NumberConc - V_Na.NumberConc)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> g_Na </ci>
	    <apply>
	      <power/>
	      <ci> m </ci>
	      <cn> 3 </cn>
	    </apply>
	    <ci> h </ci>
	    <apply>
	      <minus/>
	      <ci> V </ci>
	      <ci> V_Na </ci>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ i_Na Variable:/SBMLParameter:i_Na 1 ]
			[ g_Na Variable:/SBMLParameter:g_Na 0 ]
			[ m    Variable:/SBMLParameter:m    0 ]
			[ h    Variable:/SBMLParameter:h    0 ]
			[ V    Variable:/SBMLParameter:V    0 ]
			[ V_Na Variable:/SBMLParameter:V_Na 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_i_L )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'i_L'";
		Expression	"g_L.NumberConc * (V.NumberConc - V_L.NumberConc)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> g_L </ci>
	    <apply>
	      <minus/>
	      <ci> V </ci>
	      <ci> V_L </ci>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ i_L Variable:/SBMLParameter:i_L 1 ]
			[ g_L Variable:/SBMLParameter:g_L 0 ]
			[ V   Variable:/SBMLParameter:V   0 ]
			[ V_L Variable:/SBMLParameter:V_L 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_beta_m )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'beta_m'";
		Expression	"4 * exp(V.NumberConc / 18)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <cn> 4 </cn>
	    <apply>
	      <exp/>
	      <apply>
	        <divide/>
	        <ci> V </ci>
	        <cn> 18 </cn>
	      </apply>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ beta_m Variable:/SBMLParameter:beta_m 1 ]
			[ V      Variable:/SBMLParameter:V      0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_alpha_n )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'alpha_n'";
		Expression	"0.01 * (V.NumberConc + 10) / (exp((V.NumberConc + 10) / 10) - 1)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <cn> 0.01 </cn>
	      <apply>
	        <plus/>
	        <ci> V </ci>
	        <cn type='integer'> 10 </cn>
	      </apply>
	    </apply>
	    <apply>
	      <minus/>
	      <apply>
	        <exp/>
	        <apply>
	          <divide/>
	          <apply>
	            <plus/>
	            <ci> V </ci>
	            <cn type='integer'> 10 </cn>
	          </apply>
	          <cn type='integer'> 10 </cn>
	        </apply>
	      </apply>
	      <cn type='integer'> 1 </cn>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ alpha_n Variable:/SBMLParameter:alpha_n 1 ]
			[ V       Variable:/SBMLParameter:V       0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_alpha_m )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'alpha_m'";
		Expression	"0.1 * (V.NumberConc + 25) / (exp((V.NumberConc + 25) / 10) - 1)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <times/>
	      <cn> 0.1 </cn>
	      <apply>
	        <plus/>
	        <ci> V </ci>
	        <cn type='integer'> 25 </cn>
	      </apply>
	    </apply>
	    <apply>
	      <minus/>
	      <apply>
	        <exp/>
	        <apply>
	          <divide/>
	          <apply>
	            <plus/>
	            <ci> V </ci>
	            <cn type='integer'> 25 </cn>
	          </apply>
	          <cn type='integer'> 10 </cn>
	        </apply>
	      </apply>
	      <cn type='integer'> 1 </cn>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ alpha_m Variable:/SBMLParameter:alpha_m 1 ]
			[ V       Variable:/SBMLParameter:V       0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_beta_h )
	{
		StepperID	Default;
		Priority	1;
		Name	"Assignment rule for 'beta_h'";
		Expression	"1 / (exp((V.NumberConc + 30) / 10) + 1)";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <cn type='integer'> 1 </cn>
	    <apply>
	      <plus/>
	      <apply>
	        <exp/>
	        <apply>
	          <divide/>
	          <apply>
	            <plus/>
	            <ci> V </ci>
	            <cn type='integer'> 30 </cn>
	          </apply>
	          <cn type='integer'> 10 </cn>
	        </apply>
	      </apply>
	      <cn type='integer'> 1 </cn>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ beta_h Variable:/SBMLParameter:beta_h 1 ]
			[ V      Variable:/SBMLParameter:V      0 ];
	}
	
	Process ExpressionFluxProcess( Rate_V )
	{
		Name	"Rate rule for 'V'";
		Expression	"(I.NumberConc - (i_Na.NumberConc + i_K.NumberConc + i_L.NumberConc)) / Cm.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <divide/>
	    <apply>
	      <minus/>
	      <ci> I </ci>
	      <apply>
	        <plus/>
	        <ci> i_Na </ci>
	        <ci> i_K </ci>
	        <ci> i_L </ci>
	      </apply>
	    </apply>
	    <ci> Cm </ci>
	  </apply>
	</math>";
		VariableReferenceList
			[ V    Variable:/SBMLParameter:V    1 ]
			[ I    Variable:/SBMLParameter:I    0 ]
			[ i_Na Variable:/SBMLParameter:i_Na 0 ]
			[ i_K  Variable:/SBMLParameter:i_K  0 ]
			[ i_L  Variable:/SBMLParameter:i_L  0 ]
			[ Cm   Variable:/SBMLParameter:Cm   0 ];
	}
	
	Process ExpressionFluxProcess( Rate_m )
	{
		Name	"Rate rule for 'm'";
		Expression	"alpha_m.NumberConc * (1 - m.NumberConc) - beta_m.NumberConc * m.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <minus/>
	    <apply>
	      <times/>
	      <ci> alpha_m </ci>
	      <apply>
	        <minus/>
	        <cn> 1 </cn>
	        <ci> m </ci>
	      </apply>
	    </apply>
	    <apply>
	      <times/>
	      <ci> beta_m </ci>
	      <ci> m </ci>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ m       Variable:/SBMLParameter:m       1 ]
			[ alpha_m Variable:/SBMLParameter:alpha_m 0 ]
			[ beta_m  Variable:/SBMLParameter:beta_m  0 ];
	}
	
	Process ExpressionFluxProcess( Rate_h )
	{
		Name	"Rate rule for 'h'";
		Expression	"alpha_h.NumberConc * (1 - h.NumberConc) - beta_h.NumberConc * h.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <minus/>
	    <apply>
	      <times/>
	      <ci> alpha_h </ci>
	      <apply>
	        <minus/>
	        <cn> 1 </cn>
	        <ci> h </ci>
	      </apply>
	    </apply>
	    <apply>
	      <times/>
	      <ci> beta_h </ci>
	      <ci> h </ci>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ h       Variable:/SBMLParameter:h       1 ]
			[ alpha_h Variable:/SBMLParameter:alpha_h 0 ]
			[ beta_h  Variable:/SBMLParameter:beta_h  0 ];
	}
	
	Process ExpressionFluxProcess( Rate_n )
	{
		Name	"Rate rule for 'n'";
		Expression	"alpha_n.NumberConc * (1 - n.NumberConc) - beta_n.NumberConc * n.NumberConc";
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <minus/>
	    <apply>
	      <times/>
	      <ci> alpha_n </ci>
	      <apply>
	        <minus/>
	        <cn> 1 </cn>
	        <ci> n </ci>
	      </apply>
	    </apply>
	    <apply>
	      <times/>
	      <ci> beta_n </ci>
	      <ci> n </ci>
	    </apply>
	  </apply>
	</math>";
		VariableReferenceList
			[ n       Variable:/SBMLParameter:n       1 ]
			[ alpha_n Variable:/SBMLParameter:alpha_n 0 ]
			[ beta_n  Variable:/SBMLParameter:beta_n  0 ];
	}
	
	
}

