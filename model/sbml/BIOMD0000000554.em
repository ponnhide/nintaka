
# created by eml2em program
# from file: cloutier_2009.eml, date: Mon Nov  9 02:48:06 2015
#

Stepper ODE45eventStepper( ODE )
{
        MaxStepInterval 0.01;
        EventStepInterval 0.0001;
}

Stepper PassiveStepper( PSV )
{
	# no property
}

System System( / )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	
}

System System( /Vg_pump )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vg_pump )
	{
		Value	0.0634531133946;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_pump )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Sm_g.Value / Vg.Value * kpump.Value * ATPg.Value * NAg.Value * pow( 1 + ATPg.Value / Km_pump.Value, -1 )";
		VariableReferenceList
			[ Vg_pump :/Vg_pump:Vg_pump          1 ]
			[ kpump   :/model_parameters:kpump   0 ]
			[ Km_pump :/model_parameters:Km_pump 0 ]
			[ Sm_g    :/model_parameters:Sm_g    0 ]
			[ Vg      :/model_parameters:Vg      0 ]
			[ ATPg    :/ATPg:ATPg                0 ]
			[ NAg     :/NAg:NAg                  0 ];
	}
	
	
}

System System( /Vc_O2 )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vc_O2 )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vc_O2 )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"2.0 * Fin_t.Value / Vc.Value * ( O2a.Value - O2c.Value )";
		VariableReferenceList
			[ Vc_O2 :/Vc_O2:Vc_O2          1 ]
			[ Fin_t :/Fin_t:Fin_t          0 ]
			[ Vc    :/model_parameters:Vc  0 ]
			[ O2a   :/model_parameters:O2a 0 ]
			[ O2c   :/O2c:O2c              0 ];
	}
	
	
}

System System( /Vn_ATPase )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_n_ATPase )
	{
		Value	0.04889;
		Name	__none__;
	}
	
	Variable Variable( Vn_ATPase )
	{
		Value	0.0488683691709;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_ATPase )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_n_ATPase.Value * ATPn.Value / ( ATPn.Value + 0.001 )";
		VariableReferenceList
			[ Vn_ATPase     :/Vn_ATPase:Vn_ATPase     1 ]
			[ Vmax_n_ATPase :/Vn_ATPase:Vmax_n_ATPase 0 ]
			[ ATPn          :/ATPn:ATPn               0 ];
	}
	
	
}

System System( /ATPn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( ATPn )
	{
		Value	2.2592;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( ATPn )
	{
		Name	__none__;
		Expression	"( nOP.Value * Vn_mito.Value + Vn_pgk.Value + Vn_pk.Value + Vn_ck.Value - ( Vn_hk.Value + Vn_pfk.Value + Vn_ATPase.Value + Vn_pump.Value ) ) * pow( 1 - dAMP_dATPn.Value, -1 )";
		VariableReferenceList
			[ ATPn       :/ATPn:ATPn             1 ]
			[ nOP        :/model_parameters:nOP  0 ]
			[ Vn_hk      :/Vn_hk:Vn_hk           0 ]
			[ Vn_pfk     :/Vn_pfk:Vn_pfk         0 ]
			[ Vn_pgk     :/Vn_pgk:Vn_pgk         0 ]
			[ Vn_pk      :/Vn_pk:Vn_pk           0 ]
			[ Vn_ATPase  :/Vn_ATPase:Vn_ATPase   0 ]
			[ Vn_pump    :/Vn_pump:Vn_pump       0 ]
			[ Vn_mito    :/Vn_mito:Vn_mito       0 ]
			[ Vn_ck      :/Vn_ck:Vn_ck           0 ]
			[ dAMP_dATPn :/dAMP_dATPn:dAMP_dATPn 0 ];
	}
	
	
}

System System( /ATPg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( ATPg )
	{
		Value	2.24;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( ATPg )
	{
		Name	__none__;
		Expression	"( Vg_pgk.Value + Vg_pk.Value + nOP.Value * Vg_mito.Value + Vg_ck.Value - ( Vg_hk.Value + Vg_pfk.Value + Vg_ATPase.Value + Vg_pump.Value + Vg_gs.Value ) ) * pow( 1 - dAMP_dATPg.Value, -1 )";
		VariableReferenceList
			[ ATPg       :/ATPg:ATPg             1 ]
			[ nOP        :/model_parameters:nOP  0 ]
			[ Vg_hk      :/Vg_hk:Vg_hk           0 ]
			[ Vg_pfk     :/Vg_pfk:Vg_pfk         0 ]
			[ Vg_pgk     :/Vg_pgk:Vg_pgk         0 ]
			[ Vg_pk      :/Vg_pk:Vg_pk           0 ]
			[ Vg_ATPase  :/Vg_ATPase:Vg_ATPase   0 ]
			[ Vg_pump    :/Vg_pump:Vg_pump       0 ]
			[ Vg_mito    :/Vg_mito:Vg_mito       0 ]
			[ Vg_ck      :/Vg_ck:Vg_ck           0 ]
			[ Vg_gs      :/Vg_gs:Vg_gs           0 ]
			[ dAMP_dATPg :/dAMP_dATPg:dAMP_dATPg 0 ];
	}
	
	
}

System System( /LACc )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( LACc )
	{
		Value	0.3251;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( LACc )
	{
		Name	__none__;
		Expression	"Vc_LAC.Value + Vec_LAC.Value * 1 / Rce.Value + Vgc_LAC.Value * 1 / Rcg.Value";
		VariableReferenceList
			[ LACc    :/LACc:LACc            1 ]
			[ Rce     :/model_parameters:Rce 0 ]
			[ Rcg     :/model_parameters:Rcg 0 ]
			[ Vc_LAC  :/Vc_LAC:Vc_LAC        0 ]
			[ Vec_LAC :/Vec_LAC:Vec_LAC      0 ]
			[ Vgc_LAC :/Vgc_LAC:Vgc_LAC      0 ];
	}
	
	
}

System System( /NAg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( NAg )
	{
		Value	13.36;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( NAg )
	{
		Name	__none__;
		Expression	"Vg_leak_Na.Value + 3 * Veg_GLU.Value - 3 * Vg_pump.Value";
		VariableReferenceList
			[ NAg        :/NAg:NAg               1 ]
			[ Vg_leak_Na :/Vg_leak_Na:Vg_leak_Na 0 ]
			[ Vg_pump    :/Vg_pump:Vg_pump       0 ]
			[ Veg_GLU    :/Veg_GLU:Veg_GLU       0 ];
	}
	
	
}

System System( /LACg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( LACg )
	{
		Value	0.4651;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( LACg )
	{
		Name	__none__;
		Expression	"Vg_ldh.Value - ( Vge_LAC.Value + Vgc_LAC.Value )";
		VariableReferenceList
			[ LACg    :/LACg:LACg       1 ]
			[ Vg_ldh  :/Vg_ldh:Vg_ldh   0 ]
			[ Vge_LAC :/Vge_LAC:Vge_LAC 0 ]
			[ Vgc_LAC :/Vgc_LAC:Vgc_LAC 0 ];
	}
	
	
}

System System( /v_stim )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( unitpulseSB )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( v_stim )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( v_stim )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"stim.Value * ( v1_n.Value + v2_n.Value * ( time.Value - to.Value ) / t_n_stim.Value * exp( -( ( time.Value - to.Value ) * unitpulseSB.Value / t_n_stim.Value ) ) ) * unitpulseSB.Value";
		VariableReferenceList
			[ v_stim      :/v_stim:v_stim             1 ]
			[ unitpulseSB :/v_stim:unitpulseSB        0 ]
			[ stim        :/model_parameters:stim     0 ]
			[ to          :/model_parameters:to       0 ]
			[ t_n_stim    :/model_parameters:t_n_stim 0 ]
			[ v1_n        :/model_parameters:v1_n     0 ]
			[ v2_n        :/model_parameters:v2_n     0 ]
			[ time        :/environment:time          0 ];
	}
	
	Process PiecewiseProcess( unitpulseSB )
	{
		Priority	2;
		Name	__none__;
		Expression	"piecewise( 1, and( geq( time.Value, to.Value ), leq( time.Value, to.Value + tend.Value ) ), 0 )";
		VariableReferenceList
			[ unitpulseSB :/v_stim:unitpulseSB    1 ]
			[ to          :/model_parameters:to   0 ]
			[ tend        :/model_parameters:tend 0 ]
			[ time        :/environment:time      0 ];
	}
	
	
}

System System( /NAn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( NAn )
	{
		Value	15.533;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( NAn )
	{
		Name	__none__;
		Expression	"Vn_leak_Na.Value + Vn_stim.Value - 3 * Vn_pump.Value";
		VariableReferenceList
			[ NAn        :/NAn:NAn               1 ]
			[ Vn_leak_Na :/Vn_leak_Na:Vn_leak_Na 0 ]
			[ Vn_pump    :/Vn_pump:Vn_pump       0 ]
			[ Vn_stim    :/Vn_stim:Vn_stim       0 ];
	}
	
	
}

System System( /LACn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( LACn )
	{
		Value	0.3856;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( LACn )
	{
		Name	__none__;
		Expression	"Vn_ldh.Value - Vne_LAC.Value";
		VariableReferenceList
			[ LACn    :/LACn:LACn       1 ]
			[ Vn_ldh  :/Vn_ldh:Vn_ldh   0 ]
			[ Vne_LAC :/Vne_LAC:Vne_LAC 0 ];
	}
	
	
}

System System( /environment )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( time )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
        Process ExpressionFluxProcess( stepper_current_time )
        {
                StepperID ODE;
                Priority  3;
                Expression "1.0";
                VariableReferenceList
                        [ time Variable:.:time   1 ];
        }


	
}

System System( /BOLD )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( BOLD )
	{
		Value	0.04179315;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( BOLD )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vv0.Value * ( ( k1.Value + k2.Value ) * ( 1 - dHb.Value / dHb0.Value ) - ( k2.Value + k3.Value ) * ( 1 - Vv.Value / Vv0.Value ) )";
		VariableReferenceList
			[ BOLD :/BOLD:BOLD             1 ]
			[ Vv0  :/model_parameters:Vv0  0 ]
			[ k1   :/model_parameters:k1   0 ]
			[ k2   :/model_parameters:k2   0 ]
			[ k3   :/model_parameters:k3   0 ]
			[ Vv   :/Vv:Vv                 0 ]
			[ dHb  :/dHb:dHb               0 ]
			[ dHb0 :/model_parameters:dHb0 0 ];
	}
	
	
}

System System( /CO2c )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( CO2c )
	{
		Value	2.12;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( CO2c )
	{
		Name	__none__;
		Expression	"Vnc_CO2.Value * 1 / Rcn.Value + Vgc_CO2.Value * 1 / Rcg.Value - Vc_CO2.Value";
		VariableReferenceList
			[ CO2c    :/CO2c:CO2c            1 ]
			[ Rcn     :/model_parameters:Rcn 0 ]
			[ Rcg     :/model_parameters:Rcg 0 ]
			[ Vnc_CO2 :/Vnc_CO2:Vnc_CO2      0 ]
			[ Vc_CO2  :/Vc_CO2:Vc_CO2        0 ]
			[ Vgc_CO2 :/Vgc_CO2:Vgc_CO2      0 ];
	}
	
	
}

System System( /dHb )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( dHb )
	{
		Value	0.0218;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( dHb )
	{
		Name	__none__;
		Expression	"Fin_t.Value * ( O2a.Value - O2c.Value ) - Fout_t.Value * dHb.Value / Vv.Value";
		VariableReferenceList
			[ dHb    :/dHb:dHb              1 ]
			[ Fin_t  :/Fin_t:Fin_t          0 ]
			[ Fout_t :/Fout_t:Fout_t        0 ]
			[ Vv     :/Vv:Vv                0 ]
			[ O2a    :/model_parameters:O2a 0 ]
			[ O2c    :/O2c:O2c              0 ];
	}
	
	
}

System System( /Vg_ldh )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( kfg_ldh )
	{
		Value	6.2613;
		Name	__none__;
	}
	
	Variable Variable( krg_ldh )
	{
		Value	0.54682;
		Name	__none__;
	}
	
	Variable Variable( Vg_ldh )
	{
		Value	0.003039015294;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_ldh )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kfg_ldh.Value * PYRg.Value * NADHg.Value - krg_ldh.Value * LACg.Value * NADg.Value";
		VariableReferenceList
			[ Vg_ldh  :/Vg_ldh:Vg_ldh  1 ]
			[ kfg_ldh :/Vg_ldh:kfg_ldh 0 ]
			[ krg_ldh :/Vg_ldh:krg_ldh 0 ]
			[ PYRg    :/PYRg:PYRg      0 ]
			[ NADHg   :/NADHg:NADHg    0 ]
			[ LACg    :/LACg:LACg      0 ]
			[ NADg    :/NADg:NADg      0 ];
	}
	
	
}

System System( /GAPg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GAPg )
	{
		Value	0.0698;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GAPg )
	{
		Name	__none__;
		Expression	"2 * Vg_pfk.Value - Vg_pgk.Value";
		VariableReferenceList
			[ GAPg   :/GAPg:GAPg     1 ]
			[ Vg_pgk :/Vg_pgk:Vg_pgk 0 ]
			[ Vg_pfk :/Vg_pfk:Vg_pfk 0 ];
	}
	
	
}

System System( /Vg_leak_Na )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( gg_NA )
	{
		Value	0.00325;
		Name	__none__;
	}
	
	Variable Variable( Vg_leak_Na )
	{
		Value	0.190378997692;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_leak_Na )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Sm_g.Value / Vg.Value * gg_NA.Value / F.Value * ( RT.Value / F.Value * log( NAe.Value / NAg.Value ) - Vm.Value )";
		VariableReferenceList
			[ Vg_leak_Na :/Vg_leak_Na:Vg_leak_Na 1 ]
			[ gg_NA      :/Vg_leak_Na:gg_NA      0 ]
			[ Sm_g       :/model_parameters:Sm_g 0 ]
			[ Vm         :/model_parameters:Vm   0 ]
			[ Vg         :/model_parameters:Vg   0 ]
			[ RT         :/model_parameters:RT   0 ]
			[ F          :/model_parameters:F    0 ]
			[ NAe        :/model_parameters:NAe  0 ]
			[ NAg        :/NAg:NAg               0 ];
	}
	
	
}

System System( /GAPn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GAPn )
	{
		Value	0.0418;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GAPn )
	{
		Name	__none__;
		Expression	"2 * Vn_pfk.Value - Vn_pgk.Value";
		VariableReferenceList
			[ GAPn   :/GAPn:GAPn     1 ]
			[ Vn_pgk :/Vn_pgk:Vn_pgk 0 ]
			[ Vn_pfk :/Vn_pfk:Vn_pfk 0 ];
	}
	
	
}

System System( /O2n )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( O2n )
	{
		Value	0.0975;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( O2n )
	{
		Name	__none__;
		Expression	"Vcn_O2.Value - NAero.Value * Vn_mito.Value";
		VariableReferenceList
			[ O2n     :/O2n:O2n                1 ]
			[ NAero   :/model_parameters:NAero 0 ]
			[ Vn_mito :/Vn_mito:Vn_mito        0 ]
			[ Vcn_O2  :/Vcn_O2:Vcn_O2          0 ];
	}
	
	
}

System System( /Vgc_CO2 )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vgc_CO2 )
	{
		Value	0.0180338749325;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vgc_CO2 )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"3.0 * Vg_mito.Value";
		VariableReferenceList
			[ Vgc_CO2 :/Vgc_CO2:Vgc_CO2 1 ]
			[ Vg_mito :/Vg_mito:Vg_mito 0 ];
	}
	
	
}

System System( /Vg_ck )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( krg_ck )
	{
		Value	0.02073;
		Name	__none__;
	}
	
	Variable Variable( kfg_ck )
	{
		Value	0.0243;
		Name	__none__;
	}
	
	Variable Variable( Vg_ck )
	{
		Value	8.98869880249e-05;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_ck )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kfg_ck.Value * PCrg.Value * ADPg.Value - krg_ck.Value * CRg.Value * ATPg.Value";
		VariableReferenceList
			[ Vg_ck  :/Vg_ck:Vg_ck  1 ]
			[ krg_ck :/Vg_ck:krg_ck 0 ]
			[ kfg_ck :/Vg_ck:kfg_ck 0 ]
			[ PCrg   :/PCrg:PCrg    0 ]
			[ ADPg   :/ADPg:ADPg    0 ]
			[ CRg    :/CRg:CRg      0 ]
			[ ATPg   :/ATPg:ATPg    0 ];
	}
	
	
}

System System( /O2g )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( O2g )
	{
		Value	0.1589;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( O2g )
	{
		Name	__none__;
		Expression	"Vcg_O2.Value - NAero.Value * Vg_mito.Value";
		VariableReferenceList
			[ O2g     :/O2g:O2g                1 ]
			[ NAero   :/model_parameters:NAero 0 ]
			[ Vg_mito :/Vg_mito:Vg_mito        0 ]
			[ Vcg_O2  :/Vcg_O2:Vcg_O2          0 ];
	}
	
	
}

System System( /Vc_GLC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vc_GLC )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vc_GLC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"2.0 * Fin_t.Value / Vc.Value * ( GLCa.Value - GLCc.Value )";
		VariableReferenceList
			[ Vc_GLC :/Vc_GLC:Vc_GLC         1 ]
			[ Fin_t  :/Fin_t:Fin_t           0 ]
			[ Vc     :/model_parameters:Vc   0 ]
			[ GLCa   :/model_parameters:GLCa 0 ]
			[ GLCc   :/GLCc:GLCc             0 ];
	}
	
	
}

System System( /O2c )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( O2c )
	{
		Value	7.4201;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( O2c )
	{
		Name	__none__;
		Expression	"Vc_O2.Value - ( Vcn_O2.Value * 1 / Rcn.Value + Vcg_O2.Value * 1 / Rcg.Value )";
		VariableReferenceList
			[ O2c    :/O2c:O2c              1 ]
			[ Rcn    :/model_parameters:Rcn 0 ]
			[ Rcg    :/model_parameters:Rcg 0 ]
			[ Vc_O2  :/Vc_O2:Vc_O2          0 ]
			[ Vcn_O2 :/Vcn_O2:Vcn_O2        0 ]
			[ Vcg_O2 :/Vcg_O2:Vcg_O2        0 ];
	}
	
	
}

System System( /Vge_LAC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_ge_LAC )
	{
		Value	0.086124;
		Name	__none__;
	}
	
	Variable Variable( Km_ge_LAC )
	{
		Value	0.22163;
		Name	__none__;
	}
	
	Variable Variable( Vge_LAC )
	{
		Value	0.0029801326466;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vge_LAC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_ge_LAC.Value * ( LACg.Value / ( LACg.Value + Km_ge_LAC.Value ) - LACe.Value / ( LACe.Value + Km_ge_LAC.Value ) )";
		VariableReferenceList
			[ Vge_LAC     :/Vge_LAC:Vge_LAC     1 ]
			[ Vmax_ge_LAC :/Vge_LAC:Vmax_ge_LAC 0 ]
			[ Km_ge_LAC   :/Vge_LAC:Km_ge_LAC   0 ]
			[ LACg        :/LACg:LACg           0 ]
			[ LACe        :/LACe:LACe           0 ];
	}
	
	
}

System System( /PEPn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PEPn )
	{
		Value	0.0037;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( PEPn )
	{
		Name	__none__;
		Expression	"Vn_pgk.Value - Vn_pk.Value";
		VariableReferenceList
			[ PEPn   :/PEPn:PEPn     1 ]
			[ Vn_pgk :/Vn_pgk:Vn_pgk 0 ]
			[ Vn_pk  :/Vn_pk:Vn_pk   0 ];
	}
	
	
}

System System( /Vc_CO2 )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vc_CO2 )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vc_CO2 )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"2.0 * Fin_t.Value / Vc.Value * ( CO2c.Value - CO2a.Value )";
		VariableReferenceList
			[ Vc_CO2 :/Vc_CO2:Vc_CO2         1 ]
			[ Fin_t  :/Fin_t:Fin_t           0 ]
			[ Vc     :/model_parameters:Vc   0 ]
			[ CO2a   :/model_parameters:CO2a 0 ]
			[ CO2c   :/CO2c:CO2c             0 ];
	}
	
	
}

System System( /Vn_pk )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( kn_pk )
	{
		Value	28.6;
		Name	__none__;
	}
	
	Variable Variable( Vn_pk )
	{
		Value	0.0120203036982;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_pk )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kn_pk.Value * PEPn.Value * ADPn.Value";
		VariableReferenceList
			[ Vn_pk :/Vn_pk:Vn_pk 1 ]
			[ kn_pk :/Vn_pk:kn_pk 0 ]
			[ PEPn  :/PEPn:PEPn   0 ]
			[ ADPn  :/ADPn:ADPn   0 ];
	}
	
	
}

System System( /PEPg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PEPg )
	{
		Value	0.0254;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( PEPg )
	{
		Name	__none__;
		Expression	"Vg_pgk.Value - Vg_pk.Value";
		VariableReferenceList
			[ PEPg   :/PEPg:PEPg     1 ]
			[ Vg_pgk :/Vg_pgk:Vg_pgk 0 ]
			[ Vg_pk  :/Vg_pk:Vg_pk   0 ];
	}
	
	
}

System System( /PCrg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PCrg )
	{
		Value	4.6817;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( PCrg )
	{
		Name	__none__;
		Expression	"-Vg_ck.Value";
		VariableReferenceList
			[ PCrg  :/PCrg:PCrg   1 ]
			[ Vg_ck :/Vg_ck:Vg_ck 0 ];
	}
	
	
}

System System( /unitstepSB )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( unitstepSB )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process PiecewiseProcess( unitstepSB )
	{
		Priority	2;
		Name	__none__;
		Expression	"piecewise( 1, geq( time.Value - ( tend.Value + to.Value ), 0 ), 0 )";
		VariableReferenceList
			[ unitstepSB :/unitstepSB:unitstepSB 1 ]
			[ to         :/model_parameters:to   0 ]
			[ tend       :/model_parameters:tend 0 ]
			[ time       :/environment:time      0 ];
	}
	
	
}

System System( /Fout_t )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Fout_t )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Fout_t )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"CBF0.Value * ( pow( Vv.Value / Vv0.Value, 2 ) + tv.Value * pow( Vv.Value / Vv0.Value, -0.5 ) * Fin_t.Value / Vv0.Value ) / ( 1 + CBF0.Value * tv.Value * pow( Vv.Value / Vv0.Value, -0.5 ) * 1 / Vv0.Value )";
		VariableReferenceList
			[ Fout_t :/Fout_t:Fout_t         1 ]
			[ Fin_t  :/Fin_t:Fin_t           0 ]
			[ CBF0   :/model_parameters:CBF0 0 ]
			[ Vv     :/Vv:Vv                 0 ]
			[ Vv0    :/model_parameters:Vv0  0 ]
			[ tv     :/model_parameters:tv   0 ];
	}
	
	
}

System System( /PCrn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PCrn )
	{
		Value	4.2529;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( PCrn )
	{
		Name	__none__;
		Expression	"-Vn_ck.Value";
		VariableReferenceList
			[ PCrn  :/PCrn:PCrn   1 ]
			[ Vn_ck :/Vn_ck:Vn_ck 0 ];
	}
	
	
}

System System( /GLUn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GLUn )
	{
		Value	3.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GLUn )
	{
		Name	__none__;
		Expression	"Vg_gs.Value * 1 / Rng.Value - Vn_stim_GLU.Value";
		VariableReferenceList
			[ GLUn        :/GLUn:GLUn               1 ]
			[ Rng         :/model_parameters:Rng    0 ]
			[ Vg_gs       :/Vg_gs:Vg_gs             0 ]
			[ Vn_stim_GLU :/Vn_stim_GLU:Vn_stim_GLU 0 ];
	}
	
	
}

System System( /CRg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PCrg_tot )
	{
		Value	5.0;
		Name	__none__;
	}
	
	Variable Variable( CRg )
	{
		Value	0.3183;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( CRg )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"PCrg_tot.Value - PCrg.Value";
		VariableReferenceList
			[ CRg      :/CRg:CRg      1 ]
			[ PCrg_tot :/CRg:PCrg_tot 0 ]
			[ PCrg     :/PCrg:PCrg    0 ];
	}
	
	
}

System System( /NADHg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( NADHg )
	{
		Value	0.0445;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( NADHg )
	{
		Name	__none__;
		Expression	"Vg_pgk.Value - ( Vg_ldh.Value + Vg_mito.Value )";
		VariableReferenceList
			[ NADHg   :/NADHg:NADHg     1 ]
			[ Vg_pgk  :/Vg_pgk:Vg_pgk   0 ]
			[ Vg_ldh  :/Vg_ldh:Vg_ldh   0 ]
			[ Vg_mito :/Vg_mito:Vg_mito 0 ];
	}
	
	
}

System System( /GLUg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GLUg )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GLUg )
	{
		Name	__none__;
		Expression	"Veg_GLU.Value - Vg_gs.Value";
		VariableReferenceList
			[ GLUg    :/GLUg:GLUg       1 ]
			[ Veg_GLU :/Veg_GLU:Veg_GLU 0 ]
			[ Vg_gs   :/Vg_gs:Vg_gs     0 ];
	}
	
	
}

System System( /GLUe )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GLUe )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GLUe )
	{
		Name	__none__;
		Expression	"Vn_stim_GLU.Value * 1 / Ren.Value - Veg_GLU.Value * 1 / Reg.Value";
		VariableReferenceList
			[ GLUe        :/GLUe:GLUe               1 ]
			[ Reg         :/model_parameters:Reg    0 ]
			[ Ren         :/model_parameters:Ren    0 ]
			[ Vn_stim_GLU :/Vn_stim_GLU:Vn_stim_GLU 0 ]
			[ Veg_GLU     :/Veg_GLU:Veg_GLU         0 ];
	}
	
	
}

System System( /CRn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PCrn_tot )
	{
		Value	5.0;
		Name	__none__;
	}
	
	Variable Variable( CRn )
	{
		Value	0.7471;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( CRn )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"PCrn_tot.Value - PCrn.Value";
		VariableReferenceList
			[ CRn      :/CRn:CRn      1 ]
			[ PCrn_tot :/CRn:PCrn_tot 0 ]
			[ PCrn     :/PCrn:PCrn    0 ];
	}
	
	
}

System System( /NADHn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( NADHn )
	{
		Value	0.0319;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( NADHn )
	{
		Name	__none__;
		Expression	"Vn_pgk.Value - ( Vn_ldh.Value + Vn_mito.Value )";
		VariableReferenceList
			[ NADHn   :/NADHn:NADHn     1 ]
			[ Vn_pgk  :/Vn_pgk:Vn_pgk   0 ]
			[ Vn_ldh  :/Vn_ldh:Vn_ldh   0 ]
			[ Vn_mito :/Vn_mito:Vn_mito 0 ];
	}
	
	
}

System System( /Vne_LAC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_ne_LAC )
	{
		Value	0.1978;
		Name	__none__;
	}
	
	Variable Variable( Km_ne_LAC )
	{
		Value	0.09314;
		Name	__none__;
	}
	
	Variable Variable( Vne_LAC )
	{
		Value	-0.00101735054205;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vne_LAC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_ne_LAC.Value * ( LACn.Value / ( LACn.Value + Km_ne_LAC.Value ) - LACe.Value / ( LACe.Value + Km_ne_LAC.Value ) )";
		VariableReferenceList
			[ Vne_LAC     :/Vne_LAC:Vne_LAC     1 ]
			[ Vmax_ne_LAC :/Vne_LAC:Vmax_ne_LAC 0 ]
			[ Km_ne_LAC   :/Vne_LAC:Km_ne_LAC   0 ]
			[ LACn        :/LACn:LACn           0 ]
			[ LACe        :/LACe:LACe           0 ];
	}
	
	
}

System System( /G6Pn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( G6Pn )
	{
		Value	0.7275;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( G6Pn )
	{
		Name	__none__;
		Expression	"Vn_hk.Value - Vn_pgi.Value";
		VariableReferenceList
			[ G6Pn   :/G6Pn:G6Pn     1 ]
			[ Vn_pgi :/Vn_pgi:Vn_pgi 0 ]
			[ Vn_hk  :/Vn_hk:Vn_hk   0 ];
	}
	
	
}

System System( /AMPn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( AMPn )
	{
		Value	0.00620801646045;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( AMPn )
	{
		StepperID	ODE;
		Priority	2;
		Name	__none__;
		Expression	"ATPtot.Value - ( ATPn.Value + ADPn.Value )";
		VariableReferenceList
			[ AMPn   :/AMPn:AMPn               1 ]
			[ ATPtot :/model_parameters:ATPtot 0 ]
			[ ATPn   :/ATPn:ATPn               0 ]
			[ ADPn   :/ADPn:ADPn               0 ];
	}
	
	
}

System System( /G6Pg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( G6Pg )
	{
		Value	0.7326;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( G6Pg )
	{
		Name	__none__;
		Expression	"Vg_hk.Value + Vg_glyp.Value - ( Vg_pgi.Value + Vg_glys.Value )";
		VariableReferenceList
			[ G6Pg    :/G6Pg:G6Pg       1 ]
			[ Vg_pgi  :/Vg_pgi:Vg_pgi   0 ]
			[ Vg_glys :/Vg_glys:Vg_glys 0 ]
			[ Vg_glyp :/Vg_glyp:Vg_glyp 0 ]
			[ Vg_hk   :/Vg_hk:Vg_hk     0 ];
	}
	
	
}

System System( /Vn_stim )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vn_stim )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_stim )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"v_stim.Value";
		VariableReferenceList
			[ Vn_stim :/Vn_stim:Vn_stim 1 ]
			[ v_stim  :/v_stim:v_stim   0 ];
	}
	
	
}

System System( /AMPg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( AMPg )
	{
		Value	0.00829046167039;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( AMPg )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"ATPtot.Value - ( ATPg.Value + ADPg.Value )";
		VariableReferenceList
			[ AMPg   :/AMPg:AMPg               1 ]
			[ ATPtot :/model_parameters:ATPtot 0 ]
			[ ATPg   :/ATPg:ATPg               0 ]
			[ ADPg   :/ADPg:ADPg               0 ];
	}
	
	
}

System System( /Vcg_O2 )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PScapg )
	{
		Value	0.2457;
		Name	__none__;
	}
	
	Variable Variable( Vcg_O2 )
	{
		Value	0.0180867710645;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vcg_O2 )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"PScapg.Value / Vg.Value * ( Ko2.Value * pow( HbOP.Value / O2c.Value - 1.0, -1.0 / nh_O2.Value ) - O2g.Value )";
		VariableReferenceList
			[ Vcg_O2 :/Vcg_O2:Vcg_O2          1 ]
			[ PScapg :/Vcg_O2:PScapg          0 ]
			[ Ko2    :/model_parameters:Ko2   0 ]
			[ nh_O2  :/model_parameters:nh_O2 0 ]
			[ Vg     :/model_parameters:Vg    0 ]
			[ HbOP   :/model_parameters:HbOP  0 ]
			[ O2c    :/O2c:O2c                0 ]
			[ O2g    :/O2g:O2g                0 ];
	}
	
	
}

System System( /Vnc_CO2 )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vnc_CO2 )
	{
		Value	0.0387524264761;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vnc_CO2 )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"3.0 * Vn_mito.Value";
		VariableReferenceList
			[ Vnc_CO2 :/Vnc_CO2:Vnc_CO2 1 ]
			[ Vn_mito :/Vn_mito:Vn_mito 0 ];
	}
	
	
}

System System( /LACe )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( LACe )
	{
		Value	0.3986;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( LACe )
	{
		Name	__none__;
		Expression	"Vne_LAC.Value * 1 / Ren.Value + Vge_LAC.Value * 1 / Reg.Value - Vec_LAC.Value";
		VariableReferenceList
			[ LACe    :/LACe:LACe            1 ]
			[ Reg     :/model_parameters:Reg 0 ]
			[ Ren     :/model_parameters:Ren 0 ]
			[ Vec_LAC :/Vec_LAC:Vec_LAC      0 ]
			[ Vne_LAC :/Vne_LAC:Vne_LAC      0 ]
			[ Vge_LAC :/Vge_LAC:Vge_LAC      0 ];
	}
	
	
}

System System( /Vn_pgk )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( kn_pgk )
	{
		Value	0.4287;
		Name	__none__;
	}
	
	Variable Variable( Vn_pgk )
	{
		Value	0.0120026063021;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_pgk )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kn_pgk.Value * GAPn.Value * ADPn.Value * NADn.Value / NADHn.Value";
		VariableReferenceList
			[ Vn_pgk :/Vn_pgk:Vn_pgk 1 ]
			[ kn_pgk :/Vn_pgk:kn_pgk 0 ]
			[ ADPn   :/ADPn:ADPn     0 ]
			[ GAPn   :/GAPn:GAPn     0 ]
			[ NADn   :/NADn:NADn     0 ]
			[ NADHn  :/NADHn:NADHn   0 ];
	}
	
	
}

System System( /Vn_pgi )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmaxf_n_pgi )
	{
		Value	0.5;
		Name	__none__;
	}
	
	Variable Variable( Vmaxr_n_pgi )
	{
		Value	0.45;
		Name	__none__;
	}
	
	Variable Variable( Vn_pgi )
	{
		Value	0.00600284722883;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_pgi )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmaxf_n_pgi.Value * G6Pn.Value / ( G6Pn.Value + Km_G6P.Value ) - Vmaxr_n_pgi.Value * F6Pn.Value / ( F6Pn.Value + Km_F6P_pgi.Value )";
		VariableReferenceList
			[ Vn_pgi      :/Vn_pgi:Vn_pgi               1 ]
			[ Vmaxf_n_pgi :/Vn_pgi:Vmaxf_n_pgi          0 ]
			[ Vmaxr_n_pgi :/Vn_pgi:Vmaxr_n_pgi          0 ]
			[ Km_G6P      :/model_parameters:Km_G6P     0 ]
			[ Km_F6P_pgi  :/model_parameters:Km_F6P_pgi 0 ]
			[ F6Pn        :/F6Pn:F6Pn                   0 ]
			[ G6Pn        :/G6Pn:G6Pn                   0 ];
	}
	
	
}

System System( /Vg_ATPase )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_g_ATPase )
	{
		Value	0.035657;
		Name	__none__;
	}
	
	Variable Variable( Vg_ATPase )
	{
		Value	0.0356410887996;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_ATPase )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_g_ATPase.Value * ATPg.Value / ( ATPg.Value + 0.001 )";
		VariableReferenceList
			[ Vg_ATPase     :/Vg_ATPase:Vg_ATPase     1 ]
			[ Vmax_g_ATPase :/Vg_ATPase:Vmax_g_ATPase 0 ]
			[ ATPg          :/ATPg:ATPg               0 ];
	}
	
	
}

System System( /Vce_GLC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Km_ce_GLC )
	{
		Value	8.4568;
		Name	__none__;
	}
	
	Variable Variable( Vm_ce_GLC )
	{
		Value	0.0489;
		Name	__none__;
	}
	
	Variable Variable( Vce_GLC )
	{
		Value	0.015467393874;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vce_GLC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vm_ce_GLC.Value * ( GLCc.Value / ( GLCc.Value + Km_ce_GLC.Value ) - GLCe.Value / ( GLCe.Value + Km_ce_GLC.Value ) )";
		VariableReferenceList
			[ Vce_GLC   :/Vce_GLC:Vce_GLC   1 ]
			[ Km_ce_GLC :/Vce_GLC:Km_ce_GLC 0 ]
			[ Vm_ce_GLC :/Vce_GLC:Vm_ce_GLC 0 ]
			[ GLCe      :/GLCe:GLCe         0 ]
			[ GLCc      :/GLCc:GLCc         0 ];
	}
	
	
}

System System( /Vg_hk )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_g_hk )
	{
		Value	0.050461;
		Name	__none__;
	}
	
	Variable Variable( Vg_hk )
	{
		Value	0.00455613617326;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_hk )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_g_hk.Value * ATPg.Value * GLCg.Value / ( GLCg.Value + Km_GLC.Value ) * ( 1 - 1 / ( 1 + exp( -aG6P_inh_hk.Value * 1 * ( G6Pg.Value - G6P_inh_hk.Value ) ) ) )";
		VariableReferenceList
			[ Vg_hk       :/Vg_hk:Vg_hk                  1 ]
			[ Vmax_g_hk   :/Vg_hk:Vmax_g_hk              0 ]
			[ Km_GLC      :/model_parameters:Km_GLC      0 ]
			[ GLCg        :/GLCg:GLCg                    0 ]
			[ ATPg        :/ATPg:ATPg                    0 ]
			[ G6Pg        :/G6Pg:G6Pg                    0 ]
			[ G6P_inh_hk  :/model_parameters:G6P_inh_hk  0 ]
			[ aG6P_inh_hk :/model_parameters:aG6P_inh_hk 0 ];
	}
	
	
}

System System( /NADg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( NADH_g_tot )
	{
		Value	0.22;
		Name	__none__;
	}
	
	Variable Variable( NADg )
	{
		Value	0.1755;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( NADg )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"NADH_g_tot.Value - NADHg.Value";
		VariableReferenceList
			[ NADg       :/NADg:NADg       1 ]
			[ NADH_g_tot :/NADg:NADH_g_tot 0 ]
			[ NADHg      :/NADHg:NADHg     0 ];
	}
	
	
}

System System( /PYRn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PYRn )
	{
		Value	0.0388;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( PYRn )
	{
		Name	__none__;
		Expression	"Vn_pk.Value - ( Vn_ldh.Value + Vn_mito.Value )";
		VariableReferenceList
			[ PYRn    :/PYRn:PYRn       1 ]
			[ Vn_pk   :/Vn_pk:Vn_pk     0 ]
			[ Vn_ldh  :/Vn_ldh:Vn_ldh   0 ]
			[ Vn_mito :/Vn_mito:Vn_mito 0 ];
	}
	
	
}

System System( /F6Pg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( F6Pg )
	{
		Value	0.1116;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( F6Pg )
	{
		Name	__none__;
		Expression	"Vg_pgi.Value - Vg_pfk.Value";
		VariableReferenceList
			[ F6Pg   :/F6Pg:F6Pg     1 ]
			[ Vg_pgi :/Vg_pgi:Vg_pgi 0 ]
			[ Vg_pfk :/Vg_pfk:Vg_pfk 0 ];
	}
	
	
}

System System( /PYRg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( PYRg )
	{
		Value	0.1711;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( PYRg )
	{
		Name	__none__;
		Expression	"Vg_pk.Value - ( Vg_ldh.Value + Vg_mito.Value )";
		VariableReferenceList
			[ PYRg    :/PYRg:PYRg       1 ]
			[ Vg_ldh  :/Vg_ldh:Vg_ldh   0 ]
			[ Vg_pk   :/Vg_pk:Vg_pk     0 ]
			[ Vg_mito :/Vg_mito:Vg_mito 0 ];
	}
	
	
}

System System( /F6Pn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( F6Pn )
	{
		Value	0.1091;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( F6Pn )
	{
		Name	__none__;
		Expression	"Vn_pgi.Value - Vn_pfk.Value";
		VariableReferenceList
			[ F6Pn   :/F6Pn:F6Pn     1 ]
			[ Vn_pgi :/Vn_pgi:Vn_pgi 0 ]
			[ Vn_pfk :/Vn_pfk:Vn_pfk 0 ];
	}
	
	
}

System System( /NADn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( NADH_n_tot )
	{
		Value	0.22;
		Name	__none__;
	}
	
	Variable Variable( NADn )
	{
		Value	0.1881;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( NADn )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"NADH_n_tot.Value - NADHn.Value";
		VariableReferenceList
			[ NADn       :/NADn:NADn       1 ]
			[ NADH_n_tot :/NADn:NADH_n_tot 0 ]
			[ NADHn      :/NADHn:NADHn     0 ];
	}
	
	
}

System System( /Veg_GLC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Km_eg_GLC )
	{
		Value	3.53;
		Name	__none__;
	}
	
	Variable Variable( Vm_eg_GLC )
	{
		Value	0.038089;
		Name	__none__;
	}
	
	Variable Variable( Veg_GLC )
	{
		Value	0.00158470181578;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Veg_GLC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"KO1.Value * Vm_eg_GLC.Value * ( GLCe.Value / ( GLCe.Value + Km_eg_GLC.Value ) - GLCg.Value / ( GLCg.Value + Km_eg_GLC.Value ) )";
		VariableReferenceList
			[ Veg_GLC   :/Veg_GLC:Veg_GLC      1 ]
			[ Km_eg_GLC :/Veg_GLC:Km_eg_GLC    0 ]
			[ Vm_eg_GLC :/Veg_GLC:Vm_eg_GLC    0 ]
			[ GLCg      :/GLCg:GLCg            0 ]
			[ GLCe      :/GLCe:GLCe            0 ]
			[ KO1       :/model_parameters:KO1 0 ];
	}
	
	
}

System System( /Fin_t )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( CBF0 )
	{
		Value	0.012;
		Name	__none__;
	}
	
	Variable Variable( Fin_t )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Fin_t )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"CBF0.Value + stim.Value * CBF0.Value * deltaf.Value * 1 / ( 1 + exp( 1 * -sr.Value * ( time.Value - ( to.Value + t1.Value - 3 ) ) ) ) - stim.Value * CBF0.Value * deltaf.Value * 1 / ( 1 + exp( 1 * -sr.Value * ( time.Value - ( to.Value + tend.Value + t1.Value + 3 ) ) ) )";
		VariableReferenceList
			[ Fin_t  :/Fin_t:Fin_t             1 ]
			[ CBF0   :/Fin_t:CBF0              0 ]
			[ stim   :/model_parameters:stim   0 ]
			[ to     :/model_parameters:to     0 ]
			[ tend   :/model_parameters:tend   0 ]
			[ sr     :/model_parameters:sr     0 ]
			[ t1     :/model_parameters:t1     0 ]
			[ deltaf :/model_parameters:deltaf 0 ]
			[ time   :/environment:time        0 ];
	}
	
	
}

System System( /Vn_leak_Na )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( gn_NA )
	{
		Value	0.0039;
		Name	__none__;
	}
	
	Variable Variable( Vn_leak_Na )
	{
		Value	0.474905958264;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_leak_Na )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Sm_n.Value / Vn.Value * gn_NA.Value / F.Value * ( RT.Value / F.Value * log( NAe.Value / NAn.Value ) - Vm.Value )";
		VariableReferenceList
			[ Vn_leak_Na :/Vn_leak_Na:Vn_leak_Na 1 ]
			[ gn_NA      :/Vn_leak_Na:gn_NA      0 ]
			[ Sm_n       :/model_parameters:Sm_n 0 ]
			[ Vm         :/model_parameters:Vm   0 ]
			[ Vn         :/model_parameters:Vn   0 ]
			[ RT         :/model_parameters:RT   0 ]
			[ F          :/model_parameters:F    0 ]
			[ NAe        :/model_parameters:NAe  0 ]
			[ NAn        :/NAn:NAn               0 ];
	}
	
	
}

System System( /Veg_GLU )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_eg_GLU )
	{
		Value	0.0208;
		Name	__none__;
	}
	
	Variable Variable( Veg_GLU )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Veg_GLU )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_eg_GLU.Value * GLUe.Value / ( GLUe.Value + Km_GLU.Value )";
		VariableReferenceList
			[ Veg_GLU     :/Veg_GLU:Veg_GLU         1 ]
			[ Vmax_eg_GLU :/Veg_GLU:Vmax_eg_GLU     0 ]
			[ Km_GLU      :/model_parameters:Km_GLU 0 ]
			[ GLUe        :/GLUe:GLUe               0 ];
	}
	
	
}

System System( /Vg_pfk )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( kg_pfk )
	{
		Value	0.403;
		Name	__none__;
	}
	
	Variable Variable( Vg_pfk )
	{
		Value	0.00450657384341;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_pfk )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kg_pfk.Value * ATPg.Value * F6Pg.Value / ( F6Pg.Value + Km_F6P_pfk.Value ) * pow( 1 + pow( ATPg.Value / Ki_ATP.Value, nH.Value ), -1 )";
		VariableReferenceList
			[ Vg_pfk     :/Vg_pfk:Vg_pfk               1 ]
			[ kg_pfk     :/Vg_pfk:kg_pfk               0 ]
			[ Km_F6P_pfk :/model_parameters:Km_F6P_pfk 0 ]
			[ Ki_ATP     :/model_parameters:Ki_ATP     0 ]
			[ nH         :/model_parameters:nH         0 ]
			[ ATPg       :/ATPg:ATPg                   0 ]
			[ F6Pg       :/F6Pg:F6Pg                   0 ];
	}
	
	
}

System System( /Vn_hk )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_n_hk )
	{
		Value	0.0513;
		Name	__none__;
	}
	
	Variable Variable( Vn_hk )
	{
		Value	0.00600093047859;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_hk )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_n_hk.Value * ATPn.Value * GLCn.Value / ( GLCn.Value + Km_GLC.Value ) * ( 1 - 1 / ( 1 + exp( -aG6P_inh_hk.Value * 1 * ( G6Pn.Value - G6P_inh_hk.Value ) ) ) )";
		VariableReferenceList
			[ Vn_hk       :/Vn_hk:Vn_hk                  1 ]
			[ Vmax_n_hk   :/Vn_hk:Vmax_n_hk              0 ]
			[ Km_GLC      :/model_parameters:Km_GLC      0 ]
			[ GLCn        :/GLCn:GLCn                    0 ]
			[ ATPn        :/ATPn:ATPn                    0 ]
			[ G6Pn        :/G6Pn:G6Pn                    0 ]
			[ G6P_inh_hk  :/model_parameters:G6P_inh_hk  0 ]
			[ aG6P_inh_hk :/model_parameters:aG6P_inh_hk 0 ];
	}
	
	
}

System System( /Vn_stim_GLU )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vn_stim_GLU )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_stim_GLU )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vn_stim.Value * R_GLU_NA.Value * KO2.Value * GLUn.Value / ( GLUn.Value + Km_GLU.Value )";
		VariableReferenceList
			[ Vn_stim_GLU :/Vn_stim_GLU:Vn_stim_GLU   1 ]
			[ R_GLU_NA    :/model_parameters:R_GLU_NA 0 ]
			[ Km_GLU      :/model_parameters:Km_GLU   0 ]
			[ GLUn        :/GLUn:GLUn                 0 ]
			[ KO2         :/model_parameters:KO2      0 ]
			[ Vn_stim     :/Vn_stim:Vn_stim           0 ];
	}
	
	
}

System System( /Vg_pk )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( kg_pk )
	{
		Value	2.73;
		Name	__none__;
	}
	
	Variable Variable( Vg_pk )
	{
		Value	0.00906366080685;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_pk )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kg_pk.Value * PEPg.Value * ADPg.Value";
		VariableReferenceList
			[ Vg_pk :/Vg_pk:Vg_pk 1 ]
			[ kg_pk :/Vg_pk:kg_pk 0 ]
			[ PEPg  :/PEPg:PEPg   0 ]
			[ ADPg  :/ADPg:ADPg   0 ];
	}
	
	
}

System System( /Vn_ck )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( krn_ck )
	{
		Value	0.015;
		Name	__none__;
	}
	
	Variable Variable( kfn_ck )
	{
		Value	0.0524681;
		Name	__none__;
	}
	
	Variable Variable( Vn_ck )
	{
		Value	2.93701651936e-05;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_ck )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kfn_ck.Value * PCrn.Value * ADPn.Value - krn_ck.Value * CRn.Value * ATPn.Value";
		VariableReferenceList
			[ Vn_ck  :/Vn_ck:Vn_ck  1 ]
			[ krn_ck :/Vn_ck:krn_ck 0 ]
			[ kfn_ck :/Vn_ck:kfn_ck 0 ]
			[ PCrn   :/PCrn:PCrn    0 ]
			[ ADPn   :/ADPn:ADPn    0 ]
			[ CRn    :/CRn:CRn      0 ]
			[ ATPn   :/ATPn:ATPn    0 ];
	}
	
	
}

System System( /Vg_gs )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_g_gs )
	{
		Value	0.3;
		Name	__none__;
	}
	
	Variable Variable( Vg_gs )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_gs )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_g_gs.Value * GLUg.Value / ( GLUg.Value + Km_GLU.Value ) * ATPg.Value / ( ATPg.Value + Km_ATP.Value )";
		VariableReferenceList
			[ Vg_gs     :/Vg_gs:Vg_gs             1 ]
			[ Vmax_g_gs :/Vg_gs:Vmax_g_gs         0 ]
			[ Km_GLU    :/model_parameters:Km_GLU 0 ]
			[ Km_ATP    :/model_parameters:Km_ATP 0 ]
			[ GLUg      :/GLUg:GLUg               0 ]
			[ ATPg      :/ATPg:ATPg               0 ];
	}
	
	
}

System System( /Vn_pump )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vn_pump )
	{
		Value	0.158300842198;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_pump )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Sm_n.Value / Vn.Value * kpump.Value * ATPn.Value * NAn.Value * pow( 1 + ATPn.Value / Km_pump.Value, -1 )";
		VariableReferenceList
			[ Vn_pump :/Vn_pump:Vn_pump          1 ]
			[ kpump   :/model_parameters:kpump   0 ]
			[ Km_pump :/model_parameters:Km_pump 0 ]
			[ Sm_n    :/model_parameters:Sm_n    0 ]
			[ Vn      :/model_parameters:Vn      0 ]
			[ ATPn    :/ATPn:ATPn                0 ]
			[ NAn     :/NAn:NAn                  0 ];
	}
	
	
}

System System( /ADPn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( ADPn )
	{
		Value	0.11359198354;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( ADPn )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"ATPn.Value / 2 * ( -qak.Value + sqrt( pow( qak.Value, 2 ) + 4 * qak.Value * ( ATPtot.Value / ATPn.Value - 1 ) ) )";
		VariableReferenceList
			[ ADPn   :/ADPn:ADPn               1 ]
			[ ATPn   :/ATPn:ATPn               0 ]
			[ ATPtot :/model_parameters:ATPtot 0 ]
			[ qak    :/model_parameters:qak    0 ];
	}
	
	
}

System System( /ADPg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( ADPg )
	{
		Value	0.13070953833;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( ADPg )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"ATPg.Value / 2 * ( -qak.Value + sqrt( pow( qak.Value, 2 ) + 4 * qak.Value * ( ATPtot.Value / ATPg.Value - 1 ) ) )";
		VariableReferenceList
			[ ADPg   :/ADPg:ADPg               1 ]
			[ ATPg   :/ATPg:ATPg               0 ]
			[ ATPtot :/model_parameters:ATPtot 0 ]
			[ qak    :/model_parameters:qak    0 ];
	}
	
	
}

System System( /GLCn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GLCn )
	{
		Value	0.2633;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GLCn )
	{
		Name	__none__;
		Expression	"V_en_GLC.Value - Vn_hk.Value";
		VariableReferenceList
			[ GLCn     :/GLCn:GLCn         1 ]
			[ V_en_GLC :/V_en_GLC:V_en_GLC 0 ]
			[ Vn_hk    :/Vn_hk:Vn_hk       0 ];
	}
	
	
}

System System( /GLCe )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GLCe )
	{
		Value	0.3339;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GLCe )
	{
		Name	__none__;
		Expression	"Vce_GLC.Value - ( Veg_GLC.Value * 1 / Reg.Value + V_en_GLC.Value * 1 / Ren.Value )";
		VariableReferenceList
			[ GLCe     :/GLCe:GLCe            1 ]
			[ Reg      :/model_parameters:Reg 0 ]
			[ Ren      :/model_parameters:Ren 0 ]
			[ Vce_GLC  :/Vce_GLC:Vce_GLC      0 ]
			[ Veg_GLC  :/Veg_GLC:Veg_GLC      0 ]
			[ V_en_GLC :/V_en_GLC:V_en_GLC    0 ];
	}
	
	
}

System System( /GLCg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GLCg )
	{
		Value	0.1656;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GLCg )
	{
		Name	__none__;
		Expression	"Vcg_GLC.Value + Veg_GLC.Value - Vg_hk.Value";
		VariableReferenceList
			[ GLCg    :/GLCg:GLCg       1 ]
			[ Vcg_GLC :/Vcg_GLC:Vcg_GLC 0 ]
			[ Veg_GLC :/Veg_GLC:Veg_GLC 0 ]
			[ Vg_hk   :/Vg_hk:Vg_hk     0 ];
	}
	
	
}

System System( /GLCc )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GLCc )
	{
		Value	4.6401;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GLCc )
	{
		Name	__none__;
		Expression	"Vc_GLC.Value - ( Vce_GLC.Value * 1 / Rce.Value + Vcg_GLC.Value * 1 / Rcg.Value )";
		VariableReferenceList
			[ GLCc    :/GLCc:GLCc            1 ]
			[ Rce     :/model_parameters:Rce 0 ]
			[ Rcg     :/model_parameters:Rcg 0 ]
			[ Vc_GLC  :/Vc_GLC:Vc_GLC        0 ]
			[ Vce_GLC :/Vce_GLC:Vce_GLC      0 ]
			[ Vcg_GLC :/Vcg_GLC:Vcg_GLC      0 ];
	}
	
	
}

System System( /Vn_mito )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_n_mito )
	{
		Value	0.05557;
		Name	__none__;
	}
	
	Variable Variable( Vn_mito )
	{
		Value	0.012917475492;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_mito )
	{
		StepperID	ODE;
		Priority	2;
		Name	__none__;
		Expression	"Vmax_n_mito.Value * O2n.Value / ( O2n.Value + Km_O2.Value ) * ADPn.Value / ( ADPn.Value + Km_ADP.Value ) * PYRn.Value / ( PYRn.Value + Km_PYR.Value ) * ( 1 - 1 / ( 1 + exp( -aATP_mito.Value * 1 * ( ATPn.Value / ADPn.Value - 1 * rATP_mito.Value ) ) ) )";
		VariableReferenceList
			[ Vn_mito     :/Vn_mito:Vn_mito            1 ]
			[ Vmax_n_mito :/Vn_mito:Vmax_n_mito        0 ]
			[ Km_O2       :/model_parameters:Km_O2     0 ]
			[ Km_ADP      :/model_parameters:Km_ADP    0 ]
			[ Km_PYR      :/model_parameters:Km_PYR    0 ]
			[ O2n         :/O2n:O2n                    0 ]
			[ ADPn        :/ADPn:ADPn                  0 ]
			[ PYRn        :/PYRn:PYRn                  0 ]
			[ ATPn        :/ATPn:ATPn                  0 ]
			[ rATP_mito   :/model_parameters:rATP_mito 0 ]
			[ aATP_mito   :/model_parameters:aATP_mito 0 ];
	}
	
	
}

System System( /Vg_mito )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_g_mito )
	{
		Value	0.008454;
		Name	__none__;
	}
	
	Variable Variable( Vg_mito )
	{
		Value	0.00601129164417;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_mito )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_g_mito.Value * O2g.Value / ( O2g.Value + Km_O2.Value ) * ADPg.Value / ( ADPg.Value + Km_ADP.Value ) * PYRg.Value / ( PYRg.Value + Km_PYR.Value ) * ( 1 - 1 / ( 1 + exp( 1 * -aATP_mito.Value * ( ATPg.Value / ADPg.Value - 1 * rATP_mito.Value ) ) ) )";
		VariableReferenceList
			[ Vg_mito     :/Vg_mito:Vg_mito            1 ]
			[ Vmax_g_mito :/Vg_mito:Vmax_g_mito        0 ]
			[ Km_O2       :/model_parameters:Km_O2     0 ]
			[ Km_ADP      :/model_parameters:Km_ADP    0 ]
			[ Km_PYR      :/model_parameters:Km_PYR    0 ]
			[ O2g         :/O2g:O2g                    0 ]
			[ ADPg        :/ADPg:ADPg                  0 ]
			[ PYRg        :/PYRg:PYRg                  0 ]
			[ ATPg        :/ATPg:ATPg                  0 ]
			[ rATP_mito   :/model_parameters:rATP_mito 0 ]
			[ aATP_mito   :/model_parameters:aATP_mito 0 ];
	}
	
	
}

System System( /u_g )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( u_g )
	{
		Value	1.07475714286;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( u_g )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"pow( qak.Value, 2 ) + 4 * qak.Value * ( ATPtot.Value / ATPg.Value - 1 )";
		VariableReferenceList
			[ u_g    :/u_g:u_g                 1 ]
			[ ATPg   :/ATPg:ATPg               0 ]
			[ ATPtot :/model_parameters:ATPtot 0 ]
			[ qak    :/model_parameters:qak    0 ];
	}
	
	
}

System System( /Vgc_LAC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_gc_LAC )
	{
		Value	0.00021856;
		Name	__none__;
	}
	
	Variable Variable( Km_gc_LAC )
	{
		Value	0.12862;
		Name	__none__;
	}
	
	Variable Variable( Vgc_LAC )
	{
		Value	1.46095762941e-05;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vgc_LAC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_gc_LAC.Value * ( LACg.Value / ( LACg.Value + Km_gc_LAC.Value ) - LACc.Value / ( LACc.Value + Km_gc_LAC.Value ) )";
		VariableReferenceList
			[ Vgc_LAC     :/Vgc_LAC:Vgc_LAC     1 ]
			[ Vmax_gc_LAC :/Vgc_LAC:Vmax_gc_LAC 0 ]
			[ Km_gc_LAC   :/Vgc_LAC:Km_gc_LAC   0 ]
			[ LACg        :/LACg:LACg           0 ]
			[ LACc        :/LACc:LACc           0 ];
	}
	
	
}

System System( /u_n )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( u_n )
	{
		Value	1.04154164306;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( u_n )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"pow( qak.Value, 2 ) + 4 * qak.Value * ( ATPtot.Value / ATPn.Value - 1 )";
		VariableReferenceList
			[ u_n    :/u_n:u_n                 1 ]
			[ ATPn   :/ATPn:ATPn               0 ]
			[ ATPtot :/model_parameters:ATPtot 0 ]
			[ qak    :/model_parameters:qak    0 ];
	}
	
	
}

System System( /model_parameters )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( nOP )
	{
		Value	15.0;
		Name	__none__;
	}
	
	Variable Variable( NAero )
	{
		Value	3.0;
		Name	__none__;
	}
	
	Variable Variable( Rng )
	{
		Value	1.8;
		Name	__none__;
	}
	
	Variable Variable( Reg )
	{
		Value	0.8;
		Name	__none__;
	}
	
	Variable Variable( Ren )
	{
		Value	0.4444444444444444;
		Name	__none__;
	}
	
	Variable Variable( Rcg )
	{
		Value	0.022;
		Name	__none__;
	}
	
	Variable Variable( Rcn )
	{
		Value	0.01222;
		Name	__none__;
	}
	
	Variable Variable( Rce )
	{
		Value	0.0275;
		Name	__none__;
	}
	
	Variable Variable( O2a )
	{
		Value	8.34;
		Name	__none__;
	}
	
	Variable Variable( Sm_n )
	{
		Value	40500;
		Name	__none__;
	}
	
	Variable Variable( Vm )
	{
		Value	-70;
		Name	__none__;
	}
	
	Variable Variable( Vn )
	{
		Value	0.45;
		Name	__none__;
	}
	
	Variable Variable( RT )
	{
		Value	2577340;
		Name	__none__;
	}
	
	Variable Variable( F )
	{
		Value	96500;
		Name	__none__;
	}
	
	Variable Variable( NAe )
	{
		Value	150.0;
		Name	__none__;
	}
	
	Variable Variable( kpump )
	{
		Value	3.17e-7;
		Name	__none__;
	}
	
	Variable Variable( Km_pump )
	{
		Value	0.4243;
		Name	__none__;
	}
	
	Variable Variable( Km_GLC )
	{
		Value	0.105;
		Name	__none__;
	}
	
	Variable Variable( G6P_inh_hk )
	{
		Value	0.6;
		Name	__none__;
	}
	
	Variable Variable( aG6P_inh_hk )
	{
		Value	20.0;
		Name	__none__;
	}
	
	Variable Variable( Km_G6P )
	{
		Value	0.5;
		Name	__none__;
	}
	
	Variable Variable( Km_F6P_pgi )
	{
		Value	0.06;
		Name	__none__;
	}
	
	Variable Variable( Km_F6P_pfk )
	{
		Value	0.18;
		Name	__none__;
	}
	
	Variable Variable( Ki_ATP )
	{
		Value	0.7595;
		Name	__none__;
	}
	
	Variable Variable( nH )
	{
		Value	4.0;
		Name	__none__;
	}
	
	Variable Variable( Km_O2 )
	{
		Value	0.0029658;
		Name	__none__;
	}
	
	Variable Variable( Km_ADP )
	{
		Value	0.00107;
		Name	__none__;
	}
	
	Variable Variable( Km_PYR )
	{
		Value	0.0632;
		Name	__none__;
	}
	
	Variable Variable( rATP_mito )
	{
		Value	20.0;
		Name	__none__;
	}
	
	Variable Variable( aATP_mito )
	{
		Value	5.0;
		Name	__none__;
	}
	
	Variable Variable( Ko2 )
	{
		Value	0.089733;
		Name	__none__;
	}
	
	Variable Variable( HbOP )
	{
		Value	8.6;
		Name	__none__;
	}
	
	Variable Variable( Sm_g )
	{
		Value	10500;
		Name	__none__;
	}
	
	Variable Variable( Vg )
	{
		Value	0.25;
		Name	__none__;
	}
	
	Variable Variable( KO1 )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Variable Variable( nh_O2 )
	{
		Value	2.7;
		Name	__none__;
	}
	
	Variable Variable( Vc )
	{
		Value	0.0055;
		Name	__none__;
	}
	
	Variable Variable( GLCa )
	{
		Value	4.8;
		Name	__none__;
	}
	
	Variable Variable( LACa )
	{
		Value	0.313;
		Name	__none__;
	}
	
	Variable Variable( Km_GLU )
	{
		Value	0.05;
		Name	__none__;
	}
	
	Variable Variable( KO2 )
	{
		Value	1;
		Name	__none__;
	}
	
	Variable Variable( R_GLU_NA )
	{
		Value	0.075;
		Name	__none__;
	}
	
	Variable Variable( Km_ATP )
	{
		Value	0.01532;
		Name	__none__;
	}
	
	Variable Variable( CO2a )
	{
		Value	1.2;
		Name	__none__;
	}
	
	Variable Variable( GLY_inh )
	{
		Value	4.2;
		Name	__none__;
	}
	
	Variable Variable( aGLY_inh )
	{
		Value	20.0;
		Name	__none__;
	}
	
	Variable Variable( KO3 )
	{
		Value	1;
		Name	__none__;
	}
	
	Variable Variable( stim )
	{
		Value	1;
		Name	__none__;
	}
	
	Variable Variable( to )
	{
		Value	200;
		Name	__none__;
	}
	
	Variable Variable( to_GLY )
	{
		Value	83;
		Name	__none__;
	}
	
	Variable Variable( tend_GLY )
	{
		Value	440;
		Name	__none__;
	}
	
	Variable Variable( sr_GLY )
	{
		Value	4;
		Name	__none__;
	}
	
	Variable Variable( t1 )
	{
		Value	2;
		Name	__none__;
	}
	
	Variable Variable( delta_GLY )
	{
		Value	62;
		Name	__none__;
	}
	
	Variable Variable( tend )
	{
		Value	300;
		Name	__none__;
	}
	
	Variable Variable( t_n_stim )
	{
		Value	2;
		Name	__none__;
	}
	
	Variable Variable( v1_n )
	{
		Value	0.041;
		Name	__none__;
	}
	
	Variable Variable( v2_n )
	{
		Value	2.55;
		Name	__none__;
	}
	
	Variable Variable( sr )
	{
		Value	4.59186;
		Name	__none__;
	}
	
	Variable Variable( deltaf )
	{
		Value	0.42;
		Name	__none__;
	}
	
	Variable Variable( CBF0 )
	{
		Value	0.012;
		Name	__none__;
	}
	
	Variable Variable( Vv0 )
	{
		Value	0.0236;
		Name	__none__;
	}
	
	Variable Variable( tv )
	{
		Value	35.0;
		Name	__none__;
	}
	
	Variable Variable( ATPtot )
	{
		Value	2.379;
		Name	__none__;
	}
	
	Variable Variable( qak )
	{
		Value	0.92;
		Name	__none__;
	}
	
	Variable Variable( k1 )
	{
		Value	2.22;
		Name	__none__;
	}
	
	Variable Variable( k2 )
	{
		Value	0.46;
		Name	__none__;
	}
	
	Variable Variable( k3 )
	{
		Value	0.43;
		Name	__none__;
	}
	
	Variable Variable( dHb0 )
	{
		Value	0.064;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	
}

System System( /V_en_GLC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Km_en_GLC )
	{
		Value	5.32;
		Name	__none__;
	}
	
	Variable Variable( Vm_en_GLC )
	{
		Value	0.50417;
		Name	__none__;
	}
	
	Variable Variable( V_en_GLC )
	{
		Value	0.00599865999248;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( V_en_GLC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vm_en_GLC.Value * ( GLCe.Value / ( GLCe.Value + Km_en_GLC.Value ) - GLCn.Value / ( GLCn.Value + Km_en_GLC.Value ) )";
		VariableReferenceList
			[ V_en_GLC  :/V_en_GLC:V_en_GLC  1 ]
			[ Km_en_GLC :/V_en_GLC:Km_en_GLC 0 ]
			[ Vm_en_GLC :/V_en_GLC:Vm_en_GLC 0 ]
			[ GLCe      :/GLCe:GLCe          0 ]
			[ GLCn      :/GLCn:GLCn          0 ];
	}
	
	
}

System System( /unitstepSB2 )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( unitstepSB2 )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process PiecewiseProcess( unitstepSB2 )
	{
		Priority	2;
		Name	__none__;
		Expression	"piecewise( 1, geq( time.Value - ( tend_GLY.Value + to.Value + to_GLY.Value ), 0 ), 0 )";
		VariableReferenceList
			[ unitstepSB2 :/unitstepSB2:unitstepSB2   1 ]
			[ time        :/environment:time          0 ]
			[ to          :/model_parameters:to       0 ]
			[ tend_GLY    :/model_parameters:tend_GLY 0 ]
			[ to_GLY      :/model_parameters:to_GLY   0 ];
	}
	
	
}

System System( /Vcn_O2 )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( nh_O2 )
	{
		Value	2.7;
		Name	__none__;
	}
	
	Variable Variable( PScapn )
	{
		Value	0.2202;
		Name	__none__;
	}
	
	Variable Variable( Vcn_O2 )
	{
		Value	0.0390504186958;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vcn_O2 )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"PScapn.Value / Vn.Value * ( Ko2.Value * pow( HbOP.Value / O2c.Value - 1.0, -1.0 / nh_O2.Value ) - O2n.Value )";
		VariableReferenceList
			[ Vcn_O2 :/Vcn_O2:Vcn_O2         1 ]
			[ nh_O2  :/Vcn_O2:nh_O2          0 ]
			[ PScapn :/Vcn_O2:PScapn         0 ]
			[ Ko2    :/model_parameters:Ko2  0 ]
			[ Vn     :/model_parameters:Vn   0 ]
			[ HbOP   :/model_parameters:HbOP 0 ]
			[ O2c    :/O2c:O2c               0 ]
			[ O2n    :/O2n:O2n               0 ];
	}
	
	
}

System System( /Vn_pfk )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( kn_pfk )
	{
		Value	0.55783;
		Name	__none__;
	}
	
	Variable Variable( Vn_pfk )
	{
		Value	0.00599809710207;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_pfk )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kn_pfk.Value * ATPn.Value * F6Pn.Value / ( F6Pn.Value + Km_F6P_pfk.Value ) * pow( 1 + pow( ATPn.Value / Ki_ATP.Value, nH.Value ), -1 )";
		VariableReferenceList
			[ Vn_pfk     :/Vn_pfk:Vn_pfk               1 ]
			[ kn_pfk     :/Vn_pfk:kn_pfk               0 ]
			[ Km_F6P_pfk :/model_parameters:Km_F6P_pfk 0 ]
			[ Ki_ATP     :/model_parameters:Ki_ATP     0 ]
			[ nH         :/model_parameters:nH         0 ]
			[ ATPn       :/ATPn:ATPn                   0 ]
			[ F6Pn       :/F6Pn:F6Pn                   0 ];
	}
	
	
}

System System( /Vg_glyp )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_glyp )
	{
		Value	4.922e-5;
		Name	__none__;
	}
	
	Variable Variable( Km_GLY )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Variable Variable( deltaVt_GLY )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( Vg_glyp )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_glyp )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_glyp.Value * GLYg.Value / ( GLYg.Value + Km_GLY.Value ) * deltaVt_GLY.Value";
		VariableReferenceList
			[ Vg_glyp     :/Vg_glyp:Vg_glyp     1 ]
			[ Vmax_glyp   :/Vg_glyp:Vmax_glyp   0 ]
			[ Km_GLY      :/Vg_glyp:Km_GLY      0 ]
			[ deltaVt_GLY :/Vg_glyp:deltaVt_GLY 0 ]
			[ GLYg        :/GLYg:GLYg           0 ];
	}
	
	Process ExpressionAssignmentProcess( deltaVt_GLY )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"1 + stim.Value * delta_GLY.Value * KO3.Value * 1 / ( 1 + exp( 1 * -sr_GLY.Value * ( time.Value - ( to.Value + to_GLY.Value ) ) ) ) * ( 1 - unitstepSB2.Value )";
		VariableReferenceList
			[ deltaVt_GLY :/Vg_glyp:deltaVt_GLY        1 ]
			[ unitstepSB2 :/unitstepSB2:unitstepSB2    0 ]
			[ stim        :/model_parameters:stim      0 ]
			[ to          :/model_parameters:to        0 ]
			[ to_GLY      :/model_parameters:to_GLY    0 ]
			[ sr_GLY      :/model_parameters:sr_GLY    0 ]
			[ delta_GLY   :/model_parameters:delta_GLY 0 ]
			[ time        :/environment:time           0 ]
			[ KO3         :/model_parameters:KO3       0 ];
	}
	
	
}

System System( /Vg_glys )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmax_glys )
	{
		Value	0.0001528;
		Name	__none__;
	}
	
	Variable Variable( Km_G6P_glys )
	{
		Value	0.5;
		Name	__none__;
	}
	
	Variable Variable( Vg_glys )
	{
		Value	9.08171994159e-05;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_glys )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmax_glys.Value * G6Pg.Value / ( G6Pg.Value + Km_G6P_glys.Value ) * ( 1 - 1 / ( 1 + exp( -aGLY_inh.Value * 1 * ( GLYg.Value - GLY_inh.Value ) ) ) )";
		VariableReferenceList
			[ Vg_glys     :/Vg_glys:Vg_glys           1 ]
			[ Vmax_glys   :/Vg_glys:Vmax_glys         0 ]
			[ Km_G6P_glys :/Vg_glys:Km_G6P_glys       0 ]
			[ G6Pg        :/G6Pg:G6Pg                 0 ]
			[ GLYg        :/GLYg:GLYg                 0 ]
			[ GLY_inh     :/model_parameters:GLY_inh  0 ]
			[ aGLY_inh    :/model_parameters:aGLY_inh 0 ];
	}
	
	
}

System System( /GLYg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( GLYg )
	{
		Value	2.5;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( GLYg )
	{
		Name	__none__;
		Expression	"Vg_glys.Value - Vg_glyp.Value";
		VariableReferenceList
			[ GLYg    :/GLYg:GLYg       1 ]
			[ Vg_glys :/Vg_glys:Vg_glys 0 ]
			[ Vg_glyp :/Vg_glyp:Vg_glyp 0 ];
	}
	
	
}

System System( /Vn_ldh )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( kfn_ldh )
	{
		Value	5.30;
		Name	__none__;
	}
	
	Variable Variable( krn_ldh )
	{
		Value	0.1046;
		Name	__none__;
	}
	
	Variable Variable( Vn_ldh )
	{
		Value	-0.001026864256;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vn_ldh )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kfn_ldh.Value * PYRn.Value * NADHn.Value - krn_ldh.Value * LACn.Value * NADn.Value";
		VariableReferenceList
			[ Vn_ldh  :/Vn_ldh:Vn_ldh  1 ]
			[ kfn_ldh :/Vn_ldh:kfn_ldh 0 ]
			[ krn_ldh :/Vn_ldh:krn_ldh 0 ]
			[ PYRn    :/PYRn:PYRn      0 ]
			[ NADHn   :/NADHn:NADHn    0 ]
			[ LACn    :/LACn:LACn      0 ]
			[ NADn    :/NADn:NADn      0 ];
	}
	
	
}

System System( /Vcg_GLC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Km_cg_GLC )
	{
		Value	9.92;
		Name	__none__;
	}
	
	Variable Variable( Vm_cg_GLC )
	{
		Value	0.0098394;
		Name	__none__;
	}
	
	Variable Variable( Vcg_GLC )
	{
		Value	0.00297412147754;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vcg_GLC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vm_cg_GLC.Value * ( GLCc.Value / ( GLCc.Value + Km_cg_GLC.Value ) - GLCg.Value / ( GLCg.Value + Km_cg_GLC.Value ) )";
		VariableReferenceList
			[ Vcg_GLC   :/Vcg_GLC:Vcg_GLC   1 ]
			[ Km_cg_GLC :/Vcg_GLC:Km_cg_GLC 0 ]
			[ Vm_cg_GLC :/Vcg_GLC:Vm_cg_GLC 0 ]
			[ GLCg      :/GLCg:GLCg         0 ]
			[ GLCc      :/GLCc:GLCc         0 ];
	}
	
	
}

System System( /dAMP_dATPn )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( dAMP_dATPn )
	{
		Value	-0.101010798504;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( dAMP_dATPn )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"qak.Value / 2 + qak.Value * ATPtot.Value / ( ATPn.Value * sqrt( u_n.Value ) ) - ( 1 + 0.5 * sqrt( u_n.Value ) )";
		VariableReferenceList
			[ dAMP_dATPn :/dAMP_dATPn:dAMP_dATPn   1 ]
			[ ATPn       :/ATPn:ATPn               0 ]
			[ ATPtot     :/model_parameters:ATPtot 0 ]
			[ u_n        :/u_n:u_n                 0 ]
			[ qak        :/model_parameters:qak    0 ];
	}
	
	
}

System System( /Vec_LAC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Km_ec_LAC )
	{
		Value	0.764818;
		Name	__none__;
	}
	
	Variable Variable( Vm_ec_LAC )
	{
		Value	0.0325;
		Name	__none__;
	}
	
	Variable Variable( Vec_LAC )
	{
		Value	0.00144078506102;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vec_LAC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vm_ec_LAC.Value * ( LACe.Value / ( LACe.Value + Km_ec_LAC.Value ) - LACc.Value / ( LACc.Value + Km_ec_LAC.Value ) )";
		VariableReferenceList
			[ Vec_LAC   :/Vec_LAC:Vec_LAC   1 ]
			[ Km_ec_LAC :/Vec_LAC:Km_ec_LAC 0 ]
			[ Vm_ec_LAC :/Vec_LAC:Vm_ec_LAC 0 ]
			[ LACe      :/LACe:LACe         0 ]
			[ LACc      :/LACc:LACc         0 ];
	}
	
	
}

System System( /Vv )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vv )
	{
		Value	0.0237;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionFluxProcess( Vv )
	{
		Name	__none__;
		Expression	"Fin_t.Value - Fout_t.Value";
		VariableReferenceList
			[ Vv     :/Vv:Vv         1 ]
			[ Fin_t  :/Fin_t:Fin_t   0 ]
			[ Fout_t :/Fout_t:Fout_t 0 ];
	}
	
	
}

System System( /Vg_pgk )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( kg_pgk )
	{
		Value	0.2514;
		Name	__none__;
	}
	
	Variable Variable( Vg_pgk )
	{
		Value	0.00904576053211;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_pgk )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"kg_pgk.Value * GAPg.Value * ADPg.Value * NADg.Value / NADHg.Value";
		VariableReferenceList
			[ Vg_pgk :/Vg_pgk:Vg_pgk 1 ]
			[ kg_pgk :/Vg_pgk:kg_pgk 0 ]
			[ ADPg   :/ADPg:ADPg     0 ]
			[ GAPg   :/GAPg:GAPg     0 ]
			[ NADg   :/NADg:NADg     0 ]
			[ NADHg  :/NADHg:NADHg   0 ];
	}
	
	
}

System System( /dAMP_dATPg )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( dAMP_dATPg )
	{
		Value	-0.115857415909;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( dAMP_dATPg )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"qak.Value / 2 + qak.Value * ATPtot.Value / ( ATPg.Value * sqrt( u_g.Value ) ) - ( 1 + 0.5 * sqrt( u_g.Value ) )";
		VariableReferenceList
			[ dAMP_dATPg :/dAMP_dATPg:dAMP_dATPg   1 ]
			[ ATPg       :/ATPg:ATPg               0 ]
			[ ATPtot     :/model_parameters:ATPtot 0 ]
			[ u_g        :/u_g:u_g                 0 ]
			[ qak        :/model_parameters:qak    0 ];
	}
	
	
}

System System( /Vg_pgi )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vmaxf_g_pgi )
	{
		Value	0.5;
		Name	__none__;
	}
	
	Variable Variable( Vmaxr_g_pgi )
	{
		Value	0.45;
		Name	__none__;
	}
	
	Variable Variable( Vg_pgi )
	{
		Value	0.00451935700191;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vg_pgi )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"Vmaxf_g_pgi.Value * G6Pg.Value / ( G6Pg.Value + Km_G6P.Value ) - Vmaxr_g_pgi.Value * F6Pg.Value / ( F6Pg.Value + Km_F6P_pgi.Value )";
		VariableReferenceList
			[ Vg_pgi      :/Vg_pgi:Vg_pgi               1 ]
			[ Vmaxf_g_pgi :/Vg_pgi:Vmaxf_g_pgi          0 ]
			[ Vmaxr_g_pgi :/Vg_pgi:Vmaxr_g_pgi          0 ]
			[ Km_G6P      :/model_parameters:Km_G6P     0 ]
			[ Km_F6P_pgi  :/model_parameters:Km_F6P_pgi 0 ]
			[ F6Pg        :/F6Pg:F6Pg                   0 ]
			[ G6Pg        :/G6Pg:G6Pg                   0 ];
	}
	
	
}

System System( /Vc_LAC )
{
	Name	__none__;
	StepperID	ODE;

	Variable Variable( Vc_LAC )
	{
		Value	0.0;
		Name	__none__;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Name	__none__;
	}
	
	Process ExpressionAssignmentProcess( Vc_LAC )
	{
		StepperID	ODE;
		Priority	1;
		Name	__none__;
		Expression	"2.0 * Fin_t.Value / Vc.Value * ( LACa.Value - LACc.Value )";
		VariableReferenceList
			[ Vc_LAC :/Vc_LAC:Vc_LAC         1 ]
			[ Fin_t  :/Fin_t:Fin_t           0 ]
			[ Vc     :/model_parameters:Vc   0 ]
			[ LACa   :/model_parameters:LACa 0 ]
			[ LACc   :/LACc:LACc             0 ];
	}
	
	
}

