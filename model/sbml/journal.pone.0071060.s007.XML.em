
# created by eml2em program
# from file: journal.pone.0071060.s007.XML.eml, date: Sat Jun 13 21:48:20 2015
#

Stepper FixedODE1Stepper( Default )
{
       StepInterval 0.001;
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP1 )
	{
		Name	BPGSP1;
		Name	BPGSP1;
		#StepperID	0.0;
		#Priority	0.0;
		k1	80000000.0;
		k2	400.0;
		Expression	"(k1 * ((1 + pow(10, -6.8) / pow(10, -7.2)) / (1 + pow(10, -6.8) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) * Variable__CELL_CYTOPLASM__13DPG.NumberConc * Variable__CELL_CYTOPLASM_BPGSP.NumberConc - k2 * Variable__CELL_CYTOPLASM_BPGSP_B13PG.NumberConc) * (1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM__13DPG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__13DPG      -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSP       -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSP_B13PG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSP_B13PG 1  ]
			[ Variable__CELL_CYTOPLASM_pHi         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi         0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP2 )
	{
		Name	BPGSP2;
		Name	BPGSP2;
		#StepperID	0.0;
		#Priority	0.0;
		k3	9.9;
		Expression	"k3 * ((1 + pow(pow(10, -7.2) / pow(10, -7.17), 4)) / (1 + pow(pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.17), 4))) * Variable__CELL_CYTOPLASM_BPGSP_B13PG.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_BPGSP_B13PG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSP_B13PG -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSPP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP      1  ]
			[ Variable__CELL_CYTOPLASM__3PG        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__3PG        1  ]
			[ Variable__CELL_CYTOPLASM_pHi         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi         0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP3 )
	{
		Name	BPGSP3;
		Name	BPGSP3;
		#StepperID	0.0;
		#Priority	0.0;
		k4	185000000.0;
		k5	100000000.0;
		Expression	"(k4 * ((1 + pow(pow(10, -7.2) / pow(10, -7.17), 4)) / (1 + pow(pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.17), 4))) * Variable__CELL_CYTOPLASM_BPGSPP.NumberConc * Variable__CELL_CYTOPLASM__3PG.NumberConc - k5 * Variable__CELL_CYTOPLASM_BPGSPP_P3GA.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_BPGSPP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP      -1 ]
			[ Variable__CELL_CYTOPLASM__3PG        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__3PG        -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSPP_P3GA Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP_P3GA 1  ]
			[ Variable__CELL_CYTOPLASM_pHi         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi         0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP4 )
	{
		Name	BPGSP4;
		Name	BPGSP4;
		#StepperID	0.0;
		#Priority	0.0;
		k6	1000.0;
		k7	1000.0;
		Expression	"(k6 * ((1 + pow(pow(10, -7.2) / pow(10, -7.17), 4)) / (1 + pow(pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.17), 4))) * Variable__CELL_CYTOPLASM_BPGSPP.NumberConc * Variable__CELL_CYTOPLASM__2PG.NumberConc - k7 * Variable__CELL_CYTOPLASM_BPGSPP_P2GA.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_BPGSPP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP      -1 ]
			[ Variable__CELL_CYTOPLASM__2PG        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__2PG        -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSPP_P2GA Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP_P2GA 1  ]
			[ Variable__CELL_CYTOPLASM_pHi         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi         0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP5 )
	{
		Name	BPGSP5;
		Name	BPGSP5;
		#StepperID	0.0;
		#Priority	0.0;
		k8	10000.0;
		k9	0.55;
		Expression	"(k8 * Variable__CELL_CYTOPLASM_BPGSPP_P3GA.NumberConc - k9 * Variable__CELL_CYTOPLASM_BPGSP_B23PG.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_BPGSPP_P3GA Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP_P3GA -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSP_B23PG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSP_B23PG 1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP6 )
	{
		Name	BPGSP6;
		Name	BPGSP6;
		#StepperID	0.0;
		#Priority	0.0;
		k10	1979.0;
		k11	0.01;
		Expression	"(k10 * Variable__CELL_CYTOPLASM_BPGSPP_P2GA.NumberConc - k11 * Variable__CELL_CYTOPLASM_BPGSP_B23PG.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_BPGSPP_P2GA Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP_P2GA -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSP_B23PG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSP_B23PG 1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP7 )
	{
		Name	BPGSP7;
		Name	BPGSP7;
		#StepperID	0.0;
		#Priority	0.0;
		k12	1000.0;
		k13	1800000.0;
		Expression	"(k12 * Variable__CELL_CYTOPLASM_BPGSP_B23PG.NumberConc - k13 * ((1 + pow(10, -6.8) / pow(10, -7.2)) / (1 + pow(10, -6.8) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) * Variable__CELL_CYTOPLASM_BPGSP.NumberConc * Variable__CELL_CYTOPLASM_f23DPG.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_BPGSP_B23PG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSP_B23PG -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSP       1  ]
			[ Variable__CELL_CYTOPLASM_f23DPG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG      1  ]
			[ Variable__CELL_CYTOPLASM_pHi         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi         0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP8 )
	{
		Name	BPGSP8;
		Name	BPGSP8;
		#StepperID	0.0;
		#Priority	0.0;
		k14	1000000000.0;
		k15	610000.0;
		Expression	"(k14 * Variable__CELL_CYTOPLASM_BPGSPP.NumberConc * Variable__CELL_CYTOPLASM_Pi.NumberConc - k15 * Variable__CELL_CYTOPLASM_BPGSPP_Phos.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_BPGSPP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP      -1 ]
			[ Variable__CELL_CYTOPLASM_Pi          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi          -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSPP_Phos Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP_Phos 1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_BPGSP9 )
	{
		Name	BPGSP9;
		Name	BPGSP9;
		#StepperID	0.0;
		#Priority	0.0;
		k16	0.19;
		Expression	"k16 * Variable__CELL_CYTOPLASM_BPGSPP_Phos.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_BPGSPP_Phos Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSPP_Phos -1 ]
			[ Variable__CELL_CYTOPLASM_BPGSP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_BPGSP       1  ]
			[ Variable__CELL_CYTOPLASM_Pi          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi          2  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme   0  ]
			[ N_A                                  Variable:/SBMLParameter:N_A                                           0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_6PGLase )
	{
		Name	E_6PGLase;
		Name	E_6PGLase;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.079882812;
		Vm	2251.8;
		Expression	"1000 * Variable__CELL_CYTOPLASM_GL6P.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_GL6P.NumberConc) * Vm * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_GL6P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GL6P      -1 ]
			[ Variable__CELL_CYTOPLASM_GO6P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GO6P      1  ]
			[ Variable__CELL_CYTOPLASM_E_6PGLase Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_6PGLase 0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_6PGODH )
	{
		Name	E_6PGODH;
		Name	E_6PGODH;
		#StepperID	0.0;
		#Priority	0.0;
		k1	2400000.0;
		k10	225000.0;
		k11	300.0;
		k12	4950000.0;
		k2	410.0;
		k3	2000000000.0;
		k4	26000.0;
		k5	48.0;
		k6	30.0;
		k7	630.0;
		k8	36000.0;
		k9	800.0;
		Expression	"Variable__CELL_CYTOPLASM_E_6PGODH.NumberConc * 1.000000e-13 * N_A.Value * (k1 * k3 * k5 * k7 * k9 * k11 * Variable__CELL_CYTOPLASM_NADP.NumberConc * Variable__CELL_CYTOPLASM_GO6P.NumberConc - k2 * k4 * k6 * k8 * k10 * k12 * Variable__CELL_CYTOPLASM_CO2.NumberConc * Variable__CELL_CYTOPLASM_RU5P.NumberConc * Variable__CELL_CYTOPLASM_NADPH.NumberConc) / (k2 * k9 * k11 * (k4 * k6 + k4 * k7 + k5 * k7) + k1 * k9 * k11 * (k4 * k6 + k4 * k7 + k5 * k7) * Variable__CELL_CYTOPLASM_NADP.NumberConc + k3 * k5 * k7 * k9 * k11 * Variable__CELL_CYTOPLASM_GO6P.NumberConc + k2 * k4 * k6 * k8 * k11 * Variable__CELL_CYTOPLASM_CO2.NumberConc + k2 * k9 * k12 * (k4 * k6 + k4 * k7 + k5 * k7) * Variable__CELL_CYTOPLASM_NADPH.NumberConc + k1 * k3 * (k5 * k9 * k11 + k6 * k9 * k11 + k7 * k9 * k11 + k5 * k7 * k9 + k5 * k7 * k11) * Variable__CELL_CYTOPLASM_NADP.NumberConc * Variable__CELL_CYTOPLASM_GO6P.NumberConc + k1 * k4 * k6 * k8 * k11 * Variable__CELL_CYTOPLASM_NADP.NumberConc * Variable__CELL_CYTOPLASM_CO2.NumberConc + k3 * k5 * k7 * k9 * k12 * Variable__CELL_CYTOPLASM_GO6P.NumberConc * Variable__CELL_CYTOPLASM_NADPH.NumberConc + k2 * k4 * k6 * k8 * k10 * Variable__CELL_CYTOPLASM_CO2.NumberConc * Variable__CELL_CYTOPLASM_RU5P.NumberConc + k2 * k4 * k6 * k8 * k12 * Variable__CELL_CYTOPLASM_CO2.NumberConc * Variable__CELL_CYTOPLASM_NADPH.NumberConc + k2 * k10 * k12 * (k4 * k6 + k4 * k7 + k5 * k7) * Variable__CELL_CYTOPLASM_RU5P.NumberConc * Variable__CELL_CYTOPLASM_NADPH.NumberConc + k1 * k3 * k8 * k11 * (k5 + k6) * Variable__CELL_CYTOPLASM_NADP.NumberConc * Variable__CELL_CYTOPLASM_GO6P.NumberConc * Variable__CELL_CYTOPLASM_CO2.NumberConc + k1 * k3 * k5 * k7 * k10 * Variable__CELL_CYTOPLASM_NADP.NumberConc * Variable__CELL_CYTOPLASM_GO6P.NumberConc * Variable__CELL_CYTOPLASM_RU5P.NumberConc + k1 * k4 * k6 * k8 * k10 * Variable__CELL_CYTOPLASM_NADP.NumberConc * Variable__CELL_CYTOPLASM_CO2.NumberConc * Variable__CELL_CYTOPLASM_RU5P.NumberConc + k3 * k5 * k7 * k10 * k12 * Variable__CELL_CYTOPLASM_GO6P.NumberConc * Variable__CELL_CYTOPLASM_RU5P.NumberConc * Variable__CELL_CYTOPLASM_NADPH.NumberConc + k8 * k10 * k12 * (k2 * k4 + k2 * k5 + k2 * k6 + k4 * k6) * Variable__CELL_CYTOPLASM_CO2.NumberConc * Variable__CELL_CYTOPLASM_RU5P.NumberConc * Variable__CELL_CYTOPLASM_NADPH.NumberConc + k1 * k3 * k8 * k10 * (k5 + k6) * Variable__CELL_CYTOPLASM_NADP.NumberConc * Variable__CELL_CYTOPLASM_GO6P.NumberConc * Variable__CELL_CYTOPLASM_CO2.NumberConc * Variable__CELL_CYTOPLASM_RU5P.NumberConc + k3 * k8 * k10 * k12 * (k5 + k6) * Variable__CELL_CYTOPLASM_GO6P.NumberConc * Variable__CELL_CYTOPLASM_CO2.NumberConc * Variable__CELL_CYTOPLASM_RU5P.NumberConc * Variable__CELL_CYTOPLASM_NADPH.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_NADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADP      -1 ]
			[ Variable__CELL_CYTOPLASM_GO6P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GO6P      -1 ]
			[ Variable__CELL_CYTOPLASM_RU5P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_RU5P      1  ]
			[ Variable__CELL_CYTOPLASM_NADPH     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADPH     1  ]
			[ Variable__CELL_CYTOPLASM_E_6PGODH  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_6PGODH  0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__CELL_CYTOPLASM_CO2       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_CO2       0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_ADA )
	{
		Name	E_ADA;
		Name	E_ADA;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.052;
		Vm	20.0;
		Expression	"1000 * Variable__CELL_CYTOPLASM_ADO.NumberConc * Vm * 1.000000e-13 * N_A.Value / (Km + 1000 * Variable__CELL_CYTOPLASM_ADO.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_ADO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADO       -1 ]
			[ Variable__CELL_CYTOPLASM_INO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_INO       1  ]
			[ Variable__CELL_CYTOPLASM_E_ADA     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_ADA     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_ADPRT )
	{
		Name	E_ADPRT;
		Name	E_ADPRT;
		#StepperID	0.0;
		#Priority	0.0;
		KmA	0.0023;
		KmB	0.0195;
		Vm	0.078;
		Expression	"Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 * (1000 * Variable__CELL_CYTOPLASM_ADE.NumberConc / (KmA + 1000 * Variable__CELL_CYTOPLASM_ADE.NumberConc)) * (1000 * Variable__CELL_CYTOPLASM_PRPP.NumberConc / (KmB + 1000 * Variable__CELL_CYTOPLASM_PRPP.NumberConc)) * Vm * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_E_ADPRT.NumberConc * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_ADE       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADE       -1 ]
			[ Variable__CELL_CYTOPLASM_PRPP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PRPP      -1 ]
			[ Variable__CELL_CYTOPLASM_fAMP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fAMP      1  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        2  ]
			[ Variable__CELL_CYTOPLASM_E_ADPRT   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_ADPRT   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_AK )
	{
		Name	E_AK;
		Name	E_AK;
		#StepperID	0.0;
		#Priority	0.0;
		KiA	0.54;
		KmA	1.75;
		KmB	27.0;
		Vm	0.55;
		Expression	"Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000000 * (Vm * 1000000 * Variable__CELL_CYTOPLASM_ADO.NumberConc * 1000000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KiA * KmB + KmA * 1000000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc + KmB * 1000000 * Variable__CELL_CYTOPLASM_ADO.NumberConc + 1000000 * Variable__CELL_CYTOPLASM_ADO.NumberConc * 1000000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc)) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_ADO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADO       -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     1  ]
			[ Variable__CELL_CYTOPLASM_fAMP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fAMP      1  ]
			[ Variable__CELL_CYTOPLASM_E_AK      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_AK      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_ALD )
	{
		Name	E_ALD;
		Name	E_ALD;
		#StepperID	0.0;
		#Priority	0.0;
		KiA	19.8;
		KiI	1500.0;
		KiQ	11.0;
		KmA	16.5;
		KmP	190.0;
		KmQ	35.0;
		kcatf	68.0;
		kcatr	234.0;
		Expression	"Variable__CELL_CYTOPLASM_E_ALD.NumberConc * 1.000000e-13 * N_A.Value * ((kcatf * (1000000 * Variable__CELL_CYTOPLASM_FDP.NumberConc / KmA) - kcatr * (1000000 * Variable__CELL_CYTOPLASM_GA3P.NumberConc / KmP) * (1000000 * Variable__CELL_CYTOPLASM_DHAP.NumberConc / KiQ)) / (1 + 1000000 * Variable__CELL_CYTOPLASM_f23DPG.NumberConc / KiI + 1000000 * Variable__CELL_CYTOPLASM_FDP.NumberConc / KmA + KmQ * (1000000 * Variable__CELL_CYTOPLASM_GA3P.NumberConc / KmP) / KiQ + 1 + 1000000 * Variable__CELL_CYTOPLASM_f23DPG.NumberConc / KiI + 1000000 * Variable__CELL_CYTOPLASM_DHAP.NumberConc / KiQ + KmQ * (1000000 * Variable__CELL_CYTOPLASM_FDP.NumberConc / KiA) * (1000000 * Variable__CELL_CYTOPLASM_GA3P.NumberConc / KmP) / KiQ + 1000000 * Variable__CELL_CYTOPLASM_GA3P.NumberConc / KmP * (1000000 * Variable__CELL_CYTOPLASM_DHAP.NumberConc / KiQ))) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_FDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_FDP       -1 ]
			[ Variable__CELL_CYTOPLASM_GA3P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GA3P      1  ]
			[ Variable__CELL_CYTOPLASM_DHAP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_DHAP      1  ]
			[ Variable__CELL_CYTOPLASM_E_ALD     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_ALD     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__CELL_CYTOPLASM_f23DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG    0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_AMPDA )
	{
		Name	E_AMPDA;
		Name	E_AMPDA;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.8;
		Vm	0.01;
		Expression	"1000 * Variable__CELL_CYTOPLASM_fAMP.NumberConc * Vm * 1.000000e-13 * N_A.Value / (Km + 1000 * Variable__CELL_CYTOPLASM_fAMP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_fAMP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fAMP      -1 ]
			[ Variable__CELL_CYTOPLASM_IMP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_IMP       1  ]
			[ Variable__CELL_CYTOPLASM_E_AMPDA   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_AMPDA   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_AMPase )
	{
		Name	E_AMPase;
		Name	E_AMPase;
		#StepperID	0.0;
		#Priority	0.0;
		k	1.58;
		Expression	"k * Variable__CELL_CYTOPLASM_fAMP.NumberConc * (Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 3600) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_fAMP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fAMP      -1 ]
			[ Variable__CELL_CYTOPLASM_ADO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADO       1  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        1  ]
			[ Variable__CELL_CYTOPLASM_E_AMPase  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_AMPase  0  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_APK )
	{
		Name	E_APK;
		Name	E_APK;
		#StepperID	0.0;
		#Priority	0.0;
		KmA	0.01;
		KmB	0.1;
		KmP	0.11;
		KmQ	0.067;
		kcatf	2080.0;
		kcatr	3800.0;
		Expression	"Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 * Variable__CELL_CYTOPLASM_E_APK.NumberConc * 1.000000e-13 * N_A.Value * ((kcatf * (1000 * Variable__CELL_CYTOPLASM_fADP.NumberConc / KmA) * (1000 * Variable__CELL_CYTOPLASM_MgADP.NumberConc / KmB) - kcatr * (1000 * Variable__CELL_CYTOPLASM_fAMP.NumberConc / KmP) * (1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / KmQ)) / (1 + 1000 * Variable__CELL_CYTOPLASM_fADP.NumberConc / KmA + 1000 * Variable__CELL_CYTOPLASM_MgADP.NumberConc / KmB + 1000 * Variable__CELL_CYTOPLASM_fADP.NumberConc / KmA * (1000 * Variable__CELL_CYTOPLASM_MgADP.NumberConc / KmB) + 1000 * Variable__CELL_CYTOPLASM_fAMP.NumberConc / KmP + 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / KmQ + 1000 * Variable__CELL_CYTOPLASM_fAMP.NumberConc / KmP * (1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / KmQ))) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_fADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fADP      -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     -1 ]
			[ Variable__CELL_CYTOPLASM_fAMP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fAMP      1  ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     1  ]
			[ Variable__CELL_CYTOPLASM_E_APK     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_APK     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_ATPase )
	{
		Name	E_ATPase;
		Name	E_ATPase;
		#StepperID	0.0;
		#Priority	0.0;
		k	0.356;
		Expression	"Variable__CELL_CYTOPLASM_MgATP.NumberConc * k * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value * 2 / 1000 / 3600 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     1  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        1  ]
			[ Variable__CELL_CYTOPLASM_E_ATPase  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_ATPase  0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_EN )
	{
		Name	E_EN;
		Name	E_EN;
		#StepperID	0.0;
		#Priority	0.0;
		KiMg	460.0;
		KiPEP	310.0;
		KiPG	140.0;
		KmMg	46.0;
		KmPEP	310.0;
		KmPG	140.0;
		kcatf	190.0;
		kcatr	50.0;
		Expression	"Variable__CELL_CYTOPLASM_E_EN.NumberConc * 1.000000e-13 * N_A.Value * ((kcatf * (1000000 * Variable__CELL_CYTOPLASM__2PG.NumberConc / KmPG) * (1000000 * Variable__CELL_CYTOPLASM_Mg.NumberConc / KiMg) - kcatr * (1000000 * Variable__CELL_CYTOPLASM_Mg.NumberConc / KmMg) * (1000000 * Variable__CELL_CYTOPLASM_PEP.NumberConc / KiPEP)) / (1 + 1000000 * Variable__CELL_CYTOPLASM__2PG.NumberConc / KiPG + 1000000 * Variable__CELL_CYTOPLASM_Mg.NumberConc / KiMg + 1000000 * Variable__CELL_CYTOPLASM__2PG.NumberConc / KmPG * (1000000 * Variable__CELL_CYTOPLASM_Mg.NumberConc / KiMg) + 1000000 * Variable__CELL_CYTOPLASM_PEP.NumberConc / KiPEP + 1000000 * Variable__CELL_CYTOPLASM_Mg.NumberConc / KmMg * (1000000 * Variable__CELL_CYTOPLASM_PEP.NumberConc / KiPEP))) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM__2PG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__2PG      -1 ]
			[ Variable__CELL_CYTOPLASM_PEP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PEP       1  ]
			[ Variable__CELL_CYTOPLASM_E_EN      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_EN      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_G6PDH )
	{
		Name	E_G6PDH;
		Name	E_G6PDH;
		#StepperID	0.0;
		#Priority	0.0;
		K_ATP	749.0;
		K_DPG	2289.0;
		K_G6P	66.7;
		K_GSSG	0.0;
		K_NADP	3.67;
		K_NADPH	3.12;
		Vm	64.0;
		Expression	"Vm * (1000000 * Variable__CELL_CYTOPLASM_NADP.NumberConc * 1000000 * Variable__CELL_CYTOPLASM_G6P.NumberConc / (K_NADP * K_G6P)) / (1 + 1000000 * Variable__CELL_CYTOPLASM_NADP.NumberConc * (1 + 1000000 * Variable__CELL_CYTOPLASM_G6P.NumberConc / K_G6P) / K_NADP + 1000000 * Variable__CELL_CYTOPLASM_NADPH.NumberConc / K_NADPH + 1000000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / K_ATP + 1000000 * Variable__CELL_CYTOPLASM_f23DPG.NumberConc / K_DPG) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_NADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADP      -1 ]
			[ Variable__CELL_CYTOPLASM_G6P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_G6P       -1 ]
			[ Variable__CELL_CYTOPLASM_GL6P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GL6P      1  ]
			[ Variable__CELL_CYTOPLASM_NADPH     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADPH     1  ]
			[ Variable__CELL_CYTOPLASM_E_G6PDH   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_G6PDH   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     0  ]
			[ Variable__CELL_CYTOPLASM_f23DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG    0  ]
			[ Variable__CELL_CYTOPLASM_GSH       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSH       0  ]
			[ Variable__CELL_CYTOPLASM_GSSG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSSG      0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_GAPDH )
	{
		Name	E_GAPDH;
		Name	E_GAPDH;
		#StepperID	0.0;
		#Priority	0.0;
		KiB13PG	0.01;
		KiGraP	0.065;
		KiNAD	4.5e-05;
		KiNADH	1e-05;
		KiPhos	0.00316;
		KidB13PG	1e-06;
		KidGraP	3.1e-05;
		KmB13PG	6.71e-07;
		KmGraP	9.5e-05;
		KmNAD	4.5e-05;
		KmNADH	3.3e-06;
		KmPhos	0.00316;
		kcatf	232.0;
		kcatr	2765.0;
		Expression	"Variable__CELL_CYTOPLASM_E_GAPDH.NumberConc / (Variable__CELL_CYTOPLASM_GA3P.NumberConc / (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) * (1 + Variable__CELL_CYTOPLASM_GA3P.NumberConc / KidGraP) + Variable__CELL_CYTOPLASM__13DPG.NumberConc / (KiB13PG * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) * (1 + Variable__CELL_CYTOPLASM_GA3P.NumberConc / KidGraP) + KmB13PG * Variable__CELL_CYTOPLASM_NADH.NumberConc / (KiB13PG * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * KmNADH * (pow(10, -7.2) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) + KmGraP * Variable__CELL_CYTOPLASM_NAD.NumberConc * Variable__CELL_CYTOPLASM_Pi.NumberConc / (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * KmNAD * KiPhos) + Variable__CELL_CYTOPLASM_NAD.NumberConc * Variable__CELL_CYTOPLASM_GA3P.NumberConc / (KiNAD * (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)))) + Variable__CELL_CYTOPLASM_Pi.NumberConc * Variable__CELL_CYTOPLASM_GA3P.NumberConc / (KiPhos * (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)))) * (1 + Variable__CELL_CYTOPLASM_GA3P.NumberConc / KidGraP) + Variable__CELL_CYTOPLASM_NAD.NumberConc * Variable__CELL_CYTOPLASM__13DPG.NumberConc / (KiNAD * (KiB13PG * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)))) + KmB13PG * Variable__CELL_CYTOPLASM_Pi.NumberConc * Variable__CELL_CYTOPLASM_NADH.NumberConc / (KiPhos * (KiB13PG * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) * KmNADH * (pow(10, -7.2) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) + Variable__CELL_CYTOPLASM_GA3P.NumberConc * Variable__CELL_CYTOPLASM_NADH.NumberConc / (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * KiNADH * (pow(10, -7.2) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) + Variable__CELL_CYTOPLASM__13DPG.NumberConc * Variable__CELL_CYTOPLASM_NADH.NumberConc / (KiB13PG * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * KmNADH * (pow(10, -7.2) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) + Variable__CELL_CYTOPLASM_NAD.NumberConc * Variable__CELL_CYTOPLASM_Pi.NumberConc * Variable__CELL_CYTOPLASM_GA3P.NumberConc / (KmNAD * KiPhos * (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)))) + KmGraP * Variable__CELL_CYTOPLASM_NAD.NumberConc * Variable__CELL_CYTOPLASM_Pi.NumberConc * Variable__CELL_CYTOPLASM__13DPG.NumberConc / (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * KmNAD * KiPhos * KidB13PG) + Variable__CELL_CYTOPLASM_Pi.NumberConc * Variable__CELL_CYTOPLASM_GA3P.NumberConc * Variable__CELL_CYTOPLASM_NADH.NumberConc / (KiPhos * (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) * KiNADH * (pow(10, -7.2) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value))) + KmB13PG * Variable__CELL_CYTOPLASM_Pi.NumberConc * Variable__CELL_CYTOPLASM__13DPG.NumberConc * Variable__CELL_CYTOPLASM_NADH.NumberConc / (KiB13PG * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * KmNADH * (pow(10, -7.2) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * KiPhos * KidB13PG)) * (kcatf * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * Variable__CELL_CYTOPLASM_GA3P.NumberConc * Variable__CELL_CYTOPLASM_Pi.NumberConc * Variable__CELL_CYTOPLASM_NAD.NumberConc / (KmNAD * KiPhos * (KiGraP * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)))) - kcatr * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * Variable__CELL_CYTOPLASM__13DPG.NumberConc * Variable__CELL_CYTOPLASM_NADH.NumberConc / (KiB13PG * 2.997 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.5) + pow(10, -10) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * KmNADH * (pow(10, -7.2) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)))) * (1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_GA3P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GA3P      -1 ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        -1 ]
			[ Variable__CELL_CYTOPLASM_NAD       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NAD       -1 ]
			[ Variable__CELL_CYTOPLASM__13DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__13DPG    1  ]
			[ Variable__CELL_CYTOPLASM_NADH      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADH      1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_E_GAPDH   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_GAPDH   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_GLC )
	{
		Name	E_GLC;
		Name	E_GLC;
		#StepperID	0.0;
		#Priority	0.0;
		HK	2.5e-08;
		K_GSSG	0.0;
		KdiB23PG	0.0027;
		KdiGSH	0.003;
		KdiGlc16P2	1e-05;
		KdiGlc6P	1e-05;
		KiGlc	4.7e-05;
		KiGlc6P	4.7e-05;
		KiMgADP	0.001;
		KiMgATP	0.001;
		KmMgADP	0.001;
		KmMgATP	0.001;
		SW	0.0;
		kcatf	180.0;
		kcatr	1.16;
		Expression	"Variable__CELL_CYTOPLASM_GSH.NumberConc / Variable__CELL_CYTOPLASM_GSSG.NumberConc / (K_GSSG + Variable__CELL_CYTOPLASM_GSH.NumberConc / Variable__CELL_CYTOPLASM_GSSG.NumberConc) * (HK / (1 + Variable__CELL_CYTOPLASM_MgATP.NumberConc / KiMgATP + Variable__CELL_CYTOPLASM_GLC.NumberConc / KiGlc + Variable__CELL_CYTOPLASM_MgATP.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KiGlc * KmMgATP) + Variable__CELL_CYTOPLASM_MgADP.NumberConc / KiMgADP + Variable__CELL_CYTOPLASM_G6P.NumberConc / KiGlc6P + Variable__CELL_CYTOPLASM_MgADP.NumberConc * Variable__CELL_CYTOPLASM_G6P.NumberConc / (KiGlc6P * KmMgADP) + Variable__CELL_CYTOPLASM_f23DPG.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KdiB23PG * KiGlc) + Variable__CELL_CYTOPLASM_GDP.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KdiGlc16P2 * KiGlc) + Variable__CELL_CYTOPLASM_G6P.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KdiGlc6P * KiGlc) + Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KdiGSH * KiGlc))) * (kcatf * 1.662 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.02) + pow(10, -9.55) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * Variable__CELL_CYTOPLASM_GLC.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KiGlc * KmMgATP) - kcatr * 1.662 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.02) + pow(10, -9.55) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * Variable__CELL_CYTOPLASM_G6P.NumberConc * Variable__CELL_CYTOPLASM_MgADP.NumberConc / (KiGlc6P * KmMgADP)) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 * SW / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_GLC       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GLC       1 ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     0 ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0 ]
			[ Variable__CELL_CYTOPLASM_f23DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG    0 ]
			[ Variable__CELL_CYTOPLASM_GDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GDP       0 ]
			[ Variable__CELL_CYTOPLASM_GSH       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSH       0 ]
			[ Variable__CELL_CYTOPLASM_GSSG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSSG      0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__CELL_CYTOPLASM_G6P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_G6P       0 ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_GSH_S )
	{
		Name	E_GSH_S;
		Name	E_GSH_S;
		#StepperID	0.0;
		#Priority	0.0;
		KmA	0.99;
		KmB	1.37;
		KmC	0.23;
		Vmf	88.4;
		alpha	2.6;
		Expression	"1 * Vmf * 1.000000e-13 * N_A.Value * (1000 * Variable__CELL_CYTOPLASM_L_GC.NumberConc * 1000 * Variable__CELL_CYTOPLASM_glycine.NumberConc * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (alpha * KmA * KmB * KmC)) / (1 + 1000 * Variable__CELL_CYTOPLASM_L_GC.NumberConc / KmA + 1000 * Variable__CELL_CYTOPLASM_L_GC.NumberConc * 1000 * Variable__CELL_CYTOPLASM_glycine.NumberConc / (KmA * KmB) + 1000 * Variable__CELL_CYTOPLASM_L_GC.NumberConc * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KmA * KmC) + 1000 * Variable__CELL_CYTOPLASM_L_GC.NumberConc * 1000 * Variable__CELL_CYTOPLASM_glycine.NumberConc * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (alpha * KmA * KmB * KmC)) * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_L_GC      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_L_GC      -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     -1 ]
			[ Variable__CELL_CYTOPLASM_GSH       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSH       1  ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     1  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        1  ]
			[ Variable__CELL_CYTOPLASM_E_GSH_S   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_GSH_S   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__CELL_CYTOPLASM_glycine   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_glycine   0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_GSSGR )
	{
		Name	E_GSSGR;
		Name	E_GSSGR;
		#StepperID	0.0;
		#Priority	0.0;
		k1	85000000.0;
		k10	50000000.0;
		k11	7000.0;
		k12	100000000.0;
		k2	510.0;
		k3	100000000.0;
		k4	560000.0;
		k5	810.0;
		k6	1000.0;
		k7	1000000.0;
		k8	50000000.0;
		k9	1000000.0;
		Expression	"Variable__CELL_CYTOPLASM_E_GSSGR.NumberConc * 1.000000e-13 * N_A.Value * (k1 * k3 * k5 * k7 * k9 * k11 * Variable__CELL_CYTOPLASM_NADPH.NumberConc * Variable__CELL_CYTOPLASM_GSSG.NumberConc - k2 * k4 * k6 * k8 * k10 * k12 * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_NADP.NumberConc) / (k2 * k9 * k11 * (k4 * k6 + k4 * k7 + k5 * k7) + k1 * k9 * k11 * (k4 * k6 + k4 * k7 + k5 * k7) * Variable__CELL_CYTOPLASM_NADPH.NumberConc + k3 * k5 * k7 * k9 * k11 * Variable__CELL_CYTOPLASM_GSSG.NumberConc + k2 * k4 * k6 * k8 * k11 * Variable__CELL_CYTOPLASM_GSH.NumberConc + k2 * k9 * k12 * (k4 * k6 + k4 * k7 + k5 * k7) * Variable__CELL_CYTOPLASM_NADP.NumberConc + k1 * k3 * (k5 * k9 * k11 + k6 * k9 * k11 + k7 * k9 * k11 + k5 * k7 * k9 + k5 * k7 * k11) * Variable__CELL_CYTOPLASM_NADPH.NumberConc * Variable__CELL_CYTOPLASM_GSSG.NumberConc + k1 * k4 * k6 * k8 * k11 * Variable__CELL_CYTOPLASM_NADPH.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc + k3 * k5 * k7 * k9 * k12 * Variable__CELL_CYTOPLASM_GSSG.NumberConc * Variable__CELL_CYTOPLASM_NADP.NumberConc + k2 * k4 * k6 * k8 * k10 * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc + (k2 * k4 * k6 * k8 * k12 + k2 * k10 * k12 * (k4 * k6 + k4 * k7 + k5 * k7)) * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_NADP.NumberConc + (k1 * k3 * k8 * k11 * (k5 + k6) + k1 * k3 * k5 * k7 * k10) * Variable__CELL_CYTOPLASM_NADPH.NumberConc * Variable__CELL_CYTOPLASM_GSSG.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc + k1 * k4 * k6 * k8 * k10 * Variable__CELL_CYTOPLASM_NADPH.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc + k3 * k5 * k7 * k10 * k12 * Variable__CELL_CYTOPLASM_GSSG.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_NADP.NumberConc + k8 * k10 * k12 * (k2 * k4 + k2 * k5 + k2 * k6 + k4 * k6) * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_NADP.NumberConc + k1 * k3 * k8 * k10 * (k5 + k6) * Variable__CELL_CYTOPLASM_NADPH.NumberConc * Variable__CELL_CYTOPLASM_GSSG.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc + k3 * k8 * k10 * k12 * (k5 + k6) * Variable__CELL_CYTOPLASM_GSSG.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_NADP.NumberConc) * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_NADPH     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADPH     -1 ]
			[ Variable__CELL_CYTOPLASM_GSSG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSSG      -1 ]
			[ Variable__CELL_CYTOPLASM_NADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADP      1  ]
			[ Variable__CELL_CYTOPLASM_GSH       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSH       2  ]
			[ Variable__CELL_CYTOPLASM_E_GSSGR   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_GSSGR   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_GSSG_transport )
	{
		Name	E_GSSG_transport;
		Name	E_GSSG_transport;
		#StepperID	0.0;
		#Priority	0.0;
		Km1	7.1;
		Km2	0.1;
		Kmatp	0.63;
		Vmax1	20.0;
		Vmax2	190.0;
		Expression	"Vmax2 * (1000 * Variable__CELL_CYTOPLASM_GSSG.NumberConc / (1000 * Variable__CELL_CYTOPLASM_GSSG.NumberConc + Km2)) * (1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc + Kmatp)) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000000 / 3600 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_GSSG             Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSSG             -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP            Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP            -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP            Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP            1  ]
			[ Variable__CELL_CYTOPLASM_Pi               Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi               1  ]
			[ Variable__CELL_CYTOPLASM_E_GSSG_transport Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_GSSG_transport 0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme        0  ]
			[ N_A                                       Variable:/SBMLParameter:N_A                                                0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_HGPRT )
	{
		Name	E_HGPRT;
		Name	E_HGPRT;
		#StepperID	0.0;
		#Priority	0.0;
		KmA	0.005;
		KmB	0.22;
		Vm	0.201;
		Expression	"Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 * (1000 * Variable__CELL_CYTOPLASM_PRPP.NumberConc / (KmA + 1000 * Variable__CELL_CYTOPLASM_PRPP.NumberConc)) * (1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc / (KmB + 1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc)) * Vm * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_E_HGPRT.NumberConc * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_PRPP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PRPP      -1 ]
			[ Variable__CELL_CYTOPLASM_HXi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_HXi       -1 ]
			[ Variable__CELL_CYTOPLASM_IMP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_IMP       1  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        2  ]
			[ Variable__CELL_CYTOPLASM_E_HGPRT   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_HGPRT   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_HK )
	{
		Name	E_HK;
		Name	E_HK;
		#Priority	0.0;
		#StepperID	0.0;
		HK	2.5e-08;
		K_GSSG	0.0;
		KdiB23PG	0.0027;
		KdiGSH	0.003;
		KdiGlc16P2	1e-05;
		KdiGlc6P	1e-05;
		KiGlc	4.7e-05;
		KiGlc6P	4.7e-05;
		KiMgADP	0.001;
		KiMgATP	0.001;
		KmMgADP	0.001;
		KmMgATP	0.001;
		kcatf	180.0;
		kcatr	1.16;
		Expression	"Variable__CELL_CYTOPLASM_GSH.NumberConc / Variable__CELL_CYTOPLASM_GSSG.NumberConc / (K_GSSG + Variable__CELL_CYTOPLASM_GSH.NumberConc / Variable__CELL_CYTOPLASM_GSSG.NumberConc) * (HK / (1 + Variable__CELL_CYTOPLASM_MgATP.NumberConc / KiMgATP + Variable__CELL_CYTOPLASM_GLC.NumberConc / KiGlc + Variable__CELL_CYTOPLASM_MgATP.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KiGlc * KmMgATP) + Variable__CELL_CYTOPLASM_MgADP.NumberConc / KiMgADP + Variable__CELL_CYTOPLASM_G6P.NumberConc / KiGlc6P + Variable__CELL_CYTOPLASM_MgADP.NumberConc * Variable__CELL_CYTOPLASM_G6P.NumberConc / (KiGlc6P * KmMgADP) + Variable__CELL_CYTOPLASM_f23DPG.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KdiB23PG * KiGlc) + Variable__CELL_CYTOPLASM_GDP.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KdiGlc16P2 * KiGlc) + Variable__CELL_CYTOPLASM_G6P.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KdiGlc6P * KiGlc) + Variable__CELL_CYTOPLASM_GSH.NumberConc * Variable__CELL_CYTOPLASM_GLC.NumberConc / (KdiGSH * KiGlc))) * (kcatf * 1.662 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.02) + pow(10, -9.55) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * Variable__CELL_CYTOPLASM_GLC.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KiGlc * KmMgATP) - kcatr * 1.662 / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / pow(10, -7.02) + pow(10, -9.55) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value)) * Variable__CELL_CYTOPLASM_G6P.NumberConc * Variable__CELL_CYTOPLASM_MgADP.NumberConc / (KiGlc6P * KmMgADP)) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_GLC       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GLC       -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     -1 ]
			[ Variable__CELL_CYTOPLASM_G6P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_G6P       1  ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_f23DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG    0  ]
			[ Variable__CELL_CYTOPLASM_GDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GDP       0  ]
			[ Variable__CELL_CYTOPLASM_GSH       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSH       0  ]
			[ Variable__CELL_CYTOPLASM_GSSG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSSG      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_IMPase )
	{
		Name	E_IMPase;
		Name	E_IMPase;
		#StepperID	0.0;
		#Priority	0.0;
		k	0.09;
		Expression	"k * Variable__CELL_CYTOPLASM_IMP.NumberConc * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 3600) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_IMP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_IMP       -1 ]
			[ Variable__CELL_CYTOPLASM_INO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_INO       1  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        1  ]
			[ Variable__CELL_CYTOPLASM_E_IMPase  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_IMPase  0  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_LDH )
	{
		Name	E_LDH;
		Name	E_LDH;
		#StepperID	0.0;
		#Priority	0.0;
		Kcatf	458.0;
		Kcatr	115.0;
		KiLAC	7330.0;
		KiNAD	503.0;
		KiNADH	2.45;
		KiaPYR	228.0;
		KibPYR	101.0;
		KmLAC	1070.0;
		KmNAD	107.0;
		KmNADH	8.44;
		KmPYR	137.0;
		Expression	"1 * ((Kcatf * (1000000 * Variable__CELL_CYTOPLASM_NADH.NumberConc / KiNADH) * (1000000 * Variable__CELL_CYTOPLASM_PYRi.NumberConc / KmPYR) - Kcatr * (1000000 * Variable__CELL_CYTOPLASM_NAD.NumberConc / KiNAD) * (1000000 * Variable__CELL_CYTOPLASM_LACi.NumberConc / KmLAC)) / ((1 + 1000000 * Variable__CELL_CYTOPLASM_PYRi.NumberConc / KmPYR * (KmNADH / KiNADH) + 1000000 * Variable__CELL_CYTOPLASM_LACi.NumberConc / KmLAC * (KmNAD / KiNAD)) * (1 + 1000000 * Variable__CELL_CYTOPLASM_PYRi.NumberConc / KibPYR) + 1000000 * Variable__CELL_CYTOPLASM_NADH.NumberConc / KiNADH + 1000000 * Variable__CELL_CYTOPLASM_NAD.NumberConc / KiNAD + 1000000 * Variable__CELL_CYTOPLASM_NADH.NumberConc / KiNADH * (1000000 * Variable__CELL_CYTOPLASM_PYRi.NumberConc / KmPYR) + 1000000 * Variable__CELL_CYTOPLASM_NADH.NumberConc / KiNADH * (1000000 * Variable__CELL_CYTOPLASM_LACi.NumberConc / KmLAC) * (KmNAD / KiNAD) + 1000000 * Variable__CELL_CYTOPLASM_NAD.NumberConc / KiNAD * (1000000 * Variable__CELL_CYTOPLASM_LACi.NumberConc / KmLAC) * (KmNADH / KiNADH) + 1000000 * Variable__CELL_CYTOPLASM_LACi.NumberConc / KmLAC * (1000000 * Variable__CELL_CYTOPLASM_NAD.NumberConc / KiNAD) + 1000000 * Variable__CELL_CYTOPLASM_NADH.NumberConc / KiNADH * (1000000 * Variable__CELL_CYTOPLASM_PYRi.NumberConc / KmPYR) * (1000000 * Variable__CELL_CYTOPLASM_LACi.NumberConc / KiLAC) + 1000000 * Variable__CELL_CYTOPLASM_PYRi.NumberConc / KiaPYR * (1000000 * Variable__CELL_CYTOPLASM_LACi.NumberConc / KmLAC) * (1000000 * Variable__CELL_CYTOPLASM_NAD.NumberConc / KiNAD))) * Variable__CELL_CYTOPLASM_E_LDH.NumberConc * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_PYRi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PYRi      -1 ]
			[ Variable__CELL_CYTOPLASM_NADH      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADH      -1 ]
			[ Variable__CELL_CYTOPLASM_LACi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_LACi      1  ]
			[ Variable__CELL_CYTOPLASM_NAD       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NAD       1  ]
			[ Variable__CELL_CYTOPLASM_E_LDH     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_LDH     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_LDH2 )
	{
		Name	E_LDH2;
		Name	E_LDH2;
		#StepperID	0.0;
		#Priority	0.0;
		KmLac	0.000414;
		KmPyr	0.000414;
		kf	0.00346;
		kr	5.43e-07;
		Expression	"Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value * (1 / (1 + Variable__CELL_CYTOPLASM_PYRi.NumberConc / KmPyr + Variable__CELL_CYTOPLASM_LACi.NumberConc / KmLac)) * (kf * Variable__CELL_CYTOPLASM_PYRi.NumberConc * Variable__CELL_CYTOPLASM_NADPH.NumberConc / KmPyr - kr * Variable__CELL_CYTOPLASM_LACi.NumberConc * Variable__CELL_CYTOPLASM_NADP.NumberConc / KmLac) * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_PYRi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PYRi      -1 ]
			[ Variable__CELL_CYTOPLASM_NADPH     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADPH     -1 ]
			[ Variable__CELL_CYTOPLASM_LACi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_LACi      1  ]
			[ Variable__CELL_CYTOPLASM_NADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADP      1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_L_GCS )
	{
		Name	E_L_GCS;
		Name	E_L_GCS;
		#StepperID	0.0;
		#Priority	0.0;
		Ki	3.4;
		KmA	0.4;
		KmB	1.8;
		KmC	0.1;
		Vmf	50.0;
		alpha	0.2;
		Expression	"1 * Vmf * 1.000000e-13 * N_A.Value * (1000 * Variable__CELL_CYTOPLASM_glutamate.NumberConc * 1000 * Variable__CELL_CYTOPLASM_cysteine.NumberConc * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (alpha * KmA * (1 + 1000 * Variable__CELL_CYTOPLASM_GSH.NumberConc / Ki) * KmB * KmC) / (1 + 1000 * Variable__CELL_CYTOPLASM_glutamate.NumberConc / KmA + 1000 * Variable__CELL_CYTOPLASM_glutamate.NumberConc * 1000 * Variable__CELL_CYTOPLASM_cysteine.NumberConc / (KmA * KmB) + 1000 * Variable__CELL_CYTOPLASM_glutamate.NumberConc * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KmA * KmC) + 1000 * Variable__CELL_CYTOPLASM_glutamate.NumberConc * 1000 * Variable__CELL_CYTOPLASM_cysteine.NumberConc * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (alpha * KmA * KmB * KmC))) * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     1  ]
			[ Variable__CELL_CYTOPLASM_L_GC      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_L_GC      1  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        1  ]
			[ Variable__CELL_CYTOPLASM_E_L_GCS   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_L_GCS   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__CELL_CYTOPLASM_GSH       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSH       0  ]
			[ Variable__CELL_CYTOPLASM_glutamate Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_glutamate 0  ]
			[ Variable__CELL_CYTOPLASM_cysteine  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_cysteine  0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_PFK )
	{
		Name	E_PFK;
		Name	E_PFK;
		#StepperID	0.0;
		#Priority	0.0;
		KRAMP	3.5e-05;
		KRGlc16P2	1.51e-05;
		KRPhos	0.000431;
		KTATP	9.8e-06;
		KTB23PG	0.00144;
		KTMg	0.00044;
		K_GSSG	0.0;
		Ka	8.91250938134e-08;
		KmFru16P2	0.00042;
		KmFru6P	0.00027;
		KmMgADP	0.00054;
		KmMgATP	6.8e-05;
		kcatf	822.0;
		kcatr	36.0;
		n	2.0;
		Expression	"Variable__CELL_CYTOPLASM_E_PFK.NumberConc / ((1 + pow(pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) / Ka, n) * pow(1 + Variable__CELL_CYTOPLASM_fATP.NumberConc / KTATP, 4) * pow(1 + Variable__CELL_CYTOPLASM_Mg.NumberConc / KTMg, 4) * pow(1 + Variable__CELL_CYTOPLASM_f23DPG.NumberConc / KTB23PG, 4) / (pow(1 + Variable__CELL_CYTOPLASM_F6P.NumberConc / KmFru6P + Variable__CELL_CYTOPLASM_FDP.NumberConc / KmFru16P2, 4) * pow(1 + Variable__CELL_CYTOPLASM_fAMP.NumberConc / KRAMP, 4) * pow(1 + Variable__CELL_CYTOPLASM_Pi.NumberConc / KRPhos, 4) * pow(1 + Variable__CELL_CYTOPLASM_GDP.NumberConc / KRGlc16P2, 4))) * (1 + Variable__CELL_CYTOPLASM_F6P.NumberConc / KmFru6P + Variable__CELL_CYTOPLASM_MgATP.NumberConc / KmMgATP + Variable__CELL_CYTOPLASM_F6P.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KmFru6P * KmMgATP) + Variable__CELL_CYTOPLASM_FDP.NumberConc / KmFru16P2 + Variable__CELL_CYTOPLASM_MgADP.NumberConc / KmMgADP + Variable__CELL_CYTOPLASM_FDP.NumberConc * Variable__CELL_CYTOPLASM_MgADP.NumberConc / (KmFru16P2 * KmMgADP))) * (kcatf * Variable__CELL_CYTOPLASM_F6P.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KmFru6P * KmMgATP) - kcatf * Variable__CELL_CYTOPLASM_FDP.NumberConc * Variable__CELL_CYTOPLASM_MgADP.NumberConc / (KmFru16P2 * KmMgADP)) * (Variable__CELL_CYTOPLASM_GSH.NumberConc / Variable__CELL_CYTOPLASM_GSSG.NumberConc / (K_GSSG + Variable__CELL_CYTOPLASM_GSH.NumberConc / Variable__CELL_CYTOPLASM_GSSG.NumberConc)) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_F6P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_F6P       -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     -1 ]
			[ Variable__CELL_CYTOPLASM_FDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_FDP       1  ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     1  ]
			[ Variable__CELL_CYTOPLASM_E_PFK     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_PFK     0  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_fATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fATP      0  ]
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        0  ]
			[ Variable__CELL_CYTOPLASM_f23DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG    0  ]
			[ Variable__CELL_CYTOPLASM_fAMP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fAMP      0  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        0  ]
			[ Variable__CELL_CYTOPLASM_GDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GDP       0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__CELL_CYTOPLASM_GSH       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSH       0  ]
			[ Variable__CELL_CYTOPLASM_GSSG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSSG      0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_PGI )
	{
		Name	E_PGI;
		Name	E_PGI;
		#StepperID	0.0;
		#Priority	0.0;
		KmA	181.0;
		KmP	71.0;
		kcatf	1470.0;
		kcatr	1760.0;
		Expression	"Variable__CELL_CYTOPLASM_E_PGI.NumberConc * 1.000000e-13 * N_A.Value * (kcatf * 1000000 * Variable__CELL_CYTOPLASM_G6P.NumberConc / KmA - kcatr * 1000000 * Variable__CELL_CYTOPLASM_F6P.NumberConc / KmP) / (1 + 1000000 * Variable__CELL_CYTOPLASM_G6P.NumberConc / KmA + 1000000 * Variable__CELL_CYTOPLASM_F6P.NumberConc / KmP) * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_G6P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_G6P       -1 ]
			[ Variable__CELL_CYTOPLASM_F6P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_F6P       1  ]
			[ Variable__CELL_CYTOPLASM_E_PGI     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_PGI     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_PGK )
	{
		Name	E_PGK;
		Name	E_PGK;
		#StepperID	0.0;
		#Priority	0.0;
		KiB13PG	1.6e-06;
		KiMgADP	8e-05;
		KiMgATP	0.00013;
		KiP3GA	0.000205;
		KmB13PG	2e-06;
		KmMgADP	0.0001;
		KmMgATP	0.001;
		KmP3GA	0.0011;
		PGK	2.74e-06;
		kcatf	2290.0;
		kcatr	917.0;
		Expression	"PGK / (1 + Variable__CELL_CYTOPLASM_MgADP.NumberConc / KiMgADP + Variable__CELL_CYTOPLASM__13DPG.NumberConc / KiB13PG + Variable__CELL_CYTOPLASM_MgADP.NumberConc * Variable__CELL_CYTOPLASM__13DPG.NumberConc / (KiMgADP * KmB13PG) + Variable__CELL_CYTOPLASM_MgATP.NumberConc / KiMgATP + Variable__CELL_CYTOPLASM__3PG.NumberConc / KiP3GA + Variable__CELL_CYTOPLASM_MgATP.NumberConc * Variable__CELL_CYTOPLASM__3PG.NumberConc / (KiMgATP * KmP3GA)) * (kcatf * Variable__CELL_CYTOPLASM__13DPG.NumberConc * Variable__CELL_CYTOPLASM_MgADP.NumberConc / (KiMgADP * KmB13PG) - kcatr * Variable__CELL_CYTOPLASM__3PG.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KiMgATP * KmP3GA)) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM__13DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__13DPG    -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     -1 ]
			[ Variable__CELL_CYTOPLASM__3PG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__3PG      1  ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_PGM )
	{
		Name	E_PGM;
		Name	E_PGM;
		#StepperID	0.0;
		#Priority	0.0;
		KmP2GA	4.6e-05;
		KmP3GA	0.000168;
		PGM	4.1e-07;
		kcatf	795.0;
		kcatr	714.0;
		Expression	"PGM / (1 + Variable__CELL_CYTOPLASM__3PG.NumberConc / KmP3GA + Variable__CELL_CYTOPLASM__2PG.NumberConc / KmP2GA) * (kcatf * Variable__CELL_CYTOPLASM__3PG.NumberConc / KmP3GA - kcatr * Variable__CELL_CYTOPLASM__2PG.NumberConc / KmP2GA) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM__3PG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__3PG      -1 ]
			[ Variable__CELL_CYTOPLASM__2PG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__2PG      1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_PK )
	{
		Name	E_PK;
		Name	E_PK;
		#StepperID	0.0;
		#Priority	0.0;
		KRF16P2	5e-06;
		KRG16P2	0.0001;
		KRMgADP	0.000474;
		KRMgATP	0.003;
		KRPEP	0.000225;
		KRPyr	0.002;
		KTATP	0.00339;
		PK	8.7e-08;
		kcatf	1386.0;
		kcatr	3.26;
		Expression	"PK / ((1 + pow(10, -6.8) / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * pow(1 + Variable__CELL_CYTOPLASM_fATP.NumberConc / KTATP, 4) / (pow(1 + Variable__CELL_CYTOPLASM_PEP.NumberConc / KRPEP + Variable__CELL_CYTOPLASM_PYRi.NumberConc / KRPyr, 4) * pow(1 + Variable__CELL_CYTOPLASM_FDP.NumberConc / KRF16P2 + Variable__CELL_CYTOPLASM_GDP.NumberConc / KRG16P2, 4))) * (1 + Variable__CELL_CYTOPLASM_PEP.NumberConc / KRPEP + Variable__CELL_CYTOPLASM_MgADP.NumberConc / KRMgADP + Variable__CELL_CYTOPLASM_PEP.NumberConc * Variable__CELL_CYTOPLASM_MgADP.NumberConc / (KRPEP * KRMgADP) + Variable__CELL_CYTOPLASM_PYRi.NumberConc / KRPyr + Variable__CELL_CYTOPLASM_MgATP.NumberConc / KRMgATP + Variable__CELL_CYTOPLASM_PYRi.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KRPyr * KRMgATP))) * (kcatf * Variable__CELL_CYTOPLASM_PEP.NumberConc * Variable__CELL_CYTOPLASM_MgADP.NumberConc / (KRPEP * KRMgADP) - kcatr * Variable__CELL_CYTOPLASM_PYRi.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (KRMgATP * KRPyr)) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_PEP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PEP       -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     -1 ]
			[ Variable__CELL_CYTOPLASM_PYRi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PYRi      1  ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_fATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fATP      0  ]
			[ Variable__CELL_CYTOPLASM_FDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_FDP       0  ]
			[ Variable__CELL_CYTOPLASM_GDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GDP       0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_PNPase )
	{
		Name	E_PNPase;
		Name	E_PNPase;
		#StepperID	0.0;
		#Priority	0.0;
		Et	1.489e-05;
		k1	587000.0;
		k2	2240.0;
		k3	29.33;
		kd1	23.9;
		kd2	105000.0;
		kd3	613000.0;
		Expression	"Et * (k1 * k2 * k3 * Variable__CELL_CYTOPLASM_HXi.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_R1P.NumberConc * 1.000000e-13 * N_A.Value - kd1 * kd2 * kd3 * Variable__CELL_CYTOPLASM_INO.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_Pi.NumberConc * 1.000000e-13 * N_A.Value) / (kd1 * k3 + k1 * k3 * Variable__CELL_CYTOPLASM_HXi.NumberConc * 1.000000e-13 * N_A.Value + kd1 * kd2 * Variable__CELL_CYTOPLASM_INO.NumberConc * 1.000000e-13 * N_A.Value + kd1 * kd3 * Variable__CELL_CYTOPLASM_Pi.NumberConc * 1.000000e-13 * N_A.Value + k1 * k2 * Variable__CELL_CYTOPLASM_HXi.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_R1P.NumberConc * 1.000000e-13 * N_A.Value + k1 * kd2 * Variable__CELL_CYTOPLASM_HXi.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_INO.NumberConc * 1.000000e-13 * N_A.Value + k2 * kd3 * Variable__CELL_CYTOPLASM_R1P.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_Pi.NumberConc * 1.000000e-13 * N_A.Value + kd2 * kd3 * Variable__CELL_CYTOPLASM_INO.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_Pi.NumberConc * 1.000000e-13 * N_A.Value) * (1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_HXi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_HXi       -1 ]
			[ Variable__CELL_CYTOPLASM_R1P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_R1P       -1 ]
			[ Variable__CELL_CYTOPLASM_INO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_INO       1  ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        1  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_PRM )
	{
		Name	E_PRM;
		Name	E_PRM;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	7.25;
		Kmd	100.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_R1P.NumberConc - Kmd * Variable__CELL_CYTOPLASM_R5P.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_R1P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_R1P       -1 ]
			[ Variable__CELL_CYTOPLASM_R5P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_R5P       1  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_PRPPsyn )
	{
		Name	E_PRPPsyn;
		Name	E_PRPPsyn;
		#StepperID	0.0;
		#Priority	0.0;
		Kamp	0.275;
		Katp	0.17;
		Keq	28.6;
		Kprpp	0.09;
		Kr5p	0.65;
		Kv	7.5;
		Vm	0.554;
		Vr	0.0738666666667;
		Expression	"Vm * Vr * (1000 * Variable__CELL_CYTOPLASM_R5P.NumberConc * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc - 1000 * Variable__CELL_CYTOPLASM_PRPP.NumberConc * 1000 * Variable__CELL_CYTOPLASM_fAMP.NumberConc / Keq) / (Vr * Kr5p * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc + Vr * Katp * 1000 * Variable__CELL_CYTOPLASM_R5P.NumberConc + Vm * Kamp * 1000 * Variable__CELL_CYTOPLASM_PRPP.NumberConc / Keq + Vm * Kprpp * 1000 * Variable__CELL_CYTOPLASM_fAMP.NumberConc / Keq + Vr * 1000 * Variable__CELL_CYTOPLASM_R5P.NumberConc * 1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc + Vm * 1000 * Variable__CELL_CYTOPLASM_PRPP.NumberConc) * Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_R5P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_R5P       -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     -1 ]
			[ Variable__CELL_CYTOPLASM_PRPP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PRPP      1  ]
			[ Variable__CELL_CYTOPLASM_fAMP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fAMP      1  ]
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        1  ]
			[ Variable__CELL_CYTOPLASM_E_PRPPsyn Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_PRPPsyn 0  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_R5PI )
	{
		Name	E_R5PI;
		Name	E_R5PI;
		#StepperID	0.0;
		#Priority	0.0;
		Ru5P	1.42e-05;
		k1	60900.0;
		k2	33.3;
		k3	14.2;
		k4	21600.0;
		Expression	"Ru5P / (1 + Variable__CELL_CYTOPLASM_RU5P.NumberConc / ((k2 + k3) / k1) + Variable__CELL_CYTOPLASM_R5P.NumberConc / ((k2 + k3) / k4)) * (k3 * Variable__CELL_CYTOPLASM_RU5P.NumberConc / ((k2 + k3) / k1) - k2 * Variable__CELL_CYTOPLASM_R5P.NumberConc / ((k2 + k3) / k4)) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_RU5P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_RU5P      -1 ]
			[ Variable__CELL_CYTOPLASM_R5P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_R5P       1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_TA )
	{
		Name	E_TA;
		Name	E_TA;
		#StepperID	0.0;
		#Priority	0.0;
		k1	21600.0;
		k2	45.3;
		k3	16.3;
		k4	30000.0;
		k5	490000.0;
		k6	60.0;
		k7	17.0;
		k8	79000.0;
		Expression	"(k1 * k3 * k5 * k7 * Variable__CELL_CYTOPLASM_S7P.NumberConc * Variable__CELL_CYTOPLASM_GA3P.NumberConc - k2 * k4 * k6 * k8 * Variable__CELL_CYTOPLASM_E4P.NumberConc * Variable__CELL_CYTOPLASM_F6P.NumberConc) / (k1 * k3 * (k6 + k7) * Variable__CELL_CYTOPLASM_S7P.NumberConc + k5 * k7 * (k2 + k3) * Variable__CELL_CYTOPLASM_GA3P.NumberConc + k2 * k4 * (k6 + k7) * Variable__CELL_CYTOPLASM_E4P.NumberConc + k6 * k8 * (k2 + k3) * Variable__CELL_CYTOPLASM_F6P.NumberConc + k1 * k5 * (k3 + k7) * Variable__CELL_CYTOPLASM_S7P.NumberConc * Variable__CELL_CYTOPLASM_GA3P.NumberConc + k4 * k8 * (k2 + k6) * Variable__CELL_CYTOPLASM_E4P.NumberConc * Variable__CELL_CYTOPLASM_F6P.NumberConc + k5 * k8 * (k2 + k3) * Variable__CELL_CYTOPLASM_GA3P.NumberConc * Variable__CELL_CYTOPLASM_F6P.NumberConc + k1 * k4 * (k6 + k7) * Variable__CELL_CYTOPLASM_S7P.NumberConc * Variable__CELL_CYTOPLASM_E4P.NumberConc) * Variable__CELL_CYTOPLASM_E_TA.NumberConc * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_S7P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_S7P       -1 ]
			[ Variable__CELL_CYTOPLASM_GA3P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GA3P      -1 ]
			[ Variable__CELL_CYTOPLASM_E4P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E4P       1  ]
			[ Variable__CELL_CYTOPLASM_F6P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_F6P       1  ]
			[ Variable__CELL_CYTOPLASM_E_TA      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_TA      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_TK1 )
	{
		Name	E_TK1;
		Name	E_TK1;
		#StepperID	0.0;
		#Priority	0.0;
		k1	216000.0;
		k2	38.0;
		k3	34.0;
		k4	156000.0;
		k5	329000.0;
		k6	175.0;
		k7	40.0;
		k8	44800.0;
		Expression	"(k1 * k3 * k5 * k7 * Variable__CELL_CYTOPLASM_X5P.NumberConc * Variable__CELL_CYTOPLASM_R5P.NumberConc - k2 * k4 * k6 * k8 * Variable__CELL_CYTOPLASM_GA3P.NumberConc * Variable__CELL_CYTOPLASM_S7P.NumberConc) / (k1 * k3 * (k6 + k7) * Variable__CELL_CYTOPLASM_X5P.NumberConc + k5 * k7 * (k2 + k3) * Variable__CELL_CYTOPLASM_R5P.NumberConc + k2 * k4 * (k6 + k7) * Variable__CELL_CYTOPLASM_GA3P.NumberConc + k6 * k8 * (k2 + k3) * Variable__CELL_CYTOPLASM_S7P.NumberConc + k1 * k5 * (k3 + k7) * Variable__CELL_CYTOPLASM_X5P.NumberConc * Variable__CELL_CYTOPLASM_R5P.NumberConc + k4 * k8 * (k2 + k6) * Variable__CELL_CYTOPLASM_GA3P.NumberConc * Variable__CELL_CYTOPLASM_S7P.NumberConc + k5 * k8 * (k2 + k3) * Variable__CELL_CYTOPLASM_R5P.NumberConc * Variable__CELL_CYTOPLASM_S7P.NumberConc + k1 * k4 * (k6 + k7) * Variable__CELL_CYTOPLASM_X5P.NumberConc * Variable__CELL_CYTOPLASM_GA3P.NumberConc) * Variable__CELL_CYTOPLASM_E_TK1.NumberConc * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_X5P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_X5P       -1 ]
			[ Variable__CELL_CYTOPLASM_R5P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_R5P       -1 ]
			[ Variable__CELL_CYTOPLASM_GA3P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GA3P      1  ]
			[ Variable__CELL_CYTOPLASM_S7P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_S7P       1  ]
			[ Variable__CELL_CYTOPLASM_E_TK1     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_TK1     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_TK2 )
	{
		Name	E_TK2;
		Name	E_TK2;
		#StepperID	0.0;
		#Priority	0.0;
		k1	216000.0;
		k2	38.0;
		k3	34.0;
		k4	156000.0;
		k5	2240000.0;
		k6	175.0;
		k7	40.0;
		k8	21300.0;
		Expression	"(k1 * k3 * k5 * k7 * Variable__CELL_CYTOPLASM_X5P.NumberConc * Variable__CELL_CYTOPLASM_E4P.NumberConc - k2 * k4 * k6 * k8 * Variable__CELL_CYTOPLASM_GA3P.NumberConc * Variable__CELL_CYTOPLASM_F6P.NumberConc) / (k1 * k3 * (k6 + k7) * Variable__CELL_CYTOPLASM_X5P.NumberConc + k5 * k7 * (k2 + k3) * Variable__CELL_CYTOPLASM_E4P.NumberConc + k2 * k4 * (k6 + k7) * Variable__CELL_CYTOPLASM_GA3P.NumberConc + k6 * k8 * (k2 + k3) * Variable__CELL_CYTOPLASM_F6P.NumberConc + k1 * k5 * (k3 + k7) * Variable__CELL_CYTOPLASM_X5P.NumberConc * Variable__CELL_CYTOPLASM_E4P.NumberConc + k4 * k8 * (k2 + k6) * Variable__CELL_CYTOPLASM_GA3P.NumberConc * Variable__CELL_CYTOPLASM_F6P.NumberConc + k5 * k8 * (k2 + k3) * Variable__CELL_CYTOPLASM_E4P.NumberConc * Variable__CELL_CYTOPLASM_F6P.NumberConc + k1 * k4 * (k6 + k7) * Variable__CELL_CYTOPLASM_X5P.NumberConc * Variable__CELL_CYTOPLASM_GA3P.NumberConc) * Variable__CELL_CYTOPLASM_E_TK2.NumberConc * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_X5P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_X5P       -1 ]
			[ Variable__CELL_CYTOPLASM_E4P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E4P       -1 ]
			[ Variable__CELL_CYTOPLASM_GA3P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GA3P      1  ]
			[ Variable__CELL_CYTOPLASM_F6P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_F6P       1  ]
			[ Variable__CELL_CYTOPLASM_E_TK2     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_TK2     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_TPI )
	{
		Name	E_TPI;
		Name	E_TPI;
		#StepperID	0.0;
		#Priority	0.0;
		KmA	162.4;
		KmP	446.0;
		kcatf	1280.0;
		kcatr	14560.0;
		Expression	"Variable__CELL_CYTOPLASM_E_TPI.NumberConc * 1.000000e-13 * N_A.Value * (kcatf * 1000000 * Variable__CELL_CYTOPLASM_DHAP.NumberConc / KmA - kcatr * 1000000 * Variable__CELL_CYTOPLASM_GA3P.NumberConc / KmP) / (1 + 1000000 * Variable__CELL_CYTOPLASM_DHAP.NumberConc / KmA + 1000000 * Variable__CELL_CYTOPLASM_GA3P.NumberConc / KmP) * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_DHAP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_DHAP      -1 ]
			[ Variable__CELL_CYTOPLASM_GA3P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GA3P      1  ]
			[ Variable__CELL_CYTOPLASM_E_TPI     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_TPI     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_E_X5PI )
	{
		Name	E_X5PI;
		Name	E_X5PI;
		#StepperID	0.0;
		#Priority	0.0;
		Ru5P	4.22e-06;
		k1	3910000.0;
		k2	438.0;
		k3	305.0;
		k4	1490000.0;
		Expression	"Ru5P / (1 + Variable__CELL_CYTOPLASM_RU5P.NumberConc / ((k2 + k3) / k1) + Variable__CELL_CYTOPLASM_X5P.NumberConc / ((k2 + k3) / k4)) * (k3 * Variable__CELL_CYTOPLASM_RU5P.NumberConc / ((k2 + k3) / k1) - k2 * Variable__CELL_CYTOPLASM_X5P.NumberConc / ((k2 + k3) / k4)) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_RU5P      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_RU5P      -1 ]
			[ Variable__CELL_CYTOPLASM_X5P       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_X5P       1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_Mg13DPG )
	{
		Name	Mg13DPG;
		Name	Mg13DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kh2bpg	4270000.0;
		Khbpg	162000000.0;
		Kkbpg	85.1;
		Kkhbpg	8.9;
		Kmgbpg	7410.0;
		Kmghbpg	513.0;
		kmgbpga	228000.0;
		kmgbpgd	1200.0;
		Expression	"(kmgbpga * (3.2 * 0.001 * (Kmgbpg + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khbpg * Kmghbpg) / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khbpg + pow(10, -2 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khbpg * Kh2bpg + Variable__CELL_CYTOPLASM_Ki.NumberConc * Kkbpg + Variable__CELL_CYTOPLASM_Ki.NumberConc * pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khbpg * Kkhbpg)) * Variable__CELL_CYTOPLASM_Mg.NumberConc * Variable__CELL_CYTOPLASM__13DPG.NumberConc - kmgbpgd * Variable__CELL_CYTOPLASM_Mg13DPG.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        -1 ]
			[ Variable__CELL_CYTOPLASM__13DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__13DPG    -1 ]
			[ Variable__CELL_CYTOPLASM_Mg13DPG   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg13DPG   1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_Mg23DPG )
	{
		Name	Mg23DPG;
		Name	Mg23DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kh2bpg	4270000.0;
		Khbpg	162000000.0;
		Kkbpg	85.1;
		Kkhbpg	8.9;
		Kmgbpg	7410.0;
		Kmghbpg	513.0;
		kmgbpga	804000.0;
		kmgbpgd	1200.0;
		Expression	"(kmgbpga * (3.2 * 0.001 * (Kmgbpg + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khbpg * Kmghbpg) / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khbpg + pow(10, -2 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khbpg * Kh2bpg + Variable__CELL_CYTOPLASM_Ki.NumberConc * Kkbpg + Variable__CELL_CYTOPLASM_Ki.NumberConc * pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khbpg * Kkhbpg)) * Variable__CELL_CYTOPLASM_Mg.NumberConc * Variable__CELL_CYTOPLASM_f23DPG.NumberConc - kmgbpgd * Variable__CELL_CYTOPLASM_Mg23DPG.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        -1 ]
			[ Variable__CELL_CYTOPLASM_f23DPG    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG    -1 ]
			[ Variable__CELL_CYTOPLASM_Mg23DPG   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg23DPG   1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_MgADP )
	{
		Name	MgADP;
		Name	MgADP;
		#StepperID	0.0;
		#Priority	0.0;
		Khadp	5420000.0;
		Kkadp	4.8;
		Kmgadp	3290.0;
		Kmghadp	107.0;
		kmgadpa	1711.2;
		kmgadpd	1200.0;
		Expression	"(kmgadpa * ((Kmgadp + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khadp * Kmghadp) / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khadp + Variable__CELL_CYTOPLASM_Ki.NumberConc * Kkadp)) * Variable__CELL_CYTOPLASM_Mg.NumberConc * Variable__CELL_CYTOPLASM_fADP.NumberConc - kmgadpd * Variable__CELL_CYTOPLASM_MgADP.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        -1 ]
			[ Variable__CELL_CYTOPLASM_fADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fADP      -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_MgAMP )
	{
		Name	MgAMP;
		Name	MgAMP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	54054.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_Mg.NumberConc * Variable__CELL_CYTOPLASM_fAMP.NumberConc - Kmd * Variable__CELL_CYTOPLASM_MgAMP.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        -1 ]
			[ Variable__CELL_CYTOPLASM_fAMP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fAMP      -1 ]
			[ Variable__CELL_CYTOPLASM_MgAMP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgAMP     1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_MgATP )
	{
		Name	MgATP;
		Name	MgATP;
		#StepperID	0.0;
		#Priority	0.0;
		Khatp	9070000.0;
		Kkatp	14.0;
		Kmgatp	43200.0;
		Kmghatp	748.0;
		kmgatpa	2620.8;
		kmgatpd	1200.0;
		Expression	"(kmgatpa * ((Kmgatp + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khatp * Kmghatp) / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khatp + Variable__CELL_CYTOPLASM_Ki.NumberConc * Kkatp)) * Variable__CELL_CYTOPLASM_Mg.NumberConc * Variable__CELL_CYTOPLASM_fATP.NumberConc - kmgatpd * Variable__CELL_CYTOPLASM_MgATP.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        -1 ]
			[ Variable__CELL_CYTOPLASM_fATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fATP      -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_MgFru16P2 )
	{
		Name	MgFru16P2;
		Name	MgFru16P2;
		#StepperID	0.0;
		#Priority	0.0;
		Kh2f	1120000.0;
		Khf	7560000.0;
		Kkf	10.7;
		Kkhf	3.3;
		Kmgfru16p2	363.0;
		Kmghf	89.0;
		kmgf16p2a	480000.0;
		kmgf16p2d	1200.0;
		Expression	"(kmgf16p2a * (8.3 * 0.001 * (Kmgfru16p2 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khf * Kmghf) / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khf + pow(10, -2 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khf * Kh2f + Variable__CELL_CYTOPLASM_Ki.NumberConc * Kkf + Variable__CELL_CYTOPLASM_Ki.NumberConc * pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khf * Kkhf)) * Variable__CELL_CYTOPLASM_Mg.NumberConc * Variable__CELL_CYTOPLASM_FDP.NumberConc - kmgf16p2d * Variable__CELL_CYTOPLASM_MgFDP.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        -1 ]
			[ Variable__CELL_CYTOPLASM_FDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_FDP       -1 ]
			[ Variable__CELL_CYTOPLASM_MgFDP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgFDP     1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_MgGlc16P2 )
	{
		Name	MgGlc16P2;
		Name	MgGlc16P2;
		#StepperID	0.0;
		#Priority	0.0;
		Kh2f	1120000.0;
		Khf	7560000.0;
		Kkf	10.7;
		Kkhf	3.3;
		Kmgfru16p2	363.0;
		Kmghf	89.0;
		kmgf16p2a	480000.0;
		kmgf16p2d	1200.0;
		Expression	"(kmgf16p2a * (8.3 * 0.001 * (Kmgfru16p2 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khf * Kmghf) / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khf + pow(10, -2 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khf * Kh2f + Variable__CELL_CYTOPLASM_Ki.NumberConc * Kkf + Variable__CELL_CYTOPLASM_Ki.NumberConc * pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khf * Kkhf)) * Variable__CELL_CYTOPLASM_Mg.NumberConc * Variable__CELL_CYTOPLASM_GDP.NumberConc - kmgf16p2d * Variable__CELL_CYTOPLASM_MgGDP.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        -1 ]
			[ Variable__CELL_CYTOPLASM_GDP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GDP       -1 ]
			[ Variable__CELL_CYTOPLASM_MgGDP     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgGDP     1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_MgPhos )
	{
		Name	MgPhos;
		Name	MgPhos;
		#StepperID	0.0;
		#Priority	0.0;
		Khphos	5680000.0;
		Kkphos	3.0;
		kmgphosa	40800.0;
		kmgphosd	1200.0;
		Expression	"(kmgphosa * ((1 + pow(10, -7.2) * Khphos + 0.15 * Kkphos) / (1 + pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) * Khphos + Variable__CELL_CYTOPLASM_Ki.NumberConc * Kkphos)) * Variable__CELL_CYTOPLASM_Mg.NumberConc * Variable__CELL_CYTOPLASM_Pi.NumberConc - kmgphosd * Variable__CELL_CYTOPLASM_MgPi.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Mg        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Mg        -1 ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        -1 ]
			[ Variable__CELL_CYTOPLASM_MgPi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgPi      1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_OX )
	{
		Name	OX;
		Name	OX;
		#StepperID	0.0;
		#Priority	0.0;
		k	2.38e-05;
		Expression	"k * Variable__CELL_CYTOPLASM_GSH.NumberConc * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_GSH       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSH       -2 ]
			[ Variable__CELL_CYTOPLASM_GSSG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GSSG      1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_OXNADH )
	{
		Name	OXNADH;
		Name	OXNADH;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	0.0163;
		Kmd	0.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_NADH.NumberConc - Kmd * Variable__CELL_CYTOPLASM_NAD.NumberConc) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_NADH      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NADH      -1 ]
			[ Variable__CELL_CYTOPLASM_NAD       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_NAD       1  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_PNPase2 )
	{
		Name	PNPase2;
		#StepperID	0.0;
		#Priority	0.0;
		k	100000000.0;
		Expression	"k * Variable__CELL_CYTOPLASM_GUO.NumberConc * Variable__CELL_CYTOPLASM_Pi.NumberConc / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_GUO Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GUO -1 ]
			[ Variable__CELL_CYTOPLASM_Pi  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi  -1 ]
			[ Variable__CELL_CYTOPLASM_GUA Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GUA 1  ]
			[ Variable__CELL_CYTOPLASM_R1P Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_R1P 1  ]
			[ Variable__CELL_CYTOPLASM_pHi Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi 0  ]
			[ N_A                          Variable:/SBMLParameter:N_A                                   0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3ALD )
	{
		Name	band3ALD;
		Name	band3ALD;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	1200000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_E_ALD.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3ALD.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3     -1 ]
			[ Variable__CELL_CYTOPLASM_E_ALD     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_ALD     -1 ]
			[ Variable__CELL_CYTOPLASM_band3ALD  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3ALD  1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka  0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd  0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3GAPDH )
	{
		Name	band3GAPDH;
		Name	band3GAPDH;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	2400000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_E_GAPDH.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3GAPDH.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3      -1 ]
			[ Variable__CELL_CYTOPLASM_E_GAPDH    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_GAPDH    -1 ]
			[ Variable__CELL_CYTOPLASM_band3GAPDH Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3GAPDH 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka   0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3PFK )
	{
		Name	band3PFK;
		Name	band3PFK;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	6000000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_E_PFK.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3PFK.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3     -1 ]
			[ Variable__CELL_CYTOPLASM_E_PFK     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_E_PFK     -1 ]
			[ Variable__CELL_CYTOPLASM_band3PFK  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3PFK  1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka  0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd  0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3deoxyHb )
	{
		Name	band3deoxyHb;
		Name	band3deoxyHb;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	12000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3deoxyHb.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3        -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHb      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb      -1 ]
			[ Variable__CELL_CYTOPLASM_band3deoxyHb Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3deoxyHb 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka     0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme    0  ]
			[ N_A                                   Variable:/SBMLParameter:N_A                                            0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3deoxyHb13DPG )
	{
		Name	band3deoxyHb13DPG;
		Name	band3deoxyHb13DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	12000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_deoxyHb13DPG.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3deoxyHb13DPG.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3             Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3             -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHb13DPG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb13DPG      -1 ]
			[ Variable__CELL_CYTOPLASM_band3deoxyHb13DPG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3deoxyHb13DPG 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka          0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd          0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme         0  ]
			[ N_A                                        Variable:/SBMLParameter:N_A                                                 0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3deoxyHb23DPG )
	{
		Name	band3deoxyHb23DPG;
		Name	band3deoxyHb23DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	12000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_deoxyHb23DPG.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3deoxyHb23DPG.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3             Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3             -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHb23DPG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb23DPG      -1 ]
			[ Variable__CELL_CYTOPLASM_band3deoxyHb23DPG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3deoxyHb23DPG 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka          0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd          0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme         0  ]
			[ N_A                                        Variable:/SBMLParameter:N_A                                                 0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3deoxyHbADP )
	{
		Name	band3deoxyHbADP;
		Name	band3deoxyHbADP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	12000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_deoxyHbADP.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3deoxyHbADP.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3           Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3           -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbADP      -1 ]
			[ Variable__CELL_CYTOPLASM_band3deoxyHbADP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3deoxyHbADP 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka        0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme       0  ]
			[ N_A                                      Variable:/SBMLParameter:N_A                                               0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3deoxyHbATP )
	{
		Name	band3deoxyHbATP;
		Name	band3deoxyHbATP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	12000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_deoxyHbATP.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3deoxyHbATP.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3           Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3           -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbATP      -1 ]
			[ Variable__CELL_CYTOPLASM_band3deoxyHbATP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3deoxyHbATP 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka        0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme       0  ]
			[ N_A                                      Variable:/SBMLParameter:N_A                                               0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3deoxyHbFDP )
	{
		Name	band3deoxyHbFDP;
		Name	band3deoxyHbFDP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	12000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_deoxyHbFDP.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3deoxyHbFDP.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3           Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3           -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbFDP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbFDP      -1 ]
			[ Variable__CELL_CYTOPLASM_band3deoxyHbFDP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3deoxyHbFDP 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka        0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme       0  ]
			[ N_A                                      Variable:/SBMLParameter:N_A                                               0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3deoxyHbGDP )
	{
		Name	band3deoxyHbGDP;
		Name	band3deoxyHbGDP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	12000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_deoxyHbGDP.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3deoxyHbGDP.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3           Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3           -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbGDP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbGDP      -1 ]
			[ Variable__CELL_CYTOPLASM_band3deoxyHbGDP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3deoxyHbGDP 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka        0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme       0  ]
			[ N_A                                      Variable:/SBMLParameter:N_A                                               0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3deoxyHbMgATP )
	{
		Name	band3deoxyHbMgATP;
		Name	band3deoxyHbMgATP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	12000000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_deoxyHbMgATP.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3deoxyHbMgATP.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3             Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3             -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbMgATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbMgATP      -1 ]
			[ Variable__CELL_CYTOPLASM_band3deoxyHbMgATP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3deoxyHbMgATP 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka          0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd          0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme         0  ]
			[ N_A                                        Variable:/SBMLParameter:N_A                                                 0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3oxyHb )
	{
		Name	band3oxyHb;
		Name	band3oxyHb;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	120000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_oxyHb.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3oxyHb.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3      -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHb      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb      -1 ]
			[ Variable__CELL_CYTOPLASM_band3oxyHb Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3oxyHb 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka   0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3oxyHb13DPG )
	{
		Name	band3oxyHb13DPG;
		Name	band3oxyHb13DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	120000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_oxyHb13DPG.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3oxyHb13DPG.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3           Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3           -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHb13DPG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb13DPG      -1 ]
			[ Variable__CELL_CYTOPLASM_band3oxyHb13DPG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3oxyHb13DPG 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka        0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme       0  ]
			[ N_A                                      Variable:/SBMLParameter:N_A                                               0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3oxyHb23DPG )
	{
		Name	band3oxyHb23DPG;
		Name	band3oxyHb23DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	120000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_oxyHb23DPG.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3oxyHb23DPG.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3           Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3           -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHb23DPG      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb23DPG      -1 ]
			[ Variable__CELL_CYTOPLASM_band3oxyHb23DPG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3oxyHb23DPG 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka        0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme       0  ]
			[ N_A                                      Variable:/SBMLParameter:N_A                                               0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3oxyHbADP )
	{
		Name	band3oxyHbADP;
		Name	band3oxyHbADP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	120000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_oxyHbADP.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3oxyHbADP.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3         -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHbADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHbADP      -1 ]
			[ Variable__CELL_CYTOPLASM_band3oxyHbADP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3oxyHbADP 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka      0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme     0  ]
			[ N_A                                    Variable:/SBMLParameter:N_A                                             0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3oxyHbATP )
	{
		Name	band3oxyHbATP;
		Name	band3oxyHbATP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	120000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_oxyHbATP.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3oxyHbATP.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3         -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHbATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHbATP      -1 ]
			[ Variable__CELL_CYTOPLASM_band3oxyHbATP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3oxyHbATP 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka      0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme     0  ]
			[ N_A                                    Variable:/SBMLParameter:N_A                                             0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_band3oxyHbMgATP )
	{
		Name	band3oxyHbMgATP;
		Name	band3oxyHbMgATP;
		#StepperID	0.0;
		#Priority	0.0;
		Kma	120000.0;
		Kmd	1200.0;
		Expression	"(Kma * Variable__CELL_CYTOPLASM_band3.NumberConc * Variable__CELL_CYTOPLASM_oxyHbMgATP.NumberConc * Variable__CELL_CYTOPLASM_band3_ka.NumberConc * 1.000000e-13 * N_A.Value - Kmd * Variable__CELL_CYTOPLASM_band3oxyHbMgATP.NumberConc * Variable__CELL_CYTOPLASM_band3_kd.NumberConc * 1.000000e-13 * N_A.Value) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_band3           Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3           -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHbMgATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHbMgATP      -1 ]
			[ Variable__CELL_CYTOPLASM_band3oxyHbMgATP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3oxyHbMgATP 1  ]
			[ Variable__CELL_CYTOPLASM_band3_ka        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_ka        0  ]
			[ Variable__CELL_CYTOPLASM_band3_kd        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_band3_kd        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme       0  ]
			[ N_A                                      Variable:/SBMLParameter:N_A                                               0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_deoxyHb13DPG )
	{
		Name	deoxyHb13DPG;
		Name	deoxyHb13DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	1860000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * Variable__CELL_CYTOPLASM__13DPG.NumberConc - kd * Variable__CELL_CYTOPLASM_deoxyHb13DPG.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_deoxyHb      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb      -1 ]
			[ Variable__CELL_CYTOPLASM__13DPG       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__13DPG       -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHb13DPG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb13DPG 1  ]
			[ Variable__CELL_CYTOPLASM_pHi          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi          0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme    0  ]
			[ N_A                                   Variable:/SBMLParameter:N_A                                            0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_deoxyHb23DPG )
	{
		Name	deoxyHb23DPG;
		Name	deoxyHb23DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	6000000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * Variable__CELL_CYTOPLASM_f23DPG.NumberConc - kd * Variable__CELL_CYTOPLASM_deoxyHb23DPG.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_deoxyHb      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb      -1 ]
			[ Variable__CELL_CYTOPLASM_f23DPG       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG       -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHb23DPG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb23DPG 1  ]
			[ Variable__CELL_CYTOPLASM_pHi          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi          0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme    0  ]
			[ N_A                                   Variable:/SBMLParameter:N_A                                            0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_deoxyHbADP )
	{
		Name	deoxyHbADP;
		Name	deoxyHbADP;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	1440000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * Variable__CELL_CYTOPLASM_fADP.NumberConc - kd * Variable__CELL_CYTOPLASM_deoxyHbADP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_deoxyHb    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb    -1 ]
			[ Variable__CELL_CYTOPLASM_fADP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fADP       -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbADP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbADP 1  ]
			[ Variable__CELL_CYTOPLASM_pHi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_deoxyHbATP )
	{
		Name	deoxyHbATP;
		Name	deoxyHbATP;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	3120000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * Variable__CELL_CYTOPLASM_fATP.NumberConc - kd * Variable__CELL_CYTOPLASM_deoxyHbATP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_deoxyHb    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb    -1 ]
			[ Variable__CELL_CYTOPLASM_fATP       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fATP       -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbATP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbATP 1  ]
			[ Variable__CELL_CYTOPLASM_pHi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_deoxyHbFDP )
	{
		Name	deoxyHbFDP;
		Name	deoxyHbFDP;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	1212000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * Variable__CELL_CYTOPLASM_FDP.NumberConc - kd * Variable__CELL_CYTOPLASM_deoxyHbFDP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_deoxyHb    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb    -1 ]
			[ Variable__CELL_CYTOPLASM_FDP        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_FDP        -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbFDP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbFDP 1  ]
			[ Variable__CELL_CYTOPLASM_pHi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_deoxyHbGDP )
	{
		Name	deoxyHbGDP;
		Name	deoxyHbGDP;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	1212000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * Variable__CELL_CYTOPLASM_GDP.NumberConc - kd * Variable__CELL_CYTOPLASM_deoxyHbGDP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_deoxyHb    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb    -1 ]
			[ Variable__CELL_CYTOPLASM_GDP        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_GDP        -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbGDP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbGDP 1  ]
			[ Variable__CELL_CYTOPLASM_pHi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_deoxyHbMgATP )
	{
		Name	deoxyHbMgATP;
		Name	deoxyHbMgATP;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	168000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc - kd * Variable__CELL_CYTOPLASM_deoxyHbMgATP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_deoxyHb      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb      -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP        -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHbMgATP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHbMgATP 1  ]
			[ Variable__CELL_CYTOPLASM_pHi          Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi          0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme    Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme    0  ]
			[ N_A                                   Variable:/SBMLParameter:N_A                                            0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_deoxyTOoxy )
	{
		Name	deoxyTOoxy;
		Name	deoxyTOoxy;
		#StepperID	0.0;
		#Priority	0.0;
		k	1e-05;
		Expression	"Variable__CELL_CYTOPLASM_deoxyHb.NumberConc * 1.000000e-13 * N_A.Value * k / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_deoxyHb Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHb   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb   1  ]
			[ N_A                              Variable:/SBMLParameter:N_A                                       0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_oxyHb13DPG )
	{
		Name	oxyHb13DPG;
		Name	oxyHb13DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	380000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_oxyHb.NumberConc * Variable__CELL_CYTOPLASM__13DPG.NumberConc - kd * Variable__CELL_CYTOPLASM_oxyHb13DPG.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_oxyHb      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb      -1 ]
			[ Variable__CELL_CYTOPLASM__13DPG     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM__13DPG     -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHb13DPG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb13DPG 1  ]
			[ Variable__CELL_CYTOPLASM_pHi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_oxyHb23DPG )
	{
		Name	oxyHb23DPG;
		Name	oxyHb23DPG;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	300000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_oxyHb.NumberConc * Variable__CELL_CYTOPLASM_f23DPG.NumberConc - kd * Variable__CELL_CYTOPLASM_oxyHb23DPG.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_oxyHb      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb      -1 ]
			[ Variable__CELL_CYTOPLASM_f23DPG     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_f23DPG     -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHb23DPG Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb23DPG 1  ]
			[ Variable__CELL_CYTOPLASM_pHi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_oxyHbADP )
	{
		Name	oxyHbADP;
		Name	oxyHbADP;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	300000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_oxyHb.NumberConc * Variable__CELL_CYTOPLASM_fADP.NumberConc - kd * Variable__CELL_CYTOPLASM_oxyHbADP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_oxyHb     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb     -1 ]
			[ Variable__CELL_CYTOPLASM_fADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fADP      -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHbADP  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHbADP  1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_oxyHbATP )
	{
		Name	oxyHbATP;
		Name	oxyHbATP;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	432000.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_oxyHb.NumberConc * Variable__CELL_CYTOPLASM_fATP.NumberConc - kd * Variable__CELL_CYTOPLASM_oxyHbATP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_oxyHb     Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb     -1 ]
			[ Variable__CELL_CYTOPLASM_fATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_fATP      -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHbATP  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHbATP  1  ]
			[ Variable__CELL_CYTOPLASM_pHi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi       0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_oxyHbMgATP )
	{
		Name	oxyHbMgATP;
		Name	oxyHbMgATP;
		#StepperID	0.0;
		#Priority	0.0;
		Kahb	1e-06;
		ka	46800.0;
		kd	1200.0;
		Expression	"(ka * ((1 + 2 * Kahb / pow(10, -7.2) + pow(Kahb / pow(10, -7.2), 2)) / (1 + 2 * Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value) + pow(Kahb / pow(10, -1 * Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 2))) * Variable__CELL_CYTOPLASM_oxyHb.NumberConc * Variable__CELL_CYTOPLASM_MgATP.NumberConc - kd * Variable__CELL_CYTOPLASM_oxyHbMgATP.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * 1.000000e-13 * N_A.Value / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_oxyHb      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb      -1 ]
			[ Variable__CELL_CYTOPLASM_MgATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP      -1 ]
			[ Variable__CELL_CYTOPLASM_oxyHbMgATP Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHbMgATP 1  ]
			[ Variable__CELL_CYTOPLASM_pHi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi        0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme  Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme  0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                          0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_oxyTOdeoxy )
	{
		Name	oxyTOdeoxy;
		Name	oxyTOdeoxy;
		#StepperID	0.0;
		#Priority	0.0;
		k	0.0;
		Expression	"Variable__CELL_CYTOPLASM_oxyHb.NumberConc * 1.000000e-13 * N_A.Value * k / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_oxyHb   Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_oxyHb   -1 ]
			[ Variable__CELL_CYTOPLASM_deoxyHb Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_deoxyHb 1  ]
			[ N_A                              Variable:/SBMLParameter:N_A                                       0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_CYTOPLASM_pH_modified )
	{
		Name	pH_modified;
		#StepperID	0.0;
		#Priority	0.0;
		a	8.12964098e-14;
		b	-5.22312442e-07;
		c	7.60206619;
		k	1.0;
		Expression	"pow(b * b - 4 * a * (c - Variable__CELL_CYTOPLASM_pHi.NumberConc * 1.000000e-13 * N_A.Value), 0.5) * k / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_pHi Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_pHi -1 ]
			[ N_A                          Variable:/SBMLParameter:N_A                                   0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_ADEtr )
	{
		Name	E_ADEtr;
		Name	E_ADEtr;
		#StepperID	0.0;
		#Priority	0.0;
		Km	2.6;
		Vm	90.0;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_ADE.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_ADE.NumberConc) - 1000 * Variable__ENVIRONMENT_ADEe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_ADEe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_ADE       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADE       -1 ]
			[ Variable__ENVIRONMENT_ADEe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADEe           1  ]
			[ Variable__CELL_MEMBRANE_E_ADEtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_ADEtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_ADEtrSUB )
	{
		Name	E_ADEtrSUB;
		Name	E_ADEtrSUB;
		#StepperID	0.0;
		#Priority	0.0;
		Km	2.6;
		SW	0.0;
		Vm	90.0;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_ADE.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_ADE.NumberConc) - 1000 * Variable__ENVIRONMENT_ADEe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_ADEe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_ADEe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADEe           -1 ]
			[ Variable__CELL_CYTOPLASM_ADE       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADE       0  ]
			[ Variable__CELL_MEMBRANE_E_ADEtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_ADEtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_ADEtrSUB_efflux )
	{
		Name	E_ADEtrSUB_efflux;
		Name	E_ADEtrSUB_efflux;
		#StepperID	0.0;
		#Priority	0.0;
		Km	2.6;
		SW	0.0;
		Vm	90.0;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_ADE.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_ADE.NumberConc) - 1000 * Variable__ENVIRONMENT_ADEe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_ADEe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_ADEe_ef      Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADEe_ef        1 ]
			[ Variable__CELL_CYTOPLASM_ADE       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADE       0 ]
			[ Variable__CELL_MEMBRANE_E_ADEtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_ADEtr     0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__ENVIRONMENT_ADEe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADEe           0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_ADOtr )
	{
		Name	E_ADOtr;
		Name	E_ADOtr;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.12;
		Vm	61.2;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_ADO.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_ADO.NumberConc) - 1000 * Variable__ENVIRONMENT_ADOe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_ADOe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_ADO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADO       -1 ]
			[ Variable__ENVIRONMENT_ADOe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADOe           1  ]
			[ Variable__CELL_MEMBRANE_E_ADOtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_ADOtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_ADOtrSUB )
	{
		Name	E_ADOtrSUB;
		Name	E_ADOtrSUB;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.12;
		SW	0.0;
		Vm	61.2;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_ADO.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_ADO.NumberConc) - 1000 * Variable__ENVIRONMENT_ADOe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_ADOe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_ADOe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADOe           -1 ]
			[ Variable__CELL_CYTOPLASM_ADO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADO       0  ]
			[ Variable__CELL_MEMBRANE_E_ADOtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_ADOtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_ADOtrSUB_efflux )
	{
		Name	E_ADOtrSUB_efflux;
		Name	E_ADOtrSUB_efflux;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.12;
		SW	0.0;
		Vm	61.2;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_ADO.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_ADO.NumberConc) - 1000 * Variable__ENVIRONMENT_ADOe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_ADOe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_ADOe_ef      Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADOe_ef        1 ]
			[ Variable__CELL_CYTOPLASM_ADO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_ADO       0 ]
			[ Variable__CELL_MEMBRANE_E_ADOtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_ADOtr     0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__ENVIRONMENT_ADOe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADOe           0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_HXtr )
	{
		Name	E_HXtr;
		Name	E_HXtr;
		#StepperID	0.0;
		#Priority	0.0;
		Ki	0.012;
		Km	0.4;
		Kmin	0.18;
		Pm	37.8;
		Vm	151.6;
		Vmin	100.8;
		Expression	"(Pm * 1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc + Vm * (1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc / (1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc + Km)) - Vmin * 1000 * Variable__ENVIRONMENT_HXe.NumberConc / (Kmin * (1 + 1000 * Variable__ENVIRONMENT_ADEe.NumberConc / Ki) + 1000 * Variable__ENVIRONMENT_HXe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_HXi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_HXi       -1 ]
			[ Variable__ENVIRONMENT_HXe          Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_HXe            1  ]
			[ Variable__CELL_MEMBRANE_E_HXtr     Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_HXtr      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__ENVIRONMENT_ADEe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADEe           0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_HXtrSUB )
	{
		Name	E_HXtrSUB;
		Name	E_HXtrSUB;
		#StepperID	0.0;
		#Priority	0.0;
		Ki	0.012;
		Km	0.4;
		Kmin	0.18;
		Pm	37.8;
		Vm	151.6;
		Vmin	100.8;
		SW	0.0;
		Expression	"(Pm * 1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc + Vm * (1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc / (1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc + Km)) - Vmin * 1000 * Variable__ENVIRONMENT_HXe.NumberConc / (Kmin * (1 + 1000 * Variable__ENVIRONMENT_ADEe.NumberConc / Ki) + 1000 * Variable__ENVIRONMENT_HXe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_HXe          Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_HXe            -1 ]
			[ Variable__CELL_CYTOPLASM_HXi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_HXi       0  ]
			[ Variable__CELL_MEMBRANE_E_HXtr     Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_HXtr      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ Variable__ENVIRONMENT_ADEe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADEe           0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_HXtrSUB_efflux )
	{
		Name	E_HXtrSUB_efflux;
		Name	E_HXtrSUB_efflux;
		#StepperID	0.0;
		#Priority	0.0;
		Ki	0.012;
		Km	0.4;
		Kmin	0.18;
		Pm	37.8;
		Vm	151.6;
		Vmin	100.8;
		SW	0.0;
		Expression	"(Pm * 1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc + Vm * (1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc / (1000 * Variable__CELL_CYTOPLASM_HXi.NumberConc + Km)) - Vmin * 1000 * Variable__ENVIRONMENT_HXe.NumberConc / (Kmin * (1 + 1000 * Variable__ENVIRONMENT_ADEe.NumberConc / Ki) + 1000 * Variable__ENVIRONMENT_HXe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_HXe_ef       Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_HXe_ef         1 ]
			[ Variable__CELL_CYTOPLASM_HXi       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_HXi       0 ]
			[ Variable__CELL_MEMBRANE_E_HXtr     Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_HXtr      0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__ENVIRONMENT_ADEe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_ADEe           0 ]
			[ Variable__ENVIRONMENT_HXe          Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_HXe            0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_INOtr )
	{
		Name	E_INOtr;
		Name	E_INOtr;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.12;
		Vm	61.2;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_INO.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_INO.NumberConc) - 1000 * Variable__ENVIRONMENT_INOe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_INOe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_INO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_INO       -1 ]
			[ Variable__ENVIRONMENT_INOe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_INOe           1  ]
			[ Variable__CELL_MEMBRANE_E_INOtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_INOtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_INOtrSUB )
	{
		Name	E_INOtrSUB;
		Name	E_INOtrSUB;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.12;
		SW	0.0;
		Vm	61.2;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_INO.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_INO.NumberConc) - 1000 * Variable__ENVIRONMENT_INOe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_INOe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_INOe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_INOe           -1 ]
			[ Variable__CELL_CYTOPLASM_INO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_INO       0  ]
			[ Variable__CELL_MEMBRANE_E_INOtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_INOtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_INOtrSUB_efflux )
	{
		Name	E_INOtrSUB_efflux;
		Name	E_INOtrSUB_efflux;
		#StepperID	0.0;
		#Priority	0.0;
		Km	0.12;
		SW	0.0;
		Vm	61.2;
		Expression	"Vm * (1000 * Variable__CELL_CYTOPLASM_INO.NumberConc / (Km + 1000 * Variable__CELL_CYTOPLASM_INO.NumberConc) - 1000 * Variable__ENVIRONMENT_INOe.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_INOe.NumberConc)) * 1.000000e-13 * N_A.Value * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_INOe_ef      Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_INOe_ef        1 ]
			[ Variable__CELL_CYTOPLASM_INO       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_INO       0 ]
			[ Variable__CELL_MEMBRANE_E_INOtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_INOtr     0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__ENVIRONMENT_INOe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_INOe           0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_K_Leak )
	{
		Name	E_K_Leak;
		Name	E_K_Leak;
		#StepperID	0.0;
		#Priority	0.0;
		Km	4.0;
		Kx	0.00635;
		Vm	3.12;
		r	0.62;
		z	1.0;
		Expression	"(Kx * z * log(r) * (1000 * Variable__ENVIRONMENT_Ke.NumberConc - r * 1000 * Variable__CELL_CYTOPLASM_Ki.NumberConc) / (r - 1) + Vm * (1000 * Variable__ENVIRONMENT_Ke.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_Ke.NumberConc) - r * 1000 * Variable__CELL_CYTOPLASM_Ki.NumberConc / (Km + r * 1000 * Variable__CELL_CYTOPLASM_Ki.NumberConc))) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_Ke           Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Ke             -1 ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        1  ]
			[ Variable__CELL_MEMBRANE_E_K_Leak   Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_K_Leak    0  ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_K_LeakSUB )
	{
		Name	E_K_LeakSUB;
		Name	E_K_LeakSUB;
		#Priority	0.0;
		#StepperID	0.0;
		Km	4.0;
		Kx	0.00635;
		Vm	3.12;
		r	0.62;
		z	1.0;
		SW	0.0;
		Expression	"(Kx * z * log(r) * (1000 * Variable__ENVIRONMENT_Ke.NumberConc - r * 1000 * Variable__CELL_CYTOPLASM_Ki.NumberConc) / (r - 1) + Vm * (1000 * Variable__ENVIRONMENT_Ke.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_Ke.NumberConc) - r * 1000 * Variable__CELL_CYTOPLASM_Ki.NumberConc / (Km + r * 1000 * Variable__CELL_CYTOPLASM_Ki.NumberConc))) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Purine.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_Ke           Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Ke             1 ]
			[ Variable__CELL_MEMBRANE_E_K_Leak   Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_K_Leak    0 ]
			[ Variable__CELL_CYTOPLASM_AC_Purine Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Purine 0 ]
			[ Variable__CELL_CYTOPLASM_Ki        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_LACtr )
	{
		Name	E_LACtr;
		Name	E_LACtr;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.00733;
		k1	0.00506;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_LACi.NumberConc - k1 * Variable__ENVIRONMENT_LACe.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_LACi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_LACi      -1 ]
			[ Variable__ENVIRONMENT_LACe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_LACe           1  ]
			[ Variable__CELL_MEMBRANE_E_LACtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_LACtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_LACtrSUB )
	{
		Name	E_LACtrSUB;
		Name	E_LACtrSUB;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.00733;
		k1	0.00506;
		SW	0.0;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_LACi.NumberConc - k1 * Variable__ENVIRONMENT_LACe.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_LACe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_LACe           -1 ]
			[ Variable__CELL_CYTOPLASM_LACi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_LACi      0  ]
			[ Variable__CELL_MEMBRANE_E_LACtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_LACtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_LACtrSUB_efflux )
	{
		Name	E_LACtrSUB_efflux;
		Name	E_LACtrSUB_efflux;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.00733;
		k1	0.00506;
		SW	0.0;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_LACi.NumberConc - k1 * Variable__ENVIRONMENT_LACe.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_LACe_ef      Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_LACe_ef        1 ]
			[ Variable__CELL_CYTOPLASM_LACi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_LACi      0 ]
			[ Variable__CELL_MEMBRANE_E_LACtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_LACtr     0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__ENVIRONMENT_LACe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_LACe           0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_NaK_Pump )
	{
		Name	E_NaK_Pump;
		Name	E_NaK_Pump;
		#StepperID	0.0;
		#Priority	0.0;
		B1	0.0617;
		B2	0.1328;
		B3	6.2672;
		Km	0.764;
		Vm	2.32;
		k2k1	0.0082;
		k3k1	0.0501;
		z	0.7114;
		Expression	"1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc + Km) * (Vm / 2) * (1000 * Variable__ENVIRONMENT_Ke.NumberConc * 1000 * Variable__ENVIRONMENT_Ke.NumberConc + B2 * 1000 * Variable__ENVIRONMENT_Ke.NumberConc * z / 2) / (B1 * B2 + 2 * B2 * 1000 * Variable__ENVIRONMENT_Ke.NumberConc + 1000 * Variable__ENVIRONMENT_Ke.NumberConc * 1000 * Variable__ENVIRONMENT_Ke.NumberConc + (B3 / (1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc) + 1) * (B3 / (1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc) + 1) * (B3 / (1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc) + 1) * (B1 * B2 * k2k1 + k3k1 * (1000 * Variable__ENVIRONMENT_Ke.NumberConc * 1000 * Variable__ENVIRONMENT_Ke.NumberConc + B2 * 1000 * Variable__ENVIRONMENT_Ke.NumberConc * z))) * 1.000000e-13 * N_A.Value * Variable__CELL_MEMBRANE_AC_NaK_Pump.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 3600 / 1000 / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Nai        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Nai       -3 ]
			[ Variable__ENVIRONMENT_Ke            Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Ke             -2 ]
			[ Variable__CELL_CYTOPLASM_MgATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     -1 ]
			[ Variable__CELL_CYTOPLASM_MgADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     1  ]
			[ Variable__CELL_CYTOPLASM_Pi         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        1  ]
			[ Variable__CELL_CYTOPLASM_Ki         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        2  ]
			[ Variable__ENVIRONMENT_Nae           Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Nae            3  ]
			[ Variable__CELL_MEMBRANE_E_NaK_Pump  Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_NaK_Pump  0  ]
			[ Variable__CELL_MEMBRANE_AC_NaK_Pump Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_AC_NaK_Pump 0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_NaK_PumpSUB )
	{
		Name	E_NaK_PumpSUB;
		Name	E_NaK_PumpSUB;
		#StepperID	0.0;
		#Priority	0.0;
		B1	0.0617;
		B2	0.1328;
		B3	6.2672;
		Km	0.764;
		Vm	2.32;
		k2k1	0.0082;
		k3k1	0.0501;
		z	0.7114;
		SW	0.0;
		Expression	"1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc / (1000 * Variable__CELL_CYTOPLASM_MgATP.NumberConc + Km) * (Vm / 2) * (1000 * Variable__ENVIRONMENT_Ke.NumberConc * 1000 * Variable__ENVIRONMENT_Ke.NumberConc + B2 * 1000 * Variable__ENVIRONMENT_Ke.NumberConc * z / 2) / (B1 * B2 + 2 * B2 * 1000 * Variable__ENVIRONMENT_Ke.NumberConc + 1000 * Variable__ENVIRONMENT_Ke.NumberConc * 1000 * Variable__ENVIRONMENT_Ke.NumberConc + (B3 / (1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc) + 1) * (B3 / (1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc) + 1) * (B3 / (1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc) + 1) * (B1 * B2 * k2k1 + k3k1 * (1000 * Variable__ENVIRONMENT_Ke.NumberConc * 1000 * Variable__ENVIRONMENT_Ke.NumberConc + B2 * 1000 * Variable__ENVIRONMENT_Ke.NumberConc * z))) * 1.000000e-13 * N_A.Value * Variable__CELL_MEMBRANE_AC_NaK_Pump.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 3600 / 1000 * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_Nae           Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Nae            -3 ]
			[ Variable__ENVIRONMENT_Ke            Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Ke             2  ]
			[ Variable__CELL_CYTOPLASM_Nai        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Nai       0  ]
			[ Variable__CELL_CYTOPLASM_MgATP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgATP     0  ]
			[ Variable__CELL_MEMBRANE_E_NaK_Pump  Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_NaK_Pump  0  ]
			[ Variable__CELL_MEMBRANE_AC_NaK_Pump Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_AC_NaK_Pump 0  ]
			[ Variable__CELL_CYTOPLASM_MgADP      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_MgADP     0  ]
			[ Variable__CELL_CYTOPLASM_Pi         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        0  ]
			[ Variable__CELL_CYTOPLASM_Ki         Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Ki        0  ]
			[ N_A                                 Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_Na_Leak )
	{
		Name	E_Na_Leak;
		Name	E_Na_Leak;
		#StepperID	0.0;
		#Priority	0.0;
		Km	21.0;
		Kx	0.00706;
		Vm	2.82;
		r	0.62;
		z	1.0;
		Expression	"(Kx * z * log(r) * (1000 * Variable__ENVIRONMENT_Nae.NumberConc - r * 1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc) / (r - 1) + Vm * (1000 * Variable__ENVIRONMENT_Nae.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_Nae.NumberConc) - r * 1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc / (Km + r * 1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc))) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_Nae          Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Nae            -1 ]
			[ Variable__CELL_CYTOPLASM_Nai       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Nai       1  ]
			[ Variable__CELL_MEMBRANE_E_Na_Leak  Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_Na_Leak   0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_Na_LeakSUB )
	{
		Name	E_Na_LeakSUB;
		Name	E_Na_LeakSUB;
		#StepperID	0.0;
		#Priority	0.0;
		Km	21.0;
		Kx	0.00706;
		Vm	2.82;
		r	0.62;
		z	1.0;
		SW	0.0;
		Expression	"(Kx * z * log(r) * (1000 * Variable__ENVIRONMENT_Nae.NumberConc - r * 1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc) / (r - 1) + Vm * (1000 * Variable__ENVIRONMENT_Nae.NumberConc / (Km + 1000 * Variable__ENVIRONMENT_Nae.NumberConc) - r * 1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc / (Km + r * 1000 * Variable__CELL_CYTOPLASM_Nai.NumberConc))) * 1.000000e-13 * N_A.Value * Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000 / 1000 / 3600 * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_Nae          Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Nae            1 ]
			[ Variable__CELL_MEMBRANE_E_Na_Leak  Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_Na_Leak   0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__CELL_CYTOPLASM_Nai       Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Nai       0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_PYRtr )
	{
		Name	E_PYRtr;
		Name	E_PYRtr;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.0261;
		k1	0.018;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_PYRi.NumberConc - k1 * Variable__ENVIRONMENT_PYRe.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_PYRi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PYRi      -1 ]
			[ Variable__ENVIRONMENT_PYRe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_PYRe           1  ]
			[ Variable__CELL_MEMBRANE_E_PYRtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_PYRtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_PYRtrSUB )
	{
		Name	E_PYRtrSUB;
		Name	E_PYRtrSUB;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.0261;
		k1	0.018;
		SW	0.0;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_PYRi.NumberConc - k1 * Variable__ENVIRONMENT_PYRe.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_PYRe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_PYRe           -1 ]
			[ Variable__CELL_CYTOPLASM_PYRi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PYRi      0  ]
			[ Variable__CELL_MEMBRANE_E_PYRtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_PYRtr     0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_PYRtrSUB_efflux )
	{
		Name	E_PYRtrSUB_efflux;
		Name	E_PYRtrSUB_efflux;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.0261;
		k1	0.018;
		SW	0.0;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_PYRi.NumberConc - k1 * Variable__ENVIRONMENT_PYRe.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_PYRe_ef      Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_PYRe_ef        1 ]
			[ Variable__CELL_CYTOPLASM_PYRi      Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_PYRi      0 ]
			[ Variable__CELL_MEMBRANE_E_PYRtr    Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_PYRtr     0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__ENVIRONMENT_PYRe         Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_PYRe           0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_Pitr )
	{
		Name	E_Pitr;
		Name	E_Pitr;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.000606;
		k1	0.00056;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_Pi.NumberConc - k1 * Variable__ENVIRONMENT_Pie.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) / N_A.Value";
		VariableReferenceList
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        -1 ]
			[ Variable__ENVIRONMENT_Pie          Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Pie            1  ]
			[ Variable__CELL_MEMBRANE_E_Pitr     Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_Pitr      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_PitrSUB )
	{
		Name	E_PitrSUB;
		Name	E_PitrSUB;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.000606;
		k1	0.00056;
		SW	0.0;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_Pi.NumberConc - k1 * Variable__ENVIRONMENT_Pie.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_Pie          Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Pie            -1 ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        0  ]
			[ Variable__CELL_MEMBRANE_E_Pitr     Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_Pitr      0  ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0  ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0  ];
	}
	
	Process ExpressionFluxProcess( Process__CELL_MEMBRANE_E_PitrSUB_efflux )
	{
		Name	E_PitrSUB_efflux;
		Name	E_PitrSUB_efflux;
		#StepperID	0.0;
		#Priority	0.0;
		k0	0.000606;
		k1	0.00056;
		SW	0.0;
		Expression	"1.000000e-13 * N_A.Value * (k0 * Variable__CELL_CYTOPLASM_Pi.NumberConc - k1 * Variable__ENVIRONMENT_Pie.NumberConc) * (Variable__CELL_CYTOPLASM_AC_Enzyme.NumberConc * 1.000000e-13 * N_A.Value / 1000) * SW / N_A.Value";
		VariableReferenceList
			[ Variable__ENVIRONMENT_Pie_ef       Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Pie_ef         1 ]
			[ Variable__CELL_CYTOPLASM_Pi        Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_Pi        0 ]
			[ Variable__CELL_MEMBRANE_E_Pitr     Variable:/System__CELL_MEMBRANE:Variable__CELL_MEMBRANE_E_Pitr      0 ]
			[ Variable__CELL_CYTOPLASM_AC_Enzyme Variable:/System__CELL_CYTOPLASM:Variable__CELL_CYTOPLASM_AC_Enzyme 0 ]
			[ Variable__ENVIRONMENT_Pie          Variable:/System___ENVIRONMENT:Variable__ENVIRONMENT_Pie            0 ]
			[ N_A                                Variable:/SBMLParameter:N_A                                         0 ];
	}
	
	
}

System System( /System___CELL )
{
	StepperID	Default;
	Name	CELL;

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

System System( /System___ENVIRONMENT )
{
	StepperID	Default;
	Name	ENVIRONMENT;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1e-13;
		Fixed	1;
	}
	
	Variable Variable( Variable__ENVIRONMENT_ADEe )
	{
		Name	ADEe;
		Value	1.44000078909e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_ADEe_ef )
	{
		Name	ADEe_ef;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_ADOe )
	{
		Name	ADOe;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_ADOe_ef )
	{
		Name	ADOe_ef;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_HXe )
	{
		Name	HXe;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_HXe_ef )
	{
		Name	HXe_ef;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_INOe )
	{
		Name	INOe;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_INOe_ef )
	{
		Name	INOe_ef;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_Ke )
	{
		Name	Ke;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_LACe )
	{
		Name	LACe;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_LACe_ef )
	{
		Name	LACe_ef;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_Nae )
	{
		Name	Nae;
		Value	6.40000350706e-15;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_PYRe )
	{
		Name	PYRe;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_PYRe_ef )
	{
		Name	PYRe_ef;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_Pie )
	{
		Name	Pie;
		Value	1.60000087677e-15;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_Pie_ef )
	{
		Name	Pie_ef;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__ENVIRONMENT_SIZE )
	{
		Name	SIZE;
		Value	1.66054018667e-37;
		Fixed	0;
	}
	
	
}

System System( /System__CELL_CYTOPLASM )
{
	StepperID	Default;
	Name	CYTOPLASM;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1e-13;
		Fixed	1;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_AC_Enzyme )
	{
		Name	AC_Enzyme;
		Value	5.03075663633e-23;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_AC_Purine )
	{
		Name	AC_Purine;
		Value	4.15135046669e-22;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_ADE )
	{
		Name	ADE;
		Value	1.48667985602e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_ADO )
	{
		Name	ADO;
		Value	4.45533346565e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_BPGSP )
	{
		Name	BPGSP;
		Value	3.2653626236e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_BPGSPP )
	{
		Name	BPGSPP;
		Value	4.69316856788e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_BPGSPP_P2GA )
	{
		Name	BPGSPP_P2GA;
		Value	4.8525786896e-25;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_BPGSPP_P3GA )
	{
		Name	BPGSPP_P3GA;
		Value	4.18223037212e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_BPGSPP_Phos )
	{
		Name	BPGSPP_Phos;
		Value	7.82067558676e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_BPGSP_B13PG )
	{
		Name	BPGSP_B13PG;
		Value	1.50093773882e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_BPGSP_B23PG )
	{
		Name	BPGSP_B23PG;
		Value	7.63975518649e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_CO2 )
	{
		Name	CO2;
		Value	1.2e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_DHAP )
	{
		Name	DHAP;
		Value	1.50813647925e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E4P )
	{
		Name	E4P;
		Value	4.57080392202e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_6PGLase )
	{
		Name	E_6PGLase;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_6PGODH )
	{
		Name	E_6PGODH;
		Value	2.10000214708e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_ADA )
	{
		Name	E_ADA;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_ADPRT )
	{
		Name	E_ADPRT;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_AK )
	{
		Name	E_AK;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_ALD )
	{
		Name	E_ALD;
		Value	9.96564633496e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_AMPDA )
	{
		Name	E_AMPDA;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_AMPase )
	{
		Name	E_AMPase;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_APK )
	{
		Name	E_APK;
		Value	9.69655836607e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_ATPase )
	{
		Name	E_ATPase;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_EN )
	{
		Name	E_EN;
		Value	2.19921942323e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_G6PDH )
	{
		Name	E_G6PDH;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_GAPDH )
	{
		Name	E_GAPDH;
		Value	1.19164434386e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_GSH_S )
	{
		Name	E_GSH_S;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_GSSGR )
	{
		Name	E_GSSGR;
		Value	1.25005465253e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_GSSG_transport )
	{
		Name	E_GSSG_transport;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_HGPRT )
	{
		Name	E_HGPRT;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_HK )
	{
		Name	E_HK;
		Value	2.39914846171e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_IMPase )
	{
		Name	E_IMPase;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_LDH )
	{
		Name	E_LDH;
		Value	3.43199999987e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_L_GCS )
	{
		Name	E_L_GCS;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_PFK )
	{
		Name	E_PFK;
		Value	7.55259562678e-22;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_PGI )
	{
		Name	E_PGI;
		Value	2.17922651938e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_PGK )
	{
		Name	E_PGK;
		Value	2.73902782712e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_PGM )
	{
		Name	E_PGM;
		Value	4.09854528875e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_PK )
	{
		Name	E_PK;
		Value	8.69691317369e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_PNPase )
	{
		Name	E_PNPase;
		Value	1.48847169145e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_PRM )
	{
		Name	E_PRM;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_PRPPsyn )
	{
		Name	E_PRPPsyn;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_R5PI )
	{
		Name	E_R5PI;
		Value	1.41949617318e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_TA )
	{
		Name	E_TA;
		Value	6.90004263769e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_TK1 )
	{
		Name	E_TK1;
		Value	3.29999151298e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_TK2 )
	{
		Name	E_TK2;
		Value	3.29999151298e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_TPI )
	{
		Name	E_TPI;
		Value	1.13959551931e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_E_X5PI )
	{
		Name	E_X5PI;
		Value	4.21850271184e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_F6P )
	{
		Name	F6P;
		Value	1.94320332539e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_FDP )
	{
		Name	FDP;
		Value	5.73494489796e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_G6P )
	{
		Name	G6P;
		Value	5.95701533001e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GA3P )
	{
		Name	GA3P;
		Value	3.63185552517e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GDP )
	{
		Name	GDP;
		Value	9.39567080905e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GL6P )
	{
		Name	GL6P;
		Value	5.2783560388e-22;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GLC )
	{
		Name	GLC;
		Value	4.7500026029e-15;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GO6P )
	{
		Name	GO6P;
		Value	4.47340262731e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GSH )
	{
		Name	GSH;
		Value	3.26817595457e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GSSG )
	{
		Name	GSSG;
		Value	4.64950010255e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GUA )
	{
		Name	GUA;
		Value	9.3000050962e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GUA2 )
	{
		Name	GUA2;
		Value	9.3000050962e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_GUO )
	{
		Name	GUO;
		Value	1.44000078909e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_H )
	{
		Name	H;
		Value	6.30733476043e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_HXi )
	{
		Name	HXi;
		Value	1.61826259957e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_IMP )
	{
		Name	IMP;
		Value	8.06159550843e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_INO )
	{
		Name	INO;
		Value	1.45790623069e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_Ki )
	{
		Name	Ki;
		Value	1.32657934273e-14;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_LACi )
	{
		Name	LACi;
		Value	1.33037001213e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_L_GC )
	{
		Name	L_GC;
		Value	4.22460644039e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_Mg )
	{
		Name	Mg;
		Value	6.02546046451e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_Mg13DPG )
	{
		Name	Mg13DPG;
		Value	2.9244047809e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_Mg23DPG )
	{
		Name	Mg23DPG;
		Value	5.69134634294e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_MgADP )
	{
		Name	MgADP;
		Value	1.30317097316e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_MgAMP )
	{
		Name	MgAMP;
		Value	9.10608428e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_MgATP )
	{
		Name	MgATP;
		Value	1.41363173106e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_MgFDP )
	{
		Name	MgFDP;
		Value	1.48186802716e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_MgGDP )
	{
		Name	MgGDP;
		Value	2.42777296266e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_MgPi )
	{
		Name	MgPi;
		Value	2.14414515235e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_NAD )
	{
		Name	NAD;
		Value	6.50246868074e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_NADH )
	{
		Name	NADH;
		Value	2.75312544498e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_NADP )
	{
		Name	NADP;
		Value	6.47790466429e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_NADPH )
	{
		Name	NADPH;
		Value	6.52816558822e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_Nai )
	{
		Name	Nai;
		Value	3.39301198297e-15;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_PCO2 )
	{
		Name	PCO2;
		Value	6.6421607467e-23;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_PEP )
	{
		Name	PEP;
		Value	8.18573653702e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_PO2 )
	{
		Name	PO2;
		Value	1.66054018667e-22;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_PRPP )
	{
		Name	PRPP;
		Value	1.41109948112e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_PYRi )
	{
		Name	PYRi;
		Value	5.16472182176e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_Pi )
	{
		Name	Pi;
		Value	1.01650165019e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_R1P )
	{
		Name	R1P;
		Value	8.07966586923e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_R5P )
	{
		Name	R5P;
		Value	5.85774443868e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_RU5P )
	{
		Name	RU5P;
		Value	4.92600254901e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_S7P )
	{
		Name	S7P;
		Value	2.10189033356e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_SIZE )
	{
		Name	SIZE;
		Value	1.66054018667e-37;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_T )
	{
		Name	T;
		Value	6.6421607467e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_X5P )
	{
		Name	X5P;
		Value	8.99366108609e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM__13DPG )
	{
		Name	_13DPG;
		Value	2.3551533553e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM__2PG )
	{
		Name	_2PG;
		Value	1.45234006221e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM__3PG )
	{
		Name	_3PG;
		Value	4.81692479603e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3 )
	{
		Name	band3;
		Value	2.7129058521e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3ALD )
	{
		Name	band3ALD;
		Value	2.70358602622e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3GAPDH )
	{
		Name	band3GAPDH;
		Value	6.4656378282e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3PFK )
	{
		Name	band3PFK;
		Value	1.02447404373e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3_ka )
	{
		Name	band3_ka;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3_kd )
	{
		Name	band3_kd;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3deoxyHb )
	{
		Name	band3deoxyHb;
		Value	1.04807021958e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3deoxyHb13DPG )
	{
		Name	band3deoxyHb13DPG;
		Value	3.82596744607e-23;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3deoxyHb23DPG )
	{
		Name	band3deoxyHb23DPG;
		Value	6.81139246728e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3deoxyHbADP )
	{
		Name	band3deoxyHbADP;
		Value	1.1346263267e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3deoxyHbATP )
	{
		Name	band3deoxyHbATP;
		Value	2.30103061058e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3deoxyHbFDP )
	{
		Name	band3deoxyHbFDP;
		Value	6.07073120806e-22;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3deoxyHbGDP )
	{
		Name	band3deoxyHbGDP;
		Value	9.9457959956e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3deoxyHbMgATP )
	{
		Name	band3deoxyHbMgATP;
		Value	2.07421944628e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3oxyHb )
	{
		Name	band3oxyHb;
		Value	1.29702041455e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3oxyHb13DPG )
	{
		Name	band3oxyHb13DPG;
		Value	9.67315960722e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3oxyHb23DPG )
	{
		Name	band3oxyHb23DPG;
		Value	4.21465800504e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3oxyHbADP )
	{
		Name	band3oxyHbADP;
		Value	2.9252840942e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3oxyHbATP )
	{
		Name	band3oxyHbATP;
		Value	3.9428293413e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3oxyHbFDP )
	{
		Name	band3oxyHbFDP;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3oxyHbGDP )
	{
		Name	band3oxyHbGDP;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_band3oxyHbMgATP )
	{
		Name	band3oxyHbMgATP;
		Value	7.15068593396e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_cysteine )
	{
		Name	cysteine;
		Value	2e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_deoxyHb )
	{
		Name	deoxyHb;
		Value	3.86327530963e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_deoxyHb13DPG )
	{
		Name	deoxyHb13DPG;
		Value	1.41028390023e-21;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_deoxyHb23DPG )
	{
		Name	deoxyHb23DPG;
		Value	2.51073676662e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_deoxyHbADP )
	{
		Name	deoxyHbADP;
		Value	4.1823284277e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_deoxyHbATP )
	{
		Name	deoxyHbATP;
		Value	8.48179308834e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_deoxyHbFDP )
	{
		Name	deoxyHbFDP;
		Value	2.23772277366e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_deoxyHbGDP )
	{
		Name	deoxyHbGDP;
		Value	3.66610436845e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_deoxyHbMgATP )
	{
		Name	deoxyHbMgATP;
		Value	7.6457479889e-19;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_f23DPG )
	{
		Name	f23DPG;
		Value	1.29979696781e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_fADP )
	{
		Name	fADP;
		Value	9.02155143092e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_fAMP )
	{
		Name	fAMP;
		Value	3.3550178341e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_fATP )
	{
		Name	fATP;
		Value	8.44420303875e-18;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_glutamate )
	{
		Name	glutamate;
		Value	2e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_glycine )
	{
		Name	glycine;
		Value	1.8e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_oxyHb )
	{
		Name	oxyHb;
		Value	4.78092674517e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_oxyHb13DPG )
	{
		Name	oxyHb13DPG;
		Value	3.56560829403e-20;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_oxyHb23DPG )
	{
		Name	oxyHb23DPG;
		Value	1.55355852167e-16;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_oxyHbADP )
	{
		Name	oxyHbADP;
		Value	1.07828441298e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_oxyHbATP )
	{
		Name	oxyHbATP;
		Value	1.45336018139e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_oxyHbMgATP )
	{
		Name	oxyHbMgATP;
		Value	2.63580320282e-17;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_CYTOPLASM_pHi )
	{
		Name	pHi;
		Value	1.26338470032e-23;
		Fixed	0;
	}
	
	
}

System System( /System__CELL_MEMBRANE )
{
	StepperID	Default;
	Name	MEMBRANE;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1e-13;
		Fixed	1;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_AC_K_Leak )
	{
		Name	AC_K_Leak;
		Value	3.99530187731e-22;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_AC_NaK_Pump )
	{
		Name	AC_NaK_Pump;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_ADEtr )
	{
		Name	E_ADEtr;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_ADOtr )
	{
		Name	E_ADOtr;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_HXtr )
	{
		Name	E_HXtr;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_INOtr )
	{
		Name	E_INOtr;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_K_Leak )
	{
		Name	E_K_Leak;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_LACtr )
	{
		Name	E_LACtr;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_NaK_Pump )
	{
		Name	E_NaK_Pump;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_Na_Leak )
	{
		Name	E_Na_Leak;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_PYRtr )
	{
		Name	E_PYRtr;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_E_Pitr )
	{
		Name	E_Pitr;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	Variable Variable( Variable__CELL_MEMBRANE_SIZE )
	{
		Name	SIZE;
		Value	1.66054018667e-37;
		Fixed	0;
	}
	
	
}

System System( /System___ )
{
	StepperID	Default;
	Name	root;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( Variable___SIZE )
	{
		Name	SIZE;
		Value	1.66054018667e-24;
		Fixed	0;
	}
	
	
}

System System( /SBMLParameter )
{
	StepperID	Default;
	Name	"Global Parameter";

	Variable Variable( N_A )
	{
		Name	N_A;
		Value	6.0221367e+23;
		Fixed	1;
	}
	
	
}

