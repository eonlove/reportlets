<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="tab1 th" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 单位
FROM 新单位信息
WHERE 单位 LIKE '%体验店%'
AND 营业状态 = '营业']]></Query>
</TableData>
<TableData name="data" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[2021-12-01]]></O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O>
<![CDATA[2021-12-12]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[call unit_achivement('${start}','${end}','合并')]]></Query>
</TableData>
<TableData name="tab3 th" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 部门,运营部分类,单位
FROM 新单位信息
WHERE  营业状态 = '营业'
AND 部门 IN ('1部','2部')]]></Query>
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
<NorthAttr size="57"/>
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
<BoundsAttr x="192" y="7" width="80" height="46"/>
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
<BoundsAttr x="85" y="32" width="97" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[统计结束]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="5" y="32" width="80" height="21"/>
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
<BoundsAttr x="85" y="7" width="97" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[统计开始]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="5" y="7" width="80" height="21"/>
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
<InnerWidget class="com.fr.form.ui.container.cardlayout.WCardMainBorderLayout">
<WidgetName name="tablayout0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="微软雅黑" style="0" size="80"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-855310"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<NorthAttr size="36"/>
<North class="com.fr.form.ui.container.cardlayout.WCardTitleLayout">
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
<EastAttr size="25"/>
<East class="com.fr.form.ui.CardAddButton">
<WidgetName name="Add"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<AddTagAttr layoutName="cardlayout0"/>
</East>
<Center class="com.fr.form.ui.container.cardlayout.WCardTagLayout">
<WidgetName name="tabpane0"/>
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
<LCAttr vgap="0" hgap="1" compInterval="0"/>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="4f476141-9449-40bc-a61d-959ae2481932"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[毛利分析]]></Text>
<initial>
<Background name="ColorBackground"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0"/>
</Widget>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="7ba6f9e6-e8e5-4be5-8547-609030961724"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[产业分析]]></Text>
<initial>
<Background name="ColorBackground"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0" index="1"/>
</Widget>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="9b0b7bd0-2a23-4abc-95f5-992eb9f4d5ee"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[二三销]]></Text>
<initial>
<Background name="ColorBackground"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0" index="2"/>
</Widget>
<DisplayPosition type="0"/>
<FLAttr alignment="0"/>
<ColumnWidth defaultValue="80">
<![CDATA[80,80,80,80,80,80,80,80,80,80,80]]></ColumnWidth>
<TextDirection type="0"/>
<TemplateStyle class="com.fr.general.cardtag.BannerTemplateStyle"/>
</Center>
<CardTitleLayout layoutName="cardlayout0"/>
</North>
<Center class="com.fr.form.ui.container.WCardLayout">
<WidgetName name="cardlayout0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="微软雅黑" style="0" size="80"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-855310"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.cardlayout.WTabFitLayout">
<WidgetName name="Tab0"/>
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
<![CDATA[1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4305300,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,0,2736000,2736000,0,2736000,2736000,0,2736000,2736000,2736000,2736000,2736000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="2" s="0">
<O>
<![CDATA[跟机率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="2" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" rs="2" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="2" s="0">
<O>
<![CDATA[单机毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" rs="2" s="0">
<O>
<![CDATA[单机贡献]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" cs="2" s="0">
<O>
<![CDATA[配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" cs="2" s="0">
<O>
<![CDATA[融合]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" cs="2" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" cs="3" s="0">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="0" cs="3" s="0">
<O>
<![CDATA[会员]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="0" cs="3" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="0" cs="2" s="0">
<O>
<![CDATA[分期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="0" cs="2" s="0">
<O>
<![CDATA[后服务 (待确定口径)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="0">
<O>
<![CDATA[利润]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="0">
<O>
<![CDATA[利润]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="2">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="tab1 th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(K3 + M3 + P3) / C3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="全利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机贡献"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="配件数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="配件单毛"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="8" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="融合产品"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="9" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="融合单毛"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="10" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡单毛"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="13" r="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=n3/m3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="15" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="16" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="17" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Q3 / P3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="18" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="20" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T3 / S3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="21" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="data" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="22" r="2" s="5">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="23" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K3 + M3 + P3 + S3 + V3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="24" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(L3 + O3 + R3 + U3 + W3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="6">
<O>
<![CDATA[合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(K4 + M4 + P4) / C4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(F3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(H3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="15" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="16" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="17" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(R3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="18" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="19" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="20" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="21" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="22" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="23" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="24" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
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
<Background name="ColorBackground" color="-3677185"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-3677185"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-256"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<Background name="ColorBackground" color="-1644826"/>
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
<![CDATA[m<a+`;qDfQ$&Vb[E<8R`fIA)>U7riABH8Lo6ifSa;PQnm#[n2LYu[A;-s/bHJg)<]A+S-SS-r
CQX1.+CX!+AQS9T\cbYg^:p-2d2u*Su/1+9'@'cJE??p$H[GC[KSd8$'q#aK:^0!+:ZZ\,39
.?p5>+A:FGc!Vg22G]Aso'>d66Fs0Z^b^!URs9]A*=9R6sf[2Pm7j/g#nZ*iirLD,.-iGJ8d?>
[7%%m?tSpHfS.BJ+djM2iBLQ>U;$<a#>(]A^7K7+<2n0/Z+4sM.9!WOB1P0NF!r"XepS@RVF*
&@U:uHZiW_.&i'cN"cnNQH>3M=b.\TFW)d9XTM%GY7kSZ<LA(YKldI#JK5r0@m)'7Men._mg
O!f9mdROj?=^fPf+^RM+ap3eLAbkAKG:Jqm9Fm)u"PC4Xs)QI[YQ(Fme'j^l-t/l]A;ks($:&
d@>L7OVenR-YOX?oQM#ob>Yo@`k!+#pS1n1M<0&,n^J#"lG>=u<S`iQus[f;N;cM?Qau*<P5
_[Ue^rh_QShAlR$6M=Gk46T4TOXM!_Prt[k&hGhJKA,>YdNB-L7F^'ABK%H7.=9R^8EM2&r?
Tn1.g<[e:Cu&f]A7jjh3kOuRkZDf^5b*pI/UI<N:^`_=1X67r@g!hrOh/^26`lu.+2ua00o!.
-*`3'p4AnI'>$?ifGD[Ee29oBbS`Gk(&k/3]AHq57Wb)bQ;VaL=BGh3L(\l&pkm0>7BP^O1hc
F&Ou>h^[u3F:M5IDNh"C>&<tOg'SSBm15VsF>Wbrbt#/qA3uhP91,IJX8'PO_<\@-XQuH;$P
lIsUrk0'b5Eu0T@_ajba:2oW>XQ4e=9p_ZADSL2J<n+UO3>]A)k1Il]AKM@j+/WJNq.0tt[25^
&5$r6^qb>$"km2BuHX`Kf7K2>8;p8H(e+6^DJe;bu+'7AO-B?&396EX@a('J1cLOQF=fB3c-
aV="UP5rYYe?'H=-C7+HCAV5diQ4FK:MXU\%*k1P7+s*VWkgb.9]A&1IRh,#B8&$)m>&FB>qh
9/B)!(;U?@p>_L:O1rAai*b[%IF:p"@)24VWFNGR)M2qRorE%q*2hs6oMe6q,F'9CCX!k^Dq
UUC1$4\_Rk2aB7q6O'#egL%j#>fXM9d_>^jbD`VEA8>U.@IkVd>$-N>k1Nj=>QDT]A%mNT0:H
O&mVDBb>3)L0mng*NW^5m/&(@K]ATJ+O:%g+mPUD=NJ6faP>D97OJ1ZcdYU6=B&)2ua^HRgO%
Jf/1ngj)UjaVV4WS'sah)='tUo4eLTCmsa`48M`&.d3e;lA8X(oT6a5BZU2#,FI/Dn:PF_GK
P`8h7;4sL#\VM:TS$qr%sQYQiaYXPaZ^Gq$pcmV.grS@NR+!KF5,Y.U?/_j?cndOR-Dj\eA`
dW%::^6ii#S';,n>?\m>4/GlI,>_bZ)+Mmjiq6q\X!:E@[!LGDS\;kq(d/,J.4"?k8BLo;>:
CVYGTY3>%JLM[<7If?Q86<)F$&a-S$nLFslg1KXC:FD4UG83F!EfEP9)bk-f1V\]AkGG\368M
\g>+cUA@_X;!JqJ=7FiX#Q#q1q*c`Xr;q1q1=2NQ.QfVpFmiA\i"oVh<\^D:]A9rO.A?`5>LW
3dejFm<mXcgc0Sm)<PsF7">NUX$*&HL#o\90K_"Z=XtA7enAOA&:*m!i$am.`X>TC,6b'fqD
e&NNhNC7IkO6&3f/u15/b1!'k@aQUFkR?Fbu>/.bZ/(h5"7__/3f<X2U;(tf$A0YB@<7B=kn
=n>2]AZ*Zk4?&rZLPL$4s]A26%(#AM+ZaZjtG9XFR%ga1tj2mK,-C2=f!$KTGq4Yg]ARq,h/E%k
]A9PuB5T<Ckho8U4;;u(JUlM;c9Jfa2V2%9i(\!,gpe"YsW8.?Z/hVE*P;!_"R@MFUZ-c"I$m
U<n<5fQ_S(rcn9U;TH/1$`*Hf`A/-tFYJ5474g@Z6Fc`M69I*aMJ$D4qD!`$G-cm`4e+TVA@
%3c)HN3'TruEc-9:.Qi!(C9da@=kDE,%C(B:!cGp/dM^pOclI_afEcu3e[T,G&:C0+24T7Jk
V^*CV=)_Sa]Ak4<($PBLo=Qa*<;ZMOl*[b"mhLh"&4*1#p,]AR*2>2%F;h5*Y9,ma_XpEF"QkW
":D[&Vij%F:^lKNt-^Q]A*C0Z^hm/^Z_^O8=Q66QYd4<5PMGK/b#SXAA]AfZbu=)6SJ`uki-!(
YhX&Ygq51bXK?7]AE4\Rk.0`QRDU#oVI[oFW7;.($([MSBWbr9!%-k5\N=TC\PrXF9("Pi.Pc
u6jWLu+Ek5o'O,:.0/i1\oEV]As6uoe0)l@QPa&DUDD\BS.X(Ok^'$G!I#>,\4.W1up.PM.(t
d03Gl6V]AO9JmAlt@FV-uB@4UUbVHLWR3[diGb,m0u21J#kWW"c0pTQ!OlSr[40jgjeHGf[mj
9luaJDp6#+\/C0@&nT/:`.LIL`g-+85eur6M/25?Y#M8a6rZhLk3@<i.ru:\G?ZlO?.)klt>
fJnTQm]AK+*dU(Y2JpRV7EdgE>rQfW=V]AGft%RaG`KZ-QoNL^k;)>m!IXe[9<G[,,n23Bi<?C
A<N(l.170I3*GP@DA,i!1Y@O`khi0'+r?*e^)t125e_*sR5gJRJGbG/PA0m#T,mU6$hkK!k?
Jo>]AXI!#ncZ/N1HWH89L<C/OPZm\*-+Lhff.dI$Lg]A5o7[<_>!C:\QPqVo7.We:2E%DBN6%j
hNlP-P6+q"?.@`E9Y6l/N1+%LJ%egXk1bJ5j4U<68^#;BW4B`WLl2kZ74"+Mb9%VZj%Y`?a"
c6I+2Cr@8^"55h7:$SL\!&f`O,[2h/<sr72if6DA&'[^UV9UOSWB6!=2G,0ocq`np3(Bg?e/
"&k<los1Ji+h%1%*%;fIZP)3*S"?iPg&1,K8p![8bJhMc;f1=hs^0C19W*$dGVU![^bP(C&,
,:E77'7P92-+ClR0U!BDlMaC7$:"%63`u)`2@tE0lD/::f9=c2f^f?*f#M=4)uD=t!eGJ!=i
f$O8t!Loe#-n?m86&p=N-FY*i/`L+oM6Hj5"gTgc@RbRi10R.VdN3`49P]A,kEG6Zo)+V36T!
?AlFBA6khhGjP%3t0;KS+b;/2V]A4NeG^_:D:1?k2_4JWK2au!gNg;R9=W?ND<VS*KV[ch4p\
mDVdaBB,gp40nodl:W=I36f(6IH=J'.'-q;<k'8B%D\^=UVPIOMT<$62V40CuW=O2VrGhJ$c
/71aYE/0h7K1Xl\SgnQ=h[an"LKa#&-959>t=RM6cQiTmQQ2mnC)ML&$T4elB="<`GP-LGRW
8KhVb<>K?Y@1P2r"aU!BG!dT7R^/CB]AYLp@-dE38\0d]A&-H[n:45/@K/sf0=/isZ_0*0^A7-
8C2$(c?S3Rs:0<Mb[LnIc&ib^7e(/8<RS]AqUM2c'.YG:"_n`'Lecp`<5Gn!&\8/4h\G07uF1
H[DPf]Af0(,Te4D<'+O-I'p.n@?CYuoq!>khO'.aneG_Is3Oq;V#`$CjJ'b?:F@,Va2$$m"PJ
ea\-,0&,B.tH493s86>S&AD\Obsj<8Ig'*Y7NL[8KA+=rL'ia==(p.h"'^T44<6s,]A0Z>O5p
H+,(/fQL;:![X_t#4fkftnq3]A9'LE,]AdNk2=GBYi(:0GnBf'kYi0m5UEd+d@YfMq!`Pm6oBO
g5sR#^VVV\R7,Qs8ENJ%,M!*.:OJ*hN#/Cuq!iWCabOk%'#*OB]A,#?Ze#)/qieYg@OV:*A*,
`0]AHd4WOVPa6Gh8ST9Q0IeM=%bSmI96fWN?H(_K[41-TCn^n5X*7(nGR-0^?>+Bj,=aU2.[T
?7sjk<SV)p"h3McTL,'?h,OdG-.d4mNbH^ej(o2Z>"fN4f8%1U,j\06Hqkl;W]ABlB`rEJj=B
c>2_5@rd9_YP^YKNf%sOAuW\Nd+Gh0A&9%9WsT23:@b4oft#[Vth,MK7!^?na.)6d*,/6$mY
Y,V`o'\G?ClH=;<Q<D,U[WP[DSV>FR>5Sb$C4;4Z(;/4J+dZG0JUIT'8ZHQm&jHI]A$\GAro;
2$SJJ:B^eDe8g)XdVkT;IAs:A3SWkO!ZNtTpCK_BR..cc)s`@.hi[a_EZ%8;rQCjuS8F?E7F
MIcZGh)AP8>qHX7*W%RHh`3@R;Gu^-7u6cg/r"-#?&<U\6\o/73;6^<;W@]AFoKmn(!\mJ84d
\=3(J6gZ(A\r!g$&8Zg#W:]A37M#Tia`q-tr:>L^Et>Q-GH5Z%HU?^<*LlZ.O`kKQ:8d4f,6,
bY[C+7QmjA4/$+*7D^0U+?u>D"ul2j=6@XLXf--XHRR@4<_"]An*e\UN!KjJ_^q"nZKj".AQ>
>3C531h3dad_op3$b#&YbSmd20-/r?-_jB+P9im#(b7%D.%@a&*mH.*XBf>eZY&m:&sBSZo7
oR&SqWM1h1jT(M3@[\T]A)B[c%MA@04*fD98QTp4+&46'_cQu*7Bq!?M"-d=_-+Hd<E@^)>nX
iiEKaBsl3:(WF!SQ#SF.s&DKIG`G[^[EM0kMa\+Mdk52KbN:"W!<]AWRX`SpkPDka41V[JF\X
[e_QDsXPF:Q4$hN,]AGa-Df7jlu%J9I*$%/_\53QmG&Z`6d^['bB=-_ARWp^hFfq!003<I)ZL
XnZ,d(X4Bmob%ZU/"qMF6O?l"!hL$Vue.(\s\TF`@Gq[iLMDJjA"7\QYfT`f2)BS3&C4"ESb
TcmVTto;^5$G:4IEj@%0*D,bG$XCIt,&-CnCaAT,pP=7l=;aDX;lMe4eJ?J*>Kdu\+72aP?N
gl%Qt&=e@SG3dB<)%g.*EIui[8uCrtQri\JHuc?\?oSWQZ"e;aG0`$mdTNDVFhOc*Y9Q]AM\F
]A&UhR")(R(2^'Db8+%]A#mP:+X2A"F6Z+#F^i;7msaIqF\5td+=X?D]A%6WHFaG-8@Aq'RDDiI
QD[jc"(E-TQH?9!]ASX!6N"WOES&u]A<(%\D!A,g/tFaH^).0C,V,I:opanh5S2cQVc-/,Ynbc
"S:l/#"6T,QW'";5Y0pYnpD'=WhqE9Z+PMV?sC"2=^aHZt!ZRqeJ-R+g[.\M3im'N:W)E'R`
#'/=1,.bI%Kpb:fUXo(dsiLZHQG[WrV+f4^G?a^Y*Z$lHSdf.X0MK_=-5&+%GD1Kh%aos;g^
!3\MD(H#IA/Zi0``V3pU$%n7G$bdQqReLA)c$Y*#(E$Y_f@]ASVl0ft8R\k>Yquc\ra;dd3(J
%#N`gMjfY_hmPb-pM*L<HmC20@&$9'#iU'3e\af\(K#567qUA?U<Z1%!\SU5%n.q2Vh;KQp.
"!l(lR$=uQX[TEjhPg\h!=L1,@"/I>Q94*5*"+9RBZdCk3/nfe;C9YJ2l1"*_f7,@=-/_h?G
Q+W;$WC$gDVWQ`hGX\lT/;(($cA\94-r_*KF7!1d`ULg7cYB)-Mi=FnbIl;$l&;ZbU#\o"l/
.K$>\Co'$gKNo37qpgD"^q%A>=Rm^3If4D^*\[4Jl'(^t%MpOZ$[LFU3eP429g8>RG5c87T(
NHAF6n)CXqnI:iad#sqk8m%V3Df_TS.2o2_LL-OsMW?,TXo)PU;`jOdW;l7gn[gKI$SB%t_.
S5:PYD=17)P@Xj;9U?iPZXf<B.;;eI9j-p7O`LJ,*4F_G%8n0ueRMrX]A^/>TEnm>.MFFC5+_
G.6Y_\%4F*$,Et.P-Tk2n0*;58?!:Od<sZJ6H2Vj$e5-RtaiD[E(<W_fmgs:p[W#TQk/5!2g
]Ao*+N!fqdD>0*dMpL_Y0GP;Qcq&T&9;j?o@5jBp#;J8s(@DX#i-10&q?[s>G%CYBV"(rgTI=
`k0KL6eK5[&MFYe(A_G\1fhqPLApt5uC+\]AB%"<l6)dr=E/&2!$ghYse'.3"4!YWdncQlFPq
k@9l9@X_Peab>PG\T]Aq[+^$EcP++!t/I&s)6Y[s2^slUMW13e*)2JM4`,=+R#N55MaocQEkt
,:9l\+CM"Dk-Rmq__QagGH\XYW=&Q(R`%0g*!eEfJs3MTIn]Ah+k]AS[*-DJKuAAmUiK:?Rib:
o8/dRa<Q!e)$<>Kjch4Q(LD'=Dg,Cef<[sIQhGGL3@#TdZFd]AUCLe<L#NZXEbfE9A[q&(dMU
HV2b%;,Aq&j;J)*YGd'<^frHB`);4C:NaE@H!?W$T\jKn$n+&%Q#g0,d_M-8\V!hWIYX^Sk1
4o&F@%I*RU!4Q$\DOr/sp64'0h[,F=i7rOYos3C/N^P?f8Ui"cf>"qGPd*s]AA%^c^iXS"7&>
@#!.r)s1/\$%`[>(Rsu;(@'G'[[B8+l8P(52e*g[WEj68-7o/F?"+4/;_m#pq]A+hI'i.-q=P
EpBm)#!76F+XSLGh'Dgjgh^\KH+JW[,`iqru2k[4#u#jKKaehhJkX+MCDH%`4!P=rl8[:'Xo
#9jL%"`;DsY33DfFLjL1p33G@.QDA1D:kb1p:u(<WrP6NFe4mbo=&TDEWOGOWoJ\.-_!pCi8
Ac!N9HmYHYcg]A/?8i^KjF_M0i@N`G]AO`Hf%TaY[qPJJLYiBeL)i!7EEVKc^0o?1&FtRPbbrl
't#Y`^Cjo9";0mTds]A`H8\W7)>`8MH!gEX4n(bKg'Rk[OW?cVOIVD]A6(>jJ`M;1,2@;5;VA=
Nl"/VW+F`gV"*(udRKFs-CBeBq;#FqWVDP?+I1XMeA0qsUV0,1<0>LOj`N/tkQ>3moh*_.<7
tsKhos8Nn^KN::K`At#EOT;%QM^@,NXA<DSKlS-hP"@]A:[1R^(rWUU:I@gBXj9'9+;WuF"aN
YpO4,a(GjNbrX_)?Mu$^Cr7bRC*1uIJT.%<Y^)lfk#5fO3cBuq&2-9D,Sg8N7lpI5lc'<^Ln
$8:Ea_g=61BUi9@Gs\$G6qW)VZi7iTFsaA4o=6lTDEkV$0Zh]A7u`nV8pp%(C-0Ub3SK0qX)b
Qj8^DTnahpL4g;,;a$>K8mPjSBI1EYOP4p`+Rckk`M;/2d&LO@&\=%RB@&ATsDZ->WFOS9I*
[r#>p$_o>]APmi;rFLB"(-2feK9:5ai6%?&ScUV7oL`]AiX/uP!4i$Nj2!^'e)*I*69?Qhuld'
X&6:^ASQA!dAqD'_c=hAZ9hj2(u/Qi6kqD)I\`2<`TtkN'=0&kPj&[[MV$pGeQcS/[M.Zf2s
EG>/_<IK-BWMS,7tpCq.pgIOCo_?gEZMTr'Kd]A(bDaf[LQ"#+:pT/as`)Nsb-5O:FJ=Na+G%
Lc.PN5(l$,LtS-R$nq_\tRTB&g:"/`fFeR=]A%^*ag]A9"N"n(t:RMP8Q$MB=8<nSRgRe+=Y^P
!R89st%dYHZ'g3FG+f1p5PMGN_^%l?i&ot:%C-$V8-`,lUOg.)SBE^[>Kop>0`Nu.tV7(at_
LAoU@PtC*&e\R#g[TT^I\Y+X0Hgji<mM`qN7cY[@\?H;=R-)6iOu*$:`!FNrBA54*/998Oq"
skFO7B9nI9ag`#T_dbjRl>SUt3!U-.u^'9!C0bMEFq08+Ncmq/81o2c3+!0DD_1-FrVl1@'b
ictXacReHYPd"s3f*;UJ'>fM#,A]AGWK<+r@S\ZM"7Ro3Q#92`\<2nms;3<Uu<G4c6O/R5Hbn
cVaJfjcnd5=.qje[1-Z]A6.Zbn)T_#'2PGMCoT#-6u>A97Rh<D+J>khX_,LmWL[)>7Dg<q.GW
X$iPK+""gY,Ir#mrG0pPBX-!$RkY'J"lACjQ.4ANI3oC<c0]AJVn_Nt>jt;fl>"^CO5PSd=_F
5W8dTTaZ\t;H'Jo)bK55CTZHl+g(3mKrPIP7"2)*?7!)BY,*B/]A^>U%E/"Z-mJqNg&!:^,Vl
'si@8EVIgs]A+K8L]AbkBW+5;FKl,),%I/bbO&BPilM#(=,m'pcLF4saK&1o5`!H"?GOF.6D-4
!-HtlsGkJp$87ZmB7/*#f[7RZ(X%Tp1\oE@kElk;prO/PRNW!2g*f[mTpYC:fb,\1%6@41np
RSR>GiW:\i_[]A&_P&o_b<HWh":6hX^#X_=?,8oZedH"uB/:t>L?^45E%-o8DV=#H7&U,"pF7
^uf=,C6)_#2#1p>gWFGj;11Y7HWAB^$d)(mT%IQI%Kn=Hb\1h,a-e]A%2iZmTAGY^F)<W?DMk
afOH@<jt6;m"c0(98T?C'6:j;*8srC,^st0JddUU%#l59V$?W)f$\-LY>]Ak<T/rRcO\j#1K]A
kD"H.+dRc=rmOp8QIE%["*iqqd6f--`qTe]Acl*Wh#$6J5[B!\[S^gY1n^,l6'a+qT@qqVTN(
8>G+<MK'ui7"LI3/VTJB@!?pf>6s8F3K+O(\T8e+4mXiIpklg#X(h(b-.5&<(\&Jk4Aj!KH=
.UUAY*#;o^UpV`P2-cKeZn+<gK_(JpLbE`Z@kE<3D7Ggh4u83&are3T"CB0gfmSW4N*`*:an
s\5nnTs2C`?q3]Ao^rkWiGn0'4;_!e!'!XDPCLZ:lmaiLVj3Z9gH,"W>jn@Q6%<m3CuSg\V\i
GAP;E,D(f>/%DIAmQrU/ql,Z+`tiB-#p/&s$96j.fN;%^X*Qas>?oO!Ec<suWd>gq1ZGUrdD
uKM8&if`-bP;V4pT5lle6WC2`[eXaJO,EH@7GWPUl2RUJrf.jk2GPntr?]A8;^:kNuSdM5N:Q
CTM*3ik,"*o$4lE&@Cbh_eE%;9AT*hCq>.Ys&ZV5QO)0n$<q`9/jR-En$cCsO+gO$]A+EY)L!
X>*?Y'Gm3%5dZ9L/6M]A^ONiN/g:N,>tQiOkUOU<bMm'?Z#&!a3sga#cGW`/+"a-X:A;o5CVb
W50T]A#rcoFoa-nI#He2n/neIL2`3rj%(jjGHR]A%,GVK'WCX#Y>7M\PsYZDSGHJ=Xknd?BXSO
%A2e-8Tf0&9!EW05\j@"r<)B+rEkTpp"\P'jte?/H?pYpU8a#=6g`\'`AuF:@l9EH,%`7O%W
Lk+GFm_KcE9^D!=U#:]A,+0$U<i5O^"r+OKCgpXO7q"=e6j+iWO,a_2_(V]A@59_5J?H%g,A50
NY9U+AdKdE0DI".tfi1NpYmVsB#HO00&KVo_/)q^sT0SM6(?PaAhn\geFX]A6!.$SLiH+]Ak#J
oS'M3WIrh4$7dlB(<>r.]AY<k@H7HPWo,"gjpQA6]AYq'Z_)gA3ZacIiE]A`Tlcb0$+N>GqBQVB
&DY&<BWmaJd/*,;q\A_iqL*cKSW+6K.@[YM#qk]A4XLT[=5^a\HE\4YA+@%u^rpDK1>*#c(r)
14eRh@:N$UWgK@g.a\K7\Urh'c+1cX2]AZ[CZiIL7'&!mkfm?=f?Aqo]A_?TtY$2j*>?rX`n,;
F(\*M<>ta+lE/1!fG!ojFr]Ar$:R!D7*qcjLjfY[0tm:e,3/G\tqj]A.90]A>U:8Z,Hc3rdTbMU
d4PA6Fa`:_kN$lOa1nY)K*$DB'#GW.Q%0d`>b$h5CQ+b#(<S.sJ.p&ju7TiXUK1]Alno^SASJ
\W3O2V1Y\'X?J$F_CdbeJSC\Y[aWF>Y(9tn02mKaTp"%I!]A81r:\]A'T"17LJ<s&oY6k=]ABA/
fKDcjfR7O7uK^/FP"*3goAp[VcJCnfop?/q$MAAGZ/"s,[iI@_?C\p(8c4tJ'p8XX5`I6K@;
n!cb\CFbkm9+JJ-[k'iW1]A`c3TBO5p@F3!#@U]A(W,J2'S_l>(#'$EWo@Ar64B(jAPb<]AL[a1
a_0h!?6?LZ`@0<CPFF:G`9O<@$VkZ*;*G&6YMu2[d`JhbW>)YDG_9I=-DRD%ZknKJJkT$uCr
cD)tg@W9PnB2^J&Un2P4t%.OjX,`p5X^4Smb@W]A&:9Z]A#Fa)H#Hcg#n2.s:jc]A_8%ul?GZ'h
Si!ACif4%Sj"l8Z?O]Aid*g$Z_Y`F>BU.;)TYk'+Ob+RM\nMVcUdi-*U2'&;-S!<:3_G!iQ5M
<&LZm<3di-?m>k)?cQ\jo%c#t'.[m2O\8#CW<]AQa2H6fYK8l(P@tm7Nb#2*3@5a*a\D@gDr8
.:J-p?h5.;V;Q-75r2,-UtS-RF,r?\i>m8Jc?G+6@*H)THU^NsA2:1@(9/1e91WO^`]AChc<@
Dbe`a6GNR+9<L?XHK:iC&]A7Kh@;.&+Pq6R@t<JnR&k4>chfQ7&/`IBG4%K"J)3L8@RZA_Lc2
W&a2hZ*?/q0&_.goM6N`s-8^JRNVMp)`k1>ta7\M`F_A4["1H$`NL%oUS;=fcVkLPqR<cU;W
ic3DJ`t;I4U]Ainhp-TN4SIUdmUbVm(m.<U?5U-)lm]AK[*tB1YGuC/\5<['uH<:EFK\%h*,*l
nCh/scYmc<*O<>]A&DY?%nHM\`gU7(N$T/Z='Mbil*te2k-nY(/\:rF2,DroZkli,S<O+(LP>
Pko]AEC/WWA/?76DilchN"YtjRD]A\KrC$b_*NbHZ>!JfE=S)HJ+7/&n.4Y7"m$TcGU=13t]AiY
+>@-G-leU"6B0nb\^&e#=Ta47.SICe,Kag$##<_T-qV;4Dru:8hZSk_J7I]A+>-fF@W_?UW9\
0C4JjO68kC(IgRXgGllX4dl<3*UYR%\$u)70&8B'TI&Eg#h6tbtgjp]A8>H9?@/oe@CFZuWO4
k\S,;eON\E1>+WjLpW-f\a#bf-b*`M-&BtU>DYA^F=Np)62P[V5gRH>([bU4l$/l,5OKq%rE
[&-:G>H7)@"]AfXtF<>-l4E.W>"kTF[i6@kAVRICQ&?_$B*c\POnH3DqK>N]A4Qip@Cmg%pt_g
%1J3)cktNLe?s1c2EafO]AUn2U-R+Hhe`@2R?oMI2GiLrcmZIh82Pf\%']AW),eZh%=^T>TPrV
>>?FNQGr*gu(&C@jaDB`[',C9H-O7T<TMmsNGYrT%69o>mh`/6Fs1Ja0f-:!l6Q4lY,P<5=Y
CCSi?i0U#!^SbjJ)V!o^M*pBf=X,KfM=]A1CMQCpJpCh'n%<)+6!2gXP4D6:/FNm%#poXa1o1
/2</U+u,.c%3`/`l9>n/e(hCi*QHsP$Z!@hMo?OU"tUCPLi"JaelYa;@btOpq*BN0:g;B&`W
O`k:\6jM@V,_j@tb1?:?T_R_CrI@a1(g*?>6!QWTc?hQo]AkU<9BM"[$elTM/;a#cNBi3o7$J
p"5t;<SL`0BMuuA;Bd[/6hX'$6L1Gq$CX-):ei$Fa)Ft;ks0PEJ:JG?#d,g3^SYN74UQJf<:
$lF.>HM,B[NsZm5kZ):r3h$U:iSp-abeHoPlZ7GEGfmF8(sI3]A6$P[nZQ;FCU-D;I75b_4#?
SoFNGpbUc<?U4mWpLdK=u%(8mVn_T]A4nb*=8"3H;-A0H\C&6(D^8FL'CnB2/fIT,QRd2BPA_
u3CT:ip[PUC,aOJYN)tnRhUa0`aq7o6,m3`^;g9%+!<Foc&LDC!>[W-n&X+)OLVPQeMEU*5f
jWDc229`B6(0>8e7Jl(A#`kJZUX?9bFhS6X]AY?<>gIk*5\;6ESV%iB=bZ\Z2TSlIDP$>ms'+
"tC=g2PL>n?o!Dc)DTt:VEHZUlSU*@QYD>4D7Bi!e[-?ISZ`D>EMIuT@(d%Z^O6EAPrJ=V>Z
i9Kcl?2hEk6AHj?\E&:7?B!UZW)@I5_kq6QKQVZkG4e7Oh1\M^;;dat"m42U)]Am\_\s/q'Oo
6AU3S('_`L+Q&iUa966GDGDsB0QbPhuhRIPJq?k0?$9]AR+O!ptCF:$$B>k>N0RFB]AhG:SUiB
HQpHN5Cs(ZT+mB[@!OmGT"7`H1TS#.X1JhR3qU<A"L!*edV#aJPLXZ48a+9qY]A8l:36D=>).
f_>lj0LZdgg$BNF0@RTZ.,@_pK6_Bh30Pe+*Bqm$I[rY&m$25J-d_!Q_,<fOe8XVpBo$b!*n
HL(e7jRB$FGrGaKSdGO\a]AJST)Pt+G*,<r`Us>EVk(Y7/5ge]A1h4hm%VU/X?\tUXt\&^XDN;
a!DUa2Ej@.LObF?e5uWCUQC2bCe]A>;#INFVp!;#]A?;b;H_i'p;kuT=4_ar'=BUPn(7rf-MlR
OY>J:O947gWc;47l<a,kSreI-oB-=B9eDE/]A7:#eVMT%`m(U%GkHK"O+rRas-=\bbIpV\2,a
fH?-#1?cmYo.$rn:c"tf//g9`VoP_)Q+Ag[F:BPRTXnV]AL>8_VQIj&HDmn,%,INdqlho@R@g
ckcI?j;[\oq3C.mt3o5)`dcYM`#;@5Q5edgUDhN*Y76F(]ATZ9S1.2OCOph.lbE46fR-\;uSU
U3W:lE!RiNT>4Rl!H3/E>%e$:Wg\sqam7:4nGImL?KBipEc#&An_n><L:lb?#QN?,$9XO!dO
S_]ApXnXi,/:N4:$0OiYDsIgBX<r$3nn@K=-DD:!ioCuI6bGl*#WpGm0D^3r&=e=%JSdqX<%1
M/R7l#eok%M2>Rn@\^_9OdFHcAe(c]A`eGIZmIF=-7R8mGgVB9Zn.ISh+YCC>hOTQjE)#N[8m
*S_OWNF[(=+.M@HX+$YJrhcgk)Pt$;K`1$UR`)>J2b*A9%FoL]As39N=V<omRlDR`%)eQEBL*
4S]Aid7Y#;o*;37PD'k?#.Xf#6eu4TY?M#dJ_"Xn0\K``L!2(=>@1_!c9`:R=5nh2K@tLn5lt
GC=M!=U'>djl/)PJ2ohp=!$)Mfc8I^#@ta]A(&C0D31l7AeoV-JD*a]A7g9O.5B?GSf^3O[7;f
JSP[@_)e6Oik?pZ]A^L^]Atc#G@njnM*M[ngT3,8Jc>;rTrqVu55&/I8QYj`ZQB+gLXWAq&Fe;
[ej',E$T&,f#?"u"m*>;Aflal4gUC(L#a4.#1R<HK6o:/lgc0hfd?dPHf+\gKpqq]A,T!4ic7
jf2:3@EA`qZS4gR_ESR0,cL"Y7ZLs=J:n<#@-uT.t=/(q2j/+nfF86el/0fPe,!.(i_I_O>\
E+oBC6a<L.4e;[1S,CSq#G<P%dVVAu2%8).*PAr#6-:L0e/0+E@IDdh*U*JgMd[)ij?7,#F9
JiI)h=;'7)`Bcaq7BJ^PIfn9lh&GhU&RA1\<ur\W@^Hs7fE#=Jn5:/!&RbAR4P9!qAY+T%nu
F^64"K=I^epjD%#0I$39^SU1bc7l\mqpuc;f^YHCDL&DrVUkb0YpgIpLo#i&CLc:4M=Pr'[F
XZ-)W'44*[0_WDk'\[mL-,cCCcaRoq+J1Y$^386N7jn#mcW?bT*e[NrXQpa*Mlc)U2/E4<:C
WZWp9/,^f25Lq(TbEQNREVmr0kAn?cb!+HSE`X3NJXV>Tg^na8b0Me_o_ZE,2kW:Kt7!O)uI
b90?.^5ZTh0QO!AXkK<4nF?E,\(?3o6*.#8j*:8n1LWI.u0op2N3p<*72@Aa8GhTh)"lga$A
ZSt,&qR0:Fkm7TLn[UB#XrP7k=4U?6?5gdc5gM(pI]ADU?8qr%:oEKBVfk[MMXF4U=IWnn:3+
]A\ugH@jL9#%,@6"<JJR[ts"^,No?LR<N?$OD$bKYne_[\THnJP"6Z$k0YH_f3_10e&fkHSMN
S9=fFC&j8^D(kX*9J<f7A+<GkE<(u7XJ!G@a]AbK,Lm5S"k_Dnm=afFgc(/PcHlUSJ=Ve;ntl
,XM.#^Mk7XUZ1oOBdC`.)]AOb)^68[gDj*2csjUuA#kQ)U6AZ?aUEO8;;hhM=%:mn9SHmg</&
?,O4Ni%DNVjS:0Aku5;"SbP$_g4CYM/7A,O#G#><32a.I[U-R?YJ@(:Q9piXjF'T>mi66XH[
M#I\=Sk!jO;nXV$pE`[fA;i;5@DFe$"tMOrdl+V!"SRhqTaj4b0oM_e+c-Z:YW-pWA,B00J6
(h^,kJI"5+.EiGjHL*UUqGf^E_A_[iHK=Wd*Rh$[N\2]Afd6N?di5H2<&tDiB=KGpUR'UAp4-
NNnI\LH&m@\3n\iRG%Ech?.DcHm/BOR,qUM]Ag_(^HX0jG;1s.>[H/A5E'f!Hai;KU]AL%4gl,
u%sbQ6q3Td^ue]A\]A=,aq:$XX]A.ZKlX]A^2Fo6Y.4$^d?N+\EJ]A_`Ua:YZMt\_W\#odoBV//&*
iacgS;DO28cqCZB9_\26NHn-rF$\SQ$"Efr<<[IhGR\gS5,r;+sraQklu14p8%>lPmuA?/^8
.(\iP8(o^f%W_NIpj+eE;`9mjU"56lMmae.OVl^9?/)H<;_3M'iqV!CB_:<)Dj"J*kq=]AMa'
g/G2QO*rA3lg)ZHDYVj>VBNUSIL;;,.hMJ]AK?cEHejnUjmORBe(j+W)7;nb9@X5R=qLt7h2]A
cAlKi6Rub'HHWI`cC<lIA#[>f(M[1Co'FJQ8r8&0\`:oHuqiM62CC;f>Ct$4mHnU'k<AUu+O
"6g!`Sf4-nE%#I+4p\+0%YtFL3>\aHo;BP<L,F(eQ/?,-gkYq=**neH%t#\[LV]A*=En@%H$,
jF?,c^h,!k=A7t+t1ris]AS!<)D9Htc<7@)jEj6uL7O8^,2;/4?@jhUdiZ49IXSKuOrtb/YiD
%&G:$U9S0ciT8um*EQq+Jjc(<K@_84YQMVBlgmNI"l<Im2F9cbLUp*\X.,f.5:#I)h*\$/@<
eg'?fjLjg)E&#V"Z*:-?TdTUTQMX0f-S,]Ahf0H01)tHDYYbu]A+OY>D?XF[qn99F,Ulc5G/(9
hWU[P+Ee059n=oY!_VXs_Q]A+n<2?B0;G$*H#CI]AFGmYFHFqOL&Wl&k*<1#^o3d-cqT9`hqWS
:I_4/%q^>8,@,2afiH:]A2=`Tnr7LAA#3A9U3EoPf<>uuMGFjDI(tI(4JDZBBJ&,8eC<nHH0&
(h$b22#po4!Ec2N(qAQD(k]AA7,980EWJoO^nIGjk5EI3;D!1WW<Eb3iT'5!L+K-(OcfpM9QQ
Fj9e#oX0_RJtk7,a(g:M9ZX5?I-N;XAaL8+=S8/eqnFho#)95q"T!D'mU*B%n1iD@Y$8+bR_
^H/\&`brW?#MJ=qXpV%N';oKOkCc\M87MAOhLm:+>/uj0'?\P-+&94$V@=q"@9DrG!.,g_0N
"S9CoPNPFs]Ak?V_.o,2Q_GRVZBI@\OG0[#9)bA!G(M;P>tfncB2!J)dHfi54V\UF6R?qHa5L
#nfXdNWg3&nQp;R/QVW2N1shjBsUcGHUYUp#tWgMY3]Ar1/b8]A%r/?ML/IDS=.#[ZTV^Itl0;
b89HZ9U_Vf:u.bOk[5Rf6/bnRHNil;B2-:@)g_\f!/>\8%]A4n0ld$F,_0q<X*H?FW>.#4`PH
4[cfig2/]Aadp>`b5uffQ%_;4T)fX$/nsI9p5Y^.+WS@@EXS[mW/+;^SVna-,&1?alIG6<R^o
^qpHp1Gp+0*di/b`T2lT0Gq`iVSrG$XA"C0A,JhK1"]AoZg<8LrX:pF%]AnQDaE'sn-e?ggt&K
p1#j9f``bM;D]A)ZuW#F78gkSFi:9/gQnGl.t6189?p&&]Anl#^itg2_0@TOsS)$N&Z#l,o%:U
q9\YG\?)`5!@_W;XHJF&Y'.d%e?f*'Kf`rj',E#?ch^co^iO_>qE-faaFXShV1m6gTG"Q*gK
3ZBduBWYJoE4N(M$&@XeLFW/1g+Ld)P,F$&=)?D!;?mTiT&M:WNY)qhhb<48cK1isc&"Cr7d
ZsKWobJM]A;W8$i!2/d("gA&q'ka7->Ah`4h>aSo9U%aqP:Tje6Xl1*$&&Zr.Ll:(tNb@=<&e
d`9&jE3I^-&cra$/Q(Fpe.\9rctMh#.hLG]A!kC"`DnH%O0tt:b%4QLK_)[bkhX78bp5Yh1Rg
27oWAal.b&UX%Grq9Nma#h,kIb$(PC=%#R.1?9d`>j2-ZPECic$aG\GXpbfYSoKD="^7`>f2
2?$i]Aa0$L`sVR=f0o%u\`@Jp5\60QBr_SXacT[u,$sUOQ802&9FP*'Xq5/sI)O&TrQImR_"t
$Y!e^cs4-e_haeh\[?)cAPHM\NSl'AtUS'%I49q0T2VEFt0Q:^)BeEWDl9#tK?TS^e&#*FO\
0?XUMLa5Y7I+L[l`[,XqT-&uLE9C9T`5k]ARo:4.@Pe#H^^A[OFj3ra>2gp:K-%9BX;dPI\A4
?HiV_83Loem`k[oJ$QJ,;;!AnUnArh^9YH3ZL\K)E=Vpf5OWNPGXK]ABLT1at6P8"hMU#?J8k
j/e0PQ=>tUjf&:*UC#ma$)1?ij3#A/C%"k1iaoAr\3>M)+-gks-C%CCU,LsoTe3iC]AAA#"H2
g!^3,?fbI4g#V;N"I"I'o9Ugr@-@K]AlHi7M!)rH&-Q@Qam]A&86cb!2:.uT=-uXtc2LI1,</5
^`+%ITam]A_,+i$[mO`Ha%`*/@W99!/eLhMld7U9@X\/AJgbRNV@@Bum@H-4,a(1iJ62*k%+L
>_O3d#T%jaLE>Ut'blanUXZorGM[0`h%(u>DlFP;ZD31_\V>D,M@7s[!SLl:nYtU4"[Y+=_i
0<Ird:]Ahe[iZ^$,q\fpl`'CrhFo%\q,d!_d2SOcmE*Uh8QBI1rYKb04U/;Tn[R*_p3m%Tc[L
.cCSWIEd.G/EW,[UT?8#?T8g!SoH0rFU#N!*]AUM.H.j+mWhbQTM_KJnKqRar9Bpnqe!\&b^"
0lK"YPdGPcSsZq7,WhPJGIL<g4+J[IaC3U(PMlS-t,%_F&2bpF7@)i1mN\In:SAflsdg)Is_
`T\CS<'g:0N=A=A5S_S.%Nr3fjf8[5>$m64Tiha"C@LKUK=]AGQTthJ\t/bmh'-;?--5qSVRD
:+7163-fDnr\lL,%?k#:KWq#CQt;&=99;lE5G*?ZRbTsqaOr0&3&S$KQ*g4akF\(KC)-c0`&
Q]AdWpa18p1l+@:KM()#Q6)"Mis@jrOLk+!\tU#i*:5?ha8b?<kjqZD0SgerRFWMiWpu#c/hZ
:lpYhUV'=[]A#FV(O=CY&Sn`Z0BVZT5q86Ih)7E,cl=T3Dc&=(@b)g_oqpCEkjc"Ml]AXcpHi#
5+h.EJ"bJn.O=^q]A?+j.*Oojc(299oIlk+9Y==]Ah0E!m'V7SOV%/rH"X$N4F)=+FiUtZLq36
N=BpED-SYbmWs(NpU%$\FSS]AM475WgU;h(>EEJiSq50f`1%)_dbh;Jl;PHnblGb;NLRq28SZ
)eUq/$4&=Vp2NY#dX%AsV`^2<okATY=T7S]A@?c#<FB#?Yo#:CE;Cu+J",ZmgE7$aC.QNm.!/
WY1B:&WtI,+iHK;'kNo\DF;?i6X'lhYL4A'Z]AqIIakf@7jE&rAb/\F#Xt0A]A[u@NpRlc1\O:
6a<O4K?0h:iC##)*?%.=B4+-atFDcC;Ul``cb_>OH=soT>.Ip@<oJdn]Ae%A@ioq+//n;i&JJ
cCH;:^!$`1#<\<*@IE"&iRh.'##PI&Wq.MOnXfRpg;_;*!k+80@Ogb*oHLEF@jUemZL4;mlW
'Brf?F5i+d(H`+4[^m]Ah2TU@f&u'^?)*?gA+7a>=@68n&$.F$QD/2=UCP&c-Oj+NmZoR.QU@
h`6pB"RB+VI_=u.WU+r05ge(:s3JbEIuXW*[K4pA:ZGGmO!B-S"UX-q!#A4aOn&cT7d?ZH=:
"%3eBc45[LA.2[*aXNH:_0Bk)`)YYB8IXAEeLq4%I@0aP`;II6IsAe<uDBfNWY@JKrX.n<%g
>%L^l>$CF1fDGTB2,EM$7^,(n"ikY9+pq0=J5P@X$OE.!eA3@6u.`;6)A_7[#$o94mj?"[B0
"L'sXfnK'E"kYa9i?<"T_u1%);u:/dP%:ghUFuKCEt4/:67^#m+Z4VTdpAE8XDEFek,K7-kj
I`AlWXWE8p_$A_DR./COgHZ>n((F#J*'$Z\^,Dd=OQacrr]Ag["qG+A?'EMa.S19EN6dPr;AL
Rg=/,_`/rYKt6i%.LIfAirE!GQ3r>8g=VX8J'!KGAbj.@jJSo`FtW8)f)E$Y0mmBT>]A-fEG>
"QKqL8^A"5TS&Oa2W^e=]A^L_b2mFbI(;1NYLYq5F@:E7UrQE9AO::H.aP1;5qFl58NiIH.1Z
_b6?AG,q5&0nNeBQrK!1OF.i;f%ZnMWi<XMMeDN@JSBuW]A\krQDM;gtgiH"FRD+ZblS&;TCe
NfbH8SRk1>MI@Jg1i(7Z!eTI&-rQ.io&TPoNXZHh(05>O@k#r(OZ7<i>WPMc7*tDQMsoMgd>
IN`\Ra.E)N.1FGB-#R#;fL6V*iZ!,HG)GGWpkIo6RQb2)3epGRBt,2N8,:hu.M8&[0e(i<55
#J"V//U'pbm*eC8iuCnm+HIfH`J-FsB7J'n7%%/;,._Mt'C4^d]AnQLDH4+'5fI_V.</RRabF
'Q_bq##.9\n]A)^]A@Mab8bgHZDh#K:qCOuQI"]Af@;#EFWB4GG[H?Bg7nD#W6SHR]A#\UgkP\Ca
Y5Y:,o]AWV6S1D0;+[6=#*SWpA>A%"oKoH2!7*%G$O9b!8f8u&8:Z-rN@8uo5plR(ttFQjC.b
8jpX]ALNH[q#EK]AqIO$0S;@jo(F/=!lYu,('6i\e-C-]A2'>I-tQ%kBlC,21>k)ttG<XrmBFgq
)%\6Fl^Id=EdSU!tG%_'&F^p$^-,1PtpI1>EXIW>K,(5-p)IlklE$(7sJU8?#&9q0hVV75>g
qoBW'k>Zn>'N28Bn_MX^dUHdJkb296gSBmXQXm,fJ'U1c8WoNW6ORgLkNA<U:Q`(mN7*M@.U
#eA]AlR@Fd)U9VpK\+$qqBiRDdno(%c]AA'/ab2.6S3+Mr\!gammQXWf)rU'*M]A;$E"_qW-MUS
BdI`dS?[[C!&,8Smq/h+8PX3GO4>Y-DIt$NW"6:q@oYTM1q<Ke/9iVd,P4m*^arDo'r&cIVj
RXTAn8XF2q<uo3`J!Y`o:![N:j:/h+pPb6gG[6jQA)<73"le::uQ\-f8%,In5lAbZ$Yf&lM[
9-^DJ!02T3&]A,+:Y>/=:"Jr-;#J6p*#B=`40h;iOtX9):O8lJIZHi`J([dSs0e9X)ekrf@">
p'NRrBcS@bI*ls-Nu_rUf4Z?kI7,:XYtY>9M]AG)pJ+pQ^VcpS?QiGB@@-keDVG\`LKBX&(rC
6FbG]AebnZ<>uTrt4ls7Y(Q:"NA#q_>0.E:m=G'YWkKol0Jt_?69ghL]Ak'NSk,6pB>E@+Cf96
Y#int/CT<d+2aMil404cEa]AeJ5@[?]A2C?G,QPrM_Bo^VgFn7`jPn@9_e.H[5&_J_tCg`*P<=
n!shWK5GW(XE&XA+;52e'K28T_R^b@NpQ'!jI<E>`&ghphTp*ebEmV,AY(cn*^*`BAq@E_o\
cK9jKEs63WqMVDXn3&cM7Q=`#o2W9-\BB4WV*H+$E?psR[)g=]AT_1)5<(-m&EGiJH9BWP6jf
U%$SHBAKaSWW?^R0]A4nErgQWJRZc"rZca]A@>=RuWpDgQ7oa=]AF`je*YX1A.9P0p@6#K6r#r2
2(qM7:ufM4QRL8m)iR5$KGRO>At33[#Qp.m6;;hV"mlc_S9!!g=H0TXW3Y]A;pm(nI<5%hZPY
_YuWdaciPq]ADUt2anCL!T7tbg2]AW7=(Qk[I2"$UW"Y<YbgWN,1b'VEfuLDjlG(n0&56>L,Kn
g#&$8c";_<^!gBKT`(M6q^HOHcKjd:V'l#'nq9#_(nqrFEX1GKi#;u9fs4;^urt*I;fc+S!\
K"Kh\o!j:?n]Aqhc5m;P_3;./^QI0X!r>5s]A/&NA2=W)]A<2"P457YP9_2KDDW!_8;`^71M*;+
;MPDV@0;]AEc.R4e%_[[X_XLI!0P8SB6$S&.;p&@FfO7[c+b3Vj$]A"ar*/7(f-9n9P7Tqr(71
>U7b^0MZ++%TQ59.pGW334uW=epYPopgl!#_TDcN7Q1W&k(tc9BWt"^K$G[#or8bTaL`Q=3h
QImpN8-3<h-+9iA,Y>P>E]A6V9YnYNQm\Am>maK3J\2]A`_`m>sLSTT\:iE2s(*HaA@J"qtGa]A
NREYCPJ",F"mDf@uTt(4]A2gndb`&$QJ_jBauD'U#>60^Zr3]Aa+e4E.)=FSKO"/_71dXnHT=s
FZ=!@-Q.7@XF`,B:T5+)bT^1uk?N]AU34]ABtN0Gtl^bWp$D,_UL^-/68hM.jn6XikTA;_rd(n
EsW9_60\<4>lXHW3YJMC?/hR8:Pn:dX2:[^)WNR)[]A]ApCbRRdo_KA[GmCrs<h,hBkkQmC'=P
bE.*%hShj@SSeMjHZi(&ZTbrh&R/j!*X#Kac7!I"jnU=`sN;d;r+`GS%I8&DKsCEm5_?Rb*c
Np%F"W+]ApI4,HW%_H6s5JYE+e2I:*,GrA[ft+$a?84$?aN.$fCLN3h*a4"gKoSb3o7?H?r"j
!$:qhHA=q^CajOfG##U5,CF87MC1*fcu_j!`TE1ZT@T^2thiVlVENtd/Z)2E)m,(`.Ujo9MY
QV[TH3&PrQdQ,%pckJ!%J-09lF5;>,[#&!L0YE;\o[GW"ih\#s+doE"UN))\gDWNeiJ3r9qP
af(YB%2>p*qf5cf6,e=jp7;RiXO/k&/1#WM5/HA9eP'WC-Vg*nl`HeE"TP#BqhftSPouKb]A#
>T`qU^Y3[o=+)XI?7Q%J4(3rI76M88DWb2(e25451]A4`aP`803pT9kV[U^>'R4b\HIWn7*RV
=pTcO+A1<?/^e5eU3dYV_8ZH_0r6P:kec+?B:4Dqe!!~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="501"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
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
<![CDATA[1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4305300,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,0,2736000,2736000,0,2736000,2736000,2736000,2736000,2736000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="2" s="0">
<O>
<![CDATA[跟机率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="2" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" rs="2" s="0">
<O>
<![CDATA[手机毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="2" s="0">
<O>
<![CDATA[单机毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" rs="2" s="0">
<O>
<![CDATA[单机贡献]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" cs="2" s="0">
<O>
<![CDATA[配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" cs="2" s="0">
<O>
<![CDATA[融合]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" cs="2" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" cs="2" s="0">
<O>
<![CDATA[换新增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" cs="3" s="0">
<O>
<![CDATA[会员]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" cs="3" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="0" cs="2" s="0">
<O>
<![CDATA[分期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="0" cs="2" s="0">
<O>
<![CDATA[后服务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[利润]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="0">
<O>
<![CDATA[利润]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="tab1 th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(k3+m3+o3)/c3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机贡献"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="配件数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="配件单毛"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="8" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="融合产品"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="9" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="融合单毛"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="10" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡单毛"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="16" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=P3 / O3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="17" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="18" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=s3/r3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="20" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="22" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="23" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="3" s="4">
<O>
<![CDATA[合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(K4+M4+O4)/C4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(c3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(F3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(H3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="15" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="16" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="17" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="18" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="19" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="20" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="21" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="22" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="23" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
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
<Background name="ColorBackground" color="-3677185"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<Background name="ColorBackground" color="-1644826"/>
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
<![CDATA[m<s7b;eO\]A9baS*d&O%c&k>o#'N@Jd#f3rA*>DbYLhpf?:j0]A"JL"@!<+W&WMT?D[$8*GFq\
g%i;@!;uKTH1#J?Xa3K^:Yn?!KG>:5AIiV_cfrpM'Wbo=6eUc99K6hfI*;SEJU45%&<@88Y1
A!!%rNIe!4W!14]A/!:ZG<k!=2l7<[GkJ;^?!I_P-ko;SLUUj*R-N\%GH]AID<F^)&,6if)^6O
/(\jW_DT(I/:f1p#_:C@psGLSobBL]ARl\99Z^VLnC*lI:UZgRCd*sc46M&loAPVVem[k_^@5
5LY)(MTktF';A%5_""L6"b)Oqf;VqQ,]A$DG=VLCWak,*Zo6jrTDH1C5fAXipMe<hXAZT2BrE
&GX\FCsog"f/#TH]A2Jf*:eW8q0@MKS#=%enou%F'[t-V+0W!U)@Z_D4=O_DK."=]A<7&[1J]AA
k4`,-U/BFOu@=mJ-O4)gZU56<Xu-"U"]A9i?oO!QL0kW"Km)>TB5M!YC%kH'[1Ri)D\F5k5V,
CQB_N!Fon]A?oG@m3"Ru6b6EIVfl-2+PjNSkg^Fq+]Aek.dkH@HtW)t]AY(81[rK\O*4LWFE3!B
%/.#h<YGO,13M<(D9o5W@(o;2P(3FY8;>1aj+)Xi%;>BIR]AS+^9Ur]AjnDC6?.*e97eq`V\*8
>OH%)LKd,u;q@@nqAe&ITR[P0@IZmW5g_7R-(/'Hn_"Klr+dHtLeMVE`M.M3ml9<'D772*;3
'e]A"&BNWI:Ch!idLXDI%dSm_`7MC9m9TP\ba>P`92,2Kb-F-;>4$p4+W%-1+`@_1P%=WGbR*
HS"'[9<lA$$!aG[=VU^Q7Ea^ud%1iQ9M"E=FdZU"WVXF!]A1?bfc5p')Tb%UAZJt)fU':<X4f
-5TY\S/KJRhBT0te+(=sKd-BO_+LjJ=Le16m%'Piake4(IVc4)L)*;^Kr$jG)9?-G46k%+G2
ZUG4/D?'Dr1h'MR6=h%G#e)<ZYaP&<Q"dj+R.OP3_BC1hfiEBopM4![c5$6WYgj4[@&>L_ET
GoFTTuVrALQiBX<spbAt,/&_`fpMDc\>%WmH=?st*f]A"Lc_lKM(<Op.`=%`UjnEU]A:`G`c%Z
@5,P7FVO&P2\e%u\iYu(iB-fqbl>@0kb=a[hTMZHm7+$bljUk9[/E)H+dhmm<0d:KN20!KR1
D.UhXX[8or':pP&Rto<A[Lt.Z`oCeCrkC6qNc]AU_D4"V?]A5o`N`mMMO#X01B*WGTtA+@WVfO
4n5r`iN)>HTb>"DgQs%E,!#_[g/skm4mW$A))$p>!s+ARVmXrN1o5ANuh</)7"$N;X"!u,.K
"ti^[l$"#g^In7!C:dQaafk>Y6+rL%'`@3*nX]Ader,I1AE1)I>PL+O6N0Ta-[%>Eo27UP+#h
]AkYrW+<r3`5sBM<r+]A3Y<+Mha]A6R*#-HnQFf:JnKNP;!UC1na)p/_HX1$o+]AZL/)S#:]AXST'
]AR4^]A<*qpm9Pr4<[r1aEc0:1BU(J$!HKcKO>IL[u_.=p\'"#Eqb4dfu-F#F_&Z=q?R":PaPe
Zk(T=82!4sbPq2itG(rgZD]AVe380$[8q`rRr,'Uci?[d$$VB:dNSajUt]A:NAebV#!#Qb@A:3
JG?@'n`BP)7%>BG1FpapVgZ?*=T1Ir5;r+QqQ8boobIck'iiq.L.UiB;,u,S*j1$NX'X=r\K
!)R@_)sPRgfQmFJO#oN@P8ZNNg&b?Xm6l$`0Th*;7OS:CHY)Bf;T'se?G159=8f$%$sM1@ZZ
t[3$bQ1eT)3*ZXhgH3eAMfpZdF-CX9iZ<Z[*%,01uP4Jh&DI/g3Xg5QbX3`PJn=/qPKR;Vj3
V.SJFWbc*NADPfb8;U_ZgY>#W^iZ5#bdfp;*fJJ.7nP5)#0HYZiUNgTXs-R4WLD(&8S1O9]A]A
DlF\^Ams>sWQjkDWYfF*T21<&md2S<%b0_UPVt9Wm>XF0Zu@rUcCEeQZ[n-_sK/:1XZ*eHWk
lKi8+/1BZR%cnru@TLN!"Xud+$N_(iZ<ibO>:p[-'ILs:q%b?XM\:pN_'7Zqh(+,FRG1"^]AR
U+F*$c3M@W5c0Jm_ch[P&:U!KgB'71oG:0S^d6U;+NO]ANu@boA>$pHXr&Z?Nrt[uOTm9Q=Nu
/q:L9u2:^6=ggXd8,N-W#IjH%oNNjHUA?,mFMXK@2caGV#R`8rERV5Mo-cKu1=L<q[)S4GiQ
YPMRr=pAZQ*jB\FT+&[U,G3bVI>FECjA$O<M-tT;`YU&K^]Ar+4#D^N9ZmF7:,;GS.Q#(F-=H
%`rK-8/6N$5J<l$&/t'/$Sf7EGdc.nNUrQJu5'*;C\Mj)hqA/Q&a1KKO^/U:=DXVs1iRX]AEn
Cp#2S]AO<B^JUm!56>6TTk]AMMcV_ZX=a5FFaS2Ke2!;T[#)@W?LU@L)PHa'`i%:9b^cEJ+8lm
MHHnqc>%_DuanlOG<3U6eY)T:KWL;9C*jDhHJ:b(i9'mi3+W<M0C.C4.XBq17'YF>9ruO/,>
HqXr1sL[gE/$K=V*?6:I>]A*7JWYlfeTia<di9WskcC%!Z06nW*CsJo4C+Y]A,h^45[4GPnA$V
PUa\ufG8s,Hsa7;-3]A8g,D-jXG+Z6WLeceQ,ZcRUpCgP#7%Zk[++0rob(AWA5\u.`&GJ0>6Q
L;B>o&\-4<QRal'RS=:WLcopgg'T7X+K>r><XEf!4Q!`-LA9deU^R2%A*)2F6KkY"WB?Mfq]A
-A:Ve:)'DnD8lYPJb=]APX>^(D43LVE8CeYjhhHcccO$'Fr65*Q/g1.AU`\P";lR6-PXpp[dm
;[ep-:Lf(%&EBY`l*QnJou>?H[u&uP?4(`h:kI)S`4pnY\c_[Q9=*K7lh5[\[s_CN]AXsJ/OS
5+$araq`'EP8EIXSrHjI1"3IeBSiNB`D8t`Cc\j+*`IZgd]Aa,uH[hu&/Pl).,:'B@_DMM]A[&
>-k!lAe0?'(/W!)q+P=-XekN1"gEZ$m6_hL_MIJ=,h$V`SQ"^pZe5H=g(Vs6meY?N4cr%j]AE
\.^&;M?BM'_Z-joT%.I-_@Wi?$#>bA-)+iSX(XKCCQ.51+TROnudg:m8eZ(DQ!`>4/WQo/=F
ZV2oEV:Z,PeBT<D53aCML#$ijDma]AkbK#D[l-h9<nOqG#5(%Vu@Dh%40Cp<G[Q_*0K77JtC*
l!qWpG$Tb1gICS<%CHo8k(hm1,W)?KYHCf"7e"&I-,nQ^9ecuQBt#18'&!V'ongjomm>]Ah,[
]A-c;K5oMZ92RM>r1&J?Ia!L4C$pH=@5b\-MGe4pJH^Wd\aX<6n(3_qHB>1,m%!$3k+"*RI1J
<er*J8r6Wg*3XeUjH`h'M.[+Ua@I,_dOk:QUB-9IlOd0/,GMDes'["7Q6$Y1TSN%`-GnT,8M
u0d@@k"pq3hH;6/c:oF0*B+T++#]AFO)KS=Kl="]Af!-"1Fb;bFoi?4IA926od)?5)9+nVp,oP
OArJY(NK`c`K+C^u8E#:Fj!;9\[<1nc8j7X,$Y)l-`2MGmpBhf[jPhN3UXHcW2WRHY5TV5!9
8uWoVYf@geB,*=H\/15C5@TAc,_#DKtc&-AQ<d;9MD"a/\^fW7gLL@qKS>QCg3Yo[R]A#^Jb0
robAMjS=!,1KqS@F.9M^Y^0\qWTHYMnl_u%s9fd/*cpL@K=Zu:2i-h4]A<-[`hXHIAm;>jP"7
_?#daXuaBt_93pG9Ns&\=/6f0GYIEYI\9F'S\r:("H9X4_0"7!%mTDNnmC2pa%A:b3)0:XK4
tKW$i3G(f@)2Jr2g^!DRG@hX(0#e@dmgO1:6GDb7j_D=]Aa8t%%k!tH2I?QOlm#V'ladRe6T7
4ShTl^WjIMpN)gB%@`6pShJ+/mprQFICZ`GcROjN3]A8/"&gLXlIK^E(9j9;U!/s4aE5N<%Tj
Vim``bLj]Ag"Q1C;=j\=<&0Uk[!A4Y,FgX![_@(@l&"\8c3:"rK?7I2;g@_CMH1jPp;\B"[]AA
)oV[$Q=]AU=SkptmMe>o*BHIGobUD/AfU24KH:_&&Z\FnX)M`5.;G.4PA5ZRpiZBoblSC"VZ4
*\R$V;fS-,J\51B>lq4q/%4)@s6(#%l0m6o+GD"3?4YuF5T'(f\i3TUpE]AA5.8a7@hFSY@O_
3DHBN`Z8#g6ME6%4CVO$Rnb2E0n"lNN0eM!)H^I1(6X.CT=DLdWu1&'G08JDfFM7BpR=]A6OX
bYocJQ&Z)>)fm#FBG7LK5,Si@S*DQ<0%[p8N(G7]A,\LaeWK(+1#qRte<!tD,3KnYlP#Ehe$J
LYlYJC:+in[W9I=CssnO49V`-YK4q31;*1Ff6*u2'^#@XS,+SP?h%_Pra1lm@MmQEPCk(BH\
1R\c\+0eqgmf=<gZr;sjqd^><4KDl,@a)\Yc9PS*pL`C=e:HZfQYE<^9:g$X*H)rBLOP1_Bl
.aEDt*kHU^c5suM<Rc"S:SRsB>s<?8.$Q3Ia%-jcq8[kg"R^^6Wdun0T@cj^Oo@,9i@@(5)*
fT<jGi),a60GW>Xa+XTJS5GRJ-EkG\*DBNHPS\^&gMYG\AqhPri!DiLb3&?XXAQ$>Z4k-bSQ
G/?$XDIqlh^gkR)0@lVKY3QColr42Q2$:em*g-<=H0ko/;.r7K>q(Id`e$e;Tqfc43i4rN&>
j_q,QOCW0.=/uf,b;KI^A0[jUjO9IKJpt^W4PZ`2$PSdCh>!$W'9T)DA&.t4pEVp&k[HhEA0
&o9C<J*(s!Gpf&"XckATqK'(u6M<\!m15<*=Dbum?,5@9q6O@pilPBu\fBG@HfIfO;/JJAfF
VKcCtT6,:CL3'k5,h0?#Go8MVB4u<k/De"Z6`eIE>1+"rKW0bY.PW5.:\'1;jha7j,;hX8JO
oO5U.N`R*_FN;]AhX@O^r-j9(/=O83MI'7Gs,d]Ag^!TZ8&L#oDPR!6.AI>ZFAq9i\CB")IS(M
Rc#I;1n#hI.n5)!\aQF'DmB)eVfh7kqZZh'j3\uh_H3`:nhY7i(;[?L+#tmpGcA!]AHW<Y[0<
P_W86ZZ2u*.]AqAD@*sEN>KUlQCVt?P*]A^PmN9)_Eb4::W+KLr4<^kTLdCEJ+]AM(Z##'li#R-
$?++)'n'[VDoJ605]A.8i4uq;1tbT1W`\lXic*]A;r8SW:LMDEkJ!T1eOF+riseHP1$n9i6-$M
l::#X#s@]Ad:2(?oYGe;[Xuf.h/Fp\r!aL#]AU`&sk<nPhr[e@_6ig-Rt/+<\ZW8_7,4IJc"oN
]APD5oX(%m*0tLG^1>li>Y\0+N-M6qH!"hMX5%c2D?i]Am]A&Wr&@e!;U1Vl&.DitM@-mu/U8W6
l\>JQ&\gsKgFd=s<RQEB%'2H?2Bpqoj%$L5NSc?FB^:p#`je!W:H?<hM:D'uamj2OrNckscQ
WUlMBrQaEM*%J_^s/*qUEEX_-<`4SZh^i0JDc>>d%]AJ`%"W;(d!j7.Y-R*END9&RL7\Cp"i'
qTiYYe^1+<LIN#:U$=5>U:lLa1BmmRV$O1/&t``-6pS<;;,GAp2dYY8Z<Y!O),NBl#Qs+oQ@
)&c.1CM&m&@V1Jk_m9\b-87u#+VFk0*QAEPoC]Aou%k&tF:6gp@=ZMYGrnZjH<C^(M]AGs!f#g
PXRh0m%AIOec/]Ap\8M-8"/!$g$U_h3BN-)4tE"BiNp5)I%ot@$B?9(t:_0p^%W%^^cV<hfrU
dRLO<aWam<PS*_(#)gn0T)5Usofhuf$q!l81\j2hS(K,Zqo^.%nB]A8$,G2Ik%hK;1mV^-F!U
h_<9*8[&KKISPVoEcC@JYMu9D)LnqOg2nu4Y,0TAHYaER@44rGs$nfs5X>W-HO[bcrS85Nti
8e+u.e;0!ItbW`g;knF!>sU8hpl9#Xrc+:+iJLQ'cGF.rnTk=d(jp5jSId%`U+cP/3=PT5Q0
?k4fG-`/GUg0p$9@rnZlmfiau.o\:L^1Sf'6G,R^.QSFr(6YT9o7S4CS=\X;b2@"S/%?#%IT
%RC#ciOMAH0k+TgGEI9/I?_Ekn!c=be)WPbm@r10eU#iIYPqNALLJLW5`H`hBtFGNql98UNp
`P\+u5GU[3]ALK@$$\jm5>,relCUJ,h"&'SUg!\MW`cEL]A#[-,NS_s#UFmiJnG1NepUh;JW]AL
<<W34I/rWnIQ!"S$7SU>2T=iTe6rAG8kC!Ype9^m6V2t:#/StlCZ_:hj@^`<X/<0R:pQ#5J<
a\566?/oL1KWOS.,?'W/%$^V;>0!e)eD!i(_f>2bsokOZm^&1SRGD]AnVX2!W3[4H^_>@]AOAo
'4\-[l2?=hR!iG>M3:TGD(jGU?R\JTlKl.q(B$nnG<e1*!oJ_P@l0+d^.sJLTU'fIq#WIAs)
Z_G\u@gs-gG(R>#18ICAYl^?dF1j#QCc.esa1QHUop7C:[><IdW/9Xmj:FDkj#E_QR`?1j!X
3=>nni*$n#34dJTDK",bL7-=3Yf)K#De@H;.OhjuWK]Aj\m6cBHs(Ck#X,<RBfo/>ErjpB&&`
8%9C#46J;50T%,dFQ[>JqDR$Zts)<=Tb_1Fb2NGQB>KLh&j`OM_([i>)p=4CbpY2_"V\_Q.3
Z^*a#<PmBA"Y/3u1nW0AC,]AAs2/QNu*.WtHXLIDTPGO<YCXE;N[`<[UPGq!mK+,%YK<BZ1I^
?O>f.0.4M4>i%)O^\6j]A?S#!nMl03-CC@eiq=)Kt9$%)pVYh/1IqlT%%.5'V/8l\($boDZ>'
.Ml?*2!jilpMpeAJ1Q%IM-h0P'Ht2&h7&:3(\:EXu,+L/)WuR4bC_[J;O=_Rj$RbK_Jb,I3[
bO;cGeb0Eg-n`AV$0h*9uk(b@sEX%fWCcL,)@j'%jFg]A6d*<J9fj"DjqpV!mFaR+ANpB8kaZ
_USrnh/%DRJB:.YTU:Sqi9p"e(bJM]AXYr0hZgtiThOf3^(2Ze158te.qc5^=N?#t-2HP%.3)
+F"GN:?lm.D1%\li[:r]A,N0Q:)%NF[,$#ecgf:_-,;qbqt.K(hn6iULsa'U;3eLhR3M%%Q;g
#n!(,WW;rp-"ECsC&;:pW/19':+q3EMs#@\#-m'URTFrr41He%;J#cEo+PV<M4J?&`TsVahh
%ZF`'ZmZVR?\i/*'Tb3'3ag'JiGL%uB\,_.+OH:$.T+'a0+.V!=^!d^AUTFR%Dplt__+fI62
sHi"b0U<;eOmX"@ZF-78PLe:'J+%C+=/B?^sr0N>Z&"'1!$4O[O=Ssk(h+C?g=eFeek>`s#l
-sS[:B.<gJS]AnZ;;aEi$i;Q+7dF-2a3`WcOd/6O4W5+h7S8M.3G;Kd&-4VX<aT6u<*eAeX)%
&h*<@_'P%B?"&J]A?d76HcdnkmQ@gI,%oO0X$URE"OJMSOOn"2[/ejE4$q;T5/ngJ;U`ReZG]A
P=$3Hbu\&s(SQLecQrA]A#LE[D;B>nE<*([U'a@KW9TAOOHNoK#LHXm)f=42X#VErPMqgILl-
CQ@UW"BtTFI=EZqD6D4ErnA=]A?m]AQ`I7*B/p$_V-PB=4nE5*gnDtA?"(<P1R"hqGp/0WBc57
^Ij=#>[;/ppknM/.-mO+EAke__:$n33;0J;pb5m+KYnt+'k4ER5*W+$eTRel7;\*_0HWs/c=
`Zu4-TuJpfKcoB;9'XGC%kQYF)!oo;`.*A.dcc--;o5^lZQ,,R$JZnFMq5C\QUJ`n4'Kgm'I
)1M>hHN?K9&Cf1+'M&N<#acD%+GHqNe_$gbShkDm6dB>)/[nD&T\.:C7QP-)r)?9>03=O[eZ
\SA:B9O5`@>s0B5,Ug6/+HgVbVFS5Pjd*At]AG1#1n`m<%2TAbp#c\HK8bs1-BsPBe/SN*:B%
8!W(f8n0jp@4?o`CAQB]Ap1b@Hc,Z>YEV4L,8'obI4op\D^LEMU`O,fFg!SG,Q)8jU[W5pY\2
l8@BoK@VKsgCf[=+^j]A(!-<Q4D^I7U52@G%75HGKIfe1flJPIfn)3+STrZ%qg1S>XF26[=Hm
A^pUT/0U^U6T9,#hsp0AAb@I+A\8]A[63K$PZIr>R:36#h8[.rfd`Cshl+&#SRWaPh%=q(dea
3"X7=dlcfh>?B2\Q-%L@lS&3+T'R-/X\oDEU)>2@fi,1X-`HplK[-4X++#TR,M?k(Qsm)E<p
r-Bn[NXlF'^CX-+TIs`NQ9=J?CaNZR'9e)iO@b6$LXHm&L3n,;0@7^sL,EgYI@<&CI*<7J4E
>3bWU3DeLgp>hLIg=I&FspGfb[Qg+_5"(k?NShVFhstFq?'O7D2Zj=2O>HER!Z;o4fkSH?M9
n[+2IQ?Eh8?>./uAPD$2rGn!>ha*)AC"sr%u,#VP)[c?L1rtlfEOl3*K&hON:h"hr%WFhp*4
[+<S\&Mg?%d%MnAL!ho6ZjB$2%4@ajGBdY+fYmI!]A'EmD`Ps1G?q3nAN#L;8:L0C.Xk8Iajo
'js"Pe95I'#YJml@:LJ/#p[#+`LAS;?KiIq"ao$=6%4q5H)T-nX!&rBTBZ%IUFY]A#=42cCbi
=ck,A^3]Ar\hbj<B(R-]A_M61afZ.@cj;XC)9V5I<W7\Oos%g&&gbj/n=g<AhT8HDi(ba@4'ab
\7TQ,3QeN*90l'Ad3g&=\@aFoRJAUbh>Zl<:c1-;ZZ3Y)[_t+.dZf:&JZ0UYTG<cDQhVl&eo
lQ7jTMV0S8##ARt6'=-[Y9"-&Go0cs?q6K6q&UVXkF0#=u6;EnjG>H1m`uSUcNE>3R,iS[3I
8tQ_V,<uaT[+"'"f?/(gF_^Z^.dm:/5;DM&ZZ5`2-WD(`>CHOfdjEW)K2b9ViqCFFLREt:0L
?<2>"*^[WcV8b"d>(YNLHMMY.!2,WT"^%)#?`9d"2/hDt9Y[D"Whj?`e?%u[="hcO*l'VVa+
V*YLJdV^8kM@E<:8q"1r&YPWqY.!Mq\%^G*C:lLNpN@p0G;;nA`dp[b]AU?c`Z62L$hH01^0k
$lD_D'@-=*YQnCMT;>DgY8`_6Djlp]AQ_r,gW]AYF-rq?'ZL\3@nX^rmFLjjh+OX<V2U<]A=JPO
t0$?nqdNV(j)Q5G.E6$h&Mr+*>8K>>142E*8LAOuK&Ug,t$Hlpnj5h*=i9/Qep).R5*u(Klq
-QRgAEN]As;4ZO%EQCkP0#G`#>-XH3q>cM-!`[Fa6Hs,QM".6Jq?^"Oao0(S0KhOhebkgmhS7
V/WLkDC.I="O)<`N\g?3po^]AmLEk%9cQk+sR;n$rR""D*<b>odA6F-@8kk/H)'T=B4DpioQ+
%+NA^q<RttK:D)#!aK=8pF7$k'l>ZS6]ADHW]ACSYY#X2fDEQ>^<#:5>jK]AnZ!oR2%nQe*nZ>j
!1C3LH5p6dXN<m/3N->0KT]Af9(sLAo*D1MCG(<'-"N]A>88334f;U2;OT$LX3#;.9e-JT3L:L
6q%<V2fb1`k5$kpl-b\lX5%((,^;:e49Ug7n3OK)C=rK92*cUN>e7R.NhMX@sfi+&-iV8KGK
uaj.*'_.0B#X<M!8";2`#+e<*RD@li2B:;(rQQ_CV\DGm$ATVXW,;$fU'0Ua2M`i8MnSfnH=
qW9cA&^7qK+>E(Xu-SB#n2qlX!+l(rWiQB2u6&&sY?*c<WVf$erUX/:V+f!WSMX=Y]A)4t0t%
D`(lDDf)>?&C%ufHKb0I>\[i>guckNcgU'?AZtU"(*1r"ZHl?u?eZV!kj0Icf-!7oO]AWSp\4
gC-]AP3Aqo']A%J47muo'GY9_1%[DrUSiCq&ofg6TSPH!-b9IU8FBGQYWr$,`tHC55nTA5#l=+
5Cq)rOa0UX#SfU1"!W7I8;A=g!mk5=m)Zkp;T/<YT^l`Wq<JN7s8=*LLder@G%);KTq5539]A
=`>%Q^+,150.6<idD/nZQ,HRID2b#SPLb$R'Q'H(,UoNa)Z6^nfCOgpmn)dhHISRo^JGqcfJ
#+MAlIBJa+XUhADKWpPh8arifPmPT+!]A6:s1YEKa&WV\of07cY2?o1V:Liq9adI\WJObZ%i`
rVTi6n=G:V2pU_O<<p'>eA\4F>d:>01!\W-O_tBO0Y6]A3,*`<iAu4qAmH1C&fV23pV^7Gm32
oc?l9Qnp2h(B'0#-cD/YX>&]ATua^f0j%D4*\V@.,3SJS[>@KlVBQuhc(hJZCf\-`+=-kp.NS
4]A@dB'N"/m!UQ=m-\4N-\ONX_mc]A9(Yg&'T5N@o[-)^qcm='s[PSuF(:!qr;Xnr\eJr\sZL.
6ej4(8P\T0Y_qq/+\%mFkkFlV8Tkg&tC"jEj'X.e4UCjn?Ba:G2:0IYn%gA[%;^2!/oe8<[)
E\5'OA.-)73689jg?iF!qsj,LT"b%5T-B47*CX=iO7Vc1>cX/]AY=hg0&-0^\Z8k\"8X>*NUQ
KXV]A;#cQO]A)g^r_hn@4U)YWS*%%hukVTYIa54fQSkaO"V+7k8NTh(LZ+.BCJFWENdU6]AYHK+
MIg9+A+j<`c07CQJ=3Bj#nSn-mH<1Xj]AD_D`"t&p?m[KG3FLXuKlqC"_+V*rR;R[USTeb#UO
#S$XuA@jGR7YV6S$@u9diJulUlF&TW#hWX;BI<W4V$*dtfAi`:n6^_bhR)q9aJ:a>QQ:A9a5
RJ/lL!/gUp/n!D?SV,T_nY$aaH_bje4SI[l;dRm45=*0/j+"e"4<Db2L.q67\3D-2))ad/nP
_VZj%45d,"=djm=#<%J@l)gD\/-M;iMpNu&I:$oR0`cYnNGlQ&A/5M"<c!f_os.o=GJcj)Ml
,[#c.LJ>#1n1(u"9FQ'9R=UUIpR7=iK_^@`ZCXoDqn@B]AGpfYP)@Z4@_#>k..kVor.Vke;ma
rimaKE5:bN25rko+F>p(jli2&oTWjQ6]AtajYWiX$\%U(m@ZZd3eW#jA[1/,pSMi/#;%Zj;o(
"?<uH)_;k#L8*@MjFN53lH^mMNR^Hf?UTu^n&7*7[No!%4o?o%0NA5drB+mW]ALNs69Jb8m(d
GZR41#UeX]Ag6Q0,u\0Ys)k>U;U9:"Eu=O:6U&cN)EMIq(KjiG[3Mg[m0<-3@ICD6&4"N7HRE
TBHt42YG5hni.O6YIl71(Z/KW-uOlX>+A6Zqr^O.Tn&^6f7*c@_,QWSuKffOU0O0d&>Co.j+
R,C2/2nFk\#`F,k/ZRs++MoZi%bj0t4r$q_;T9#'_NNd2aP.^lYkEaYTV+Lk,Fqq7s8(9VZ*
193D%7eZ2C#J]A.N,,Vc!]AFDP^ej1]A^aGAg-WjP-%_e[42;cWbA*"ReSri/4]A^S25^31<<&Pa
_MQpaLbsAC@m+@jp^O2>H31c[OpE^kb7X[RhcL628i:LubTXd6D'H*?>s3g,Pf#NhDH1ddjo
sNroI4NGY7/*leg(JaTA>AdS#h`l_;-IK%.E9W5qkX]A]AMagdk^_E"0U%\4Q%#4]AXY/,>N'Rr
)NP,>(=0r$\8&q5B*_;uGSlGQm#P6cWa:6DBC>(Ja%:B#%F!ZR:r_OS3_0`CpeVlat=;#liD
'GWgoOt@E-r(nXsm[&QSk\:dok@=L.hHR'X@!6<\B5pd7pU,jq;?iMa4nH6R)jE+AicO]ASc;
5^sUQ([&K8r5ONuGb0&YnHgPZ,$0;#C0EkpK<JmIon[n4<@K=70&H>'1F.Ih[_4ZR1Wk-ULU
VjL1&>!<9KAjh;ahD`gc^^TG:0[!uC!RY"Q:>HWX*kp^:c<]AVLe?Fn\2'31`n2!Ll\p^V5XJ
8]Aes@*0brgG(A*6nqA)&4mn5Y@RmMFG7-$MrohI=A(S%6LHX95RWVQP9Qo9lrKfb0'i.W/Mm
MRfZ5F/dYHK`%;lt:C!I`.M\Y'VBG#U0*AeS/+\7pd!qh_`KM$Nr88'Rqj-_S'DI0*=0m-;=
P8M/>,Xb<pJKJ*!iRPaZ83:f/FTj7B/<I9'0Y.;hPo&qto)R8a>^)&H.ds37^Y-%:i#3kJMj
%.X#nDW6D7RtuY]ADa>n-LPF>i3(9&)5_=D;Q5CcNIh&Q54FaEr:/^At#)\8#[5&&;[,MLh:0
KMW'k]AYDFU+J?4sDROM\-Gb*/$&r9Nn[-'&@fLiRQeLEb:';s$FZ$IJ"alT(G>RQ%[o&V*&^
Supri-SNb`F6uu>Rgdtd/nX3^kkEVBc+*ihbGA5a/#-.4G#\*Qi#ie\NcPs&kV:(_OD<jL1%
GqEaQUm^CU`O5DgWTS%NOWBiu\q626n`G93b]A;FW94:#Q8ubeHa$6Z%#,k`P9":r;rVAWu.o
Na6(?oh^DS!k2(%eHQqDb"=-"b'NLDX$'pnh/j&[Ai=m3h+Y\7N?T<A9-4:n,pl$Md$;efCV
8iH$XTFaoou6=fBFU[0a@%k!A?RCIkBAt5akr>L5Y/Y5F/MU,*:eJcdB[1n0XlUT`&HJjW0U
o(%#muCsrsYRYdpa^2F'9lGDLb,KETQAM-NI\R0J)jK*oSDcpY'Y"FG&Q4K'[QhoW43)LuSd
2_$i$s:3ZW6R/@^!T:L-^:m:HY%"+BfWA#&r<hqo\fC_7?oOpL&F&Xrk]ATqeb`ZF:CZa:06l
;:<+f93)1nDDio71L[P0OjJC9S2$EB![$[J8i5#mM3pEdQJjAc\eo>G2VLp)a.h?X2TW_Y@q
D):K!&i"^e[1KdqHgC)lF$9#&_4s1;ZIBH8O*^?+Z!`t1[kq?51LL3la*<:iV)T9jL[n3Mgd
l<kdc6=i)Kq*&j(Lc4.l?\l4a9Ub5;aYIbJkT=l)VMoND.#0@!hDo?A=G2BQ@>Co:S%Vjh4\
\QPnIu!a+PVcs7^c8.i[K?K5M;/Ib"sM`"?*m,"+*]A:("-%.po.]AfNe+KdK>d)as69lo$b7S
Z.Xs;CoM2XqpK=;K"1g(IBH4BH+.S<1pb_qll(qRE,#Sb-%?'oU1c'`_)8LbNSa*FVC,sE.*
DMTSu'3E0i^!]A[**XSXC1]AH'HuoPs?lEfCbp-=dMOZN/bA@2/M+TE4*a<6Ofp+V9['3F>='k
c.&#\BVS4D.N/gX[0r&,1`_5=Ku,eZ[i/hJ83%!g=4chFWNVl(:tKUsYs`OtPL`*:llmiuF&
hhK[NCI9f8I?_WAsc3XS/^gQl(b;GA[u,lKi9PC'a/Qm/'Z1aG:oHDO^FlcGge9#l8tCnrPJ
q0=JLFZg`auMkT;j=/+nf7_RaW4HSX?/=/#=/Cd0d&h$6^[]A0P7NajA0<Z9_GGO3]A"X9IR2'
:A%"WF<5j*-.F4Xfi><Ji?OL0(TccC?ZJ2e;s>UILN)A>_F2<.ai$Q,coc(VAupeS:@R#0(.
j=['*.?@bm"I`\8YZ4F->nlg>IMIS+A#_u?S9K0.S-!^Xa\%ucLEKAG78hW<W!GI94Z-(XBt
E8a4aOSt8.G&djniQWFQMPE5oq*%-9,`(PV4764(j<qsI$>Irj;dkHuYW2C9eZ#dDph!!8\X
kD,@/\hSKNS\*FEl[N1L3E9:s_2W8h&HYf3Cog<+4ZGH\$$0VL!40[2_`fYJ]AZqi@SOGW4oY
e4T!cd19\ZBU3@:<k0`mGc''suh8sL*EB^QX[h"=E@^<d]AM;O:jlLTf4q_-6^if<-%#Ue3*!
I<(7A6NETd?OD!;!dtNAPmg&K*-SD*g+Eb#5GZ<gN(Q"9o!V%VD9)%EZ%Z8AC@_/["0-2]A4_
O=@+%QY'm]A2cO&Al#&[Le)4%;uA5B8/jmds;8(lK6;#dFfl=#ujI`?c';%LhRO;m_3]A<MstE
;.eVk&S%1cKhjSZ(:MRL``Z2bl6skL(k\4*Z[!#*<tE0>]Aa8V^4]AKmKrGl`Ej-hh?#\2/W]Af
WK5Zn&H5Mnr2@6R4tjP61he]ADBfW):,sZdmD7;OL6_Smt*PJ?7L]A1-tB\+*Abg8jO;345:3L
V.IKC?j2dkbQ[+U?DB0N,!_'L7SO103VH?)u"m]AhFBl$O)rKs>/ZV<#]A!CYDn*jgTu_HTEP;
$bG7KY.aZ>^uEH)i>5daa$!Nb']A_m0%J8*Ng&T:<!0POro2EESWR4n]A0*)WSKC[o]Aq:a$ekn
SOG0&SL9Lh,X,K6-P1)e9Z*qcWE4;Uo)-(V()6,QN'l1NUZ:3+G1R+H+LFN135Qc?U>a2b%d
9dEb`:TpuZ+4DF5[W%]AFGH,KEIgPp5JsSAUW0/=3+0g/25Ip/ZI?M43oj?-$)B&>rgg_kcUn
u/7;Q'!UlKY:(^>;uVbfeh69I;n;EYu--C"+mYA7o^*%Gju.boOT\D.0;3bTllJ)n8+#86LM
a?/TSldedN$=GHX[cn$sF87):++LNsdC,<[XY]AYF"FT^D8]A8@Fh^V-1]A@;44.nu?<O'lUIsU
TN&o5..IIUQH*Xm\8:_p*@A2^\U<7`Co6.Tgu!kN@qRkmVfIA'F0Jbg8Q)kc,[3Oh1Xn(Ftg
+gHlBtOV7_*M-[k=p)A@A(N1,-oDY@5#fB^5i'Iu4UGC;8S<&SPr^2rYT^M3\Jn2c;4<&5gn
F`OTme,sQk%7'*Eipc99]Ah^+&>kX8NpKq@UMIe>S)(Uj%`h`3aMlOq<To?F'M^DB2<u9__M>
'[8'q_lFZIntPhh&5@n-8&cV5@&W12[Zn<5YP0Vmjoi\b^QCS+BT`9s38\C*OPYX>^cqq&ZM
d&e8He(7=qS3sJfL.6da+3Wmt9K=bRoR=^%3@SV*-Wd@kC.&Ol%gWs_aY'cXi=(SKEeUbfhr
:'!DVepGOs.Ip>T65kt$iRR'$q9@O:rdI<E>9m'N"n6,Q^/gfB5IhLZJ7DSq>(g`m:EY!*)G
8#[TY;MI48\5$<;DXZS?R6B14*N`LCW+'Jo5;P#J<jB!5S4Y+9!hl$ZUiHlV%Fq\^6O`QhLQ
jUPfpf71sbJ4P,RGpf#d?_?.NrU:su'Ig&;J#jo>iVL@5$`26bU3=]A+r;.+>!s/^F(4*PH4t
WN)QKi%%6?X"L,q'd,i_^og9NF_%,bB+X!6dG)=R);K/[-[ljb]AkqSM;%T=mA$R>]AIAa?hdd
]A*+&JiT5Z[Lc!Kk+\s1.sZtjCC%;QFqGsmIQqserd^bdfg%,$G=Z]A$=.T"-ND>>ZbNYVf=%]A
$.SJ/o`*4dk2i,lcF[dYQ?P+@"\.9([XtWe2$YZi`<FFs!IWN:1;b3+BE'%HPui1B/@jfI#j
_U^t&,6_g`Y3YZZJMNH<3?T#>d/-2':L?"a[l`_]AXFKW#PDqk.4JLegB9I8OeS+o>hL[>ec)
`OT?N2N0OlcbftK1*9JP1[M`"MYolqM\gF%d19%I)NQS2J%PHNk$@!0MAtaqJQ")HS7h&-LF
GiI^LKN?H?NPpJb7?bD&!&c0oojVSF$+*LXtO.eP7XT-Brm%iN?YXZ9=#PJA`L]AG=R7^XOEn
un[FjCbhaBWcLC"0CF"roV>T'C@HlOcRD;7P_:k0'1Z-L5aSpt6Z1*fmrLi+TqHikAi]Af%rZ
gkV;Sb!Ats).@Qi!6C;'qlAfr9Ks4lYVQ'O_.[.h\<`bV:&AY61(^jnD_bYCGDDdZ%>9L<C-
\tM1>*0=WnZ<C\PSJZVC/YSHh8\Z_KDY<m,*AKiV'N'ZCY4;f,t#<iUJE]A&bs:+2W.I^C&J#
Y`!jnf^'2:A_"NLs*b-$(Q`!0)O6ncme0%/@VD#ln1g%op.'<^M\B^SIJ[V!X^[Z=rDJB^&m
JXocb'Lr"F'2S^A>J"5O/LVc#<Uki5l&qa-9[o;lS_79eP6'7E3'p29uVb%3>k*-"r;6`shW
b5>YLjrNk2+g!ZgbKsP^t+Rl@e&i59Z#*[gK&T6>Q/q&!'iWV4^r__\Aep'7_\G>s8?bnn0O
!lU[WhjSbT7LbTbOWCV/tZDmVdPd.i@S_Sd+=4khB5UjIE]AJ&YD-N&(U-2+0@f(VaPXa&C+'
oe^S1)$ogSd%*!\>NJ,_]A/+[mPoQ[e.;RYtPNaX<\hXZ[#]A>l8f'H7qKd]AK#Quo>b4&rG[V.
@KJtlMN.)/rk%R,)<LXp26SP0IPr,s[=BgW?9F_>Z)_`87kp(MQ=CI!h<S4!re4t!#`pPtO9
L$%s.QsOBXESl;0iV7/Z$.1#P3kG]AC4A&rW5f@Y%:p3M=ib(R3)LnY>DgMkmhZ9V$2;EG7aE
T8?EDSJ<]AMLk%=rAK./`/'^S;/5BlbgkJOEq8qKea,>c'gga)k8RnIo.,lRB'oVA?SIp'I2o
ueB>YN'I?qTj,]AhZEU,%L\T[G*@DT*;;Bha[K8i>@gNXL&QelrZUqmFk#6o3uhS5[5`B]A#c*
oig!EbBs!qWgEe_g/e(:c#$9rmn9?pGW38)GG?2a0:?220D0hnQF1,-^hBEss6Zfd`f'rij+
KsTH;:`39;<nR]Asbb%&'-1<aH3T!kDC\Wf0rs"*@_N:e/7C`@_\lE(@It?XhT-nM:9%tg/H3
4$)Faj\>UYJbh*\&&\fe`g6k=[q;]A_tHU[iE$B3S^146TKO7JO9E\k9%R+at8l9FSKSK'l1K
C$?IL?.+#>phc<A;s$MdfY9%+YePo.Bs)3l%EhJB&?*=3rDX@7_A@E3N]A/2!ZGC'7d%b&n`8
e[5Ni?*c^/'%-^ajS3Wo<T_U;rqHa-V"+d(_)ep=6+@8&!WBtZ\O'rL6ML"ktC-_J%he>RS?
,-P'.g,^HIjK``1ZgD/o_r*L9i=/$IU2FY1/X8h5'WkF?lhPYXaC)c"?<-J%<V_O":Q,s*q*
Q'S/\Hech0_K;_j']A*:mOp`a8LG&GarTDo,.2?D/5.M*:1ht4q5=>W(\(#Rg^re-$raO)U>'
TJEjOj;Z3tEjA$\-?]ATuEaqY+1aq"(cOD"'bd'l.R@(rb[N%8l%HVdCTuW!3;lJ3&&i;]AN^Z
hmm"bQ(b-Elr]A0]A9aq'_ZogkXBdRicK.mZB=0DqLoiDBT5I6^nej0=iGc`Ff60?6$GYO!6d8
D:5:Zf]AMO<ZPc3IX$e+)p68=Pbd$.J>K=MhLa$Lo$CrFQd3#hc.qL4<[`mtrC$G.:=U.q).X
[4!LsO^0Di*%qN(ARfnfh@g?mce&'"?X7N*`=]A?=GfL!#H&0ElVqO..W<^R6mZ:X;LtTH)TN
WU^]ANjeiC=EGEP:2%D`J*l`\Ag&F[1?)b?b8Ung&IAo%dD;P=5fpuH=[pS`YdK?-&\t]A8EBc
=<Zq#Ti-fSd-b&u(Wko(^GVQa2e`Z\l<j@"\$"\KdVY`#a:/`JLl%Yh^04]A_Tm+gA`GIV5W'
,3+SeU839Qf='k=hX4^n1G,cueGi`nJAmr%:A?7nnS19*WfclBg;WRj1k*R:p<bg/tPW*9*[
Trk4Zs5dNkIPIU$6$`E;q<?k^^iusCR(OCg-,Djk-&8Krh&f65A+1b;il,,fZr0Y7;9@hYYG
HdW$_EH;W.cu9]A_6^c#sY,aSB\Z/bJH>M`N%Oq#Qh;@FV(.J'^+ahYe6]AQ5_;JThWuI2#$uV
3S<!m)]ATb7ZGKT$pFC0G6==+[K8J-'hqt+kn"W;O]A$%sW7d4V8A_OUOMUhm#-m_D'?.X,Lr@
h&C:pOZ;<RcX`6fmm3^hRU#reA.+^HW^IkYEQ&T<'U@B:,b&:J:!(W&0PF%)Z9j5K/G'&(V!
Ss"3K]ACUBS6quh4.&(\5b0j2Vf`j[e"*djCV&Ip*s/rC_jf,un2X.8HscP^9`Ls4c)E\9*Z<
;hP]ACKcUTHh?drP/ZmAn0TC<h>[euKDtBGHL#*h<9[p9H,LJqls7U1:^I&TjHoZ0?*8`LnCD
Npn$,mq*8$s,l#2s7A3i'1b"a0``'PbadKqgVX-]AjMmaBA9?>ak(.7Hii\\S&V9Qg5]ArC=t`
igkF<kGT+#dUZ)6L=\l6)UI&3CA4W:3RG'eBRE;.=ikjB/aNARGIM[jM['RI@(L)K+JU<"s4
]ADD,sE@<emqY8h23SY[M7,7\<$<GFT$[Yh+u5)049F]AY==2r+!ibDS,'d(j$<43A\DBU*Ok(
rX\c`;#4LV=GN(h'7"Kc=*Y%n`n,=Y+h*qViPHs69XmDa5ZgUrNZ@7!*"8&`]AZ@9(%T/POl;
9a'(TGf%+8;QFZd'6g@hu8K!3j8Cbj"(E(j0F7!7m]AjunZ]Abk?Zf@rr]Adlt"V;OJDqZj"#Uj
mO+q38"o>5-ace+a'B3QPqm$cb^etYJa<tW9,*\X'Q.9k5j_-HqlKIB[[T3J-'Xd\3cX2b;f
nl\ACX63*0;/ZFu<s\r5SZkCo_(8]As!34I?n6s5HcF_;p<2M_sVf>]A\q):V+esqfCmB[qW)?
@$E]A_I0t>ZLe;!XGUfO\qr>c4W%l#h;q9T);Y4VBht?c"ZDQ&t=gcZh5r6chqi='iKQ8.@k4
KWnX2@s4=8;_"6!6eqq8iRmj1O3<uRM5j?A]Ana)[I`%AjK@!8Z7Ea9V*8D#a]A1->&5,B8ui#
!'"Q&6q=7EU4FroA>3PSLF++=TC8^)l1r[)JtshWa#K-4JGspCpq8_kU\Rr!l+c=+A9h*j)q
)TOrB29,=Q]AP"_[OrYL'Mqdm,Cu8FDrr-2C>n)>V@P@Jpj3TT0EaNq;BS8!/J2X+c:+d53$I
O9fIANtC<O`W/3DR+2sh6;XJL6*0sio_sV=Y6R&\CA)*SL59k;KZW?7T[7Fs3ehF*%Gh?m/!
[n1ZQ$o&6fK?RNm=)4O?h@'r@.qDlD16RG'L(BFO(!rXsa\Y_/ebcVHL:S=3[C6[INUcrZm$
o"Vb"Z-"4q5qE#&J/12kiklQG?i/3cB)O6N%.\9n8Uni@aN>f-".Vo<E<hp#$P#]AjRh$Js$-
!^sZO,4HWJAbntmH7+6Q;(0TYA:rSn9jR%)A/O&J7P*%S%LX*h%ffc6#P]A#L!<e=\S]Ap_2D/
YA.hlIdrQ^(GA,i@&T@.UtbSmDeiSR_f:F[`D05R9?GK`Y]A+h4G6go&XXGgokOd\pG@?IaRh
$N"H<ncs(u8h0@1V00;k;PJ8$T`jO7`E.;D1JL+935Y%,Di+<c!WoP=<K3FVV8a=O,oYnG/n
,T)m$W_q,$/QXSsZo"@'/u*@?Z3#n,G0B6=p!@TH8Be64VD]AC"k,9$eCfd%q5Kq7B5P-RdFn
d_O\%,Aq[^i<O;GDs$hK<L]ARLrOLSYi,E2U@a1FpnjoN.7B5qH7:1mT9r_!Fp?eV]Ac\kQ(45
IGOC,&qegdtn12\2RkG-Y-r%OsYd?J3Aj/\ZD%-7F#36mfF@nZF7^oN)VQJ6qBGtN)4;T2:K
p$,)lOqC]AClmg-+c\If0qdbm1ee?*HYC[1Y0,=94spRBk++mLPRL-#?:CC,/O,Kf0RY._1m9
SUGjt1Oo,+J(TA_W$_?(@[3(\3A$D@8[BLSD!1aIM'@!>p=[0GBq:m@i4=f,g*<-e*$YF.6Y
%PWC3nE*UKN,pWL?+#Vj61-!K#BDo*H*NC*YO?=4Aiq^._W_Ve%b=07=fEJ2i#9m#OMA+i^_
H"@G4fI).D<8m0#1R#H7*pm=9;h1)$GFc:Ed:+:s*9UZ#i*BG7EKJ*3M#X6,M*E=l&/eNmOm
30<S$iP4*!9gb5\,GKN5!AGdrrW~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="501"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="951" height="501"/>
<ResolutionScalingAttr percent="1.2"/>
<tabFitAttr index="0" tabNameIndex="0">
<initial>
<Background name="ColorBackground"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<isCustomStyle isCustomStyle="true"/>
</tabFitAttr>
</Widget>
<Widget class="com.fr.form.ui.container.cardlayout.WTabFitLayout">
<WidgetName name="Tab1"/>
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
<LCAttr vgap="0" hgap="0" compInterval="0"/>
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
<![CDATA[1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4686300,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,0,0,0,0,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" cs="4" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" cs="3" s="0">
<O>
<![CDATA[穿戴]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" cs="3" s="0">
<O>
<![CDATA[音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" cs="3" s="0">
<O>
<![CDATA[PC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" cs="3" s="0">
<O>
<![CDATA[平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" cs="3" s="0">
<O>
<![CDATA[PC平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="0" cs="3" s="0">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="0" cs="3" s="1">
<O>
<![CDATA[IOT (待确定口径)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="0" cs="3" s="0">
<O>
<![CDATA[合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="0">
<O>
<![CDATA[手机毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O>
<![CDATA[单机毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<O>
<![CDATA[单机贡献]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="1">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="1">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="1">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="tab1 th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机贡献"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="穿戴"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="穿戴利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3 / F3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="9" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="音频利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="10" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J3 / I3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为PC利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="13" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=m3/l3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为平板利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="16" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=p3/o3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="17" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=l3+o3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="18" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=m3+p3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="19" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=s3/r3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="20" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="智慧屏利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="22" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V3 / U3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="23" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="24" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="25" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="26" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=F3 + I3 + R3 + U3 + X3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="27" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3 + J3 + S3 + V3 + Y3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="28" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AB3 / AA3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="3" s="5">
<O>
<![CDATA[合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(B3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(D3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(H3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="19" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="20" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="21" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="22" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="23" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="24" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="25" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(Z3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="26" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="27" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="28" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AB4 / AA4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$ = 0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
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
<Background name="ColorBackground" color="-3677185"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-256"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<Background name="ColorBackground" color="-1644826"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<![CDATA[mCR^I;eN[**5o_&'kh`e'fj4G>O-C2;FNk]A8a+[Oh4[/>gF=Vi(,[RpLuB%g_E*rc"mTNTb$
i\$V3XKe!0KV]A/X9:d//62-64u#9!$MXljLB7*(:;QHrVL2i?C0\jH@9/lLM![]AY4mA$kII5
^3P=>'gBjAJSmM7M$AJ%to=m5uMaGZA7%rc!r!sn1c8+,#'blQ%fp`pfIkSQa;MlW/$k?;MS
EJc,rK9V8hVKB2dl5Ra\G4Kb/"VZ"f6V^dU:^em5;%im+SOLaK6P)fO02YK\?u3VZ-R4I9<&
V#Y.V3V[T-%VA2U)$msqU+,9p8nYA^2>eG^%q[u=ArYGgqCUYn83UF6,%V4EU?=f+[*WrjuC
cGOF!;NQeHJipKMreAVSZ3sG%N5bTG_o@I@B8:K<7ljW<U,Qf'c$Qlp,9r+3IY65s<:\9"pA
eT^5;M81j+mB6AGjj:ZdW,*K7`+\X8Y6UI4@fK4+$PujU''ZK&U%q3(J+6PY&[MHd,5Y9k>g
MZ15)QB+HiE#;-IflmKHVM0;q?l.W?.]A(Qb%4M<jreSV!D]A^kJ7>4\&db&He)7AXR"J<mF";
oNAkE:-@K03KZ2&shZuS[?Kl3jl&i?B)qUc5\"opO*fRS?U4oG)1<BH#4e1I-IY8K\Pea"e4
LaQ(2cjQ%MqjD[Y\0`5PiIW1deDV\d7ChsH\7hK*W(!j#p2r,hK5n5P/(`!C#3ktBTdTN/JM
?bsaGPJ./9'q]AoqGpH6=?ddqi'(+N$R1Cj0=`mANHUtkK*+%jDCt8=ZL?5+Kn`@qGF76f!'u
'a1M+[caGZ.Me.fGOkcbQ6&g9.KgIh6G2qEQ,'&Zo?&"F&;s,NqaKE4dnSW.uF=G!]AWNQ%b4
4QLn=Z?e+/^cfRF'l6bK7d.j$FLu_L]A4keTF*JB,3$<rkn=l1E,DI=!GE`U:ba'*@bH$:>S0
V=s5n_I-bN!nC_c`W8"::eenMDd"NX#Mbt?*]Ab8Xq/P0#`^u1^&:U.q<k6UZX]AN/7Q<63mYc
]A6Sc_#3`LgLTrF)F"I/Id%f>(hG(U_CXjQ>hmqlsTYCD.oG.Bk+3[g7*^7@BM>j`>)dbHc.Q
1=8au@ackYHhJGs`ihaQHjYH@SN&]Af^h1_uNNHODr@Y4<h0/o49&JQlN?[^">IFF'f6=6qIR
",rIP%;n@2AF:,_:n-5n),Ko(N&AZ10m^nPb(b(D'+$+i)]Anm]AC4$X'aDR=gaePODoXR&21J
FFY0=X'[Q&`cCt)7hZUod/W6c<o)B$4iN;%MbguLF!R&;J&VXk-1M5%/CB*0N#"IR:`bJel5
&#<C'g;ArF;W/Dq9?D"]AC\)Gk-Pe;3g\(h'<[/!""o@e>(5Z;fCpmF'=0Nt]A18eK?.2kkgs_
gb7LoooDT=9f6\FAZcaAIGELh#:MHN/,4Wd/85R"$!F,-;ZAdA=]A;uWNrYMCR0,[#*?:XdNN
[@S$-I(i(<q(Gi\IA^@h()5-d/K.&!P6hcX?$<1K$k3YW3ZN;Ykrp<.o8u_%P7,#'G8T]A?2B
g@;2^ee4Ft%r_\HK'T4er92($<SM40L`/PjS/7@NuCA?nkEY.\II\40"uP]A"-]A@LS`aI\BIX
:(g<sY1E'nlfg`5,#"BZeTB8'_;d-Ztp6`p7aK1&LqW*;)Z1*R<(sC5k7j8JS5dc]A\)7rVk;
U;iFF[>i5Rc5flimq0##V.g-Y^7[OlE)6O(,08!cKNa3V5cY"nKWL.(<ed)E@qg)am0/[$Zr
<8)Co&8'=P9Q)5AK7AHVu!)Cj6:67JjJkD)'f)D@<AfNudjp"U+d3eF-UO-u5<oq8,FFb=Pk
\qia7VGc-dL^`r.gYZ^\eP+-bi39[(KmEc20A&NT<O?M+VK:7?+]AL4FCBj)%'d[EG_>N]A)9^
`hJ#rl8'rC\EOSo.,U7?Y0aZLUpXG1hD"e)U0FKRgqdl`+GGrC=0a*g'*S9sk]A3J$h*Q'pl1
JTmmVE:u?4%<#g?]AKdbrnmI6kPl(hj6$G2N1?]AlaR"@=d4WU6haoaG\7+Sg[F7m]AdrYm*?[,
g'TLFXe-*N7gni0Id-Q#FRdjTq_:GaABu!K;c1^[h)DZ9$5s,n*bmKREW"rC0t:OjkGSnWL+
,6C^Keum2PdV2t3*JBrK34K+<%';?0c_$.*S/UX'4#KgVdHUft4&>I(bo/,Yp.\/*G_c5"!V
DUcko:0mlt]A=,_(qHbn&DlbdY<sJfJ9f&AT=L]ApP0-lJn+qgPnDIl5!@#4!rkbP4.]Ac+"bR<
A`\EG&uF@aie7?4nf$9)>d6CNg)RMsEF52>,.."bhsSCKTH2RO3gWg>Db?a,5F;&Y6t7C#F2
9k2@`\Q:-MUXE-Zk]AsKW-FK^0@MDr`f8U^k#^JbfKQ;rCVi2RU%CP83/f@ZD5l6*Lg`,U#Dk
H\E'`bH/9l9^#fnQf`RMHDMd*^'gN\?e@1T&\9-6RDEZYDB.K*=<H'MSftF.b>n4)Wa*EHc!
br>D0Fq;)%1Ac%a3:HRb#3WS<ePj2,@nEUeUdE,tcG!_YK8nP3=&U^CG<XYp,-aftqeagRHH
_D]A'<mnNsL'3>D3YJqE8nA[dCa%Z"2M1/I[q2O8e:0!Mo;i#R!Fn3o5+k56=Ze!js>"<N_L+
iap6U+cO$%@Y\;eg+u^FfIqUTk>_5_h^pS;_fsfrOWO13IhGA>)\Ecc/bI-P)U5SY_fI25$H
d#L$r]ASeoFbPRUs_&gEud%l"G4<?J@#lo<.?r2T&[^;pt((fO8g@Z741Im6U?;+aJe;`_)T2
/[(\+43u&<]AOE(_(*rbCK8@WLC+#pQ2*VWkX]A?1@[8c;SK:56',\b:D22tR+.-id#Z't1>e_
a=i^#_k"UbOgE:Woq2WmE3b)EW/N!8&@,NEoE)5`>m\'%!!jGM=.\plP,F5L4',83"t<ddB]A
=cYQ@8!cXmRmJKq>2MR"-=7#SHp0NjQq0,D*g-K6Z=H*,(!EMES=8W`QqW9G=mYGh#[Bm3&Q
^8>p[V3Q?WhFpNc<Lj:rGKWIGXkP_kQBD'm.?iLN0s85*cXXZQ7cZFNj'`>I-YlM<6Un=/Jc
rGc!C)cr@8\.Z]A,.>WBuUB&H9ah"0^'Er@$)?fh,jV_W-=<M)8*MH>0`98]AH8gFEqbh`KARn
)DPOn@Q"d.6lnBHQ\Zq^+JkURRutfr,BEY-^`pO1IIkYC/#$``kJAm&p!'/$rJ@8DC1r-1$6
8KUC4-4/uR:!?k_0p9VoF0_%t]A"`FW-aYJF7Mp:YWP9YM;[V`O@th?2#IGnR:#AVhJkiZuG1
kADbC.\3CYP>Z0gb\`(]A,m=]AH*8e$oDU2@0`QL7:G'qp;XYT?n0ZJ(q7Bs=BYg^%FS1oak`Z
:@+M''#rMsCMT&^*1Hjd2L`Jjo9JrI*2p]A#`Y4n9=Z=C-^6Ob,J)5QNa>f.o?j\KOW@'-'iE
`*B5&6;f"[2m0np]As&h\XpVam''h-81728"IU!;]AtkC6eOE.0C"pn.C_#oG:OYc+KkA[UZc1
@;;Da>@)SE(m0fl0;3O+i"X@T\Hk877c4b<-]AOV$HfIX*RcuB!*s&t*$J4__5[\B<;YTFee'
Tk/ur&6Xb/YScP;kjf9ugPl*d$;lSeBMFg*o4TMVUn1P2&J,V-sR1&7M^/5Y6e"Ve54lc)FF
@?X]AmhD:1oXqd*SRh<@MATRXW_4/D?jpPqsmRVK30P`UQPM<lKaIR[^D("1fc)VF_0J<:p1k
]A@6pmkrHoMf"\'Qq6(EuIQ0:7PO^WM-hF]A/1pk>4![f%gjXLRN;nS#ZHPEhE['c(7PZpVBR3
kMBo\]AU]AuC\h.oK[aEppC_5BF*-phn&>&>qA2=7VD$m*LC/-%>I2q+f\8?f$#9HK@O?JN[=D
T-EM2t0HoRC-j"GqId`)G-WV`Q"G=dmg,!Q7Z9e*I17p("o;h]A_<;8=deBb%uLgsOqJOBi(!
'cW_]AAWq=N7CFTlPI>-hbW0+Gi`9B+dW[uO]A>4P)4Ng,fg)7eb4on`Zqe?J5$In9=/d^%/uB
Fc8KNXT5(N@1?@s"e/E9:66h1@Nk;hBXR[u`GJf['2up]AreKB4,i^g._;4pL_u+4F>R`"P9N
n8o[T_KV61JnejK=AE`.RG="Xua`9$3a&eZ6dc/"k1F!G&*)j?<V#G5HGU?3.Ok0fY\UB*LX
#M/mmHcM0i^KT,FQkD\rbHN73MLoS+$b@'Q!fIth,ZKlU;@nuLe[V4>7gQ7E""7KHQBWH%EJ
U+"oSJk?b^&/o,?M_V=V&smX<F'$s.fNsnV)fUURk8A1"4nF#RT?U=:QHj!R-T@V4f&mtO[O
V$9dnKPTjJocla%KsRM]AZ4fD)_Z#=$\>K"=.?-`!!0aA7U)6`6$GKSNMbcO!7(rQ,#<Ll+Ar
#]A0gnl?"q?XT-A#8p9!ajt@RE<qS-6C5=:^Ushu3QBS8FG8]AHj[b92Rj?$pm30G^+ckt9DD0
VFh<sJoJV/o-_;+M&KeN(uj2O"9S'-BIa"9dSH@-A*;Rmb\)U<EJOeDeUkorLfpSV@la>WXh
]Ah_c.Fb.l*&AK/,==+hoX+g(S@?1XhJL?L)QG!;'<7ctTo[tE[20stGHlNB+?$42tq5WA9n'
%.nNa'r\24B3hWYi1]A5$tuG,i7BkKU=<pa]A(]A<%Of\i0FDVoN5)/es'*Na9Vs8#j]AEgkcf?B
oA>$Ss%pVS^'Cd$ZQORrt`*sMV'4Rfdo&@'Uo@\`/B>'@q50m*-l0dLX-UPD6Bj-MT0j#<<(
*"t\Pb&CTR\toPuEL\$RT@']AkFSi6Zs#OZ&4]A0)-geC:1+56"b9F*,h;]A*c\nFb*#L4N<lPX
5==!Ff?sEl$tXOX0hqJ&FYX9&&<(_<slb;XA34&j]A72I"8(`d;p>+:L/OE-k7f6nbPsD@b/c
_8p\;09HF7X%S#Oo\'li\_V=T1bB?#'Bo?$GP4>R!!&;ZaA,5XFPTtpGFC'rdIT>%(F6/+`#
m**8!%!hRkO5%#/6#s=[jCsMKSD[g9?h$h"kn:r)P`?I.VQ<W)5%2Z5]AT5;S]AacbM(E0S[5g
+$5m_;=K:ttV2c;m';,9+Sk^Z-<ZnbA4TuMh]A1biGP,2=#<<"Nh%&U"7>lAt-Pj*U".SKtW>
l:GL2.@.4fMcVj8ff)jK:oCQRP9,>:\!W(!'^pr`-Oj%9@r^P9BFO.sTW2)G3q[5t-U:pb'q
oBAW;(=hn&Q^Bi!;=HW/0\L'+>b#)Z:,Z@:9n/ogp0i!4"g(o\9?h5`FKEV26h3gJ=.T]A-J_
lY&k$GBQ)W;?pAS'K)AGpn9]A16iWL4<e2?l$-Z#68D:UYajrmt$m4R,o+MEe0"t,T]AI!SM(G
ZEFHf*,-rRB`ARJD8CE(Z/P9D!<lNgR`+V7n2?eYX\KHp's925]A-SV'SerG$"]AN`Lht1:Vd0
oaH_gIt;lJL@M%Po76Cs=$L.s]AFpNYO'HTalJ=IRQ?W$5#lfM<]AEYoQUG`JM&I<_Z8_=&A8<
nX;9q"sHpA5)nD%?;dh8&VZ^+Id3EIL:",A\P'5E!-JRTWo/XZdFu-=B3@h*U%S+0Gn`?l.t
!'?eF&qi"DQ#a,,PH_R5U#T3`"nZBni4;11@Sb:Hra=VR:;-e%>:opKD`3ip>J:]A%3$mOj02
&TJ1O\2'ogfe`f-Q'Y5i/]A`#kr7!';'FjgTA^/fj*6IQDAfiBB!<'nC+/17Ul1Qe&]A4W*/#e
%Wsho:lN5l$63<I/TlTMB_O&<r<"CZZ8)7mT(n@:-qd<#aHC8:442_9A"^:YQ2Tr/N3Q`)B!
'=@\Z9oc4PS=l&MF%(]As@Sa'#M>OM*Q9bckjCQJhk<m3/3ZS]AFO8Rh,q>"$n"t'NS8[G>:ea
!f,ag$6&YjJ.?eJjWT9Pdl*<PeEA3'L;VHeA^!)3FoY'8d^P<gIW&5I\lj6%*?&-]A?:((3bb
LOjjAehh(a22GaQ;?XH!9XHPGLOPcDi,sAX#(o`C>"'8+^P^H@!Lt^k=F2WXT6uRqJj#!'Ea
QJCRJ_ibZ8#Ua/D0IIp5_pdf!^'lPWY]A!)g'dk[i(?)[I&"U#N?PAHMu(q=V\AAQ<gN'B1uD
`f9QY\]AZ,f6b_'BK(qN(2tuQFmkp$ljshBYb3/]A"fI,cL%&:\hW>/5-E_mJMO"O.l1Ja91K=
mnci_j%K6?/8LA((JO[>j\C83jB/Ra0F,YJi+(-!S)6<k@FB#nY^,oFqFgTcFUB!:R#+R12T
7L.*+eIg?qMI[`;]A$2(i*%*s5<9mme0+1,DT4+jH72Ypu-lKgd5pR5EliJ_:K/6St)L9Kf0T
[BjZe;`):g7U7_Pd&HqMC0XppO.V/b=d-1jp#9cgORlrrmMlq"JEtZ=DqLl)F6?8Yf\dC:1V
dmMhunY3%g3Y,E?9<j`^Q,h`l.=CP2Ucqkmifq52>rehL7T^VZ)_B5XYnA&akX#^MQ<@p"1T
D`esmEL+MW5EZPZZF*e>uN>mWq]A`APi>"V,uqUNi#PY*+lX?+oCKA$k'X"oSOY_#8ZQuUZ#O
fcf`qV$dEb:'La\8]AG-<>\p:R4m^gVWITHN:]A<+"%u60o4_C1mORX0rk.mp3iqqdc@73`&R:
69;"(P5p+=5VW]AkK^)a-PT.L@=ZYT>*'=]AB[kd)'X5kaNASFf:68^GfO1%egLM_Bu-o@9n#V
urc[?UO]AD?X+hEd?Q)c=GV+c@8L^8tn)<4bSJIWMpEC;rqIAG-;=3;gX"-#]Ae/-3K;RY!5V5
h.JU#5q,LG=f:%R9[c'?8;X?UT+3AU]A"j!;L#He86H]A3Y."-cSa>9I,I*nIDXC?!c#9*Xl[6
*G<i/0RN`=7*g%9l>Gl!J8_qogPjQdlAF`Skk"U[Q%N$V:dQ?</&W[ST!OHcsf%*/Um\$XrM
"7k[7b9(<Zl,\EhajD$`eRDrV>u;gA'1ka8qp4EEgJNO+gCo78al)g1KtjdQEq#/b>f2lP(n
6Ptd;Z%dTtUQXC>0'>4*%a%]A7T*]A(EG3mjT64rDJD"h[DA2g<WWNMfn3iZO%C5\>R.p6]AbGH
92K#@haT.B]A#,E&:m%B6Q`&gXb=mn.if_KXEZW]A$L>,#e%:'h5"8r@_!I#.SB[I;R"NY2qS6
nK4CPZ/8QZS2*/ISX2QAO1=q-4dk\mE7soU!!:""&g8DCd'&1jhR7T?>knCb=f%(o(RY/)\p
oqD2$N\a%C#c1'\GT0Z^N1lST'@T\jaMU$e@X/CLc`lF;F?[JojuU[2"-C;aWY^4OpMdn[dn
2AZ:/(U,PN4td[G]AR:\?='J2<RC%rs%aBebr&EZ0GUV<7'i@i7t#3:ZB,<s[A>:7h4o/\)fT
PXBaocJ=u-;fd0Rl6.r)!6;>q;&&m5::]A3a02/`B-9?sV(X]AbXnr[W"b-5NZ@_Y44%a\(pj$
(.-D>:71=nM6Xj;q6-*38eU)f#%67$aM%FUWk1fdm!)G^W5_nU+F7IOna]AnV&\fUUWuZg.F"
q*.WR(d=ocJVsDtaKPg\NZWONG$KIk]Aa!1t]AlQ<,#IVV:[[D#jGSOMF43'd`iaQb>]AJB1ZVM
nHeOrRINi>H_:Z^FnSj?K0^aX@S&AM[#M>SDu7'@1^747*2q3T.t5*NN.j/)2@*RnF/3PBl)
1'q2nJE>iK5oWTjXZF\^2=QHbhr&;)T&1aW>E#hLm-JfEuV#10EEbq[jcGUL$SKG1UOAOd?I
o1Jkt"fuZ7^J?Mt99r]A7N'G\/<%&NIOm+.r$Z2_Ub-^ka28CSN*3HU<A1D)1V7]ALN<l+7S(u
>q_'nT<.F12"AZD4m%Eq75V[US-U@aVPj*q'J<7hN>45Af9DHEB]A,_$PuNL+8X0RGk3]AnuFN
p_F'K1!IXd9MDW7?P>J5]A+6\H(qVm)kg[/%nW5-C3!Guom`mM5I[%Z_%!Ipn+j5;3\IRdPnq
f>&GRKCNknEH%\B#'Hp$)&D#!Ib<m/'gL$'%;;io>q$-VI1:9,IN4s+E,+O''Q0'cjFZY0"t
Kg+:k@H=NXY)Y4['rO^6NrenY-5b9]AaTD,#YAJ>sDe_bRsUQ-NCJb/,6:b=r3uIbiBIX4YU#
`d]A_h6c/=\p39>6GiA:!T6N^FP3JFC/Z()ipOmT#eRHqB_-n79S)lEZROQ5\F'/oGA7uQF%i
LG8V9AFU%f,ag,,j!%>a/[!^$WnZ%4DP=8CP]Afj:^-u#DQH%Hfk$F=bE\I5if[9XG/"O`Qr&
9[U;IR8L*.q?Tq4ZH+61>?1,,G(;I'V_[t"PVo]A[#WJ6HVGQZ>.6p!Is*a;_]A01J(pIaW^Pj
Nl/&YN[=Yd\Lg'XOEFE/qu7QegQ=Qo$&gmr9r+.`U0iE8@-"MN(u!Sq:*Z;e2K4V_V`:uQ:9
3d5AI+6Zu6%JQZ5N*QqNmMMs@uqE@DR=8&.$h4mJ]A14AKPb<J>7khO-_/+hr&"JfTc0jC;R2
'K\+qIH0G6!oMjE\m#[r,N70\6^Ur73ZCrl(-ZatI:>_Q/e@Q:0R#@Q:7UDL`PJOOW;N5&Cp
aZZ>k?+P"s")/,Km<)a.Y,!KiAm[A@'al26/I"Q`"$`:Lk[VN,VS:Li[#tdFtF6gIk\^O6lM
-\`>]A=iXM6*2\@arc\reP@JNTI%Zp,b'UC#,SfC3P$f>)ilGs@.Zp-sK]AM1RCGN;(@%ijcPX
:WV%&13!;:$:uDcM1C^nRODX<XN\?0Qtts<5qrW^K-rJ4/"R84Gn\Z#5kX$UEdmH',tUWI?M
CK@0q\]AMlsgPfQfOV6-kL.05og>0GhPY+:d+EoE#u8\oD8Vi3e3$ZbhOkjFH_H:jp<s"8<L*
M-r&-<@_p[=4Sn?JT8PtVKgdA>B7Y_CO(J,n+'F9[gUO#*/!NI9GoKffl:/"_NI[B??']A<Dp
gutajq+;L`D$U?$d*b9hC,'_Rqj7NHXcqe>#5JRK;Z59kUEEo8(>RE7N=`RfmT$<&G6DXmHq
YP"el+OQp(Lc=t$CThFoamYOT2;ZTnAkB8O:Lk,oMree?]A[@C'KRtm/2_*r^WJM;uUpU4Vq<
+)>5TIGZV\#_,5/L2r4n:+F@WZDogSc1[uTo(e:+9_SRZFCgOL$m=/A\?;nj3j7Y8G!C`Fgr
^c#'P)mLK'6E^LK]AM'[co%="3B?DU=;D"$B.Tfa;&9q_Ob74ijZ?fM-Yu>:1[YC)J\Z(tt&i
J`jIGQ$$pi2g:KVCD"()<bfiec;Fg.';`o.o&X4IHjR5HH+2&_8A8D"6>^F=0[i3pTY3gIXY
.'?VRj90"6q)6;I+sXJk\6=hIDG9BjQ!pA5NAO=#3mBP=Fp6'VrX1lX8G/G$VIEE)LSQ$V\b
IUe&YARXRNDk^i'`#q9;>6E!\ZmOUH]ASE^YSI_-h^Z!RdngUeOh>72hX+Od":SkU!\2HHaoR
\?B6@B05G/[PhFk@C5`aG]Af7(Q6qi!W@5$oV/=+iJ!Q,]A[i<u*GAt':gJJ>`TKShfL.I_#k@
?q-bZ#0djs$^do4b^f)FViW\NNj=28=%%"O?[iYi[dZ,am=c:5_k)Yg^VlI&ft<[5H\]AC$Y)
KK1_=?@WQ\dsI0]A<YKqL@54`Ih`I!f_7lD9ee*NJg0'8/<hIagIV*V739VS,#u<-Eaf"Z1!_
4(u3WU=FYenn#kih(8O2?nQX7$(':m^.>!bP/BD6Oq'oTlB93sFS;c:4VD[AJd(bE)O=GGIc
2$eeY'o^?+DdR':q]AuSEt@2n/CrgYsM?J3;%Wjn2[:ns=UVH-H9oMJE2GREKi'btqr1-TU#&
V']AG$Nle^8m'XUc]ACQI</47c1#J&.k)C=cX_-Q\H]A0/4bXjaJimc!1CUCP5A:)n7K"!6HVok
?1bM,oF,BPp@)DllKo90_jr.X6'XXf.ggf<+,lHnb+Hobj$qMGjhnJf6C<rS"TFtoU2b-94a
.F)npXo3UWG[cZ+B8[%,A%R\O$ifPU-9nn_7:hYUq3*%DD0ZND^?Fe,/'rs[+'T$D5IsDj_K
U8'V1h-L@Y<c`LYekb+/__g-rfd+`@q1XK)niU^HIA`(!b'/*Z6Cs?%AOW,?fgj.^[CIV2,i
H;`7kM1kUM$Zn"1j9LBDuh%di7oGCO[AH780"dB>uoqIim!CmAMoKDu4eqH.)5mRo;>%j<RE
bPcA8rFinjQm%SSZ^N!4XIJC<e.jZ0Hit<!N>+(+_XMZU!gJq<S#s:9WM(k!o)<A(+QP38Nn
'Hq;5aW<Ic3lrR4,hM5uAmq,[q+o6/M6)d@t?j;8">>sVSqT`m3S2k0Qt:8:HNW`4eN:dkXU
N+bhcrW(=ToA\G:6j*UM`6btH@i2N&n5ariO*-KDW/M3p/j7&00KpJb^XAOhqG<_JC@\g"n\
#[r4:pN`8?CS9GhH'>XO-;L_<1Mh[5o+>DWM,`\5<ZOeknQ$4+J`^XRX[D\HON$aT.SL6M:?
E7,3@phV/Wf>61Wm>d)_UgfIJaPoeO-p/?lMGM(shXQFG/,8NM'<)>p9"W,s=+.8eO\DCfRJ
#,MT#cVa5]A"WBH^esIg<.%)B0";Uu@9Qg^l3*h^7'+JCDX6@bMOJSRLnf?E(TBH5?<98AJUS
.p2970.98QRDRlA;.7k:>P4*MF)Su/hXPV^tqfE`Ug#`!4`Gqce=C&L!K4$oo%rG/Ag3%'gf
Q*H1[P#o[Q:&KVlA]AI5a''$'3Cp"jUUT[9CiON-)Q7S<$`^^-]AlIMKnPQTtuLlbJg%uD3ni1
)k'N>H$8>s@N61C#f`'nR<<omOT4IXJ3LYDP$,l2(Z8>0:du%lcShfADLsLWl>0-cqiIjNS"
L%c;)h/=5XGRD7T>)*otRC\_7;;eIA<o=3Dc'qFhCV+J'O4aeQ:7\WA:`cH-/k_leuW?353%
P8\H:b-cFSUVH?&BhlG</!odE&A?pF='-W:G&]AIkX7oV,24o2<1fV+P!/tlWok!eI!M1T55;
@gXhk'TXV1NB`5V#>a,N-rjJPBa0+V,H@(WLMm^h7oK27&*Ng5Z:K^h^sT;SIE$ucDicVu/8
M%ecP@>`5,/-YVeK@C9,'"0Qhi(j,@Hrsb-4H+;t#'S*R4(jA!o-$*t=<iQROg4<,`0;kUUQ
!SFO8u%lp1SDmOP0+iI9enh]AuMh4"MU-G5&2u-QSLEl&hD2'2jCDRJiH6\2G3+eFQm+X&&6e
iM!A^;mkl1CpU#;LIL/;u+q";3&Q_^Gr4g1Z]A3pIG6p;>kG6#>h1OAZlqZ0\ooTFU$k!!sp*
#165^mUh5jb$\JSR;.]AZR.Vn(l?h7El)+iq?E*:UoTg^J!L4A0/0rHY3V+DR>+3(c%hpeX+(
@*Qd@WM,CkDbd9soC\fBJY\R"*4_;hE/Jj]A%K5Vmn.$N<"C[q$=ui=LFf+9BnLW&NAC7&)8L
pXhs%CjKM)4^b-$ql+<#=ctmDPPR2-X"oB7X^Ep#oEC`/K>utV!A)YG+=1CtG%H"hA<dYF&C
$Ekm75fuMp:]A$j<Rl_3sf)#'::@9U=q(4^L%%),rJE:N(Pqb2+.m"QdR&b'2j!=1["Y"*VpS
(iZ\Pd#6+5da^Cl[Fgqhfl8VqO=Bb(=>4s!qqp2ZmM^&TcD&.^9Y'WN;(>]A7=X4:SS<V=+Gh
LI&nmVFTF5:d6!Le`3BI_Eq->o#SuL.md5Rck]AYLO:=!JgPVP5Yj)b*)!n[:?p>Z:>]ARHW#T
8=#N8B07bFl.CVXZSXB<kl>Id'\KI%/:V]AMsMkP2`h::D+1:?46#_>&6IQS8gc?P_P='UT!)
HE\P@N]A$-!m4NIOJ0Z&QP/4arE>!:.X,t@-O3Ged1#MI2H&7(.kf[(D.A1KeNM&kSSFD!2`d
NB1?%-+k1LK!&)4R9R/.V`lkg/kq&!u`oe^pYFSgSPXblh/#i]A*Q#pWH`3cbFL5oLIqJ5J[g
HWYRRqpJ_R'^a.i]A^#6+s%0ERgbKq-:=:Em5l$%iU:?<K>Vh.X_79fqQeEn_HRK#f[oS3>?W
tj/@]AF=dM/8qE_aI#F._"6rY]AZu9u>U:W`2"[m5!QQ)nDer:1+RHZtPF5'1V-If=+.<)T?pM
NE@HYd<qPo\F6VUlX^>F5S/<><M$/<5FJ3;15bg]AH[XJ^fXhulQhh4CY)GM+T&kWKE6W]AbA/
?Y[1q+W-q0n`Jr!D@D**@-572.;Hq#!6X[RfD<4B&>\="+5FD"_B,C,$]A0HRbO9h*bHXdT>^
T6[$cE/Jj7KZ\0IP\'lrm>J+)je`C8[tKEEbk="iYIr3MiM^W7i>(.LV-_0aj^]AIi$<(`Pa[
d>*m6*Mq(gnB@?+*9bq6f?\LHrj$-5k4WbR,fuks'Yd0`)LTAR35.t%7QhHlrT*p:8c$>qp%
.*Kdi9;#^Xjn-chV$MRG"n3Ghb-5ahY2PF"O<,(CFli`@*XPFKdW)lr<SNdb>rie2`B/CeRC
jScWJs]Acq>YnPWhYqeUdn_+fJh8.Vj!W\M3jIM+P"O+o;bdPH$hOmEWn1am-[R6:JqD3\j@S
^:@C2a=NR*d-<4b.;@YrHSpi^Y87(tkl^m>8*@W5aFgEP._1E'*6"E$di9Zr8ngR5Vco\J^j
(M'U+H5;"^#Ho&E?=QNg@.2jKK,Z$!YZWP?+m=_+igU&&QC>67BXs#pR=^e7CN19T<PUq83h
%2LZu&L[IE:8qGgd/>gq%8,\O">i'e[.2>['XC1''3IXBq\5OB36)kG+MDLGn;FS'7IYM:cd
otA\51-'jnK#8?]AQjK!e34sF?`LAJ=j&sQIRo`M'\(JCn2l:KPdCh'j$J8_'Cf?qN4%&jTgS
OQUi4%Me7uWpVi`nr;J1oQ\K'Ob3=-CIOWcZ6V1Lc;#=U"(moKZ_'l('-e)rU+`SWT>%[nAe
e>=5;"N]A=P]A7ulks1%E?hJFeo:ueqOB`$KV(Io0S+.6^EM8^+g9MF7g.5S.1ISCXZ/@UnRnk
6&`0f4lG8P@uoae[$^k!"1og2u*YR&<#@(n#FacHA[84KMgC"m[p;6kg0<7Zr7tYM^Gfj9?%
W@po&8Bgo+BaoAoYK(6*_VBt]AXs!Sr3^-lEIoIJRN5^3P4S>$9oKN'4AZqFGOj7&\59Al=tD
cIoK11jNYfkdOL9!(5DpkS#T_IG:`ZJlK;M$l\$+3lt1:-kVZ5JOi:,G9t3rmMIKbRInEaT'
:R5J&Jt,,&6:s-iYZb93e2VmlOF/H"O>A8A/OebO\Cg>$7O2K1CF0GJ<KZmj5<RsZkW]A9>+P
^jBnMdi_F*,)bK",j`j[]A&Ha?NX.K_)@%;_B8WOnhPH,;Lb-:jor[M/2Nr4k/+TA4W.GaN.V
d.9G:"kbWHfd-*[F2[`J"]AU8J4n1\&@*?1/L-Mm\KW5kA`cj%r_F3iHH2k?YF,Lnr.5N72!Z
KeX8!hG7S&(X3$NugJPsoTZ?)Oqn9b*^JU&8VnZW2f;%H>qS%#`=TWMj[nj3tTf[@@Z;^SCN
Z7B"]AgfKB1,+"#a^Y9m3WE-<'qoW-R15q!L&ZeCDOP%.qmW0,HTWq-aYQ,o*??/;;9b]Aj-&V
EqhLi@iduf=jKD),6dCo8rcT?0h$.?kdkHVEJZE9b!?MEoSiZE?2MSoJ=aE_$GS#pr;!Wq$8
^KgEfi\m,/DCX]A9`lWF2mN%5?qH02&T:b(CB%9t3<@KQPgR]A\5?SLtOA:iBXEm(.M;;cAWpE
V1`?%1*5S2P/I)0=udlQ2PB&7VF?%X;/rKtt1Lk!D^'N?^ESIkA`OR^cb`'i,D;Kir-T]ANgM
(qP<pT2'P`4@1o;@?1tV>h3)]A$_ERJ-d2Y9-.`f)$?E#BU;gIGp8,f7Z/X:7aGZ'Sn!k`]A'O
1"tu[r0u@,F<)MXIk*)\XUWHpL*1"j&5p;ZHD))^>S8EIu;(5h3"F=H(EpAL;&d@*KnUY__3
<)H6BadmDIW`8hP*q'"6;:.Pe;YomV[HY;qb\U=6PrbWkZaJku=\N1Wct53P-f18:_M`AUf3
iCV(f@lC\_;#D?r>Yc[sVtk`.=/G?W:qobs_sQprHZ1Ye:71"A>oL"e_JO[hN'*'l=@K?("B
9[%-i#sJ9/8UcBHL>$GadS?3qjr!U+UaqpIX,e0Vt]AP6EA:Zs7oIS4E6rlrbJDr:[n,)6t'P
=p+uY61&5T\3^2UtJ6iGpE60kb6(9NR'\r&S;+$mie@9AD4`:6$h@>F,c*t5X'Ynnq:LueX9
?jEd"LkV[pJlY=\:)fG/h9"U!CfBNTb$/^Vc_g!s4)lL:]A;/Qh.pWfWb^o'./jB$=lWRT08h
\#auhG=.53BKcoo=iS%KZ1kPV?k4B4?Q/r<BmW*A:-"iX'AH4iid/bC$p9tZ#&_[BP4]A(KCf
>OmQaeLaS"DTT@]AaZ\DMFB`9[7(tn5P2S.H-4s&h*m=*j"S4!(Q:a6$$ihHPQ#<.Mi]AVH,L\
;;3Kn1:E\_6NNeH5@r#jXkERHWNPob3;6P>3B$RiR-.ImG7&hbr-+)DX/,@p\mX]AW`YR:#L8
4ONUJLMls)9T:$6fPQ_0WS*7o_oCdKk?$gBYd`^W\hIG#PpXY-Bce7q06U'JS%P_D*a4a]A4b
dj/(_<e1*"H$5TcJofO8M%p-o`4GFBuA9I1$4o0V&h^WMVP;`qgLVAINjc(,I?PaB\XY=K/*
.O-US="*,N2\*YWLFIK;$4TMcuiD-ap?WdE,QObFHVUo1&BnMgFnNQ1mH.ei:7P]Aq*>Da/LA
ru)5Kp*"7m3p\R_]A1YS,@"[X7:S`>uSai((WZJGQ6Tjf.,3,)BqCP]A]A&^1bJMDr1OoNN""aa
jE`O!i?2_E:VF)O,r?Vj(VLHMZ[U6M7`(2)P60_(/aTG1ZnhhCnd<'scWoi6,1chps;G>iBt
;7-Fo9K<^gcdYnp'L!9`+p]A^/Pc*s8?Xl8k>0RMQXWi2j%)Di([lTAW3V-N%^g#J68?YQV3=
JcM#L5^0*A(gHr8oU/!fkU7UWT+uH7DqGOD@;mXUj7%o5`G3>NOq6Tlj840M=Z3O4;A0[QE&
ibm3_u(6aOfk,<7&NcUWP=D+?SMIFVF`qf-HbCddJ;K$li4dX>-m^gFI]A$s2IDP$;8\Xeu&K
o07mcMgg6PLV3@Y-PW.8X0I^0qQ8Cq1'u*.=#.N7%EnK:KI6)=ae>+QV7Q;KAd]AE=ReQWPpu
h\Tc8m9>NMhFOI<]AblW=pHO/a1VqdQ7rB?,]A?=+*R3>kM@W9)F32[)OIU84Kc\`Lok&j*XWQ
:D0^Fmm\UiC#.gB<oq)pNNapse4,Oc.GC'/,Kt/3Md@m;n@BZr5J$/Z(m:kH-+U47HhfnhtT
tAEiKH4Z0o!$56mp;j&[1oQ/2`SAWDa4ojfPVZZPe]AW9*P0ku+$YC*b.N.?OLN3!Kc4ualoo
`7@>)6uUOB1hg]A18&oQn13Vbu-`6F2Kam*Dj"GINZKk$pdX0ZD!#mSuK35V5J*.Se^\*bJ8D
J%RXY?5/85l;%-)pj%lkNmK"k&/a+XY4.O$3US0)mJSqT>d9qoE6K=(\>f'>J+9c$P;ZSNf3
A[^%A($er.bf<DOCH7EUOuNp*AJ^Ok86?&fh1JeE;B!r#;EeN@dpPKa,K*>dU"M8k*pk`8dp
\goA$%m7+de-$Q4-'NNG>L92LWFu6o_biRqj`Hp`cPU6o@6._iCP24$\G7\AnH]ARFHc6[GBa
i:OU!:;.-6E5F5bHeH#CtXko%$s@/rd+\=R!;@7/M'b$A:qI>cY,EX=rN$'@UU9cMf3Wl4"W
OrW,1!!!:Vft1PK(jd48PZ`E_bqrPCICQ1Lo'IoUICh,[ZeL\\Ar%l'F[LW&.jk4u]A2\+)Qr
L!fl$V:[*0N:"s+OlV]AKaU5W.dO)Wn?0>7QC8d)q)2N:SdlbT=Q@I[J+i*e.+]Ame`,H5;GIf
WQH7QG2K4V1L!D8?X;@HMgo;hQS?C7U:DJ`i.0dRMg`a16C2D+[jo^;l0LO,3m6DfY,I%cQI
ArqL1S<W9QC6k@HcPRo%go3q]A)\d-KC$Z8j_B<Hb+"2#ur,>`d[l7TL!W&XX<C@J#k7ArThX
E"\Mrd<Hg\8N,S08\;<8r**ZO(B.Y:2nNHZMgSYVU.::jACA7pQ(pTH*#W$Reo3!:I.F9.&_
DnVYCsl0p?*O!FYk9VG*C?mkN?aQ!P#"R-Hm7qGn2U.tJnO-^=Shg^sW!j1VB.&$[=Z<7'4Z
8K4tmX$6&ArD2(Q_'C$>Gh)`Am_;[EXBb75V6n9S<.kO_K&phR/&u.aI\@a<dPcHSa"YReN'
c&8o)LQi]A-%IB+M*b2s-P63rdl#sn"5>dQp(qigX,EarDe-]AD["=J-s/HLl$e\%p_G0!b&4[
`raFrUi3*+QY<D&r=gY(^Sga$n'?b_g#1c_5EI(hL#Nq(ZL,p9&_:BUN^NC3^6oRt9F*^7*3
0KrjXi>\4)W=bAq8]A>D&"Hs5o-["7h8OQ,o.V'R`[4\,3EZoQP%$Ni0GNjDhJJhkq<89A8W`
,@:Ps[`!KT+E,$+2;Fn2T::55<8%h*n1o[HZ&&lSKD(;_e1ILF3r5OKW!Ip)d_AE9Hl0HOVG
cF`h&Hd!WE*j`E`8>5"nbAfMF)8hgC2,iGYk15!WL@BF;"GIl9_NURcD.;eHM-&&\./2Tf)\
eoPAdF,Hc(:]A9;5q<FE.Qbk!KSg%/j%3c?s^%*G]Af@n0^83>Y?thqHdVX0$Mh@1kCeifJ(jS
crrW~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="501"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
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
<![CDATA[1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4686300,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" cs="4" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" cs="3" s="0">
<O>
<![CDATA[穿戴]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" cs="3" s="0">
<O>
<![CDATA[音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" cs="3" s="1">
<O>
<![CDATA[PC平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" cs="3" s="0">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" cs="3" s="1">
<O>
<![CDATA[IOT]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="0" cs="3" s="0">
<O>
<![CDATA[合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="0">
<O>
<![CDATA[手机毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O>
<![CDATA[单机毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<O>
<![CDATA[单机贡献]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="1">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="1">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="1">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="1">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="1">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="1">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="1">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="1">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="1">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="1">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="1">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="1">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[单毛]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="tab1 th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机贡献"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="穿戴"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="9" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="16" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="17" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="18" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="19" r="2" s="3">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="20" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=f3+i3+l3+o3+r3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="21" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3+J3+M3+P3+S3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="22" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=v3/u3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="3" s="4">
<O>
<![CDATA[合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(b3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(C3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(D3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(H3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="14" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="15" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="16" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="17" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="18" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="19" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AVERAGE(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="20" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="21" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="22" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V4/U4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
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
<Background name="ColorBackground" color="-3677185"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-256"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<Background name="ColorBackground" color="-1644826"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<![CDATA[m<j7_;chOo0G[,.d$B\D#)Ma&WOs6)<%3[_P2Pul3!scM9GK3K9-Mpf&L3X(KOAYnSKbG;2:
V\^egdL?&L/Eb,V#+9O;ns-J3Y;J#T+Zj\_k.8[&l,oO5KP4TBZ)5m2pVBm!\S6C[L"_laPG
/pu1Q/l[9R%=bo<cHoM!!PrB81q*bS-]AF2LGL43:J(og"Io)GrQQ$%T"YF$4O:rp8L#&*p4h
r%5LY)[g$6EC%@foO:35(X2I&tJPP^F&RDq7XB]A/&+i/Z#_UWjS-^KH%0)jU,MBrAEP`:Zg?
8H?I@^OT75omoD9#F`q!]Aq^7:]AsYbQhIk#YaqYcL=M28-jQF-C6[ejZ8%$qhVkU:#FPZE+sg
?dQ,W5UcksLNORgp4ik<EW2o_gcC$[plVbr*_7&nIT6X3)>MrK_m8^*,,<:i,Y`HS*Zsbtp'
8[8^.Z@T>KG0kg*Dr,<<$%X3&[a#\t1&(&iL@57X3LkCo:kfNXU)KeO.Z5OjITL[MA_C1ZR.
`>bNsq[\f'sd>iCKNi!pPpL*iYHCjBA0eA:LUrg-a&S5]ARVZs?0GDSCD_FT;UZ"ZoArQpS"4
:1Z41&OM`R6'&F<[j/R=KmT$iXr&!HiUF+GGoN:,@ulW)NQd''pPVRPr>Y[`\XE.d;(n^7$.
*d-c0!:m_0$t!`P=&M[il@>dRA@Uq]A/DN7ph(C:)P$VYfApNCbM6UEu3e"mO1tamLt.!+pLE
i2L#'o\5\6[Pas<Om/d4f9*Inf[2lFq<2gqhi>AK[i3SEoa?:6meW!-(SbI4@5EuX[7T1Y22
%]A7gMC.38T>jRV408O:'P/gC]A6q<@"56/fhSrnj:QDT0<+m7&n_/:A8RKUHupm6BiUms248O
d*3*Jq((<=63.LML*UiWml-Ci:k9\78/s$e3EQMa>;RnG'djB(GL)?dTrO5[eQb@atcQ1)eB
COB_VPF<*^=E'ILBZ)dfp3.sQ]A_p(N,3\.p#Ba:anug/;uP`=9R3CU$?`A,*/?0V_eU/Ra#$
=26aD.,]A+c!<k.=YJ".N>RGtB"%fpoohMBpiV*j%ie]AqJF<acfsL3Jj8F,N7M`)^I95)jV97
iY,[O9YA7FR1'4*;fMG<dRRk(<?ItX".<%H;qL]A&0A_^tSB1>DR_K@`@i(!VcB7@pe&@C\\Q
1?cZuK=VfeA6<=t]AL#M:&Nc2>P1Ron-A-=I^+n,'dM=erI?187I\qR[q!JXDdU^=7miCS+Eq
TC$\kQWpX1JF7&M+96I53Uof*-V.IBSOP/V9+8Gn!RW\s45')oK$m?3D6;:\*WEoH]AH/hNfA
G;"]AB,2SIYRDWu7m6oibRB1"gc('Ic!eh^H5q3g3WaQ@d2QI74!)s9`7W@u5e:;C@N6/bJE4
u0C>2r?-Afp;lTae0;N;bYlSDlECibWUZF;d;/YBr-dE"GJgQ(,kE7d!\4M<AVp$,WFml$d+
fq*6,$K7=N#sif!o<A/[,^nLINHYG+Q*B;b5/97Y#*0P.7culhhi#cJm+CW%Z5dGHc_cr.T)
2'j5W`WJlPi>uKl6RgQ3.TpSR3B*S1\$j7Z#cufc79BBX-nTBfU[g]AgUr[nWD&,`mne2g%LZ
%YteRSo\oa'1t>9!hGFX/\KW5U<RNY8<WIP5^Q%\^]A#]A*Wqko]AVW7]AD_=i7=.G>oQ.Q?W:tF
#>f1!^-Yap-n^!4#d%3KL2LT?IDMtV?[^,NsnE![3aQJEAtt8oXpkSM4j**11.4ojl\_0/B_
p:pF\H,;ZmEsPMir5QdoG6BB85[0Q+!j!]AUXT17!2Z#:9LS7fDU'<e#3#Ibb8sY&O,,7'8^p
R<r2pJ7f:/B*Js7*tb\oTG-qk,\mZPEEO1&SYmU?oW62VKFs%^#]Amu+7gBU-qlQ'W]A"HBt\p
kU&OPuuK$dDjJh_hi@,'$<-@Z#Ie;GN&X%-A#QNVHXnq8I12`7TY\qXTPS_D'i'Cceg7B=YG
EXfBf@Q>Nh%CSJF,ck:DG_:`%."oT9urVI("Zr3-i.43@$NNh`t1(ZMq!r'd7pujPEO<8(]AM
PsB&S0MXDL7a%lhYRa0C:jX0JI3Hq#da=9<:"ku(,GQ+7b&SIL)bi+ZRg;))Z"I3S23`Y]An,
XLfhmmN'#[fiI8).L6K2aq0M`*M]AR.92HO]AtR)5gPE0h(b;Nc2=[<T)<(if:8!Y3`V1dn/Z$
)NE*X/IPrD*C1(f?"V]A(I2WN04JVc':.XhM$6k[\*n(&2LAp`/385NsP:u$[&4cRbe)3QXFf
L<CRaIHppu,!joMmFKqeK)!&5iC[prK%'FBF.*g]Apbg.Qq,(Rmc@*EIq!HGo80DIH0/\_r!>
N`q3!(fL458Ncd:[:DJbEh<7."L"G'n.!"GVQ$225^R,ct1U*o?DWtG4_=iiBRt>E@c*#`#0
8Iq3C=P\u+GN-12MRK*J*KH4roCC0kt4N6+6k_mG)V0G0HT]A''HIZQ`C`,q:pHP#$7[sI[!d
B-]AsG1$l"/[LVan<s`mI"26;9T#AMC9VlpG+BqJQG>F9p#<8e^H7l9l'0:Z+%5htJIi\%)B.
_\o:^ld_Yqc9cUL-O&agB>)T^nL07#4E^K\BW"4)Q%K.L/!=Ccdj!<lOd'.iFH9-<"NP-qq-
RmNB;"\K1_[^$0=@5-Wne0b.0&p5`/tQR9RSc8]ArlDCCPj63=9&X>j4434deq1:oW-Z(;sAl
FU@G5;#=O3uVd;d1Oomis3mH\A]Ao*G.j`M>O-g<iY*G,iROu]A9C"iq!jacDJ(anDc[2^AfG2
m`)BkP)Nln+*drER)O!;n8!i1"9@</Yc9Z>IcPk)-s7,0%)V+Ki9S'B!_MpVq@_"-&$p@B:p
Mp-3ZD,^iMk$[-jLLDKlOL+jpq<H+$9p[@%[QA(@[WkQp:J:f.fR@O:_?:4OsDd8Uk_\,:Vq
R1*bnka+l:.ClmYpSLs<BMBEP)pKc(C6HDeB:_4IYZC8U9;)?]A:47!t0PMSc)J_5Okq;Y2<l
\d[AghmR0d*kc.Wj_j=JC5&$4mScYFsl8AS$t/'%b9sWiUL3KYSRR8]AZ`-gk2I_?K?fQZ/3E
L'N7(6F7Hj9lbH,F;=E)5jqFc0'/i>aM5:.gT/%Vuj:5@OO<OX?KZ71e)I+0AnY,V`X#4+Fs
"-=GZIR.F5,pOe'4bQ;P<!Od),caR*uM$bS1o`m%iO)h4=P`t5sqNq2C&!N_1\,@A=c%P)se
SU$9qrL$Q5R?_*j8PT0TKV4ak=kW02Q.l<R@(/LC.]AgP@U<L4G2A%*_+Lat;19B2PgZBn9QT
T\4:B=gTZ!7bHC5a'D<#hALK"$\_Xd'P!ioTE%1m[H-:1XH"p1qrgjC$P^WAce^;p=6E0OFu
Mm1@QA=Rra08B#Hu8tVh%g[)@GF$K_qVMP/P<=?)d-1=f!h-fZ>btd.\s]AK2=J!7bnO=h9^r
GdZdba3?e-VB4/#cM;o0Xbd#R#?(eF`ec7#F11)H$i14Uf4e@#X">eGX1G>c2!T!?-;)LM4D
,ANF/s2j$78(Nr4<a*I1spZ'.M%IAKeAQh(om@`/V&oMrRpG8;&-?tfm\j10i00PJtX;k>@i
$kPVn87qfH"nJ7^bd:-3T3p"a0%'4cIa6:W+>K:Dq8R%a[3P2Fq>F_Gubg%S,jl$#g6`U=[4
C*pg82l#Q!q:FO^_Y`*[>20P4OH]A^j1g+r*^JV8M/i*UGgiLiOg,V]A"SA52Zp0EDHO@8_[s1
1<cO?(FkDW#1_Qjk%uG*#)jWN9JHPAL$'1*QPM)Q_jqD]AL46nX-^^f.p1NIJuWCN+4048qIi
Da515G5._pa+^uK.pi6>%>AWaU:"hgF4QK`6052RQpcXu1?6_@_ahr,6K"9.Rn"$2t8JBeVc
NOM1#ro)5Xri9F_QU*3i,d';FnieSI(\96R#q(`WcR)Us,2t)9'n-r_9)OpXrsEnjj'9mV%1
.MIZfZ$QN67]A3XbMA7nJh\b[R(:YqQ5X+kb&IaR8UPhDaAAp9lN/5irb:Rj/fOVY".<j<^Z&
'3lKqA^O\gW=DQ=O^K(@NQ%Dqbc)UNKIWqF:+Sj".52kJl?ZFdA_am9oORG$2TjeSTG^DITi
=`taY2>ZPs>eM@MtKr=shI11uR+&(5Z+nFf6_@-fltmFI#s(4!kgaG*i^X?aBB!L-)K'2E@P
T.IXefY&q.l?Y[UJ(*j9@/6d/c+Ugb4C`s:.WMo=(o/)/iSu2,D-,`3`ZHVs@I'(@a4_k5Gk
Z8,ID-[*@KKeIMb,;krO5kDCR)9<m2j*>K[Se,Q`[1(E&2;nM@[>8M[I(N0_.fXD?-Z6BQ,i
1s,U,:*GS2YHB(:L:G&<@[F^$D/;KS6-UC7uKLYh$D<h,C!=q,*?%5g2=panD?AB([/MO#,u
d0lm#7$u/`Ft)Z-Jc'8%CK?7!"isg_7et^8]AsC*eHdj%/L_^+SPnNt>IWe#%UKg687NO0n'N
n>k@1)N1fC#,-C]A`IS.Hq<j:G<r.@P]A5l2rk918^mQ<#89b@;)*\!8R@Q_I$E`9Wln*]Al42E
gU[jk\P&+JUJ8gpQZg;fRF5uA<TcInl(#Cs`?!S"*1[9<^Lp(Y[j]AbGk#s"rA&&Z9q>&El!Y
G-X&Y]AU19M'NG$0hVZdS/:0[i/n\jf^FLle)6S,F[C;sLPILf2+doEH@E\3]A"S@Im@">7_b@
ip0hZ3Ig?nZf.gXqM5YPDU1.Kd)S<]AVuPdcnid=50'#_r#'Z)(]A2jM$[CCcf+oHHj(RFTTL$
@PL;-,cIq(]AT`sSD>?B.W8?bI3Oa<+eRr.X!G.hS#QK_`[jETk,J)SkG#Go_YM7K#E]AK"Wh0
)71:dSE`)4)'"0fA5bn(7CiC)liQ<?\X2R#nW;,5cZ]A`TYr&5nMFK^t>?Ae18e$H@M>Ph3F\
.43f\7;A1032;<"N[[M>K0(lTl-,`H>kN,H\.FeGXpsQXX>RVi,QL-0'&\,O`hsRE<)[5hUf
'&i@n5OaVM#@,-&[p&'TOc31.[e[498\_gUb4#;e(ZopM%$l2YdYJZaE\GfAoaq9VBY3]AodG
BGb,@6CZ>Y5iH't=`16diV':pQ7OV?6]AG7.#CdtFH###6kI\$Yi:)jAe#)p]A<]AF<%QR.*10]A
]Au()M!G<GA3@:09nM,VqQ9WH5N?Q*G(_9:jGm`V#Kc":)jp3gY?>H>A1tF:%-<0Hdm4m)9a&
DQS&d_:8nElO5R/i4HDmC077P\eg*1%-HaB.DmHp3e..V9&`aT*de<2NW!_\Uk/>TIVf$^3e
Tl"_1B':9_.7;7rNFU7qnZTDR3l#RQ+p+flQlJ`Jkbk"AC['Xu`Gu.BkUrX_o)6OBe?@e)k(
1Hl0C2UL#+Ehka.l1.nO#Wes7ca7><f^X,%H2(?HMMVI#'*&0TE*lo)K5uh2hgW6J`23`_#e
T%.+J^`8"HbnBr8RjfiZ\[A,,g#\rUDEk,L9l?cmTPp=)(!c<4p/19<VgGHjKRHFI:Vk3E.8
mg/+_USHX.rm_-UaMLMP`uRsM6_;5t%'4c9d'h'l7njeCQ@C\E\<Ld9%,[Yo7>5_aY:@^!eM
Z+ta]A:6h=3%f(^7J?7GNgdJ2(t>_QYY6IBC4LBm0CE]ATu*?U48&-S$abM0"kE`m_GIQmSl+f
XlKlB2NJF,/!C3S%iAS#iYVbfTf#YpuTgkNRJRAb2Q#3Na&tPKS(->.akj+r;QUcB9I/NO#n
m1.^E-t'lguM`-Ob>B=2,T)IjpVg?qU*b%Yt24In$#_aN%&Bd?KZ;co9#/nF4.Ou@u;D'>+;
;tN)c[Q2GC[F,uaRlq-*XmiD)1W_HS;oE4MAq2qVc_>+sS[7D6sb?=K_pC"2-3kO-Xo;5ZSd
0<0'?m3`VULLuNZZ\66q-BkCedt7mY#7.o.p/R'h(U"G%<>M*C[XL2mc;":[O$D_Vg/RZS:r
-AHhl;^'";+;E7+0R?m`FiaN(1_61G]AaEl"9d2*\Q%I7T;[6d6C7j^(VGtU"BA@U7Jk8(#(I
2-OW*79]A6?]A:u/!X$(85kC=2DX[Q,Vk!/`,_XF83Do?_JS1rLf:8.,sYF<uPhbLFUNM?$I]A0
?Ubbf:#i0_YOW9_7oT<*<5<Np]A(I*_08E-4-1,`[6Sln-#+26apHlb,E<qn\BU]A.j2t;G]A2f
jY1%rS&7Z1d`6V_4\@>NIDjt`!N-;J@knoE)S2:kr"f0&d3@!B8M4,[D*>hd!'4-E`bG(p_'
h&+BsWG;X),29/c[2-a^8UBu_P[UW+X9[+\6RaR->;POtUo_b]Ak,/rAht(ZmF.,+cEK)C&VY
]Af2it,Ku)UB+@fJd[,)fAnU#gheJ%(0*[(;pcKd9EG>ood9LFqL?):S;'9!fOK'<*Jk0.s0G
`n`Ubd>/@_R63^HEZ9+lU::%=eH1Y#1`<S)rTA#u_L]AH0sE',T@fR6lN4e8"&V'2q7F.VLE6
8A40([e!ma]As=oeE6oGHKcp*EZQ("s/CL[9$K.G0+E'Loeu5]AOJ?<\?&3=CEnO8S_AD!_AU4
+_GIgaGYF@SF%m8%#H-ZHTNu]AO>gU;]AjDJ5bIXDB(A%#<R26am>1Z,>>:(0,"Y7gY48oh9X:
Ni5G#Vjk'[CVqf&p>H.:;P5l*c>O9ehN<\cTWmdg^5Uo\[t5cr7@k$0:%q']Amf_IJn;YA`Ld
cB:?Q_X>15#KU^'73fgK>RR<K0m\+i$sRTDMYbGChIA;(t>f.$$B<8(SK/iXj0^/cBH-?FX#
i,VmY&b54>56H`25/8AX?Kenb<h.-#i]AN*jp%6t<b%*M?7W04qMCFpe1ck=u!cO"M60>Z7B)
2FJf.Ru-:3-0,f;Y45W>fp`cF)c7*NlRd4,g9cOCIH&9)f's]A/8$%.N=H7,LcM/6(=UZ$&^h
]A3DX.gbA(31p-Zj?t68fanKOHmqpHla_`F>Fc25t@<Asru,2fq;'8nNkD-%HX\^kaVfA;W"d
pj=TH&7&smn/!qqA2G*&$M;j^joFuj(ais-Na&h[6uIjMH.;3&eLpD"s2(2mrD&7Q/f3k/4/
up?&_;QcKCWBq[qlncbVtP6OC$Wo;MEjY"h]A&0ZP[0@H<f&]AX_JG;dICf3YqV-RjZGD&&#K[
kZ676V_a?J[X[2:n(lbTEV/X]AO0Jh6,jF]A?lKnl_$WQY".-lA&R\VJtX.M*W[j"fj3=AG8Mf
qC_c'NbSaYXL^TWbJYA"#U+/?B3p(,?M-fRSB6=QsLXTIXA'h6=)]A1AaRN<^no3,q4E9h"&8
6CZVIni54f)'!0N%2AM)2FlGTE3ViZ?3XRlUT0]A(#d9Y3ca.@IWLROD-O(bs!1]A[VtAgW8d:
3d9S%C3UQ^>cGDsO5A":f5]A'7S8Nbef3*Ggs'G/TBqk"KR.0XGEiJH'cbOFak)7WfTrA>^3Z
@74[+9C_#oL?X$sm"(]A+*dU+GMR1gt(?@SKsM;r0tWbT-7EbDXf>/ac=Kb#$Eer'h_V!B/2\
OK:AZ%<3QV<k=P-3M8^VVVKp,<h0UY`>#Ark]A$rMKK^J]A;OfO,^CDF/A[dt6:W^%=,>>fAgk
j0G4kfS1r9$(c14*27[DCl+IYj3Ui#74W4Our9e1g6Za5(h+R[2RW.=&^ND,c]AmQIt.j0UTC
k$)?HT+ai#l%pI;Qg.g.33mdIB(/"Y_J+jR4,P]AHXl\+eRpg"$bKGHZ=&@O=F3m9K%0o+b9n
N3K;J6_[uN96O0DqHM$_c!U1c.IXIb6V^n8*,2'/Q$q[GiOXPD3#8f@'KO-0f=Un]A.bWYSmr
,U6G+83=05mE@mU4=2VC2Uqh#B25"Cj4HfJ\:WgkWP`,q?$&'D<oS"Bg:W"`kQIp6a1Nhh^s
m<=9]A/8<\&Bq]Ain+Y@J7"B1DP;!"&s229E\h6m:C3S]AGo:]A$(fghnV0Lh8X0"^:B2:h_hE4O
k-9@W`hXGg"D,qLe(NO<=7)2nsS&%[W:BGAX>4d.UIb<8Ha+uGSj:6J?39k5<inS3o8Ch'oC
^o1PN]AJ/+u&A)h-'qmTPruEE,Kj*l^*51Z]A'mRXY*ZkViqJ+V6#)NlH;,EjT>.`9'7^8CtIZ
VjhfIYIFF\4Nm5EmdF^*^CX9[;<6Op,t3.^jDdZ?/XKXaZH0HBf'sg\J"7l2Yk?VeJ5%8P,7
5ocV!m"\Rmq.QXEJ`8oGmPD!n#p(:HR5H7uj!/0Fc?+c2M&prPt8dD=OfsAYoiu9l>(T"oZ%
NGNW&Ucu6F356/>:*b/J6aKS>u8'2QEP+F,!Gfd$oG0WY'Lk]A@mMNKc)M,Z..B)CA>,5dEq>
;.0EqGNCga<*j@FHPC[[@\!i`^SFt$q-q?W,;CGq+c5[B/ST4-)1YdFplA#fb.9B556*HOl;
*&Y6n3!-s$KSU=r#>1qDI-A7rpj\R7aOPC#cj3YWga>^QH.($KjkYE8k7kdTqC>:B&M[l?Fk
B1+F3'6%5WVRP.8<KrQ8TDJ`<JuUM)+*T'c5`<LgOg+4)/(S2_pN11bAY<rqdF4&\DolAiR&
6!\-[3e3YPJ8%fR<0-6ajhm+'nYXiV@Q3coq?a]AdEAP`Q%MG_K_'DAA<5VY?=h1)$fY<Fie6
Kc0ef8>L&Q)8Y(:k3eba6SN8/<%MT88K]A?s.Q`6A`[)Z"Wi6skIgRO:/IJl-2BI,[M9UA`KK
::#<1PBk^QI7NVS!U23]ANQ0Nf.i<iT>QGh<(:n5-Ghb;V`'77_06>A(p>[$I'-FER1Vf.7^M
pA:,hdtm4:9b#8_`.7OX*]A:?6A4MZ#72R63,9DsCG-j^g,cA5:;n[u]ARTUKIs/neZr7^X&;'
`3IJ&Q,VP'9k\gkP@n#iI[+jDPA!++Mb`@b",e?2:CQUS%CSaK,*Z&V4;["45!YU*2V:[/iq
(<;\p2fn6d?V$]AUTK0jq'Z%6ZV?>9?`2<o!e;I7*V[LUc=,3QHrk2C2qo37=8!ef3'R8C[JX
1inAC>,$.(.g>H$loe%_;F$<\]ArKThhg=r`%&1G??-&A\7$E%86A*ttLcPHR]A9$:734*NR9V
n-Ie!m8%<K`"HQ2Q_nXT0IJT]AD!a&NX38hj.SU:W7NJc.sQG_IaJY*7=4clq1kI-d;[A""F!
'rfpF.Fj(JQ8r86BTPu81Bm^=#@,"?rb&[(Js(aBK.P`QoD?_"akqWNq\Sf;Om-*_2TR+JbV
n(sLj1'+@QIo(0N)!X)e)l'XL1Ocpcrc,idgU-TPl7$EfYd^U8KpSSN\Q-8I3uUajpA]A*JG5
(jY+/$m7))\*s1&Lq95Hq]A1K6QKZ7*Tk%g:[--&m+JBmqjqp_c<cTK0iDFg1V%6n54]AL-,ds
=a+.7ge(jki',?5sbd'8MG'o)/")o"tVTE-aShkiU!qqFs)@1=%7T?sbZ-eRR0)$rVGT\_OF
.)M.[qFmfVB%/-#Njd07eP4LbWr<n?o%DcFA%j<^2k4FEAKK,Nb@f?+Qe&$U3t$B*GrT3X15
>fn87)0LN_a1Al;hn,XIDf'J%s>IM]A^RU$&p^Z-Adae$c>GMklcT*`ELi"%Q?K>b:Q%DF\B9
*_)[n%Ph<&=8d0V>+pArbn$B$!@FfLER]AE8_9B!!>?4Zn+?JNfDVWUJ0M;R+7`FtK-R&8e,>
I)u4]A-ODBWWL`L6%WLeV=Z]A$o`6-eK/$rT-m>(-rc-S)TN(V'GHjGirZ9-);'/L3;X&J(O/t
_98-JQ!`aUFD7sM-?CY@lTeECYU@lA,Q%2`c,O)ok\&G"k`"V9;e5;2cd8H<K)6S_&8\;SDa
h4QUm(\ekHJ<IQ0CJ'-5G+?Bk6/0Ri-_$Y4f81We**gmWnECrH3p@7q36E`Ij'[@;?ftb7p=
T@V@H(C;=J#OQ^,$@8?ZT:Q2"qXd983^=]A+RoqXK`W9$j!&%jB#YR4/]A30WE`?]ALqa^:m!HS
qeD@A!+3n1"O:;bXp:E5]AO\M]AUV3jVA-aW+NCcPX-/Kk2hSFB<^i%.8-\uXb;&ij3e&Cf>=J
%r*L?u9\.A9SKcueauPh`hA/I'tm0ES)_j'gB<#O_]Am>sH]A^?'oL:hRSbn,/X)GjmVUq51f0
@,b4VAJ:PL0%9Boni#9(62`o('b1pcS3e]AXqUN)6\'mR3UA[Nsh1l(Z8jh/j&GJZLsANABD@
3%.n(oNH\\*>@_TNJYsM0(`laR^Nqcok$61IaFfH;-2%9nq.CV7,J9;!?9jY[MebKf"Q_39;
"<7"$R;F,u_XR]AgX^#G]A"K?.?kp#3YCG1h[[>K>2%'&bE5cq?a!p[;D0).KnQJ,p(;dr#s<R
>Dkcl__kIA[,r.Mg2!HY:'^N.d-eU$PXL%:d82Z[>h2-FLJeB4)m0IA>rjdjVc,I2#I5r95t
G*YLT1=eed`"eLP-BO+DdCBVI'"tl%fB;ISZlk(ri`*[:bt>'c`ro\fa"]A8![D&OnoU8'YfP
PYJT$2[jV"ritYA\S\)WM`]AO0cEkCIJ)=XOQQFOBlXg7=!<@gc7o]AP0(bSck'0eCa13[.A]Ag
un]A\B-?tk;uM\rNd#L2$^lfL]A9BRI"GC%lBfk'HK7[j4X/E.i]A,8Z_*QgbCDI;34L1qt_\aW
NL>=WO>:O]A1_DF_i/,9"hge?oKLH-O=]AQ?r$POn9<$-gSc;led9aqRj7KBbi55Fcgqkj,inX
8&G;Iknt_Ji!$MtPGl5+ZGYS=-`9Z\3j'j(QaaQ7O//4]AB.5r+*fFosfumb1PiOu$rL%^tKf
W%6ahnm&LtW__OU6-V]AEnC<AJDt\MjGd4R%hP"`FhHn>.Fl1j$c7_k>fB9;:i#jh@V$BD59u
oefJO2e.LKR!WKSX\?)Re@V\pbiP0@/!h8bhf^nf-cQSRd.N4jdo^6!lH>8oMB5Ac[$RSTJZ
e]Au$U=bP`WSR?&8+\UqSr2bYidD^(8Pc3ukKcDhHttl2RRa,/,9;m$D'$7RQ"5*A[<HSZ5@%
GdXcFZ;+u4iS0i7RHF`HR8WErG]AaSU+:*9eGGY#-;+PuiiU`l6a@Q98Ah/YHXV2>_mM`GN]AN
j4*1H"fJG::3di<A(rO/.-rWV;rjCTLo/A!5AguU]APl;oH@hn&)9n!qj]A/H0j6U[$hIp:mTO
0cjT4>c*!6<;]A>)q`hFSLW-j&oGool7*ZFt-B8IA_O(<5LYCIYN*%pOu_@1PO?aD(F^#%j?D
/,Hip+Z'+?h1e`fVL#Ed82rn)Z<AJl+&97;F_-qoP1e[8"7d4,#DHqcT[i?2-F;J\p$X2F10
`E5u:<G'WX1Xi^]A?\?/B!L,Xotc&8'lnM_*M<l_W(jcn]AqWdZS"f>/\+r4RaNedDaK%FfI4K
1b^3rigIBP9gFHeN%W69H*3UrW<rrr>B-Ccg-S]A,n2gWmF5^373&*)]A4:WKX00l/q?SpF30d
@WS5)kLT5dT4rN"a\q@RS<2?"(eknuc`JuNi<8p\`[P-Qfn^jTTkdA<)Hpc'T_cq0VrW-6/k
4S7_$%J$]AVbfMgC\h,en=J=n4b9Ra[r,4\f$,@4"mic-@%MDol8_5_;]Ajn@cNT&n<W2f8f/s
RF,Nt=m89cO5^/]AEXJG_^j-dfNLr50OPIr>Mc=Om&[1HTtPbq*bRL*:k'TBQem$=aiE[F$BX
eqDT8n'Dj*4/d5-G8/..-5nQb`g*ZXga98he"F%?t,2L)cYSuX*fQ^oNoNI$hU5-W)]A_)a7c
I?kJ[rTL)<^$]AUmu-NZUesP(oJ\i3_N3WerY)\@R?GU\LAt6,$i3'&Y""">Q.RNs$D4Hh")9
,J#H8q'ac0G`9KhbsY8"[#"RRn`lESgmH.#j-;H5s.0QBrUUA2L02^t>--Tq^"E&'-d%W&P=
Fb%7=d8Z_R+QBEn4i$EC&Ib]A&r=C2bU\]AT[ok63kS"(DU,Zn1Z.MEc%HK;)(d$RBN7.$X_QS
>dK7\)_^*0o-m!06V1P9<DDhi?a'uK^]AC!L^Xn<\/D&J\F?pI\;.Zs75-M8;12<%fUA;jd9f
klR4':L2XUh6koFkGCr@1/SWjqakc4*:;RP`[f.MF'!klN)]AB2/+/SUB;'[:(^(4jh;^7`]AB
eY:,&N\_T/O.Bc?HsEA2TKP9pMpnWJKR5hhQ<X&3U;QR+KgC?Yb>q]A_jW\RR1&fjX9@[:0d!
om7),jsUrg=Ck_t'WE#q4p(aNTc`o`cXO"[_e,,`;bMDC)(E[te=5TL(0.bc"jO4=nlRE/Fk
eI7Wj85,5'NkZD?Daf/snkcd_*;Yq`(&>35L<<DD%s5)kfh`Z'95/[`FO!"I!0@68*5a=3J:
(]A*(=>)I.WT.G/:[V"W?3F[iY]AHgcb^F$kufX,J>[-E$u6k?[/EBCsbJ*NFhgO$\Y^?A=1Kn
m^Nu\Z*8]A7l,^%nPL'2jkbk^,b)S3E:eM*3mNP"F`YEXS+k\Q'V\s0C2c`[`NScme$n&k0El
]Ad&oaj(d%I$>+sQXJ,G3<%O:]A53#?IL,*sX1(8U*@jHTE0C?@iF#UjAk`8FtHH)_j4KOi*hh
Q-7,7h%;Y1d(0=pQ1D_<44W!sK/OCr3B6MO0&uF5fkej.SFlNC\P/PsD_1E3.a=@-=\J6^'H
Xca3[U"b&iQ;=!KI.AcT/,@_bD8eI\Y%g4d4&_)d$kTXI135PSpd_3Iu#FWN:!&NCq5UA+=T
\F%#c2/+9SIl>cRl-@]ALXg/4mFDBG4``:mtlL$nJT\<Mo^'>_sj\XBPh*NYF=7(",4KXR's7
5Dm#LKMVUEm&X:MRj(<Sfrr)nuFUdA1odkZoG0R*MaL%4?71<BO_mUO<9[opmaS!3Qf5AAce
j(0Ygk+O"_53._GTWXBLZ8oJ)alY6ohCRU0O`p'D8a-Il*3nc@ug3,nOOjjTNJh.'-k8=O]Au
24UC!pf<#H]A,l/-Wa[jQmNHf7nDb\Hl3WFK8c:$2K8IHf1l$>IN:?<I*T;HI\Eh:]Af^Rk9:$
t6k8>Aq+W)";_s&h.9Io@-U?%ebg.G^la:@G"[i+g8?/^?K:BmTC\]A,7B9hI)R;=B0Zp;V6/
Lq1[NE0O!5U%APQU9qdrK@Fe'K?),u%Ut_Thk,]A*VHPm0<Re2#>e!&Z9f!Hg^W-MG/>]ABRof
D5JJ-KOE_7Ge3@\>,Y`\MY\#5BZEaJrksC#&Wpg>e9k<^;j=ag)+j2L3%0T,)Mm'kLeJHPhs
o*ojL17nm9PY4YI\]Ad.5rc\?,nCC83jul\>Di4$@(C,X2"DG4FA>'MQnIgO?!:Tp^_(kibIb
GBu-?jH9=8$3hEkYsi\t_;;RWms`1$=&P+Ra(a?o5<K,"[8EV2k46N[qeo==%^\e=ZQZSDYJ
@9WSNc*,FmVsFqL>'h=lK&Hi0jTA4mi%`(e"fId1MRH?qd;7)j<Y&SV8bunDH6N\7,5^D^a0
\s3+,!'nsF&A)V.:hVm7=n(s(bNkUAN=9)(O)Q=Q6"AgiMWtbq[Ln27[615&bhuV$='Xc9Eo
Jm?6\koZRo1l),WUG<FPEliqqY?\DqnOcR76%r(Odq>:e9HBNLM3S^Y.b%BnKSJCrWMts>5:
;F5h;!(90%qT+a,f\3*F8)G;roh.*0`\&$LQY@(J0K(B/+T##VY*$s1H\K`i6O$mMic^^O:&
Ei:eSi%is#pP&'6n_ltq4O@-mlbKV9!ro5%\USNg!cPQa?ghrF]A9bgaeZMcoLBUf0DCgXpVl
GPWqG:hN/qPs`A-d2)jqbdCPd]AKX\CCG,bhYXA5@97@9Nr#HN)uc`O03k0_[Uhhmd*m/3p]AY
tXSYihYEs8mLlkOsN3'_U!BqGe,T]Ao%E28$Afpm!\mrPhW]A=0'pGlSUEQ-PInR@EjLMO4Y13
n+8ag]A%E^9V.Ris+$+(o;='ebF$&sE+p'j\.[_YFWe0c1"_lE*F)G\=-_e-UZ%Wr<-V7E@e0
2!X+NDKT<=/@$b_bk0VAqW>d3Yo/Zen[_s=Qr+X&3=A%a'BI'abq,tTU7]AlQlt/#n0HCUd_k
c#\m(,u[Lr%(]AX;86&UAWSd_[0`->\QtZmC%(sAjnqBfVVA\:V6jsG*T@N&KA\AVQ>jPWT,5
?01^#m[#@Mj1s]AHCGr!^B[K)6J04$Lr)QVYbPfZ6)>'J%``u':rfkjTSC^VJ6K$Nu>ZNAEXf
SUp*&`&ing^30kY62/Dpb(oe8U0^7`Y>Zr=AbV&4@r!\=jD%JmsnP5\^WYT!\BM_1#75+KHD
SIaX7MBMC1@GH:40^a>AR(L[2ZfUh1jJ(mmuL1*\DE'dY6dfPB0#J;P;[V3o$;/l%5ossSb5
MJqH,K@"Dg;HZFMBn!50(u2\lmH2-S"Xs1p$U#:O]AHo",+,;*Xb>^)6/EI"VXndB_52W*"P!
rsk>Ai;lMnKN%2@Q%HmQhZPt7.<rm3Vc+WjL#N!8)0$)ff,)FB8Xrb),_SClIOIH_5<p!@rU
]A+-''h1kkmTEepqd=kpAlRnT*1$n,A"]Asq=#+e-.BL#"d3rLq]AW:]A6XD*k[c!&WYdA9-Gppd
T*Y*BIF(48#0t#HBS1fB_@BSl:nso.I!I70'O+/FHd^*#ckRg;97iT%CqGnCKlOkpc=lhtPG
<Xf:Xi\p"^rN([9!<YEJBS*+F/csQ,:>Yg"*'C+44-l2q"VXk`5bu0J`j7c\_6a*IKS=L!1T
bbSu/n8#]AK((:'i#h9n=MDa1b3!@Cia-)pcEV*K;'//O9DEgl=V6o3oIYrBqNf\dMpL&`rDr
5PlDNra3\!eB=fCReB2>"eb*Q1Et8?C3oqjD"QF/!FC4War#&$\MK?]A>P#XghTD^VIV[I3K#
;qt';M=tWUX$4hr%GWJZ,u5*5#/CnjD5A`u"MPO2QaF@UXU#O@qjH$<5]A9iJ8m0(2\hs.hed
JNj?Y=q([Z<5Al(JWSY=k:!UQ[3+"(`JRSLE]AnGlo__DWk2n+`OiS-DK]A,&,GkQ]AjGnJ0*@=
.o"AbeIHFq_aECpPqG,;p,('Q)67EP6Fr2s/KhSi:,H^@hRVl5O/LQTc#G+0)6/`C&^f7rCB
n!IS$>Ko8bh!_h]AJTNBsK)A^6o%75Ig8@Mp01a9jEoX3,J[Sk9$=r,X([P*Lb5cc\n:s&;bs
8]AEi7pKBGSeSAOg1"!`oC]A8aRD-='^)NK\4+1W3bW]A_28WTY9N,Nm*KU,61p,QB<HhmM4Jg3
LU@XYuDeD[aZdL^tq9h[Uk0e:cu&ZJL%0#@=6]AoDN-if=prW:Y&5=,gO0S_rIW$4DIBujM*[
pV;9K/[<MYiaK*O7b"T>(CT*NZb*OhUIPTBej]A0j&NKgbl3IZVF4YTd#K)75jn_M4bDo:naS
7i27,B/u*1H-.hlU_V3%hOW%JGqk/At_P`hM*fX""H'*X?@.iGT)%Gp-.2K"nOB+]AHumhq^X
=m!Vk-ch;^kKVlp;3pcn8OKFFSa7<f.?IaSF[f1V*/b3*sYJT0!,P;L43OC6fs"';c)n[?In
&<jVRFrQ^9U+(N^/^_1dIuM"qY@!r55OmIqek[eD@W&p8s6dK._)!,)c2Sg._8cR(')H>iq[
>tq$'>l7<1g#^_48%XG2$>4*rTg.oCYL.+pO9I,Td_pF%>XW_=Mg?g;[n%q\/*tdXN54@B6&
q/Y2PSr;F[REJT@4*SC6@%=KPi7D'AfQ?E50:Om*Rm/k"KSFO`bD^)Ei<Nsg)6<m^coBLFCI
?6M?H@L8]A`KqgAkT9M%HS+hlHFQ7hIj=<gD=WTjOn/*5RRNakPY$LtXqFi@qLu$T7?r6C\1%
CEs/j7a'_q<,?%(DlKCpq=C3VZl@3,oP]ADV9d<!qb(BR$Nn^/>[FquO5er2Kc6!Hua'jQeOa
aotG=@'I-qCqo9RfN%W/Z=E>Zc.YiDNrI.Ih@k$jjNm]A6602PQkmF`*.?hh/&*c#!Ge_fFkS
XJ'LNVm:IZqTsqL:$^WZBUDbBK+U&c2P*g$C6!J1GkZ@R<M84lAln!lH;B#3(dbk,?;j&AcR
.`21hQhsN:ml=4F=^<[I7R!$WUYGM6&(4(Y-6Ir9)fdW*Wp\^G54qD[qrsWK\`j&k>O-MRW`
E+.G7C;OK)8e:dF[BbrT.'<1?Cp)6I`dM&3P=B_M*-;2R+E2c$bAY#;jTG8++Q(M4E2FkF9M
CB!0=XW_O1R#9`koo8a3<lC*-PJH$$U_`:TF:g5/fmfD6`@/$ZPIk5Qo`(d&oapWf!0`[CC.
78*\49Lb"URL/8HS%d+dKJ<od&lBOj_EWPT726Qk%%tpH9a=A39]A"eJZfp#W`mYhSdrf@k5(
qa02QB;U[jO9dXZB\WHskDQH#j.).@g*mn;oHD\.jo6LVA(1FeLc/qB(So&*5t%LeO3c@P_?
\*%[76*gasOf&-l7r=B`WbIqdFhmjb^,K>M@V6@'8J^IeC=`C##W<jU_<+LR=OhVV;^W%I+]A
9Q7eTH\s$*j@XgGR04SM?N#g.]AY6?(*W5IZ#lTf;+DLONh"m,S`'54=m@3IJh:7qANa)"*gT
QOH:Q_1GWIk`&&&!]AH1VoqUK:E:G\cJL(lYb+=077MAR3%!0=CpObo33h't40uaM.<<lHgTL
j9jY6#,eR;`U^1[^uT(8E1SNK[gMboW^%Ze`;/<<nChOlA)Ga&n4C$Wk]AQI3lVGAQ]Auf/i2P
33Xjj>4:"I_Qi5biW8()s]A_^j[oPh[Npcs+[dc&7a3EI11KjU&Du10_;aP\Hd5\IfH.g;@1S
CpE<mVIc%j74BtNSi1/\O'nd*\L1A<]An!+E^+e8CgeK?EtH@_!LZY#^ghK%2aA6?>jkS:,T.
aDC.VHdIJ!`-E)OM+^So,3USOC/PGi$$<1>OW9\fsT!TiE?Gue!pVMRl$0[F>U8!c"9C5ffe
d?O)$cYI[(?tGS`s\.;I#4+$HJ$i:G^e@k-e)Ssb@]AU("2'`@Z]A:<@;U4_W2L8&>ES0r_33@
C=0:Apq=iJ@_kJ-BW#C]AU7!A'KLi^O>Jksufl21k+[#d/&*'#@@F0QBGLcl=9.gu2XondP%h
CiHPT<aJ/d9,b@)Y,&_LXuIK]Af]A;jfO]AHl]AGfkd!m!@NIRf(:HRJ456~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="501"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report1"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="951" height="501"/>
<ResolutionScalingAttr percent="1.2"/>
<tabFitAttr index="1" tabNameIndex="1">
<initial>
<Background name="ColorBackground"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<isCustomStyle isCustomStyle="true"/>
</tabFitAttr>
</Widget>
<Widget class="com.fr.form.ui.container.cardlayout.WTabFitLayout">
<WidgetName name="Tab2"/>
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
<LCAttr vgap="0" hgap="0" compInterval="0"/>
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
<![CDATA[1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,4191000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[部门]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="2" s="0">
<O>
<![CDATA[分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" cs="6" s="0">
<O>
<![CDATA[贴膜卡分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="5" s="1">
<O>
<![CDATA[增值套餐 (待确定统计口径)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O>
<![CDATA[98套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<O>
<![CDATA[198套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<O>
<![CDATA[298套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[398套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[498套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[总计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="1">
<O>
<![CDATA[299套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="1">
<O>
<![CDATA[499套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="1">
<O>
<![CDATA[599套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="1">
<O>
<![CDATA[699套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="1">
<O>
<![CDATA[总计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="tab3 th" columnName="部门"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="tab3 th" columnName="运营部分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="tab3 th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡98"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="2" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡198"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡298"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡398"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡498"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="8" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(d3:h3)]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="9" r="2" s="2">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="10" r="2" s="2">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="11" r="2" s="2">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="12" r="2" s="2">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="13" r="2" s="2">
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[$$$=0]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
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
<Background name="ColorBackground" color="-3677185"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-103"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<![CDATA[m<a+`;qKUo8SC`N[*[P$K;o@6?J>/1!iZjUPb;'j/QQ&g<>d&38rtK2JB3hg=td:^W,4gh8C
Sh]A7FV;L!f;dI/4+s0(d\pu"@<_D',f,?6>Psr:VL1k\+b6!p5`rrkNoV.HIfEo[J"V?LMKr
(oYR[G!!%9.]Ammc.(''r"!s%ogF3d0;R?QH2"ou7rhg9S3^NQ4h'Cu^EN?":Ee2eVBs6RqBp
JB`8Ch1*&W^@umGA[gLl[A!fr4Kg@meD3fg?nf3@q8Nrb.tcG,b/E<LKqG4i-9/:qK_6On`K
Z1k9$7OJ#EQ*?bb98lb;ZOoECCF#AQuqLN6%EP\/2C]A2g#h)XD:;,TC<-o!$@d5A#FH4P7=C
J:KAq^iaYsm?NGab"+\JeU^^%nYi3_!#iXIM:o(ZK(!`&MnCi&1J&r%Td==SoD-HSUo[A-8A
I/(?0+Z*e0K@3%0p4.Dj75,pba;Co8VTPDn7m@eRG\LrbgI?7^I!U$']AB=oLiZ9J'<Ok_pM/
L76u#BNT0Q4!4<dVa1048BKPa<g;MRB$Gm9FEg]A*HJF,dchTG=kFI-C.32P0jWk?LXa^99EM
R\5%#uq]AHq"D<P+e]A['E/&AVYH?=8^#PiS0M3Pe]Ac?m4FaL74qg*(0f4EmYe>L["^Y<1u3db
dYM5KE@Bh9$s=$!FCJ1PU`n,u_phM&L6kU^LT6UK%GiA>>7Bi[:8]A<#iRo\b*?Trbeu6k`>h
f74UPTc4#d0."C(R7W`<qnn0%-o3>l7k,o?ao-7]A?kqYh']A1g$O'lg?Mc@<@P(.BrA"M)[r:
XF;b_WYDoGf]AOKVMhK]AMuC41P-&fo[6tK1,I3$i!$BEKIdn-aklD5S:TGP`FsiWP#bCg=haJ
jb4&NA,2m8C.<6&L#r8i1^I3"AX)=o:fQ*J0Gqa`jIiDi9,#p',5X,j!hiX/\.IHN6F:[[MJ
g%!@j?7"K,aT(/&6AMjq!Sa%eeiO5*EcWfZ;;Z^2gUf2`5ZJ:/G3"Mj5.bF&tE.Y`@YuDG"#
ck#h1BTER1u*`**W'&WDkgaPTsnG?G1CB6AI;pGPgX>k.q(Y1cP_S-!D^nFmfoWRPP2QR$\X
-'R;1&DO9q%7uWXS:Z>pU92f`]AnM]AI0iiuLKA8M%$YRB5'Ahhr-t2]AuT5m4tI1Jpea`WEgKD
7"BbVK=(!)0p]A12&D;bBTq;n/gmB2Di-90_&'D6`lY27Db47g\uXU?cYa[1b1r6=O.\9HD6i
)I-Kn^K$`@Vh_N$q=pR`,=a3k5s(%+_NZ&D$/-7j<^3PHI/A5)Nk$9UL$hgDF]AUDXLJ8iAp^
':rqGg*25fYQT6Z-/ih7TeYP$V9D/H:\H[@;p\_SB+K0<e_+ZCu5'<]A_Cuok6H]A9RDVO/'`9
elnq1a-[,(@L$Sq-(PSWU3XWL4=nTYIO@3[Pq4gNZVe_\/81J0WtH#:tCP[gtSKh]AqB82od9
)lp42>R%>2!ID-_"[d.R11*o(%SR#0Bp[?o!A.?BFV&c[k',^=4YSP_k(F'TF!,jT8u`@FO[
hSHO#!gGY\s!3h^AB8`ac1`[&OIsM)Q)Of,\C%+9266LTQ(#VRqdK*h6gC`]AS\ZoZNXOhK7t
<OGW_El-IYNBJOT5q[Uhc4KuaMV"$=3AaqArO*oIP>0KStoGlW:)hCFkk0fNdPl?4[Mdm7@H
fG\&n@V40M>W0WCj&(no3+i%^IuXXYI#9"BW]AY1V@"/4E-t%VJslpF2E:NJWnP781FAOR9lD
T&j35DAV8X*XS<2+obgj4P*]AP?$i<a+G/=._>p`GlIr[5,`T,hgq0hM5\@S+ugSi+c%nPk'R
`8bTdW0fVX1?$G%V<'g[!nFmZ^,3uA;5q?:GI:$)DB>-![@<3tNq]A`W/QSR[8^R>DIf`&tBp
^ZD(te3CWG6(Z-e6jYahc/#VEp,s,E^>JR^iYFIbVub;oUd%H2WK@@CT_Xhl>.T?sSl%aO0[
udO<T&"db<5cNNX.B>pNPOJ/.F4P[nPd<`\pUh%r5r$@Sqg?o=%fH+)g-HW6#$.iYNm.'/-P
pWu@g\^g";>2M:5#0ChhustrSW'0DkfsDbV9XCYGiJt6,n/ss#D09NnX$FIf@CBk1"WsjjQ.
.L'7)5#ZFlXi.CY,CRHeNN12\P!"8#(6"_$OlK;Xf1E]AAuB^"YN3f:6&GEkVFoKDS`Y%QH1Q
6;K[rmdEE\BL0)-g\I#eK,*Z)3JH"j46jF>1B"CM>UIp'*2tS[qQ)DdP8J.;A1W!m(K;^(\B
PMY@NVaIc9bdT(7kbhY>.=pEX`8rWGb0+/`;\?GJ*E5R)Ck87\PAWS>DMVoU6`=)n$C#Le;f
KT@,0]ADTMi$+6T-!^5E0[P9m]Ag"Um;lPmD+O11mC4WZ04W0*;fGM*BZV>\6R%%hjA2l^RX8D
f='F86f!GIV"Fp+5GS\Ce,i!>=I4Dj!Idt;=31Vg*?^HO;Yb-jpd_tI[np^UkO684^'hrIkX
ltA<\kU`^;+D!pP0?PeN[[5`_rsR4no*RS="B_@IqqC7WUeC2`t4Tb;f=L1e(2Q0D$3*CDWj
`:qYQ"3=/5,]A'!8/Jqg"R']AUO!`e$QaD9@4j+iLr3.',N:$s/5&'<46T"2mV?us-h.fZ&tmo
G9WWV90.B&XIreU\-H(1H-1Tm#g(;T?Am5d,<&IZ)MV.A3,HBPEhU=66kP\hh_Mok$B3/+eX
b9m!;(mr!V\-IO:7J#2$#P/Zm;$`^0hNAoq)3K2$6%Q5jWZeRYm?UVVj\4If\4M#$#OkIGKU
0Bu!gGMJdp2c;l(F+#]Ak5ad7P2d(0>>o.\I#\j5OF[orFR,`K7rr*6+H;9q8JoFi.ud\X$*p
#ZfT&'KRreuEK^]A'BP19F>M<j/&Rm5N*SB^`tI8/pSUi*):&6@MGW3f`.`21#CHUa9OW7">/
Wi^;(c8tKp<9P+f5(t@+^.E98lJJME%Q<lH)paeM4p`q+F3=3aREATQ?b^`e'p$g]AU51GF6*
%`Vm'A]AB3?!J%bJgES;nB]AAl2(c)fmGH+<6&0/rA"=Ei.S3bq*b#$$*TS?9Y',F9hK#QeuZ,
90fqW=38PAcqK;N"b'Co.L`@4'n5C():'*_?s*45$d[loC\/5@,/8a7Mn(PHkoCs$kIXr?0@
7Ni"8%n\KGZ!bYRc?gho"a`R?!RMO<`@_k=ZG<HB+(HJBK>B%1K0/=Hr:7ESjsUh'I,)eMf?
Ktk.nrWjf%D$c$ea#I_fBDa>f&VTLQq4Q)V(rXf'hD(:'^>^IlmT`N&%.TS-@JZHdIqg!hD)
#l)>[2Wn2p@rB]A0_r]A+HNPGetD-,4s`ND0*)2^C8!oIr('hXTFN-U2):s2!<pWk61$dD(&a<
1)kX2qFem:7=gH3<SRJH8%NOj5%A0o,VRrKQ(C8T<rp_6EQ^'\JZC'0`V1Pu5#N5e?nDRTX!
Ke=#J?U>7;#m/+jbV':74;+4*Q$pugS2ij9I`AQoD3Mbcc4DOi5+qktJc?DA=Fi.lpA4#aC5
r6\<Y>BEfmZE(s+eQ1*]Ap]Ak$>H;)c+8G;"iekP<%>(&Q)f]A%/VFc[AG(^8P;O:A&"]ATC-a[5
aZ/6_*Q"U#(4)njS<l+XacLIc:XW@)i+VR=kG*%?7%#<m6G3A8cBLm0oT#pfE$W=!FjCerN9
cdjXueDL1aZm#)._7U]A3pgmk4ie9!.kS)-rD4/")XeX&:(/KtL1o7oA_^of!*QhIo-$mro:Z
"!!TuC2#`76/_N`TGL$U/X[Am0CQKLr1ZmS@!79,3KeK$p]An;%a/:C_S`Vaje%u`1SPH`YMU
4:SHt0Llq(M01Ze&/\2_=I(9*%9/a`U^:KB!cd,9;)kZ\+#\fT$%n\'Gm#r)F4AV=ps-9kZ=
</X`=eXPtM22Q\r\K0`:JWb`\j`,H)<gKO'q-s^KH<4f8&]Aq!O<W:2BC_2'^5mI)Sp;WY$UW
;L9C9Z/5F4<#&k"3FY;[h[b2VO-7s"07:M9-+<;"NGCUCd;FLOs&Xrp$3g:+#.Hi%rM0_7Tl
6q:HD7*Vc..n[BW$U0bB!D.^*Ka)hL:<P[r-aIFgJn*RA<9<fs1aaW!IY8a-anNe/&SG*/k*
1OSV3^@,8CUDu'XRrIft3/c63n)/!]A&<.N1u3W[.1U]A.,ZgL-i#>_Fq=eM2]ArAH#fhVn8Ns=
7SH_TIeiRBU?**t4BBkuZU>3F,;YE]AJMbJjSPbY7j<T\nXa^;sWaIY1Bm(Osgn_59'(XdP2*
s?bdqrH?9<mj6UVuIUGS:/q^Rb`@WO)J'"A=;:<S.m:,Z`eY5$l!D>D@?RQcTau2`=DQ;36.
'ncDm0]A_!Ut^0a+hJ$RY?p@9H=qmKFMuU8mI/Ygdo6q]AXIE*&1&fg6&0G3S.nVL(*B(C0RW?
Ur?:s:1Ig!-f'iEf,qfIRAY#uD`1u>';S4G#k6GU/b=(U^.(?IS]A/m5XP";#hT+Brk`pKR3-
.<E0e>"Rn'U]ANNuF7%#UpL^A[o[mPfq(2;I&,?Q]A=YV:qcNYjV3RmZe#>pS9dZ-pU]A$\n.'U
$f9A=XK+b&e@oTX&%!A<.9+!gX=#&^_g@AFkSYWng3j,s2LVB?KbP?=#Ed5N80a$/8l:,Z*b
4$o&qY8E#$A*=]Af4UP9MjL2'pRH38ltK;*/E5_K8h5j8Mb*#o-fKKRC"Ted'QYrmi(UCM$]A7
%fBud5?."c7&M*&L`DV@Vg@U[fW'@u!X3.tmSipG=I>YCSDoN;nfl!g_K`p"OQ3+Kli7#h;S
'lpIC[%QqHOsgO>mD-AH2`*<2ifYKZ$:k%=K1=N":r"Th@@/R`"@VOR37'[P;9j=m`r*G.Ii
3.e8+T2WJ$9r&4^,-]Ap-1F("V.lG[c$lD2?G[EmQb(K\Y;.#BH%;'&Y@$*"("j>aQ0rCYcE;
u@rDo5RF**'qVEa"=i*K9MXsBjpBbJ?C!d;B2%HnsUe/4k&hm?)f&)Vt*ea7U8DA&='N2r1a
(f(aL>J'$bcYrA>9m(:mQSJM6s$G79j',s'c@1>9<WcL7HO0,_r/b#;F)`'OCj%HbHFr1f1S
OCk"Q#U-6'XBBP_P%`?&_Hpf5o41XiZ90m7]AaAN%4a(0iS^\`IiH[!OX;D]AC4,;!IS(7Hi&R
6]A248II&-7mW=L+lEu90[l\t.rSKs?^0ns);ZK8gY:4kIf(g/XfZrfqkuJDtTi%jZq&T]A4fs
O(`4_L6DhACPZGGek8*46P]A3-/H_?ACV_:!CsuU)7>m6)g)IGqhbATdVD/L<cOG"pYIG)I;d
Ql%-qo6(7&/LFZXt9']A<1C;-J[)/"8b&hFm44)c8ZB;oC*Z4E0)K#^mt,7Sui6Qq=H&S<51c
/&M7Ao]A@Fog\#M!Bq!hi._hkSAoiTF7./9_"Z9Bs6>H.T9q2JRbSPI+T4@dQL1qgBP+fJ^,@
>+JU5#3--KZd?)&0H>1*1p;cZOO[VIOb3H*Gl)IiO[gCI`g5?kJeqo8#6Rm8-$E&kI(:_GcO
4c)ep^PfgjVc"ri[(;aj96.6QqF9ok5p"P$5&0geDD)bgE+F9dOKo,6WFi"'<\*RPp%(o7V-
cNk;WeuP;!U-[)Vhip3QtD.V@AdI/VsC,2=8ZJ+*s#2Ye(!cO"^:.,7fHrO`CJt*S^A)F`UV
>'/JX/?>d#MpuTFb911gB!VIBEg=/2I>EgWrlF20?W0G?^f[(,85j`9;guK:M2m_)`aSRNh;
a?/;Dq\k*'s=mh]ADa#c-QNY'6OIj./B5EhS47QJDcO*Mo!2mEpCcPtDiX@Zl["JX2aU^$XHi
LNg*a87=."Z=$0P,O^*J[3S6>U_BP@KId`Igp7SN$g%eQ"r:dWu9Sb\Cs.YVIP0/R\@[-We[
,1lKm*p+<A2uB@*_4[Gb6X88d9!AQXhKX>a@f[<c1!h0)3K%@BM\=VG<<G/qL@.QQfEejOIV
:/9rM6O]A=/rZ4j/(r--Ll`ij#71rFW8n#f'i%'bY+'Aq?.XV-g$eHB9J^gnsi;n&+!aj,)CK
@,D3k@Qj]AHP--!;hQ>+/,+G/SC]AJ6\!iTS0p<?pd)r3mNCoR]A^Gpp&'k;*q_W>+?lXP]Ari`[
(0cGIJe818V]AL^dV\%\\R(jZiF\[]A1#7p1/q.PT]AdRMaX2o580d+s1A_m%0OXaD=YFE)k0#?
1_<ZmGO^8f:3C>EI+[R9l=dgNCIE+B0)a2EE"dLtR@Io`hQ1\X4+,+#T8&(Ll'T@m$qLei3$
U5eQN'gr@tMV,&_geajbFt(g/C5h<BA;"Q+6jkZdCmEm&d/45^l6(h:lQTNA3>gH]Ab8XP^EX
"apFQV.iB]Aa?Zq`N_NI9CDE'C3CeEm%b[?R=N(hHT:ANJ'r(?TcJTNBa$?f"*351^<8$;oA*
ijc!)_^m'/0FMFkE&C)2b62jA7F]A2&OOgh9kd@5V2'n(?m-?\/k/TP7[<hjuiHs2s(*'"jD;
%/$b*"hP#6(1It!KANXhEN`m"?XuSM22qJJOSC80oY6O_U?UhV0=\t,A!4rA+oIU3@*:c:!6
'Z(GOJ=<'\7KlP^GJoX66m/BQ$2#h.H5H@[:>'N)gRRk=Pj4=ep$488PHSA@"d?nKZ6'-N<C
BIaA)Z\c0F#RMq]AaZ5u'0aq-%H8-2A_*(T\T/uC>T$`?V[qTYj#U\=6M<cnZXU^,j0s)7f\r
hi<=WB_SGBR2U!E356Sqt8]Ac&)>CE?drB_['%P_.KC/MsnYe$Q*=`@q&WN\OoVcdW]Af5k#%k
X(^djd<5EHE._`T[$rCWT:$o<U&rU"K3UL7WjV%5:A>f@'?;DWUq!SE<Id/0%LPlPEOm"e>h
=-'JUY=KD'HM%S1Jato:Wh1^`J_#)Z:UBU.l^8E3:6_BF+n@Jl/;3`LiDOeV9]A\PDGZnMTIK
GKCjGY]A"g;L<I,Bo.+L9k]A,VUlKQnEOnLslWDP>9>B$@6IkUL%ns;bqX:]ATZ42a`ct,:2Zps
\#[2u#a<9S,p\QH]A`7d'Y?G2+SB:A(#9?@eRlVk&J\Bh2N!`IdIZkX,g04,PQ@Mo/`FcA%>a
A6WYT/8;pI_5ZIA.RBJNef$%W!&P/&Z7US6D`c+^_'IUcS+$K?Nf2'.fb$l$89:Ct!0.c4(#
pXnA*<amg'2[d!Vq-p<t=DWI?9Fj!I-VQn+\17@1a>(bCfoM5s24<V1>:r>'Dq0KeaTbT#'i
%t,0qSPVZ-2Gj>P5Ypf^+nj$=GqG+YMXlpXB,09k$gM"9DU1%IGq900>XgO[?`he+PFtX5^u
7_diHs7-O^jKDkg1$FU;d=fgYtYJ'9RoUXEm2s1fR]ALBXTrT7".m'sCqe_H<Mm=UNkG2B'mY
h'.E&]AqZCJcFha%rms^m9):t[r;N6o:qkV8`LPH7+HRpPQG0Qs&n<=gfmR7Ug2_,C7t:H>hT
1ebpoA1D&nO?pCJH05CJTJ(*n<5JRDXk>U.,f.eL@^6<Ju&GXHsQ\D1'#MT$]A8;`K[_gVne#
B,;&H=T^[$AM4?*mjdJf7f=H,,Z@AGP)+XCt&"E8Ng4mmc"NM:VC6H@AL)<4s'$Vd1o'7(n_
((=7R^Kb%4)qA.303=H[S@H=YpR[5aia3+ac-HQr(jR!hB?T":K7<a4--SefYhJH>;$Zn7#!
URjY4Oeh*K$i>bni.]ANAmM<k*UUV)Upd:g/KlPY3cUmkOARaC=c1K*Q4,4]A!Q?eYbd<VWa77
"30d?Lm4tS$A'`5j.XT)*<c'@AkN;qAL*]AD^I2NQHN)8lk<8'i68M>\p%t3n(K0h(k\]Ab-$<
7SRSRo=)1?U4-S/!TE0##9qK'Vdhm^;>uJ`BBB]A]Am.g<^e,(W*T.*SFi3kr]A-Qj99lX9Mag:
u8NV!X6%up\&#4fi2ZEXR6f[&W*Q@s*2/%:Mgne]AZYK'!6H\1128T(#>pFeqbUHW-j_r^b7h
,GYRX$>)TfcDWp4YFp=Y%q&m"t:??Y7hrb^!"3mD:";,LIgg@]Au,V:UcLdVIVAST"qlZbSA.
:+JA3%7]A29(&J#:,<:dQT8YJU(,h`Lj"D$p4p6ZF:,D7IkFQOK*_6p-C+`$N"RDX#5oZRqsi
#5//=fs(1uO`ntZj$LnFl&Uu$,-P,Y!ZLdX.*??/$i/7]Ah*PiBG6_A,^&N9dc.S3u!L2WJWi
Qqi;TQH(':<tbq=:eY>C')WKUd7BXH17,Wc/jO$`E%%]ACs<S5COYn1I@:<_LY=U<K&AoHH,a
,.Mf(LTK*NW4_buOk\\4GC'L)",O9u,-8dEd6L[]A*#@C2RWUPOLWRue'.tLi;B(YBWB(K[+*
rGk;oi7515$BmQq%CZ-s6+M%4%g8B]A[Z863Tmui)XE&U,*p`J*_t(PI25`R;A5(WA^t+[p5O
Ze#Y#3Y<5r^kGO_G!^[gk@Pd":.iNJ0m+9CffG$j>>O0fsfnW]AfqLN3GPdOPMj&s.a0J2(e&
<$!bD5FcUjRT\7"mmJrBHI?g_knT(nU*]AnWBWTDV!@sb&Z2'C]A,-O7S1FIsABMH%\%nO=(d_
!R_RB5RYE-45Q;QLb,\7F%9e3Zb^cS@-4E<R>pH11Mk<q)s"_GTV<NBcJjgCGuZDKiVuoO\?
b's$L.R,%]Ag-dnsFCSQ:k6-;5^g]AgIK#/RtoOLlL1d\HRG8WqD9S[H3rE._*4nBk.R%^f3i=
<TO.aH71OHu,T+1%TrC`k$8K9`8OK/"&8haT+o>/RLDCmlF"oo..FCZma</,0c95\5,/s:Y)
\/l"p@i+T$j<$A`3T^L8"a#i0oA@u`PS>r%@07?k:9qanoKP(C!F06@@o&!V`q`d$(%)#To/
k#V$j:VH@ZbDak&aWJ'3lqcWC8/[@`HLKOp5BY_Ej5pT/W>bH6O,+?E?fBMln"qCY>ZW3:+K
"dO6Qb`@;g"a[A,M]A2`?MF!BaCGn.3:AWP'0-q_i^X+#gg9DYLQi?5@mUnQ&$I@M8&ArX`=3
uo,SIJRIb1mb#bFh)cNo[Se0/B:6\S#=6^OCN7s[o]A5H&EU4#jhBA]A&dp/XTK>YVo\icRoYm
V=#u>u4hoNe#Wu>Zqo^=p&o!:`pIbi3E0A6dYqCN=5RpPo4o,D-gk+GtKrMhu"nu*ck4HAM+
da=H*s%U.>!]AX?buoP_n*&_JQ-`,pfJ"<E/$FCDFIAF3o[\nCe#g+PS21<NN4d[`fh+[h7-'
B,UKeA6geSjo.aBQ^sErSjT$ISDr`mK-Es_<:%UGIWBgaY5eTrcfWnkn"@75IFS8NWr@;VYM
l1"3:c*Ef=,fHZdO"ue,%g)h4.WL-!*+$BOIpU9)^]A;mVY1$*B#44]A@Rd-(.d4JM!BrnD9_h
kIgno2KPtal>#/<4SBkkKpoX2d)=*r`e\XRt^FZYh0QmNOS^FfqBD(U<W"CrrC^79AX:M"=j
q'Z^nj?)jJq)laL6tA)*`*dd9Ul&,R.-7$_?%jYN!\(UIb5k['EsUF3#E>f&gFGf`Cl8%,B;
<3C2+h7FoN,hl(aXs*#?7GBe.[@6qCHRE7bYKo.A;K>-643j%X*#YE=]ASU+"EP`b?L$'q+<p
37d]A&O/D_ViUZ6FB.ng#V;JBRnkH+s1;$Mcp5"M`r+!)!9Zk[`e=5=,6@sl:;Uou<Se8?@)8
:qWoq`bIdRJEHcqR-KmgJ!iT9/^>l5imRKaetM=^ZNR//$M2O=?51N;AY/Mct8cLY?Egm@ZR
bn2a>jfNAl$aRI.X]AP=s,QS]AK&0k;AI&/=h7Adb_MO4hg"/eY<oi"?9)Lq(u:\Q_/iR?!h&p
hNZQbB'_`mf!iu_H0?XSN"LMC#6j4,jT80P$WHR?X*HV:AhHk>]A6BT6Xs^b:i<pJCY]A0VPs,
m?#N.1KIU2jbl*LU3-Z:=c-=`ddCEaDZ#i;:gluj(Hh>IMN'fhjJrT4@_m=GRoT,_#S0_Oo^
)ljo,ZL$CmkA^h-;0jf^1L2_WX'l^+5uG?RR;4CopD7C&$?b@Do6@6PEdKsr)pt2cc6$dKO'
GM@)Yi^t-/-RPlnCK9jS7ZcA,YoWEp+-6&Iu;iAr$eQmo%mc2XXrBXYmE<$)5E?T,<hk&e+"
uf)YW\eWP6$ODQ,K?BBN6Zp]A0-W"epjelI7Y)T(EDfCO_L3.:Zp.a/j7@R]AWEVB/dpa?B::i
fDa\1X6>fSW*K755=R+>7s?h"8U4Q=39/R1VY%Yr9W%a+!Cm(%/m#BW:.ZgKEd+*:SGPIo4S
*_=140OZ8r`O:0?=Ure0ZuOM@.!Cou?IAo]Aj7(*BGm7UT91Nb3H.nr[q>^YR+94AbI'EsY^u
7+IdTc6nuOl+MUZ[ZojHKQYY^"1N%]A;4b"UXUpVM\VDD&?qu\O-,R3W,?rG-,8PSl+(KI?5@
Hj)l)$0_B#1V\5CeSBUc!k@IMa#$^`3HNT''LiIlr<WS(m]ATH's:[bdZ>84BP)CVI*U,(E"5
']AX/)ZCR-VZWDr.lQ0=Zt@=hEK6)9OV0<p-e?_bf@d&<g^32irU!L#/l%</jt)NTK=4"Q=2[
``,^W4I`u,>r0k+u/XloSo]A*I_/[2=$Y4^OYV&FKtcJUa1`Wlep'l;0G#9oV7Oi8mJO`?BKI
WtZji-i-L9P<\-gCkPs)8nKt3-DmlbRgC5:uJJpsiu"?[kg9us3QCW!"<qt22_m=E*C5(!Qh
fZ<Q2FbRb/0k):9`]AYnY+OeB9j%mj=psA`k7Pb3mDEiU%HIo9[nFg&0`PkGo4;IP[Og8p*,,
=P`&ZSAWV(t'I:/S%8m72!!;fiWaR\LAsTtWn[7t.dNJ=n;@BkA'p'B#M*oWD$^J9epmnRor
Z4!"[O5\LSN?)H!"d:J@nG":<N*jX`U9Rt]A^2?KA.s$]AE3f2#k\34Qp8*ZI=cbB&,.MJ&To@
B7B[PjfBCle9tbO5KpJHR:jj2s72KM>L'PpfeRrQ=e46h%&?7fae'E:t'pE!LBP0j#teoqX%
'9g(#p"fieDOC!BBIYdW$_]Apjt'gR]AM`*Vj!/lU-^kqRlt=de(]AcTH"+3>^)`o>Lcb_lf2Df
<TCF=Sf5]A3U;gftgPJY.s)`2W?e)2?*aGH^@r>W)Cbe+eX\m"Z;RcZp7b]A*"_B_[QZ,,Pf-.
TslG*jj'+rr>QAKFhP%oB3GRtG<bN;Q1(ge"%OaRm!)_<,Nbj`%>b(m4+\<2BJT,#)S]AC#dL
ZNOl9+pt!e2c0RD>'qQb2M?Gg+EsD2BfB1_$[]A0;iP'FUs*h,Ha$Tk&.$FN)%C<9l/"`@3lB
p2i(/IsFnTil^/oU"D%+a/TQ.jW4.DtWdlA]A\;qbso3.^ikA,W1E=QQ8>@\g)3]ABMbJJf%C'
2]ANMaa$]AoMtsFg..;:uT><q4BbG(Wku#d/_-HWO3dYe\:t!*98tTI>Xfh/%E^"m@UFrpoB@^
UTo,M6HE[NDOWOUIU!ADMV)m`4^uja,e(gR.o\drD1*O3S18S7oK#sGa)@T>fc0E+,)54ei<
RJLe<o_XIfXs7ej2nNT\uf@qkNi>@a"=>;fnn-ZK"YdO"N'V$DU-)i(6<k5dn@\"=KO@2Z`$
Q(8NK#Q9gXQl3\VZ/)6(9f9`((3!@QelAr-bVHl1ML$j:5H64=G$eIkE3sobp2R%\,PXq<^@
-`+:7K3;tXTV78H(Q2[!tW)o:bE6n;^\t7o%J&bSPkmDGaJIFXb)1E,Z([!\\eImODYSR)hT
0k0&!jBH!4n]APX:j,CDmqQE`J%ULBr@RaLM$"/41%756Uu6FXn=Xg=7LRbDtdH6ptGnSE-^S
-=&7???PAZU[B796,2H[9>1F((kKnU<bR"``pP"uVjFE5BV4HT="8>Nm.o<b>_UoEWS`0ALQ
=5]AjrREh/IBDoXt,;WV!Q:^H]AMTR+E%"qk&pG8W3&k[mXIN0ED$UC!DX?E4K?]AP.ihR0F'R'
%q%!:<r]APZm`,U?nRY_iK)/p8'l9K[]A_l%]AcIq5QL!b/D94P[b*-X=%)EH/HZ@hnbiq#80rj
3Rr/6Bc+9R^oU$fjWN0;O\HKce??DH5fHnb*BcVk$bg=VRNASBpu"#kL/otk.5p[VT-p)%8U
3_5J"8Y55e[,_U<7a^R]A'(O>>eN;QckbGJ1s096jPtI+6GGGIE5fnH%]A.&%GqEpTc>>&o2-B
ogNI1OUVHS_=P43oouK'*plmte+iqJ27GG8ZP><+8-;_d$b#f!6LT_E?j2o%Xg%_?ohWhKmq
dI;m#HF)CHP;:g[8,sRnS"%]Al<AC2uSC4s/Q,^$Pbo.i^ZfA`Q8n&+D"3mb[LI)?\Kr)0DXS
B+s-2ScbGnP"LKB!)(ZdmC2lb7*Td8=MG&ctB?#;I&$^Y0.d`Aa"1&Q(SGPH]AH!/6tPd#E9I
e-:5L`r[g^H)%H<@u3,TtZ3?#(K[CQ<9L>Jc9p`rT3&^#^9i9:r8?eTLJoAC[`\`Lo!6BSRK
.Da'A^lMj@!A5>R,C)Aqn!UpMcMR=>'DU7+<9D_T)U_/Ul5qeD1naa"lW?P7-U;9Qk,B,$^.
F^[#Oa&loteEgriE6l#ne5)>9R#(ZjF\1E;a%(JCaZlB"=OFdInBFTQR'X29r1R_B+dVgdEg
b?l]A=1`,=C]A^?lu^*S.,h.g0T)h6St>=g$Ns^HR9(H!?5*V$G.!'/l\=cq@+KCf:p/oU*R/&
]A)8`je/YMr=)5pP+m0Mqac?lcU:CI2PFQ)D),A#\V=a&Y3YQ8`hW/$r&%]A#*?,:BZU^c(k>M
RgT(3''YK%f8k`:!/@P`rjd=bi'3%a`-WPTlfJH6-gW5kjc*p4^T0jC6I;=2R?XU36an8Bh@
eQ&GGh83lK"`gh,^bUDinSE/usUV+QdROs1Rm]AiVJd@"i/5lqeCZ2'7]AGTJ46+i12kON.t\V
[Qn/I@)S(BD5[F2":-VMnS[GLDj]A)+ZfCtd)lFY>0Ca8,I9n/gHS<dTgd,V3=Q.nrBuQ51$M
6-hSgQVH.HCs%B8K]A]AS@;*A:g_8Fa6g`igjK%^I1W[/6$=48CPkDCZgB^?l:,+e3Nd!6nVPZ
c#7a)aB&2m)ncTesA`MDrlCZ:Kh]AcUq*(h`lJmo<6ENJuVYPYH-_3%l_;Zq\ap0IdIF6K+NC
iGNa4[f1i-'ef&1Y)[1(<maEK5+EQNO"i8%s1TBruH?[V2KL++aY*Hpi`6]AXL-0AI]A2Yc>o!
,Gd'W*j;bg"DXS#o:<?#d\dVj4&0X/oi^i*gJ\Z-h45(u"tfTB=``R_5-jmW/q5Q$Ta,Qkm'
@D5c<EMF>RriNg3M>=Nu*tTg+"bmUE+h6dsO^Ijo3u4Il/'S9@(e>NJHL^r@5Ds!/,;ZB-X"
K&qo/[-g*3skT\ScnA&5r.9k'/'OoB[T]Ah;nhO/k[>CROo#F\"8.H7sVP7@kT\j1LtEKIl$Z
YDur-e'hS^>ZWq$e6TVaL8!?Pf@j!>>'`D.3OKc'@:0RQJJ<mdoPM%.Z=_$f]A=EO&Z)Fqk.B
*?&D`")fM^Mj`V%cP4F3?(RuU-2*Q/3:&lA\A@PdtAER#8<sP15T/EfQl)hE/18M$@,Z&*o;
8m.m"SNA0<!"#4uJO,j!JiMuFu2J?L))$BUZAaeB5U#Q<jLLlD>hNl!GWZ9g,%,@Kj0T3#^n
,h84k6:JKMA6(P4%MkoANOZ)I)J=_/AnST".U_h497/_-;F(+!OUAZB@IkCB=lhhW,Za[BmV
nt6KOCs^FV)iNcU)M"R279,:V_=E4kL^O:]A)NHl@5l.$a0!C3.1]AX$lH8NUJeP'_NP&5bg()
aZHF(?(aVp#HoQD:%W-A`/U[VqW]AfECJ92%T>W[$tXt[Q&R1I1B7CrP0!1lY$L6n<(q<gJ6n
'[2rY.;qCQG`&kkof?8bOc$s6=Eh_i:$/jg.M\f@.VSk=;=/LArQ[fdf#l&%MI1ti.[2T-_9
S.gM/X2Se9]A@IbSk`oo>pcf^2fNcZR:D6nuULGFZhodetXF(-WOV6C\.Lk$_iU;h@dGpI>=g
:MmI'6W"l@C5m(R_);^8?A%"[SN_?H)N.9R#ue,Jq@T0>_(,4"nAk`Ioi#T64C#[nJe3YP*d
F#j%\PXEDuTY%h"[egqu7FW]A(T(r[$O\sNcM=Ke[8Gf5e-h(_./iUK0-L67ItSD%M@sRn^j^
S4[Sj=X0<R@:X&X^,t>nI4"Pp1M4TaO\,MPa,!>iSf/\Ph71'[XBF0HlL`GRhHsWJa1'XPkO
j]A%5JcoVu#S/SFH_qNg3=&RAWaV3gOKf.5gE8Vj)$:.1Yd;;VF"!6<WN]A;TS\YKirJ4FNVmu
UG`>pm1+]AfZkZ9K<M1P8SsHT'FH#BU:cW3CH^[t?N.di8Z<o`/7mFUHN;XVLO;CEW!A`)]At0
G'e>S)k2--5Pj;6$:^?'m(=r`Z=NmV/,').^\:d1H2$=(c(Fo@~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="501"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
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
<![CDATA[1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,4191000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[部门]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="2" s="0">
<O>
<![CDATA[分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" cs="6" s="0">
<O>
<![CDATA[贴膜卡分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="5" s="0">
<O>
<![CDATA[换新增值套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O>
<![CDATA[98套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<O>
<![CDATA[198套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<O>
<![CDATA[298套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[398套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[498套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[总计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[299套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[499套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[599套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[699套餐]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[总计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="tab3 th" columnName="部门"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="tab3 th" columnName="运营部分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="tab3 th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="1">
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
<Background name="ColorBackground" color="-3677185"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="501"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report2"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="951" height="501"/>
<ResolutionScalingAttr percent="1.2"/>
<tabFitAttr index="2" tabNameIndex="2">
<initial>
<Background name="ColorBackground"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<isCustomStyle isCustomStyle="true"/>
</tabFitAttr>
</Widget>
<carouselAttr isCarousel="false" carouselInterval="1.8"/>
</Center>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="540"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="tablayout0"/>
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
<TemplateID TemplateID="0932a1fe-1592-4145-8c15-102f45746a91"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="e2ae1948-20ff-4167-b902-d8506202abc3"/>
</TemplateIdAttMark>
</Form>
