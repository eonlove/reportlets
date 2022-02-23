<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="ds1" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM MAPDemo3
order by pianqu]]></Query>
</TableData>
<TableData name="ds2" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="PBul"/>
<O>
<![CDATA[1号楼综合区]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM MAPDemo3 where building ='${PBul}'
order by pianqu]]></Query>
</TableData>
<TableData name="ds3" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT distinct building,index2 as a FROM MAPDemo3]]></Query>
</TableData>
</TableDataMap>
<ReportFitAttr fitStateInPC="2" fitFont="false"/>
<Parameters/>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Center class="com.fr.form.ui.container.WFitLayout">
<WidgetName name="body"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="10" left="10" bottom="10" right="10"/>
<Border>
<border style="1" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[招商统计]]></O>
<FRFont name="Al Bayan" style="1" size="112"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-1381654"/>
</WidgetTitle>
<Background name="ColorBackground" color="-460039"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-460039"/>
<LCAttr vgap="0" hgap="0" compInterval="10"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-1777440" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\'  \'+\'楼栋出租收缴情况\']]></O>
<FRFont name="Al Bayan" style="0" size="112" foreground="-11976882"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-1"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1"/>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[936000,936000,0,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[6480579,1728000,1224000,1728000,1224000,1728000,1224000,1728000,1224000,1728000,1224000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[片区名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" cs="2" s="1">
<O>
<![CDATA[签约率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" cs="2" s="1">
<O>
<![CDATA[开门率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" cs="2" s="1">
<O>
<![CDATA[空铺率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" cs="2" s="1">
<O>
<![CDATA[出租率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="2" s="2">
<O>
<![CDATA[租金\\n收缴率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="ds2" columnName="pianqu"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="网络报表1">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters/>
<TargetFrame>
<![CDATA[_self]]></TargetFrame>
<Features width="600" height="400"/>
<ReportletName showPI="true">
<![CDATA[/Demo3.frm]]></ReportletName>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Present class="com.fr.base.present.DictPresent">
<Dictionary class="com.fr.data.impl.FormulaDictionary">
<FormulaDict>
<![CDATA[$$$]]></FormulaDict>
<EFormulaDict>
<![CDATA[$$$ + "(点我钻取)"]]></EFormulaDict>
</Dictionary>
</Present>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ds2" columnName="index8"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="5">
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[B2 = B3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8Xbeq7$,a3K8rWZ9KSh?$H't9>^mf.`QDeaNa_k]AOCJC!Vgi_
^#:W2XV,HL0M;J]A\fl?2\$Z3@-K_!!~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[B2 < B3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8X/A]A.,,_(*s/H\oF4C&po.W-O[*+5;t06_bTc(c6NCEt`s4(
rol<Vr`/4]AA;L,GF,2X"gDTE@\5RA`4ej[mrF&6"58tiMuKdrioV\D9J)UHaoei1#&PJ#He1
O%rUa>><9ga+"o-@>'tXkJn<&*"_3<E7parWq*g?^GgFc9C2g7p9Ns2VcU_!JJ$.3oK*?9/i
mumH^UJBpm#+)n7s;ZC@5C3P8T7SX.i0pm3HYim&'$2f/iidmjl:+]A2SHRnj'b.*:rMt$@8?
@a,n9/kqjqVMXC0-3j`("[lC=('IHR"2"_LQ/@d#kB+"VO'?R*pq%%aVN0'f#?RK*~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性3]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[B2 > B3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[!>kk#reXHH7h#eD$31&+%7s)Y;?-[s'EA+5(^L<G!!)jgh0&bu!8g@95u`*_@pgDZ<iu5E2Q
?<6/.`#j)(5NL424B^lMPgQ@cuAC+:M_3`5j]AMC<q*n8R5\q_[M/:$5Aubp!&q)QXrnVqXt<
Q0SH.WIY#u[1hb=5s6Mu[o5GS#"j[;8_=#;!DmC%g^7?Ia0F.mJ!U3$q=k@kE@+`+;fe>h(^
''i)0s(8!.aXJW5l;&pGCKFIgCU"t\pC"e+L?$BB@kb+G[.V>jCC&]Ai2D4EeA-"'J>MlWX;E
?UZ@N[9^)Bf4qVd/<KB.bq(f'JqTe`J1QOu+aP,"KS!UOf_G9P1j_Z0Z:!(fUS7'8jaJc~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ds2" columnName="index10"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="5">
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[D2 = D3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8Xbeq7$,a3K8rWZ9KSh?$H't9>^mf.`QDeaNa_k]AOCJC!Vgi_
^#:W2XV,HL0M;J]A\fl?2\$Z3@-K_!!~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[D2 < D3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8X/A]A.,,_(*s/H\oF4C&po.W-O[*+5;t06_bTc(c6NCEt`s4(
rol<Vr`/4]AA;L,GF,2X"gDTE@\5RA`4ej[mrF&6"58tiMuKdrioV\D9J)UHaoei1#&PJ#He1
O%rUa>><9ga+"o-@>'tXkJn<&*"_3<E7parWq*g?^GgFc9C2g7p9Ns2VcU_!JJ$.3oK*?9/i
mumH^UJBpm#+)n7s;ZC@5C3P8T7SX.i0pm3HYim&'$2f/iidmjl:+]A2SHRnj'b.*:rMt$@8?
@a,n9/kqjqVMXC0-3j`("[lC=('IHR"2"_LQ/@d#kB+"VO'?R*pq%%aVN0'f#?RK*~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性3]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[D2 > D3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[!>kk#reXHH7h#eD$31&+%7s)Y;?-[s'EA+5(^L<G!!)jgh0&bu!8g@95u`*_@pgDZ<iu5E2Q
?<6/.`#j)(5NL424B^lMPgQ@cuAC+:M_3`5j]AMC<q*n8R5\q_[M/:$5Aubp!&q)QXrnVqXt<
Q0SH.WIY#u[1hb=5s6Mu[o5GS#"j[;8_=#;!DmC%g^7?Ia0F.mJ!U3$q=k@kE@+`+;fe>h(^
''i)0s(8!.aXJW5l;&pGCKFIgCU"t\pC"e+L?$BB@kb+G[.V>jCC&]Ai2D4EeA-"'J>MlWX;E
?UZ@N[9^)Bf4qVd/<KB.bq(f'JqTe`J1QOu+aP,"KS!UOf_G9P1j_Z0Z:!(fUS7'8jaJc~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ds2" columnName="index11"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="5">
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[F2 = F3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8Xbeq7$,a3K8rWZ9KSh?$H't9>^mf.`QDeaNa_k]AOCJC!Vgi_
^#:W2XV,HL0M;J]A\fl?2\$Z3@-K_!!~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[F2 < F3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8X/A]A.,,_(*s/H\oF4C&po.W-O[*+5;t06_bTc(c6NCEt`s4(
rol<Vr`/4]AA;L,GF,2X"gDTE@\5RA`4ej[mrF&6"58tiMuKdrioV\D9J)UHaoei1#&PJ#He1
O%rUa>><9ga+"o-@>'tXkJn<&*"_3<E7parWq*g?^GgFc9C2g7p9Ns2VcU_!JJ$.3oK*?9/i
mumH^UJBpm#+)n7s;ZC@5C3P8T7SX.i0pm3HYim&'$2f/iidmjl:+]A2SHRnj'b.*:rMt$@8?
@a,n9/kqjqVMXC0-3j`("[lC=('IHR"2"_LQ/@d#kB+"VO'?R*pq%%aVN0'f#?RK*~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性3]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[F2 > F3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[!>kk#reXHH7h#eD$31&+%7s)Y;?-[s'EA+5(^L<G!!)jgh0&bu!8g@95u`*_@pgDZ<iu5E2Q
?<6/.`#j)(5NL424B^lMPgQ@cuAC+:M_3`5j]AMC<q*n8R5\q_[M/:$5Aubp!&q)QXrnVqXt<
Q0SH.WIY#u[1hb=5s6Mu[o5GS#"j[;8_=#;!DmC%g^7?Ia0F.mJ!U3$q=k@kE@+`+;fe>h(^
''i)0s(8!.aXJW5l;&pGCKFIgCU"t\pC"e+L?$BB@kb+G[.V>jCC&]Ai2D4EeA-"'J>MlWX;E
?UZ@N[9^)Bf4qVd/<KB.bq(f'JqTe`J1QOu+aP,"KS!UOf_G9P1j_Z0Z:!(fUS7'8jaJc~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ds2" columnName="index9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="5">
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[H2 = H3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8Xbeq7$,a3K8rWZ9KSh?$H't9>^mf.`QDeaNa_k]AOCJC!Vgi_
^#:W2XV,HL0M;J]A\fl?2\$Z3@-K_!!~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[H2 < H3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8X/A]A.,,_(*s/H\oF4C&po.W-O[*+5;t06_bTc(c6NCEt`s4(
rol<Vr`/4]AA;L,GF,2X"gDTE@\5RA`4ej[mrF&6"58tiMuKdrioV\D9J)UHaoei1#&PJ#He1
O%rUa>><9ga+"o-@>'tXkJn<&*"_3<E7parWq*g?^GgFc9C2g7p9Ns2VcU_!JJ$.3oK*?9/i
mumH^UJBpm#+)n7s;ZC@5C3P8T7SX.i0pm3HYim&'$2f/iidmjl:+]A2SHRnj'b.*:rMt$@8?
@a,n9/kqjqVMXC0-3j`("[lC=('IHR"2"_LQ/@d#kB+"VO'?R*pq%%aVN0'f#?RK*~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性3]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[H2 > H3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[!>kk#reXHH7h#eD$31&+%7s)Y;?-[s'EA+5(^L<G!!)jgh0&bu!8g@95u`*_@pgDZ<iu5E2Q
?<6/.`#j)(5NL424B^lMPgQ@cuAC+:M_3`5j]AMC<q*n8R5\q_[M/:$5Aubp!&q)QXrnVqXt<
Q0SH.WIY#u[1hb=5s6Mu[o5GS#"j[;8_=#;!DmC%g^7?Ia0F.mJ!U3$q=k@kE@+`+;fe>h(^
''i)0s(8!.aXJW5l;&pGCKFIgCU"t\pC"e+L?$BB@kb+G[.V>jCC&]Ai2D4EeA-"'J>MlWX;E
?UZ@N[9^)Bf4qVd/<KB.bq(f'JqTe`J1QOu+aP,"KS!UOf_G9P1j_Z0Z:!(fUS7'8jaJc~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ds2" columnName="index12"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="1" s="5">
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[J2 = J3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8Xbeq7$,a3K8rWZ9KSh?$H't9>^mf.`QDeaNa_k]AOCJC!Vgi_
^#:W2XV,HL0M;J]A\fl?2\$Z3@-K_!!~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[J2 < J3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&8X/A]A.,,_(*s/H\oF4C&po.W-O[*+5;t06_bTc(c6NCEt`s4(
rol<Vr`/4]AA;L,GF,2X"gDTE@\5RA`4ej[mrF&6"58tiMuKdrioV\D9J)UHaoei1#&PJ#He1
O%rUa>><9ga+"o-@>'tXkJn<&*"_3<E7parWq*g?^GgFc9C2g7p9Ns2VcU_!JJ$.3oK*?9/i
mumH^UJBpm#+)n7s;ZC@5C3P8T7SX.i0pm3HYim&'$2f/iidmjl:+]A2SHRnj'b.*:rMt$@8?
@a,n9/kqjqVMXC0-3j`("[lC=('IHR"2"_LQ/@d#kB+"VO'?R*pq%%aVN0'f#?RK*~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性3]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[J2 > J3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="1">
<IM>
<![CDATA[!>kk#reXHH7h#eD$31&+%7s)Y;?-[s'EA+5(^L<G!!)jgh0&bu!8g@95u`*_@pgDZ<iu5E2Q
?<6/.`#j)(5NL424B^lMPgQ@cuAC+:M_3`5j]AMC<q*n8R5\q_[M/:$5Aubp!&q)QXrnVqXt<
Q0SH.WIY#u[1hb=5s6Mu[o5GS#"j[;8_=#;!DmC%g^7?Ia0F.mJ!U3$q=k@kE@+`+;fe>h(^
''i)0s(8!.aXJW5l;&pGCKFIgCU"t\pC"e+L?$BB@kb+G[.V>jCC&]Ai2D4EeA-"'J>MlWX;E
?UZ@N[9^)Bf4qVd/<KB.bq(f'JqTe`J1QOu+aP,"KS!UOf_G9P1j_Z0Z:!(fUS7'8jaJc~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="6">
<O t="BigDecimal">
<![CDATA[0.8]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="6">
<O t="BigDecimal">
<![CDATA[0.9]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="6">
<O t="BigDecimal">
<![CDATA[0.1]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="6">
<O t="BigDecimal">
<![CDATA[0.8]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="6">
<O t="BigDecimal">
<![CDATA[0.88]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2">
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
<Background name="ColorBackground" color="-7881222"/>
<Border>
<Right style="1" color="-1"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
<Background name="ColorBackground" color="-7881222"/>
<Border>
<Left style="1" color="-1"/>
<Right style="1" color="-1"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
<Background name="ColorBackground" color="-7881222"/>
<Border>
<Left style="1" color="-1"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="64" foreground="-7881222"/>
<Background name="ColorBackground" color="-1"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<FRFont name="微软雅黑" style="0" size="64" foreground="-7698554"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="4">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<FRFont name="微软雅黑" style="0" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[mCW`bPl(JFI*Usr:5Crgm$11S)(!sM,n\;F(eQbbQC7*ZS/,)4&4<lO4!V@GL9aM^,C?`8(h
,2=fU)-CLDJ8t^N2Qas7nk)pUU9E?,sM$jM!jNchmZe^YZ0Gqn>.QFL9P@Yjesro[?Ste1[E
.qU86T7fDu.0D+.O!PZ,Akj$?`I^0Yg5CZ/KmDE$:c@LHgHIuN_Q(J]A.SK7EQeUjRG#hDHDB
ufj''_]A8@-+g(3fIP:]A(>b[X-EbohLWW^.VI)BM(n.Uo'UjR"RlVm?ou.LJot%39U[7"m?<s
\`%"3-V0i*T1I+%2b<O6/06Ccf[_N"/eq9F1hV!XE%-K!osNnW((*XJ$<b)\)eo17,ag-q)d
(J&=iOoB6EHXj[+-eImV3KEst!Krg7P"9%4P9mLL"LuQ>fJOh*>YO]A&'GH\qkf[`L#m.gL6K
X,9VdX$=Xu+=:>Z.Ica-`jA03BrX]A]A$;U8Vl"&_Kl/]AM`9c"iUBepP;s-gqI5!I&@f+e3nUR
-T]A#5`'pDnTG/PAP3]A.Z1M(WVE]A0ac/^8R':*\^TR5$l(s>U_@lp;m]Ar.R/5;2WAQp7HqVL=
lMH"HKFo!T'5[dBCg;*NT@+`'./q'\Nhq0o\5/+h=[#u/L1tYXBChn`IMCLmQ3TAGdnq#'lf
uRnRdlI=^,Ru&qn3d,,8FsAL\i9CA1":)&i*di*7Z\9_ZYtH=4c/o!mf_db7QTli1/bGXuOR
7#hHdC6OP]A>eN'o*#%1ndlZYD#M^LEWS<BrFq]A0^#b6rc0j,,Kp0HVO(k0hN1#j?04!qs"IM
,8o)._N_+;\J%hJ6'ZD#ltS2IchoQ:,TuGmPE?C-h"_$&f6\0"o5Iqk`]A`ILf6<ig`hpm6(b
D\LjG#]A*i&7PWM4s2FedI8)j%hUoE@XP&c"J7lnT&Uc7^Y))>^JdW)UL]Apci.-<qZ=qIT4)>
A\ng>]Ai]AYTg5SX9R$G\rIj+\CHIO>oNBL%%@ZB6q^XsP)i4;DaMul$)d&ML%mfA`"$T5R$4'
@ZeYS>&h8+"<olQ#_^ipRFFa.W$!mW=jj-8LE/r_FBoK-)nX,A@sm)BFN/nlaH20Cm^Gdk(n
c;bMu&@j]A;F#-&EVs0ThN@d(r3.ZiYXO=;CY(_Ar;!p6B\AffKkA=+<c!%$Mf<:>h+aN-`5k
i!?8HoTScq]A\dm_c69\c$f4&`j,0XeCZ(Z-QXTrqrBfW"_-V:a/gE&m<&%P.`n@i>$sO<+4^
'%GtW1@CQ7-[[a$82";'aB\E+X=>rA%em,S*>qdP>6tKL2V;LC#/ub%<<AOT%H3=9U>1p@hI
)_4i6qic1Z-D6B8J>Z6@>:R@C23*X1E?7t&96S3%7:ARqf$ci[_%X/qTX-q&mp'<g$aW;"Xi
:&0^1_*"'^#i&-'&#i%\7e5Ltac>Pn:@QUV4T_o+"HI$OJ]A5*\3>eg&^Uk_t+4#]A/oAe[%s>
b/^X9Etf-qj$'uJk<HQ$XXn'Mm+Zk#bd2LH0o'b?5k:fhh(D^s-UC=HM9U1"^MQ,*oR=QfH&
D]A$M+8S\(R.=*dn(H(%8hd@Q?*d`;Y`g.Y^8/@"cgZs-@2Agk%Hp-Z:E?tXYF`C='![p\7^E
Kj:>Odai$A0.X2`bq<2hRXO0.4?=L&m^A>=8YXDUklBR8J]Ac"5!HE3mkNmRCk.qsW)e;Y`j\
0n/Cfbi&\>t;JjUUMq(le5<#1;g1H*i//*:JeJ?+MAh$cfI20RGdQb:)U0N@:3=m7=QKWRY"
3CdaZJ1:IDN0Qe52HN1]AX17Jh`h:21DV0a/<W82&N?`4R1e*$b*XStR)SIt2`*#*uT7p_h#@
2!(\@:D6ZkSF-_+ppEZ^K4FbYdJ'WT]A_>$iS;F8UJa&cVW)fT7?-Gm9hD,n'K\"#R?h7k?,I
:)&R?JecBH[!hnK+bBrouDYNr8h92YZ5f:gDEn(Vf$!_EF\D%("F;,.(.N+<#(fnmsYG"D"p
Mf9B$^63Zj$Xb3d;9jakrTkY'5/'='s,Hm/YM?a(HY=lMhcB9QMQe;^B\i`6^4+X>'h\;E<]A
RrqA*jUKE:;)X/Z*Rfc_(]AS,2g!3dIR;E2d7&jGS#gLOo]A2uff'j'kJ,%'Xp-rAdH_8`;]ANT
0^mi5UoCpid#'9<dL@=Gd,AAT>&pFrD=jLY:;05ruMT\8kq75'e)%URI;k1aO)4s#1_;\&&8
A7C8Q%an(0Ch'Y$LK?:4APL`#Kd&ti"/IL`*4R]AY[9Z@I8e+h2T@8WkH_%f4$R[;T9]AZ^ZKF
c;_i,[DfFGJ^;8%)\]A)Da!:)8@kl>2$WpgE%9f&8M4HadW48gb%/PgohS]A62X:)3&;jh;%jJ
7>X\M.AQ>A_NB,1W2m0R_MO!`2!Fd,@Rt9G!*$@P&8^/^@BQ*sWrfJ@Dl!;a@dJ9Rs7Lup(;
PF33mJTfSC$8f,3;H]AGM+[!%#8nqk[+V#.h5A:$Z4-QZ]Aq85)VUCT4?3AK$P<<J;ZP-n,`(*
AM7fro_$j)B;53@!'Z-VVnSuI1-X=D2]AfL>*KXdIWO9cNg<q.r-?QBH3[5.2E_'pAF[MJC?3
'+bK9Q&du&&<$`)+'ug#W?5?N]AQ3FFFl!")P2ra81-&992saJ-5K>&]AZRE5mM6E5Wgm'DY;9
;\V7#,GuCN/2;WD$IhpZp*7RMbU,<1\+$j_8C8S9PIG\+V\F3M\uW/EVEY-^+%8im-nOf:q*
_B(%6CJ<2(_&;bF`IFI#6qmQW^G?:E$)Y/iDee2u4Jn$t2Pr&8LK=o%<is0<OnJuS&83eSh^
HXQNmR[.`28Xf[euj=;`V%hER/b7)#-s.Ch2?AiO_T_\.rXFR(-W:WZe36p1W'<sN=^F)PST
,0qbRPK7O`]AHe^H$3oeA(og+9[U"ITE(ZJ*F#_oa%i+cFJ"o%(0YIEKLE-^?%%EWj7ND8o^L
rs!@6@h3sU&[_nMj%qR'0N\efG9!M]A9F4A:#qjhVU8-Zm.9DKbc3&EJDUV)#cCAgfT(Y\,6i
sobKbM%rFk!M1,P:uS[aghZcL\<B+=,,&`;WN:Oi&7(Mm,/4KJ[mp,Q"/onQ6Q2/3"aIh?pp
f@-)\'1qs5_65MU</R9Vk9Lr=P.fAD0GYpNMhlr"8I^fJ'kZM]ARggs9ec+Wr-a3/GUB&6"<q
i"hPR]AqPG`7QFrXZH"&kGOW:jUT$D`NO<?r*`Mn1!)0'@mc*G([J!:QB'9=$Oo3>pE$Y)3X2
1*9pF$bcC&-SW-0.5RP7>p($c'22LsA>"7:V7]A2$:N`&tc`Y[f)Q?e(`G:t8LHfEAE`1^;Xp
S`<3(1ejjhK=H[H=r2RF'"!#@:G;!WQg!!NnZ*i&,s!Xn$u!)uJ6762fHrI]A(aEdg4dkiAa=
*P.!<^oJ]AB.k;iQ$;@`#`hc:I92^CRn78GdoFn`W1/.5H1pW>0!YdkIO_#lH"bX*?*E7ZT2=
Z#naR94)FYLI[Mnm!V+9S7L%>Gh7ofpbhE?^a!W]AjT:ge#W>3FnJt;\=)lRC,0947me*8qsr
K0jEoI"9\CK(3NprtUSr-XT,%$%IOYiOf-;17A9^um6.RWq-;\TBbDkj_;^`r,L2J#M^20"7
;k%S?Edaai%<`ncWL:PJ9aTmEDsN2`4OBRgiJmlE\&X%\m1ap6]A"b#1AnG%K+aGi?UrHk2MW
3?#BeBr(q"Ln\FOY(J>24@lZIX:>&PQI.C/*O"6\1Gj'#0[\f*=bB'h;a(9<$ZBjn*r3Tb`3
6tGU'\PuH/ukjg,.K]A^de;-MmENj9Or">P!Kb!WS>q]AX7<?[LV`3H6bD42K4Y$2rC4*:bq/P
PlJdAmb'Y'?=L6>%2#7QXB_9XLet7tHFO0)+k%L2F=aC6m2n:@I<Ku:*,[q3aQCX^NXY=Cgm
+c%&a(k+r<L-7[YVWal+sWOp3Y.FWlW#T_c;;Mq>\fAd,`eIeP)G^g4"c.IWT39q)4Aqnk&$
H%M&sqP42q:%`F3jk<XVtlT]A[V#?Rm"o7$*C[gs@Q<Fnd3hVI!)ES%-Z:jM;f:R5cdFAq'-j
rH3>?0sg0BYe?nH:OBc/=WZF4'Eq&S)2UgTLHn=Jf<Sl(]AMb3Zp6"=?M*$*o0>#HcL\5Enp`
&lJ)+F3\'526MK)SGB24$,2o(WZ+Z&]Ac%k7"V.!Q&BLDY"'^+XBMDrF+kZ9pRscD,"7)pF91
8Q,.%,$t&.sC1`Tr#%r_pf"sut0icYuZ@"L2M!jSffI`e=UcN#B6!?5n>ReX-4ttm@r)s=d=
?&&)o>i*7j.sN,a[rp!f)G7E<C]A$F-=TmnPi^*cp%mjCiBol9:C^,;2[ko6jQpa(<TC>TIP4
`&,\6a>5^+N[[^q!`W57=nOH,:f;V&aWf/YI]An(rBLrhs3C_+'aqc#L_I?HO$"UeTq+*Q3'6
5CNGh%OFAI=JCY!K-b=_D*"JmnZ+fe*t/!un'qjB.dXf(o@.oJZr2Gk&3AoX0PmPBbF!iMSa
G)>.U"[_Y7qk.U/_tcA\\g+alH4$NOrY8SXD;s$9<8cW[JML!A[b=14#%\IQTMe`OO\gRfB2
>1pkNQ:siPj!d-VU/'^\EKZm'>4G.j:WX[gBK/MZI-g7?W9*H-N9+nQlE#Ga*P!_XJS'i_^Y
K&/oh\EjBH=EacR067TaQU8:(n#9"2E]Ac/bh:No@2N@BkGeR/Xu#\Y,mkF,*UH#pj=FHDk+n
6^GX"\=$H?`#)-f!Lp2M>X*6KJ*T]A\bUkfb#f&'6kU/_"2egep]A)SUNhUgck==o>c9Lk,[km
?>M"Q#/ga0f5[T&Y='MYINaPC=\<\lf-B`'Y'TKh>D]APlIf.EJ?G^%o>kW+I>K6G0]A@?$Fd\
t`4PQG_PXPa%f7qWed0W-b!!P7Y]ALEtfKm%6"sTKbE/_`:(3rFE*/)?Jab6/g+>!He=&2(l2
TF,<$9h*!j0XlXe[LeShDJSjG*1p_WH(K[cora#ZIkdc`-U2-%="lj6p9BB_NiGkdkUl:l3U
WZZa3c8cfAGX7^FV",MdBs-)s7#9?qEo_*gT"C:0N=uV0LgsEi4>jEZFhsFr14#]AF:KkiMdR
"V%`VKT=`t#fPQt>/%4ELU9\`Uc9`\OfN"n8+s#A;D>'6Y:I^B'D\e"b9=/r["Pu1^u\_S@i
OK>%2<'6r]ANTfOD#l/R$BE*LsR6^Eqrhep8`=P2A^<%GIlYUX-;:;RE'[eWN0qU;C82'%-]Ag
H)V$OZC)r(B7YMn/qDG_#FfPgGt$5(A#.l-=D_2^l'^mO>L2Yn8(7J[E*<q8U7BL;tIC.LLL
nrJfG+13,d1,7hAZA%Wt`'pBVu\E:H9+W58Q7F"uLf5mLeGBK""'0l3f6hf`&g5p-j"Wj-q%
]A<MNqu`3I8tt>PG>2V<!OL0HX/`[85!>_>WtapU]AcdpYHYp&VPUmSHhk_MUS2!=>N0JC>&m&
)=q[aNj:ptc8e=6S2`&i#u`-pFhiL-`/mY#Im*efjF'h2en34WYH/.)\YkW*.g?)&)FAn_XX
R-mJA_F6Sd=BSQ\q-#:,o;B+[I=QGLKhT\oa`JdX+<58]A%Whp7Ci,3053U7/gg.5p-8em$N*
!U5?Hf"r[B2S1-5Kj`'alIiGWR^>ZkH=r>eF9M0E[$R*^]ARBH(a<oA%M,GX1d=Z2UKBC?VR7
m[rqJ(O-+Zep2O0+ie]AQ<P7C8\*[C?Il5Q$r`.FD[f_",UpE/gZ&g+B%7g#L!9g]AY.kN"@MU
peJ!Yj2,WeRp"cQpO_!BjFp-JVL4k1)cM&ds2k`/2UU*eAT<UVX'iI)!P"i6u1JnG)2k]Ab=G
C8/E9tJ!QORM3ELs+#lp$Vk,KT5]Ao*AL*Ot#N7-cJKOn`4dr7Fisr/4Dbf,,JkD4O]AOTe*)%
FThpSn3E\)>DGK!`$S[.N6(t@8>O!\?Qu:9hDo-cqPngi*\"sXl#q\MaPUr(LD>MW/?.VkVd
IA-Fqf:R-17t5_D.!S+#0n^Jc8:Ib;PQ.(HS>d&.gtagpl*l]AD4LS#Q_]A$>q+H-q4sjJ7eA^
dMm(cVXt@42RG><:K]Ag^$k,<Q+b?$dEL>e33FK=N9aJm#1$km\[P."l9HdN#,^0Fu@!)H_7l
2;!-kD52nLEl>oJ>cZ$p+sA3fnKm*F!AoV]AD?+,+96uLZp-Q[RP0*a"Q6up%D;F3LWXX:]Ag#
"]A.X#aNJ.3Vd<.\OE<k8Kc9*itE^5AM&XsA#\iUGC4GI_GFH\<V6AInCV6EfIc<3oM=-D<,"
_/+gnO+`gu,j*eu\"Gh()FYY<<I`f-SS%qSk!nFX*r7ig]A\8Qhme&0N"b\I(C3o0)09Q5s_\
F\'@f\qDG$!eg,i,1K%^'>t\aqta/%A77i9R3o=OV;Mj@1_$B;EDk3b.8'/YOB;c.UjrT2#D
V44PaZ?N(GCob2&TVgfS2PrL78B0:"`*PJr[E9GX23C5#u8`5CH@VOt&%[AV8WKLIR(++WFZ
LGX4+Z0\c*Jk'p[lp]AA/Ig]A?E?6f)"2%_pp(*6nl%F*LR,6hIkLlG[&P5:;`^=geBf,$nGr:
(P;<9`"7ESdVDNr,R4`Rr\!Qd_uK5".T&%#PET]AG<XIFij`5KX6!,X*S_AEgD[+>oj"RF?9)
_Z>`37CUsoA0o>LKpq#%k#1P:9nSe4S,.onqV'OHpt9,HZ.)\#q)*Y=K"0a#"\H=4YBqAoaV
,>mBA=G).gCipM0I@]A(B^2t)Rht*la-GrhlbSS]A.<C+.uFp5-5$:lq0HY'Um;^R"8WF:0;VP
dE7WY<DL*bWP(ea@XKoQCml;o%J7KsqqKCe.E]AWTP5Xgm7V]AJ")bq-u;[T3-7Om$lbA>?T:6
hr@rjh,Xu5c#4fK'ZBPHL]AueMHA^?;('%QP%3)a@gTG_jWJk90E8"KFQ:2JO-R)Y1VSqIhg$
c,Bk(E2%T>uDE/DF^AaWl(WT68pmX=IcRQDJG7@/MIQ/1KLr&.4+\m"VrLWC_qgQ)[Qb-Jua
5u_!s&="t!LoA<d_ZGSo/q2q0J.I)D(JT*D#="m3pR+f&?K_EBMQGrGEnab-PfXlBQJtm,MZ
DgFo2tQFehdCuAjB]A@mA1o#c2(M"#-3bSRM$+@p&KJ'-leHS4ll:@P++;sYJG[4_VV"6OT4q
)E.+5XL^'?#+=+a5Oktdp*_g>MaN$(+:[Nar20mlV[BUJeAtYrE,h_!5BMYim=e0F7'3hE5N
@6(&ZnP^*`9T#!6rd&mCMek_EIr3;(-ln_FZA!nH5QYS-">S1+SH(.W,Z"e[="XT(r$Z&&.u
L*=uoOrHG:6oe=Z]AtE"2#Z4S[cl5A+ikN<s/nF)RfaD-%D`flnF6L\li77##Ucns:)]A1Fet4
V$^-W(B%:k,pGpF7KnYA&]ANqn0Rd=4/;XmYW5blKmU]A+>A)gOlQ:Z4NE+R(m5`g2(.$utrRk
YY\Q8F*)19I8k<neK%ZogF8]A"KL!SMo"p2E8n#>k46b9d3o3Eht1@i]A>5QG8%C;p8BG+XS&!
\cP%QHFGpNh*XY)23siAOk<A$rc/m&/E@H+U&ZU&%+f$=:n?H.gR-0/Q6u\2ho`mF$1qjpuo
L>R`p,@3h\RSnMgQA(V+>p?b1F(Ec<o_]AG;/)H;:mG=A-0Z"7)i%edj/T=4W'KhuJB@RD7Dm
XYm]AlWS9,P6*"J%?h>-R2Pikg8l%:TetAbMOSG>pn%2iV#;N:uUQnMb2i8LP2,@n9bU);P!Q
@<V's@f2`B`_W#U909^o;b6D<a4\2?DWjYZUsNOOk0#7Q#,ND66iDuQFr2*308uE-BYmQ-/)
L-_CV,a%V<:Z_a*frRB@-]AuNo!L6jk%e!/2eu]A#JUZX+U$^N\gXTZa6HGRn[gM.(BHKu#ePY
Go>*Fc+dt>P,PY*_F0J<BUeY[%*988VdEfYqeYj'Z'Kt\c+N)XjP$h7beYDPl+;2rZNr3;JF
6oVW:jhd#&l8G5HinrC\(ZR?CA$,bH3?>"6\QN?V$:8t0DIOM?90W^f.<&Z!O#lrV=#mAb4M
-C3U5E;Ak8q6`iYW:_8N)HT=N&E%#k3IR*RUVA.6R^P3QY*Vj]A+VJqC=.U;5!.$=KqT#E-+K
HfrI^/'4?Hd7O"O8UX%?H<dOu_)'2MR;1RZH=ZG+itR3S<(Ynu!NXljl>cp[%OBY\M#b0U3'
ju2^Ib3To3;5`$X0fTN4eJHip`oNHiNY'b>RS7EY*Ggfj5l#?2WuQ5;?&S19p$;Zk%0/bN_;
Cj'LQ(;DaUiqV8-ionC7i%e=5;Y1^4IML<^H_:EoVFL;[+\@lgn/&n%s03Zj3?]A:58Pgik+k
UV:D5ABESp'<<CDHQRV:'k\I[N!VK.qLA#_P7M&Pt5>,g0iiA4%DU2'M!OU?27*l$lLe7<;/
q9a*fg(8[crLp+\,)Xilj@:OU2jp#KVO$=+lJkCL[Je09JpG_#h-OG_Mbb(PDo+As!kCe?J*
/709=TMeb]A8m&rOs4GZ`F9]A!\Wo8tEc-N&aRY>Au3o@PIgc5JQYt2JI"Q=0RGY2`MMRG4LI&
ToKMo0jC3]Afpa[El0WXrUqkQf`MVR+I%2g+!i2cbu&5hoE'$WD_Tflp*MAg0\>IHf#9<l\8`
:R2fB^F*0HFKc!bZS=JA!F(Vnof=[l2K>SNbe\S<L.V'a)!U^kMWoIrc#9&Vi/RTLj!$QOl,
?<JNbp`E4nUH8FW=rkd&q$]A-.uf]AhdP(3/?,hpH:]A;iO"IVM'cShl!mB<%]A.Nl2..(Es-GPY
Q'2_)*l)ri:>>*ZkCP)G:9QA7l8(ZU`B:G"\;nYmY2"[`t9b.TQSbXuMR5]A\'^4GuL0CcB4u
Xp`1;7&"n-*YMM=#dh"1M(rmB`.1VeJ2O"8+&onl\qRc)7Ld=]ATFj$'M<fe3*/\\""-H4da)
LZkB7.%(WpIXqFEWtSeI[h"3OdfE`I3$'=t!?^?K0NmVG3CpY9W"!ZH_Fme`9S8j#gODN,eb
gQ!B6(R)Y0119Zgk:HVYuZaWrWWpqTaH?-ZTgg)13@9<^X+f.)1CJIORBoKX-;M2HYH!>7Wo
@L[GcH1*U8:4-83/0H=@]A1?_E\<2r`M#$YON-;>ibmm/qH,;7;IZeCX]A+$0<oD=ALC4mQ_r<
K@0qKF]AX]AV-s/WP$Y>q%P<Pb#:\,u73r60;`gAFfNJVto)b"IMoY62<4=EN2Ku&q#fLe3Q;J
XGWJ)a1$OtS/TXp2bX\]AcU^.%0Z#+EOjHon*Kgdo3"rqCH;o,a3E<(f5p`!cfHo.]A9j<c=8-
4i8pp9$le<pFkWeV/Pon[KXNRqun6Sroo#S[Q$ld>Ftoi3opTDTBI9S?L<JQrGMRBYMTHp2?
3232H&?`)IA:0f#T^2t8k@OO,+/l9^)LWPstEH.3eHfMEr]AZY]Aik+s+&p,]AL8fis?1GA7@Jm
3qTIl9Jm*6KsY'^b7TLnUe-nq#ZpUm*&l)Gm?b\7JjdE"gA'2!W#8<&(F)%XY6C>D%2#M5%.
YW3_KFJ@s46Wh+:P@4<$VaBq>PmVR,Y`s)a\^FV-h5RVlc:&1jV"hj`'[8m)i]A]A8aA,c[3'q
/`SNHYuKL86JP]A5NQbc@T&]Au`A\6oM-87*[->Lh8SZ6&@2)f\%9I*mM+3>NJ#lj1@d645gpF
?O>Y$s+@7=*!,:\%fcLm0*=R?^S;dlQ`8HK>&ln"oQSCRL8(Y86"5@/Ek;khhbJ1!aWoeVWs
jYLY`\J!9'?g5=c]Ab?'j>6U#J#!UtGh>f`5A%>^m<8/:Tip8l>ffAlR&mW/EN%fjghKXc(Wm
X0(GLOu<I'L'&-ZX1naoORV_@iXn)hA$-h3Z0ctdKJ16JD*TX*UN,M)/bi<@$r5M#k87uNc`
KmiHSG_bhQHYpMf'/K\P=sEeh@Y`1b)0C,k#PQ+cmWdjEt*p`GZL80YW)qMN^`pg(cSNZ3"O
2oYuK^/Y)OcJaH]AD+JpL%SW^a$>WN[+?G7`E@W2U8ohl]A5P<Zjmd>iX?6aKq:i4H^LGXi(R[
KP1fEGe3*G/6EgCa;O8O@50lO]Abre7R!J[E^HITtL;8;1t-m,sL(B<aAUb2+iI$a\fJa#CVq
Zqr1fUQ&!f;3CRjrH@Otj_#8?EA*WG[_EMM3"4b7b0\eoY]A`*Q#PVB2^YFQa<p<ZCW$gEhio
Vfcp)Oe0=U^gV:JB\P2h:ls"n7T$>+aBeA=8#m'Yc/gon]Ao4k"\Zq4`uLpt+A#.]AAF8UEfP.
+#f\L@[>3rdrq'p.Q@!p(arh<KuDF/_@3^c:d`meH>T%,_Gr$2<\]A_&Q'"MjDUDJ5&-;FUO$
g;Ibf(ORKIDtKj52C-WZj^!1tD7+=K1SM13T.;e2]AUP@Y:V0"8l]AH`l9N>D)%S[7nXlD#q*]A
'`;^_,T.LD@NIJZhmJ>FL5qRciV^/hV.e`8H4UK6FAheC]AK9@>fH#*(igqA:s6h.Esi40o+]A
^`=\V:A#tim)>-A0Z7!>t;_ClA;$VO!I)-jG0i)`GPNa]A@[[Wd17nQ@?QP_.kksiQRk>0`ES
$[%7JU/k&KBA-Wp7jpE=Z!Vs``lqo5i0e3g&-iD9>%;_$/l3BXd\)l#g6In:Y6[G(BZl,j<-
\>A<25J3FY8adQr!K+QXqIn!SJ#dMUS7%YD@I(\^VBAp2J,8?j#*!acuimioIpE?>#,'QW?i
Hs(popi=e68$'B#JJJ-GB1jJ;dMW6#N+9`a%KJIEQ*.!]AD*P%#jf>&7(@tiC<:R?U2*f!diC
NM^DIr>t1T9?+j4&s$AkQ(`6uQ(+X<?G5ZWHQkcDuqsV+),0fN+N7B@*/d&kC5"^SOCIJ[BV
?n/kqZ8U<UNCU%f,5f\#C/'mD<IXXqt_")ScRq6n5$EIGDpAd.=#'$T#G0+Hc'VYYuJ5#'9g
\HlTF8D0q/PjY$qjYVJrDP,+Q_3/NG'_*/;;$$aepqJ"('J0..<_Qt&TPXQVpf1fi7R'U!Nq
6F>fDG8'!at!V^(-%ZD'9fgc8uUBgO-tVkNSpd__.h?uh-k?elU*^Y+]AI!<cRJj>s;`4bs!]A
SnqsEJPoua9#\VEq,#ll31(_/a\^%lJ#hYWfKb$^+3\5d@UH,K+OoeI<BLk@G'P]A$cf]Aq?d)
q;/qKL8N[#0s%B#)-%mom,<C8Gb@/"HX<o.*V138IQfPB0jQ(ai8-b8YnM*4KnFQ*I5*I%/Z
_St:u5^60``/9k3Un#\I:1uT(N9hZpiUaZegJE\++=Lmj1^SE[W8N0/cfP.q5#osQ11L.^-I
X'P_A2!)qa`7[5;PiKt\T#U\I;s46Wrj032_k^7C@c9<#_aBf(k"c(-6b8"`^OWd<K'g+V\P
$/P`DN"`iLV\7,24f8esf]A.;t[%P04n]Agh*E&NJtS@@*7Rk`rH:(c0Vlb/h3)p3N.=kiGYtq
kt8Ib]A#6)J/U=\^V-CEJ:pRZ;4X:Y/<G(>VI*DI-dHYP%m*&-`3d2;EY(FS51'X7[Wo1&<51
kj3rY6X9A`uuN9T95Z861e.HiD;&c,4Tk*pAI[`h+F2T7gV\S=mESEkNYf4H@H?`i1Zic)ok
gF)e2nQ8Ih(l:W2iG)@c\4S8A;DNWBK3-pcs5DKrNi2s_F+u%u#4bP4"_-qdhp!^sL?,HCQ#
cQ5$m?m=Crb_?gqk/BN'2,i\p28iuo7u<ciWG0q8[\ol2EY$/Ylb'1(0&$ChMEE"V4Q1#A@s
_h5U;LJ9^;"l$blj2l!.EC*3Te[cTt_)=HC+d)&S!u,MSL2#VB!2ZO'6YIGST.q:gH@b%W]A2
>qgL"b*C'"GVcXOR0m!9X=%r<lJk:)l"U(.B\5/kT`GGs7'LAW./<_2SXWY*PBp<@?p^aB`0
FfCGu9J[q'k%u&)gTB&U?aCjH`eaI*=6UTWE+<e!0a+LoiVQ]A@B'm).GfmH+1QkA7uhb(b4+
PQbKZW'4s5`/);Qh+')acG3>e+:2.dr\gDQ<d%+Q`:srg-Mt:iS0qi+JeY.q'B5X4V+J&7hl
JFedl%-Q_$uA1Za$kq_CQH+>P$Y5.igcuXf?EZ?XC1e%*H=#m-nXa:cI;YB%9+Gdm:X\fg4]A
-R-c.B=a"u,UFV4SR([Vt1Me??KQTR!KUJWJH5LfklV2[,^XO'p%>-=GFK6koPiWek*WL/O5
P0]Acm"&)`a6BA`M=d("U4;VH=a'&qNm74D=pr>9]Ak$fraLZa[8_%b:><`qsl7'7$nma%4QQb
'>=fp-f+Omh.,it.*Xj=iL@;sMND"G,/llohfSrBeU[bc^KAF`a.T%4_g0fb^dI)VF8%lTSm
kH%JAVOSSNAL]Ap)\bVP^TYj"EB`jj@`EHLO2M<TA^A,)s(q>ejT?Vu=.h7$A"T9]AAJ[SL;/#
Kgn+iSdWL5>I74X@,J&L]A[:XASe-3Hg+ITqAjg;l^r#g'g>8#2%qbp/:FciUc0%Nic:/f0\]A
'(e\7O!8)Hn:Lg:jn^(!7"85pg9LjigD6Y$tT3=OkDSiTlIZp:JqBD\^K>'<eB:O;a!1ua-h
I`9cj$0&tDcVm_XCfMULd3%M>hS"7P'OR4QP@Q"ukQRb/6<TEU9Go]A:[3ado+<$YiibWU3dI
=(5b._)nq1'_<,'np#,?BB@nPWs@A@=9N>/l$<Bcm>`;/0?'cc>6T+5g8&3LoC662j,SOJlS
D%VI.3G;aW`_g?[cBmMVXT0$c?:r9jc^@LA#Nlr7,<tDT:;WH]A5F9J3^'=C,"U,)77L!%AFi
h!jPL^0t&_YTX20mcZl/':%*L[ZJ"b`6BZR]AC.5WQEo'_t=<dY6Kc<COV2Y5a#n!LPhgYRte
7&c3I0u@#P70:g%_n]AHNbe>lXEoijd3gY%cS++s8qE(l+;Lc2mQD2qH8.!$''*bZ(eO+//$Y
B`WT0EBU\fqD&0W1;T1_IP+1Um+tTOr*3Y-3Zppf3HR@.&Rmi)Pa&a;7a7m(I'VQr/P*pZ4K
_SFdZlab9iU^E]A3i.SW?bg'^#JXj">.lO-"RP;.*%mAZCQ_RN\4h2;*dqeQ)CHX,Vk>p40oY
5C%OE]AJ3nU[M;4?R)09jDs3[uh1_%U65@tV6k(28Ja%_HrhOs3D1P2YaB7WgZ;L%pOPE,@t)
",nd(@1`kHhUG7K\ZG;^_/o%[icTX?[aB+/D)F`gmCQe<T<=s/[c`!r8\WcZfoGLc`.pK_pP
G.>k4R%m8!9o<Cgn0Kp9)EUDoqmc1;^OW5RtPBOX#'8ZC%0-eE.P-Mg\R\]A]AqK:[u&W%R*1:
"WNH,`FTr<Jf^c$=,#KDXAVDJGKumakg-t'I*ajPI!N:JqG[nMe,.p@cRdX'UMlP[f6;RMOU
P@3J=UZqqj-$(Aq,FB\(82BF.b52TBjgV-:S6c)C4F9?:ker)!*fM\ZJB8p_TI7]A\o)%XHj4
BCJ66-c,S#IaMFKsI^KWRD0W577tOa`S))L4+id"^l\K:I)/,KAZ;Ij;!n]AC2IH/!EU5/3`4
4pL23V+/[7.g=fQXQNp;k6fEm9.G$#f>5-n]AjU\(_mUlZ^R06]A9fZ^cI#kU/qnQa'^pHaeT9
Ns7aZ<,+`guH>@1<>DPD?o$5XD%!Q)[M(Z/0Z@(ttcNgkP.!oS+2GP>,adMuhWcCGDqfat0@
HE]A(8o52LR=,K>,pg;#]Am@@b]AHX-'?N9r)u09\d7XTHfY#HCZ@=l_B&n6^`T\juMQ>O7`#qc
CDmWUuF7j/+p4rk_YW.lG**]A\)E01@o`dRo;P3;JmuM@%SQeh9mDbSE$tcfVW\%qJF<$_mM_
3UFo]A)oXVD9J<#$bRGKjhcRkG$NG[6h]AkZ0;$UGe]AJE(tq!A?R6qYC<3L-K]A,Ke?VAF[Kpkf
XlcH.eC(.ja"6+K27/-9!Zn'i]Ap8#W$Z8m=R[cF>c[J+M-C-[D=nD(S8j(a3\NZ^Z;lg,CKp
IFWL5(T@cc/CWJ@@sSrE97%DufoL1:Ai7R#m?>C#`Xc*#im>gu9"QVnA'mPBkdG1GdL__ZpT
;,Skoo9Lc01VqS_rlWVNR?CI[iB487W0B1bW["4fD8CQ,ifNrkUChQD.8>NmY!l/i,bS,]A?,
gD\VE[5m(R=MoY^54q*btJUdtQI+e,DM5FA1\1^#nJr&@N$7B$b,[X\!YZ^jGnQ!s#uYe3!?
L]AKY_VE#2maK8quC%5iB(@ZcJpP_!JnkW=93cqs]A#bJcsZ)Vgu8UK>WaLY?c4g=eeV1_sU=R
b$C9,l8Z<k=5;[(d:k/O0`pM-B&$gO#l#O"gK/\ksq#P1\l>FOKWV7nslGP"iA`hX!L1RaM7
TlPUCNSZG(hC*2O&-J$e\'6P7+)2Q;\!Y$4+c3Ha(IAZ0i$bI59W.u'S;=]Ap10H+"*k!$YIV
af2@*nObK\DjY@_W:1(,,i&J9&(m+lL[gIhLhWeact(\8:4VW1*DkAr96@ZkZ)_"DD:4B0At
?btOKAJ&dAQDg(H4&]A+0'$n$AG,oc$09d#0Ltf-Vjc=>IJ=62IQMj"LmB=,![YfOMVE.1U(_
l"@Q%9]A?k?4H21Jc&SF[2:^Ibl#/!C!>-M'*-$g<Vd_YcdU)sV8\?5DiNmc@licd1hZOqj@A
aq\OhEh8)5g`6cP2cWV_7.[rGIH0WYO#oM`V[<b9(.WhV5e3[A@CUc.O""^'.J2mJoXrO06<
ZT?R"kGPZ$Z+pa?8W%0+`nL>./,%RPK6pBKuuTn7kSSVm<;05>/!el!knAuVW3"1;F1]ArqsO
g5FJrd=/'#h/V4J5?iVk6!">I^63I3>^rRl[;X(?gBfhu'[7_iD,TLbR^+u'jCR4!TU*aT]A&
=9IOGTul$>u,R%cKFl:sGO#5(8QHJa,j>%[7is[iEdd.E?Q2B!BMa5Tf5X>6[J-+fJ%*fZ$$
]APJMVIYY@Bqh&6Y/O\;VD'//,q.uiam'UD.Tk'8eZLUWBX!M/e3#F%u@CQU@qWY$'hZ7YVBL
,3l-Ve;>L/)%@g:mFG2i`Oir994=J@!DDri7LPS-&*>5"O';JmGs:d#Z0,hj]An:-s)p-cn_?
M2/c.=k_+TDWO.T)-e)jqehOrbMG%0ge_kSkjGR;L5V%.PnH6j32]A$frURSUE8$t?Bjgng9f
qOm:+FRSYR]A,#C.Je)_>+PX-0!eN1&`H`47@(Vh6X=SSX9tRD`eSq"DY8#8K%U0\Q)9b?!V[
^Z_3FmIXCX4F?lM4%b>^J`BNV&D3f9),bd^-9<-4KGbo]Am"j$S%FO'3/[kM\CWe*XrhfO$Uf
-)+/4aT=CdAHhn#YWo<<gYP=P%0r_MN=cZQFJ6[Q]A+;?B!DAR)2kBW:CPKn0F<9M=)//l7`1
*]AAob"=4p@ZqGFGVd_-%A*+!!N_<=]Af>G*?Eh3_?Y&S1B&?YoG7Irul$(b`lF(d7H!QuiTX6
02\ocK6*2kY;mlU#*r@q2pb.?!hl:`p7[CqmP#@X?I)b8W<W+OO1HS/-P:j=1i;dR?0[h'nO
h:<WQPLAt?o18tN_qV78>'dL;G"<:0=U.L0\O'a9+OlqsO8'nSjQf$D(_:/kFGb;]Aaq]Aqbj<
j&2iC8^cOgi*[`$>?&8b(%Jl/BbAeH'_3OO&BP?dnCK/Ul<rSP6f;37[NNVE18'gBgJtol+_
+dr.AI@`MB;C,ufk_N;XZq[WTP9ouarGYo&1q<Rkn<r:J)?Ot@"\`\_@NH_VU2*,*-FlnX_X
?R*NO_QlA(#@8kf8b_/k\5O\:H7J<iss#pf(KsMk^]A/X`c&KS/;@p/qVhJh?Ztu-^@<=!of9
6^;kA:g2mg\A%=Zo"iPlm0aZr[+/H-HDU_u\7EX%>cgV#"JOPql2Lki[7cBDOe(\[pY9)\Ei
D#RY#f'W[Z*Q,XMk:L(&#dWX3KnU&=2':Z[0A16UW*i$XYbM$XCH_qn&ONZZ!sbdA!sdWtQ0
JYA44WW9q'o.4'jSEOA9Y(*1"5r?TN$Cmj#;-\4T>f!Xi;Z0s#PeM&?T``6>S3Y_uQc;=h\/
\[X4`OIa.O*#"!?Bmr$-^eW8S"&g_NC)hL]A+b;bq&qf(qdHjiMkM!60k2@!]A/I.`YZ?8?;%^
QY0)OQcSV!"g#/H:[s9bAU?.MuR"`CQ-WA_<Z1-6\-r]Ah#'>mQ,!tEC-(gR_8K:maOT+Y+X*
<c[D'D6Ff,`lMb3F"[J@8VCS&9O-Qs+:a!^:r@:QSXhphNH^P<A.ZN7_Q4jCnF%U24a^dGSX
$iS`GV&6PG<tEog_>$YX+cIHTrK1W;3O[p4oBdPL-Rt)JFGKsC=_uXl9_Zt^7^<m,rd'e$PF
m*jLkTiqW6%>gnuE=0D5ItJqLOUji86:nUsq@1]A_#SVaFLTJd([J=%:ZfKJGs\!m9VMB^*]Ak
[kJ(!Lg6l/fLmi3[hdR4>.-]Aji_#U:fe^RerrJ;0m#/3RT=,I%&cZi=V3V,%GhmIdUdU_G!b
=]AE*hgkO8``Ud00@fU^kG:-"S^b<t:^*B$(nW-<;DEZWN$i5UrsK>*S<6`Tj-d(i]AO4aFO+G
R$UMN1L!AjfC^hD1%G+?7G6PL3Z3i=@Kq5l,s\4X6Q7S>jSjNiPArk/;%XuubQDMd6MMQrNM
G"1G,$I,\klMqn';Vf5%<0lg8o%jS6O^:c=P4p->,\1u`eIT3aO2h2",t(YBKRKE7>2=U^aF
%Oja7?ELrZ,4c#s_>Sj`7lX9rL<UTmJhbpMU,*+SNkK,Pd"4),Q$4lfs6;<X/31O!9\'DcQ:
N@/4&N'k,uP>#2eFPhY*2r`d2LP$[NkhR>s=GqYfPViG&3.L#*Nl>1h$VKI@TUDls]AT'm\p-
A+2VC9j5!$V:1S@"-.is4D"8RKEo`qo!slf_V9YB5X&c?Lprtr@q\I5W@fWVB0(eIIZ%2Q2u
LpDh>osofYN1`E<W"i\*6,78L3NqC(79@1CF]Af"gd10^V*I\=YFXD9R0?a@,.)\J:m#s.D;e
D*m,ph>R@/a0W$)SR>9MD9QSZWm<Nn4mB-2:5WGrgq'c;fA#131E?o8F:\J<SEY'%mIMm"T-
7fuA`->@qNN(>'>-.\Xp%W+6OeE;\^a@9LFb=uT=a77]A50BpqT8JZ]A1,0hH0mgh1PV+Na8F\
[!/,gO(S1>Q[OnG.I3ae)GI<HJi75SPn?>4r+m7d\$BN*C1i<mQg5Ne%pnL"W'IuO_naLpCo
O"99@/E3Y@5$R.h\1q'hmJqr#5OBB3G%o(A*`X_Em]A@BK;?Ne[XJ=S@T36sbX-5L?JV\Ol3!
.d-,iBd[R="G&V;3k?Z%"a=9:Zt0K2A&57dk;gf0@YBfBj:S>]AS(JOC'"M=9]A.#2f,JIZ$r.
6c&s_2XBPK/bipc;<Wcdq`ds/f+9YDpZ.crqqDHtXSJP8IZYTK#e>L+M75B8@f/[cc95MaG9
[NfKE(h9jW2'CLYYq6kdR'CSH<!%FVklVg<Qa03YUMA$Nl^kY5Vjb1#7u+[g,rpD7FCQC%>U
j!6._'i>pCNYRgN7buCTsOS8XnJ.,&M"<]ALXK+;bj6GW-^`^h1N1T3gQ+=cM<U,ge]Ae7e#X_
msA[$;YIl%0+>CY*2Q2rsqY4&g3TTbJXk2L^=2.ep.@N/1FD44Om*[(`6b*^cU#Li%/"&GLp
Zp-N=LCc1_(U`<_!bL[]AT#YkT7AmeRSYj0Xi5Fc74q"'bEo1*q`rqA,=qRJjj+oNgnbp*@t"
[VF;r<Wa<;e3Ak]A2<_1^iZ]AZDe!P!CXiME]A]AL]A)EOuqSUldirO9uB<R_!J/[)>&mmQpG-h9)
c*SqT=HjirFd1".NK_#,CQfo2StuA&2HSG_L$]AJ_*JA*?^<GMP_?(2='hRcJDaAeikhqFca<
@,kAuCO>$)?@\/9'Im7`M=<It8BdfLW`A<L9Ot?ksPC^+U[_"D)936r&&*c,c_Prq!l8(eUf
lZA;V#0&jMnbghCi1^AgXdA>XcYMT;q[(LD?(a(5@FM4W>RP-3+8[_L0]A.SeNdQ&@<Pr-&&R
dUcbi2<I;:l>.uBbJm)qf"K$g%=Ut=MSk#\>XG8$qJ1Y!>+s5Mk]A]AJRBqr2kPCDoWDD56K$K
XAS!m10gmY0630NWtZpL_V'suXmg6iPN`Rk+.r`0I7"$QUCFJ@&W55(Oit(-:)28j+Q\_Wa0
pM9X2Wor6/BiL("1i!9rrR=57%+8(dYB%U^t2fDt:?\?Go-#P6*4<=4JbeblL%__mdaS\E:A
@`fUrDJm/)#$]AP"F)(V@3hZD4em#*n(d[C3[IX'i9O*0VE^]A;[(`JHBWUDCVdgIVkSW'pW/]A
:_$6N7g$!=eF3G'Dap$NV/_s=_fo'ZVZ3TZcgAKla)qAqJm3`K+3DBMZ]ATV$XeiT(k:qs%m'
U!5l!odDX?^/0_RrTIQ8(&:"D4W$2A^cWD0N2`e7L\>%s>3b[3o:Wu:;s8=Sf6;PaqO:"n/)
58#_[eqhcO!OFc$_41%)h1<UY`;YZl9Fj#c-MHYMm;+lo[HtRp.+$hLW<#9uFn>WhSH"DdWU
]AVtf^.:m03U'fd2(T1%tcC[>=?J*OA%D\qUsHY>JhGFElTJ?o*)VGO;Z2>>$K%]AVcrSV-dBD
GJi&&K>5soKa0:1)QQC$1:)".`40`Z%l/nt>2.<OYSGF09Cn(M(j1KjlqlR?:n)l?r/_K6@p
J9II]A8!Fq%2Dh%,^K46B=T**XZ]ASY1E?f4H5j!94'hg0R.C\0/+6cVs/hKVfSBUKo;`rOd4[
'AIqRQHo1+MEl[-8QZ+6P9Y=U6O(&_TZ^Du/-/Nuc%p@Y-ur)QGT*Gn%-YZ9EZ$:oa2?aP^I
*e8J6bm7DOgV*K>@TfQE55>)_:r)2'@(0+X@F,cqr]ANIJ9kZo;@<@7LIsNFJFG@Q]A/H#6&rN
)#CS,.UQUjNB6kh8;!n%\:QUtde7^3OF2NlPM_1o%'8m"oUSDrW9o[$pM:j>BeUYLicP2H&]A
7+mn!IW?8BtqpZ--<nM!rrGREcdij\MOWQ7$C!59Yir@5>r]A`?N0n9eSDLJ/hZQ874f:qHO2
dYXlnMec2:Fu'PCk3H/aH/NgKe2RFh$<!52cC:7RS]A=8>GcdkHs&>NHT"MNfT2'k5I9'f;rY
!TjTj.:kDo4Z+MLp\T/gZ(UPaPmAYk-b\L*+3[\oA_@!?]A9Dr=m_(9)i)\&f@*?X<Mj3,-/5
IX.XK+,Xl#&7U-[<q?Fj_jeWWjb4UI:G`etZ.1CbOq(.Ag^4o51AW43Cgmd5^%d*I+n`U@om
^jVCFOg4rqdE?o*k9"1bZiC#@/GSAfnNTgAFnMkWipI\?AW.F47@'r;\:!U`.sQRA!S(`;Z+
GXeP%nl*-*%Q=#A4-F+$]A2a>'_DScXiqP1O?D/?NNSf\j!_uGD.=Ymg^LH,hLrbXUi9M18>5
5"jBUn#Uqh[T#lB8rcBSp;h7Tme!KDa@dD)>a<1+dI`JcJQ8,q'QS[?h.]AP)lU@@<LX67BZS
aZZcu^%TXuV@._'b)RCDZ-Bho/ofHQ)^G5Y&8q!?M^L+@E!s#(t5ooZIT/&%\DcP)7mRXj2g
2MLAe!Z;LBoo;$1ca96JMr40$'VJmY5TQIXP:*R4&4=2h%M`n/(4Uj:ll1[<;d8E!1lQbP#;
fsuDd&&OkMQ3qPPh&?"oe"N#Z&`qs&RD`1)V)$]A\E%mmP/r,"#9Nu=#SClg"atD*efYma)0r
D5`]AXcol&,,RL3n9"bQUL9`dH(e,]AJ"1*dUV7iSLms8%cGQcC'.!7WDU3,R6hKp_9I?G'M1&
qfg%5C0mE9W%j%H"V8B]A]AY5:;3L<*S\A+;1>a,D&tQf5hE(MO6=]AbSE_5?5Xgd**qc^Ar;,X
h(4M0B!o'qcupRUr%Q59Z>808CA*/BEB#6T^<&0kgh(LdrIU-8cmO*KkinbfpO+m',JW1Gfu
9WRHfKVPY(c@_lQHYiPf[n);`gljk[3)n3KD%!RHPW,m`f((E\fK-=DW6TFq)!$@7Z6;>_^=
9VAH*Y+g!dD*<[qe#Hl_F$6q/>Og8Q87i><Hpf_T!ca!8PVLTQoi+$/!D,ZOOoh.!C"dXuOO
CkQ-Ot0CuiAKrG8?b8WIR@;G+?)kum3H+r]A@Y#J^4[c%k4lLhjPi8on-#Qb(TB#>qXfl!Sre
:.d]AQS[&hWtqkN+Mt3WFk_q]A74DG-cq3WGql]A-%LshR$qhG@_V2p"MR$XuI_gp)@bYYXBU&n
f9[RI%9_M/+ce5Xc78U=:-k^k@P=P0\C(ECW=LNB(c=ZXl2mG0B6rIgm@.$8hrddBU'"sC>n
f<W[YS*7LMGk8uG-Y\WmGc!OZ3'Xo9Y=6<Na`DEHN,r&4!,AnYI@k.M2VBJCMb@Q1bpG--PB
dRmMJ"m[<W5_iqE@@`/RK,&,6r"6.\(W4488^2>a$k+.;\470$C8#b0RYWqn\]A4T2SFpq8\h
e5<Y7:!EQ'\\;B9g3qF_W[#G&h?E`)8D&mt=bH.Tt\W9_"Z?Ie]AnX>!BB]AfQ;Pp)el?SQSr+
rd/\dg8hZ^eQYGWgW(#bNQV^!#?#@;VI6cEkk_=F^XS[)<^X%Hpfea@ihqIeR^cB!'"u^<lr
X*>?d$NR(i%@]Ab+*-XW&q@GPW@qYG8g:,1e/='Q\CG)u0E8VEX#O=TDZA7p<KsDnnc-gYVke
"E;/I.L(-,ga`HKn-.guc+cqo7Aj'\G;]AO)M`3/91URp^meihRpU!.hV#X#q^/&s6%<*ZbgP
9]A-Xb4kDjuC>1]A\&]A/@ZeL4<^TPD,SlAPPapRqRk`JiQ%KN_Q^X!iS3I/LSpg78X8P]Ae!0Q$
t.L0A\*2>(:IWP3bANh?ON&Ugf>n@_>n4QoU@-l#OLt/`P2=I0eg.OL/a&ll$!^>lc[*GGl>
29!^~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="551" height="200"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[='  '+'楼栋出租收缴情况']]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="Al Bayan" style="0" size="112" foreground="-11976882"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-1777440"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="551" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[='  '+'楼栋出租收缴情况']]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="Al Bayan" style="1" size="112" foreground="-11976882"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-1777440"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,990600,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[6210300,2743200,8143200,2743200,8143200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" cs="2" s="0">
<O>
<![CDATA[出租率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" cs="2" s="0">
<O>
<![CDATA[收缴率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="Building"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="index1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="1">
<O t="Image">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n,XBbeX]A55Q,2/A7/eW#k/.?"`bts#afkaDrQ'Brq$+SG5Zl:+C
c$$9g7l%nUge*/"mOBUe=!=mUVFU^e$f^6GTDg+;1UQ-og=i01Z3kmQ]AYs+OIo\?sOFr+qX-
Log"[K'T@X[!K7]AcJb"=p8W[:5_toJ>!rH+7[Ki0V9,paSR%.UTHhZgS4?b7(c^3j#0=Yiir
:0ZQp,C7,$k/*h4C&po.W0*oT'bEO+O\95gWY!(W33MG?1kE$s"@"34SbptG0,E3Cr%X9@L'
@`s&$fb2/eQPQ7mTN?I0>19=9X:F3N/eDGT38?^!)\V6Lh?k47WXd$GE&=DbhCQHuA\3HGk'
pT_kaQ2N.GQtKnXE'[91NM,oV^\I8&k;$SWs8I0/NssY![IW'2`4]AeEQgM3@8)WQ!ktRAQMS
>CfpT<c0R*eqR[J>9V6g0YlO-cu8C#68[qQfeFm'=?hrg^4(^0nM2H%+6*$Wd9^E'G0nS+YN
sLY6%L#-Onkr)@qr/2q%5n:?OKc.cEc@Ws1S+4+846fR/]ALGM7EVl<B!<jA6BCbB3cZ<"'PD
^QnQ0#`kfeth10d*_!;@eF2u-+ZMhiMO35_HLLqVp1.ef<3uU3A!-[93,ZV8WSK;[]ANDOTH(
NBQMH8Qk7CkJ,%$pECL5b]Aol%EGs2?BbWU-L:aO^9+c8XTs3\M;WJNL;NWa+)3J*Tf[^?*V_
.(a/]ASYG]A-O+$Kh8E8kdhUm"CS0b019J4]AbBj'u-Z^3QR\@VZ95(7:YQa[<7s4mpl029h)[0
r:(oXT3Ql'$%,o'9`u[1BjE5<GK`rl(Bb0/T=#0D#'dq<&.QK[[9*?^Ml3;5Q:sqi]Ae0pQD"
Y(pEo*fEk.pT!!Mpl^STV!!~
]]></IM>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[B2<B3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="4">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n,XBbeX]A55Q,2/A7/eW#k/.?"`jWOT`7RD5?.?+]ASc`!;h/T!-l
<,?"QWolnd%dcPm$md1E8WOEP8nJ5Xj]A.A0$Bu-5rpDqs4e!36cJ(J`h3uiu3j5lYX*!Io2I
Wb.tf;h:'=tUuKtVl+-Ua"sU2Gg\7dO1[/GcpK;/.rh$r:Vb=5>fsCn&W!&aF3BJ!_f_q\EW
NEkdgUm=3Jrm4shYGXDD65*ZBH*T;P/$(#CI^kaiYrP;I'd%#n=/D.<&O]AHcbh]AC48H*JajU
$a<@k>GLB"pSm1F[RX4.5)pcRth?i%]A\Boq<"I;/GnI2<._13*-h>P6ICGX5]AU[h"t#/Lt<h
2,/G==?Y7c+Bm0rbLE(Uj$W%MrGCn)]A*uF0^U]AQUFRJ^qkI4S]A9?[(kH-a-lYk@>:faIF1mn
]AK&*75R>`npC/[sk6!P')j!`raREfm1Fnbn_;deCbm_>]A#\MENt%pLKJ3/DMVWiS+#E%kHa3
cOj_Z,pXtS'QlQj1.@\Fa<$/3Mo!@D_2dL@-'4'JV[l?FZ9P.\gRMMq8^hsan?Fj7\qYluH?
O]A_Q9>?j_h-YA4/p2p%c'5QL-6;UPT.N9?Abb'PA^r;[II[)5H$Di(9\uT!1lid008F]A!6j6
Z^]AKKhU,2?f'>g&QQ\S&N<'ZGlXSS%ot8Mp%-.+[V*pEN&,*..Fo4?RD*qYO>%V097136rC"
l^$b[^L.#\TB!)`?G9lDJ&KV3;dEJJ`(0K=PN/:I;H,<on`H"L/.M4IQbPQZPoZ)K4C.njei
>$5!<<~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[B2<B3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="index2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="1">
<O t="Image">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n,XBbeX]A55Q,2/A7/eW#k/.?"`bts#afkaDrQ'Brq$+SG5Zl:+C
c$$9g7l%nUge*/"mOBUe=!=mUVFU^e$f^6GTDg+;1UQ-og=i01Z3kmQ]AYs+OIo\?sOFr+qX-
Log"[K'T@X[!K7]AcJb"=p8W[:5_toJ>!rH+7[Ki0V9,paSR%.UTHhZgS4?b7(c^3j#0=Yiir
:0ZQp,C7,$k/*h4C&po.W0*oT'bEO+O\95gWY!(W33MG?1kE$s"@"34SbptG0,E3Cr%X9@L'
@`s&$fb2/eQPQ7mTN?I0>19=9X:F3N/eDGT38?^!)\V6Lh?k47WXd$GE&=DbhCQHuA\3HGk'
pT_kaQ2N.GQtKnXE'[91NM,oV^\I8&k;$SWs8I0/NssY![IW'2`4]AeEQgM3@8)WQ!ktRAQMS
>CfpT<c0R*eqR[J>9V6g0YlO-cu8C#68[qQfeFm'=?hrg^4(^0nM2H%+6*$Wd9^E'G0nS+YN
sLY6%L#-Onkr)@qr/2q%5n:?OKc.cEc@Ws1S+4+846fR/]ALGM7EVl<B!<jA6BCbB3cZ<"'PD
^QnQ0#`kfeth10d*_!;@eF2u-+ZMhiMO35_HLLqVp1.ef<3uU3A!-[93,ZV8WSK;[]ANDOTH(
NBQMH8Qk7CkJ,%$pECL5b]Aol%EGs2?BbWU-L:aO^9+c8XTs3\M;WJNL;NWa+)3J*Tf[^?*V_
.(a/]ASYG]A-O+$Kh8E8kdhUm"CS0b019J4]AbBj'u-Z^3QR\@VZ95(7:YQa[<7s4mpl029h)[0
r:(oXT3Ql'$%,o'9`u[1BjE5<GK`rl(Bb0/T=#0D#'dq<&.QK[[9*?^Ml3;5Q:sqi]Ae0pQD"
Y(pEo*fEk.pT!!Mpl^STV!!~
]]></IM>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[D2<D3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="4">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n,XBbeX]A55Q,2/A7/eW#k/.?"`jWOT`7RD5?.?+]ASc`!;h/T!-l
<,?"QWolnd%dcPm$md1E8WOEP8nJ5Xj]A.A0$Bu-5rpDqs4e!36cJ(J`h3uiu3j5lYX*!Io2I
Wb.tf;h:'=tUuKtVl+-Ua"sU2Gg\7dO1[/GcpK;/.rh$r:Vb=5>fsCn&W!&aF3BJ!_f_q\EW
NEkdgUm=3Jrm4shYGXDD65*ZBH*T;P/$(#CI^kaiYrP;I'd%#n=/D.<&O]AHcbh]AC48H*JajU
$a<@k>GLB"pSm1F[RX4.5)pcRth?i%]A\Boq<"I;/GnI2<._13*-h>P6ICGX5]AU[h"t#/Lt<h
2,/G==?Y7c+Bm0rbLE(Uj$W%MrGCn)]A*uF0^U]AQUFRJ^qkI4S]A9?[(kH-a-lYk@>:faIF1mn
]AK&*75R>`npC/[sk6!P')j!`raREfm1Fnbn_;deCbm_>]A#\MENt%pLKJ3/DMVWiS+#E%kHa3
cOj_Z,pXtS'QlQj1.@\Fa<$/3Mo!@D_2dL@-'4'JV[l?FZ9P.\gRMMq8^hsan?Fj7\qYluH?
O]A_Q9>?j_h-YA4/p2p%c'5QL-6;UPT.N9?Abb'PA^r;[II[)5H$Di(9\uT!1lid008F]A!6j6
Z^]AKKhU,2?f'>g&QQ\S&N<'ZGlXSS%ot8Mp%-.+[V*pEN&,*..Fo4?RD*qYO>%V097136rC"
l^$b[^L.#\TB!)`?G9lDJ&KV3;dEJJ`(0K=PN/:I;H,<on`H"L/.M4IQbPQZPoZ)K4C.njei
>$5!<<~
]]></IM>
</Background>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[D2<D3]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="1" r="2">
<O t="BigDecimal">
<![CDATA[0.7]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2">
<O t="BigDecimal">
<![CDATA[0.85]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ListCondition"/>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ColWidthHighlightAction"/>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ListCondition"/>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ColWidthHighlightAction"/>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="5">
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="4">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[j]AW$O<;GG'7Csj[\%f:"\nu9n9tR6"To8=TD>Rt5R%mj'<6?Q>0if*[M@*'Tl*@bKQql&=`C
N>:;OH,M$DVX!Aoa>[0]A(\IKB=.fpNcdWch$T%p,r"1No0O,rHuAPchI>&nAYnfFb^hEe'c[
m?+nC,PEsd-Y*RYSd*DrK00K-(@^WSW*P'mMahN6G^TLmmA4kgHI$o#-jU:dL%c'CVN4-*kk
$nJUM(8'[bH4uFn^okk:#8?lTg-jq3Up^K4"kBnd%OJ6cenZK7/ES,Fo;N,[</PDhA$bW2I$
*I=\,H"Oc>jlR7c4H?C'">8(lgiR"=L=heFI84aDjga$GHX\8(ZB]AH`BsXGO>K7Gj$.3c047
Clh23bKBIB-&J/Pm@ij?7(PPR`s=n4SI6fXbqj44(`TCpiBW@8NIcX#F$p?NW^G0'$X&,_bQ
p\SE6Ls[I)LPqn@tAN(noJ0hM%`]A*L!5/MN^GL(Lc)@`/NfpLPbn:3!ZbDk*G\o&+pG0]Al8m
na*GGe*/g.!QeGA:s&;+$YPVi%r0<1>=`A`ZN4HDJ&h_0%/=)f%cHZ0dj=DcVfO^N:hnoCN-
3.5;4kH7b!,WR`"oN_E."852!)=p_!Hg#p!QRm0,K5"?W.a>G`.Z&k'YQ/bholNC1CC;g3']A
jk$=1J!Htrtc)>jX_Zk]A;_m0efU"AH)l8UD*F_;e6V_^H`sr/0G,nW%&bX_-jW^m<sqoaL9s
op<JEc'Rck_Uf+o:<\MF/P@GaSunp"\";Dq"-%c=n<H<s,@UVN]ACdiuSe#ZO6m50Uha-F9RB
"-\*igoC)tk')+$!e,;0:!'OKbU1L)ums;eN.7&W^\U%Kafu3nHf59A]AM06n<1g\KEqV@4:Q
7&6,+>1SD()F8j.qh05?-"-7EB5^]A#fQcroMq?f,JB8hG""p$./5'J!K%E]A^aP]A"!n[Q)rA<
gUiJ.Q3+2mJ.&>Rl%oJS+sf'ghV+m]Af*RckkB,X"&-&,W5(<J8P*2/Z,r/!0ep+@mP[b>GPh
2s0.NIHFbIMiO#3_0%sN.<9kS#a_CkJd01&M&.u+MXCgO02n$ge/?$+,k_s+1<JC%+J;&*Mf
D3%9Cerke8/0&5I^[^g0^m.7Ml+$0cM=B-0)3$-f2iMr\&!9"M".ffJ^[#JBrR=jHFO4%B>_
FF2T*1-sJ7@LY15SANF#cNrK3DqShR-6GTmmELh\Hm*CM6'#?6r0b@>F@Me<tcF%oX=qVqVS
AF]A\mU4=]As-(j:2YTbH>_jq*`#KWo:Blbd1$6fPRqmF2rNn$HFad,>6cf@tiSN,NBDE`mffE
:f,=9r3TWFi(.>BR#%_^gnZS73^D6K<>13guogOg'LYN5(I"ell(8u`\(1$BXX,7JEgrFW+e
8#<s/4T;LHYEf=gT<MYOGeLp(alI+GIsY*Hf<$&,O-T(_K&3ZTSDZ8&=TNsAuD&jO>jNj6Sf
9kfhG:3F>kq9L(T'AUATHfhEsET>%QYun<<UkO:@>)@(VkPlk``Rr6(<_@h"<Y$AoNrtmIm.
+hR`8$nDC[Z1rHHdQlLC0LTcW&.+W)q\rG!nZ.,\'>7gXke_Z^SJg,F:(@Q3J,4VVrCgWu7K
14fsjbcLZ/M$okWfn?L:#>rf8W:Z^RaDHDZpB*hX>#^$k!.u[[`hg/nDXfNNj`1Ft1+L,N[.
rQ046%STNYn5KR2RaCQUo9\H@bP/6QLh=O,u_P3rC/5c*>*P,_IG*/$^;XP4$-c/hZ4,J]Afi
1V=rqs/LRde)-CRr7a$j@tNk3Ca\-9@Up4(-4'cStjf[EI*p>*WgLZE'`o>V$K8EJ')\'VD'
kWqFul8_qq0htbT?XB2W')SgufEBZQ4jB]Ak^g%&TG)fcTJY>L.Q,Bp9(O"/!\G"9!T9'lRS'
iUGS65CaG%Z&Cf=TN^&*^u!aias;UrGS?B3CC-Jsb.I_K"t8)69c*S"\;KD50R&I%RW<&71j
)LZj+Cdpr9SmMRZXb;T7B/kYju\Jdnj#JALR4nb<1,X5kL<b5LAHTGVbW<t[bkOZ^dpW@'5m
<,1M0#SR"d4HNdnp,Tj-+4"p.Ei?[KD:Y.*G"?(S*G<[[:'d1_o]A2WY"2ZbX?sF&Q)P989dH
I`$_]A#VX(R]ADnYE74qC:BK>+sMZPsMh(R8u]ACm)`)4q)#?%8>N8?,89>2W8gg.oZbqoMWPWM
4=!ruJ0;h:Q5g4kB:XtpOg3qK%WNQ`?C\ZBaIRj;[2W'mf)^fs;*?GT?KDp)Cp'n$4k"LeKm
q,jrc]A[ZF*mH;_\j'kGH\g/H)Q:)ccd2kN_k6u\T*bE5^D_I]AkkOEDnnMX]A%3aKRiK.Y/*H5
TKgRMYhn<`3QE^<%1YQ,.Y>O,I=5J@rA*(dTK>#Si=J%^%6Wtk4#:['qa@Sd]AB0Pb.<r%7lc
;'s8Ag3aBT#anh_1Ar=i<\GpTu*B"YM2/kjP&,hZ_sV3[JNlK951?\G8Bi]AB[mCpBY4XLT>b
S^!>Ci>?*`bO'lHt:b?)_MS5dA0YaeaMq9O7<K$'U2k=r-"ogNC8**T_t*icM&2L[6toB,fN
#7j'>$QJRl)U7u"EIq(7[k>UFn$4@[_BPQZT82acN"Q,,XqjZ@Z12ui1"%kO">ed^YfCgk]AO
5ts*7re_$V+sBI\$%#TZh##C*At[^Cc6IX*qkB2':_+JKfK22UqW(:<(lua^]A#2691??)IQa
AXHfFUl#,&5g6/(;dc*kfasi&,FgnjmSrG4rD$=emPM4OidLu[A=b)p!hZ6R([PQ<(#7J.S[
Tu3=gURUE$H0(T=NID`W:mr@SJu5>'aITH[u,EIkaX]AeWJmU2#u).ZrYaO"%!g/lCq+&fE;b
gUc[Q8Y1,^K9:-/Z>ltS>T?-sZn1StpkRn"JbV/p1>?TB\6H$qli`^K$?:GpB61KpG0RS.U#
,Id&3X1oWCDmG,+4bG>e"%/<tEN&<?BiD=@>u^!*Uf]A.?Zg6.)q"XL6o",>%orWffB_Q**T%
mNO40G;0Y,ti$<:k1b3Rc$c%=qWNinT3k3+`pAJ#o]Aa0q2**8"BY#h=hYMb-+M.B1=W1MG([
srB@WLE6UNF$_EVKQD)p1m`er\k`AR44OnIm0Fk&=:iGs8mjtX#=YY/S6M,@uk`OGY<ie'.M
Iq+@i/-'5r;i`G`)T8\X0t[7[]AiMReHFlF+MSH_`L'EuKG2U8(76)#&*4V$hV;<ddJt^0l?j
`H#]A<kpik02KZXh"R^lm"&_.,T\kpu(f=b3%F(E<]A:gPN#<d";Wn@Om5/EUu\V<Wld:j87/"
`Q/l&qW^^H]AIP6"/DcE:Kjg7_kHcXq0_G_uHi[LRUu25-j4BPDgl/hbBB&bB28.0KX>Eu%kh
7\rMRP*71HWd,&2&!VO/jl`-2*GsmMUJ!I^ffgQr/lh[HOR"Aup[KZ[#!*bLl/Umi#M=`ofI
q>R8LS\gQIlD:>:4X4Qd5^SQWF5eINtlR'3RM`Z<Qi'.g4-<n'`irLFZg&;C$'6O1)TW-HS8
N0AgIF*Pe)8ik02r%!4>3Ot<k5E;gpLUMeO</=k(9Rm0N*kP$_CSF?_O9&5D43QF!ToO.+?&
G&I]Aeu%'49a+$S[Y=3cF_a_i;Z'%qZu#*sI]Amp_NMVHM^fZq7KKgG8]AJ,#Z&^nZMKbEW^Yis
Obr^Q0_h7701:RTg_!!WWaE(A-l=NYr.nVaK$W&R)b.S*!4P`\%.gK)80d&f#\'3a8H3;'F8
VNq1Iq=]Acl9c"_9mIQQ9L!pc1EW'IS!&+2*h"DhrL7o*)niVL+'Cn43]AFg\MM(-"34[pi1?-
ReA+*DWrA7ClH<qSr"S`__Z)Kn$L0L![S*o>GM0rj[r\hBe"EBt5nL^.Au[8/PNpWt/Xoc70
Me;s-1TQfhuKFf]A6D2^CXc!N#a.r@cZ[u*\gInk3D4m<Hc:jnKIIkmEt50j^<T8"@0dop7jK
sj^1BJ\AEsSE^;O0:PqM2&oYF"Q;DsVe/l8"J2@K7KH-`MBr[!T(*l:COa8:halhQ#gRh`%&
?%(g.]A0s0)FD:(?)IS@-5p"`I)fQ>O,K3g$rY'l=-iAp1fQJbMjeADI!.FuG<=_-J'XNdb^A
jl"/3%*_OR1QRrM*N3O9tI6:+rfkb>#+Gm$!h<d-fe4QhuCl5a]A_R)Md[B7q\_PmFPh$/q`R
]A(oT*A@ttO@'<9q*_1o?/fE%HTp136ZhR-,V+fC<(6*et&rBO:/)hC/jp@KRbi;8Qs+]A)<iY
-E3a9J9[n5f4CFM^9fi'/>TB1jt[`"sZZV`u!bq-k_B*#Mgb30_:K2YbPr'>5l]A>PN[od.Ya
p`C"uCXP:ME8P;Np\([NobL,S['5lD\A2I3[hY>8X,b*?udG$AaF#Z/]Ap\gqsh>N8q((c=#r
P=X/FhG7"BLHibp+$Pt1#789OJnfIXeK9DD'CGhbrKWM+RZ-L(@Bp]A]A>BFJ'VleD58]A:*D"]A
3.p`0OX%JrnW",E3F#R#pH%RZLE#%42`U'-*^(\Wh=B3mcC/3BZP9='ndVamUn3N4WAcFG2'
Ijjtp="1??-"7U*C^-IF\OlLUHa"Pt3ire^Z?]A]AF8W!.n#hf+5e*fOY9iaqB6ml1;+f6ED6i
^XiulufCH6VVdqe6k$3+HJW*!XLbuBESFB1cU^85*QY=d.Z1/Ai#kYCPoVK*H_=.Z"@1VQY`
2`"h;15><cU`r:>Im^-O/u='=iWg8ubt[-6mJ15\-KN;Q=*9c_L@#We"Ib`EIr0t_g<p-0Ul
s0H[6Yo0!T+NG>1:.fOuW7`$M:WAmG_=j<(S]AL\!UcUgdf<Bjp"/l6rZ#/rhS=k07:D*;$dr
V(IHrk;0@UaKo':%67N1"oPim.J7:FA#`;#R6)b-*5MG!]Al1do=i#=VNVja,lrAL5I^h^BVM
$[A$"j!S"5'[rKVfb6Hh2&Z?K[qKsths'%QaemTG/D9`tQE2+upV%TbVqL:c+O0E%+LT?X_U
`h)hE)'P0qk)q*Z6`V?a\40o'OU+*CkP#Nq#EZZVpE/&W%a;o&Ff@A#uAll)i9=3Hn]A(s,3m
1WR&A%<GQKI:T*2=G,Po69Y=>Pp!$9rHY/-_65XDRo5P*j>*n0ZJAPlA=OcCs/$j]A)W4dH"e
03fc7I(n]A:JH9IUoF?oL+n:`tar,,S)*b]AoC&qKGPps.>R"F\9/khij<c`^EAsb0mA=O+Zi0
'FOX`B4i0&SYD2-(ol,TT+>YCpX5R9kN(gS/$BdDdcI2bg!j>N#9lBFe\m-N]AqO)IB&mDroH
KDPIC)a?+T^QkZ+R#X,LrC["S#/IlEA9d;*21>\_'HmMoq3'rK.!Qbp:og\DOSoR3YK:-'t3
AX)#rc8.OeZ,#U2sfj%7Pe[TZC`S_%O;Z=8atTI17m/HC5Z<iRhmY!R=>afZn8U[bYsaGOsi
P!.TMSSNM4ec;\uEl#BG/erD`\LAY97q)M))'*;O^)`<DqUR&.BtN2/jXPsjWD]At-kI4.'cF
]Ac:<>n]AB$,aoloCcV:_[J7%9]A/t.#HN!_WdI\@$<:n9G,]A\*),-Q(_B'&).<-GN&Qb[q*n.j
#Q@Yb>0>ntc`I&g'<ln+st@rU6CkD09l^]A@USn>6nd>j/TWPg$%n.n$.Z.oZ*5>&N&9b(NQk
GBber@=nH=A0`7W)<%djTl+J#$8,4P!i#E^sKH$:G)H%uL3,^J/m%C#&bum6!lio*DV6#bVq
?q`HL.l2#&rAA$Z\&tCCU3t)==so7^UCDC[T_t$VO!WLMP7Hj@+B),XN$*c-;+s4_t<:SdRF
8.d\WYHU^X0@%F17X?/*+s;)94W=Wue@KJ$#cpJoc1=W(/?e81n*`:n<M&8Ggq,hHj!;'X'0
\C/$Z6t$D.)MXVG-CA_CT-c#!oU#K%YjiOOmp^qCeSZ5lrH'`8k8XoVR3nT*6'NP\XI"o<-?
iHTBE9]AbZ.*3=jN3V"VI<A$g!nAI,a3,W#,atTW^6D4_RF55HU.[?$JZ^'HfWo$!B;5P;la+
?*rC'%cqFG+IF35&U,T6+6J*_B:+bWc`2a+4jC2Q8:!"7aQo'N>*l>%LS`cur]AiH=;s+,abR
?"%qXoFiCs4?6!Sf:,`mfT9X,)1-3kTEVl-eqeu4=MLR"[5]A5<'b4nkb#+-UGH%PQ]A7*3p`m
Y:+I=JdidOLahLb(R--H,I#/&sEeTNZV`euS,)QJbTDUl-gq+0,!$([`r<:;#Iq2!MLONf3m
7]ACY<,IA_`S._\l,RrpKP-&'?T;_0lR/DZ:5&es.6?dA1_5HVDr.aJi(rC^?IFtHod+#qq72
SrrPhlV1qO!t:;#OHE*U]AU8A0PK>El=TmD1-aphq]ACkiNA\\MJ0<n!Te@R-!i/Ll2Gb.polC
eX0%>jcK)>9l;uGV.5dIZifmCmqh2=oF0H`h]AOV-7P5;;tb+VU>?I.k7nR:"MrA>8o\+eK9r
8=VXhkKN:bA$'r:KO?VA&H=<QaU)jm54%0?o2hVA?#i82;1=_.`We#dQXdFDhMCbI6M)rpj8
7MQD7?`FR]A,k7Q+dRK@920n@*fgGt?^.d7ds[p+Ci0nS$QA,AV?*LsnWnBKrmtcVrM(e1M^%
""T*<;p@'c1S=^:>CetU^9VB/#*)Ei:Dia/o()h=<NbniB^*ZofmT<C''HsoK@KA/RdY4a]A,
%s`HdPR3R/H(j`=*CngRFE+R]A#c34Z`RR9pi-i5dVN4.Ciq02<XX>\,8U)j1B*2m)rq&M6<P
;h")>]Ajg:b3So95Ms$*6/^M%tM[DthuK0JloYFKhDVLIY)p`jQur,q$qR.a,A=7A&0%$))77
RL-1hkPV3qKfg'P_-'a9DZ^.<s&fIl/\`m3!s1[rTDY&5#`a%B08Q?;J-Vm(s/>0Kq]A`Wg%*
g2]A>!a&R^';!9B<'lDD0:gC.>H:M[:5KM.Gc;Y/(@d.1)XF&dum#3^an\0G0To`M!n)^3@dc
UCk-;K7-NRi+,E3Rp$lHJ'VWn3_\[h:<_(b[#EdY`@,S<np[-#0n7ea%4M4f_b.:_nA*Lb9B
c0<<\N?<I;Ps)aF=3~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="317" width="551" height="236"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-1777440" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\'  \'+\'商场分布（联动）\']]></O>
<FRFont name="Al Bayan" style="1" size="144" foreground="-14898964"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-1"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.map.VanChartMapPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapLabel">
<AttrMapLabel>
<areaLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</areaLabel>
<pointLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</pointLabel>
</AttrMapLabel>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapTooltip">
<AttrMapTooltip>
<areaTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</areaTooltip>
<pointTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</pointTooltip>
<lineTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipStartAndEndNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</lineTooltip>
</AttrMapTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="false" markerType="NullMarker" radius="4.5" width="26.0" height="42.0"/>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<IM>
<![CDATA[!UKt'qMA$D7h#eD$31&+%7s)Y;?-[s)#sX:.0p+X!!'fuK$F>r"g^cg5u`*_[9%-;P?/Uhp1
)41m$Ck\`@P4u[Q0UZW4a>uj0A_)K8VcH(RJsk&gmi[j<=rE=M[lI'PWIoE%2dFag@;43:@f
NhNdnH0eR'r]A4@=IUnUfEIEunT'\^tjpE`U1c8k@j4R[Xb+)fQl@U;0YWpS8GRNB1BB?rh'J
#iO%G^X(Fb&k'NjZ5o66J(g]A>\g5O]Ad&nFF*\*<l3a*B-\^-V"/6*[8Ct=5/^sEXbB<OUn*I
PDSDW>#p\,3HLE4u6pu&qFHIqF*A]A*X,Y`id;>56&_,#R*,a>Gjl,$r"8ccDH]A?`!\O!%m!d
V]A:VUQ)LGur@?TM"FI\V4+Q[-MFaeZPZ%12@:d?q#;"<:="22V,NU2$*UIhd0Du'(Nb:pO&P
Ob-GphK35V)O;;Qdu7fd:(]AJ3Efa[*ks-LD6"$Vb\#[gh"[/lQ'<ZIZ:XWHRUHHd#Q=ZoeV*
X\RCNeX"Y,WjjB?NlJqWqCZC/ijJRq`D\s&IZF3%7.;VhTNqW"On;!!t\go2^eG0Ca&Z\\k-
e[,i>hn\A`I"c9gUk+,5T:J(Nj4r5WOk]A!fuZj_iA<-oqIk^CZ4H`G$\"\Wlq".(o<BD^>Hl
QqL-0O-0Lt`7Nfg3f8`/@<6Ot5%U@3U1K=9OIX;ti0/:e,AhubY-H#q.>'ee4n*JF:e7Sa;G
BPAt5jd$S0Ic3=VqJ>ShPc"8.XY(%4=F]Agk(]A7MbLQ?'cca0lMD=E4/'pI6oL%5[2H8IBDdC
rVm:6Dj]A_?>A<_$b^`\Fe/8KhY=bguY;qH;=gWblPsDS0e-=IZ!fd:AH?F`kdCQX?ZKq$\"\
GAH,q7dMolqf^96#M/^`Lh<pXSmH:WLVVXdfVEgM5pqSE6E8V3oc6FnhbDbj#:e1D_SbAEpK
rnu:UUHMpS,<ls_9WdrDqE7cg)_YdqajuS%KS"3CA*h'iZMMD]AG4;ZJ+FJ>Po\d,G-f:3lOU
^/D>/He8Xl.r.V`6?/aF6?\oS=`0T8IG/,buu?Fe@I00UoiLZ\l<PTOH-L+L@AJko:unY^?.
FWiE;T]AJW$g-(Mf\0F;b73JaUKco(B325d9Y8O%4fLi^.,:$U)QO.<U?".j[]A<QhC!M?U;q@
NSk=:l7Tp8@0$:jRbT6oD,$,]AcMWpG"F7irC;nM0f".+6t$;".h>tmg+/*B,=od?7&jb0::3
&?r"S@OWiQCTm9*\/#1dk*B_3up7OZ^?4mm=<G[)<YHn(tDR`(AUPJX@JLL^#i(6gLINH0O6
Us:hNCf05/Yg]AhF1)KN#nY54aXr+M_a0<dAAWbH$0$\V38O'5)iiV*JV4'=[+[#5SsaA_VFA
.H3HZR@^kBFuE@-@l=smM[iXHpL66Gl\LH;/#Xgq,HCHOFPm>Mud`pi")=GDu?2a8DU[3@"Q
Bp21NJloI#I\V40^^g(4p%sC>!cu>V:Ei2XBN"I=.9Z,:f;kF*!a3E)8S,Ut5)ZA#4%+_";X
:uSjL%_\;1X2K@@rNb;3Qm]AqUkWqp5MaeN^R)61o%?@.Zc7K\:*ldr"=;`o2VYS7$hBPEY1C
teW'M@J9LQpGB;GeQLKMGVZ:nB7"(@(3Z#J-d5M)>7mH?J5G_G0;F0oP_P4K3]A[jtEJ%>JaT
T43f$WO!aVYob1Z\Mb!5:1;46Z^a0RU4\a6B['b%(Z)-!m@]AZYPG[rr]A(-_$4:#+8b='i_+Q
)&X@+)rkl4FC6)3+PdG>F73bVR%Mi")@D<sP(2^Z]Al/s4QY##U;hM8ien'GRtaO5:[K7"iUU
Vmr\?7J,4k_@$/Gl;-K51&M_>jWSrD\rUERq@aZj]AVI,#ISh&in0I"[O9cYN"p[Kj^PRmjSr
*=A%5kIU)XZdFq>^Kq!(fUS7'8jaJc~
]]></IM>
</Background>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrBorderWithAlpha">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
<AlphaAttr alpha="1.0"/>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="Al Bayan" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="false"/>
<Attr4VanChartScatter>
<Type rangeLegendType="1"/>
<GradualLegend>
<GradualIntervalConfig>
<IntervalConfigAttr subColor="-7881222" divStage="1.0"/>
<ValueRange IsCustomMin="false" IsCustomMax="false"/>
<ColorDistList>
<ColorDist color="-4006147" dist="0.0"/>
<ColorDist color="-7881222" dist="1.0"/>
</ColorDistList>
</GradualIntervalConfig>
<LegendLabelFormat>
<IsCommon commonValueFormat="true"/>
</LegendLabelFormat>
</GradualLegend>
</Attr4VanChartScatter>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartMapPlotAttr mapType="area" geourl="assets/map/image/商场分布图2.json" zoomlevel="0" mapmarkertype="0" nullvaluecolor="-3355444"/>
<areaHotHyperLink>
<NameJavaScriptGroup>
<NameJavaScript name="2">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="PBul"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AREA_NAME]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart1"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="3">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="PBul"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AREA_NAME]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="report0"/>
<linkType type="1"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
<NameJavaScript name="4">
<JavaScript class="com.fr.form.main.FormHyperlink">
<JavaScript class="com.fr.form.main.FormHyperlink">
<Parameters>
<Parameter>
<Attributes name="PBul"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AREA_NAME]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features/>
<realateName realateValue="chart2"/>
<linkType type="0"/>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
</areaHotHyperLink>
<lineMapDataProcessor>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</lineMapDataProcessor>
<GisLayer>
<Attr gislayer="predefined_layer" layerName="高德地图"/>
</GisLayer>
<ViewCenter auto="true" longitude="420.0" latitude="260.0"/>
<pointConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</pointConditionCollection>
<lineConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</lineConditionCollection>
</Plot>
<ChartDefinition>
<VanMapDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<areaDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds3]]></Name>
</TableData>
<CategoryName value="building"/>
<ChartSummaryColumn name="a" function="com.fr.data.util.function.NoneFunction" customName=""/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</areaDefinition>
</VanMapDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
</InnerWidget>
<BoundsAttr x="551" y="36" width="811" height="728"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[='  '+'商场分布（联动）']]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="Al Bayan" style="1" size="144" foreground="-14898964"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-1777440"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="811" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[商场分布（联动）]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="Al Bayan" style="0" size="128"/>
<Background name="ColorBackground" color="-1381654"/>
<border style="1" color="-1"/>
</title>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.map.VanChartMapPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrBorderWithAlpha">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
<AlphaAttr alpha="1.0"/>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapLabel">
<AttrMapLabel>
<areaLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</areaLabel>
<pointLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</pointLabel>
</AttrMapLabel>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapTooltip">
<AttrMapTooltip>
<areaTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</areaTooltip>
<pointTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</pointTooltip>
<lineTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipStartAndEndNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</lineTooltip>
</AttrMapTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="false" markerType="NullMarker" radius="4.5" width="26.0" height="42.0"/>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<IM>
<![CDATA[!UKt'qMA$D7h#eD$31&+%7s)Y;?-[s)#sX:.0p+X!!'fuK$F>r"g^cg5u`*_[9%-;P?/Uhp1
)41m$Ck\`@P4u[Q0UZW4a>uj0A_)K8VcH(RJsk&gmi[j<=rE=M[lI'PWIoE%2dFag@;43:@f
NhNdnH0eR'r]A4@=IUnUfEIEunT'\^tjpE`U1c8k@j4R[Xb+)fQl@U;0YWpS8GRNB1BB?rh'J
#iO%G^X(Fb&k'NjZ5o66J(g]A>\g5O]Ad&nFF*\*<l3a*B-\^-V"/6*[8Ct=5/^sEXbB<OUn*I
PDSDW>#p\,3HLE4u6pu&qFHIqF*A]A*X,Y`id;>56&_,#R*,a>Gjl,$r"8ccDH]A?`!\O!%m!d
V]A:VUQ)LGur@?TM"FI\V4+Q[-MFaeZPZ%12@:d?q#;"<:="22V,NU2$*UIhd0Du'(Nb:pO&P
Ob-GphK35V)O;;Qdu7fd:(]AJ3Efa[*ks-LD6"$Vb\#[gh"[/lQ'<ZIZ:XWHRUHHd#Q=ZoeV*
X\RCNeX"Y,WjjB?NlJqWqCZC/ijJRq`D\s&IZF3%7.;VhTNqW"On;!!t\go2^eG0Ca&Z\\k-
e[,i>hn\A`I"c9gUk+,5T:J(Nj4r5WOk]A!fuZj_iA<-oqIk^CZ4H`G$\"\Wlq".(o<BD^>Hl
QqL-0O-0Lt`7Nfg3f8`/@<6Ot5%U@3U1K=9OIX;ti0/:e,AhubY-H#q.>'ee4n*JF:e7Sa;G
BPAt5jd$S0Ic3=VqJ>ShPc"8.XY(%4=F]Agk(]A7MbLQ?'cca0lMD=E4/'pI6oL%5[2H8IBDdC
rVm:6Dj]A_?>A<_$b^`\Fe/8KhY=bguY;qH;=gWblPsDS0e-=IZ!fd:AH?F`kdCQX?ZKq$\"\
GAH,q7dMolqf^96#M/^`Lh<pXSmH:WLVVXdfVEgM5pqSE6E8V3oc6FnhbDbj#:e1D_SbAEpK
rnu:UUHMpS,<ls_9WdrDqE7cg)_YdqajuS%KS"3CA*h'iZMMD]AG4;ZJ+FJ>Po\d,G-f:3lOU
^/D>/He8Xl.r.V`6?/aF6?\oS=`0T8IG/,buu?Fe@I00UoiLZ\l<PTOH-L+L@AJko:unY^?.
FWiE;T]AJW$g-(Mf\0F;b73JaUKco(B325d9Y8O%4fLi^.,:$U)QO.<U?".j[]A<QhC!M?U;q@
NSk=:l7Tp8@0$:jRbT6oD,$,]AcMWpG"F7irC;nM0f".+6t$;".h>tmg+/*B,=od?7&jb0::3
&?r"S@OWiQCTm9*\/#1dk*B_3up7OZ^?4mm=<G[)<YHn(tDR`(AUPJX@JLL^#i(6gLINH0O6
Us:hNCf05/Yg]AhF1)KN#nY54aXr+M_a0<dAAWbH$0$\V38O'5)iiV*JV4'=[+[#5SsaA_VFA
.H3HZR@^kBFuE@-@l=smM[iXHpL66Gl\LH;/#Xgq,HCHOFPm>Mud`pi")=GDu?2a8DU[3@"Q
Bp21NJloI#I\V40^^g(4p%sC>!cu>V:Ei2XBN"I=.9Z,:f;kF*!a3E)8S,Ut5)ZA#4%+_";X
:uSjL%_\;1X2K@@rNb;3Qm]AqUkWqp5MaeN^R)61o%?@.Zc7K\:*ldr"=;`o2VYS7$hBPEY1C
teW'M@J9LQpGB;GeQLKMGVZ:nB7"(@(3Z#J-d5M)>7mH?J5G_G0;F0oP_P4K3]A[jtEJ%>JaT
T43f$WO!aVYob1Z\Mb!5:1;46Z^a0RU4\a6B['b%(Z)-!m@]AZYPG[rr]A(-_$4:#+8b='i_+Q
)&X@+)rkl4FC6)3+PdG>F73bVR%Mi")@D<sP(2^Z]Al/s4QY##U;hM8ien'GRtaO5:[K7"iUU
Vmr\?7J,4k_@$/Gl;-K51&M_>jWSrD\rUERq@aZj]AVI,#ISh&in0I"[O9cYN"p[Kj^PRmjSr
*=A%5kIU)XZdFq>^Kq!(fUS7'8jaJc~
]]></IM>
</Background>
</VanAttrMarker>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="false"/>
<Attr4VanChartScatter>
<Type rangeLegendType="1"/>
<GradualLegend>
<GradualIntervalConfig>
<IntervalConfigAttr subColor="-14374913" divStage="2.0"/>
<ValueRange IsCustomMin="false" IsCustomMax="false"/>
<ColorDistList>
<ColorDist color="-4791553" dist="0.0"/>
<ColorDist color="-9583361" dist="0.5"/>
<ColorDist color="-14374913" dist="1.0"/>
</ColorDistList>
</GradualIntervalConfig>
<LegendLabelFormat>
<IsCommon commonValueFormat="true"/>
</LegendLabelFormat>
</GradualLegend>
</Attr4VanChartScatter>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartMapPlotAttr mapType="area" geourl="assets/map/image/项目图.json" zoomlevel="19" mapmarkertype="0" nullvaluecolor="-3355444"/>
<lineMapDataProcessor>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</lineMapDataProcessor>
<GisLayer>
<Attr gislayer="predefined_layer" layerName="高德地图"/>
</GisLayer>
<ViewCenter auto="false" longitude="550.0" latitude="360.0"/>
<pointConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</pointConditionCollection>
<lineConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</lineConditionCollection>
</Plot>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
</body>
</InnerWidget>
<BoundsAttr x="551" y="0" width="811" height="764"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-1777440" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\'  \'+\'租金收款指标\']]></O>
<FRFont name="Al Bayan" style="0" size="112" foreground="-11976882"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-1"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1"/>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.custom.VanChartCustomPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Verdana" style="0" size="72" foreground="-4144960"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="12.0" isHighlight="false"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-7881222"/>
<OColor colvalue="-6514959"/>
<OColor colvalue="-10237754"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-13750995"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="true" maxHeight="14.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=1.5"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=1"/>
<AxisRange minValue="=0.50" maxValue="=1.2"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartCustomPlotAttr customStyle="column_line"/>
<CustomPlotList>
<VanChartPlot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="3"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="linear" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="1" size="72" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="false"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="custom" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-13750995"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="true" maxHeight="14.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=1.5"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=1"/>
<AxisRange minValue="=0.50" maxValue="=1.2"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="0" stacked="false" percentStacked="false" stackID="堆积和坐标轴1"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition"/>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="true" columnWidth="40" filledWithImage="false" isBar="false"/>
</VanChartPlot>
<VanChartPlot class="com.fr.plugin.chart.line.VanChartLinePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="linear" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrLine">
<VanAttrLine>
<Attr lineWidth="2" lineStyle="0" nullValueBreak="true"/>
</VanAttrLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="RoundFilledMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="1" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="1" size="48"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="false"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="custom" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-13750995"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="true" maxHeight="14.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=1.5"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=1"/>
<AxisRange minValue="=0.50" maxValue="=1.2"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="1" stacked="false" percentStacked="false" stackID="堆积和坐标轴1"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition"/>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
</VanChartPlot>
</CustomPlotList>
</Plot>
<ChartDefinition>
<CustomDefinition>
<DefinitionMapList>
<DefinitionMap key="line">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="pianqu"/>
<ChartSummaryColumn name="index3" function="com.fr.data.util.function.NoneFunction" customName="同比"/>
<ChartSummaryColumn name="index4" function="com.fr.data.util.function.NoneFunction" customName="环比"/>
</MoreNameCDDefinition>
</DefinitionMap>
<DefinitionMap key="column">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="pianqu"/>
<ChartSummaryColumn name="index2" function="com.fr.data.util.function.NoneFunction" customName="指标完成率"/>
</MoreNameCDDefinition>
</DefinitionMap>
</DefinitionMapList>
</CustomDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
</InnerWidget>
<BoundsAttr x="0" y="36" width="551" height="281"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[='  '+'租金收款指标']]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="Al Bayan" style="0" size="112" foreground="-11976882"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-1777440"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="551" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[租金收款指标]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="112"/>
<Background name="ColorBackground" color="-1381654"/>
<border style="1" color="-723724"/>
</title>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[租金收款指标]]></O>
<FRFont name="微软雅黑" style="1" size="112"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-1381654"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.custom.VanChartCustomPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="2" visible="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="8.0" isHighlight="false"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-26316"/>
<OColor colvalue="-339359"/>
<OColor colvalue="-6956824"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="144" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="96" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=0"/>
<AxisRange minValue="=0.60" maxValue="=1.30"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=0"/>
<AxisRange minValue="=0.60" maxValue="=1.30"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartCustomPlotAttr customStyle="column_line"/>
<CustomPlotList>
<VanChartPlot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="linear" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="96" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="false"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="custom" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="144" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="96" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=0"/>
<AxisRange minValue="=0.60" maxValue="=1.30"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=0"/>
<AxisRange minValue="=0.60" maxValue="=1.30"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="0" stacked="false" percentStacked="false" stackID="堆积和坐标轴1"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition"/>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</VanChartPlot>
<VanChartPlot class="com.fr.plugin.chart.line.VanChartLinePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="linear" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrLine">
<VanAttrLine>
<Attr lineWidth="2" lineStyle="0" nullValueBreak="true"/>
</VanAttrLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="1" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="false"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="custom" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="144" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="96" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=0"/>
<AxisRange minValue="=0.60" maxValue="=1.30"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=0"/>
<AxisRange minValue="=0.60" maxValue="=1.30"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="1" stacked="false" percentStacked="false" stackID="堆积和坐标轴1"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition"/>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
</VanChartPlot>
</CustomPlotList>
</Plot>
<ChartDefinition>
<CustomDefinition>
<DefinitionMapList>
<DefinitionMap key="line">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="pianqu"/>
<ChartSummaryColumn name="index3" function="com.fr.data.util.function.NoneFunction" customName="同比"/>
<ChartSummaryColumn name="index4" function="com.fr.data.util.function.NoneFunction" customName="环比"/>
</MoreNameCDDefinition>
</DefinitionMap>
<DefinitionMap key="column">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="pianqu"/>
<ChartSummaryColumn name="index2" function="com.fr.data.util.function.NoneFunction" customName="指标完成率"/>
</MoreNameCDDefinition>
</DefinitionMap>
</DefinitionMapList>
</CustomDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="true" fullScreen="true"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="551" height="317"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-1777440" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\'  \'+\'招商统计\']]></O>
<FRFont name="Al Bayan" style="0" size="112" foreground="-11976882"/>
<Position pos="2"/>
<Background name="ColorBackground" color="-1"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1"/>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="3"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="72" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="linear" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Verdana" style="1" size="72" foreground="-4144960"/>
</Legend>
<Attr4VanChart floating="false" x="80.0" y="0.0" limitSize="false" maxHeight="20.0" isHighlight="false"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-7881222"/>
<OColor colvalue="-6514959"/>
<OColor colvalue="-10237754"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-13750995"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-13750995"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="pianqu"/>
<ChartSummaryColumn name="index5" function="com.fr.data.util.function.NoneFunction" customName="潜在客户资料录入"/>
<ChartSummaryColumn name="index6" function="com.fr.data.util.function.NoneFunction" customName="意向合同"/>
<ChartSummaryColumn name="index7" function="com.fr.data.util.function.NoneFunction" customName="当月完成签订"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
</InnerWidget>
<BoundsAttr x="0" y="36" width="551" height="175"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[='  '+'招商统计']]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="Al Bayan" style="0" size="112" foreground="-11976882"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-1777440"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="551" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[招商统计]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="112"/>
<Background name="ColorBackground" color="-1381654"/>
<border style="1" color="-723724"/>
</title>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[招商统计]]></O>
<FRFont name="微软雅黑" style="1" size="112"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-1381654"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="linear" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="8" visible="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="false"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-26316"/>
<OColor colvalue="-339359"/>
<OColor colvalue="-6956824"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="96" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="pianqu"/>
<ChartSummaryColumn name="index5" function="com.fr.data.util.function.NoneFunction" customName="潜在客户资料录入"/>
<ChartSummaryColumn name="index6" function="com.fr.data.util.function.NoneFunction" customName="意向合同"/>
<ChartSummaryColumn name="index7" function="com.fr.data.util.function.NoneFunction" customName="当月完成签订"/>
</MoreNameCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="true" export="true" fullScreen="true"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
</body>
</InnerWidget>
<BoundsAttr x="0" y="553" width="551" height="211"/>
</Widget>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="chart1"/>
<Widget widgetName="chart0"/>
<Widget widgetName="report0"/>
<Widget widgetName="chart2"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="1362" height="764"/>
<ResolutionScalingAttr percent="0.9"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="JAA"/>
<PreviewType PreviewType="0"/>
<TemplateID TemplateID="862143d2-0e3a-4158-b9fd-527f03e53292"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="d590ccb9-6d95-4f61-b054-e1fd4088a575"/>
</TemplateIdAttMark>
</Form>
