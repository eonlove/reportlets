<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="库存" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT t1.自定义分类,SUM(数量) AS 数量
FROM 库存成本日报 t
LEFT JOIN 
(
	SELECT 
	品牌,CONCAT(四级分类名称,' ',内存) AS 自定义分类,a.商品全称,商品类型,二级分类名称
	FROM 博远实物商品 a
	LEFT JOIN by_sorts b ON a.商品全称=b.商品全称
     WHERE b.二级分类名称 = '手机'
) t1 ON t.商品全称 = t1.商品全称
WHERE 日期 = (SELECT MAX(日期) FROM 库存成本日报)
and 自定义分类 != ''
GROUP BY t1.自定义分类]]></Query>
</TableData>
<TableData name="销售" class="com.fr.data.impl.DBTableData">
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
<![CDATA[SELECT 
t.品牌,
t1.自定义分类,
SUM(金额)/SUM(数量) AS 均价,
SUM(数量) AS 数量,
SUM(利润)/SUM(数量) AS 均毛利,

CASE
	WHEN SUM(金额)/SUM(数量)>=0 AND SUM(金额)/SUM(数量)<=999 THEN '0-999'
	WHEN SUM(金额)/SUM(数量)>=1000 AND SUM(金额)/SUM(数量)<=1999 THEN '1000-1999'
	WHEN SUM(金额)/SUM(数量)>1999 AND SUM(金额)/SUM(数量)<=2999 THEN '2000-2999'
	WHEN SUM(金额)/SUM(数量)>2999 AND SUM(金额)/SUM(数量)<=3999 THEN '3000-3999'
	WHEN SUM(金额)/SUM(数量)>3999 AND SUM(金额)/SUM(数量)<=4999 THEN '4000-4999'
	WHEN SUM(金额)/SUM(数量)>4999 AND SUM(金额)/SUM(数量)<=5999 THEN '5000-5999'
	WHEN SUM(金额)/SUM(数量)>5999 AND SUM(金额)/SUM(数量)<=6999 THEN '6000-6999'
	WHEN SUM(金额)/SUM(数量)>6999 AND SUM(金额)/SUM(数量)<=7999 THEN '7000-7999'
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

WHERE 日期 BETWEEN '${start}' AND '${end}'
AND t1.二级分类名称 = '手机'
AND 单据类型 IN ('零售','零售退货','零售换机')
GROUP BY t.品牌,t1.自定义分类]]></Query>
</TableData>
<TableData name="按品牌" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O>
<![CDATA[]]></O>
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
t1.自定义分类,
SUM(金额)/SUM(数量) AS 均价,
SUM(数量) AS 数量,
SUM(利润)/SUM(数量) AS 均毛利

FROM 利润明细 t
LEFT JOIN 
(
	SELECT 
	品牌,CONCAT(四级分类名称,' ',内存) AS 自定义分类,a.商品全称,商品类型,二级分类名称
	FROM 博远实物商品 a
	LEFT JOIN by_sorts b ON a.商品全称=b.商品全称
     WHERE b.二级分类名称 = '手机'
) t1 ON t.商品全称 = t1.商品全称 AND t.商品类型 = t1.商品类型
WHERE 日期 BETWEEN '${start}' AND '${end}'
AND t1.二级分类名称 = '手机'
AND 单据类型 IN ('零售','零售退货','零售换机')
GROUP BY t.品牌,t1.自定义分类]]></Query>
</TableData>
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
SUM(利润) AS 利润

FROM
(
	SELECT t.*,

	CASE
		WHEN abs(金额/数量)>=0 AND abs(金额/数量)<=999 THEN '0-999'
		WHEN abs(金额/数量)>=1000 AND abs(金额/数量)<=1999 THEN '1000-1999'
		WHEN abs(金额/数量)>1999 AND abs(金额/数量)<=2999 THEN '2000-2999'
		WHEN abs(金额/数量)>2999 AND abs(金额/数量)<=3999 THEN '3000-3999'
		WHEN abs(金额/数量)>3999 AND abs(金额/数量)<=4999 THEN '4000-4999'
		WHEN abs(金额/数量)>4999 AND abs(金额/数量)<=5999 THEN '5000-5999'
		WHEN abs(金额/数量)>5999 AND abs(金额/数量)<=6999 THEN '6000-6999'
		WHEN abs(金额/数量)>6999 AND abs(金额/数量)<=7999 THEN '7000-7999'
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
	WHERE 日期 BETWEEN '${start}' AND '${end}'
	AND t1.二级分类名称 = '手机'
	AND 单据类型 IN ('零售','零售退货','零售换机')
) a
GROUP BY 均价段
order by 均价段]]></Query>
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
<WidgetName name="report2"/>
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
<WidgetName name="report2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    按价位/按品牌\"]]></O>
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
<![CDATA[1152000,1152000,1152000,1152000,1152000,1152000,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,4838700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="2" s="0">
<O>
<![CDATA[分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" cs="2" s="0">
<O t="DSColumn">
<Attributes dsName="销售" columnName="均价段"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex order="1"/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<SortFormula>
<![CDATA[switch($$$,"0-999",1,"1000-1999",2,"2000-2999",3,"3000-3999",4,"4000-4999",5,"5000-5999",6,"6000-6999",7,"7000-7999",8,"8000+",9)]]></SortFormula>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="4" r="0" rs="2" s="1">
<O>
<![CDATA[横向合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="1" rs="5" s="2">
<O t="DSColumn">
<Attributes dsName="销售" columnName="品牌"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="2">
<O>
<![CDATA[型号]]></O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="销售" columnName="自定义分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="3" r="1" s="3">
<O>
<![CDATA[合计/平均]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="1" r="2" s="4">
<O>
<![CDATA[均价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="销售" columnName="均价"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="3" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(C3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="4" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(C3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2" upParentDefault="false"/>
</C>
<C c="1" r="3" s="4">
<O>
<![CDATA[均毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="5">
<O t="DSColumn">
<Attributes dsName="销售" columnName="均毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="3" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(C4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="4" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(C4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2" upParentDefault="false"/>
</C>
<C c="1" r="4" s="4">
<O>
<![CDATA[库存量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" s="4">
<O t="DSColumn">
<Attributes dsName="库存" columnName="数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[自定义分类]]></CNAME>
<Compare op="0">
<ColumnRow column="2" row="1"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="3" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C5)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="4" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C5)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2" upParentDefault="false"/>
</C>
<C c="1" r="5" s="4">
<O>
<![CDATA[销售数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="5" s="8">
<O t="DSColumn">
<Attributes dsName="销售" columnName="数量"/>
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
<Attributes name="sort"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=C2]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="800" height="400"/>
<ReportletName showPI="true">
<![CDATA[/下钻子表/hhsjfx.cpt]]></ReportletName>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="3" r="5" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C6)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="4" r="5" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C6)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2" upParentDefault="false"/>
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
<Background name="ColorBackground" color="-6697729"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-6697729"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
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
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
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
<![CDATA[#0]]></Format>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<j1E;qKT=Jjudid-:iq+K930pQhe9#RD\i*N6qD>AGGh6j8.!1'IqN-FM"(#deV`&d_0qCJ
bX?+9W<38jnC9U&kOT&0X>+6:aX6`coeDIN@?k?[M8-rSD>iYX8':HgS4jlaM=Ym1W9Cip1H
mGf=,/$td*<_p+gi@.S(dR)ua;(4a01Epl=.$q@PY[e]AmJP7#;-?=e%.U(hD)m\,[4c7dq'h
i#`a<jDsY.s#RO\'ApiAU]A,m9@NHFiqk)rY>o4O@I<Rq^%,m$bN%"1au.RZhuA3D0E7c&0Ni
YpmRc/U_!]AH/Fd._\Ap\'NmBbA?S]A<ee8/dB^\3[+3(kmEIq\8j(3FL>sKcLp#N61tDgUg'J
]A+eUeerpKg+4Dn>FbSF$HbIr2P]A>tsdub26A#8230"G2-^VijGnZ4JFg";]A_.q&H(E7-5TM=
:?go-pHIX!=1oXT*S+noqqBrHs%nGb@OiZl^>b+B5<N\^`gqV:cu'^)B2XF-_>t4P^IFPO-D
j3M)#rRLPU]AG?q?S$<CCL1d1r;r6npcmN'1@fPD@jJ/p$fp#;5USLZNEc\Mi3%oL6*k=D,@L
uAhFE[4Y]A5lDV`0%cFP1[\OLj1hA=V=5pLC/KRHfr$;I"QR$8EheVk<TS^0[R_2W!f`0ZXfA
qq\1mJV<DE/;aAIMgm)l0eNYS#+$-BS4a3gk#p;N!?q?6Z8?Ln\6_:@8'=.1.Ef5'hVj^e+f
n\&%WNc\>l#028/5Q:2J#9t8JVT4OsFbcEK+$Bsj0I87H%N#([IO^o_\BasA\L^-=I;I#b?(
:%>*GMT%4.;R5L5U\b))CeM2!8+:J5rNYrBnWXFb_#hY2[S$GL18Ql,LO'+!lri)aXA(bZH=
.+rg/FrP]AhXWqg3r?)INm>ei]AV#`#U%1D-$Y=`^P'q]A@s.5Et[dmZ]AWM[`aGUr'kHeAcnc;5
P^#pO-51TdAGtO>g;A-?NiDN_^&]Aa!4;G40^s>+Pm^_aE`D+%gstFu!S\ji^^\XRQD%Sk0OU
=a.$G*pM?k;QdGU.K;-o3;+Q;K!h3d_\o6#Q^OcVrcn-nl_ooX!J]A"t4mFEtYKq?8>7[#:Zf
$<AkH!UPEGJKIlBo^oR7q"5s:pO:BDEH2QcgVCqXPUj2ud0V.9n;L47>umAW8$nU%$RCU2YC
NPX)!uWk5<Sf&+L=QK_P=s7hWILN]A/=LSgj;5a>l-3F>]Ag+qU&LYO&qmcD&KU[`STk?j95G\
<P'g'/nU6SD1)9:7/jof&[?iOhXtZ5A%[fhi!,XpbZ2skZ2V05u?jGN,:ite=cr':7%/s$SD
(@<-?+C#!VJngd)H*+T]A_`fqM%Wga_kW7]Ak[o9HRjX#c&qEBbi:hD!SF$H(!\RVh3B?OsW.:
YG(oPI5#s?r@,'lT6f@;'XIe`-TD,l"BFJ&lm^rK:gT/4Z5(PP(lkK6M]AU8kF6+brB"hsmR>
UI!rT$pWW<U^cOVpO8(?0E9A<dC"djaEG4VDrg&7"&s-EZ#*W7H%BsmD9-#;Zn1;!g(?qVY]A
b$K"fm>%@sMnXFWO[I?;k?=h^"5fZC]A_j!&B.h#g<+a`;Me'RR'th"S0^Pl=#_Sb+d876Vem
eer]AJmbWbh_F_2f2nX$q(Kh]A/]A`8mR1f7u59W0VJT'59[>R@2Ir[+;Fk(>,MO?u1Bh@a'2gF
"RfNLOS2b2",>=.)Z8*5&c6=-I`YTcnkU6cNbXrI(^fZTTr&J7KXKIWc"h/5Foc'9;;qJ&iQ
R]A/*@lK"`-@_A!"tooI<O&bihHpP0W>=4/ZatfnO2I5genEJR5d,`/6c1A.OW7.4Uj-<6/Tc
U,3#1BJ#@gY%@7jmmr5@3XLglL6:":!b4U*\%i+C$PZ]APUYdk6doN]A\@4EV3:a;=kZD=->'i
Yp&BG<kMYN$(f.P4F'g22j$rjXi*J)-?RD7Hobm5=gt5&7&ZR0+9:/Y]Apqr7Z*(jb@q.T=:D
sV]Aa(JXQ/34UA5N(H(]AXo"Na#f1+$^PW7?3#C!JoTHk(4:N\mSLO<q?iM/#jBWQQ7Qf?074.
q"DC%MIajod>*W>g:^]A9Ibap2/n?*A+nb,,d*/?HELXKjkZ78J-Z\p[l19L<&.IsG9qJ$Er\
NID2%"m-!d+,.]AbmN<cCbW5g]A5@&,\PN1%rHDh9K$:l=/+dTV$.9@giHdc#?U0%7[<oEi'ps
CtnE[G@?j4MG6K,p.!X/@ESJm2tjc9j-t"I3fR.Br>$0k+hJbNR?!20e)";pjD2.HD%698Z`
]A'fP@53!h;9CQ9U#[@mlm[k@4UNV80D/WJ2$iHUF)P79d=4OD)1iGG=hS0k$E9MZ<0=J!n`a
T1t.TpMQ0AP[+i3)k.IAh:3R:JG.-cC/E0/8T1K,IlD*%Oq'iL0epeg,".ts)VZ\WoW.8_1Q
P]A8!)ApRiTkD1!S:IR-W:>4(C-M#V1q-kiCA$7aN:AA1[K`s<DqMSJs-5qXn9>JhZ)1P0C^g
`h3[!]AKL4bIiGmi%5ce>"-pO%<]AHtui4i&jNK%f0EpUgAGWKU3Or"#0="$i`hcn"2Cb'cX0O
DEXOPdDV?WN3p**Zf4?4ZmPB:9bh"/lrZ8a,@RT($*JOAkcoJnrI0=&"QC?8eJr5%f6#Ir&n
8<p/[HWt;oZ)XE#=d#n$8tV%`9uQN(pcWc*Y?.ltDsu4!%O5CC&r9=MLT5Zm[RCfs%t'O/[W
<=)`XW!gF[?m5,D(aDr7OUZh08/`eK>fB.T\,qS.kY7o<mib:'#%6X,ojL6*%ioq:ooKr.<]A
Z7WlVNt>^(dnVl<iG#BN!PY/#Ff7+@7pX#>j^N@0.F<G=ud32Uf[%8aQcr\T:2RX[)A!ScE^
F?XYO&kF8f[GM+E&`AL!Fe9s6l!F6%XCcVUkl;E)#!l?u;V?Yjt!V5h%k&-cK;3dl\^^uO$f
<*>O>XQVI)g)fq4S!0iMm@pcl)t/hMQ$_-H#?Ss1Uud`0PEtkuTCrX^Zke\Iikk84'@C0fH4
_1XDh]AVK"/<KFhS>lY8UM-1LlLoh/)Ou6f7e>jMm[^W;-'a1EA1<P.Qm]A4gC:qhBF@eP]A=UH
Z=md,AL+FIC(Z_J+<`rnKF#V_/,?"VQ'pub5dG"s8s7(/a%2/!gU^[d;J3cu^G3rhbI^e+*D
\Z1g&D=ki-/%9bnMsEWM66;PJPJ42c(RWHadR'*bl-sl-U0Z%_`?ruitB-MIjWDUk13BoPP*
Y(kRsi,OaIIgL>DT:o*NJobUg23BD9u7=,De0EqNTg+#";;5hOHf*k'Sf$tGalaXO!t;\#kW
b8$p!iqBNf9aV-G?7knFajXT1$CMau'X=IR+4ag[Rj%O9o"nr@8s,V]A9=+[IY<*!(OqD<=H<
GTmNNUlH7k9a^CXWh8K7!>!/p'56!MFodj(:BRpu=>DmGba'?-*uudDRtTZI<^0QK%6_^`Ia
5EcBp`24]At)43[`iU$q$2>CN=.3N(["8LiW*^`V_0/%ZF^B2B;uQ`:+=AFi&mJc5f@!A@r"Q
Mg3-NeqrfocFTdF"jON4m/]AG,q($"p".'`_br=H<]AGM/6q)27N))69#T=oGGnnBd0"d:XBVa
aKe@;-L*9U8-j5\kE%:Ra(c+-L8GmGHe4:U4k6P=UC@E==)(;0\QlUOkSB1o=kB6;2X-;H5u
If$^*($sp5b.qt@kTa/G2XaP'1`'s'5&]A*_R/Q:kNtD-J,-ENN0_3GJVHLS[$X%iY\!TaHMa
/'Hs4+*k(P#b?G(R%kX/:Z;!k/P]A_cGl,Ej.c%k7@0)N&ZhK/e*K;2l&E=Kfs$@XjV/8<Nq^
K,qp/+cb*?:BbE_F2KYFiH.s-7Kk[(i*[1%GI,V:U2E(oU5'^f(G^$:NJfkM*bdC).mdh4"\
GPNo<EdF>$*^%<QBB)U$His:DHA,'9Hr!Dn)bhYN82;fIqu5QLA\J#c.CAO9HhZ]AMLV<+>m"
NqgdSg=CcAZ[=@fhmVOg2bFeW_tcP#"+lbUEAI(=+\$O+dZ`MKehq`["m=bojcTnNbTV`.5p
K=UNaa!=`[WHh&sM_N.)Q+9qlT4A!OQ!WHB23dc,;.qDb+$X3nXWsgj:]AnG-;`/!`.Qt!Z7>
oPBKhT'aWNDmr;>ELlUB!13&hfiNjGntoEiHJ0n$Gg=4q_L&la^\76_6cJ8CC@p/VEt2qX,U
259jDTeRrPA;Z03Hl4(;,i=qTD/^LiP2QB61`N`Us_'De_e^Xt3F;4-&jT!;B(73:%Ic2I;p
;4O]APDI?*8]AJoX+IHm2]A/ts&4Nt,cSmQRUAb>V\da'[%ZjIQd7rRduh,Cf;6ui7KhS1PS>/N
omS5:<=![SQ-#A)kW/R@C%N7#hg$;3ed*S_O=+/A-/iJq%F!rDn-%ZZ'J'h+H:TM(=g5&i\5
1"tCuU7>n/e7cmqN`@S/Pica+Q*:A*_I?n!Cdh2h!3Dm_1'Oi5')Y)EU!/VUJ<J28i*`V"0T
2V%c:E5QE:(PSNpq5hco?bh3mZN2k#hNCYkm0Bfo`5/K7JSP;K14WJ0VBcW(s19fQ8'bP4)J
HnC-rq@3,NudLT:r[5#8XJ1$&2#EPci,p8+WVmgssMg%bH*)I,%HWh$E=.hoa@0IGI(S<XJ`
Ak?hL6O#ikt0e*eEPFiPQVbY_aiS7.d-+fihnkd1'H,1gG)"IM=N\@d0]A"#Nb^#h?$pA1:-`
cE8$785-KTK0>;(#^G&Q!/7rhj^Rm#"TJ5"LnT#N[l%to3G#0*d.fU+<le*98s7X-HN.t8BQ
e7l7fZ#no_Ed@/_\5!EJ$a;uCp:Est$F=Pqg!^oa?/%D#.!iAlP46AK"jVlClS]A+1r=dp:Yd
sJlm>`(O"4^\i\DHgePiPrcPRT#edk`VY!L=Mg(bH#e[XIjc,aXLrhlPghWpsiel.t;5,b@l
j9@S"c-6e_4H\bXW!i7jT>@eZp70U5T_F*:>"g\IH!\F/4SsK*+9(s%?S17dB[3_,dVdiBr[
hlET>++Ju[YBof[^$!NQSH-`.'EkchmGR,7oU'ADRt+U_EsRg_k"%lin6hUq1p)[I,S3I<>n
#*QXI_rrpo7VWiL'cam$W0h]AR/ko?tm.XYj,u1>OT\Z1SVp_NEbZ\N]Ag8=TPF_`K@\J95G"7
.CrN-gF*,`g:bmE>>@`hRtYlChK6%1Dg3l_jmQK<R>CPh5\<%:fUg!]ApNY;gDBV&O"EiW*$,
*\m5pF"A]A-c+)]Ac'Q[41Q@b2)f)uKgOEq6N:b<rZ.9UqE!ns(D5OI3p_;a.)L>>LKTJ_TWDF
8bA_L&_OV'n=jqB..7bOM/oNEU2*9^jI!Mr4EXAZo/cR#j>g+!j@>KSC<>-Ea6tK#o9bq"<V
O`\(!^knn;C@nXq*mA8q!jL\A]A!7$Q<6d20_h]A>0;[",CEaZ<\UlTiOF!O>7t*Tt[;Ih40>&
?lEnHD<M9jSmk3I0\>:6PWIT3Z5_/UeMFTqD)PX/ba;P$t%$D>PB!]A'X2llJ"rrF>W28VHZQ
[5:f0IonobMf3)6.aYeG-0GD<]A:<\5S#(S?V_s#e?<8GXUE+;I9qJkil#WRrj=T)%Z#e*fOu
lBdS,/VE>0r"1+RiTJ>mc[.EHT`4@p*Wp<EP.4k%L'94kq\`/$gIIq:=Hhh-6kg.X(F]AqaBa
qTkQ2Ir&B\ujg[=14/i<bY*n^%d0eX)Y:p1,jc6)2O"IS2*g'%;e`l0B)[UM19>FNs'[<ljC
C_=gMjCV<()N=GMAQZ]A%$QKnc[0gD['=S*;^A6E"?4&W0bgWa%?%$P-ff(`j!9&n1QB`e1(E
oJ"kFHj1(YIPSn#R-2EZBcZmm?Xg1dodEGBu-#lMLiPsGCAdHaHg*TN[023LW>MJ!(i:aLHt
-Y":<ITApahT/!F:PK]A.5k=pSY@HepOr%F#&[rEd0INB[QH:MTN0n-Pk^dKP[D19<!eDoB(h
?cXqi6kCH6r#TFI)qtcUr6*rNn5c*jB!nn[$YW%VXan&\k%"e,cJbp.).7;HssY;7"FFlg!Y
kHJ"FNWYC5Y/#_GL)f;p!L:aQ`\#jQMaMIA3ZWB?*':9LZKt#h#[oXIDLVe6CLk8_cMr!.Ff
-_W44qJLR=qsKI@[D2'!/]AK'p)3"3PIBA<>X!Ls@>V:Lp!Og*(/`&<EHF@-\aF1]A^c7c^Qca
6TG`.Rt%ub!fqU>:6H%<UePq#ikUhJ1G6`g^'0Kj8P8l3$Edp7*A-_rB[^64p^6L5\PfbL7n
<V>O%.-]AslQ1c!\%^0DH/L1t-([c<D>Z@^i8>$XLY9r`7Wh,%X&@7!\oFhs<[86cKS`5Zqm8
bnncf#dh\"]A>en):,9MFn<Cg/CUT%!>39VcJtm8mD"''S_us\s`0Zh3,'L(KnO]AjOleB6DJ9
as&O19lqIIQ\nb-$fWQ^P2b.T=QA>I(#8l;\,"TWESW,S)+.Vm.0_&]AJI\&&dXZCgZ\$.i,.
Z`+eM8CYbC@g6GUF0B[TZu8CC[\UoC>;eP#V,-I(U7$amAXiq]Aiug6(Yu3\[Cq_5S4=@h%c8
=5\!J#21iVfO>_3]A/X-0"UF11DBLU'R++1ZTPLPG8s6`1ZO%ZEP"N?NFDm=S>I%O2DRfXb%W
3r+ksOegRukiAcuO.*g2jZ+PA2/)S"fq9Ig,,SL(eS7SV4ne=1q?snC7UCd"jt(B=ojTlQB!
F(_H3AV'?TUKOh`\J@m.Z),o+"tffdMXaIl>"=]AIZ9O-r?$8"ZN"u57H49Fm1HudSD+U4qYA
Q(5hsVS`_#NWl!a6f?21TrF/;e,uNCaq;>DJ8gBE6c2/&?s3Rs:q&$'OmL'ERJ>mUb-!#!Jk
(B44ft-c7o'kT5-_a/_jH><o6jHd.NfT/ZckmSXaU/k!BROq#6JpMfh5DGf2nueQZs<hl:+f
(MFh9/b%Q=_8;80k4#Hg6nBfp+Q9hB&(X!O59+TsAo+OI/OK<?"K4<$'f!.@4)ph[X5jIo:,
m:iYJYQR2\@/S*0R/L:-m=W^h5KX$W4uGj+N8#Au!K.dF=6WBdY&@8^UkDYfOcQ@km:^;O.g
d0k#1!YnD^9.5O$n,5;p7j/gLtS>db#sV7=[J-'qj.(>R$/2U/p,)LMHuCZ)+n$ADp:1U/ao
k'c0BJ%Vf=jg,O+69U=MD[jp9qG-NYR*irsl'6P>WfuH-&LRgAIP,CWE7T*B[p(T5FZlNX@;
9(mOpG&/.L2\gOFGgf,1*ZNXbM4)(8((+*$d_bMnF`$\4_1RgGgYM[BA6SjU8)eWjHDkG6!!
PU86qi-7_XJubY>Y,1+0\fT)]ABP%<j\KF1P*s(PNbPr*qRb$8R#-_*j[p(>/CC\gCm3n6orb
U18#i%NOh-Jg,]AQYk21r(m=(7`cD#A,Lu_2/NE79[69BLTC38A2;GRSReL`C>)o:1`+]Ai\b]A
a@n+<FHZ=$"\L\S55[lXg>STZE:#E:>[YSs/9YAbJZ%1c5E;XmN4d=na!!,<@/p<eiD:j^S@
"?E?M__0lA)4EW,AZ\?*&VqZ"\3W2LPj<6R)CL@<7SV3BIe3t#R+5.HVg2SKQ13buaH.0=U=
mB^9H%()/l*1VaUN(ghlK]A#TA7mk0MY%q1.j&WtG3Ui1:$B";Rb<34ZUP^kbZ9Q.hMsA(*Au
!o;k5?1_rj8=qtc&Y>@YhG[']A?-fr!`]A4ZgR]AaNPSl:CAe.IiF!%]AuK%O&PRSmZ`S`ifh[f8
ln1UfB)t3*Z^$<oEp\$_>$7MS@*t9SScu@M;]A\sqLUk'PI0HsoHcFp(`ldT5^oEo8GmK\(i"
LKH?-;EsOt<o3/.cR@l0R+3d78PQ.bW$o_hQ]A*4&E'\0n%U^Dt<N9l_5,FY-X`28?l;'/spJ
Df/+N_oUmb;F+_fX-*ba7O58W"M8as&BA.*KIL*&[1\FP8SHb'0"(LBW5Zb'PkK#!]AA553^T
7'o4Y]AU9(cr[[!.sNO=1F_D;\f76gkD>;[=e>JpRhZ!3c\AQk?+/6".b+7jYA-Y_nX=R69iY
u*X2abJCtEMPF85/>#Vn9gj%]AI7*t$CaM.U'lQpWI8;O7r=BhjDDo"p!<4\d-d4QlEKFtIqI
K6.?5[I_S\OH+SkW,@b>7g%dm.ZihASHXTd-a0m^4Os3U4]A4)&@L@M>r%UT2E`PehW$t3lSD
c7-$BAXaV=D-?66`u7%5YOa4#&3.gYttk1fmUkN-Rfj,!?:.&kMY3![.sL:b<NW>2.e:A-8A
hC\#8/a?-Kk-\SRPMnklD;;;K#XDg`A<AP50olIU22r'"eqqC\?haI!3<,j9++:m\f4l-#3U
kJ;MV(kD.IY[SeE9&TO2la5/W`+.ZNWZ8.Ou0E(-E0:[T5.9\4/KW395ieI/S3oT`>)SpqS'
e:n!N.X:6t@lf74ba+`=e)_2jO^3Q7AF:&GO;'n1Nb74I;U%=8g^Wd5X-@^P0qE2tj"<PNF7
WRKt#OX<tiQ0aQ.,<.%-*2?J6M_X1*j\/Z[hl@hg=mgm$qjkn%rE<plR"o!r7^mt:T8kYZ:r
mA='fG$I/H3$H?++4aPK>Lf(&R<j5)t\le77OmZYlroCsUq9'VsEL=tNHIRG+0lk7aKDbNB$
N9lg]A2,b*a;e\m8I=L0hm=%o<CY9ra)g6]AQP.@tnFf@b1m+/1!Wds4RNh3+nT,odLPq7<_^Q
IFW'MWtV)*q5uPs#i%4KSuob*,&(EZ1j&3<%9]AKVqffE2B92EB_A[--u/Yb)`2hdXX%N[I_[
5'<g9dbktd8\#j7i;>>hAf<F8c0^?:Tb?%ikSpe8=ipiD"_6:l2KdmAjfIuRG^>lloJ:aO_*
R%pUU@m6-7n6l$8=boj_IpMdn3X4aX,pS<OLh=g#\6Z[0]Aq!2C@2t+Kj\<jN<QK6oiD)8@"9
C>`C]AT,qrG85h]A+4l/3'VE7*`Jj5O<lg02Z@NM9h*a*gM:ag,kSJ+J0gN9P,E4>fde;GJ?0Y
<<U;J@^W(#@+eJ<,\Q[X3/%df/o2SqZV41@rou9iM3Q\Ce8M!.1HA8ml4VBNG4]AtX[d=KI,G
YLaA8sg%2DZ!0L7o9n@mo=$5D%Af9Vqu.DqrrF_7^d;=B(:>e0[P%?K2UK&0B)1Z?m\s#Vk;
/O__S=UeJP1mXjkmC<krYra/*(&;cZ<%'f(1jcE\SNWqD7NMN?8%_l4#f90:aRWH#8\FH58%
*&X8@\(&&6q%=OT.!p$B1%;`(le&DA.b(TC$]A\qtcl5!kbZ\ltdW5]A89TH?uUO76^_V*D^dc
j(gRPOgMh95db$;9-.@eK$*KBI2YoB)9CpV^,$0YU]AX[/XUG3'UeBd'`7`'@TG[3ZO?#*=._
0WEhg8C)g%6\"fAM%Z(($?F2/BQa![i3NRSJEfk,QY)RP_q=SMfZOnn4#]A/[i$nbhcr[o@jI
=85REMPa:DcLq9jtVt!fZH(Y#m[;D(YC-rE2Z_1Ga>iUh?(MV.MpjeRaUdnC"FEm&jL,^e_]A
OiT*r(rQ?6`NdMZ@K21j1D$#5)8/NkKddIAKIeWu36'`H!$Gir_\_p`f.;5d!j)hIMO;&]Ac`
kVc4R_h!@X__iOnkeCrhb,p=pk&E+<8q7&U/"a<h@iECF2N?usD5,@"^F&jsd?.Br6$12ZVg
Fu5;]Ajq*B@5JQTl>]Aa.5EQglmouPqWmUudaCg+WY=Z3.tZaGGJ3r074K_/*/K3e]A+Y)/FfR)
gaBS(mF8O<FTq6=W2mI3aq_k09^%r*cg3CsN1bsPpYKTB[g71"i?@e&^=d$f\]ATAI3oY1OWL
!!QD(>5q%k91>tQ)nfD-f>c0<bU:)M/FGoH1YNJ1HdcX:kdk(j6T[if[8(0qBHN]ASL=&]AB!$
;lA#:qW<f*I;M8m"7mQAO9!33B^45a(J?`=,&K,-(FTF_k#eX8gaG0WqtJGp<:0!7MV>Lf0u
#+s:)I@Br4H>W8:LjI\\0+?cj/5DrN8&5qNm$#*Cl\^o2d"0mM`HPFSBk<P`eau*WnPpMY<(
CrFklR*+dKEf<0ZZ8N=Y4FBB<FZbdX:<Wn=<g<1Ai%A+Du?_<!49AN?-)L^,X`)mDXfsXG\$
3-,;94cWkA'$;uK?KA@T;i,82(Nm=J-FS+lt]Alpd@l('b'ka7P(J\59SL%Wd'7^"sP8!<FU`
:&3S+FZDq%\?BQ.upaAK]Aj!:/ts=E:b8b5>h.pm[.>V;1:p2p";B,<c3QIF*>Ig56D*X]A\VS
l&0\tIc^KjV<VqKS`(^+'^I^=fRp3&o&jBK>#!9U<fd[b!ir^L%K(]A1Ysjp$>3@*:H-&:D/N
d;Yf'M.3,JNh"/_#!AA@K<]Am4deJCfX;DBO%:(MaT%b&f^,]Ac3fBK?r/ar\3.#qXOOYi]ALX5
6!<g:AC#[_#FIc^uMmm"52_ilPVsL.-+lMURo>/VDO#-H7RMhPeo+F;k&>e8kjf2PZl@>YB%
(WTeRP$:aua?&LA!:.9W:2OZ*b<?-)krg_J.?=la2S\Nr9r-nZo5luN2a7QXI1shAH6ahq-#
PeYW5`+mH?0ZKUIt4V\WHiVHqFfpBr:"u^oJ/G=+]ACUMqL0c?q05e:`BHc<!Kq(lN:h^A/!*
R/natqJ\%=;Kk6/_>%ltN)1(]Al9F<rf3$`Sdm5UAPCH3U2L9DPoF_q1iTT[Z49S4-5sqG68+
i($L05/1)0^N%Zn\JRdG//]AkoB?WJ$/qs8pXYq,^C:./J5K[tU?!XVuFZQV*;N.d]AI@l)Y<^
KA_cM_]AX+8uJTLATj]A]A?X]A_R2QT2=.PU2cN+0iIbu:*JPtn+;W58mZXF`<Otl]ANr25RT^U(&
Ge6JI+.Rf9CD.IXc3KrY6C@uQ>883Pld?T">bU(8-OEPFX:Ai5qo'+YMj2@l>WK1;X+&=c:j
B=Buhd:<''ieujBBgRWV,,F2P*7]A-CU9gHo;V1M0u8T:D=T<BVk^XQS(]A!%nRs98F+g!]A%n7
0J-*[7`]A@D<^`eeCn^YeR^"mO!;R=Iu3_uPF"%LFKKVj13f5G)^V&Z+>hC/Ub/AP>f+kKF6#
dHhl8.n<e?fp`#H/'2a!P\RF<&C>$)#3hsme0Tsrgf:G<%HXf.IEk[oVU@!)O(8OSm-cca8;
s@/30IJlg?T_>GT\D'm&3_"LZb=qITl-M"1@JAA(u]AFr>koLP*)H4=ri-[cK\oV*L")N=F?0
d8>)l`@E3:2BYQQ??>7*sBgHk]AU*Ht`3cUu0[@N?&_MecK<(rS,-J+Gs^4YTjZm\uQ%dG:87
_XpV\K4p9:5lMmhRb\NIS]A@@H=C(.Ej`1,,61q]A^W+8CQCIkr(=V%XR47<b%$UhjkGWplO$Q
LEHW_L]A7^'KY0SE%F>_5K>qBG=c?h@#]A/AN\:%6)LZ9!ifrKG?r_8!kl-BodC!frR,kTgsH]A
igIXANpb%1\G*]A'rsO8+;-L[qVV]A4`PL6-]ANKcbAh1bFGQD:a<o0e7!ZhQk94,rA5,HjQPQ^
#$u2.*]A;I9U,XH%$La=VFVqT#TI7dt0b#!@D>^Uq>B%)pEr>VdH&0PU5)FmRXZ/U5a3li4Hr
Xo9rWV_OUgI'FE1/CJ2.f?<Y7WJBZ6WTIc;4bV(ZXErAB&UXa(r/W0E=I2pp[]Ap([#gLAbS]A
qBZbdIS\s*3tqh,Z&<CE,Ils.E*_CP;Dg"Z`dS`Y3D"*GnYVd+Oe#t5cB-YHFm.'m,@/'T5G
V1E7%#"r_1!r\15!I^=0qr^m9'?:6D_C=_@]A"))BZrraG)&o=&rG>]AG)`7[1l=aC5r5g;P8P
Y\p?Z&Ni9_noj`+#@E"C9[D[.pCd=`j.f2%:E4C#IQ`-W_X7OpLNlbV!fW59<?[DY&5>6fXI
%pU1NHu]A5cjlVeX%9p(JF,_g##I+j'?js+IR-^oND+2gX`jghI35XNTAqO>##X1+g-O.oEj-
9BKLBi[bTh0'ZN,KP%B,6G9<X9X7Xck7!gmf^K0&'ipq'P&nn9%8"L%)4oH]API>=,N%*4j'n
7J@l\m7=4`P<[_20LMV2P0f'd-klhkqs]A.LlU`d]A0<0jb.C=?>]AK7&((Y:%J+.DGQ20WRHG+
UO6-UjPc+O\="nprIUrKfbRaDEfe+Pt:i(1rM2AT]AhhaAhslVe04I.57Zr<KncH@Dnd`"cg&
apDcTY%<o=VkHoC(`8$AcHgB7P7&m&3.9OEH"TQYGD"LR[/;_:e0(*"j&"[%)So=q=NGY<:&
hfs@nchZHHR;M?.e.V,*gb/N/st]A,onRq;^*l<f3K=7o27VL5'9duGWig>RT75_8%/*\11n*
B_6]A'^(O6JS4(M0q%FoFa#qs&b6J09r[7s:<NXCT3?8ALu$Cc\0Xan.+$Ar!G\dRY=E[Vp=*
CXf"ee\>t?$&6i-2A630\d:G(iNCJG6f(-OHe[?acYrD'8USXFEDlSQ$KETrON;d+1']A?=Zh
]A=Ao1IQ/mWC3?MQp-8=D*6G+b>tpj:hg*;%JP@7)nWd"`KP^JW9-YC1CLh>EtSPt%m,4amNN
?^0Mda]A8"S@i)-E-*@GpM&rG_Tl]ASBB3KR=W?o=i8@`0%>@Mk.s-`2ladMJ6Q`YZZqIlt?g[
-<3_10]AXTZVHa:$u^d<UEe7WDNGb#0&s&)m:M8V9EK1g)2YCe_gU:&e7jZbYlir#(]AT>-5k>
dR:4+X(ICL$&cZ7.Um,W\'CgYHL+FIbQuHA$,t[1Fe'h%u]AE/#IEN6`Kn#,0&0TrM4\kP#Z;
iFSrSIB?GFJI/K'EM5!9)Q';H*5QrE'LVU1$,,q0@6;!*kQ,/.$=-X1Xap1h:/D-89u"CC5G
Ar`>`qd:WN+u<.9^3>ZuI$-)sg:EK/=:kpqbKJ&n@ea[T'0XY3-*%iuUJ)C3hJ2"/tWKl!I@
>(hR1ja#[,RZd*Bl+nVnffQR]AKH\>dVQ+1A.-CJ-k249PHm'Sn.bUZ$97=MsQd>MWDBNb\jK
%+@.sp7FU`40*Y=>^q)-S2MVs<.4k^aQq<.>^`Ai\n*KC>D8(ggN!f\cP?>?1SL^9L2Q8(Uu
qMmO(Rj$jZFf2MI]A$MXBA&M[KNa57Sf]A?p`l)ci.1%Q9>E-KS%baO`D_8TIiQAIGnW_sKM*=
*$$7V+c7AV/CM4p7UR$'a7tGZM)Y'4$Yk4)Og*&lE%.Lrn>C&nRfdrAC<&`9[E?I1o^fR&j;
Gj"rL^sbIJA5IW^?S!p^b,lPi=DMt;DGVi'qAT3?;sSXHg$LM]AO18hT/NdAW4r#PX)K%T_O)
AE7XP%>)Vj`#-dR<a_F1`SNf!GnbQ<mT]A"I>SYfD>fnu0;:R]AZs"l-a<$#ds20]A)!9\Rh[:Z
Gk["&oAB,1QWTn8Phl*((K3<bNsK/VrV``6'D):Y9#QFelO#Ok$X^Rs,[I/&m8XpS[&NLedo
q8E-:OqR0L%=hW[/;*BBE.a.3[D%G]A>%3sUQfdi"d+^KEel1>C7o`RS4rk"_k.nX>1=Ost9m
r;#M0:#bNVd4O2cebX7H<)D)FhH+;!FBoV\1YY"B%Vg_&Krq&%o+3#7il_Hmi8[@Q=aU)3al
OR^1Yc4R`dn()))QC^98K?2RVspS>3"E8Fr@$cjO!H[^;F.W3b"US$qs9T*e[-8NV1c/79`#
CDVp$*9nrpR&a5,Q<l4A8_LiQ6]A)-%ICQV9-D;ZBMja3O5<l#:"P[bsW5h7!`fjX-62/U(U=
44`3=`262(Zq,#"5NdHV6)nD^o95S"j8[il%ZRYN@mWq&2e=EXJdHcqg!/I'HqSa4TFE\Q;9
io9b+eD9Wj^QHiLIcKOCb2]Apk+Xh]AQZU"<JuR>A^.?P8=dmO@gU_b9+%$3/'lJomoUWM68["
5W7aR!en`!^pgB=mS4=V*`)1h508Wc_M>IQZWO(P%h`W4]Ar!H9WO)^T!q3YA+_8I-ggVF$eR
toOXF)9YQhMtCq;W5?ttP;-dO5J*S<'*@.8#QJK:jT&(E'Z0YR&>9oM?I6IG*5f'X)g*;AN)
"mkQ^W)Z:Gl-R,$KHU&9m;&PXr&\UBWRV%Onmn_p>J'(\;$CsVi#^F%beWUt*GUsqlsj]A#qY
:qU.lHAc-=EO!.p,tPK'9^@YqE;28OUFRch7jO95.E_EDta>=sLJpCT#W\)>)/l_aj@^6U0<
ZjY`,:4Ls1tS"NJ]A2l2u>6+]Akam38jRKm4Eui%ikX_X'`G-?n<_8q-qGS7#,[Mc!hW%I-VTU
:gTd7Iq]Aol]ANS&d=S27mF%l=goi5Ej,::/kSs,WgA@CP#(Q9_i%Mm^U=s5U4'"RnB0j20:0A
g</4q%V1kZ:.gRlY2E70:&+>Z)2%V5AT';BE+ApL^a-EiAC\).2h/g:k)g(h(\T<mjoK52[:
YekFHIU?PS4)XrcdA>`OWjBtqH0*_pIYpFu5?ASjWhL0[BK?'[XUpn:EKs+^`ob=(&03L2Fh
<A0$/d'R:Nn^57=N:@;F`A3nb$]AP.W8:R<;4LoQ\TnV?6sBUX"L+N^72aE)ErM[@9c4Q=G**
CDqsT[7<DPkloa>(64CTjo=N!"^H/'p<-S92lHf.[X#)Gs]A5E+Ih,pF3oNnDDL%g)<W:1_fo
H9Kl=Q-FU(nBhEm08%5*J)6]A0Buj;c3tbT';%SjlALiBJTd65R3/G5.\hKRp`H%`,;Om,ahR
bFp^]AEeE:18LYQ4ZE0K4[bb6NN1[$?5)?s7>qq;;dr-Q3j?M/Z]A5#@TmgO9O2Jlf8Lm,gfon
CD4Lf=9N6B*),XeY2F5C_`b0;hW&\1$3&H?aCY<rM(^`;$s6fpFHp^u+6*\'mG,VGj**_ZH]A
K:M@fK/8#Xf9dS1Mm/0L>O%&$VLR=e&l>nM(<9-,%augG^)R^[Cfb%h#0F?O/K=,h^c"`X1G
moHFG3##-<,'o]A@cDuYhB:SU2oEY$R6T[M_L>!Vf8e_e)>0&`XefQ!YSO#\G)U+8^2mZP)5U
O%DT'_mHsCH3pgml,Uch\ZJL$/b;ZYl;@#cW6CW;%Nq63RX@Dk`ImXhn_^P?kG6@\I#g,?]An
PHLQ2<>$K1L03-Z/h`>r\3dORK-)u<Wppc"eeO#Jdn=U.b%aBU_UEA318&1H7So+.RmQf-K<
Se`(&M[;7AF';p`5ciCK:MY/F*\hoR".;,e4\qS3s,$:,8@#`tn3K(Z1Tl?K"\O6`TA]ARtJZ
G>fpAp<_ktu)(Z2TulmsOo:ET,fJP"4FP[MA!nB2!j;<D1`9)X,DgGd=h]A\:jCmf[r8,78_6
#q]AjkCf7&D(8cL3cVscqHe/Z4"hk`Sf(GGrp_Wi!+qJZ!g1M:X)UuYbagK=&(?RsHTd^m:a3
1)q3_1$9KAo9`LVc9]A>!ErG/Wsa?4VGD*P`kE^ZRK2jMhU#0+N+SN:k0sN.IPq4lq<>t@=Gl
.JBE!u;r9s(rM;MM4UEI`!DR.&%s(qi1hcR6.OMtkXFIDm/a58,SN6hho71;j*U_GFR6?K_.
Xe>I)1Bd]A!ocC#*&Grm14Zch^M(P1"faeg1l?Dt.F3mAI7/KCaULFcTKKjVZ^IG-Fkl0u!%i
_=sQgi^=Vkf52Sl;`@;"4uSQc#uB;O0ZVl9O"%JM=Tc">sd-bg^n,-"@!b)5WGm=MMB/AJ4B
n&0?VjOH9AI[f:,NlRUI2HZ"+C&q,qX>CH)(N!@C_:(sg:Fb`Xm<ja8u#r&P6B\)H\iM#TQ/
;=oN+K8(\@\HBK.M/`gr#Jf1n&eSQr\ehViHf6CYP3bn`S0%3$p0n(e@&HIq1JOD0+e7V9<>
1p&1fW&QW0iD&.5b^mdMYDjGcEK2!DB!nG).:Qq`Zp_X2'/o>OO_b;8j;Jq`L^,&Bq<DY/TA
XE*MMH`Y(p_i=JUelVpP1#6Mo"kNT;^#1!ip*_2ArlAfsWqpI),5+@igW$&c5I2?a1\:(:C0
#+c9VKoI#e""8,^W]A,eG5`P_1F":o6uILrb&6_hqd"rP^A)^'kE/B`/[mZ"3$`/`_O?GDNsS
g2kPdY@M'Wi+?&@Bs'Y2Cj>BiqbVbPmP;:jeeJ_>6[@2pJ:5)>kOI*4T-sUcZ[sJ2/"ad1BK
?RuC.pDs("9&jC<_0c:30]A^>fi?2hLRm6afr@j)%bXeUb)U(0$dO;Q'WeOLT!(K,dOKnbU_p
jtjI$\&ilD-Ja;2kU1g1i/]AD2We5^'"SrtK1^#*$nfhVWQcXChk5;nWe9c8X.CB"stHkGa)\
h8lW%*<),n/]At-7`U7+u6Tj\;h-^^K;<Z)kF^&J1Q5Nf487k:^1H^7j9kR/brq7<7JVg_-G6
es+YIGh\Su:JsrMj#6$]Af63s%_dK4c-5aMYZ*e$]ACuJF"cQe9kuZi%9A>J2Y^B,QL71leToJ
(9lSOtN[c4E1sKu:CaRlrGpk`:p<Q@kkt[":0<ThTMefZ]AFi8i\+1X9kCgbk-E&#CiMR?(0o
F3^0p!ZB7Jm]Al_*F_/mm5Mr@pXfh4521e1LNo$q;3fu/^n5+jV$i3lo)L5/^?SfI'ZPf/$]A@
[1o]AKI8f?)km_PS.BBV?P*YG5hG\7PBE\a?g42UU[hPbh2,+f2E-.CnsOPeg.($9)o"=_N_7
Z2E,`5X[1T*r`9]A(CLW?SNB`6A?B&0R.&?#l"_5\1=P5E&F9/JbkWK"[AH5@9@'3]A;1/^;(n
Q3T\UL"MX1.%3O_=t"#pAG6+NRSlJP8js8KrTNAHL[qrU'k&,^;QqA&!\>B6^LZ*Y&oEKK*(
+@>a"he232eq&2%;YPaFY!UZs<.??"G2RH7mroF(M;+<Cd!J49"-Img"J?@0D=(k=/5,?H4"
1"T`ajpmdm7i)PE>W.m)mr/=,qn5]A<ND:*o>UWf\KR#==BtN"<]A$nm"HpdG)H7-HDTe[:npa
KIlkP8i/6rV:48Ig&rB;9L+*%Q>;1:i<H5A2#6g2+<-)-RlX;t."b&;RP$lU@$%W$n"K/F"-
R.3-=XcaGK<^!Vrrq-R#3cB`DCU/HtrE8rrT@BU%=7Tc#gZMm=2ufQJ+(-U@NcfQ$*TAN=]A`
B(2a.#oQlj!'e8Mh9li[=:-IreH4&D9FcS*c<+mM9'Wl[$'3YD6BG?cZck>"\`U&\mp5.f6t
HA`<XlQ%@(b07=3X[&5p'dCgG*Zlku4Rq)OJ:^s95N!8?Nbrah0BmL9qH5p2=&Iqpl,S2*')
Ls?FN+a'h4>Zi8"Fpu4+eN6.CQ(L;N3k,kM)$\8PlA%JgTOr1Yn(;,gHC#lT)P-A7^>o>X7D
"^d><,hSXmWE7d7BY)D0*det.`W6Rm".JPu/5^_KIEs-&.eEO^o+Z32)If285""qpf#N(O.M
7#V&G2#gp^1asbD1_`Ntio?Y+lW[X<Gm`eX(nE\hMpIjHgA2,^ic&9?j>>f/"kMbQXcQ*mDa
I3O$ES`HY3ArG$fmFL+mGo<gT`),RO,mu)#3M`6A%S!cdrTKX4FbO(4*_@DjHX_Gu;'M/o@I
U:O3qR(D`o8b;7O?\TU:>M4hY[7>at-9t88bmX6GnY/5JeHFl>?;<UX$#/gAs:RM*AJXM^>I
Oe[a"cX[.Bs8K+Qnp[Q5h5CoPlh:UW+Y@MnIV8t<\NaSTBQ.sEXA.p7^JAuG2c<Tdtf3mMc`
(8HEsAKs+n;mNC;`(f_%To!6btoT^S!W8Pc5VWiD3laR!%oZ1R>$="IZ%Xelp-UdAVDkhdO2
;'<b)<6gR?M#]A=BDtMPmos0R]AQi*iMs$Q3&Ku`C6G?@3N,ci'`2<a1\d876L/$2@GL[O^[_<
Op?e*fQ0=Jum+7*lM*@-/?7]Ar.ifK;&'ACHuHIs%Xa4d+/s:rjQa&n)j0Op)Nm8~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="960" height="234"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    按价位/按品牌"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    按价位/按品牌"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    按价位/按品牌\"]]></O>
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
<HR F="0" T="0"/>
<FR/>
<HC F="0" T="1"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1152000,1152000,1152000,1152000,1152000,1152000,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,4838700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="2" s="0">
<O>
<![CDATA[分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" cs="2" s="0">
<O t="DSColumn">
<Attributes dsName="销售" columnName="均价段"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex order="1"/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<SortFormula>
<![CDATA[switch($$$,"0-999",1,"1000-1999",2,"2000-2999",3,"3000-3999",4,"4000-4999",5,"5000-5999",6,"6000-6999",7,"7000-7999",8,"8000+",9)]]></SortFormula>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="4" r="0" rs="2" s="1">
<O>
<![CDATA[横向合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="1" rs="5" s="2">
<O t="DSColumn">
<Attributes dsName="销售" columnName="品牌"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="2">
<O>
<![CDATA[型号]]></O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="销售" columnName="自定义分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="3" r="1" s="3">
<O>
<![CDATA[合计/平均]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="1" r="2" s="4">
<O>
<![CDATA[均价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="销售" columnName="均价"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="3" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(C3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="4" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(C3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2" upParentDefault="false"/>
</C>
<C c="1" r="3" s="4">
<O>
<![CDATA[均毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="5">
<O t="DSColumn">
<Attributes dsName="销售" columnName="均毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="3" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(C4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="4" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(C4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2" upParentDefault="false"/>
</C>
<C c="1" r="4" s="4">
<O>
<![CDATA[库存量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" s="4">
<O t="DSColumn">
<Attributes dsName="库存" columnName="数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[自定义分类]]></CNAME>
<Compare op="0">
<ColumnRow column="2" row="1"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="3" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C5)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="4" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C5)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2" upParentDefault="false"/>
</C>
<C c="1" r="5" s="4">
<O>
<![CDATA[销售数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="5" s="8">
<O t="DSColumn">
<Attributes dsName="销售" columnName="数量"/>
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
<Attributes name="sort"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=C2]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="800" height="400"/>
<ReportletName showPI="true">
<![CDATA[/下钻子表/hhsjfx.cpt]]></ReportletName>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="3" r="5" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C6)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="4" r="5" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C6)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2" upParentDefault="false"/>
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
<Background name="ColorBackground" color="-6697729"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-6697729"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
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
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
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
<![CDATA[#0]]></Format>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<j1E;qKT=Jjudid-:iq+K930pQhe9#RD\i*N6qD>AGGh6j8.!1'IqN-FM"(#deV`&d_0qCJ
bX?+9W<38jnC9U&kOT&0X>+6:aX6`coeDIN@?k?[M8-rSD>iYX8':HgS4jlaM=Ym1W9Cip1H
mGf=,/$td*<_p+gi@.S(dR)ua;(4a01Epl=.$q@PY[e]AmJP7#;-?=e%.U(hD)m\,[4c7dq'h
i#`a<jDsY.s#RO\'ApiAU]A,m9@NHFiqk)rY>o4O@I<Rq^%,m$bN%"1au.RZhuA3D0E7c&0Ni
YpmRc/U_!]AH/Fd._\Ap\'NmBbA?S]A<ee8/dB^\3[+3(kmEIq\8j(3FL>sKcLp#N61tDgUg'J
]A+eUeerpKg+4Dn>FbSF$HbIr2P]A>tsdub26A#8230"G2-^VijGnZ4JFg";]A_.q&H(E7-5TM=
:?go-pHIX!=1oXT*S+noqqBrHs%nGb@OiZl^>b+B5<N\^`gqV:cu'^)B2XF-_>t4P^IFPO-D
j3M)#rRLPU]AG?q?S$<CCL1d1r;r6npcmN'1@fPD@jJ/p$fp#;5USLZNEc\Mi3%oL6*k=D,@L
uAhFE[4Y]A5lDV`0%cFP1[\OLj1hA=V=5pLC/KRHfr$;I"QR$8EheVk<TS^0[R_2W!f`0ZXfA
qq\1mJV<DE/;aAIMgm)l0eNYS#+$-BS4a3gk#p;N!?q?6Z8?Ln\6_:@8'=.1.Ef5'hVj^e+f
n\&%WNc\>l#028/5Q:2J#9t8JVT4OsFbcEK+$Bsj0I87H%N#([IO^o_\BasA\L^-=I;I#b?(
:%>*GMT%4.;R5L5U\b))CeM2!8+:J5rNYrBnWXFb_#hY2[S$GL18Ql,LO'+!lri)aXA(bZH=
.+rg/FrP]AhXWqg3r?)INm>ei]AV#`#U%1D-$Y=`^P'q]A@s.5Et[dmZ]AWM[`aGUr'kHeAcnc;5
P^#pO-51TdAGtO>g;A-?NiDN_^&]Aa!4;G40^s>+Pm^_aE`D+%gstFu!S\ji^^\XRQD%Sk0OU
=a.$G*pM?k;QdGU.K;-o3;+Q;K!h3d_\o6#Q^OcVrcn-nl_ooX!J]A"t4mFEtYKq?8>7[#:Zf
$<AkH!UPEGJKIlBo^oR7q"5s:pO:BDEH2QcgVCqXPUj2ud0V.9n;L47>umAW8$nU%$RCU2YC
NPX)!uWk5<Sf&+L=QK_P=s7hWILN]A/=LSgj;5a>l-3F>]Ag+qU&LYO&qmcD&KU[`STk?j95G\
<P'g'/nU6SD1)9:7/jof&[?iOhXtZ5A%[fhi!,XpbZ2skZ2V05u?jGN,:ite=cr':7%/s$SD
(@<-?+C#!VJngd)H*+T]A_`fqM%Wga_kW7]Ak[o9HRjX#c&qEBbi:hD!SF$H(!\RVh3B?OsW.:
YG(oPI5#s?r@,'lT6f@;'XIe`-TD,l"BFJ&lm^rK:gT/4Z5(PP(lkK6M]AU8kF6+brB"hsmR>
UI!rT$pWW<U^cOVpO8(?0E9A<dC"djaEG4VDrg&7"&s-EZ#*W7H%BsmD9-#;Zn1;!g(?qVY]A
b$K"fm>%@sMnXFWO[I?;k?=h^"5fZC]A_j!&B.h#g<+a`;Me'RR'th"S0^Pl=#_Sb+d876Vem
eer]AJmbWbh_F_2f2nX$q(Kh]A/]A`8mR1f7u59W0VJT'59[>R@2Ir[+;Fk(>,MO?u1Bh@a'2gF
"RfNLOS2b2",>=.)Z8*5&c6=-I`YTcnkU6cNbXrI(^fZTTr&J7KXKIWc"h/5Foc'9;;qJ&iQ
R]A/*@lK"`-@_A!"tooI<O&bihHpP0W>=4/ZatfnO2I5genEJR5d,`/6c1A.OW7.4Uj-<6/Tc
U,3#1BJ#@gY%@7jmmr5@3XLglL6:":!b4U*\%i+C$PZ]APUYdk6doN]A\@4EV3:a;=kZD=->'i
Yp&BG<kMYN$(f.P4F'g22j$rjXi*J)-?RD7Hobm5=gt5&7&ZR0+9:/Y]Apqr7Z*(jb@q.T=:D
sV]Aa(JXQ/34UA5N(H(]AXo"Na#f1+$^PW7?3#C!JoTHk(4:N\mSLO<q?iM/#jBWQQ7Qf?074.
q"DC%MIajod>*W>g:^]A9Ibap2/n?*A+nb,,d*/?HELXKjkZ78J-Z\p[l19L<&.IsG9qJ$Er\
NID2%"m-!d+,.]AbmN<cCbW5g]A5@&,\PN1%rHDh9K$:l=/+dTV$.9@giHdc#?U0%7[<oEi'ps
CtnE[G@?j4MG6K,p.!X/@ESJm2tjc9j-t"I3fR.Br>$0k+hJbNR?!20e)";pjD2.HD%698Z`
]A'fP@53!h;9CQ9U#[@mlm[k@4UNV80D/WJ2$iHUF)P79d=4OD)1iGG=hS0k$E9MZ<0=J!n`a
T1t.TpMQ0AP[+i3)k.IAh:3R:JG.-cC/E0/8T1K,IlD*%Oq'iL0epeg,".ts)VZ\WoW.8_1Q
P]A8!)ApRiTkD1!S:IR-W:>4(C-M#V1q-kiCA$7aN:AA1[K`s<DqMSJs-5qXn9>JhZ)1P0C^g
`h3[!]AKL4bIiGmi%5ce>"-pO%<]AHtui4i&jNK%f0EpUgAGWKU3Or"#0="$i`hcn"2Cb'cX0O
DEXOPdDV?WN3p**Zf4?4ZmPB:9bh"/lrZ8a,@RT($*JOAkcoJnrI0=&"QC?8eJr5%f6#Ir&n
8<p/[HWt;oZ)XE#=d#n$8tV%`9uQN(pcWc*Y?.ltDsu4!%O5CC&r9=MLT5Zm[RCfs%t'O/[W
<=)`XW!gF[?m5,D(aDr7OUZh08/`eK>fB.T\,qS.kY7o<mib:'#%6X,ojL6*%ioq:ooKr.<]A
Z7WlVNt>^(dnVl<iG#BN!PY/#Ff7+@7pX#>j^N@0.F<G=ud32Uf[%8aQcr\T:2RX[)A!ScE^
F?XYO&kF8f[GM+E&`AL!Fe9s6l!F6%XCcVUkl;E)#!l?u;V?Yjt!V5h%k&-cK;3dl\^^uO$f
<*>O>XQVI)g)fq4S!0iMm@pcl)t/hMQ$_-H#?Ss1Uud`0PEtkuTCrX^Zke\Iikk84'@C0fH4
_1XDh]AVK"/<KFhS>lY8UM-1LlLoh/)Ou6f7e>jMm[^W;-'a1EA1<P.Qm]A4gC:qhBF@eP]A=UH
Z=md,AL+FIC(Z_J+<`rnKF#V_/,?"VQ'pub5dG"s8s7(/a%2/!gU^[d;J3cu^G3rhbI^e+*D
\Z1g&D=ki-/%9bnMsEWM66;PJPJ42c(RWHadR'*bl-sl-U0Z%_`?ruitB-MIjWDUk13BoPP*
Y(kRsi,OaIIgL>DT:o*NJobUg23BD9u7=,De0EqNTg+#";;5hOHf*k'Sf$tGalaXO!t;\#kW
b8$p!iqBNf9aV-G?7knFajXT1$CMau'X=IR+4ag[Rj%O9o"nr@8s,V]A9=+[IY<*!(OqD<=H<
GTmNNUlH7k9a^CXWh8K7!>!/p'56!MFodj(:BRpu=>DmGba'?-*uudDRtTZI<^0QK%6_^`Ia
5EcBp`24]At)43[`iU$q$2>CN=.3N(["8LiW*^`V_0/%ZF^B2B;uQ`:+=AFi&mJc5f@!A@r"Q
Mg3-NeqrfocFTdF"jON4m/]AG,q($"p".'`_br=H<]AGM/6q)27N))69#T=oGGnnBd0"d:XBVa
aKe@;-L*9U8-j5\kE%:Ra(c+-L8GmGHe4:U4k6P=UC@E==)(;0\QlUOkSB1o=kB6;2X-;H5u
If$^*($sp5b.qt@kTa/G2XaP'1`'s'5&]A*_R/Q:kNtD-J,-ENN0_3GJVHLS[$X%iY\!TaHMa
/'Hs4+*k(P#b?G(R%kX/:Z;!k/P]A_cGl,Ej.c%k7@0)N&ZhK/e*K;2l&E=Kfs$@XjV/8<Nq^
K,qp/+cb*?:BbE_F2KYFiH.s-7Kk[(i*[1%GI,V:U2E(oU5'^f(G^$:NJfkM*bdC).mdh4"\
GPNo<EdF>$*^%<QBB)U$His:DHA,'9Hr!Dn)bhYN82;fIqu5QLA\J#c.CAO9HhZ]AMLV<+>m"
NqgdSg=CcAZ[=@fhmVOg2bFeW_tcP#"+lbUEAI(=+\$O+dZ`MKehq`["m=bojcTnNbTV`.5p
K=UNaa!=`[WHh&sM_N.)Q+9qlT4A!OQ!WHB23dc,;.qDb+$X3nXWsgj:]AnG-;`/!`.Qt!Z7>
oPBKhT'aWNDmr;>ELlUB!13&hfiNjGntoEiHJ0n$Gg=4q_L&la^\76_6cJ8CC@p/VEt2qX,U
259jDTeRrPA;Z03Hl4(;,i=qTD/^LiP2QB61`N`Us_'De_e^Xt3F;4-&jT!;B(73:%Ic2I;p
;4O]APDI?*8]AJoX+IHm2]A/ts&4Nt,cSmQRUAb>V\da'[%ZjIQd7rRduh,Cf;6ui7KhS1PS>/N
omS5:<=![SQ-#A)kW/R@C%N7#hg$;3ed*S_O=+/A-/iJq%F!rDn-%ZZ'J'h+H:TM(=g5&i\5
1"tCuU7>n/e7cmqN`@S/Pica+Q*:A*_I?n!Cdh2h!3Dm_1'Oi5')Y)EU!/VUJ<J28i*`V"0T
2V%c:E5QE:(PSNpq5hco?bh3mZN2k#hNCYkm0Bfo`5/K7JSP;K14WJ0VBcW(s19fQ8'bP4)J
HnC-rq@3,NudLT:r[5#8XJ1$&2#EPci,p8+WVmgssMg%bH*)I,%HWh$E=.hoa@0IGI(S<XJ`
Ak?hL6O#ikt0e*eEPFiPQVbY_aiS7.d-+fihnkd1'H,1gG)"IM=N\@d0]A"#Nb^#h?$pA1:-`
cE8$785-KTK0>;(#^G&Q!/7rhj^Rm#"TJ5"LnT#N[l%to3G#0*d.fU+<le*98s7X-HN.t8BQ
e7l7fZ#no_Ed@/_\5!EJ$a;uCp:Est$F=Pqg!^oa?/%D#.!iAlP46AK"jVlClS]A+1r=dp:Yd
sJlm>`(O"4^\i\DHgePiPrcPRT#edk`VY!L=Mg(bH#e[XIjc,aXLrhlPghWpsiel.t;5,b@l
j9@S"c-6e_4H\bXW!i7jT>@eZp70U5T_F*:>"g\IH!\F/4SsK*+9(s%?S17dB[3_,dVdiBr[
hlET>++Ju[YBof[^$!NQSH-`.'EkchmGR,7oU'ADRt+U_EsRg_k"%lin6hUq1p)[I,S3I<>n
#*QXI_rrpo7VWiL'cam$W0h]AR/ko?tm.XYj,u1>OT\Z1SVp_NEbZ\N]Ag8=TPF_`K@\J95G"7
.CrN-gF*,`g:bmE>>@`hRtYlChK6%1Dg3l_jmQK<R>CPh5\<%:fUg!]ApNY;gDBV&O"EiW*$,
*\m5pF"A]A-c+)]Ac'Q[41Q@b2)f)uKgOEq6N:b<rZ.9UqE!ns(D5OI3p_;a.)L>>LKTJ_TWDF
8bA_L&_OV'n=jqB..7bOM/oNEU2*9^jI!Mr4EXAZo/cR#j>g+!j@>KSC<>-Ea6tK#o9bq"<V
O`\(!^knn;C@nXq*mA8q!jL\A]A!7$Q<6d20_h]A>0;[",CEaZ<\UlTiOF!O>7t*Tt[;Ih40>&
?lEnHD<M9jSmk3I0\>:6PWIT3Z5_/UeMFTqD)PX/ba;P$t%$D>PB!]A'X2llJ"rrF>W28VHZQ
[5:f0IonobMf3)6.aYeG-0GD<]A:<\5S#(S?V_s#e?<8GXUE+;I9qJkil#WRrj=T)%Z#e*fOu
lBdS,/VE>0r"1+RiTJ>mc[.EHT`4@p*Wp<EP.4k%L'94kq\`/$gIIq:=Hhh-6kg.X(F]AqaBa
qTkQ2Ir&B\ujg[=14/i<bY*n^%d0eX)Y:p1,jc6)2O"IS2*g'%;e`l0B)[UM19>FNs'[<ljC
C_=gMjCV<()N=GMAQZ]A%$QKnc[0gD['=S*;^A6E"?4&W0bgWa%?%$P-ff(`j!9&n1QB`e1(E
oJ"kFHj1(YIPSn#R-2EZBcZmm?Xg1dodEGBu-#lMLiPsGCAdHaHg*TN[023LW>MJ!(i:aLHt
-Y":<ITApahT/!F:PK]A.5k=pSY@HepOr%F#&[rEd0INB[QH:MTN0n-Pk^dKP[D19<!eDoB(h
?cXqi6kCH6r#TFI)qtcUr6*rNn5c*jB!nn[$YW%VXan&\k%"e,cJbp.).7;HssY;7"FFlg!Y
kHJ"FNWYC5Y/#_GL)f;p!L:aQ`\#jQMaMIA3ZWB?*':9LZKt#h#[oXIDLVe6CLk8_cMr!.Ff
-_W44qJLR=qsKI@[D2'!/]AK'p)3"3PIBA<>X!Ls@>V:Lp!Og*(/`&<EHF@-\aF1]A^c7c^Qca
6TG`.Rt%ub!fqU>:6H%<UePq#ikUhJ1G6`g^'0Kj8P8l3$Edp7*A-_rB[^64p^6L5\PfbL7n
<V>O%.-]AslQ1c!\%^0DH/L1t-([c<D>Z@^i8>$XLY9r`7Wh,%X&@7!\oFhs<[86cKS`5Zqm8
bnncf#dh\"]A>en):,9MFn<Cg/CUT%!>39VcJtm8mD"''S_us\s`0Zh3,'L(KnO]AjOleB6DJ9
as&O19lqIIQ\nb-$fWQ^P2b.T=QA>I(#8l;\,"TWESW,S)+.Vm.0_&]AJI\&&dXZCgZ\$.i,.
Z`+eM8CYbC@g6GUF0B[TZu8CC[\UoC>;eP#V,-I(U7$amAXiq]Aiug6(Yu3\[Cq_5S4=@h%c8
=5\!J#21iVfO>_3]A/X-0"UF11DBLU'R++1ZTPLPG8s6`1ZO%ZEP"N?NFDm=S>I%O2DRfXb%W
3r+ksOegRukiAcuO.*g2jZ+PA2/)S"fq9Ig,,SL(eS7SV4ne=1q?snC7UCd"jt(B=ojTlQB!
F(_H3AV'?TUKOh`\J@m.Z),o+"tffdMXaIl>"=]AIZ9O-r?$8"ZN"u57H49Fm1HudSD+U4qYA
Q(5hsVS`_#NWl!a6f?21TrF/;e,uNCaq;>DJ8gBE6c2/&?s3Rs:q&$'OmL'ERJ>mUb-!#!Jk
(B44ft-c7o'kT5-_a/_jH><o6jHd.NfT/ZckmSXaU/k!BROq#6JpMfh5DGf2nueQZs<hl:+f
(MFh9/b%Q=_8;80k4#Hg6nBfp+Q9hB&(X!O59+TsAo+OI/OK<?"K4<$'f!.@4)ph[X5jIo:,
m:iYJYQR2\@/S*0R/L:-m=W^h5KX$W4uGj+N8#Au!K.dF=6WBdY&@8^UkDYfOcQ@km:^;O.g
d0k#1!YnD^9.5O$n,5;p7j/gLtS>db#sV7=[J-'qj.(>R$/2U/p,)LMHuCZ)+n$ADp:1U/ao
k'c0BJ%Vf=jg,O+69U=MD[jp9qG-NYR*irsl'6P>WfuH-&LRgAIP,CWE7T*B[p(T5FZlNX@;
9(mOpG&/.L2\gOFGgf,1*ZNXbM4)(8((+*$d_bMnF`$\4_1RgGgYM[BA6SjU8)eWjHDkG6!!
PU86qi-7_XJubY>Y,1+0\fT)]ABP%<j\KF1P*s(PNbPr*qRb$8R#-_*j[p(>/CC\gCm3n6orb
U18#i%NOh-Jg,]AQYk21r(m=(7`cD#A,Lu_2/NE79[69BLTC38A2;GRSReL`C>)o:1`+]Ai\b]A
a@n+<FHZ=$"\L\S55[lXg>STZE:#E:>[YSs/9YAbJZ%1c5E;XmN4d=na!!,<@/p<eiD:j^S@
"?E?M__0lA)4EW,AZ\?*&VqZ"\3W2LPj<6R)CL@<7SV3BIe3t#R+5.HVg2SKQ13buaH.0=U=
mB^9H%()/l*1VaUN(ghlK]A#TA7mk0MY%q1.j&WtG3Ui1:$B";Rb<34ZUP^kbZ9Q.hMsA(*Au
!o;k5?1_rj8=qtc&Y>@YhG[']A?-fr!`]A4ZgR]AaNPSl:CAe.IiF!%]AuK%O&PRSmZ`S`ifh[f8
ln1UfB)t3*Z^$<oEp\$_>$7MS@*t9SScu@M;]A\sqLUk'PI0HsoHcFp(`ldT5^oEo8GmK\(i"
LKH?-;EsOt<o3/.cR@l0R+3d78PQ.bW$o_hQ]A*4&E'\0n%U^Dt<N9l_5,FY-X`28?l;'/spJ
Df/+N_oUmb;F+_fX-*ba7O58W"M8as&BA.*KIL*&[1\FP8SHb'0"(LBW5Zb'PkK#!]AA553^T
7'o4Y]AU9(cr[[!.sNO=1F_D;\f76gkD>;[=e>JpRhZ!3c\AQk?+/6".b+7jYA-Y_nX=R69iY
u*X2abJCtEMPF85/>#Vn9gj%]AI7*t$CaM.U'lQpWI8;O7r=BhjDDo"p!<4\d-d4QlEKFtIqI
K6.?5[I_S\OH+SkW,@b>7g%dm.ZihASHXTd-a0m^4Os3U4]A4)&@L@M>r%UT2E`PehW$t3lSD
c7-$BAXaV=D-?66`u7%5YOa4#&3.gYttk1fmUkN-Rfj,!?:.&kMY3![.sL:b<NW>2.e:A-8A
hC\#8/a?-Kk-\SRPMnklD;;;K#XDg`A<AP50olIU22r'"eqqC\?haI!3<,j9++:m\f4l-#3U
kJ;MV(kD.IY[SeE9&TO2la5/W`+.ZNWZ8.Ou0E(-E0:[T5.9\4/KW395ieI/S3oT`>)SpqS'
e:n!N.X:6t@lf74ba+`=e)_2jO^3Q7AF:&GO;'n1Nb74I;U%=8g^Wd5X-@^P0qE2tj"<PNF7
WRKt#OX<tiQ0aQ.,<.%-*2?J6M_X1*j\/Z[hl@hg=mgm$qjkn%rE<plR"o!r7^mt:T8kYZ:r
mA='fG$I/H3$H?++4aPK>Lf(&R<j5)t\le77OmZYlroCsUq9'VsEL=tNHIRG+0lk7aKDbNB$
N9lg]A2,b*a;e\m8I=L0hm=%o<CY9ra)g6]AQP.@tnFf@b1m+/1!Wds4RNh3+nT,odLPq7<_^Q
IFW'MWtV)*q5uPs#i%4KSuob*,&(EZ1j&3<%9]AKVqffE2B92EB_A[--u/Yb)`2hdXX%N[I_[
5'<g9dbktd8\#j7i;>>hAf<F8c0^?:Tb?%ikSpe8=ipiD"_6:l2KdmAjfIuRG^>lloJ:aO_*
R%pUU@m6-7n6l$8=boj_IpMdn3X4aX,pS<OLh=g#\6Z[0]Aq!2C@2t+Kj\<jN<QK6oiD)8@"9
C>`C]AT,qrG85h]A+4l/3'VE7*`Jj5O<lg02Z@NM9h*a*gM:ag,kSJ+J0gN9P,E4>fde;GJ?0Y
<<U;J@^W(#@+eJ<,\Q[X3/%df/o2SqZV41@rou9iM3Q\Ce8M!.1HA8ml4VBNG4]AtX[d=KI,G
YLaA8sg%2DZ!0L7o9n@mo=$5D%Af9Vqu.DqrrF_7^d;=B(:>e0[P%?K2UK&0B)1Z?m\s#Vk;
/O__S=UeJP1mXjkmC<krYra/*(&;cZ<%'f(1jcE\SNWqD7NMN?8%_l4#f90:aRWH#8\FH58%
*&X8@\(&&6q%=OT.!p$B1%;`(le&DA.b(TC$]A\qtcl5!kbZ\ltdW5]A89TH?uUO76^_V*D^dc
j(gRPOgMh95db$;9-.@eK$*KBI2YoB)9CpV^,$0YU]AX[/XUG3'UeBd'`7`'@TG[3ZO?#*=._
0WEhg8C)g%6\"fAM%Z(($?F2/BQa![i3NRSJEfk,QY)RP_q=SMfZOnn4#]A/[i$nbhcr[o@jI
=85REMPa:DcLq9jtVt!fZH(Y#m[;D(YC-rE2Z_1Ga>iUh?(MV.MpjeRaUdnC"FEm&jL,^e_]A
OiT*r(rQ?6`NdMZ@K21j1D$#5)8/NkKddIAKIeWu36'`H!$Gir_\_p`f.;5d!j)hIMO;&]Ac`
kVc4R_h!@X__iOnkeCrhb,p=pk&E+<8q7&U/"a<h@iECF2N?usD5,@"^F&jsd?.Br6$12ZVg
Fu5;]Ajq*B@5JQTl>]Aa.5EQglmouPqWmUudaCg+WY=Z3.tZaGGJ3r074K_/*/K3e]A+Y)/FfR)
gaBS(mF8O<FTq6=W2mI3aq_k09^%r*cg3CsN1bsPpYKTB[g71"i?@e&^=d$f\]ATAI3oY1OWL
!!QD(>5q%k91>tQ)nfD-f>c0<bU:)M/FGoH1YNJ1HdcX:kdk(j6T[if[8(0qBHN]ASL=&]AB!$
;lA#:qW<f*I;M8m"7mQAO9!33B^45a(J?`=,&K,-(FTF_k#eX8gaG0WqtJGp<:0!7MV>Lf0u
#+s:)I@Br4H>W8:LjI\\0+?cj/5DrN8&5qNm$#*Cl\^o2d"0mM`HPFSBk<P`eau*WnPpMY<(
CrFklR*+dKEf<0ZZ8N=Y4FBB<FZbdX:<Wn=<g<1Ai%A+Du?_<!49AN?-)L^,X`)mDXfsXG\$
3-,;94cWkA'$;uK?KA@T;i,82(Nm=J-FS+lt]Alpd@l('b'ka7P(J\59SL%Wd'7^"sP8!<FU`
:&3S+FZDq%\?BQ.upaAK]Aj!:/ts=E:b8b5>h.pm[.>V;1:p2p";B,<c3QIF*>Ig56D*X]A\VS
l&0\tIc^KjV<VqKS`(^+'^I^=fRp3&o&jBK>#!9U<fd[b!ir^L%K(]A1Ysjp$>3@*:H-&:D/N
d;Yf'M.3,JNh"/_#!AA@K<]Am4deJCfX;DBO%:(MaT%b&f^,]Ac3fBK?r/ar\3.#qXOOYi]ALX5
6!<g:AC#[_#FIc^uMmm"52_ilPVsL.-+lMURo>/VDO#-H7RMhPeo+F;k&>e8kjf2PZl@>YB%
(WTeRP$:aua?&LA!:.9W:2OZ*b<?-)krg_J.?=la2S\Nr9r-nZo5luN2a7QXI1shAH6ahq-#
PeYW5`+mH?0ZKUIt4V\WHiVHqFfpBr:"u^oJ/G=+]ACUMqL0c?q05e:`BHc<!Kq(lN:h^A/!*
R/natqJ\%=;Kk6/_>%ltN)1(]Al9F<rf3$`Sdm5UAPCH3U2L9DPoF_q1iTT[Z49S4-5sqG68+
i($L05/1)0^N%Zn\JRdG//]AkoB?WJ$/qs8pXYq,^C:./J5K[tU?!XVuFZQV*;N.d]AI@l)Y<^
KA_cM_]AX+8uJTLATj]A]A?X]A_R2QT2=.PU2cN+0iIbu:*JPtn+;W58mZXF`<Otl]ANr25RT^U(&
Ge6JI+.Rf9CD.IXc3KrY6C@uQ>883Pld?T">bU(8-OEPFX:Ai5qo'+YMj2@l>WK1;X+&=c:j
B=Buhd:<''ieujBBgRWV,,F2P*7]A-CU9gHo;V1M0u8T:D=T<BVk^XQS(]A!%nRs98F+g!]A%n7
0J-*[7`]A@D<^`eeCn^YeR^"mO!;R=Iu3_uPF"%LFKKVj13f5G)^V&Z+>hC/Ub/AP>f+kKF6#
dHhl8.n<e?fp`#H/'2a!P\RF<&C>$)#3hsme0Tsrgf:G<%HXf.IEk[oVU@!)O(8OSm-cca8;
s@/30IJlg?T_>GT\D'm&3_"LZb=qITl-M"1@JAA(u]AFr>koLP*)H4=ri-[cK\oV*L")N=F?0
d8>)l`@E3:2BYQQ??>7*sBgHk]AU*Ht`3cUu0[@N?&_MecK<(rS,-J+Gs^4YTjZm\uQ%dG:87
_XpV\K4p9:5lMmhRb\NIS]A@@H=C(.Ej`1,,61q]A^W+8CQCIkr(=V%XR47<b%$UhjkGWplO$Q
LEHW_L]A7^'KY0SE%F>_5K>qBG=c?h@#]A/AN\:%6)LZ9!ifrKG?r_8!kl-BodC!frR,kTgsH]A
igIXANpb%1\G*]A'rsO8+;-L[qVV]A4`PL6-]ANKcbAh1bFGQD:a<o0e7!ZhQk94,rA5,HjQPQ^
#$u2.*]A;I9U,XH%$La=VFVqT#TI7dt0b#!@D>^Uq>B%)pEr>VdH&0PU5)FmRXZ/U5a3li4Hr
Xo9rWV_OUgI'FE1/CJ2.f?<Y7WJBZ6WTIc;4bV(ZXErAB&UXa(r/W0E=I2pp[]Ap([#gLAbS]A
qBZbdIS\s*3tqh,Z&<CE,Ils.E*_CP;Dg"Z`dS`Y3D"*GnYVd+Oe#t5cB-YHFm.'m,@/'T5G
V1E7%#"r_1!r\15!I^=0qr^m9'?:6D_C=_@]A"))BZrraG)&o=&rG>]AG)`7[1l=aC5r5g;P8P
Y\p?Z&Ni9_noj`+#@E"C9[D[.pCd=`j.f2%:E4C#IQ`-W_X7OpLNlbV!fW59<?[DY&5>6fXI
%pU1NHu]A5cjlVeX%9p(JF,_g##I+j'?js+IR-^oND+2gX`jghI35XNTAqO>##X1+g-O.oEj-
9BKLBi[bTh0'ZN,KP%B,6G9<X9X7Xck7!gmf^K0&'ipq'P&nn9%8"L%)4oH]API>=,N%*4j'n
7J@l\m7=4`P<[_20LMV2P0f'd-klhkqs]A.LlU`d]A0<0jb.C=?>]AK7&((Y:%J+.DGQ20WRHG+
UO6-UjPc+O\="nprIUrKfbRaDEfe+Pt:i(1rM2AT]AhhaAhslVe04I.57Zr<KncH@Dnd`"cg&
apDcTY%<o=VkHoC(`8$AcHgB7P7&m&3.9OEH"TQYGD"LR[/;_:e0(*"j&"[%)So=q=NGY<:&
hfs@nchZHHR;M?.e.V,*gb/N/st]A,onRq;^*l<f3K=7o27VL5'9duGWig>RT75_8%/*\11n*
B_6]A'^(O6JS4(M0q%FoFa#qs&b6J09r[7s:<NXCT3?8ALu$Cc\0Xan.+$Ar!G\dRY=E[Vp=*
CXf"ee\>t?$&6i-2A630\d:G(iNCJG6f(-OHe[?acYrD'8USXFEDlSQ$KETrON;d+1']A?=Zh
]A=Ao1IQ/mWC3?MQp-8=D*6G+b>tpj:hg*;%JP@7)nWd"`KP^JW9-YC1CLh>EtSPt%m,4amNN
?^0Mda]A8"S@i)-E-*@GpM&rG_Tl]ASBB3KR=W?o=i8@`0%>@Mk.s-`2ladMJ6Q`YZZqIlt?g[
-<3_10]AXTZVHa:$u^d<UEe7WDNGb#0&s&)m:M8V9EK1g)2YCe_gU:&e7jZbYlir#(]AT>-5k>
dR:4+X(ICL$&cZ7.Um,W\'CgYHL+FIbQuHA$,t[1Fe'h%u]AE/#IEN6`Kn#,0&0TrM4\kP#Z;
iFSrSIB?GFJI/K'EM5!9)Q';H*5QrE'LVU1$,,q0@6;!*kQ,/.$=-X1Xap1h:/D-89u"CC5G
Ar`>`qd:WN+u<.9^3>ZuI$-)sg:EK/=:kpqbKJ&n@ea[T'0XY3-*%iuUJ)C3hJ2"/tWKl!I@
>(hR1ja#[,RZd*Bl+nVnffQR]AKH\>dVQ+1A.-CJ-k249PHm'Sn.bUZ$97=MsQd>MWDBNb\jK
%+@.sp7FU`40*Y=>^q)-S2MVs<.4k^aQq<.>^`Ai\n*KC>D8(ggN!f\cP?>?1SL^9L2Q8(Uu
qMmO(Rj$jZFf2MI]A$MXBA&M[KNa57Sf]A?p`l)ci.1%Q9>E-KS%baO`D_8TIiQAIGnW_sKM*=
*$$7V+c7AV/CM4p7UR$'a7tGZM)Y'4$Yk4)Og*&lE%.Lrn>C&nRfdrAC<&`9[E?I1o^fR&j;
Gj"rL^sbIJA5IW^?S!p^b,lPi=DMt;DGVi'qAT3?;sSXHg$LM]AO18hT/NdAW4r#PX)K%T_O)
AE7XP%>)Vj`#-dR<a_F1`SNf!GnbQ<mT]A"I>SYfD>fnu0;:R]AZs"l-a<$#ds20]A)!9\Rh[:Z
Gk["&oAB,1QWTn8Phl*((K3<bNsK/VrV``6'D):Y9#QFelO#Ok$X^Rs,[I/&m8XpS[&NLedo
q8E-:OqR0L%=hW[/;*BBE.a.3[D%G]A>%3sUQfdi"d+^KEel1>C7o`RS4rk"_k.nX>1=Ost9m
r;#M0:#bNVd4O2cebX7H<)D)FhH+;!FBoV\1YY"B%Vg_&Krq&%o+3#7il_Hmi8[@Q=aU)3al
OR^1Yc4R`dn()))QC^98K?2RVspS>3"E8Fr@$cjO!H[^;F.W3b"US$qs9T*e[-8NV1c/79`#
CDVp$*9nrpR&a5,Q<l4A8_LiQ6]A)-%ICQV9-D;ZBMja3O5<l#:"P[bsW5h7!`fjX-62/U(U=
44`3=`262(Zq,#"5NdHV6)nD^o95S"j8[il%ZRYN@mWq&2e=EXJdHcqg!/I'HqSa4TFE\Q;9
io9b+eD9Wj^QHiLIcKOCb2]Apk+Xh]AQZU"<JuR>A^.?P8=dmO@gU_b9+%$3/'lJomoUWM68["
5W7aR!en`!^pgB=mS4=V*`)1h508Wc_M>IQZWO(P%h`W4]Ar!H9WO)^T!q3YA+_8I-ggVF$eR
toOXF)9YQhMtCq;W5?ttP;-dO5J*S<'*@.8#QJK:jT&(E'Z0YR&>9oM?I6IG*5f'X)g*;AN)
"mkQ^W)Z:Gl-R,$KHU&9m;&PXr&\UBWRV%Onmn_p>J'(\;$CsVi#^F%beWUt*GUsqlsj]A#qY
:qU.lHAc-=EO!.p,tPK'9^@YqE;28OUFRch7jO95.E_EDta>=sLJpCT#W\)>)/l_aj@^6U0<
ZjY`,:4Ls1tS"NJ]A2l2u>6+]Akam38jRKm4Eui%ikX_X'`G-?n<_8q-qGS7#,[Mc!hW%I-VTU
:gTd7Iq]Aol]ANS&d=S27mF%l=goi5Ej,::/kSs,WgA@CP#(Q9_i%Mm^U=s5U4'"RnB0j20:0A
g</4q%V1kZ:.gRlY2E70:&+>Z)2%V5AT';BE+ApL^a-EiAC\).2h/g:k)g(h(\T<mjoK52[:
YekFHIU?PS4)XrcdA>`OWjBtqH0*_pIYpFu5?ASjWhL0[BK?'[XUpn:EKs+^`ob=(&03L2Fh
<A0$/d'R:Nn^57=N:@;F`A3nb$]AP.W8:R<;4LoQ\TnV?6sBUX"L+N^72aE)ErM[@9c4Q=G**
CDqsT[7<DPkloa>(64CTjo=N!"^H/'p<-S92lHf.[X#)Gs]A5E+Ih,pF3oNnDDL%g)<W:1_fo
H9Kl=Q-FU(nBhEm08%5*J)6]A0Buj;c3tbT';%SjlALiBJTd65R3/G5.\hKRp`H%`,;Om,ahR
bFp^]AEeE:18LYQ4ZE0K4[bb6NN1[$?5)?s7>qq;;dr-Q3j?M/Z]A5#@TmgO9O2Jlf8Lm,gfon
CD4Lf=9N6B*),XeY2F5C_`b0;hW&\1$3&H?aCY<rM(^`;$s6fpFHp^u+6*\'mG,VGj**_ZH]A
K:M@fK/8#Xf9dS1Mm/0L>O%&$VLR=e&l>nM(<9-,%augG^)R^[Cfb%h#0F?O/K=,h^c"`X1G
moHFG3##-<,'o]A@cDuYhB:SU2oEY$R6T[M_L>!Vf8e_e)>0&`XefQ!YSO#\G)U+8^2mZP)5U
O%DT'_mHsCH3pgml,Uch\ZJL$/b;ZYl;@#cW6CW;%Nq63RX@Dk`ImXhn_^P?kG6@\I#g,?]An
PHLQ2<>$K1L03-Z/h`>r\3dORK-)u<Wppc"eeO#Jdn=U.b%aBU_UEA318&1H7So+.RmQf-K<
Se`(&M[;7AF';p`5ciCK:MY/F*\hoR".;,e4\qS3s,$:,8@#`tn3K(Z1Tl?K"\O6`TA]ARtJZ
G>fpAp<_ktu)(Z2TulmsOo:ET,fJP"4FP[MA!nB2!j;<D1`9)X,DgGd=h]A\:jCmf[r8,78_6
#q]AjkCf7&D(8cL3cVscqHe/Z4"hk`Sf(GGrp_Wi!+qJZ!g1M:X)UuYbagK=&(?RsHTd^m:a3
1)q3_1$9KAo9`LVc9]A>!ErG/Wsa?4VGD*P`kE^ZRK2jMhU#0+N+SN:k0sN.IPq4lq<>t@=Gl
.JBE!u;r9s(rM;MM4UEI`!DR.&%s(qi1hcR6.OMtkXFIDm/a58,SN6hho71;j*U_GFR6?K_.
Xe>I)1Bd]A!ocC#*&Grm14Zch^M(P1"faeg1l?Dt.F3mAI7/KCaULFcTKKjVZ^IG-Fkl0u!%i
_=sQgi^=Vkf52Sl;`@;"4uSQc#uB;O0ZVl9O"%JM=Tc">sd-bg^n,-"@!b)5WGm=MMB/AJ4B
n&0?VjOH9AI[f:,NlRUI2HZ"+C&q,qX>CH)(N!@C_:(sg:Fb`Xm<ja8u#r&P6B\)H\iM#TQ/
;=oN+K8(\@\HBK.M/`gr#Jf1n&eSQr\ehViHf6CYP3bn`S0%3$p0n(e@&HIq1JOD0+e7V9<>
1p&1fW&QW0iD&.5b^mdMYDjGcEK2!DB!nG).:Qq`Zp_X2'/o>OO_b;8j;Jq`L^,&Bq<DY/TA
XE*MMH`Y(p_i=JUelVpP1#6Mo"kNT;^#1!ip*_2ArlAfsWqpI),5+@igW$&c5I2?a1\:(:C0
#+c9VKoI#e""8,^W]A,eG5`P_1F":o6uILrb&6_hqd"rP^A)^'kE/B`/[mZ"3$`/`_O?GDNsS
g2kPdY@M'Wi+?&@Bs'Y2Cj>BiqbVbPmP;:jeeJ_>6[@2pJ:5)>kOI*4T-sUcZ[sJ2/"ad1BK
?RuC.pDs("9&jC<_0c:30]A^>fi?2hLRm6afr@j)%bXeUb)U(0$dO;Q'WeOLT!(K,dOKnbU_p
jtjI$\&ilD-Ja;2kU1g1i/]AD2We5^'"SrtK1^#*$nfhVWQcXChk5;nWe9c8X.CB"stHkGa)\
h8lW%*<),n/]At-7`U7+u6Tj\;h-^^K;<Z)kF^&J1Q5Nf487k:^1H^7j9kR/brq7<7JVg_-G6
es+YIGh\Su:JsrMj#6$]Af63s%_dK4c-5aMYZ*e$]ACuJF"cQe9kuZi%9A>J2Y^B,QL71leToJ
(9lSOtN[c4E1sKu:CaRlrGpk`:p<Q@kkt[":0<ThTMefZ]AFi8i\+1X9kCgbk-E&#CiMR?(0o
F3^0p!ZB7Jm]Al_*F_/mm5Mr@pXfh4521e1LNo$q;3fu/^n5+jV$i3lo)L5/^?SfI'ZPf/$]A@
[1o]AKI8f?)km_PS.BBV?P*YG5hG\7PBE\a?g42UU[hPbh2,+f2E-.CnsOPeg.($9)o"=_N_7
Z2E,`5X[1T*r`9]A(CLW?SNB`6A?B&0R.&?#l"_5\1=P5E&F9/JbkWK"[AH5@9@'3]A;1/^;(n
Q3T\UL"MX1.%3O_=t"#pAG6+NRSlJP8js8KrTNAHL[qrU'k&,^;QqA&!\>B6^LZ*Y&oEKK*(
+@>a"he232eq&2%;YPaFY!UZs<.??"G2RH7mroF(M;+<Cd!J49"-Img"J?@0D=(k=/5,?H4"
1"T`ajpmdm7i)PE>W.m)mr/=,qn5]A<ND:*o>UWf\KR#==BtN"<]A$nm"HpdG)H7-HDTe[:npa
KIlkP8i/6rV:48Ig&rB;9L+*%Q>;1:i<H5A2#6g2+<-)-RlX;t."b&;RP$lU@$%W$n"K/F"-
R.3-=XcaGK<^!Vrrq-R#3cB`DCU/HtrE8rrT@BU%=7Tc#gZMm=2ufQJ+(-U@NcfQ$*TAN=]A`
B(2a.#oQlj!'e8Mh9li[=:-IreH4&D9FcS*c<+mM9'Wl[$'3YD6BG?cZck>"\`U&\mp5.f6t
HA`<XlQ%@(b07=3X[&5p'dCgG*Zlku4Rq)OJ:^s95N!8?Nbrah0BmL9qH5p2=&Iqpl,S2*')
Ls?FN+a'h4>Zi8"Fpu4+eN6.CQ(L;N3k,kM)$\8PlA%JgTOr1Yn(;,gHC#lT)P-A7^>o>X7D
"^d><,hSXmWE7d7BY)D0*det.`W6Rm".JPu/5^_KIEs-&.eEO^o+Z32)If285""qpf#N(O.M
7#V&G2#gp^1asbD1_`Ntio?Y+lW[X<Gm`eX(nE\hMpIjHgA2,^ic&9?j>>f/"kMbQXcQ*mDa
I3O$ES`HY3ArG$fmFL+mGo<gT`),RO,mu)#3M`6A%S!cdrTKX4FbO(4*_@DjHX_Gu;'M/o@I
U:O3qR(D`o8b;7O?\TU:>M4hY[7>at-9t88bmX6GnY/5JeHFl>?;<UX$#/gAs:RM*AJXM^>I
Oe[a"cX[.Bs8K+Qnp[Q5h5CoPlh:UW+Y@MnIV8t<\NaSTBQ.sEXA.p7^JAuG2c<Tdtf3mMc`
(8HEsAKs+n;mNC;`(f_%To!6btoT^S!W8Pc5VWiD3laR!%oZ1R>$="IZ%Xelp-UdAVDkhdO2
;'<b)<6gR?M#]A=BDtMPmos0R]AQi*iMs$Q3&Ku`C6G?@3N,ci'`2<a1\d876L/$2@GL[O^[_<
Op?e*fQ0=Jum+7*lM*@-/?7]Ar.ifK;&'ACHuHIs%Xa4d+/s:rjQa&n)j0Op)Nm8~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="270" width="960" height="270"/>
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
<![CDATA[1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
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
<![CDATA[利润]]></O>
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
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="按价位" columnName="均价段"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="按价位" columnName="数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="按价位" columnName="金额"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="按价位" columnName="利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=c2/b2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=d2/b2]]></Attributes>
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
<![CDATA[m<j7cP?53d)\?_A68)99$H-YZF@IB&<="p:F]At=WWq8'EM?.1%2-T&ZXs#aIZ&D[S7pD_Lnt
rh9FKD-)M;/`/C8;,R'K'8(&Ha@'JIiH7^RX67SrOo7lgNlo[-)i!5Kma.[F]A`UZ_"T!`k?;
/=?$8ZKhh^L0`TB^^]A#hcb[CL%fBF[F]A)Lg0O0t;T+T9BNYJ9dtU+3S3<$m',`SWK"Xo\jZP
f[9;HMfm#qRRdPXaJQZ(V*!0_7#H.-1dGRhjIF!bL#qS]At=T.AsDbc>kqtAs5bQ%('?8lF]A,
a:hj1pAoNpV2E*&C%N!Y6qWc@=fNh(`n"s>W7dk6daZai1i:abSV.SY2Qju1<F!1iA*QXt<)
&gGpfQY%7\&i,'JUgVN`5XdTN;bZ5(;:jEBhB*es#m&55Lkq*'qLdO^Vh!Ob&XO6`PJ`%?AH
C`Hrak4o^VtY<euLAr+5pK)j_L]A(&bcaeYJ6D#@%+'gaZqW.p2(m/S?Y,EZ,2+G<U<nlSbOe
CihpKq6bC%7GU\r#NGV+Sg$QKQRdl#*f5aF+9@Pc6i.%jGL^V.pFqu5!f^ja)m,nQ16X@lp0
2N]A1rn26V*="P5OPf,$;c3V-J8Q%)RO1InE(3-OADEWU"LdTp]Ae.'^_TH!b7P)]Al5Wlb!5M:
8M),Q%'.sm,r1+pZF5>#1=T?s$i1QS`YO/&HT8[iVl7L9PAP0)upQTk-7A![P0=<oJL]AG=03
cPXnMmI8#dbaOE]Ar'79@5YoX'R^>UIW-cY!lYE&Pi;L8N)4-0-MA6)L%\iUHrl2Q*q/Pr@NZ
@tAhoJ3o1b]AJBFpY1FLF1r;D)WBa2>Vi&aK@>&Dk"'`S_c\iR0o8[C6kVs^ZtqU0bgf]A8)HK
Y\j^?2W*R+U]AU#7=&h8(L,mPd=pg!HZ,p3pEFo*scMm-4:rX-5Zq\*&$1Aoc[%V)Wjj[/M):
E\N6<5AK7,*66)nk73;9qOq3Vu1;>5BR.K7d3f?2+Jo#U9jbOeje+V2&3=^j"=d=#sZhX?$5
dmC"K;26s)`hlj]AbD1Vt#D#CV8hX`N!aHLI1\,sUh_,,VtWfQU.'8F8Uf3-<a5o=jal/n1EB
hSQ6$]A/F6h4LQ`7A(WYq+erhn1/'V\dWdFsj\\%E3[-Ro-R+WG`9iJpPZj)Rof#sbUnmYc<t
io(4$V!@gX2Dc?GSbjPsB*EX-@qrrpJt%Wam50.l"?2EJTh?1.J=ph9>("3Yu5Y1^2*i+aUi
l++A%%GoliNaKG%s*n96YY.iXC?\6+D(#eX&G`H(-D&RXICa6-C9PlbQ!)u%&MS>!(,)E)9q
QZC_#0D;&i6cap%mh![NC0Mc="V'j>lpE6"%Fi_kT]A;k9gbF()thf%roAZ3@GemBQh(V!(T=
L/1)!_n)t/k.kPD?"h3!`6>8Jh/Fo@!UBB8#1!?p+_iJ^=q=n&re2iIER<>IgPqgR4NP]A%O3
RNeWWA.$]AUQ<%(sn5IFO^?Du";l8r%QW[Q8n:Y:nJeqkLKq=hlUa-$icqZrodkFO9:(k!b0U
;TJd-<CKMT[Yhh/E;IG-4-R*WpCW)&Vl7[m\Kg@7/J$s0=2PGrcS;Zp-"Pr<qa#\4BBQ[DUb
nKqk+1MYmBUCY@+b#6H8>rl7]AUba"K7K#;\.CtB.`:A\]ALhlbHd'F(pp:7>5H[*'VgfWH3Y-
ILO>9Hnqc28K:XN+I);eS]A03FV5ZE7#50\F)m@MO?-N>#sHC5AC;WH<2W^O*T=aKm5NBg$lD
T'eCEAE-cC&r*?Uo[[M+`4h)1C9e\XV8W@>i'[`ZiM"fD`kVXP3Jb)trQ[dXA'o>lS*3a<%6
YB+lJd`]A8jk^q!pF@/(!qT1I40X#t3B:!,RNmV5#>NWe0PgW2J^0i!ED[#J)^8ai3nYnD[HR
/Ka@gJu1MC]A;A=rWh3UIlZL"&tlA\d'GK+rE.,&'MT1rh>!r/i[)d%U-X;n-VCgDNFEt='on
pPA]AdP.D=S(jWSi!+kbMhh]AXo]AZm#V?(dY4G)c#q2B,+gFF,\cT=;lfjCh>N78n+"Y#%J"fi
=YC.6A#WMre([.>>,ZTm;RMIIa4"FPr-bs>o`4GS-Rop2.ujm<bgP&QQFKb1`&B=%l*M7#9g
SQhdQAbFQQmH&gNX+n_OU)6SI;rd#.+9:D.i9o8WIG6NQg[PA.?5k9r0]A$(7b!isnG@=[ta*
2^%>eY)P2@JBoiR4pn^FbLbVtESD!17.Zgn>EEEXnQIOMMqB#)q'Aisf)A\m2L[$:&&_r6[d
_!_MVf&!AN8e(Us+M0A4pfmmL=a6_kH6DOF.e[G3qWbi#Td5D777S*@I\:#Xn0r*Vr1*PTrO
gkm@,]ALL"omPaT\+HGF_i9":G$$*`0fW:SBr0822?Y\ND:'.]A3t<lKQ:X;`\B52IP*]AIm,3h
c3I.:'(eLl6OBO?V1EZ7#gH17c[F"p;q/i"]A[Z:&7(3NqjcGh,DNr,U5J\tb(p)f<@IlBibM
M0G&0HcNapkY)9&lQ:YKNiP`X6I6>2aifSPG<E0)IB3Y]AK**E#u)U9<"!1E;-@Fc?Ogck"`o
@4bdmI>LrHV`T3`;8jL&()F;1DNR5_p/8nNrZ:_S2)Tm)F3;L(;9nf0CLdRC4Q&\lA#Wa]AiK
F"rJ*59$>]AFt<Inbfm_D[J20)`"?GJ-J7FWneGn5t>3f6"#a-hff72fc0!@/36kTGG@_GMd3
7fHa"9=:%YZU7F,?QfHT6W)c!]AUYYDO*pGXM9X>VuJfE<P6^3U_QlSr(X4D'V3hq[W1hq(lA
^!p'[1k.uY-D-)gZGHH"bV8'\(3UIgkNaqiZOaA+sN,:'j%-BI]A.?a+qY[:MPL'?&trg:e:9
WZ<2i1d-9+_d1_<N+[Q%OqCi8*K?.moraK_,7L!?lB>=Yc=jT>":^!D7"UXYDL72i7+X(Fia
cP;lP]AJeFC,RE\nBqSBp-tBeBc72''Z\>brK5JhUQ5e\lLBg.4?;>3`7;(K56[*'#\Ibh=.1
;OuO`uIGGt)e0ou6cZB,$o-<B@l+0Jo8C.>hPql8g9DPm>5_]AB;'_'lPi27qUKS'Z':ZP-A?
JgNKXF1-Tg:WfkIKG]AVBo%(W<!QClhFiaSK&'!qQ56*o"_Tq9jV(KuQ^S3B`O\h^(Wj*[tQ>
o5N:@?kK5g[$nB2GTb9k33K^[ignF'GQl=iVbg<r.o,dq+J=uK"c$4U_p[iBcUrqq91AZQm+
(N2gcAYG*EmpSc!rpY2eL[)8S%9bh@7QRnt)C5HOB)YY?tB.=A,f%+%*BSP#c<'q?4mJ_U[P
Or"P(\pS+\hIg?*TT^ZQS19\!'7*c,#)Ks=.-g'faHbi;ho4$0NQ7(R?:"4$j$:=M@>Wl_U;
$.FIN2,+ihegcT-X->UkDS?5ln0^+rEEn/MmaD%(2SE(I/+8p\Ak_Y18-0[n\(]Ao@Sg*Hgmo
4j80P6mPB$2R3-M=+[KarCrD%9AL9@5`Hj&]AS.RE.DRU%Mo<M:FC41bg]A9[)tM-pjP;;E_iO
\q%j[U&\ZM\1R;j+[aU.;"dmGc=O;>rq6I*'PAHip3-\bJY4);;XjOma""$R.Ffdp)WG=`r*
Z#gP32$!c^V*Z2+-.061EbCNB#jT$!1H>Mlc9dG>Jlg*8A*/#"ctKQ]A9h7II#A>rX,n#!#te
J<B5@Y;6?s(njr)f=ti7_JnbS8?*4TF#kW=5ARPgWl_(7TW8U8HaQLGD6L7oLCX5\?9NA5&F
HUX8nlkA!p?_TYGSZu!jZ*lG-0qTGtmJ/qS]Ad>Z;`Ma>X#iWOV]A>H+oX"(SKcg"Qg%jTn$db
K#&;jDJC;hjCg$TVj"V>i_ij^J$*#VWR8.mbpEXI7[+(g-%[@b;V3.=KCDm'F<q0keJGo-8b
7:#Hf,;bQm(:k8Fm0`i&iQH63GCeO#&&*j)W.",2_<L4d`_jtIXa_Z<0#QVT5/,&Ccid+1ng
HH=D=>eOEK!#.Xu987D#tE%A/M`>,-g+0\Yp/-:!plokA&gTnX<O0tl5,LX6L&[i?p3@FoHk
id4o$Q90iM6[31R;UmO0Z+tQVeciVLU0RA[`Hq09G1he2"4e/j6@JW9#!RZ-gNpD,SFs<)M%
.B@rS;e^PR*))`CZ.QB\96CWs,=Y3I?3cdH*HY`q<PpXKo^K;T543qmOR\l=jm8:"9L/UT+n
%"rg]AJ''o<Bl]AQW$E;XZV[:!\c(J-d*]ArSK'GS+k96iT]A;Gtp)/Y+g)P\V0e\N6'9+q'n$dd
>!099+tK5ZBnmjd1YHq)]AE0&eE82qNO>9fooQ+or"?%^fM3rLd+Ir(Z0?I,ddOhE,.lpi7O,
ueJNQp%"t6\d<LOfGE;lHO$\,W0D5A]A]ASH@NYm`GiXbU0"Mp3>'=oVc'B#Zt+3V1!F=2Xs3O
nM?'?2@Q96YLjlXZ3KXAQ<`P@Wp&"re_Nf3W3`U3?n`'s9`-m!V+Z\"AYkD<?R<cP,\cJ]A7F
"U+e!:%YD,A2u*c00YVL7^Ap*6gF9\/.7muSa(XnKZDV:]A!YMT4W3oWI:`;!P=uA(9c-).N[
hYiIubVJ-(Upd$fF'/2.;*@e-^Tau:K)77,T@RVlCIAYHG!e&hb^1#HsqHS(6_)gTG)i8)Hp
kQNEVod+9;GH?4@_9q-MlZErO/W9<@l!sMZGfZQ\0C79r;,KGeZOL']AXRq#Ji(>,SinA'T@l
F`R9A)%C*Gk@#]AX?X26-7GQl+Oc5P@tR21#0@$@09lin<?]AC&P&:).E`FiRMbf[7i=Xk1g+g
g8m?4UH5Zd-AF=T3qAdFXBMGb7]A@5LIT1,JQP\;*TD20X%o5o_8!kaTWn*?am5K@brA?)1O_
6XuG)lu)V>ju^m-s*FK'$+kAZm++CBJS*._OsN7Q1]Ab%,[UIh>?4UINK^S8;Xn+Rb.=%+(DS
ZT-D',km:.pl+*,a^1TNaJ:5:F[H/0o[,`AWhPWb27Yb`Kgc_"te=O]Ar?2dEjbS;o%lAD0Vg
@%#,5J>VbK]A>re!j9I&EGS4EGl&[Lp?9A(+Fgs@^M>nt^FbWC]A8r1;ck2s3l[;-$3Y7TGYR_
Zn1pJJ-<(cKjBFKnnVLk8^RYFSAVt:?WMK-jB9JKnWofe_MmrVD$e;k8HSMea+fPn\qEK[e#
HF;jG*..-N:Z30R`@Po4GH;c&kN#aj#-pQ2`OO(NlBXT+n\bJf<qTDSZUM#dr?>]AAp=dKO18
EA!O#=%rf<;kR9_)P^M8lr7Z^^P'(-TR:I'(TI_FT[(bA%BR/Cu;4Tl\6;ROliW07BKoe^>?
:EWfHSeBJiC@_F)##/,%d*kP?lh=/>O`Gb20XmrM-c1Sdr0"%hBSl&_I4:fV"CjuCL32:cQb
.\aT[+N+a&Sh2D8tC%Jb3)HR]AW\^fjL*i@%'GS[nYMbbW,'(YHeo"MS9@:Ro:BjJ(kW&km$/
'`N'tC']A1-BiDl8iKCEb'aj!FCm5P?kWa8+lrFjf^GrF2^k'qN^;TiF\2r-cqT8j@45[4>R5
T=13<n&%_$Cea!$_LU`GBjaNEmhX(236Jr)-HjQC9`R'Ho*@rR&tcAm4CB>I7&ej/.M05J=A
Aem`I;XN,$21Z4b8`j8=&4#3t3o!V#F8XSG#ep+iUH]AT<OIJP@uS[7:H/Eh*dZF5W."\pm1@
aSNdb9@nLIL@^qe=jb:GfanoLGHr26<ndB.Z.ebc=[t0=9p7?H.E?,Y4k]AOAZZ$j,ADajY)h
k/FDDtF_4;o+8+gu)cX0Rp+\\%Vn:E1>pYoe6-Gh8k3VpJ5HNNG(7"MS8;_KDph6L\4U]ATh'
ZqddmAJU]AsZ-g%PZ<Il8tQXaFtR.m`bMLLdY)'YN#[didgrRBL):7,,s2\X!RC9A8Un1;1)Y
;X[)idQ[C;3WQk-f#sMrY-iqco_O:RoI%1V3@\eVAaknedg;img:[DK5aC4Lrik/N$J:c36#
D#o2SULX6b'%[<7(!LXK[+#gHRNr\%K-(rAsh(KRIj,.*;33-2[,'HmdKV"kiGYqE1TtgB[Q
`--'/u6$g,@:%e4/![)KVWS&As1JbY[7&O%,[ZhMAC1=0lmp0WQV:d6(nkg.OWVpeaHK6)qI
*E8`A]AdpFKbF98X&*u$>&EK(apbiL5HIK\b'+SG#ea?YqQ-.>Kp2UQ6PSQ]A6#R4^ZfeVB.X;
-^KeVYUd6kLerCm_pAe2t71=p[B*b'!Lr>nZ3'Zrp86sH9nTD_28bEJZ)TR`5VV1@qeT0JmT
I=h<-*c8'a-f$/$B9Qu#[&@_B#J6p"J`@l^WnkbnVEL#5,9+\A7]AWQF>"IReg:\1JoeFRqf&
),R@+m=OK\KOX$f%pDeh0K#8FL^aH,_-GUL\-&93M.iAE-\Pns6W0Dcrp?s/S>2kkABIEQ?n
E&&`"e]A5M9TO!J(lEVJib-1\o\GMbST'"?a^8E%sJ(-tl)hsO^?#N!0rKqaSRHZf-KU^%sH=
SFt:OUSUnGoB$_H!O!(T8*$GZ^eQ^o:5/9@HmErH,'ejhH5iA/\[KpIV`Z56]Ad[i?"Pnl*:(
,CVu8-+n&hV1jaOtM6?[VTY4U=&C8RZjDZam<N`e;YpO.kI+.B)V]Aoka%\Fae'9WVqXXs@ki
_9G=3=Y2:)DFNcY4a@P&nmh!ScGCl#X'`&##Kr<`Fr/@;W\2i4$_rVW$UI0e(<?;?a@u.dS2
"+'Bot[,8-8g:H!6L&q21g7[ii8/L86UmULjjOq(Wt"-F[M3GBM\.&nIGEbM`ZAY*P#5[(t+
*:&`qodpZ?WpV!L*N`frb4So?JWXKXDS&7?$T0lj-kuBsDV#Hj96o5CrlH3->"$YH=1\<:AM
#)7V1K.b!8k5B`O7KG#^_K_0cG`7V'(kN#R/-ncY!s@G-;"/Ti@9do[*DNEHCcVmQfci.@A_
Qq(5&S)YBpXs%7j87'(6fWbM;d#qT_G#D08k9JhU(`>]A#=!c(!u3pNbc#Yr"__Z1UQ3PU,QN
]A%]A83lE=L]ALi)a#YfSo[R_/WWToh9r%(Q<=h=ggbmpEP$R&O_(gsRAabCLDX?tCQdSd:W]Ai+
@k#eiC@J@@@bHFY"[VNaknA75OL>$;BMOdadmlO"pCD!cq:^BO,lr:@4&2jpD@0X:.)#Li%T
rI:1b3M#:e%_P8sLOrcTBn46J@7cOFO&s)pp-"G(YF]AR;JZZ'2ga8GAZ-.#cr#ZjtK$$#6U?
KQ1Z1!sie]AsY7AmV[?Ya80_B/)Tq8H*`4;M7RX4D#c3eRkFB-MBa@e'q+t=E+=CX7f^n^NE6
-VS_S%2(QQr@$Pl'X?\LUaRJ>[@ajh5c9n2`*HM:4[mbtqFp^Y#Z7<H#Ufl/h"I7r*.;R'nV
q)cu)82Ne[6;HemP$<M]AU,rma<fCj=RSUQ%LJp'XH1HZ:Ng#Xm/qV4$\MEaTjutiPD%OUA9f
WMq-#,!ID&b&crT?M.AfAI>.>2:KC)bnd!H$dLG5pbN]A[)R^5S=30^P"ZBF'%bA$tJ3pbra>
;_NW-%J!2ZeR.oF[$,U]A"l/@SI\333l-dEDM9&(!7E-QK<i9uqS\a#>klMYYl[((^..i*uMh
WT"Dnp=OW+Xh)N<m0uh4%/kj2O!;2'8^Ul`Qs!'\P8ci\'/mI[7tL)Y4VpF,22/,OSpo5;^)
-):(a7Ab?9bk=i:.14.MkD%eZrTjeMJ2,2@E$RXFMpc/d@*H9<C\?h$VKqo"N&8M8nD]A$FH'
DBOtOasrnJPYOdR7LPB`gZ[W-l;tf$ntaLraGAi%]A;>04c3]A128.^NYjF)K8;/R!@JC8%SMu
cNJ('j6(8N`WP(*Zr-k]A>mm7=.2bW]AhppmI>bfC`GDm"1LcNYdKi"fRq-A46iL6`5EQeD[u-
MOS/UhON3I6S-<C![j1MY*q:uI,LeV>0[`9N/shU>_q]Aota++[o]AC4b,LfE7^$ZIMk7kB6.F
Vj!nqJ<4DQ2i0giHo[giiPFt0e0Np[k0IG$011HCR5?mmQ9&:BXFhk#<KI%.Xm%,8p1N2HBV
]A&+^/d"!=4DL^9WWY('nu&fkcnh)$SVJ9L82\4p/5E5h%@HjSm2%S0]A^%Rboo?;,m3K\>#Hs
auM82k)J5P^Q*#ZJEGhZ5oEqSM@K;e5^:"u]A6/T3b2X=Uiq[O1coqdV,9h</GUnLjU[_DQUJ
^JH@n76F<6WKY*d??gr=#5#3%dWOS=ue]AM'ti*Z9qnXbO';51A-%6^f-7#fG>\KqfJGmL>]A.
"nD7ceqDL03If5r;Foql&$i*oSe/peCHZG)=for!ZF7n@Q>$++FRg/jhaQ$=_f5FZ(BKnNrg
JcPZS!B5_'.ML(=FJijknN>/iO9\d9Yb#hUufj6f.rJmVt-?CS<6-hgHcC#NZ'h'qXotT=;=
cT:'T>e,N:u!cf5]A2=ZA]ACq<&.=@7)6/HTC7A1nE$D-YCWq318:&MG_ZV&&^=VJiR:4`LGem
5SNr2763@FDNoDi/s2'I):d[j1oFH%@ILFhPV3A@O5J7.!nrFBG&YD,h6fquFgrp.%pu1)J[
>lfMD_VoPUH@5'DZ>a_r$^!Uj4hDIb^L/O)md1$6X]A0nJcb+%I-^)f(CIs)JM*3-//R@Jr*%
n/tZ?rq6>OA%=O<P3VECWang(\[;bP.SgrW`)l&6GX]AJ4h(MP1MU(AWiSe5,*4#dZ=i$s,&g
)NbF(^57;dj5'a$`pQkMaLeXb(p)L)bld6)WIeRHpBVhgA1!:UV.KA%*?CIE"=sYl[R]AQ48%
;c<*o)#+hd2VBs-'!&mu$M,mYm8BOL:C17RG6CR6_XN4'0La<Y>=\GXSApr6qkb)8=Fk:6,-
4>,UmCJ+AE6,TJ5P0u`rM?73=/RY40UjDL^\_n^Bl^3gFFkq+6"(]A_o3r,M3Po0hDCP;tG^)
oB;UHHDFE;@PA;2g:U6CeR&EIZiWAD]A>L/C]A5XJ$Sasa`h'=o5_D+(fR[%llb^e+TKqmX=Kq
Cb<GM_4DHgW<f&p+_6.CI\+#soK>qH;)79;1*j`id)'2[_M%PQG!r7mV`/t:s5$kMG%[)1"X
uGJC[lj_gLDnB=m30&d87-P,#8B`4Lm]AhZ!TXClN&=ReWJ.k=GB8S<Yo=UUR:XoD3\T%u^H,
mqr_1nf9I5ZLgThE/a[fA>1!-KMDX5PWht5t7q8<mhbK95h-@-YCLgtO:$3>1#-P-\0'P]A+@
!22(<31&.bXU+Tbs-_N-!6QBb3>4N=>2/8*qYm/6Ife\EA_=0oW#=ST/-%'=TkMr0YgD$QMI
?jl5qH\.EfPF;nE=F2"_cKCJ0;@Agj1eVA(!PjP/#Vt0NM#8$^KkPHDMZ4HQLh]A_@`a@!<$M
*rbSn;ZU(h69;/o^!=)2iN)8OZ35mV@7(.U:Qm?<s,eGdQRq-<\me8l4!qrS(3(KZWVre[e'
VIj$p2LtW&T0qJ#-a'[?jVlZPmtQO*ZQ?"nE*iIq:7_h5'8TVA('S"L>hq<n$h[YKt_BL$"L
&t6+o=sMD7I,aGWZ\VN`FWii!)(EHKXqEq;uR#\J>u-'ZSH"4[sm$HBF9[QF#!Q5aks!Y=>N
.4@qRIkoo&*WAI)^7s(F,lqk6*oT_1[67$mL$AV5l?*S)/%c/nl!'!\_Tl9BaKHF;88E0XRr
ShFm12C?=Z*s2mXrDF4:i^`[`*gMF;W>ea;9^Ao\Vs]A9I1A(V9F$_F=*tOY/,2XobMS\+fLq
<LU'G$N]A#=k#"Dgqk?=QD-]AgsYE(89'VHX-irNdNuEitN2I;/@Xq1'&;<8F'OQ-s9eW%K9M.
G%,7[Ue#?mFTTCRRF".Jh;TocNc7Dr;ZpUfuCI.L1@V=gPTSkJQh5u4oTncl2]AD)O7?aI^Z2
<MXNJQmbA9!dI@@EB@E\/rps:4RK2V2#ntY,\AFX#72.&]AZc`;%dECZLG<^F[@C5e0ah0n5L
#&JgrpCXi''>k6ImA_HO[ED+Y4N>nVT3]Ali`,D*ui0H##@`r=/Kbuj%ZLfc#VK`W)NG+OSq;
o?W<LsRGn/&s;9+m+EC*"oAO_<%WE\\ek0bt,R^pMge<?-d0jGUX-%IsN\X[&J"+UPSicD_s
LmS86&h+8sL8$*QLi6G9\JSOJpcAh!-9-9M\s*r?*NK8=58ArLKScue8G#o8;epG>?WscdjS
!2ka<-c]A.&-OQ'qAb$Ui$mfs&Q]AM50h_\C;mC9aeGrZf_b`(O?SKA7T!RB1'PC8\&t/Y1po7
$=(%n#do&HPXlk-!p'F\35^EQB9IhK1`3Y>"d5971RA*S*Mom-.g%BnBeg%*77!W~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="480" y="36" width="480" height="234"/>
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
<BoundsAttr x="0" y="0" width="480" height="36"/>
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
<BoundsAttr x="480" y="0" width="480" height="270"/>
</Widget>
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
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    按品牌\"]]></O>
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
<HC F="0" T="0"/>
<FC/>
<UPFCR COLUMN="true" ROW="false"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2781300,2933700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O t="BiasTextPainter">
<IsBackSlash value="false"/>
<![CDATA[品牌|分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="1">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="品牌"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="自定义分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="0" r="2" s="2">
<O>
<![CDATA[均价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="均价"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="3" s="2">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="4" s="2">
<O>
<![CDATA[均毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="3">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="均毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="5" s="2">
<O>
<![CDATA[库存]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="5" s="4">
<O t="DSColumn">
<Attributes dsName="库存" columnName="数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[自定义分类]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="1"/>
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
<![CDATA[mC[^L;chg?IM5DS9e.64$<7\lBc4nt6q'DM,h?#N;TVm.0a(%4Z7+I@=<o%8C0TE'd+/tC9;
76lU.,G#=[K>F<*9k--'5W&_@co\,7-rU2qiF9;gWG4j7MT[o.,=KlR(edq`3hec?oAWM]A_s
FACE>1/U7['J7m_dj0^H=0TQM?aGM@;!'`JnX7QSrd%]AEFD>di9(JP;Ybu'oR`Hm0#a1dLdX
r%t(PPqHs(G7hXr!M[7Qd/TVIk?/tXn9TZQ_"e:^9TikXd@j96V1'lgfNU'nBC+MDm-qG<KI
+?YMSK8fcM<G.AuHps*=M*2;L.aYq_t30;dnPEEpkSXCIYmFC/qLbY:<jBHgqNgD`(cQnk.X
q?rJj!pYHt/DI[]A;+^Z8K"WP9S(VE[SRnRe4nPiQYus68cW_u:kQTjlI'c84@/cfbh'U@I]AJ
R,N0n5J&GNHW&)*8q<+5.8,+qWi)UKa1KEJT,0gk4k-A7bd[\T'G5;9<WUltfu%p3.TmG!"\
(nY-IW>aB%U!F^t-RYroGhg]A0AK73jGOe;RNZLT#GI0Z4Yj7.qkM%."R.@@kf/:8hGET@hP%
2EQ:e"t%m@PIROp=ajDIsrBB.\re8BILg?]A?$]Ari+l;m:=@#kWd=!DL[PNad5M9W?Z&CSYu&
4'?T=_eqnu2rgf%>:VB]Au(M*A/jR%WBZP)d/V%Jp>I-PQ._Ouk`Fn\Kf)4AUit(==MI#)(ir
O\(Es<a8g2:a[a.2L1m4^9Q$e1rJ6AhF*2R7COj]A0IA4@&"g3db]AA!rN88Y#X)k!)SC1m([m
fgpLu>TZnWLe[)W?IJ?;-trNN-i'Mp]AEbO.W'!oq#]Afd3CO/EqT=^poK2RC)OQrR7SL$+>o`
>)S?2P!7^_tPUl]A4i7Aa"*>48\555hCoI@IpD85J(i!)i4i4Vd6s3Tqp+X6/&f3W`FV:X.'7
2-qW0WCjia/c@Vc97Ld@*+sbig<`HU(NYVVCZN?lMIXQCs0)VWk]A<u2MOQ`5fNGK@=&o3NOb
$ukW'mA)'!"G31o&k]AAM+=JGKs+<pt9k?"sjFoJe@)k]Anog-/RsDcR&_:oXCVeh5@3dQj"o.
o_.2E[lL>KkWrN;Gcq?n@%fHu<.G-68n1i`C2g*A`3G.XHeC9%*fg"N;MQqK5'Z^kEA4jL3X
T\5*?oAM#FC;A69koVEB.e*LB>tYpg_m0?o4KI"9`_\[C7O#?=d3K=mc)%HCV\5@p@#W=+$4
0_<A$$r&R`<&o:7&9jCH>SPrV7$f5A4K*Uub&+FMB>5T`!UH+s#!6)@41VQ:-U-3K;bfHQX:
XNX_`I:m$RHN7me[G*P62tB3DUqM-.pK*hG8D0A!6aHoo$L4eg/";O8!PeF#cs6]A:XN2=MVN
uNR;X!.)\[V(P(`AI(!#TNV/F4WCbWcDfVQMffgjkG^t=FTK#]A@u7u82)7>'[]A..M1Z94NAr
Rp2XE)*6if-AB0V6=52$ko=sH+DXONU2F2pFi<p7)FG]AX>,Ge8.p>]Ap:9GZ-\7;.Mo0J\qp-
gjkn)ptIXVMGL[B:QEOPmnBer3KSI*%M1%e2K$)SZLg*j>e&kguo9)/pKWnt?X><sXJ]Arr36
KPT#)+@OU.QQ:/8O2oo\B:!Z<M=`qXUbIs`:MVY\XRVcS/PKj#G#BRJXhKY$qD.+$)#P@jKK
mW]AUfnELW(u4"GL-G*>HK6ZR!]A,%"=D.P037<01@^b.UF"KkL=VseTnOQ?s_\OlqU+ddC?-j
R`>GsNbTCr?KjVM#-\0W[93`j5>%%a^kVVbFWcQ%a(LRi,qCA'S.aJifcV%-Y?[!-no6K=;2
7@uQXj\#3<)=ecJ>1TgL0G9#)_)rkQ;43Ko.N-XfZYW9`3Q<bj%6%&pk/M=Cmg(..&qki,R%
@\D%F*"'`+c'eHICV6._]A#<&!cCE>N407WBn[f($QY=Hp,/RH>U,Sf$`DlWb)OAQGY)9P=na
3QV52`56B@WKs>Vsh;O#/2_7\3n@G0rg/U3;3[6S80%ZRmMk'8d1B$o0^!h?Dm<*A,LR8`/9
^LPo4!36oXV`e@AGl:QO7i_ojopZmoS`!qfhus/Ue*Za'qjP*"u*Qq0=^Dj\Bj(&_Gf0<qIj
*]Ajb'n/cS_%Cp1`(0dGppZWH$n\#@>V"Ve<PNZXlP(C.K=5F6Jk@46hC`mB6>]AAG_,U+OklD
A&cn)%=.;bH&>^ji!\O=\,K:j-T@0Fp*9GG"c*,'U2?5i91A$j*,T;k?<Cdo`]A!^Zb@Ws]A<u
N$2C'%fK:n3:./&!WrRJ'Z('fqPc!B%-\gnDHNpQp>p]AG?cOCHb7_(RV5OKakcHNd+K?:_JA
g#%D>\9usi;EVn?)rLoY5YopJpZlD#q.&5,:<CL\Z)!n'M.oMgDU*ddrj>3-bJOE"uI>fR/F
Aja*1S-,gLd/l\r29MElU.cHbSXuk,W`R?8/rd1gnS_!lP9m.VQCM,XOrQ^jB0$j-ufZ)YP&
^:CP3gu2q:tdf:VTg74n)%^i`C,B#bWk*kn)"k"&=CCt7GWBn@^HpI`kT=4b!TeePN+l&MKX
'#1>($Q5l"IXXhp=)7)D9r@`ge]A(Yl"n-kj(5Mq6#5jZ4ZcBZ"El'`n<g#==gE<h-0,IJub!
Tah!h=ss&f^'uaUFRogC9AELD6LBo7Bdt,WU2pDg<@)=s_7kM7=,B324psq]ASkEnmd<aWd2B
FVIp>li:3)Ubh=aYo4j(!EQ9b]AXR!!:BMN@*ODe1kYh^b%EP,^`g;-?I8-3.q;NQbj;:aRdr
",,]Ai4K`6&Co!N]AsVYNf!%h;?TbAO*one.M+>V`_d!g/HRA%`6AoZ-lO:&V]AZZ6&'(lfR8fn
ClNqpS13TE^eOfi`N)LHrGhR+tGC2/G&W)_;[8]ARf>Ua#3%:>2bd`R-*t!T2!Cj4V(CTinNM
$@W0'H#mI)d/*T7PPB^7Ba89n:4Y4jb;%RP\4Ye0Jt]AL)e_8-tWJbY"m>*,M*/qfmqRDm%bW
a:6/Adi\2>&eF$*1TUf]AoGsfqUH)J4a,(/=8=)=qO+[k)EA&EO4_O(2:8%ZH9[R=5)@J%La(
X,\$IKPD:O>9G*X&Whlu0]AU@4?RMNY+K]AZ`nc*l4!S5!cBf&s%<ZU`9L84D^I`XSq%Es:7&,
#i.\A\=qQhV&qR#lH+RLIql02g.OTYV'IV2qbd1J8p"g]AT$a]AZlNf4C/%#74t7r#[$]AGdnSu
Jp67&W#WP0uDEKmB)jfX6t:j4Ic9n".anhlJMP>.Cr7J%Col^Nrcb,kOGnuJMs\8lm-hBBW_
4DCsZ@$qk<A)*+%NjAqpCQ21H@keMS`eo0m]AlsHV&9,.HC81iQ"G<F;B=24nkgOgFL9Z24Au
onFRS=n\Sgc[WqTI;qj;Oqg:?lH"cWfb_?&2+=l[BNC>aE=H&<5d_p2G5Cqh9)1GaL^fna[a
+/D7NIRZP$2i2"Mm>%Q5RI?oSqh/uKZqm;fkk]AanU>/b!'==tCO2-l_r5a\r]AViPY=D/QL9%
:nK`4)o!L598;We\9@qY[!]AQE?WLVca&L,E)uUSL3?MH/m\,Bjip;O_@Jq]A.i5LUq0I,N\=T
j)a^u8$Xm6TB<mRYMW*'d7UNO2q>&KlL4,u17h/5)SB9bSQ`\C9X)"Wmo@%+V^Ydu?uTs7jK
SG!S"lG$"K?1'$lE^'[6:oL$;CtKo9cIeDGB7m%'`b!_87]Al3<oq&RYhG9!O?T$]APEd40XX5
)s.'kJH<F0U9nh?tH--OX0"X3u,##DS^cEA&]Ac2.mfH(m`(LFf&JOZE;<bd8.kog=6;c^@%C
M(,0.gVA(7*J3=IuJ>*u+-$*??1$#-`enj,8HaEZd<k3@?6-2+A2b4_K<aU9EX`_^7W3!dAa
$cY_D,:t92=&E(b10Xc_fN_uQ;'J2:a%5MKt]AoEY4gcXS^74mAtUE#j3Wgl[ECSah&Pfbd(H
T;2Z>I#Kl_IT(D:]AtETV5#<dgW21r"R(^Gg$UWNth&j=#:IP^$-*$KS*]AL*3g@C5C1^-]AX0l
\QYpZ70G>XO#g/3`L:_Y4!+5D8[tVCptXD^Ya>_)<Nl.;]Ahr_ERcKoG*SsVka*s8H^X>%=8Y
hr:RWq';H:i(N'Go)Q\tQTX$^sFBLRf>[DM]A"]A^Kd*ZHYk=VeH##m_U+LSi=!q6>H#L)>u&^
LY?EgSm;1$AG(n=;2J855G,GT`:Pa-9hmi@D7@T#.^V!C7ZOJ`t(cqph2j\H<(6n"O/Fl!sf
,ItuK#S!e1$qD/1-VJ_]APs:;dHnLD3r<b]A3R11Jc8HQ]A(QDVfT5pW[DnY3$O/cpGrJ.DpY^/
pYo+OsWbFiP5$'&/BN.ukgK#p%%:5%a_:dEcl<.)<JV1&#3Q,>UT8LlQVEk"p.q<jt&Vh3G0
0NWV?JUZ-=Z?HY0M15L/7;8g*ir6F.iL2#[iBC(7d8^Xu+g1+oq;GAj#@F.B;+i#i8j38PP#
aZ"4e7CK>N#<NjPZO;_TKtV7,]Ac#6u&Q8a%bfO4$X;Sp?#G"ki5*!dHs/a9^)[q(QQ=E$D)n
hP]A['5B/p95j]Am.O#D4@BkPD/*h3lf6)rtb;P@oWna]A!u$7`Rob]As@,sOK`)^\J)bC&:nQd$
.993T#tj5:Hp-IR3s%Q5EJEM'qdrm""IK\ZTHX4'*;Erl@At/NmYu@X?q42l;72TZ8V!!WC[
bOb3T[YB;S5Ue=[6VIE3RkY-S;f3Tg45"q=2+"Efl<65l":R-LSb0.;UFPt6T`.R>ItS'NP(
V'i@BUu1,K_Y,-N@X#uX5u7)l7snSrH[.:mCKpW0YXjP^4+`s`43\uRIj@jYB%=Rt'CMQ1I:
8FfN/*Ut[kjoKX]AL*!J0Ea!#8:<7Q,V?pcW#&-N?K#m.TOC8F1Rhl#8LO<0f*&[AVZGib4p5
"rH[C1D[8VdGqq;oBu/"2Mmn-s-Du'tEuQZaX>^&FV:5i%V)Yf\=(N:(PHIt#mUtBl43OK6N
NKmnZ]A"@6pmdmO%$._n>aHX_7cnH=\rq*>Y*h",`b/F-FN]AV"SG-#ogiuF-FaZ]AuLrbU98>1
GFCH]AU.#I@4+93"fa7-TBsb_Y:J81=Ydimp43G77IJ%$Ra&\Q^rC+fdC?&^=T7:H#7bqQJ89
_F6ZK-rK<0B`7lFmAnXpoJ;&AMQui,AY)R3T/u_J,(TMJ<2ttm.(29K#,GkN*5VJ;[l`VNg%
gB5'd+`>ZJH;D_&ZPD>o'fbfELXV*2lY\M@pF;UkH:]A0t$L/s'/STfCVbIb&Ta\j[@uCP[09
,6?GMl:\fF'G]AF$C`9(6<PNt$pRU5hRrnER.hQ"_Ldp'>-"7nN(eZ@8c9^au:(/SSaf"9aaT
iORcFcZs^JHsY8B9pEb>2HBe<,d'.#@cl1l/lV:l&.#q:71$H&tpb&#7u!$mc.j,A2asum0k
<,Sg+W%T<W$WCM\2JK>2a[;^O;bIHMOk=@e_)_I)6_*Vlhm1n20a'i[0c\M?=rb>O`Q0R(af
XFnK<8]AGe!1LJL:Chs/S>6=U'_.ge1:se>bHt4,1);WDe8-SYdj]A4_9>$'2?EKu7#HbVdtW#
O(1gWC"H8to:]A9ujZP=(>734Gn:4ICj88d3I&&l,+>ul>ReKDgB&N\pLDl'gS;pO^CrkbsJt
^WYP*'8hIU!p^P6QXB[_JJtq^$ErrQ79\?paep0I41HQ$nNA9qP-<&"6bn4k^0TMOImV%V#C
4A5&0c=-#mM>1l0UT)<TFYYd(q5*#T9YA^E,'.Pj-IVh!G)K_kG/>.eRQ/&<f+!CeH(tgE:<
1\5=:8VMgleb>g]A)>OdB=t_%5ie%2qCCqp<d0OGT^^P-T`K\R#=#r#e0*S>Od6[9ns[?>eAG
!9utV%p?D&#k]A6\U///eV3+%gkH#VW:,JO:7fa@kLNlOVFLl[?b+<V)U]Am<MVX'3&BMQ,qUZ
ks6Do]A?lH=o:ud3i*\2\ug4Q?'aV,?H$4ZdmWO!_n1*'DY4]A#0BoDpY1\SBJNN8/=K.1:u./
)N.%%kebXXFLgp1;oO9F'8Z3PF,$OT'1.J?G1RF2<dJT\(73e:Hh:I_"QQM4kfC'["V"K*oK
_gA3!@?;<*4^?cB1?qP24rB!PWIgEq'sgUmXm6?d9so9kN2ZoO%WG6dh,qDKDOX[bQ'(r9$W
%jJ!?[P:S_6taDf#j-4::UHXDaIeGDghQ<1'q3?FRrk_/:6=!FHDZCOBCa/>a1m;)43ab1`J
fb\FK!-QHUh5qhcKKsZOEihCU9bO-M,#@.@>PW+!mP;S/jmes=`;&thL#2d#Rn@jR=@0MTT?
\gl<WTU_g9cSj=8@g"`Pp6la49"#*fuaXHZ.4D^WB8L)L/uT,^$N'pMY?sRO(8qRl`%gaT")
dA(q5[R=cP2-bWi/)8=QFiW6IGDaudj/*7G?od2u7m.43,p9.\i/uP>!eYc]AAn':9>V<E7Yd
)qABikh\G]A8F_dVon?nr/&3E?g*YE[1d#%#?0fjIaU%>K$th;mbp@OZ8qM)pFYc]A2!97.$Y\
j]A@V7'GEet2>WU,6_Bf4uc7G="6_<c^0qUC?9d1q(ZQuR_R]A6<dVH1pRbqrJ'V-PO_LauW7G
`B5U^c)DA)R8H8P:h`>:Ui39(Y^D1:,kpUk<6%/GJMU27>0RG(3p,p7OA7*g/eg_;/mD)<[n
Q%MLMHY#-]A@JIA/6Vjmep@c2@jC*<,p!Q(7"ADfZWr+[2Y.1,Dp$5qu%S*WZCW&]Aat2C\>_c
;SgKP/+(Q1c3ksJo*#Qh;&K+sB/0!B0<``7qG:jW'3@9m&-:/O:adD_CpL(:q+L]AAG@DF[uk
e?"?hB*aW^#"qi8O@K_M`.Adb_s7Vem[,j<W]A[XX!eFbQQp!pC/>5G]AU=t7$A6=ppgc*5!%s
bG8E0-(PlBIWHOa:0A^@hV`HtE=h+p;n8=+"nIN[Vt+_]A@u[?pb=_0nj%]AVI)>M;Y3UGD1B\
rt>d='g+Ep%40jbE]AOmda]AMcP/gD8Q&\B9=`8\7@Je/WsRuEiK['r&".A-*S&#&g1V>G!^\O
Dnf:#M00fm&odiWU^2'.mqaf-kWYkWBmtAqVdqA4/pOO[U_sld464a_*%b?so(b13)DF%fbK
:#L(G%cZb#ZJRq8;fo)#)#:kWr6m*pf,4IuB19M]Agl?&5@B3$Vk3k%'f_A_R0`5moafk^%^K
Y\dldWT+X?R`PQ_`a_5`#u."5SlCBR#W\dj"q(Ae+Y6'F*\gP)D]AoF\N?(sWWp`1]A#1F$$6Z
B%2IL]AE=7d$:/fHAB3Wce=1io<ciZOET4:4\g7hdcZBQ[XSUm^%"BG+u[I&3n\28bVP^9G;?
Qdp^@Xqco)]Auc,]A-U0uaLE:#r1ilpT*S"c?FWJ^d6F;3Qq"lk?OkFkbQi/&MNe1Q(YI<lsH0
TeV_/V0a$7$na*gebLaK9[E\QDuad]AHQW:!gJtB0NBI*\)>H1Q7=Y9T`IH>'@[">TRYQB,D-
djlsWRFgM$Y/igj*VEXI[P&A>Ha\5tD>m@Ps_&`\NOYnJ+<BRIc?gj?JKJ>JMUs'rj6stP"5
%2R:4+'(p>%;ki="'MCcFnFG81;Z'n3(SL(LIX#rG`UIZ3glTckdBle3lD2U]AQOMd[-MBVV-
UGI/JuV3qj05Yh#E%V9Q3%=^:RR-u3V&I=j\1i))ul]Ae\>/j`6R6.T(=Z8"f2R.bu"N8og\(
V^M-npX="XC7_UTc412J[3?>7:l%!k_=SqA/E3t272u-AhEFH>1`12;_gQaWaSYQ%5TNb-:H
+)'S(2N)nou5*MTD)L(-p]ARY%Ip33LL9/Fe?^B6qN^DE;#aS3G1[WPFTSBJ(mp+=\r!\jiM%
%ZMro4]AGq4lZcT9h7*OWuN^8!.EG)%,+S[`O:SsJ?FkEjU;Os%Z)gQBn+P8Ik2&O]AcUXf%N^
Bd&q;aW)('l;]An:/D0&r2s#MFAE;O=ihhC@^86:1C_4\ZV[MO_fiJ%Eq<`m^kRm)[B+h<GOb
KUo>Eem7n2M8koYf:4L^B`[Ij+>e^_WC?fN4lTj36u\Yc:V:uYMUl06a/=;jKm]A^D=)o3)s!
(+/!*QWdMfm6W1J>oCJVq,$D?nsS>7LD;G*hud'!%0`Qu9]AI8%2WGWs4),FR<IYLW5=/$ccm
Nds>B+fRbQUGo"-NJI&HcI[;(<uSRYsJf=@N[d)lu>bm31ob(hLJ#I;NgS1+p7)2>Q:?WJD6
0^,?BJ%P94W[3XjB6d)uRH2'Es@doRa]Ap2Sr2%_>`0N+!5Rph1&*a-%]A5V92$Eo_%Eh;oXhi
F!-!ekgS7FJ%85J,.Z\j6jUtaP6;H!J`m8(U=R494X6=8>"k[piI<H]Ap8A)H3g29?nS+]A.:Z
uqEN`HDDi\Z+e_5qF['Ckdk+<DV=&1*Xlr#KKFl$']A/hV46dI)Y]ADdFNt4-q(^fCG^CW&=H"
kO$?6h*X+,#_@dGlcGGeNd-?Wo9-6a%I@P'a7)d(SC6Ks&[_#6%C<RoPGuGr-<X+R7/0!;MG
u]A^U3X6f4gl;u^V7p:mUBH>@t=l]A9c"X2U6qT2?:'JR@9@H]A_h#n@o/YOrOT\Zlp.3nD8ns,
D1Y$O"dD&@_m#(B+*f9e%p2#El'_kVB9l&/?Y).noZO'4`7Uo`0l^_mP7o3YC2laUR_;+6pe
>3E$"?h"G!0./&5n<fdEd(Cu3&gV*#e)Q%=;EeN8=(/LJj[*!508mTIF*P>>#m<0m"_O`P&9
-KdEVT`Lbt%ZH"p(9G^&o'DKo3aCH(B^\E_@1"9$bP^JSP5EW't@\,US_XoDiB^/DM(>.h,A
g2^h:jj+?qch)UoHKf)m'n-W^EmM,8P-*Qcn1(+rd[5PFoX6D(?Pc]AD"8[mp_cu)Q:q>PK8-
rn`1AR#_CJ=V)j.T6Q0T8fMoE$Z$]AL>QImNh@27_TDbWTIn)*R,Hl[2qOP$Snl5hM1Ra?r(B
1ZAcQ\CK0UF]A;G"U0G3cX4(!/R&fGo&q%a:f?P[e'`?QiWNR%P%Pe*cl;U>hFP-N+t@Nm/0/
WK7a1=Pe,R_;#<H*VK)>`HpHA^cg9Lgrm/2N]A&eX2dA3&p0#!kW[`o+"GutcQsn%Am/N&grV
sgFt$pp]ADF9%Llf>N.;7MQhXY[L+),bjaB9(f>B]AbtMenZN,Mnb]AOZQnI\+nJUTO4h6AOa)8
T":[nDDC6^!tMZ&P+n'mi4SQ<g.%l%c%UqbGsO3nY*X#`8H]AV3hgdu@1ao:@QYoZ(Y*S?-a!
Or=U/Gp%5)p9EKf\kk5fUo@m0$R1a4*M13#o:((osS^;s<A[XNk,5lcr16hr.GL@a%hD`K%>
DP.'JM,cG>2Hqs5%D+u1"k=kUF;Gfe<Tuad1\jQ(8_^d+-:KEN<iIh(?.=/l]A_KLO6fQ%bX>
)X*[hTVb,7a20pM^t]A;;#\;(qM1t+r/1dPW[BUEnV(;)'j56t)uLRQ_70@al`6T-m!VlBH1U
)$4uNK:ec$@N'DXq\FL\pjZr-DYF0;S.[le0qc2$H0Qb)=2+dCV12[t)\0')$?Bjj8'%ZEto
-3B$a/qd%&VE.+HP_i@qjaA0TF#/oN_;A<O=*$APWP+\KBWGCI*Fc!e_4snI2GrItU7.eSqJ
D54E:m2X=YQl9;!2MI63,?:`H[iHY?]AoeDE\-:SnE@80cmB1\I8mS4Xm8.TCo,$Tg:fVIg?*
]A!u9Q/*VmL$5CHlZVr,BN,Qi2Z4R!6Gk$n".cEq17$C@ITjal+t2)9?Q/N_:./+gsVe!\9:;
h&0Ts!8u"d82sD=-A)iicR-;c_&P\+8=!Wd2W84WrY08RCP+LF':e?Kf)OXr]AI;W#XKiD?gE
bP":G#'kJ)e&482]Aq8<"is:MQ^(oI$Q?OH(rln*$<An()b<-a?;Z;g+dX1-M!LO=0mAaLKt8
?IslU^L(Gm@rr[5#-mFT_%Mq;4(.HC`k\(cOl<^U=]AN*_&[%E7+:9+0?u%&)*7sf0*3EMKWh
Hj$,n>^(H>dh\G%ROi7Ia3'=h/j@,JK+6n'hZE&A1<\o>RHsAR8&E:$oBGgFFl`qV]A%o7PZ/
1AXC&LT429RLO0:8;uQ]AI_(@AIbm`+fAIi.pDBW2iCKKW!)L#Kc4l>+8G'+%f=)q:#03F`mS
oNHPm@OnL$=S9sqR7jf?NR/f@#=kR/F`*VLtH#n'm[(0[C*DZ-[;nN9gM')Rbl7LkJ_2t\"(
eJ"kDrF$ICYd]AXAL-g-Q+Kl?J&T;FI[b=4cltVlf2,b7's+1>RT2G)D)M&ute`EHu0=5]A6_2
]AR;C@=@VjPBJoFf/Ig`hd<B3Z5]Ab)']A9^W$4$.#f_QokFHDf;=_-`04[rm0Fhh+IfSs1Pa-M
eeG#[FLkcfL@R*gu6QE%s1X]ASYdXDL&]A3jFXM,#JjHjkF4<&Bok)rX"CCa6Q#\eS*NaE"D`k
/KK*(P\l?B8JkU(K/R5ZrNabR7)]AUtuc4g<YF651?!\3CX"gbW=WWC@AS!pZtkYLKj3G/7@S
oG$q`]A,$<XZkJjiHjm+Y>EJZgEnbDV,[n+-C%bUGA)ZZ>[>B7HTl@r?#Xdr#V_Ksd9@&Ai$u
0NZsBCdGNK&1a-eoLOH^iA=Ylp:)\r;(-8H,H:nQDo]A@/a^eug&0lZoHEE_VRE\0M->,W3o"
.t,77-hq`J+(N@[@24f&G2td<Bm_97+W2h%;6RVO'V(q_j@s)ioAM>='ToPQKE4Gho6D$JO$
GSZ8>5F]A_R%J;nYnkVX&AS*7*9q)./W)_=`R[-:ceIp:L,9i0Js8_:X8tbR^3`D2r@#EL1SF
_g/o5d+PcR6Y<40[;r37*L?15^qY7\DYCpKM4+2F/%I9lH=bdt,80\*\WGs-G.-:01G3q4uQ
F!DR,5VDK8D_t:LIM!nHD"==ofK.9cB1N*g`c:c\L,[X:a=^GT]Ag/TATj,;+FL"E9h9J@<TB
m=o/V.q'e^&O!.q*lb:5rr5lJOe9@7UfcgNd[Mt7#e/_>uD;`msQXtKfe961L`SQ@FXg4S>R
?ETht(\3jDf8R_u,*:D0FlI'XL`qC,Lp^&t&\Q4S<o8rAK@RBD$)1ZV&B5jV6e3N/I]A-bk7@
cjsFS\S4pSrohQLIhu42""=+Cs]AS(=h8]Ap1L(T67>G5M$/E.,(#E/ICjd)D*lugSZ-'41L5;
sn,%660TM/aTb[9oW>r#_<'+KtS@;X.s+T\sL1H=P-g+[ObKjPW`l5`<A0PtLY[hTf@(1HUj
*Tf7:nb(J=6OqS7tdj*VVY;n4(,`fJg3Gq^Sl+T(rd=l45&=&^pZnB[<))Qa+8O(":61pMoA
0r_4@sP+l8]A\EdG"hd=7/1fXrQqb4E.=RnH6&`'9-b^8DH\S:>=jU\b!SOu3Cd]ALT\Xp>(g\
ULuX64lXX,ecl(U+kU+<kjRsnp?V_LM^,.S;[V+($[uF%&coh/-(E)6Nstd!YtlXLR:nU)FQ
'A6aEHL11,jCEmWm<d*nKbZrO1kIi_/,mE?)8)W!bR]A;;6meDG>,p,DZ;i#QPu7%9,aQ/plI
B>1%9%;W"+kDg7@qF5^r@24JT\BH>(7>7IH@jE3]A9B5BrMXnm$Br"$V)qrkLWTAGFBOWh`XT
TF>?FiQp/RgUsNCuX@'d#Y0Vh*8XUns/EKB1.*Q)BeV+3T`rG`ii)N$BYp%4k:?URgb$7s'S
B-@q0pQ[CC#HO4Vmbj^?1YV<Gs^s)?&jjI]ANA?[K5`/-HpLS*1[DR4d1mL9>ug%?qO)9qCit
5@20QMrA=*[_4W<Idntc"/`DsV??:1SC./Khfo$($B''g3]A@rKOS]AWKM0$(.&smXu+'+/o50
jbanJcuO!M8:s@qD9>SSPdq6a<X5jDpM-D;pu/8*'3>kd-MWT$]ApO<Su`ngsWWp5(esU'09W
CBMR`lrnk7Z@3HX*Y:41"C#3'T^gUbNASZdKnSKK@hghS!poVY]A9Ar,eIh$Sf1A7;hcBk/hb
IP]A]AJ)5j>P'CVIERRsBJY.fbL#^/6)s=DFs)fJ#Ie!ClD]Aen7C"W=;e+hrRM.9l9[^Jb9ZVg
0YBn=_7KVZBI4>W"cWP,O9iVk%6,9Fc!NCb+5LU[_`l>%fmaZI;j$_7;-=#*,A"&qjS^sF;T
D^nA-ncr%g]AXM_5A'`&B^f#!SZ+NXd/68a9^qn&ccSk&_??/+rU":rPC]A*(o:]A3bl25]AI=AS
3aMn%@BF-IfrcS]A@T0Zf,*d00mSPLMm+[s7!J\Oo4:7rrUQ"$\;Smqp-0SWX=ZWe_0i%O8L+
<n+b<TH8$jA-s[54db?JE;j@&r)789n63I]AE/qjHJLIe)J@ZC`;mMSqB3!@m\e:Ss\56b-hS
.7tY,)ln0l#I1>#<Q2P3g&6\a&XpUND8=1eQC.U5@A)&9BNp5^H/1hqP`[!!>H=\1%M]AO`/t
_;a>%pdJi)M(dU%H@BjV8_bimuS@@2[<h-J)V4T7IX*=67=WI`_\[b=ulboC/P6*<eCmlJj6
\30duJ/Fl]AN(VQji%<UWpS8d3lMdCdNpmbk"]A@'00icgOnU]A6Yq[W-?VjtY:\g5h1Fsh8&!I
C%sUSf?N:rWU9X.UJom>o\q^s5]AlF]APsdFq"%>otfQ^7lbW.Fhsu6n<a`[F#.GYYj?RGs4*O
.7h\LQ=2XU?Ul^UK7A8BHn6G=@=E>M6'2`;]AZkiF;CgcC>NZ8u)m\@^+r#E3e"7$>P1p=QmF
ll*.k4fh1l/(<sr7@ieV2`W'WKQOR^uZ\TJjSgeS+r>;nZj?K^CRCO]AT)cPe/7EYR0kR3^cl
ktiDR0bO$RIA*m^2+9[Npf"+bWQl]AA=_3tP'pC4r(1rricLS(s[eNNJ(Dp<=+ZU)P\u+o_`.
)_M7j]AC!8PS5-F`F^MrIVR3;]Ap*G6X"]AO6H-XNAqH2KH6Q[6G3g;&>8mse-Dk[`O9*'Dg@-5
FX(rqZZ3Y1r]A+RFs+j?Fj)X?1ab]AEUZqh@]AQG3,C5%@r2<sH1m;iU-@4uc>Q0IrqqmI3TqMi
',PaSMrJQ1YJ]A/m4j5Z#6Rj7*3VP!!1D1^Q,pQcT:fDM5%s$m_XirVicS::Oq6hPa]A(]A8m'Z
rs$';Cm4GLsK<1>9L9J+!h6hMlKd+M20X,^E<:LRN?2#_ir0I3=?VRf\$)(1Z`)RVX0r&r[+
\AY-<7_LYF2SW)hes86g+%T]A4JDNnePl^-ZG^*IPY!f=TA]A/T35Qf/YuTRmP8>AhNkW4YUIc
q\Z$k]A+6^rZ/8n8:1oM<_cpD%S='hrNTq1V5Pje<:&3E&UBj<gPpV/nHrWJ]A\Y&Nci3LoI9-
>J('DZh2hP`:l`()rY@8)edp>Q_\!^&IJ.^GOeihdmJ&?cuo^:5G`jcP*OPtCDD4+]AK0%`aW
25X#j!*qf[700i533-=<SX\h6B)Rr"TaH8(5b*!WFqc(n]AI.rg_P_k(-a46bk\*LL3)E**`+
Jits1+?3lmRCR\&p!4W\EdB?!j.bK`Lg)=T$N/JLi_N<1@48QlIjB9+@RU6P^)-WC<3J,?#b
hH1aa7\=Z-2W&M.E>*>We#BIhbt@jfi7LO*DPID.$d9:nn(iPH2JrEr`^n!$t%iUU[ed-T:q
l-I2*ZsL5!KrIJr^%IjAJm:7;Qa#.q!Uo3$pClN/rj@sQ=5S%L^ebYN8/jGm?nl-U+@W-Z.W
VY;gm*\kK%T`o%[Ta75\DCS/bBlT"e4JG_&RZ]A$8*lQSd_<\0U0A4o=-q2Vd,fLJD;(Q);W6
E5^".&Na@7F^BTtWl[WQm63VE@8ARY_U$PeLEO_J0-b[:lWCt)PT^MpU3T;t,)E**STQV`?T
tdG$_63_WP[)pK`kq+o>D[]AM@\-R7"cHY/Qg9\92B[-aBU6Z>'-.J!+uEKES1DJsa>,fX"6b
2qUDQ`2JuFk59P8nVI8D$oMME-#7PN/u!cI.LF_Id0)pLFS]A7.TAn(G@_ebus(j2]A,;G6^6;
U/\[j/O\5bg4.)GJ$;Dg")7G5[Ze9IJEaB+&1B3fTj\L4L7Nf9cih2,9=h.<C"k9aEOM;*$d
d=H3em^^acJ1kN&b9k$gs.lqW]AF7Z\2r.9u2Pth_BA*Wd=Yo\pf;?!7^ed1fGDhKXFKC_C)1
qYeSMWP/l:_Eul,AfQe;2[*N$:KdUPu]A\WO:Mg=_'SCFl:bYCVP6I?4$E'cWT42mf/D1_'>5
!mY7b,VpLclcn5%&7<[dI2&MX2<uZ08)uN?G=NRL\3i$*:Vb-0t@_Lf<1B3h6Sk6'.1e?Z6K
<,8RM70BOcZJSC1pQ;#hgU''u&eJ5KYU@U_)l1P,uJ$bAY?XD[E<CQ,IqNh*p/G&@rO/<`rG
!'=uE2&X;4;]AhO9D+F]A+Blb06n4Lr#_.-^-)hN*olt<<\_rV6(2_?U29-W_TKm%H*P82C(J2
oY;&d6"TH[KMSn,E7bPX#0^^1;n7'>,S'MDC=/f/*I,=O6nCY(nTk>Qo2EKFl)cHJFe\Y/64
,nDWqojhdNm[bh]AS#C>e\=>%)8JJiY?c3EN9VA8RB(;U`F9XAl8YZ(*S<;ngB,s+nY*!%l1B
Rk0>]A*cT5!K@u&fjgB1,*?ug%LA3=F,O\5co'?c1;]A:F]A9rLRNOY'N$>X_Kmq)c!c'd'--"?
XcSI'-QHf;0t0)N2Vd)IUfj;^:bUQf]A9*,*^"iJZon7@P,i1fshBRXWBJY`dnSqS.`b,:u]A^
YS2qf:C;`)mSEpt]A4mAch-^=a%=Bq1ce=6!S(N&>G/JTM*,Ka[UU<QEQWiXb>O7!Jh[b#3:E
B"6(oW;bPOPbX38eir`eHcVk6*f`7?9N#DIVf>mV?aF%p5rqD<g;U]A-s]AYbp=UpQ-Ya$!e9O
i$%P6Y^)lk!Kid.pq#:<~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="480" height="234"/>
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
<![CDATA[="    按品牌"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="480" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    按品牌"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    按品牌\"]]></O>
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
<HC F="0" T="0"/>
<FC/>
<UPFCR COLUMN="true" ROW="false"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2781300,2933700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O t="BiasTextPainter">
<IsBackSlash value="false"/>
<![CDATA[品牌|分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="1">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="品牌"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="自定义分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="1"/>
</C>
<C c="0" r="2" s="2">
<O>
<![CDATA[均价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="均价"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="3" s="2">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="4" s="2">
<O>
<![CDATA[均毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="3">
<O t="DSColumn">
<Attributes dsName="按品牌" columnName="均毛利"/>
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
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<a1^;cgR0:4tZm.]Ap.QhS@]AG`lc8);6EKul<'q1b)DI@6#.Vl#1Ob$+d]A2le3V'RjUR,F9.
aVk5[o6h=p9cp''(Bm&/?@>!!.*b#t]AS-XgYZ\p@^Kf:ZqYInqYPT\?jbq^@eZ'ID9\H7m@@
;39.ug0*2,-A(0>lh[BL.1]ATdIq9'0(4(YnHf)`ZQ@+5#ArSq;%YV\/Bb_-Yq%F4D=%>ueq#
CB^S0@0FajNAW+oZeK'3PkYTI)_<q%c"V,'OMm62KJNic'qW^C:Cs3NVL6J,joX40tU$c/`U
2N(82D%b8',C^-$Mrb<&.V)-*XV9c%m.NU',HC7Bsi6u$EFY/*grSD1H7-'L:D#]ASm`=O"OY
VS`%tU(DBM8H.qq7ludfd-NNj,3K,Y88"!`(STB\JSUJGP/5_)D\LD!ifsfgBsP.[piq;EY/
XsV6$c2J);!&:`M7(!a<-M$2guggqZBniLAe@dqRF*W&)[41KEYT]A;ZH=W7;L$8g\&Wi6ue,
FDdUf-[g$'mC$mgE[1?VXFqnf8JadH[M1V,jO5;XpEa7hL8/FLJYPYM6glT4ZX/jELTFV08F
+1#hpfI*2@a!(JYWlhT?Di$a3F3q$7>gtK>h^e`C5QuThg_4/KgB.;c9@\sia_$<2Lql89i]A
d\(mS>?VNT=qOVq/FF)(8)Bbi_4.>N"gs0oid=ie2eLSVGQnfr]AO";^lH@*n>F6R(+0B976K
_Nh;`"Dn<39SPYC.D-T;H_HY.=OT\u-R&\]AP%,b#jI,.FesS*XI9<QJlM1Nf>M%:j/ZOgR0&
Xojo''4eP)hhtl%@F'_Te<\6_20b[Id(j'o7,)@6PpM8&g]Au=f'_WDR1/2S[(f(,!MYQ[\e=
T5F&\_%-5(!;eMC50,/QsYaCYVG?QROOWEn\3ULH`Yt/oXF%s(0^TE;OM03"g-I&\9"fpX"$
2>R8Tp*dHG"5t5,&RedidqC3N'1;ad5rAim^*W?6H,ukMOfRA*ZbZpVuZ%)J,:1/)B1>nA9t
=u+m(E/YO2@gPUji3mEJeHD/YTX=]A+oBla/ebo61b)o@XXe36G*($j4@sJ=E$fmN_;Y4#`;.
@XfAi"o'u!'j%_aW66N3g5sI0G(LBVg\p"$4e%rL[Xg0Q+PO+JWBHe:#&IaKIVjLeG9ejpLi
7"eI9I-U8q0HeCT!\.iAo6XN2l\Q3#G,VIFerCVLChdMIDS5l+rhaiSdl*_7<GfDVO25B,N@
K(spm?[Vu#(4kQ2LY."JHn\7d$lN*QeGjFM@KHE!H?n^AFd>R___h$j)84?abOGq&$m5F;rB
_K'e,&*ecka1lC$/g=Tje>]A4&$c,U&ouQf]A$`4P/GnG)@HbpR6:ab>1"@S7'88tac$6YN(HQ
S47X.T?mj"I5Qr-jTT#^NYn[pq+:8HD+XA=n?ZeAl4OgAL:aPL'D^r.O!]A3f6BKu030To%81
0]A4YS8Yu8AKg3@Rab/eCe^iSc4s:t8S4'Q`"F#sHY+V+&?``cX0>,N&'im3Ro]A^_m[dB!U#l
EKCcDb1'^ql/<=>\31%ND]A#V[sih=cZ>(L-bKE0A;.@^S[54`2Yk/lqsgb^N-S+CrJcOc9%Y
401Kh-2SIkSlt8cn"$EN<MGJ^KN.:F1Lm'&J'?5bm@QBP(AB87!k3d>Jk0$?oqU]Ap4>@(t>a
/u=V-bXAt2;Le\6s5^H40>@_*;P$i2F_e.hM@$<.U9=#HpdZ:7CE,Pot3IWBUgXVZ3^'(.(+
)Roc@*X_,C/0Af8e8.Ef=aLb<ejjpIK61[RDqf8j1ur;0?-<(M5I!eadURkgmZ$FZ'%<Mo6=
9n=N>\%!=j;3[OKCE!AZVHVHrjf*Zn:7$:1VFp+UVhTr'\`Qe6IGB'`h+GAPh,Y$P/rl_:SG
W!35Nhul'IM]AK.^NNfFQ4L7CHU]Ai^")O]A]Ad_$nEj[<jRrs_/p_]ATWb6!Wdb#5o&X_3skHR/h
\eJ(mC?Kk2OLnO$&]A$tt-Tb?JRC)S!okA"!*9p6hV799GU>P_I?WeS8L1Oe<[a-I$pABgLT3
7Tbq@854"*i8D]A_Q5K3@:]AYKeTB8H4<<a&S<U2VIQHn]A^%cCl>2mV*NUs2R`l3'gR_/25$/R
r_2]AN]ApK&EjTddEIcVi%^g..SF)T=<$D/'jal#R<OuEQ^PsoAAmIbFRdtY,#f!/l?rNa:gp9
'_CU?:4'5WH,%%TPL++42.c</maW:V+L?f@'ZZWIQ=`5@aLU6+oO_Y)-H#dS%^Y]AU.IK#glh
lR%*:Qo7+Vrg3"b_esa]A:uIPdZLq1*2LF>[OKd<Ek6>fSarnB[ZC:#Uo=R:KkE-8&Cs^5LH(
A-DB:YW#63!^&_/M\0Fk5<$i5$%T/A8eVC`KE@'-"]AP&<:$:^4RY/N/CobZh>j(t,YRZ>sAC
c\]A3hkrP[hi)D';X0e_3o1a`(WVIJ\*J@'%O<CsnKs!t<sB?KN7mjVM/nT3(gFHO!^s+C^ea
S!rV1X)0)E(&<a]A\'J"g4]AI1W7/"qXTaB/:pB/a_$#*A`BYoKk)Q_J<;Xoj6dW5g:m'6spZ5
W!XKEfr+JV>e9o0S1Cf69NT"KPq#LtOED*^Xf<Akbf3V'G)oI[2fbY6r/pue2H:,?p=.-SR)
c$!Ym_=^E\"pWWh8)28aB3B'<E)=djZVVAtZG\M'LX</X)jg-o8aDenHD]AXI>UNi^"/QAaE,
d.&dRRAsf4EWLN+4iU5=oYgG1G4)r$XDgt5X1GW"UH[q&d0rdW\YV)jT\u2EpGC"f?4!:$bE
-D)p1;l$"q#qeAZJVE@W=V*E)J,e@famGf0o-0A)?Jqp6G4>,^!rHB2+?EaK]Am0nok.L6X@i
M1>[(!=-$'LsjHMM@\:APsDi*I$:P@Wg7UsWBWHVW$;M7`mN)Gf2OR.k02e8r5_2T4tAA3CD
3u*mV,`q"]A=*5]A%0kYVEX:?7D,!'nN*\B'Pa?D72aL0V8Iq:9^$Ym-ci/sjLka(N-Chg_#3-
h5DXa;JF3[e*B\e6g>O\n%84f7iEr6lbRdp<Rn*U%+5eD:0n"\I-fQC0LR;l$\c?67&QKhW_
#=3?JB6%X7ih2m1&W.V%K+k9O6oj-&6Jb>VA9-JL33r;R;qid7mQa513\?>1jK5nT9FeF6o<
69lA^)O9i(XIfn<D^Gq"prh;h]AgEB-'qK?]AW>J*-<T<T.no[BepGb_76VsJDjP_C?%rW+c>H
$=0%9Y+hR:&R1!PVK?*+pA!a9HsNU/YnW`/G-BQA$!,/"LHBXTf?(MF:_pO\X&:+6pG4qsf+
4/p,8po(t'-\=CZ?e2n*W.Y46kSXHP3K;'b9b$`3A;*sNE(DTXKjq%!&H\]Apr69@e:D;#VB2
An8b-[ZjK"K=jg[3;9L2:Jje4*Fo^Yl,*`Qh?2NX?UXg$B3?[qVkA`qBPa>ud9fPfWW'.GBH
O`9Q]A)gS4"[A2dtA,2+/)/3b3\&-h:e%?`<olQW?FkQ[5sA!td^7:_'`]AG%>4P7D9PAu]ATPR
VHcR/?mu<Hsa%VO;tk53Fi7h-E!<Y>)?E/>-Gro9noUi`]A3V/CmN]A$i38Rq@mEg,Yg&ou,>,
Qu#bqlnW7LBrp]AO.5;fB*ab>)iNQ")X@RFAE_9`t?OdFD-X5USK%pZ*r.lM#0d<!4,hj\CCW
?W+YI]Aq1Ce9GH**ARgNb03s-(j_[eT3XF7*l!":#fela2T;<:PaMZSTX.SX6>eFNYLMFj]A#=
b]AR7diWp=UE6#:ALFPj80F6)8G'7RirCJ#se0glC=sJG3Y<aQ.>;6M&)n$"]AOSi$d>J#:/d1
=FOdjSaA\o,[ju(rP!T/#\VM2`#_PO;%nSdE]AHu$^jgCO?E',pNF!&e=XefcD\=PXmom.CWB
iutC]AIr??Z)Z"3;\SWSM02baXqnKEOeG71\=D9FDB0gbM*NOiWBOSCG?O7=3dpM>e2gS0DC;
#l`04Pe--qPs^Cr]A/_K/lbN\pIN3`"9N^P0g]AVu]Akt%ahY&Zu`</NM.X>)Mj??T?!McEPS-r
%704GgCY?#_JghjJ!?:XGFHXT`9(-tNK"D>D96s)8/X,roRmNOgbHP:I0]A@D2Pp+&2eu0rTU
.4/]AoeKuF[3LY[H:ku\p+!k<T"l>>`3X0PZBbUT^*iEAZXQcDE.7p:I/ZS[\r/q@Cn1)cf\i
bTPl+e04H\`"Y$X'QdL<-W5"_uROB%.NjabBn_-_0W?nArCHH\0F7_fZ)*C1RU3T3K,$Q;b)
;)d*WQ7]AIf<Sj:))"n`>S^C:q(&ElGRRr=%p1_U0uP&EN60bng$t/EI>HMI,(7?HJZdXoW9)
I0p8(Ve/mVk$Urlts=+98!:lBen9Xh;lP8+B/$Pt\_2koVJmVr[+C>sGi*<K:V7fP)oO]A`!V
D?]AdP]AO&Pp`'``@d'Rf,+NTZ$pQEfS;>6cl.]Ab/>4O;L<Ab->`'Hps:+E]A'9ZPROJrRD2g>O
[a8BCa8o4^ZRXc<?ctg5NmZmQ0AVNr8iFs4A!@#mB'a_qs&-'tc><.TRRcW:AGC:1]AXo]A_Pn
FH0q&mFoQfKN(%X'1Yr)F5:LqBZR1r]Ad3f[.\1+nN#+@o]A;c9F:rtkkOVjorWJ;2clO,"BnJ
AG]A;a*V<GYmIq%WYli"&3OXEr^=YG_^.Sp%5ans*up@"I(%:phE+!SF6Wb/W@Re7gh8&V:_l
rjZ217H;W^/!T^llgmm_A4KeXs@9V^D8Z=9X'`^or0=]A=TuA%hQrahrG>HP>!>4(ZFK;S&,8
nk`$F.22KT8Yfg'%L,QsZC.N17j\P)pm=W^1Ut*&Xu%da:fVe/Lf>p\3f9CH):J,N1Q+I1I+
R4=JL;W7R9c^9NebamhsAT5:DoC1h<B]A0pnKOs1ihr(cl8kq:`.f$jL\bjZ)uio<ujOONpA]A
&02P?7MWU%+IE?e]A]Al&poO#;'8"$R"8pJAK+a-#m!hFpj%NSWeK`Y=NP95T9`p7TCr#bnUYY
Tb`a;7,H/*o9-UR,2b1k`]AOk;<`1l++#$NO%l^O'ra=(mqekjPisT,ZsX5fM4ui*_Ta;,lcP
L\1j8B.1?Z.;nWk6h*6`0,1`]Ab^U:1es&u*hM"(hGJ;8VaG"R.!>19kj9@atL3qMJ"*OtG^G
E-&@PR9(l,Cl55IG+btubUT88E!Hb0(?lR*'[ducnIKeNbcR-e:Y2)sDPVm$,2KGH@+;B33.
@c2O9+8Z.r8P#hPuFdqNKlR'MO%4_I`m/L&jDd@e\jQ+Tt?X,Vnmt"YMB)R;[hE"^2oqNC07
8<O0ff;:iqSqXBk!1]ADLu1_&34]A>0P+X_s3J+1Kq+We@@Q#$Y;/hbj\Rr=@=2IY]AoT!h$$k<
0TF@MKPI0!L%'Q=DNC+5Qrr/VS.4OPEYf!Q"Q=Nl!>kL0cc1`C<TRM(7hne.hR`REcko//3o
70A@tlE$,nmRaM2)>"YGP\gZB6=:\!Zn>G\i"4&7PrYsg@b6K>K.A6.OZkW5F]AeWibX>$)8@
>nglMr=Dng`61N@f1V*)$a]AR8%a%C:S]AErb761#2*:qO@>$9iEGT=rHe-Ua4m1O/.8Q/<Mc+
t6DRB(s\$F?K2`\`s'bUn\/1!k\#X41jU.$^PV55It<-e`TPmHkCf9HrFdA8Rm"\0pU79QD(
Mn]AETMM$q\]AeX"UVYHZN=+\.)-q4au90ZE^X:"Y:ll\@W%fY(8Pr,-RZI_VgaU+c/aX#aBpS
=f-fN5@P?8I#U_Fc\BCAe>LVnY_[:CiS+=*NieDcl(N[5G7a'05SUHHB[d&bGtF5W;-H?-e\
(NSMLZ1\cS\!KFm6c+E(?>7#R]ABge`%I:_6W]APub@&gh^<6,2X<k5Bqm)ZAWD]A*9[dU.uW?*
#L=TeV^ZeM-f09PV(EC6_@RhHk[CC&fnaN-SoQC+H?.<+`mhe7c,nY+MNJ@IKc<Y:Q?r_Wrd
F)\<A.)GYUO8u0,WEdmR1%$\pA6q(ec0+]AGn^FHQXMRVkKDJK'4H,-O4/DHUF[e1$:A#,AP6
Xje@"9Lp3]A)/YqT.DiZ?$?Il4WWk'&u@\\)?eJG2/SOBn<^^hG_LaF-.lO-^)@=,%ZaHdB?"
d&!N6*[k6!93C21n>)UX$V^=>Ugq;Y>5=^h1gkG>KB+LiSn9=OX/t&D2gj1+JeHs7\"17G@X
s/)g$.@)-Gu1&f%$rKI[aL*>t^M.&qC6=Ve0L@&3#:DM)pR.PT]ALp[hipBR=R-KpWsK8FkH[
pI37.?\Hf[F";ek]AuTin?sjpb\6O'<SZl5%9ilk2;N3!mBGO9uj[&Ks?f$dsF"r>nF31D/)6
<>R<F^P.Ss'tG82QN#dR)@qXEhO/NT]A*XV<YA>R-^ccCCZ<Pn^;;4M+NsAOHlhm\pD^Lae8K
N2]AWdQ-!AcmF'R;W<S[9hg_'Qj2_n[B!**8'*Y>R-(XK*Q;2Oug#jNgs\DU*MCHboIQ.3NR!
/+:?V%M7Q"Y6THHO%e5`KHCZ717ZTIYp\_JK]A3,h+Qip2p76)]A#,!WU8MC;<t/030+kkGhWI
17B.`RoUF"=VZ&%?nB"Z@>,LO^g%"3W5A(F1fB=#L"4%i+#.8:hlnZjZ__)&P(\f5k`hoUF%
GsQgY#LSk@0q?'30h:B;Q+EB8XZ]A[BpQ4eTeL"nFKdtlp!6_Ir+cl$9Ni.%]AD(Ph^PeTJ/V/
(KkWMn"`SuV6-o5eHD6"l"4h"@_#^9-X<67UiD<5FB+=]A^/(gp+qNS!1]A%q.dAQn&@"H\FnJ
64D;u7rd),'J<L$^!kLt"m/bKL:/O04nq1N\-V*H^+8+O$98-?(Wlad6!SNHS8^Q4PN:b^F(
'tn]AZgik:X[i:6!_?;rniK-l2Vf(6c$g2XGg7:Ng`AR?+\`-a,+Jlg?AeCCT7c+4B[ZO`S!&
DT&U2r&Z>a@N5?.Osmu4/S<Bfl'4*^u2n0shnJ.]AM1khc()#S%<61"DX>o%;n<#nZ<'>T[he
oj_J,f%bnNS_S72[PLCFHQ)(P8)F6_r<H[qmoD=Q;/tNbrW0VXBm,pf1-X.(Ptbnr:>1UF=(
FB=;Z\t]Act>(EQOAu#Wo/V-qFc\@Rr'M@boD*#D4%%P8A/I`?h3m:QLfPkKh?^^5Y(?>-Z;U
OFBssf=)bU#(QXB^O&XmT%P0SQ6@CFR.L,K;9Dk=:Acq!Qke9fL_&5&rVjgL"nnt^<7Dc<Qd
&m`T#f5SM<OfCq?ukdCf*d]A=!o!lNbad_,OTFPAVVI0Rl#BQXH/5Ak8ls2\At:4->Y<ke3tN
cc/)[ZQeY3UI15[iks/\uOY,e*oc>bGqiPS]A5>WEJOm+=8ARS3-B@:uA,\SAQrl*hmO9c<K*
H,p`-oWoqdNeLIqA]AH.;C/s_-h77pS0FN,/SR6)ZJX60"4SA"kb8Vtt*aSn*NUHt7J0k.5ZP
=IsR%Ad0,.V(f)tuS#Z/W&ArHAj.K`e1#rEK`[mAuFDhP@na`\QiuYuY53Y/&be,0T&m:3ef
b_,Pns"F@]AM^9V-ekS%WZ@@KQD"1EKnl3+^\@kOubEP:d"SJSCq-0)(!]Aom+M3/ap]A<H3;6"
&4H%q.:7`N&qbV`7O>Hd5SFNrd[t\pCt3_7U_PE7;#C$XDVREHdXP>;U#G-'DsHbiUlkm,lp
Xge65W:dV\E-FD358866Aj4,1KYWIM?5qK+--hojIY;#&OAe,p_\o$VBV"]Ah;h/q0':eWq`\
&=JC:cOHA"FT8O;c@O(D)o;AS$DhqFNf8qD^WK4>SL#Aa;6uO]Am`E<&C,Y0&II<r5b2`S'3<
:,R!kp[4B\5JCkb@[keS_ag82Lu56N37aY(HCK[tU/Eou=Q`pZ0r2g0<*=9[X##FAjRK.-Q[
RK23;VH/V"34fVn*R+E<RkCDWTe+6L4A`nP&Ku,gm7'4p1M!XolWpiAR5&[onf]A1Gt,$!M\1
)lu&ECm!tKqTGF+_q&B_!;`jp0jPc-m9F)(r]ARQNe9ae$<90b+=\p;VT#.6R=X"A6##s%0ft
]AQ3AAUMS$`#BVO-M#&JmN\Elq?.,MB9]AMg3`lM&VEpW#FJF(Or_p<PQS,X=G4Yfm?IK7.Sq=
m=[sagE&3?TJ+.'P!\AZZDQe<(=b1(?+0P&J.lD2<Q(RJI:oK7``Z]A/.8Oc:M>K9si#L<]AKr
PM*.A8#@!"7@s.sPR<<t<+>9de_1SlpN8GGL;pN"_JTD]A>He2jI38eBDZgFC[q;3sujK[+UA
FaMIh26lb/`_XctG@q61dHQ."DPK*#*Uu5E<^6clF:TQ\"Jh@%N^]A]ABd\K='^`oZWh*(s->[
^NZ2a?c<]Al'dmWrUu8tdJ[Pc)VUV)T\+CWHb`",>"^0I?So42)RbLoZc:uPHNMc"W:(42klg
)XBl^FR)"dKt)sE0b","#_"L$G:"8jOY=H3"`+@2@8nU>B12]AR32/C^T%DYd+VUs))nDU-6I
]AA?-^5sat>qJ]At3`+!/T[T\F77Lm0%-&bQ=``08om)>:Sk)n$bWe8aG"p6tL@X1[_E.A1(]Aj
A%&M+f[=7%Zn,G89(jo*`Z8CY1ln$+e:J;8+1`njc[KgQc&UEcI.e]AP!&*JD!V7>:ZnmdShe
_Q1@,+N=!RrLq)#0QPN88c1C0d_R:kmah4S7`>l+*gC=6b>b8Y(LEF9<"K-4>WhSFZCrKXca
oh@fC+grVo$]A^,k);mXo&n(RPht0nV.E!Wq[FLtZArc%bDA!]A:0`*rG87hGMdGL\[M.9hqoM
_H<'H"t&&_Q=cR[$Sk_1H!M:r!*SnCUDI]ACu&Hl)@.m*XX>de_AVJ`SW$^'.UX%(*8%%3Cm@
fF9",4\.K5/,nk[6$UMqO3$pi$HuW3<Hr"@)J&AE=s8So/FbVR<n;Le^3!^I7%o!B.RA%$6u
jT5VfW4*\jd_slAac%Y!l8o<LQOJSOWj;o,E%]AH5Tsn>_K%H5U9Ac;C44eZQnLLj&tc7o:T4
N<=s<,&&mc*4h.uDjMI(AGfrb1Nf9`>9+rGOc2OJRes-c-MYgW'NS)i#c[8Q>lLMh"j9gqj'
?X<n89NVnCnh=F,Hf:U=l)<'PdN]AN)(UbeUNm435+@OOP?(]A+of+I/B^1]A8(s+<6WWZ.]Al@?
b4\%\'m]AV[LF^PY$;,8%q(G7$E_#hI!1QD/!&bF1au=Kh`_*`jto0p?0\ogl9apH:UCOZ;(L
I/na?8Up3;aa#*YA9NL\hV/K1`Dn=2mfKu'jYBqK\f]AFI`a6ek\1sd>19G1)$5:gSUR[=C(6
*J4Gd&_Y:9`b:6%]A$b(?(s#PF]A4oiP/Hs3b*bh&;_aOE_tY8KpE,?6?'tfS$L0.SIU[=16m6
2$F+uPO,he@_3(FUP^E6q-M!-"k07DX$.::=n?:L^d3X*,,4!=PLh:j70U00(!6[^lKik7L'
_S,-BWA-39g$V%$R`[QE44Kfo9iKdU6]Ag!F*APWGr$lg)u?$Ze^KsBlku/NN(KnILob$&Unq
^G(II^K>[bhX]A&!=Cb)-7r^0SY`#KF?RSZKSZ%lc96m2PpMjFcj<N5o_`YRc2^;<t5JXdQcP
:(!R)"r'Cd`TR>5m)NLZc+<1m7e6Z<K2qkJl1F_E!_E)I0V>sto2PqZ\UdQ!=,bmjKk9#p4D
CQ@h0@n&RS1C8W>Wjd(Crjg2rg8rp/QHZa5H30HXR>,hlW_3K(N;:fP!Pbq#imNDJC:#MR7Q
dTOhN]A)HbISgC6_Apq*je'%&r\GJPmpU00@r:QQ_7'/pkF^Q7K)^#gAU.j/(+mCe)R&J_`Y^
gKmk7'q*m;.^4k4P'/U/_sTU=)6K'$jmZT^l\Yo)>Yi[4eq6Y<M;8JA_3Ao`O2Q'O[+5O#cZ
1U5+@C@gd1piN/`V_AM:Rkq#*An)LEseNCc[R2+#6=!ier3`Fc:Wei2PPK8V95`VTDpVM\$W
g8<lHbV4T_s!rpW+<8W[kt4Ud!+@^C_Pl?$pI^fUF1\J(L$afTJOhW?8V-BJV"USfqn/(OKN
(J]A,ALl^OV0MP^6[<E0!B=hRd$F#m$XO?]AaBK3U:B=tNP]Aots#97H+4BY;<b$l/<F.BFRjZJ
YOSj[ihm?^;de3L4'k)t)=2d</.Z[8^37_/upE]AQ_[*+OSjAl9:2(q\<>'qUYoS1q&*D[%'-
O6/,A36PRZS:lE')$fRAF/mdi!Z/_WsW@.(tle7[0NYRok.JAoA1eVr>TD&i4+k9$ZL[@dc^
_P*7,"^LDhR^2TCj[3RcS^K_cu!9K;15?KM'g)*l$^A[=h1:oOI]A$-`@P,j^AWp@+0k+@Epl
nBB-EbOGtSs7q#MF\SohiBHrW&@n8HXgtu&??fn2_f@]A'ICK0H_/L@Y!8o5dZ*u(LKJP7pDa
38J&a!+gL!<hLZeu?XdrLu11j&+lh\c.b&)J`pY_]Ak7&d5;cVQf]A(F[)WtI=1`1O"o;.)]AT_
H(/((m#omjD?PAkuDrYc\MLB)im;ooB]Al&oc.o`Om3H,O_*=+QS#@E#7JsD":U=5_sq##F,'
)l5[YAMtr72Y[GCnI?&f&3-QV%t"S%M?.eDX;'uU;C:F4[/1q@)te1.0"S;SQ=eT-f9.+rJ/
W5_l&(h(+ar5j)^3m`V))OWDf17Yd46F)uq%mJ<ugihdIkL6KRZe[P)o#mJ:<o#Ff,\m8DY/
K^muj8bkhH,kfJ5Qp18*2[cjio5igYj^3NT_qt^nZ2]AKuWrQKkM=ll#?@ElapptIr-l7g:lU
>GHWg.OW8Y=f\I`e5lLRt<04>IqC'O+@lqd9687u@LgTYTPt4m'(h^k.UOTilGqW3cHlfiE,
TTDd:UqWo(_J*V#3-kniJJED4E2b/A2"-&=m=Og*rh,r]Ab\\.Rl6Wpbu2?-$ihc/=As#tcn9
o"T2M*Lu5oN-;1PF1">X[#.fY;17<I8+$U]AtprMQVEA@7Ns2ARk!gEM/`!u9t1(5g[a[<`a!
H0pb[o5O,GaXEbI?LKdg_]Ar2:0Jlo2Aqf0#W=U<6fTU_,__X`/(8lIRb80A]APB5JF>lAWA.P
&aapm0BC_R[M[WoMDEVtp9#U3:oi=m1HjZ(]A%_HCTqpi$WS^&98`M9?)!T:@n_ilPnG<@e%`
#j:QJ\q_R(`?E(,P#CnnCE?/rt8'>qkdCY!)X<U$n*c4%:E2([&Ui2"@lUa')ub[E0aP]A9$o
0=Pd<Ul_Fi4Z!g#kGMh$WL\5`9(Ppto8;7Pf<RW6\.TZMRJH%?5Xu<tej:DN9@+hOBm]A[/ag
.UqtXq8[DYeWKc7I*8)VIH/N`W$q`V#3ZV/qG:T9hZfo@BaY[7[+5$N:j7'33@drV>g\Kd<.
uZ(L;h;D`k%r5ieg@T?tbL6t0'BjLQN*4P3PaHTfU=i(T2r+gM6b#=\Ws#Lrn3Y]A41Z-"%bS
"?Fud?8OR*JC()X08+$m*^'U0l%-X&:3hEQSaGZ1diR.ue^,nonO<G,@e5'MRn<1rl;1Tqm3
f.OXqUQbA&2>T3R3WXc0K<`8BR=?G5*i<J(!a1rjScdG>/*N9W/Bubi[XACtjfR'<l>V>hpj
!IbC@7I,;qT>M"!CTJ_,6;\5j&`Ife#UjTEaY2$70AZ2E_.;ju-07#D5>*1<l$WdE,*Uc8N!
/V15+BZCdTYDMG!3WC4:4;O#\tFa$+>rXaE;h63VB,l<UhBp:VGBkU6W*h2N"`R,iroO='E$
n:gdm_)3\j%.cuICH7;emD"fY-A6X`R!J6eX2HfgUD5PNG7S]A0iii3bSHR6,kKjM3mekMB$]A
p;i//f1+;n="'4KGl;BEdEGrK.Z[KD[L%$(IPdIpOK8!*%b"_B3FfE3GS6'-6p+rp:?1^8aD
TV5Uqs;/M1iPpc[Ka)^Mr-m>fMn["UnX@pWFRTNhObW&'#W:j9h\lG^)(DU5YYT'Acq7AgK8
FLHDPFT6sPWl$(ENN)Z=0>_='?7Iq.%SOs*)"Mhn;N'7p3WhM,`0@_E0jIiEGkRt`rQgK:>o
JoD/k)@.:nX[U&&j7d]AqHU_j`R.rK\?:'gF&`2aDe(T$YV9@Q(41&skMTi/T^f",6X8LfK@&
t=Sob<mHNFGtM!dc4pmHGlRp^[:-E#0<?i6ngcR&."X/oBKdJK0ka02q@"?Tq*A$si.pAXt_
p8\t3_>`GQl.u5(&&8"ik$<NGkj]AN60!ok``&)3MrJHSkS5Ys+j9r\O,,DrKYB>531,81D9?
DVTfY>qrf@29Ik)$MBDWJOq@fso>O$3$c#N@O-,r79%$De4)`R:<X1;eQ"geTRJdVr4\-XXM
2Wf)".4^h7C9D5/Gn%QQ?Adq"cJt0)')abW:[^,;hhg/S<Zf;A@JM3iJHF=6eb&!pf5.eC8K
0&0\g(P:HWHE:!\0e8>7Be;%b8a;>lgZ_GEXcf7"YW4h[gu$J5g>HP9oN2G=+BasBhYSu#b6
a>IM42]A*fAXFf":0RfFd`EY>[D"jthL3cjp\FUhZLd/!6hEDHG;X$V26$`i5"D(1'&QiZId1
OS`2fj8/i6Ki%Y!5G&>epeH@<eDGpKjk[<C8Tb7X_Me24W=oIWm-0u.UD8nChnfC#9M+-'H6
XDUn[^S%2`U"boDUj&5XZif.Q!F%5N1]AoTM1OF,G$]AiSi,_eP_h1iiS^r+Epu+K=`Zmi$4Ga
2KVHYi08J<\)U1q[Bqn<8_Sh3LY/IjN^X4>1+9t.uI5$IC[nN9JM)k[J$Gup=AmdB%9SH&2i
+T<o#^33#32@EmCn<_r^nH9ld[EQZHI'5K\I\_KXUb0%q%,1Be'f1t&KQ@rJ-nqB0"ATG0$0
mN@6bLq9JP3C\ZpVBFGB'/,`#@%?Z>mY5)o"8LI`._\$$h'2c-B0nQ%\5>CKeP)7L:FCS@(K
9>R]A[_6*$F`jAO76CL]A>q8KZG:H_$1K02++VMo8p4Qp)'o^He/.Kp.WR6NlKIm=pud7[3OIB
$.h&b!ri9J<bN-qRp'4)ba]A$U&&T0/O#%Jer+U?C(WsNC'3C-`[3qI-JLHebdbhX.b7&N>L7
<XLWT,D1ol*]ARXHKQqihT03e8$+%nWPn-<G62WtGiZ!,k^=$22Y^Z!gMhq'DEUQ$`9XS5<h;
Yr,oW=l^,K/sB2+]AC:s=UX7HHUtJl^g;X_b)ba3%fdM">kt-labp./0?gsQp[D\oEK2umJs6
KUH;Jt\:GmWnC/1[%8aG?9o2MGVTt^16-8KELcjW--jap,/23r,OJ]A0m1f:"*09+<GcQ[!pj
Bi8(>E8u3MVSsHJ<k(L'1?agUk6KTTLr1!Qr@.0\;;?Fm;r3NT!oY"h8+22er29%R$c2\;$a
0IPD(MEUeTTqI\E_l%Ka/>Uo?Rd-s!,h-"q!D`U&l6=5^nSs$LBLgmKFp096hW0&%:Cc.!e+
AbAMiUJB-aoqC\H*LD08I'p35q9S+u[RXM><r<KS*MNNCf5Q;Cas&X_"mq:'r!-9E->C;mLS
sejGOK"?-GC*Am#\#bZ%a^k2Nh0jj68o2Z9=N@Vc`.Q&]Aku#N&m2'U%D;FU*oaBh!%9[[s6Q
CWJ1>9GW`ibhKeIV82V1_<J]A3Z<Mc*[Kk=)en3-/puI$MAuc$ib)q91Y(Id*gA)BKp5gKJ[U
hmd]A#/&-jo^F^'@F^9Jpir<YUp^t'M&ZhlRH]Ae(P4)sdhJ15"0%2\LJeW6'4c56b`^^Y;.4L
Et>_DA*U9YqNb9eLJ(qp0TGoup\U\13,H2O`a-OO4s'5:UM&jh(K=XWP'G)lAH^P";mTF;ZV
13dIjTT*WpbMW(c6Yh*+qUs>n.>p(6<!#e9TNfV\P+m1G'ef8s`('lpN)frFKV(&Gagj(-Ns
1J;ZNjmmt.QT,i=:rug*Q%-s=s!b&hkp(_mpB81rQtQH~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="480" height="270"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="report1"/>
<Widget widgetName="report2"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="960" height="540"/>
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
