<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="data" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[2021-01-01]]></O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O>
<![CDATA[2021-01-01]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[call unit_achivement('${start}','${end}','独立')]]></Query>
</TableData>
<TableData name="th" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 自定义分类2,自定义分类3,单位
FROM 新单位信息
WHERE 营业状态 = '营业'
]]></Query>
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
<NorthAttr size="49"/>
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
<BoundsAttr x="194" y="0" width="80" height="42"/>
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
<![CDATA[=today()]]></Attributes>
</O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="80" y="21" width="102" height="21"/>
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
<BoundsAttr x="0" y="21" width="80" height="21"/>
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
<![CDATA[=today()]]></Attributes>
</O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="80" y="0" width="102" height="21"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="80" height="21"/>
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
<FRFont name="宋体" style="0" size="72"/>
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
<FRFont name="微软雅黑" style="0" size="96"/>
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
<WidgetName name="11e16b00-0fa3-46d4-bfc5-3edc94f271ff"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[日报简表]]></Text>
<initial>
<Background name="ColorBackground" color="-855310"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0"/>
</Widget>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="6623f399-574e-4d6b-8446-e0bf4163c8ac"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[日报明细]]></Text>
<initial>
<Background name="ColorBackground" color="-855310"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0" index="1"/>
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
<FRFont name="微软雅黑" style="0" size="96"/>
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
<HR F="0" T="2"/>
<FR/>
<HC F="0" T="3"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,1008000,1008000,1008000,1008000,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,3695700,0,5905500,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="3" s="0">
<O>
<![CDATA[部门]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="3" s="0">
<O>
<![CDATA[运营部分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="3" s="0">
<O>
<![CDATA[负责人]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" rs="3" s="0">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" cs="4" rs="2" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" rs="3" s="0">
<O>
<![CDATA[手机数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="7" s="0">
<O>
<![CDATA[二三销]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="0" rs="3" s="0">
<O>
<![CDATA[单机贡献]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" cs="5" s="0">
<O>
<![CDATA[品牌手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="0" cs="5" rs="2" s="0">
<O>
<![CDATA[五大产业]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="0" cs="2" rs="2" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" cs="2" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" cs="2" s="0">
<O>
<![CDATA[付费会员]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" cs="2" s="0">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" rs="2" s="0">
<O>
<![CDATA[搭售配比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" rs="2" s="0">
<O>
<![CDATA[超旗舰]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" rs="2" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" rs="2" s="0">
<O>
<![CDATA[麦芒9]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" rs="2" s="0">
<O>
<![CDATA[荣耀]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" rs="2" s="0">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="0">
<O>
<![CDATA[产品毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="0">
<O>
<![CDATA[业务毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="0">
<O>
<![CDATA[手工酬金]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="0">
<O>
<![CDATA[合计毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="2" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2" s="0">
<O>
<![CDATA[PC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="0">
<O>
<![CDATA[平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="2" s="0">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="2" s="0">
<O>
<![CDATA[穿戴]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2" s="0">
<O>
<![CDATA[音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="2" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="2" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" rs="2" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="自定义分类3"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="负责人"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="销售毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="5" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="纯毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="6" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="酬金"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="7" r="3" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E4 + F4 + G4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="9" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="10" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="11" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="12" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员利润"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="13" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="14" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="15" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J4 + L4 + N4) / I4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="16" r="3" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H4 / I4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="17" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为FD"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="18" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="19" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="麦芒9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="20" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="荣耀"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="21" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="苹果数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="22" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为PC"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="23" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为平板"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="24" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="智慧屏"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="25" r="3" s="1">
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="26" r="3" s="1">
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="27" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="28" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="1" r="4" cs="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=B4 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="4" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="5" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="6" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="7" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E5 + F5 + G5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="8" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="9" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="10" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="11" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="12" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="13" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="14" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="15" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J5 + L5 + N5) / I5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="16" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H5 / I5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="17" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="18" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="19" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="20" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="21" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="22" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="23" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="24" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="25" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="26" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="27" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="28" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="0" r="5" cs="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=A4 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="4" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="5" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="6" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="7" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E6 + F6 + G6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="8" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="9" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="10" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="11" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="12" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="13" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="14" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="15" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J6 + L6 + N6) / I6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="16" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 / I6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="17" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="18" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="19" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="20" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="21" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="22" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="23" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="24" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="25" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="26" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="27" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="28" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="0" r="6" cs="4" s="0">
<O>
<![CDATA[总合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E7 + F7 + G7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="6" s="13">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J7 + L7 + N7) / I7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 / I7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
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
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657929"/>
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
<Background name="ColorBackground" color="-657929"/>
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
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
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
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-3355444"/>
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
<Background name="ColorBackground" color="-3355444"/>
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
<Background name="ColorBackground" color="-3355444"/>
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
<Background name="ColorBackground" color="-3355444"/>
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
<Background name="ColorBackground" color="-2823681"/>
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
<Background name="ColorBackground" color="-2823681"/>
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
<![CDATA[[(LTf;ct'<)aqLX(rW]A+U4X(u6pu>1NXDN_6-rK..S=UlH:_QJQ):2s2&%4,!]A$"e6<"La#_
XB&63miB5R[Z[#c-=Mc@#5S1Zu2fmm$)Un$Vn=f3=kkXVDr3g/nEc.Vo7g!5LD*T<\P!2Bi0
P%J?3e`)kZD(H2?p:Fa\\3cQ<*q^]A,<eI`<O3WnoJqY@SW7&T&M?\[d^[`o<m>2\;,G@!KLF
0.''PMc1e^7-#J@AV#mNk,(XE%',e-+G;mRPUYM1X/Qk_-qe/HR`jRnqKT^@[k#8L)`#F,OM
pUT..:J_Z1T<8^sYk]A5bnp9TBVm,/f:ngS`&*E?J]AY%4cdII<pf)A2",">R1s)h(+ktKQ):3
)8/1__F*?KX#,J@p$.1Z@piW8S)hU+O$\^ilU,PnLdrc/QgNUqX'UDmc1R/JApR"KQ^9l7\m
5$^\5$q<`!shVM>u1g%gPaR@RrH0L<K4N1,_FGha`OB`U*-9$N5I>>)rf*.(GgOYiWa4':QE
(]A6\8-Pp3`'F-J/d^V(B<okeY'r)3YZN@jT(&1jS"VXALbQnG]A*7)*\W6KBJV@?gia#V?1Op
I&-bT>4F0O]ArB(Z#jOqgAR=II75]A"NtSf`^$#IW,d1^bo3s&&N]A+4+\@Nu!-;O(&kpS[F)nk
i@]Aq@E!`ZnCWfa^Gl8QT%`F#O]Arjd$9t-ea99Q%2D(6#M.jFEaF'qCu++n*2'B[E[T>"@"ED
ZV*UO:k&,7S`/%J9!Q!\ZHJ+U>4lWF'gfd_/ne$"Q0s6/UhnELQq@GBc(5\q-3=n+PO$7s0:
j*XTE*Fn]A*&5bBH;'>g(rd_;m1@2MB^PsTb!@4/ku`u1/WICGJnf?.8RS:VXT#',qcQ@c7@J
o7S=0BI&/Kc,ng7c,C=!21fh!>:/7B$\NHU"X\Rd2*XQl6G?e4dfc7brRpX!ul8l0(&+[AtS
m=N/Q;2/J,rS3]AFJ_J(3PS2l\`0)I@e8n^cHf:eG9d:^c7589MtE*Fb$46!<I`Xi]Ar:h08KA
g'"+_oZP%VS[6_(!N<4%\J6*>P&H$/m1"Nn#o34g:tBQL%Ur)Z6=F;.Ndq(12T1p3ELNV)rI
i4[Wp!@*5.l]A),FVTD'b\-2"6]AJb#Pe+ZYrD9C1&;Y]A/1nosI;gLgb@#`qXT*HFgQUo:p.b#
UqHlhUF)!QrL]AdNT!g5F1[O,nBblR]As$r'H)]A90J49b!#*(0.!Rdq()!pQN^*7LIQ$u<,7p_
]A(4J1*_R_f*Q"N6Nn<^k>qh=Mt$OIs,9^0L@.'fi_o!dHK>Kp39$Xp.il+@#X&^ReMA]Am(Bo
K=EfLOb"1F<G$o3X*VqO*7,@7-+eobYK>#6Q_JoCk;V0WBNIP#NA3OjN[t>Eb??(KFkl8r7"
@=b-ejq%>Asua"U&so"h4s*^2af]AK0+#P'+IBeB>4:N1TfG\.rq8*(5I<SLETH>h,p5K;p3j
11BRbU/F+T#i=M3kWcuaG=,GU2pQ%SYm(ePANY\Q-R!eQHe]A7@f)N7#Yd)3RDT`"P5`1Ai*0
mNF#MdWcrk/1qNI+"4cQ!3l4K8bCAI:Zc",PpGMBMJl;RUog?hD!UoNrht!&"lI+[8*ia/E9
kXm9S!?75#4enTQWp`O-p\l.O>KupE>l1M?qDF#?Ia`-dZI5U\ZLE?QgNdj'A3qKZgIS]A74o
8$t_<:3WCiTGUicfCa(nU,`<Siba@'nXAJ8FaL.8(T%['#ON.lomCB[nT$FJHXt(%(lGr"(6
d?B"<^t,\9(7hr5AH7B]A+#Ji2,27)Q;m!="5sA`b1'"PbIN:D4=H-(5]Ahj<Za/i*NlUI<nc,
gccBlZD'ginWN#6rXd;Ofi69T[%2*_<I#W$0"Aj[[(Dj/5ci0;)/)mRTHicmj@g;1bS8?-W#
7Hc:fl9#8!\8h$XKd8p#5fK_gn*=\]AYj,.L-WolG!TV+`1"223[PjrA1Bi@P2g4&aTn@NoEI
@(kd^an+='ZW\9XiWHYDf6=egPk%=bi.@M'\VjaG'*mE,3]A/2"+Bn("*CCn/DkS..IHHdpp2
BFNsqHtcOd%:s$m/IjXhRf3%J(=Q\MKL>Ns$>Lh1kYpCEPifh"8B>`S/DHS\$&l"bfTmjL=I
XtE0*\Hj:%_t[RYCa?7;Hm!KOd=/,cN&c?=Pjmo#)Dh%pQq.=e(NO1"?SjP%@c;_U/be0S\l
pHP)r>JZgi:Os$[D.%2:k>j]AFN^d4@h)+4OmK`71pi#8RB$T-i==iuL23(BdTOY))'#m*"2^
CUOp\.aOd+P8"s&;GK^K<5`0MKjqIu7VC6^%Q-(.+SQ#E[>?dWeIQiYSd'!=cVd8Fb2/rZ=+
l0Athb7J!"Nh^r=t705?-i':SI"I$g(A"7a!4Xf$@Tm)Q!l1,Xr:VP$O-N"pog>.YK5C`H(0
P0OR<0\0)das$8Xt]A3*'hgES;&_VSB;W]Ae=nR@`IZPaI[f(RB/6alr[0O"Ni1[k\$*tf77%j
SK_%`AQi.fQ[l-Y,e4X=rbQi,M4^Q=2MK:LWf-Eu2>Z[ZU$<F4)NY:jZk.@O2>CN,fUYLq/2
Rsqh<f*DTFXE['JIWCum05!GY$p6Ib2dZ6taOMoKB0s<"@&=aBn$SK2E4[V7?c^sR7t-g1`K
?r;)n(X]Ah%a'!mkV"u0;nLiY<0<H.."1jI;7KJV\baaA#=Q2`e79o"<K]A?L<^5IW3e:.[bjJ
9+Vt^4bsD)mV,P!//1#?O8c]AP)&Vsf*DRM$]Af,tq&2+[4GGs*kn>2"$=M:KSDKR#Ffe#)DIW
;Ic8YC6Y1#uZ;p;`E%e,AgCiP(86<%o?>Obfh%K!^tVA47<p/_;oq3?o$O*#=VA@Hk:(-A]AR
]Ao;[28&"7lWY;AuZ<q0_nGh_cV*#tOW[M<:qf#CdOcV-%`n\*5!E>+AVJ*hA"dH^JO>B^'TC
k,_Hn(s]ALEkZG@l_AUsL4WbB^an<+^Oq[MPjo/$sq[iu!fZOh@mUZ[ubj;h6NCu2/q*4+p2P
pRLb+WPg$ZMK_h!9RT;:ic`;hXE9k-_j)FSq7QDkXB7jj9t"Q2WD`cVXjI[;hNP1LM*)YM&m
QRjOhD$05^$-S*TJ$uU\pkKm*6fd$K#gUn%YUuUo]AQ_KfAi4qc37O/3nf_Ij3Ij@m,14W$<n
V;f<+WE?k=q7bK#oc<<-k@K,'N%qIe.A\FU>Q<.X'g+f#LP)KeLBMMo?.j_bje;GABV+BI43
2ja%sq%P/3]AkA*=>75m1q9FQ\=jmte=rGH->J^gd/:d9!RdG>C@oFJnRZce'UJe'!gOWc!s#
nh#dqHpnn>FtZcMO&C6phrMXURL44)E&lB7#h.kJ%7Agbfa7p!7EbCJ2Ff:;A7aI0c/V-F)G
3h0)a%10@^9C&rCZ$)$N!<C=tD!%J&/l*U`;HCX.krUfB5//-_>-2Up8RQs2OA&q<"G&9I4(
QnY/-G<j[N5PupK\X<9K%+qLtb_&U;=7u[7[]Ah`qH;Bjb4gr:_\Wd+leI#_<kAm4+P.puHA>
UPipf.Hj`;SA(WWK$PC($NYL!>R9Sm$,>8#'e%bCNP+48sAHQLu.[eTblAQDJJ(V^uNZ]A^87
h*&<V@UpbIW]Am\[1Gm&g=8CJe%F[`?A\J8&c#XRpVerVT5IATXEp>DEfhL6mKP8D3?H<04a'
TVdJhr'J%CkufB4)gtHUJ.5_0bXm4L[93[g\LhH#.4noOq3Bn[Yh\_K:)oUP,BT"&HG45_AY
75\*.(t%jqBOd<SG5a7L<GRd,G\ZXU0^/p]A:_f/Zd;H!0!f?qI;inFo97*XS5<q3%a?HJ`s_
Jf/s2c5!T4_N2Jf^_[UqLb8U_/3-hV_#Aa8(GNCGs\K&lHq9=ZWjq4ltZM!\oJOH]A&0-CC/9
/LC!5AJb:gQhu`7&^:_2/W34&j?:EiVb#p52AlUW+6hRm_5M*$aBE1\^D&IJnO%4N#dRUg<r
>g0ZS/_&@E]AW^t;^Vj;tRoE+:)8<jBRuh<(m'=VuH]Aau6ZZrR81>mY'4fYE-nh"&N#IiS(:!
FG`g;P*dJ:T#6"t1I:2I,fR%&KkXJM7@iEGT#cDh0b$%q1nP3'7XqbcREsll#N+,,gITuCR#
D@/(?K<YB*lBJpk_'9<MY!$+j,&"KjuRsN?O6r>;&%RW0,`#`&.t]A8AYAPF&Tu9P(iG:c,-X
oi)E,q8PJ^<Pd5jNptS29<r^c'!Bfh87Z![=1g16>b7[(Z<"FQDh]AMHlPo(X9$"^E@2So_17
DjO%MbQ4*I0"qDY!D,4'\5Za@a#Okf<@1AnQTC]A>D]A?O:Pcna]AF0K>B;V-i/*(i7f7AXN#fl
aZF1=!=l]A$luHfDnJe=u!XmbN_up137kN<?BbB2msf3jo%>,dD18i8;&67@&8$MQCrTZo<Yn
k0U+:5rbEP!P+@L[B-ig7g\jQMM$qc+MkjHLLjq4V?J)>02;]AUW)56hoEFH)Tq(POqBd(5NL
;]A)P1a&u5DQ7FS]ARW4:VC1N1SD?8VbL$DA8pu0&+dl=VrkduT-u1VlU>m0jhVZ"NOG?=$\:h
*"7phZ3L8Epf/i*s92q)]Ag`XNXm2dT+/DuDeb-"s4AK?dFLqVjm]AcE^(ig)61^<#j7T-dE>H
Q6Cf!`4M#O*;2`;,O!fkGGuJCHs[A8qpr^QZ5A9jtriV.Dj2*lR[IUKeA[sm=.8,H2$S[5f$
CA%jNfZM?89ulG4-sGfT3uVG>hLCND4O`9a&`D2^\-C!U/]AV)c=)!5q\4Pk9=Pe9CA38.uor
eSLsu"<RG>bmlAn,j$.2"Yi>gZ?oaG&P*ahgc1oD:TK:O1f$W^Z7X[3bmnTU2g-3Io$#SX%-
?eTbb&ul6g8`EeCog&4FdNgI25."Pf4rc6JN3HP]A[SW?/&+Oc;=R2>p>YtZhDbR=,Lta4UhW
d9%aDUG1Z.sfUHTt*#f2`'@AmjHQb,:;BtY<db<JgI?/"s5?aN6;)4h($>@L<M+&$Kp2[^DD
<kcmP6MP?"WD(Vl4K!\D*&DS!t+)?AJZh=K=`Y$U@S,O=M1(KJ=P1rOup34Os!2DmAZGqC;6
$XrlsW_GE+=RouYLboTH5A,SQ$dVB.PFFN0*e@O`_)T<,`)]A`@#k;gOJTW`CZc/PH6;`&1gY
FPGo\4GGV<1s/=YT/@!ZbH2O0M2;4NKMc.>:]A<@hGDr/jZ19Jm#fIeR#!HMe[q^*[V4;fN$"
N*"OYS]AufW8bH=HmZr*N2@jYX,+3Ng5#)qZ;Lq]AtpPQh:[JdYD5=QDc!<"NicOmF@7edf+[W
.&"(^CGC0_f#2JZ+]AJl=m=i!XMMP4sSGUffB?XLi$i.ul^\CG=`Ob[OFQ%jM:>jV>EY/7K'd
HteR=_Dl"O@CVr_8.2p'I@pccH@EGKFW?K<7E)h(J/`*ZK5L(dsFGBBC!^Nde(mQ[",i1)Mp
a,[XSti',p,*A_+^*dt.0Ad?J5V0$=B60ne>lmb+.\hd9i[.pT+no*]A0!.JLHs,QWk.c"ja]A
mL;LlFN!a$9AnRdHA0J'a`t+"@'`%pGCF"BF14Wd8R<1:bI"uS9G;2\21;:8[@t+jej\:pU]A
-?V?`ic1=$Pf91japPD]A'%D/s+#%+19Wc(^s95R4#Kn$bMa3',Y0A^,"3MLgAWKiGh=Ncsu[
:pEcmCr3Id]AAE(=\nm+uD<n)/?a:iPRE)i;\fer0hbN_9;d*\\64mnOKWr6/&7t3maLGgh^T
k[EaW]AN5GmCB"H?Oc"=)XMEt<7Y]AR4mNV-CB)[NrX8[`3^Bph\sZ>LnM;1-GKSRec5UtOL@S
gkol"]A7@6'+3&Qp/]A:bQ1u_k4rOYPLtm`t<;)bM)`ScU3ZC-P:GAC)PM^:k',&k4Cl$jKnQ4
n4o)Ed?o<VYT$B6CmSd]AaAT-u*nTMSAJ5(!Q)oigfGe+(@XgUm@]AFW"<lO9eXD1,IE96POSu
k.El8gF)='qis)]A;J<[^/Fm!6=bo>9?H6rM,'n]ApmkBRQ<$4SebG=Wag[;U7ud&ol`]ArCN2\
6Qc8r:a#B6=nd8SLXfBH_#gDaP%Chsc[9T<uSSU#9.Rh^GT-=/H\GkU'Nc[,22hJNil!mL0D
FB*b9cNa,PCO/J26L.Zma!4FU;P;GS[.O1l8aS2(cP?A%GXL9SKMra[uQ(U3*FPomW]AMP9[9
.T_Gs2:^k5ZM:s^n9;cPLS339,XD>g(JkrW_9OZ.r>mAWr:f@_iFEkfso>GT3uCmu;EI]AgQl
HPX8cV*46I1='q^%(U"41mFuO@:lVTS:"&:KGchG:1b]AiKHkqBlWc/(cJpoIh&lTCStFiGX\
YFR"mS+W%tZeN>&>U[rked2;pD"uN!).^PUV8p2s>[&4nZEe9eniX.%o[`;V!#hk)@*?\a`t
/%='d#%Kg=b[YfouqW4cmjST9k.s[Ji1dMnoT7l6[`'*^GaSFfC4kegRLX^+_/MhC[ZBLR0!
g`*I^C!9pV,E!:c.U)/Mtfs0;I*)[bgDpuII1VIJ!Qk*E"Ioe'[k(Pdhsii2<]ApFj%\D7;]A/
sa=;hpl.\;*78*Vf5.;jm+_sMij\D<bc?S4_es09AGp.u9FVq8R_c7mc]An3Om@I/_(&MtWW3
J1kQX83kZB<TK]A&=Zj3D!!$,eISd7$lgho%hMqR279]AiW$K?0f".2n?06;'FWpN**5M@FIL<
HWi(+^u)=)Q,uOg9sQ)bK]A*M.0F0Q>_(K?bf5Ak^3qj!>XoFWB)&L[Bk'U`4_?,?Yd%7lU_1
XZtUt)RNfa(UX;*q'p#"j+1J62.+`_O6>r*MTl&KK^eTmCB\OSJUL:h-!!."KKPQc-=%lk;<
DR^m"7!X%YIlmL0cLFiMbf;)&=.DK.IkeX[Lkmp='>c:Tk^/$jpPs$)g:Iolq7K*<Q'*rk^>
CR.u_^3kT'K#=oFsm^fB"K?5`ZR$`X$Tjk_*>:cEl;n9a?i09>j$8J*<-ec4utDO*=?Rd::'
UQV^$Fr*Yn[uBpEeM));C37a`MC;^`X3-E)=cIH_(u[IHT8LS-&7K9QmZ:Fs-gKjWS=RbXfo
eKX,6<FO:=4Va[gL/VGkd6Z5Re":cbi\S,bg="#h;MqK6&*sc:l\>\8#d$^T,6uk-L$U.P,M
joo06c8"OM55+QKP<l.kDeqJJp7<hGl+o(h\CW,Bh=M5^95OY#FQWcP6Pktj)5Gd(6OVb@JR
X!J?8XJm%;D9bW7W-NMB_r.t4&ZSLc,F=@:4D0->#KRCLh\=7c-$^CVc'sZ@B+Hl?*I]As%G]A
RsKe!pX[d,-N.o;OE)RcbK,XLr4U/Vme>.@Ou.nf^uq\p:Ug`D*U%o]AQ"C>OnI-RQ1U"=>be
%-$&Lm<*eq@#O>g*bO4N\f\lhpTl7i`q#&bj/Jl-o$TuB3PBr'CsTdBg-jpWcJ0+\M'IcgVh
9f3VcijR&32sPNkGU*J-o';Vgo>N:?1IA]A`?@'-odL8,\<F""h;9^_!/E!3r=?C!YA!@(MX`
IbT0>Q)J[Spq/%h<$'<JOOJU2n:8Ds-nCJdD9lAeb?f/o`LN%.HrS6Q(Me_Qu2/:iWD<i.r7
%M&3X@[[uamnck`71LXJa0j?(r\X>,tllHh/o8kMmbmm!^0*9O^Z&#7,(1tKVhTd!a^Ft"Qm
D@?]AeCqoNCj-]Ahh'&S"\/Q=\+heEegjQE?BXii.VZB1c3+<=r)\4_Ib=H\W1S0obN>e>5";]A
=t_tN?Yhp=pp?f.d'+b\fQ"C,<1WdgYjGo4ckg1'P%dUUa'ES&>9.OI-pI;ADP8(m)Z\+"TQ
!U3J4S'kr\3]AfF8u@pL]AYUFODhLsmO3_"C\1.b[N41:0kqJX'udctSKZ*(eX-s_L7;=$nO&,
j]Aoo.-J3=WiQi\!XML6S"a_]APiDqe$G@f1\%Wb@=iNqMLFn"fWA"jXp)5\f+#g?D15gB>2FJ
$SfB"F,8_F0<>8Xl&]A_(6gRc)kD`aOlWos<Khpt57%VnD3(%Z^l6<(U7Ebh$(oCM\6-YG$;Y
,r'i)F-=O)8)XD)9*h[(U^/SnS$K0_\BJN-gRL7lIi\eM;D^WQ5,MMP(i(e27#8uL9$40*W]A
rAE%9OLL^Ch@X,0q.Df8X8]Adr;W%7EM`(ANj8<g/BD1L"`aAAeDU.ICk1ZcL>k2>c8%eo"PD
72NiV]AUDQg^UF!1/CFDeMt)&)!R/RRBh_hF[kuj<14pm_pliq9[';:5#ZY#utf_Pd0u]A,FYe
-0<\d^bHogF_EVVLl<[:lcE=Y`/jkeGM0n94XM\Eon$N8c[>Kl!U#R&.l;-6pj_9bs.**pI!
#-RO8_hf']A0-:;jpZNO/ZLbG.dtMcOMVeQ"K[OOg(;pXU,r?/HEd[h9QA>-]AM;1aC;<F-%!Z
``je[&=/TCe<0X9q:*.RJRUk)brAf&O(USU$9SFa<jH'#aC&>j.'#0^;EHsb9+:PSlJJ9US:
JdPT*NOGR.?=?quD.1UoB:V['HWEq&^^d]A)K=BB+iSb4O:5UO,!Mu\In#N(JpI6?/O:uiee+
I]A<0%ZZG:nB6+^Z(V@U6R-VM-"9Xg?1D&:TIPXmd?Z_*3)/n[RRQK#`idcm\a25[a&ZQjn^%
UjSC(g&,QL*N6Hl:_KmI3,-V$OC(*ga7P'18Iqg[`)$+uW%`M;."Tl_5fK!`QQm5YFk%<:jP
AfJ^]Apr:sD\_=am<V,iGEj&G(@*.:CrHnUkI+B1En-FPh*$LAU(Gp2&;TL!U37RV$tV3aec0
_(-r\prD:ab_qaYCn/seBGNqK'4DXa0qboa]Au(&EBpml3MRkfQQ=CuKVlLcMLHLeYpi6*Ng_
1[e9UnM+[5K["ea7]A8?a7<<I-lud+p&rc*l393K4=#>CbfJAmU\a*D'f#UsrO`"OEgh=+2OT
E/'2:X'HrU[MrG^V_>Fo_+Rs1&@.s*Z'fhgR\kX"oad*cgq'H/Hap=a4_[Xg;K2(8gJ+C[$5
A5(uS8HJQ1mA,,mhIYHdBXXC6Z,<=iRn29<7qt)m88/(A*E8*[7BR]AB;XHlri+%LhXHLEnIS
=+2C"/>hJ0Ra9\k%Sg[J$$X%?[U!<>\OU>1)t7@M;kC;C3LAB"@o?*<qA8"h*7;)fB0FTB6$
iLLV2&*b%r#9\e$6HRBi+U*TH1HR!HNk]A.=/C)&17Xbmt?]A.#oIep??`3Nf8mljTo0iKZSgV
>YGTYQ?.mQ&["I="&Fh>Ec6s-.VqP[\^(4#7(Cr"Lqh[-c!+H?Ao"kC;oAs(.!'_,!9Q^B!K
)A"q=t2t:kDorb2dG27-#*^^?=48WFI;eU_gpR@MAt`/Y#X3pd5=)0;NF=]AbM_D]ATSjLQ!cG
g=D:b+#clo%)@S>=$jWm#NT4oF)&Vmfqfm*Y"hRdfP9&7KFG[<P(Np0'e((<JoHI>RGYJWcQ
D#BmN3W1^0Xk67l%AaEnT2Ucn@kJjJWjbr?B=b&?FY5JW(h'>]AYJ"#G`^i.mIU:@H630kg,(
(ue73\BcGPk<aOaFG179<2C:4bi>!^:W=aSX9!/f3_YVLLp6L,$M>;,rr=<W_&eK?5!%/RJE
Y?`AfP+q/^5t6APDbKlcYkMZ*$>Wcd(Wh-;Rs6`)"CNM!D4tc63/2>Wk#(2-NgV&:"*kAnf5
OW%Od&PN7pqR7Au1`o#N\:^Uh:T\S2nbG3seTL,aKg74/1RQ4[ElN?LD$4HY*,ta(?h-Br,1
9EO*:XpIX1*ATP7<G]Am$^*0V[[LaI!;EQE2q9IEAd3*V)D;g,jo'q:oqp[D]A'JR5E5N`N_BK
im:u49WUuTuQOmZWC`Oq[nYC/%Z_&.N7\-)=Eoc\2JUVNZ7IJD)+a3$fgmG+]A%16[.GX.,*.
KFc>>UZ@mP^Y$T-p=F]A<k"6Ra$e2sV*'*iJH3@i<Kg\2Z]Au0DG'4nLOQ%JK&grL_auM^nc>Y
42eYD7rm-Qf0Ch]A)E*'+c'^j]AJg4C#EeZ"2L*A&9@5<O9G`W6SbMnJ$GHsk9D.@3)9#3h,mO
lqtFuSdT215:94Zl.DBbc&Gg*P<*R6E6&$7hFO1c#H\<*hb=qGfX>Tp(6A2#Nfb?9:dNRfJr
&mj/^!)<GBW96?.%*L;h>hY@=k?GhbqI=B_W3DWQXI&A/e_$DFqaaOiNX'u,(?#HJ\>^8;V!
J1nZiQTfPh>K6[SgC+INlt=Z:H@]A\M+$hb9GV/+M$9[dR.S<OgBO&+:VKp%![YN&5FU/ARcM
]Agi)XNc(WPp-ja*cN7gOj`]A.#5Olj=UH(W"VLm@M;/\V#f;1G'>[DSbOpVFDM`^V!]Ahj#]AR!
ON0L*U&&8[_bm`Y?DrjA1;=l3196m1Vq0ojSsZci"?B)8k"E,;1j$Mj2Ti(R@Ftq4<U^U<nt
%rYWApn7]AkSZ>1VMPOm'L?e4]AM)D@+l/Q/KO]AYQU2c=VZ'Huf.3U^HFbDeh0i5/Yft\rJh[b
?Gmsu7S^0/@da>]AZ<u\=PIT85e<R61[@2Q2\(LYFE?Y0h]A+Tiq!bkRCIb%>upi69N*39^FUn
:c>,\\KhMk4tl!-fM=L9*<dij,:+n0d@EL"LU7tV20_kj(9,C]AO=<1cim?cB-g1j+;c+$s#h
#!W'm5N#clXlRmE(Fn]A!E86CMCekNa_fWL%&kOT`_68U+PY2&WVUh//t9[*NH%\RB>_K''_s
Jg7G$=l2^Sl(:7`o8X3fZYZ_2&?auV%3cp'`h\e2]A[XPN!T4:[j\GeN&=5@F(ZR.3DRm(Jl9
Ip=A7BNbWn1[c9sn3!q$;D"gMet:3n<Bci:YUA)GP.'$0"gDTl#cRih8S=Z@^Kb&\^NVhH?t
jo,Tf7ij#Dt>CEAlfLFWAn.BVu.PPcu<$*K-+WaXN*1"-bJk4+F]AdHue`INX)3:H]A&p7?pR+
,J]A[7-JZb:E9gKC09U-3^G777C<*@D#_tb?_S?(cUjGhJh0O%#GrE"NUHmre'"&-oA4`7@(h
*Ak1IVTZA.:aXA)th?Tuf-bc=f6(A$^YEJlfY%pES=Jqb^\q&$n\-PDe*]An8)sOr2?t`7Npp
L2))RMm?BH(]AZ^M@1b$KkBAuMk0'<_<12F4?!B;TOB>bJH5!PFpF4.7Vh5A%h^,QmqT.i9E)
\U^FCK>0aYOtp5$R'eN$s%]A\hO[F(DZ[4+[,qRi(qtdD;c2;+H1H*H=+KUZ8s-jK_iF9Gd!k
V'&XB"2ehcV?Ae0?Z&!ubMu2\_2$Mpknsr/Hd]AV!2A2RlN0C,R@\u+R,jK,:JVL[UeU!BngM
n0c:8,2u'Tb#RHUDR2+2FMVF=WWI:on&M<Y!/F[1o^qc$en4^*1NbH^tnjpIJ'>/3Bh3qi,J
=Y*c`<+!FNRWj3Mm2h:?PNTeNR;F&r]AYPoYe="MS$J56S8V2u*)B^'?"QIiS+3#n_8.9C2"_
K5`hh)2OaG1s+rBlY9VJ9US\d?^PoH:B;ZR01H\UdK'e5hLeqA'&?Z>D56Jaq"=?V'd53ij?
oCQ!Ql%kFH*?p:ohIYaEI2]A+)F1[><B\Q0s)#'#p9uJF"o:BRPX&!qcB^2*uio_L74?e_:Yh
dJ`%`D?&74OUJ7mBUr$#Z?")npoP70,&2k(4]ADosKY8qP%:`s*F=`8p?In58;l\%<&TB"K*b
knc"qiHbnLfSaZ+,ogfH7..iD=>m=O%hi7Cei3(W3=?pb/T5KJe*\3LA+u<A.*'1%UZ.JM9]A
9"l!l<B1]A&QAV!GS!(CEh"[)[p$aJ5;7="'9XMs?iLcP:A*`%(/:1<VCK?BC=Q=<>#Q;Voa1
'3,hp]AfOHN-L#e[cFctrkM[`SVqj:0Suep1es7nTqQ.d("h]AVNMeROXmm[dc6TYtDc"anSXq
#p=oK?8ZJ8b>N,GcNr3</%X?9MX?I@IKSi'p]AMQX4AnR\0sn9;cbKmoXf<Fq:`)L,,"qk^J?
4IDZW\G!gg6Z"KMXWaJG-dK`a6"h`Tjc>(97o:5O)cO/gcPO28$5;UMAbV\,2U-I#X6]ARtP#
OWt"SH6b&C$B?ZT&Qu+7UtJe-h2$]Ap7rE1O^Cl^m?c2?1<R=B(A>\<CcQQaCI$1i/M_MsC]AZ
g]ArD[h_0El)fQCAV@QS:3L:^Op$8i/9PisGV'IGF%`HB6F3B$Sjb(>#LS_EL'd-ih;9&C-2L
p-lInE+gCR-8TD:JLoiN*dIR04DJJLhX3/a_V<=\h.LE5nHVr.A)8$;!'hQd\#J>%/Gsf`5N
'q:Vp+SZ1.J*%Uc0@Lq;=Hl3D?dTc?.9.DmS?GD.5a",$j1_rU_CP&1>6l`bgO2&Qno6c?Lb
S7o\`X.sRZh5\>m-BRZZQc;#/TK>lQi@=Zaff.]AHmWh[<sbI7;.o-E35^^'B!7_omNZ]A.U<S
Yu%E9>c1]A[+h\)lr?0]AP=tb<$,lh)"LcU<4$gUV;"'L[Ni]A?ic*!T1S&EOj?^6@qFu%Fog/'
P)/]Ab@\nqHgpcpB_:Ygn1lh0d9t8'^LYS9^r7B2OHXAE]Ag6o/<=hJ-q<QhN;YnHZpg8^gnn:
]A*oE&P"4bPRD#5!V.aIYCSHG_aE"!8pk.m%rnQIt'd75\RE`_E'7'B-q'97Wi6=[r9;%JW-;
A`m8=I,9O,E>+07#bef]AjgJM>]AH![>AhEMKH/njM*rJ>pa7G"C3*j?HJQ+>pqS73]A-WKpg2<
L'At.ukAS@p54=3^<)%cgKC@3uE3c@Nbot9_,P<"_gDBi`fN&o0]A;$G/X#o3d$4;meXGehrR
_$6CEeSBg?kVO6kooZ.;Ml$H3^j?'3MWEpJ?SQX3bP>?4U4KA,*:K^cIV@SW&,.V6T7&.ZGg
)(opts*EO6hNdo+ampuJ\5?04!(B6Q#91OJCE)qZC30MWET63k6l16$o`$_E-oKU:T^4RP<R
ml.+n]ALC2%g5u"U4E`9U>O5+t2ZFGd<Vs8_=!so[PQ(F#;NE>i.SBb*nQ4W,T5.6A=u]AYRD!
*J"dZl)$7W#Y3ECC@mW+KIVo8JZ[-(P9'4&$-_kI!Z#MubAZ-PlKg,1EZ1p;^%]A^Y=P:cJJ9
WYJ-h[mfeb&>LbW2>L:/%"]AdWJj3fRWr9JX_$c?2Vb9cNXA85jJLsY,Q_?'0icMDP)KC/^'_
JV[)e+9JbM^<J2:DFk6cOq73dO8Q.(U3fomj;N_Y8'$51I=&mX'Nr6N1RX#*T2Mj;R1<hh#$
B52UO[Ier`,:;`C68C_sau!f7S4`M6k\/%'f#43S*mUm[O.I=ACE?e6L.[3,na7YiWo-DiB9
8,Zsiq-;/mWb,5q5[a4#VLfJFZ[ms[)V(9o:.;2S:j/%\0ioK#?3#/9K-7FuhXBTrgT9[U3,
e`*rnL96WlhT[IQW-%XnLp"_Mq*ilH1[6"[aPDH6Fg5ht\5q5:VlCWsS!/,k]Af]AA_C[int1Z
V]A;tOhe7kpriWi;i/PM73S).MaoMQLd'Q3V)7!B!__j8Ol^4^/gk@8914[Tq(c<C\n8GfdI;
<@pa[f0,t`Ja1/:TYPm62([eia#Wuhdf8nf:\#$5"tP"6V7qt!e'VjEW5&iWT![:4gKZEa.@
-$r;_\O%?XD:6T$UR[?Z+-hR1qqZtE"kZR.7PZcboGUY_@GTmSl#cd1/7RcT^3LF4A*N4]A"=
R.GG[P67KtF?Ct$gdTna5+SGXEmN$_3QJ616!hLG1=WK!bE.p\EpW'E5n]AjS'Jlpk/SuIu:8
GgG8!58dJ/&XE,Ff\,HPYf5%SCqF)XeZW8@d_KEq=mp'0?87fI#mhTWVS,)jp@6559,!1,Ia
_,p$CS;'N8D"\fBNO8H4g([5k<)."]A`PGs/U:1_cpdJ4*?*ij7[V6`)b5@Aac4n(UYB"c*0W
'!g3q'_`eF^M`U+kXGuBJYPA4H=$fg+HUJI;%+jI[bg36u+N'C3>1EB2u2=r[IFb]AK)LQMIq
)GZ$u1^aVmNHRDEp&?#@Ou>.3FHW!g6%ot]AXE#!=^8<qLsPCWq.hEgnlM,WB^e1YC[Zkja%'
E$[!LFh*+__=2$;_G)Ue""*70Z3diVis)A&3\Q+b#6>:@VS#]A&[M<[Wd<sN1d9#t-N*b@099
h:fc4fDSDoiE0c;a]A`@8.>@f//#'><6OPSB0]A<0fi?]A4;d>*8KGmumq^mqV`(`kgJ8*u%@ga
f&,RS1/qoq5?(]APE[&EW\87KEaQEN]A6W#Aj"WdTUsSI0EM/C!$R$'Z8m=fQ)OjSGG(q"os03
<g/MY`h0`a^=%/At9tTb"4+th101#0uQFfgo*3d5)(cSTRZOK[JCf2&c7>ahLMmLnEJZRkQ"
FY95h^*aTkE9WKFKLWfJp%iNsTYVSA21bpuBpGe`,GjD;GMfu'u<4e/qhh;,`3$8>p/o(N8h
8,(dBrOr't>h?]A4F5DS7/Pkj.WbIiWQT_L*luhs-RC/qV1:)Ab9;c]A-MGP>$;&4UG'?C&V&Y
s]AmA@"KV!PV'CN;I+;WXr\Aq/ucc(n^jClIsF@eQJq/g$[ZE)p+LFK8),fSX>B>MF^!0FApl
Uchs+t<ViW3c7ta6#$MaUj.&:ggl<_1oL$]A%I_TTgI^d6)acCfF+-@KAjcKKe07^C'iO]A0pG
m/7um()=eWpT8,O5gKf26NOhkF;S8m=e/S3pX.9f=;Vbr1B=1T]A^lO]A)B1fSo\@k<%uY/_U=
)=Zh-Z-^jU)M^]A(:8&^R9Z2t-Fr4)`2[n"(dFnT7\1Y7H:U^u:g'$4[?Ic#OKWNG+:X&*"%S
+:'"5]ASk4>mHWfK<u-L31rk:h;td[/B4s+?-p+CB`9.@QLr`87ZR@KfX(cZY(uHu:IPct3$R
.D;L^4QUq?Ps2oCdt*C9Z#Q;/a**gq+S=E$]AgAOne3t2O;h4o_D]AI:^%,n$H;)pn,_`V(FT=
U*61V0g2ZG]A55!KnQ#a,FBc^n54_LMa`pM-82?i\nbn]ARp)hH,amfgoUK&^hu"]A`jB]A?_h"#
XR%?H(MD[!$Cl$NmSPbn=[r$4k)O7/cL)=0W(oilEK:%4Y'WpZUa\"DmY]A]A7`5g<Vu@R1B^X
>K_1jrWp3`JfWFtF\n8Wp3Vl+Rtp(ik&jnN'b6l7q)$Sf+N:S$_t=n64]A3u\*1Tr`WrcU;.0
Q-tJ]AOU1:LX..QHs"n-qX#5qPlQD+H`ate_0HBB.jU0r\["*7Yq5'scN).9JT[.U:?GRj`HD
Za#n"LZd/(aD&*.hbmDKCd!6!u!1WZJIjAgK%!U-Jt`EK8+"'(cQ@ZM%`P8fd%J8h]AuBJo,b
r4EVa1G&UD;ebrY%or4@3TJ`-$;0J*Gi5G*l8,1gJ]Ag9/k?7ek!4Spb7FZaCn63=5%]A#taPk
)R.'6!dXD?/MocIJcj_G,eprW8NZIUut]AZS14Tc@EHO3R^D)l_u8Dl[!+nq*Mh-_lEf?B@jK
Rqm=(LAUecY&,g/W%+Z]A?+Qs\*O^aTBdaBq'Q*8`YRQng;5fsJ^*g[_7`\RXWRcB#)U5s0qS
Lsa3Rd`^U@!CMkBO:-aj:U1HSX9sGe9_<GT_a/<4DD!PuSg/U0OZ(1H:\J+08LeX[Ip#qs;L
M\g-<>;t74RT5H=:h]AkA``,XJIW[2e-t.X>DV,6S7qsLlnA8n46;(h$TOY,#aG#h8;)_@eGh
4hC)s&2@UPi8`#0T^6c4$!Q*F=luOid='C+)37;QN9CL-,#REMVDq/CQ1ChE9"^^uP*u.-c;
b#q4'-5t"$7ut!EcCYg6Y%+*;UhJV7'n0if=@"`7\E9EacWnP3fJo?<0B+10o\BV(b)ad7P2
XSA[><Trjcj'dd/4gW,$Eu(>\l>G)gSVd53,9WGsdt!*^B`$pp&8#&X:p+48muPK'Se\8]AD'
:mTX?I*^pb[:`4Ca%R>a`&G%6gL/p"P#GM`&GBB-I;\!T>$'+F(o:!eH/eLmkuk;b4UhsaYj
inA/#T18g?/.q\X5GgEN%Dk>V2t+S./b@1HX7EhQ%c:MSO,ENc*L7-0[G5adGQC3';4rU,;`
*([_7H$8e=^%hqI92*t:-8fXQnp9c#m5hQmnbp]AbUl<SrtK0jIe[(pj,^).M(i9(AsB[R[$W
k'?;ar7an8k6e9rU+0%68Jrql1Mj)I;u%hiAof5\#l;9gNF7]AGC.JMXR:CUeWM=s4`jSB-EW
QEFDJoje!26Tgij>hgLQVSLcFWZ.]A$_N:DhtrFnhXUGWGQ^HGNQ7.tmo]ANIZ:N=i3eaQF4\Q
(&O*Er;h<#ANY^WB-JYGGalqlF/V!63OKr9,9s%^)^7o,IF3!;1;0,r9ZsW,X'X`aT%^Ug(:
1ek`]A-#-NfI_gb65KM>?/isT+*4RU,(2JSDFXEh=5-/H$A9ha,E)<k8@Il>E=iO2Tr)%mO_9
\'"T[7d+oZ-_7&q9"85^@*p:B;2=4aoT-rJ01T]ACb6R:#nK:1&,-M%VgZT9_F9r9dmgX&c6b
1@)VRiqjQT,Sr.A0#!G]AB^L[!1Eh+;Ve*Lb#XNZ4R8.'6hm-tmnbXN(P4AE6hd@jL?<+>:eg
F]A7ItgdqJ!iN"'\#L%-<i\KNr%>@eF_ne#!\C<dYI8\6L-<I4b\_>lR71Klb4t%ADjr:@M`F
Y8?r3OK7(nkLiLSNXr!dA3k_8"['sl)#GG7IP&e5TsF1j9(ZW?g6?!5I2f3R5l,!rILrfr,s
^",'()ZZB5V%\(Ougeo,f>m"[(:Cmo$SP@`^KE\<a_+5&;7D=-cDoeiW0[SDPeU0B4jLpp?c
Dbk9a3E<8;Dn\L^U[mqR"847GYHC;u>2A_)k1e6+i$1tOIP5m7sjM%>I(Gr9YadGepSe9Sa(
=(;IKVH"c<SINW0pSC"d*1-t&9*Agbkl1J'iCTi[.O9Ff,tfnm6=M=n>>BrUn'2il.No>.>+
3g]Aj()2>=aAqn=YNLRJkaH=Cr"03;upEMj*9_/XW93f;R_Op[Ht>DoS\X#`b+?[tf*QX!1&/
:F`JZ_3EC(eN$$Amp%ThI?"/9#k`ctAXiQXkg#8mGc6VP]AHWUdN%r]AuX-U&NRUN?)\cMk#$Y
#<Z+5d&Tg&KXQimTAqa[;VmHAmIAT5&.JLo'aNM2tR.Eu-9Ja6tQ2Ea#rKIfQ.c)055QFhgI
oQPAEKX3>,:8`D@)f'<^0.MTcVhtOTE^?Dh&7B.fe=Z6c=@Pr9]AK[)V"48TRQ(oH,<hARI-i
XZ<-TPqX7eK9lo^)i<0U*J.T8VNJsWZ(:?eunqA(k^.U+!$i<n\De5f2!g#$qbG,iAfs2oP=
iVDs[m]AK3RYe5Id8oJ78`Z7V,<,fi>fEotAO97?P2KQ63nX*?_QX%&BCW:O.1fg<Z&J5t]AtO
(%3oOc,=49N;Z!@/oc;`m]Ai)3q>\X--jFT*>!/PW$RI9lH#Ls.Fp^D%f@V\ZpkZ#C(GlfTLb
/uR2)?+ac7k;odu'`ZfLqg-i$=J<4MK?OnV"Vr;Cr!P[pQN;ib8*"@7[d.1P_RuqctG^]AQs<
PT"#KUmij(GM%#CV$,X^m6uL'IjsC"^;6$-0p^ZJjWRt#bE3NQcDum!-Dt9Xg,Kj(3`6l%bh
%ir*Judl=`0@OL>gLinj,"B$hdD&SL7-OA7OW?h0s3O>fLPp0@I?]A8qnd'B!fr%s13BgP+8t
Kr6q`9G.aeTd@'-db\08m?]AY6?+TFdMR%*W4A7H7X\j#.qXq\NmKCFM3\5Up;@'\p9'g'.<P
_Nhic]Al$jSFc_0(h9g=;34"e^p[>k9:!e4]A7;2SE6VBYp"8%Z]Al_Xa.=[K";f'i_09$ouYI&
^Ld,A.0+V!8VMdG2!HcMX)A/;5#kMJ"YLQi7p<q`-S%!us*qO9^@p/&[GY7=EZBMgcDXO7<f
VBVq3BbC]AS)c'WYLe90nb`BLQFf)`MB40C>aEGAO*fBY'5@+4);oY4\1Dq.Z#ECVqb(LWiLU
mdq:[n8*@_YpocXk;fgI,?I5oL5n+A_<enB^Ai#,,YW/=GjD3q#*2'=.2<j2,H-nO$V,s>_@
#G3ln'?QT)8L0fZF(bJZ73nbKN*Y6H4';CtM\S]AmH562g3Kqp`T'.QYI8MnDO/nRqR[+_>m"
F:9OWa[RNZKh6UI(OsL*($LEfH$bO_5s#baYhprVJt(HK10KEi^0@j`92<$F]A;#99TOAGu#K
Sm[Qb`]A=jo&T,CK?1&7*?&:AWB$$\r>,rF^SNikI!=>10t>'5)WOM'O;&%hW+F)(./]AdGi0-
<;4\QtpO@c>qE$[BU3+4hl-lSm48N'9SV*I?9Lh$-X7pEtc=rd'JC.P=Ncp4<+";W06XS9n!
96)%T[E5pfRlf_5.C/G>96Z`LQSRp:cODEDjL)r8PJa3`2&?Ri!RgZ=Gl+%GpWO7hNcj;*cn
s,Xu<AjABC+]AMWWEnC<M(C0hgcB#eUl1,?)T[kQIJXRem9/Y0MeQ7/Qp0q,-Rh/8-62AHf0d
)pe=co$F=b>V+Rp&Sck'h[,]A9qiS?5ek6.d(LHa#M!o)0?*;GEhSW?XG(o-r&8ShX$m*#E'6
`q.N5),?0>e(o!Lr/`/74]A#DD*!kTn<%G:b1BGp;qK$[rbQ/:BkaV;KqMs-.0cs#<j3o]A<P@
>d4+Z(rm6>1Wtlj3o/O4TnVF[uPGdpLJ>=Z`1YR/\eSP1Bq=VEt?f6kl*rXg+`NNC6m0il\b
AkcVn\BSO2bF8*_CNNOXn8FH\53&=Ln%H`570[ng&;d^dUW,;J^[/Jg7nc+N-1`)2q9"(-'C
:L3D[<JgL@k^7L7uX$rUT;q&Cl0]A&I,-*N@6.`sYd0l9sM7++#2$Y>\sXdJS[PE$#T*a\U8R
"q<nQ%2#f9cV=`B7W9SV8PYTl%@`dGf_Nt4VuVZ@T?>G#.9/d+cu]AK^cLEKoR<'44B*\VhRO
@9s3ton6[%+'6[ajH+*t;jX%lcH=gFm7J3EPs"7NZk:!n=Fb/cI58.=42_RdG%g&bfG4[Ql;
5/(),,l9JlFULGsR,-qqo/^S0%of>r2c23$=Y)^eS@aF,+N9d9UfS/#r3W&t-Zh6ig8"e)+Y
MkYc%6W.4Jj;n'r&PnOlSBCm+45IKN>75/Bm@a**?1t8o.q=%l'T0^3b[SNJGMirPW<1)qg(
PgiAV=]A,R\gEj;jH\<ETIJ6QaKs$-[JJmgI3mg>T?*?Vj\_klMee6in-?(H7L=Z9$adjB8B%
KM:aW^?#99+,(LHT'%a`NL%p0!#.-8@O_;PSe+L4$#65"!B2gVE.6\K!!A`laKgT0QK)'t;?
R/8A)$/<-IS0p?P)V^.sb`c4M5*/=C77?4.;HJ0!\7c'Ctd2e1YlX^Acdk@MEP\9E+LF3Z5p
,@8LnL=[e^8m^9L2!+i"UL6J[X&VbQD"#4#8QT6[0&d/.20!>`%JE,7W/-iNS=5A@u^9p!V[
H/hJ(\#OGjL."ZlMB%sC5Embig&@mW?"7gG%"e"=bK,6iCD+9[LCFWcB^2_[YVb4$e$J+(HE
Qm[3kQrO"B%a#<OP(M?`R=%MW/#1Q93Ij,u$N'#jE]A*b2UJ*^,+3Z-K)WCcbJ.WCuOHhG7'I
`sO$m7$`u`.IWrhgoe/(,a:pb"<+`cnH't#>'96mfpWYGR0o5IXLu0&QX5"?*J:qT<cnaba@
AVc>`M1rS#JRb]A?`sr@D0rM`!/=Kab3QI&D<]A,W.DR112Q1Wk,"0+dhWagk>@3^rHjG.T]AnC
7+kd_Vaf7?tK)--"N!kUZ7#[hN=$e=PP.=0E"E"]A#"qrK^@'44_@)L$U3Va]A!hci9gEIefnf
NjT/=hpWHOJO!;hFp$V/-iAL`.',U/.iK9GR5D*%=LI>ZHDAaWr1A*-o48k*;$KBb4[O71>q
*Zq>$NmKDTi)=67+^r)Zi57>lMM\@euZe_6qSCjUBsp)Y&%IN@N>93g9f=f^@[f]AlPAWJ[r.
,B^i(YF?c5d[ni'ELaB$%DCfM%A>aqb+^NBr'Z_9l$h7sdh5Bl0o`Q[(h-Yl:`-hR$K17R(n
L?fk+3apYqI2%^i$E\+!D(pa$3K%cFE]A9*HZFY!(JoLBPt0K7h:HRfWZbq:Bjn6e3?j]Adp3J
%]A8jIqL@,JuN?Y,DYu#!E_*1WGMQ*@3)bStcV5]A)_(p`B5LDuR;p(X'Lcl4bf9@P)=G-=_>h
Hk92(LNjGelHM/,LV1NgNs==_[_:M&b3;j*4*=GVDQ:P+2h"-[PLj5'?<t<U$7rNX#(shY#c
8F?K.Z"igQA!ONEtO<sIRDp"1oo"KTVD:K$HEq1J,*=fNM<.[,@8iH\K"1DLo#NFMHs+\Mb,
(]A/&r;@fm._S9O@*k*.3ee+Q)"sW9@TIPFK<:-_$b@&8Ks&@r1::ejTjh4T&S70D4#LL^bKO
k4^W0%.dc83/"<8Yes#rf=!Mcbs1IsupT5+r(>GUE[\a*b&58fQh$gkXbM=Kk6^i'16<qh:$
h&<;G&,R42'41R\AbF(=d:Y&8_!"d>lrY*Cgl"J!2pm=:&1&+a'S^*mps/&^I0TZ3[m[NgP(
h`i0?oG%B@OXl-rk0"SLc76FrXV"-iCVr]A<Rn$A@eAq&qZZ="36lO&It5b49jW6emLYi\6n_
:n0G9bnnoG4q=e2M%2PBWopsr2lQVPjn&6ltUPo0`?Hu4mQ$/g')>p'(nc*jTm.<=RF2%Z[&
%r:-R`t888&?:%h%gEYPK0Y+/*/I5K5U]A;se<l'(56.tLra]A1mP1d]AoS]A(Mk5gb>2.S6^$KP
T"k*Z$/`^]A-Zt#VRb$Lnf@pY727cB(<ml0t3P>9s.8biX'uKH%#sfM!D1F+ba!H>L%Bg,C\G
UkT^Y5R[**dCL4o3I'"VEL)Iu3`Dd/=*<2e-AlJa_!fJc#ZeD-e:1fgJqMJH2VDX2b[qaJcY
E.i2gq5BOAgW48AgK@):2+lOdRUh"*)?F`SI$0klUl[g5k']A`B)8Q0%qWXS;Fs$S2StF]A_+b
T^2B8fpK)%;UL96Gfs4G9UH&enH'C;phKu@8^oR,dJC6]AtgXCJN,\--B>\&miY7Y4]AgAXI:>
L=?mA'K<\H+?e.$No*&e\iEY#&<MoSUpEJ;ps57!rOhFKg\gGK5*/r]Ao=Nj%$o.rH?C\B4mO
0_mMQj<_4V^Du%&n>^nFq/O^SZf9)\F?C98="/jgjC8WM%8[WtVW>!pGqrDFXDHm_0boWS9R
3!I^hkHp#`5N`/c/d:Z]A,-D/(?/3?EW8K&IPYC\iWo7d7c9Da?k;norV^q+)haZ.l8/^o[+e
@`3B?1R$<<,mY$5cop7hRF]A,%HQol`Y^Ec;?Vd5n"D!UcGU@s>pF'f@?^."3mcaMFokEG#Iu
@R3ATbpP3/0"DXdQ$e`0U%Y&ae#H_K!hRCL7FcqQ7hg(8V2V$O('ZH>RF*c4`_%Eg9GjM*/9
OhB*)Ub>O<XH^#=d@m?,r$p8lFAK!n?3k/NhJ;.]Ai4`1@C+UH`&+_eQEU%7l-)Fu6nWdVI(p
YaJB"L4l=RS(?h?M.+VP>9V,pZ_!CXtPn4;V%tP^?OKLa<k4-D8F&?3aD'Bjtf0V.UG-$r\L
.D7e$T\2YiY?4mDe->o%9/B<G`I0?7KaZA+b[]AE"R("E8`m.Rm3\1n7[jM0l"mC3^U'[j11(
,iB,L7!*;N;baiUt9hae.+5Pg>QOorXmB#MWV-:EL5:BP0je:a?4=..1>%@I3J]A3=HR]A:Y;Y
$^-*C(UZ5[V4;4=45K[HjE5mapt*Oi#p$n>$mEt)Q'c?&OY7f;Z!KF0co;dUStDeST6JP+:K
Zcj\lXon:`;kfFO"[;3;Mf<:1DEG3mN(opG`eA2$@>LJLa4%^jp9gjApceBkg@tV\n&iP:]A!
D*X7%m3rD7*-lrC1RFb#6D0,"Y8%;C[P6=quo\fsG1e@Tg$?a#^UX*OJ8?2/*r;,+nu]A,(pO
cZC(^8,!oIc&-NDp&BN$Q001_&c+SM!aF#*-#@--!pRL.:S_lI%k2E\Sjh`U@8D@%54H[duZ
0DOCYl<uS;kcd>eE4]A+^oiZ(0c-FnokXO2qUPjD^/gB(4fY9RApJ2C:=`.%d=i5YQS%fFkU\
g0kMW&3CVBPP^<N27/'PNHaVQGg;d>>DA*'9KQ1[?,<MCf2"-0&+XlF&"Rh=DF9Z1qgPe&J2
f@G!0M^_9Rlu-[n[c1ofXo!KBOOZ_ujm;tri"B)h).@]AAB'K`tos%tK;60,:ZtGh62AK)'3c
3M$qdRQV@oN2WXJBaG9h7oqCSi&_h2R*rebh!n$,PU'c0q2h6gLrSg#UX@TBZ]AgILYT;e&C_
HL_%+E:FX1ob;VA/G0P.'T@NKukI65h4(lqC6;F7ZF(P^5kC)a;hUQjf)*.H>"$PpOq3jAA%
0a;HjcX+X83q_E%dX5Z>=_2E?Ibl`8Z=]AckG=$'H>QQ]Ab]Af:$P?rI:N1s@9CQ%rI@<]AdOJTu
,3:[NbOn`1F379`A#Fl=)#rj<^ERBUV_pAW?FO1<edb3<G>\Z2uo^^7KA@biVAnCNk8IR@%0
\1i-G9qhUBBYQqoaecdO7MfhtIW+@U`t"9?42]A?UGq_I?WscR<VE3&7=2-S$s$G<9Z?1L$n7
krj.[O;3W7B\i*9]A*++iH)r/(W_H@/5=R=LVBagN79'\J4k:7HRs?>Ak\Vl-e9G"_d+DQ'V<
s6%1S/L0q=><N=?fbs[pXl,0n#OIsb=FCKhH0&?)s;_!Kn=ORDOr55qIWT"*+9pZ2sVB%!'%
s<*D=-@I3/G#7a29/"r_S%paQ@Er$@SaIUdNZ"bmF>3fV:k;ge+c>i(45pP`M<sC?^a+>(<.
>M;%3_D);^&,?Li=UZe_2NGMJ,8T33!]AEXLsNkhD`C:\`>45+sP/(YilAErWSfM3f4S]AgBj/
6J(D"k>j]A>c_8NO9@).Qf6X=,Ft]AS:d]A,R#s/1n\Nu>JUjR\C=(]AL<[C(\4YJ15&TP5heLrY
m;Qn59$lD':m>H'Q=H2.#/6n;bZ-Hosd26h-op2LCqT&ko@k]AATG#"QA,(006DT:DJ1Fe(NI
LDeW\TMSUpKW2"he+7XfiO89\=aBKuRm@bs%cNmUu,LtOE[\AFGP>e(*T)L(r@\'\s[I`<A^
1r\[_g<r[I)1Z./N,K36g*e$p`rjD9BAqC7V%j._6L[CQu'jPXE'(6pL!k\$oA.62!7j"0F'
B)76c2Mhe1QFmGA]A^6@O-urSZ'"rak_@n<h\g8dh^_V2Op=oiZA9E)s.A5pPslX-tsGkL34s
Wdi`J3jq3b=nO(>-D(7^au-Q(T=JUGZK(`Xe/uuC)gPS<V`S%>9Kkk%9rDO:\!X8PD"HUm::
gF:`K/#C;83!kUHW<So?DU)hsK]AY@g^l8Kt4HIk]Ah.3WY/"WKLt#DB+oZ9jBm1i)/G$OK]ADN
R9tf5M>9WWKIU\I$RC;9-:WTaJcSlVOS\+[J8BpPArl_$ug<L,<fJnKDrWcK(eo,n;7_BJq>
;FN<[PQR'<Ht=W`]AOd]A6-XB,L*`[pj^+tQT-Q:Uc$jH@]AMX-^DSh\[F%<h2O(4::@^E'nYCH
Y=MciuYFZK8^'Z`1\%NC*82L9nikHi.71#5gC&No6j[V;Yt`gBco&01T#a:0jR5d'B1(<4CZ
LiNuk)-K)9;FKD)!Ci&YLH`IrB?(a$Q^C]AcBAca#IhUMsRWq9EOM\PoA9?@(G\3bi2G,u?_*
n0HH/IE68hScT[qDr6?%tf"=P;6")fb#;ToW>UG56:'_&>!PA`Hqr1?OJanurpK#5_H^B$Y<
A$OeP?&kq^_Jje8bQ#"g7,penNpmbtR2OjnG,c_Co9lirKeu%e*7ZqndXPZ/F;E,X<c:+]A0r
d1$e:Ji0Kcrj=`FMA"3WpSGQka9ah!4U4_/_R_bZA*Ju@V@O9lg#!Q&"dHjMP*<m;tOu=[0M
&*B&U\LMS\L!Xu?JLTk<(?eXXEhd,`q<;b1s@Aq2i-/+[.u[gkGJ%bphn/<At;B14IID]AcLU
NO4*3md@>F3Ui[OG@s.Bc2I;DpA5_8\D7*PA]A>+=/@ZSK?9n+N#H1j]A!qmXc$e-*TjX86B("
2/OaL>6\*hmnHI[`nr&ks>&#Ob"Wb/c/sRmadO_bL".cEK-ASr"#aU>2GD\B15\`TcTDdpLR
W_]AcQ$X=-/i"j?Z-/;Y0.'BMn<1mG5l!`IY",+k0S'-p7B//=r3[0:/I'pu[Hq%..>V*\1@f
Y;MFK##Wbp^JiE]AuO8ubctnYP0Q2!D0VmV_A,_lTHc;PVS5g!_+2TK98AXqgLd\)-V-d)8@o
;1TNs>Ai=o>)gX1PID74%amn^8W[lQ[-[bRhVq;B.Lj2J0hrWoKAm;q!><'[7'XJQRjAop(M
IE'.f5I&@\m91bbML`;d$8HTr]ALfN*)&:#7L`bBF/n*?8?LX!%8[Q_c(fGDOVX!'lkHGV9Zg
nqi(YrgbdZSP9SN4NEQ;6m6cJ+>rFj.\0!J`2-a1cLPL"9+fKLhmBJf:9#aAQSb()3]Ad'Dp9
(l*]Afn0PDRlVhT_kI.iXP[%7ZoH^up:HZI4-8"[]A7RFLV*\5eV[6A,7P=^sb89T)2_i\YB#-
2!t&'9cZDA<VdDV9*mr<3>Y`%/oA9_B;/t&?6^;c)+uS3&-=3Jk$leh]A?97:+'=7o3NI+=cN
0W*Yi!YaO3EM!S+odk1h&TU0RHoPpI`b6jf\K+/Wa^/\HX>iEs0)l0qkfj4$-De/G1`k>Fs5
dMZE.l1-+FXI-48/HAf]A)%IIjY,A+.f?1lbPT$ri]AWsIMP.o=Rl72hF>Fo2LYST_IA@44aDf
8h,??<3S:;.%X$S3GlGUX#:g"Aju,gYCSJMbT)O\T*&3U0]A?@#,3NjrGY"Q.4QDa=S9e-Ii&
r^nY7"*pKVM6UK@'&VMud;hU"rB%h/EnR,U!O!hOB.l?3C89+mr#B&/nDBf%gELd4U?eI$Ue
l&<%3K1JrW<Mt0S*Ii$-X^jfX#E.B5I0r6_lI'nfGK(I$^%a$-A#b!hW6:i`ZLLK9b=Hd4Dc
j.8t$"PaO9OVG#'pt]A(_#BJ>7iNSBG#b37L+OS0Q[$h@_oYD$jX-)uSP(d,:1tC_E^K4XctL
9b-ICf"-X4l=SA!cMGG+nkCor'TPZY1Jo2&JAN=&[X-(F'`\M3JoETp$V0??!+\ue1et-g$B
l`ZX?2bfoN_A;Au[rDU9L<sZl1!L)kUR6;+HEV]A8g-&&On1W12P3KjVsB5CY$-$=+O6%dqQ[
Y&[Bh%@[W0&b,&?e-=Pq#_laV#qN*hs(D7&4XZA5!U]An3>NYj,71=1;4$:Na8iMTP*nH>F8>
%u:,Yt`.;f?ag,gq,"GSI>el1tEq_1RWG+N"VC9QOI)=OW9XBY7#BTEM=C@U-$;eK%V[!$Xk
G/raakkY_uWi<i6UBg.>HJ***r<5O>D;_[]AiQTN4._<dn'8c<ch<AidX9,uU65,]AHeA@!=\K
JI`[^\X1-RR62PCi/Ynb2KZ+:M;s:(07-a[I&H`=goCQd(P$\Yk]A,`!fU*siZDrag."fqf9;
=Rsl6m3]A",BE@K#A:`TOi$LF%ub-P&A,g1E9unW8p+Z%o5UUmktR_>IHO7<pGJT;2K0=YsXL
6;)j?OW/ZN")`Gmu*\e!',B1qjCc)Jcj9Z3]AJdAYs."4#o.!NOI)R,.Kl8m!m6PhF!,D'dn+
@9/p-?S,Kk;kIMaV7IbmL"!M.dVH/*0h[>OWru_)W"TtI?OM6qidSG%kY#T'lno15Y>XsHLO
J_4LtX(]A?,qc!a%!,6BqOC^+V*rdR]A1\D2P:lL+#Rp9s4+m8h#ONnT)DK7l-_OgC'D7PRr+.
OQ;:RqYWs:AV.W?RIq$4.*cGc's(FNb<rbm!')-ja3h9LJ7sQl$LcunoU!?,?t]A=u&V`n.me
EKjMt"Y"N8d#O8gQ_5SkUruL:r7Bd5MKPI7%=?NERk_`eL2SqV?9F#Rs?26B3WjHO$:-o]A`Q
7_ZE1>QZqa.e]AK]AS5q_-]AmRSL7DoU2]A`7$TZlAFWU==Lb!G//BHZ75/ep^7L)0+B,o;5J6kY
N6=f\GiP=&d'U&HC@C5m-e6^NU,%e$=>ooXqp*6q^9MV'--;QaDu,:LY^r!"</f#9dph8&qp
O@S(sE&aVh9/`k*PtIaaEiF>XT48JXZIpPVpQQ3-L@.aofW5#s*u\-/=08ZG,5jMifCkCfuj
ng"O"5h1tF2Wg#?XtQJ/!k.E'-A!['I">p#K?4c3)p)Q5&;M\Ym>.D<r8N=(eqD3_pEaV045
_t"`s[O.[$nCd%[_4!_6%'.lg>cm&muR99!`0V1,p;*rg$5cJ\jbH:9^m1>dupMiJ&jo)mE4
X_VnmC=Jo/2HN3am39JPmN'8R@>R`,;M%o?Q`aV1a=Zq,u>N+KQB^%I+r4GN?nOj[dW4NEt\
F;$!IQPh_s-F/&>iY:KS'_*o^qEo%$5I_\AsJ0[c$WWQdH@m="<t[(Jl:E4"KS0d700>o(PT
&\\oq>YNA[\9eAG]AN#)$GbiX0pr(6RJs&'0:WOEAkU(u8mF$1PE-kMDb;E`V86P]Akg+>_^fT
dU'3VUXcUc&cBi8K4TPU?5WUZIfT~
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
<HR F="0" T="2"/>
<FR/>
<HC F="0" T="3"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,1008000,1008000,1008000,1008000,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,3695700,0,5905500,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="3" s="0">
<O>
<![CDATA[部门]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="3" s="0">
<O>
<![CDATA[运营部分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="3" s="0">
<O>
<![CDATA[负责人]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" rs="3" s="0">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" cs="4" rs="2" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" rs="3" s="0">
<O>
<![CDATA[手机数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="6" s="0">
<O>
<![CDATA[二三销]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="0" rs="3" s="0">
<O>
<![CDATA[单机贡献]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="0" cs="5" s="0">
<O>
<![CDATA[品牌手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="0" cs="5" rs="2" s="0">
<O>
<![CDATA[五大产业]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="0" cs="2" rs="2" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" cs="2" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" cs="2" s="0">
<O>
<![CDATA[付费会员]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" rs="2" s="0">
<O>
<![CDATA[增值数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" rs="2" s="0">
<O>
<![CDATA[搭售配比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" rs="2" s="0">
<O>
<![CDATA[超旗舰]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" rs="2" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" rs="2" s="0">
<O>
<![CDATA[鸿蒙机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" rs="2" s="0">
<O>
<![CDATA[荣耀]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" rs="2" s="0">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="0">
<O>
<![CDATA[产品毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="0">
<O>
<![CDATA[业务毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="0">
<O>
<![CDATA[手工酬金]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="0">
<O>
<![CDATA[合计毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="2" s="0">
<O>
<![CDATA[PC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2" s="0">
<O>
<![CDATA[平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="0">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="2" s="0">
<O>
<![CDATA[穿戴]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="2" s="0">
<O>
<![CDATA[音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="2" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" rs="2" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="部门"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="运营部分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="负责人"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="销售毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="5" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="纯毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="6" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="酬金"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="7" r="3" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E4 + F4 + G4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="8" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="9" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="10" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="11" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="12" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员利润"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="13" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="14" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J4 + L4 + N4) / I4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="15" r="3" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H4 / I4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="16" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为FD"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="17" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="18" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="鸿蒙机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="荣耀"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="20" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="苹果数量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="21" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为PC"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="22" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为平板"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="23" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="data" columnName="智慧屏"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="24" r="3" s="1">
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="25" r="3" s="1">
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="26" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="27" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="3"/>
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
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[0]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand dir="0"/>
</C>
<C c="1" r="4" cs="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=B4 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="4" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="5" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="6" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="7" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E5 + F5 + G5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="8" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="9" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="10" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="11" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="12" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="13" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="14" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J5 + L5 + N5) / I5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="15" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H5 / I5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="16" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="17" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="18" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="19" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="20" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="21" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="22" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="23" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="24" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="25" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="26" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="27" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="0" r="5" cs="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=A4 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="4" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="5" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="6" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="7" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E6 + F6 + G6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="8" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="9" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="10" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="11" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="12" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="13" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="14" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J6 + L6 + N6) / I6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="15" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 / I6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="16" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="17" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="18" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="19" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="20" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="21" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="22" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="23" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="24" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="25" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="26" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="27" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="0" r="6" cs="4" s="0">
<O>
<![CDATA[总合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E7 + F7 + G7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="6" s="13">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J7 + L7 + N7) / I7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 / I7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="6" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
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
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657929"/>
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
<Background name="ColorBackground" color="-657929"/>
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
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
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
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-3355444"/>
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
<Background name="ColorBackground" color="-3355444"/>
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
<Background name="ColorBackground" color="-3355444"/>
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
<Background name="ColorBackground" color="-3355444"/>
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
<Background name="ColorBackground" color="-2823681"/>
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
<Background name="ColorBackground" color="-2823681"/>
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
<![CDATA[[(LTf;ct'<)aqLX(rW]A+U4X(u6pu>1NXDN_6-rK..S=UlH:_QJQ):2s2&%4,!]A$"e6<"La#_
XB&63miB5R[Z[#c-=Mc@#5S1Zu2fmm$)Un$Vn=f3=kkXVDr3g/nEc.Vo7g!5LD*T<\P!2Bi0
P%J?3e`)kZD(H2?p:Fa\\3cQ<*q^]A,<eI`<O3WnoJqY@SW7&T&M?\[d^[`o<m>2\;,G@!KLF
0.''PMc1e^7-#J@AV#mNk,(XE%',e-+G;mRPUYM1X/Qk_-qe/HR`jRnqKT^@[k#8L)`#F,OM
pUT..:J_Z1T<8^sYk]A5bnp9TBVm,/f:ngS`&*E?J]AY%4cdII<pf)A2",">R1s)h(+ktKQ):3
)8/1__F*?KX#,J@p$.1Z@piW8S)hU+O$\^ilU,PnLdrc/QgNUqX'UDmc1R/JApR"KQ^9l7\m
5$^\5$q<`!shVM>u1g%gPaR@RrH0L<K4N1,_FGha`OB`U*-9$N5I>>)rf*.(GgOYiWa4':QE
(]A6\8-Pp3`'F-J/d^V(B<okeY'r)3YZN@jT(&1jS"VXALbQnG]A*7)*\W6KBJV@?gia#V?1Op
I&-bT>4F0O]ArB(Z#jOqgAR=II75]A"NtSf`^$#IW,d1^bo3s&&N]A+4+\@Nu!-;O(&kpS[F)nk
i@]Aq@E!`ZnCWfa^Gl8QT%`F#O]Arjd$9t-ea99Q%2D(6#M.jFEaF'qCu++n*2'B[E[T>"@"ED
ZV*UO:k&,7S`/%J9!Q!\ZHJ+U>4lWF'gfd_/ne$"Q0s6/UhnELQq@GBc(5\q-3=n+PO$7s0:
j*XTE*Fn]A*&5bBH;'>g(rd_;m1@2MB^PsTb!@4/ku`u1/WICGJnf?.8RS:VXT#',qcQ@c7@J
o7S=0BI&/Kc,ng7c,C=!21fh!>:/7B$\NHU"X\Rd2*XQl6G?e4dfc7brRpX!ul8l0(&+[AtS
m=N/Q;2/J,rS3]AFJ_J(3PS2l\`0)I@e8n^cHf:eG9d:^c7589MtE*Fb$46!<I`Xi]Ar:h08KA
g'"+_oZP%VS[6_(!N<4%\J6*>P&H$/m1"Nn#o34g:tBQL%Ur)Z6=F;.Ndq(12T1p3ELNV)rI
i4[Wp!@*5.l]A),FVTD'b\-2"6]AJb#Pe+ZYrD9C1&;Y]A/1nosI;gLgb@#`qXT*HFgQUo:p.b#
UqHlhUF)!QrL]AdNT!g5F1[O,nBblR]As$r'H)]A90J49b!#*(0.!Rdq()!pQN^*7LIQ$u<,7p_
]A(4J1*_R_f*Q"N6Nn<^k>qh=Mt$OIs,9^0L@.'fi_o!dHK>Kp39$Xp.il+@#X&^ReMA]Am(Bo
K=EfLOb"1F<G$o3X*VqO*7,@7-+eobYK>#6Q_JoCk;V0WBNIP#NA3OjN[t>Eb??(KFkl8r7"
@=b-ejq%>Asua"U&so"h4s*^2af]AK0+#P'+IBeB>4:N1TfG\.rq8*(5I<SLETH>h,p5K;p3j
11BRbU/F+T#i=M3kWcuaG=,GU2pQ%SYm(ePANY\Q-R!eQHe]A7@f)N7#Yd)3RDT`"P5`1Ai*0
mNF#MdWcrk/1qNI+"4cQ!3l4K8bCAI:Zc",PpGMBMJl;RUog?hD!UoNrht!&"lI+[8*ia/E9
kXm9S!?75#4enTQWp`O-p\l.O>KupE>l1M?qDF#?Ia`-dZI5U\ZLE?QgNdj'A3qKZgIS]A74o
8$t_<:3WCiTGUicfCa(nU,`<Siba@'nXAJ8FaL.8(T%['#ON.lomCB[nT$FJHXt(%(lGr"(6
d?B"<^t,\9(7hr5AH7B]A+#Ji2,27)Q;m!="5sA`b1'"PbIN:D4=H-(5]Ahj<Za/i*NlUI<nc,
gccBlZD'ginWN#6rXd;Ofi69T[%2*_<I#W$0"Aj[[(Dj/5ci0;)/)mRTHicmj@g;1bS8?-W#
7Hc:fl9#8!\8h$XKd8p#5fK_gn*=\]AYj,.L-WolG!TV+`1"223[PjrA1Bi@P2g4&aTn@NoEI
@(kd^an+='ZW\9XiWHYDf6=egPk%=bi.@M'\VjaG'*mE,3]A/2"+Bn("*CCn/DkS..IHHdpp2
BFNsqHtcOd%:s$m/IjXhRf3%J(=Q\MKL>Ns$>Lh1kYpCEPifh"8B>`S/DHS\$&l"bfTmjL=I
XtE0*\Hj:%_t[RYCa?7;Hm!KOd=/,cN&c?=Pjmo#)Dh%pQq.=e(NO1"?SjP%@c;_U/be0S\l
pHP)r>JZgi:Os$[D.%2:k>j]AFN^d4@h)+4OmK`71pi#8RB$T-i==iuL23(BdTOY))'#m*"2^
CUOp\.aOd+P8"s&;GK^K<5`0MKjqIu7VC6^%Q-(.+SQ#E[>?dWeIQiYSd'!=cVd8Fb2/rZ=+
l0Athb7J!"Nh^r=t705?-i':SI"I$g(A"7a!4Xf$@Tm)Q!l1,Xr:VP$O-N"pog>.YK5C`H(0
P0OR<0\0)das$8Xt]A3*'hgES;&_VSB;W]Ae=nR@`IZPaI[f(RB/6alr[0O"Ni1[k\$*tf77%j
SK_%`AQi.fQ[l-Y,e4X=rbQi,M4^Q=2MK:LWf-Eu2>Z[ZU$<F4)NY:jZk.@O2>CN,fUYLq/2
Rsqh<f*DTFXE['JIWCum05!GY$p6Ib2dZ6taOMoKB0s<"@&=aBn$SK2E4[V7?c^sR7t-g1`K
?r;)n(X]Ah%a'!mkV"u0;nLiY<0<H.."1jI;7KJV\baaA#=Q2`e79o"<K]A?L<^5IW3e:.[bjJ
9+Vt^4bsD)mV,P!//1#?O8c]AP)&Vsf*DRM$]Af,tq&2+[4GGs*kn>2"$=M:KSDKR#Ffe#)DIW
;Ic8YC6Y1#uZ;p;`E%e,AgCiP(86<%o?>Obfh%K!^tVA47<p/_;oq3?o$O*#=VA@Hk:(-A]AR
]Ao;[28&"7lWY;AuZ<q0_nGh_cV*#tOW[M<:qf#CdOcV-%`n\*5!E>+AVJ*hA"dH^JO>B^'TC
k,_Hn(s]ALEkZG@l_AUsL4WbB^an<+^Oq[MPjo/$sq[iu!fZOh@mUZ[ubj;h6NCu2/q*4+p2P
pRLb+WPg$ZMK_h!9RT;:ic`;hXE9k-_j)FSq7QDkXB7jj9t"Q2WD`cVXjI[;hNP1LM*)YM&m
QRjOhD$05^$-S*TJ$uU\pkKm*6fd$K#gUn%YUuUo]AQ_KfAi4qc37O/3nf_Ij3Ij@m,14W$<n
V;f<+WE?k=q7bK#oc<<-k@K,'N%qIe.A\FU>Q<.X'g+f#LP)KeLBMMo?.j_bje;GABV+BI43
2ja%sq%P/3]AkA*=>75m1q9FQ\=jmte=rGH->J^gd/:d9!RdG>C@oFJnRZce'UJe'!gOWc!s#
nh#dqHpnn>FtZcMO&C6phrMXURL44)E&lB7#h.kJ%7Agbfa7p!7EbCJ2Ff:;A7aI0c/V-F)G
3h0)a%10@^9C&rCZ$)$N!<C=tD!%J&/l*U`;HCX.krUfB5//-_>-2Up8RQs2OA&q<"G&9I4(
QnY/-G<j[N5PupK\X<9K%+qLtb_&U;=7u[7[]Ah`qH;Bjb4gr:_\Wd+leI#_<kAm4+P.puHA>
UPipf.Hj`;SA(WWK$PC($NYL!>R9Sm$,>8#'e%bCNP+48sAHQLu.[eTblAQDJJ(V^uNZ]A^87
h*&<V@UpbIW]Am\[1Gm&g=8CJe%F[`?A\J8&c#XRpVerVT5IATXEp>DEfhL6mKP8D3?H<04a'
TVdJhr'J%CkufB4)gtHUJ.5_0bXm4L[93[g\LhH#.4noOq3Bn[Yh\_K:)oUP,BT"&HG45_AY
75\*.(t%jqBOd<SG5a7L<GRd,G\ZXU0^/p]A:_f/Zd;H!0!f?qI;inFo97*XS5<q3%a?HJ`s_
Jf/s2c5!T4_N2Jf^_[UqLb8U_/3-hV_#Aa8(GNCGs\K&lHq9=ZWjq4ltZM!\oJOH]A&0-CC/9
/LC!5AJb:gQhu`7&^:_2/W34&j?:EiVb#p52AlUW+6hRm_5M*$aBE1\^D&IJnO%4N#dRUg<r
>g0ZS/_&@E]AW^t;^Vj;tRoE+:)8<jBRuh<(m'=VuH]Aau6ZZrR81>mY'4fYE-nh"&N#IiS(:!
FG`g;P*dJ:T#6"t1I:2I,fR%&KkXJM7@iEGT#cDh0b$%q1nP3'7XqbcREsll#N+,,gITuCR#
D@/(?K<YB*lBJpk_'9<MY!$+j,&"KjuRsN?O6r>;&%RW0,`#`&.t]A8AYAPF&Tu9P(iG:c,-X
oi)E,q8PJ^<Pd5jNptS29<r^c'!Bfh87Z![=1g16>b7[(Z<"FQDh]AMHlPo(X9$"^E@2So_17
DjO%MbQ4*I0"qDY!D,4'\5Za@a#Okf<@1AnQTC]A>D]A?O:Pcna]AF0K>B;V-i/*(i7f7AXN#fl
aZF1=!=l]A$luHfDnJe=u!XmbN_up137kN<?BbB2msf3jo%>,dD18i8;&67@&8$MQCrTZo<Yn
k0U+:5rbEP!P+@L[B-ig7g\jQMM$qc+MkjHLLjq4V?J)>02;]AUW)56hoEFH)Tq(POqBd(5NL
;]A)P1a&u5DQ7FS]ARW4:VC1N1SD?8VbL$DA8pu0&+dl=VrkduT-u1VlU>m0jhVZ"NOG?=$\:h
*"7phZ3L8Epf/i*s92q)]Ag`XNXm2dT+/DuDeb-"s4AK?dFLqVjm]AcE^(ig)61^<#j7T-dE>H
Q6Cf!`4M#O*;2`;,O!fkGGuJCHs[A8qpr^QZ5A9jtriV.Dj2*lR[IUKeA[sm=.8,H2$S[5f$
CA%jNfZM?89ulG4-sGfT3uVG>hLCND4O`9a&`D2^\-C!U/]AV)c=)!5q\4Pk9=Pe9CA38.uor
eSLsu"<RG>bmlAn,j$.2"Yi>gZ?oaG&P*ahgc1oD:TK:O1f$W^Z7X[3bmnTU2g-3Io$#SX%-
?eTbb&ul6g8`EeCog&4FdNgI25."Pf4rc6JN3HP]A[SW?/&+Oc;=R2>p>YtZhDbR=,Lta4UhW
d9%aDUG1Z.sfUHTt*#f2`'@AmjHQb,:;BtY<db<JgI?/"s5?aN6;)4h($>@L<M+&$Kp2[^DD
<kcmP6MP?"WD(Vl4K!\D*&DS!t+)?AJZh=K=`Y$U@S,O=M1(KJ=P1rOup34Os!2DmAZGqC;6
$XrlsW_GE+=RouYLboTH5A,SQ$dVB.PFFN0*e@O`_)T<,`)]A`@#k;gOJTW`CZc/PH6;`&1gY
FPGo\4GGV<1s/=YT/@!ZbH2O0M2;4NKMc.>:]A<@hGDr/jZ19Jm#fIeR#!HMe[q^*[V4;fN$"
N*"OYS]AufW8bH=HmZr*N2@jYX,+3Ng5#)qZ;Lq]AtpPQh:[JdYD5=QDc!<"NicOmF@7edf+[W
.&"(^CGC0_f#2JZ+]AJl=m=i!XMMP4sSGUffB?XLi$i.ul^\CG=`Ob[OFQ%jM:>jV>EY/7K'd
HteR=_Dl"O@CVr_8.2p'I@pccH@EGKFW?K<7E)h(J/`*ZK5L(dsFGBBC!^Nde(mQ[",i1)Mp
a,[XSti',p,*A_+^*dt.0Ad?J5V0$=B60ne>lmb+.\hd9i[.pT+no*]A0!.JLHs,QWk.c"ja]A
mL;LlFN!a$9AnRdHA0J'a`t+"@'`%pGCF"BF14Wd8R<1:bI"uS9G;2\21;:8[@t+jej\:pU]A
-?V?`ic1=$Pf91japPD]A'%D/s+#%+19Wc(^s95R4#Kn$bMa3',Y0A^,"3MLgAWKiGh=Ncsu[
:pEcmCr3Id]AAE(=\nm+uD<n)/?a:iPRE)i;\fer0hbN_9;d*\\64mnOKWr6/&7t3maLGgh^T
k[EaW]AN5GmCB"H?Oc"=)XMEt<7Y]AR4mNV-CB)[NrX8[`3^Bph\sZ>LnM;1-GKSRec5UtOL@S
gkol"]A7@6'+3&Qp/]A:bQ1u_k4rOYPLtm`t<;)bM)`ScU3ZC-P:GAC)PM^:k',&k4Cl$jKnQ4
n4o)Ed?o<VYT$B6CmSd]AaAT-u*nTMSAJ5(!Q)oigfGe+(@XgUm@]AFW"<lO9eXD1,IE96POSu
k.El8gF)='qis)]A;J<[^/Fm!6=bo>9?H6rM,'n]ApmkBRQ<$4SebG=Wag[;U7ud&ol`]ArCN2\
6Qc8r:a#B6=nd8SLXfBH_#gDaP%Chsc[9T<uSSU#9.Rh^GT-=/H\GkU'Nc[,22hJNil!mL0D
FB*b9cNa,PCO/J26L.Zma!4FU;P;GS[.O1l8aS2(cP?A%GXL9SKMra[uQ(U3*FPomW]AMP9[9
.T_Gs2:^k5ZM:s^n9;cPLS339,XD>g(JkrW_9OZ.r>mAWr:f@_iFEkfso>GT3uCmu;EI]AgQl
HPX8cV*46I1='q^%(U"41mFuO@:lVTS:"&:KGchG:1b]AiKHkqBlWc/(cJpoIh&lTCStFiGX\
YFR"mS+W%tZeN>&>U[rked2;pD"uN!).^PUV8p2s>[&4nZEe9eniX.%o[`;V!#hk)@*?\a`t
/%='d#%Kg=b[YfouqW4cmjST9k.s[Ji1dMnoT7l6[`'*^GaSFfC4kegRLX^+_/MhC[ZBLR0!
g`*I^C!9pV,E!:c.U)/Mtfs0;I*)[bgDpuII1VIJ!Qk*E"Ioe'[k(Pdhsii2<]ApFj%\D7;]A/
sa=;hpl.\;*78*Vf5.;jm+_sMij\D<bc?S4_es09AGp.u9FVq8R_c7mc]An3Om@I/_(&MtWW3
J1kQX83kZB<TK]A&=Zj3D!!$,eISd7$lgho%hMqR279]AiW$K?0f".2n?06;'FWpN**5M@FIL<
HWi(+^u)=)Q,uOg9sQ)bK]A*M.0F0Q>_(K?bf5Ak^3qj!>XoFWB)&L[Bk'U`4_?,?Yd%7lU_1
XZtUt)RNfa(UX;*q'p#"j+1J62.+`_O6>r*MTl&KK^eTmCB\OSJUL:h-!!."KKPQc-=%lk;<
DR^m"7!X%YIlmL0cLFiMbf;)&=.DK.IkeX[Lkmp='>c:Tk^/$jpPs$)g:Iolq7K*<Q'*rk^>
CR.u_^3kT'K#=oFsm^fB"K?5`ZR$`X$Tjk_*>:cEl;n9a?i09>j$8J*<-ec4utDO*=?Rd::'
UQV^$Fr*Yn[uBpEeM));C37a`MC;^`X3-E)=cIH_(u[IHT8LS-&7K9QmZ:Fs-gKjWS=RbXfo
eKX,6<FO:=4Va[gL/VGkd6Z5Re":cbi\S,bg="#h;MqK6&*sc:l\>\8#d$^T,6uk-L$U.P,M
joo06c8"OM55+QKP<l.kDeqJJp7<hGl+o(h\CW,Bh=M5^95OY#FQWcP6Pktj)5Gd(6OVb@JR
X!J?8XJm%;D9bW7W-NMB_r.t4&ZSLc,F=@:4D0->#KRCLh\=7c-$^CVc'sZ@B+Hl?*I]As%G]A
RsKe!pX[d,-N.o;OE)RcbK,XLr4U/Vme>.@Ou.nf^uq\p:Ug`D*U%o]AQ"C>OnI-RQ1U"=>be
%-$&Lm<*eq@#O>g*bO4N\f\lhpTl7i`q#&bj/Jl-o$TuB3PBr'CsTdBg-jpWcJ0+\M'IcgVh
9f3VcijR&32sPNkGU*J-o';Vgo>N:?1IA]A`?@'-odL8,\<F""h;9^_!/E!3r=?C!YA!@(MX`
IbT0>Q)J[Spq/%h<$'<JOOJU2n:8Ds-nCJdD9lAeb?f/o`LN%.HrS6Q(Me_Qu2/:iWD<i.r7
%M&3X@[[uamnck`71LXJa0j?(r\X>,tllHh/o8kMmbmm!^0*9O^Z&#7,(1tKVhTd!a^Ft"Qm
D@?]AeCqoNCj-]Ahh'&S"\/Q=\+heEegjQE?BXii.VZB1c3+<=r)\4_Ib=H\W1S0obN>e>5";]A
=t_tN?Yhp=pp?f.d'+b\fQ"C,<1WdgYjGo4ckg1'P%dUUa'ES&>9.OI-pI;ADP8(m)Z\+"TQ
!U3J4S'kr\3]AfF8u@pL]AYUFODhLsmO3_"C\1.b[N41:0kqJX'udctSKZ*(eX-s_L7;=$nO&,
j]Aoo.-J3=WiQi\!XML6S"a_]APiDqe$G@f1\%Wb@=iNqMLFn"fWA"jXp)5\f+#g?D15gB>2FJ
$SfB"F,8_F0<>8Xl&]A_(6gRc)kD`aOlWos<Khpt57%VnD3(%Z^l6<(U7Ebh$(oCM\6-YG$;Y
,r'i)F-=O)8)XD)9*h[(U^/SnS$K0_\BJN-gRL7lIi\eM;D^WQ5,MMP(i(e27#8uL9$40*W]A
rAE%9OLL^Ch@X,0q.Df8X8]Adr;W%7EM`(ANj8<g/BD1L"`aAAeDU.ICk1ZcL>k2>c8%eo"PD
72NiV]AUDQg^UF!1/CFDeMt)&)!R/RRBh_hF[kuj<14pm_pliq9[';:5#ZY#utf_Pd0u]A,FYe
-0<\d^bHogF_EVVLl<[:lcE=Y`/jkeGM0n94XM\Eon$N8c[>Kl!U#R&.l;-6pj_9bs.**pI!
#-RO8_hf']A0-:;jpZNO/ZLbG.dtMcOMVeQ"K[OOg(;pXU,r?/HEd[h9QA>-]AM;1aC;<F-%!Z
``je[&=/TCe<0X9q:*.RJRUk)brAf&O(USU$9SFa<jH'#aC&>j.'#0^;EHsb9+:PSlJJ9US:
JdPT*NOGR.?=?quD.1UoB:V['HWEq&^^d]A)K=BB+iSb4O:5UO,!Mu\In#N(JpI6?/O:uiee+
I]A<0%ZZG:nB6+^Z(V@U6R-VM-"9Xg?1D&:TIPXmd?Z_*3)/n[RRQK#`idcm\a25[a&ZQjn^%
UjSC(g&,QL*N6Hl:_KmI3,-V$OC(*ga7P'18Iqg[`)$+uW%`M;."Tl_5fK!`QQm5YFk%<:jP
AfJ^]Apr:sD\_=am<V,iGEj&G(@*.:CrHnUkI+B1En-FPh*$LAU(Gp2&;TL!U37RV$tV3aec0
_(-r\prD:ab_qaYCn/seBGNqK'4DXa0qboa]Au(&EBpml3MRkfQQ=CuKVlLcMLHLeYpi6*Ng_
1[e9UnM+[5K["ea7]A8?a7<<I-lud+p&rc*l393K4=#>CbfJAmU\a*D'f#UsrO`"OEgh=+2OT
E/'2:X'HrU[MrG^V_>Fo_+Rs1&@.s*Z'fhgR\kX"oad*cgq'H/Hap=a4_[Xg;K2(8gJ+C[$5
A5(uS8HJQ1mA,,mhIYHdBXXC6Z,<=iRn29<7qt)m88/(A*E8*[7BR]AB;XHlri+%LhXHLEnIS
=+2C"/>hJ0Ra9\k%Sg[J$$X%?[U!<>\OU>1)t7@M;kC;C3LAB"@o?*<qA8"h*7;)fB0FTB6$
iLLV2&*b%r#9\e$6HRBi+U*TH1HR!HNk]A.=/C)&17Xbmt?]A.#oIep??`3Nf8mljTo0iKZSgV
>YGTYQ?.mQ&["I="&Fh>Ec6s-.VqP[\^(4#7(Cr"Lqh[-c!+H?Ao"kC;oAs(.!'_,!9Q^B!K
)A"q=t2t:kDorb2dG27-#*^^?=48WFI;eU_gpR@MAt`/Y#X3pd5=)0;NF=]AbM_D]ATSjLQ!cG
g=D:b+#clo%)@S>=$jWm#NT4oF)&Vmfqfm*Y"hRdfP9&7KFG[<P(Np0'e((<JoHI>RGYJWcQ
D#BmN3W1^0Xk67l%AaEnT2Ucn@kJjJWjbr?B=b&?FY5JW(h'>]AYJ"#G`^i.mIU:@H630kg,(
(ue73\BcGPk<aOaFG179<2C:4bi>!^:W=aSX9!/f3_YVLLp6L,$M>;,rr=<W_&eK?5!%/RJE
Y?`AfP+q/^5t6APDbKlcYkMZ*$>Wcd(Wh-;Rs6`)"CNM!D4tc63/2>Wk#(2-NgV&:"*kAnf5
OW%Od&PN7pqR7Au1`o#N\:^Uh:T\S2nbG3seTL,aKg74/1RQ4[ElN?LD$4HY*,ta(?h-Br,1
9EO*:XpIX1*ATP7<G]Am$^*0V[[LaI!;EQE2q9IEAd3*V)D;g,jo'q:oqp[D]A'JR5E5N`N_BK
im:u49WUuTuQOmZWC`Oq[nYC/%Z_&.N7\-)=Eoc\2JUVNZ7IJD)+a3$fgmG+]A%16[.GX.,*.
KFc>>UZ@mP^Y$T-p=F]A<k"6Ra$e2sV*'*iJH3@i<Kg\2Z]Au0DG'4nLOQ%JK&grL_auM^nc>Y
42eYD7rm-Qf0Ch]A)E*'+c'^j]AJg4C#EeZ"2L*A&9@5<O9G`W6SbMnJ$GHsk9D.@3)9#3h,mO
lqtFuSdT215:94Zl.DBbc&Gg*P<*R6E6&$7hFO1c#H\<*hb=qGfX>Tp(6A2#Nfb?9:dNRfJr
&mj/^!)<GBW96?.%*L;h>hY@=k?GhbqI=B_W3DWQXI&A/e_$DFqaaOiNX'u,(?#HJ\>^8;V!
J1nZiQTfPh>K6[SgC+INlt=Z:H@]A\M+$hb9GV/+M$9[dR.S<OgBO&+:VKp%![YN&5FU/ARcM
]Agi)XNc(WPp-ja*cN7gOj`]A.#5Olj=UH(W"VLm@M;/\V#f;1G'>[DSbOpVFDM`^V!]Ahj#]AR!
ON0L*U&&8[_bm`Y?DrjA1;=l3196m1Vq0ojSsZci"?B)8k"E,;1j$Mj2Ti(R@Ftq4<U^U<nt
%rYWApn7]AkSZ>1VMPOm'L?e4]AM)D@+l/Q/KO]AYQU2c=VZ'Huf.3U^HFbDeh0i5/Yft\rJh[b
?Gmsu7S^0/@da>]AZ<u\=PIT85e<R61[@2Q2\(LYFE?Y0h]A+Tiq!bkRCIb%>upi69N*39^FUn
:c>,\\KhMk4tl!-fM=L9*<dij,:+n0d@EL"LU7tV20_kj(9,C]AO=<1cim?cB-g1j+;c+$s#h
#!W'm5N#clXlRmE(Fn]A!E86CMCekNa_fWL%&kOT`_68U+PY2&WVUh//t9[*NH%\RB>_K''_s
Jg7G$=l2^Sl(:7`o8X3fZYZ_2&?auV%3cp'`h\e2]A[XPN!T4:[j\GeN&=5@F(ZR.3DRm(Jl9
Ip=A7BNbWn1[c9sn3!q$;D"gMet:3n<Bci:YUA)GP.'$0"gDTl#cRih8S=Z@^Kb&\^NVhH?t
jo,Tf7ij#Dt>CEAlfLFWAn.BVu.PPcu<$*K-+WaXN*1"-bJk4+F]AdHue`INX)3:H]A&p7?pR+
,J]A[7-JZb:E9gKC09U-3^G777C<*@D#_tb?_S?(cUjGhJh0O%#GrE"NUHmre'"&-oA4`7@(h
*Ak1IVTZA.:aXA)th?Tuf-bc=f6(A$^YEJlfY%pES=Jqb^\q&$n\-PDe*]An8)sOr2?t`7Npp
L2))RMm?BH(]AZ^M@1b$KkBAuMk0'<_<12F4?!B;TOB>bJH5!PFpF4.7Vh5A%h^,QmqT.i9E)
\U^FCK>0aYOtp5$R'eN$s%]A\hO[F(DZ[4+[,qRi(qtdD;c2;+H1H*H=+KUZ8s-jK_iF9Gd!k
V'&XB"2ehcV?Ae0?Z&!ubMu2\_2$Mpknsr/Hd]AV!2A2RlN0C,R@\u+R,jK,:JVL[UeU!BngM
n0c:8,2u'Tb#RHUDR2+2FMVF=WWI:on&M<Y!/F[1o^qc$en4^*1NbH^tnjpIJ'>/3Bh3qi,J
=Y*c`<+!FNRWj3Mm2h:?PNTeNR;F&r]AYPoYe="MS$J56S8V2u*)B^'?"QIiS+3#n_8.9C2"_
K5`hh)2OaG1s+rBlY9VJ9US\d?^PoH:B;ZR01H\UdK'e5hLeqA'&?Z>D56Jaq"=?V'd53ij?
oCQ!Ql%kFH*?p:ohIYaEI2]A+)F1[><B\Q0s)#'#p9uJF"o:BRPX&!qcB^2*uio_L74?e_:Yh
dJ`%`D?&74OUJ7mBUr$#Z?")npoP70,&2k(4]ADosKY8qP%:`s*F=`8p?In58;l\%<&TB"K*b
knc"qiHbnLfSaZ+,ogfH7..iD=>m=O%hi7Cei3(W3=?pb/T5KJe*\3LA+u<A.*'1%UZ.JM9]A
9"l!l<B1]A&QAV!GS!(CEh"[)[p$aJ5;7="'9XMs?iLcP:A*`%(/:1<VCK?BC=Q=<>#Q;Voa1
'3,hp]AfOHN-L#e[cFctrkM[`SVqj:0Suep1es7nTqQ.d("h]AVNMeROXmm[dc6TYtDc"anSXq
#p=oK?8ZJ8b>N,GcNr3</%X?9MX?I@IKSi'p]AMQX4AnR\0sn9;cbKmoXf<Fq:`)L,,"qk^J?
4IDZW\G!gg6Z"KMXWaJG-dK`a6"h`Tjc>(97o:5O)cO/gcPO28$5;UMAbV\,2U-I#X6]ARtP#
OWt"SH6b&C$B?ZT&Qu+7UtJe-h2$]Ap7rE1O^Cl^m?c2?1<R=B(A>\<CcQQaCI$1i/M_MsC]AZ
g]ArD[h_0El)fQCAV@QS:3L:^Op$8i/9PisGV'IGF%`HB6F3B$Sjb(>#LS_EL'd-ih;9&C-2L
p-lInE+gCR-8TD:JLoiN*dIR04DJJLhX3/a_V<=\h.LE5nHVr.A)8$;!'hQd\#J>%/Gsf`5N
'q:Vp+SZ1.J*%Uc0@Lq;=Hl3D?dTc?.9.DmS?GD.5a",$j1_rU_CP&1>6l`bgO2&Qno6c?Lb
S7o\`X.sRZh5\>m-BRZZQc;#/TK>lQi@=Zaff.]AHmWh[<sbI7;.o-E35^^'B!7_omNZ]A.U<S
Yu%E9>c1]A[+h\)lr?0]AP=tb<$,lh)"LcU<4$gUV;"'L[Ni]A?ic*!T1S&EOj?^6@qFu%Fog/'
P)/]Ab@\nqHgpcpB_:Ygn1lh0d9t8'^LYS9^r7B2OHXAE]Ag6o/<=hJ-q<QhN;YnHZpg8^gnn:
]A*oE&P"4bPRD#5!V.aIYCSHG_aE"!8pk.m%rnQIt'd75\RE`_E'7'B-q'97Wi6=[r9;%JW-;
A`m8=I,9O,E>+07#bef]AjgJM>]AH![>AhEMKH/njM*rJ>pa7G"C3*j?HJQ+>pqS73]A-WKpg2<
L'At.ukAS@p54=3^<)%cgKC@3uE3c@Nbot9_,P<"_gDBi`fN&o0]A;$G/X#o3d$4;meXGehrR
_$6CEeSBg?kVO6kooZ.;Ml$H3^j?'3MWEpJ?SQX3bP>?4U4KA,*:K^cIV@SW&,.V6T7&.ZGg
)(opts*EO6hNdo+ampuJ\5?04!(B6Q#91OJCE)qZC30MWET63k6l16$o`$_E-oKU:T^4RP<R
ml.+n]ALC2%g5u"U4E`9U>O5+t2ZFGd<Vs8_=!so[PQ(F#;NE>i.SBb*nQ4W,T5.6A=u]AYRD!
*J"dZl)$7W#Y3ECC@mW+KIVo8JZ[-(P9'4&$-_kI!Z#MubAZ-PlKg,1EZ1p;^%]A^Y=P:cJJ9
WYJ-h[mfeb&>LbW2>L:/%"]AdWJj3fRWr9JX_$c?2Vb9cNXA85jJLsY,Q_?'0icMDP)KC/^'_
JV[)e+9JbM^<J2:DFk6cOq73dO8Q.(U3fomj;N_Y8'$51I=&mX'Nr6N1RX#*T2Mj;R1<hh#$
B52UO[Ier`,:;`C68C_sau!f7S4`M6k\/%'f#43S*mUm[O.I=ACE?e6L.[3,na7YiWo-DiB9
8,Zsiq-;/mWb,5q5[a4#VLfJFZ[ms[)V(9o:.;2S:j/%\0ioK#?3#/9K-7FuhXBTrgT9[U3,
e`*rnL96WlhT[IQW-%XnLp"_Mq*ilH1[6"[aPDH6Fg5ht\5q5:VlCWsS!/,k]Af]AA_C[int1Z
V]A;tOhe7kpriWi;i/PM73S).MaoMQLd'Q3V)7!B!__j8Ol^4^/gk@8914[Tq(c<C\n8GfdI;
<@pa[f0,t`Ja1/:TYPm62([eia#Wuhdf8nf:\#$5"tP"6V7qt!e'VjEW5&iWT![:4gKZEa.@
-$r;_\O%?XD:6T$UR[?Z+-hR1qqZtE"kZR.7PZcboGUY_@GTmSl#cd1/7RcT^3LF4A*N4]A"=
R.GG[P67KtF?Ct$gdTna5+SGXEmN$_3QJ616!hLG1=WK!bE.p\EpW'E5n]AjS'Jlpk/SuIu:8
GgG8!58dJ/&XE,Ff\,HPYf5%SCqF)XeZW8@d_KEq=mp'0?87fI#mhTWVS,)jp@6559,!1,Ia
_,p$CS;'N8D"\fBNO8H4g([5k<)."]A`PGs/U:1_cpdJ4*?*ij7[V6`)b5@Aac4n(UYB"c*0W
'!g3q'_`eF^M`U+kXGuBJYPA4H=$fg+HUJI;%+jI[bg36u+N'C3>1EB2u2=r[IFb]AK)LQMIq
)GZ$u1^aVmNHRDEp&?#@Ou>.3FHW!g6%ot]AXE#!=^8<qLsPCWq.hEgnlM,WB^e1YC[Zkja%'
E$[!LFh*+__=2$;_G)Ue""*70Z3diVis)A&3\Q+b#6>:@VS#]A&[M<[Wd<sN1d9#t-N*b@099
h:fc4fDSDoiE0c;a]A`@8.>@f//#'><6OPSB0]A<0fi?]A4;d>*8KGmumq^mqV`(`kgJ8*u%@ga
f&,RS1/qoq5?(]APE[&EW\87KEaQEN]A6W#Aj"WdTUsSI0EM/C!$R$'Z8m=fQ)OjSGG(q"os03
<g/MY`h0`a^=%/At9tTb"4+th101#0uQFfgo*3d5)(cSTRZOK[JCf2&c7>ahLMmLnEJZRkQ"
FY95h^*aTkE9WKFKLWfJp%iNsTYVSA21bpuBpGe`,GjD;GMfu'u<4e/qhh;,`3$8>p/o(N8h
8,(dBrOr't>h?]A4F5DS7/Pkj.WbIiWQT_L*luhs-RC/qV1:)Ab9;c]A-MGP>$;&4UG'?C&V&Y
s]AmA@"KV!PV'CN;I+;WXr\Aq/ucc(n^jClIsF@eQJq/g$[ZE)p+LFK8),fSX>B>MF^!0FApl
Uchs+t<ViW3c7ta6#$MaUj.&:ggl<_1oL$]A%I_TTgI^d6)acCfF+-@KAjcKKe07^C'iO]A0pG
m/7um()=eWpT8,O5gKf26NOhkF;S8m=e/S3pX.9f=;Vbr1B=1T]A^lO]A)B1fSo\@k<%uY/_U=
)=Zh-Z-^jU)M^]A(:8&^R9Z2t-Fr4)`2[n"(dFnT7\1Y7H:U^u:g'$4[?Ic#OKWNG+:X&*"%S
+:'"5]ASk4>mHWfK<u-L31rk:h;td[/B4s+?-p+CB`9.@QLr`87ZR@KfX(cZY(uHu:IPct3$R
.D;L^4QUq?Ps2oCdt*C9Z#Q;/a**gq+S=E$]AgAOne3t2O;h4o_D]AI:^%,n$H;)pn,_`V(FT=
U*61V0g2ZG]A55!KnQ#a,FBc^n54_LMa`pM-82?i\nbn]ARp)hH,amfgoUK&^hu"]A`jB]A?_h"#
XR%?H(MD[!$Cl$NmSPbn=[r$4k)O7/cL)=0W(oilEK:%4Y'WpZUa\"DmY]A]A7`5g<Vu@R1B^X
>K_1jrWp3`JfWFtF\n8Wp3Vl+Rtp(ik&jnN'b6l7q)$Sf+N:S$_t=n64]A3u\*1Tr`WrcU;.0
Q-tJ]AOU1:LX..QHs"n-qX#5qPlQD+H`ate_0HBB.jU0r\["*7Yq5'scN).9JT[.U:?GRj`HD
Za#n"LZd/(aD&*.hbmDKCd!6!u!1WZJIjAgK%!U-Jt`EK8+"'(cQ@ZM%`P8fd%J8h]AuBJo,b
r4EVa1G&UD;ebrY%or4@3TJ`-$;0J*Gi5G*l8,1gJ]Ag9/k?7ek!4Spb7FZaCn63=5%]A#taPk
)R.'6!dXD?/MocIJcj_G,eprW8NZIUut]AZS14Tc@EHO3R^D)l_u8Dl[!+nq*Mh-_lEf?B@jK
Rqm=(LAUecY&,g/W%+Z]A?+Qs\*O^aTBdaBq'Q*8`YRQng;5fsJ^*g[_7`\RXWRcB#)U5s0qS
Lsa3Rd`^U@!CMkBO:-aj:U1HSX9sGe9_<GT_a/<4DD!PuSg/U0OZ(1H:\J+08LeX[Ip#qs;L
M\g-<>;t74RT5H=:h]AkA``,XJIW[2e-t.X>DV,6S7qsLlnA8n46;(h$TOY,#aG#h8;)_@eGh
4hC)s&2@UPi8`#0T^6c4$!Q*F=luOid='C+)37;QN9CL-,#REMVDq/CQ1ChE9"^^uP*u.-c;
b#q4'-5t"$7ut!EcCYg6Y%+*;UhJV7'n0if=@"`7\E9EacWnP3fJo?<0B+10o\BV(b)ad7P2
XSA[><Trjcj'dd/4gW,$Eu(>\l>G)gSVd53,9WGsdt!*^B`$pp&8#&X:p+48muPK'Se\8]AD'
:mTX?I*^pb[:`4Ca%R>a`&G%6gL/p"P#GM`&GBB-I;\!T>$'+F(o:!eH/eLmkuk;b4UhsaYj
inA/#T18g?/.q\X5GgEN%Dk>V2t+S./b@1HX7EhQ%c:MSO,ENc*L7-0[G5adGQC3';4rU,;`
*([_7H$8e=^%hqI92*t:-8fXQnp9c#m5hQmnbp]AbUl<SrtK0jIe[(pj,^).M(i9(AsB[R[$W
k'?;ar7an8k6e9rU+0%68Jrql1Mj)I;u%hiAof5\#l;9gNF7]AGC.JMXR:CUeWM=s4`jSB-EW
QEFDJoje!26Tgij>hgLQVSLcFWZ.]A$_N:DhtrFnhXUGWGQ^HGNQ7.tmo]ANIZ:N=i3eaQF4\Q
(&O*Er;h<#ANY^WB-JYGGalqlF/V!63OKr9,9s%^)^7o,IF3!;1;0,r9ZsW,X'X`aT%^Ug(:
1ek`]A-#-NfI_gb65KM>?/isT+*4RU,(2JSDFXEh=5-/H$A9ha,E)<k8@Il>E=iO2Tr)%mO_9
\'"T[7d+oZ-_7&q9"85^@*p:B;2=4aoT-rJ01T]ACb6R:#nK:1&,-M%VgZT9_F9r9dmgX&c6b
1@)VRiqjQT,Sr.A0#!G]AB^L[!1Eh+;Ve*Lb#XNZ4R8.'6hm-tmnbXN(P4AE6hd@jL?<+>:eg
F]A7ItgdqJ!iN"'\#L%-<i\KNr%>@eF_ne#!\C<dYI8\6L-<I4b\_>lR71Klb4t%ADjr:@M`F
Y8?r3OK7(nkLiLSNXr!dA3k_8"['sl)#GG7IP&e5TsF1j9(ZW?g6?!5I2f3R5l,!rILrfr,s
^",'()ZZB5V%\(Ougeo,f>m"[(:Cmo$SP@`^KE\<a_+5&;7D=-cDoeiW0[SDPeU0B4jLpp?c
Dbk9a3E<8;Dn\L^U[mqR"847GYHC;u>2A_)k1e6+i$1tOIP5m7sjM%>I(Gr9YadGepSe9Sa(
=(;IKVH"c<SINW0pSC"d*1-t&9*Agbkl1J'iCTi[.O9Ff,tfnm6=M=n>>BrUn'2il.No>.>+
3g]Aj()2>=aAqn=YNLRJkaH=Cr"03;upEMj*9_/XW93f;R_Op[Ht>DoS\X#`b+?[tf*QX!1&/
:F`JZ_3EC(eN$$Amp%ThI?"/9#k`ctAXiQXkg#8mGc6VP]AHWUdN%r]AuX-U&NRUN?)\cMk#$Y
#<Z+5d&Tg&KXQimTAqa[;VmHAmIAT5&.JLo'aNM2tR.Eu-9Ja6tQ2Ea#rKIfQ.c)055QFhgI
oQPAEKX3>,:8`D@)f'<^0.MTcVhtOTE^?Dh&7B.fe=Z6c=@Pr9]AK[)V"48TRQ(oH,<hARI-i
XZ<-TPqX7eK9lo^)i<0U*J.T8VNJsWZ(:?eunqA(k^.U+!$i<n\De5f2!g#$qbG,iAfs2oP=
iVDs[m]AK3RYe5Id8oJ78`Z7V,<,fi>fEotAO97?P2KQ63nX*?_QX%&BCW:O.1fg<Z&J5t]AtO
(%3oOc,=49N;Z!@/oc;`m]Ai)3q>\X--jFT*>!/PW$RI9lH#Ls.Fp^D%f@V\ZpkZ#C(GlfTLb
/uR2)?+ac7k;odu'`ZfLqg-i$=J<4MK?OnV"Vr;Cr!P[pQN;ib8*"@7[d.1P_RuqctG^]AQs<
PT"#KUmij(GM%#CV$,X^m6uL'IjsC"^;6$-0p^ZJjWRt#bE3NQcDum!-Dt9Xg,Kj(3`6l%bh
%ir*Judl=`0@OL>gLinj,"B$hdD&SL7-OA7OW?h0s3O>fLPp0@I?]A8qnd'B!fr%s13BgP+8t
Kr6q`9G.aeTd@'-db\08m?]AY6?+TFdMR%*W4A7H7X\j#.qXq\NmKCFM3\5Up;@'\p9'g'.<P
_Nhic]Al$jSFc_0(h9g=;34"e^p[>k9:!e4]A7;2SE6VBYp"8%Z]Al_Xa.=[K";f'i_09$ouYI&
^Ld,A.0+V!8VMdG2!HcMX)A/;5#kMJ"YLQi7p<q`-S%!us*qO9^@p/&[GY7=EZBMgcDXO7<f
VBVq3BbC]AS)c'WYLe90nb`BLQFf)`MB40C>aEGAO*fBY'5@+4);oY4\1Dq.Z#ECVqb(LWiLU
mdq:[n8*@_YpocXk;fgI,?I5oL5n+A_<enB^Ai#,,YW/=GjD3q#*2'=.2<j2,H-nO$V,s>_@
#G3ln'?QT)8L0fZF(bJZ73nbKN*Y6H4';CtM\S]AmH562g3Kqp`T'.QYI8MnDO/nRqR[+_>m"
F:9OWa[RNZKh6UI(OsL*($LEfH$bO_5s#baYhprVJt(HK10KEi^0@j`92<$F]A;#99TOAGu#K
Sm[Qb`]A=jo&T,CK?1&7*?&:AWB$$\r>,rF^SNikI!=>10t>'5)WOM'O;&%hW+F)(./]AdGi0-
<;4\QtpO@c>qE$[BU3+4hl-lSm48N'9SV*I?9Lh$-X7pEtc=rd'JC.P=Ncp4<+";W06XS9n!
96)%T[E5pfRlf_5.C/G>96Z`LQSRp:cODEDjL)r8PJa3`2&?Ri!RgZ=Gl+%GpWO7hNcj;*cn
s,Xu<AjABC+]AMWWEnC<M(C0hgcB#eUl1,?)T[kQIJXRem9/Y0MeQ7/Qp0q,-Rh/8-62AHf0d
)pe=co$F=b>V+Rp&Sck'h[,]A9qiS?5ek6.d(LHa#M!o)0?*;GEhSW?XG(o-r&8ShX$m*#E'6
`q.N5),?0>e(o!Lr/`/74]A#DD*!kTn<%G:b1BGp;qK$[rbQ/:BkaV;KqMs-.0cs#<j3o]A<P@
>d4+Z(rm6>1Wtlj3o/O4TnVF[uPGdpLJ>=Z`1YR/\eSP1Bq=VEt?f6kl*rXg+`NNC6m0il\b
AkcVn\BSO2bF8*_CNNOXn8FH\53&=Ln%H`570[ng&;d^dUW,;J^[/Jg7nc+N-1`)2q9"(-'C
:L3D[<JgL@k^7L7uX$rUT;q&Cl0]A&I,-*N@6.`sYd0l9sM7++#2$Y>\sXdJS[PE$#T*a\U8R
"q<nQ%2#f9cV=`B7W9SV8PYTl%@`dGf_Nt4VuVZ@T?>G#.9/d+cu]AK^cLEKoR<'44B*\VhRO
@9s3ton6[%+'6[ajH+*t;jX%lcH=gFm7J3EPs"7NZk:!n=Fb/cI58.=42_RdG%g&bfG4[Ql;
5/(),,l9JlFULGsR,-qqo/^S0%of>r2c23$=Y)^eS@aF,+N9d9UfS/#r3W&t-Zh6ig8"e)+Y
MkYc%6W.4Jj;n'r&PnOlSBCm+45IKN>75/Bm@a**?1t8o.q=%l'T0^3b[SNJGMirPW<1)qg(
PgiAV=]A,R\gEj;jH\<ETIJ6QaKs$-[JJmgI3mg>T?*?Vj\_klMee6in-?(H7L=Z9$adjB8B%
KM:aW^?#99+,(LHT'%a`NL%p0!#.-8@O_;PSe+L4$#65"!B2gVE.6\K!!A`laKgT0QK)'t;?
R/8A)$/<-IS0p?P)V^.sb`c4M5*/=C77?4.;HJ0!\7c'Ctd2e1YlX^Acdk@MEP\9E+LF3Z5p
,@8LnL=[e^8m^9L2!+i"UL6J[X&VbQD"#4#8QT6[0&d/.20!>`%JE,7W/-iNS=5A@u^9p!V[
H/hJ(\#OGjL."ZlMB%sC5Embig&@mW?"7gG%"e"=bK,6iCD+9[LCFWcB^2_[YVb4$e$J+(HE
Qm[3kQrO"B%a#<OP(M?`R=%MW/#1Q93Ij,u$N'#jE]A*b2UJ*^,+3Z-K)WCcbJ.WCuOHhG7'I
`sO$m7$`u`.IWrhgoe/(,a:pb"<+`cnH't#>'96mfpWYGR0o5IXLu0&QX5"?*J:qT<cnaba@
AVc>`M1rS#JRb]A?`sr@D0rM`!/=Kab3QI&D<]A,W.DR112Q1Wk,"0+dhWagk>@3^rHjG.T]AnC
7+kd_Vaf7?tK)--"N!kUZ7#[hN=$e=PP.=0E"E"]A#"qrK^@'44_@)L$U3Va]A!hci9gEIefnf
NjT/=hpWHOJO!;hFp$V/-iAL`.',U/.iK9GR5D*%=LI>ZHDAaWr1A*-o48k*;$KBb4[O71>q
*Zq>$NmKDTi)=67+^r)Zi57>lMM\@euZe_6qSCjUBsp)Y&%IN@N>93g9f=f^@[f]AlPAWJ[r.
,B^i(YF?c5d[ni'ELaB$%DCfM%A>aqb+^NBr'Z_9l$h7sdh5Bl0o`Q[(h-Yl:`-hR$K17R(n
L?fk+3apYqI2%^i$E\+!D(pa$3K%cFE]A9*HZFY!(JoLBPt0K7h:HRfWZbq:Bjn6e3?j]Adp3J
%]A8jIqL@,JuN?Y,DYu#!E_*1WGMQ*@3)bStcV5]A)_(p`B5LDuR;p(X'Lcl4bf9@P)=G-=_>h
Hk92(LNjGelHM/,LV1NgNs==_[_:M&b3;j*4*=GVDQ:P+2h"-[PLj5'?<t<U$7rNX#(shY#c
8F?K.Z"igQA!ONEtO<sIRDp"1oo"KTVD:K$HEq1J,*=fNM<.[,@8iH\K"1DLo#NFMHs+\Mb,
(]A/&r;@fm._S9O@*k*.3ee+Q)"sW9@TIPFK<:-_$b@&8Ks&@r1::ejTjh4T&S70D4#LL^bKO
k4^W0%.dc83/"<8Yes#rf=!Mcbs1IsupT5+r(>GUE[\a*b&58fQh$gkXbM=Kk6^i'16<qh:$
h&<;G&,R42'41R\AbF(=d:Y&8_!"d>lrY*Cgl"J!2pm=:&1&+a'S^*mps/&^I0TZ3[m[NgP(
h`i0?oG%B@OXl-rk0"SLc76FrXV"-iCVr]A<Rn$A@eAq&qZZ="36lO&It5b49jW6emLYi\6n_
:n0G9bnnoG4q=e2M%2PBWopsr2lQVPjn&6ltUPo0`?Hu4mQ$/g')>p'(nc*jTm.<=RF2%Z[&
%r:-R`t888&?:%h%gEYPK0Y+/*/I5K5U]A;se<l'(56.tLra]A1mP1d]AoS]A(Mk5gb>2.S6^$KP
T"k*Z$/`^]A-Zt#VRb$Lnf@pY727cB(<ml0t3P>9s.8biX'uKH%#sfM!D1F+ba!H>L%Bg,C\G
UkT^Y5R[**dCL4o3I'"VEL)Iu3`Dd/=*<2e-AlJa_!fJc#ZeD-e:1fgJqMJH2VDX2b[qaJcY
E.i2gq5BOAgW48AgK@):2+lOdRUh"*)?F`SI$0klUl[g5k']A`B)8Q0%qWXS;Fs$S2StF]A_+b
T^2B8fpK)%;UL96Gfs4G9UH&enH'C;phKu@8^oR,dJC6]AtgXCJN,\--B>\&miY7Y4]AgAXI:>
L=?mA'K<\H+?e.$No*&e\iEY#&<MoSUpEJ;ps57!rOhFKg\gGK5*/r]Ao=Nj%$o.rH?C\B4mO
0_mMQj<_4V^Du%&n>^nFq/O^SZf9)\F?C98="/jgjC8WM%8[WtVW>!pGqrDFXDHm_0boWS9R
3!I^hkHp#`5N`/c/d:Z]A,-D/(?/3?EW8K&IPYC\iWo7d7c9Da?k;norV^q+)haZ.l8/^o[+e
@`3B?1R$<<,mY$5cop7hRF]A,%HQol`Y^Ec;?Vd5n"D!UcGU@s>pF'f@?^."3mcaMFokEG#Iu
@R3ATbpP3/0"DXdQ$e`0U%Y&ae#H_K!hRCL7FcqQ7hg(8V2V$O('ZH>RF*c4`_%Eg9GjM*/9
OhB*)Ub>O<XH^#=d@m?,r$p8lFAK!n?3k/NhJ;.]Ai4`1@C+UH`&+_eQEU%7l-)Fu6nWdVI(p
YaJB"L4l=RS(?h?M.+VP>9V,pZ_!CXtPn4;V%tP^?OKLa<k4-D8F&?3aD'Bjtf0V.UG-$r\L
.D7e$T\2YiY?4mDe->o%9/B<G`I0?7KaZA+b[]AE"R("E8`m.Rm3\1n7[jM0l"mC3^U'[j11(
,iB,L7!*;N;baiUt9hae.+5Pg>QOorXmB#MWV-:EL5:BP0je:a?4=..1>%@I3J]A3=HR]A:Y;Y
$^-*C(UZ5[V4;4=45K[HjE5mapt*Oi#p$n>$mEt)Q'c?&OY7f;Z!KF0co;dUStDeST6JP+:K
Zcj\lXon:`;kfFO"[;3;Mf<:1DEG3mN(opG`eA2$@>LJLa4%^jp9gjApceBkg@tV\n&iP:]A!
D*X7%m3rD7*-lrC1RFb#6D0,"Y8%;C[P6=quo\fsG1e@Tg$?a#^UX*OJ8?2/*r;,+nu]A,(pO
cZC(^8,!oIc&-NDp&BN$Q001_&c+SM!aF#*-#@--!pRL.:S_lI%k2E\Sjh`U@8D@%54H[duZ
0DOCYl<uS;kcd>eE4]A+^oiZ(0c-FnokXO2qUPjD^/gB(4fY9RApJ2C:=`.%d=i5YQS%fFkU\
g0kMW&3CVBPP^<N27/'PNHaVQGg;d>>DA*'9KQ1[?,<MCf2"-0&+XlF&"Rh=DF9Z1qgPe&J2
f@G!0M^_9Rlu-[n[c1ofXo!KBOOZ_ujm;tri"B)h).@]AAB'K`tos%tK;60,:ZtGh62AK)'3c
3M$qdRQV@oN2WXJBaG9h7oqCSi&_h2R*rebh!n$,PU'c0q2h6gLrSg#UX@TBZ]AgILYT;e&C_
HL_%+E:FX1ob;VA/G0P.'T@NKukI65h4(lqC6;F7ZF(P^5kC)a;hUQjf)*.H>"$PpOq3jAA%
0a;HjcX+X83q_E%dX5Z>=_2E?Ibl`8Z=]AckG=$'H>QQ]Ab]Af:$P?rI:N1s@9CQ%rI@<]AdOJTu
,3:[NbOn`1F379`A#Fl=)#rj<^ERBUV_pAW?FO1<edb3<G>\Z2uo^^7KA@biVAnCNk8IR@%0
\1i-G9qhUBBYQqoaecdO7MfhtIW+@U`t"9?42]A?UGq_I?WscR<VE3&7=2-S$s$G<9Z?1L$n7
krj.[O;3W7B\i*9]A*++iH)r/(W_H@/5=R=LVBagN79'\J4k:7HRs?>Ak\Vl-e9G"_d+DQ'V<
s6%1S/L0q=><N=?fbs[pXl,0n#OIsb=FCKhH0&?)s;_!Kn=ORDOr55qIWT"*+9pZ2sVB%!'%
s<*D=-@I3/G#7a29/"r_S%paQ@Er$@SaIUdNZ"bmF>3fV:k;ge+c>i(45pP`M<sC?^a+>(<.
>M;%3_D);^&,?Li=UZe_2NGMJ,8T33!]AEXLsNkhD`C:\`>45+sP/(YilAErWSfM3f4S]AgBj/
6J(D"k>j]A>c_8NO9@).Qf6X=,Ft]AS:d]A,R#s/1n\Nu>JUjR\C=(]AL<[C(\4YJ15&TP5heLrY
m;Qn59$lD':m>H'Q=H2.#/6n;bZ-Hosd26h-op2LCqT&ko@k]AATG#"QA,(006DT:DJ1Fe(NI
LDeW\TMSUpKW2"he+7XfiO89\=aBKuRm@bs%cNmUu,LtOE[\AFGP>e(*T)L(r@\'\s[I`<A^
1r\[_g<r[I)1Z./N,K36g*e$p`rjD9BAqC7V%j._6L[CQu'jPXE'(6pL!k\$oA.62!7j"0F'
B)76c2Mhe1QFmGA]A^6@O-urSZ'"rak_@n<h\g8dh^_V2Op=oiZA9E)s.A5pPslX-tsGkL34s
Wdi`J3jq3b=nO(>-D(7^au-Q(T=JUGZK(`Xe/uuC)gPS<V`S%>9Kkk%9rDO:\!X8PD"HUm::
gF:`K/#C;83!kUHW<So?DU)hsK]AY@g^l8Kt4HIk]Ah.3WY/"WKLt#DB+oZ9jBm1i)/G$OK]ADN
R9tf5M>9WWKIU\I$RC;9-:WTaJcSlVOS\+[J8BpPArl_$ug<L,<fJnKDrWcK(eo,n;7_BJq>
;FN<[PQR'<Ht=W`]AOd]A6-XB,L*`[pj^+tQT-Q:Uc$jH@]AMX-^DSh\[F%<h2O(4::@^E'nYCH
Y=MciuYFZK8^'Z`1\%NC*82L9nikHi.71#5gC&No6j[V;Yt`gBco&01T#a:0jR5d'B1(<4CZ
LiNuk)-K)9;FKD)!Ci&YLH`IrB?(a$Q^C]AcBAca#IhUMsRWq9EOM\PoA9?@(G\3bi2G,u?_*
n0HH/IE68hScT[qDr6?%tf"=P;6")fb#;ToW>UG56:'_&>!PA`Hqr1?OJanurpK#5_H^B$Y<
A$OeP?&kq^_Jje8bQ#"g7,penNpmbtR2OjnG,c_Co9lirKeu%e*7ZqndXPZ/F;E,X<c:+]A0r
d1$e:Ji0Kcrj=`FMA"3WpSGQka9ah!4U4_/_R_bZA*Ju@V@O9lg#!Q&"dHjMP*<m;tOu=[0M
&*B&U\LMS\L!Xu?JLTk<(?eXXEhd,`q<;b1s@Aq2i-/+[.u[gkGJ%bphn/<At;B14IID]AcLU
NO4*3md@>F3Ui[OG@s.Bc2I;DpA5_8\D7*PA]A>+=/@ZSK?9n+N#H1j]A!qmXc$e-*TjX86B("
2/OaL>6\*hmnHI[`nr&ks>&#Ob"Wb/c/sRmadO_bL".cEK-ASr"#aU>2GD\B15\`TcTDdpLR
W_]AcQ$X=-/i"j?Z-/;Y0.'BMn<1mG5l!`IY",+k0S'-p7B//=r3[0:/I'pu[Hq%..>V*\1@f
Y;MFK##Wbp^JiE]AuO8ubctnYP0Q2!D0VmV_A,_lTHc;PVS5g!_+2TK98AXqgLd\)-V-d)8@o
;1TNs>Ai=o>)gX1PID74%amn^8W[lQ[-[bRhVq;B.Lj2J0hrWoKAm;q!><'[7'XJQRjAop(M
IE'.f5I&@\m91bbML`;d$8HTr]ALfN*)&:#7L`bBF/n*?8?LX!%8[Q_c(fGDOVX!'lkHGV9Zg
nqi(YrgbdZSP9SN4NEQ;6m6cJ+>rFj.\0!J`2-a1cLPL"9+fKLhmBJf:9#aAQSb()3]Ad'Dp9
(l*]Afn0PDRlVhT_kI.iXP[%7ZoH^up:HZI4-8"[]A7RFLV*\5eV[6A,7P=^sb89T)2_i\YB#-
2!t&'9cZDA<VdDV9*mr<3>Y`%/oA9_B;/t&?6^;c)+uS3&-=3Jk$leh]A?97:+'=7o3NI+=cN
0W*Yi!YaO3EM!S+odk1h&TU0RHoPpI`b6jf\K+/Wa^/\HX>iEs0)l0qkfj4$-De/G1`k>Fs5
dMZE.l1-+FXI-48/HAf]A)%IIjY,A+.f?1lbPT$ri]AWsIMP.o=Rl72hF>Fo2LYST_IA@44aDf
8h,??<3S:;.%X$S3GlGUX#:g"Aju,gYCSJMbT)O\T*&3U0]A?@#,3NjrGY"Q.4QDa=S9e-Ii&
r^nY7"*pKVM6UK@'&VMud;hU"rB%h/EnR,U!O!hOB.l?3C89+mr#B&/nDBf%gELd4U?eI$Ue
l&<%3K1JrW<Mt0S*Ii$-X^jfX#E.B5I0r6_lI'nfGK(I$^%a$-A#b!hW6:i`ZLLK9b=Hd4Dc
j.8t$"PaO9OVG#'pt]A(_#BJ>7iNSBG#b37L+OS0Q[$h@_oYD$jX-)uSP(d,:1tC_E^K4XctL
9b-ICf"-X4l=SA!cMGG+nkCor'TPZY1Jo2&JAN=&[X-(F'`\M3JoETp$V0??!+\ue1et-g$B
l`ZX?2bfoN_A;Au[rDU9L<sZl1!L)kUR6;+HEV]A8g-&&On1W12P3KjVsB5CY$-$=+O6%dqQ[
Y&[Bh%@[W0&b,&?e-=Pq#_laV#qN*hs(D7&4XZA5!U]An3>NYj,71=1;4$:Na8iMTP*nH>F8>
%u:,Yt`.;f?ag,gq,"GSI>el1tEq_1RWG+N"VC9QOI)=OW9XBY7#BTEM=C@U-$;eK%V[!$Xk
G/raakkY_uWi<i6UBg.>HJ***r<5O>D;_[]AiQTN4._<dn'8c<ch<AidX9,uU65,]AHeA@!=\K
JI`[^\X1-RR62PCi/Ynb2KZ+:M;s:(07-a[I&H`=goCQd(P$\Yk]A,`!fU*siZDrag."fqf9;
=Rsl6m3]A",BE@K#A:`TOi$LF%ub-P&A,g1E9unW8p+Z%o5UUmktR_>IHO7<pGJT;2K0=YsXL
6;)j?OW/ZN")`Gmu*\e!',B1qjCc)Jcj9Z3]AJdAYs."4#o.!NOI)R,.Kl8m!m6PhF!,D'dn+
@9/p-?S,Kk;kIMaV7IbmL"!M.dVH/*0h[>OWru_)W"TtI?OM6qidSG%kY#T'lno15Y>XsHLO
J_4LtX(]A?,qc!a%!,6BqOC^+V*rdR]A1\D2P:lL+#Rp9s4+m8h#ONnT)DK7l-_OgC'D7PRr+.
OQ;:RqYWs:AV.W?RIq$4.*cGc's(FNb<rbm!')-ja3h9LJ7sQl$LcunoU!?,?t]A=u&V`n.me
EKjMt"Y"N8d#O8gQ_5SkUruL:r7Bd5MKPI7%=?NERk_`eL2SqV?9F#Rs?26B3WjHO$:-o]A`Q
7_ZE1>QZqa.e]AK]AS5q_-]AmRSL7DoU2]A`7$TZlAFWU==Lb!G//BHZ75/ep^7L)0+B,o;5J6kY
N6=f\GiP=&d'U&HC@C5m-e6^NU,%e$=>ooXqp*6q^9MV'--;QaDu,:LY^r!"</f#9dph8&qp
O@S(sE&aVh9/`k*PtIaaEiF>XT48JXZIpPVpQQ3-L@.aofW5#s*u\-/=08ZG,5jMifCkCfuj
ng"O"5h1tF2Wg#?XtQJ/!k.E'-A!['I">p#K?4c3)p)Q5&;M\Ym>.D<r8N=(eqD3_pEaV045
_t"`s[O.[$nCd%[_4!_6%'.lg>cm&muR99!`0V1,p;*rg$5cJ\jbH:9^m1>dupMiJ&jo)mE4
X_VnmC=Jo/2HN3am39JPmN'8R@>R`,;M%o?Q`aV1a=Zq,u>N+KQB^%I+r4GN?nOj[dW4NEt\
F;$!IQPh_s-F/&>iY:KS'_*o^qEo%$5I_\AsJ0[c$WWQdH@m="<t[(Jl:E4"KS0d700>o(PT
&\\oq>YNA[\9eAG]AN#)$GbiX0pr(6RJs&'0:WOEAkU(u8mF$1PE-kMDb;E`V86P]Akg+>_^fT
dU'3VUXcUc&cBi8K4TPU?5WUZIfT~
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
<Background name="ColorBackground" color="-855310"/>
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
<LCAttr vgap="0" hgap="0" compInterval="5"/>
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
<HR F="0" T="1"/>
<FR/>
<HC F="0" T="2"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,4229100,0,2743200,2743200,2743200,2743200,0,2743200,2743200]]></ColumnWidth>
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
<C c="3" r="0" rs="2" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="2" s="0">
<O>
<![CDATA[产品毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" rs="2" s="0">
<O>
<![CDATA[包装毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" rs="2" s="0">
<O>
<![CDATA[手工酬金]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" rs="2" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" cs="9" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" cs="2" s="0">
<O>
<![CDATA[配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="0" cs="2" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="0" cs="6" s="0">
<O>
<![CDATA[重点产品]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="0" cs="2" s="0">
<O>
<![CDATA[付费会员]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="0" cs="2" s="0">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="0" cs="2" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="0" s="0">
<O>
<![CDATA[企业微信]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[总量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[超旗舰]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[VIVO]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[OPPO]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[荣耀]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[其他]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="0">
<O>
<![CDATA[单机贡献]]></O>
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
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[PC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[大屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[穿戴]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="0">
<O>
<![CDATA[音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="0">
<O>
<![CDATA[融合毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="0">
<O>
<![CDATA[搭售配比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" rs="3" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="部门"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" rs="2" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="运营部分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="th" columnName="负责人"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="销售毛利"/>
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
<Expand dir="0"/>
</C>
<C c="5" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="纯毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="酬金"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="全利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="vivo"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="OPPO"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="荣耀"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=i3-sum(j3:o3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机贡献"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="17" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="配件数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="18" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="配件毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="20" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="22" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="23" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="大屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="24" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="穿戴"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="26" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="融合毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="27" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="28" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="29" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="30" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值配比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="32" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="33" r="2" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=a3+" "+b3+" 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="3" r="3" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="4" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(e3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="5" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="6" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="7" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="8" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="9" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="10" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="11" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="12" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="13" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="14" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="15" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I4-sum(J4:O4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="16" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="17" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="18" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="19" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="20" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="21" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="22" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="23" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="24" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="25" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="26" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="27" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="28" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="29" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="30" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(AE3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="31" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="32" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="33" r="3" s="7">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="1" r="4" cs="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=a3+" 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="3" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="4" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(e3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="5" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="6" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="7" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="8" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="9" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="10" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="11" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="12" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="13" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="14" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="15" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I5-sum(J5:O5)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="16" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="17" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="18" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="19" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="20" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="21" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="22" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="23" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="24" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="25" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="26" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="27" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="28" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="29" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="30" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(ae3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="31" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(af3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="32" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="33" r="4" s="7">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
<WorkSheetAttr/>
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
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<Background name="ColorBackground" color="-1644826"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<![CDATA[m<f4>;ePrN![;b`BXIpp5hbI)g*;\_'P'jM46goal#^tQ&1^AWCgqo[aFZHF>Ei*T&m9.MN\
XW9Q-HNY>)JFD\KF3E>D,6WQ@t>bp>#+7QWa<)de!9[VVh,*Vl(p,qqcOBT&9ElIa<(BqY>K
M[]AfJNg>="aL_]ACXnIP(5&50;@#Wqa$9B#of>OdgX!^Z3upCD1jQr,V%N(r0%B0XIRI`4%B*
m)Z"X7M^-fAJ?"QR?))PU\\6k4X#YK0akY:[;I]A(T*9gn"NoneNnc@l@_*7$/^%&Y?r:9AcD
Z&hb9?:ol_t:)#@h5ofnLE31s/?5q[jSDjj7P3k^j^C()qMLN<*k#%FA:TJj?W+NFWs(uG&[
d<?:ZU.ZWo-j`0!YiDej1.%f%2'-t(2&pQX]AYK<]A[GUgj.&WCO]A.WX?mb5ctH/Lsd-g`KG?p
&RSmA'-.4mN.uQo]Au>QhGD^1!"u<c%)081O*bGZpe/V3BclqqdRl;G783t*Xc*q^Q,gT+O@!
d(D?W.Ak1DK:toS'I><.NM9Z*2-3cJj(sqV8lpW`akk5qn'/F^:R2%=j(*7mZH\25W+E-4"i
[?"5m%*O7*M$cQ8mPL76I@[`jo!g,kW@R`:u!7S0m<>(>Kg>CX!PpQN#RS-`^ZKO5='u?@./
VI8Xuqi3-Qd$[k1ock2VYrQWTTc]AHXULH>$BmW5(pl?C]A@XkG6(GOC-u:%^*CiU)g1n^Oj9:
ePZeG8h9U7bkQ#r-0eED^(MIl?+EO`D:8EnRDBi3!J*>`29_JrWn8[QnIoGJe*M4qg8W%3_&
GU3XZK@c\[WM8k@jmhn81.En6WtK_Njh\$Jffg_u^BI3rgufR)JG!_Gak)Km3sf1,D"3-<IF
"9D1ma@:jq7JL^q[7jQ7SKd^cMBISZb9Lu.05YS+Z?WAf`-$70W@EY6\QotjWFLkA_ZRZ.O)
&Eq>GcPpbVfgjKZ[p5e8VaJ9+nfod,X*h?]A5F=-$9rR6eLk`cd?D&89q@3f`aiBEnU(S^L'i
P_W9a#QI@M$TbR.cFkG!_r692<JcLc*CEHA-+Q8^Hr:m2MrGq*:^=_;j,OlmD>%tk&+9j1*G
l,626%Dr@I0.b!)(jO-Z#]AVLY^5\U6oRkc'j.H&?AFeJqC7RS,2@u'YGH_i@_`Eb159)F[(_
\q@`aeRip+mpIgg7eNeP.GpQ115I8h0I7Rh&gq1amI(G!#r*q;Z?$*!`[Vohg1^coaBmcn#,
S.M!N#s'`35BOo[U0_c*EGkBiT[kQUOk7T/.ob[OF>l&Wn.B;!<^e"L'qp'=;)VI&WC_?ZV+
s1)\l-#TN`.;u;8Tu[dM;*[P5]A+@AI9&:5]Aq0LpnJ%G\&R`Wo<5=l2!'VIm`"0Gsd)FPWLsn
3h1]A9aM+.&:<476&"NE[17ha)BYgTV'`((O1(#;APCVR2e$g/2&J`hEnI^0cPS5>EN;!A>^%
4`;su>h8pp%[[RP1;.[='qr^bJSXc.XM_u[9:Tp:chb*q?RMhU?/O1&WEcB)4B7gLH)_.,(F
j*o,KaYK=GLKb[t[,T%!.CR]AL<<4g:Wb*/oao?R2q8I^%'B_^X@!61c.mDWNeD/Tg?0Q2]Ab2
S_gn4d3`<H79b5kKGbM(T#:]A1l#4Y&eHU;hTi<BUk(`mW,+u%b9o^PJb`<O`*BoDC&D*?i4G
l6%e^/tj5LSMQ3jmgcJR(2#Q!nQp]AUQ9Wu_hpF]ACWrf67/;Kr:N'2:d`l5;]AL&=]APb;^:6j1
3UU9!:B('(K@igTQ-aU;@q@@D'dLKd&'T%SpWq2p)Ji'<Ks1kc%2eQ#'ffSgrBC?`;A]A=Y,o
FmsR*/$<<?_0C4RcN>s6m0FY?4EJhNLj+T,Y/mE`2i;R12).ZgnC#u-a;Sqi/\D+LOT33<n-
%Lhp*"#n&R8hJ?T,R\`@[r<rK"'+L[%rI/"AA^k*#gj""8ltj0&Dr%8#b05/K"-Ke2Ukc38-
uL>=jSaHnXFhV%=*`L`"R)m/O]ArLCu;:Tk5Fdk)grKl+1V3kZ6VZ'4Z%AoF+DiKd/cX3VC*o
fT(6A"#g!.R9(_?BOX;)CZ3uj--%:I*k0".K^_krZ_n9Y<<t<08'"3DE1>I,)T'U<"tBUGWN
/CFrK#6ZqI#o)4.pJ5Tc=?"q9#XmK^W1T&41ak*DG&AG(qXhdfUXSqko2$[[`_]A-[qlfR:t,
N:I8/]A[c:bam9id7*CM4[75p(-#Li^(IO\#Re56ueM4e7s#Uc[,p@'.^$5SY7Aj[[?9DS,(I
ZNZ/$2#P;ITjms6Rrb+0KHk9NBK"C@g@,54s"-=#$2ql[l5tOf/4QQ!c(_500"\aV.+@d[(K
jSS+Pt/R/55oQs@Vc[66#Wd-p:_V%&JQ4G[Ci1]AV9pZQ!cEE4:pb\p-YlA6s*+$#q,$)g>$=
=a^@Pg[u"`o.)]AmYW"RX;\cae;I##gZ/N5r1(2unlH)U%##+2o#9WJ#)sk?[OgIup?j3%_:D
M6iYpAmd!>J"=\P:!9^=07-<8OP#gor:5,d(r-P5A&cccU:ZMWoeTD*Rn:H(p4]AL?o2NP1,c
3iHm@7GjW'\h)Kl#gE^mSi)L2`fB3rPXg[td@fEr\Cle-nq`WA4L#'+&29Gq8&supO:1<=:#
0,9=6er9[UplV<FD)M2?<'&%XD'don$WMD<V/qW-\=-'LQJLc0DAnhb_cq3DtV*S3rW*Yq\P
Zd)Q7AKt_Fi?Hr_0l&YH,2cCK+.AgtjN-G4>:+Z!f(l5$;2_%)?=b,XGW?UJr&Necj`$';UV
i#.LL_6#s^!BWC!,TF$=Qt%8WVigLKu/iB9sP#o<)8J4K&71E&-e@.Vfg_8`g*07SW[%`hE(
XnlNM633T5d.dKj?rdts,fgIXrq2i"kL's0i9QasfP89UfYF>Y_i2!EQ(^O)ch19I@Or#mF'
&0Bh"1Wpt.j3ps&o4He4(`Ir0h9qp:]AT"t29U5FQeP;iK(`f*QcZ"$4)LFc?m$,/S4P0=M4a
kS:&%/M*oI`gKH1c6(quc$*n6;5',$gRm3>!;)2]Ah</#KkQ/CSmA.0ob^@@B\n-Mjlfqif`/
h.i*i5M);W#AH)3*@NVGKBDcB5!c=sQM8_#;CZnEZ/,K@p)f]AHY&YOO6n6T7=$KNqu(B.oPo
F4fSGP:+'`9+gjoc8>K\&\1-?0e8P,gJ&UM>^K9<B4_ddUps]AQZ@[;qu0rnp`2<^WkUOcB;#
sbE1o-t>WO05fYafXoZ:.8+JEG*]AN7iC*G@/s;K`+jK_J[;A@qBSC+THpQ5GBq83\Q@/1:Pc
#]Ak[Rb``BgGj07\\.(,m%1f_4\TkEfC+5`1FL5t#&a&1abcJ>c`bsq1aW6o0&7SqWW]A$Q$hO
+X]A$RaPZJIu*_pePgA^72YXYTob@01HX)h)tWA#H)8M`;m'pD5-jB`=55Pji#QS@C:o>L($W
p&8nI099CpNl\"S91a2DC+-!&_aX#_NdL3$3pG4:l/=ekU_r%sWr''6@LPC^=d6CDloU_F$p
Y27Z$&3iSft5%\fag2IYp7/l:s!YtYQ7-/>-oo8oc^Qji'3RMLk.Dj%t-DWOO'c[0V.B-p<>
&64o'm$N?;iO2*@df.;f*ReC!SMN@I`_QPIq2&UoW?)2NBlV4*&MR*uC%7:;@.SGWd>&"4B(
;GV]A]A1]A>"l[l,nSQEgtmR)`F,\-;h[-PfpS_=u7;@,A5?OD6H^dHQi@ThV0NqOklE26'Y+]AF
;NMlTmh6$((%4pNO3f/(:FJVP-Sfr2XeGY]A,2`8!CW"r'4$\=)2VlMAL9!a1Xf)m%c#U\,@b
5.iGHVH(p6+qEZ63Das?ng+YS,58)h+7ET!dNFIkL_7k3O%'$9_<@G?&kT'N$&^^#"jn:n)Y
*!nlKb[DEL"aR<H,kbqEj!?[/'<r2purF8Ys$K-GMqAN]AgB;5fpQDfdO^l%$^[4A1"Cpf.qU
tAau13:7'bo*Tf<@)'.ETR]AD?ut3Te\bRSMGjk5"ECU+G@BhVc,NMpODk'6]A$)2UDji%A8d"
dLr?K'`K+Me^K8:e&CP;"_\i6(is.IVlG28MbfWgY*Q*lc]AOLPnR`,?i(;/5Li._sQ]AttQ!b
JUCSsjt@<jg*"mD<TaObtp'?hclo%PO*'ra^:Ck?_,>I4&'u]A:$sYE=/cn]A[gn$)s/OC6Vu7
4!i6^lNJ*\R.15X#Suqs[UA)/"5Y;4a.3a7*Oc?=I]AG-pJ[*-,6#:/*hi2eWoKB$_6Dk.a<*
%7"%SEQVpVqsCKCh93>J4YJ%DI<.15,U!uQWIUpc\IV+Ipj<_FI)3K)<p%=k+B:grul6^3/$
*MnTE&gE$443hOd#$Y\Th8cJ"@=ZPu0\U_`Tom2T:UBE?kbpmA-#(")T\E-j@,H;.<T*G<qs
ZPX4/:#l*hco2c8)@Bk<0lsr<%6CcRUMl5Uc+Q;5HL+E+d-drK-!*Ue0:[?ip1Et$<(r'Qh#
/V*o^S@dJ"kQn]A/G&4=VcK&h"fP5>_4d"^`UX"3&'`u/?(G-XI$DSSYM,8GL2;gYJ?`Q":G/
j[UtQO/8-R5D+J`(AM`-t(qD8qQLn3+3E&,[eZVJ]ABV&#+$ph48g8)<,bL0]A]AR:H.6YMF1'r
_F:G/4JHQ/K%ue;1'Kg)V%Y2;c.luF&&pK@pMpr;-n,)jj2qs^>*^$-7&8;L0XqeVYR[=iU9
c]A%Jsi(iF;@>=)r^.pEOGf:PAR,AXDQm?V^BL3o;'OBUo?Z[:/>*;8t]Ap&Aq?E_9:B.U#286
N4(d=EcS46=qo!m^>o"&_/TJ-m"MhP)b%[ieAcm>3i2Z`e!G=;=T11aoUboT!NLam6=h:Z;s
JZ=Ve(oBJCq?0(f.m!PSMiP>]Ame%_mM1lS&#8u&\:Q1H?[B''66<OJ_<JA`Z=ZQSSZ!t2%#,
4=18>LjjbQrQD1&7#bfr8Bc>VuM8G?8q^.7u%Q>8g\F]A2gF[o0'GlXRX?QA3?9t.5$g16ki:
il,YfE_u9pZSG5f<F=da6JN>!Jp^<AYS'/l$&Y3_$Bbo;>k+3QKM.9a54:hBg2Q7e@pFb?6C
WW92R`WFRga*F`WW=`$fd6Um3SPguH=&B7Od7>b(c0M[?pG!EiW?q)O1+l-RMePUhJKA@^n(
?62"U>\;=&+C]Aj^br$>eT3`$q;#t)cq30r@K=n<l1mR>0f.a?,mP:TX'E^b5Kk]A#8Gg7USXS
AP#b"bTjBGYkoPVGm^/mp#)Q^5(eCHf;4HGM4fqg?;*WTh,oQMYbDU7(QtOYRi!TVcq+rm>H
2WE3*,CqZ;h7Z'(4(Ue7eQg&^AeTO9ajb!lqo!/pX;.IdPBALFl^u):XQoi;XOLLa#Ad/pRk
mFRjgYkFlLAir861o(Q'3uii&_dU(o:W&Nn;Ps`_V6T"%(0hu!5'O/=&5;A@WgY=I+cZX&DF
%92cL8m@_k:]A%\9VH'1GpgB_$&7d,FufFoV:C,@d`gW+=)CIT1BJZ'16YJJ]A6olE>^/O]A0bX
(]Aic&(2`D!rS?3[p8j14=AVu\SrBbu7.l_(V]AL9Z>:nF<XDlatnlh<.UQS!Zjd0hP2-WJufY
8"U\"He&Uh5*KL<1GQorJ+1M_XN1>$=IFpY.b,=K6b'5&Vf!/K#]ATmq[i,iB=;A/afI/RVp_
2AdM@&&ZOqF#'p+`?RqZ>_1,mHf2@>sSZ6Gn&V$h=72r%-A\]A6r-uhc@dds%_DV2UVKd)Jk)
bs)lLkmiQO1%kj#HI/aL[U5a>]A;f2/p]A\1j?'KPT7hXJ'6mFW::K\67f<qbdoodA.4^Usg!"
Bd+:Y83f=0sZ;j"$sTjPTm6>u@K"510-eP5X&R^KZmmD\l7r1PuM!Y%h?9/1-nkR&DDCd?S7
'8;'De&n\FcXt[b0\`K/1K@?H`%;Em:9)>^>TG,6XpLkAfjj5Z>*AAVLTZgD7.^3'gh%o9(D
DN"P_?4t<hgM^-]AHE2Dg!!GAYZs?.MnL)Q5Em\2M=uF$h(P@?"Cs8*7`(PCJ*udn7"t/ds%-
/`I@YGJO6%!>gcc$p7C$I'&V0FeXn$C)A^7>G@I+^Ca?NEnLjJgZU7HK3$)L7kYBQt47`N4E
W>FKYNM@cp<hNf6MB&XHe_k6jD9VUP.,HscM3Vn)o>oI?J9P,Sm,$ZZV-:3U3GRpT21sWBgT
4!Yq6D\cP7oFp"L7/U;imb/KPo[De@Fm0`K%WU6mC?SP4KR!1uA&4#C7`8rL[[c'1kYA1lH?
:NK*A[r?5:iQtTfb^/5&QRC<.MWf!RCL&5S/dM*8_]A;\F_,*m^Hj,#Y-7lH8Qh=I@(KNW&g=
j4TYSQtRFqcbIHKQ\Kb?VqMQa1q[;Vo*anYfZ;%!IYt2]A!-@8IDP+aP>rSJQgd;1IH>kBk?3
<?YO)G3k`3CVi)f>R0e7LF+)A<4Ejkp$2"3A__%r%2U\Ddo\#-to-4K0>,5Y`mWQ?05!G(hf
`&i4)A(_gSg2>r(8g4`2kP$n`sV?m:h+21_,%Hn%/_VZ_S(U??)C'R<cC&c]AAATgC]Alr\9]A,
k<k_qm\BLp7Ge;QIp.cml82V#ah%&Fta@K$02Pc2Qm,:,&Ol!l3-75aoo:E]A]Atec"%XE7*g)
co`F0n+mdHk"FXtL>JU)l"nD.$WGZj]Af/]A$G;-V]Aq@)#b2]ATCE\UD_@H?-X%^8G93%HgC@Xi
'iPiH@Xg"CEOBNQt7UViKrK$1)2tLH]A3]AjT/*$_Ji->NELlAP[P>$^ttP,b4Y(LTB!l,UF7q
7\tqM:Y(SmH-J]A21PRA[mZLj#@2LJgt>f3G;a/S$Y.h2%(-.@/@5(..sBGLNDmqjds't9I84
.1D<RMc$le8$'AiT_CWH]Au-hL2Nsl4WBgP@;+XFp`JeN@R)5&0bp5*-68#4546dOpW>)2G8r
ND^\a2X(j>0Ml-nrW&RU?M$)B#R\U_[]AI>*<8WtS-QA=n,B8YObt*X7b0ZH1:`jT#fK]A:;kr
T/'@6R.kn-/st]A'>0eA+VPAcld\o3PY'uh<2pWJ\1C;9h&HoMR=_B_t<YH%<^9?KOL7/A7A.
1MR>WCSgFS]As#_sEe+#NuNKDIto0hW(j`;-PaIP\'g&WrR=X9NC;7;[]AQOXt]AKk_g'QiL<Eq
$^1@3/KA"Y?JqugfdR=6r:4VV0Fa,BHj>dfq7A4^gMDS8mG_Ta3S'#0GP\*segm,NL6._ZV:
n9IVb)oWc^6K&p-o[BK2EZbVin_8"(f.ZpFO2t)=jpj(^W;Z#AXp@3OV>opj,9Y!EAsRf<H6
Tq@Ir-fUGJ/S5eDG![gf>9PMJ@bTS[I+Ba8RmkoK"q<RVTneUH]A=.iA:c?,4F/0+e**@t_c"
?5*1%L\ItMR7cjZ:Sj^e9^PLnhtc[NWSS0c\f.5(]A!RA?LBR'BJhS62?3IH:gnU%u;BPr:44
0:=_:[7T-PKWp6jeMHlFadr@5bt%Vd*#hL`+:ujf(&(%UGY=*PIZ;qP!;8o03nLI6SEUGq/K
0l3Ie$q%UTi_Q)McUp0Znd\^e@aZ'^!AH5t+,B"YV#BnKgjUib#`iRQ7&+JrF-J8'h8ie590
8IHC8]AMNi>cX_Ti+]A(!@BnEi&S,=EYr%Ve6BRLcU$Ca^*'0ndg.d!F(^f)ZC/G6\TKFOFe=K
=loWiU#TfJL?'f3BIo*b`RNQUgmT3?X?W:pdJ'"u3'CiL%#+ao(gPMYP)PliqQ8VQ3i["En]A
QtJ>K/H*Fo8SPYcY23*q`Z(Pf[)]AVMPdbr'\=c[4B-'huK"<CY%i6JN&3Zi@I"2$`OBQ*-ml
*K7Za4:hc,=d"VQQPLM8ncur1X*c/K;Ic@70ADKEfsn*sMs]ATW)KAS&%GFMEttY()%UW5ms*
q-U+>6GC1st>X*_S*NNa^jlHO0W^.]A?HC(@`iVMsm`hDC]A9=l*uQbciQ<mOg\h#=n_6nS3t;
FnFKf7eNk(F0?3+aY^=3d'e`=F);)+>qf8gJS*[#<t(2jnNP%_.V^hKacEd0qBf1890Z]Al+q
,/du@/%**NTuU.`CWMX'-$<D2L*@_Q4qV?6:TOV<bkgTb"$EqDNueHoa8bBmF:i4Yln(Heoa
m9;_R4[^Zg3PRK/2=)&FLC\/MV+X[@68&Sgoac7/VFh@(HtZ5\U7;$PEf:NLN"\<`$.$]A8nM
4KBcnTXJBunZH!(JBX<*fNg.:CImN3`aQ*Od%V/$hKW0u6\U'T5YUX\JWp\`k';d5S[)mL?,
EZS)+(fr44m!DuH2l0inrRo+8('32M$qu+%s/sGOGLagK&kGGt^,F0D1J^`Bq#>uD"2uF9Vg
TPk>WmY4uoU-]A?Hrr^_E5Q\:..XtN._'SQ`Y>pA@S6a23(:UIIQ,66dh8<$@I"Nd+N5Y>:'k
4n0lkT<UZYU(F($<j+ECBo36l%)QNWFE*nX?>0S']A:RmSEFhjSgq$?UC00('689YS?6N2\YP
$gu^(D)1A.L->LHa$@]As;p?pLo8L<nOU'g+$5!t#/B>&dog/Q\hI1M:J$Vu%31_jek[E$GEq
#I[CCuLUq)e\LDCT\jMSj,ng[*pS1T)5(/in1#I4[2(D1Zh\O;I+#E?OBA#-LIW6hbm8mQ?M
.Vl>BpOOu\\d1r5XB1*At#ETU?O=%W33_``YQm"$CP&K8!=$/]AD^Lb#X80oS2QZag0.0+2jo
o=sO@>K6cGkbrDDgn<=J!_+**;g^So,<ZHR)IE=Q*f^1-^MR+?1u.4C/`-<`ehp!n"VhQ$OL
>ljhMfil$Dmi.3L_BT(IBE(DkNIU%W\'q#>l:_!If90>aJ6X%]A@,/,ZKRML``JH+FlV;jMUc
p5C!a%8GgmpVFKs*(bjJHE*\;LZ2a''+5VYQHZ(^2ra;nJ<3HkDl,d#TfOm3B66aV6ph0H8m
F!Uf04us,-j=]A27&a2W06&f:NPd0)DsIVb<[NoP2k__h?FZHGBjU[6nFj,W=P/0a+jbBIhO?
Ijj#l'`VY(`ru=q-&EJ(ub'Cne9,S?CV_b1+\>s]AKXgn]ApRM9jb'h@uKD8"Oc@WWp1d1!['5
\P/#AbfnL.<<mWYaJR!V1#npTh>BRCP"&s(*,c#eV_V5@V>eP1=(7h(R,,qLfjf?0XNr,[*U
p<UXfI-((KfJXXYA(i#<5CmguiUWZ/-q"LdKY%r*ndmmO:9Cdb@A-#b[(Q?oVm\01V\fsIB1
m5\mpMlGjQRWie^Bmrbn0&m/+ZB$lUSt+XD]AZ$g^)G\VYb)DGbi'$aI.IU&WjU'*>S6ZirPk
(DFhF"\u9-%g\eXP@g><k6gPcc1rJrF_u7g.HL&jGh*Y)D7!,u4tAV0@4CM#NuQ[PJW*d/GW
G-[XULrk68`L9XL_<S+MODuj=4_.a,$nI=N(='SjD^MJUFeVZ<)6rWf3fa!3UL$j\UAj0M*f
"7JpT\\_FVmN,-k_A7W"aL([AaFF2fK^^0',!_p0LokackQa4dLC\5Yf)bqqAh=2rN\q`U_e
!'.J63>#F&Pr5#i/N4UmE!S0g;%oJ$Q&6e?)jXf$tIVO/NLQ!%[l)9\!J.Q=[(iq.OUPt*bV
M'#`]A+ih[_'6G$8NDtFH1d:,2RV/;V0O!jU/-\2A7E[GKfFh."e.Am.R';+'b<PIIo3Plqs+
,4#Nh#mT&1_)G)TH9W)3M!2&\BCupbDh&TQ*:b>YPFe1uRI_BfQ5,RM9PTGjRp5?F'AX,8am
ON2YGJ/nHZL+hJY)l_7hNb&qMlk!2S6??>Kk$3ap#\%):j51u:rfC)!^CH!VBZ=!!(:YLpUq
OC2%6MHl#5%]AjpQfjm&6pk\74-(q^^8q#9s4Lr'?WoYO8)VM@HH"<`cFG!HUf^r"SkFSYBjp
L/#q]ASZnTh&'Q$i1R^m!hJ(nBRBccGk(2E7+2_sel8R+MS0htI5,b)pD]AL_pJY/r?UBkok^S
'q.jD_lQG+LGlnZCis2-U[[fc'95!N"i[m.'KR:f;pe>&5RUG`q>=I-@#f(T1U$UANi:I5Ka
5%dAVR]Aeb/U25#KLBm=bUW.Nr*g/C]A21kLTt0sA3Y!OZeq9P&0?6B0FG(K0mJh)5IhP,`#m5
_b6:R\Z"$@IDO^bZ$+6*_#b3Zt_;I(d"_pLSK\/sl7$b!A-hq1J;#V_V[$NIakj1DYSG"!s1
,#o><ggL.7@OFofm,2OMZWART:;[I%hIr6I1h$kJNn;LaK8?`%&R_cLFsLmNc1Lj2Bg.AJq@
[r0'B6")LiUgJN&I!SN>*:Qj*VD'pW"iAHQ_$db30e&>,WXNA&#_pl6Kca=Sb[2TSUF\%&a*
XLBS]AV[EilJYFPJm:\Y2c;NT=g8XP6oSi(3cIfjO/p,-jjeI#)f+Yk,*Hq%I[Z'M_V4to>bd
PN-%o8]ADZoN0@a/S@c1mlUqU97&$);LIET^d,5<OaEO$dW:mOsDW9iKd?\4XIC9%-9t@ECb<
+d&0i!]ATQ8FYJgTH6Ta**P-6*^LeG?f+n:EpejpT^XMSaA%go)hRFJ@N`kWP:l/5hUR^T:>L
X)2R)q2"/O5)+j1+V6^Igr=8K16]A(*^GAOLbu4\$5<2^C`V.ajk^TD_X.)m1ik5@8DbGr6W\
P$2'&m8RV(iX;MZUe*lllXBMgM7nHA^k?1_U"j1$_L,9d1(8ism]AFo7?5:m'?XpCOMY6)H,<
<1Tj"8;7J.iOg%n..@G>U3>L06eq2\IA;Z)1C='#`Z*i!oA#]Ar.jEm@b@KGOCHfb8?Fr0W-L
N!q`RWefm9\jJg4O9/m9-GW1*lj&lpWd`4LS00W:).HmRl-bUodq;J.ej*F68i/oZW9)3P[D
2GGTN+pT>t^WQI[_iL6&Xr*;E@7/8?8-(bIg'6u,k!#rF3E,p^9OK#,%T.&:JkAdoB=,c7Q9
1q%/;j!R5.p*5qB^2mP<sCo?j#4.B=sjlM5:QVYXBga472KDK$@HQQHS%s2$u[\W;TBiE4L-
K.TFXWl>Ii3#-eGSCkOOGXb`U2UHgtJh*+i1n:khZG!/l*[AccEY[9Z0HA`3,=@IDo31E<ko
\Y/_AdgpUJ*K?SL->t5&g<;!LF=qd2Q8a2@N+Yn4Q/?[p5j6k8*K,Ud#uR_Wgc@YR/iJ0EcS
0R)hV14u#Toe4K;sYN9=o)R[@5#3>qr'j$\cRYr!,/j?[oB_1^Pf17:>VQ9=t1Z&U7bj:kH7
U5-`^_<+gL5adeOsnpke,O@^LWEu@rZat:YDdtHW1Y0XFRPQ;:K+sl,E`+,acM[qm(.R_b#l
T4!m/</21<FW_0/cfW,)BVAp:T2gSj93ZHBOn>jAZ=O2]AOgT28a=#;)THQ=PNEH##*r9L\Z[
cO@i=bkSZq"0V*61rc#O(7BO[mRI%C8"ko,8HN_C1b7J;k%_96\aNjA/:V)5"p(,fG"1::48
eVT2'@gXr-*4jnp'7RumPM8gjX6QX\VUcIKG\TKUFp=f3r]A$$RR#9cj>;t==[SJlci]A2brmt
BkQ:Fm#L:35R$/e57L>9Nt&k]Ak7p4da:UP$nL#-8#0kLRmd_>'8V9(0<!HfdTWL2F4bnAeM)
R[rPHWYuS]A0]AV$q"MG-/X]Aahb"-ob#oZKS/]AYa'WMmo*doA`6%\39EPO*`.n8iHN:M]AGU:n]A
U9F5*uVb\nB-,)M?"-#Rp+@Qh3.:<K,a!W7lCALMR`aC)lrU[FM;?s=&()RMoe`&^5CWhjQ5
\iZHu?)%r\%Eg$IJ([^oI4BU^fcIO#XK8lUnWYIMLMO<,-GAXEjf\,uapnMtP2WTM3t+?)S:
WaB-6g5qG6RM8:uQR@bV\'Riha"iXtM(cs8Rj=Q4K"kru2J6N1X*!'Y$4e\VQ722c8!#C=H3
,4WRKcdWMT6UnrU=$L!R_6ml'1J7n-OO@=`6s\7:p^We+/pC]AnkfW<=HnQOSWPKdhfgeg<A>
0_Z[_bHYtR;;:>7T4AiRnSE+E+,6Qdt?&$JU4=l"3@ogc+4YWYSe;C*4a/O&$q`,*P:iI):2
\$llRPHC2s8A$TM)iN0Qkt0CIn+4^E;!^L/_Q"N2YPkH$Ac"joc'pfrP49/cHV:lRgU''(2"
L`:C7F_R(0r51De4T$$cLqeWc0h.,-)]A#RI0.8B//;g%G0m0_%B?F7\f.W(%2;Ai9J3l9%Zn
F3)i[iApC;#(VHDiCSN(WK.;XaZA%\8OGX<*a&HMD1j\Uo6L9\3#9Bud8SRT`*PNtJ%nVJ-t
g8%gk296j4JMOUiC4QT1bFk^tEO%D)M*#A_r?_]AY[H5C<FCrq=/VK;'K.g9C?Am=k>C<JNb\
53'$"7KQC3BLq7X@3Uqm%72sE?^,=qMm!p42.Iaq<<cFkN2"p\R$WZ3>'03OjT^!eC0M)IK%
kiQYh3`beRet8GC$F%!jB]A0m;8VVZ%lFYJaI9Xd-7Edpk[Dl=G)1a15bB]AsS6'*tqY$MUZFY
iGGH@$Taba">D:aVo_jmMp>jnEN@*gr]A49X^BkmO(b*3m6a]AQ\MXg/^J/Hc\$?%d_&'(Bg=!
QrDtZEdKJq_UG'e!E8ApM=i_/P>[,oT,rSZ:K5rO:P*VB.Y\3hUENBnQO75:ML/IHLN+9Q,_
kWs`T$5U`/;"P2e^%IeiWVNlmD1qVV@bH4B$B[+c,bElW[T376/"'m&nLU_:0eUN%]AL9?75E
krjYW`>=`hbcgoH!`It$.ZAp&*S:6;"AccFs/g#%(K19CYoJc,<WO`s4`Kl0`ks_1O]A2ijg>
E7"?Foo%F^#.4(.qrNdfIXZT0=N"DYeS=<9_8L50-FOeUX3Mk7e6f;bsrql!jGHu6-TLG>j+
6;AEQ*iRjP.J;AsD6-FZQn3Ug']A"!\7Lj..R,W</'G[\R_4/k+@<V`,LC\JJ$KmYPkg8LIE&
G+FeNmX!RM)u]A%Qj^YLu`2f60Thm*!OPZ86%CkWK<Da<n9Cgm[SepgL6CDu503UQ:`ccfY"L
`f<H$8h&Y1A(aY=CD8aK61Ma-U.fn[8Ia:t_#nU;=HR0EZqXWn.N]AY%?`fK6]A"K?bG(U\&'9
\26$\8ECJ`$+&CPUPr2"ERlDmm<'KiH1I.iT$od31H$Km&L,Whb@\-W0E@:a(7$I'B/=GL\\
=YT*(c.l#M"_Pl9rlD5IcD+'-TdTPSC@]AlX(r:-h"=sMn66OFjadtS(&lHISSgY&FS2RO-h\
iJjS0Rh73>+A*4c4"9d+UV6L:?ClOelJPfdZm#BuB2oF-ZlC%]AG=390;LT/codQhWgUMm:lC
VK9@.hJ@o1"#:$WG;N6eMo<guW8AJhXV^e#iSI1=?t6i`#<H>>F?Y^\(mhgbGQ7n`(ug8ub)
PrZe,_1Is-tPgD-O2/o_9n)HJ"c97CUo]A[dg;@n_0VJO5AU`YJmr"YIt)r0H@[<s!>.,]AhYY
;,7iZV$`j<"V8L><)nN#6"-VmMXD:r/3oDC_/[AK4]A=%@RVG8;'k++Zps.cF5++A+VZK$i@U
'u!=PkYn<:&*lh"]A8hYbOA5"A`8)Qfg2!6).pf1@H+3YcRW?]A/D]AT7/:D6a@&p\$G/GLYnUg
^YOL8Y,8*gV2QL/L`?B)rP"U;a6V#%^7H=Vq^SCRQiem!XGm8@%?%hB2[71Rt%TPlZ]A\Yf7+
P/l#oYXu9P^L0u:=2ds\gB0u="l)_4j(lPqh5lZ:)s(h0O"KNca*-Ua,DKR5k4VLI?rg7A/`
XWTm?tE_pq$e11PYf`5>n*t;b85Iei"^mlN;K;_9Lpi>6'V`Bk&f$"V09r$[Ct,p%sqMf'*f
%\+882GLi]A!9jW#"_$5>@EYEdTl;j^oCrWIYR+u;iaYV5A;u]Ak+Gk`(E'@YX41YYS8OH`u17
$sZdG`9b\Z:8N1$50iF&@BZk5YQMno7q)kDZ[_ST:X??Ic:5mJ+'7B\3IQEPS<@5EHR,UG+S
?@h?CuC$\S!7(k^?5X7l+F?P!l*!<1"`Hg]AnD(361qRrGuD(&1]ACOA7iYD/P-,<neJ[#:3eg
b)`&pnP!%18:NAfEbf"/[!4V;JPLK9TUnJCqp>N*)Rb4k1V9RfC"BZB?G9\bqsoUP'0e>a#t
qa$_!lG.fF]A0oeFn_FXZL]A\Nd_&fdRIL4q/lJr"leg@J_YharjahseGA$o%X&M6d5;5E"UV.
sej,g!O]A3PD]AQl`EV;P>AW&:^M[-`cT9qbB'XupMnY.5hk+4bVE3B!Zrc'75\q_qWJBt$mH_
ud2\c!tgb7:955YI%l1@=P8o08N[O9?W\4Z?SBW_Q:\/+&:`I\G["F7M'dtN5fkV`$PpTG*s
p*?usI@DIEUlncW/Vhi5++K-7PGoE@s4Hc(\?T5./j7;Gq1MdPcnla*&Ej[S"$gU'=[GPEcE
LX[+#T=4]Aj*;NAep8oRlOS4$MiU%pgLuI;jbIM'$N&8tK,MH2fLX&JHkbnJcb4H%N)!;-Rff
:)[=c>.IXOG^LD@O\bj<N'h?Se6cd2pqrBP8rOeq[aL6aeOn1q+A^fAT(LTM[1UV)uHao"u[
DJtj-pbrV=aN]Ak(TD"lELs&4]AS7K<h@9b^R]A^\Q3-j4"s]AB+4WLh9Pc><[`.=gD%:(U.n=@0
-qmO&J\Qj3a4>@Qa$6Dh,_^PlE?W/;0,.#/Y/d\F6Hfb%Rf!/OK,E6gL7^OZa@oQZm9fRB('
8>H;KU]A'b@b-l9$U.6-&pBRK"ptb\j8ue4u*66eY1;SR+W-Z\kljgmY/5gMV+Vj:XhSFg4'g
OH:_(Y74-2A^snW#>I.K[LE&?m6bKLSr'U'nbDY]A$r?=d/pYHNln_G$dugW*H;jU7FMV!EkS
:=ud/gn(Y+1egZZ$s[=o+s^Q]A3c[5/[lC_bN+.lYVc3nP?hPeoM*Y=iND/&<c!qm44ZFPQup
4&S.nARos&Kg[5#Ve:)",>Hu@\[-c0/L"N3U`2$8)9m+#A(V?/R_->WO7Ks6:%Rj\"ANZ^?f
;bhq,?&5kP-@Z4F_c0S'BLXK/Ktonc-]Ah3jtP+:LM908%ICts,>R,X7khkP$c6^@c*3]AQc8Q
I6gPk@[m%u)XM.9T`pal-,Z.`hLG6uL$Bia-HgEI/8ZJ2dFlPK)Pq%]A"k76h'H@6bUsg2%-Y
6R.^P*aD3sUTA)YIbDG]A2YCeQ)J#l7AEP;Tb%Ij*+uR+3_il,)n(Km5$+]A=ST!kNreGAH#0C
ttjrFOm6Z$D*p\9NWmNY\)\BmeYhI*gi9aZ"!6IKh78jM\&_A*mAW/[9<+VU^N7d+b@2e]AMZ
'=m,fBFnm>Z/gNf/3joM@rf#ol(g]A[bW&DV(--#qeS]AlE:]A%\Ue2fju')`#fT.p*Sg^ik\2a
fa.ZD5!cIY^X@:ju\p38j!(L,n1+Pea^'t2pB4)kjDfqoWr4Lqr*94:ZS%u-8GlV-iE6eQVm
NRT=321(1eT>0RhitRi1ItSS[LoSdd7W$?O)bj$kD^_!3d!2nXR/SEH(VD=pZX31QO4BF<L^
N9kao<PQ6THm\7@&$J@9DE)9%'33q+%?-n7!G*:#I?X&O\->f@<*lq;G]Ar2&hb(0]APEOlZD]A
c9/p5%8BM1Je_aI&hJS(BD?.4\NjFIL;5X!_Fm#SB_8WEUUrf7FrXdI/k-?GdmNf,niG,1eq
cbOb=Lei_t;nZ:KuMuW81XJ53Vnb19jl%l,81G95fgA<DKYN$3Y5+-BLCqTft>euIS^c'mLp
qlL2"K%g]Ab"oK)9M2'b[TVF<3HLA(Zl/>]Ab104f?_5&46hM_Ff<6:oo8?g_/:JZ^nTOU*e*l
&f?P$pN2m<%h^Xb1Vn?I<$RN`n&dk6[UdtZ\X9gK1iRCe7>T'^G">H'#@<i6Z7%eGcX2uO^?
eX`U<:b5]A0@99P/]AEV4#+;K'dA$GJh?'@J^b[Q8EFC\[.Ph0c3=$]A0+#1)O_dkA")AkrTaSb
Tm2H)nf^>-7L-L>a`Xc=(Ce]A`saX+QF#2<blRNq2R"4W,_U-SmrjHEt!Rd+/<,KYt9[uQc.T
_@RQ1j*HoQ7"d*JPr8edPTTLW#Sr,(Ho_Et>NdMbY2jMp/D'GtA\2n+JF.q=%C[,UL`1D0b<
QBK$@he1_nIHi1!YN\Kee[_4[kgf]Ao5#TUL7r#[o(.Z1ZaR.tqtEG=iaj\/kLL2@+)PZiPDo
m@[F=^3[1)OTUYVDg%mSTDoo`sGHfqWmB6ij`Og6Qab#%-*M?F\Tf*#7B>8!Lnkn4CjPdK,f
"<5j(CYk`hao1&).W%lt)1@0F[Nrqm\&klgi@Hg=FC[,HXS&#*+\J^@KP$j!3-GUfZmL-fdc
sq>o=J#t9fA[CN(HR/OTjtng$"bDiR)Qt+QC-DW2IRTKP,J"=>qF'<n^%'&PkkMQB![L#s01
%H!%DY7?:!)?3UC6rK<n2AYCUDLAgaE<nS"s"Y<k5pY0K=>\dPTU5s:&*B%@\dHD0s`G1`]AM
6+_g&4EJVB,JTE#\XWNIjN3L6'A'DMlr1dahGXW;T]A0^K^D#Y,`8iA)k"u[]A6QZ,XT@`XOIF
"+3p1-PATXT!ZIoF*YpmjQaY[kB/O"lVdQF@ZP&9\N/0PHjV/r$s"/CZEM2lr*M"-]AH!*'CB
(&KCC/G@Jh0"L>8/J)bm%o\&b:XpEnfM#5"jP-*eR`hAK!,p'!0GMPdm%:R%'dqqpl)[iV-p
s)EXMU7/`%^H=a:eCmM:^`BZf2pnBc&XbHd@H!Ib%7-c^;\i#u5ZaUJHIi"Smu<5$QKK,(fC
(=X4Ehmq8FNe$9Ja@.R;hVPIgNRImR[`V%<4[N9o==Tlc#+9uHcANsB\L)Pj:aK/2WYp+n<D
="N=NKN*j:YMQBBC&grA0hT8TQN6hQkGCAAcGb&HWimmM'0cCe>Ur"gPjQu-#f),Qu&(?Au`
-=&J^qmJ/PPJ*/H9r>$IK]A.4%g116'iIo*+ID95.A+U#5e&CEidc':*9nYZ-O8&).N1XdL?=
-BioT29jI`?12"tYc[_!-k6R0'R-Froj&[L@nU=mmk1TZg>hFhQKpbFCZ`38X,4U`i\o2o@D
?kc]A_0'sr!-kT@`/0pX."f=Z]Ae*VD/qBj#Vd<64+YN'YOC1^/!6GS;GVqiOD1-o*!^<Bbi03
%YM%#N5!'Xfr2*ir2kI-t$7n`-h_8K!g%fDCrr9KW=S;:NLEJ/h5n::']ACY`%7Fj0u6Wg4@#
]AQMHoorsk8<$e"7VKloI'2plEsS7RK`pUL(ur!*BH%P3AFakB"N("Lp_A\4:`4kVFKOr/4>0
Q;;a]AJ\8&/_nZ+_^7<a_eCI</u91%F`!&b+u>Xh4R/q=agJrsJ~
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
<HR F="0" T="1"/>
<FR/>
<HC F="0" T="2"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,1008000,1008000,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,4229100,0,2743200,2743200,2743200,2743200,0,2743200,2743200]]></ColumnWidth>
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
<C c="3" r="0" rs="2" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="2" s="0">
<O>
<![CDATA[产品毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" rs="2" s="0">
<O>
<![CDATA[包装毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" rs="2" s="0">
<O>
<![CDATA[手工酬金]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" rs="2" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" cs="9" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" cs="2" s="0">
<O>
<![CDATA[配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="0" cs="2" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="0" cs="6" s="0">
<O>
<![CDATA[重点产品]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="0" cs="2" s="0">
<O>
<![CDATA[付费会员]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="0" cs="2" s="0">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="0" cs="2" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="0" s="0">
<O>
<![CDATA[企业微信]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[总量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[超旗舰]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[VIVO]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[OPPO]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[荣耀]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[其他]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="0">
<O>
<![CDATA[单机贡献]]></O>
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
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[PC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[大屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[穿戴]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="0">
<O>
<![CDATA[音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="0">
<O>
<![CDATA[融合毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="0">
<O>
<![CDATA[搭售配比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="1" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="1" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" rs="3" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="部门"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" rs="2" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="运营部分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="th" columnName="负责人"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="销售毛利"/>
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
<Expand dir="0"/>
</C>
<C c="5" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="纯毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="酬金"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="全利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="手机数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="vivo"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="OPPO"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="荣耀"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=i3-sum(j3:o3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="单机贡献"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="17" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="配件数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="18" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="配件毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="20" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="贴膜卡毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="22" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="23" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="大屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="24" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="穿戴"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="26" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="融合毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="27" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="28" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="收费会员利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="29" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="30" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="data" columnName="增值配比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="32" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="data" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="33" r="2" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=a3+" "+b3+" 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="3" r="3" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="4" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(e3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="5" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="6" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="7" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="8" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="9" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="10" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="11" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="12" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="13" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="14" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="15" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I4-sum(J4:O4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="16" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="17" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="18" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="19" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="20" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="21" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="22" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="23" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="24" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="25" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="26" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="27" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="28" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="29" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="30" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(AE3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="31" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="32" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="33" r="3" s="7">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="1" r="4" cs="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=a3+" 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="3" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="4" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(e3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="5" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="6" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="7" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="8" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="9" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="10" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="11" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="12" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="13" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="14" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="15" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I5-sum(J5:O5)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="16" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="17" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="18" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="19" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="20" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="21" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="22" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="23" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="24" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="25" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="26" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="27" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="28" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="29" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="30" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(ae3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="31" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(af3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="32" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="33" r="4" s="7">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
<WorkSheetAttr/>
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
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<Background name="ColorBackground" color="-1644826"/>
<Border>
<Top style="1" color="-8355712"/>
<Bottom style="1" color="-8355712"/>
<Left style="1" color="-8355712"/>
<Right style="1" color="-8355712"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1644826"/>
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
<![CDATA[m<f4>;ePrN![;b`BXIpp5hbI)g*;\_'P'jM46goal#^tQ&1^AWCgqo[aFZHF>Ei*T&m9.MN\
XW9Q-HNY>)JFD\KF3E>D,6WQ@t>bp>#+7QWa<)de!9[VVh,*Vl(p,qqcOBT&9ElIa<(BqY>K
M[]AfJNg>="aL_]ACXnIP(5&50;@#Wqa$9B#of>OdgX!^Z3upCD1jQr,V%N(r0%B0XIRI`4%B*
m)Z"X7M^-fAJ?"QR?))PU\\6k4X#YK0akY:[;I]A(T*9gn"NoneNnc@l@_*7$/^%&Y?r:9AcD
Z&hb9?:ol_t:)#@h5ofnLE31s/?5q[jSDjj7P3k^j^C()qMLN<*k#%FA:TJj?W+NFWs(uG&[
d<?:ZU.ZWo-j`0!YiDej1.%f%2'-t(2&pQX]AYK<]A[GUgj.&WCO]A.WX?mb5ctH/Lsd-g`KG?p
&RSmA'-.4mN.uQo]Au>QhGD^1!"u<c%)081O*bGZpe/V3BclqqdRl;G783t*Xc*q^Q,gT+O@!
d(D?W.Ak1DK:toS'I><.NM9Z*2-3cJj(sqV8lpW`akk5qn'/F^:R2%=j(*7mZH\25W+E-4"i
[?"5m%*O7*M$cQ8mPL76I@[`jo!g,kW@R`:u!7S0m<>(>Kg>CX!PpQN#RS-`^ZKO5='u?@./
VI8Xuqi3-Qd$[k1ock2VYrQWTTc]AHXULH>$BmW5(pl?C]A@XkG6(GOC-u:%^*CiU)g1n^Oj9:
ePZeG8h9U7bkQ#r-0eED^(MIl?+EO`D:8EnRDBi3!J*>`29_JrWn8[QnIoGJe*M4qg8W%3_&
GU3XZK@c\[WM8k@jmhn81.En6WtK_Njh\$Jffg_u^BI3rgufR)JG!_Gak)Km3sf1,D"3-<IF
"9D1ma@:jq7JL^q[7jQ7SKd^cMBISZb9Lu.05YS+Z?WAf`-$70W@EY6\QotjWFLkA_ZRZ.O)
&Eq>GcPpbVfgjKZ[p5e8VaJ9+nfod,X*h?]A5F=-$9rR6eLk`cd?D&89q@3f`aiBEnU(S^L'i
P_W9a#QI@M$TbR.cFkG!_r692<JcLc*CEHA-+Q8^Hr:m2MrGq*:^=_;j,OlmD>%tk&+9j1*G
l,626%Dr@I0.b!)(jO-Z#]AVLY^5\U6oRkc'j.H&?AFeJqC7RS,2@u'YGH_i@_`Eb159)F[(_
\q@`aeRip+mpIgg7eNeP.GpQ115I8h0I7Rh&gq1amI(G!#r*q;Z?$*!`[Vohg1^coaBmcn#,
S.M!N#s'`35BOo[U0_c*EGkBiT[kQUOk7T/.ob[OF>l&Wn.B;!<^e"L'qp'=;)VI&WC_?ZV+
s1)\l-#TN`.;u;8Tu[dM;*[P5]A+@AI9&:5]Aq0LpnJ%G\&R`Wo<5=l2!'VIm`"0Gsd)FPWLsn
3h1]A9aM+.&:<476&"NE[17ha)BYgTV'`((O1(#;APCVR2e$g/2&J`hEnI^0cPS5>EN;!A>^%
4`;su>h8pp%[[RP1;.[='qr^bJSXc.XM_u[9:Tp:chb*q?RMhU?/O1&WEcB)4B7gLH)_.,(F
j*o,KaYK=GLKb[t[,T%!.CR]AL<<4g:Wb*/oao?R2q8I^%'B_^X@!61c.mDWNeD/Tg?0Q2]Ab2
S_gn4d3`<H79b5kKGbM(T#:]A1l#4Y&eHU;hTi<BUk(`mW,+u%b9o^PJb`<O`*BoDC&D*?i4G
l6%e^/tj5LSMQ3jmgcJR(2#Q!nQp]AUQ9Wu_hpF]ACWrf67/;Kr:N'2:d`l5;]AL&=]APb;^:6j1
3UU9!:B('(K@igTQ-aU;@q@@D'dLKd&'T%SpWq2p)Ji'<Ks1kc%2eQ#'ffSgrBC?`;A]A=Y,o
FmsR*/$<<?_0C4RcN>s6m0FY?4EJhNLj+T,Y/mE`2i;R12).ZgnC#u-a;Sqi/\D+LOT33<n-
%Lhp*"#n&R8hJ?T,R\`@[r<rK"'+L[%rI/"AA^k*#gj""8ltj0&Dr%8#b05/K"-Ke2Ukc38-
uL>=jSaHnXFhV%=*`L`"R)m/O]ArLCu;:Tk5Fdk)grKl+1V3kZ6VZ'4Z%AoF+DiKd/cX3VC*o
fT(6A"#g!.R9(_?BOX;)CZ3uj--%:I*k0".K^_krZ_n9Y<<t<08'"3DE1>I,)T'U<"tBUGWN
/CFrK#6ZqI#o)4.pJ5Tc=?"q9#XmK^W1T&41ak*DG&AG(qXhdfUXSqko2$[[`_]A-[qlfR:t,
N:I8/]A[c:bam9id7*CM4[75p(-#Li^(IO\#Re56ueM4e7s#Uc[,p@'.^$5SY7Aj[[?9DS,(I
ZNZ/$2#P;ITjms6Rrb+0KHk9NBK"C@g@,54s"-=#$2ql[l5tOf/4QQ!c(_500"\aV.+@d[(K
jSS+Pt/R/55oQs@Vc[66#Wd-p:_V%&JQ4G[Ci1]AV9pZQ!cEE4:pb\p-YlA6s*+$#q,$)g>$=
=a^@Pg[u"`o.)]AmYW"RX;\cae;I##gZ/N5r1(2unlH)U%##+2o#9WJ#)sk?[OgIup?j3%_:D
M6iYpAmd!>J"=\P:!9^=07-<8OP#gor:5,d(r-P5A&cccU:ZMWoeTD*Rn:H(p4]AL?o2NP1,c
3iHm@7GjW'\h)Kl#gE^mSi)L2`fB3rPXg[td@fEr\Cle-nq`WA4L#'+&29Gq8&supO:1<=:#
0,9=6er9[UplV<FD)M2?<'&%XD'don$WMD<V/qW-\=-'LQJLc0DAnhb_cq3DtV*S3rW*Yq\P
Zd)Q7AKt_Fi?Hr_0l&YH,2cCK+.AgtjN-G4>:+Z!f(l5$;2_%)?=b,XGW?UJr&Necj`$';UV
i#.LL_6#s^!BWC!,TF$=Qt%8WVigLKu/iB9sP#o<)8J4K&71E&-e@.Vfg_8`g*07SW[%`hE(
XnlNM633T5d.dKj?rdts,fgIXrq2i"kL's0i9QasfP89UfYF>Y_i2!EQ(^O)ch19I@Or#mF'
&0Bh"1Wpt.j3ps&o4He4(`Ir0h9qp:]AT"t29U5FQeP;iK(`f*QcZ"$4)LFc?m$,/S4P0=M4a
kS:&%/M*oI`gKH1c6(quc$*n6;5',$gRm3>!;)2]Ah</#KkQ/CSmA.0ob^@@B\n-Mjlfqif`/
h.i*i5M);W#AH)3*@NVGKBDcB5!c=sQM8_#;CZnEZ/,K@p)f]AHY&YOO6n6T7=$KNqu(B.oPo
F4fSGP:+'`9+gjoc8>K\&\1-?0e8P,gJ&UM>^K9<B4_ddUps]AQZ@[;qu0rnp`2<^WkUOcB;#
sbE1o-t>WO05fYafXoZ:.8+JEG*]AN7iC*G@/s;K`+jK_J[;A@qBSC+THpQ5GBq83\Q@/1:Pc
#]Ak[Rb``BgGj07\\.(,m%1f_4\TkEfC+5`1FL5t#&a&1abcJ>c`bsq1aW6o0&7SqWW]A$Q$hO
+X]A$RaPZJIu*_pePgA^72YXYTob@01HX)h)tWA#H)8M`;m'pD5-jB`=55Pji#QS@C:o>L($W
p&8nI099CpNl\"S91a2DC+-!&_aX#_NdL3$3pG4:l/=ekU_r%sWr''6@LPC^=d6CDloU_F$p
Y27Z$&3iSft5%\fag2IYp7/l:s!YtYQ7-/>-oo8oc^Qji'3RMLk.Dj%t-DWOO'c[0V.B-p<>
&64o'm$N?;iO2*@df.;f*ReC!SMN@I`_QPIq2&UoW?)2NBlV4*&MR*uC%7:;@.SGWd>&"4B(
;GV]A]A1]A>"l[l,nSQEgtmR)`F,\-;h[-PfpS_=u7;@,A5?OD6H^dHQi@ThV0NqOklE26'Y+]AF
;NMlTmh6$((%4pNO3f/(:FJVP-Sfr2XeGY]A,2`8!CW"r'4$\=)2VlMAL9!a1Xf)m%c#U\,@b
5.iGHVH(p6+qEZ63Das?ng+YS,58)h+7ET!dNFIkL_7k3O%'$9_<@G?&kT'N$&^^#"jn:n)Y
*!nlKb[DEL"aR<H,kbqEj!?[/'<r2purF8Ys$K-GMqAN]AgB;5fpQDfdO^l%$^[4A1"Cpf.qU
tAau13:7'bo*Tf<@)'.ETR]AD?ut3Te\bRSMGjk5"ECU+G@BhVc,NMpODk'6]A$)2UDji%A8d"
dLr?K'`K+Me^K8:e&CP;"_\i6(is.IVlG28MbfWgY*Q*lc]AOLPnR`,?i(;/5Li._sQ]AttQ!b
JUCSsjt@<jg*"mD<TaObtp'?hclo%PO*'ra^:Ck?_,>I4&'u]A:$sYE=/cn]A[gn$)s/OC6Vu7
4!i6^lNJ*\R.15X#Suqs[UA)/"5Y;4a.3a7*Oc?=I]AG-pJ[*-,6#:/*hi2eWoKB$_6Dk.a<*
%7"%SEQVpVqsCKCh93>J4YJ%DI<.15,U!uQWIUpc\IV+Ipj<_FI)3K)<p%=k+B:grul6^3/$
*MnTE&gE$443hOd#$Y\Th8cJ"@=ZPu0\U_`Tom2T:UBE?kbpmA-#(")T\E-j@,H;.<T*G<qs
ZPX4/:#l*hco2c8)@Bk<0lsr<%6CcRUMl5Uc+Q;5HL+E+d-drK-!*Ue0:[?ip1Et$<(r'Qh#
/V*o^S@dJ"kQn]A/G&4=VcK&h"fP5>_4d"^`UX"3&'`u/?(G-XI$DSSYM,8GL2;gYJ?`Q":G/
j[UtQO/8-R5D+J`(AM`-t(qD8qQLn3+3E&,[eZVJ]ABV&#+$ph48g8)<,bL0]A]AR:H.6YMF1'r
_F:G/4JHQ/K%ue;1'Kg)V%Y2;c.luF&&pK@pMpr;-n,)jj2qs^>*^$-7&8;L0XqeVYR[=iU9
c]A%Jsi(iF;@>=)r^.pEOGf:PAR,AXDQm?V^BL3o;'OBUo?Z[:/>*;8t]Ap&Aq?E_9:B.U#286
N4(d=EcS46=qo!m^>o"&_/TJ-m"MhP)b%[ieAcm>3i2Z`e!G=;=T11aoUboT!NLam6=h:Z;s
JZ=Ve(oBJCq?0(f.m!PSMiP>]Ame%_mM1lS&#8u&\:Q1H?[B''66<OJ_<JA`Z=ZQSSZ!t2%#,
4=18>LjjbQrQD1&7#bfr8Bc>VuM8G?8q^.7u%Q>8g\F]A2gF[o0'GlXRX?QA3?9t.5$g16ki:
il,YfE_u9pZSG5f<F=da6JN>!Jp^<AYS'/l$&Y3_$Bbo;>k+3QKM.9a54:hBg2Q7e@pFb?6C
WW92R`WFRga*F`WW=`$fd6Um3SPguH=&B7Od7>b(c0M[?pG!EiW?q)O1+l-RMePUhJKA@^n(
?62"U>\;=&+C]Aj^br$>eT3`$q;#t)cq30r@K=n<l1mR>0f.a?,mP:TX'E^b5Kk]A#8Gg7USXS
AP#b"bTjBGYkoPVGm^/mp#)Q^5(eCHf;4HGM4fqg?;*WTh,oQMYbDU7(QtOYRi!TVcq+rm>H
2WE3*,CqZ;h7Z'(4(Ue7eQg&^AeTO9ajb!lqo!/pX;.IdPBALFl^u):XQoi;XOLLa#Ad/pRk
mFRjgYkFlLAir861o(Q'3uii&_dU(o:W&Nn;Ps`_V6T"%(0hu!5'O/=&5;A@WgY=I+cZX&DF
%92cL8m@_k:]A%\9VH'1GpgB_$&7d,FufFoV:C,@d`gW+=)CIT1BJZ'16YJJ]A6olE>^/O]A0bX
(]Aic&(2`D!rS?3[p8j14=AVu\SrBbu7.l_(V]AL9Z>:nF<XDlatnlh<.UQS!Zjd0hP2-WJufY
8"U\"He&Uh5*KL<1GQorJ+1M_XN1>$=IFpY.b,=K6b'5&Vf!/K#]ATmq[i,iB=;A/afI/RVp_
2AdM@&&ZOqF#'p+`?RqZ>_1,mHf2@>sSZ6Gn&V$h=72r%-A\]A6r-uhc@dds%_DV2UVKd)Jk)
bs)lLkmiQO1%kj#HI/aL[U5a>]A;f2/p]A\1j?'KPT7hXJ'6mFW::K\67f<qbdoodA.4^Usg!"
Bd+:Y83f=0sZ;j"$sTjPTm6>u@K"510-eP5X&R^KZmmD\l7r1PuM!Y%h?9/1-nkR&DDCd?S7
'8;'De&n\FcXt[b0\`K/1K@?H`%;Em:9)>^>TG,6XpLkAfjj5Z>*AAVLTZgD7.^3'gh%o9(D
DN"P_?4t<hgM^-]AHE2Dg!!GAYZs?.MnL)Q5Em\2M=uF$h(P@?"Cs8*7`(PCJ*udn7"t/ds%-
/`I@YGJO6%!>gcc$p7C$I'&V0FeXn$C)A^7>G@I+^Ca?NEnLjJgZU7HK3$)L7kYBQt47`N4E
W>FKYNM@cp<hNf6MB&XHe_k6jD9VUP.,HscM3Vn)o>oI?J9P,Sm,$ZZV-:3U3GRpT21sWBgT
4!Yq6D\cP7oFp"L7/U;imb/KPo[De@Fm0`K%WU6mC?SP4KR!1uA&4#C7`8rL[[c'1kYA1lH?
:NK*A[r?5:iQtTfb^/5&QRC<.MWf!RCL&5S/dM*8_]A;\F_,*m^Hj,#Y-7lH8Qh=I@(KNW&g=
j4TYSQtRFqcbIHKQ\Kb?VqMQa1q[;Vo*anYfZ;%!IYt2]A!-@8IDP+aP>rSJQgd;1IH>kBk?3
<?YO)G3k`3CVi)f>R0e7LF+)A<4Ejkp$2"3A__%r%2U\Ddo\#-to-4K0>,5Y`mWQ?05!G(hf
`&i4)A(_gSg2>r(8g4`2kP$n`sV?m:h+21_,%Hn%/_VZ_S(U??)C'R<cC&c]AAATgC]Alr\9]A,
k<k_qm\BLp7Ge;QIp.cml82V#ah%&Fta@K$02Pc2Qm,:,&Ol!l3-75aoo:E]A]Atec"%XE7*g)
co`F0n+mdHk"FXtL>JU)l"nD.$WGZj]Af/]A$G;-V]Aq@)#b2]ATCE\UD_@H?-X%^8G93%HgC@Xi
'iPiH@Xg"CEOBNQt7UViKrK$1)2tLH]A3]AjT/*$_Ji->NELlAP[P>$^ttP,b4Y(LTB!l,UF7q
7\tqM:Y(SmH-J]A21PRA[mZLj#@2LJgt>f3G;a/S$Y.h2%(-.@/@5(..sBGLNDmqjds't9I84
.1D<RMc$le8$'AiT_CWH]Au-hL2Nsl4WBgP@;+XFp`JeN@R)5&0bp5*-68#4546dOpW>)2G8r
ND^\a2X(j>0Ml-nrW&RU?M$)B#R\U_[]AI>*<8WtS-QA=n,B8YObt*X7b0ZH1:`jT#fK]A:;kr
T/'@6R.kn-/st]A'>0eA+VPAcld\o3PY'uh<2pWJ\1C;9h&HoMR=_B_t<YH%<^9?KOL7/A7A.
1MR>WCSgFS]As#_sEe+#NuNKDIto0hW(j`;-PaIP\'g&WrR=X9NC;7;[]AQOXt]AKk_g'QiL<Eq
$^1@3/KA"Y?JqugfdR=6r:4VV0Fa,BHj>dfq7A4^gMDS8mG_Ta3S'#0GP\*segm,NL6._ZV:
n9IVb)oWc^6K&p-o[BK2EZbVin_8"(f.ZpFO2t)=jpj(^W;Z#AXp@3OV>opj,9Y!EAsRf<H6
Tq@Ir-fUGJ/S5eDG![gf>9PMJ@bTS[I+Ba8RmkoK"q<RVTneUH]A=.iA:c?,4F/0+e**@t_c"
?5*1%L\ItMR7cjZ:Sj^e9^PLnhtc[NWSS0c\f.5(]A!RA?LBR'BJhS62?3IH:gnU%u;BPr:44
0:=_:[7T-PKWp6jeMHlFadr@5bt%Vd*#hL`+:ujf(&(%UGY=*PIZ;qP!;8o03nLI6SEUGq/K
0l3Ie$q%UTi_Q)McUp0Znd\^e@aZ'^!AH5t+,B"YV#BnKgjUib#`iRQ7&+JrF-J8'h8ie590
8IHC8]AMNi>cX_Ti+]A(!@BnEi&S,=EYr%Ve6BRLcU$Ca^*'0ndg.d!F(^f)ZC/G6\TKFOFe=K
=loWiU#TfJL?'f3BIo*b`RNQUgmT3?X?W:pdJ'"u3'CiL%#+ao(gPMYP)PliqQ8VQ3i["En]A
QtJ>K/H*Fo8SPYcY23*q`Z(Pf[)]AVMPdbr'\=c[4B-'huK"<CY%i6JN&3Zi@I"2$`OBQ*-ml
*K7Za4:hc,=d"VQQPLM8ncur1X*c/K;Ic@70ADKEfsn*sMs]ATW)KAS&%GFMEttY()%UW5ms*
q-U+>6GC1st>X*_S*NNa^jlHO0W^.]A?HC(@`iVMsm`hDC]A9=l*uQbciQ<mOg\h#=n_6nS3t;
FnFKf7eNk(F0?3+aY^=3d'e`=F);)+>qf8gJS*[#<t(2jnNP%_.V^hKacEd0qBf1890Z]Al+q
,/du@/%**NTuU.`CWMX'-$<D2L*@_Q4qV?6:TOV<bkgTb"$EqDNueHoa8bBmF:i4Yln(Heoa
m9;_R4[^Zg3PRK/2=)&FLC\/MV+X[@68&Sgoac7/VFh@(HtZ5\U7;$PEf:NLN"\<`$.$]A8nM
4KBcnTXJBunZH!(JBX<*fNg.:CImN3`aQ*Od%V/$hKW0u6\U'T5YUX\JWp\`k';d5S[)mL?,
EZS)+(fr44m!DuH2l0inrRo+8('32M$qu+%s/sGOGLagK&kGGt^,F0D1J^`Bq#>uD"2uF9Vg
TPk>WmY4uoU-]A?Hrr^_E5Q\:..XtN._'SQ`Y>pA@S6a23(:UIIQ,66dh8<$@I"Nd+N5Y>:'k
4n0lkT<UZYU(F($<j+ECBo36l%)QNWFE*nX?>0S']A:RmSEFhjSgq$?UC00('689YS?6N2\YP
$gu^(D)1A.L->LHa$@]As;p?pLo8L<nOU'g+$5!t#/B>&dog/Q\hI1M:J$Vu%31_jek[E$GEq
#I[CCuLUq)e\LDCT\jMSj,ng[*pS1T)5(/in1#I4[2(D1Zh\O;I+#E?OBA#-LIW6hbm8mQ?M
.Vl>BpOOu\\d1r5XB1*At#ETU?O=%W33_``YQm"$CP&K8!=$/]AD^Lb#X80oS2QZag0.0+2jo
o=sO@>K6cGkbrDDgn<=J!_+**;g^So,<ZHR)IE=Q*f^1-^MR+?1u.4C/`-<`ehp!n"VhQ$OL
>ljhMfil$Dmi.3L_BT(IBE(DkNIU%W\'q#>l:_!If90>aJ6X%]A@,/,ZKRML``JH+FlV;jMUc
p5C!a%8GgmpVFKs*(bjJHE*\;LZ2a''+5VYQHZ(^2ra;nJ<3HkDl,d#TfOm3B66aV6ph0H8m
F!Uf04us,-j=]A27&a2W06&f:NPd0)DsIVb<[NoP2k__h?FZHGBjU[6nFj,W=P/0a+jbBIhO?
Ijj#l'`VY(`ru=q-&EJ(ub'Cne9,S?CV_b1+\>s]AKXgn]ApRM9jb'h@uKD8"Oc@WWp1d1!['5
\P/#AbfnL.<<mWYaJR!V1#npTh>BRCP"&s(*,c#eV_V5@V>eP1=(7h(R,,qLfjf?0XNr,[*U
p<UXfI-((KfJXXYA(i#<5CmguiUWZ/-q"LdKY%r*ndmmO:9Cdb@A-#b[(Q?oVm\01V\fsIB1
m5\mpMlGjQRWie^Bmrbn0&m/+ZB$lUSt+XD]AZ$g^)G\VYb)DGbi'$aI.IU&WjU'*>S6ZirPk
(DFhF"\u9-%g\eXP@g><k6gPcc1rJrF_u7g.HL&jGh*Y)D7!,u4tAV0@4CM#NuQ[PJW*d/GW
G-[XULrk68`L9XL_<S+MODuj=4_.a,$nI=N(='SjD^MJUFeVZ<)6rWf3fa!3UL$j\UAj0M*f
"7JpT\\_FVmN,-k_A7W"aL([AaFF2fK^^0',!_p0LokackQa4dLC\5Yf)bqqAh=2rN\q`U_e
!'.J63>#F&Pr5#i/N4UmE!S0g;%oJ$Q&6e?)jXf$tIVO/NLQ!%[l)9\!J.Q=[(iq.OUPt*bV
M'#`]A+ih[_'6G$8NDtFH1d:,2RV/;V0O!jU/-\2A7E[GKfFh."e.Am.R';+'b<PIIo3Plqs+
,4#Nh#mT&1_)G)TH9W)3M!2&\BCupbDh&TQ*:b>YPFe1uRI_BfQ5,RM9PTGjRp5?F'AX,8am
ON2YGJ/nHZL+hJY)l_7hNb&qMlk!2S6??>Kk$3ap#\%):j51u:rfC)!^CH!VBZ=!!(:YLpUq
OC2%6MHl#5%]AjpQfjm&6pk\74-(q^^8q#9s4Lr'?WoYO8)VM@HH"<`cFG!HUf^r"SkFSYBjp
L/#q]ASZnTh&'Q$i1R^m!hJ(nBRBccGk(2E7+2_sel8R+MS0htI5,b)pD]AL_pJY/r?UBkok^S
'q.jD_lQG+LGlnZCis2-U[[fc'95!N"i[m.'KR:f;pe>&5RUG`q>=I-@#f(T1U$UANi:I5Ka
5%dAVR]Aeb/U25#KLBm=bUW.Nr*g/C]A21kLTt0sA3Y!OZeq9P&0?6B0FG(K0mJh)5IhP,`#m5
_b6:R\Z"$@IDO^bZ$+6*_#b3Zt_;I(d"_pLSK\/sl7$b!A-hq1J;#V_V[$NIakj1DYSG"!s1
,#o><ggL.7@OFofm,2OMZWART:;[I%hIr6I1h$kJNn;LaK8?`%&R_cLFsLmNc1Lj2Bg.AJq@
[r0'B6")LiUgJN&I!SN>*:Qj*VD'pW"iAHQ_$db30e&>,WXNA&#_pl6Kca=Sb[2TSUF\%&a*
XLBS]AV[EilJYFPJm:\Y2c;NT=g8XP6oSi(3cIfjO/p,-jjeI#)f+Yk,*Hq%I[Z'M_V4to>bd
PN-%o8]ADZoN0@a/S@c1mlUqU97&$);LIET^d,5<OaEO$dW:mOsDW9iKd?\4XIC9%-9t@ECb<
+d&0i!]ATQ8FYJgTH6Ta**P-6*^LeG?f+n:EpejpT^XMSaA%go)hRFJ@N`kWP:l/5hUR^T:>L
X)2R)q2"/O5)+j1+V6^Igr=8K16]A(*^GAOLbu4\$5<2^C`V.ajk^TD_X.)m1ik5@8DbGr6W\
P$2'&m8RV(iX;MZUe*lllXBMgM7nHA^k?1_U"j1$_L,9d1(8ism]AFo7?5:m'?XpCOMY6)H,<
<1Tj"8;7J.iOg%n..@G>U3>L06eq2\IA;Z)1C='#`Z*i!oA#]Ar.jEm@b@KGOCHfb8?Fr0W-L
N!q`RWefm9\jJg4O9/m9-GW1*lj&lpWd`4LS00W:).HmRl-bUodq;J.ej*F68i/oZW9)3P[D
2GGTN+pT>t^WQI[_iL6&Xr*;E@7/8?8-(bIg'6u,k!#rF3E,p^9OK#,%T.&:JkAdoB=,c7Q9
1q%/;j!R5.p*5qB^2mP<sCo?j#4.B=sjlM5:QVYXBga472KDK$@HQQHS%s2$u[\W;TBiE4L-
K.TFXWl>Ii3#-eGSCkOOGXb`U2UHgtJh*+i1n:khZG!/l*[AccEY[9Z0HA`3,=@IDo31E<ko
\Y/_AdgpUJ*K?SL->t5&g<;!LF=qd2Q8a2@N+Yn4Q/?[p5j6k8*K,Ud#uR_Wgc@YR/iJ0EcS
0R)hV14u#Toe4K;sYN9=o)R[@5#3>qr'j$\cRYr!,/j?[oB_1^Pf17:>VQ9=t1Z&U7bj:kH7
U5-`^_<+gL5adeOsnpke,O@^LWEu@rZat:YDdtHW1Y0XFRPQ;:K+sl,E`+,acM[qm(.R_b#l
T4!m/</21<FW_0/cfW,)BVAp:T2gSj93ZHBOn>jAZ=O2]AOgT28a=#;)THQ=PNEH##*r9L\Z[
cO@i=bkSZq"0V*61rc#O(7BO[mRI%C8"ko,8HN_C1b7J;k%_96\aNjA/:V)5"p(,fG"1::48
eVT2'@gXr-*4jnp'7RumPM8gjX6QX\VUcIKG\TKUFp=f3r]A$$RR#9cj>;t==[SJlci]A2brmt
BkQ:Fm#L:35R$/e57L>9Nt&k]Ak7p4da:UP$nL#-8#0kLRmd_>'8V9(0<!HfdTWL2F4bnAeM)
R[rPHWYuS]A0]AV$q"MG-/X]Aahb"-ob#oZKS/]AYa'WMmo*doA`6%\39EPO*`.n8iHN:M]AGU:n]A
U9F5*uVb\nB-,)M?"-#Rp+@Qh3.:<K,a!W7lCALMR`aC)lrU[FM;?s=&()RMoe`&^5CWhjQ5
\iZHu?)%r\%Eg$IJ([^oI4BU^fcIO#XK8lUnWYIMLMO<,-GAXEjf\,uapnMtP2WTM3t+?)S:
WaB-6g5qG6RM8:uQR@bV\'Riha"iXtM(cs8Rj=Q4K"kru2J6N1X*!'Y$4e\VQ722c8!#C=H3
,4WRKcdWMT6UnrU=$L!R_6ml'1J7n-OO@=`6s\7:p^We+/pC]AnkfW<=HnQOSWPKdhfgeg<A>
0_Z[_bHYtR;;:>7T4AiRnSE+E+,6Qdt?&$JU4=l"3@ogc+4YWYSe;C*4a/O&$q`,*P:iI):2
\$llRPHC2s8A$TM)iN0Qkt0CIn+4^E;!^L/_Q"N2YPkH$Ac"joc'pfrP49/cHV:lRgU''(2"
L`:C7F_R(0r51De4T$$cLqeWc0h.,-)]A#RI0.8B//;g%G0m0_%B?F7\f.W(%2;Ai9J3l9%Zn
F3)i[iApC;#(VHDiCSN(WK.;XaZA%\8OGX<*a&HMD1j\Uo6L9\3#9Bud8SRT`*PNtJ%nVJ-t
g8%gk296j4JMOUiC4QT1bFk^tEO%D)M*#A_r?_]AY[H5C<FCrq=/VK;'K.g9C?Am=k>C<JNb\
53'$"7KQC3BLq7X@3Uqm%72sE?^,=qMm!p42.Iaq<<cFkN2"p\R$WZ3>'03OjT^!eC0M)IK%
kiQYh3`beRet8GC$F%!jB]A0m;8VVZ%lFYJaI9Xd-7Edpk[Dl=G)1a15bB]AsS6'*tqY$MUZFY
iGGH@$Taba">D:aVo_jmMp>jnEN@*gr]A49X^BkmO(b*3m6a]AQ\MXg/^J/Hc\$?%d_&'(Bg=!
QrDtZEdKJq_UG'e!E8ApM=i_/P>[,oT,rSZ:K5rO:P*VB.Y\3hUENBnQO75:ML/IHLN+9Q,_
kWs`T$5U`/;"P2e^%IeiWVNlmD1qVV@bH4B$B[+c,bElW[T376/"'m&nLU_:0eUN%]AL9?75E
krjYW`>=`hbcgoH!`It$.ZAp&*S:6;"AccFs/g#%(K19CYoJc,<WO`s4`Kl0`ks_1O]A2ijg>
E7"?Foo%F^#.4(.qrNdfIXZT0=N"DYeS=<9_8L50-FOeUX3Mk7e6f;bsrql!jGHu6-TLG>j+
6;AEQ*iRjP.J;AsD6-FZQn3Ug']A"!\7Lj..R,W</'G[\R_4/k+@<V`,LC\JJ$KmYPkg8LIE&
G+FeNmX!RM)u]A%Qj^YLu`2f60Thm*!OPZ86%CkWK<Da<n9Cgm[SepgL6CDu503UQ:`ccfY"L
`f<H$8h&Y1A(aY=CD8aK61Ma-U.fn[8Ia:t_#nU;=HR0EZqXWn.N]AY%?`fK6]A"K?bG(U\&'9
\26$\8ECJ`$+&CPUPr2"ERlDmm<'KiH1I.iT$od31H$Km&L,Whb@\-W0E@:a(7$I'B/=GL\\
=YT*(c.l#M"_Pl9rlD5IcD+'-TdTPSC@]AlX(r:-h"=sMn66OFjadtS(&lHISSgY&FS2RO-h\
iJjS0Rh73>+A*4c4"9d+UV6L:?ClOelJPfdZm#BuB2oF-ZlC%]AG=390;LT/codQhWgUMm:lC
VK9@.hJ@o1"#:$WG;N6eMo<guW8AJhXV^e#iSI1=?t6i`#<H>>F?Y^\(mhgbGQ7n`(ug8ub)
PrZe,_1Is-tPgD-O2/o_9n)HJ"c97CUo]A[dg;@n_0VJO5AU`YJmr"YIt)r0H@[<s!>.,]AhYY
;,7iZV$`j<"V8L><)nN#6"-VmMXD:r/3oDC_/[AK4]A=%@RVG8;'k++Zps.cF5++A+VZK$i@U
'u!=PkYn<:&*lh"]A8hYbOA5"A`8)Qfg2!6).pf1@H+3YcRW?]A/D]AT7/:D6a@&p\$G/GLYnUg
^YOL8Y,8*gV2QL/L`?B)rP"U;a6V#%^7H=Vq^SCRQiem!XGm8@%?%hB2[71Rt%TPlZ]A\Yf7+
P/l#oYXu9P^L0u:=2ds\gB0u="l)_4j(lPqh5lZ:)s(h0O"KNca*-Ua,DKR5k4VLI?rg7A/`
XWTm?tE_pq$e11PYf`5>n*t;b85Iei"^mlN;K;_9Lpi>6'V`Bk&f$"V09r$[Ct,p%sqMf'*f
%\+882GLi]A!9jW#"_$5>@EYEdTl;j^oCrWIYR+u;iaYV5A;u]Ak+Gk`(E'@YX41YYS8OH`u17
$sZdG`9b\Z:8N1$50iF&@BZk5YQMno7q)kDZ[_ST:X??Ic:5mJ+'7B\3IQEPS<@5EHR,UG+S
?@h?CuC$\S!7(k^?5X7l+F?P!l*!<1"`Hg]AnD(361qRrGuD(&1]ACOA7iYD/P-,<neJ[#:3eg
b)`&pnP!%18:NAfEbf"/[!4V;JPLK9TUnJCqp>N*)Rb4k1V9RfC"BZB?G9\bqsoUP'0e>a#t
qa$_!lG.fF]A0oeFn_FXZL]A\Nd_&fdRIL4q/lJr"leg@J_YharjahseGA$o%X&M6d5;5E"UV.
sej,g!O]A3PD]AQl`EV;P>AW&:^M[-`cT9qbB'XupMnY.5hk+4bVE3B!Zrc'75\q_qWJBt$mH_
ud2\c!tgb7:955YI%l1@=P8o08N[O9?W\4Z?SBW_Q:\/+&:`I\G["F7M'dtN5fkV`$PpTG*s
p*?usI@DIEUlncW/Vhi5++K-7PGoE@s4Hc(\?T5./j7;Gq1MdPcnla*&Ej[S"$gU'=[GPEcE
LX[+#T=4]Aj*;NAep8oRlOS4$MiU%pgLuI;jbIM'$N&8tK,MH2fLX&JHkbnJcb4H%N)!;-Rff
:)[=c>.IXOG^LD@O\bj<N'h?Se6cd2pqrBP8rOeq[aL6aeOn1q+A^fAT(LTM[1UV)uHao"u[
DJtj-pbrV=aN]Ak(TD"lELs&4]AS7K<h@9b^R]A^\Q3-j4"s]AB+4WLh9Pc><[`.=gD%:(U.n=@0
-qmO&J\Qj3a4>@Qa$6Dh,_^PlE?W/;0,.#/Y/d\F6Hfb%Rf!/OK,E6gL7^OZa@oQZm9fRB('
8>H;KU]A'b@b-l9$U.6-&pBRK"ptb\j8ue4u*66eY1;SR+W-Z\kljgmY/5gMV+Vj:XhSFg4'g
OH:_(Y74-2A^snW#>I.K[LE&?m6bKLSr'U'nbDY]A$r?=d/pYHNln_G$dugW*H;jU7FMV!EkS
:=ud/gn(Y+1egZZ$s[=o+s^Q]A3c[5/[lC_bN+.lYVc3nP?hPeoM*Y=iND/&<c!qm44ZFPQup
4&S.nARos&Kg[5#Ve:)",>Hu@\[-c0/L"N3U`2$8)9m+#A(V?/R_->WO7Ks6:%Rj\"ANZ^?f
;bhq,?&5kP-@Z4F_c0S'BLXK/Ktonc-]Ah3jtP+:LM908%ICts,>R,X7khkP$c6^@c*3]AQc8Q
I6gPk@[m%u)XM.9T`pal-,Z.`hLG6uL$Bia-HgEI/8ZJ2dFlPK)Pq%]A"k76h'H@6bUsg2%-Y
6R.^P*aD3sUTA)YIbDG]A2YCeQ)J#l7AEP;Tb%Ij*+uR+3_il,)n(Km5$+]A=ST!kNreGAH#0C
ttjrFOm6Z$D*p\9NWmNY\)\BmeYhI*gi9aZ"!6IKh78jM\&_A*mAW/[9<+VU^N7d+b@2e]AMZ
'=m,fBFnm>Z/gNf/3joM@rf#ol(g]A[bW&DV(--#qeS]AlE:]A%\Ue2fju')`#fT.p*Sg^ik\2a
fa.ZD5!cIY^X@:ju\p38j!(L,n1+Pea^'t2pB4)kjDfqoWr4Lqr*94:ZS%u-8GlV-iE6eQVm
NRT=321(1eT>0RhitRi1ItSS[LoSdd7W$?O)bj$kD^_!3d!2nXR/SEH(VD=pZX31QO4BF<L^
N9kao<PQ6THm\7@&$J@9DE)9%'33q+%?-n7!G*:#I?X&O\->f@<*lq;G]Ar2&hb(0]APEOlZD]A
c9/p5%8BM1Je_aI&hJS(BD?.4\NjFIL;5X!_Fm#SB_8WEUUrf7FrXdI/k-?GdmNf,niG,1eq
cbOb=Lei_t;nZ:KuMuW81XJ53Vnb19jl%l,81G95fgA<DKYN$3Y5+-BLCqTft>euIS^c'mLp
qlL2"K%g]Ab"oK)9M2'b[TVF<3HLA(Zl/>]Ab104f?_5&46hM_Ff<6:oo8?g_/:JZ^nTOU*e*l
&f?P$pN2m<%h^Xb1Vn?I<$RN`n&dk6[UdtZ\X9gK1iRCe7>T'^G">H'#@<i6Z7%eGcX2uO^?
eX`U<:b5]A0@99P/]AEV4#+;K'dA$GJh?'@J^b[Q8EFC\[.Ph0c3=$]A0+#1)O_dkA")AkrTaSb
Tm2H)nf^>-7L-L>a`Xc=(Ce]A`saX+QF#2<blRNq2R"4W,_U-SmrjHEt!Rd+/<,KYt9[uQc.T
_@RQ1j*HoQ7"d*JPr8edPTTLW#Sr,(Ho_Et>NdMbY2jMp/D'GtA\2n+JF.q=%C[,UL`1D0b<
QBK$@he1_nIHi1!YN\Kee[_4[kgf]Ao5#TUL7r#[o(.Z1ZaR.tqtEG=iaj\/kLL2@+)PZiPDo
m@[F=^3[1)OTUYVDg%mSTDoo`sGHfqWmB6ij`Og6Qab#%-*M?F\Tf*#7B>8!Lnkn4CjPdK,f
"<5j(CYk`hao1&).W%lt)1@0F[Nrqm\&klgi@Hg=FC[,HXS&#*+\J^@KP$j!3-GUfZmL-fdc
sq>o=J#t9fA[CN(HR/OTjtng$"bDiR)Qt+QC-DW2IRTKP,J"=>qF'<n^%'&PkkMQB![L#s01
%H!%DY7?:!)?3UC6rK<n2AYCUDLAgaE<nS"s"Y<k5pY0K=>\dPTU5s:&*B%@\dHD0s`G1`]AM
6+_g&4EJVB,JTE#\XWNIjN3L6'A'DMlr1dahGXW;T]A0^K^D#Y,`8iA)k"u[]A6QZ,XT@`XOIF
"+3p1-PATXT!ZIoF*YpmjQaY[kB/O"lVdQF@ZP&9\N/0PHjV/r$s"/CZEM2lr*M"-]AH!*'CB
(&KCC/G@Jh0"L>8/J)bm%o\&b:XpEnfM#5"jP-*eR`hAK!,p'!0GMPdm%:R%'dqqpl)[iV-p
s)EXMU7/`%^H=a:eCmM:^`BZf2pnBc&XbHd@H!Ib%7-c^;\i#u5ZaUJHIi"Smu<5$QKK,(fC
(=X4Ehmq8FNe$9Ja@.R;hVPIgNRImR[`V%<4[N9o==Tlc#+9uHcANsB\L)Pj:aK/2WYp+n<D
="N=NKN*j:YMQBBC&grA0hT8TQN6hQkGCAAcGb&HWimmM'0cCe>Ur"gPjQu-#f),Qu&(?Au`
-=&J^qmJ/PPJ*/H9r>$IK]A.4%g116'iIo*+ID95.A+U#5e&CEidc':*9nYZ-O8&).N1XdL?=
-BioT29jI`?12"tYc[_!-k6R0'R-Froj&[L@nU=mmk1TZg>hFhQKpbFCZ`38X,4U`i\o2o@D
?kc]A_0'sr!-kT@`/0pX."f=Z]Ae*VD/qBj#Vd<64+YN'YOC1^/!6GS;GVqiOD1-o*!^<Bbi03
%YM%#N5!'Xfr2*ir2kI-t$7n`-h_8K!g%fDCrr9KW=S;:NLEJ/h5n::']ACY`%7Fj0u6Wg4@#
]AQMHoorsk8<$e"7VKloI'2plEsS7RK`pUL(ur!*BH%P3AFakB"N("Lp_A\4:`4kVFKOr/4>0
Q;;a]AJ\8&/_nZ+_^7<a_eCI</u91%F`!&b+u>Xh4R/q=agJrsJ~
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
<Background name="ColorBackground" color="-855310"/>
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
<TemplateID TemplateID="9ba0bb3e-09da-4093-8ac1-383d5620747d"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="628694f1-82a8-4392-bfd7-e844ca82da2d"/>
</TemplateIdAttMark>
</Form>
