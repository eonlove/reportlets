<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="各个国家中产阶级人数" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[国家,,.,,人数,,.,,经度,,.,,纬度]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData>
<![CDATA[7?QJBPX,_sY;>XQ@?O<IanmMh9A9hOnII&-<XZ>a/Zi"-^<Fl?I1,YSheqUl(k-POaiV''\m
O:p&M0/#=P72.?pP6)[+889X3:&+gN[_H^3r5n,_GGVU,2/??q'c9dE?e1H#n4s+-K9^C+.?
^lX!^'8ZJ/Cn`>*%(pB5]Ab,C`%b?gJ<9q#*4s$!!5%tB-ML`P;&R-Wd@&B1T9a@jZm:X6ESm
soJZN7jf4aV%drApNqBNQO6W3GqWD)gKCWmX<,7i//F^4Zg0$4o$JEa<[asUE#^GZ^^T-J,&
>\lB?G8I[m%M<YY"&drBLd;j;!\P\o""%_2m$[@jgNG4J`sE9,NIk-A?UVCc5#MTkd;\bZ"&
N3gNa\]A2^XP+cXVgrae_4P9nU+r$TX#OSAnENE$$>5pd9.%"eIC.P$22OiCLE&X4dpAB78k=
q-"i]A=PGrrW~
]]></RowData>
</TableData>
</TableDataMap>
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
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-14605511"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-14605511"/>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
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
<![CDATA[762000,1257300,723900,1903680,1903680,1903680,1903680,1903680,1903680,1903680,1903680,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[304800,1903680,1903680,1903680,1903680,1903680,1903680,1903680,304800,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" cs="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=now()]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=weekday(now())]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[2]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期二]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[3]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期三]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性3]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[4]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期四]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性4]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[5]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期五]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性5]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[6]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期六]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性6]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[7]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期日]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性7]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[1]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期一]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0">
<O>
<![CDATA[ ]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" cs="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=now()]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=weekday(todate(date(year(today()), month(today()), 1)))]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ListCondition"/>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction"/>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=daysofmonth(today())]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="6">
<O t="I">
<![CDATA[0]]></O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ListCondition"/>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction"/>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="3" s="6">
<O t="I">
<![CDATA[1]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="3" s="6">
<O t="I">
<![CDATA[2]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="3" s="6">
<O t="I">
<![CDATA[3]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="3" s="6">
<O t="I">
<![CDATA[4]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="3" s="6">
<O t="I">
<![CDATA[5]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="3" s="6">
<O t="I">
<![CDATA[6]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="7">
<O>
<![CDATA[日]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" s="7">
<O>
<![CDATA[一]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="4" s="7">
<O>
<![CDATA[二]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="4" s="7">
<O>
<![CDATA[三]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="4" s="7">
<O>
<![CDATA[四]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="4" s="7">
<O>
<![CDATA[五]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="4" s="7">
<O>
<![CDATA[六]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 = 0, 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 1, 1 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 2, 2 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 3, 3 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 4, 4 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 5, 5 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 6, 6 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 1]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 2]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 5]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 6]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 7]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 1]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 2]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 5]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 6]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 7]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 1]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 2]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 5]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 6]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 7]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="9" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="9" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H9 + 1]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="9" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H9 + 2]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="9" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 3 <= C3, H9 + 3, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="9" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 4 <= C3, H9 + 4, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="9" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 5 <= C3, H9 + 5, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="9" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 6 <= C3, H9 + 6, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="9" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 7 <= C3, H9 + 7, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="10" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="10" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 8 <= C3, H9 + 8, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="10" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 9 <= C3, H9 + 9, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-16463659"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="10" s="8">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="10" s="8">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="10" s="8">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="10" s="8">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="10" s="8">
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
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-14605511"/>
<Border/>
</Style>
<Style imageLayout="1">
<Format class="java.text.SimpleDateFormat">
<![CDATA[yyyy年MM月dd日]]></Format>
<FRFont name="Verdana" style="0" size="72" foreground="-16721179"/>
<Background name="ColorBackground" color="-14605511"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="Verdana" style="0" size="72" foreground="-16721179"/>
<Background name="ColorBackground" color="-14605511"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="Verdana" style="0" size="72"/>
<Background name="ColorBackground" color="-14605511"/>
<Border/>
</Style>
<Style imageLayout="1">
<Format class="java.text.SimpleDateFormat">
<![CDATA[yyyy年MM月]]></Format>
<FRFont name="Verdana" style="0" size="96" foreground="-1"/>
<Background name="ColorBackground" color="-14605511"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Verdana" style="0" size="72"/>
<Background name="ColorBackground" color="-14605511"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Verdana" style="0" size="88" foreground="-1"/>
<Background name="ColorBackground" color="-14605511"/>
<Border>
<Top style="1" color="-14671321"/>
<Bottom style="1" color="-14671321"/>
<Left style="1" color="-14671321"/>
<Right style="1" color="-14671321"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Verdana" style="1" size="88" foreground="-1"/>
<Background name="ColorBackground" color="-13947574"/>
<Border>
<Top style="1" color="-14605511"/>
<Bottom style="1" color="-14605511"/>
<Left style="1" color="-14605511"/>
<Right style="1" color="-14605511"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Verdana" style="0" size="88" foreground="-1"/>
<Background name="ColorBackground" color="-13947574"/>
<Border>
<Top style="1" color="-14605511"/>
<Bottom style="1" color="-14605511"/>
<Left style="1" color="-14605511"/>
<Right style="1" color="-14605511"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[Pue8Se,TI:;@GRk,^4q($AmgZEol#6A3s28W3DsE%4+nd,h\8hF"L8-:d]A8Q,NOYE,.TK'aR
T:(hgYUodI7*[r:bI&^%^C8kP]A\@T#^/FgZF_L2e5-`bEaa8Ag^C,D:u5F#5gYqhZgM_c:oa
(fs39em">BZdlWhpo1l)fk^)K)5)iKJ"T8$FhAMj]A@T')kaKAiuo.urQWF;/Ur,q`CF7hm-d
(MNd3U.[24?OrB*<FXIm)EC<c=C#VcLs.pjil__+*tg8*>FGO8AupiGu?MjYSq\4>&CirZIs
Gne?gq?6P$>Tj^o"*Fn`Eb'6%THCbTn2SafgB.rKWO5(^%,"jS1h\'i8=P/5EGrE3.0AQFj7
2b(!t>nrqTo'MjqiHn"m4P^s'V,i3u2:!a%T>Oldbc+6@j;>`n;%*seREHaK5>ZcOeR"&5[j
UcMP9W-23d%4>[=bBNP33>$2S?GYB@4M=F_>(\6bqdkra.^q>4WtZHVP)NReM4HFsdeD8pFm
u!^+p_84-"jVN@ZKHY-PppaofWatiMG/D<8&5iJ-XppW,eoGH\2+4>JXg.=Pb?b>U&FJ"7l,
N`b<\Vf3.i7l+9J3'<H##+8*h;YE60X<WXYgf,IfX[Rk0-gb'2)9pUHHj*4hm/Fng6".1Yd@
`L*q!?I<d9L??(=>MMrEi2_kZ*=DR%l_nQ"sHY,(iA'%613f9BU[@-?FsF1IH+p)L'8LjoC:
lgRa2YBn,fnL0Q/*29O:X?.GqY+,2R@3%)\EQhJ5:ooL8?e9$e,..la+)S!2EhXR]ADM?5/nI
ke=5QF!B7+BQ2>F04\pJBa0Z\W,%`g$)u[PjKVDc3UZOH2JB_u+:]AKJtQKhPQ?jfE]A=c)#r_
g**'Br=hZrj8QfBtX+[n^(I8o5P1:V)U<pg0#P@(!jKrgKV=;uTK(2jXMa*8A,r6sbi$SkLA
8OA+G1jJYb[9$SoO-Gc?MqdN#"Gcbr"8X^0obER1=MkEUrttU5#Jj&P+5BCg&T\.g-e;#+)d
jZ_=/@`Wt"lXgFF<5htk(!2ZIeTA7VjA!k"IphtBFMCsK3ho&2<s9<`t5Nb%paY3$G^"bj(,
jJ?.MT'Ka[q:l?H22o/oK>[/ac9q4D`YdV?=-*I:WTVi5l,3,C,<SlXE#\.2J2;;O,&%mpgG
ZGB=lpBMO\K$67s"Ik^>nmH74HF*_)O?EIiB^H'>3%C_si7HN9m'kJR]AIu]A6V(#<VeG>`L@:
g^k6jLC^0u)rP&4e3R*Y2rFhZa)jJWoK[jD'I?g<fCPc"bJp:IR7Jsn+@P)jUh%0ZCi;,H";
O_RBp:%'[8FMnBq=A6@WueIhgtC4&Nm]AF6.FX>gLd=SK<MaIQOR.R06]A`8p^1%*fRJjYipY4
i%C^_Bh[NY;-k\cBT%5[tuC8Ob.p.Xja]Aun(^Y(E1p#HV>$!V/]AAM0]AmH'o^M%R&rY6(Z!UM
O3,OZQrEg/;X!ttKSJN%H3RU[Fq<`G9#pj-oFtq\?=m")l^0'Cipg(G;\d+oGZEZ'0JPS4Vu
sAnT^4%0rF2NDetY0gM6uD&)R71FqfY7rYHA@La`KT)BPf_aU5tWOFcr\3Xgm';=h12ZH<%b
,Z#?fAj#;>A>+9*B0Np$_=6!fAZl$CO18\LkcLR/tNm=)?EhUg.YDkVt>Ji?9+LiAmJW>3/W
E.[Y.g8j`CJf'/#FBT3Q+Buc@q@8+AFK`T>uODecJ5CUXXmLV]A?]AMaIWf&1B>[U.C>8`D057
CX3cK7R:V_k1n9W96Sm34L.,oL'GH9s_@+bp&<\\M-(hh+(ma^Ih[%8:.<nObmDaJtOafr3(
bf4%_&.Pnd,0!B>.t3@:(-Z+;O1%3hK)`MN'j/krZ=W4FTX%1:G'>\pd?)uDY?GV"EHM_cg5
0*>.!j-f3R5WB0N8<*k]A0O.oFbp*&Un@1?IHl%`$brbG`"Z`1csD",?_$rCReTIUa?g0kUB&
P\sG$#J9pS!l400Hq&rs?M)G)hg/Y>O:qL$_FS&uuRV76I@*%+j_-qmKTOh3tRam2aJ[JGf@
)5T9)t"NqelJa0F^0aD`<-8OE,R=p'*mAN8N3jbH<4^YSVoOA/AU!3D4Eqs9ViGZbW<<hh@r
?>'a$_Ti.Khh.n4>7_)buI$-9Djr8?7iHhL3]A`oLoH#1HU=1k;f*b"Q*&ioP]AQ/a[nR)!uOj
)Xe+?<i/;Baq<,'b!'ha`#&U2#pUD[&S#]ADEc(;+mV*7eJ\QBuZ?fo'fe[=S&:d+Z,T?rP$h
C1_D)N>BnBkVQgt6PFXS!^*b8E(qF^M7)(;BZuLc;]AA$_-s>H"m'8,QCh\m`8J_2j;^:FXlK
)$hF+GPN&PQ)R=!a-rCRiX4HQn@e;'Xeio^tWNWOlW@uEfD`E"WRrrAVWrpfJU-;0A4/*OF4
?WN$BFB"+.Yqarbc]AR5R%`,9E%<:u;$_4Sn'!/*rjWg?<;k%',PkcTn<An;+!-q?]AXHnC?02
j!ArN,C8"kXdQga@($7d_?0K>F_=B)<,,Qcaef"+JT`^Wk:,Q$jsA_`?:-n`/@Ep2%^+Kda"
6tPX=r<f,q^q_"A*dr[;H*mP^`D0Zp4^^N.*PHlS4$7$2<I+%k=?`5WIFQBPHn+D5K=e%R@k
b]AU@P/B[12m*Nbk\O)&n-iY^!\k(S@Jh567B#jQrD4M`?/ZZF]Aq%-^G`gnMoU(1M[#pM*:ht
:=EX#E<JtK%'9)-GNF$(Rcdn+MLPd@ZL@At1pLkfJ#9qRono=,&=fU\7;=U9qp9P*;.Aq;/9
/-)gZ#U"1-`\-;`bI.'Zh`LYplEOMK7LXP+S9-NFJRkaJQ*dtn;@$rol7GdI;*_jWg+sNJs<
4C[TlS9le_o@.0]AjLK2>q^4p^(r<&XjK-f"Y"/):-IjSHOm2'#MTdq6jm!J:X'8D>ur5)6R8
c]A4\E[Cmf)eGZ3'e_eADEI#]AOfc!Zs]A^UQ-K(!>IqsrcA(%FqW9[/+n/.V1^SQ7)W9d;o\:N
.g&d9Z@k$9Y:<F]Asqc:V-\3"N3''2_Mq7Ub<*nrF49)2,`-p"':#c*h6&X41LGr,T;1$SjBY
0TUa*&$9n7cXmhDF5cWC)GEc:`pb<<'#KTijNq0MIY.Sh>YA\$d@(20=&V;"(8Z>&Q`^`@'5
u!NW2'dM`<g_fMrsmLbU\A-NN&>n!JI.+DA@Z.lO[HKobm^0>)$0/-Z@rEGga5&YH$@i40lk
%6U$OBK3?mLh%.0W<2r'/4Gf0`+XCIl^!E=TR*ADAN2Io2-^gBQs/mA`lM<cn[.Mj:o,o-3p
>_YD%,TK&<d/L2Rpa>IZW.g)R-&oq0fnK3Y:[u7&^"VDKBQ",NFQ-\NIYf#bB\Z'/cep:?c(
,JfQ.QFtc_\t)R9-nT.4i="L>sD/I3Mj?i:<41*Ah3e'?84:[hBMlaY'/__,\lY:U=A#OH:`
`>J\lk<Mbq00F@kcJo>D;?BWajR.KM('5ULT*T^/?9aFF)C7&M8;W,g:QTaE:a+=Gom"",a5
9ILZ9E%@ceE1PTH1b'_AZnIAe&[ucr%R]AM%)ZFeQFeHk]A'GA]AFeT4fXFrlcIGTZ%Zfc1W9c'
J(dpA=FdqQl#4n^KYj6[H=gMVIi&O!^lruuS-&n>G0q(UEbWK9W0$QLZ<UqO@`/DDJUk3&`<
HHg6g'0TE^YDej1W>56RJZd3)70D^E#qbRtV&D*tlP$7q'f2JSrg;"[B.R4@hrU)R:3Jk2g;
<N#ha0Ge;N5P"9+R0bB#5P*/B9EZ3T)ejC#^WgGEP5H[10e:D0s^;0<M%jJ(E";Rs:A%EgJA
%^&E%Z%Ia/YjJQF_CGVYMlOU.H&p&5!iP:,rYV$b4BRdh_LP@ReVH(*N/B-G68\rJ]AiGB"/M
CauDR)JZ!kt745g,JDA_59lmXY1R86)4p[MWLg"8B='GZ0Ct=g5Z=U&5_sZM/(26A,(LbiSp
PrgBmFX)(Z#EVKeq+`./j&A^5eql!IQm.5i="$/tO)_#h#WEg9*7k&joa.M`<A@-udp7lnh.
G$F)A&/jNS*L`;<4f)&[!l_=,1N:S"M_hgaLi]AP15N]AsES`G8-%jiLH^*P8)V4'@!2DIdk/.
P[JK]AiT"5*?"Gcu8YCo?qj;'sZ[MAEdE:V"oEo/WC0aA8?.B@88K;&t0It5kFuh?c?=$i]Alk
8I1Pa5U@T1II#^-]AC;2o#Cs)]AO0'q+3^pII_?quqlgbOcZXQcL0[E%cRP7Yn9*%U_P`Y:=`U
IH6LA&Qm*Lt/n_4hhNZJ(nK]AI_%)Q+`!tSo$\/I.8*bL38fl`bZom+c1EGdj6]Ab)r3pi7iRs
I;^p2hl"I&`/(>41WohXcY"!dV6;(UdcYUb&Bho[.IV_dJpO(cnhj^<@UcMk`J:q2'nOZ4b\
+*mj.k!,j:eM:S;pUYLZ?#E(\4@mpN+(X;>.=sNb0_ui7TA"uKd*g0-#X%b>4]A^?7pm''+I>
l0ZM#ghY#iuIBe\;m1aB;.6UA0c3AB;X`Dj4&L=A^?t@IF4GZ5Fm`PH-<kqtWM^SUal'WE/N
[3U0#GPYOT3V&[TO^,i\Qc8usOL*(1p;WmRb-"(2X@Y]Ac2/gq'/Ga/>inhS`W-`G@R`EbNM-
'G+dl_'OkFr@Rt\h/;o]A-]A/T8D\Kp!8kdJ5KgVgj\^pSGX,+7:Eh;FR7/hb`MYnWEJ!$5ilX
fW+/"P-\3SI(qi>c,O'1Zm8/4<Y7$",+?I"F&^S)"">'bLo2#LblGLH?a))^OA9=.\a&M[?F
P/g9THqiKh:hARiYg1`qkTetD`UC9#J5b1p.;+F&XPR>Hi9Ga,foaAB7XSpsQDg(kfu;[0FJ
->AV"B4Bf#maV\XYEL0'qOPV*D1OERsbE0t9<]Agp6cj3QDWf`=@@nEC=,59uF52[iONEV!kj
GS&9>ql-[?>P9YLb254s69G?5/kgo"3Z?C@#4^n[?S]A<r_Dc6:9K<*BI?6RLeoq]AZ;\he9nE
07dm(3CXXW6g:%rum.'UgsG7_@?(5-lO[?e$`L3>TML@$#+]AgMY>%\oW8SCG^GX8aI;P@q#U
?U9_o@9;ILlMoLP+d,C6h$rdLR6=J?I=Xu8_F%CfoA?[$X:>I3N&9sW.;QQd4MkSi=b2k1qW
l'Un$*FPh7rAGnr5FeiS0as@PfWM:rBc)B3HCjqH/FUI/'/&&-KBdH0:oUh!<8K7JYB=Xpr+
\K-XS4'e2<[cVDm028_#Q]AX--m<?-+fh>!tbO&DDIg6]Am57S0/<<?i[TDg(TggOSqT%IOh-3
#@Y%aQ\&sQ.g'SP7o9LUH7d`+4a;Ne3_2(Pi!'3[BGf:j242D.5VLJLcio7Fbf\b59jd]A&f\
qmo:^PQSk'GA[[I9?s'MJeX[U5r[t=\4[]AD+g`0eXpo\3[UXB"cBnrbZ-O%lSEa`:dnXK4r>
/U]A.=i.Xr?q!d*nE%7t/o^q(Q!rmV^SH(DT7%Tp71?$Rp7e?!N/QYTSs::5&i?l4Uslb]AlFV
dg!/mA<r"X&dDHPdoYWb)D(0c=lMguMt+<%TW&^7((3aM8.HlU@JO055&1Ur"UU)J1GUE%Ek
BbQTK0+tR.J"tQWiO;m9E@7DH+JR=P\SuhOBt:#^9(Dn^!o#,IPC2%oPbpUeB!+Y-*%9QBi?
o271C^._2&.qlj&c;7?;oXGHb+)Jl0Lp78pMaa6n,YWXu&lI8WuJ!Shl,"FVZlS1HB7?mru)
`s:#o`d`$?(?JPUJ2-e&\-q@fa9Eu[CbIWb4olRPO-cf!emZc?Y]A5/CW10WCrF9R#MqQ6Lsb
ng\,bX$7/6=t9A2hC#.h<95\4V.!N08"2sDU;feX?13Ig"70NY^W]APS$<FVH\[[N:q#mGNY]A
:6_l9LY`9u'[d50'l-;_7<nQ>jdso]A#q9t#7NGZC.%XrBVV:_Ma"n_!#>8>j)r_\rgJ3YG*@
+i;;ZeA_Ul^nqo>.R.JKmYtjM@pmPU58*it06GDUPC),&]AQ,097I1#UWi<)&"06?asrqe>Om
;H]A']AOD5HN+:,U1mVB>/RP*mI4eACDKOXb^u1+;4(o4j![U^m8c)$nN]AB&);Pj>[_PJR*i=?
5(G\6R?U+F#d,e2Y4=#L7sGb8-jBj"YaEMU!JITJ5`<T`VrL$,iF.HUrB]AX?j;jE=b??N2IU
[r-,>A6]A7,lK=e`[S3,,rh+'S86GZIY\1I<c-j:.*]Ab#btl;R!0^\Ok<VmE*H[.hss$E]AhL0
"#RCEbZXV-i)SKR(<f56)gJDq+Q!R=8%r$99k`eP^1Wg+J69J=8E+Y!'i(?k8@C!ZYpZDG(i
WN9/#Yp[fWpH'+kJ/^/C`!R^"&m3AN'_"=ETP<0H6;9\/oVLgB\CML@]Af>DHL?o,Pu/PjS9`
Vi&2&/>-+7]A<arl@0pHYkkGEm]AK+=&Hs,.HQN-[*S-Ab/8m6U,m`SihL!0:24IR$"g76F\ek
IF,Cc/o%-ikG=-QqIr!8pqiiL8sdCP)el/9?]ABikW/scSHHX?F<@-:K>(3emr>X4/`B2FhE=
noX@S=UA&MoC]A:D"XM`.F1[YNc%EBp.b#EE9HZ7C.knfd_M6"<usK_iFtTPeoW55f1BijIuI
Pe'6V8cfPEA`4kVs-CUH.q'#PE&Pm45@j#pUPgTEFmKLM2Ol`lY+7ekpi;TI78),h`8l/AVV
Fd;!r$QV?&&bK9h9eYg4GVu3BL#hp"@V)K+>tT8A3ZLO<lMl5oc\!pV+,6KUMCLNTDmh969;
Lf<eS<]AXZqi3A*-eg>QFWn"C%4U5re!1.EXM;lD1elhT))L9:@8"Ej`T%8Yor^U"-9'i=GBT
-A8'?C`\K??/-b0tcY<ksbME%B]AK&RQT"GTCdbb/mn)4MgXH'Eo)3I%1"UE^/epm,X*fV5'D
.6J_Lm(,l[cA#dWT*q)94;MpZUu=LKm]A^St7.L>HOB<@n$n<9oU!#aSg[iD;_)cc/SM?La^m
LEW-',^kVg0kJg9/cf*9\i7V`GNiU9.lLKS:B]AfLRmgn#0!X;'V!jmhc'S`c>ADbbJd,J22Y
/U=pVCR4;mo[gE&ZFd/l#nAU5KFM\=rP.-!FecG1paH"RnJ*3TJK6Pu]A<5oEfAb#RTRE&(jF
-I25//M=uMH:u;cT<I6AB-`_-sa?[EJ3is48^U7^('BRl@Z3C/n)4rreBQuGpIfK~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="373" height="262"/>
</Widget>
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
<![CDATA[762000,1257300,723900,1903680,1903680,1903680,1903680,1903680,1903680,1903680,1903680,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[381000,1903680,1903680,1903680,1903680,1903680,1903680,1903680,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" cs="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=now()]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=weekday(now())]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[2]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期二]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[3]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期三]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性3]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[4]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期四]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性4]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[5]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期五]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性5]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[6]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期六]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性6]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[7]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期日]]></O>
</HighlightAction>
</Highlight>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性7]]></Name>
<Condition class="com.fr.data.condition.ObjectCondition">
<Compare op="0">
<O t="I">
<![CDATA[1]]></O>
</Compare>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.ValueHighlightAction">
<O>
<![CDATA[星期一]]></O>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="1" cs="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=now()]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=weekday(todate(year(today()), month(today()), 1))]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ListCondition"/>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction"/>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=daysofmonth(today())]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="3" s="6">
<O t="I">
<![CDATA[0]]></O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性1]]></Name>
<Condition class="com.fr.data.condition.ListCondition"/>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.RowHeightHighlightAction"/>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="3" s="6">
<O t="I">
<![CDATA[1]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="3" s="6">
<O t="I">
<![CDATA[2]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="3" s="6">
<O t="I">
<![CDATA[3]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="3" s="6">
<O t="I">
<![CDATA[4]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="3" s="6">
<O t="I">
<![CDATA[5]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="3" s="6">
<O t="I">
<![CDATA[6]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="4" s="7">
<O>
<![CDATA[日]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" s="7">
<O>
<![CDATA[一]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="4" s="7">
<O>
<![CDATA[二]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="4" s="7">
<O>
<![CDATA[三]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="4" s="7">
<O>
<![CDATA[四]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="4" s="7">
<O>
<![CDATA[五]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="4" s="7">
<O>
<![CDATA[六]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="5" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 = 0, 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 1, 1 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 2, 2 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 3, 3 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 4, 4 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 5, 5 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(B3 <= 6, 6 - B3 + 1, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="6" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 1]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 2]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 5]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 6]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H6 + 7]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="7" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 1]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 2]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 5]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 6]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H7 + 7]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="8" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="8" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 1]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="8" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 2]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="8" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 3]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="8" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 4]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="8" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 5]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="8" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 6]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="8" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H8 + 7]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="9" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="9" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H9 + 1]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="9" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H9 + 2]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="9" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 3 <= C3, H9 + 3, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="4" r="9" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 4 <= C3, H9 + 4, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="5" r="9" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 5 <= C3, H9 + 5, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="6" r="9" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 6 <= C3, H9 + 6, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="7" r="9" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 7 <= C3, H9 + 7, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BorderHighlightAction">
<Border topLine="2" topColor="-16777216" bottomLine="2" bottomColor="-16777216" leftLine="2" leftColor="-16777216" rightLine="2" rightColor="-16777216"/>
</HighlightAction>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-3380951"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="0" r="10" s="0">
<PrivilegeControl/>
</C>
<C c="1" r="10" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 8 <= C3, H9 + 8, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-8078618"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="2" r="10" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=IF(H9 + 9 <= C3, H9 + 9, "")]]></Attributes>
</O>
<PrivilegeControl/>
<HighlightList>
<Highlight class="com.fr.report.cell.cellattr.highlight.DefaultHighlight">
<Name>
<![CDATA[条件属性2]]></Name>
<Condition class="com.fr.data.condition.FormulaCondition">
<Formula>
<![CDATA[day(today()) = $$$]]></Formula>
</Condition>
<HighlightAction class="com.fr.report.cell.cellattr.highlight.BackgroundHighlightAction">
<Background name="ColorBackground" color="-8078618"/>
</HighlightAction>
</Highlight>
</HighlightList>
<Expand/>
</C>
<C c="3" r="10" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="10" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="10" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="10" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="10" s="6">
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
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-11316397"/>
<Border/>
</Style>
<Style imageLayout="1">
<Format class="java.text.SimpleDateFormat">
<![CDATA[yyyy年MM月dd日]]></Format>
<FRFont name="Verdana" style="0" size="72" foreground="-3380951"/>
<Background name="ColorBackground" color="-11316397"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="Verdana" style="0" size="72" foreground="-3380951"/>
<Background name="ColorBackground" color="-11316397"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="Verdana" style="0" size="72"/>
<Background name="ColorBackground" color="-11316397"/>
<Border/>
</Style>
<Style imageLayout="1">
<Format class="java.text.SimpleDateFormat">
<![CDATA[yyyy年MM月]]></Format>
<FRFont name="Verdana" style="0" size="96" foreground="-1"/>
<Background name="ColorBackground" color="-11316397"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Verdana" style="0" size="72"/>
<Background name="ColorBackground" color="-11316397"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Verdana" style="0" size="88" foreground="-1"/>
<Background name="ColorBackground" color="-11316397"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Verdana" style="1" size="88" foreground="-1"/>
<Background name="ColorBackground" color="-11316397"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="375" height="252"/>
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
<FRFont name="SimSun" style="0" size="128" foreground="-13421773"/>
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
<Attr class="com.fr.plugin.chart.base.AttrMarkerAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="RoundFilledMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
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
<FRFont name="SimSun" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="false"/>
<Attr4VanChartScatter>
<Type rangeLegendType="1"/>
<GradualLegend>
<GradualIntervalConfig>
<IntervalConfigAttr subColor="-1495223" divStage="2.0"/>
<ValueRange IsCustomMin="false" IsCustomMax="false"/>
<ColorDistList>
<ColorDist color="-477505" dist="0.0"/>
<ColorDist color="-1019774" dist="0.093333334"/>
<ColorDist color="-1495223" dist="1.0"/>
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
<OColor colvalue="-3380951"/>
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
<VanChartMapPlotAttr mapType="point" geourl="assets/map/geographic/中国.json" zoomlevel="0" mapmarkertype="1" nullvaluecolor="-3355444"/>
<lineMapDataProcessor>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</lineMapDataProcessor>
<GisLayer>
<Attr gislayer="predefined_layer" layerName="mapbox"/>
</GisLayer>
<ViewCenter auto="true" longitude="0.0" latitude="0.0"/>
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
<pointDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[各个国家中产阶级人数]]></Name>
</TableData>
<CategoryName value="国家"/>
<ChartSummaryColumn name="人数" function="com.fr.data.util.function.NoneFunction" customName="人数"/>
</MoreNameCDDefinition>
<attr longitude="经度" latitude="纬度" endLongitude="" endLatitude="" useAreaName="false" endAreaName=""/>
</pointDefinition>
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
<BoundsAttr x="0" y="0" width="373" height="186"/>
</Widget>
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
<VanChartMapPlotAttr mapType="area" geourl="assets/map/geographic/中国(省级).json" zoomlevel="0" mapmarkertype="0" nullvaluecolor="-3355444"/>
<lineMapDataProcessor>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</lineMapDataProcessor>
<GisLayer>
<Attr gislayer="predefined_layer" layerName="高德地图"/>
</GisLayer>
<ViewCenter auto="true" longitude="0.0" latitude="0.0"/>
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
<BoundsAttr x="0" y="252" width="375" height="178"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="chart0"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="375" height="430"/>
<ResolutionScalingAttr percent="0.9"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="JAA"/>
<PreviewType PreviewType="0"/>
<TemplateID/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="437c7cf9-d366-4a00-a440-7cc067b328ee"/>
</TemplateIdAttMark>
</Form>
