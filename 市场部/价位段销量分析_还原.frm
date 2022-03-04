<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="按价位" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[2021-12-01]]></O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O>
<![CDATA[2022-01-09]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 均价段,
SUM(数量) AS 数量,
SUM(金额) AS 金额,
SUM(计算利润) AS 利润

FROM
(
	SELECT t.*,数量*(ABS(t.金额)-t2.金额) 计算利润,

	CASE
		WHEN ABS(t.金额/数量)>=0 AND ABS(t.金额/数量)<=999 THEN '0-999'
		WHEN ABS(t.金额/数量)>=1000 AND ABS(t.金额/数量)<=1999 THEN '1000-1999'
		WHEN ABS(t.金额/数量)>1999 AND ABS(t.金额/数量)<=2999 THEN '2000-2999'
		WHEN ABS(t.金额/数量)>2999 AND ABS(t.金额/数量)<=3999 THEN '3000-3999'
		WHEN ABS(t.金额/数量)>3999 AND ABS(t.金额/数量)<=4999 THEN '4000-4999'
		WHEN ABS(t.金额/数量)>4999 AND ABS(t.金额/数量)<=5999 THEN '5000-5999'
		WHEN ABS(t.金额/数量)>5999 AND ABS(t.金额/数量)<=6999 THEN '6000-6999'
		WHEN ABS(t.金额/数量)>6999 AND ABS(t.金额/数量)<=7999 THEN '7000-7999'
		ELSE '8000+'
	END AS 均价段

	FROM 利润明细 t
	LEFT JOIN 
	(
		SELECT 
		品牌,CONCAT(四级分类名称,' ',内存) AS 自定义分类,a.商品全称,商品类型,二级分类名称
		FROM 博远实物商品 a
		LEFT JOIN by_sorts b ON a.商品全称=b.商品全称
	     WHERE b.二级分类名称 = '手机'
	) t1 ON t.商品全称 = t1.商品全称 AND t.商品类型 = t1.商品类型
	LEFT JOIN 串号采购成本 t2 ON t.串号 = t2.串号
	WHERE 日期 BETWEEN '${start}' AND '${end}'
	AND t1.二级分类名称 = '手机'
	AND 单据类型 IN ('零售','零售退货','零售换机')
) a
GROUP BY 均价段
ORDER BY 均价段]]></Query>
</TableData>
<TableData name="tab4" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[2022-01-01]]></O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O>
<![CDATA[2022-01-31]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 
t.品牌,
SUM(t.金额)/SUM(数量) AS 均价,
SUM(数量) AS 数量,
SUM(t.数量*(ABS(t.金额)-t2.金额))/SUM(数量) AS 均毛利

FROM 利润明细 t
LEFT JOIN 
(
	SELECT 
	品牌,a.商品全称,商品类型,二级分类名称
	FROM 博远实物商品 a
	LEFT JOIN by_sorts b ON a.商品全称=b.商品全称
     WHERE b.二级分类名称 = '手机'
) t1 ON t.商品全称 = t1.商品全称 AND t.商品类型 = t1.商品类型
LEFT JOIN 串号采购成本 t2 ON t.串号 = t2.串号
WHERE 日期 BETWEEN '${start}' AND '${end}'
AND t1.二级分类名称 = '手机'
AND 单据类型 IN ('零售','零售退货','零售换机')
GROUP BY t.品牌]]></Query>
</TableData>
<TableData name="tab4库存" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 品牌,SUM(数量) AS 数量
FROM 库存成本日报 t
LEFT JOIN 
(
	SELECT 
	品牌,a.商品全称,商品类型,二级分类名称
	FROM 博远实物商品 a
	LEFT JOIN by_sorts b ON a.商品全称=b.商品全称
	WHERE b.二级分类名称 = '手机'
) t1 ON t.商品全称 = t1.商品全称
WHERE 日期 = (SELECT MAX(日期) FROM 库存成本日报)
AND t1.品牌 IS NOT NULL
GROUP BY 品牌]]></Query>
</TableData>
</TableDataMap>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false" isMobileOnly="false" isAdaptivePropertyAutoMatch="false" appearRefresh="false" promptWhenLeaveWithoutSubmit="false"/>
</FormMobileAttr>
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
<NorthAttr size="42"/>
<North class="com.fr.form.ui.container.WParameterLayout">
<WidgetName name="para"/>
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
<Background name="ColorBackground"/>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.parameter.FormSubmitButton">
<WidgetName name="formSubmit0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[查询]]></Text>
<Hotkeys>
<![CDATA[enter]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="192" y="0" width="80" height="42"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.DateEditor">
<WidgetName name="end"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<DateAttr/>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=""]]></Attributes>
</O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="80" y="21" width="97" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[结束日期]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="21" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[开始日期]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.DateEditor">
<WidgetName name="start"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<DateAttr/>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=""]]></Attributes>
</O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="80" y="0" width="97" height="21"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="start"/>
<Widget widgetName="formSubmit0"/>
<Widget widgetName="end"/>
</MobileWidgetList>
<Display display="true"/>
<DelayDisplayContent delay="true"/>
<UseParamsTemplate use="true"/>
<Position position="0"/>
<Design_Width design_width="960"/>
<NameTagModified/>
<WidgetNameTagMap/>
</North>
<Center class="com.fr.form.ui.container.WFitLayout">
<WidgetName name="body"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="5" left="5" bottom="5" right="5"/>
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
<LCAttr vgap="0" hgap="0" compInterval="5"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report3"/>
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
<WidgetName name="report3"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-6908266" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\" 按品牌\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Position pos="2"/>
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
<![CDATA[1008000,1008000,1008000,1295400,1008000,1008000,1008000,1295400,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4800600,2933700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O t="BiasTextPainter">
<IsBackSlash value="false"/>
<![CDATA[品牌|分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="1">
<O t="DSColumn">
<Attributes dsName="tab4" columnName="品牌"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="0" r="1" s="2">
<O>
<![CDATA[均价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="tab4" columnName="均价"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="2" s="2">
<O>
<![CDATA[销量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="tab4" columnName="数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="网络报表1">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$start]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$end]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="brand"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=B1]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="1000" height="600"/>
<ReportletName showPI="true">
<![CDATA[/市场部/drill_brand.cpt]]></ReportletName>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="0" r="3" s="2">
<O>
<![CDATA[均毛利(采购成本)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="tab4" columnName="均毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="4" s="5">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=b4*b3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="5" s="2">
<O>
<![CDATA[库存]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="5" s="7">
<O t="DSColumn">
<Attributes dsName="tab4库存" columnName="数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[品牌]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="0"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="6" s="5">
<O>
<![CDATA[毛利率(采购成本)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=B4 / B2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="7" s="5">
<O>
<![CDATA[毛利贡献率(采购成本)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=B5 / sum(B5[!0;!0]A)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
<FRFont name="微软雅黑" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
</StyleList>
<toolBars>
<FormToolBarManager>
<Location>
<Embed position="1"/>
</Location>
<ToolBar>
<Widget class="com.fr.form.web.button.page.First">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('ReportServerP-First')}]]></Text>
<IconName>
<![CDATA[first]]></IconName>
</Widget>
<Widget class="com.fr.form.web.button.page.Previous">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('ReportServerP-Previous')}]]></Text>
<IconName>
<![CDATA[previous]]></IconName>
</Widget>
<Widget class="com.fr.form.web.button.page.PageNavi">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
</Widget>
<Widget class="com.fr.form.web.button.page.Next">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('ReportServerP-Next')}]]></Text>
<IconName>
<![CDATA[next]]></IconName>
</Widget>
<Widget class="com.fr.form.web.button.page.Last">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('ReportServerP-Last')}]]></Text>
<IconName>
<![CDATA[last]]></IconName>
</Widget>
<Widget class="com.fr.form.web.button.ExcelO">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('FR-Engine_Export_Excel_Simple')}]]></Text>
<IconName>
<![CDATA[excel]]></IconName>
</Widget>
</ToolBar>
</FormToolBarManager>
</toolBars>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<f4>;s2`??<cd3d+_`8;XD)6WE)<Ca:LnLBWY9kMM_Lt.UiOF#Q_f,*%c$UMMcP61<#q")$
;W#JOCG31'V:q;i"ih&2HMlHuee5[U3tQn(,GM[CsI]AorM^?E:Ua3IeU1@]Aq>7pjI>Q9S#fr
&Ir3K$3EDV6h6:tGS<nadF8f)6MM:RZNHTA@k03X9rT4RTG9pconpnRlqV\e2IDGNH)gAsbo
#gI2m'j'G4nHpZ0>4Xdh9s`S^K$fdXP$U'Ee?aYKhke,#qgJkF7#FPBA>R4IY74Jgs^Q+jh9
/mBTBGYj+M3p(]A+Hl+)VoHX7&)4F=fSDVpPod,[T,J-"2<^S1,Gn.OTT(3ITf-VdO(MV">tM
!8;fI"9^sA'AZI#.mo60gqBS5Q1!8,P,%f+oet`-\j>%hKgiQ+,Y2QFkXV.lm93VVc>k,8.+
\fe3`C2N&,t;U7-b.KH\'ce:<-.K%f>u21Lgk&BNfD=Y&5Qp*&"HZ'KsE`-DLdqQenEQ@HLP
D!53NMLTL$@]At(2rE,<I$VmRfFgU`eDO)"d*]AG+:l:.b-4$pRA^>Il[D@fBEbD4RN;n(O(Z/
ZNC<_K+JNTStJ\]AS-@W/Crd2SG!@l!u:k7[AIlB=-;EJ.:#g'K0QJ^/K+PQ='T'Q*qE^gg!Q
^6"2<:.4YP9F;Jg:L3d*&>#,#'2\]AWH&QZ5@j<oTWXRBXLCC2S"?/c^IV]Am>>-g0;-$YF0/2
0%P9l/5(N+Nr'&7a%cbB4`IHJAdW>qmCN6.$#U4I7s\^AH-K<hAaF5$PnVeYE/8Cg<Y'nXrp
KfDS$u['b73M7'Vi:T;SHe,2;3eFg,:\>7U=!i')rkn4Q'rS\M6ah@'o6u$[u's/27(Mr5@"
H&$H`LB,(^baDcg$Z0HLtd&Y5<-Y;qS2?#IKT\IlPV#1;OmAMTq<4Pp:o9,'Ic2mi!IkdB&U
9*(Y!B6*$IV[O6fi8<h9@@X,g.@Ei7FB]A1LlAC!Tk@[ppkeT=V9qbTe"Y':Mr(d@:Z[7-'E=
E@!:#sOm*^k'#e("o_("ZC<_AtnTS4B']AthRILkqQP3f(#SL@<F1k\)F,AF8h/[G44mr*P'j
)a"=S1skG"h1TbS?T^S#X5Af+Z\Bqp-9HG-7WG_)Lp*h2UNTluqJ-(PlNaMmWIeX98FXf/56
-B''pfLtnUdRWXRQt!*P"Z>MZF?iemnD3*P_K[Y2$fC8&U1H,lqL:4u^Qm&HW/i)[SkH3tp,
rQ'!]AEPj5k=ANsP.fROAfMi99'SRfuO2\j=QMG^ukHs8^\Yn>jjo4=G5[.;#7.-&L3^K@buM
1fgk+l)cSnV?<+q!S014a48_>V#MHGVXB9K#H/YK26JC#A2g'r*F`"55\PWFc[!ABk6pkRpB
:V!F+aHRrT]A4*^:XEM7U"qjOP-+I<VppeLf+8]A"1ML8L@..C&$CmK-sLA"[\od>a(nUE!g-R
+fFr8%KjjIL-*c3#:q`+!JWE?M4t4j).)`ldrd9oG,8B)f$ufJ,tFM[]A7)p:qtjo'I@::8?P
ZDsM@es=!Z4-(&:YO[D&@4d=:`r&;@!]A8Ok,CfXi*'fQ$U>gJBorDe-#.ndhMpa/K>VRF;g8
gLdc?ScN1nYo)L`ZmZpn+OYCl)$%XJ-%G!"4ik3'Z:]A+GgSmuEBN/H"A]A0bai2IZkHNR9`T0
,pM0oP\Hj"pq12cq2cO?iaao?-!8-dUkZgEG@8u2W`Gf?,uODCkk+ILW]A>Bhl!JQ6IkW3<?n
ZeI3lSFFV<%/@rgRES]A6NP!-tA0V,)/I5oG^S^BNnn1nbgJd"`[9aHHoYa;q*l"T'$';Bare
GJn&Xp;Be.G*S:*#$Ya\VEVC6*Nr5W1nibiX<)+DpW'482m]AglH:\'`D%sPF"A$88JYF4eSY
1m9NJ?n!O@[h7!q"R3IABl<.+oDp7ZI"ZLG<2AZiPEk-G48q7d8Ir^bo<I<<;8j\,7j]A$4js
/eGU+?5g[jmQIA1jE)u#&"1,cT.d$k:.J'!:$jjR^T^u1&TYk't"m5:iVN5.376.MrSN6D8L
6Ak0MEqZlc@I7T$EF3C0k]A,&/c+l^7Q_5nKm/1km^!,kQ=%Q_s7HM_o<luM,idI?3N*ai;?@
`2ELO6GYb$<DbmD&@g14k,i+E'?'dVtu^LQT>:#g(d:Kgk=Q-IWck.At0L6"50.BY@>2i1eK
ddR_"<K9ea-eqoI(jE'Dc1!G9D6C*CZ7139&M^iO,bf]AZ=VSmDT\&l?]At#N3IS\>JPWG[X,C
Rb1dp(I`.9Cp$=<n%lnD4PjH*=h)mU*tP&_1S&Pk30iY`Usfj)k"8Y'>5t*!>h,nX.;S<`VK
GipEnsTYHRdaa[l!<i>7Z7#k:$-@i=^AB0O4S3E!\H1=ue)^(!R-g:/PEhJGI`sd5F2RUVMX
anm!+BkMN]Aa?s0Kup!Ca%"7m#2ao&d3V\XoXrgim.fN9m<i2Z*!FN1o$qI,f"c"n!Xd9lWO&
he]A"_co%p_f@9Qu)3c-*c9?Ah/g=3rAfWaqn3OAcm9[Y2JV%c#@M_G&qGc54\L*$dWm,4HeV
6-c(!o(>BB.^JBU&ZCX2PkN[b;l5fMqS'C,QqaO5Q25A!-a/Ahn*k<>%#@EQ->tn7#W]A+q^E
P94B5m0'&0*:XM22M5Gl:\=OWL(oM.\(+e($Pq5s.#YB3jm4<k?o*Kq=UNX><RsnOpU9/RI=
i;S-[C@$ss2&+i4YBf\+l\6Pd@iZY5?9]Ab$9<k^+(e&&;=ej3m3L-V_s'G%$6nIt^'?hl3Ah
<qOi))*ObYiYYkR:@!(dGlJB)(XX/!A)dqlcm9!>hr\k'6,fL##(ZklIM+0.s`/I0&s/7e$Z
[?=>R;g3>%L1&Hj?_<Wc(`dT2TM)rPVDi2SjJ[_qcUdu.sPC"%m;#mA4D`)NSV<T#QFRUVp-
FFuCRK3M'iG9R%->fZX^FjA+8^G6+L392$Fdn</3n.UlC?JWNXWe-SXgCDP'%XUd_4:%Q:TY
Vs36N[UXZ0)Dc$[TWql85/hk%jaKI>AZ'?>);$%D"lTFI]AK$-93@lU)Nks3%%ceb")#e(>%a
kYAUP5/3p6<*$4Q@,nI\/`6`@SGJrZOZ7*Ce<so.%]App[No<WWA>9ehm9jB'$bImLMJBW8Pd
lbH^$2X)kh8?2egIpEBHQ-NUX'*@XX/@WM\DI5i6FVrH_&O%39)@--RXDSV-F-Ar0SUS=W"=
gC5!t%@phb5<pN9!^hs&M?+k<qI"M/blglg/u3iou-5X[h\Ndf(^b50JLP?^^&(<rb7^1hpN
mJ:59HD^!#O:jTgHaN*u_46Q@3XE7>PR7H1+:Xe`i(W5L'@c_8&q\9X'`-C899nQ9R%k0ra;
bH+&Mp;68lk/:[5\:7F!tgq+%;Y*<O@dsD0Z2CA<CP7Pj(gV048+,,0]A.AcZe]AI#15@82t*l
HPMVW)D,5$2hPoL%p%1)SP!@Jaa#SN,&2u&(6DYeH5MVIBD!eP3m,qq1XXKQXqC7aIoL_\P'
@p*=#fXX2[KC[-q-JO7e7>L_MV,lYMm[]A,JFHPu\B-;2\Q=E#]AkQ9e`C6\%6jI<156Z'KOB7
%C4'ap><V)auiNeC'"&)DmW.XBa7qm]AMl!rj`3`l`(R,YDcNlIFMC<3%oLI&uV;_#?-n1CIK
TcO;&^pnHDU#s9#.0nVm$\ZI?2)a]AZcjUH`=C@=.+6+I:X."]A?:IP!RAas"E8FLM.,Mo*r%,
L%gKVj]ArARGPYEX/FY!doQj-K]A?d)54bPHp'mk4X^ZbA:S=g$=Ac%fZb:'W!]A&^A!+0["NXJ
jhK=g2JM^KjRj?g__eO"@W\nNi]Ab?X0n^u*\9Y>X<)hogLIVZuFP@TQn3n+nW8KJ)5h=j38L
'Oqs-N]Anr@[O_qWNG1"(9o8l>YQuo,%D1"Go>enBfr:<K@tEQ`fcQ(_k[IKrgE72/MS*R\Hn
R[=unI33SZHNOEYpTq>*->MT;aY(7PA'!"qW.de*<W6=aeZo'K]A_^lDB>J;^1La=uNaD/a.0
i.[?1V^6t6QLYJl\b65WZmWq!Gnq6pNF;6B)i;`nHCAqD-EJ5MOZ((hW5#F7s6!#?6<e]A1^a
1eqr&IsR]AgH%"bKp6fD8krP'%1Ug:MJ6*qqupqRX<r9#RLT"C"2_3rh,^,%5TJ'A2_p+@+.O
O=27CD15?*'<HV:.bA+o-p3mJ%nJ-b]AngUmbZ2)AEdae#OD?Era&"$m!(IAWm&ea`.mst\?O
J;ahWkfs8r_V?I<7a)LKN)hk#?B+`iZOsP,n_\.bb(cj6"YLjO]A4Em9f;<k+'T)kN.WKH%70
Zm6XrL&d06+_ruhB`9l]A78WQ?on->F*;af"kY(d'e=jQ$RuTO=[,KJjqKn$P)'iE)D:s.Tr&
eg%bD$IT@k'25]A_;9rbm424-i[@^.FL..NP/GJ"F35!EGVflQT,<d1oCdEC.h=[E0.Dbse9i
Skp1:DPUd\3Qq6*JD9eL8Vf`@V\R>Slg<$q0%SIW8L;drkLhSaVei;bBJ<U#g1t:n[=3U%?[
"1k([E-DJ>C)V!BE*9@g3an98m\QGJK5;o[U[t?r)bK3e34Gh3<\L#nUHlF2XrC4G:a5S>1;
GYjWY+JPV#f.+6=*N57"N\m#n-$?K7fA<7eR%dVEP`Z"4/a,;0Rta,2K*o9^-KP`gI[i=A9'
UnYlPV@XT+/Hl&nn\/QXJcqhb*&Imk#NI@CQCqJfRa,r)WtU51OgZaS-(coo(od^Z*H!2,^'
rtQ_ObZm!N_2!S;kM'7/n@Lj%l1,iK4e&^^Qq+\D\*]An;(iK;=.iunP*:?.Klb#dSj@U&E7X
U[WG]AM2K:(9pJFH>6j2486Xo:ZD9MkK`6^*Hq)m?m@;G^pdnDoL&U"mV-E4u*kjkq%]A22d49
?*Tco]AcUZ"B$TtR%&9$s`qhga\cGb#172_(NNQ.$%oX`(cDoUN)>,%;c3_`c^IhjsT;`#b,1
EXN3'u0oecfI"6FB*-S8"J\JM*/UJ]A6f6c&Z34MR3>6Oj"!ZVc7jnV;b`/ma*/F.-2ZN)g$<
`.W6aK3_OFh4ZOq:+\me<0Hj`etCR63`4XJE`AL`Tn(thR%<_.<5esQE?W[+=.R*0;_%,Ksb
jDCfs]Ak:SI*Dm\'dcHkOljH3L?7P&8(8^]AbdXkk<7EA$9DGJjI%nMMB/)jK3<MbTF$BfV3;%
L"S"7'eND3s9nL">n"\dC4G70+Y:O8"LqnY=T:hWf%1J9fQR]AI]AV;#.j*hf@m+%#H`OS,;%#
4fh3G07<<2[$lA*l$mTRe)7PiiP_/e.Hq#-MVfsVW=#>"Aph?Y]A$O??[4Fa*V)PPQDUJ[A'<
i6GOZZ(RY"uINHcs.3X.+mi:DL4\IVU"s[96'(a4a8-uCP0*:;Ui/mMNnORN\d#".?^M>8(H
uucD:pMnp&o,9Wi+&&Pd[hX>s@aP:l6-iot,uU%OmJr.B+bh@e7rSs[]AWK]A;8roX-AZ2PS[c
m\7&n&!1d8M*qJ.h;)JXSc=fhVmEQ5QO>YI@CQUZ7EJP4""@6W_kt3n."_Pm05Xq!Wgqt9>d
`[,HfBTjUZ8A4USY/:-*cq$<(0A!-H_=N;X*a-_Tf=F5&N^%#ZD6UZ1$L-CatFi;WNOoBEZR
BO$:.7@TBKdUIKhf>(,J+[kBrE!b<B9c960[a`R;=E=\t=fto#'aeD"3KHRCD:nPj!7p1Fi/
/g^XS8]A^U3bW2&oO!'p$R:R7\94"n%NiZOKR#%no&8iBXq74h0u?c+%5%l5FCf0SiT:dgS"W
>l:UjPq20=GL=F^=(LAX!k^>]A>)4#4X0>A6tYH\,SVU9]Ac;]An\I:oTguS$IiM3&=Zpd;T9Y.
)#4G[]AX!,`frGc5]A\.Ei>o0\cnBau.*5G,<'c7HRF'0l&'#gTbZP1Kg/\K/r@RM1o$bff8KW
uT0^RQM'AU5"=AJT3@HjX\M?YN,(Pk.BhYdRA:?kZ=\3rNnpJC?h83/'fSIrU?7&M)`o:7U"
VN1ST?[10?6aFE.:27\[!.*+dZEe:DgBdla6IQQ'J/HX.ncO&7,Rl8&cq?)66q(c6"b[js?M
m@qU-10+Uqq6e<H.c-\4KIM7Wrj]A(X1]AM!$@Ao#>bO!$kX+_a2ac"gGsu,;$Yeq[F=Hh[0Vb
N4k5.id<oDAC@[GEn6fmpubN<)SN`NVN%Nj7i0Uo#.h=KdhTWN*>*cZ&5.GgLi$FTbI4/"Z+
Olpdnaa>3,NOFJq!L@*bcHD6&!V&pZlBGnE"n4]A2I\RQuX@j6piXi6s87(#b2Ep8j7fi)PkO
n-NFqdkWmi=#g79tcZ&J'QuB6<jK0&p<Yp'1g^ji6<Vf&3?ao3m+/SXm8.bIT=&J(B]Ad6<Ym
+npFE^;<JQn>:q:K.YK;i.bQi)WU,[oBdU@jq,G@O@[qnO0)G$'mJS9]AcomGr&\84L!j>qGV
G`FTW=%\+GF(?1@:kNHf^1k_gEr5A[1D(`T25cgCsu)pGMV++%e^JL3khs<2sH,2*`:umA*K
oF0HGhhY->eY**)KA-Y,oLr[&`l"'U=F?Y1P8Cnpc;CamJ&FjD+:`,!Qr-]A^$74oJ>)GqRkX
eGEN74WXF<!i/GpfNcW;e\211U[<R49)8j0f\q&Ti<pu->SG:a0#RUm%Xl^lp+Xesn:gti@Y
u?fmGt=,A^,EG!o#-Rh8+N79jr#mTcb;:>t&iBC2,mr\=\+<J;ap/YF]AqcXs[&9qcL\NV/K!
*3nCS,'$A*>-/@YKUT_UY$Nci1ZMG='4FM`gM)FedS*05H7R8F6E;kSA?E5I6Mom*K;F]AR=Y
$*H*MJ-0)3Hi`jASOHg,=!#tS^7+&[gP-<!M>G/]A[niK]A**.BF?)PME.&+[BG[WF7diubA9[
T%"]A@e"o[OFO,%(9,2H*&\jG-nVeUCmBlO2`gmo2QC($N[-4j%!o4\Ec(i8aTT"n"Pd]AOP,J
WN4u37(fe$c,+&8LSPL<Q7$9H/:-(,ii.:QG^4T4d+2*(Pe[!#SORss*:To.P6DQ/AhrW0`-
tHlm_:O50!oWhD5@He]A9^'j,Q!i)YPX*F*/WX6`!D?W#-YfEn^25T-5GV.F:8<Nh@!l"\B-p
%S<ZZHSFtUia*40Y:+tEU(<9dX>tHiL(>!9%Og@rcK17W8Q-,mQRKtiC0pr\YqKPkM@omEg)
Dds5ggURhp;Q-p>c<LYnC"+oei3W2M;'tH`U%;JS]Al3Y_tA.MSSN0)ZRNQ?_,f%kOhL)-?ms
=H_%t`.4#+RNE9P#cJuVnkFh.26Rpe'5Jj2.tlg0PsV]A+I\Qa+.1!?),>r<[5ef&X8t79Z4q
K:+5a50&$#I,3s,gCGNY,+egp=?!aJF_Rd+<tj3&K<ZN*-66+4,=f=DW7:o8F^1j62"sSa<d
/MQ3SBXV^qFAm__1nKWp/d\K_VcsDX:nZ#6G([_.@eMciR0.,HDrI:PhYVYFWG!hf_MnjmFp
p1pX`(Nu>9X6-A#r19/t%EHid/Wn`W+PR5l+lr-I>p%e-DQT^-J<n7QmXucH,Y2>ZuB/]A4(g
.Kc)A48'*$0c)5_E@H'9C'CMe=;oHm>IU>+X0P>kdp_U&=!0.n[+P*o5,(E-KB@d-9?FC1+G
7]AK@b)13Qu[k>iPo<%96SgVI#l@jVmV<(9o`;)1t_`H41NO$HRc=+JW?0W5)1.9Aa3+#oKE=
0@&!8_eVd:V^n17g3b?ZN:\P\F>"e>F>]AYGi9<(Yo6j-#;.3g]A7\;6I4<Bdpb>#'-/>Gg)<h
2[E*:S1T*nRV*bC)4T8?(uL[5#h1\ISb'bV32jg)Tp%"_MVpQ7LOcUts-cf74`",,/D)<Yr#
`,QoRW<Bht!KK)'O5oY*"D-?5SZpH#=)erJd%,l%(Vi@+1e>K,&GMqhCT?4%'+hlX,:RGsKe
#4e\e_hm-^[tYW@]A>]Ak$'[ggOUrb`K^'o%&Kl'T?ffp%[?KRMR8EeLW-GNV?hGnp0=NJ^k8(
btBS&4!)5l`3oWp@]AFLAf^5eY`[^iYqm+/mn>`LB>&LYGjlG,2$06um"a[lK]A3GDRKMo`3&0
$Z_N?$JsZ%<M#k[mbiD]A\u]A7d@UDtX^C6lT[pOKZcEV'@`6nJL99*h1J/g/lil^F9Y;!q#_?
_?;KPJH%Iac_3.:`0C=d/eGM+c%JmaUL8M!m<.+:o[kf>"BN5ZdEXE[dKV7W%8.W;*'!a7'[
-:5__ZH)HC^)3oYCf?sUd6A\qK"\![(4#eJ%jg2mWl-^jEmX*q/,NQ5RSOai#EKHrR5.n$eh
;)%D9b*(;b101$BoZtmL%-fa,jA9$NEk4+.7bm3EMWNDI,(X3oKcLURNJ,a#rYX,)TrHb1Ul
&X/WL&)(0i.0l66i7a87<pD;2A_+\U#'>(/hin.?>;!ps`m3GgNdS4s3_C*P<ZlXJZ,'R[,t
p;*Tje'FXpbW'dh6$32!d^WpjSiC4BOf-8i.&rMNbP8\qm%fje^lWcqb=7:0+G]ABNGL_-+c+
9c*#ueC:*LM3?M'f-a;kgT3V.OkXNN*^S8u]AF=>\@Rk:[hP=M>.\0nX\,)p6s_)cgU=EH5p_
=kk//f%jQHL]AZ+t'SS`YK!Rs*ibt!n?X@fiPRj0;/ntFbCX1J7Y3>!@W.&dU#Y2=l<h%P0H&
,k#c'j0:/;OV(,X=16JE[lI'?.)b,a$BqlO8)3c\EUlGMT+n9L^5JM]As3aMPR^,ncKFt3]A,T
O7R5_P?-6^C/G/$NU]AUqhc$iTmqc/Da;+5`PjFdlHA\8\X4=k47&]A%UhJ!B[h4IOA@aH`_Ol
kcr*L]ArKe+4(sWGjUSbK]A7e7n!7mFFY5X&bXo"r5FsW]AU5M-Qo^4TR3oL)%$TVB3m4]ALUmTa
Rid*j(IPf@C>U_9*Z`\aY=6]AdD310gUd>O,KA=]A/!*$0NMZ4TSRcBd!dj^b`JQ'N3#)>65@c
=_GV/'(RgX1J1D4kY;Mf!XZgc&eBN3.lJnYVNPZh%j+L,\9'_D\`N'(^8\gp*D1$Jib%q*hf
'%k0%pXl.)jBYM#8i*s27?"f"J,A!)Ped9I,F4,Y5pX@Bp1%W$DNu[C060VO'(Rmk5\kb!i+
:`#@>IqL4D(6Ab9uu^NkC1n;tKoBPaCnV/n*qrO8W'!;H1'fn*#oFm;c6n:$EV"Jq]At.:'ZH
gQ"[XA#_aB*dh\sQVTC@(H:9F"jFE:UeP3Q+>R/.Hc1A/<lpfmhqHQSac_"9,Nal`s7AM.RD
"#XDpH5,P]A)IrSGESrBEgsoRlX&P\?n"tB_mM(_Y3cOl;%/tKhX!24n4K=#;FS7F>[_0,Q2)
o2TG`Ii*1:)j3eNdPI8ru\_[Q2M5t6L4r1#-N%F.9&3WVLW^=]Ae:SOJh4)/tZb&edrTj<'1i
&:>M"]A"=2U@``]AX#W/o=0+"8VSgg,=GAjVfjG'(il&+W[e&+Y]A`IcT7^a,sV6bTr''P$Ljsu
p%1mNc/V?/a4,n%[-W>35SX2<-RI(uYCP:Shq(2aI_Oi;*\fLAB0J(jUt,;`Q`&u\qS.0fAX
reZS(;j$(S^oC'9(=#q0j<eYMln2#sEas4A*Q?RP/;c>0A-oa5P/O[\%s>JTfH-rq_D3]Ae+Y
(9J.,PTDaVSO<cI"+nIJ['/=X":I<tZ]A"=;g;s(Sf!A%#mE]AQ]AC#=+-8]A=SFFb.mlHZRcsE%
ST0$gDNlp@T%7Vcjh>[5S55<'QEotq7AHa<ReVg+P>gR:K_mRT-#21@XPX@DF3-CS=@%tjo`
9C$H"FAVTC6,?;GdJYkP_khPT09\aj7<#e\apJm+,jbe)MK\\)Fk0;&!V\X`JaumVfW;+d:\
l2"gGk^M/2]A]Aa]Ap?s@lm6f7;,Sk8U03eqqdV^9%>`$JU:^Fbsl+8^u(28oK?3lU;W.T$C;cB
#IoXW]A[*<WAETXFmI=@;!PGR_6H37*n>"?WFBAio/]A^=E:C;Q7^nIu%HnpIf_Gs7t82M-?/6
lP:_+3&+g/Vg488%i?,M6snj$sS0RO5H6&Y7=-j*DL:TWfJ5AZF'MU=W%[QhCH<U:gO%A=0"
aSaZ/`+pVfIlC`JD`HR=l>u^6A@b:MgBG1?jK_j.X[n#9L2A^Dpn3;%@1/`eHWRm%4o:0b(X
#$HpcVFn4A3221)e74Ee$RLPrdD0lWgblUZP6p-]A"^M&rK\4OIq*`m7>:q!DICfW)05E1154
.@KR9MhGu<%.7aJI>phVnLn[.9p2D=J%%M]AfdC@NSN-_B0u<^5?7,GkFeT0KZk-OC2UF'l=-
5=@P4b+&8bC/1:(Y;Lg<'\hM_iB?6iGK>gk,%f:l=,ohR&kMb"Id<%CQH.Bu+1H3)P)F[j+&
uT0ot\3On&!fZq)94YMsR+RVAmc8s-uqXQIrf`;,;X0.L@IeK?p]Aegq:H]A;`\>G'k"N\D6AU
M\+n-4IJ2N\cJ/67:"9)K[n_+_gkP#S:ViJs8]AK,`0V/O%;jI5fMnE5_cADCjHjm7IIH!.g?
!tZ0kX#S>piBf]AN10]Anh;RAR[jT!5]Al-3@I>,Sp9D$;H7HsI)',4Lr`(=f[XHe#o,/#H]AjRd
?>a;^LZE8M>Li]A2BUD*^V+*QJjEre=a#MUd0f-eMr#Xu5N<4WeAUF`UHMB44<\<oD\TdA\#T
/kSH!:6@HN6m<ho9rM-=>9:DGd[@>&8r=@)UJm'&V`8t7ok'7<r-gVdpB;KkaK$#//BO05Ou
BiY&io_iYGM^A@!-hu;s)E#:id7NeJ:PP2`ga;VD+g-NueK^Y2<ZLA0"j]AOaP0+pMS5j0NuO
Hg@5$<Fuj0ZEE1(2!CrVePPLMOG(agU*%E1`FYaZ<H+*`m9m\ru*5"ec;8p@'^K(-l..Vt<.
Y^(:>T\0?0)=T>h5@+Q\'3Zg;\/[*X`$Eg_0m\%-fa5XLsFbIOg^cUZLCgM?1XZ^--Q%-:1;
TRs2?J&M_+2\Tqt8.36'cEPZI3)d`SNR-$YJ`\]AI\J&N(?ZM_41l[;<\D]AE:lG@-qKUn'V_;
L_SHV'*L6)6a4F^fLU'eE[41T1DB.JqEuDF@$KD5aW<":)JQeI`9a4V;$U2*^%BW]A7J@0Lmd
VS6;lXM@O]AA,<iCE3.ZCh?m$JeEWAiU?F&AA!>hn_VQ-;5n`bu3YZ0@8o(b7a/l!QO'3DQ9j
*ccCe<MKc2c`m;iPBo7CN%@m#\N+0/<>V+3H3(.^@-be<:5(]A-Y;iC)*RO.p$ooDWOX\\B/%
,YrcN,fpK:E$8Wl]A\5&1$F4+6UeYpjH%53Zk$Fl7!'Lh^*aa<4M#((\L_D6VLpii9]AJF7(V#
M2-<Bka^^%)ugV)4Z3eXDRYh^:hCWi.Wbh9It79O6-D?NFe_atAsic6L[N1c<WiuG,"K<kf0
@>s'FbdSX_9AZqQB6"-F?*KMu"Y2Q6fQ3#\'l0jTOEt3C%c-#7iNXt>S2.jkAmoinn&pA:o@
J,rj@n@*.D2.k"`]AL@dg*@/4^9=Z]AtE7bMpkDpLcEb%E^;lq5A\c\T+W]A?6KfGH3?(rtlJn"
V#d7]A`cp]ACnN,YP0`ao0Pn!^CPCfs^#Gqf0]AJ*CGE^O*d1UmIe>XjcruFrZltG0D,CVsoS(Z
VoY*UefHdXA01j`b2(4\LR_=8,DkN3!?@gVpjoDn<k^?[2NkX5='<@QlqEg(^Kot%K3dS[qt
rZ5tP-f9^`@edh8V'gs%fjq:W:[9R!k=H4:2;.:4ciU6VFY'aU<d_WjZU%6lRRA]A]A2h.'bpL
]A&e`6Y=cJHdiBsRqEm3oD+Uoc1doAjSQ@'JE,K'tD]AA.I)Og\$_nf?__0]Ar'`IFFKgVI'kc4
M-,iQFAM09f&.lt+Iq,RKTj['`pRc_\O,5qblq1AsSg-?cgFM64'1S>2]A>9e-JUd(/UROX!'
BD?]AC[2g)MaqVHCn%jjm!,E_p_QqsgPeA0Lg>_tpmgtt8!/>Jr3`RmprgHppKn[NXQ2*#si7
^<6!`kkDKifQQ&57u:`j&7s@on5bJH(R;-&`eh,G<X!LCF;BiP4'O^r-('W4_&=f9TidG!Tt
]AQh%cl_86Y7o5Bu"JF-d-_^LEVXb:62m!RB*8;L!MniiG;-AXejbc(T3gkI,JYLT*u=rNH:T
pe8bJd7$U6f,&qdP7Pld4<V;/6<-CunTm\PY#L2=eML'H4q+oB2Y,%bo@o[g=!"%,C9W_F('
D)[=`,;j#]A'nb6e*d9R#nr8`I#r)KE_.2QJ@pR-kkHQ0/0KQK-b;i403u]AkN@VFTGoj#IKUb
*9,f?@4;il_^[pAk8Qdf.?/ctXM51K8D0[V3#q*gA(")3&\mcrd_\nO#URlTnM4(@+'aJS+#
-;3(`!r9-\>Ee(d&:q(:0hC\6d68^]A"+YtS\c7mk$3,JjDK>m5YaET_In5:L+Ok<q3tHXYd9
$1Qh8tnc\Ub/1GZT5hUu^q,p&t^O4/fQqo-)V"N\Ya:V)0?mZG!;STbuU.'uNf!<"4t"C>CZ
U*k=t(&pkP>22Md]AYt*I%+\qoet#7?&aV^9>0^C=7(C'1Wk]AZis1SLfgI4&0\]Ao_>Z"DTbVE
ue9?'K.=a5@O&Q8f#L)44V6#P6qda3JOkQu+Pce;DPJheCj[H:t=kFN17u'5r_Q6TIa3;5^P
gaF<(u9Q[+a(H*`V7[ZG%a@8<bG1#F+\28*FmE.>e>$lFQa2cchZ6)jhFqQA@%f1G08j'4:h
DL(nV;!&73?LOKLMBVYk4O`So&.^1aHcIu2!EkqfPWWG16gmqPdMPDF(\8b\gaWhQ"08AUK/
).^POQp:0eW!O@k3c0>f4G,@Dl4eC`>Q$A4)<8_)tYJtGVrot-?lIJdcfTrA&tGm*T@jogR)
P77mGj9BkEF6#)+/g:4Ug.a$g<VS2$[^nXEJ`s[?h$P@C:HI(K+Dp/[W/:Cp(e3GmL^7W04)
]AhJW6hSU0=hG`C8?;/II;i^RaBmYb+4e&6DiQR18+iVipf"MMp0PB2)'@Nd=Bs`8S%GGDZf.
VOeHRi;"NS>Al:%,.dLG9r.Bq$PFL@&hKE6%$XI$iM5cd[%</lK_iAP\J]A%KepoX-e799A3f
RL6qY!T?RZh(=dZN>i[!c(6F<8GSudcn,reqIbI6fsH]A)e@I++66QaLQW3siqH;#fiI!$68-
fTRf2@j5*6ZcLuZ$=X:*%:Z,6PhS1in;:62bi>lleclq*^9kPT1fgthUD]AmekDK]AI_!XBI\+
f0uB!GZ%)$=iJ'nYtFTDJX3j9%BYkgB@OWSCrDbP0*5c#gVH&J2-).npOHEnJ!4HKq3C)C:I
[*XNNP<V\&;GN8!Us<T2W4#Cn^]ACYkL"e'Kj5[^TM?Ub+dFU$a"VA`ND8jTT=<Ga0?Am*rZc
ormqXo3"(5,@-c8q<8Yik]A3Y-W%-VC(q$7tKLDtXs7\+P#cJec-,aZ%c#K_/lA(AtSb$]A7uX
X)*AW)Sn'T5RnSPe*D?*lW=<ZN]A[V4"3efoGd8Cj*d;q*NA`1Zs3PH-9Zd8@:WlHb=Z\"MpU
#j*`.2PJ)V6t\KOc$g,6aTk.(h#H$Tpn1F@@*e(e8^"qn:LFmrBKkQMaVr+I=_!m[$P5jl;>
ZoD]Au#O5l"W<GFc4tsQIk]Anp:#@1@!(Dj';qr9D#>_5*615iH-i=a"F!Vk"CS'/Ko?S\F7Nc
pB;Yr9"\$5OVB5_VBc@BAWOD1`?lDSa/;kbbYE$<L,"\c=at\1EIRMW_oPI)8Hd;0k5gL*64
joG/<jN1X`<=7;Mn@lfCi=VLhXW`U#I@e94IWc,`k?PDAeatAu7*L!*`41>P21Y.3fZJ/h)>
_N!F&8^RX'6<slCV"XMF\<ER4qKb+R(HQP+eRHt3#=>:f92Tp@urVe+06jI2#T`)&K0-"r$_
2k:V>D`p7cW8XL*8ad!&b+n+@nA1%?Zn>T;XG?@+G/YO,h*:r:dbOShY6)`9c+d-@q!Z5$)b
UA_&"@g/Q44_jMSc2A^Wc.JMrBf>iPJ[2M'F3MiKL/RNt'>LkV\@Ne$#(0nQg4&l7'2B&20s
ROV'htV(-ad:-Z$H^&/eYW,2h*2^7^`2he+K3-/o!N08D;<P_P7ejVcZLLes,CFegu[r@_=r
oO;X6+cXpBd:LKq4V<Pg/eP0#`l]AY4]ARDZpE>^/7uQ=;p9)8_fDf[L944GStH'sKeZcmscGR
ESdld'%.Z3Le%#T>rI7p=iDWP.2!_GO=ja2u`<k+XUIM'<LO'`cld3)RmXS@-W/g5VMH2'/5
A(q=@?*JeYk0?WZu'AOlP`eCD1NqrYnqGSC=[.-#h6mC6p(m(%VT]A=TF-cJ)Z29#%]AY/75ts
Jr.4W1/a7W`3Vji*$@mo;L%T2!-)m$l%+=1;og,T>GaoeTgXPn\T#Oma<2R,%'Sa$Ph"@Zh/
#=FTSf@p='b3n46t-]A,EDFjo'qDPs*tlU@2DY%cp#i=o!tqoRUf,<!Y@QT=p'd3bE558+VO2
<'\a:W0A.E;Zs;$4Ws6:e\enV'ZZ=)K9lYhe32ikO\WC%(j="0_kAu$#0$OrbWju$N"58\D8
U\4kf+F3Rk!QQ5KPgJp3X?5,BsB(L>Ssptmb0jEbZ^uX81)R6@(PabShsZ,rLN6.gf$?45QI
(&W.UpLdh@O8C-,3i``u?-d!WUs4ukL8*V1>%M15\C4eB!4IpDuS)JopV,Xt5mNjmP8O<PjB
T1]Ap=PcmOZkam*a&Cs,7S'UiA`Y'C(4=Q@E^:0_'Cb<rs%1<qiafJ'.dgpH;3o)DPdh_5)>/
c[AIt!</nF\d(T6TcGcO*'>3]AO]ATCt?MP/4e`nY$n'pjAm/008beoCHSKPQ%_,("tV96?=fJ
)!''EJM'c16]AiH@L`2hI>jHJb^_@\`rS%JZ#-]A>m6pn#T7s/:_5F^gqUE&DQRYZQG:_!^W^`
u#@[l*R"pg^7cCRb23MH"P6n$ZU7h1AQ7.iS8E-%H1kLl,UsPDAUtih$#lW05Y#W.%9'mX$?
LnIpZl<-l`Z:J73e5^sQdj)97X$A[*jNNEnsSNga"aPV=)]Ae4D(B>^=dpe(;OjO7>Z?EqFM[
_khjhY<a9Y\-d$0)<'&)X_-Hrd)>.E+.F\BI<gg8fA<"bPU,Ld)-&E.ll-*J!O(qZFE#E,?h
-c=/"j?O$<#4^ET(2K0/S1bVi)De>17;8W=)JPMaT&6Ake7c23if-5Ad8%E$6CMhY8Y)U%9V
E8_>2]Al4eQpl^uG94-/&5F0u,=TF#joLGg/QfR]A-q]Aqf3.h4U7.T[kO#ZF2IXc(2OamM[5m>
'+hoeP3inYUAUk0ak=7\,M,CPT6,/h`8)]A5s!aZ]AB.Z@@6Z>hc)^*NhO1F:pJ"GDd*Xe=W++
A556"9BT"OA6)*diYq-Ot[CNDglHdA*e1ZM!OD7V.-7kM%tZRL5B&YVkl3po"VFT(WAP;dZt
9D+Qe[[XVnp&#34c0brb6lqb(G+8aOQj<HR.DNSZd?KL?/iqhsI'UuW:1hK<"I_2F=P1RE\\
[(,d)!lJJ(qa:nfR38,NZQkLdn,pT(h>RS3atC[cUK(.hfZ#B@BCGF,\Ji>E(AJmJETIeg&H
/k<;=un`@M)gg4=F^(iL`bM[`)!cG`b]A><Q[ZNb$C')_EF/'W?Oo7/PQD[QGqSb"r0n>u_2!
Tr(^J\!\%CW.VH@CJAp,(KCFmI6`35Ho/)0:N860&3Z]AYl=nO1`pWF!m[JeL@[@PX3=J.kC[
=]A5'Xi4)sOA@(@HLpV"+DP5CD_1',l;>m'I'5Z\bD`R=4"/F&r;K>lHrZr/7"NdUPtY9A+g8
QCEjnIqrG#R`+Z:qJO\,F'b81ot\ns#llYnjud\c#9!9mem(8t?KLN3a3'W%&gGg,nWheG46
Z`@Is^:JcV.*fYK]A@0c)0Z,TYb8c^p3%9\kV=)%e!&(IDajQs,&:B9(ldDV/c6&EW9AqNsS!
J/cT`SU=j5*1@".Y4OO;/K!&\IP*M"k7VgsMKa&<]Ao1W2=gj);*DELZ)bK3cYk*3tnbl5k6@
'")JAG]A%:(2adJL=QDi+Q)h<ADFQ$B-'&2-\_PX-r`HH'/"b8<1Xl4[[e\[!uIBEAY%Uih:J
N8KGBT@DU^7VQiiV*#r?d,X$'FraD@Q4;WVY>5:J[i9(uH%'+R'<HL9338cMP,]A'Nc(J=f"c
&GXk;OoJ2Z`EaEsrGPLlB&aC@UFt<5_Ag;#^1e'uc\?KqpTP7cm4ZDH)pPBt;%pk)/>T#!5Y
m.&R-oS`YUCM3Z`.&9DR8[D;5dS\`N0cLPZLGhrVf4J^BgAdM!rjY2W;R^.!/+_KF'#nqjc+
g:kG;'&I4]Ad=^Q.5Y3TH>EFV<Gg#$?6(Ntr2?Jl<khknk7P<70$SM@\PRI3<cMi-=Kr8oWcD
g1\7T9L3h9$H&UKE&^I*^nj4q%(j,s0qV2!QhkC]Aq8?>[!e:$J)g4UKtu9;)[3C\bDn/Wo$H
]A^[O\8BoO!#l4LUeAhEDUU?%_UJKHnqX<IG(h71KRF^:Wrg7ELef_Opgr!T-Ag7K.CMq/Q=S
N4^m64[hu7`;>o"r.eY9=/jPg>t!%;<0ZG/X1NLW7t*2.5OLTc)H*p@We==FrQ5[-iI0DoSQ
aku&@PYH%l,k>1amUf`+g:ncgM*lCEifQT4WR8IXjb>HF^Kr.d48(Q-+G\(='+2H/t&$S)O@
m")Xf4(8VPpD#1p$l3X$VZAoUTp!5Poi1?quK[e+Hk]AUV3,MUR$5Q%G$Sf7S1B0:rg4SVDal
f/BG7i;_+3'rDBkui6[c,;XUl`+sN&s`%'^+Wqf<F.8lZCG01?PaV#2Qhm;o)(T%1jlYZKDB
Jb6Y5I=]Ac)J^mI1(!/;@g_;(?AVJB#og,smT#Pk6?QrgTT.gr-&m&epH5[_%o/)E=%B87rdL
VWgh(22.XQS%30hLA*8Uc.YBkD]AR)b!'gI/A%`1@jLTR[8k]Ab-RT,j1:?P:SiY9L6$rtpD'+
LO>PkA[=#%4e0N:S,Nj)<'_Au9aCc)Y;fmBjmb1oc31`TY)>.NCEa)Du,9agFkrjNfW;cg`G
m:T9`rSuDToLo,D_-dk^`a-6t(#gX[j6_>I9a<^h]A[8(HhqHW>s)Ws>1mrpO1GY/fKf4QK&l
OK?&P>CSP'OM0FPM\uL1C);0Ce?Ga@AZ-qWHkADE6U7oXJ?)XZ,=uI%9!G^bZ>du7Y3D%U(J
BPQ"f0DVT4E7%_#W\F#,UQ"WKu,r&4f:DfR6a=XT!!A)O?[5G<#gUT8c(jM)3l^WBSfcpq+/
nInFRaeiR:_\0B,V'>HVj53huLEm0d\)sN^FG#'#EE>m@L(L-2Pab-]A%RZOqT!+.#o?i-HRa
qoafb@Ti`E^J(8Y8U`rIHH=9TB`8PsYGrE/KAHccikel'CoGcM0mVA;ZGQii?P2)hk;%V@+C
W2`#_C7;L2(DK)AGE@<VC'6uiqQ/3VB1-RB\[WM[90Nl9"fu-N@b[W_+9$G(HgM]A-,^EE(&?
3E2Lr"FOo0Drh3B_00_A[U)d('=jRs6lG$gP>t#Qb4Hof-\!G8b5ckFFM:Xh+Ygg_0+UCVGg
kSfLh8mR:^.dl$N+m_uc-]A/W_2O8*D&[`[D6LJFIJGDuViRg<*hk%KECo_T^NL:`%1<?q(B9
H"N>]AaJ`d-O@c,s:1fmXGF2.rS1WeQD$A0(d+^u@\"$5Hd=\!e8`k4C^0<'mK$]A6^MV!"<_>
HNOmdDZJIC,/QAm21>,e9X;0'/lr\fA&E[s#?Q__d!!,79Ws>,1:@D41N+3HM&B;*L\NTXkD
hco%:)`gU^sJKSZGasf3Y*@TkHNanphl(LYT`8B&is%QKS7kEfdfF8bBLn?[]AP^rJTr26Pu1
K,ZQe\!:qpdBpIl6=HohYqtk\oq7lNWBaKO:Mankr%)*O:1;D]At)mV+@LIB*=Rd&K@s/$_Ml
be#WX\%K,K485TQ(kS8"u$kLmlDhfoH\1XY=r3+,-^LG8ZceNgJ6T@nD2CgUDAE^Q;`jitY[
d`n/-9E14sJ#Zg20X%$]AV#WD;-psVpA=3R$j8(X51#mMmVP4)EOLH0(%GBZ51"A)hOPhEAr7
'=FZ[g%7`D!En;f%?+OO#_Bcp-#eI=2f0qF.r#a3W[j"L]AXNs/5,i1K.)MZ#h&:qB:Q2jqqi
)#Y)*ZAO=,Q9MO-W<0!n[VFV\@XK[5dVC>E9.2;e/4ZE$sg18=kl2c%CpgL&E:^$fTZJQI0F
jc@LF!s,d=Fu1tRO@FAb\.F\1_&?QqMlHAUb6[u.dM)((t(6HY>_6Cn?KO1?qM%@1"Tf.7r,
UC7c^0h)8DA)1<`nhpK$3,NhCZXn_`JgrYp_Zrqq]AS#6~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="959" height="236"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report3"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=" 按品牌"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<border style="1" color="-6908266"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="959" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report3"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=" 按品牌"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<border style="1" color="-6908266"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report3"/>
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
<![CDATA[1008000,1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2781300,2933700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O t="BiasTextPainter">
<IsBackSlash value="false"/>
<![CDATA[品牌|分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="1">
<O t="DSColumn">
<Attributes dsName="tab4" columnName="品牌"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="0" r="1" s="2">
<O>
<![CDATA[均价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="tab4" columnName="均价"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="2" s="2">
<O>
<![CDATA[销量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="tab4" columnName="数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="3" s="2">
<O>
<![CDATA[均毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="tab4" columnName="均毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="4" s="2">
<O>
<![CDATA[库存]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="4">
<O t="DSColumn">
<Attributes dsName="tab4库存" columnName="数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[品牌]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="0"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<j1Y;qJb`8JJ:)V:K"I%R=7%QYXe&bTJ1q+P+^Lg<p`K85tg]AALN-Q6ZQXQ9>."JCG.)e"@
P\S)BhAa&>DT]A)af3";b/)V8JjdE5XNK^4':6ahlAo\[<t0qI7sQYXh\A;]At`INrXAZD4T&(
7VKm5!cNO;VhW>>5p]ALS/dJs8Oq9ghh3u<?0EruE*1H0gQm\^9sL8?mjr?b?'Bp`msJ#D]A#H
Z(HBpW_El@m;EJB"bTt`o.T;_WWi)+ii6nDeM3aq/;lh6PuEjQN_$1]AJ]AkUp!SI%mmT`q,Q;
khbqTCRm=UP_%Q<eR&H1SbS83%j=[u4&24n-KoMoKkV<G9c\Yegth7aSD'Ud0=;7:3fP86MO
Q<jc4f=#Djn5fL;AGbQV]As1(Z@i>l10nJ#*r"eGJT[qPBeqlQ0[?Q'ooLJ`q;5;Ff;T:P*#-
H3WU3'VgDI"5N&$<Ut^([g\1\'XX\b=FS<eVI$!qTGFp:Ii51_^3!G]AWlUc_iFWc,J?LB)FC
bH\+C(rk6A.3la\uPdL)E-fj$0D^2-;s7=R7097$-`2pWj4`NK^+R83gZcRb@T8\m#?_au?j
P#D/)]AK#R%;!.iFH[WA-'hBV:g):'YMjVR>@:7JN,?&$q1f!2\j^@nW-cBC#M8%HISj7kLD7
)641<C`fn=Rn.8`KiV6GlAbR=\Sr:a/<1YjHSlaPsj/he&S6&mI4eqmmp*Kq;kG'2-oQhb!6
l,Y0Dg[3orb5q:1?B(ns(G%WD92U`)+n%S]A^1#]A*fA[/iJ"^D'e]A769QP>A'#oYEI0ZFs25-
Yc_Fn)m65nJ5`%^T^:;o+5ZOpg62:+tm<&p)d8q+]AV<>'iSm-/q\a&M^i]AcR+,V]A,r<VA,^&
lE2FmA,2$<<M4(m'i*Z&$0jOV\VeX$B(C!"*ec+OTfls1dGL$RF/Q$k]A%"+=b'-#3#&P#3:j
8e?=pR!NCkLBJO7hbK$-L>ZNmp8s?qX3=p.rC2J?"m%@qb+RX2ludKq&_85XBAfaENuS!s2r
$OPs@MN;[&"A<jhe)&uQl:U&jb9*&1SMV^V.-gMZRr>Zf+Z`Fj4G&sli71quGH%uk,/IIT0I
b^LA`>ef7W5;Uo4BT?+)gL3gGT=8Je3%sm?mjlcef:`KPdS@SnoH1/>o*P"TbMjajRe.arb&
5`_J-"\S)lm-MR?TdR[K2U7Jq,)4gKm+no'ur)rBfk(XggI.hR4i]Ai%0mO%9IUqbpVsV]A)P*
rq(H5PK$013S$8n5p&'3-&?BQoi6A6$_1ZB8I:CcD.u=u:YO'!]AY[NqMD*I$0_(qEa"8E;.\
K`bF0kNq(NSC[RrSh;6NkAjc8(u&92=(Ldi?`'Pp?>T#Z6rPEX)KALS-r6VW(,DiBs1*??AO
i0i6I25UZEX<?kAV298.9<QfU?bB(0+(SNu[Gm)))%K/DWXB`>ba"nk=fY^$'![.#r(CnMD3
>PMk^_;5&,iX<Vh9e8@$kdQ7iR]At2H(0,t598L9<<GbU@rbgotd;]A,ko=A3VEV>&.Du$o4I-
9nW\*_C@m9Yjt??KcS+%:A?J\gB)-.#/D*bpC<['0#gQ`l/Q)X)_r',!S[g(6eu@ouj^;W1<
1K8D-C0!P$C'JVb5<#=:5rfedQV`"t5K5AFad!^A6iO6g0+:PM+JXR="&dTpEJS+&`q@?rj0
g?2h?0K!=N*)BUo+AYX>@mh]Ab(.YJ^eC^1\fj-uhGiVgalr>LNX?fB>C!L)/rut4\q$S@/9K
i<L-aR4,./`Te;u'"GX3!MYO*S)%F*1kTgiO*c\\b_g@6c,Dj5rrYFUTiZpiLH(H28a%B"!E
/G,V"PX4GY,Y<_IIO]A"oe0CChV0a'JHdpVq2B2jZb1"E4?`R7lTej1mG(d+J%'YOJnb!RiqI
Ju3h44(kD%S-Rf2fQOpGD]AM)4sD!lDX?!3h=O9nWs^\,jd_*aBB^LAf-u8@gY8q9Sp1VPR^$
8*=2-IY1ksK\D\gbF;?S3ZYL!+h<T"J_edN54^LWbYq<6ug2\_j6I:g.IA"ZVoQS5M]A?(ot7
@nXleRQ<!)0=f=5Kg0sjfUG77n10PdPG4T"&8Hb5+#WY1g-<K6W*MdO>bAR06;Y]A-@b"n^=0
0ICM0hp2D$:V(pZTM@3Nhl)2W.%J7_Xeomt,/S5TUdB^@BT)T?^cUj$7u<ee1!p9m()3fDE?
<I"FT$(.H0L>(`O6S6EYojm=sUe?Gbo$JbTi'\.KO%j$\L=12<)S8tL9GldUH8#i4OQ'k?O"
kkEX!n7_"j3^&d$nXt0jH&PBQ?3J?NZXU(Lo>&=_X=0GSB._$>cHmIc$EGiWN1,gin[-?Z5^
?5"54apQ7&F63h7`W69"92oa9'-39JnL5k=83+.!#,j-'M6Yq76hI8Br?mL]A_NHaA618.@S=
ngT,`YY#!nYA6@,LTN%ZaN;Z38Gpng`6kW39pc2Q.st\O[TW@d`pmU[RJC7noDWnq;gIqAP0
]AHE*J/Q_^p.d"F@t2#@&gjKnliegkBi$8Og%L.T6VOf0$XhBB)]AK]A!GOWeSo8RDX))0Kk)'Z
[/Cr!rK9sgWdeBjg4P\25S&$5fC*GnYRq72M'aOY`3r4]AiYafAnf_;%\3^mf]AKq9h`,Q/cG%
7:171]Aiaf/h&+IWVfdA@bD='l3;c[/osp6Xlug.@(Z/1^QmA*J\>k%O:N@;d'N/eN\">cSWr
^V`;69EE4-=.^sBXm[5;=or[2@JeMD$l?YY@NAn)XFGWh()3a.>CVESULKt@"!`pT680bc6J
SG<AS[?ZV<u;(%.8.aU1kAn!*d,8N+$.SC%N5)ML5YhHHlNPlF5I2<pHFrN/QDdFU^aE:JQ6
jlrBYp'6COU2o-`RcF9OfK1o)18UGZ]A.'(rDf)X&oPn]Ad1ILVG_N!fg\QaKmRJkRPL%A?"^4
$tn\Qo_!G<ks16%7q=@_S+n5"1"Mh?MaodMMk(e=0$gp^*[:\/om?YZ/(e9KWU9`PM3j"r\.
nX$ZLdskhVR;7M0(RJ2T77>kM>jgG=nj(.@0[Wb#mFn\QqtMTM4J01o$m7pZ7t.mN?SR:h8p
EbR-,5f-/_fK2c9!Z5R#hrar7SlF),)4WuuHUia76H%C,m;R@08kPEd3h<BF:`ke7_.Zs&cX
uKq5nb.PHhP%Ai1^2Qf!cDcb:s8bVk+jU6[[T"PRk_CA0u'4JC,a%ZnU=0[eG8M/Z-ctC`+O
*_9L9A&?U8$OOR8!Y((jH#l?<;\66:*b0IG%+.*#8Ld^S&LW[a*lfp[l!U8nq<>0A(i.?:[;
MF&$CC>Y<BdNPkLn`t?2!:toE;uN]APJRHOuCKE/i3SGh>.I@J_#`9t=&^GNb1F27i-s==F/d
#$p)hAB&WNTSg'2Xp-:[k_S,^o]A+:/>b-`;2NhCRpM4Jc0U:f4H.+W-bY?L:+CC@T/t,*GtZ
-:.^8TV#I8e/eO2"%PG`F1c>Il]AooY#8P'I7Y:?sm>MiAf$*J#*&d'R#IPXruW?7L"Nt=HLb
dY/:A^DoX0A,6jp/=8ZO)sQ%eP'uD=kGdAc;e(hbT!k%Z]Adb*i0;0DF=#/FNp8dTC:B$<VT$
HBP,tLdl6E^Kq=bk<EQU[s]AXHT9<%GJ+V+2Q\7XR"3WfGKf4%!#.c[^$Q[=F=@#I\d@&_^LX
7LO=m(ME,f-;Q'<e/p1+_@;\+LRb=aiX^!;lUS:[c&,E_[RX+_6bHPma%n0.A#UC'GH\"NW6
@H;$T6#kq\cFa%efQHh+4r"`n&2H@O/onK=7?&%Y(+V%NH7P7hp&S$Ig1t;QL?_e<)ko)(+E
9M5M=s"tEhc!:.';mZ^Pc9Q:1#5PCSddR@59mg$HQDs*La@-&V=lXq*IL#e29E]Ad)5:qopZ!
Cb;)jth23K@A4^&-83[]A4=1lRS<@[MpcAuk,Iq)9:-$oSVpce7ti4@"Su#sk%f!H@A8@&('^
2476Td*Q8r:XNm3<]A.t[<&**8RZmIO<`oq12)e#9l2l@$E,*Zp_d<&Wg)g0&g:l\QC28"EuT
.5u2'n(%+nRi3C%%3`paX`3!I9_C/fR>TOWC0#XT"`aiUdYE#;1j'<;jYe=I638O-37=4q>C
F924Q(#bUI4c<.2#'MrD^RYdV(/0:^g2?4CbL]AG^YAe]ADtD3_M7oLC>2l@a;?ijj5!##bBbL
GK9+M?P/_^pj37pVKn7K*<ceVQX82Eo2mDIu#VN&1>m"D*rOL+?H"C"&.S9R'?g[7j?XM'1R
Go>^>L:J*(B:a.H$3t_]AVj]ASj4?A`Hf:=nLK]AAC9a>>ipWO\,T*<GW'm_$K^Ze.$3?ti4^6u
>T&Ae!"gD44*5tXB_m<'!pmJTn:nh4]A\f2m[)<c0_ua\NNj*ZfNf<-R#'a;P]ADJ^fS23pP?t
<bb?G)HGZ,*_te*m_1tG)]A_$XnJ<(,9^N0uUUFFK-ATs5g_!>F.(2!8b)GhRS(<85]A/rfbm)
C=$,>+.]Alpm(=^(FQfD[F]AG1m[kp%PdeT.FfN:k1LMAR0fNphk2m%/hV_4]A4EB9TJG?3kRc2
\18d*Zd#mKb[=ma0WD;8Ks#DhrOZdCG3r<L)Y-aXJn$95WOS$4JaXQ%Vme0CR=u]AAHm4$l6f
S?G`.8.$+e]A/rOL30?uWf>3pYINb42C.`O0$U)WbBMjKmMoo@KYuFPKPcn)N`CKf^tpq]AihA
RZ-#^M2^$'-\[>VeIGiU5`it.%hQJLU#4bNV#kM/PCh8@(pPZ.k#eYf/kc`\d:CoK;LZ<Uo\
=#TXRQK;SH>]AQr\.uM>B]A6X:`>au(<*pZmGAk:a6E35q*:XGLT-ZDJl9lgs9-trs&+bH$5V>
3OA\Q%EsDi1[8\kgupqjF#Ib'm:SLjNVO-lo!P=FE-aL`P`M/kY:p>=ZQl5PaO:,J/n2o?0R
rEL?B%YKO4jP$4laLA;]Ao]A2/6R\9qdRDaUeB+0N`rX\kLQcA@XO6NckIBZS&u\K0;0&$EQV>
p^rPd<E%!+03&`lg?JH@;cBA0i[ku$jhE@NA%>(Q]ALM+13XhJ0^K*:]A>EEaQKo$h_\*pN+$L
mf-<$p[YP@GlkUa"kids*-cJ5kh83oi9:1]AKG\AIBObO2$TV.loY<t7uk'b?SaiCD<#?n53b
$lMoF:0:hcJZXPBEMd,Wj3;(Z)>Ldc"1lDqCnTMq3eAkZp"G3`W8k_#=fVEsHR1V/@0./_Cl
>q[8X@1K;LSHQ0'0,$?+j2XYt:g_.Ae>di(\YVU1*(6C\Z1-GL<c@gN_sW#K#iU`1uu9/@)S
Zi6pU'2@/('[g$rKe6rpm`$@VQ*(Rfc'/3.4F2@@[$$gq$S-m,r6\.QZ633R4J7EXWN1F$G&
[)Xm=e!21\dPtWCqRk!LM]A\k+1F=AcpbisOID]A.$I'9GltCT^E66!n)d.Hl?EUbdU)<jqC7s
HY6RR'89A&>8jg`e)k'$/\;O4:@`QOX!c]AnpBn>N2VF]A6.?`C`:51$*0in[V%jq)==VJ+#Fa
[i\u+koC6nVH]ArocB,-c1-Uf7,:]APt>-/;*/e*1K)8*^)U-(#irpLf)p41.l[m%l;!e'./=:
o,u'(r:@T#akH('(8^Sp,p:IB(hhSrXgu>+%%u`6c*T:NmZ&`D,X+L$Pgk=ps>-lp5=Z['1$
e:iq!OSu!fV,FF)I;e7qtmmS8a^asJ453bt&T0URA*ekmKP]A>EKd#mKVccQk+-aOfV%NTie/
A[F$KBIFTJn#[TPJ^[`5slD@#M`(M*'NFLn;+E*44"-u%[r=[gA?W:MX`u"3NIA58Jr_0X3\
2(Z^^5kX\oe^agS,SM$7p;@o\Lk6c+<<X1_eT+kmJ^$kF82CrDN]AflVYD4SeP?++jU'F':X!
Fqin+DS'Wb(_QC&>:(o!j`Y%&WJA)_4=1-US##m_aO/DBc&IIbfE*,<il.td@oZBE-<rTU3E
<pK(Z#m9<VmD-0E#SsCmZa!1`MrZk3[5Q22Qe[/"m,]An07g)Mf?se#EH-6:rsHKGia(l[]ARf
;Y5$Bf.hLWaGu_brJ:R]A(n%G*ab7gS71XeZudM<PX\U5C\p3O%&aKZl'Y7V_u\QnHaE*gp:@
]AP]Aj<cs(?35deDZAL_[RB_?u1X2mOZoD4ZK?mUD;g?S&S!`M"@dVN=SdWM#Nqn-56A#3Q:$Y
%s3tPS!&=s6dgr*Xm[[jQW)XSM23E^GVIq3'n6djjs-987;dS3[Ne-r=APj6H"p#aZ?GUOcU
iB7sOWCifJghQ*?fSt-=6>jV/[tS*.Oaf+uPF.f=QrDKWq>5ONGB6Lk/D;>sDl`hCA#J4R*5
Y(K'm-$RA,Xe#_YIF;\ukc;@D)DU!ZtcX,/pd);,[6SV/@]A6]A&,2:nI-gHVLpa]A_LC(X^u8O
!K=hrPY%WlA@j]AW]A'B/g]AEgT45p1Dl&VI5PkiAC)*863*DPqlOrh#0U8\J=?]A"XClj=<j(N`
42IG5QW?@_[YKmjPa,bC:0H>"Hr"M:a,Mg3,`;JnuBW6a4Pdt8db8FEDiFm1o1tZaD"%Cf=m
uBm(NrST?PP*0QEJ:d1nn<Q%&XV(uSNCg]AcPG7gdO3ZMmlL*uLC]A_?1G^g3Bi:Y+b5f0R76R
>,baLeUr%R79ZKSe4khVp[g`t0mQDM3@s_820rKa%Ohi<YKQLNX.!:5erG5<aRVTBgfNS)U%
'8Bs%&]ADcaT4Vl2=Qi,WAi]A,4/obp8:e\-`uibj_.8UcWlPgCa%NNS4%mTC7EuOAaZr$6-Na
Jg3i'3o.=R_jOC75Y?bm?>0GA7_l=\T=6N4S8*KL%SX09P6e3!TaRF@:Bd:@*-F/;B,M@#9G
Gf78>br5\pcB((RT"lriZBBp4o;5j7.?%uBK0m*\)dV.<1lao-ua^]AIsINE#LQTom`4^Jo@;
E@dFbfmFMTf7Fn!c.1W]A3/V%WFlAG4j:R90KjaDl;>?>!('+MnH/_gT5^+p1&@+F6Ge]A6e^G
N)3#PboqE")0)FrVc&<CI'8-UcLJtG?.2H=I(<p75bSssMb7)2*@hIJUAaGY_`"5q&^)E>om
lp:O:i+8Mf,lH\%j.<3@hjLct?RIL_h@EA"-4Mlk]A9O*G`W`pkhg@lH%pCOHCRM:*VNM[62K
\`l\3aa-XF!]AtpEM%rj_.FdeFs5;\e-3MCtf]A4LL"l3F*@hHX)gE^HM76gE9jaR,tG<<I^Yj
,?ePLYQ$n_Tk^$YW\[/*g;C[`L]AKEhZ3r`a(<_Ua-T2Tj[]A:C.^#h)2uu^Um9rZ?.G<O,br6
MXV.%8hO@/?>e-<J4CA<\6p5=\aFpVuRV2?Vs9pm8?Z@?\9:=rS"7ANm_#B[Rf^>/uMI\g"L
n7Uj/:6,$>EgFXROto5Xs0!]AM<aLV:/re4`^K$e:QW<KQqnP;D[du0iJsr!gTm,f;=Od[=M@
n$NoX4nWk$)Z?dPD=IU/`sb[!r$omTUa*FVLn1M`6k@\'9W=-.jWOC_RZ=HrL)NWDD!6f;N2
9*$0qdj4_(bBY7H#4gIP7<Tth5abEZ6K/4t%SOISRQRo`$'ddgf;]AI>$HQ-%?*-.n#%ob1C3
KDl0<'&VuSZC9pT-n-UiuO/oI7bBY4^(H_StALo?D$ts+:b`O-Fsg\lU3H_DU]AW[!-M[ZGl1
!r/l5W2MH(C`&\J7Y"fT_a+e38Z`H=a`6kEpS9N!H1)sS(j1[PKfC('/l3nDXE4N+d7\5i&!
)_FX>01NE)<W%\B$*]AQ&guV$#!qRl(4Xo!$?p*iEDipp/j4Nd3.EGE`$#UoYBQ_uD2([I6W<
,<K:OZA,^@mkW4Ne=dWtO473n3'B?S4sT%%c84kn<;S4)3l+GG[Cq#kCpE_^(]AgW69BCa5,/
;C+=I-MU`SoppklPn4ei/\nD\^!?99N4q,r4b9X;iZ-b"u8om.aS@4p9;V<#EW`$RpDgoHS"
kOP0$68S%5p$cmk+haH2F2Dgd3UE\a7*/.VT1XF?'lo9U33<X(Lo/20NBtYk8mJq8";WG>7l
8#DpQhYGk9Qs2'Y;!._?see'-iDA28XV%TiP*0Og58>u.LqEDB#L*2"8F>rqU\>Pf58;NZCj
(H9+M[O;ZIZd.C%WC2^nC]A7M#kWnWZk41\T^AcC]A??oKN&lmX!B&(Zr6?H"Hf+DTFj;Ld.@6
!2cn+PSAeXe^Qr4<FW*ct,]AJo#HK]A]A%T^_nYlFBYLViXZO7Y:c3ZQ\uE'VU/7riK*$%+o2_<
?9_e+Lb7U`u(1oLkWg[u&,%k_A/."+[5<Hf.-$A7E/4moUkoo87ikW.7gpY;?j.^0-M`=8Tf
*hu^4D'69mOSt"W@lj"Q5#j!1^0DH05o%p1Mt(2;-Ns5aWh\*fGBU"D?$EB;5V!88bMkjPP&
rWImh[2QEhhPM/'N$31T")pe=._QnFp&U'#u$q"*>@@rMhj1u99Uka)o=:j9Ia-Tmp_=R]A]A@
fM>'jPQ^lMi_YZ[2l0rGL49c!D/<lj(0KNW$1D_WHgcYa\ZKYW*)5jn3*H9+R"+=_I_fQKNO
X@:F[iL4p1Odlo]A:n*d*hlXaoYEkB&XHGL)n)8rE6Clhe14p6LKMFo:'Q6QF^rY1+I'L^J#`
.Jh5]Ask.#u\l"B7QMC-lW%UNd7rElP--`3O$&h<EoGDGTl(CU($#%e)_)r'U6)7*fF0NL&Vs
8H;do2aP*'I.l'QFube0DFgc,5#no52]A]AU%*nS.)gOi4=Ei)QPks0/LZhE0PI_uu4-?Q>iHo
*%ANLH,@54ja9:*"+9;U]A>ENXYJ^E$S=:.lpJitC"kX2EJ<Yrdb&3)N^K%\^cP6>("AF<m;f
M?UUr`e&UarLZ]A%ab/2K;X=^/BKClI`L#@o(ZUp;g8d<W.<ft$I1%gtrSO4_:!p3Cg\hB>%Z
X_]AXCdd9AsU,;LL$UJCFJS.c&"0BM1$K7LKA!<09*b>8O2PlE?l/@9&_Nt.$uKehr&$]Ad&(&
$'B^TSf]ARD,gh(Hk]A&@+J(;IQ#AUb[6iQJ@("0nlreYI,<3jI)0oVLeVPPo*l[b)6QnQ]A#8d
"pEtU<PCOe(]AphBK%\YM:H02lF4VBDbk#HG&V2gWh5".H)5]A:(6uo*bpkS"!;9euH1UtV))H
FZ^SpWV$bLj-WuCqd!VK(p,F"G.gY%d/DeG(U-5m,,?H>Bt-Cg,)N@57+\@7nH?_$nFpV]A<P
2YmW`,UVg='X]AW';mrHX>R4:1q/NQnLF^)kp6QQ1A0+!C`gL&P"g1Zk[F1-eBd&)pC59:O-k
`+m)]APoX%?3,%B&2Pj4a@-p.G/&o.+U!4`b*_a3>uDbS1;ZO]A)K=q%3DBm9(F!rgQrOEmnr=
r.0oS?n5<1QJ#rj$j=$]AF'5gu5Q5;_b(Cii0VY\@W,/&s3^jC.6i)HS46^cgmU?*DV.ThTQ?
ng18]A,i6KJ'r0?p<DpeTF2Ze3G_?5d+at=<V8<0,iO3FET+ON4e63W@!GF1F-7sKCMP_h\IW
FB?fhru@e/C#KP<FXOOgD7?eApcd'TQ!XVsa*#8Bc(0ViU@4$)rrjH'jt\Np+bWrFZVWM#'k
b'd>(FsW5ap.j6XXm$)n/g)1F]A?AWr6c.bn*PUo3lJK1O`u"^JJmNB_J\cW63mZeK<<Z6(R"
,%0&ic'/qW$VQl`Wr7C>"rgmVuA*'d%5#"gT43rhJgLo,$b-J)'h6^7E3e1D=up^9[K.[(#P
0p\EqLU"EuCIIaLAUJ\5mED,no@([q':;rh;(C,__*is62ir$L=0b<V(Q'NO-@@HZ;5T1GYT
EK'fYh6'7[.TJT$=)%d>:BX%(*d/HC[L:BY7:8Eh>d2Wrb;M$r:J`:UGmYo$j>]A)9)@0-26Q
mfpD*XS<sCTG.3Tjcgq4-!b1^nEVdGM26\`&P+WqRC`r:;MEQ%0N^(MZARbY3?4>9OeM['/-
1mi-.g(nAJjW,W6I/`_&Ku1%[\Gkf$o1*>7BRBh!EmZr<lrTLO_lE.^^H^to$4VTDmH^#J?Q
"*79'F*o#LM,oW+G6g<$]AB<mjSXW#%\='.V"s7h0sM0QKJZ11p6ZAKq`KerW^/<6UqnUGCZB
iXI0>^KSS/6QD82.F15VX4!iMO+R55je[fZD^*C1GY1iXgdJCRF+^4no#=#ic8s?e1%d(.U[
e!Ku85DJ?3un+RO.293cJ0\aem*EIZi0O&<S")1Vsla\FZ-q?+SMYhPkfI1bj5(O#.0XEY>,
&eQc6,.51\3NjRVX4LpsuRYIS,Qk^>Q7PoJCT1V^C291o5NpT4EjThW'Wi[h.A"gLb7o9u$,
UQqb:\a(C0QbReCJN[qlD`E\l?fLY3EJD%[hoig#b?iaY94_)P1ucCBOt7DLC_W.SSCaDWZ#
AcG?Q3b3fL24f0=qi%eP2tT>`b,NSG,@KTAdq__I9/+J\G2YP-s2B.TFa-V.&Du'AE1X'e_(
NqTj.1-j"16.8e)N"gqBB,PDm,0;&\$I\nh>F_^I/Q]A!WHTa-dX.=c-k'P]AiM73,<G<9sG1$
gIZbPO@ZD*[&?b!<g.J]A..kgXO:#p6h2)fk5.Sf*3s!JHgO^AJ?oMP91Q'Ll@D=VDkG`_rss
5F5#77.o^.]Abs.9NZ-RNcUH0tntW%52qVn'DEJfjRCaf$EOkp<SHPq<O+`QQYB6<*N;48k8O
o*\5l3ZU,L`FtCT.WV<+js,dL2;hE;)V&&>FqmFL6Wr(&61=&n8<1cTchL[(:\[9-T<YJQpQ
uB&5G3qGCh_P#Dq1f\PE@/kEn65\D+CMfe@pV>#%g2QGYr,pYg$iM>CeT!j.?P<k9<UR:"6:
HR5^9%2<t.3rupuP0,D:m:LHZ^&tV>W:q+ptgS1dN53GOqWD'Lm5Cno_/JhP9:><"OI,Tt#,
W1oC.HmZa7%i+C(aT96D#4El`f!)N\ih3#n>X6lr5G02M[8j@a<$OiB5#*h6%@I;4p'Tj`L;
BU$b\2VZ2(FIX@e:@RE@R4K7JD]AO9VKWJ)^:K_gL;VE/b`lqOFq<Xa/$FJ$3pfe.f##PQ[OZ
6WSg_^V3]Ak;/nf;5F1=9o;VZRZS9B+CNQ38525BL-R"R^kloqA-hhjClU1YrdTq4dQYp5D)Q
[<Dn[pdd^FC,JY!g!*ka-'6:'sqqiuiO6iR8j5,WYFXT!l4Vjl>^7QFi2f<#bAFBZ'q["ese
Bg#tbDV9,UpaREBfUM!"));r(jIe&,9N=uiTLK-Lugd(SHBVY%`a-Y%fqa3%[?Ln;rI<<sF)
[ma5q;rB:(-^1EVsVGJ&jn4h,9A@o\i."fTDrQQ+5@2OXHECHZp&r7IsF;YO:!M(B,V7%O);
AkG<_g-bt`IP>!nQd9D$,JmIf,o?Pjc0=bL&2-b:k9<U"(!Un':>T0&tf/TIOCf?T:?A\TGu
9[]AR;r@JU@?#:NN26fj$HCJ@8LSJD:gs1f=:Nd_TXmq;+ro,s8ZWl,QBePt+Ok;5,5m=63m5
=@$M)#Q^oi"(hDbccJ[f.;U*pQe5:%Z.O]AEh;D]AH=F@86*X'q,etjq?95Dl=Jq)@rm@\D\r7
C<ga*ii>5AWfrZf=g<I2B72>YcF=[+$?MW\?2P^cl.#rZf7e>#A+'E+f,iKeZo=qUoqc#L25
N8HOAXTl7k:VZpnZtu@^DB(6jQ="uX5T%f7(&'b9I49Fi#J.TK:5F0=s&0Wg,&=QHIZMJlrE
jU5Q:BDs)cd+2d?p;.qcTRI"L.I,k^m"#5RAUjM#eH\JQ7Jng2qAh:[Zc6]A\jQ,;UrF,gZPe
<\(q>&AAEa]A]A6>V6sMmA*..2GC4GW-r>C[0P1-A2DE:TI[f>cdaL+%%^Dl@&O'ro!C%K)TnV
qk]A^%toB`tABE2j!IUKMg-'(InC4+e<6^c.Ik0J[fqg'f+S(]Amo&&04/#^[55c=`59hJbe>.
c`.%';`s-:U]AE#uRO@n.1,S?,AOY[)N!i`sMBq06j^G[+?$b\Gj=\C1RCjXl2U^f?sEfU"5W
:WGHV2#l/gKMY&\c4H`A!j)6#8nCYQJ3o52iqcWB:`HuB&^S0^&AP,Or3MDk)[F:\<r8_MN`
M6>!'*c4Z010(=c$JDFi)ap2'O#&L^FEGQp<H:d$D1@:G=sFVQ&ZIKpeBS;:O43)TsgS'X2^
c2c:7&1%ggq]A<Bf.bV)(OK8$qLij`B;0Esq>"Bdt+@=oZWi?c-bn0%]AY(B38/M7Vqdd!D&>P
Rb_*W\BU[N3#P2[XkA</Xb'4?[cIRU<e]A6]A*nMGWS%\IN/TU\5JhlV&+9LWF1?qZa-d&a+W4
4nhbDsk/f:jWn/<m'<$"5q5<[oM"QR(pSH*%i/)ESmO&Qc@g>CkB?Tm!'OT&e"_Cc[1qrR5/
>"(gVDBZ%.1a[DBh-XZL.b^\82MF/7.YDs;tl)=*.2B\qG(_3D(]Afgk[ZF"U63k\3a9G$(mP
*s`r$^S(?KoXo"?nJ>b\\IQn?l6hXe2KF9fMe`FM)Pm%L_87)G+>e:!ceU)n_/978P@)1-&T
%s"D`E?n7RQB>!#4-b-MRN\HH?rClo.&^0!gQ')?S^aO0%Q]A]ADW&a3<_O0VN*Mc%gH4\X]A[o
8?F::=gbMG.g+2peYWSqR=CP5c"L-gP#^f&@K\r[cT)/)m%Ed&gnBCc.%R#`"j>4</&D7o4p
YPQRd?[e'kYKGcW--shPkr!!4[T`,W:Fb4mZbZ]Ao.6lXIkN\IGs_$1+s$Wk*lm*P^<@e-V28
>K:1B^kfNPa<ElF:C0hnZ2cbZj;F+^lbQ?=\fTIII$=oCbW:HF.TrVE!3`iEg=3W/cWnP.5`
=%qG!]A\F/nZh$us=G"S@2#1OiHjT-OI-8qJJBF&1Nsm2]A;,ET7qfpt8*;-H'3J#=pe4ROM/A
J2%M$;Y(0=bA:;)Q_K?4#\AZXUBI8-*LoU"+mqXS9<<r&(Isnn5"D#/leE.0`1f^8aAK&%oA
JPdLs,tRVeeu]A9I"REW09rX)24I!_U$9f=>,:$ZOGjkoJ>]A7I6RfmC:7eK9#Tq]AI6?TUi#A;
_Hb\1$@+E7?2Kn%XY#-/!ENicQ/O=fl'2l%@S5jM#2(P;0H.M6s>5doaeTL$+<mE=,Ag-=)1
uLJHD)tH;ehij&UeRM78K0Lu-m[s^dZ4C:RdFdQ5+\CF&b-u:f/qnq.[jVKRo3U(mscj(?J:
Y.oE6MgcZhVa2K^:`^:6:BN<5"(&-o^&F9Ff1Jds$n-,Vh!U$`__nJPNM#nqWZ"R4%b4f`3L
=9/9,H"5b;(Z4!Hec,j~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="267" width="959" height="272"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report1"/>
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
<WidgetName name="report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    按价位段\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
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
<![CDATA[1295400,1008000,1104900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,3086100,3200400,3619500,3467100,3238500,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[价位段]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[利润(采购成本)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[均价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[均毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="1">
<O>
<![CDATA[毛利率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="1">
<O>
<![CDATA[毛利贡献率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="按价位" columnName="均价段"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="按价位" columnName="数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="网络报表1">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$start]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$end]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="dur"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=a2]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="1000" height="600"/>
<ReportletName showPI="true">
<![CDATA[/市场部/drill_dur.cpt]]></ReportletName>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="按价位" columnName="金额"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="按价位" columnName="利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=c2/b2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=d2/b2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=d2/c2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=d2/d3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="6">
<O>
<![CDATA[合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(b2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(E2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=D3/B3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=d3/c3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="5">
<O t="I">
<![CDATA[1]]></O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-657929"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-657929"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-657929"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
</StyleList>
<toolBars>
<FormToolBarManager>
<Location>
<Embed position="1"/>
</Location>
<ToolBar>
<Widget class="com.fr.form.web.button.page.First">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('ReportServerP-First')}]]></Text>
<IconName>
<![CDATA[first]]></IconName>
</Widget>
<Widget class="com.fr.form.web.button.page.Previous">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('ReportServerP-Previous')}]]></Text>
<IconName>
<![CDATA[previous]]></IconName>
</Widget>
<Widget class="com.fr.form.web.button.page.PageNavi">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
</Widget>
<Widget class="com.fr.form.web.button.page.Next">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('ReportServerP-Next')}]]></Text>
<IconName>
<![CDATA[next]]></IconName>
</Widget>
<Widget class="com.fr.form.web.button.page.Last">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('ReportServerP-Last')}]]></Text>
<IconName>
<![CDATA[last]]></IconName>
</Widget>
<Widget class="com.fr.form.web.button.ExcelO">
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[${i18n('FR-Engine_Export_Excel_Simple')}]]></Text>
<IconName>
<![CDATA[excel]]></IconName>
</Widget>
</ToolBar>
</FormToolBarManager>
</toolBars>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<f:@;ch\]Aell]AU,r=pi&Ok,s:3G92d70@9dZ.>JWmDWaJm9L'4X-53&OK%0BkoTTK$YB*,.
F(G.iD<F)Ba]A+;N-]APJ0Uf,&0O;1+p80C+;]A'=nqUO`Cn4!sX0uBMmr&\O\J?7[hWK<ZrOgJ
JmK4QE*O]APLDjL?6cC?nQ\,PX:^W`,;1cT-n;ceJAN:T-?4Qb#QbQ6mEIIiGBZ:[W5#mDieV
a%$)=3fo6?SW4<W1br)q97@;o44QHQ^qlJ-,$[gbH!&RqS(k=L[sc0iejXOouU_,`S@HhPlK
j*6`Y+m>;Pcr$OW$l`m&>'#HqLEF9s[>3u$FiF'jf-hl.2d@131qic%hOCTBO?g,O(P?0anI
E/-_]A=sUH1VbO"8H_%$Fg+Xij6m;,Ah'-3[7k;1C6G\Lp_<Ht^mB(Fsf>:6(*0fe0C/<abkR
U+WM%A>7RDa%,XLi8LbVSYBj0aN-F3WN&MY.aQKtG7dr8tRMW&+MGaNnf3-\fs<AW[I'8a?e
?lUFW,mZSOFWABk>%:AtV(&\c28Q]A;W4(DXp%X.@fmF?9;?)P/R*e[#F9+'?rau"AWrSLqb=
DJN%(M-;c"_X_Cs&0Tm0j8ucUtF;mY$XRkaQ]Ar@i,]A>(Rqp>EYmPqlCsaDFdCh+N6P['?F#$
]A87qJa#:"N>Z7l>iJErs(dC>Zn#P!G[o!G8U:_9:FAfkBLZ<ciP3T"&"p!A\KdVN%:53>0dA
j2YY,24'*a?g@:J:5ZBTY:6apV#mH+W_`Upe@:IHl^X"^DoY6g.=kP7-c;kRasnVGg."+(^;
$j)\3:'u@lk6AXo#H'q4a5A/#/8Sdncje=7Z%sHYM3:kAtnFlZUhUG_9lATaD#=)T=WnOBu5
^?_WuT/h(4MPhr/fn`Je8I+4:4po#%U1&2&.?78c+Vm]AcC]A.g\]ADUMe6="t5u=Q'fLb:^`XY
<Tlr."/LJ:DG$\cX^Bg`[6DcR:M^R<?Qi"s#$fX"0&$CRTSfaWC8"p'<=m[4Qrk5.(K>H313
"9Ro\BB;sSl%h5h;<9)AOi=f2!srVYl[p:PkrNp.Z>/<;Q/h_>,V0KBB_8@f*U]A(0S?\CJVn
)l!hIrDDUS<c4l>Z::Uk4YQMNY7O]A;=t*#`QTfk/Fc'W&/oUbkUFDo4;0tN%MRVRl*F)tqR>
"3NqK1Y=+jH8$G5,'b<61M7Sj-1W4Wi*"!S_cZUTR0]A`+)O@WJm&Eo$cJ!JFckC3$ZgFFe@o
aD!03gr0[[pE,YL.@6p_[;R8@AmjV,;H.:&^!`?g)MI7G!^obB;/*rdDGf:n$QIMD$SK;CBE
5$0k*Q@>Jf93cuh\V5@X/]AKXEh[O/*u@JPaeNp<k\;.uOWPtcf)"E`bm&]A!!uJD@Z4GkkBjp
60O*8Yhd$rO,MKX"(*Zhb#cV_ZhN*T>RU>ug464'I6TXTGb2j:J0+Kr>^KQ\R(jrq\V=pqOP
VtWT=RTlo+RL&.J%jBOoY2u$ojFBhbI4QU?`gk.t+X7:0cP;t+=rpl7=LL4u#EJN.Y,pu`oG
qq+BUI:b:20hU6_`g\Qbf)QpOeOKYT"rOhM-<ZFXP+(f#="o`a264]A[BGe5O?<iE7BI995$1
Ing;m`XQct>-?N)'WLi,!4ps+l'kWbt>M7ralE@oZ[]AZ4e-r0g\iuhenpF*T66hVk,8UNtW!
Q`2o\K[VXI<5p&]AlM]AsF?ck29@rMF(J#>)m*/*9]AX>Q2j6Ih8*JRK9O,Sj*/t]A/4\kbETk53
l'8!n*MAYLCqi>gT?'HLLGnD,c15C(fUb)5D,5C\?&_@7%%olk6_*u1C2#bjg:5O9@R@,)Jr
qrOHS@:*<,s6eYaK,n/aPp]A_ji8Seq88Z[ip-#\WimF"*rU!H?]A_V"iC+ZF_Zf)]A.g@bq<q!
XLJ-7iNnmp!#SH0_et3;iBZoZFP#cu*Y+k>'L'c&^<GmgJX.P*76\U'XICQ"&8MHmO5)nbfZ
I]AH8@p4#=!.)ppj4b-T3SIL_9%UB>ADCkBrjX?bbRPG#1_;_^nr>=u+I^qNX0U$unMY\TAM4
^fTof!0s;]AuU*T?E'JOBHtl@Q;`cPULT6*%PJA;6b23R[)DSoU*@9IP;rEUQjk"SA+J_?c%L
g&*IV[%W<369Tu.Qt_3Pal>Sp@$=?hB+ksbco.s[%D*iV$SZcX^t0-O&-/(!*>IacuLd2PVS
]A!F.;=]AJYj'L0sgm5HFG3FnucTp;EQ:KWl=2.:6$?pI&Nd5Y%[;p0"."(\5g[46Q#6d9MUH8
nNLCUa&?[LBu'<1\[#8WuZHU@75,r2'h0\2B?9UCN(Pl?*IM@)^/U46GD4/"a+kC;%V<Su;W
HBSMK?rM]AA13lJ%ALWR``$i%k=1>.Q)O-m/,\_(Q6RK=,<R"$`mVpH=0ggFEP0nbXre8l2er
m<_@XT.:QUCPL7g.:015OBH@Wtb@rNn\FVl6q\:5=mhc`J<R]A"Tk&!@DY%EMir^`GHT!<,1a
13"D[1c2(_Ig/qNeZJ!A:b&p/+/<f8d87biV.PL'<*X5ERN$U"Ob-62J\Je4uh;E"E'@nBaW
h3YgICO$6O,MLG8T59$([d6PLB![`S`VKn7KAY(U_L)m%H[J)BUT*^:5r73NMRMC`b+BO1)*
<Q'ltdPRBT?NVjN@t_!,HNJ#$u@,WTc<]A`%sK&<eVBAr_,q:&l#\9gTAO)3a$4b?YQe6+Gki
AU=:\&?0Mgug`,l.JBji-8+fiFV:")\k?CJR*`Sm"W>8]A&r*I,Xh]ANUN1ebjo;'YOWCB$Z6-
-8!Hq6F+?\Jr(2h2%GK_PjD&+07LXIdVf.?u-@:fNqaXJq##2kdW*fHaTT`I"hu2T1_e9?K=
YbA-A12PXVp.lF7h/:"OCOh7+c^<iAraoJd'5@27ST*cEfIOS8sZ4pg_)3oB=_!qP*X]AoGRg
po0M4=j\<Rh=G)kaSk4,+*rt'?&Wp\cnLM9'au<U`Nl%EX7K_n,K47R,n:*?!U;RD![aRO_&
S4-bI_ig(0ag,&&4f9JCsMV6'X_<^]A8;lOtT4m`amBkZg,B/A*X'l8&nq#.0+.D7^8g_9gg/
3]AsKOh5;%0q>RuM`BbOOOKs7cXO\V';)i;9H6$#`XL<M?-%t/cHRY7B`[l<#NnK!^o)@1*Lj
b$LB)B?XJ<qmb7XD16f]A[dBVhMFb[)ca:qBq6c_bXnW/L-?c\.pQX<-5_;nARk&]AH?Zib?"R
F5(Q"lcN2`''FMU_@,m_nreD!YA+Kku0MgIB)o:i-)8@PG_L@t#S3NMD,58t"41Z1OX-C/En
Rq-^P!#U[(=nV@W3:MUn7M%/1\\Nt,UpWZRp,C/#17h*F.bG`T+@A-=4LBp`A\@BLUhQA1%4
2;]AW-@a%U,UkY]AtNJ"//[Ma7"YI4nHD]Arke?ZcG"6hG:@"scGZs8!60,M$D.j?Hnia]A[[c/3
KVIn[CAHVDLY'+o%L%tZLNc$jN$dG$r5W<+?RIIbif-2#-D-H'GD"0pI\7sH[nRoEV4&2s9o
G3(M7?"sDV/H7QMd&>?mE`M!%4cDQ4T,3/8JU$^WASKVVG[6uPIse=m$Oa9f(`D17UZW%5gE
@T0_G,<Wj?6pR8BY*lg=?.qafMlMs&&!3B!LC<9+?V/Y$[8Pu73<`9;\_JSjMe`U0/@"CBm8
#-18&2Enn[`6pW1=V'J*9GdSZN+eR>lJZ3IcIV'cANb'fP9;\RUW9JdbsTSnoO&r54^&#.,R
JgtZg3_PmhS*1O$R8Sd&@I'g,]At-p3X'4-S]A!']A)@>2fkNpXl#Fb54`>_.+%\.[3V.3Tj%_p
?&%gH4)?K]ArS7bT4U^FuO0!#oM&`fK]AA&#n&Kukct]AfgGUqF&>C**?><qbDC_?QZXRMA/Jh[
/5Fc5%rLIMqpY-*Ia$_lNR@JA)#$QembAA)b>C:8JnP*;6d5lUJj3.FU(DOrf:Xtgu!$>ZGI
=HhZ<<_Fi['DGIZ[c7!1`_R$0R^#9/<s[c>Wm8cSVNJ1S_!iMTkE_<Zf8;/@fY*$GOe)SS>G
&.aKW?*_\0fX`jdrSF6q5?/L3,isRKd*fWn@R.*]Ab",pI,tfG5P\.l=NVd&g3?u`OSpn>X%#
jR0p&ZnajHNNr)R?X&Z9Ag+=p0nQA1nO<-KU3DrqN8D9i0e#V2jM>]A$h.r8?^OnG('0KTnL&
3g^6osr0M4L^Y`r6\?U@,(?_GpFJ:+63d6[#SZpHX$ALWs$:U_dKIW2IRZpI=5F$RQiBP*o[
,Q[bZA7T_5d#5:+i<Q]A4d<PA^QsoY@2$mE?A`uPNjS\\4[WN_pjF"%I=9bj:[ESW9(PTIKGI
Y5='@d$Z/nJFP.\Ddj,"!gW[;n,HV_3B>V%cn,;TLi?,NX4fNK2W8#)?6AS'[7Ve-E'(`_K`
)%O^+N]A4$M[H*/$fJTBb=XK3-_kj=uXFh+^@KOSC(_dE"5r)Q)kTu.g1sjMnBNMDA9OINSop
m'%^p26*1n#We'i'u(C'P[_4O?HL*G,sl/>ZQkZKPT'Xdb1U*17Jps$<k!_<omhWObMs3X;p
]A/\tcmXua-fYMgb:^M]A&t>>$akXrr:I'j7$PEf]A*!J%<9XXNTd+%3gFRQVhgN=d_cLa??QW9
iVC8gtS&KPo7(Jh2YQ>mi"#QjhW[i<P[B>RMt</;Zq(acoeh=.):)SYb?Id:U[Jg]AI_K%Hf;
AgjE=<lCb4`\>1D@\nD/qDI&piQ9+!.q$H(C'CEfK+q+VZq51l*>;CP72(eF!Ml8VsuZek9M
EieLjmKa:BZWk=LO[hcZJI+\BFf-mO"I:o`KsqR-&[$SdjQlrpT%D%<BZQ).G!jAA#o0R++F
S\>"9fbTZ-2g9^4EO*P5F9qU1R8Caqgb+JmobZB#Q.0f7XEN.\0cmU9f,l88GL:F06eP6*4^
R!@)&17/K$]A=B/!u<AHE2rZ1S4dUn*C8W!^L$a4Xt9j/4YCAq1kk<A5npop,O9Br]Ap(tR^:D
jL[1M6V('e#ud.9Jt=!O/HWNR['QLG.ggE,[TT5_T+O`b`WTf@p,`X\I&XZFP%$feO3R6REH
6,p@iakTL%UZEa%#E%.L=[>^5Z"icCAlbNU(JF_AufV!/\4rmR='1QZ+rJ[bf^qa\C_.G&/L
1+GWlE.L-Z1rtJqoX8Zi*oSq*X'4agjn<ZB+4&g^dCgEfY7/L%N_iNU9,uUoRM"@o;(E('=o
Ai9mgeNT(ZJm_^C,dXE[KL'.[>O'cshYJCtr4I_UEEDkT&,Qa_?gV21"j]AqcD0(!54-;[KEg
d=sWZc$rH*r\rj1Q*Ej^$]A6M3td7YRe!ls$^>F^PXEg-<KZX6F#NCLUrQel&H_MNDbOKq;.@
@.GfbucV'g$($2j-HrVOciBPKS9$hOg4mlAN`Bs`c7qF8mCbOhTct$@YFt(Jk/WddYgtfKNs
&TonDC>)]AXHMRXf"4GD[!\3M'O!k1TL)=S4UQIe/pL23%/`dqI;W5aIC2JkYIsS`35+KZN^R
9pYdP;&u@R0(tp5#\YG@Bhht!Qs-U1r?T\\`nMu2hhr/MWR<iHFMbjHT+0BXKg,;F8G1fG"&
AB)Ve$0eUW,HRi;THd@':GX>^-aRo4.XMk2.VZIp6BGLQ5q$-r'p`+K1OArVN_P.pjq#HI(=
NN5[Tlh"gH$ZH$l&h3/q4kI:<Li>Wc9f2^g9$U9oT=r"*4kok.-57*7IJjoRFAjebh6YMhU!
mP7_E5*'/XSORHk*_uNi@IO6TP7VEkMK8r\(jdPYGnU\#1V6(XP.,="7o$>TS%]AlcXbi!r@(
A_I@0bs;I0tr[[g0?:.MUkB@BU8+7`QBCsa-JZNk3VD]A=BOhQaf^s4n,I?No0N[\D,pFm@JQ
;S-dKfq4>RW*:+0@O$K-mPENMI__th7V#EEPH?H>E-,rC"StrlLsaVJd>p]AdHG2clC'&e!_X
EWkj<Ur.;SUJ)"9B4@&KllHPf<&6U1RLSpM<A_nm^,m2ZRP$IJ8O$FlVCh-X+\gY!Y,6>k!>
7_@hUoUKM5h#(@H^7XC'g17t?X^QQ:FW_B<YhX[h1(:5k7Cfo4,hh2B"4B0"=KRLMH&jQQMi
hFhNSDH^WoC?TfJa6:):#]As5cF?>nQWQFq)DU%.'onPFCQ+P]ANi@+1(D:!Y/5ls`E9s3#@iR
b'W4LdMK?Pc"6RW0U4bq_T'MB'YL@sjS@_H3?E;kr=^i4/G6\+lk`n"uS3e3p8NIG!^]A('sr
_K4/sD4P^YH(<rK\QSJPo;20Nd5sd*m`$\Rq-leEjQER7Rcc@D)_<fi;.Fi*O+YpIo9f`]A[T
Xh"2-D18[Po(D4f/l4ehPgeYMRY</+Dp/I!sbD@aIb&j^qPi1\<Q;rMA$M`N#)o_J4$?`?Fp
1E'`?U9WEGU[i:\;G[W=:BO5?#ggSRlVt3dl$&%2^`km8$k/;jBGX7Hebn1m(3ag'iF2@e``
d<V(2IkJ.D#/D?,eet[9.YLbfND)M%\pKe@('4LRYc`mgR4O!=t>RF>D!oC?r2$(Z\".OOgD
Ro_omFf]A4'hSa8]A3BD$f!I+L(44EC-VA3:4nf9",\=C_hHp$qSI\3EIfK,/kfQq_+jh#LrWK
O3G9U*;*:!OE5QF`5'*[09SIldQ,=K:T7CGpSX!S-h4Q"aPIN$_f;A?(#=Aphdm]Ad>La$*H-
oGOd8<nj-GjHm$qTT&GP&Us\Dae%Amu%ud(<4j>>qlN.YK,$U"N;@$OORP^Pudj'q':(f>i7
T*LC6_71N1%*>04eLL>&YOP<tCgJ0K!a*LNS+H-fqlZt66?GP8D.H(O+ZO:R_UfHiV.:".>)
er5kP>4%9$:@u5kRFWa;QgIbdYL<FC?f\D&DmHlg=41l#/2$Ilmo2V/cFKdbD)RNcRY$bksl
[q=-'42IPF6kES?5I>1QuI\]AqGY9ZO)c&uf5j`uT9W^,;\q5:PBL*/QST:`?0]Ag%g=)U;/[!
$1\0=g#`0fj6cd_<j'$TEPWUdoj"&8C]AUk@is(SqC"*Wq^U>40?W]AdTZPlgVSZgCg$W'-q)X
Q1J:EY8LO8Ca+gju8,HdOc`H.*4)#:J[&r5ULugBVOt#UM$I4TT?h8!D<9pH<oP2bP:,(8La
o\@o@sL$BmO*m4e9cjFp@<=HR-1,^Lk.#t5/*Y_+O^ASsHKm3mNrZ"`/;A#c'.[/IT]AX?QWe
]ACOr3)GUJS.V;0j.4r\N_g@aVh.rSC-t[Taiqt`,`j,HAj^9-)QL\k4/k/sMOd%:L[VC)5T=
C8T>T'F3h_b3Xb!mUU_g5CgC,"Npd$A.p[M`3dR7PKZ'T0+F03rb)+j0L$gXQd65i@-Inga>
"X(7&O&t+Xs2O2,<@9(==ju2nB9g7X^`hZ02g%Y8ruq(4no6E;M*s]ANP_&g>ko@QN8aCX:S8
rcnrjR!,K$>hcq]A\h&Lg^p`R(,DRCgYK(1l696#O6#+pNj3;"&CFDI;pqa5MDp>M;OX6\-%.
S<V_T,XT:^\]AlE"C/3N>dDo`+Kd4@B2'M$rt=e-/pnTI656>[5Z:d4).le)Ca#hG\nD+6Mu(
R\H*[?MHoK<\]AA*'t,5]AQYb0^Ct*]AL4;/PScS%V%Q>S#oq=HV:;mb0g')B:9bpm-2l$2'<IS
3mniXae=X(%WGj`T58"d!T7dlW(E,6+p,qqHh:-$(7;"!S]AojQ9Z1n*';BOX-+X*51!Fk?BA
>"%E9JN+i=I[qW2;O7!F$SWQ@RVt99WTPI+n)%TFL0[%`HSJ-<&:WioAne_WA:h\A6Yi7Lid
qM4IF5i7c"+,t#in8?LkVn[>`(d>nVWC;+$5V8.4L$-dIFUT7("@c(;96YLZI+hnP.$&%aC9
6^GU4@?L9tF=dVkqF4:#VBNWc^fd22-*"'dn4j-pC<^jOm-aE(Y28Hh@?jn\e%9rD+h38[dA
bGaEUt6op8:3n<XZ-sNg=SsP?9WYdDh4BGIe2Kkh^Q5=e<Ap**)e/Tl:`-fCJ%#X![7h3M2p
Gd`7%>(BnYTVg_neIeaN)XWPnRO>mu$hf43XNb;%(TVh6U<*TBLCamUo!A2+S&%rrID)&S^L
r)&gqdkFQW]A]A`H&M7a"-mb-9lA$/WbqIZ)'Rll'IDN`G*o56bM&h#N/^Sk!MdfT:>n+@%\US
I.QHq^(De1AP5X6[Ker"uYL?^./9gT\113=8l-Jtk-q:Sn@?]AiKbt,1*;dqC^tXE3:(oh!5R
#9HV&PYP,hXZ$@p(%:@E]AfCP*F/5nt@G9p,EJ=US%nrqBMQu1-9lkhV\f/&0mhTMZT[A)>;%
&ip5r+B8\c)nmG\;[gf?+r"t\CRsoTsE)O*/i]AF8j?3.kRS/N:C1:u[EqAJJ>$#"[tY^B**b
kBV]A!6b#jmi4&IJ<::OZW1(\2RLQ2:k9!Ck<:^G=.A1o*r$[]Am<W&!N66"t7So*,8F+cGZB4
g/dE"@o\9b(bXYGON\qpmAf<HVq7pa$+ddc=-f8\mS!46U:\#MpZKGFCWU@WH?fV;DIWM/SA
s5t4d0Du9$^uU$6S4?^T6#948m!/oPVGaleY!GrnmrhplQe`WIf>[ZCXi.7.=u-i#<_m7CZ^
*$OJ)HA_aY^+I=iFSfR2W]A_E@s_-t;"JW1<+]AE_kN]AL0T@:UWG@IeqKPk2ljP&=68K!b^%W>
iD4=k[0)%FL")@,[mAG^*qr`*gDL\c#H8YS+HR3:O&*f^QJ0R!UH``gkk^E=MJWM_.hfu("l
WX(R$P0H+i[tV7l)B$!;DRRdo`%k,GaMnCjHQoCF*%qlt_T[*VS]ATMb*:jY1"dB=srl*%OY?
Y@e<^-@\YJkFu_BWcm84Ut`6FGoaeb9^B8K+g9L2$BoL,$DBBlqi#lZmua2=RGaKMH";jf34
S&E'$lF%n$j&/IcCfr*SO%>B!pD8c#pTam=k!Tgs7`R6m-4,%/R=l@4aUDh:f<3G"8%_O,!s
D+nKdEP)1VM3l(iLW:gAFYe>'+QFPdC'D9JqIJl.ZQh%c5=lBbf8G!Xug<"24_:;f`F`UO0K
s%BIA(:iLroLM;NT^3)6@Cm.X?/KRN?%/0gn]A5J7_3&!mK^0j24gn0%6lV:LKPph5eN3"QCU
*YX>k7^q9#p9g</M&B/iiA.PIbZf/.[t[QGlA^3--V*>6G+a.t2tg?B&^)N^F>+$ZuAc/ZZb
"4ue!U(.a!$]AftKp%PXG$Yl7s\_r0U=,%4UWDR.EVS+OF+ZVP\E%oo.d.lL@[$9`!:k^ekK\
/='V_7ZUCQFepP)OUGYL2Im*3[;p8'>pT-EN5om)jf)7a-&"jV"NPGSK3[GV&T(/:M0N`:8)
r6AWg&M+p.f<@F?*q^']A%UeDq>c\VV$=-i8\c6Q6+q?h'e^\3b'/,ur2m(6[+C*.]AqdbSk!R
C.jdi.C@aIoHK\aR"u<KbZ%X$n@BkKm/(%*!*5ohd(&JG$p:</!7!f80UX>@sTn(]AZ7Sd\,=
$h8Z@sQ+cH3KY.-FAiJkWlpZl;^A\<6D.b:pl7pb_5O(KEmKL66Dc<pg(:7Q3Ag*n(=osHe/
R`8rKL^j,ccTmeK9N^s=Y41(W5ZjG0n&ePE.=3q_Zr#liQ4=Ys9aPdOQG=6<*"?k5o<=>h\t
pLcl2kh=+3K8K]A"_tmW21!;,&jS<M*Gi1=]AQM.[]AQd>^%>i/NNb4lpiq;*3K)@9EoNVbqV%:
bY;*_cao[p]A?i&*N&a,.<D\J&R8bRCFS,KB._o2R*<AQO;*eha1XVBs5R^'%<CrSrdFKFfCM
=li+U.;H[K,.#:8g$>eBS\o;l9u1AU*ASHU./['$UI:r&N$Q0"Zj!MlS_/A,A+0RHJU%4W2k
Wb_e2;a5sruM`c-&%?]AQTD^%GihD@5(4/e1+:qUgp18Mo_s*l'1]AG]AOH/W:`ijVTTp)XF6dU
08IXp&Fg#]A;,*H(pn$7lWTDo/8YjkU`:gDX[F7s6YP,b/7+@EBd?-:CobqnfhomON1baKYU=
.6U("`ufUc\4VC\@B*;^U0AJ?m?T0QeoQj4Vu0('V?#JJ*:L[Eh'bIL&Fj*jk!KEbuc8aT-%
#XDU-JODZ@SFN%!e#&CsmR`It:UX(DG(]A[_I4HqLSZ%VMYn+DD.(>4!U*qTUh(GUQ'q$FJ1k
]AUcV6Vgqm,#?QS$g3FSQ2mG8pVl06#/(@\'SutPb(iLDYZU',)b\jIME=D\4sJa-:gD%T1DL
Oi\]A+O9Rg,>nV@JOOX/t307=4LE'C-EthR04^apmohrQ!r2M95_YGt>,Ie2Wj1i\3T5*hgZ6
;Z_n%ToumJ8bekrGLiu\GJ)H&^$NH[]A!\ZHL\,jnD`lPf$%LoC@6ht5hrK.i4c?EuCk.cA/e
.@%>&920)bk2#pMUsN(q`TP'cmbN#<:iP"%-U$I6W_<a<XjkRK]An$O#8i/dCI-i*)S!'C:<2
*I4js=k1jkQ)iA8!`2TX5FLrBsK7F#h#m5&*@lW8;5'O6tck;6m8P[/sX/FBWU*8L8S\XYd=
6h($]AGoSIjXG!\HtQEjQWG=Plj(Blh_SrmoQH,j"e7D;7^h)R5Q]An3?$d[-Thfi;;u<V3HdQ
m`c[>^o#<k0F^3#4\C^J9Wb(R43#@AGR2$a";>U;m)h)g.F5."EJY]A!K(Dj[VGck0"?]AN\*!
Y<8_XNbujIK7nb>2"Y_d\57XhgkVj*OAl,0.l>()Y?F=pV/(LsP4JTfe_^+9X>FCWO'd&Il:
pqYhTIq\[Vun-0:=-=/Aa_I_Ir"C,5XR2g,qghSDnW-7["G]A=u<$DnlPkIgIU+noq#62C.Hn
9m2;_,?tA?M'6RoL^b+"Uo+>ghqOt&3@E4Oc>9OF!;$[`Gjnh3moQpd:M?]A/MCisEYg0.Ou9
2WSiGP4bVSSX$7R&^7@J>-i&KI?."2-lF]AID6B:]A&3CtE)VB9ah'?g[^pS2XY`?mN,3@4D"m
kS>hdiThkDN083XT<,ZC4TH^_5,e>Z<`"*9?q*Q\-EH/1eq=9HE!-#fo)@!ON\?./6uF471p
H#KFibMj__2BJclkKoA.4(?I>BWDYP2(U07qf^fCQBe!uN>n_B'g6'M*bQH4J<ooCIuI/2\A
(-ED2j#4_$.iLdbY<soO-p@[kX8=<L9iP&c9&4lHCtc=3WU5CR&PG&"PVfco+jYgh`pJ9n0$
O)M(MYAWB4r/LELu(DT*=-*V>&$M`*5Am@h($EpoDCtC\<'=.ErH;[HH&kQu'WB<:<Kh&5dk
e6QQ@sWE0R?n&>3*;b8%hmQ*7b&S-9b)6,,('Fo9g1#n0mB>F.uk&_<Dr6prHM4t'pl6LAb^
lgG;0EYfZatM]AB>/3cSZ'`l\bd#Re;+Cq(C2.4;&7loq4%n\@U!oFitCREm@I7Q*!c[\[tg\
i]AroQ#<CC3&!0n<(@eXNL(Rlo*A60+hR3U9oA&/+=[]A`dLbO-X\MG-^l(Mr2>Hsj1OTo7k`i
Pr"W=PGAmM9dX1q*>tDA8!3Kul_hm7E$.2X\jZWCUua,K1PBVpL,;1Le^umJDM_)CNk.5/qT
,SaJ<8`QE>QlW;kHlj%\;IR1R.VllFHg^-QIN>eU1V:(!pr(QAdeg(IJasuPEV+-EG<lP_Yk
1r+jOOFtk3pRm-Io*OEPc6;a"3UafI?dm"7Y[8$?9_#*Rd^Mr2Q0cO8_7[73BOY2f?keZ6=0
V2f$1ikdiI5mRq]Au!?Dd"P)#bGF%,/dH0#ho9TZ=1>jb2j>U>t*iIJOr-=MeNk4Nj1rphn@+
lj1:;X*04D47i(K5#P?]Ae&:&fh\^ip6lPdod&W]A!madXs=b$:R"NiA[>#.Y:Zn&f6Vs9?e8l
Ss_gKlm$KnOKId2kg-8Gf]A-ZO/4P4B<oAT"]A)@C*k**V]A##dd`JJVm6.m=[C5@^FX+/ebm/(
D"_XfMpi,Yt_S/ArN`'ZjC3+\+el,1SZ0726?E+`A_p:C!hl;J=q+#m@b?`p!PH::sk3lAlW
5SMiUFQ&G'/2TJQ\ELW?okne@B)nr>./("Hm6V`k+.KY-;I<;\lX/,gc=KnK0eXLE]AWY[b:d
B7-M_7dqg]ALJP%;?pV1J/b_-Dt!"H]A'Q&+$>Z3+Q3uLpruen`l3s$n%SS"tnu9c?$n0Bk:SW
U^MP.Z57;;b7&(i(+)P>ACkV3Iq8M[2Gm8.o+7&u/^9cRUTX63s"k)Ea-'7FNsk+g&)WmtVr
?AopjY>.)o:"$O=XM2BZfsX[kD4i/kg6um1'ViN*uK_YRd2DT<=Q1rK%PNN&AUs$_JpULJ7%
)G/+Pe3bF^BrmnPSr5`rGi^`$qQEVe-$GT2Ek<D!FO'Z06_$/tCGHP'jC:kc6mM3'8An)mq^
5>M9<#%JI0jB&i7p)#u^,$2pkk2?eRtqRkh4JB:Au!DMJBCOTO'Z26CT*G>ip'>Pdq$3,K\m
C:Y8<bEmE>9URIsa*lUuMK1QM]AF>T[WpG0YC5#L@[86QkF%l]AIiG-)LRlST.2j3=aMV<+U4>
rq4F!/g:YTh?o`4EVuL@@$^IGk01q?T.D0WB//:>PJR(s#Z'YW2_CRa3W8Y%X?B5TPK`IM@\
)l4`<SGDI\X@C)78D1J,bPE^W;!I:0lFK%`EO[[qRG[<<%D1pg6/f(O:k=Sph4-SQk^:;@cj
e@M3o]A+uf!$Vc50j4l:uLX3r(0\2/1;P-[NC&uaAM\7+!?BPc69'?jZd^t9^cYko5ere(:5+
0fkJUF]A.0.rk$,54`0Kq?@`jV[_K6DXAL$VUiOa>bc8!%nO=ILZXaJ$_3k"G7FI,QQ2qTEa;
j8j\.,o;>;eHrL&d^j#!/*ZQ[e3E\jfjSN/PGBDqMLKlTqlH0rlf?%$hf9n&t2bB\:&k+>)T
PHup0'/"[re=]A#.3=#57_l#T"e4!aC1<_[aX+:iBcU:Gj$2e+e77T-!Q-h[!.oN9/e6gfAc[
X^2Xg;+kIcOKF6.B.9_06p<$a-akE@E_Wi=Pom#4o-JYigj*qif+U[iXg"^n]ABs3/]Aife$.\
mn79>1!T;($bc8g0%t<?SFa`R,e4$f'I<;72oha$rD32h)N,lUU8m%i$<I"-Ld_MP$g0)@iB
As9]A(Gbq<2l4!ee(m[jaFkdR[dC[*je$.>=jq'=h%,#Z=?.=nWLl^3i$VDbPDR5K$aJ&tkUI
AfS3lV%pk;Rp6:O[lqPG:M><NVh/F^3[S_f%#*\=$hhf15+rtfP5h4\k'<X6odW0g"^$-ltO
F\TtB%0XCnF[2JVq$;nU[G_&9!,r^5TE/]AQYG[r"9AI&G\E8O;^?n*eKkSP=QSK/e#GAKG7l
st`,ia[ekh+Xr.-XDl_@hH;(3Q"qUoAONh;STQpb/fEfedqPqJe>p0q6=*=kqJQj$P`;o8DH
)$&`/tdnhbZf0EJDTkj1@9O:UO+2.j%Jr]AXoX\]A'KE/jHI#o7<&rmVHr.(PAij]AF@?8`TAH!
B0aTO6_]A1CL'U^OdEF;$2sik.co93eYh4roS?`eht2GK-8bNdG!rJ9l:j`l4k.$e9!-P;38T
:o_W@rTLDi#[N(.`q,/u)XYb>&3:3B"\&uZn06*&WjL\&=JH4oC=dfMF5C=fp]A-5Y<8m3F?s
pl!,fM(MbH1F1g:$cocah+\"2A[km!K,jqQRi[rcOlPI?@Vfg1Q=K;5FEOa#cu]AY$fC2p>og
RGFmUb-(oFds2eS.hW6F&g5a\M4Yq*DIc37n!ZL$Bpd%ma\&>h?8U1Q2FJ8k3lfSrb?kmkfh
<3R-`"`l:'VLdVt!jW\esldg-#%>R1J'.FR_lHF"EU-ACF5F40`9Iq?BhOk`hqks`M/Thhes
"+l6p#b5a,-k'Qi^(VmrjQM@flZX*^='gjEIl\]A-X)Yh-fV"eA'mr3aN..UHJo6^XdE:)p30
e_,'coQ^EE3!"K<S`f7eJNDo9kSXRh)Hf>*f'lc9mtn)>L)p\1JoB&4uk/;W3V:pZ76^NclQ
ZO@[,3+Y?olX+8#!id>1:)Rh[nLb/*rR/K-(Q('+b#P&[\t6G,Z5%"1Me:AeW^?Jqh5`0sF/
jqIMHRS^`YqQ21:QPqCgKS]AlP>7mHkNVI4:qYkjq"R.oKRY>0UN+CYN`RB!oD=3]Ad.QR17No
H6dm$5c*g)+M%![i;o:%YY44Z'YYd9@lI'`nZ^N`6R=$9/Ru9>!dg#?1oe,]AK;ScMtB_#s>m
VD(_b:dL6599500F@Ec@f\YWhCO]A:\]A[Y=Bn/Xi5CRqp&5V/@DRWOscQ_W>"7RO=\uX8`]ATi
GZEu1Ef;;@WWiY;[g/@bM=5RgeITPG^.nHE-9PN5jd<_&=NIc9)^IlOq#"#2$ug/TdYRC%0=
-Xbf9j47[O\8-L&9_sBqZ1pJbGqp;_A'F()8/nGes.;Eh73/81(TO[0M`g`02.>P9O<oPfqR
i0PMOH$lZcDMf/]AL9H.:78GUQg(WXmFOJ=cUp^n110:Q`spiALS@lXCkD6$Ji,@1RVVK7t.u
CX8??8WCUP`9N_KHq<g0+<E;Dup^%H2KqL7@%H6Sckf)3?p]A!;7^#>Ij_B@$-%5dlsb@XrTJ
Ulj$j*aAa,]A.nt,El;kqH4D4$uo)e7/ce0Q$CR-dZ^-P&RBH9^AQC5BQ[";@'UdsY/m>s-EN
[3^4ngT`WQ/^*'*&l2!]A:DT4>#@3]ACPJXJTA:DsPed]AP!ba?niSaPP(G^f2$BlF37MXIf*_\
/P9-$U1Le-ispM/#rW:1BetJp!;.+C6;DLm4h::+#Zt@)aIN(bk._]A\s/-)-pB'l04=UGdNX
O&glNbkO7'`o!Ai04Ek!8YcGDb)'S!m)h)pB]ATg.*^Y?BB/@HV:rBah0hPg\FC[K(-J.nG*3
D5-U\E0uU^Ho]An98*IVH<AS:%rZ'('o14PRD";]A4k.Ju.E-D19*#ub(1PF,i8\paXi%^C$on
@#1:B3a:B0pI)lI#<GqnIY,5BYr;;rR!D,Mm4BcC"Drb(?*"'aGX)OL!#f-+k?aH1[[<Ms7$
,["JOH5@JZc.(><s-`?jB.0a_`/#uhJsE#A>*=g"aOe`ntgbgNJ.l(5m*YPrE/U_@60Gj83<
\I^ao;VoN`)8pJ6-DL,&$!V"reYmP-R.s8iCcnZJE6YgB%3.NPYonU?>/Dp@rK0s7\+R>P$5
?.-j$sZM#"EI4mrfQ@Rc&-(;X]Ae!S6.(l%Oi'I0)/$rWSS:Pa4`,)G"JSOHo_n-4!Q\JKLUq
&U)F$h-WB2**hdcjS,G]AumLN('7Thuq9\IKs$VhCao,2C.jeACs/R6UD<"XWX!@WcS@^,o0%
VjM@?'Ef,RdoAlQol=YR@d7tY+X6LOpk&h7W;%%5hOboC7#rki*%)JqMh/U=6NfpgY3mlUtM
H/7HpF*24!^2oJ\C=J&>8XqXMNF%FJsITVL?B`L:^)Q!6^4r9QGmeGuWX#ZrY/0bOo>:6T_R
n<6ng-)bE#8hJjs?*5\L.L[4cCq+Gk[!BZKa7Q.#_`0BhrP^DfT<h1$]AOM_?<*DUn5oV`!ff
r`%3fT'nI>u7/l)H<3'bH$a@u0NGdZV=TAs*mf>:&2DHHdO:;C=23N0@3&.PgW[Vc"%H)&BP
s^k*Z@=atD(2!W$kBX\59kD<BWq.-LDr_L"^I]Abg]AROs)X:Cs\#)(?^WJkZ#u+k_g8T`;hbi
/[Q$)2kcA8;12tSIltOZs*lt]A$`l/I_lEt.&,6@pt2G#&nR'/[f"p;d,b7&J#ZHt+o<rr1#u
MSIUG"0C(pe)o=%Z$H'Ka6m1On0m+QB-i:KFS%5VHO`;2iH"H'T0(EnC]Aj`85SiC<HR"Eqn8
^EE-G5\?%r89E+'fo=R09l.K&P3^sKd?]AMh6X<f54^6:28g%k\^5YC^)J/ChNWRj*R#IGe;9
C7i&=4=d4>r0_\[pC$Q]A]AZ:Rk(CI'Sa%5J+;hh[U3*<OkFlC1<(j&=g3uZ._l9.!aM010a)u
[e<u<#ncpZl5?dEt/C`$Vfr5Vt>\MW%Nhb>D@Xn<G@6qg]A<=%%[CVJ>`M#cjSY8LUUE)R($`
F=F9`&p-$ZsGInKN<WjasTHAPNk;8=:U*[Y6gW-I>CIDr\ebgklta[o<WR<fUJ6-\F5(M#6
~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="959" height="231"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    按价位段"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="959" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    按价位段"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    按价位段\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
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
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="959" height="267"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report1"/>
<Widget widgetName="report3"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="959" height="539"/>
<ResolutionScalingAttr percent="1.2"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="JAA"/>
<PreviewType PreviewType="0"/>
<TemplateID TemplateID="d7b540e7-bc3b-4298-a0b3-b40be39dd37e"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="6de06768-2779-4ba9-889a-cdf1819b556b"/>
</TemplateIdAttMark>
</Form>
