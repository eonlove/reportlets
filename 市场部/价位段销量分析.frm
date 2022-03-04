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
SUM(金额)/SUM(数量) AS 均价,
SUM(数量) AS 数量,
SUM(利润)/SUM(数量) AS 均毛利

FROM 利润明细 t
LEFT JOIN 
(
	SELECT 
	品牌,a.商品全称,商品类型,二级分类名称
	FROM 博远实物商品 a
	LEFT JOIN by_sorts b ON a.商品全称=b.商品全称
     WHERE b.二级分类名称 = '手机'
) t1 ON t.商品全称 = t1.商品全称 AND t.商品类型 = t1.商品类型
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
<![CDATA[1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,723900,723900,723900]]></RowHeight>
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
<![CDATA[毛利率]]></O>
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
<![CDATA[毛利贡献率]]></O>
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
<![CDATA[m<j1E;cg]AJ?+$Gn[W\;r,u\#@XXn2i"X0lB-qYsg6+.J):f\b+,e:<`Bo>M68n>VXJQ,Jq7L
34]A.TOCuXqDL;=@<E<KFgZsaX,'Rmp_j>:8a<!HX5M#pR:CiJ1#".T$Qsj-i*+WO"GGQZJ[A
lB$?XSp$Wh_B?YT9QndXcZ<>MKJ%7Xj#'IqEO.<[s>k^N^rbtqNBgfK"4a?Oc;n)l>GMcQL$
D3qpp=ZGVXtI6U`CjE>?7K-a:AiIVAi'FOS^34t^Nha.%F91V3Hl4uF#G-9R(/Z7l<Zd'hqm
+3@HT$6k>p(m&$-ZFC=W8=-N`FBbe5JU\[9!AdOr)8/L=ZTU"&8kNGjq+$]AX^c2(-ef2,ic*
Qo[6t9Td5fBgBSpZMX0D;^&ZMVbNAV3_?3]AdK^=&#sWlTf7SGB46XSu]ANA3.fo!k74"!rkFa
BH^\a>gh$[jFBT1V]AmY5@aqGWZ3(]A('143b02q%p!@m!)fkn.E,"5j=P_?`Xp^rSdf+,@iel
<7$9"JEa(bU:h&ZKI^+8ja_cX)j#)aXK<S2:248d\+H/6I(DiR$Kai=L+n)sMOWSB>KBDFi0
.D-+gh*"Q8^Yt6.1XS!fp>r`B-&9O&7maAr(D&"juO$ne]AT.Zcg29.p[p8XQ!Q4)/-oOGh0]A
s$2]A;csXq$i_@6;.>*]An&Ljc5[b15Y)8`Ga5PDT'RX\9+%T#>8-dOSJW@XZEpp;:6euF`\UD
aY6V9Gh#rAn$'qr]A3t3@JJ`XbAC=c]AN92p_&*@K9f`S7?B'-6<W[.u*V$gJ\MS(k*(duC!Kr
sNu&aTOFINVPcW=;\;A9.tT\F5"U^Xh[ojK"VQ.8C\l5F:Mj8CE\H::GC%a$79aJbD0K?PB/
6Pn_shjA'"l$ie!_m%@^.ELaPKF"Y]AZnK1T\#gd&:RY`-kZ2ONqEpr_Ff5p>M2E6^=X>0o=+
ui:TbpSYb,,UP67TsS]A@D6(%*$u>*]A'.Ej-=#e;d+Z\`OAk:radXrTKgp=k\\>3?R$(S+WG5
Z6*@^"A;:Ea-`jL'kIA[YB@omOm<Q,c$dn5)QDemN"LiBmk!^.q@5a%'dkC2VG%cI3MfJ+7%
LdoEW#4^W8n_^SP_YaqO1r$B2K[+>8ebK`CqS!N;TbWh6P<anLdF.hY18D7RaNFtH*LRKdl[
u92-;5:@O67-Vh\rX*<:dr_K4'IiWTDuf#K7FIK*>]APpSm'@7FuN'H/Y"lqNdGN.gY5QpVT<
Z>*uLejdKUA_Y+TDmca"s8M;/1clC4>[b_DBp$C=>RbQQ9X8pG4Bu`nQF*`$,ap;(k^f''UH
d#c)B\-42Fju.6kq=>Q`!,(W6toRqlZL+a(kZkoVgHWG'3VVf/hQF:":2hHT$9[@nb2*g8$?
1ORAkt&p0AVjgV!X[2$'WRd!k,)ruX(i:XI1-pU,\UmFr.dJu0T9^`Vf7Hh-(o]Ag?07A1%g_
VD.j-pX+c^l&@EUlC\!tT8g%BGTfH7+9Nqk,@A5OOO=4:Rl:qV`g_;>o0@`OD:oEhJRS'@W8
d-31qtCIrUbA\de0b8C1E^bP04e_7mb]AqH$\BK!VQk:Vr#9.EI#4fanl/ZE/='#A!UWbTjD.
n`)8Gg>jVQa:XVg=c.'lm0f6CNeSN':\sg;N<*+Y<L>pbU'UGm_EE+GC=KPdF'L<T!ON"VH(
R1u^.`1eaoH\:-QDZAS\C.,o9g@KT.dDG-V'5&6Hbts7=6c^0VEskt\gInh30UhESSA;&l0;
+1DKRZ:G:F:m`,WG(jM'_,`F>\n[]Ao)oClfroB(cLGP=K+6b+D]A,UJ%(gg&&kVbC>uY+"b>V
#-mJT)k^oQVBkhKZ;EF97Fk3DfK%<%WWdp+-6Ti;*EEChe4B6=M\io4$SF4qr.ZKG*K:Yh2f
@J]A^85391XA"dBU=+.EG:&XJNXQ]A-r<C^Pmh'8H6GS?Q0/-SF,3;?9Oei`+JRtCmXlrPRT`:
F6<p9s.r/<-E:jj"[]A*/KC*,(hB-,7&V"go\;+jXFE19`Q(:]AP;704F^?)A8h=qV[kQ/dgYe
1@1dDK4KoP9BQ'QF>G>-raoj\B!C1I_[\ZTM4(4<?>#\5^_,A*Wmrq85Nh&]AQqMN\U\Q"OZ(
V$f!uM;NZ0ep*k67O\U.i&f%M+<#fn&Y:$&;8C4XOIPlhu^U`C+DFO5cu"`"F0iUeBY2j&NE
!`M(bXM?LhR=0NlTbggEo+hNG(u:1qm:i9N%Q.i/Y^4=.\\s?%k_&M)-F-"6@f!VD#7BP<#l
M(-XHDtEd8k-Tf(s'kG%PW$X[G*9B)<di*_SJ4$%<mO#18@%fl1KN"5C(8,u#A#;+U"&]A<rm
Rk.;VNI+YAprtU>K)7bW;m"(E@btWGPMJ;-!TaZNLTp^Q=L6KQ\G_&!(FDO4eI@04(oSU11G
g%EZ\ii;OT$\CMC#TB&O+O[p$dM:65Fk85ib%A]Ae/&mL]A$17H+A6iTi)9qR?R="a63?Jdech
8V&rZBL@nRaHNBd$-HDH*&7_S<*=N/LR!-B11GI=h@Qj*t2Y2YFP&W>R;%S!4Dbu6)49r]A8G
D3^eE:@,*2DfDKo)Yp%gPm84jQ&"dg=',k54bu'RrG7dQUkB`d^WS!P4%Y-[`%`F=-rQ\[;s
;5Qq.K>*RaVD,id\/I50k>H`pBu3WmD%JOK!"qO61=U,TU>j70tW.cU:6BiSE_3Jd+P9IAI+
UlNd;1V(UTR*n7g.*du5CCO/<g3huT4_7D7%Y'-2eoKX/f#bQ>mrCj,qT&-5W%a%q>J/7M==
/D>>%FFGk1iS7?DdH)=g5gG!I[s!nY!qK)D7,7?/f3(PFUk%m8W7IprH%Cj'r?^MPCKTNIBh
\eiqZq28lOPAQV!iIc/mfFZ]AWWo(;PY[^KW@gkF]At=Xj81He!IZ"[Eog(&J5*ZCIb:sj.VG]A
?>\.IAsETqg@<>E7YpK/-CR>ZOZg<(osrZ_c9+Pj5$7#m-SCt;pI^7@CgK$)lfK`&OY_'(,$
KU_PG^h.4AEZ<gAhOf]A+MbOHF:oB0[C_rQ!T]A:J.<`"Z1KQkWqTHLrS$Z3QGQ]AU`PZrcKS'X
`,els`V*/^_d1e`JD"!SISqGr%O20?"*m"%?,f0\F(No&3-Vc?kTh8ma3D^)oTi'GcSRGKd*
mS:`c\6oc/HhP/0itK9!#L)LLFL^Rk^hOp;Ei/Th<a4[4boiZGDeY(Z]A7oJLFg;J1CgXM)at
gXm0YtK1:uR',rCJW8+q*k"omVF_meN60.p$b<p(>'$jG8,)XL'5Ip^9&l(e8OOCHnjo(9+B
Vs?CV?OA0!*A1h5D.XUV4p*9?35NN2:p324I4i;O).tp9A>CUo@Qe]AVa=s4dHk"jOr5O5;J\
BhR`X":s>6>^k/=Tc)h%XJt(qB92AZA>Je%,kVC,Xo3>lk<af$hBgGlU09h/f,j"P5]Au!ksG
F&kh.$>c9N.GMWf8/*p7`?VMSlr06$7Z_-d(1?k;YoCV2\!GD3lMD.0pHrLoVfB'$Hm'gpZl
F]Ag0Ya<f-"<L.37O[OVAfAB0lJ_GFFON>e=47gtGcDK'BOBSJpq(KIDG*s514i`sLW$IR-DL
/@nt/Xj%!-DZc9S7`A9(`n,GbTocNe6tNJ.I=!"G&POA.:+a$?br2LmsZl.3,R<2d6?lsSDm
a0[*_1nM`V+V27HS^_6u2,)hB"WUKKko"!o!Jl;.D*VBb^Y*MR#,$X-/-'\Ab-g"qdn>*BY\
C#e^j%6$;$dp_6]A!Y*H3m_!&Obq;OJ9H:hfbS4>XbC]AnuASPhe8;^8&(>_D$>9Yq'm'0?8u)
aY=o'5+r30i%nrE;k=-]A>Pi:GuAh-AjZFYHA)/bFok3DVi@0@M9M*[,bre(s9`;:_<jD',CI
Y!el+Nu%\+2.EA5!*`DKn2)W5`[-Di'?s^/9;"N5U9u7qlJ$E$m_K;Jng`:ZZH,%:#kR]ABZ1
.V:+o>tU-9E23'KSNTI),A0G#7!mr*/IA3%D\a#hY'JZH[DQ;h841qHc_FmeY4/[,1?TdEo8
qOr4eB#W!RSi_M?]AVS\g]At8@c*Bm3^@FY!1HMO#!&lbHM==l^8%?-ZHZVXqCNc_.7mC3nI\E
So4_'u\tDu+=GckSd)arUq;Z]A]AIE*RMf%`ol%:[YD#F'-ZJ&qMECB/j!2J6G%*hR3:ATZ??)
e(_GthBG8<B!DS#;+e4>homYI_FYjU;(4Mp1A%VC.bIP*B!oEW9Z.\6I8jJBb`_$/2lCs$3h
W82Oq\OP6:p?LW2$Fa6kNgS7/a[heqrY*MXQXi;e!*Qh6I#^m6HQpF(p20d,*p[L&%"\@U!P
HD0!eo5U!.K&l6Vap60mYt'Z["m8CdmVANoX]A7]A(AD8lC+jgJ&1[cB##nnhu]A8puoo0M8sj<
<_a0=_gU82$]A*uononPOMHLP&h%uJh7<"js<P:&KDnfsN5j`J5R@Lu'mY;!9i@`IU9%Rh<dt
;3[CGtY-=gJ2p+cdbf0&O*X$YC_,",5g`E@[cCa^.4/.nu*"@5*F^8IiliVA7o\k[ec,dT^5
-OqR`+UL@TI7j93i"d0DIV]Aa>FpI@*B3\>?2+E#G)MGM9HBKs$pJg]A;/TK5?@MtaI0>7\ifg
Zc4,g$r-AfPOoS4(u.8kO(R]A8hapIK*T\EC<HJj>g@3"Q5Dg919iAgp6>`mIBO5p9s.k8lh1
^4gXEd<lkU8j-fN<>D'GSaFoP*aj>r+#/I3Hc"M7VVLX(V@F2f.1n+6U/KfhZNk4a#2;U/#&
eN.DBX3EFo<k4nI^i1b7agYJjaUrT<o0]AMn<R&54/:h>>9]A[)9V?_qPR!ZY<Pcc;0_/hCqjs
W>]AD(V,FGOoT*r?V)%'58ToMe,V1/+'u<P"A3ArjtHLXAiIEW=tmd5qXUNOL1_,[(#Ks,S7_
T0Y]ANS*EMN:\ehB'l3>d4&*1%9Tr4@rWR*4uXOE2??TkA_<_8FmrmW<P\=YtLpS=-BOVZHf\
0WGLF6?b,jIYL>njhhe8<.aEe!-nV%))MR>%8>QAkDS2jK+IVa@JK,P#`'Mm-%/E4"j4!LSq
o!SPA0]A@dq3djr+S,WC#4$gB#jN4j3A34]AE3WO2T`<8pWdGL(@n`Dki1piBc-)L%*q9\r)o%
BHeYThr*s]A/F#fo<7^QQR*Y0h*]AbeWk+D*BL$IUfHlQ:obg5(ifLHp`)TX+o:J^:^*3=MKOk
=H_SAcV:#/OX:mA[_3\Zm\IUGbmI^b`@G0L)rajU&ZSM)n6u2P0_$A('<OS\MSJ2AWGO=1hj
+H7o!*4Emcq3J$CTI'DD*qJ&ds+0V\@c+$;-O=`kdFN$YM:fs7P>BAdGs'.?i<Eh(O1#7K.b
))\D=T>Nc@d^j@k\m?dLrQ<q3;/5S;l>Igdq,+GqGb\"AId53oY76a@1Ug.\/LC`[]AU5?*N)
-kCC(]A`,!:OdM:E3#.gWcEBN`b2QL[C&HWKasg-&M=F#&$aoqab#W_aH^W?HQqD0P/[+lA5l
j)s!do4h"NKX+-T+>Tof'jW0)Zn)"lPZmtJ]Aa<bG#rH'SaS-eh:*h(XaW6@=JRJ\CngB#sQ>
[F@);aE7Dn1PQ4hJQRMBL9Rd]Aei;#1]Aj(/c7C22hZ>\$2hXm<G8ZRl=qE_I]Ane@:iG9k4^fi
P%L/ZeP>N$dld_m?jTH"TgW*>_k;hTp&n'8k9=:^,jZ.Dn-dOE,iG&ET^/ZoD)CQ"sIs@d>A
i2TS9j]A'h'Ubuo.<Tti-b't*Z'@]Ar.;Igo!TP>1^'%VN[c)imhI"lQqiQ"\9W>b4B,0=6'J,
GN/p%4*<OYq$^CK"Db_*n,!mRaBdGWi.d]A.CKjp!?o0<]A$#.2F#(]AU+9)D10ApEBOM?<Xi&n
/mo7PX^R&F6[=ZcJnK/@r7=?').L?"*Ofoln04b*h8rF`El]AdfaJ&eiCKI`rV^\bL6?7'0=Q
/VdU%f.*Laj;E#CAB9a51PLPE.Df8k>L07:qUcjoAmsbn:PN]ARlJ0q&S_IKmS"tH*g;bC_Ll
\`&!sl<_hqAZ85(P:u2:eC.<.+11qHS@-80a]A2BGu!4`2'$[4&[Fsr>-7!VIEf(V;L#sYeuD
=ggVXN^.df1El<GgM+Y?B$kkC-Ab!c^GgGVOR_s4-fLhALcq%o4l,E=d8;9O+]A&.'&$0G%@0
kk%9j4[kM+#ngB4pk*J0]A74<]AP4WdR2-gBe2<A.clWTXn*ZQ/UX>Oq2m^_kc-X*d8e.=u*0[
Q/mqVSVFH%-p0ljI3q?rXMAdW>[BR3CG7Ej#)ITWm#F1aPCR-SeKG'l[4\'O;`)ao%6:*;L<
j^fkF&R]A2BP*.VG10Bh?fR4RD#fF.O.?g^_D$is%E)n)*2l'aW%<R)Nl#Y8LEgJ(r*t)>%G1
]A"Pk/6b_9Q_ki2<?QroV1:)'1lP*U*a/LkJrV]An3#+a&21=bo-4RC\4SBO3+aPDmFs%`!qb[
/mbWUZ^/Q/SopdV[n2Q6+C[@9+LB@7W[Do<bbjLAlAu^/iKi>dNH_>h;rpBB97BUiZ+OE%;c
./=MGQs?:&ER85$Q8IB;U844050<_/T=j.bGE=4fs!lp*#s*/:=fhm<P&PJ5d&(:kP!Y$mr:
WOj!TIb4ML;4KX,O06W4O(V,k_iHnA)Z93]A+'';[D#Z1O>)<$Vac'Xu:/5j8/ulu4kJb6$!.
9p>D)$0P;d>N+;(k@3/i)d=h%'&aaj3SJ6<I+<l9-\jaNk=@:@e@.clm<O7&[!o#\)VKH4`;
-F?(_?jg/J9FLrffQm]ADNV_LS)XlAUm?;*R.3k$KbK;V:\-JBO9hJ=&A<ps7GD@*9RCJ"!R!
L9L>OI/jcrNLs>pb^H!?86f#cc@)Vj*TQ>0r2".4L4Sg"qbpi>6Z\T@+85Cs)A8D`VY<<+g(
:]AI?r1cE)Hls4]A"18]A_)FMB@c@Bc.$tiX7uM.WFV3-j4;k\Y*nk0frH<D&lTQ=EdO%]A&kI+U
Vgd*cdAf'0g)0jMI!W7q<m\<7oX$:BXhpDr%_X5-:%$GR./V#:X!Ni[P$DZkI`L68RR`,^Xt
*tl[Ec4!h(H(XWg(RS8"B`?O%19`\L`:Am@i`?,VNl^Ui'`Snp#W=3+/Oh`AH`O.f>>Y&Oe!
E3iEVq=%sR+Z0*mq1q1ZjB"T8u\N]Anc9A.7%3p1QD#C)MHB>0BN?KInerGj:rc>o'+rJ.fd+
H(J]A0tmAI_8Gk&eBH_+O>XYS5EbrtPVG+diRrui"5\$P5E\h3$gDQaiaKJ9>Kel_#HTp\bEt
]AbX7j9``WR?lerU<Lg,)@gU'p%[b',i/O\Is6$8'S*lE-fr/t-Z]AQV_]A@*K4,hG_'^N/ke9=
AKe5X!`u5-dQ\DVc""'NcXs;k(clW+hK\E\eCo;s1h_)(cNqI/JV]AKreJhf\aU-njUgcljOr
BJiop_VQ0ad[(]A/>K8Lk^?eZHK49Z'>l]A%TBmM,c#gt?n`s"-#LA!F=`>P:K0e`:%Y&jg*@-
'hguf_9r=Sl^3%_m%jIZfr9Ul><j$lF2MP$-6PVD_b:f[6ORookW.*J2R%+V[U8+l)#M\a5`
1dWr95nh+]A.<:km\_<V_`$)``:6AmaMNc#/@:k(#>pb02V,WWf]A-L+iQVIZBAH:J`H?Mpb=i
:9N;/&5Rg=N)3)]A@qdAAG'0s[>,Q>0S(9B]AeNd>b_B4[)0ehA^Z_Dn2KO\IIqCl<FNjJlP0p
[E`.0:J1O?c-dcf@N!!?WnM5O8,06H`M\91WAYjo,:tNMnHKmM$L3$ao%ilg`%:LZrKVHJ+d
$`gJD0<0PO%X3*C?5kDE0PRCfJ.n6++(ISQ^8f1hUlh=COG!S"4^&q`UjOi`*ALDm1uY[#qj
o]A)7ZU(0r.I?f-dj5^0i!$AW.9Wp]AQ.1%4e7NRN1]AWlcf1ibn)KUeTtD@FOFJ`-&hg3Ir)0;
/mnT5m!m=)J>q>X2db4k.&eq[8iAne_Oda-s6e+D\rA69C8iJ[thsh[b'b]A.)$-NZqTuXJn3
%Gj:q@2--bHh9YW\c3CU6'e>e*;s5;^h17-]Ac:B#!/%9pW0o0Jsd"AuKP4eu>I:Yi1E#[o$c
r1f_eM.I^1G<j9-WV9E]ABu5k*!e[=IPr-SK+k-T#Bl1toiGUnG]AoA[CTV[boW+LPB>YEgq4*
tK9;+T9^e@UN`jGqh#1<Tru7h%kn^KXCne=Ep!gIHhFULo3XZRRdU`\SC-d)2YY:]A@7:'Sh8
V4(t2DWA*1OCTCs*K;Ds/2cX3a]A%Z$sdOKemoX+puhD>V(%R?Bh]AO>utH[6/G9h8&5S%#bH6
3:ko[:CZaXbZkNdL@EOAbY0p\Y*iGc?s)h%W>b(k)s%!YWq\@Nci"Yi67$W(bF?gf8>,jD)/
>OGAiPu,UfO:e@[(t'(IaQ6tlB6c1\Ua7'5/69(+CW0"srhRn\7#nXdWh",Lc)G(J*3[`_aG
UA]A[BV=!>^h=d6QJ']Aee?lMr`)@%o;F'`"[VPE<B>XHTK83$&<+)KU;p."K?@Lt2YXu>JXGb
A(\+#'<Eo[^c]AAT4f3D4ttPDDs=I69>;'"t,X!?*Q;uRBuZG:36;'pkT0faDu./&J+62.3e#
kkaTNrASbP$6[0`%@]AQM\h/`,S6s(;.:e;>E2.tCk!7j<eDjjVWG9kL,&Bj<[9+SRi5MUpLY
'G]A'P+?Z63nHs4%o@-C+M.S>92s7fjH\]A*B`0h=8+G9O?G.j_TpSOX_#5N?aPbk<F<01\0;a
4[,$LDK?a]Ad#^A:8]AmGrhSh>H[W^9U@a=_gI,ODU]AY[_SQKTQ'K\;kQ9]Am9u#fr8YcQZC(jB
p>`Wo$Wm/mp7JE<P<a<EY@V__aZHb`mN*IWgAgqc(7)7UHmK0ld,kjBeW[>IJ)()#al-D;*>
Q!M.5J*GjWr\S:@W'P?[^aq<PLZbpYX7VIaom93hmmP>F#PT:s!`LD2s,i8?!h(ZN?]AIW7M@
&<MiLNXR;>!j##PK4@ceiEjVQ`Dd-_m]ATBF(UeL<Ejkm\WWJ1ZCkF*'UMV%-u/iub38BLq3H
[Y*gI2(_t:d-jmn0qnY/j+)m!)gpj`.aL0`]AuGmK`+XNIJ_k<N5PUnANdJpCG.6GgQe=Y;?D
QW:Mg:4S_XWTHgGcAH_&dDW+..jdm8]AS>Y@62IC8_X^hjVUL$Uh$AKI\=.Bp$,f<LWbBs".l
_t!V5&`[.DR$^c7:mn[<_[b&;4YRX5=amt0P-LT9<k?R'V3i1C+>V.gK3/=jJ3Kln?b5(SP8
#4No"up(:@Str8=Z@>`n9r)-=`Aidnb02RognW/a7WYh(`W)?2H.6lu7cjPW4s"niX_=D'Nr
b^t>rZ,p`2SM^^@!a*/An"iY^\[ZEsXd^ZQIrb(eQ#ZG8>Oa@pMB0kc?"f<:TSD-t5F^Qmil
]AcfYNjTUQiA%YG4(1aQSB>%;0P_,1=4k5'R0Taa]A7$SfCMU=D`g'"6'EU;b^.>A7-u8`''>B
d6]A!!gm6dkcuR-"'W#2"%Eat&M@1\A\8)a9:8FLktP0_Q;tQI8a\dED?lh$Z\9ERu-"h"g-i
7I@Z&hWS$eN!UP(iq-tjp>>O9TV:MEKn8VC+,<7WNHr6U7As)+j.;.g)THfRm@Rn4gaOteg@
*gTCmPRb6^-jW"a9@K#W3pkMf760\kl&Kk./u[C8@/t6-%sUYTshjM2n1ci>W<I)aV1)irk`
d62.X8&mE(+%,)f_.HF&@C#C&+>Pl2A_!"EUgEgDdhF:AQMH2MfBLf5bK>H9K4h:;9^bkVo\
S+qKQg)6NldC-)ghiGb,F;/]A$<%^>d3+BmZ'+fJLul2>o_e-B2W_-=>U_@S[KapfE&tW8OC>
3EK;@W6<1<R<`kDp!/hOD7-pB,jUKE:,I=7P7a?A,nCq"GSK@dXB$jSb?YLAkXE\*.AW+X;-
)!h>[TcF]A`R1Y2NSE"[U'\L6qm;CKSYVh`3A`A8Nm(*6aTA)]A^1rNg4mo2FjG,Ydq:sqdc)"
MS7QGW80^K1M8aSO2V&\6XSr":PW$UNlAldH*GT-'.M'.lk#Z!QJ=\.NS'-YEY621T!*9mMm
nNQkm]Am'PkoFBlp`+"6m`q%JDL'Z$__nA\p+:Hk-]A3$Y#_<%[8#0%kn*?d4k+$[?!?]Agb:J4
J:U(Id08g`u4pOQ0JA1PZ\c00qlJ7m!S9;jBF?9.t<^n>YTm*a:cdC6Z,EmA%orlcTgWUjf_
e:j+FYnkoifI'-[*'46:$bmW"?R[=UM4$:RmYhE#&+8*q(^1ZlU,p-^k4R,1V'hTS3<FbPWN
.=nA![b/)+p,+VdXA#?OeUp0OC-QB#0MWVq,3<#qb:_1>D@,*llaDVVZ)rK0Y483/OhLZNpB
2S&A)0`pF\n@d)e@X.K%!#.AkfBnA7pAna7chlk68$N-S,(5#KFD#@/RE"cF-u)>JM[@+MCI
YbDQjiBu.[@W;.X+gPhBJ#1+.iQ_Ns,]AmEbZ:ejuZR+t%rOPgId%8BM2fin'2H&)SAds'Ikh
i=Sq>rTjaWs5r%>TVX"T'bL\_ue\J5c!;'DQU)jmJSS?\GtF'i9WWkfXlU9DU)C=de"-85#R
"oY:HRCWa*]A*W6WWOEQh9WchAIXH7ZD=9n]A]A0N\u]A>;)"j+^mRRLp6ZXs9iRAN4hZo)B$fS;
/fGABU]A(E.\!Pq!5a=f]A+MDgTeBAFpYT(]AA#eOLbBJcAMC/;=9^j$[oF14QC1Ug0g-)(q!?X
A;B8i=rOMopm?3H'__"&?'bHp+s^kcADD]Aks,*E#n!C5cj/:s##3>7Pak<*T1(H]A9W<M33Io
!ZeJL_)+7kF:6.+g9(,*]A@_?r/)gR5t)+d;3[$MCr?]Asd-q-[of]A1#>s"R=N,=@Ku=;s'.N?
H1'WDCsN)9LaagkDK$&X?#pAlY,j.33"n!q&I"3Z97N8p^]ASf>3kBU'dr=&MIsG^N,DtGEp?
#7h.Pk@9#h/a@!n,-@5#f*j"Y%;Ab2i$$tg-(;1Hjrd7tHPVH+Y939Ic]AW4Tta\Ia!Mr0qV3
o0Z>PFeg\^)OE]AZ*)9]A':,e.<c"m-#FBH5$q^7lHXN(b\ribLET$W536$@jCrf]AJ"=T9$k`O
sChH]AP4bFC#O,C)b"sEQZ$R1qH"+ToL<qQRR%IX-VbhJBPMflgW`pU'>HV[ac7?Rh'\7]AAT$
j4TP.cndoH<iiSI!>EDPUBGte!asP\4mR6GF)4`?L8sp0o;[6tuIBHc5@U,VQ>%cXOV+pBhG
eWnefdMGm"c`RrBc:<N8\9W;J0=tYW%lN*\%8,I<A2WXOa[@o-J4ELU/P@5hUo/`Qf^]A6G1_
-OW'^hO2^j$,ioAref8_I3ibD!UY7k?e,\J_9\`YElV4KBWPI#>k%&-o2iK0:nO7$Ija[^`_
Ct$jV90F,1e1Xt&NN[;nPnYVPHK1es;h!'PprQK(2N]A*09#i6HoE>_>c_V;5$Iaeb*\gi&/X
K&c+&Q=,VcG@pX#;s'-]AfB6ASRRZ`Q5$KL?l,4<:uHlb*F8,(-D[KVPLf'R`r0]A>eLrfVFN[
^I*7[d0m0dC_Dsi)!UQ+aiScN-SEU73j_NYS7HllX*bLbr:keU1]Abi[6/kg\"08h]A_)H'/I>
OKY:&5g\'bB!!VTeo3AQ<Pt6%p@l&:.R=>DudJB9A?%1&8:-a$pj4e`(15#[\NO_2dl^oks4
7`p,CYHp$RfaUd"/()sK:".ijd`g&TaK.Y0=27@2#Vg3RJWmu.Ikb"%.qoD7B`+pN=9'6A1u
QA%brW/$,']AcP77LJMj_&@n>lWir5"+qalg)$7#<+c?=(*f)]A.`Z6f.K_ngUfea!Bi9Wa,JS
NMB%6Mk<7KUC8B6n-elE9O))`qaY6fYenT"894]A=4p$g=ru-dcMd.=aUd;4N,Y$mFKi:8k]Ao
=dTnTKkuou"1KiM9]AAd*pF@3EuRE49RJk!^d4R7[oW4E<3XDBS[fQD'"k]A+tZ2q26WdV)'ml
TAfe6*6]A#fHBOdT3")9G990o/>\9<LN6X:CqN[tFqJO(/G5^X0WD0O8U&o"B;NfjPGt@CK?d
GV-;lL=V>0\$VgT9rcNdB1ht>k''\3L.`[%@a(LjlY;8G/QIJSj;+kF;#T4J\(b[V^(Au\)D
81NE!$A:/TPhksYqY]Am_o;"%5^R`PgGI.T/?.O[u3g>@=cUV#j4sn'q5id0`X\8Ygq8ikN<2
`IFrD!$K%&MZVp%TbpSn;8T+QC.:`!9M4V.=P:DZ:9F,[=fI^'I=\'ND9LcP#?7.Y@uU(h@M
+VY'>gnbCRNS'7T9gQ65q@Tk-^^Z(rS^[M5pqY'kLPRJ)lE877ebW%C,)AbllV:9.8k#d-$L
3t85JaI?Ietb@4bL0:(%*>\]Ad6mIf#q9$lMeid'6[oBYq`HnL(tIL"Ht2Q";5%IihAN%<0TJ
18K0+KRG=j@rbdUB:Ur:'cJn>U>=(]A!CnR_7ES_)[W=_#RiW,Cj.U;@nV13=o,(H0Pl1n6_O
+'gX$o,K$]Ao1O$#&B5[>W"TU60OY"Cj%o(6&":3P=i3FuRJETga=\qV?"(>qU)/TTV`G"]Ar!
GZ.SKDFA7)sekM'qoho[L]A]A#VO'>?llr_$I7#DQm)#2Iq_DL3l'nb?Hd_:r?oi%VkB,@6K>i
@X0$[C]Af0dpT6g0io`otdhpF%+l,R#@nK#GX39'YXL[JZW:EL]An+g4V4^7T1i+I(Fi>*U8aa
*c41/n[a>IHg*uKbDu7T>+.urOIlS)nU).D+9\ZZ,_B4^o,Dc2s%!_ci2Eps(3W%DoL&._IH
mX+b=OY;9k<Mr[=\ZLtS0fT+YnR9$CKoLb'..G!0"mnE$a<\$=.Qae;[]A`P\]Aqq-!'Yf17<3
-R\jYAdZ--X^C"ads3DplHKQ@<@t,+M*669jF_B#q^;Y;_GDZ,cXYpn+,+D,;LIFF#;E'\2R
ar.KG3pr7CE@XC`QZGT5Xm>dD(r6g]A#<r,*D[%r.3u:05KYj9.t)nf43hh?D2.T__1XENNKI
IOP8M.gG/$4O-7*r3E&-?(M!++Zd#Ap&USjIKVc+:f[D0Lo((d=(kUnD-7%RT7Fo0R]ABDH*&
-Jt'0lWd28tW0DH=07U[f]AHC9D?DCfAHA*oHH10=)%2TrF_K!+LJ\42IT$.Z?IQqBsH&aF^i
Sp%86ru42o6)DF/8*oHT<S\U3,o5D@")%<t0e!^<dfpq+6aC)Y8UPJ'#%G+h"DqX\Dl^FZ+c
1)%:TOC[XVmim_(Re80^Gs`^Kqc9.$C4=I:Vj*O6*R06Ga_NU*8YQd+D>Fo_IrD\7:V3NKR1
@d`#E2olF<0ObZ%;'f@Hs?4H8/I:gCC/oUZUbtoBSurW0jH$#19.T"%0t6r1[8s?!sXDf2L<
U>?%QiCB2h80]A8Ku9d*q@hX?,*:\+<V+9*a$:O%T'r]A\a%4)+A04t):Zd)^RKR"j"_i%$jhX
q/jN-GWB3W$BECBio=c(6P8U+rFf-QB4T.DdkV^NB6"K;U$Q0=S3GQ^8.&L;S=,UiVZHJjN4
lGA3Bce`:faj:\mk<aBp0jV2nTL:('d'BG;8j'@ZGWik1S<RAL>cfj@H(5HrsH+gf+>4fFX,
Mq4e6OmoNoV6JBJS7m=%9E?gI$X;:YM1_+lmt;mfF3IFRNO#MFl:\l]AL@81uO\^#&Dbc"%;u
1O]AA;?(ggHu0iIilL$0d.fo.X^O9@Wm.n6O4_aZ?l9+jurm[f1^fT=2riFBg.VS,b'_B$WW`
>C8r1<#BSpDp5`C[pE+pebjC=@p8cNdm+'O+1KtZ#`E:b`q#23`rs9)a%69$%o?hTc?%!Skk
:Gssc]AmXSFFl^c<Zl[Z"mngY.t437>[VsW=J%'b_1..B.@37X"QX&dhS6*E&D=e<JG/^1J*l
@!J_21kkt6JA/j?^AWbr5DErJRE0pN.$`p'S`s&_\eRgQuR)dm4D5O!u2de(;-JcEO#I]A)X1
CGK^kZcdOSr_(lB.5r%;aaCijCN*K.Q5Z%dmk(&#0\e!-d]A@on#GeqM3q-=2b=*cp.7WY=0l
5#r/nHm<94[u(<1u/XU/9J5^B<tdUV)G.J`aFf)U+8:GM.%6&U>9d[OdlI?38Yc+FL;cjCrF
D:BAPhSDK7)I&E[Q:o3,Q0fkUfr9pJ,%44NqNNb>PZ8V+2Qkj;+/\GY+;>h!4aDR1I;:"r=p
u:t@F#1^@]A-)JA4@,u[p'JcM\i?\tiVR!$&,UI5pPoccOT4O*5:R=h,dS#-C.3%=je'3Uafj
69#q(Nb^H5iJqO,L(IWa(]AdQ'e.WIacP1HF@-7#pR3?WcJ0AC4'5P8f"K_nXZn>htLe.$Ft5
;DgUkj\POZ]Ad=#&qmj:C#[Pc/[G@Bh7pYdAA`69`:Y^.'q:T*K#pVt''B)-Gg1[p1A/D%B<C
4^*$>s/X=OTs#R,s]A`:qqJI/FRn+j/'W[>jQGcOH+M01\[33JXK8_o7,TO$E6+YPKo29YL7!
gqFj$EB8a$5e;m0c1=mYO*dhSgWm!UjgM'sK6L#cQ`D=_f^<2h;2^2E$pQjjSJ$Hiq)Lc+c0
a?gUrN?^2Tat$HkZQaF?Mj>dPQ[JVauV5&jE9aLHHRsI$'<ODX0m`1@X>?i(0UfoYGWuS\CP
8EA,I_X&L[iC`S;eppe!pEGZ>j8DRN-%:7\KJVRBpX7:8`kg:QC?6h.o?E*sh*76dKn)f;s;
57Di.C2_>m:IddR%V4+B@YH-C?%jIRTQ.)^80s33N9^")mVspHKN&JZ&rC&Cgh\k&ItrPAL5
pH@[b6Bq%p`I?CChuKCs33f#UY!E^rD&E*Z/f`GZZ1UB*PB`G-S:1Z>V>j!7j,ZCYFFUm:)n
-m%!nA'.V<7^m"cHK+G!b,\nN[/I"3b(d$SD;^feD?6FF0@<K/)]AF!@Ke!d2&E&1]A/WH:#Nf
g*62'lH\MC*AjKMRC'2%8C6o1qK;qJ86MA40c.[Nn\EY`LeFT7j7D!WZbN?,[b+`2b[(tgXj
a43gcsC.[q7d*Nm^4Ou(@B,^JsXP\GH@*d#1+bq7jWK^*0P9q+g#R&I(m`>Yb`aGKt*P0Io?
S8<4&Y6Tm&c2%[5-O<u9s):*=lp.kMW[eG'%-k*!Tm's2*@1$,:(Vd7r?C6@8#9PIXB5R0BH
@B4o2;0o1F>gR]ACuZCUMtE*k`+8D8KqW*o0aFa&1*F3(N:WNjl#Pl7CHVJl>M\E;7pd-cdYa
8WU\)G3&b"5)e7Q>4t)\V;U^=.UMJ#QR0Hnc&TI8r*Yt#4.DKsfUda\m`f>4YrAL7A*dlqI/
OU]AgMgJ$+SREL_W)H?n"K$L,;@f(^7C`=Ol$Y^s<\7$'4!u1:[2eq=p\>93:ZaJR-q`P'>QT
MmpOSoTX>&o)K9hYlL+Z/(>M\2)g0@uWUL=uY\U\2]A&SdN:k%ta5=3Z=N%D6F-J0:Cc`1D[t
LASgQK`S&t=<mdH@0dR6Z?qhS.Z7r3kY-@u8E'TW:Ai(`E^`$afYl9Z=?6n&R)[3?SI'Te>u
FA3/*_ahFjLmTJ5)=E&5A??djUU#Ja`;)cXS:5ciE0)[?u6cA@R.<<1:\/XjBM2Cdb1uR4VD
WE/=C(JGti8.T**=7rEM-?kS!U?b-kK;+Xj16d=dLVgMPYJi$6C!JQ-N(tN:kD7WJcN_/?"e
i^@\%5VlB32>uK5J?mmB*ia\)SiZ";V@GE4%?54T8AgNTCP9'e$igb^A1=ZWMSEK"B>Z`@7X
*M!RP:ZS7KUZlD%JRn`Qn4s.fb\&gYsD7E[r4q.NX:>5KLP!^;Z:jJl+H1Lfi40-:!5.9VM]A
F2[Fbqo-*T.g"#/fOcZ;L5`o1X8s3Vs"r`MV%HKS`QVG^=li$D"[%;VpJNjqN!:KfV(U*__U
aN%`kohcSCnbVV=XjGXU%(9(c+2/0Y?R3E?Ys=)PLPSd<7-?rb&\12p>=ZQ"mSp)c.PiJWGn
+aOf(b.,j5#7&#tBN/u8Bf.C_"Ec'%_j:2(7Gn>aV[/t;5C/]A4.jq/`(Nr!h@;b'<+.aW!26
@ggZq1&.##:<d!nep(ee+V2uoX/h*a2Y1G5Q(<V!<~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="480" y="36" width="480" height="235"/>
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
<BoundsAttr x="0" y="0" width="480" height="36"/>
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
<BoundsAttr x="480" y="269" width="480" height="271"/>
</Widget>
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
<BoundsAttr x="0" y="36" width="480" height="235"/>
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
<BoundsAttr x="0" y="0" width="480" height="36"/>
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
<BoundsAttr x="0" y="269" width="480" height="271"/>
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
<![CDATA[1008000,1008000,1104900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,3086100,3200400,3200400,3467100,3238500,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
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
<![CDATA[m<f:@;chPb?i;N3V1j10WZmk!NquJ(d#*E;P)Qe`4/d7;IIKq4UChbYas/1B*?A]Ap'\ZHA#i
rG%81S/6!!,D!Q"m=M>VShZO$jE8&g;qhk&p:*q1h/2<p/MS^-60*?d3^Ff92>Gce7KjJ,?_
L3V_a[)qI4CfY#7:c'n=D9/"#`ERq5k#%l,+jP8'&p&<.b\[*-ZAhfm,l%PD+(=l.fOg>!@?
<*&teh#X)CHktMb*V=8rs=)?GChDN[nGW;%m>&=\5_tl9/#EDl`CJQH&o)3mco2,j.iuH:Zi
_p6cJ$%LYJ+q5SS1Bl-/oI=YHpqZC;d3&:_7RZd4C(W@UN.`AR#N\X>.<\SSL"lk<K'f#N9c
XT4jqg"!t)(r1FB@NPO63TZX4;K!.0G'-i=lFCRnZHE[>(f#Io8I?fPLu:Fp``-l]ADBIJQIJ
%E^lp5oHMck+Q;Gp25_D5dCqntfNQP.r87QqtET!71skKKoG.JUj>F7\0aK?daE_j,#t)\#6
X=IUg8ke9K0jF$W:@O>S&\''*<TOHC)<@!#EI5_hfQmCD\EP8/D?LlXqE*$PDbq:ug#4Ss]Ak
M:",p:`:g*6b8kJ]A)@s.u.C$jcd@!4.#b[gQsqkg2+GU6_WV36oEETg4RQ4pT6T3#[h\g&Kd
XC!t@=ghLPS:i"u.`/)iJ.kIT&,Y9sr_#8SgiV$>mZFb?BnP4FL'(R07G7L%q==k'6*UsgmU
+)S^9bALFG1f[O=Q8dH_'eWkR4?\qdqYKc3)G#VC"DodQq#r-l_60_kd#Oe%_s\*.L%6Ud,&
\S+Xhr0L@e7rH'<PbZ&"6#I2`;-]AWVAtr^Qk*q;Y$0HBXFs9C&Mi=C,!#+%bO>EZXmI9JSOI
p&*[/+oo1S$X*NX)mW7F/DdN1:mpt4D$D*XOaigFUMiqnu9gTpjEO0>\3]A$tQD4^72_QB^fa
je"Rk?91LRb>#_$!D_m(>?&6Ci#O"oc7:#5I2ul^,H@F2&;lC'Qij5n4$S6m8/u."p_76r/S
e6-Z-<rqk/,GOJ,^IY`KhFY'*VL"_:E@K<ZrPkK/n<&RKYWRO"Z6J#2ah:c.3;W4gFj"\M'R
1:BmLgi:QBH05f\H>:k`6"!da=[==_Xs;W+L@VKLK9HbXNaO3KeQ#%CYm*`n9#<pMSmL9i(o
X6Qn&p'$`K?^n4.DiF6\CFo%NL9#qY*@[<o1]AJ;#<Xe<%H#H\[up0o1em^8$JZ#c:Z:o5\i>
iH`\E[P:&#T)X;j6lUeCr7RM)[\eM6@#[GMDkYgVP&\5I?^g!kREd?X??Y.2.P.0<!Qs^+1k
X2qt&&/,%aM.F:EVW3(_%(_ZALMo@W]AG",\_"KDLWI)U?2V^h+^&RjN*`RWHc@`1$;K?#\Fk
m%<$JjE?b8Q#_@(*nE^*gB($gUUb3MYldSp:rs/oTdpInF%Q970\W3WFeCk!9M2@9Q,Mt_LZ
!M;5"YMZ$*Ob/R-akWTU:hsS4*&&tD8]AdS,UACF#r!s^n%"3+b1ZZ[h#F&_6S.eI(XT-U<;b
AqpEpO4C[bU4TgXUP%6W]A99@a:>7qGr?:o@jjqb\$a8PMD-m;5cW&MRgV$[%/BSJV]AirN=3D
_9;eVi)qY[$IW(>d)[^+E!?N3<R=[OR89T.B`,OV&G`lKBZOES<\gWVdJm)Y)A""-DRME9-J
g=,6%A:6o*j5N%a'uNGB)&I9([`hmjGTYU)S_WZ_@+W%3U%pV3O\->=J@rHDBu]AghE4X2lFl
!FGjs<QMXG3Y+MOP^EJrrPmuQ>;WWR#C:[fUmGDisYp9Bde`oM?QO)H5M]AiaH)s7s"_VF1gJ
rd"fa$1.JJB#cM"-@b$pmpSh]A+9cghfp(K#HBr]AR'I^g0"5lWo'LQiRg7;g)H]A/#_6I3NGb(
4&)O_lRG9X[)sbshg^@O4V4hSq<B_qs?i^N&54_5#iG:JhnJ\d_cQb;<3+P)FrZi!>tERO:6
iZ9CK7b>Z8"OS8!1Cd=[ojYh&I(V@;6eZ0fL8E<^Q*fjr6%#e2"$_T8Q6D%O:+#&G,Z4/aT*
j_Frgi%9!eEnkjs043$*@sKl<,9u5[8A\qpfeB3<`hAShc/elEln.809`8>@L9BIq.'V=qQM
VuA0*P/gd?t=NYsBpdB7Ea)^_j>8.7e55[P?!#+#]A%IG>^1!VrQmWYF+h[5DU%DT^q6@^3!<
c5f^u[?@8-]A6&LsXIh/@^:.M6O3*+>nNC.=oa;P%PrH7J\gnFo:ak]AY4H2eGK[83Qpi/s1.S
[//\%=f*iaTNQ.LpkOeWZ/RSWSMm\kD(ub1/Nn=!k,&r246f9Q6!RDJk"`U.B2a+"ESE9lOH
)T_mR&[j=s\\Ppbi8e7ZV$7:PVLR@!Orgl#DCp4`Rg#`O+F\3$MPY!NRF:K4Sl906?gmrAsC
<F7'9XTmb@^]Ahe%"$b#(mQWCY<7%'I#^D]A@*+FEf3c90%`ej2<5Su1NN"T9j%oB2'e(e0AlI
a/Bdn5[;`V#fk<d>K:CLQ[`hE>8QGjG"CajN75_5u7l9sHuTOYeU>^'%=m\*I-Qr>6AnK.LH
Mg@;]A=;$EjZkd-(k(*PAD+d9U@(BEg.\3!hc3CRN`1"Gb'H0e\rep`cUP4HG-H<ESnUb<0q)
^TPGI(miFP>rtg$d&#,<)jiET>n>?RpEBkE((7A_2P*\ut"U"VL$!\;Cp>UXQLH7cOIl9.Z)
uN'9&iS7cmopc("Z?:?gnP]A\+o#?Eo[E8f]AE]AFlooVD6]ApG/k4\<E>=;VhgXaYl<fA;'mMW$
NC!eJH5JUX?%ca5Fk5Ea2_>^,hF&feu"`cG$@k&:WfkbD$,>>#ZB"G>J*SX/(aXT+)3M9NIK
.6HFZe"Yff`?%<A*CI:PF?KB:aO!q2X]A%eN&Bk^in6qZJo^HSZ0jc4(i^O&;5P9Z\*0Fc!`K
6!4BNBSSW1'?t#L]A1fFMbM@^nj"QOclCXN(h<o*?%DLdZ_:c2p+Hea_A#mBa/7[JZmOARV5h
Gs`7<kTM8BR'8H#T,6h10eYHSNK`5Q>>,$1itD:C5-R`DDmQW#[M)dWIATH#OiP.k1%Vhl[\
qZ._'.`R!fR#/md]AU#jn(Z1O\O*:OX!9G)LA/Nr(e\<f!.-&Y<I1&'M_^iH(1SD42(m9&oU3
qM4-$Jtj0Yl/YmLY$QS4Doe%;Y+NsKn>qPnob`X-ht`?CH7$._EQ;1b[/Mjp]A`pWU+Y$%.sS
ha/:472`4MVOoF&$r)UD5bYTqI5,`Om6rLFsq?Y:B>V:]Ae@'c9'*F\C-AYptp7d%XjBo7$bk
dSc1f0(::0c2F+M3CKP-PY^3b?Y>J:+VSZ*ZVk.*(:d7QQ^V?h2PFCk)uP025(b'A-8bYY%_
om(S/ped1/Fi?%W"JHGI"A>d*"Bl"k1:]AX\Nee?="]A%E&U^NA5Xbo5L%@\;"o=SUFM@Xk5A#
XbI77Gir!NafGLUtaYt;:`no:V$tmZDSWS;nX8)C#Grf-V</;tDY41%>E<8O$GMfC'!dtJ+f
H35%2P=i*nZk5]A74Am$)fgQ,r&XM:L3b<-bhWZ-TD:S]AJ"DN*poZ)H;.@Qs`3nQ-2W,@d[)T
68gQtc-Y0@!jK@f2%JW*RUY9V">)iZ@`Bin(TWM?Q<>ilq2H%2NoWsR))Fsjm-73$4>ORZ_n
3b*e,Mj%F@Seur9MR6Z)ms&u[@UAr&krgF9KfV'hG?ebRj1Ok_\b=siRiema_GHtGQDp!4B*
dURY)8C>0I!.s+E7kDSgHA!M"O='\TC^VQLi@#f'^pP'>M(^GMjK@WkpHbXuj8RU2"^M/b+P
#pc#No[jbQ^+mka$UFKa*%=o<o'7O_:-+;ss\=G"sa#9%=JVn."0uS33Q7Y#g$sfIk6)HD\R
@A&5^2JTU;aHf>B-91DRG#aE7s1%^@K).Qir`p\!2A;m;3!>\=AU6S^'Zi&g6+)^a[5`e(#D
h&LLP'1c$_]Ahn&b7m@$5:J?L2#/c&3@NLlABM8V3(LQ@m5]A02R"1ffQ>;=IB(R==(R8W!_N'
=TVYke7uAFRfV=#L>T'CCL*(nZh7_Tr5lF%1bV:$BeM"CD;Iig,NJu`Eae%7GeMJ%908fk5^
E(t7cL3dIm>mjX6nL[g!pMS<uo,a9a>'cH9W3VN`K#ME+Xd5Kc_THTcco*Lmcf99b48em<qr
Hb]AIr#-cX.s.Q2P;F`S:OO3n''&3?eTAi4^J9J^jEr:%ZdjWY>C39cpDiCl'0POdd<8Fs=,0
Mt_Pjjeenbb!PRAB1eCT]A.*:7(T.?*PX2=rEoqQIA"@59'pa)(BN<#JLA;Ir-3KFQ*#uKdou
;EDI2[u&.OuuL+[Gq\2HGIjX'11+u$#nfE2Cp$Jr%trj51>hL'<(q)'gd$5O-Eo:eTD^@F;@
N8Zgh-$$Dc]A/3\_)<TYm,5A^f1%_)4A9a;ld3]A$^f*a3QCZAXfMe9)jrqa=>Y)uG`OW?<fF-
]Ab@aWFg'[mln!B3`">$"bA;6hjAkD6CFSNa6KR]Ars]A?$Q9UOmOE03+c6*@\0D'9QBUKCAX[N
[WGBO[D1gI*DbBjEkW/,0q;)bY_MRhN8b5N>:.9(XKc"N!Z[@7$&eIG`H]AD()Sm)aOfb4Ku4
+XBQ'qmb[D#L^NQJ$DkUQDsPQdf)F!.<f1Y9n[`Y*-nR*@gMK9L?Q>BfjO9L@+#I_`n@hs$B
U!`Per#0:pL]A&$tGG/,[cb#O!S4P#;oKJp?ut+."(LSkh[4hJq41VUoqnOWO$.Tp:cG;IgOP
>K?\J:>7:t"d,#X8K`M.b]A0Z8A"FV,W\6)_=j3ug:HRA)rr*$Udpod`.29dp5+'PdAN<UZTd
.5!;cs8t;T135Pch'_,[S_!:+la\TZ:T(njk*p*n8:'bY?(sA#B)]AV*Jiell/j_(LOOL]A?ju
G#.@XR_;J/61kck(#)^8,\!ZoPJOq5]Afstb$D\R?/4ZkY"A8s:P>GKrl/D&rt>e/UeCPP(IV
bC9c'Qc.8[[>"4:6GG5dN+o[!i7X<0H#[@&PWDBa:<KJ6W$Qqj2Z77:=OEG46btA%@%W25_A
pL;=A^;Y','A"iOS$a^,8&[`?C2S=]A_cCOEm]A)O<@`Q:So^DOV=ImVn:$l#`WB&iMA@r0,Xg
0f.,]AANNrURlc\\Hcti_)*InLQX5N!26M\K:hgCG=GcCS.T[F[:AMcpEMj_&Z5IVm,md$*Gi
%+4k`2dXn@)<GlDqHP,EcRjPhXn^_GdZFp53tGq4Pn16$W8eR-_#rgt[Edm.C2C!<Yc6=1R*
n9%-O3qBc]A%W3FtC:0GtHVX'o"D+'JcQe$llBT.Lq8.LHf*sP_]AMEEB]A0S<ePb;ghXSb,F4'
+7U%JgYA37EXrBO1cK4A)peMr^8,jl0MjNo("$.RggMK:'ZIfA#?M9qB6`NaCdWhe(_71[CJ
o"OnQE#<DmAfBW"fg^qe1f(.M`\e2h7lSb8'CJ`gGb%9l^&cVXMr2u8hsk"YBk7,Tj)d_`A'
MldT:W"?tjCnOU`*;m2$!YC:DqQ@$5VSZ<Mqjc$AiGH3Q\r*`;%0UGSp,86X^+3=1dV!Su3.
YU#T@0]AfKrlBie-ID)+`O%=(X;l1^!c5A7ODM%'Dt/e,^UgO=/0ifL"C2ZeJ^d:pN:FmgsIp
4\,BekeK>m2+ogB.,Cll@^4M<)S3F.8.BTRXq%[/qG+5C^j*@@3g)(26)=hnH4)Giu*SQ=p-
T-C9*eC:4:O&CCrU1#`j4ZA3Wfr;CY2O;^<&b7SRbpW))6ZJ!rQ,Ln+E&Z+JdF^^\1eGdb%G
e]AB1)[Y$;D,p>Z,lG\\Qq,lMO5-]A86ACM/5t14GC^I+mHaT,QaKdA\_scKkX%P8?%9,1A5JY
36GVU[^soTQkU1SW:'rV%a+3gR+D,'kh,p\E4gQ:9o(BP[/.\J&s'YDKbFrK\CJg/`VrY7GH
u=N2/M98.5aJfW(;"n[D\su0(-uXhHu8q\+csg<?-s@X)-G&pqWfDW:b^Un_#f7q9Z+Po.)4
gVDqEs+bFVJjk/l"O+LI0At4`NDr&MlWS`\<VRgMoa'isFM;d+ad[n>@3^oudJWO*+M#AJa-
A;:_Q7(u!rXB8<:)5sTaJQ'3fj1?>^:I3$IXOU:]AeF_.$:4lI=tub,I87^PX'9$[Z9d5q3[*
1(^?QMr%gUnJpQ'@S)^Jj!caG7Ye?eg/AMcpi-4Aai=pQa9B^-_F7opEWO]AHC5*t@,B#b\"o
2)h-Z@KKuFOP8bq5D'sC=m.BRoSmY:OU,n&:;3TScK0@Oq2DXj1Q`%2`e6g0@Bd8>@E=p0/P
ZCJ4c3F[BMZbPDLgU/Q<flC\Y1f%CJ+ucUJLnOYDpU'FNWVZZZr0\GNV7DUu7-*gmmZ`3g4.
15b6]Ai)Nom#h&Jrlm$r7A7iA("YRX&0$1G=[&"U@>'2:=6^@T,5lFKBYiaHTgee:,U)/)"fe
CEEX;q);+P%kN@gM?AB\VajF`e\mp3Vn5gA%#F#-do9?P=q`J-B<7N;@l$GEEEgE^6t0CJMI
]A$V7teW0Yo!iTVWo>8/,m=>b+I(?57Es%/au+C=OP;I%Ff_WfV!\7HXSH!dN"N*<R\u?Oh9I
?jOO[A$?45CP:0):8,,)^>7@W1"1$0G::O^8CQ%2HXX/8>@.MJ;PclYKP+,cdCg?Tp*S&L9?
*fPVJPq4O)%)5"KNgV%I*+TYklpr-\G06;VQjJDfMFBL3e@D",,FhI4<`-20GpQ:N\M2m942
l#KnO1?t$OM_hnW1E:J*l$<BMXXj-4WUGFE:hVf0_]AOX[1O;,97at6B5K=TrW[fdZM<6JQ@;
gJ&c,&)J=(ap@Zc8e1EVQ*`B)WZ\u3T99MIiKB9I,nB*Y-oTo4Z`kB^$hZs:-2]AU:nOF`N:m
NblYAe[9,E.`G!J"8$$t,>%F9EfX'9_7R#'904)^]A3>#T]A9fPKu#g48<Ha$M8f?GBu_%U3Zp
?/;1@(6R*/V)nNil&gAqGfQ^/jcXW;84X)t;tU&i#$A/"k<^dk$MN9?<l%9"Es1gCLALsZ=U
tAPh\k7dMb]ACWWqKio.@o%npPRD6@eQ]AI@YVPmP=cQmhekiOB_a?A[2-P5W9HM5&usYfMj.7
?\A%Ef]Ad]AJWcZ)]ApI&2a_6@nlHT`KiiB63OK:2JA0f2<H7p1M^]A&(X\*UmjIGDBHXBF_*+P7
D\dOHMYW@"$EO6>7T9]AHf)5eJ0Z"r4#kj)En>4!p&0\pl'bJ[AXmgN-`cghSUlmT_in$P;u+
C0:TZ]AWg>'X!=q'n]A^!de\lfi^ZIns7qil`dVN2U:PBG[CJPV%;^5"@@<[9WMjCsc0BCE#tX
EaSn#/>@n#L\f=YA(s0*W07MJ51mAZ.4$6Kl_&H[S373bD80tbH<V-1hS&3Ul\"j(Y%@'T<(
c]A5kl]A)prA;mPs,,1=?D&'hcmr\Y.UnO4[&1"O0,0M1H$r[LCLTREV-&jWA8\iNdYULpH'f9
;\>I3XF3]AFR[W5.m.\_jaF,!lAr-hEfO4LYJ\u?1aZkK?($d"tKH_L7O[p-EibjIgZ]AlteSg
J?Fq]AK8u4)9I0aqV6*^/XHT`VUAhaIU1[*;E+"`1XRi9lZUp(%W4f.gAIl>>G]A7/Q7nphFB:
)U$Ok'09Ak`BJWrO1Q52%dRQ8A5L*#_%N>LDP54,r^V[$+-RHp&L%Dp@k[[hFAE=t\Q8[Rm<
]A#VGtmr7p@<*MdE_o(=tL9&'.%_PdiW[/Ne4/5-B'OI)%LfoLOC8#.rJ;gl%bt:Tu@V7N']AU
"l'Tru#i'\kgp\><:U"cJ^A)UEF=$?6>kPkO(Dgt25&?Uej#%Vo)CEj;H67))_HK%.&aj0@E
</YkW(%9X2JcCc'h9_R3l3ncbQDn1irqP8#SA`JR#kU4!%:"k_YZ7kVDohb;$P=:0j+D!g3:
gTZRlag-nqem[$N'`:*f&\?a1&Ipt1@k=F(tArBkA-6MMs7@59%%"e-JiMqqU46ZH/sS5KC8
]A)f-3qEO-0).JW7tMd_KgBeGPlJRi`GeIjkPN(BLRM;fd;L+"4<#d;X]AH"p3(fgd+Wh4D;*L
<$jfISh4PABuU98J@O@aI-haq(eHB[.F(0.`+a`c?,f!<j$VQ^?EAm7YlfkFqqgjAlqL`i4i
=54IJ1$rKtA2\2,pU+U#OY[4pfc:aY_12*g(^qWE4rm`?"Y!`Orkr^7d'sW]Ao:T+q>*Pi11H
l1)5+MGET#O'h,g>hA"f.dBFS;><dBk4aqgZQG,*0V^N&>r'fTP"P-fdpD#Fn")]A&CU-%ga\
7%s5Z(R<pktP)VjH3-lmtKFY02gh9#'[?<h,7hXNldc4l"+9L`K9jqOR2)9cE)8)`_Dn?K[7
C_gn6r:JaQE=Xl:#jr,a+F7U7ublGb>NfBJN$dMh]A!qiW.'GB5WU(XD,)Vtm/j6Mi(:7+lRK
n[&MbOiG:Lpjpl\]A``7n_`nC#QQk+X;`Vm^W$V<o+*dA5o7.`oemU,.2>2TE_L#LlDXP&V@(
gJ+/$WA,).3A0)0iP[pL+eD'[YCn^R5Ka$=+.f1)JA.lRMnFcBO#OXo\H`K%ZCLDgHhU#d?*
=O-qu5Nd-QO#[&_gC`nEcauK!M\".lLVNGhdiHE^D\/oOq0_c:F.Fl3uNtM)ig7NHIh(lCoT
AX(%*=Yf4=r0^YW=hqX]A>6*G7H41F)X]ARZH=GdtPJaS<]Ah0c?jn:h2`@U32cZ7Ga2`nU/MN3
b*PjDQbn,a44<1\BPm+C&oEj5;4r.Y!p?uPP>4Ks%,:aG<;5P\,fo-k*t3*aQ=LJNA*&A*:n
gI$<#G60u,Hb:)7NDZkG-7$Q_en*YbBb;V'h*-tuJtR+PU$k&_dWtG\Ys(-ohn99qVT@3r)T
u(XRi;D.J\?nqR8U]AGX"t2!''#9A356Ff,%,qI'Tkp#J?-_hFulWrb+3"rYe8.KAU@<r:G"Q
^fhl-lfX6>1V:EJ?=g;jKO_o>FDI[-1\_1NJdK`uuSM$`mA>>E&d6clS^sDkCr^/WKNkL;UW
$7pe)[64kdiW1#W"dQSY<L4hku`*k<$PT!eZKq<0?PkYeTc?LppG3&LWc"cdE<CIq16%l:kO
m.ZOqg?ngUX3cp:$;>W0".TWR5j3B@j(gS_sXg/+'_>>uk;\nmGT(Gbk7JTX6.^0GVPC4TME
XS5Z"&N8RpX[4(k4WkfZRKkhY/ba[#<H&hQ\N5MK3!CU)WUK``jTR8;G]AAu_9HQ^H1d".;2c
0GPatY.HA!8JJT.YDHQp<:hn_8<:B*nV)l&h^RJn3::$MeP>29MrUc;a4/MD&'^.J9OXFapa
S\_pAa.1A_,1=J-mo9MD%T?imc(h,<lV`pbk*Oa5\S94!-/Mkru3NAT?;^/)[rp',FrmMCrR
`]AZ:4'h:UE@oam#3k499aOq-W>_`qE*.<se7+4mr0Dt8mU\Q9l67n@Wh%)$T.M15=sHL9>rc
cU&O0ps!(l77DaT$1g=ZND8i<qNn.2&(EoG%"/20/qhPXa9mEM4p/oj3V@?=-lQDrt`\_%!@
&E#91OBZt+C@2^$WJ@jkdPSWd@b:+"67sPlh>A;)m^M1ND[:TVVP6Z,?GS."VMr"PXc@NEIY
ke#9d'X<\>[#E!U_CfgmS7JTQ"qqh)2DZP`Zlo15qBo.^G'Dh@En*P8*@en8YD9B$j$_2'@:
mMQ"jclJ<p7Bja,E^If02Z?&/kEdi&M7nG-#?nQ,t%p0FX.=c7%c[K&W@3`*P$YWb5#;8SXU
:DT<NMV-^;$rp(h;Tf_00NK_.AqOn:>fI\j23'c".u!T_YfuaFY%Vm!UfA:5.98q?>HBcg5$
L,U#KC#5iHatL@+;=s,t('[MTFTfUC?)L_.**Wf_]A+gg?O4]AE6,,J$K$C$s2H@^,RYrS%j.]A
K'W5A/C5dCJHP!uf:n'Ljs*G`c8.=+YB=!;rO:&aW2*sN&E0sWKH@N(gQ=*P_FV5V9J3t8oV
?`X`1E/oIjRT#j<&kI)bMSW&\Y5!(p-XaLUtHQ-PS^ms'6^J&_U_%%h;DdY0:/la9Ze=DL;&
[kL$(BKVl*DC\mLago0j<V=0?C@X8KP2efZ2q+"N$fK\4?"^AA'*G*&"`MI6Pr`\$r9S\/CY
8s.'pL*,X`(m3AG3C,sSUV?`'&$LO2u.Ni3bG]AZ5)Y<tN"^Ri1`:kjI_+&EC?Xh<B'qq%YN8
OA>7obpWp=q?HIMERn;)I)/G#0:0,i\67m19"dV2:XmT*`j\*oDif/*0Js7@YSf0cQkLkQ''
Kg'Dq?(6pO?ZZ$<`@jPUHo!CfL67\b,pq7qrhWD$o_cTo`"W]ARDFqW1^m7u*_5HPoicL7?X=
$K?bq+;$OFC[^K-a^?A'jr5mMrTV\=s<OF.\Y$r%I`nQ"GSsP?.h/Gt[NDR"b_'cEjdOV\l/
UGZE4h4F(KXm8lTI0r'+"M\"o\+XOd=T[Z>YgSqO.JjTFhPn`h]A</RKgG<7abA4(QkG6MVU"
9T-eOs\USX2QA9/egtR"'XT4Y_;ZjdMR%fa;XCsfa=8Anc9PJ"0!JE(i4&_$TU]AlTan:t:sZ
!m-YW'H%)mmFYc6\I?N6gm%bOH3:Bt&RHQik@k.RHP%sC&5Ra`27b&X/6qj4-%C3c,:K$^<Y
Edg@IY)\-A+9tM>V!J&*R@iM5-Kh254XquP%qP<cb7B@%<0CfRS#&MN?GOVo=jNX)D7bHMjV
.jcerMJ7rjp,-*9:N97BJuH]A^m&rNXactWm:i(aCrg6f$DZ'R%7.r]A&tSDPEtV+PEb`kA.G%
enBL<TS1.lY(8F!X%jOt+RqH%Dih_Di`QH&p?,_L\Ap5Y;i*-(GFgt5]ATkO)^)(AZg\Q?Re*
1;$q,[2'rc>V%$7<4RAGP&sY*oIe[7WnZp<S;M+jn.6tKHuGhZUJ.u;p5&cmVRGB=*Yjh:;X
TKWDhW@l.!KODs4p7ZY!$TVO`/`e!,Sf=?7u[>#q6Zg;ThEg=Z/B<0HS+FZg^Vj/!!$kliY\
P_R]As7Ys:^GUO_)M_P\*8W&SVJC'%f7A3<=QP=JKFp>^K3a1pTXfuC"E;MuP>WsOc>9*#LBS
$:<5ELUXH@Joc)#;G0K$([#3F.VK2k)k3/Ci&_1-%)7O!J2V6I2F8h89(RFhgbOoLNY"VNU)
B\K;:T#`fnf\qsHkqUT/)8b9^S$SOa6*?8=XaV.eIdl]A-:8BcPYZdg%lH%Ok-0%58ta6B5EW
eRTN4163QTNgHr)96g5^)6[l`G`7VYEIL-IAsdF<F5@g`Ue8q_lGfcld=Y4)Y1Sf(VZ$`PFg
^sWn'P=[+b:V2A#;)^=Y33S9%58p:a&P/?Ae\^&PdlQCIAL/X06h7/c1$p7GuhcBc[ZCT7&n
8on0`<sF)NS4?;,jmRVGOn53f1WRmJ^Fb&Udj`0QOgM/rh_G)0`3%,8lLiMhP;B?O/<,IK+7
u]AY"4%r*%`UBacC[4l\39H5OYa`4imE#1bZgR\*/.QS*K7&rhY1V#ehbX>k8]AeRqt"So24n6
CqsmPXc<(3f'>2_si^X#XBXJNoaspN9hY\YhkfiWAVIH+o;`UIt>C[J<\jU0pGp`?TR2sd;h
G)q&'lc%A^d*rl9>T\Whe;ArNRKt_AI;N9HCUCMjFo$e2mp?qT<S,uSSE@;Q/.)<m?b_?#[Y
E0*IJjb]A.(;0V:=\KkH3Vu]AFf)^f$!dPnp2AQ(`-8qc'R.d).4Asbu<>:J*5@.*#`Bea:mSG
32TUOS[l74k28>>P!Mf2(5"DQ8**m>)MfK]A57G;#Q@r,VK=TR'HVl7SL*)RC%)fl<8.5n/nc
_CoabdOO:o(%a&:n)6c*4hpAE!Y)ha;ZJ(W$':+OPDKg>@T7<L-\qMH>9/jpqjDn`3bjJ_@c
<,+NCDk05r@/+i=Z:TuIl-h[[u#KD62Gp<2kHa9j\2u@g#Qc4=g/,p)7/'ZYa-4mJWMH<?G9
;4*>d(0TTIk7P9FjkHX'F[_(HO(4NgjGqJN,^1Qeosq&5W>NI3l/'-Q[d;:7\O6$ojR'Sa)#
s*R<`7L!GQ$@po00of4U\G+P=9o+bYkW8T^L#&)m,`b5%45TR4J#q(V2#U\Og@LcS/dQ(T)G
J+YX@eMQ4$osT!Ug4d12#f5EdRktP_7fQ8(6Mm-J<#IqJh^i(joD37PWb"C$cQA*[C"#1ZW]A
i"FUuHFFKdUE4$bYVaKOT$J^9[[a'Tpkk*%g9ZYf#sUSJ]A8Gs56,)3apDai1OI@m5\rE8RL!
=2=mM[)TarNpl'&mCQ5pb)qednN"#bPS+bBN-HLbCK3(W76=JUjB(.c3YPj&*O"=TW2+-k59
:si:+t2]Au$nb@'BB;*f+N$i.!FRbYJ/i1*icFS]AK8_cA;=@'S1oC+G4H'2,TJ@W*`[4Au#OX
@UJ>gJp\GBMB&gLI3AbWaro7X^,3;r0cpZsrEIIO[*$G=^:"^qBc@J\+VLhh,]AOC;.HQK#(I
3#@"1Ps_Sqlgbbe3bnX/\T#_N\,'HL:fQsur:m<'1%>4OP8]A0jFCrh$Q@bEd&b?q0F3K('Fu
$`d+@mhslp$H^E^,m$+"2p.JnE>I><1TV5!($hG5;''Ss^rA6,1ii1P'aFmc'2L(lq);"?1J
7rs`[63IN%.=QF!G(er$3@39r/S1c6#i,$4U2q>W>BK;E;>Jq@V1&G,A\o6=WI>Ha4`?at"e
*u);OL:p1b'9FSKk$*B/H;^@qLbc2RM9Q^Im!URD@D!+-E!5$SNIor34;W^&605$g4NG=KS.
Z?/1>Yj<0))-Qn3>Z@7kBa0j^,WU6/g%`K!eE_Q@$&qK.,jKnIN.1V6$ZG5R$E*uM,3$49aa
ho'5E:Iq"W8[<O"+))Xf&K&9%O%6cL148V;*--=-/ec"mg[Yn$rX^F\jp^P3+YXG9DZYr?3l
W!6FQ!"J$37f`.fd)r/Gp:4"as2HI[[#\chDkCasGA37:Fg3_]A/-l<f9gLf/M7E^M5Vt#mBQ
kS3s?Kl'!]AEjij=8hnSD:XtS^/W<b-@gMWf(n5&k/Qq$3Ss)XQN@eegZ=3YfTWZMUiik+IH!
_j`8'PBhokKjT"4U\(ofXNc)6Gns\*NQo,'/!fn$SD9o%a,org!Id-FMEa;F*>d23J9KZLI$
L>4f+F.,ftXLpDbSPk([r+/<orAf;p;m1k#k>_CbH(4+k_?#6q3ok!8;J#[[WqfL5KN:12jT
i1ne/aMMS:j#623pVhnEB4@UKYQr)qntO(>[*q5OkmpOb'@/k\_.T5k+`XO%M0(p\egCMn1H
V9o%F)Mj8rPE8ji`4h<6@QVLibJWB>!1b'$!Cd/%9EA[>,rH\EShZX*tVka5?OrQJJA$$DmR
9pW-@ZiOR<rKfJVYFC=roTIlVganPuTMS'EPC@0WKMXTIS*@s?0rTeP"pK2]A=0M`UGY;mrlJ
<7!>)kVeIj6al9l!Xb*Ou<OS#O<)3ph,3#HS<1"5=pDJ$IM%Egb#Hu/U.Sg,\[&bKMs8MGrf
/ZOa-/".$&"q>O]A&XlM3^KlTP=ZD<E#![>s2>_J!A$(It_O?`F6,&\)16G_jl/We.C7bC7[u
AcH+D27P?r(auPH9,6D%=p[QrOANra2Z:7t(UI<(8k>DVTB08H+BpC8Z7GIk,%RZOkjaEhOV
NjBm;+ES5VLk)k\)0S39ZG?WrDQfkOjTC5e"FLf76]A+0T:n8T;T$$.g*k)dmGhQ9lEeQNoWA
lDX@Jjk"O[\rWl">$rlEc#",Q#3*`n'=;S?TddYAEVUlH3rg=S^:BX.4k)P5\_Nki%K,ajZ\
4$`#Tp<5+.U#pR`?HpkBFDf5VN/<rnJ-Atju)>2XkW\U8l`sk4,^C.f#Wh3qd.!H"kFOo,#;
cag5j$pk>[W,07L]Am-8,ABiX6[I23?<)<B_D=)(6a8N\f;+I/X4>rDs1?/gF$n4>QYIg<M?9
L@,C@QirF41f0R96'G+!T%!_giq+%BmV;)Z/jm(\m0F]AJJM,=VnujWk`sjnhbPpl5MHm+9DD
)"G=@:ZUUe<Ms6?JMj8XBipjh%80Tq]AU'`kfhhqc:W.rd.m!W>F?S(h'P[7ZoPLb)?Ks/``,
i\rtI'`"Z?b+QU#;Muq>lo-3-@Mr+dAA=C0hY0:"^O[8>T*m;<2;FXrX"Z7<R.*`.@-N;!(4
#7AR`W.QJVu=`=-YJ#tHn]AO6kCe(2@qK5!^0l<nN[\44r<1<3@6)$)CA6tgiQX0*J_lD*5=R
aL@,D*5%W=1qdign0b0n/gipAA:<`DGV=cNfU+M]A!9`kY9$**:Wo1Be7N?uVeQGnQ2tA,)GX
LsjE36th--^=-So(U-*u[bgf1(ks:=!41;dK9Vn0+DR1\UAs`p`%t45!R&[0!LqL[]A">Lidu
:`Ne8/1PKZaQeR$0H#(k6-3!+_#hVh(H;-%jO*iTCCukKSe?f7i=#pD@09:2U9B;fZ$lO35#
WbaH#a6q;K[hdGZs"*$VQ2]AN?V,.A!QYU6Q(.<lH;LZ0<-K"kKe4@OY"0rJI"[ful4A`#!#i
#.&&jV3cn=YNEL&cUmiR)X+\7Er1A":</@0feXs[i;iOJKtkbfK"Ko!8D\P*,3\eGR'lC9T7
;3]AgfN*$_lQsE0?R;DUu-J*F=t,;mSFX;*93q?lqkG]A9\8Dfaj;90nn<`i!m>nM0H^6+9C*?
3'F\-FqENc^An."m2ANS@C8iP=ne7)<Rp*t4$(**"5]Ahc1`?fI"GLe.DnVk`>emk-5i5aq0u
duX,-/\>c_%NeJ:`_F#r<f.1kdhQ?H%e[9<rWc#`$V0o2s5e#.c2PFa7I>)>jf.s8N,K6^i&
KeR]AF5:6jm,Q$Zp/=orU(Adfo#cPmed0/N2>$\fe09d,\Y-'iSLYs=:AlTaq%Nt.`m?Yn9HO
^]A;6Zm-KC+:)YO&YFcSDsII3O?2EP`F4n]A%B#nIk0f.PFPOg0ddOrN+94#nTbcg:c<#Gi;9!
k0MY,e1UO?n[n\G3n9ZDf0QE:q;O#.*-BOh*n:&NSd_]A>lB12fAN0n(hu)!'L]AiV*^KR%7u9
nNb5V*p8C)or@QWo:B02FcFJu_PQPfb^Js!/7OioJD2)So<7rsQbr7es*32T)Ak3G)N@52KF
r/F?<IldNMOMFDnu,mZN7bh#hqP6dA'lT]Ah"toVp=)XF@#F6_i!A2"k[B#29FsCirQ1(>9)V
16Ee>L+RC=#5]AOr^@PM2&H)se-@6\>m+'f)[.,U0F'cCHA'Tac..RXk5-1RUjp_QMl-MEtHD
n-6Qj&q$?0#0Q?Ypr.-!%T+oo>A]Am5s>"o5gY3'/pLeF4!Ui+dGEk#[k0+R?%aB,'DKFQ`,_
"sBcM[>iFR`5/V8KLOcYL*lD(HOFmm!\5KiqLC%[2sc92-\rr33~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="479" y="36" width="481" height="233"/>
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
<BoundsAttr x="0" y="0" width="481" height="36"/>
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
<BoundsAttr x="479" y="0" width="481" height="269"/>
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
<![CDATA[=\"    按品牌/按型号\"]]></O>
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
<![CDATA[1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,723900,723900]]></RowHeight>
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
<![CDATA[销量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="4">
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
<C c="0" r="5" s="5">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=b4*b5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="6" s="2">
<O>
<![CDATA[库存]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="6" s="7">
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
<C c="0" r="7" s="5">
<O>
<![CDATA[毛利率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=B5 / B3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="8" s="5">
<O>
<![CDATA[毛利贡献率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=b6/sum(b6[!0]A)]]></Attributes>
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
<FRFont name="微软雅黑" style="0" size="72"/>
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
<![CDATA[m<f4BP?6W0Rj_c(X`VQ3e<P2<Q9#)pU*(RM/9Mm]AZoSpFOD'bF&>H7hON"XD'p2O$:prckU.
'm>OY+s]ATurNH6@]A'@/4gs0&[IPt^?P@9pO2H+HEYrTRI:o`LZ_5g3QqI#cYrWO2kG7QB^6$
6Q7N"9i.^RQhVJP=Eu=t.XFBRJi&_\J0!t`\-$&n;S,RE'BPJqSpC`0&0Gp@upWp"LL7@!$p
@h!o4!$Q"EQb?.`S4>DYO6R[lf#=FgaRV`G=^,i[(+JkM!%R[*EmaMdlVocN]At3]AmeGSu[hf
Pi*mW_X)_:qT=W@CmJOT42P*WDWJpOTfOuCKBp-`"@MG&W'%:a,:mgF3c`O']A`mn=[sA"@2,
MA>42frIfM[IPmpT&je\f@L??T>U#'?4QBUS*8EC0Wq/dr:i&1JTSZg(i<fGc$69(q(;A;2Z
DSPIK-VH4l[U!IBOU-NC!=mJ,8EkdS%+\!i3LKg#f3rKYP)%nFc<35HYM!6@mEhSG,GGQ3m4
I%gLuN;B"YG'W/cV#6BT,kEPJ:Yfq@15>VLj:'J=6-#JN-B[1W*3\4Gn.\]ArX^FE"jF#BXMY
:jL7NoiU"XQBSVf!H[j@I/0;fp(:$F/f$?Ic;Pd@b:\,;^>3ebJ_AdC($L*"djCZ=FSOfNK;
#DfQ%28C<H-^1XAO9*6kMf#2G7(/4[/#I*UKI<Vq;0$n1?KpL?E_ebp,1i(W/s\#]AFX#><i*
jmn36gNV/"X`ii>`Ift.W.b&L-@'(3`T4"<hn(C0\H`O895J"rUT(K,R-SV\XsM^?=Y&s-JY
.3aE"EPo-Y,-G?Ys^EA%^r1EIXnV#)71J[=?M,0&XAV?=>3_C8ueR;2Z+U[3BR1d?iZ+oeBp
a:hnXD#83brloR`U%1GWPS[!Y0SjH,:Hc=h;Q'tPILr(f/E2'6/995p#P;W$@>JM&_]AFasu[
f^3(L_ObAlPhd;;Km$rRDs>nf@#G=8W^4:h#);GZ`*^R;-fGp2`3j*TGaeh2qG.]AoNRdL^9m
jDj^Uu3,rQdY'+CQm'H^A%8TU8f(auSjqA@[l;n?9%q31>PkblV!&Lj6IK'+S]A^'fksob#!"
d+?,3_#@9qC6uX-n4e#f$/02\A"fDWPkQj]AE]A^ZfY;^V>eSL'MN2o^@:BbA;G';/C8`ik))-
_J#.8qH(%#U<WAZc*UWD5D`*66uXHj@"WbL]A2VFJo2giBJuD<#("WZu$-L5-+reO6-Fh$lQ*
qaH%`Z/8VR?k?k$boQTVP!QCOS@Ek0l@,O=[9Ac>MQp^ND]A_s4V?re;@k!dUoHKFh=cDRNs\
R"Sd@s"2@p&E-Y&APQUc5n$ToQJtUpBpm%lfl]Ag(qmFuLfc&DV"X()(Ag:MiWmE`p9_HeH(D
iThXj:RW;^lpYTt^eZ1GfDs)\I\XLMf;k6o+CrTW^&cS95F1A:;hTGes1LMc@16bSG)"iYN]A
e`.L'W+Gn9cMjdhfSL<]AasnU[IR73_fd&<BCo3`1XY329!e2NR0&!8WSti,hYmG7S3mVKEID
`%kFp1rjP_=>nkTd]A$2]AT3c(OksKI1NtV-/:l1ct4kjA%]A`:XU_U1cuhuKkR*T/=+b\?o4eV
CG0\EPi)Qr(Fa/,p3-(S]A04BRdhjO;j5aZD[BdqW5g0M^^CO;L(UG]A[&\fn>-Dt_R`\ho('C
cP["m`<lMJA8&3nLfQcPRs+ZbE20lf<Jai1-He"3Jup@cQUm"=/(4?5h)CG:A`KrZkH,#IlZ
7g^rBSh\Mhi@gNPc3j</B91qGW-M+=gkWNfW<YoZ.#(YQ>f3+oL&]A/*dLP"8Z2eC4D+PO`*`
GdE8?_PU+oQKo3#j@loOg0NJc.+Wr$%7'+=?U=T_BL]A1/-oO`Ad?\N(d;kAJ;t_n>[qs/286
NL:2r.iTUU!0&(L1N$*!BD4^ZIB_@38"d<2MeH_Nb5\3=,%\bM;f$XL]A%L]A#:iT1Sa9cM_Z%
<>gMs8>+d#7F-IgF=10S>'M+>0U!Ml,Brts7PEU=H@m!&3P`ZR,_ePpUR;/]A+-`H@T3Q@t)C
<;c&;>V0#8BGHS7P@PUVXh"/cL+E`7Zo]A$2L"eKW@.-YA`'%N653u1$Mn*sZ.([_Xfo>AD/2
W0Z$Z_X]A#W2Z6r1FSPhj.4XEP.&]AYhL9@`_W7pl$(rGE6"Zd-tp?e`Rg8pm\1dLg'(;N%%%b
'ZUSY/8G%h%`?'F4V(fgrEnQo;U'KK91lR40(L@L`B:H1N%UOBV$clG13nSV4*n5S$aWX+'0
Rb/_jEs^Hdg@NYAE?k)JOVFPGIq+&q<nS=RTWI;V!4dX!k5br"7/"LgW8D!<X>^XOZ#<PM+,
,[-6?o2An`Sc]AE5i$np-#lk"eH2G).`j`]AKl%YZ%pkVZcEk#N,Yr+nKmK**qC*bQOVHX/;^[
=M'&[-in(J,GD_]Ah?Ega\_Y0Uf*T.jLn(L.HS68km#mY@4nI\W5,o,%+sMFOl0lCE,s^VoPY
`QA;j8N]ALGh]AbU7b5jtjq*Z?_H<:Pat;@,r:K8bL>rI*QfIf#9U]AU.M?Z7q'n1AU/S'RTPum
3o;736qn$j,0X<[SV-0_>!lC),,Kk@a;;i?eoe^cb\E7<ZGK_p!XtIZ=TZC[WcQ*jL",WPc/
q`!='XH9KWNMPVNK(;gc:Ku`r:-FWtQB*1-=F&-P7Bn3h"GbcW!CtiWSR&O737of[b93o<sO
^$^S)@0=cZA@mqodW,Bbg!aV\GdIL.qe9Z%K3SJe6a>"atWHH1_%#j$t;r$tA(3/+qcq+qN!
=;:YQ-OA!)W*S/JX![d<0'2<IMgl"B$iAfCA4cHN6@,&?u!%H"HP:>VB01.O:"dS/>KXKk$"
tZesNJ4kC^91_ELJ-!CTAS)Ps$ab2Cr%\j3BfcPdF9(K.jH>\Qefga6VH_.2bC2*4iJj>D&@
,cA`;eK_N2fuU`tSaGB$7.KpY7B&4cr1JG.TP%o=S9fJ@*#Va/F^<i(2"IOu]A>3oJXbR_oe-
`m(DjrVoJn?/D/'<^0;=o]A:MY5iS)K[0s(Fa_2I&)Z>oq:J7.)`jXKI\lAigB27kIo-H*X/g
iWhZ2]A<_YNRn(PkhqY\"O>L<+`V'*S0gH+>-qkckU^#`M8Q%ditHAIk:juM_-e'79X)L.n0D
ae!SJH2)k(ZG#LZbdC#IDKO?A@f=)[)^UW:,Pf/B!sE%WN2mT5#F6?'W]A\FO_`8,i>[3LFR;
^h_tnDF2A`^NPVdu;U+TJJ!F^Ar(+hS#pRSdq^5$VV+uUB'kn@9rM=8.l&`$kuJ',q@QN.U4
_KcAP1j9#IMq>OjX/Or[p%7Z0NlOd@Lg&NlflUhI]A%5N"aF2nrM<YbKq3^eP.Wh0e%3QKioe
$GT#h*r*SBogFq</u6N4-\:G;$#]A32]Af8$/erfn)n=%>f(_85:fN+>2qbl*<Kn1<]A]A:%L+8\
BL:8T([Tbm;SWm-).;GMD'5%O8m(Ku`!>WH%bcs1.LuN#\5^@6'Q0Kk=Yt4g0mmfKn@`^8I^
]AVqojg]AtHVO2ZG2V60B7>G9qFT4[BIraoO[8JG0#oT4+l,t:1D<CC#(RbUIHNLKG,#BGjc">
YgZqO\qQtpNr4`[^4$@/u8eBn.gH&Il#f$4pTjdZ(1@7oh:1#i![L"K>6l4mtuiC^s`j0bM*
lB<D@<WRuU2pAgG/%8)pI_<o1Q0]A@1q0eV*7eHMK`)`\>,l$FES4K2Hf.aCJ+(`p.#4j,W9,
fjI63dPCV(f/sT:@jMm+73JFq0mK7Le8MB7Y&n_"\GV+H`9uqIBp`p`>f,^&0m!=Q`dZ-;0j
+Td2aH=[Br'pJa)k!!L)\Duo"#n[ktjSf2$0*LCdU3c4\Q@\.1Tgf/(l$26EJDJlVN7:"NJr
j[QilCd8"^1;H61cj5&06N3ncKM73lSg0!2FIDi3Kela&)k6-=3_Yg9G98g0uCPpd4:oO7<A
Yt2(QhlL#V0ZLO7B3p%^8^3V5$jCb8dCH2gL'o4GPCL9S;#cf)<,___&eOH263an@-ENmk)k
!s;qk2pX?aq_dIY'90>Fl@;?&e0C,.<,(iok<tVWW!4Tbk+hfm;UBS-1hfeFW!@]Ac^\&ba)"
(-Gq`MS0I+eFOX"?beN+cO#cF84]A-;_Zjldcu`s!4GH5Pm`=9nK./6PG)OK2p/*ZP\b94[M3
]A4*^^c=oSq/`e?tCQokU>7+m\Tk64PK[3m4#KO=ZEH4ltA:m9gY_lUqf:TNU1$G0PL[-S>C,
I7%D&a4njr0?Lfn!;%cY)`bh#u#D)9k4h##IH;7l*!Q"1tSG@P:XS=nt%d##C)H`%e/$iq+M
f=I?8f82Cp_HoT3ZHGmW1)P,7!NSY=iC3-F]A(1P+ndW;GKRWk6h)T.?l"cQBr)]A'7d6"Qb\@
j&iX,oVhge7_:`kbQFLE^>a*I%d9!Im-n4j4:01&+$mFG46,]A2D@b_$&)(a1:\+%n&q"h5Se
!,<'@$_dFc9Ta;Z-BVdMl_O^?a$%(bXU$B%5R-X`lI?acu$Wl3dZeMF2Wb=\Wt*SYQrAar!%
L-D$Ok`i:8N>iTjrFQm\ED@tIj^_nN\"-&_U/l4^mUHj[6)Ba":d0pP%X3NP%">nD%>?LhHP
&^*1JHU2d*V,fME/*H50;%UlLWJ-?$.#RG&(ts%)$;T-`8T4LU*uM6Vof/hHKsKT(=*hSXYO
3.>2j`^oa\oD@lDp)8=W)j)MQQEc2A^4E)#Qh6,LN`#XGY3<mlG\`1/SF0$+GE\gQ$42qA5[
9?>j."E[+"SMNBiZU+R8Sc<(14qc2O`o)CkF.L)+?ERR!b4AW1&eX;;!qTX6cf.M?pGG/GU1
Mmo.!`s'B`:=b/5<NI&ZO;M#N"M=ar_<'c_.13K'";_k]A@YfRhsu;n-eMqW@KQ[Zn!$EpX'T
ZR+mX1?#=5/Uk2WtB?@PqJ'^tG<#n2Tg;^MURMYLhK#20`'tVCa3rKMknf2"qPKu<a2hT8@)
QgcF]A*RR:%jbQ[kE73*V!es^U9]A]Allc+^rVGf]AM6@V@jc+;"'a1f%,[!*_"n8KHPQ41nPj.(
)FdWsCrd>u.eOD'I#[U:tQ8ruM:Pa<&V_:c!%6/*nf>=iE5W5RnphK74K<9k[S'H7A#ZS=6:
XC>Qm"#L3MC)>Un;E<.3PkTa;Wm!@FZZi'tl(AJ76V+Xhn+&epE'L8q`r9ukh/(d0mO>CVCg
@BBSk_8c%J6VHDS!83f[eF`6<0C>8EO&]A]A7"KUr7FN9o5%#MrWcO#]AtpM)70Yi"GS4me_g"V
IVVoqq]A/iC[LKIh-M-"KTMUU+A7.0684/1[\Z6^,'+,Y-p(k`.V@7OK_aQ_?t=ghHI*_:8(d
+/dLWrC5I=^TAu]A'W-8k#'[XTX-/mr^s>kW;Knr'>;g099R`BDL8in3X+M/@B%CG"I)!RZ)u
EIg4?BoN"n8pG'"8AEnd7a.o_e@qe1k916=HF*^[>Xd]AHk<iDMn!d8SNb2i:/=4U[%h7tg9R
@\Pi-+Em=X3;(u^k9),lT*2j-)7.$9d1\k4'NSTmSlgm$Pq,:5Kh*()Yd@]AS8L#f"q7i#c(@
&j2mrO@1=q^V2^/Ppja.%\\'FOUk+`q--:iLrcB]A>/]AQ2K<N4VK<NAN7`R2=:$]A`@`h,_#31
\rffh*5dU7!RafkSmIlHq(a-\jA7<km$ci^iKiZfL$\QE,raXPr!CQ%Uc=r,Rrh-4*?\A@An
[U;"1jqi,]A776*QBZdb=1SYG"fNZ(Qtt91E\tMc`E<big$@nMaar922N_i^(A&cY(Y7pD0r"
AC\tQOA)oHAaRiA-@*tqLVK]A*j/K=c<iXsgG$fgn[j=d]A2A@`dp-ilW!(.p&kI[r%4bP:^g#
7OG\"Q^VV,`N#eK$@[h]ABX'e4esDOV.'3^5+?7>H(\Eh@`gK)gi6YV1j(`VSc-$WZ7g6I[H:
_Sk3o=OM7[dRH)#i+ol.u?eEn,BIa>`ZVST*C=Occ0g,!rQA&#=fh-(Sts%*ghFOuRO8pHgX
Efr$!'B<5DkY']AN1nR(]AWh%+Re@hHg+V1n</Fn\R'=>tF@5OQa8&@@N1Ib)%2aV[6oF!<pJp
\La9++FmY=I+cFJR#PXn*Z,e:p(?>?41B&??HG\@7st"\V/,AGCl:0fU0[l*5J9:.)r`'gfd
b8?*OY_k9$#7's-LB.SME\*_BY@'cp9-$e8):LsYT5d!?a(`+DYg7n/]A&<]A*%,EBMF`IYoo4
VPZLKl&*bWXs]A:m30oBHe599@oX+;egeX66<NL4PoXZ=6HRk"uD;je=L6KS$Z2/V;8*@AtK4
B5D8/5c*J/]A`\m4UM:89E+7%@HUa1JEt?2W!>;!o1Wd,J>)S*R=G5J#@V-g_<4ZiQI7,O[T2
<CI)YGSuF,I29Jkm8+lf`j&C^"p>$,0=dti>jWB3YFV(J)-Os#.UcDdFQQ1ll(%T,\W$U%f2
11tl5&Y'B^QN3pnP#p(g?-JG><k[N)*T%@SECXrZL#s&eGE1hD<#Kbn5UN)rhbhpC?klHroB
fAptD$p^VY3*0ht)96M-6I#>_!pj`eEZ%lhNZ.OHjiq?KOU^jS<hDKcXc=JaU2CJr*4'[6*c
]A#O"2<@HErrb*^'^[W;XUGC`5M>uE4%qr=\1?DC24#9c+q/Ht^EhQ*]A[D7q3VsE$*^E)\ZXf
2jhf/qqZY+HsT4kCP=Uqk$]A`?A,W5EM\:VDWHP*_,gN*Wlfk&Z?F!Y:E41br89u0q%iNj[;/
<Ffcm83'H\6V!J@d\t1GRHlqes0>hiJrYU$&Z(b[g_4rEEUAIZYCVC9!fB)A*-l@aO01[$Ma
tUqiji8([91"Q*X'na(Qn#q=_O6>eb8HR$MUaoiN@m69W>Zno0,aSg$S=sAKdLGU7f\I<mfb
2q)Lp&4*b;AMV-@hr4=jb5,6+TdnFcN9IoCTf<]AYj;-.dCBeZkh.*9G&,"+)/sX?l'a2_Z4R
?@[6A*N"6G'9,Q1m8'icn,37*MLr+A+Z.-KY@CLUdEA0d#O:CjV=;tn0R-Rgq%gMS\=W>TW;
4[=20Z2`?p/$XU^@C>l#u$79hb'ER+t)g3nCT<TaoaE8Z=)`9M*k^oLVVZlTQ/Y%XkBWSJ=S
6-[-0[=3MZOQTEtEVB+'L7,;2S:F^q#[4Pne"REm;]As*F).7$QPUd5db>Ylu,Nkl\g^+g=m1
9%<RXLt`!EP\OQP37^k%@W0GJ1`)?@8=i4:tnUgT?8&m6_e]Ag^9f]A#pZQ`O0l^XrYD6j'0Z<
t*cb1ku^]A#arp(^0p4?o1,m[hgLEOqDcFc!A".d9o^H.H1n%'@[79V;o]A`<:N!K<-<_$C<V%
er=P%`cI7+omO'Cc?9i^L+!rHP>h71&SQb+r<%u3\[\*B=>SL.C1u68`n-ItO)W;7i1@)CV_
oDoG\)N98EpMPQffPc&@F)T(n/%?GcKY<B*fT@19Kl,[`nT#Ub-`f/1@dacN=rhW9fEpk=lY
nY.KZ+jM$"b"gg:o7n4G`P5JU+UTa\/ms%<El5>F%nRl_k9@F@K>rOiFX;\jW4X83VRpm4oT
d4NX!ITYG\o$;\@V'JlgNdsb#`m!]AF!K`+V4\(PSU]A^eB#kqpL5SoVpUs^d[K9f2hWEVMm.9
es\WnJXRM`u8q6)\7r3ar++p=1nfe$+akk*q8MHi;,IFoQ\+jFqW(+8V$<[hZm7D<i:K4)&,
TBd5:<cRL*X^'/<i1Rqt46^M9GEJ>lDlH_PM;ir4-+:5I6j]AFu^V^:RCH^:f+Y/H,*:WDrc_
dWs]AK$-IC4:Bi.TUaO#8Ek=609GBbX#XT:?C@5\Yla.1TF*2GHn$Wo4hSTkLH(i86P8JP*u)
ol6grcV*C.h%6R_.VPrg9G.fKO5,T7dn#b7*f3\APp/QTB9oGl5]Ag2GX`5QonFCg79[%?eMJ
>`o?l#mn@CFUg6RH(ef\EK+\X8e]A!@"@T?JM0YiULR1f9$/41S1>CI9#fbQ>jUUmbXhfb!8*
$t1bmF>bt#&;S:]A]AMcY)!Qd6YckO!Pi5F,.Wi3QMToH*<104L4OY#*9#-mG.VYAi%dNp.BuW
,H/8]Aa$!UnTWdP0JTLVh\-(Lp;.nH<UAHVmESFnQWuEW$%&Keq@&oOjH0W<CX?!H"Pr.pR76
#4`Q2%ZE`'L18BZe"iBJN;#5?,p@A`rXJ%J?`d'7/B3Tbss?@[qR1Nou7aX'B'c?*?3nF:Vh
G*MHU29pI6(;G?QB!s;S2+mKHe&5Kojpok$poK((MQ?OVX?mqnD[&[o,Q=`;4Q&kTZ4[67ID
<T'3-3/q+QVjgql!-OM)CbW-oT_0K\rs^U'4f-g;#D[dB)?0aA\INdk"0]A:::i;-0$qP<-U4
N.%L*QaJ#cLnQ!-/=b>"24*:'2L@F&R1@jdbLNOLC\[jRgdBuIE"^9u`XD8hYREsTY3$+C<-
13[jMYU!^a,8$5C:2SD!57-/2a1S^jq'Dl?r>Y_I4=>Wk"dCa-^lfj9KhHh%9qWGQ&mAO!5$
)^D1n8im%Yia)8=:i]A]Af2R[-;lT<I=8%5j.CujHT<Ou0npUmgofJL-2r.=8l@ei"OVrO@oB;
n(A#eQ?0&'`:,DpVUNN@UA!NDKD6&fcDa0a)#B;,Q4OY3bd7h7mo6p4k7CT]AVL4'D<Sc7rg=
-I,+qu?F&Y07M/kpHH;=E1^2*BsS^fI%,*X,7P4^UR/#:MKOi%+-o[6M3RR=nVQoOSrXWEV9
n2JP[ek:%)'EmZ%T;D$l%^@c1kP+6W4CH+]Ann@sF[S[`/H&oXiHpX1(5F%&a_Y8I&.RCf::$
_.RPlL5<UDE"LgMs+1@9OfphP/q@`=aN%fpkmlimie*9MLe4?/SR8H>mfZe]AXX9pInehCYC-
jWE)I-!P%VX0N[K_GMQ'n/oaqo>K45og:LT/rq\AGT)oV'n&WN5o]AePaXXgB82.5NnQVV^Ri
LJ"kfqAbiLD*=ggW5"O]AMF5.J'R=eDF59D>D9NDWIdptN5e`?L%N@ZB`0bkRAnQAs&pe#i_W
'%ajT.jMg?'<8423e>[UrOmL4GH'kGSKS[7!U"$cLsLQ)2U(nQ1[5tjQm2teBNiEc5F_iD<k
)dB!":S51Chn=,?,o(BIt:NZidK>$g"aVOM^@khMLaeGps;pfrU"kkRfe]AB?NnKqS!n>[3K/
R-F1c9FG_kU0%9!M;<ud9s1(hm.R&1*(--m8ag$IRcUfkM42Ik&.O&g#V)%/6,6;DXeW8$eA
$q`\#H5.BZt]A4-#PdLN]AAS-#TkZcDc;g;c9-1[oI0Dm0CSHVdQ/:RP(.Gc7b*R;UKAHHRb=*
`c(`!(NT2$Mf`ika#5q^F,0=eP`&4En]AXoa[]A;Y\\*SlL;K:Z#+r7O#-hECkc8`shrJ?V`[6
.cbMg;k"Vj/_!QK--ns'K++7q_D@N?j8-WVJnB2,7j*7g^F[\!<pk&M$SJF1,aDgI!ThE^\;
WfCVdgWnG7+u&+_Q<1@hQC.^MoLB&`b/r([&5"0EZ1OKa9@oH6Q1M:M&eO0h)IQ8=7N:r=Tk
!h=4H:_ZAJ#/VF+Jif>:'W`JYbC,/G0q2(jRfq%7iUb0I>&'GC(balSnKEq+ZOr<d?/9]AA`A
2QUAinPDj7`ATae6=_L3/(0%/0n/+6+2`;b^rbTOkrG&a,,Zp[fRb[WODgf-2_Wo"e>>IkEh
+c\4(K%LhXI@0-Nf07K6sS"J`7i=[Vq&Q-3gLRMAR-B'tN1D75'kk'VgGmpD_[/1.qRYN[ri
d_^/4R^/T[m^/^ITigb[&2h6c3XaM"Id#uU!1BQ$Ls.[@Le[\^D12taM;n<*<_ofF-b9o<=Y
W^#R2GjZ9s0_?P$.DMsHu.,7jak!na6Bk$nY4=q3cjKMlTS.LeWr[gCti53"b_<?C/O1htZH
fJ),Y>-&7r.EiV)_'>\Fe&W\%F<Y3LOJo55%K^rrp3<Jm`4*iRb7,oTlGbf#3J.51hU1u(TC
Tgsm^%tPN?MkFWfV:Bq%8C.B35bng5iM;ht0q<*"L[t'S"V]AiG>s$H(bJ<QbUW9:`u]AdgHFN
aqJ/WGpX(<DNujSn3tKqF"/CA*luPnL0a3?(A:GTW@arq=fj$g&kG'$#+J94m&6As,P+^F>E
>JB;>GI6$,.DPm_!O2JSDk/G>%0))_n]A18)DI0/Q!/[sQbmH]AXgJ;OeD$TI-R\.f;j3BEaXO
g9MH/+=GPtM;fMp[/s2"D-gVr!F2*GS^/9R?K2,mHu3O?ukcbG3OS+''YqGXDB.4N^T]AgVD/
BM<\FDK(DI=Y@fs!_NhB>B2s:NS4\WE/(ZZ<>ZElc)a*\s$p%;<YuD,<d+=EG?Z#IPSq^8)^
]Ar:KYHB,n)oX=Aig:prNO1W,-PgK`J&1k';J?bX/(?8/stga*!FZiY(LOHrkZ[O1u4-:_,ul
n8=;3HBspED%:e+7;+mBBj`$`+XE?p?N_EQiOj7cUP(NBU\gBnS;DIW:5n`_qQO(:Xhj8u#]A
CKoSOM8dM_kHj"<HT<$I/5;R%k]Ap%Em_P&f1:UT2_:/1:@=Y17gG"\^Uds`]AYT3AjUWHkef>
HEG:5XW>hAVp7laYDeL-d[D:!'F&&l+`7[%3k.9.fU-ri,6;/n1>/#"e1fL[bgATtQMn"it=
;r]A-kkE?sTqD%rj;f,dVOpI,e@Dco!f*Z\&Dr?WKc!@oh(;>-#(=rY7KkHrqV1ZkcL@l4Dqe
f@'<er_K"]Ao.)\s/g,hmX@XFD'2^EMA2hgk?\-Y"fq4/p.&0G4D;WVQu.QDLM=`5F#BBP.X&
WR?S62:@g"*pZdOEUl7?uO#qIB)%:@'*S%($b/>8jWnP(9817@I(Ijdo=]AC06X!j:AUcq<`D
Db5G<+dcST1_pLe<1A#Wc_S`(2YWcet]Am(W>o.)B?aBoB;(MeR>U8kj,@b_0DU4[T.ld)-F6
'#aC+RDOH)!c"iK[b5lX(n-r1bMil$4V(G)Q,2\Lmn+2=3,arm4/H:08@#Y6)nR]AMJ5d[_8d
R2!9UQ/U8BVCfJ`dSCpuJ)T$cOE<D4aH*ad;+,"VYA"?VQn@J!i8BMNr<1qaL/FsT`DZ4"5r
81Zc/84!df(B!&0kKcWm;%q"mB_N(Cs?neuJ`>5jcRiUam^/7@W:TW:MLH!B2ut/(@K6W8c2
Elt^F5=$Lf#TMa6ebs>`^&C%ubW6[c&rJ4#p\T0kTnIV6e1P:J*X28#!PDe(WFYu-c;PWm4T
^=;"8@@6q^Ef]AV?(OF8[b_?o#BOO"c]A,3+jSk<Ok%)JZ<42Ee;!5Rp&%(W#<q43$(AZ,Yi$l
hWoh$@m7-B;,(_d_<gWbLlf48go>2`ljbd]A]AXL>1,)Z)sMRXpJlplFDnNMs(&2hS?]A`[d4Bs
s/BC!pOV1.r>#GO2:h_jK(VrI@Z"Gm*"DR8#@PZ6Z;@Lg3&.">$N0cLf%IBBQR6'dn#_W;V%
`1SNU)%!!`oKbWc\J228;-,mghoE:f)!=?+TTM&S/L'+:Q?%gjSRVQM&-/-OIn]A4m9R`k-&o
]AC^29l%VjSgZ@sFP\$P#E^6N:`[QmTq6.gWBGjXCLq]A,BjGNu)J%!_U24?R7iSc?(_KADDt+
(?<I+seZeC&P25J,18n15a9?3r:.\mt;m+i*+";)t]A.E.0pi8bH+4ua61`3>t;+"jMPiNjb.
1+^<^.[Idl+[2"Re-P?UQV2Df2Dld&/$c<9eC%s+sR8Cenp@q0"gQX>K"/t]AYjRdZjY=Ru),
LLsd4rdu",[Wi]A+isK'sio(M88mim=&Xj4Q4%j2GDo+0UIQ7je)@,A!f2qnY5dX=AH3.HF<L
!@8ccGmeVg-*tT2e[Zf]AaH9TV+\Z]A2@dWS.A9?K9)o!1P8kR">"5W%CUbspW1*qI$SLH[b$b
!+oK0&k<<GA.pqL4Iej0Be>`<)\)NTt?i;ts,<I[J%h&<9"!HqE"rdPLT738"(6'ekj&O3f:
nn1A*psIgTk9Von@3kU`ju*Rr5!lDNO1p6VidJ,2+m]AoWR%QAegF6hBetoic>H,oq2>8=f$W
9jrs!c\FpcB2TX\ZsQEOjI8DjYT_l\C5=G'l4"A;au1[Prj)O;;rRM-lRfm"@QMTiuX_bO!'
HVRKC41,^M@U/b==E-+lr_<:M6+jRb^g"?g3V\VA=0a(;r16'Yr,b*gqsi"*H0RMkkhdKp@2
6,@1X=O9,EB(J(H/Y<_r`,5H\Ts^W-f46?8/.,Dh_j4,'>,lg[k((oF:oCGYXH.#)f.MM:':
%oP&!X6TS2p%EfX8Se?L`s&cf"5H%hmeFd05kMSd$Q\45ah=&dqEY;boC?uHc/WY9oa2#-f7
@aY]AI/EruYn]A;Eh&0N]A]A1[_150jX*XX+kO/-)iZZng8k*-pd09L,b6+T+(>??'NfSqlGKbh)
-Sh[Rmf2`sB_QH\uJn8LtI\K=\'bt]AjApTsHoX.FiOSZXofVUJ!gc1q@-"p]AuHW2?JY^38#]A
bssV-;?srp?dkAG`s;VTcm`Wfe(?bXC<Z7Ps.`9@i>qQ/OEn&OT\*R#\#?=/g&R9A[VBl,Bi
.-'M1X@o5CX]A$KkIPrD&KGs[]A2>Y6&[g0LPJunoV'Gnl9Pn)'_'.0mNnq94&(1gH9e/%1ouD
F(=8Tqkh#`=6[tER'Zp%e\gaA?=7747k=o2AhJI.#g__>2BP6=_8Eg\24Z23OAa&ATla<6qD
Mmh+R3oQ<-l;To-@*u&GF/:nf;0QYoteRPjm[-q<<ULlpmY'[[R"m^ib53]ALJu2ehAc4pI_X
rhQ=ip,^Z<d"?)&cl_Uh]AR^<ji)acF5pf09:aJ*J/,n\<36N7/4h*/#m_23]A4]AA-rq8.8\SY
;$B5-FdRbFHs9ejoPmq>f![C#@!`lqhn]A9j1@eT1l.PNtaXHnG#ke4^V,A7(Q+22*pA?jE:0
PTf(RX#VVch\[Do464%@WEmT?L0.m.tDoo3\B%Q&Tr_:X#\HqI5aH:C#W]A-;8%l\^ceE\LPi
E5TYqH-!;bu:OiDTH"(sb*!'Mc6//gIf#RM<)r374Q8p_jCLArH>O769s75uX?ImG?oEY<mA
iB]Ahs"3MWWP::@l!VdWksQYPl(8A$a\['<\#TM7Ae6,L6d@4b0]A&Jl.(rBr=%BF:%K48&c)0
DT$0:oNOJe,V6JT6.:]A]A2K/:Xo]AUZ3.,hGtsA8N(9W$@]A4"q:?WOr_sX;_gH&18AY8%PD5Pl
n-VW/7jK-2%BWAbHK.`@XoIf8l0)!DR-CpSR'P"GjPJ(NOhJLdD-tMK'/Okn6YS8^EIT^='l
*`m.<hXr]A$AO1^G5R$=7H/c+Q(:3OW=Xb>f[N#cpt2Y.Vf+Np(u*=JN"t-BX5J9',VUGE`c<
C]A2BfL<ILqi(V]AZ'9nYg$Kk=5TV.?^ur8FPC/m7h*PNS?Hn(Dt;O[>D[hT-AI@DiMi+m!b0U
nREpGCgnB@TU\hR$FZbcrkY;E,Sq6!ghjbWUhuWL).:5WFu,G-3!OlE9j"p1l&L$p[G@cSq<
EeH"rI`&_r4\6c^*@WU2I%2<P(?aXgpQ4:X6,#)gm'PIg#qmYh)78(d&5o9mLHmjl0;Uu<ZY
lA4JV'IlERN=EMoc&W)-N"=HCiH?Cl'-QUWe:Y!X"`jG.B5JeN\S,ZBG*)EIf&k-5Y(4_Vbt
::+%5EotL/\B%k(Tn=r8fW'JS-jL8`(3a9-]AeoEV)nCOaH6;`$+]Ai<qFu5X$;aB<23miDbS/
HNMg7l=^%##W)S_8LW^r5oELXe5<US-0U=iOE?^M-#tcF,"m%&ke2F`tHK]AZs)2%5^-SJL!V
AjMN5iT'f)]Ap+Qs2!2YcY'5_+ea9mV1<djDTHJ(qg=)o`PH"&d\$E!_*+8#0o1=!r<PK9%%q
SgOe/`@D\EYt-RIO%`R3"D0i'r1=$8-'W#r)oj!&Wt?pVBcd73/'"f4n/4e1"(,ppn##^Ra<
a<Vg&#Q2\95bj&"Ca7S'S=:!b8W[(0'hkK2r#ID^.9u^6+^Ea&Af4AJlNj@"Z7ge]AAeD,JD3
PHtDWe;C<$Gi[FJHENJrtckI<o"l=VJ+Q8'HYi42Z*/%AO._&^kdWSKheM?""24DY5iW,qrh
Ya3J=QSU-]At9aiZa61!*n`j!^0(D2V4jl\;8nP<Xpn4F,m-XHH[1^)q&l8GL\f&M:,PA(ln_
=e*8kRP1`#\S2Gc?\$iO?O28h%_;epZMR_r:pbKallbmqNsQu55=kuk5UM8ba',&!=h9lDcb
TeD72:24R/L_BUQd$AV%"Ah$1p]Ah=R0B=Z`\o)G[.k9Mn!(.iPtFom_`+amW(%mf\p@R?3o]A
(c2b:J4%CI6Wub8NJ4I64`sm[OQ?c$_-M<rG)jfO>uNV^hTJUf>tdFT,G*2`L%?s#+[rs59'
CA#b+BV]AZ^"p(Y\3dP?bsA@OkBndHq;VRI9K./3Or%\VpXF\kU4n9r_4OlbLZCjbNk&urQ`s
n-="f6-R(f5f)T*rRE%(3Pn2U:@*#K_(ZBD,+IOp_!*MCa*enIN2?-5P>9.p!qrk/7-6Adef
_,%69:l/\QTW]A92T+ER"94/\6?YSh-.?;F"M)HEjAX'sH*.ab"(q/oXQO(4'=(=r&#nmpbpB
.<YnksfqA8-?1]A[Mkh]A293j]Ad'rr*K~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="479" height="233"/>
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
<![CDATA[="    按品牌/按型号"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="479" height="36"/>
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
<BoundsAttr x="0" y="0" width="479" height="269"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="report1"/>
<Widget widgetName="report2"/>
<Widget widgetName="report3"/>
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
