
# created by eml2em program
# from file: BIOMD0000000015.eml, date: Sun Nov 15 02:24:33 2015
#

Stepper DormandStepper( Default )
{
	MaxStepInterval	0.01;
}

Stepper DormandStepper( Radau_Dormmand )
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
	
	Process ExpressionFluxexProcess( ada )
	{
		Name	"[ATP] -> [HX];";
		aada	0.001062;
		fada4	0.97;
		Expression	"aada * pow(ATP.NumberConc, fada4)";
		VariableReferenceList
			[ ATP Variable:/cell:ATP -1 ]
			[ HX  Variable:/cell:HX  1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aada </ci>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fada4 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( ade )
	{
		Name	"[Ade] -> ;";
		aade	0.01;
		fade6	0.55;
		Expression	"aade * pow(Ade.NumberConc, fade6)";
		VariableReferenceList
			[ Ade Variable:/cell:Ade -1 ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aade </ci>
	    <apply>
	      <power/>
	      <ci> Ade </ci>
	      <ci> fade6 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( adna )
	{
		Name	"[dATP] -> [DNA]; { dGTP };";
		aadna	3.2789;
		fdnap9	0.42;
		fdnap10	0.33;
		Expression	"aadna * pow(dATP.NumberConc, fdnap9) * pow(dGTP.NumberConc, fdnap10)";
		VariableReferenceList
			[ dATP Variable:/cell:dATP -1 ]
			[ DNA  Variable:/cell:DNA  1  ]
			[ dGTP Variable:/cell:dGTP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aadna </ci>
	    <apply>
	      <power/>
	      <ci> dATP </ci>
	      <ci> fdnap9 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> dGTP </ci>
	      <ci> fdnap10 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( adrnr )
	{
		Name	"[ATP] -> [dATP]; { dGTP, dATP };";
		aadrnr	0.0602;
		fadrnr4	0.1;
		fadrnr9	-0.3;
		fadrnr10	0.87;
		Expression	"aadrnr * pow(ATP.NumberConc, fadrnr4) * pow(dATP.NumberConc, fadrnr9) * pow(dGTP.NumberConc, fadrnr10)";
		VariableReferenceList
			[ ATP  Variable:/cell:ATP  -1 ]
			[ dATP Variable:/cell:dATP 1  ]
			[ dGTP Variable:/cell:dGTP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aadrnr </ci>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fadrnr4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> dATP </ci>
	      <ci> fadrnr9 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> dGTP </ci>
	      <ci> fadrnr10 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( ampd )
	{
		Name	"[ATP] -> [IMP]; { GTP, Pi };";
		aampd	0.02688;
		fampd4	0.8;
		fampd8	-0.03;
		fampd18	-0.1;
		Expression	"aampd * pow(ATP.NumberConc, fampd4) * pow(GTP.NumberConc, fampd8) * pow(Pi.NumberConc, fampd18)";
		VariableReferenceList
			[ ATP Variable:/cell:ATP -1 ]
			[ IMP Variable:/cell:IMP 1  ]
			[ GTP Variable:/cell:GTP 0  ]
			[ Pi  Variable:/cell:Pi  0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aampd </ci>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fampd4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fampd8 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> Pi </ci>
	      <ci> fampd18 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( aprt )
	{
		Name	"[PRPP] + [Ade] -> [ATP]; { ATP };";
		aaprt	233.8;
		faprt1	0.5;
		faprt4	-0.8;
		faprt6	0.75;
		Expression	"aaprt * pow(PRPP.NumberConc, faprt1) * pow(ATP.NumberConc, faprt4) * pow(Ade.NumberConc, faprt6)";
		VariableReferenceList
			[ PRPP Variable:/cell:PRPP -1 ]
			[ Ade  Variable:/cell:Ade  -1 ]
			[ ATP  Variable:/cell:ATP  1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aaprt </ci>
	    <apply>
	      <power/>
	      <ci> PRPP </ci>
	      <ci> faprt1 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> faprt4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> Ade </ci>
	      <ci> faprt6 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( arna )
	{
		Name	"[ATP] -> [RNA]; { GTP };";
		aarna	614.5;
		frnap4	0.05;
		frnap8	0.13;
		Expression	"aarna * pow(ATP.NumberConc, frnap4) * pow(GTP.NumberConc, frnap8)";
		VariableReferenceList
			[ ATP Variable:/cell:ATP -1 ]
			[ RNA Variable:/cell:RNA 1  ]
			[ GTP Variable:/cell:GTP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aarna </ci>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> frnap4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> frnap8 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( asuc )
	{
		Name	"[IMP] -> [SAMP]; { ATP, GTP, Pi };";
		aasuc	3.5932;
		fasuc2	0.4;
		fasuc4	-0.24;
		fasuc8	0.2;
		fasuc18	-0.05;
		Expression	"aasuc * pow(IMP.NumberConc, fasuc2) * pow(ATP.NumberConc, fasuc4) * pow(GTP.NumberConc, fasuc8) * pow(Pi.NumberConc, fasuc18)";
		VariableReferenceList
			[ IMP  Variable:/cell:IMP  -1 ]
			[ SAMP Variable:/cell:SAMP 1  ]
			[ ATP  Variable:/cell:ATP  0  ]
			[ GTP  Variable:/cell:GTP  0  ]
			[ Pi   Variable:/cell:Pi   0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aasuc </ci>
	    <apply>
	      <power/>
	      <ci> IMP </ci>
	      <ci> fasuc2 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fasuc4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fasuc8 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> Pi </ci>
	      <ci> fasuc18 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( asli )
	{
		Name	"[SAMP] -> [ATP]; { ATP };";
		aasli	66544.0;
		fasli3	0.99;
		fasli4	-0.95;
		Expression	"aasli * pow(SAMP.NumberConc, fasli3) * pow(ATP.NumberConc, fasli4)";
		VariableReferenceList
			[ SAMP Variable:/cell:SAMP -1 ]
			[ ATP  Variable:/cell:ATP  1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aasli </ci>
	    <apply>
	      <power/>
	      <ci> SAMP </ci>
	      <ci> fasli3 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fasli4 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( dada )
	{
		Name	"[dATP] -> [HX];";
		adada	0.03333;
		fdada9	1.0;
		Expression	"adada * pow(dATP.NumberConc, fdada9)";
		VariableReferenceList
			[ dATP Variable:/cell:dATP -1 ]
			[ HX   Variable:/cell:HX   1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> adada </ci>
	    <apply>
	      <power/>
	      <ci> dATP </ci>
	      <ci> fdada9 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( den )
	{
		Name	"[PRPP] -> [IMP]; { dGTP, IMP, ATP, GTP, Pi };";
		aden	5.2728;
		fden1	2.0;
		fden2	-0.06;
		fden4	-0.25;
		fden8	-0.2;
		fden18	-0.08;
		Expression	"aden * pow(PRPP.NumberConc, fden1) * pow(IMP.NumberConc, fden2) * pow(ATP.NumberConc, fden4) * pow(GTP.NumberConc, fden8) * pow(Pi.NumberConc, fden18)";
		VariableReferenceList
			[ PRPP Variable:/cell:PRPP -1 ]
			[ IMP  Variable:/cell:IMP  1  ]
			[ dGTP Variable:/cell:dGTP 0  ]
			[ ATP  Variable:/cell:ATP  0  ]
			[ GTP  Variable:/cell:GTP  0  ]
			[ Pi   Variable:/cell:Pi   0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aden </ci>
	    <apply>
	      <power/>
	      <ci> PRPP </ci>
	      <ci> fden1 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> IMP </ci>
	      <ci> fden2 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fden4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fden8 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> Pi </ci>
	      <ci> fden18 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( dgnuc )
	{
		Name	"[dGTP] -> [Gua];";
		adgnuc	0.03333;
		fdgnuc10	1.0;
		Expression	"adgnuc * pow(dGTP.NumberConc, fdgnuc10)";
		VariableReferenceList
			[ dGTP Variable:/cell:dGTP -1 ]
			[ Gua  Variable:/cell:Gua  1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> adgnuc </ci>
	    <apply>
	      <power/>
	      <ci> dGTP </ci>
	      <ci> fdgnuc10 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( dnaa )
	{
		Name	"[DNA] -> [dATP];";
		adnaa	0.001938;
		fdnan12	1.0;
		Expression	"adnaa * pow(DNA.NumberConc, fdnan12)";
		VariableReferenceList
			[ DNA  Variable:/cell:DNA  -1 ]
			[ dATP Variable:/cell:dATP 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> adnaa </ci>
	    <apply>
	      <power/>
	      <ci> DNA </ci>
	      <ci> fdnan12 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( dnag )
	{
		Name	"[DNA] -> [dGTP];";
		adnag	0.001318;
		fdnan12	1.0;
		Expression	"adnag * pow(DNA.NumberConc, fdnan12)";
		VariableReferenceList
			[ DNA  Variable:/cell:DNA  -1 ]
			[ dGTP Variable:/cell:dGTP 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> adnag </ci>
	    <apply>
	      <power/>
	      <ci> DNA </ci>
	      <ci> fdnan12 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( gdna )
	{
		Name	"[dGTP] -> [DNA]; { dATP };";
		agdna	2.2296;
		fdnap9	0.42;
		fdnap10	0.33;
		Expression	"agdna * pow(dATP.NumberConc, fdnap9) * pow(dGTP.NumberConc, fdnap10)";
		VariableReferenceList
			[ dGTP Variable:/cell:dGTP -1 ]
			[ DNA  Variable:/cell:DNA  1  ]
			[ dATP Variable:/cell:dATP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> agdna </ci>
	    <apply>
	      <power/>
	      <ci> dATP </ci>
	      <ci> fdnap9 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> dGTP </ci>
	      <ci> fdnap10 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( gdrnr )
	{
		Name	"[GTP] -> [dGTP]; { dATP, dGTP };";
		agdrnr	0.1199;
		fgdrnr8	0.4;
		fgdrnr9	-1.2;
		fgdrnr10	-0.39;
		Expression	"agdrnr * pow(GTP.NumberConc, fgdrnr8) * pow(dATP.NumberConc, fgdrnr9) * pow(dGTP.NumberConc, fgdrnr10)";
		VariableReferenceList
			[ GTP  Variable:/cell:GTP  -1 ]
			[ dGTP Variable:/cell:dGTP 1  ]
			[ dATP Variable:/cell:dATP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> agdrnr </ci>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fgdrnr8 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> dATP </ci>
	      <ci> fgdrnr9 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> dGTP </ci>
	      <ci> fgdrnr10 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( gmpr )
	{
		Name	"[GTP] -> [IMP]; { XMP, ATP, IMP };";
		agmpr	0.3005;
		fgmpr2	-0.15;
		fgmpr4	-0.07;
		fgmpr7	-0.76;
		fgmpr8	0.7;
		Expression	"agmpr * pow(IMP.NumberConc, fgmpr2) * pow(ATP.NumberConc, fgmpr4) * pow(XMP.NumberConc, fgmpr7) * pow(GTP.NumberConc, fgmpr8)";
		VariableReferenceList
			[ GTP Variable:/cell:GTP -1 ]
			[ IMP Variable:/cell:IMP 1  ]
			[ XMP Variable:/cell:XMP 0  ]
			[ ATP Variable:/cell:ATP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> agmpr </ci>
	    <apply>
	      <power/>
	      <ci> IMP </ci>
	      <ci> fgmpr2 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fgmpr4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> XMP </ci>
	      <ci> fgmpr7 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fgmpr8 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( gmps )
	{
		Name	"[XMP] -> [GTP]; { ATP };";
		agmps	0.3738;
		fgmps4	0.12;
		fgmps7	0.16;
		Expression	"agmps * pow(ATP.NumberConc, fgmps4) * pow(XMP.NumberConc, fgmps7)";
		VariableReferenceList
			[ XMP Variable:/cell:XMP -1 ]
			[ GTP Variable:/cell:GTP 1  ]
			[ ATP Variable:/cell:ATP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> agmps </ci>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fgmps4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> XMP </ci>
	      <ci> fgmps7 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( gnuc )
	{
		Name	"[GTP] -> [Gua]; { Pi };";
		agnuc	0.2511;
		fgnuc8	0.9;
		fgnuc18	-0.34;
		Expression	"agnuc * pow(GTP.NumberConc, fgnuc8) * pow(Pi.NumberConc, fgnuc18)";
		VariableReferenceList
			[ GTP Variable:/cell:GTP -1 ]
			[ Gua Variable:/cell:Gua 1  ]
			[ Pi  Variable:/cell:Pi  0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> agnuc </ci>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fgnuc8 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> Pi </ci>
	      <ci> fgnuc18 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( gprt )
	{
		Name	"[Gua] + [PRPP] -> [GTP]; { GTP };";
		agprt	361.69;
		fgprt1	1.2;
		fgprt8	-1.2;
		fgprt15	0.42;
		Expression	"agprt * pow(PRPP.NumberConc, fgprt1) * pow(GTP.NumberConc, fgprt8) * pow(Gua.NumberConc, fgprt15)";
		VariableReferenceList
			[ Gua  Variable:/cell:Gua  -1 ]
			[ PRPP Variable:/cell:PRPP -1 ]
			[ GTP  Variable:/cell:GTP  1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> agprt </ci>
	    <apply>
	      <power/>
	      <ci> PRPP </ci>
	      <ci> fgprt1 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fgprt8 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> Gua </ci>
	      <ci> fgprt15 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( grna )
	{
		Name	"[GTP] -> [RNA]; { ATP };";
		agrna	409.6;
		frnap4	0.05;
		frnap8	0.13;
		Expression	"agrna * pow(ATP.NumberConc, frnap4) * pow(GTP.NumberConc, frnap8)";
		VariableReferenceList
			[ GTP Variable:/cell:GTP -1 ]
			[ RNA Variable:/cell:RNA 1  ]
			[ ATP Variable:/cell:ATP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> agrna </ci>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> frnap4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> frnap8 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( gua )
	{
		Name	"[Gua] -> [Xa];";
		agua	0.4919;
		fgua15	0.5;
		Expression	"agua * pow(Gua.NumberConc, fgua15)";
		VariableReferenceList
			[ Gua Variable:/cell:Gua -1 ]
			[ Xa  Variable:/cell:Xa  1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> agua </ci>
	    <apply>
	      <power/>
	      <ci> Gua </ci>
	      <ci> fgua15 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( hprt )
	{
		Name	"[HX] + [PRPP] -> [IMP]; { IMP };";
		ahprt	12.569;
		fhprt1	1.1;
		fhprt2	-0.89;
		fhprt13	0.48;
		Expression	"ahprt * pow(PRPP.NumberConc, fhprt1) * pow(IMP.NumberConc, fhprt2) * pow(HX.NumberConc, fhprt13)";
		VariableReferenceList
			[ HX   Variable:/cell:HX   -1 ]
			[ PRPP Variable:/cell:PRPP -1 ]
			[ IMP  Variable:/cell:IMP  1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> ahprt </ci>
	    <apply>
	      <power/>
	      <ci> PRPP </ci>
	      <ci> fhprt1 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> IMP </ci>
	      <ci> fhprt2 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> HX </ci>
	      <ci> fhprt13 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( hx )
	{
		Name	"[HX] -> ;";
		ahx	0.003793;
		fhx13	1.12;
		Expression	"ahx * pow(HX.NumberConc, fhx13)";
		VariableReferenceList
			[ HX Variable:/cell:HX -1 ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> ahx </ci>
	    <apply>
	      <power/>
	      <ci> HX </ci>
	      <ci> fhx13 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( hxd )
	{
		Name	"[HX] -> [Xa];";
		ahxd	0.2754;
		fhxd13	0.65;
		Expression	"ahxd * pow(HX.NumberConc, fhxd13)";
		VariableReferenceList
			[ HX Variable:/cell:HX -1 ]
			[ Xa Variable:/cell:Xa 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> ahxd </ci>
	    <apply>
	      <power/>
	      <ci> HX </ci>
	      <ci> fhxd13 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( impd )
	{
		Name	"[IMP] -> [XMP]; { GTP, XMP };";
		aimpd	1.2823;
		fimpd2	0.15;
		fimpd7	-0.09;
		fimpd8	-0.03;
		Expression	"aimpd * pow(IMP.NumberConc, fimpd2) * pow(XMP.NumberConc, fimpd7) * pow(GTP.NumberConc, fimpd8)";
		VariableReferenceList
			[ IMP Variable:/cell:IMP -1 ]
			[ XMP Variable:/cell:XMP 1  ]
			[ GTP Variable:/cell:GTP 0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aimpd </ci>
	    <apply>
	      <power/>
	      <ci> IMP </ci>
	      <ci> fimpd2 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> XMP </ci>
	      <ci> fimpd7 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fimpd8 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( inuc )
	{
		Name	"[IMP] -> [HX]; { Pi };";
		ainuc	0.9135;
		finuc2	0.8;
		finuc18	-0.36;
		Expression	"ainuc * pow(IMP.NumberConc, finuc2) * pow(Pi.NumberConc, finuc18)";
		VariableReferenceList
			[ IMP Variable:/cell:IMP -1 ]
			[ HX  Variable:/cell:HX  1  ]
			[ Pi  Variable:/cell:Pi  0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> ainuc </ci>
	    <apply>
	      <power/>
	      <ci> IMP </ci>
	      <ci> finuc2 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> Pi </ci>
	      <ci> finuc18 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( mat )
	{
		Name	"[ATP] -> [SAM]; { SAM };";
		amat	7.2067;
		fmat4	0.2;
		fmat5	-0.6;
		Expression	"amat * pow(ATP.NumberConc, fmat4) * pow(SAM.NumberConc, fmat5)";
		VariableReferenceList
			[ ATP Variable:/cell:ATP -1 ]
			[ SAM Variable:/cell:SAM 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> amat </ci>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fmat4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> SAM </ci>
	      <ci> fmat5 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( polyam )
	{
		Name	"[SAM] -> [Ade];";
		apolyam	0.29;
		fpolyam5	0.9;
		Expression	"apolyam * pow(SAM.NumberConc, fpolyam5)";
		VariableReferenceList
			[ SAM Variable:/cell:SAM -1 ]
			[ Ade Variable:/cell:Ade 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> apolyam </ci>
	    <apply>
	      <power/>
	      <ci> SAM </ci>
	      <ci> fpolyam5 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( prpps )
	{
		Name	"[R5P] -> [PRPP]; { ATP, GTP, Pi, PRPP };";
		aprpps	0.9;
		fprpps1	-0.03;
		fprpps4	-0.45;
		fprpps8	-0.04;
		fprpps17	0.65;
		fprpps18	0.7;
		Expression	"aprpps * pow(PRPP.NumberConc, fprpps1) * pow(ATP.NumberConc, fprpps4) * pow(GTP.NumberConc, fprpps8) * pow(R5P.NumberConc, fprpps17) * pow(Pi.NumberConc, fprpps18)";
		VariableReferenceList
			[ R5P  Variable:/cell:R5P  -1 ]
			[ PRPP Variable:/cell:PRPP 1  ]
			[ ATP  Variable:/cell:ATP  0  ]
			[ GTP  Variable:/cell:GTP  0  ]
			[ Pi   Variable:/cell:Pi   0  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aprpps </ci>
	    <apply>
	      <power/>
	      <ci> PRPP </ci>
	      <ci> fprpps1 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> ATP </ci>
	      <ci> fprpps4 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> GTP </ci>
	      <ci> fprpps8 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> R5P </ci>
	      <ci> fprpps17 </ci>
	    </apply>
	    <apply>
	      <power/>
	      <ci> Pi </ci>
	      <ci> fprpps18 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( pyr )
	{
		Name	"[PRPP] -> ;";
		apyr	1.2951;
		fpyr1	1.27;
		Expression	"apyr * pow(PRPP.NumberConc, fpyr1)";
		VariableReferenceList
			[ PRPP Variable:/cell:PRPP -1 ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> apyr </ci>
	    <apply>
	      <power/>
	      <ci> PRPP </ci>
	      <ci> fpyr1 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rnaa )
	{
		Name	"[RNA] -> [ATP];";
		arnaa	0.06923;
		frnan11	1.0;
		Expression	"arnaa * pow(RNA.NumberConc, frnan11)";
		VariableReferenceList
			[ RNA Variable:/cell:RNA -1 ]
			[ ATP Variable:/cell:ATP 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> arnaa </ci>
	    <apply>
	      <power/>
	      <ci> RNA </ci>
	      <ci> frnan11 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( rnag )
	{
		Name	"[RNA] -> [GTP];";
		arnag	0.04615;
		frnan11	1.0;
		Expression	"arnag * pow(RNA.NumberConc, frnan11)";
		VariableReferenceList
			[ RNA Variable:/cell:RNA -1 ]
			[ GTP Variable:/cell:GTP 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> arnag </ci>
	    <apply>
	      <power/>
	      <ci> RNA </ci>
	      <ci> frnan11 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( trans )
	{
		Name	"[SAM] -> [ATP];";
		atrans	8.8539;
		ftrans5	0.33;
		Expression	"atrans * pow(SAM.NumberConc, ftrans5)";
		VariableReferenceList
			[ SAM Variable:/cell:SAM -1 ]
			[ ATP Variable:/cell:ATP 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> atrans </ci>
	    <apply>
	      <power/>
	      <ci> SAM </ci>
	      <ci> ftrans5 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( ua )
	{
		Name	"[UA] -> ;";
		aua	8.744e-05;
		fua16	2.21;
		Expression	"aua * pow(UA.NumberConc, fua16)";
		VariableReferenceList
			[ UA Variable:/cell:UA -1 ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> aua </ci>
	    <apply>
	      <power/>
	      <ci> UA </ci>
	      <ci> fua16 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( x )
	{
		Name	"[Xa] -> ;";
		ax	0.0012;
		fx14	2.0;
		Expression	"ax * pow(Xa.NumberConc, fx14)";
		VariableReferenceList
			[ Xa Variable:/cell:Xa -1 ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> ax </ci>
	    <apply>
	      <power/>
	      <ci> Xa </ci>
	      <ci> fx14 </ci>
	    </apply>
	  </apply>
	</math>";
	}
	
	Process ExpressionFluxexProcess( xd )
	{
		Name	"[Xa] -> [UA];";
		axd	0.949;
		fxd14	0.55;
		Expression	"axd * pow(Xa.NumberConc, fxd14)";
		VariableReferenceList
			[ Xa Variable:/cell:Xa -1 ]
			[ UA Variable:/cell:UA 1  ];
		mathml	"<?xml version='1.0' encoding='UTF-8'?>
	<math xmlns='http://www.w3.org/1998/Math/MathML'>
	  <apply>
	    <times/>
	    <ci> axd </ci>
	    <apply>
	      <power/>
	      <ci> Xa </ci>
	      <ci> fxd14 </ci>
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
	
	Variable Variable( PRPP )
	{
		Name	phosphoribosylpyrophosphate;
		Value	5.01742;
		Fixed	0;
	}
	
	Variable Variable( IMP )
	{
		Name	"inosine monophosphate";
		Value	98.2634;
		Fixed	0;
	}
	
	Variable Variable( SAMP )
	{
		Name	adenylosuccinate;
		Value	0.198189;
		Fixed	0;
	}
	
	Variable Variable( ATP )
	{
		Name	ATP_ADP_AMP_Ado;
		Value	2475.35;
		Fixed	0;
	}
	
	Variable Variable( SAM )
	{
		Name	"s-adenosyl-L-methionine";
		Value	3.99187;
		Fixed	0;
	}
	
	Variable Variable( Ade )
	{
		Name	adenine;
		Value	0.98473;
		Fixed	0;
	}
	
	Variable Variable( XMP )
	{
		Name	"xanthosine monophosphate";
		Value	24.793;
		Fixed	0;
	}
	
	Variable Variable( GTP )
	{
		Name	GTP_GDP_GMP;
		Value	410.223;
		Fixed	0;
	}
	
	Variable Variable( dATP )
	{
		Name	dATP_dADP_dAMP_dAdo;
		Value	6.01413;
		Fixed	0;
	}
	
	Variable Variable( dGTP )
	{
		Name	dGTP_dGDP_dGMP;
		Value	3.02581;
		Fixed	0;
	}
	
	Variable Variable( RNA )
	{
		Value	28680.5;
		Fixed	0;
	}
	
	Variable Variable( DNA )
	{
		Value	5179.34;
		Fixed	0;
	}
	
	Variable Variable( HX )
	{
		Name	dIno_Ino_HX;
		Value	9.51785;
		Fixed	0;
	}
	
	Variable Variable( Xa )
	{
		Name	xanthine;
		Value	5.05941;
		Fixed	0;
	}
	
	Variable Variable( Gua )
	{
		Name	guanine;
		Value	5.50638;
		Fixed	0;
	}
	
	Variable Variable( UA )
	{
		Name	"uric acid";
		Value	100.293;
		Fixed	0;
	}
	
	Variable Variable( R5P )
	{
		Name	"ribose-5-phosphate";
		Value	18.0;
		Fixed	0;
	}
	
	Variable Variable( Pi )
	{
		Name	phosphate;
		Value	1400.0;
		Fixed	0;
	}
	
	
}

