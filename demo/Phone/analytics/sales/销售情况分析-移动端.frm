<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="商品房销售情况" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[指标,,.,,同比,,.,,时间]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.Double,java.lang.String]]></ColumnTypes>
<RowData>
<![CDATA[Kp4Z>K.mj%CZd<\oNNSYQNO$S60f_4d[;F`EZAs/4L=T6)*Lj3LR-?Y=O3?2f5gmtI]AoBQO8
#8X5.T8Z:;Q`c3<-:m\0qi(*/j@n4=a4ClhLTen^tjT*hS!2jTTlL569C3h>p[dQfn$b4PZN
Xi.Q=C.W7L7CsQ0+Oru5"&k3Uh"Q^luTL(hgKgJ+*@6,7Q?G\&!U4Oa9X3eUPJP?PqPL<TfE
nZ0[("sfZgpSoOh<+$L3WJPef-r,Y=KA*R<\)F_/6Genc&uPhJrudm$d/(u;-4.U0.BpU(h'
_-8J)>u'PeQp-^JgPfmV#QTjd\"8F1TE)NPJ')kCefj!\hsj#N;\IP_Ekol*AN*M$lKGHXM]A
=jPugFLSZ9^Ag+>l)CQ[#6~
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
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-14605512"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-14605512"/>
<LCAttr vgap="0" hgap="0" compInterval="2"/>
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
<border style="1" color="-13882037" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[销售情况]]></O>
<FRFont name="微软雅黑" style="0" size="96" foreground="-1"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-13882037"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[销售情况]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="96" foreground="-1118482"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="true" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.line.VanChartLinePlot">
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
<Attr shadow="false"/>
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
<Attr lineWidth="1" lineStyle="0" nullValueBreak="true"/>
</VanAttrLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
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
<Attr position="3" visible="true"/>
<FRFont name="宋体" style="0" size="64" foreground="-7894888"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="true" maxHeight="18.0" isHighlight="false"/>
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
<OColor colvalue="-12943151"/>
<OColor colvalue="-12531763"/>
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
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-11052938"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-7894888"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
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
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-11052938" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-7894888"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="false" isRotation="false"/>
<HtmlLabel customText="function toPercent(data){     var strData = parseFloat(data)*100;     var ret = strData.toString()+&quot;%&quot;;     return ret; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<FRFont name="Verdana" style="0" size="64" foreground="-7894888"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="false" isRotation="false"/>
<HtmlLabel customText="function toPercent(data){     var strData = parseFloat(data)*100;     var ret = strData.toString()+&quot;%&quot;;     return ret; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<Attr xAxisIndex="0" yAxisIndex="1" stacked="true" percentStacked="false" stackID="堆积和坐标轴1"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[系列序号]]></CNAME>
<Compare op="0">
<O t="I">
<![CDATA[2]]></O>
</Compare>
</Condition>
</JoinCondition>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="指标" valueName="同比" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[商品房销售情况]]></Name>
</TableData>
<CategoryName value="时间"/>
</OneValueCDDefinition>
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
<BoundsAttr x="0" y="36" width="366" height="260"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[销售情况]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="96" foreground="-1"/>
<Background name="ColorBackground" color="-13882037"/>
<border style="1" color="-13882037"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="366" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[销售情况]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
<Background name="ColorBackground" color="-13882037"/>
<border style="1" color="-13882037"/>
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
<FRFont name="Microsoft YaHei" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.line.VanChartLinePlot">
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
<Attr shadow="false"/>
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
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrLine">
<VanAttrLine>
<Attr lineWidth="2" lineStyle="0" nullValueBreak="true"/>
</VanAttrLine>
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
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
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
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
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
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
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
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
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
</Plot>
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
<BoundsAttr x="0" y="0" width="366" height="296"/>
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
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-13882037" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[864000,2016000,432000,1152000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4320000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="Image">
<IM>
<![CDATA[!=T)%r/"6F7h#eD$31&+%7s)Y;?-[s/-#YM-jU"W!!%]Af(`*/P!n0_/5u`*_m?p\)'/:3A`t
.g<#8'01U7_b+:fNgC0!5?g\giTSJuAs4hE6TQ=&;3!M]A`@YhY5sEM^TddK&BLhoRed.(.@[
8-CNGf<>!1E170uU*S["8mUQe3reI@(SR5]AdQT)+6V7$6^e8h%_CGoe.*6d8#R(c3b7F5Pkg
#7fjA4:3=JKKRHT5?uM=g8KTOmVKF9@sRBTUIQO3f*/1L#"o;<l=L[ZiT(Bo52ioL[ZOf#l/
,KZ_O`>Ik)!6dF,61$YBCVD!n]Aj=MlZZNL$7bS^_["iAX,`?riIC@)=R$L)Y*Epa9l3.n%-&
i#JVHVL`gM0C.ADJ0"1frk<*^m$@eI$?V&gOX=LFom_Q\Irmqg&QllX[OMC`Vs5q[,k)4EfW
lR\HXh>GT\saNhasf83p#KreX&Za>[JEh2C^C3aiAQMTa,,#Ms-F/hIr[h@8-g8QsGRY)[#l
K[$,Mb*=CdPTd-Qj[P5IY#hJXAlNQSuIOm:j]AjQEW%VRC,^enM>ju2@QHbnF'T@T11Z%Rmmh
L^CS5Uoj:D%61T*'Vp)9fB.mO)r)V_CkN_3+5q<ZEC.R^_h%=d+&q?kp^kuI49G9#8"u6YPP
->7f5U$3858-3D3ng"IoVG(iWAT,J^X:9eAu9C5ks?_'h6E=F+Za(k1dR1t[`e"2rZ%Y]AC3]A
C#10Ae[A$Y9X#hZlZhsc$IpMWQl"D;qE"FtYjAPj@u%'nZ*MiTgLMW@-`[1D#<!#BX-G8Ebk
;kY`pB^+5^=CPbU2'.+<<0I9ODNUIMcP0mqN&*%e_h#K15]A;7k#SI,rAtCXod5PHGGkedj=@
V*0?$`3tDa\3q?uQ?XFUYId]AUD7fG14:h)lEj_uq9%*"p`_m24`\#!/?/<a/<$n(!+EB!sK<
.nokT(`Ar`jr_n$bJ.m!HLHK^CB2OW;lnu!(fUS7'8jaJc~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<O>
<![CDATA[管理看板]]></O>
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
<FRFont name="SimSun" style="0" size="104" foreground="-657927"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[[9.-F;qDdRXejGi<^ljALt[HG.$e$T,*?!W>"<B\6m+a3/BCY$&sY^9WE#J(b9R.@i!@:m-m
BsrEBl,W!>-Q4%)P^EU'q&p!b?P"#_K0BmJ$GOOcOSPaZ8[g^%U1WjOgoClO=<c)X-GM)/f4
]Am<<l&P8a,d-80[`1Ap3Q<m$2DH?4s%XSqF2<b$>p1Ck:t^+NKb^9atap8-Y/IQqRpc@`OWi
S1b/1CggJSNZgT;:OCSm;_TP_Mi*]A&AG<T4M#:FUPh>1//mt]A<'AHN(crk%/I>N&_^V1>OqS
oa%Tc_ufInQJo?rr*3A!QY@p`D9S*JsgrFl0/bGkj8a/8at!eI#GNn<$t)NZk10^5<JSD+`.
/)hurn]Aqt#Q*D$Nn7t#P+AjotM)6>19FBY[i0Ap<X,-KA"Vtf/^Up9kY%O8t@&0(9PhSdF95
N^dS(.`GY'ebpmO?U3[<3Lm'[m/8j8Oe!,.`@j@[EUq<KhRmMg>VrX[+it?/:tNW$=H^.<S4
Ogl$TNQ\&k'/djs/N(BJ`KB>"',[;0DIc(EtoZd-*BLcPT8LkVcKiMZmp:$Y0idsY5DG/R&M
l7"QD_+a:16DjKWjQK'E2.KhflSJZL+@,.q[7eW8=Wm,H8ND&\'73cL4=3Wi&_.N:)7>FQI&
UOql<^;S[#)#`,(9e8Nf_p5]A:FVO.jr0@>\ASYUl\be]A/k,hDVeGCY,pbONm"b/&-ao6ae&.
/(jrjRTRB3YZGt;X64[s:VDf_GN/%=k-k>8ho$c]A2\1V_GU@s5MmB\H7ADR9.X*gkaMN]AJ+h
-rl/ftE2YH0JZ_iRfgY^)2ooW!K.7@]AKL3[Z0YW[&R-F>jZr&B>ZM4]At#D<OqXQh1=DRG>(<
<<GNcr[Nipe[6jbTPF:]A<I$Lt/=c\(IdJHr95MUmO7Zndk*h8j:fMhV(@#uS?Lr"*Bp$ru,+
.2/Ho@F3$?LAa\e-tI"R;j9TP'0`T7iHkj`TH&Z4g&u,?52YOULgd<8j#2iCMf:<^&H[`.4O
NZl/t!?<%VG$_?Z=@l"b=enBi=46bT)`c+eP-E@^tHd=keYZaoM$C8_S,cO+B%oHOI0PdK5L
+[ro?c<ZSO/RLu?m_[U%27Id-6Mi]A^pM6sBB;m,Qpra=(8\#!T4-6Y0LaBUB"ALH.\AtiC.X
QnrB6?pi/Vi`YO+`Ms0NB<So6K;&T"%g8<7BY#l/7Chmm+1n@sI,]A3&Je\!3WuTCVo]Ak'M96
eY:A296=,&6dqBkg_\aB'^!%iCL)U5KBekULc-\_c;3&Iq6eprSB*LLic*tCkLR^D^d:@It[
YXp*36;%:a;5+/93>86L)hWJObrPeO#VS*6UUXSMLs'Z6#(RNjp?'95dB<XSdAtVXdK>?^q]A
'14;LLj,[:Df$SDj05.Ol=W]Ap;n@$h$U+A:RU$$M*I4p?_PBj8q9A:h5JO.mc-9s:;AFWNJL
<JcW=+[4@h[$WBq&B<heB&#[`/p/Ic$KL+N$Kp^r`7>[`AD3>*3$t1[[D\oMN<_JN*]ASiTjI
:ef;V*Qi0JKF@TF]A^%RiNemmplZ?2ek=/9u2IR>ain@FFA6"7#,WVmb^"'Ep,e^<L(FM?DM6
,(CdF*C-ETqogT@@>%R;n>D1>6EMVW`0"FZd>\&hi8Bj`)@Qe`K38;fq<+[AJ7.Lau8*:JhL
FZ06C`h>JV!<8,EOINhcH=S^Sur59-2HnQHaU#Jq8<P6B!94d$<-8qiO2q1o_fC,3J?A"ARP
-3jZit%_n?+;=-munh3X+&6d,4cK"TW'#J95$Ga59opfHT&UI[>oV0Xp;VJ;ddp5OK[IeK(2
&j:KLHDgtqXCSj3Qbd2%UO2TsiUpgW6cc*[eE'C[(5^)_Qh:KCQo*p/hn^3ApPch;_;#u_(9
2ZgR<f9)>0XO,*Vk3>N*eCd'Xmqgp:[6OGLP#Ub\<PXBmEskrt_rp/%pain.&>]Abi\j>17fK
r%/Ul0*=&uB8OL$G`Z]A)f?c#)`IpN9i>D]A$c;\!\sHIVe?nFZOo0n["7pdW6A'2Ok_(S?`M4
h0f.4=oej#j4K`gH:JHpReJd1(!HeG#jDKr3&dLH#ZZQ/7[(@-O1W^m3'^sqd[%IR=K5cR`_
&[oV..Ogs<CF>PH7nqcnp1N]AA<ee0[c`7!kuS?&^YJ]AClt#W_H5'rcr+On8coNPU!YN887,A
QqFYEBti#*ctcpa_XRt"@pVr;^K48t<A=#2PBn#(jA'NA?0q*.Oti)H.17!>c:lhl8cr+hQ-
nl7ql`C<Kd/c,kBuNo,8lQcZD+0%iShEVh"l`R@j"X)(R=Ba9iuc1klZ]A4>?$ZX@#=KQGM!]A
-RJ1Aj.>%fUp,SEN1gKZGm5QnZ/IT?)G71kRIOifDIQA_S=s)nBa5I+iJN/kQrCtn_F:EF]A9
%JRH?(@//_amhuO#*7dGgL`pa$F"197s[C)/'3$3YDhFnM'W"ni:50\6QNLaW^0qi"jB&'/&
4F\oI'X"aik,HQf[JLkX-<#I]AV:]A(L0uNWr`WCP73CXlQ!NOX$XO5L2fdYYbs=>KA/*RUZeq
<2X=l@>[7CD:YM$qnR+k"lsTTpG8J2<b=]AXOgHQ)1Mbtm:.4Q9PU"K+DK(J&!@Lpblm-'F@]A
G%;Uk5JRX([!7<,n9/T]AJc[>2skI'X5Ul'i9)TgcN<]A`p<U,@3JN<[M=8o'IUd0MipL19,Kc
9kN8fP]A[r]AjDeE9bKf3NkFXQ]AT`18^-@8t;ppe[XZatH]ApC8RhB"73E)Jd\7_:)4!/*'97'[
gH9fG8$Y+'fLO3Q_X/%F*'&H\(mI(5]APVDj+*Mh#t9\,fhY8/5aeeR6%Id:%Snc[Paus4p)c
8#KP9#c:mi//>m>fJB#6&1n@7X*JB8j67(?SA]A^:SYFBa21PN9$U[fTF6Y+:5-(>X0`0B8]AZ
#]A5!1Xhg0EgL&>2NV,e"8ar-40Dc%S5Xj7W`Br"'\aI3%!WPC.B8OXL$8<pqo1AsE?Y5!s;G
=t0\<-Nf$`2Oc;QP5YXMCZ,^DSaR$9l6CUHAaMrc2[,D[c"S0dUAr3mA6D[d)tNi-+@j6!O\
MAZn1c37r,P9KqA,!(;:_Tu354UNoV.O)G$=I(U&E0r'(W8DZ1n]AKH6/R9i'r?)MS<%U72cZ
cP'o0rU>4>s$'l/YX8m%Z`n&_Tc(^.&,lZ3a]A'I\.2(hQ[K"Q+&:;C`KH2#l%Q$1(c\W#Ns/
:@h_@A#inXT6@oT.u')k@jDe7I=<?qlL^/H/YMUR0E:07t=H4DjnZ8FW.L5HZ7EC]A[3\$<%*
mHJAa?]ABDdh<BO-T0XH+=MR'[_r>f%\`K6a/A3Kb"+VrH5NOU(F;+!fIj!D&b>5ur$_um6!c
mcf-tX&s"ZEC+-D;='I"PW*jX?-`N3t9J&S('#0\'()YZJDT28(#66HZiq$uA[+V<Lp2%n30
REVJJBk9aAN=H-Q\`Y^SaFP4fKF^e1d$*\iQcF=dkZT@/bMOHe6(9l]A#oJIB%+SoGVbk8?^"
YRk]AO-ifWOJ8@#_DlB#_N[S?*(s4_;ilXlg%Yln-iRn_W(`N0EmbnaZ%I/2m8u^ni-(Df(^_
Go\e`$^_e9Uo(KNMq[WTN:(uMP925<3/VZl*<%$lJ%%4!+D@(Pmc2N_32Ior$=3^:(pO(nu9
^[a"n?+8;8D-!/0,mW:`I7`O^TXeEk#aM:`k\e4th`?V:.JWn:`!ogJj+ppm`9f#MdkE7)5L
kH,FpZA[GV:e`7_&1So:l@kiU,C[Wa:YYe?ReHAF3[&$R!#/FHN[Mbb:dtX>;.Wp0.nhNVWU
3/qZ-*#:1.';]Aqh\KeaL'+@=S`^8g3*hE%;&r;pelP6io\2Y'mY@CM)K=MJ6XNVH7g/_n8eK
;ep=[b(E%ff/Yr8p^@cbC7k]A\ut-B=Hjf7C72dg_uu0_^%aJ,38ORq#<#[OXQI/sN)=9)8D`
<V\NYCd>ZRdrU[%4@'h#F;^O=&#BuVSS40`Yd.`2Eu/^kJ0aB>)R!Ugc9n0j%;np-%V\G-&0
gaa5;:#Qr&:5Me:r!N$.^/!bF"FTG!KlHV?#_?EX'1+F^YceT,r[Rs83lVL$R?^RgNN0a$,t
_d7eFl5CY",Rd&#k%(N]Akrq>*(hnMo=\R.t'<3rg?&*,Stpa)n30h;VUVZDCat2"-5t_jZ8<
!>meU0p^1<$AYs1Q5aTsCCp9B0s"G[#RD^;HY$R-Ro@(4<rpurKSP-HX=T/bUKtY283Ul15L
_[GUkXml$GSl11J3iSE(msNM.mn=mBkBg\#?bO#jck]A8*JBuV;SI8K44./cZ3?WWH#iFW'nl
qPc#tN58HI,Z\OU"JGqf43[d[Q7f'io%%f%F!V/9K%e;:K/8f9Uk6^Y@S%a9Wij^6=.g\$;&
Rq+(2?X_ZWL#$C'(5jlt5<7D4Vd0)6k[L8\GH2e_[pe+D[=!`OIetb~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="92" height="98"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-657927" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-8730624"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-8730624"/>
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
<![CDATA[3592863,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4790484,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<O t="Image">
<IM>
<![CDATA[!N-!$rJ=?G7h#eD$31&+%7s)Y;?-[s0E;(Q0F.j_!!$(%q1eqM!cCRt5u`*_h3tlI"$mX@p]A
!d`fVephln#5I@:L`gfVHkp)d1,^YqX*_"@9C-[1^kP7)VPWiYaC'&</&pnH]A?P(o#@NQAJ"
d9/\kI1,JEPYh=HrI='2`HaAUHTrI?(:8Act,!P&nM'>M\P\p#sI:uuc;TORo.ZcR,O(\fd6
t=88N/IWL?B'2k804N*,/ReigF:p/W(<;NnDAn%*tI/e?-'[<_LFq$\TisT,GBT$T8*2a>8?
%U`!RVN%JAOp7=:h[imT/HRp`^"X9caW?4"*/#<#OLi\R25="Zk:jjD)HE>Y5d7Kug5B?NaH
KPL.6%1?PdSFqld?KE;[!Q(%;@MTQs5ifrgONe%s+9P#9V?+G^#5jn2LaJbq9i$XKG/QhF)$
?C&2(L5s'@hV7@<nlO#(-bN[RE&mUp,`-W!8t'.sm(e+=W!FiGTmu+(F2a;;kkm_G;KKR`o>
YfC9ur,]A4#"XPSuRgfXjm"57sQ44i_=?bcusTiMHS9u89*JCX@h?,5^rMB7sjk;AgU-)'Q4<
9e,`/@P9.q0VB9/mig1qgJ_b0*YhLZiro0)o/daUPnBj.+=mI[#P'[I:utKL5r)IkshqW&*b
[;K]A^UFZ@An^QEQ&$j"gjq<#go?r@i`X"iJ/;bB%ue6*Vgb`MU*D0FK*1p#]A.EUSPVF]AbJ,+
[BOW,%21*`[M>qn2I2_qnc>%/#GGe:4SPYCG?Mllj2[/U/SDYr_R$IX1TKi=7@P)W*:akhV'
rN?Z+qO%&sF#fHr;N%9!Q_p`MWpgI-a^HTA+_o`mH4hcI'E!z8OZBBY!QNJ~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<O>
<![CDATA[管理看板]]></O>
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
<FRFont name="SimSun" style="0" size="72" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[X]AGliP\D'X2J]A(dS@44d-75]AK*E8tK76,1QY<eVG;Tj_c6\fYpD&FR7>LmMV[S8Y96Qa=L6\
`j]AK>U`*P[m1eEo(XicMr)$.f[h;r@XH&qnDfQTD*W&qml1Y&aA:c2cj^U&e9\dCVS\;(Chg
:%u6?mr^%\&&sW72)MceSAoG"upSkaL(Qt`17i%Hcp/BJU;?st]A,fJ6JqEs"2_+aiWoSDM7b
)H$M#FO[jDTu0b=upGcNI&$M)-Jb`dT,5p_GSE606>/p>K8(cVqW;;`lHkZda?H>olFofk17
d[Wi?GugeU&'hYM06gLoZNcVM:sg2T.e^Rj2sPA(2323pX$*:_QGAZ?nmpma.Lb\'*_VZ[Mu
OV8H\62.Yi.seSI`&C]A@)m*m(/m$/a;H,n+kB+?baf?k4[T[B(@rn%?[k&u_1H<l?L5^&cEh
>e5/6)8';p4chHJuXS\J*LYV]APk")?b![nseg?G*V7208GS`&AlM[n@&J!D`11+JK,O4s11,
4Z0%A&XUu6Y8cWX$!L[<>lQbG$?!R\`mfl/"qHHMLAP-!L$n@kekLQTOZ/o$-Zf.[`f*d[A@
1q7@0.!=e#k?..^?^c6c4m:]A-3j?^-@YjDiR2eBDen1'kcRLG<%gsKR0ajG,RL^ZqZphbW\I
ogFphGO!nShVYU([tFR;22m0?8ogkot(s/0F8+$V8rOtbg*'<f[Y@>*):>p_;A=*!Qa=fTQE
5c?TPI,@&m-nR=KNm>hrM"RlZ-]AuC8PK2NB8/Fl'n:CC0U0bH`cughmd!X4CkQd.RHF<Z6U_
RG6U_D*0:si)r5RQI4902XEF9`$mCKffYH1Np[ji`JDE6Pg85WoY.MM4hnd@`Q[k@):B'7Q%
A['1LWqqOm#hVK/\ee(PaP6s=&.shA\GkdQR'T]ASu#MoU1$./\7U1>Mmi]An9!ep=o/pBKKiW
(2$gi@Y,PJjkkq8O=2LSaTX*g,TS`KM$WYlD;,%DAG)/7*Dp:dRS*(!P&pe58YoR?E'jW?^2
dIVq\2o,qj(J6J!FLV:AftXYbOEiYOL)6V:U2K12[["IlbXDs#FafBZB*f#ZF8jC`Ih/F?g/
9Hq8SKfDu>)9fH;EZ7b!&L3-uA>&clK1Qkdb3-CfFC31pkCQFQW::7Xd^P91IhjWaMa\UmB?
q=VXdDaDi&*o^NfC4p>(Kd.#\`JZqqL[+4^!/u:\.Y$3pnc"&B$r_fcSVJ?ZV;+V#&e=/GfH
CUW7Cp<Q%c8+frW=X!W8eq&1rP]A_MdU)7AD[$<Rs0('2.6&Se\Q4lW711@_[FGH]A#&N0PE=L
\$UsoV#+\CN\i:JjP:!W36/"IC[=*YTO]Ab'(iGDp:(@*TcECH;*D,t8OB4ua2-()\d.F(Hb7
RXlLefpd*b;X`TunJ3TZkXFk[h+.1D@D[/,J5^Ziu,p:";Z+$J&uNmf$inDnK>Xn-1M-:1pq
+6")C,o)s<ID\Rc1=^h>fC1GG9m3df`W(*ch(:#b)6&JA)]AH:l)u<?XQ;1&NV9Ql#d6ffb6c
bK[8n'[%R.6oLk1DG4nA(%D,o_m0e5m2h2\d=GLI_-iUOE,B/Es4oo'S(=Vjd:!KP(KX#J/4
c[fl]A<@2nRWWeLQ;mZFC;d#i-S*`C3Oid2[V.Y+#)K2Q>f&(rQf7CYdT,7NN?m,^-=-sh;r1
jZNR0KCOLQ9ntLf"CV>/^:^8+H175b:*Ee*IW2spJ$(t5asZCMoFmVi94@f?"9/-*W14003(
M5<m6_DcVO'rYb3f<6ZYTrqi>`>Y1*n"oNmt;+.`.iK.'T=`duN)]AL@-J#OU,Z`i`O;?QA&1
dHbh]A:D'-0G-os;,ndUS]AJ$Z84(nnU?6:btlE<^7'3B,"dOm^`=M[?4=fl2B%cs\?"k22._H
00u=\fa^QD?.r<n_CZJkBe@(*#s09\<'Xl(NU<Mse_Fhce[J7I?=HWJMBV/1ReT>ne^@g>nF
371nXbP>SrlIhaVj76f8Pk[Nt:kn+.RLI-L\`*hiiTbM&iIn-r:j[j3j2)gXU(pg\;N=bYo3
(7H2qqW\[b5`$PqX__V#U/7.PhPZ(#uWi`'fH3!2,rj)=>C"C>f&*L"MQUU5q]A7\heUq9dE<
sVAWnP^7sA6P:Lq$1B5QSfNPoX/CjX\CT#s%l:kQ)aSP7@NXHS&5C6&)He&<N2q+d2L[cKI)
_4rpKa<Y=i#'Fp8$nl`E!W40/eZ)]A'[S?8O'q`n[3%l-VHBoZ]AH=?!#44/gh>]A0mhBHa12lK
Ca4Os!+hR^C%a+TRoHScm$Q#mC-pRLGUd^V]AG<hDlA%DIq"b3MN<M)6Gp7p3M0lrPLL\ABu6
/[V-p[p)(=H3^.H)_a*!bk;!"Mj!K?]AS8lS:k#2!n9AkR_i/JQM&bjr)bQ(/l*t)H"5jSlF5
UqK#8r=BX]AT;LT5n]AiW%/6?[>"\ltG?^Q-hAWdPH<rd:>(Tq<*&e2=TJk`;:jK)5WAX@]AWa8
6FCj?<ISsOZ4YMTQB<X=,kGH0RDX;S=8:#>>0:k14f7'KIhh3$ZSL:fmJFA+O=M//1`n]A$*T
80<rd]AN!qh#3?cpEans1Hkl_;]A9F`+Q_C:EDN/iC)V//0rtL5Y'$?@S$lkW80@q5:E51I\*Y
&Y&]AMg\'5ll]AfnR%(GiCe\TfPDJ47Q&?nb/:h`_L&LqjBH&f%S.S,pLlk;V\7HL2J#s?j-B1
]A`R$Ia+[3G_b"]AgbiU07:briQ2>A#/m:ia[<h?^?Si/M,!&W%Y_8pYP[-(;)\M,MY?_?;6H(
l@u5ej28^Mtl:6aD7Z-,st^\g@3!:68Te)!.'2jo/&GH4FR/I\La2HXN+CNhGb>"LTQNN^qB
-X.3?hPg4O[@!'$XoWXNt[D.)DQM7_I/gt=+5`mE^,HD?aX0s_n99lt,:69g1-j92t@e5W&$
`;ff*3=%&B@YZBC2lk?kT%,#;`NKst3TN!7%iC'EVd=*7-AO8h'n//j&Hpl7Zk5K0iXn`lSk
pe51YZ/_L,fE&,=\g?)N.Ba*:13'8^mFG.:#cC(';Ri\BG;[!X/Fs%:sJC@4uYA9X#]Aap+oQ
a4M_'Jb*5u%l#'cj1G(jZp.lk?cL0OB[JL$-fP>#KG1hq3eCPj]A]A_59kU\i+VgZ.=HP?HhR]A
"?6dXpY.p/H)W?Vj5YP&/D<]AQEID0Vmf]A6+&[jXV3t5;;9LGKXQ]A#10fc4CCMaOXK]A=FPmLr
.%JUZq6kTt.%e8*V[&i!s=^a_lW3^[bWBsik'pQ.]Atd@tm1U6g4J8bK%/j?o-s"@_&OemWh[
(:cXJ,9iD*$">12ms^sRDMfdta!r@7Qn"Z&CDb\]Aq4AuTKgh";C<g0Lik?5oDZ5<nWC"S(B;
eQ.;%9sC4SHQT$6]AO:,X]AM#*FAsOP5it_L8chd&+Op)A:66'5#kcW=<<2Q.qi?6W"Qt)/,pT
_?IB,bRL$*Q#2BAa;pKQ'=I>%A)1DlnGrW0?G&hM^`a_HM9O,6SK8H&01M[uVjH\`DUR0Zt0
'NTmA.#74j5:!0^H.?2m3EK=o)\_f[!E=?=5RKS7#V;+cGUp+d>K+\r8]ASQUq@%R_n7k!:qF
@J9Gim'Yj]A$P$l]AI!^>2O?CXF;re/)DscdgtJX'm2-(aF,HreAd-k_)5#U/2M@dlLI"V%&`H
cCB'MKWBog2M(d&O2Er=<p!fI8.8NMC);T8N)7a32p$EDeQMTu8WQU<W=GG4Fr#N@]As-$MnM
)N1Y"mj%X#.1GA6Wj:NUj;]AN@22"@MJh\C!q76_A/UBnD^k&'?\)3l94fBjN<1T`(YDl1@:T
UDMm?_?lG]A>6'E/W_FMkt:bCOYB;4u:V0SAsLE(?i8<'qZeO^j7og^8?5>'8(S!drNQ&>[iS
7QI<JNReDqRnso_Q'2;J-`._fXEii2dm"T4A0;.NDJTdap'?8^e:uqhKH[?o7U6KKH[IiB?T
[?E^AH?XPG!H$Q[%f=Hg^Ob&QkfX6'aCJ%htqLoAOZjiK<V&gL*-ZbGCQZ`1._!2S08IffA?
QD5?M%k]AWk%aWVVfDtY%pmuU#p+U/n5qD9lggVMX$2<.`5`c&!XZP?n1Pf/"]AUbq.J2>Xi9S
>?&M'MG-?5I18#G(!0_0Y7#Il,N'"Cn&^k_FAuroKeCWuI^deAuX^TEo`d,l*H>8'^`H3]AcZ
rBad(C'6_6i9LbLhpJc)*e+L+;fl21Qb5%+uC"k30EBp#@_1]Aj=>uSp74MXCtjfc?u\A-;W4
(kY+P)FsAltr;01:QZNmQU~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="296" width="92" height="98"/>
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
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-13882037" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[864000,2016000,432000,1152000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4320000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="Image">
<IM>
<![CDATA[!K.#$rJ=?G7h#eD$31&+%7s)Y;?-[s,QIfE-jU"W!!&>%=Q9A]A!`DTX5u`*_@pjfg[<$7qJU
!O8\^rKboQsbOos8QhWLnMn:%.(S0a;`mG4s1.[Bm(:%g5otqtd_Gff,@=a/GVW)hOgJgmc&
DfDd04"82U;c4P!oJCPl+lJ.k-#R?oK]Ab2ZcEUItEnc/Wj$tK@2-2V*4BO6(%Tml#Z0-$U4I
26_@q=b6S=Ln&n".VJ]AHHs3jLS^Ol0L;f18VVjS0"o_&OZW="1qJ=4Ft\A-kkmLqW8cDf@=l
(W4p]ATc5sW%p_kZYtRt+?@NB1b&61f3E/Qt-4iW"BS[@<dV#).]AZcbGJE3oW?%MU4?WVL@AC
KN;0*lGip"6hp/$KFjp`#C?$tS&kcp+CNI-'rd16f'qI-;38<-q)=S[%aqoc7@[*ro[X*]A,#
<^qG`DOd[sTTa4o[DD./j5-!7^"YL1uGp:Q.>j9F'NM6Q0TEqZ>f,2%X[KKRqD*?H^Ch3GIU
u:sfft/RM*76(E:m6.6AHqYV3#h&0VbI,UV*9c`;?q`h^dKf<W/kMKDU_E+%@b)YVid;4m3T
[<`=R6gdhos=,Zd';`@YEF!O&2<;6`S3mIs2L[K%K\RTcbBC=^YF+`6.Z[r4SLH0(eQkT+b^
(QdD#HG@PjG!ha(o4>_WP_)?loukfk;>8)TpcXQd8(dGB<-Vg\65OP[tVgpG)Z6*7J3hSAL/
^[O]A2P&Sa^o,ak#77?@P5)@c2Ibd5-Nd:45R!+`KiY1#_>6PGT)rP$MNA8d7LObD!1VWaH+5
%Y7qEom[;Uk5\z8OZBBY!QNJ~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<O>
<![CDATA[知识管理]]></O>
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
<FRFont name="SimSun" style="0" size="104" foreground="-657927"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[[9%c9P\Crc[bHS'[]APC$UpO#oOd10YfQo'Ede9C)1!qm`;\@8JU<'tn='IF<XhGKt^3r[EP0
=Ue`"6Fq:*r:9#5Mp@,6mbrcZ>.dQ+,W9CAm[-cgAH=qjd7>^[jO":AjD<TVFYM>>%U^BD&:
d)n!%BP\Oo\@l3<en=MZ00b^q$E4r<=0ARUEg0@r*7eZ;!.duqSW:Pe9[c>eXO5!_u-@N@Fk
lgh)G9\GVA:th+o8lX]AD:?u68^D(od>]A+*RnI\d^A)Yjgg^(ae\W]A;egY6$qakg2M2^\AJH_
AS]AeP>;Hf;DFdGJZ7Xg29fR$LA\gn9DhJ[*X:]A61q?RB)Aj`g`E;$GS5o=o:iW*`\<Do_F**
rsi8NWc_ah=m;Kpk9X6EWG_Wnj[m,?<d@_ek4M[<6N%laDksr*').L^MjXFA[#U/Id`\FU.m
f5<kHk)XQ1ckDF=+'LlCH_u._6_LjdM<Ya@c;E5.b_oQ$lD%Ls&@>6DbiK@>4AsDAMmOipgU
i_OG6SMqD[='p\OmUlY`OVFHE0G._DXr5)e-[gN=lJ;C"G-GRQ(*@oC"44[$jgT')Xn=?SM=
m[a#&'-P+l#SqG82[NF<p#<_XM[(XY%M?X)%5Zb3a?Q^`*lJ1OVC/6Pj]A0U#"FnBAaR+uh0Q
9FSmQanT"1<1jfY+"@#`V;Vl+f'7B[PG+o[0Q3ogS'I3a@5))C#sOqT?`"P@9a.&]AiVQ@YX,
W@>+i@Oe'O<<L_&(:W.RE-JVR0BdD=Jg<l+<R'>iUZEgJN5DkS?j$VZ1pFq_9C\!HS?3;C*(
MWJqtf/51)CDGAL)$T^b?-k<5./>9$(-aQ&LmFG!S\+,+4L9lMHD.nEVF:45aF9SO9G`5UF%
k]AfW1+0tZ*^!Xf/b\mXuDYdUJ\^U-)p^.;8pEm9Y.9b#=;D8,prN*SKCM1C2Nc@Q,`Mu7Hq`
J/U,h9Xp#Un/U''nn711NHWs<H:!)d?6,c[q>iDjhQ='?WPS$MM=KqPHA>?nqU;AI+k+S6!f
O$T?2J'D_[%a%:dON*Sd?70bk.gp+!!q>Y$YH2RJ@,)QJ..ZddREqq1WFK]AQWu"/jNliu'7S
=Cr,[gH#>Ie4,Q>arklrLq^jcJt9>nAMKBolCJLE33Tf'j^i'Q-u;XkV%(pK7#&"+Sr`"qMO
GS7i#/852#bW99eC6o9+.__g1+'E#m0&%epR;m:]Ag'X/%m=#^I0IlkNfH5`\+L0RW%CX:C1&
S14nX!0R@9SR1ZE4?#d<]A:BYF?1Z,T<rN&AriM[(?!Hk?>o%rcNC?*A6G\bg9p]AR1q(WO7iA
!!m,@8,fY/YJq8p6Se#o.i[\.pmGL2.q`h>$>*!s6YhP+q$APQ6<]A_m!@\p,"j`W0'P4::$A
OVFupV%>BAH#-d+ZZD6g't]A/m-la6N5:F#;!NIn;Fj9M1O#O7EH;4`;.f$X^^-Y=]A7>>p5#c
rNMa#W_QU5H7'g36U?SZSqn7=YL<r51uKjTC"_3_6,\UYhq@F&HQK$7>?O5'RGj\14K2rs!#
[#hSASh,&&.@#:3J&-.?89,/)CDAWGoaWV(,eGF-gdJYhrq<YRfsQc166npCQn.EFg8X9$WL
"/2sd@DL;-W`Z:1CTS"EVZ$B]A4g8&GB(o=^.+!YHSC0sVGg#S`tY.1Mt"$f>e'T%^u,<e_R]A
Yphuf(ou%+b#R,q!i&,WiXk)HO9:_iZ6E,+!&\JadmA,T7EOo)h(bP6Rk"9&P3'c]A-_]AKn,E
1C,2#QZs7ff#V]AAI@)6rL)-d=Xr9:X,$^t=g!6k3`SVk9hOSmqQ]A?#tIV"A]A-dM*t.S'`t/`
TH4*:c-gOYe9r3P^8@EWSrk)GHrm7U*h"`Z8+$mumaBdhoEsN,F;tY]ARh$1p7,1hep%M5C!B
h8rTqRCN6pY5=kQu\0R_Iiq?1B<]Ao[d[L&s]A^jm'XtbI1EmWf3u(!HVqp!8,$;$r!Va]A[c$&
F?[q0\3J30>lLkjo[pr9UZn\;Ujqg-R,2TBf3X^Q"Ggpb`\p-V:&BTopD<GaF_,rjX:=T<X=
r,Iol+IBP=Km.;a&W:=\1<7'2uAO0Y./C[0oDks8uFFe;-r03"k"L:f!%WD8$85bJ7iE8^N(
IeBNQ*UKU=Yo`;&B5*b7c7G>R\`JHFS^`,+QC8:m6Mk>:B\-eQl&)p`5(3816PjEKdsY3DUr
Hrs2<q2oLt;13JopZ"2RD*XpY?BB%/T;a,V\)XL"3-*P$ocfK[0Z$;FD4>O_ij:,^/3tjZLm
;X#hCQ1ZFk-Z<i:!j^L[1[N9j33pV!Np.;.ZYi-D?[Ho2!SLJSZ*TU@f(X[@kA44ClX;&FZ$
q5N/IF7lb-e[Jm3*UW"5(egNdAB<KM;KA_nYMn<Vtl!:3lJr,pLi!ej5(8*BT:an9IUSSTH+
HJA5$(adf?"[X--(/^SjgLOTO8T]AX_+rS=00eDH_3("/.9E.)E[d>:&($-(Qn]ASg-KcaQ[of
+$CCL^3Sbl73S8'<9D9Q3GJPZ:u=W/7e[jV&ja[q"K@d^NT;s`i9d$!uV('Hi=AF#G-p1-#!
N;@V(5'VIP;0#^aM:VAs>9do0Go,u.16-64(d^(93EMe2&\p"*"g&QX13[]A(iQOTPQ9TaD^P
)"S#@oZrPsm<[!"chQS<?5ZUqe)mpat=Jq]A9R!dYt7<!YG\oWlJfDRPESGU!YF>CO@7F`]AQ<
_3J0q&<pe2ZJXaI&6&Pp0.3]A%-O\@O8*<-W7NLO([=q*1.J2.0^*+j`>l/-q5e@)R<M2#Y1q
mm3j,7CG;E)krY@FE(H/F%<N#,E9:[Ig^uIj`VLW%CV#qI&O*iHQjDSoFU;[./)NIE>$'1FM
.O`>$HDn/rU$q_TkDXp%<#D!7"MnPmF!'AB$m_pVajB<?K)jf*&Q9JG95.n)GAI$/%]AFom_V
)N=X&NKTH3nA>^$YSK3^&1)`_jcl9!>C-$G=BM.kHW\t2/:F(:,[b75\i=t4g8#"rLj_?(o7
S.)L;c[>b&a-#Q_R\?f1DbnCi\p_O+)c,>^E2"7+YL=$F:U<"_DV.@MX+nTgG7\J&M1.^k_&
]A0"n6-D77.m4IjFnoV-?C%Gf=<rD;8`!W3Q%CP,S\K#LU^-a(4X3@>d,R=Cl2FlOrPmrb^^U
1Od>)1!_uHnaH2?emYI`3"7ZR')!h`EPR0D9P\tCgU[;O72"k`W`V@p^834]Ajf]AbM=kgHkr^
@6m(Z1r@A_)R)ISq)^,dE+?m_7CN\-:N7DE'W/G4SEZCS'GiPq3N%:=2@jG'q.@]AI76mI"@V
!J?H4Xco@O@s^XT"4bmc5"9Js\5>^<J\Rg4#7iTDeTe5s"*'G.9,'Am0I]A7kF:Xl6a3r)so\
%Tb\acUTTQ'_O!Smk,nTI<eml;%JQeh*jCiY38TGu7_ejfE2!_kfQ`L82-TXB_(/=Z&;%C6_
p0/5W3@S7_iG=Ou'qQNHgY9q\++lM#i_kJBOIs"N#)SP67b(\A"?Y9r!6cc-pOCN5R8FlA)Z
3)ob;\4f\'B[GYBM'Z!<rSeeM=GL&>0pJPL+5*`,#ojOEu@]A3R,^F;2:BtG!V7]At`H*;AR(9
63a)%gX:&^B&2L)HU">X^\(f4.MFC:C?@sbGG^n0R'.rEG1>7t0qo`J8$6&F3.VSIB!]AiHM+
dY82@m/UJJ+&E4FOFg=Tki5)o[;oIBBMH0/j$$ho`m;E0QrEN1]A;nCY7rXo(Lj??C7G0W)L-
It!QK+Ui@+^J3fogi09Ib.%'k5>PJ(FqSG<C8dNL2om^fLir6r<g6'<MO+3mTuGE]AO-l`?Wt
XUqlD5L'?NW9HUZ?CLb9D)+4&806-l']Aq]ANLh"1,fjO9PF6Zq*=?P)qXV4Z3k#E__4D_Gib*
LrMeq&[*EbBr<\Ie`tr:Dn=1LK2AHb$5@5f^_;%;0%O`L;$)MkJab^o&@jr`kj/!3`f/4)$Z
.7jjB=<CP,t"Z&,":>4m/,]A(Y6;PXd6o300GoTs7Rq-mL@fR0p2thE2'0G2p20B[bc?9?Nc"
VM@MN!'bK@lBr\8RZZ\LkmEKdTQ%/WnTnE[BrJDTGK]Am0/,btk<r*:e;=X9hj=M0B`X.6W(`
TeIK#t`<7<i2u@Vj16NRCkdoqG&Vqf**=q-c;EJd#%kGXDmMn@(qS`V]Ah?P(*aNj]AGarS2Rh
!\2AUj"L^<bZ%C4!3u[kYSAi&T&e#,<Y/2V"Z,p[pi?GZF]Am3WJT=]A%s>2X>l$E*!UA_W7E(
B~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="184" y="0" width="91" height="98"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-657927" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-11880732"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-11880732"/>
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
<![CDATA[4175490,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4919957,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<O t="Image">
<IM>
<![CDATA[!UBh%r/"6F7h#eD$31&+%7s)Y;?-[s0E;(Q0F.j_!!$(%q1eqM"0tKd5u`*_h-/'='1!=.;>
dqK(92To/6),cM^X0Dd?B&H&;ggdN1uE'TU4#XTY:+ZG\C"X<jYkA'a;!BCMdP/el^-tPH*:
mC%H_ea\KFSS'>hoe"ll^O'uYWbl6IH^6shuj+N@ZH5U&/+="r51K'0pMNjPF<->jJ9Nu'Rd
_kQ/64AQ6(87[<IA3l]A,i6QI0Odb<Y(rBJB4!0GG;K/ULkEW),GKX^gM-6WN8YNbhi)"69o$
e#0P7eV]AYpoH[S?<O(qDPdQcKIC2TQ]Ah87&$(h2(@#a`RT/D,1RBRBX"<6s_r&qTURV_]A;9S
]A/k'R);sskne-DH*B(2*%#F-9f[[+ZEePlI0%.GDAU9t!dcu-IKSUkdKgl4;*&GdPc%WXABI
^'ESff'Lqk$:@C,eZ.dfh5&<CDX&dV\hU4^%r8<\$3,@\1T-N0,7_@6C`_GNX>(DD1dl#)''
YE,-e+,;\qh,iTY!#Vh:6E22_kWD]AFJn!<;W&CMUh/Go$KWK#KLR+LJkI\!.imseff83D^ik
R=@R?M[kVpLla/`rMr^.&rl!9GKTKq316lAa*2a+`5,gSP!_GKb7C`P;V\6<mr^M9%M-:'Zr
8N6gXEeWot%JLnEk@A!3&-UE8q6(&*YVl/pSS/Loj66NQ8[FNWq[7Ve+HJ]A#gnFEoo]A3-V[)
Fn1%*M!m7[2X"#aWJ6;/9M`loQdFla0`lqrCVVOc;%ME(Q-c(8&LeP\[q@I*312(2A;%n+nH
BMbo%]A@Z*liI5pk:lrNBpjH+jDcuaq'KN%9pfQ!VM!>d7@.hk7$u]A*qe6^XqE(I'XU[]A!d5"
Qd)4QY2pa-61]AXS/'QgZ!!d;Z.eP83")]A=`XZ3U#\Ye%hY0Henb&mLn/:;F^X$9)3Zl`ELo-
PgDLYL?bePIEN.K;LQ4HM[^'BsL"U^SIiQ@\G6fqm[5g,O2RLE>]AcRj[pBW`)?0fFdgAcK[4
_!h.=+E0^@TFQuJT.,*$d+6P'#AB4E1X>&rc$0D$DpU`pme.b#A>.@Y?(P`6XM-JW=ngm\EM
U<E0`^M8\2_MuArMQ>$n8S9YdlTh5aJ^=og245"'Xnt4;i(CncV;dq_V9r3I&P"nQTa-"16[
?9KRN@6fb?KtYei/:0&+sd+^kLAi48r^4'j$;Trc6U*fB]ASai,HXKP:I^M>k-&'MMH(Nr7/S
?J+i*1^YAYkhJ(Y>N\@b+z8OZBBY!QNJ~
]]></IM>
</O>
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
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[[9.c<P\K"s[[q5[.Yf%QLa'm]AC=Su#1EEhpiJELJ%^Sm+Qk5GPN7ok9BX^l:bgZ:(1A@0LA(
Yp?CPE91m>Mr,K[tf'le!'CI@.s=pJ^PXH$nb8qmrusqYe.Cn*bKor0Ob-''orV#(p'aCT"i
r#,C`N#,CIh:_e9iOnEZ$#,=>ebC8ck84e;HHa7kib%fT?U`250<QVt/qpbW:mg#bJRp;#Uh
@S@BH/45P@.BtL>1%\@mTin3:1!QAY?WY=KCDfsPBgXF/g)J7r5$r#-+f0P4Jqf_p_=2?<VA
Q,M"'`4Xq1-Ig=SLBZ21D=_>9j)7bb>S@d;"9IA:B7/GbGO^!K.7i!k?%D-gQEK*`.>^_bca
+jp(d1s`(gS/jkc.[t6?4/=`GBIRh;GJ4tX0XZ^tUYf`i-,-3`<uCK7[1B,kcCAVk$Xffn'+
'Fd.1@;HE+uZ3>o_[f\ZA?pN1[&G1lY2,MtRE7#qD9$!!5[O8%J%%+&FH8_h/jI/qt,O^[#B
`Dr=60BgsBCk7hK]A!B'(1XaL2h94b`+0J>)8?bK#B&YV^uk_60^f5T5ZG^7=I'Vcd9*JJE"n
iQ(;TZ]AV;@!R4/io_QSI[M+bSlV="'@,_T(=CTl1nR<Y$^1\0&rR]A$NN81ggCUD!e&^eFm3!
]AiLeMmu_MIQhU\q(8;J.V\=o7c\XoG!RGII!ZgkS8L5dql>TR0efC2keAjgI'#$?L^hGj\BF
\2:O>id'sa$[abR?B<clS^PS:HKU)53Pl./PY;;\&6:<(YdDd-Xc+<KADbA<>iI>^7[Ekkb%
94>q1q2eoj`1k*KX76YG-K*@2F44Yd.!/;og,22D*Ca`AVhQiq`hf\;B7j8_Rf1Vr2ePLsbi
P@a+te93IVcf/8.!3>nfUi28+1or_2ea&6q`\J-1WEhk#Xq@I<Vj1eb[Bk!tVn",IW`!u.)`
@F*'[!A3baM0AEjIQT#X1(5^+h5rY>OsfOre[SO92&)&/Co@9!_9t[<.@!tmp=7&e/b$4J_t
1gMpjgn9OHE5A_$f]A1Eo>;-k6T2Fskk.A3l+'6\'!qUTL>TPLJTU4GDnqR\<q,e*_rro8-+2
6s:?[qM8f$e^JfA1tebZVO/^[QF0,`j*GjY+Uj8J25S'2%khnl*V_G64e^^k/uCr@*rP:Zk4
*W--CFI+`+7#o,#L^)BCf4sj>$V\heHK_I>_^ab0[nl[^k1>4j]Ae\I%NJS?J51NO)8S[PRL'
:(inVX$h`ou7]AW37QYs0An4as!p>!&T6n(0a_89ee_\?6#KO?*-'3cemqeN]AH/t)M2E'mBfY
hBXCiPlf+kU#b,^T:#Vb[ZD*1/TF[l1QQ4Eq.[JT1%i-6(lh3S,&C1m4rT8\@5gR`W(QXmcs
)G[S/$CJUtb2'JjjoY>C]A%1%MoeLYBH/AY9gPQT@lP]AWTB&3UOd*=1kK(ON8@4jl;V]A,MIaD
_n3p(GO)Ho[7_c:e1N2<\@H1cV1II=[4(JoBQ8;.4\;D]AS`CI&0_P\mT,"/BcCaj06p%UQbG
gpIC&`R\F7QRnHbVo&1MBi&da5Fq?MIeKHsNOCmlHSD0&E1fWjP"TI_2O5:FI*qEJN:5]AOE'
5m">V<"K,#0rWb?,\C'\P+L#<ikIJ5!3n&`9aKPISChT:UIb?b%ldB_W*iQQ1Yd-#AY!dmU3
GE8tl4GlP7Ha@o",K-U/iOi7E72Y"Kf(u1l/JpX1/9lX_F*_cVt=.4D`Rfk:Kd'PD(kVS(&C
s7BQ>^+gKMR9qQWmA2dN%"O(Se#"gGtSD);\?s).1ME-@NP;MpA^ClA1>..RF@1*]A4Cn,,qQ
T&;kE>F[MUSmVmN0>msY.aLg\0h@1@_FRm#M.M*j_k1=tOY?sJGo+R`<2\=D"+a;qU/;_=kV
l!no07BaIg'5++\6XT*[i)5iEXf;B^^;uB6,V6+=8IK1o-`M$pLr>iR\R%IA2BcG)]ArQ8^E;
(G3`DX#mRE(K0j,j^%p2%LOL/Pb&aR4),*[C,;=5*<TslKBu9OK?Bg=q=7NpNq"P^R'eahe0
L2)$PUr0poS?(5%6p1:%N)AYdeOna0qgUg2L/,*UMlka@St:_cb7ZlY:U5jrCBt2dWj_3Ld/
&:NfuJnU8^BMZnBV!_<9Tmc95SP49)nm?E5(@V)DR[<5jL]A:LT]AgL<j&[Y0h]Ao#7#$fUEgQ?
nOK>>4=s"RNYq<0_^LT5SdAhpC6R#MJk',->GWpKD*B"UNosC7-G#j%d_Q[NOm7@k_%Dbt]Ao
j`^+D%5'H9GO=Y%jDq.[0MF?$Z%gn?o!e>eAu/23uZ&]AMNR7j`8)M>luZ?_&KNPa-i7,l.J6
U1"a&9RG>\$l'7F9XRa5<ODf#$'#\im%"8sSH'I8BDcSCX/0TgNNR$i@J)t)K6&!6W6K0n.@
36,J*j":nrT-ATi.^4OhJ\(qhUnYA`$-RP3^:S[]AB97g1=#GH9-&E'O?8W6oO!q`anR!b#?,
V,GN([$?^5o3'mAj,hFl,VHmuM4N8Z[%B,spcKiJ`%;85Yc/Vo)l@&2e"UUAs:fe'VeA#Waq
]A53L6dqrBL&rcN3Lc899g+,tFjF27kS_c\_k]APZS!,9S3rt!5Vs6&7PqJC_Rf"$G5oIf2XY,
iijE6:n-c4s)2-!+;rQNm5_Lm)'M6j$Na#-EK,g8+W]A.d6c$45cbO@X+fmF9P[CVekgr;p4#
'gM8N%h;b>jLVFZ5bk'u_1HGuaqgsbtaMC:=I>dK%O]At4#-olf?ga$Z5d`CkGL=9"DRQDcaq
RQA=8U3hhT$&;<Z#[WQ-$?(;<#A$cl+`)3%ea^<8B/<m^JIJN3OXAaQaN%:J's2p6P(DghFW
585upPX^El^cJf.8ggdDAi8B5guK+3tGkHgh:b04?YC&:^)89rnY-)r7\B`MmtK.BcZ/1UmY
n)_M/"Zq]AK*\.M8jKM`ugs.GAm:*b."F6)FVuXYK?%=$E737EA&Qp^?W^Okj>bm6tCY0/d,N
mg*Q@?+C3G$Yr^sV)U`[3_\r(#a*2g+]AT,Z1!8U5(Og*"J]Am#!($3L?:c'Wi4%@c^5KISkne
jj0es1o5e/;`!\>0@kjngP%-9N'![P+aH7,KI:&c08i$Qqd\]AH5E%s%CW<%iXVLbrY%Hd[*<
qcXo$ht!FC'84o2VAD+`S_(H0ef&c/4+i3I\Jp"PZLJ;\>TQ+B<eK7V'Dd4Bn(HgY]AIAYWs/
f`/.,cQ)Sno$H1q7W=Ejl$G)Ji"l#&/a8.)=pKe5f8!'3?2V$kk1^NO,''#<j`_NpUG?N?+b
40mPs3mDb?Xt\m%hFnR7'Yp@,3:hsRdJ7N5SN+OMmir=?c&jk&(dP?F5\o^t+EVgfJ5KW"g4
J"GE<ms^X0?,Y2KTUaN$\k9Q5a1U@iif60f90_dt5q+?)*?LOSp@dP\/Kn6h['uAmZoIq;]Au
>\EU/#E'#3[+$US9b/,;dR7-8sEg8?0,AqQW-eX_t9dA'373g._87Y3XJ:T$[6;T')*I_5$$
n4`K6jWX(n2$<&TfZPdVnk/e5LT9SgqB.ShdYr1.BQMSe'35jQmK+F<nOJB;>EW,r'LA%P2P
?ojg*<u:dZ*6AC0'*"fdZhRe0Ohc1`%85pZs-(&:DG9m^7X8FjD]Ad26.p]Ao+99@WCa:OfFSY
=a<("ZDA(n?&6#2($NsmeDS-+P1,7,;T3%BdsJ*O17$eh1t_;XUi;nC2_b,gBci.1?&N442)
'QfIosom9?:0>WM6@O1aI<.ns@W,qQ%.TgC[7E]AiF%L#)nX>_c)F;39#ug66ZGP8)h<P/3k.
WAMu,Z@g_09$O'+_H[gRU^F^lj9.Ep\>f!d$TZR"C2oEij@EMiBQ.%[U+kONhh3+!5]A,tNa.
B<]Aq9B?X?PRtFXD0;U=L1kT9OduPjc=YLRXm+9t"g"f&[QrI&"Ita$NcWa"WYsS_%;:cl%gL
1KoDtOcIo#K_aL^S)H!M2o$Fr"KMETtVOEpq,'%qG?&Q3"BJ9un3hI+F2n;RkgXg_'#)+*!I
YA#VWIg@>U[N&0Lli"Ucm.ujd\6GFd'ZWB:UcS[8ZA^&X\)91)+C\`4Tm-g"7#fb>VQ$X^JS
WoGgJIc'U5YtE0,VG-NpaVlI^^3XURK5m`#'$gaS@BQXSDtqhW<)&jTB7YVWJmf9:)XQ;A[Y
r8H;@NKpN-EV%\Xm_%EF?)t9LWi6!OFetW-3D7UD4K5KX"LbX,idl^hP`+1:Hbms>h#=3S8Q
e20X*B<#jf9CB%C1EI`SGg?D^gSk:)#LmiQZ8.n4IH)Ldj=Tk3&?I:,G!ECNjd!jI6^IQ&(1
-f_=$sc_;;:E<]ACeffA46:CJ>F11$U98K2%1W)HPHjI05`O34odMpsk1SkS-)4P9j.>g^u<)
^`O@Dc8:-)@P8RnIrLoNI7O>-@OUR')lbHhWB/&g0Nt_PorYWL%;Ge\BnV]A2_0tGod#>/Z,.
,U^dD@&qi!<Lc75[Y<NWn3Zd)WcG]A1jbhH;79Hfd+(YYc]AgNJ(P%L8>HDE[IFjJ)K=B>H+#i
"LjgphZ:+#e^29cjE:Ue"b_-VD&H[cBs(ucF>96t.0+k@D4B2Md8GL8m5Dl0HFMXfW*<.(tm
q[@H[Eo`g%f8Eg\E^KkBX;HV"IO=7IjJ@gQ/<f%3WDoC>NNlp,fJN]A8M5]AZWaUd:^%F6`C%r
kPNFAUb+X<^6Z^"s1rGFO9YP1``*1?$Y3YSe-"9%W@iG>.$m@.&S!r~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="184" y="296" width="91" height="98"/>
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
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-13882037" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[864000,2016000,432000,1152000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4320000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="Image">
<IM>
<![CDATA[!QbL'qMA$D7h#eD$31&+%7s)Y;?-[s/-#YM-jU"W!!%]Af(`*/P"cu;D5u`*_bun1c*(:Dr2i
'hWE/<P,F*H4$3!fkBO[/&]A9727T!J,iS&E6N>5bNqN>iH+2#9Z8O$6KiBMhF>\$/u:;6A3.
ull)D4"C`Ph5YUjr3d(c?gI&ZBmb+1Ac$C/l*N<W=lu^S>Wd7[KHJ@/Nq!pOcYFJ&5nb=_Td
o1+cI'o;TDU,$e3RdNJ0Pk`(b5ojlc>e,fhIN[I"(^81IcYpWjo=5Rl4#CI[,'EJcl5)Jk_!
73Q=2g52ZpF6coWq";@eC!nL\K9J+C0Hk-m=*(Akd4)!in>BM7,7RGDf1>neB8:"O"YCKTRg
"uiK_ou#"flH,0$Cg%r?nf'L7+Q1>8ah`n[h'rnMfDoN[PLj'?k-KcNYfFcYn"-7"g>`=sB/
f\52+kYN\U$;$]ATa4;W<U,q6QL:*'[Q^33k9g48$Zo;@8`'hDC1LPC#M2#gP<JP,hP5-Pi@N
P`&9j[=4&!K[2G]Ad('<X;$MMh\WH%3KqrVa8#J\d=XP-bB+$)_Oe+)hH0t`VlC!"P]A?D1^$S
p)smQ=Lua/H&oG7H.d*fk,)2?RYYmQrJl(CHII8F$F!:eN6%rDH;US=2ZZBie#CIH%B$A">#
Cf6M=WjWWpu+Asd[ooZRqnDfrR8Na7<*\5j[h.9sGkL.snFQ3m%#C\T<$A[Oumg4[EPQ?upD
eu$KlJMd*?<ok5(niSHUkIZQ9\gc"#T7V?1>BVN$im%f1D/m05;VAftMh_qrWjuIH)J(TUK:
!>C`YS/VBN:#94(i(*I"phOa5@.Y/%^&2@6<;N;XNa#M\@<)hs]As9k-/tm6)n_U5gJP5hFj9
=>d,`F7]Aahb$5Vg)(joX*T@6pa4rW,u45">T:p+msPNLFa>`8_]AY+C;eRmk7<]An*]A\jiY.,a
Ni[mS3<1+fcbWm`R[X359W70Cdc2YI?g3#U?1b/>sEZ@eKqh%QY3e58^BiR*:!c6`'>88>R?
gC=s[.RJ1K[_.IZP!H$`G(:;:DqmbnT"dB#HdFJM;5J7A\<\?t$o[7WubS?lQj,toPd:KTj)
aNDRA,OU+S`\Q?geJZl3M\q+<RW=VLNNnDfN30QoY1!c!1KV<B$IYBM+u?4AcbZ[tZpdJ]A>(
%!X1bY&thAfM%#[e4qFEU0\O>?n+TiWgl'GV=M-_$AocM>js6;(f4ApM'MfH<5:[($=f%*Q0
h\R-,M>P&KfZ*"D(6#UPXA@t_SB-RluNr]A9PmUT1VH(-aIMAaEV+L5<P(<#"4P",'CWm$"@4
fB@%V_p*g&'E6I4m[H@a5%9*)?[:J^#[HFJ@[,.Qqi/hku6f1VW(b?@',u'!(J3BqO^LFVOA
p5T#+mldIV:j,d%KSU3A:Z<'6K,9!IPQcbXp2bF.@)C$"4a-EOos.rY2+_d:-ur9Rn@I,;r)
'VN?[JG\?[\`kV\,f=(XMZX#Al_Pp-f"u$%Qu>W>(A$J-A.M8lki*=3s-Jq>0F,e.LA46AW&
b^nrbJ>f$Cc2Z.utFbPHd_!Z3[<Y/U`rq!0+'pThmSM.Cb\WEA(Rf_YtQ8^<0]A41[9qU(op^
^";$@f=W2(-'_X?)k]A)]A%b)`=q*1T]A*':a9nMKhR[g@I+4HQtdQ&5`%sorq4)ac2i.PsDc;\
`0MOdrKFQH=O=437in</;XaM>/<ElHFa9?;^#Pcf_d4qj`t2Xis2[dpiW^mXe/-4WRbgQ6\6
(g(*:qi)Of347^2*1Ba5'3`F/\lgqF"[7k1^uqL,a@/b64Jh;(=gH_b5%a$>Eqm_23CaSIn$
.N1@)QMU[ea/htIB-Fd)`f(C1$2"8Wq?JP`nZop$@S-V#!!#SZ:.26O@"J~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<O>
<![CDATA[销售管理]]></O>
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
<FRFont name="SimSun" style="0" size="104" foreground="-657927"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[[9.c<P\L#5GM@G-Oq_BPG*41^--\D&>DYtK,+1tg`NV_TL+QP`@;HnK-`=G+[DE1Y,H"6Qae
@dCXEeiXK0bN-k'[_,qX!pYhrh?7r:N2HgkY4l?Jk'q?2#"]Ad`cs,R%2fd'e@k'*'%]AH@`9-
(.oq&.m9a4P,B'oP-!.10>@hj%n;L-J]A6beAmmL>B3og-?lBbLp=5K.tZ1[joQ"m2RD;GjL[
Td;Pl-:Ad?11@Vfb<!4BRdOfd@ioH:,`(Gj8C@E@9:f7Y':VEo<FN\0,?_o^4]A_6WNE@pA0i
SmC?llY&sGH3iu:aPQP3TSVbBn2NP09)85:+P0?*]AtY%]A#OC1`GJ(3AIJO\#EHlk*">%@f8M
.Y2s]A7CK]A*UN.`Y1'`#r#ENMh6cjh3Trs4Te?I6Id0l^5i[I@k[Si"DmQ]A@c,2S\F1G21@2A
[/+?$K:_oaPKXX#=,F=I&6k4RY&?=1n2]A4d300FSG1$BBPXG@i"Z6-u5e"gT/0cdg?Mq%:m7
NW2F>WjIn"86iDuT?116S1Si1/IBl*oRWFpS'X'[c?O)>TU`$)p%.3[0)^\iM`N.pfWQ]AAR,
q>/=P$)o>onRd8<a5NPW3LUi_tQ=>%sDNm3H*GG`F(C<]Ap,HKAE%QlP+VM?WlX/l1Z^MKerZ
%jRAt'U'FP^r3j3+0V@-*+l1CGa)''l2E&no-%8Nh'Pl^W`W;7)EF-_CNc&DQe7]A'1O8O'aI
%,/$CQA>kW/J!W/*B^%1j$7!:D?Bq*oo@/LaJb7"JJ\k6T!4$`>Q&+Hpd0oHnmlHP@$a5n`N
$ZVk:k3sJ`G__%cVSV71QI(K81YV"UrIPZ9?bASJm^]A0_XiOd&]A:5O6`25c#-!O$HAoa@%sp
V(3:5a+n9g*D?B'sl\q^f>E<-\kp@=_Fs3p*^n8]AN5,NeiSUl7KBXe<DR=ntBp(tYu\^l"Le
`p5:la-0lJk1G7_FN[rcgQanR^CE?e^cfI3Qs']A2%\teoIDrpaK9:B^!Wdu$#(r"9MZSIcS_
UGkLIdM6-/M!Agbh"#[+k0faXr>e>CNaOn=aH\&uS(pI7C!,HaRJ'W_ZEG&Pd:UiuW^mGuT>
-_K#A5$dOPRuclfQ5ND8m*tFm;*@&Z@LiW3=q.S7O"UhIeE$3Of:pq'"\!F3*!\-.nPYF.?o
8>/H[iQtDKRK'k"ac`/Ujg0m"&@&otWcBCs23jVJ9G6%!Dci/,J=+@Q+V"Xnic8Di<CWP-D-
b8jQUk4PQ2aPhOa*g%LZe4T-8H0bBB;R1?1k%[NS)'/oG(+`Z/k'^s>]AimBA#T^PNr:7k18*
A0*G%1*qe8@DgmXk^,?V-N:]A6h.L?P-$OR=<@7=QKR&.q1`\0&0\mka^K31+`qh]A[SAr#Im,
g-G$WIt,Fu\m*EL%LMPO.Q*1AF;l7f[?<u=`CTMlk:qGc_h=23gT`[Zcm3'UDE9iltq+pB%<
nL$UF!R6,Y<au'lM+&l*45>"_7B*ofI"21P=\?HJ=E<l>dlZ@kJISB_f`^!3+9q$JOgr;arG
V2gSTT8-rHmRg#SB@O[&t:%GFX<7Ki`bn*_lT0H!WJ'*_8B!VR4*EC@+mP:Pe&/S=TWA'[jW
lDQK*U2QR\(B$'S@o@o\<_bj\,=ns8raT3d4rgGj66NQhIj5jj+:L$2Gdjo[TKn5PNfWj5pF
lK4+r;&ukYY9suR>Y>Tnc#DZM\2]Aj\"7H+AK@pX^]At^\k`D-Y`gh'F%=IE7c@#=kR16P3>;f
^:D*(Z6fW\!ip8.OPSQh#QX58LG[lm<1^Ahd0>D@?SWl3-7#&i<j]AO.4?YW@s[S\7,[%329-
TNK9;aq=/FRdG3(ZSUTE40>>TW1E<XrKU\FpE[<?4ReA/n=^j!=BIOa'GOjDFNu0Ko%R--U3
#&OiPG@,AUVhdJZ(-gd@3=&qn47UM&@$dc.DUG$`-M&A1DiYj'(I?9BRi4/DY8:I<k:4n;o[
CEY"TaZ?q!(ffB#n=C'UrKPp;+mXQ/Ji%a)"LA.Km2kSRr]AhD))<P#tVjA]A*#MKSf@EYs28I
GVEMdK@ArHdB*d:/,\b?>&TV'VE]AdTXoi1T"hFqeh5$$"rVV`NUE4lAiB(JG[B02$\)IW*1b
e[7aHS>r%5jVTh=21<f$taH+h^FcjgL&DoM$X5nBd78o1=7:O5`<N3O6UV;AT=k$r5($b]AWs
ILI'`EIcTc*6"jgU'1#B^"RbUl=2rKX!=LK5\lGS\KVqLpkIcC[TPk`k@j&EGc&^\N43`IcO
8kr;W\n*LS0/=pI?rE6Ha(8g9(X4PO*aXNJ>CW<WuUQVa1`m\Z)HP?,dk5^jDC3CWEWp(gSA
0=bY-22ic_s7`V"@q]A5(e<#[dthAf"N7PNukE6:&gqnZhc\95X$2':Hnq1lQj3P*Z3&:7:_X
OPe*-3_In0.W77<-irIhjMn,DgBbcV1a6L]Ant&?g&gjfch':6EJ",NGtc#ZVHFV2e\=J,9'H
j]AhAbrbo^aGhoTcLYb7$D9-"S`\oRgqQ7Tad"-:gD*d6ucU*Te'Y(LSmmRnh=8-%(DPmQSBd
d]As@$-o,snlD:T^D#oOgn/Fd&\"E>U^FG^7KhW^df9q()l9G1K/Vh8"Sb^&L\iF'JJ.Xp.Q#
B,K9'Jom.&A_is#,PMaGpS0/K$"5&t%6Fj<1.C3kc?3)S#R?k%qfE=knQIiu(En(*`=\JlsT
.G/DRUX-5Ki8UH+=qhl4n<g?";A`E;Y&np>+Q;^RmH3+J`=`L*[ER'$L%$NJ)..F/1SOVKhR
l!'TlP*/Mo'Y^4;RU;ULmg2%MmSgU'F.^TjJOt'(YP3%@IK_\^<$S(GQG[6R/8&:jm%N(;Zn
''lE?mUVJh@3gPF)8q5'PgK.Y)hFAMLtpqpeTff^?<%B#ZC=9\oSl#\Oa7Dc6_X^nIVW`S?-
"l;.%oo/@>5-CTsI7k+\]A@XSN#q!]A)NU*QL*aUY3O,g#]A'H5^l'p\NbZ(r4hFnSTg'V.tZK,
rF\fe,Rl6cq"ZL>Ai@W+$hUmFRG;3P$_PC]Amre]AE6cXkQ:2HgGTCIRZ^UC%bH)?Ru[faj\AD
k<4YNC'q/7:['p)e3RjNh4DXR,'3*,b@Aj;d';bR0pIgaWRVnDX8Et4orLP_kQe\Ypds<M`?
3mEAkPDVCPE[IHGg=?q!:!$]A=EF1%=WD0A3LX\dOi!RaH7mQq'm'h(l>@,mZ``-R?MfuK\f#
#/N;2at_6W70Dn=k5KE]A`-h&TO"!HpO%4Kc,"2:l5[OaUgNUkZ!p&O<<]AT(5L'?lq3)qqg\\
l'Hp8-iDRX1,,Z`OcUn-=7ni:&R(;q-\fH6.fce&HDnb1H1oa)Ghr2jWj^$JNS,'Ud'iQri]A
SgL3K'KVhkQ>UWTP?.+bTD&[>JT5$(SltrT*%aFi-*!G!f\8@,`T`U[?B*1;aer<XX+<S4B'
B$;OA]AcDCT@5qu,3Q-ail%)>Np5#2-[_9O+\[gAP?K@X!6f3:"2pL_QSp!b"2mKK6^U5ITq!
>oiKOa"]A=oaHN\XJ7+W_BF02YFqBe*@jW3Im$L,8=&Yi8^<Y&TB^*Lp.SUT=(b`'1u(UPGPa
/Fc0cQkbq"Q#4RRqbi?X<Ba(>]Ao1I'L8rME=]A$"0>\8o]A_C2a([_E_.c/=$(mBa@/*Ncb5t<
1bBA\R-S`G#Oq7[CV7$>9Wf%]ABh7,O#(4c-a>6B#IPC2n_#Iec\E@PgHc&Wh1pFfNiWkV=Zf
\-&A71qO9i^10<'[a!0F=45f344487^8f?"bbq$k@Z'^ejP4)rT.06?QnSK%Sf&+@aY79\n?
d\Uf=A$2<MLh*dPP(>]A2\eh;e0n]AuY5]AtnIj":Ol`d+3Eb<2IohQbusFO[G_f7uY9`99NLf#
A%cH:=ruJ7j?-)(OX;V"jD"^JQ$Ho;N%t7?5d3rn-^$U%.t$NWVC9o0/Cs<dN/NB2<JItbhm
O*Sq#Z45</'tN2TW`,cS#H\d5a03T07/.m(Zs.tt`!c6#o_B]A:d"%RX5VTKVEpIE-(Dh'/%i
3ei#Wqm8#NFHBEAPSe#ahgEoj&]A$&u9Y(I1KZIJmD&>I>cTss)9?I:Bm\$=7bdW(fAS<_2="
A.Bm(:Nd2YbRn8t"DL4YlMaN*O,dL(UJJK_arG=,eqL9#%4[&.>\?)dZ!!F2O:_d*4Tcs6-g
DpPU1cRKAU:c^UEYP*L250JpZR#s-pt^^_-5Kig^;rs("`'-]A:R=1&J6ll0#:rl1LGPRI-pA
'@4A/Tu^n*^DscS:%P[*.Rc<%5e"RLtLf2G]ALZr]A)k1OoU7-oGY=M.kkdudU6f+/CYDjS^rE
dK6tmSH$sFef>&f'gK0:B2ZOtJ'F@gOKlZZ/(7Ka_Wru^b`8i.,W&`_@H;,QY2Jgf>m\9og*
P1)39:^I\QN/UdaZE/K5VZ[upPZ\ghMS/lI[S?!4QcF$!?^a8sci:ZV(6%Wk"u*(N8Pk0CqR
jL4CMX`EF`5nTfs;=8*gd9E)]A6E>jVEXSm!megY1CQNi<Tk.\/qWD;sW6O[6mGA,@(J%VF)W
KkWGBpcq;&K.`fP;FU8.rOtQPdr^Vcb[2'>``[P6G\qAXI70Q83)-2trMus?:-]A'6LR1TM\r
WDAAV/Y$?s-G`fnPG1XkWClk"bQF[4`q]ADO!BLp;k>0.?gGh)/IYP"<Da$Rs*8''Ss/MFX=I
Kl_&0'UpRcq)^bj.G#u7YR4W'?0m?TtP]AKVPIS^u?o:TSP@cDN+lMWIm+#R*]A2:(,JZJ86:Z
/JTiR71nC@=B;_h0Tl&HU4cn3lIEjb2AQ^jY?q7Nr(iH64Tn2F,o'ee0[g`kdDb)i,<kLhWB
Nu/QmouV>X\N%]AC.N@,//%`M:C]A,WX+#>,Yc,)0-s$g#e&B1Oknt]AO8f;FU_<*2b8ccTqn%S
0P.BA&VNM@P.\A`"oiRFZ3L.P>n]Ao*?!t)MqVi0cs[]A'_1Cc7=ShM!QrbJU9Xj#3Y%.)7MAN
NDJKClcY[@`ui`h94*7@N7o,hElOpEL`1F/jIi?r$69'&"qOdIhT7e4Me<2h;bFb!9YYfR&u
d;dm(/->`\4@coTuEE`Z5Y!qOM6^7+MK=EZQ'K7&;5J8"f]A(^b"e(%4[A+[T^4>t!obBB0s2
.JPQuLmk6a0YZFWM*r\Fkqa>.ipBPgOaHehicY#(h%ge7T61B'o8.ZG%hD%d8<%W@\s!M-&A
XfAEm7gWL3.#Rn)%#i&s8@08-TJ-$FGblAJ'Z_`:Y@IV.6DD&&m`P6PR=X4!c`T[cgkJ1)D@
8``t;ClE-:"'(2Z\(]A,%:B0/s/%QfCr6a&C">H_j.fmeCK>")U?SspT[ZQtqbi^mG)SN0fXE
X1&ee5k7$!5fVug]Aac\(N)3gJBb,;p6*H-2UlQ>pg_E^"o&Vu"6e`Ep]A$ItT/%Aa!9^2$a5"
$UdDRLMgq"N:ZM`5VS&_=#h%Fe7JA.:HT7E7r_H+VO^24Pc13s._p/?%D`jH4Z&<&&>PYPTs
$uUne.;;SZKD;PHM\Y0rjH/%\WmSeTrrE~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="92" y="0" width="92" height="98"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-657927" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1874530"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1874530"/>
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
<![CDATA[3592863,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<O t="Image">
<IM>
<![CDATA[!U9_$rJ=?G7h#eD$31&+%7s)Y;?-[s0E;(Q0F.j_!!$(%q1eqM!jP<b5u`*_h3uN)dm+V%r>
pB@8mV-*netXB"@<A[,(p4Q=MQ8@=<\La<%-?"8rWlX'bE]A3.rHQd+q1G=Y&[1q1l:%MoPeU
n<_/G*Q^P*?QMuk$T(tU14Yu7@9+lsEf7B>=<"tTeaf$1O7<ODcE_e$!bdLGJO;Ah&7)`#+P
`>g3d`Jh-+-SgH:SUgdJd9cb<$6TaZSXjs8tm#W`eUCP0d^S'O.\6:N=X2P.mhF,%$g!h^+X
QOQs]AFk<':6QI@4Rmr0TDE1uFYY)M5U[oamK4S;EW&%lPLRo7Ppg`5tpAI'ktZKf;D3f-Q`a
_2^Tn^</fYjX4$RhWG3-ghhgh[n5Ner18<Gh=W,%Q5$9f^;g=@)7a7@XkZjQ`C!^8@r;Ua)_
Gi+.]A;^?L.I:bR/&r#'G"Q'qOM3]AC2MUNnJ03'>H@f3ruD*]AM3-Ek`?V^^4a?i7jOn/o*M6g
B&K_.s\p8Pq)V;-6oK$ZH5$/qe`uh!sm)I+)*W`R!_2-A<^c%%h)c&\$+PO\ZgU&ssXlUX2!
H]Ah?,1.","R)n6i[/IoI^)0'o5C^3Xk2E]Aouk[p6:<+4i_]A_q$<B?9)k&Fp6*HtLYA(dqV[K
p($XNh]A&rBPt!gkb;N:sk`]A<+(,[0s9E!*LM^2HPFOR<^L#=(,le%K=j6]AD]A1c!VPFc2dUM;
aV\uhJK:p/mMTf,(9Q,eHL@KUk>[;64dZ<G!S]As^+TU#?%%qY:L`$9T\1FB`_.5/;)+/p2eY
>M4!)]AbO3R.W9S`-GgSE:6Aoc2>3"<d+mU^R8h@7O&.9i)o5J<[7E9#(GLfKtDK`)]A,qdRu1
_=(]AeDc+Zs@$B\X2U;.p?M+NLIT+GR7+U[$lr+[@ucQ6Nlh<$B<(at'!cV=-6!!!!j78?7R6
=>B~
]]></IM>
</O>
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
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[]Ai]AVdP'7^$X"C`bFO]AHce6;7abA7p(S;=>6h97_Y;7o;.VPN@39N:AdbV$*(XjX;8mB(!:_k
dbl;^f_SRB\Lg$WOc</kHK]A5p^q$Sd,ULF6Pp\is-ZTr]A%Z6^?9jWkPR=/rL/7.edg7H()E*
7/787+KuKED/1`?)-<NSbab;U$()G@J/!g%8gEgdA+&'Vl3*fV[@sbo[Dd7Bk;S7M=Up$(qb
he$/O8XA+0rr7l#jGQ:rfjU&DL.??Id/Z^VVGnBJ*$5!g]A1O<QOinYgY4I2`S+8HAVI%Bk8Z
)4p80[24*Hhn`H48HUdfYW`)*eg^M:lb.l1c"Mj>"84jqbL-p3@4J"b0)RGJQn>_Hi)VC/O[
lf=`J5E&_DCrcI1jHuCjgW?`JiUu<DJj`AiJ?j5H;</).Q*<<S0m;Kg&#(.9T<HHukl%74qH
k&+ZaR/aRu+Gb(BGG@cO]AQ;p?os5ZJaW?;QG)eP#@,e+S',F#)uE%o-7X$T^['eeYAM2aQ(C
[6u@S@Uqkh]A(8U4iA.L0H%l4d0$h'ua)#sNMT5BHDB@T#YV:H#RB/3)jZ.]AqK9KC\KaAT&JF
s-g[%-JTL&-"ABC(6$U7&di_cFUdu<ci5M<I:h"a[PDMKnLf<F?39(aU>Ko%`MRm\gO`8`l2
=\#)X\TnaG@;4jDS[^p@W9)VOg]Ag0HNK:hcKRiE(rHFgUBD4M11VDujJ=64gKJQ(uO:dN$\?
gG63?gq3mFhK()GRhT0Dm+"]A=U*tH<3u,Vn?Q?F9XL&A_2s;S4QG('Dhf)*EU=<I4S/\GJm6
TtNL9'c]A:]AM-m69mRPTD)nV"#GEYYDCh*h=R+RI(6c>'I>gKE_st/\m3tF),q=&QL!\&ObPX
dXW68=_?E]ABcgOm5_!9C=Y!%2$c+a@/N-8*(R\mfA8)\IrkDr7F8Rq)cCN)[D5g$W4Yq>%HT
-)9Z$/VV[:rJKc>&;:I,);-'\R#5Ql]AJEpM,Q;OZ:hP,Teg8&lfqj)aPfbr.ClZ1&04E@q9i
<#qpJ#KN^"afF6ga-<j^dU;kXgY(*Sj=EX$^1LqR86#e.O@^PTQXSt(Oh4pI^=#0=n=GFe=I
9$"(<?)'G&l^MnY@c&D=N7(E(qPRbgPVI@!-h/R_RW\Pc$CrSbV!#_.Z)Kq!F3$NCp6>sij`
,N8[>g'D:&<NNBG71<POrkRd_*H(P\2UP-0Aa)^T'm(8g*r[ghW1Re;(?&>4m5pGO^[oWFpG
42.:W2N'$3D`ZbEf-M=:c^ttC8Z&96p''l-[%:1?nlC=$4HLg=]AZL3'&[L\YZSARXR_B:&Ec
gWp:e:fq6[lo'q.]AT.gD0V>M*0h/apR#06]AZ9g`-h<OeQAC!m.W^@s#<7=UglalmXD9)XVq2
H&GRF*s4+FE8TFX4W=02u,/-IYT]Aq&=EW1*mQ1O_2iqV;F<O$WfUeA9X8r0L%0"oZUlr3#36
9rfkJX0OJ&9<\J;g)fUgY<hR+4Ag8/]Am:cI1*j/ShQFH(`hM]A>PZLdBa:0EqVK;43Acj5ERZ
`09Bf(He8+>f`<jrC8kI/+3*q!%B<4H9]A[*>GYoZE%K&.X&7^6iUs,?mdC+;HG6Lp*BRZBHM
tR/RGlDhMNM/C%7^=&aLOd!+G\3<'pdEm-H(Is@/E'MaT49&idT$j_Z!d$%VN0bAf:La+X7i
%Ke_T,%H]AW85h/-,'U@R^a<mKGkEg-:!hG>8:bB%D>#fBW`09r!]A6,ms)pEDQ;^m7<)Q0=G$
_kVk-pTDfRgVBu:*-o`b%C;UE2J]AXt;>m>A99A.=C$P'+%WL-/,q5Yfa_@DjK:j\/Xqla)KO
jtnl6KU2T>M0E@?QL.%lpTmgjW3l8#\XUA<_:fK;[:(@]A$aC:6R(&7GP]AZNlGdQk*E`iF_Ha
3Lm/[$THBj\ZV,r:)[:]A_#'qSd5iBYf_9Yt=b1Ne7TV4eg*e@<Rq00lKe4nVi7a.>sfeC?M@
_IIOq"U'5d!;f:MtR$-(M@<E5bm89p*rGFleBE4NU#QuB@OK*WH:3\%tEDVO@\_U^FCcmm='
oAo_4;2E_;(kO'"3q.qTmCGo3dR2b/Ue.no64r=TIP:6DAariJK:;T-q<!@m22Fg>Oc^/G.+
9Cj[sDf_Hdt4K77rLK9_ppfR-M@9pogC$/STTHF7Qf-RS3FO"j@O15LWUeP>"0[r2:F)qTeE
D3HHZ2n>(^De?JZl<K5V5iqHuD/F$=>W8V=o[f'7Oh29gho8E#&FT:06mUT2LjkE5`&fn%>l
j@.`pGSpDbVB%<3.9Q,BlO@m4Fr19W1:3<q^(uW-HfRR<7PC!5LCA!Am(WG0l0Z7KnRh%d+4
/TJ::\ft<l64:i=5l<3&VG\BpP0KAp_.u8u9$psn^A5>%u*cL92TeE^u8N=6[@^Wj/>UEpGr
'bOC.($!TD\o,dVm:P$ESg9('tBfKN(m#g!dtcZ:O\!ZpWk+BT#/3gD5Ur:o\tGMRk<D!ANh
%i5>;d9VAl#;hHb5tI?tZ]AJp@]A2CW/33VjC'C@.Y;IWFTUt[G1"B/b,>;,`FqtI7Cu.'UZJP
fRYpW@GpbDnQN9+kem,9\e3^.d"f^P!iMG")CmQi.$eoNFEH`8=NIX^4S5i#Q?W<lfnh/2o(
ZQ$:I/]A_]A91Roa<aM*Ui0^(/LJ:13mX%3&Y`^apY=(B'H:MVF^2BIfjI!G^m81h_/mf^^V+C
R3Zg`0(apt.3R<%;IaPi$>t`r#daE.F28bZciI]AW&'V3V:/.bGF>Gdj+<:2&m5n<V"5O\e'1
8_n"qt?M`PMNCZT%`-Z;PFV)=-Z'aNi7uJ6%jjeEM9p=NoI=1e7s->op#1c)so2@o']A_oB';
Wqn8YKD$m'*/A!e1@JQS`u%-"C8]A<+\J`oq+K6t/s[SMrNI6O@(^#Aad$?n&lV(VDEoag(S:
_q=t1ijPWWWf-:6Qhl0SU!l*n]A8+XeWC#CAaY=-id[n804P2!;*J$Ri9(6EXH5eYt#<@?^EC
19fRS9#'LDX9=AY_:)+XB,/,uMTcW$LIo7dkc_5T:G(W$tF7J7J!ie_:7#U/%0U[u*-lQ>SV
bD`F(MLJPR;>6"UjD0&0C?U6+/\ilc#6r.=sLNuj)4E\CjH]AbM*gCKd4f/[+B==N>^&bd_Mi
CjG9i"L=Q^N%>q%?FI8.8ZWQK#f]AND9N?Z`J!'\RZ6a+b(e58^"IQ[A7Ss%3,1&b($bNE9$q
3cpOR%HOP8/$)[XXCqe'!5I0dURAFH\!DfI7<)r?u<s"9N!MNlg]A)#GlVNUsObQZH,=jBaWA
5_d&+,SCDY)=^N+3qA*-nX6BGJj'5$K47[`OHg9)Q0PN+gR,<iGU!;p`2,>4g"/tV(t2%s8J
ORqP9u?Z,G#`;TbK8)rF&ar[$+&-qW..4'=1Ms)CnNkBB72:T]A6*jPu#1h;`39a(_I/ba2(V
(Qpb!+&<8a,6^.VI&'+4'G>AY"]A[88'I;ta:$u=IBi370_+jRE::qGSZ>YD$)Sd-j(:3=bP0
=l8BX?"l.RR0@3O)<p"V!.Wm0dF^Zg,ZAj3:&6"c[4REA5dFhR]Ap5GKGIj^QIb=+N@,@<(@S
/sG,3>86$/i#-m!#AhAnR9BS+qZ'EjXo5j1&XIc25,T6(8lK7A+Is+LD"*_112$c,.P4_US%
>qhdub_Cq7&E(;JfJJOCf$$(<dcd[O@fb!nZcqN.i;s@<68a%m[OBtAG=FB-%]AkHJ.t2SRD@
?3hT=54Lf^HN2<h.F3'I?OoVcf>$Xn-%!+GhT=5%g8PeD95b7YFN5#_uYKRpd]AtOh?ss&s#E
LcZ$K;(&@&fK+i,Lea)$(`]Al:2SS6NPl5@`oUj0X'k8k!@X#@'XmW2G&BuES2bEpb^=L/_Gp
S#B!g^o=B,^BrUY2kd/,#,JG=sFJ2W`Gp@T)NWG]A$'\/.t\1P/pe99/(Zh6blO/m93*U;^[Q
\d^X1WZqe;tM8AMP>B/JV10.eZ5?#r(+SWd\Ep8eZY3larmXL2ZJE$=Ec1YP>&^"<*"g5-of
RT78k_$nCVR4s&k/DhF9_isA82"<;>$<Y!Yk\n^P)*De^!b_8MMCme&A`,I0jd0F/;H/'C=W
rq'Dr1\ZS.3Fq8hp/FfSN8uY7XZqh%1AB;kL]AXq2!A*1*8Vp+E670DY#o<m,8n]AKq0lU:EHN
QGc<Q@X8Qf`]A24*<a(7UqJ(XXlYenaAU"Tqc)fb6`V9U-C$t"<BQO>qnZld+d#/)P3+lW\=P
-*&uHsQ/YS.>I:0Kj6nbtR3a:@P2-Wfq$-hRB@%lesmK@bg0[KEEKta)!XhC4Zp!G<Z2delj
!30MWSafk_XK6!PuOMaXH&`0Ym)=7]A(S:4A[*Z[dL*I(*]A:kM,ZtrrW~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="92" y="296" width="92" height="98"/>
</Widget>
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
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-13882037" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[864000,2016000,432000,1152000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4320000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="Image">
<IM>
<![CDATA[!F>l%r/"6F7h#eD$31&+%7s)Y;?-[s.KBGK-jU"W!!%f_BM\[/"!pN,5u`*_m?gU]A'1!>Qf+
7d[`/g[<Okia?C.jIR:oI\g"fWRIn`EF4iufCB7-m>G'gWBn#TiWtWL"f\(/NpYGBUI'pea\
L6:L'365()rlM055fh=<'QirV8G2Nrf$-[>F^A5MS_baC?QX4R@ihYg*O2^lmMnuar)LlFIr
&T;8),i-A(HY:pUSc4G_i;K.PDO&q,B?'^AAV",ecN(oTI5>5#00eI/g"$k0Pl&SbjtS<A<>
MK:W(e5#g_s>@4b8sKqO_>kFt\jh`?C1M:(6m]A5TQ8Ea^*G`-?N+fG')M%9@_Q)>qWu[1A+*
#'r"#4PFC\ZI"dWnm%2:^5b>P1>6.#NOjWacb%8L!Onp2kft>35Jbc`[0@p;_)TS2`cf]Ai-5
UA$)F?3N/J@5qYT!Y4oS#XNApJ@AHHher+MSVI1?5i&O33/%DjX6O<bf(d]A9@]ATV(,;(oL]A,
e$O289k=L&_45Ef[VJK:CIS[#TrNANSrm^c]A'UoFbX;?9:>72jUnLc9R<#)1*TA!0UMe+$+i
[.2R;1VZF;<8Qhh%a:oEj4XJ[?.9tecik)T:gep?UNBi:D?#4!kEP&Kha-p8rm!QgMI-B:bO
n7=E_)qT[]A-ti4k=aU+BWNj4]A#]A_2:SWFXiMKYgbrj5gaZIQ-AbBI.c,0WnF2p,g(BJ'*ln]A
V^jWonPclg0l$cCOiVm:F_IsGb./kZTC_qS"(G!-+lc(-9VIst[TZLis",*RHfR2`]Aloc6:3
MZpC'+V^-WCK-Vc6J;1qfRA6oj1p>"G;f>:FG?2$t5m9kIDUY9"(+?%;DH`p@8RjN7&4Kl@f
,$JJ-9P?*;(pok&4l)T&c*af9/U3N2"U&R9S3mr#\FL+H0_srl7j2*A`qfRG5Bf5gE%EZP67
4\82Pd;:r9b37"\l8%[2Gn/Xb9qGT9-HPr74h"mNQ+>o#A91^Hc1PJV>:=c3f_5M%Grb.7l%
d`F8/7"B(ls`G:oj`9(>IK<G!QViQS+%5=]A\%^'7C&g`,eR%^"Vfpq!B(-hjnH!!!!j78?7R
6=>B~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<O>
<![CDATA[任务管理]]></O>
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
<FRFont name="SimSun" style="0" size="104" foreground="-657927"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[[9.]AR;tm^iVFWsl."`G7]Ao%%@K+qN$708@&4Jc<$<!]A..#m_>$15!@Me;9hN<5]A.G6$knj,U
so>#XN=sJI8YS,7oZa6Gefe0an[-hO/u#d^tf`p#V7@eiDo;IV8+fJ,B-:abB0n\h-:Q7B<D
e/T]AgYk9"GR9AZVHWW-h73cLoD2%)Au3pXN#q+sDeW:r<3&1_[Jq`aq9>@(VTNA#P06uLG3F
ljSafOXM8Sc-_bHZnl4Z^SKMBZ.mRkc\/Sl`L)"Za&KfAs_L+_pC2(KI>>*U5Od&G.aVH4)?
Jk3d<[mOpd`^cUP+\4RP7-RY9/YVG8HEDZ4h0bk$bWfS"Eq@:2RY:\b5L<`W2r962iZ.SdJL
N.AYmPk;bY5Z"q#X%2g2lSQ4pER@/pl(e',baHiDoCn>H6C0%Vb3M%DaY,T>*$]AgtH;;@^;+
hTpVSpV[bN5P:jKg->ar7S1o]A?"[:-/ae@d3->STeBWDTp)Q8U,Ps1&(Dlnd23Rqb]ApDJk6!
kW+4"]Apg=_WfWqTS0C7q,@1/.2+r&@((SSGM@U;d`KuN+:I\\J_pJjV?cuO,<o(=W2J23Y]Aq
)7MMc2+SHqp!\N7o-6$ofV0H,\./.>12sLE&,T8LpLWt#=Y]AjLQb,sl:"Y,Y92dEfWd%WX*&
3SbImVlB$Q5FVgj6$Ch,2+@:YU\>=X.`@[XOPT0pX)S%:W\QgaUKX@S)>W:OP?75-0r``HHA
7O/UPNJ.6L-T&H%nG2u\=qMP(_"5.f)S^f`[K&UD;+*cA5@=S.R"f*#V\llF7j&@LpcHYIR3
+$Ze*$Mkr`h[Be+@kk/\S,\o_M$P6H+%2IC3*JCFCp!8uSdPbX_QIGuo_uHL9IDRX$"e^(eb
]A?qR4"it)?J)(J]ALT#Jq^02"]A.$--Qc[&?091Io2)8j;dG34p@Rk(<c:nSYOH,(,r<9Rq.Xl
TGt0ch8auBB/n&!'C`dkf6c_?1Q4,g72UHJ_A:J>u((]A3\)7Ap;I4H>gT)Mj:3uGP:`\H:/R
CL-W@pn6=t?B]AJum+:>FEEpBGPjZWD*i]ALZ9I+*Z#0[l:*qiVo>0U\GbR8s=&N0-d>Imn+$^
RB[KF\/p_(V#Ung;b9\,Q&a1NTATmec$:Jc)mIfJ6A5(umO<n%7S14,3S&eD\_2IlOqcBjbj
%GddL\qV_bf/!!,Wh&qY6H,o_ch.+5s$L\$N2*!O=G]A8a>_-a)I/GO3'(c)\rLj^!i0Cg1qT
#G:BVJFOtW(_cJ]APj?op<i[U&sP@:Ne[a)G!ajs*]AjNlY"muSG7Iq+hW_nBc:/4qV)8$:D@#
jAIZUQi-M1>B?U=TAu=/SV$XIAp)VG#p.X6[kt)UmN+((_B(eKfcIUa)'b'(qoC=RJLOsl5_
h9cA*T(4ZQE!L#ZO8Og6e>8RcuBj2<)&r7k`H<fV&.UK'Mt,(HI=]ACNqA;*,da?e>;tf*("!
\l.0qAJQ#eM8un.Q&81JI7[jf!;Pd,@:p/Ted<L.2OI#>jir)_EUIiBqtrcS-6^HX![uor7j
q1\3F<&m@kX7TASt<+?Oo4J'T2,PhM^@bhD<MV"':B"#f`D::`s??fmM_tj<!ZdB-YkDjC*`
YWUON5jt-O@Iq`:UOh@sljgsi=qn<0CM79Fk+%ahBhl_BHc=oaI1Gp;;!%^j9,;o33Z$/1'Q
Lr>]A%E\$4MXeDE^X^o,.q(..8W)pt`DL,Z1Dq)%%7/Dc$'q:RSc&.gQ+bg6V+,D,"')E0260
qR'?j#'XN`KMPO2\@NjNS3+[*_s/>?sj+pH:n/sG,2Vs%@`gP#Q`*\[JcbEL>`X3$-!&hP$9
(jUfNdbT7IOmNBl)SK+mX%eJ[rm?D8D,o5_iUVugoS;jCPA>*fpTN>c_4K?UF<J=8@6k3=YH
tnhd!p_<Q9$LWN:#mB%o"OGr0_(1$5Es`Z>Dk=Eji<PZ^Q%B<W7s;I=mik1*6Ia=p)2.W0-R
dr%%S%b_BaO-1N^2(LBWP0CdUs_.a1H7FB,@7;q&rX5h]A6[+E566_NVVY:sMiMVuh!77f-kg
!<uOP@=*61GtXfk!%"G&-q>US29KsQ2N=?o3WLMEDPaY=+p_"TE\:j[\:ab4!I#RB3T_+R*L
KO5bWVNc?S4[4RI-8<9V2XFKA=F#7jGpN5<1SXOg5$.T3ph&3hai@SR\,kOX)="c>m+h1H/o
%WN:0eWf;+aK6ogS)lA)DIE)4_Yhi]A7LBMRZYn"#glCPQ<&c!16`A\hX(LSK4EMpp+u&&cX_
_LjNF:(i3bD+^d**UnNuW%&K;;8sLsr5$?cL;(4%&Z>()B2,ZWDhb_>4Y4#Zka4%`bYO*%cC
2C4O?WFBBH67ElM/Eq#=A-:@UV$0LYK.CGh@XA>^<f0i']Aj9GV>;irD']AU?k$8Zf%E>D**i;
XU.$A^SaO=_6Dio>B0Wr]AjA(REK'V[fMcS*\M.grl?P9S/k0(?BJ_#1h:<&9N1<K]A(>tkY$'
eR;_R%XV[r=nR=%@\Oh0S",HHilk/mLn,lm=jNZqZN7V3-N*dF;:pj.*;9jl,uHiJ<P:TQL&
Ib9a5F@("p?NQegHh,`<F,h/5(MW%YKocPB+0`C7TZ:PRO-G,E.^B6q5k*0E36U'PV^oIBA1
K/A\u&d&_Z6$a#<Hq_p5D.44M"1G`.JFZH2R-Wi(=m]A"/LCt!!iT6?cmd0[?BD0e:<*M&h)V
Ml2)fnLk4^%T#U::f+qSBI`NBn47L)jDh("PSdOr9=O\\V'?"cSEN`T)&Xmt\D@qmU#%cJh.
B,>u\h6-`n.CSD1CSNaqCet4>(X`;>HiN`X*\6SN!+*/JXoglBr2>4MYh="CHbq5of;BpaMN
P&hl>UW2?D*ih4Tb,kJ9^mj@#jiRgNLXeduD[J!^dt=B0Mfr*<TmK5WIc!"M$#^`#G]AT?[rg
P`&qCg:e-tFqL<+n9[]AG>,o1pf@n-,bhU'!L4?1[b2F5UF)\YB!R;-&kUBO^H++,'Ij"J#m;
=I,bGGG&@#]A[o^tt^#AZ7`gjF"itAG&;O)[hM5n8=ZK!4plO3,*S@/dF2K[bt!;_%i[%1Hm&
!+:(8l,Wc_Q#ApGID@@%T8.SdSaTMMMd+c#HQTUXFdulDP6NdcY#c.0&l<,s3YI3Y*#F7\m1
%:nk-JG->AsJb9BKM%@Fd/:;RmD8J<EV8J@D4_g5dAtFomadC">AUGF>\)-(="_=CPRpb3I:
KK6!suDlTRb3gmfs>L*D#Gh2V!AW7"k'j4IHf=lZ0pM70uorP5WD<1L*"H#ZFtd1@>75kN2C
9l8XY6G6Cg*4pl'fSG+m_%W%AA0l"7QX84rT?]A*?O<4BgD*K68rjAH,`iiU*JHIlgeo?7<h?
mEhBA3Iuiub:/KMS8*(,E5ZMD6gSBKbT'ZF;&A&5!/!M#SlcO0OEEo1ga;,LsCKW[\pGl3DY
3PdA1R#pLa1]AkVr1R\24iJ@>ShLa4V/VTM;g=.13;$?df/l>l@-M(b2_T+2!iG1%(QT2*eA9
i-\=)LT[Y?pE0E09N-cYY^8M@7*a!&O0Z9V$\KUq6M$uObVog7<>7fI5&Mj1K2c0OokD?@=j
@fcC?e7RrEG";`*CJhXF^#[.B?`E*[k.-s&E!@)25n$>3#s(Xsi<ce`f"YJR)rBLMu$$d*eM
L)jqh"+UDK@u.>db5/Wm&90pe!ZDDuBP7ksH:Pn?Uio@5TgIiB2M(o9>9D"0(ICEk&p?^/^O
tVNDt0/!QR!'HgIZi&##fEcN\2OUI`rgM)a+#fr"c`@k+C;qg7#.VWDh;X%JTcN>XLOdorY(
=>NFghGff#R+6j.%G%%TTqXRl?/6cPKGTNi3fE.XbV&$5`Ep0lqWG3TIPs(@hHr?t[3$plSE
eG>7Hi:,ql/_/A*O+m]AR,A'SWAWTN!6r"o%*o=S_*uS8:VVLDbQEf&[J,r6\O`QmI)l)*A:m
\-2*TW?dJ?`nMRY)IF&!$snkG-DMDmo2+7>(?d_V>Z(Si=BCr.:DaHSh-O9k1Jrs(9VS2'G[
8mck'ZVDG2\`1&##B":5EX8\Qc[tut^UQu2&``LlAdkF6PJM'H#:(A:Z2kF<qFQc!?Qn[N93
$<PiPdc/Glq=%+Jfa<5;DrcDpS)f^pmmRar]ALtdZHalAjKll)b:C;oulb&9MLRs[eBfA>:@V
DZ)`ta+]AJ'oe^(`K#hV=/$KETTK#`U?%Oh8p,(ZQ,"*`]A@mV+"BXm^%Oh@;-s)kL7j:s1W43
'J.sAm@jK`83!mi_m:f>6+oucQ.4RLUl0J]AG_1<Qg':19DKqKVJDY^A+#p.?;dpNjVfa^@s$
j[G[;Cn@.[6FOY>EMmPQ+frLZeY/\hm$f-rl(7+bLdkGKS/-DCa"JGW8,)d(dGs#,WWbZq#]A
H=/q;CKHsRb]AO0/TY=uadi.ggX"<1Q)K>N4Mu'tukCT=Repq@?%#cU4TM\"Yg((8mND<0XgL
W2]A^pr>:Y$hF&&>6,-QH1oDZUSVCJ?\]A1cC-2e=Pu]Al_]A34b\5gT7=8asXR.*5\@B'(hq-tq
E>hI\i9Q)qe!9ol'^'>:cFR1G3i;/rhDf"eI6;CPh9fXlb-L``(d[?+S`rC`H,SM2>h.RO,M
)C]AilOT&H#/%\jBOMd9BT_M/aQeHTqPfs`WqqQ89b*V42:msY+b\ap-Mrh>3oY4N;Up$5'p`
/Z;PD=RKqu*+Ylc/u0X8)T&n`!Yj7Gq\lokBj$da1j9?o"B/'bo-***/jm]AHfh:gK*Ys"=~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="275" y="0" width="91" height="98"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report3"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-657927" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-16731426"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-16731426"/>
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
<CellElementList>
<C c="0" r="0">
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
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[[9*f5;eHl+YUCcLW4Z.=VVSY\ULG&ji^-ADeR<kMC6Ar=6e7.F+K.-_64'n*$.J=0N4"1>/N
sC'O9D_IJ/aU>Qo.pr7E'rQ7Dt"h8ML5aN=a1fqu8Sd![r/&)2?r%qu>hDk<%Q]Ahmn-BGuLd
tGn-61,5JD?bN^Z)dZj&CP"2%O#Bo:gpFS*FP5ie7X&j08qh)&lGE*MBhh^<0o;5Z/Dn>AIo
"+Sc4/q+`P06(YRCk"g'rj$Ue9gjN]A&!"N?T+a7Cj[9shUo/&3:L*m;E3$Mok0<\AbEHF</8
Msj'2O+B2PTI7)VJ-61d4&/CQLlJlu>iU<Qa$B/2PD*HkP$NeWbQjJ#O);I%\6WD']Agn+.=/
G5V895M3:qT8=OF./OjD5,J^gr`m)1W*OE0965IhQg'h`6`Up@&+/Na`L"8`bm3?i$c-bUFi
KUeWj8g:QeD,)Ps(Q$jXn@k)FLdEKhT=<NI-oc>%)p@$%)FjFErH^Z@mVLO<KMQqP5XUrf[&
1T%/cjqh/7CEk4`:ksU\&g;qDba/*a$*G/oEdaF,/,@W!%n.4oXFot0f-ALX7O#KP9F4>dpH
<^%T_o^cSR<?0Eg/mS3Yibr0D0)Y!?Hi60]A]AT*t=?@HU#Qe-aOd%b7O+7I@8?"tq\X@Ha19I
6<4:B$V*]AjN5%\bt2BF\X0b7"FopaWelOj-&5R2mVmr*!hFQ"=e+EIiPZ#SSZZ_JQ-W)[mDo
;dWBZ&:Jl0NU8;j8h<mUC"FaYRA-LqcJ$.(/u?5J6M=-Y:]As&'p8cdf%jf31>I*UEUB\&R8L
2:78Yo7_l=@gaCgDhO$DQ!jD5"U_"m-)H[E?qR%8Uf;@OQj49B?WEO;GKV9G#oD5@/1e"GZr
An676fh;)AS+Bp,<f+I1+n\\)OTdMN^lon-@SRIEJXNs6j@1(6I44c<X<t";!pH"GP^#adXK
3h9l,%-UEPA$G`ig+Vp&P4mMc+cMjNeBV/;VJE;QEJ(X0j&Eg-$8tW(L38D'l,m><:/'aGfq
u.iLC@07AQ-R>[F-'>DQnkJ22@&Al%]AS:Lr.tr%J.jCXa4Q[0B`O@UJ[1rbsKYRIDBerd5>@
]A(hUc-J[H!?+ECm+:?%Be:3KhG/9-A^TtuV*IAV:kHc>3\tmZE<IHl"@^o=9rPrqp,t?0WM/
_3oONb&;.j0%1:IAEn-kt^rnMM3Y)7ANTODp=_]A@b)ffI;>Rl]AHbl6@:.4-fA;+s34PNhTN5
Vm_:Rso3@h\OGD:d+!j_?%8_ACHYZHU7%YAOU7,Q#4O2Z;n*-*`fR[hS7,j8bXRu+*]AoM'9Z
ueA-IW]AGRW8,-:ahk8Ro>2K?lY$NN#hD/.M'G]AX[kNXS,F4<k)k8"$0O:`1&ZSK6\p@r6F!a
DQI7jmCEV\p3L)#lI`2fLJ%#-F>%(R?8ejc>O9s+=%@'<od0DR+L6"_+YEWVj)nSl":dq-/,
#!K%U2u);eT`jb0?Kg7)`l-M:X:8*!$nKbM>L+A1W]AC(*\:lq`j0%W/9;Es*i9'JnW@sI5cN
kUFof28h(`X%pCPQIAE?tcX\>Lfa?`PW3aF0lfB:9Dumu7YH[Fn9o5+ZA981Wj2f[=6!W\NA
Mgao73i2kL!9D2MAIFFk]A)VVe.G0"Xj^(LRAJtl+TeZdbpUUu)@<W9*:qmILHFK4ek9/F!_5
U3.6_K(#d%ZX(<Rt=4(W+Q()]A>c_sJ/jRrcgY`NXEEH#_G.t*q>EbOB&fE\1T#'85D)GWpfQ
<lr"faMP]A(e<gi[CL,E=!b\O&#!79+sNp4m=_XkPL=[o\`*N-29RD`Df\)X>f`7md\E;:*hE
F2E$pMMu&K+'D#Y*tZ<*h'hE\K\/_@6BpK"MK1CJSED5+I3*M21<$C8QRZ#'<8!7h)+KnVbL
mQ,b2^+L_4schBj!i^'pbQH!@dde&QtZYJG"%u2O'dg5?N>$U(jUX`_Ht6_+eE\e%aeqS;GY
X]A;3BcGE"*uL*@E#!L=8K2Vm]AH20$2`8VmO`Vf=pO<Mb(9Yp[mUo=76Bm(1p(8MK#;7m$=8/
ad&0Fc\uWh12^[dq1pbQM<*PAjGrm?*WEN%5QTGm'h#Dq7"j$<>Zd+5]ACBbh-]Ad:SHhfjmL]A
/G/a?GK)V)_EHN&A2HQf1)s7kheZWI=I^Sl2c2WLOZ&#)88ngsM5%HT$`q(^&(X<b]At;UK[^
KIUjq?9\=0nik,:r?(,*2*XcpT<@IiV`i!'*^HFKNY'?!IJ8>>]AVk=l'^<2tX,4ad[7a"hk?
)\4dO]Ad'W_0\rnSrI[V7K=ElQG9N7uU*MQ(Z#tr/tR=dfNZ3E#Vq)NhfB.V2UYY)lSE!QK5K
Io`!Qbf]A9/uQ2()#/b-d`Hu#=Q]A;?2XO7Y:IXfW*S>6r[WlK\HqVc9NSEF%qt2qG5\iB@oEg
2!@B9Xn[`PL`QW%u-7.XJ)G)(/Xp?E`r'H's+_?1H_!?#U[D*9&c1NgO(1UWK"oB-q)scQm@
6?W"2fH=d02PWQs%Q1V[7:O!3q^8IpMCj.7oRaRK(@QR?Hu7??U2<)<UCS(^EG5JRh`(X_m7
D:!,kgUm^ZV@SRrQbC]AR/=M2c%g7<Ds6C&!aUXEqaGFjWGEir\C?7in&I^jjBET$9<ueqSUA
tm'GWg=<:g]A'Ili]AqYquE^t:q^0?4d]AEe&@VB]AB&HM5<7COQ#LpR5pe@qP+RXp)$PO=RpU%/
\f>4d('Cl7)DLDp,;dqT`&Ii21$W9K"C!\&io3OlRV\'0b5lR@AHK:#8Vdmsd<uWOChml:`E
%c`JImLL$p97*m(Kj<>#=FKpB_,aH"+t@NAi#qos!0DGL*M'UPK;3\+&D/F`uhmP\`5#CR(;
(e[D+$-`i.58b=[/5,`3'Es#A@g;mP.cpV9bXi)J*"SW<BU0Qg;,n[tfEN1(rZ$`k?W1M,PT
*=jJAICIt36jg2/gaTWRIJ71I%6,fM0I'e+06k)Y<_Yd8nfF%K(L4oo3lkU0*_gQiTl*X+Jd
VHf/<Q8S".fCiKP`:@*CW3/[ch886TOu4nb9VtkR($RI1W8>ppA)gIW-DN%-nUqW=fbW-_d<
ZS:No.isKh(>Ir'\2Va&(\ZXmt06h,@QsU)&rO:DH;#@&MYb/==2Qa.W-me>3~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="275" y="296" width="91" height="98"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report4"/>
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
<WidgetName name="report4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-13882037" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[864000,2016000,419100,1152000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4320000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="Image">
<IM>
<![CDATA[!?;:'qMA$D7h#eD$31&+%7s)Y;?-[s/-#YM/-lF[!!"'n=oeU'"QN'A5u`*_bunb:*(:P_cP
Xt21u<hA#Vh-'l(4=!N<:58n3E]Al7KrNVU>daS&^gLf"[S*!#C+00iYbQ[`'5/;N"YNXkq&%
SY_H.YUKapJG0I*ZN2Cu@\pM$"GB]Ap^H_u!+MYSta?!k;*Hf'16bB<(6)1nVWbIQ/6n@!&I\
+hsu=CT(M?rNYR]A9`sdVrm-YF7HEu0a8<;,IfsWWL4N.@\:c\L>GPqZrmK8.)Qc*k1;'?)#S
2R@QT&<@PHFV!WK^QjNX*F242#[&-"Qg.E2chhH@35(?t]AgQ,s[f,gZoC"J!XmR0#j^kF:8;
,gYOW#)<FV'm4'Qd",hOMjp$F.6#kN4GT1cB_9G8+.G6m]A5]Ap4k*Pl<JlLT8ii,ClE-T$j!)
"R%0Kc!M'Bheg:>en;QUbDD[7aXT"i<GV#s[_]A:o2YBPXGfN[q9aD0),[&^J&Vc4)$;AantI
%HE6JhF"G>a(Xi@'ngs_LB)U>kB5`IK7e=&F1BlRC"&;6C%>KBgnQq7cB2@\oA;Q(]AruR0V-
AkJJb62cUWIlo`^X<T62TsY-Q:WneGs(NNW*N6H`OcU>cep^`+q:tJ3GXm@d,a\nG1d=1#E1
B>$0o723#SL,O+&;HDQbYY)W3,iX2>$+LJJP0ab$p[d',rG'B<'Jn:C$@$5n,0;!5g`ahpa-
Y3CY@Vq\OMWC&N&CnC6K8V[ET$83_>i!`B'$o!H`2=A1ec<IebFM'c=k\o#Q;^Kqlo?62XR3
!!,=J(s!\\,h0&+]AQsd:=J`RUML0YAu$/[7'dL"lM9;HO:06$n%NHY8*@DqCVhlJ6,p"MGE5
8+&l%h3@D=m\4>!qE]AS'#TMKVD)YIk-Y]AFp?G?em`,;`nhq)Z+&SRQ7.1_et+`Eum?K\i-h!
.Q*=)8>hrW8YAW^O0/.9Afa,br+n#WVm2d/$oM%>pOl+#]A"'-;W)L=2$teM6?"UJp)!,]AOsK
!_pQ,hWp$]A%^l6*J1do/ZL"]Ag2rMip`WZFF4NMf$sc`_>$6%E.Ecm6_&$L>/td#;!AK26H/S
D$-Y[CKT84h$:(;7ND]AT8`)=D/;Cfe!<V-kmVLfG4St,Ha'#;,S3l6_Xkl:hU>$Lm%[IX5a4
k(64#@?Hhj\9<dC):Vq=o5pG\a$Vl[t>XTN@;0TuSAU\rjYD?QJUdfZ0\$[V?T7dR8^mU[<+
nM,=RS3i"L?GXMZ3DC\moN/)irl'VLJ)-XATLcc5?THEZ/f-[L$=KqF8I7C&fAH&SmNV%\('
u)Qa9QJo+Z'T^hmu,C=F:9itC+sh&6rO%@_Ms3/lLopm3%NMH#>F`<EM.L;<2g0s?#PO]A@/3
N54X]A*,8\Cc-V=I/$,SK1M&aUtsZ0<U"eK-Qa2pojIl5(H]A:nficJZ[38G3sCa`K'.]AS7mR:
kDkR'h'03V!hr`"SBDi0L_:CfmgLkc8_4N#j?dBO[q>1kR\b.B4A4O!OSA"':HWikOu;CO:k
8R1"I7*1#2/Zs_342<NdZ'Q0T(mlVse<PQ]A_Hj(54.^e&CB`#lsiYXk@"Pmo%B$9<Ob$YXEc
Aj/CgL@maAuM\QO]Ab=.]A>i:;_:;pFOt5Eg%f.:C`'49,?]A!(fUS7'8jaJc~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<O>
<![CDATA[客户管理]]></O>
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
<FRFont name="微软雅黑" style="0" size="104" foreground="-657927"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="true"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[V,mt&;qJU8;JNCkZrP=-10c3.;F"3?(]Ad&;O\(t+5\*n>"Gdsf8.b6dW!mDiP7UPE+CgWb5W
jR#5c]ADX"Cqc^KhT8o8;Ih?giJ)7oA+WBH<mSQQ,Pc\m!\T:^]A42Gs$,+238&&L7'9Kd;:2a
4G/Qg<7J/Y4"2=a9)Hdu)0W1Y>^#&1u+h,Vs;o;OYb^t1_Ur%q^]AjUJ<&@;3q_A^g/]A=LJL`
]A\<LAZ^sbM1]A$4-Qg]Ar`Q,%Z:"@rfg[NpnohRJ[X/]AsIIA:*7Z%]AN\l:#r@+L14%hU9itq9-
SZ-;rPC*OK\ES>8&0m%!kq&CDD(3.g9"$.EhXf.[2>^^47*4]AF5S-Mml0QY*Shb\M7^QM9_I
'@N@dNi881SB)9WWZ"6K?e+Zdn]A9>/BHcm]A8^Zk)ZZIp(9Uudo+sMi[O&CW%f;I2(+%38k8i
?![YZtD[_sQ"CfuL"L^*Pg"jQ+aGhQ;u-a*eRY7dp8\igPE<Q^5+P4]A6`il7;I!FsU7b/POD
;,_6D]AfSA&*4FLgQ4i[$m+Is`)Pt21`-i&`pYDQ\D\Bg1JN7L`D%eWW]A]Aq'A66eRlJPB4?#[
1i/I?Ck&[_:Q@C/sQ!tED:JE<nlf!k-pMTg_p59R?&2erF/;Q%<g%h]A7Clk\LEC,"BY+G-SV
9Z.(iUpOck@&@TZf6R!,`02JhkJ20LhBID"[3UfgIAS\G):oHJe`51>A2FW!&DhEr^u&J_#?
^*DL64.ERe:i_Z"76/u*^X0&BmM+EVr;**DjEGnp0&mNZJRZ;J%a.)r&0:p*d>[;3k3TXZ>c
K'[O9saq\q8_S`<PR,R,1/,/hND;S_*s-cRS%tS.Kf(r'SXX>&Br4.L9]AUNPs=*B=-LDP/&`
HeI/6(f.F`O\i&J!mnh'R4o6.dY%BFO)WjK:ElP#gfFmnBp_C,8%-SF;AQjYI;%F%0]A&PM[&
)a:Q4Nd8\in[V-E]Ak+]AUU+#73GjQfg45I9c^(iGWAT)A,I'NjRi051H"guojNJT$g:#sG51)
aAkqA?F9o10`4,Ql=q/sAWdlp2_MERN#o\5sL)j!)rlbSMpbZYNrM\n\"T9e28&V=V.M!V$?
k0+>_M-KdW'003$dQE3]Ac'Hm\(S`o=cJXRcll0)6`A[)k;O?'3cJ[$gFZc*>^sFtZnM.ED:p
eF"gM+4[d_&'-[bGW""X!!)L(WZ=`"7fQFtR((?Pn!Fc[aSK7%GlsWpmY=bg.5RHZnc]A`fSS
f">nL3@,b95?N#fD)bQ$mDb"J?$%9W-K;FT_5K^%D6K]AC7X"Sbp@W0.;YpS.uqnm6B%sCbu$
g$BS.-Wh[Cn+pC=*DYWqegNZ?u$4KKhc4PH$8Y^V&hKu+u%]A9idk6u9+_PD/bG/_UkFaM3>u
Tg/O]AGZELjua8sNTtY.esf0ErMkqSi;dbI^>K:uj/1,[3E#2t!LhhTF(nB97<e$Xm-ndTA_Q
R4C-Q3>/q>:=7>J')O\-c%(C!W4]ATN]AYSn.)[S!cDSSP9!H5<@>c^`"c<aPbq\3*i=>R&?lZ
7O>q.\u\@-."3/@WGLbdCU/#^/g;e2[>$s+2cR!FFjpq&49EO!U'3$Atq':*@1Gprta,#mV\
S'Zi:/Etu2-(;[P$7e4:^k,dVnU_B1H*0XpGm"r1_-GnF>>W=!nM-"4T@o=,TL3G/AguCH'B
W:(Ld4GpNMEgBN1Yr9'Bhl8G?nJ3N#RD]Aa1H-h*heoeB$(HmF_c"BgTN1F<S?!n5%JFBn6/I
2c\LSP3,:SGh6,@Yfi5IE*=;Ge8^l3kUloq_JkA>rjXZ;]A`7U!u>P;hgsEWKe$5:NHGcNt.m
07>BC@5&0B80,"+H$MG01Y\oT2)^>n.%L;(GU?m9F(c0Ze6/*@%lEMRppTrY1bTKoJ@]A0/.8
p-`D1R]AV1pi40n)8rU#93EU7Mfn3M,:Au\hR.6-4h3.ft)V4[a'5?kdKS;o"14iaQeYf^3PH
]ABo>i0.R=0[C-#@'LVR^?;Q-:Y[#<cWn2;'rh=)@SZ*d<C=)pVaCIZUgj0tDs8%jU0AG9@m&
W3e/hqMQ,J`Mo4.X8B2h*"CuE:KYn:V0oldDb#nXdaN&<b1c5$h7mq?TQci&E6#ekuWd%b!8
#0hi#Oej3#?>Fn<o1.><E3f:WArH*!HVlGFtX.XmnXm1*da[WOHM=)<SSmC>]AEFE(91KE%5J
WbDj=+3jA'0Lbj#f=>\.+:H;OCjJ2ki_Tij('g["HFk]A@MCl3+:E:9d,91L#C679FbZ;p3Dj
6M.ek(%8;DA#p+0%/c`iWX'`Y-QS`@5=G.A0sIg\5GeXBE9IHYFL2LZEn_k/i=m(tA.$es'e
u3=&n40eUsJH"a$9oh$A3A-@8nJWL<)bMmMI]At:@o6`F@]AXNQ'1A?$CQp^AL9OCi;"J;0-]A0
4hk(NK7?3K-,8(?k^9)qA"Fa8EM3X89AXu!(&FQ'"o19AYG>3MTeBgO^7%kh_*+tLjM.]Aq]A0
7C:V3#m<p3MnMqRr[S7C"C9/#=;K\:&M*]ApiqRZ^??2j*J6.?G(C9,j8dS&QChC*g0VZ+`kJ
$fqQ&g!m,+T$CdGfW[lN1mKW?)1Q&2Mb1L.(g"bQ?m7tZ>cu8YdbGi2O+LeirjTo).bIVr=1
p10PGOCJR;>&a36m$=;@0=d+4"[f6F99>2q8FTfhi\-6OodX<uE%rLsqConf'F>$5!jP`'ua
OKcH?K<ptZD?rtBHaSR;i29!)RA&\$<RXjVak)?S3<nJM&'b[Q+k\(LH0h_R/aEoJ_!NTE6Q
D0FVJ%C1A*!)4fIciG-U\MeH9(h(!,E`q7?6CaAYGp[4oRn?mXD-oqAGPIhV1fPG+T4Va_$;
T'h<LSu`$o`ioH<gQ2ghf$`^C:Ac?scu!8_\Bi?rC`!4mn>7[.d!G7_"2PT>G^nf9KX@m!``
"+jjr.8_s?YJ7\3S<!^q8+W,bT#<!+ho/sZ$9B((OA]A#aW-YWJo@]AVrh6e$(6KqfD`pSJnj_
;qB/]AB/P\`A^J_P?hET_J6D!s\lpMGEWe43r,6Bhjq&G,-G4(`E/%5']AXtIJ5]AQg$Dnkl93C
(?NQeDN]AC7R\K#W_<Bms'$_;RQC"fec2tD:)ah'1apoMp]Ae%N[iK:3l7$Q5/`pB=27n#BEYH
qh<hlL3%DD/8Jq'@MpP;uf<L%utVA@4#42[$O!Q/FdU<_I#\j.aX?^H-(e%5Y.f*")WIr3.*
]A/RO,B:M.<f?mMYh-WrY"o?"Jk'U"GWG]AS^9\-_Rpb))6q.>3)l<_:Z;;I>b--8+7YN)MEE&
iQk8jaaN9L[/o)Z%n13h/0oD:90B9NNo39e-$Ft1eC$-u9,.BV1gCkf`Y!Y[N4[@QesW*_:U
,^?mS6;-'IL%IS0"'X9.T4'ZPOpAMghM@-;l9_[+Yh0kU?Yu)Ig#;&BM$F+5V=(dRg8iRP*K
)1T#?(6Q/\rWpV9n'_4H&-iM:MgFcN+[=1<h'5>uCl(:.&7d*c$kD4IFhc?5+>/YmJ.Fpk[2
?_)BA$r<(>!<1uME/RFq8?sS8";Xl7Qj"$ZqYk+[*<cGV-q)bD<oIjY+$BJFen;,4P6e9Wnn
Hcc39;uDr"VVOn3oaE`LeT/h:p`TPr2"Xc[&l[XTm+Q6G.fX<gGFh:I221iK=90d#+<rh7?G
.q7Pr$sZ`a"pB(IMt5Xpim+OdAR0PTCoTVH7311#U2A?Mm8/"\H+UgP]AsG\3)_t!>9_Ash[[
.WnDr?S0Fso2nbAr6"?#cU'(g'.VKP`-+Ll&CjrOKf:R?0sUHO$%&06\_qM*3[?c?7&ehY7W
NYh![,M1^M;V\')/K,=`gs!/iD%=PPb.P5b:>J4(daWsFWBf:K<)dQta[5)+]AU8QbBhu<mt<
,pcRCY)l#)C[$AT&1-q=+s&Yj%MZB-pQ&W:5-!;47@b5XkV;UISSVT'l`G.e)KK=qjaA+ns+
qQ=H5#L=al+D,tM=OF04TF+<pN"j"\PJp@+ad!i\^<Qk0M,E>!/-K2-qiYO2RqL&&pWOabrC
q]Ak!6.,^'^1GGH<W991B_u9(FVa7Mq=YnkRZ$6(pnU\E'+YE/oXf3pqfGlkp`UGS'2QBK2/]A
cK"Zu>a]A&XE3%l'J6BP;aVs?;ce(d5$6#kJ@o"JO\X-i<A$]A#[I9POLB>t=i10i&:dA6EUn]A
4ngjL6etF,;>2.<&;=L[`1)lSgF_.a_#<>r)4!Y0[/:7$,Zcm!I_t;jdKO<6?CfA>!80J!Bi
nPQ+jHE[a*6W4H`5"n!Fe:+:[:8u_6[%5q?eq.U`_PMkhn2f!lGk!LEJA[<Y6Kd:IO;j&X=Y
Sbq+cB`it'V*;=er(gAaEkr_nWqM,XQa4Z[0u)I/sCA#[*kOb[orJ^*ke`=B\Mn?,'!;A&[I
A^]AiB1`lmbR7NL.>tFtNEppegqIYCZY@0>Q3&=W^HFaC:>466+7$KAe*?*j4SV)*7C=&\[T[
s&h'Q:u<0inScj=B0uE?sPD!5Yc-\uM)c3.JI0d-Ar`#a3DdjV*K@NeD=am0PhX#+f)R3uDG
r7t'l"IBQ=)<IWSgjIl1JpIV2gea;>pNXP]Al=Vg]AdJN1IBW(BX[iaTM[_uU(4n$7ur]A!16!/
i"A&?qpZI>jO9kIk/IRnX'l/*)ZX`aGie4'hD<AQ'!XCMEnQmV=<<W#N8*#<TB9RBR6mB>T`
`dOgs!%L/OXuIgtV&VU6k(+ni*ZVOhAEmX>bV7=5VI=S!HZ8La2l4aW(udk2pdM6A/VHO#;f
#/@.1KP=N#Vcc*P;g]ADefN*)C'gUiOHT5GI6#;4<oMdQcnh\noUbg8*IjQVXKYtEb[R[frE?
TZ9!sTE4ku]A5JN?mLe_4ns;&t#aEi`J5_-<\$<pfLnf(62eKjTNk@>or>F_\*J>-b^0e009$
<W4!&d7Hm>AFjaNeA_tPMQ8JT,".SH]A5DT$$`k/I.T"'=q+:k&i[25C#SSS$Uque#!huqMKs
5JWh.6)ju8<TD>0Sk<1[XgMVFfPLaJuKX]A&I;lYr"[XnaB#d>JcB\#XGC"S8YU<>Td\SYr+i
lY`@F_<h9Veo75!k[18O#"R4r7TU\oA:6\.GIiLm:`lgWb.:P#K-$MN75l\/\E:?:goS;9(O
Q?i1]AiS7cR>_;4k^)Z=ZNGpRIJK91LXG*@fSqY4I:qr5Q,8c_(:0SZMo]A8>36)E<EVH>pDZf
8)3S2Z_'YgcDbjqHT*iE&"'37Q,aR;hT7]A)n4)AQoC&(9RJP&FpV"/%-79lk3po'mkQ&V_SG
+jKYU@&GO>A<:Pdh)OE[Yp:R<I]AHW_"hT3p+RfAYVqB!s'%Hc6cm68+p>K-1VWJEF@^5<@3n
cLSC40r/reF+"f$lHcLT!"eQ^/#2ur[%+,!DRa]A0foRE50\?63gc;\;;d0sHQT[sXpT+KggO
Fb7-aesPLA9MCH+eFo(mB/,Ko%u@.o9L"8]A?ab8;li_=k?uKIW8^VCJpg(7`a"V^r$K6@4je
kBFbZ'1t8M;3(4KqieIXS$;(Ursk%'$o7ZD@;C#^1W$1+%-mmX@fl=lHKH!3i8.lWcf_iKgZ
g]AV24LO]AcSA(AKAdq%!#i&44ILO;3V%!s/"-\Eb1kkcJ>_4:pI_q?=2.Pd&m;N70*aQ34l5[
Z>98\#geS*JpnU:SDEfND6U>jPr*S.gZbQN)[B%/]AaU/U"[,*4eUo=Fog"A>*WN\R-p"o~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="92" height="100"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-657927" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-610004"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-610004"/>
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
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="394" width="92" height="100"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report5"/>
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
<WidgetName name="report5"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-13882037" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[864000,2016000,432000,1152000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4320000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="Image">
<IM>
<![CDATA[!FPu$rJ=?G7h#eD$31&+%7s)Y;?-[s/-#YM-3seU!!'bUH"R*W![gQ-5u`*_m?o\")c7HmO4
oIh-r.0C6+#.PbM=Hn+dM&]AV3IFr%M"&M<H)paLu>A-]A0b*X:-*JF<*\:l4+gAn+>L:NpKl>
\dA"PMqa0:V&e)Xjgah.bs5iYX^\dU%rd;?q##o@+oU//D)Q7=Ip+K*BKU5!8\6!rjZmtBCl
%quV_'D_>,\Z&dQG>CeF8d=`JZi=a.A)?UpsN#:[KqtM4u=q"mP)#_G2OS,Z<'MOKf4IYrN5
VfWB\^"q']A!@1;,'I%61Rlm4RAT%1UIUI&.Dl]A8t9Sb*HrIkB$^4W0hK+Y.F[:,@E*SdJRrI
@hZ,o<ff9ikI<0E@+/QKqdc^$GW&OZAA7[U-?gDLo64CN[VL.747[=n*%!?Jbra]A@JeC=CVP
JU<"?>B1@5ZeAl(\mLe@t:#GMcffO+IuiN+4ri"-J?`i/XW:'lS(>#YHdi'58o-PQ8IAq+DG
O&Tbnr-,?d[m"KXFYS3N3-%Pe/c^tV7*fbb4Q4hJ?!g;Pa:bj%TQBh#lR\:tf(J8iW8%_n)4
R1&/E5i8$QkqG/,7fP3bbhDUPl:A1J8qiT\U5C#JF<VqT4#R`[#iN;->^!mI"8\Z]A"oRhoqK
.b!k*rpKr]A[Pn9$72g91l8Z67V=\cAd>H=E[!,7-H\5ttT:IoGrpQj$u,lLq]A<h`t]AcZa]A\c
h31-gMGN/s)4cFSaB%K:![&1+d\Z$7;#gRr!(fUS7'8jaJc~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<O>
<![CDATA[企业新闻]]></O>
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
<FRFont name="SimSun" style="0" size="104" foreground="-657927"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="true"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[[9%'A;qDf)g5<k#<X#Q-<,BMT64jC)5Z(`,`JIYI">GF".oeEf"=+6ues<4c";(e_6Md_?!$
pKQ(R_?Q!G$H*a".A'$o/(m)+&l7SU4-Vl*<M;=tMu,b2Jk;p:'eqp:'cZp!4Wgo/)bHW2Zc
@F8Y;rB/R(7%;KYH(sIF6r22uFr1TRJp3Vg,DYf+@n@Y_EEjq+d4n6&<qkar;-g,m5R%t[gE
dV"qG\$gV;p$S3d9:YBlo5Z2j$+KT5Il.-nL_FYV``D23C^sl40Gs#:mr2jk]Ah[ui^rTO<5)
Vd`F@)7p;McXHsS3450<%=k>M^'%J39\$Hrm]A(LD"78MW0b+5AN8c#%[bA6A*7P9+;;CM>lr
NPp,:<]Ap:J83\pA79:gDnOoEBr>oO4G57Pp,5SFUQJ>C.:A'%bQ.`LT&'.jMD2CD"_-Pr55M
$MdG04)'FWc)Gk3%E&pS4^ioK\o$NV;&30"!KrOs_&HepK%Co&0AA0LE2A+k1N-c@t;%L%N_
dI\tkT;sW[=njJ09E[9""aQMp@dg<P4p.geoZ^ID/I+7P@FEB$g.n>aoJo<W4/'RdNn^mk>H
:$SjJlOiX/H<$R'!8G/F^n&H@_J,Rr%nCB;;AJq^pER;.PA-\`T+]A%j%'[.]A*D-$ViI)C,.k
`cr7^<pgG&q%YK(kq_]ApD8EhYfY5Wmo1=L)1VZ[Nj25_n,din5s<62Za=oCebGR+B_@"VJ)B
3<n@(W2$c[mh8phF$nuteMiM6bQK@+$TMR9+/nP?q*ioc6?2V;P;*0hnVEm!UtjsH0=F(\es
b8b(K<*%pfg"pQlpL(Q`^NZWe@^M?B2X7,-9b_YXo7,Bbne]AE$r/8KoeWpj/;Kid.[-Z/E]A*
?Z:8CYI<Cn=B'U!%mdtiEet!Ml4^eUl0PUA/?=%6Ppp\*HZhiB;nj"j!)m`/sJUq?u_-"HoG
tWT!H(aW"7,"*'c5ZdWl8%$iG8(l/\)e'!jr;9=jVP/6#<qIYC9Xr\/)M)+2DABc-b3ORChT
c@o$Y!k9\U3\cH&V_PrrjV-\K*5cCogjdF/J'[(oS^A7Nqg$FFMK8dgThfFfqg)<h[n<10&M
g!)dfRgFjXfG'i6j'kH^:V>-C-@X-OaqatrcUg\S6i\nTO]ABoP/D*0[%.=<bS@#1>;/j<=[I
,Z==6'&8dPd5!m1ITEHdQV:/DN3*#qAD$9>sQ12*HTF<dhZh]A&O:=Te2>DI76.8&_X,L[sNj
R-E4Ztn^HPn8@$$<DW"G>rjB,f8ldY!D)LgdYctCq'ohL9A2&MmC0c]AD86TnB*-YMIZAA*SM
MEBa^U,f_[<9c(G0TAB'@LP+[CRG$.cY!Y[,]AJ?g`P3.g3U&Ml'WYDi>kUXkn_RCduHb@=>*
]AZ;cHT_U:*B@.FeE@iR1Pr_(1FDP_b/G/XT4l.+DVpEqmRZ00tfpqA=IULb[:.'AqiH9CebW
\rD\G1YSgIBOnl-UmG:1l5l,2Ko.TLa5("#Lq!J6i_cj*8G[2Z>mfHaE2%P9H0#6Ad[16#V-
M#.#.o/]A4C0.)KngqMH'7j;.`#Okb+p[N/@UE#.[&N'HrDLaWVmV\9caEpkHe=&b=B8Y?'QK
$&`&R%49NE+@5e=mQ-VS66aMt\HtCm7i3!n&9t#g'($0XbH7bE[48P<E^NMuXBJkB/IE\?`A
Gh7/*U]A-c<I3L5oJAHHA8]A[?P#>R72ELg!>,lWGFcF=Ja3C?]AN9\mmmY%.IN8m3lHBap2/GH
1$FA8q,?%-\+p->=l(Ch,N_"*9H-IZqmotC*=SXAIp4E)GH#(mn]A5(er/m/BB19CWXEgo@b2
"kYp/g/c3W%Mnb<K7eW;H0Rsqa4q+o>ej[drbqiQIrEq4>Zg!ui=d'G'41Z7WJmdVPqY-uI4
tJO"hW;f?87)'8#RJ0:md).+..keAGHWA%XWa6MtB_35-GTm#h?H^?=oV9N_\tF7UBF/[Ee+
`H5=dLb*+<DmGYrc^0CPg&p<;3HofYp9*.Wu&$%o/B.TQ/WhI\[`T$`b&Sg1>a"Me,f*:s-0
^^`56>X4N:YcqI75nRUk;"IV+31!WZT@2;!HN7uqY-M[bnn>^BU<Rh/H5(u_!I_N"_?D'=p!
9l5"V&q2\k&J#@.H<H<[9mn%O2T>#dFhfnj1,rA#H5T;]A^>ahf[M%t%+aX*'\mn\hp*!@^6'
dU<?C0V(i/>FqtMU`f@4-i=TRE;.Jk_irE!")Z2*fC;Umc$<`Hjsm)YbPDcHVCdqPZ2XZ4c&
p(Y/b*U>kA-ArKb.\6gT\R^Dt5n!>9%!DBTk$KH!56lf]A%Z1"nXP4bC[+\`SOM)n9rjs-qs!
p#M#hZ!+\o/OMBfM3(4K0k8saW[1DrN3KQ*+0:H/?jg\&T)XlZ"n]Au@-/KsiWjD5n>Ca#sdV
s*4H&T=3N]AX\pR[T>9%&IRB$'hg!dU9Ppjs'k5%n%=RTW"JNMIe3Q'/)[AK@TI-4KeWmXD$'
N<O9mW[d/3Nlj)cg3H!;_AkG)>jTP\'haIYgt._P4e7\=u?EQX^+B1SQmIkeTiN6kXPT,,mW
@b6*eN-nTun]A&"d(9;qj65^g%&q67r1Ct9&joj[(&ethu"^IXo*&@$9R(nMTgQo0R#,/^G,\
TO_^BL0NO"Qq\0*[KE"TZ<&MAtL;'JCYYpMf-0/7Kb*0uM"Hmm,RNWFu9U'^q4b80X:49UH$
]Aa+";W/^,rjQr="F[>WM:P,^q$:hS'XJ6F3RiQP@K#`n5u!5]A-@Vs.iYEcgM>70,_ik-Lq00
mMWO%f/$<J'+Rd.O4a@,Vto?^W;=lgBhI^`F7_XVSf4)O?m#/JgF@G?m=[U_)%ts&-)\a<\]A
suqY&Pg.ft*":RuIbgF,O[2T7L&Bp7OF@JXl'gV2dF>+YG;?]AJuT[%cc`1'o5'PB\S1&"^%+
=n*75T&CB@hY?)oDeT^E<sUr>^HHED*gH93\K(@p.5@LB<Kr(*.ma]Aq4mD!!K^gh7\$N[rB/
IFY5.nK.-I\fm,!m&^!uG-A6@Cp[*;<hWl4XIKCL9i#CIA"m/;/*2C+M`4_FmdI2iO,Rn2g#
eY9a\-ero'P^5d&Trl?im#SN'-lgh+q[Q7Y3TVg'<M7CB:M+fuu)KuH6.bom0CKJuahF&c(E
nW>WK\eoK!\n"7N/G@?U0N?/crskBe""8-bDCqc8(&b7;ou5`(l9Wd<_*X%BZo.D"smq)p^S
MI3u=UQIW-Qo@#2/@?_)=8k.Oa3]AC+%-B*jj$Sl5uMN#&>t=uo^mo(,<Uo:"Wf<8!Zf<N>X\
F@tN;^1LiXN"O_*^$PFGqH_d:3I'9%Mj[*e9ei_Cq#ueY/Df]A%[YbkI]AC3^)X8u[**SV\Z\u
-UZ"#jr$8k=ZkSO!&)Ks5?T,F$9C@(VkX^pFbT:B.@,U>d9%_Xr%$$N&C)9"%`XSc'%g<E>'
\.)A^c#m7me#XM=%_%sm9]A-f+;reme_U46;FL3ZR_GD$H`TQi0q*\Qm`B=M,D5(TIY$a#>SF
Jc<"mt)brRb@mt)M7>:WP8tM*>,6k2Gc%ngZkg=^ta/$.-jK2^A$N[NEKP5KU&fDQ$nOkQqn
H.8\H&G;&]A<[X2A)>kp_mIQSe,!7`l%i`b\DR-?iE%%&6H(hCg?&3'PLATBJF77^POULsK@m
60sXo:ji[%P$g>)m<;4Nq`^ac9&:'Ldm!ks)S4UnVs[^ij`e*dWlhMhCgn9h9k3hg&:sZfFV
gC::mCL9F'/ICh_A7'@%"kF/A"^J1C8/13porMlJDC2U.Lo!d=c_:ZC`tRdPGlff,,4qbS')
iG@OT9:Y')r[D).#D4p6]AMP<.M-iA*ECdRGM3%&US.4OZ+7!<%QM6Psk(]AMs(Jc71>dh,6IP
GS55A2]Asg*<u::;u658!j3<TcS%8;A\BeS.?A-P%*6glb%RQ6qr%!^^]Agjm^Q/aGS&5us49-
p7>_h##:`fFdCRq+\%WSnnReI`:MR)DIo4)+C`9\Q;NkMK\S$7'J8`ZORUq2(fqsGcJGIf:]A
hVL3CFA0;bRL&(iVE\Q[-q8)5A:@'FT$#)(s&=(9e\ZM`G9n]ALcAF52,Hi1=5ldWD\G64Q@T
70I(tM!j@,4e><pTbS\#\eJl)SP=-=(:qF7VRp+I]ANS,7Kc:%/?,3ArF]A7Xl4M_,`r':\mQK
pel<2Ts5;"32H8=tN+GUteA.]AOrJiQ,S+dp&*r~
]]></IM>
<ReportFitAttr fitStateInPC="1" fitFont="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="184" y="0" width="91" height="100"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report5"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-657927" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1223324"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1223324"/>
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
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="184" y="394" width="91" height="100"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report6"/>
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
<WidgetName name="report6"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-13882037" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[864000,2016000,432000,1152000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4320000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="Image">
<IM>
<![CDATA[!Cd4&qh\-E7h#eD$31&+%7s)Y;?-[s/-#YM/-lF[!!"'n=oeU'":[pj5u`*_eX:,b'1!>Ql[
@^qJfork#B(2(A2eAUJu'rA+V[.sI^$1'U3IdT_<TX0MYNkn,2sCl&.c-OXf\6okg&V)8<m(
'GdQ;[9hMO4eW+Rrg!)?#bpJj%dtK(k4$3B&c$TKbhBX=U!3Tct7ei+V8lkIbT44$XaO&j_Q
5&?gI,9u#>iMpp/BRDX>5skHPuR@bKQ$oV8c0OboF0<S=DP]AuXV!h5!PV$$n6H?g=5Z#R5D-
3_Z4W\j$*9r^6U$2'3\UoDPndeee7_P^O"kj6@I]A\S]A(S.U_"q#XOot(O^YMKf):E:d\g>8#
/nWefC`Ujn#hCE^XS+AQZPGtMLN#+T:feF<r1:^d^@.Fuq]AnT0%j)-2NAbZC]Aeq%I"6OmTJd
e`'c3=;..#Jn$)IDS,CKA1(q+Cu2.L\5=.52?]AnJg6FQYtVKeo@RVq6T_/@[R2(0OPf$NcZF
cH_4ej;rV>*Vi.*M(329c]A7##&Cf)s2h,]A5WSW)lMC]AP]As^fkT8p:eH)@kJ7ZH1oPV(rIa9U
CP@A)/uEfSTZ.FIF-oo;.+UaZX8+>!TbaD@pt[LiU_fYg&bZ^30;Hc^EK"]A"OK<9nE6<AJ&6
9M?CWDOGI#=D\<]AE<3!fSVoiYKA_slp1E`dk/J?-TgL\:CV,4ABYV@j/"%D>&I&E^PPeTXc"
J_.\Bm\)$<Y%9np,s@$$9rA=B/*;Fg6A@uI`+07d/.208?&]AT3,pPi*,eALoAC.Fh(YY)L2/
BVH%#XO'HgVj_cV;+@XY]A.XA1_[47hQ]AHPm-)]A;;:3JddBG8onSK1:)\n6=tD3[NsRG9ME04
c:)T@9ImE@]AM@DE+:2#L<'56b^q/1]A!d^fL3ljVbRdV_.#Lp\#lDCj$WEALcS),2n0]AXK+dP
=^`6<^"8XV=ZhpQ/#>IgCf3oGFh:"ga98b$b5ZQa:Hf5s/4pZZ5T5Z%T^Q(j3$1*1+!?E]AQ4
B),J50W^Oep13ETP&<FZbme]AOVu&s=^m@VA%0Jb90.^*Y(7YE1Y,&sh+R8\r8^rSCL#$d4lq
e0VbY7JL7GYVbS?*L:lITu)(/_Eu0^E94E291&e1D.,fPWLgo"i(P1-oPhQ<fLen/b6J09(!
.2C#1f]A@S%.M+dY)%knT_iW=l!4qTA$A`,bsA9663kZ`d=UJgu/j/YF;hRA\_jcU*\A-H="V
/dRAH`b>'+:\2Iu(1t[Uo-1>4^+K/-Td!&YRd:4GJQm$0p*6;<0g;#c&$K76]AFFUftY<2=9&
EN7F>/5k'RW0Zm:$rKo4n>5<[((G]A@KgPJGTUc%C$;r_gBVc`Er?*ij$["mM`d1'!!!!j78?
7R6=>B~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<O>
<![CDATA[工程管理]]></O>
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
<FRFont name="SimSun" style="0" size="104" foreground="-657927"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="true"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[X]AKj3eEQs6=t3\0Fs2aml#rqgMD7haDF[ThCGJG<X^NP4b7*Eo>1o.%Q@s&j7'8&;Ba.#:%p
SI6jspk(EVULdj#YKW*UW=FT%Ef*+6Rm^4MK_AF8<J@pZML#5E?a2/^77]AC+`L_:f'#6HIuC
e@DO\f>J,2(pbKa6.T'#E@:t&aJ1[m5Lu1sJEa5MiH#C\%,Q:3YF["TpE/E7&RbJ1o-el.4'
HXE+P&GXm3hd'EX1e;FQ.LpOU.p]AOcX2([kN1P:$,-]A^'De'_H#BdQhX3X3=#k`(S'Yl:0gM
/Clr2)@o]AW%TR7nq@3i=E429c7[K*FCoB4FiIDY@9ZJV^r2Df\qp(9$^:>#-C^g'j+U,10$_
C?/_tNQPf)+(`03lkC[k%9sa8IWru`+oO3bLYr#EXm)sP\@(l;C+QSj`S`^;>s$-tiFT4]Ai?
4A?B5/+B;tU/3ntq?>9=&D7bYAm3[gH!8=`,6O<k$U(H7C/@54B5aqj3<BP]A?G"mfZ?50g=A
TD6(F208tcl<.KU*ao-/dgFBH[Gc45I4hPr4GW9ghrR6Ge]A#e.!Ue7^Z'Ij":]A0=34-,B&@i
14XbOB(\F2]AVj6lPh'2ChIY3_[OU58t3&2aQ@?TRS#+V.[HqIdTeIOS1>p48%4DkQ*8m]ARB(
"s#YVP[K=LU7d`?ghd!J3MHejArHA!5=)0eE`!_CVTna8s4'sYlOajF@?cLftl4L[;/D8Bf<
<2Hm7ZlOl]AS0+E1"2=6qUEYOT;PBp8DqO%V/^f$Aaqeb7LXIE7_^2M%la:V?N([.^AJJ<q*I
b)]Alb!iJaF,?Vn"^1,;l!9@B608?bo5*-nla9]A4i6M<Q:1`EQ=8[+L>loZ/h_RUGr04L__U7
U]A;AkbX^pt9<;U;XB"J`MGI0KWADk^-(5ic,oX`L#H\CsLJRj,"?*=_ABd=I;fMGdE-"YmOX
W2;Hqu+IhK88H?QM?]A+_7-D8p4bZYR3UVGOc'(L7mh#_e'^:AbSN\R(/M'54efttm$Wj%*2=
jEb(D\\rDE=pdq+5s\L*8tn]A_aC2[^N/SDnGGC#O!-`JM"5qtBN'c#d)b6J071?PN&Y>'?c'
BL\7^QOS\V(2ZS$glT,9ggQjP3m"GO+m,YeqRTu!BuUY&QH=BG[,)8WOKM^:aLbD8:>]A4CJf
C\'06_YAc1o"GI5Q>"51Q":no:(g.VNp[QZ>`d--ahYfg9iW->lBm.BZta_.8V`&(EV'd[#a
KVW>!jS0sIYmAKb5$>7g9@hMX`Xt:%DmbCCq-Fc+En+R@@7f%TLLN?T!+_Xo3GUFQin\\%fl
\XEgZdBO(>1MZ=?Tcf7`uj[N]A^k<2*u$Z^$3N49HAmklWR)7uQ4`G.Z^[\j!BUiQPu?4:Q\B
C.D79hE]A54jpJ]A4OI9lPE^6Oh=tV$0Q!M4Nl@/p+jp^2*#\`9m/+2:YWWqf."sh>FA:gFsQe
=!tuE$Q;]A5/[]AN!@G%'^$QS^09TL*\8U?!k.#bY/6t3&_,a6No,!@Sg89b*1b(5:BTA[H"m\
t.gc6cV`dPGfmfT\&UKuC9cJn!/KF3CkR,Y*@9?9a]ApV`A7EW1n+t+$hH62H.ul'GuPoY+B[
8*?(^*0P<hu+Z\RE-5pV]AVO$)>kaN_P@&.clE9J4l&E6&!caF2:S7C\WV1Fe@J@f7S"K1Zir
QY'iDs=K5d'5Hj_>MJX6h/T,BiB.JT<a(FQ:&?lK-HA-iSgll1BFuBAe.n?q1#JKX$f/BC-#
i.ClE)"#U!cNe4<g[:&XH6Z2ML4kG[oU;J`C1$R^a>39Wl-(..7E^#/SI?L(39RXKR^:$,Zq
.0o^rW*7/O8t0_:`2p0M/&YP09nF.%c'cDSopZ44%%?ase6@9$oK\8/hOXX-:$9MmCA&3DP1
M%\*,j8JM(:O03?U#!gb-Z,50;(b().QF:\RF[8s:8MD7fHgLITGHj3DnQMVT^3bTemD<ipt
G&/d+4;YKqQrg<i&)95A'A[\>47SjOTX>@1=Kp1IUFiD3QY:4KjPY2'`]AV*X>NG6[[jn+W0d
@)"7%e#YN;*2dm80/d(HifTF4S#)qR7RBiUn9sa-TbK7F&T_4/5(po?c9%9"9_-'Ad<g5cNE
953]A!.ndWq^$Yp7>*(g*Shl((IhdK?Ia@nX="5!55Fb(p2'!U%eKnqpV/OLig4Jm.ON4-sT)
0,&#*JhD(`6UXuPao7[N?LI,`7n.DaL.Z",D/akq&\17ub:D#%-62\k5eMn2UgkWSC.lOF%F
TH<n&q?jpUp>B"=UIBVIQSh`Lr6hr6g=o;S@*B#`a%ciJ.:hUnlD*>)Ej"_DK;-0H6uK<g4*
__bimn:eom&C/X9!hB;<jdGWp9a$3/[di11]A7@B\O7=%+O>"0Gn2]AF]A3:.ggHB(q%"L,`h#G
hj+`48H@dkL#eqE]AbAZ8`3)J#50D9J#]A:K)m8=<<#If,a85QeSTD.F:=Xo4$^NuLH4)[[@s?
*'S8(,QI/4d1KE<_Xi0etg$p0/fCX8#c4:T),eUdsGeU';\dm_rY<>R'm)2K"VrF)G-g.giD
19\lj=VZZ\*eD@`q-"\:c"<%YDpJa_e4_8H'Q5DtIj_4D&#Z9?*g63%VNtmpKi.$GclQ*fTB
`;Nq/^Eak0DMD7KI8i=cX6g,(@u^FGY&G)4\bgS^[HqWMUc>!cMm"$\eMGJ@N/g3+[%OBs33
6-=$-snL-MuNNi?Gf6tc(PuD=D9"5$3bt^8pBi_97_ErrBN0'`Hg^4\cd0F0?rRT`('YAr:[
!J<FkcJ=A?Samlhmb!2?s=7K&7=ZR:#S\5+/60-QO*_"Z+&LfD0?l'/H(eaq.>:;[GqSrY:h
eR`q<P*G+X90<g2Is.=)JL6E#f:%W3+$/NoR::qK=?cA:;tH:o'eZ$i(1eEJeJ>gM]AoH@]AhM
Nt"`8m$R.P>nW;>g\fL]ADLcS5+OK77aNRffMpM]A?*.OB6q_#*_jaqHATPlFO(dmdb;FD"&-U
$T_&RKEHKnLFB@dmL>I:\i\g,3unqS\s822-%7UHp`:6SsHF!.A&A@B/:pTE3e-a[W,@ZUL_
(Zi5]Ad9Fu37b/B4%*;/H487?F=GYK2!%b%'`aK[;S@Q+56,<[P%.0pOu5s7#Hf^7'<0^_I4-
:PhT(s)&K2K[uB&BSfRWBOS`3T;eS,^DZE`Y?pMaEEKSGcB[o^b[9WH]Alsh)056I=cf]A%JCr
lOPPu!8h.&*CQ[u\?iOCss\iK5k9Cm<oQBn&(Iug9=T8WHD#@TR`np-)/XTFsgHABt+&poYr
Yd]A"!'8hkX(3DO^[Xi@'X>g_SC69DI&3YZNlHo2kJ"Kec,QgiV+E#<%fPBD_?#6F[oW%qD,<
=g?/igoqLW=RQ9i;KQR:!6Xe[_[R2ns:IDGLl1;5r-jlU]A&lCaXkC#ar0#H@,kC'mAsOA+%o
c:a637L\V`c5803$!%ZS@(=nUX<(Lj(chWeQQJHlmFcCCs+>%(tm!K6TNLp'YP'VJG+8erW:
)(Xe5X7fr_2G5qYKu_:eNP*A9p*BJcb14paZ]Acbp.;,;r.HR%Z9`Bcq@3&B-Kk"D_q#0glpl
G(L*EqAC,i>FWcH>hKY,5fp8m[/@qd#%'jl<"fcN3ga'%W2&K`#`A9+KiWEcd7l'D.4]ArL!L
%!o&K^NL_9,]Ae'lkXl^&#1&tAdYTJh`O_W3q"QP!A$Do"mMUpBN5KWY`3C[PmciuOS-C+nZ?
f3q+Z+Z/@Emd\J07gWL`bQD-0:`qN9SXp;N[m.@6<3d9E,.XSh6qp<%jA3Y5?D78d2$qNujl
R-L'h2[d,J2'HHh(/iA:k!JSir2QJJU_=!2D9?OO.p]Am#[[H?#*P=CXl7L9YYicrlc7XPTRL
ct%_HUZg&(uo>@"00>Ks&!4=_S6_t57R=hBUW1d+P7&Nhq.V!/OH0J"mC2NUYDgbr*(nt2\*
#,"EEksHgY#@$M@dboO*a8%$9fJ=#(QAs(/o6TZ2M@aiVsN9VlIK.t<pcCqD83NGDtEZKkkK
'm!,^;Q%MRZ>u)j&,r^"'0j2%cp\A;]A8Q^?&CJlX=O?!mKeW.<e5G?Tnh%F?5rK<&Q*j_)i3
mHLr3O'-^Ei)RKg>/8;Z0n?V/'oF+8KZ>(\cf7mJmOj`p/%uH+3b7&gZg,WTAtkNr)Ag9EmK
?Y15M.gB(g>Ul&%X#NLoA3\4mDQ)M+os%O]A!-Ta29?B<mGjo=?XI`^"o/4l+Ggh+mpAg`5pg
-4BTUV1"NL7kE6DRCjo`Ec5H*[%]AHDQj>NBM!a"ett1`c*iG.USp=qUdPQ7\kSIVQhs2s27*
(>T7o%`q_ee\)'fuo"KfS\5*7EnML<H\f0m\C2E(Pa#2SD>V(FZ'+jH="Bcb;N)4/ppF-p7\
2.;Fs&,,9q_Prr=Co5=;6&U%7IHqR>m:pql6qG.d(piS!^4@!XF5UkDnM'VSi`NAnh>_A3C5
X!2$HCtu$#'[pV9`@-T#t[p_q-mB3hhRph@IpL?^TMJAbT*n=4XsTD8Wn3HJBLRD*Y?/_=el
Y@BSZjSa&SHlbG6RnQ*Zdqu2X6&/+]AR;luN%.DSoCqP0m8m9t$75>k,%n&U(Z5YH<@Zmc2IH
9o]A1qLtL*NOP3%19]Aj>GEp"XQ/TpVIk@Gu`Dj+m%,E^hZ!]A_s]AeHg:=#=Y[`1JRu5*fV]AKHs
mAT5hsYJ[u%4^-qZ.m10^1hF:8`Ebn#nP"IeNk*d%3s1g@V\1EKm7mt@`fi#3S0cA:fc[O0r
;go9oD8ld6S5.np+\Fcni:ga)'q$#PPG)NfO+l1QnNLFAK:gTtj?ONso/3X96dM<n1K$VOLk
h3VPmAO'c!)<D@C"q<d*SrsW66('3D(NdG/&N65@a]ALpXL=H/)MZYD2<XJ^G$Hk/Hm,A_kDk
P8Sdl\f<-nZ^M-ddcQ<BBfj+?(!5?,uB*B_[I%5H?pFSY.%_J[]A9d>A[8]A;fqZOdsbJEqB8[
m!&\HXXt0`=.sR&[hJ=WhT;-Pr3/:YX-]A]A-m<0i-3EWNb?C+*8VD3G4qJ1YCDJ+=<)):dN2r
FTRW5t6"<pZaPNcc$JO0koK$Lg9!iac\d$!fDD-e;[*dC6S]AuW(&r>Z]AL$A3-F37\Pe!1+mK
W,X7-ns_>kP4986BE/!*-,4U)=6?TTl"eCdVuV:jO'!IK3I(8_561~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="92" y="0" width="92" height="100"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report6"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-657927" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13256578"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13256578"/>
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
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="92" y="394" width="92" height="100"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report7"/>
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
<WidgetName name="report7"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-13882037" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Aharoni" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-13882037"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-13882037"/>
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
<![CDATA[864000,2016000,432000,1152000,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4320000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="Image">
<IM>
<![CDATA[!JLZ&qh\-E7h#eD$31&+%7s)Y;?-[s/-#YM/-lF[!!"'n=oeU'"ADBT5u`*_bunh<9i2V=hQ
K%?8BEq=-$:8=E(,Z$%h00bIh7Gc;3FFuGe_3.jBX#WPl-XVU!>jrc?+i`+F0crpUrB#GR`?
W]A'%jqp-!JP\MIkZqpakPcfs6!^!=+$[J%'RO]AENe?a-,V`THG$400*=;^:q>B$k?Q\Rr)_E
;r+,0>hq):6Gus`C1=5I3[&1iYWUTC!.at7W\eFX)s7`KPL[?'?r]A!SSufjpp-i(dmkYLMJf
anD$"hAX&O#^VH\./5Q)B<@6^6dJ?QIjM#M>KVP=1rCCiNG,4crgYSrIf623Js`jOeoC']A7h
Hq/[Slt)LS0dbj8S1hbI!+gW?NBEmN!Wd&M'AWZ<kr_5')&?Kl'r#33S;.96!q<h4<+3O9X)
;IK!LF)>!PmO^,/G`<RmgQY^M2'?_Z'W28&4/Ed7!rK5ba4*%2!gd5kiQQ.CoZPT:4$5)hb=
'%&EpU+[l3`MMGM85JXMufW]A?0Qe1pgm$aVBCFacNpuI3,-W0*F"KTLWLB.RN"4*St9'RjjC
liQ),7[OGW`BJS.1EFILj#0<)(\TQGPFNi)uq%5W7L+P9Ir1SZj>En`5BG1nkoQT=8?t3<2d
>qfN"o@T?DL^7$=EHEF.rc2B=:%nW8rP3:Q]AEVPrEkD`&:n+Vf`KW[O0<@0,!*/BOU6d*.-:
MV8ZB!&e>/U.!IF-hPcDHG$)_C39Q(C6-Q;#nbP@-)r4oITk)]A;M2=hZgg:]Ao5)-G\]AP;l'T
^<4/-<QLBePsY>_Jg98X+X^*4_WX&]AG6]A\.WAR:c]AY.Dnp*eCri-K<#Qu_5/M3f9=dRZ$YJA
nX9K>!<Ah#FAdBlW><Lb.Q"0^)#U`]AP"rR5HWM_/jd:"TRWWAF_*8J%ncju4kfi!jF2I/!#n
1L'WShZs;0B$BPSh4c3c-)?dA)9qk<>D`P%jS\"@LZqDY+OG`ED>`f5A$FT0T/BRD1YeS_KF
Vj'bT\==dX_Zo7/4NPgg51qT1ljl90E^)'$mn1d9g[]A7'5(Zl(J\OqcqOBT5+MH!WMVDV\-@
rN4j7+Sg5J(2osJTDODB%Q>Xo]ALR0&Df4M9j:;#$TureBQXVBJHE@(CT80h$mRPYfCe;NXQ6
\k2-2kKX^'=V*;A7D(`IoelaDNcDcugP>*euP&JAf!QgX0"+<=P(63-iYdRg>iNAk>W+oS%k
o$/`gS5pLF",]A"A[oS"h;:$b?XR'Z`OR9+0.f^Y:d4Y<BB5b-5=[K0)b_bNqG#-')C)P=IN/
@l*4C,aF+16$O]A^4Ht#D*4\jCpE0+JB&"bbPgIK"d67tH/(<GCpV)?kK(/%T\#[\E)$pDRL^
%/UXtGA?!%At=r_**:8]ArB^\D2Lf>9HiYH`Sr#q;D=E5LiV2673%4"5tGa^6nR!.aL::g<u#
!!#SZ:.26O@"J~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<O>
<![CDATA[企业流程]]></O>
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
<FRFont name="SimSun" style="0" size="104" foreground="-657927"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="true"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[[9%WYP3L[YD7(9t)TFreBeqQ*HCR_JR[I4*18R^'jG6uB[TFH0qnb1(Ru&Sn)&hWdX\d+:V3
n5nl0Eq1j1&Wu.3Q/H+c6X/k?Td4F/DmnpZqF3pZK.NcZ@poIGOXGEI#%Rf"&?r\lr9@F16)
B]ALPV19!ahLp<oA_i01Y:>P#80(7&jqCqhX-q0gFWbjqOOB2TISkOR-!Y85lZ:+\I_k?HM"J
R2TYjn*6YoP`oird*VQ_Hg71Ikr(N^H+.pFn;K,^!Bn)5--M+^T"7Y47QVl2Yce(jO=4UNG!
+!r!%L]A,Nm]AXjGMj5ZJ<[uX9ZG4o(uqU2_QZDa@o(3>44+[n*&Dd*nR9\62DPI5`bbu.V^^u
6`e?u=(MncG/S[cEi0QV`a#K@S>!r%AYWOZc-:5t,u/[Y`!U++o.o.o[6[4#aO$CEn1Nu[^F
*SbY=NbcXei'J(%#9g(fMaR=A9?tagYkfh&W!XHoHmY`)M/3N-S]Agbt@WR,kJdm7LtKem57p
PMFm-_X:d%9lV9T2-`Xt!$EOn'nGnJ.qeX:2Ld(_;?_#N%ONaKB+_.1!JoRLdX+9]A>..70LT
oY5.>?oi2dXF>(K-,fE;*=9H;s@tL_)D1K;%kZmE4N(R!Yjk%i'V'9'Oc3e+?A5*FkK)bn>^
k9$h*4p7i-;!M+BI0##JsulR/D9]Aq:RU)Lq<i9`uBL$3emHLaDZ1=!j\JFj/+TnN[sYUl@D0
L3+nd$Flf[>>PC'LL1YH:<mp03AT\N[.Hel[=$4]A+;08F^#gob]AK^tbi<Yn_J@jbQ4==GQjI
sO[/%Tukf830V0G=ARoEa>6+/A=*)44K1$*\oF5(49:.QTi>R\J\a5hIp&D$^qOSs7]A8!!nB
WM<7sOZCT4(rBe5)/%nKX:&.3Q(d$g"5BF'D5dI^BjA[KjUXMBL_JH?F;DuI'-Qg[9KQe!7F
8,>!b3DV-W..p^frsab4Z9;e'G]ADN3@]A;ZepF^C"Rt]A_frtl^<1XQ0\cK.r<q5DNbO/7S^[E
Gcggm5E/H505rGiMeUgmQ55j`4sG1tt5q,$V1J>N)?@=?pkF!L30M=c]A(A=M2$+]AD*ZEFbmM
TMng`>>m7,T1sY8`?a9jaa%I"W1B&<VZlh%O&jZrZUePO<oOJ(!)-#VYW$F-O;=CiO_nKrJ%
3(obC?Fnot$9?hYpKs`B3/r*[)9"mZaj0PgL_bF+98Bm&:14\ThZjalP/[9q6H?a)nrY0\(=
fDHGX)iLo[ii7n%F^Z1P_Jgl]A48Yoj&HUd*qVB5GW4P7@q6D4_NRUGs7R$='DT`KeJSg32m3
sPE"b&h<BMc^eGDs7gZibe8_m,,iU/'(@eLXE9+gJ>H<*`;,+O1kldU`0)7FHY]ACG1W#l?6t
D&&rhV.j1D)JCsm+Mag\G1,NkT=knqsE)<+W!0>Ai1Z7m-l$+5EA>Xcgu(i5X#Y`6Dm+JuE)
?&1!J/$B4)-PKt[0VQE;<d30!RM9Ss8RIiA'SQu2`+ZXL>)%shI!&W['0JS7b_)n]A?RY5Un*
b.AYk@kt(;PCZ5sn`eGAd,%lrHU-gN?rk=MTjBQL4a$mBFlAe9m:<;i;#25+:@Hn0+,kb7HT
KpN\Hf8>cgd3SG\&UCG\^;F*diULAqZq>H6fk29N*>OcmV3L0>.E,h9t5fY2fPs6oFWhkbd;
F'/Rn>i_(?Ac`h_)=5eQ5)qRUP3sDqL^A,^:a4@pft3]A25C6]A7c[SGbj:fEJ`LO*r7Z,GF%f
B#b"Ect@NoUq-5.W)U`7R;/i!T#ioZXCpRsnpBJ9V@IXdJ1e`dsG#$`\f8ESbD(XiJdM`,$\
5o*Qj*q9=(IR+JhF84#B=sms#AhFp!hD\43T_/eh5hU@%18&hgad8<as.O@`_7^ZgbjeN2,[
o0[20J@>gRMH4+([`^2@:Uui`01^SDb+([?[t]AhffcI,et6IV"m;C@C*%!*7K>h7oo#Yf^"a
rrdc;@HEc3-=?*M*Ta/KmYO06:Z-5W61ASmApNp$p%pM=dRYoAJ]A[%*F/C2eGIhNUO8W.u=I
S"%Z2GirX=1ef3h?;pfE%5R\dIhb(-m:et/N6FTl7Yn.=PKkC=*gqEn2"G=8m'mgWO.'+2VV
kc,C]A"D/TYL;@@n(=r'OD1a+_FRdX$g^4cu#B5.uI4rF67oP2=T]A36=g5+m9Eg"<e,3"3Fm$
9"MJT4&3(0K(=[_@kUc+pBcVYqg\l"bU<dgkIX&o>9WjI"'_M9s)TL6BL+;R']A.h_NO3(Odu
!XV@_o[_(W=$<)OnRk;KU^Z<fNc6>"Lp3Gr*X^Z.^e53+6?@#h[hcMH*I/0jAS@<!S.#FXuP
Jaa:/^*.:/?^;ktq(tmp>]A_t@KG3uS9L&)CJ]AmS.60Q+C+-$[;!`tl6WIilq?Z;N>obh!7"]A
0a/V2Z"$&&@&R:fpXg#65\C*6r[%'G2fn4F'?KMNKs%b-r0VZs/+\Vkm]A#>@/htBGmIVAO$C
dddT>T.;beG+bC6k!Or+QshVM;4&0DM*?\iWk%o(4g"_.+PC^A"sP,Pf-#2"mThC4YAc1rt&
"\YPl]AtOX4BRW!mkB;U5c6^S).t3HCh!.kf,#\r\D=)3K$0WuSXH$`E$itF`8VYJ^1X_%G+f
b@,ftA.BINm(F`%mHaL,UO:)H!.ea%8+L@uL`?Q-mt1CXb!RmS1GL*6N&q?)$=\GBU&cf0e!
h*'UETW)]AT*DBVpXJdoe=9gm>u`-H[S"UETZl6:ZJM1[.g.^K7I_R;D`NM8#RkBY#Aqt3./L
l/44ecd4W>7G7.'?5ea[/S(c!D\UIV2E6KO-CA?b/c4.R(YNsq'L*mnr<N3iso(BSC_K,3X2
.oWD!pmIh34jp_aTIqjZ2V;CE7CQrV2*X8,'Cf*(9RB0l7r"mCm^2tlD+&V7WT3HXn11?&5H
_]AfT:p72$,0rqb]AgLrHAmeQsa=XdC;HlI$!V(E63>He-IMeX*9l`.-uc0A4<4ae+u87k`)TJ
<)/`1.b0Q^m_a8o[q-$#i42F$f!e$jn/,4ci'7^m8-i$sL)7=W5^*j#T[J*XPR6+gg]A%c>K.
^>lb=G1ghUb&#T9R]A0jRu!n"lZ2Ys*>JedT@l\VCU%s]ALg6r9XDXTYLa[B:*DTN;2KiQPI=/
/YpMOHYM+?Mc\mN:>U<OblKR%0=L:a)i8CDtki]AoJr0C!`_o&k?Zp74Xss<`9n+:\rkq[e,R
a%5P1r&Z#i=/j::65_"KGY%gV[_bR&fcJ0%YLWDobPmEL]A(HK'q#X`Xo--Mnn3OA*5G>!Wjf
`-Ob1$=sF1^<%;!nSp1:[+B:D6#[0<8NI%:(Xs<>ac>:!#P_Mh"(>%m5VEAt$Io6I8(`HFaM
87E!>>=C,!1-4X=VH+iNJqBE&>bD5TGcn++tg.MYn0qe#S%(0(%!qV*+"'ObacM9*$,I.!jG
uc9J30')<8s@*T<a#eq,YK"+&t^n)(27=nR9d\0D0?UlW,9KMJm*?o5Mi*LKcW[2m5`.Qh+,
Ng9`&130"Gk3<BghVQs"n+8^JEVprU4Xdk-9Nslbjm!k%c'*?%isXWE]ATe0mEVT/UoTemi.^
tY8?WaDr@pt'V\:M;ntq&[<prG:]Atb1YUZANLLinHEnMAK6S<<aK_AHp@+=WaTme'mK@C?+r
O%oYP4D('F_>OW)qsU5,MZT!cKCttM/V4YB-/TUaK=TA:)d6GTB><Km8dl\X$0$AW."Rhgh%
g1n'Jq'0RmQ30.8/+js0Vfu=[=VA;D?r_HRi2)ipN\`NTa11@82Yl/]A>b&.m1"-8Ljq47Qcf
SnC'rfQ-"Ur@.0YZK,T,m3]AXJZp8/8BEgWpXE&s((F<<O=a:*`_$W9%nEIm>Gq#sYX/GrDF@
EI#NU:DpYA&1Ruj(m$C)sgTTaXrr:o^bGua]ArP6rS=UuOZpJb-Q`hMH*RNG>r;oncl'RNj5C
/B!R7\;WQ=HE4A[lJKCe!r0.kLF>l?mY=2>:"m<kGUI2!OnksUNsj#b;l!083TfR[oL[\$.)
?I1e794RN<A1kmD?%ZOXN`6t0L<fBSn4cW*2Z):@:]A85]AoG1(tY@qS%632<3Ii[f%dSZY52&
hSYgb;Lj8LSiTj4&YiB'%2[@+8[[JR!%QBe4W*P+P@/HKK<o/BS7Kf#SS#md5bnhbm3[cT["
Pp`9.p86q2rG$RRNE1l>6Z)U"68(&I#Ysu[@5Eh*o!2bSS;b_"hAf'V:3roLu4Q)VdT>V8_B
I`ZPJ#XKpR#DP\?$Pre5bWN6;DZtNH;H:J&7=.cVJ9Cr*4mJ@ACfuX-RK,OW#KZ2^l!Y]AZ-i
o9'F'mf2aNaXnH;E-o*<U8:)LMoJUr(gLOt-thBb:W;g<N`GgSL2Pcat]A8Rj+-qF6\"C)CMZ
_re]A2N%)CPlY1A*LU)WlKscO8%u#kC?p<7PYdh3Wd">P?>-4rX\M<TJL(ku(<hGHJ[k\1%!?
]AomrtjB=/LQES%M'`1,_,J>A1Ks?@Xq=<T[d*FrPf.q2\l)rC"de\2k,Zf'5WC/A%0RQnDUA
:o2k)B'Mcr-jbXGEg0iK(Up:;#"p-h8lkWII!KU.eYrn#0EG''&9SGKgniRuhf*"X,7*@G4V
VNcnoCX+#jn3Eo\1r0IG+R.sm"GQCMs'udaOjsTTTMu'WNZ[kPLGYkG<6CfZk?2E*%V[!S#H
PtGU0u1kb1TadZ&!+b'>$f^H^'2p&>3%IA%.5`t01l$f:*3Dj3qTSNQUJFOZeQ-'uWlb'44'
j(e@EOgm;L8c=-)'&\0?f@j"mB<f/1i'$)9%eY+0/erf>86r3KaV>_VqB?mEh@uJ9au.^K^(
p?56=]A]A/?<,[2o^U!P,,;IWBhR%]AWhCigpgZ&ML;jjCiOH7EhQ>W0E_BA#A=Mon6tW-1U;3>
_/"=(;dj7pDWbLK-?299:mi$U,"i=BH#e"H4`5]A6P5E/>G7VI6J+n^&oDDKLYT:_N`7SPE2g
:3sc1Rn]A%Y%Xob;c<2`qm(_Kc&sD0?>M+ELNIhE&iCrKZ#IA0-M5_=jRbk5$cbc:\9bf57F4
o(2^DTW^Y"Y/K!+?]AM8hlq6Os><C(N?1a!]A>df+r@+db;G*l#]Aj#@gEq)q8/u>5s:uf'Q4mu
3TUJtn8J1>a3?/jK>7?m~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="275" y="0" width="91" height="100"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report7"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="1" color="-657927" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-11883802"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-11883802"/>
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
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="275" y="394" width="91" height="100"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="chart0"/>
<Widget widgetName="report0"/>
<Widget widgetName="report2"/>
<Widget widgetName="report1"/>
<Widget widgetName="report3"/>
<Widget widgetName="report4"/>
<Widget widgetName="report6"/>
<Widget widgetName="report5"/>
<Widget widgetName="report7"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="false"/>
<Size width="366" height="494"/>
<ResolutionScalingAttr percent="0.9"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="JAA"/>
<PreviewType PreviewType="0"/>
<TemplateID/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="5f9fd65c-bb98-49bf-aa50-240a3cdbb202"/>
</TemplateIdAttMark>
</Form>
