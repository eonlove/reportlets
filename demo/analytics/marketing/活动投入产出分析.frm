<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="File1" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[公司,,.,,日期,,.,,流量]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.Integer,java.lang.Integer]]></ColumnTypes>
<RowData>
<![CDATA[<Kt*m"YgES@o86YnZP#FM-iY?":YnScjU>D0$oXGd8bG2[Nsb:hYYdhn*u+!Um1Fh?R1IbOV
,p48j%\DE=_?Q/SL5:cm7!]A/fB'U"8$T+#qIG,)B"LSQ)k$F1)Pj0<NJ<]Ain9_l8KgO`1kt(
j`)D7m`6s`F8`BBknnQL17]Au)\_%j>Q+I-#M^Mf`/cgU;L7Z`_V+AHX;W32LGH"^$\P=a+lj
G>U5pV[smP?'qO+WPTb3;N8mE-j_"QDoM-g),D/&NA%Cq=4flmLf?-7l<QVS+BUBVfIhIm[d
<uNs9=.7m-)Y%JmZVQ20h-qs2cqNW;@ARK<C)99;A-%e@Xg5s<Ud4(kSQ&toE*8R,]AXWpU2?
4<VGN53mi<-bIbjHE96;Q&TjuJWi>jQ*7*A\GoV8FoA$Ek)`gk*c5FQ4fo0.5WL.BLCq,3$i
^5~
]]></RowData>
</TableData>
<TableData name="Embedded1" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[名称,,.,,金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData>
<![CDATA[He,Fu`Kmo-G&DQX54Ra/\X\s$#!fusI+P*j4g!&AVESj&$C*>#!m<^\gA%te+%=2j$mYoT~
]]></RowData>
</TableData>
<TableData name="Embedded2" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[类别,,.,,占比]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData>
<![CDATA[Ha7G_e&dSFFu4.V)K@okE-Cnn)T+Qs3]AW0o!!~
]]></RowData>
</TableData>
<TableData name="Embedded3" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[列,,.,,值]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData>
<![CDATA[1ZYnsi%j:K1&q:~
]]></RowData>
</TableData>
<TableData name="Embedded4" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[列,,.,,值]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData>
<![CDATA[1ZC5KiA0IN0`qC~
]]></RowData>
</TableData>
<TableData name="Embedded5" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[列,,.,,值]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData>
<![CDATA[1ZUAOjYGgP1'IX~
]]></RowData>
</TableData>
<TableData name="ds1" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT ${int(RAND()*1000)} as result1,${int(RAND()*500)} as result2,${int(RAND()*800)} as result3,${int(RAND()*4000)} as result4]]></Query>
</TableData>
</TableDataMap>
<ReportFitAttr fitStateInPC="2" fitFont="false"/>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false"/>
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
<Center class="com.fr.form.ui.container.WFitLayout">
<WidgetName name="body"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="Al Bayan" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-15197385"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-15197385"/>
<LCAttr vgap="0" hgap="0" compInterval="5"/>
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
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-14669005" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
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
<![CDATA[1728000,6019800,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[15163800,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[活动投入产出分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O t="CC">
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
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="true" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
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
<HtmlLabel customText="function(){ return this.category+this.seriesName+this.value/10000+&quot;万&quot;;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16744320"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
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
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
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
<HtmlLabel customText="function(){ return this.value/10000+&quot;万&quot;;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-907154"/>
<OColor colvalue="-15872"/>
<OColor colvalue="-8202753"/>
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
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-14075297"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-14141347" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-9273712"/>
</Attr>
</TextAttr>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[¤#0]]></Format>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="false" isRotation="false"/>
<HtmlLabel customText="function(){ return &quot;$&quot;+this/10000+&quot;万&quot;; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<OneValueCDDefinition seriesName="名称" valueName="金额" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[Embedded1]]></Name>
</TableData>
<CategoryName value=""/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
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
<StyleList>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="144" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="685" y="0" width="275" height="180"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report5"/>
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
<BoundsAttr x="685" y="136" width="275" height="180"/>
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
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-14669005" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
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
<![CDATA[1728000,1676400,1600200,2095500,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[6112365,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[销量分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" rs="3">
<O t="CC">
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
<FRFont name="Al Bayan" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
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
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="72"/>
</Attr>
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
<FRFont name="Al Bayan" style="0" size="72" foreground="-6113837"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-1441703"/>
<OColor colvalue="-149760"/>
<OColor colvalue="-10502420"/>
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
<PieAttr4VanChart roseType="sameArc" startAngle="0.0" endAngle="360.0" innerRadius="80.0" supportRotation="false"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="类别" valueName="占比" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[Embedded2]]></Name>
</TableData>
<CategoryName value="无"/>
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
<attr moreLabel="false" autoTooltip="true"/>
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
<StyleList>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="144" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[eU)R(eGC%@fi"N5:kW_U8uThFPp?[$Z8=;$[4F[$G%3p[m2*5WHU:lA%E=\Xfgi?,D=#8'N-
3,kcWA!5mG?ahodm<0H2ceZo:>J5kIf.;q4+Yg2'!-d*W.u9(`54h042B.^qfT6JRR;amG!.
eO=JjW0ef-\dCa`'VG#N_0,s9'1;)L-UJ)e.;0]A/U?PX'9`fs5$QrZJK>skKI12MrEOfk(=!
`S%rLTmQH'/q)\c*VBNR6)<eLVM_ij+Ah6s+S.IbC!CpR4C;Tq:oOl<F`NeYcEgRK:bMpJQ_
R_oBCLIn^;k]Ahq]Aeo1h*Z,9QAJAmdd0a)n#q!f;!1)67V)NX&^]A=i]AY03Psr?ToD9->`k?WN
Ylrfur#q"?"ST1?^$'<=(>S,gXh8f&&taCl1!KHj%.Qi"235`F7S?6u3UL;N7ZA_O2?oSA0=
?R\iPFiT"8i(FGXWme3FAuOpeVaM)g"hPcbi2,]AI;D"jZ.`78VItR/%qRsXg9@-O`.,iN8js
+LO0+JF9+F/j^sDgM83IGL)3.7[dY<[b$n)6qpFC*^kRfsq[OsWj=^Shqkcu[hn%&-qXU@ZK
>f%tfW?!#%o'L<OF0t3:&k@O<`NO2H^Y6;oN1X@,2(HmY2<&O9Q,$s8"gFo1q\(\m35CKDA<
LP[K;YP1<aO+KY6uGq=&_tm;OSs7('X@]A\S_M[]A5/P?hGp.o\ZgOVVY?*iQCnP]A;Pl@@*[Ae
[?7W]A8"]A>"V,KlK[mt\F#]AkITYlm@ipEK->hR\ZSH0eS<[;5e$qsQg@R]AZ:N:.p3dCd]A-YhV
T:YmgV7+*HU9"4G?bA]AA_82Q/N#)5@&'`-A,VqY1!QhX^e&0$XgfcHQA!9(/MSFf3nFJ_\3?
8J<Cb6M8S+\402C]A56C1#=,KBHqI&%.p%&7ClGpk]A[+@@9!;\6E#M3PVn@m&dZ/&$<'mO3LL
n<m,J?Hab$[-+@NskAu#5\Etc_p]AZ+@cmV+EKZ\i#:FD(P%)9\@D$f5m@idXiT\=5;>.%%q)
V+i[U_U2o0uI!'C1if`$jr5RU!B-oqQ&LNh_J,IZ'Z')FMHRjLEs#L9m[^S(H__5.VqI2ADB
C4-,M8CU;P=JqA?0dLFM>EcS6J+p,h4o>,[+C4%-[]A8%7nC?n*?fZ'@Z%bC1%J)eggA`72h>
O'\fWfb/.A`[1ep\F>_5q5Ui90Qg?C85BlHDSZSY1;rhCq3b_fhQ.@Af)+7,TQ;o4)4eGL)2
X_,pon(cmQ%Z/-@8)dllQ1>-'W_!lgA_9Cu&fqTDHk<Nj#;H<5dY\&:m-eqir2csHuO`VQ'>
84^"(AYZnXfJUW7q5Uo_KOC2rB?;\@DdTOG92XonAH=>@iHV[#$tSn+:%R=R6L.i#!Vtapcd
'@LeU<fif2Y#%]A>G]A!MpAbO"j;`[0Zr6J($ABSU886E`gU"f*HeOI%BK4En9pfjNp$t"A./e
Z*OG"5`#H[VY>;A!:%ec?1>#Aj/ZtF^HM#^NTbSjJ:22l4TuC)_j:B^f8s<+%A7&'4he!j6<
o$<hD_2/VOi3<0-./&oJ2Kt[Vgs#K,e+l1E5,eRW#mYbmrNL;B1ToOP$25hk9kX"1L)(P**Y
(V\rnp]ALb<C7f"fQV#%?;>LYT1\=2Y^4psF/*I/R&H7XLs/*\-LTH(SJaVR)MJ:O8par\XH9
S_9QaA3Hk5CQl"^<@,A[+\.R?[@#49+p[IBi8\%`Kb?3qd7R$#%HO?T)*l2OH>S'B@-e%f9T
lCHDM/E4^D^r:$X_?oa?g1H'CCa/ef9K<'D&JY#9;Me!mI;fLNl8.sOJQJ?8_6Uj$]A;qY+7>
DdCd5\9>l1LQA9c"n0p$"*J<2]Aa*(:'M>4#b]A<keh%WL:m3;cp,MtX_R76D.Y.TK!9N`-lX3
$M8?cr@]A=6V(cr)1%H.YCSIoo5/lVrm?gb$7IKbH5SF?C'`.c_lG^(=/I-f1GIKH0$E[<tIu
fBft\;CR@khGN>K8Ve`nGPOUMZ`Am?Eq81b+$JD^W;@@\%2,+YIdTT@E'TT8?pq"9FCT8V8=
\6K/qkk4O9lG#V`kRY.?/Ht>8EFs>n^!Nm;Q5u8Ip>)=LVr^9W8m?N`YoqsqfV;V;blD?$TW
%-ftm[S+<gB%imT;9FfiaO/(A?L+5<QJc(S;SFmZVZ@H>iOW<M(OU<CL&".$KSV2st"iVI^X
lY6<e0;[m2Bp9:7l?]AJJ5g]AE0<S_iJlpte\:)l3&/<o)%I4.<E^S0n&7Re<.hoG\P+0,%p%_
f<YQ:^e^@_nt7I0*C,^+?VtU;mbEX1>r#7IuLYXo_>YbKK-R$?f:nFuLR5=(*)AgKI(_MDp;
2JH%EqZQ>U#_TW7#'@W/q+9EKO1^lbT241/6/I%JsbUP7oB^:&Q_<o,(WkOT"&M@MR;V1a-p
-hT6cS*p)4%\3!hD#VD)MuVjo$H"sN.Um(/P-l6,nDRueeio,>s^LCDdm//,[JaF,+Wll`5T
DZCg*D56NYlT3B0%7*X$M,?LFi&$WVc'3dY2VE>a'%hTJuH,OWLbh1l2rEUG!^Q%j?9$Bc!u
VQIE8WRWUubJsAl-3]AHha1LYUQjK@Y$nRK>W8kEjhrfm[TXCnIqQDK;Q^5QePF1N<jN2@69?
>kp?F$1(ShqF5G^B5!RX=d09Lp2ZNuP':2f!Yp=QGVRB-N'*=\on90U\?;/QT+T,B*=LZ16p
$JO0h%4Z#A]A7cW%KNi^ba@WRk&V70]AK51j[K;(a?DeoXP$Y9N?7(s*.(GsdOB]A8mB^>IXIA/
g'WNn/:hkkpeKSV2cK-UedUpcSi[p/f@3H(#Cuq<&o.^^b;/-]A.E!QP]AAC^[s[ID6c'4T2`G
Y.PLY9Q_+<<09\\FP]A5sk&401@"%j;:VEj5n%V#ki"Q'IU\i$gl9U/L/0qfoq4m\N!6f7I/X
\D0QC>g5\fQ-JP^31m[$C4"cr&R9e5V$o6F*h*Ii$qO2*bp?Cl\@`iHYe0:_R4_>`%NU!`6]A
htocLt?i>aWt18cp'W[d^eC(#Xi=+biV^KEuAu5q>E^N[i\l/Vl(*rNIZia6-nS"MmS\]AAf[
8'GaG!#S`Y^(28VpJX<0/KKYUcFq3s1<]A5LB"gs%7"u"R=1t(Ma[62Qt$2\]AKWNhNK9Yd44L
.YknN3oc$39/+e1YldYaL9Gs[d$L./]AQS@\^`'VL-(HJK-W3?DXnF,TOG^60_.Ve4J!eK,r+
;_cSr+8bY805'f(V2M4r?f1)L2P%C<GP0p[gbAmn^od='!8ng0pSTf5=+`@GaYgZ]ADjnl$94
AW01Xk;O8sPT9r]AU-j$&jC$o-8FWeHmQq&UfoeA&^.p_"@K5"8Rl`%!aWe[:=KY-Lnt[?$DE
Ra>oK3rVN_5lEg_J3R='6$hNo=k.lZMFZ#uc#b]ArsiO@#a-E(=G.r:O,\M*;iIL_s[6d`kW:
G]AM%Kg@A5I^fgZjcp.hs#[WUZkgd:m<@8=2Y["=5u-Sc_4iqdd26"Utl77tk%E@uoWOVa/lE
W,$EY\H9mO>=um##XZWDat[K2B+*7_YQL'+\pY>J3jY1Ld((Yn\q<T%`-F'M0H^[kiGXK$BN
CbPpKW0YGqqWpC6O(E;#_*8)eh%+UCS.@rfcp0&@!mBFD)L.6>=:1!rB?e:"JBVhek6[eIp<
M+eY0Nr!8)jX(S_!3!>ddE_M^a-V:q7K`I'.t*0[F7gBF4mWmq6d*HM$gpM63U-*X#h/cgZG
\kJ!R?(mMK<V"1/B"<<Z3Oh_ZnRWr[Pa^qnu.j:03@kAB\O*gUUqQEcOhK#R<"tX3qU5/YQE
IML'qeB#cp(-)hctY!rfmQE$V#0ILG_Wt*Bam+^=`\$U?>N]A#*@/ODELR]A\7f1Q;b4hV?Y&Z
Dc(4W&J_&X3MIb'bLO/`"`rqp\-;kHWPO9`!M50fG=Qs1+25fZ'L6+P>uh(YH3I2@MYNNB;Q
F3S89P60$X7USgsic_o%,Vh-j!a(mI3d$Q=!ho4NE(5]A#Hm$&Ek&CSduWd8:;[&!0D*m2X.[
^K`r8*Xa1<81s$:g7;ZVMb,K.)=%2FQ=eGDUpn4LV!Vp<-`pY@*4RN\<`Ia\E`U-?fC$RrgB
p`GJMrc18K0,J=0E1:RbO+[J.SWYgP#IOg&!j:0^gAg"M1C'GfaT'cE<fLPq*q4Yt=@S+#Dr
&DP1oc`l#n#I<4,]A_SY:n:jHTISN(NX'oNf=L,kY]AfG[]AF^K7fu\NZM+PMR@9mG>gtE:mng@
j0h)N%VZ_K%sd-elOkiecPB;Ohl-mXRka>jWg]AjTm5kN]AWRV;_H_FE-CAB$qIO#8-aCEC,[)
sV2ES3tn2O&^@1.c&?I$[a#kkj_56B)_<]AMVP^)JtA8q-7AU8?)g9tWBRS&`)Oo;^!!GdML)
W(,_sn'*V]AgNsY]A&*LL9Y/l=K1s&`fk<96+A+<'4I&l"XHdP3Q5'$%]A`q7EkI&5o]A3ONG;pP
(\4SAEK?1o)<&>WePsc&$G;)@A@+NZuA>W7B)9jPX.*qM2FqYRmX4[$d57$O&'V6gB+V;0b[
_4.H?u+N\pn"!!UH\/pssarqs%1&tV:HpFa$)OJE^L3Rlrr-UE//PtM=g$+dLeO0d6/`#6==
]ALfs!5[cgkO,fj^s41Pfqn.XmgmBkM9kWhaN9;Ao(XB0.i%66/K5d"F]AOp1]Aq[h47RhEh,,&
@;aH_[GY0@ki@`JY#R(th$4+E*h,poe]AclW4@`Poh;4CulSW7*oHUlPk`Y4!drriJdi8CqQZ
p(>Q:R$p.`*Vu+n@E7!N?BlC3ETc-$_5ABkmOO0-h/M=4bp<P,qeCLNTlLH'Hu')["YUlKZ%
duH[o"3U#_)^LaJK0HB[@1jj@h,3;c6>,0a;aeToIhsbO3r6Rgumr4/lH4:@&6$lU$W)=(f?
o:s3bAVkgRMFA6rN)2r3_I0PIiRhAem)gb;Dc11.+!HOdN;"D'A69[+qjFN9t9Z^%E7Zm2SQ
_ekqr,jD!$*eW4Y6ZVm"o9&R&%X#[CCuP.<eP%GU2uoi/":@'"?CKl1HIbNf,-FCHSrnWeXe
bU^4"bQP"/lomE*D"TL?I?29UYL5m:uM$4i\SMqpH>`K-M,JFi.iZ7aPT<4JK;M^uON2V*c(
6-<gq3@8*j)u]AHo^/C2<W9<)iRB@="lI'WXq-m98i]AU)9[LG,X8$"DA+HB1*O%nL'r2iJh2%
gRhHO+YIX`=7u-2/]Ad#qa-p2Y5nWJ5((bHBdRMa&Z-T(kHX3`JTp0_U9'@,^$$%h@PbDW#Q]A
-Z?:REpGN]AmKs^*p#8pp]A]A'.Za1Hn!TTY<;XLW)8f[srEL&OEnnc7oI%aeT:,`>AFt-7iISD
967fMd*-/<CWtaW$7r,F^D%d7-J(#eb@a[W5ZB4_Uu1DX(jmNV\4sc\@.!l&-@Q+6[7V(0.N
r_!lH\'00c-mA@p[JX\=([aA;(8mb,5$fi;g_Ooi-k*6/:^8NH)8DOpr-k"85[DR+D@j&/(C
<R2A%U?5Lb)u\7H.oO%Je&cIBdu2bcR$]A(PL$W"b!sus+'LsfilFn!=cJY;_968!(mo2ciX+
6_:n:hnIJla9NBsCHLPTA:010XoGDY:\jFejUsJ85+CG>h&&Amq9FVI4"`q>:raUH<Mt1;6t
0S\uWDTT4EcgqcF?mU1uC..$48MP.*LUF@`2d9b8/fR]A[`UJmlPSj8<GG!qB[Y-FB9#I>@o6
@&"kq*Ui7Rg67r3l#=_oN[@>@O@'4"(asHDs9A:lZ71iN>h7/Bun(hLsqEW$M.'8iI^N8e;W
.%o8+rDjIBh%g3Ah03Pae9&JJts)Md$n,<a='["OU#k1^&GW=//ZY.YM%g"p"\Aui1k.o3uO
MsKYB(=_U23tt:`4OqSLDlDbchU&:H9E=jo"$%DeeP$CBK6^XPaC1?^+8Z2LE)r8JF`l57b`
6Yh(@s$K(GkTLF[hPE9,)li>W3<7l,5Q,L:>ndFI>mDc,"@UdXBeYGLKXY3g'ULok_[7$b9"
E=5GY]A]Aj#JgEt<D7Vh9<<(1T+$9maSpa-;"[&aLRl9gm;_)SbA#Q;_8/Em`uJ5m:mDVd^8,l
#Q&2;i'sVb;q*Y@QGh%o@G$%gm1N)=kZ4pS()cR?0VP"@V6KiI-jVdC[/-QUsR6AMha"*eTb
Xg'i>6A6ULqa#.lah<CKHMeKV,u#)dmo'dT;?ckYLKei-q#nFu4C%G'jUYZ*V3T)PI@X1[4i
7=JC&PZ)e9/.^u99p:'[pU,Lk_W;40<`WZ.H:qE<rk"Nb/]AM=K!;b!6N":d>3I+_r)]ADK=nG
E"IeiB&]A5]A;(EIJXG8pDlt&ok+)RVu"XYcP8EgH>^m0Odf7Z1%3CmD]AXb5h+&0q:J*`%2e<=
qQ6P3Id#F-).IZ>pjHQNP:$NNk?&1N8$N&A0g;]AEN:&J[<^r*F>8ES8q@JjcUCQ!(2f4Q%S)
@"*XFl%b-HrADUp="/.nN*co6]AZ)*X-n.^+fb!+Vmap/,T9Lag_2&&N5MTe%V5'99spYIh#?
Sga_>YfP.-d=L_e-NTBoY6DtJ-M%_rk:e5E8gg$lnoTkgh#BiD\2ReZ&@L+Er7$-(]A&BbSfJ
:#Cu5n<OhQ)"nC>IlLBt:B!%%+fI9EJ2sm4UI.NCk!B_W1BsII86#3XK"W`h>!X2nLT\pK]A[
8Vr8LCg!^UVVBCP!6B-O!/AQ_76T-i\/>Fc-$@]A7E>1_Y')uHi%tse$iZ^\kZK>PIsfmBus>
TEPeh]AiJ1I)nre\bG+-G>G)+*sMr*,7"XCe=3j)kDT,.fP/kH`p/QWo8"Y8er/GiL3/=6!*K
p6n"K85lKiE@R6B>83'2OUPTR\T2-MQ8>.cW]AA)2KI?)"I=c@'F7#P3=G/9Wi^gZ0WhGhq.b
qmje-ul)7l['cK2"Mj`F)V^l7T[@qS$:l$TmWWYI]A3eGA:M=bZKl\S9(oE*>HY0k?]A6e:Qur
Hp6@h4?qUJW$X<7=:.^X.O&'823i8&]AS(7aQkd>[/S5i154PMtG*/UDQi/UjTrNm4b0#ZFit
2a0Ahoh5dgMS[*RM[HaN.JTH?4cR\"YM=%oTPrR%20U7a8Cal"00A[rHXi`PT:'@`"d[L'a,
EY'dqY)0ki'h,DYGMZ,7,DLq[0\D"dA,iCY"@\PC)&S,Yc\$hlUTW<Q@T<6La1GS\^WQ&;nE
mct4:h\jkG"(bs+V>YM$[o>I)S[.!L3V*l;uF.$IR6*>$ftlSLtdl"PeI/Fe0)J!G9a'^CN?
2<R$^L9Vn6-Zp0@j$"%]A4G%o4Dh=%ILjY@uLPb4pT1+plY!Id1'@>C?6X>.'V0aq<@9Pj,\t
'KQ#T$b&6qN8>H8EAB'uSOU]AO+!%E01&:.\aqW?TCgPag<nc$\A-[LrgV;F:'QpLMrBg7s!0
c.s5.EckHj64n(QKmm[PK4bJcsL358=[(M'1&WXu18fRp4\/"LaEfD7%p2JBDA`"^dg<Hht+
`Jl$Df_3=5[AikE8#4,aSg([cHC1jn9L+)bc$_Md%S"NWLrOnG:X:64_4q/\6#,sY9L*o`.$
pX'MB4`t)Qi,]ASeD&aD5"_jb,L_g]A*]ABl1K(89051UOSU"[2s(b+OcEN<aM2L24i`t?5&cEt
.id\EO10mog)4*?5F-.d^@91`Pb9Du7]APBP\T:5d<!7JZ&5Hd9NqJUM0u%^X%A"$;?>4Q[3`
GV_<3=sQ?Zs"3M8Vbr;7'QZpH,0_4-g&AA60u"eBs$7nb=D[#:(7XTc,6`]Ab+EK@p=KB<fe^
DldVQisf7PO=_EQVpiVPYt2BH!/]A'mpfZT9fD[\9N*^Y1(!Cm^DfW?0CXV`cjcHiX6_eg9Y+
*6+0^\Oi[6SWnBk!,27+5/rhr>Lq[6I/r>jY\]A\T!EDNC>UnqplfBJcJAlT)XRp,0]A.k^25)
9a_j,I\b:hGAed=WtB)[lhU]ACK*TI0:I:tW<Of2,1j19W^/2%$4;eg'U,6KX(Bhn"Ul1]A5-i
#Eg,o0?mOP)f,,[TCM4m+AFd7ekI"t3]A5I[C"R,.#\XR(,#+@q6`]A%#u\E?XrojNi!VC4U4J
T&"/[`:kaVOtpOKo;&Jo_U./!Ch(0u%FgbI%c#3Ugkq9-r5@Z:"l\EglSqHR@V?CmYAZ?\M/
AqM-^H8"f^frak;5u2jdj'ELK>hU*ms=%6&9R'0hDscRNE';n7\##%?m8+mKt2ZL?<9#:KSp
*#REj9\G4SkplA'>kEX[@5?eV.X&iVUb-\b((9/K1Y>9"nSBi\bFS*AqHhF*\VL"7><!,I7-
eo>"=[7tTgEZ)3g;)X2Mj(Q;j)24PYG*-Uc7onT=AO;2`>\FJ^6!7dqE27*b070cT8fnZ\d#
fo:VB_HSeHWJFluomWE5i>3jAJqS'$JkqWGH(HuWQ7SQE?MgS]A)^`QB'?e^4KTL$^Fb,q'Jj
0QeMC'T9X*2F8lCr%WXSG6iP7s5qQ.8Wa=ESW08=c%X`G54Qab`Jf($S6Tdgp9u<kcs4]A1$U
m%%JJ*`q@,i\Gc7*SJb3pFb[*MIh#:T2ma<cn3"ZZsKK*=2M7*)RDZWbuAPCIsh&/9=)3rLL
PFa6$PUXQ%^')_URS7gK>_2p&DZ26XMDh:VE6#)B01DbW5J,OiclF<2+*N%Wo+]A\,$aWIhqj
_lX6<qBfA_jk$6@<h`S.)erhJgR>,@"0S5=c!pmFU)f1R8X*V'2Ys8HtKEaSBWu340m+JZ9[
Q[^1npqE>Ah%j^5oKF8B$8:'_+n#Dm<S:PS_$O@U0f%6UNlI.TrXmoGV;h/O$6/tCXC8m_b-
\Cf?rI!&4E.0=&Hp-reX^Y'HB`TgGq7d6Y?TV-diZ]Ae>:M[F0pH!@lOrRB<[f"=!LjlO5/WL
$l3FVeS0/?;&0Y]ADioGc7)NiSh[j=%O5uZC-GE$Y9Oe*aCFj265u3l%A`FY6=\p3MWJscY`c
o?EO(>a^&m`;+>mmrC#*VmKhaO7OU*ge+W0U&SADJoU$9IR6-or\t%3\QRqmI&D@U"4?QTb-
IUDKIsf9-h4#/._VQ[gMY>b8JC)E%lm>Kp??(9M'dP8h\9O*@1d62_Ff5Ii>?[Ea`Y/SeaPh
1)NoLu(D^,AM[>&&Jpj`Q-A(a\Bqi.?Wf&`(U70*FGGZjMi.4%Elf:@)14Jn?3U)TZ<R_]AhF
Os&k\=HNTidtBfN34N,M.YD3a!1E=q[9FAd/rr+F]A:ml@=1Q8F[[Kt$r3Z:\*_'Whn]A*CPjh
(tmRE/aM4@M[$K5,9\c\]A1lr6U=B)+TJ0\)R9n:A8@A\OCTY)F2.hF,C;`?c3i02/snoI0p/
!ZBq^2=.^@8'M*]A21HiT<&f=T=jXM^ejMbi-=BCeN`#("HqaH`U5)bjeb]AQ\'-8l2V?2.TN7
H`_RUBa`;p?FTg)69REkU@98+H"MbAb4XSQ!2BVT!bSZifur<_dYt,fN/iq.HKsJ9R930oW%
mUcdW2f]AKci\$*Fg00"E8Sh=T2pG6?C\prO)(-,8kI_B,5!oK/SsiB%cqH0cOs9b'c?[er-&
<1')DS4L;iY<F_i>^dS>FI6Kd06DBV\d6D6`KC\uHl1MGbf,9mMXb>RVR!`mb%T=fWO"\cR!
-#E2(<V1*;A76OQr7$Ga[nT;?Ku<b,nML1]AN:3Wf2suQK5`)PRU*2'iG32ONcOS]A.07n_=J3
0V@srpUEpiZE6aGR052ESK@6%n3)1&I[s(*Yj%iLC6h#d$FR/dHgB,F7bficWW]A$6UZkOWK/
\J#/ln["4U3P3f6(!.L!GXCpK5b\8VX[?\-8'@N&SNlGD4q2AG.M6),&Bf;"6t\&4QhmSiY#
N!.>R>)f;Cft!:&$Y%>-E'6Re\Q6D\32>F1s/O,qsH]A0Ng9-;k7a[/gW.9riMt[FDQq<K&`U
>SS+7K3ji+5>3fQP'%Zd*3QIIj2"BhWH"NZcZepRn/QP?$02puKooMkb=7etHCq3.;Hd\Tb>
5e:=Co1Ld_2,27kgL'*ket=N5S1"72aiRg@jpgkR+Al^>E$7UR%7(=]A->@,S%eYP(=]Ab]A@rj
i)66q50/uJ476=ncE4>X*,ffuuc,ei9p5('kn<^TOePn.A>tuA@cfrZ4*/>Ij4\\S+JMKs3E
0tNg?#$a^@MXF#G$QIiO'$>$L0jY]ASi5m2!2u1qI?_C/UmbfR<95c*p@DQ\a[ortUMXqmMe/
N_p9Wn$aeO-PP!=_*>D4.m:VDE1PiUg'dYa)6oL15s=Qp;*\3rk5n,(7qM&"MEW"Ods@AUT[
<TRp?\/uSIAqsa?TgQjH[qoSU"CF3Umn8Yq0:Bbs'JVQbqM>rGnaPaa.sHbm<X[7rO4<\-W-
HP@VOh!g.3gs^eAX5mlJ,b.N(s(ZNsTph$V^c6$.-Nal;*Kr[#8]AQC\JZTEUrqg3VM!EL!,u
fZ`SnCES2ZU<*:*iSaQ?G05N0p;cYHcB0'#E`I9T43VuF<['Mgm:5?39'"F<F8/s=70W`Brq
>E-;^,8`faTdMPTk%GM<BhdX?2POPH,u_IP"^V$+>V4i'*^(*6QFio[qk5SCmVJR2SEpg;IW
!)FVFmXf^"$B+H]Aslh#C?c7cVYDh0Rh4.s&Q/2ZMWJcdiguG`Kb^k`rkV5rNSCO5EFt0^O0G
Jgab1OVApX486_*NpEXMdFoQ@hEj=/M.o(0qEcnE@rY)[`jT'51>3"9r@O:.8h,MUHX`F<bj
k16@cOfq!ab99;qW%2TD>Z!)^TssO,Afm#=Q^/91a*5:93d=gVh4_F<X(Wg_f-.?<>2qAo2=
1DBlsKVKs]AW5$YtR.V?h:%DJ@RqKVeK[ZFVhHq3&(T&kmaAq+eZG@Wo(r@205\9B5`#th8%a
B\OM+@GR1jt'pQm\87.s'$/nC9jIWTqQRj_WTDWq3I#T:KLM;h]A%s%QHal(a!#+0WAIBt9Qs
,\@;u0jO9^uM[hc*c&(hR[0:8>[dBhV\HddCa&PI1K^\2iX8Q2lp*>:Z_+k/&_4;N#`51UiG
Lu7Ul@7s*lo36jnnh-l!AE,`Nr9\#+q!5VQ'GI1`#ermg%nt7a>OAe?%f*./lqYDS&-@T4LC
aP(SY_ENa^]AC;aj>6r>kp$YP,I1e3O_AoBg$jY8oJP8c'.:)W2iq3GYl@(;ce$g]A=FSh`;1b
&"q]A:Jj'+&/IBEt0MWsPlY'Z)=]A/n\K#[]A/cLe4)WlJ#J(H3YXjmod#&9c?na`jiFoat7L*L
/WD>:<Z?,j;><XB[d<]A.g+H]AW0[J5aCA$d[EUS?2^M-o?g,_XX`U%c1gnDAjJg2OccUHX0"6
&R7Yt7<.7@`]Ag-fjR8FX^/d!d#F'O+l,_W]AL&>OJaddqO*Q:_3:uq*uqO@4+hVRAtt02#F);
HuM%l:abP'hc-L1ieGW^'^u]AclBk+\G.VN6c<VqYebDPlk_6o#ZL9=OcR<I4'#>=l!A+n?k!
&c<\=r?0P(&V5N^0PYd\sN_=\dCmRr=,E7#8tpN9AR2**t%eH)GnRbY]AD"clR9fUb'V'6^[*
id@GT^W/n6fDsLMt%Cl",9M?ujD[0*gI2K3'o]AEL_.k:)G,aH5iW$\nIo-p>kiZkqZX28?mp
-IZS;?[b7Qs)d+9Q);f:fN*B08Vq$`A<`>mca:SJU:a5^[d<gAh&4o4P+"_$Fr9:$0%/1Rm6
6E*Q>W#elJC4^nQ1%@WE)Vas@Jd3?GFM`e5p%SO6%j)lQ8U/W2ABUH=_6-o1IcOjn[u]A4?Y6
FZiek4)6mW!@an]A\)W!Xa?(X0n;8"IEN0Oq-oIoOO0F5@YqZMuQ_'VJ>E49[RScP&-XNNZG-
7@G7di;++(e2^W%3q^1gJ@2l9_#bgJfYo;[9$?-2SN.GLbNib@bF+j-D#';/>L]A@2\G.@*RD
=dDFaG3/#=s@J/V(@&O8@I$\hlZNOqo#m403Os'o'0n1Q4DH5DWDb@S%/0U6`?YGt(9lW_mq
**mSF_!Ro^$:6R(kNMDfn@BRiFb.+j@aM@MTtH!cR\kH@pD+>/X1:u+8f\MDJBSH=$:]AXRDL
%ZSN[ka`o#ppA0*dVI6_N62WOX+F2a(.q9NIZj<m?4j7C=-`Ij]Abl*p2lKfr)X-mO^/!$Bg`
1F0]AE2g(K/QjW%-r7r\s?up#(m=;:YnE%V'm@&"?qbq]ADmh#Xe\RWI#".in\9/VW#:ajap>e
tk\fP>M:U'h8b(n+=%e`GSoMn.N<[lgjg!aAR9O^0U6HC5nHVYqVc3=!d`3F*psg='PgY?h[
iLT.cljZE&&*/9552OjguNp)a.fp,*<J6/dTU#<Z[]ASSE<bC$b_D^!l-OJNO!K=0sV_T,AkU
nq5`VeigP[*P6p9^!"p.oA@/;NXgK()Cr.1!0(KQY)b6oC64?:Q7/Q[$jcB0m0Pu4qfILiY3
.HO6ClZN'aJT'ldSMU(9m7%;?/JmV6TmY*'*j@q'k@`X7E#j3P(lH_9C[h7_Pb.Ao%%DcGZC
8G_o$]A]A62p*QZFA76_9Dj@&?l0nYsbG:grc.75]A<g3JAK7r<,;V2Ins.iK<>eREutE!oPV:`
!O2PSNL4np<"!\[uKIfG'bITcWO1T!b)(96S)+h;qqk-bVAgp==p"2J"ERI7Edgd52Q[7@!6
KA[SaTWRuWrC^ssc-I.GN)Ms85eVg`h1Hhn3$.nRSFNO3';&L\&2)'0Kj%f+uqGl;2+BGb)4
cT*HVp7?-d*]Asl'mn\hIQD&[=I/]AGd@S&C*I,LgcT&s[P[f+2r(R%tU;(uN8CZ^Y^[N*r6?r
1SrDa.VAb%^6g=P/JGlc`m&nQ)+@;/0Am$/2<M(P1>=K`Er@m-d0RFu3ijfq4AMb1(AO#gH/
-o+t<]A5d7^,!f!S@@gPje0!I<XVZ)nF==3tdsc7[P)/H&p8O=/Q8u[>.;XC2]A#[$o9;Xo@$7
,'-nrQmC`c'p`h&'9"W*T),UEt7(.C`P?:HRj7Mc'jsf7q[uUfaUrcpjcPFC8Mo$J3/3_@^b
<T1.2(be_,J$'CXqdIQP:;k"@hgrJ04eI3KP0.hUh2k>M#L0mp68N62Q^du$&k'!kp7XYch$
OEsR)ej\nJuG5R43ueCgQ725-V$phMU(gMOaKD*g8q`AYcNb2SV23jqbl=`]ACQ*Sob5ab=#g
Phh6F1%,lDfAGeT^p']A3_9P^D;rklX^-dM_Am\7s+.H=mj%KOMRJATpnF"P+IgVseZj_P=rG
cor<=c(!`Ui^@!TgTi@\d,=M-R?<MthMR3?<6O#CN=RKkP8ConDPPY\c?<quLV*mPAiCW\0r
cq2:\"*pJXFSZDl6)#E='D!k1X"-l4LtU3dH'(GIVScqZq9j_84j)8eon]AVN0BDM/%L/k6?^
)nP"O><Ls#J&C)O[+[a2/&4?-eKtIB69OMdWms%g;s&e-*^t*?ne<e#lJJ1QHSBbIN5e-,@,
ApNU"mqrSUi_&f`Rf)Qqp3U>o[if;R1a_KE?8dQSe2cYbL"2k=kG=ZRghTK@0d!F2HJ)I6M&
WJD%%l'E[Z0CD%^h1h7\L+(]A2%,i(EQ5JS\*(0H8NNf:.\2\=HVd_-48B6s=E&$;;*4__qJl
?ec*MNK*+>q2OsMKISAu"E,<RR%A.DRf>K%1D7'DRISC$UR<30]A^q"Vc2>j;6QHrGrHs;;4r
YB/)"A_&iTBC]AQ='3-Rnr[m#aO@>V"E72YDJNZC2u)AeK(-Gr1PJ*,LPhd(U>Qc8^+D3pD0Y
j9H6asX-7[-5I+pLE\a*HUtaOsZ)J94k(/Xt#>hA:'cr??Maqt\ZL.rYGH8ttX>tcI1,O7OZ
(]AEVdncq8Ws\C%&2r1KO1uYb1b<Zeh2QU6g#kR,W:p-h[^U@T#8g_T&G'g1-[!Z-^Q#U]AWV%
Re,t-oZ$?Vm(3LB$*8%p^Lkf(ZM@q,^lON]A!-d^Y9$noZ//_o^GKUg1#Vb_N;n-EEUk4;@ST
gRYlj@1^lu=6A-&Oa"XW?n_mdD_V=HF_.]A;R.:_h\E6S:-S^N_'<F/J:K$h\oZVcBEt[:q01
!b,"m.dj9su[mnT'E6:K,A<`kcqRp6tcDYe2TkhrMP=%qEK?eDCqb@)hF`(p"&8/QV[]A-jr1
q`?mkI@!nKZ(iir00494n2Z=ik+`fj@iqEDOZ0:dpB-!JZ\b$QZ5E$k+NC*XI&-%!2X1qB5D
bLuI0F(<:fXs(<9h02?HN!fOZ/]Aa:s#5mMF+;qdA$l%:Xo:/b*4/lACf"A`>@OWgqel\Pmm$
@-.o2TA\#Dc[Y[1qkho=UI<rF>_QU*-FrIMce9rd$3?HG5m%r&5B)7Aum^m=h5_:tR)D]AEXJ
*PM>.iqp1A^\Eq<mfmrQoRkZj>Mng:>I%J8mWnQ7p?sfs%M%5a(W?4-8SjEYVs(1=7-;D?%4
='XYX4_p(AqTN'RZ*uDnNo9S%t7Qg!E@@"ib8km>N!Ym\&>-5M41=Ptl,*6lSj:i'aIg(-6p
DK@R':\$52q.?OP_qe-SR/JC$&)SGZk=SZ%_9IE.RTf)b=`4+!J7ihbA//SEA@Qrn`iL/=t2
^FsVn#45Z<spQ"h42[gCFAPEI(Zd(rS7AA":\hg\iTh&chg%%m#.GhD':KAXg\*'L%dMo^>"
"df'\'N"#U"pRgj?1/\h*o4FmD0`J`d$FS`cLKIA&IK9t^BP3>V4%cWcSm$eF_'U4%VF)+VQ
q-B]A<5MF`O(I,WNEIRNd4"an27hk#"ni%9(^'95.I3j1KT1N]AKM4<)M$A76D[VhlR3qNrhjO
6HsNhOL7K=rB%rluQm3rf+5#kQc9:[%c:RtBjLq/6i*2UcsCIo#S`F:h*.+8nI2PKnUW7r\E
"V/-$nT/2f5cB9PB(Oh/jNu4ejXgZI+/RqY_:7,?>Igb?'Pa6ep?o)ESfSX7TFT0%[^#f/6\
f6*pq@gWph(Nj@XQCqXOA@Cr9@P0[!!2?''A4st\AoYqrWqa!RHGqgs37Kk*Gb`qGitoui(k
H@6f5oJ]A&0?FCR/nZG!5nTs(eiYf*+^Afh^fVeMU?he3#D8/Tim_^>=B-F$20Mrg4L2T0K%4
iC=l<Xo8of295JlqY<Pk#2&a\r%7J9'nU:Bd6p/#:j@JcCB'Sga[SnNe,:^]ArEL\s776ngn1
PPHT3b!BGMr$:Jgdd+5[$jc_A'nVGE#QnNdX@F-%HXqk`>QC*$V$3p\scRF..4=/GF\:%;dZ
.=b#eRKmf)AP#O15LW$WL>q>qYh#1`%r6[%/.HmC>:$<adKdFRn82Cf=!6E[u0on7&ar`+Ro
Ucf`#.B#>_uHu`!/s3D2)Ws$WgO>e4dgsHIh.ItTaR]A$`$CP7jQ.S$W5(n7aZXaBkgft<FX[
ZjViqO6j0LjZaHlP'NmkTpiC(OI7oR\4^-5Bu2Z6-eB)hRSl,*HFFcpE)X3RJ;8]Ar3_ZKN#I
69(S#TgN17`XFW>gTQ"Vrnm99i,3Yf\da'03oR7]A]AA60D:1$##o5?1hig`F;lN4=CDl_$3:9
_RGh?FQus+<0@pS.[j.2s;WYB-SdXa$:lY.AbKj>53kTPk$/Fe+Fn([cVL%f~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="685" y="0" width="275" height="224"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report3"/>
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
<BoundsAttr x="685" y="316" width="275" height="224"/>
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
<border style="0" color="-14669005" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
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
<![CDATA[1714500,2503860,1939264,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[6480000,3810000,515500,6480000,4320000,571500,515500,6480000,4320000,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="9" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[='  '+'现金红包投入与发放情况分析']]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" rs="2" s="1">
<O t="CC">
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
<![CDATA[85%]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="96" foreground="-10502420"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="true" x="35.0" y="40.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
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
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="72"/>
</Attr>
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
<Attr enable="true"/>
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
<Attr position="4" visible="false"/>
<FRFont name="Al Bayan" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-10502420"/>
<OColor colvalue="-16118480"/>
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
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="80.0" supportRotation="false"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="列" valueName="值" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[Embedded3]]></Name>
</TableData>
<CategoryName value=""/>
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
<attr moreLabel="false" autoTooltip="true"/>
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
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="2">
<O>
<![CDATA[&yen361,16]]></O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="3" r="1" rs="2" s="1">
<O t="CC">
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
<![CDATA[44%]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="96" foreground="-149760"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="true" x="35.0" y="40.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
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
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="72"/>
</Attr>
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
<Attr enable="true"/>
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
<Attr position="4" visible="false"/>
<FRFont name="Al Bayan" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-149760"/>
<OColor colvalue="-16118480"/>
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
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="80.0" supportRotation="false"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="列" valueName="值" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[Embedded4]]></Name>
</TableData>
<CategoryName value=""/>
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
<attr moreLabel="false" autoTooltip="true"/>
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
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" cs="2" s="2">
<O>
<![CDATA[&yen29，172]]></O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="7" r="1" rs="2" s="1">
<O t="CC">
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
<![CDATA[65%]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="96" foreground="-1441703"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="true" x="35.0" y="40.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
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
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="72"/>
</Attr>
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
<Attr enable="true"/>
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
<Attr position="4" visible="false"/>
<FRFont name="Al Bayan" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-1441703"/>
<OColor colvalue="-16118480"/>
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
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="80.0" supportRotation="false"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="列" valueName="值" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[Embedded5]]></Name>
</TableData>
<CategoryName value=""/>
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
<attr moreLabel="false" autoTooltip="true"/>
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
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="2">
<O>
<![CDATA[&yen4，999]]></O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="2" s="3">
<O>
<![CDATA[已发放红包]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" cs="2" s="3">
<O>
<![CDATA[已发放红包]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="3">
<O>
<![CDATA[已发放红包]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3">
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
<FRFont name="SimSun" style="0" size="144" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-14736834"/>
<Border/>
</Style>
<Style horizontal_alignment="0" vertical_alignment="3" imageLayout="1">
<FRFont name="Verdana" style="0" size="112" foreground="-2297870"/>
<Background name="ColorBackground" color="-14736834"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="SimSun" style="0" size="72" foreground="-983553"/>
<Background name="ColorBackground" color="-14736834"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="685" height="135"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report2"/>
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
<BoundsAttr x="0" y="405" width="685" height="135"/>
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
<border style="0" color="-14669005" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
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
<![CDATA[1728000,12306300,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,4914900,792000,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="7" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[='  '+'流量投入与发放情况分析']]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" cs="8">
<O t="CC">
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
<Plot class="com.fr.plugin.chart.area.VanChartAreaPlot">
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
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="1" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
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
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="true" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
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
<HtmlLabel customText="function(){ return this.category+this.seriesName+this.value+&quot;M&quot;;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
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
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
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
<Attr lineWidth="2" lineStyle="2" nullValueBreak="true"/>
</VanAttrLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="NullMarker" radius="2.0" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrAreaSeriesFillColorBackground">
<AttrAreaSeriesFillColorBackground>
<Attr alpha="0.15"/>
</AttrAreaSeriesFillColorBackground>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="1" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
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
<HtmlLabel customText="function(){ return this.value+&quot;M&quot;;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="true" period="3.0"/>
</AttrEffect>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="RoundFilledMarker" radius="7.0" width="30.0" height="30.0" color="-907154"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[值]]></CNAME>
<Compare op="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=max(File1.select("流量"))]]></Attributes>
</O>
</Compare>
</Condition>
</ConditionAttr>
</List>
<List index="1">
<ConditionAttr name="条件属性2">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="1" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
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
<HtmlLabel customText="function(){ return this.value+&quot;M&quot;;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="true" period="2.0"/>
</AttrEffect>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="RoundMarker" radius="4.5" width="30.0" height="30.0" color="-16744448"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[值]]></CNAME>
<Compare op="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=min(File1.select("流量"))]]></Attributes>
</O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
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
<Attr position="1" visible="true"/>
<FRFont name="Al Bayan" style="0" size="72" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="100.0" y="2.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-8202753"/>
<OColor colvalue="-907154"/>
<OColor colvalue="-15872"/>
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
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor mainGridColor="-14735033" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-9142639"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="false" isRotation="false"/>
<HtmlLabel customText="function(){ return this+&quot;M&quot;; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<ChartDefinition>
<OneValueCDDefinition seriesName="公司" valueName="流量" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[File1]]></Name>
</TableData>
<CategoryName value="日期"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
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
<StyleList>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="144" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="685" height="269"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report1"/>
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
<BoundsAttr x="0" y="136" width="685" height="269"/>
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
<border style="0" color="-14669005" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
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
<![CDATA[515500,515500,687334,1497406,1006453,515500,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[515500,1914716,2880000,515500,2880000,2880000,515500,2880000,3313932,515500,2880000,3289385,515500,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" rs="2" s="2">
<O t="Image">
<IM>
<![CDATA[!BpY&qh\-E7h#eD$31&+%7s)Y;?-[s2?3^W49u,k!!"V-8\4s&"9h@b5u`*_h4$uL'2]AUel]A
)A47`BdAd=YIqMPB*^U4Nas0&XQuW#%+!-;@]AtGS!;471V!UTbg"75s-R\6#\j.HV)q+.9Jl
Q&Z^]A]Abp7-UMB0HMRVJV"FIDm[A-*huJL'iVDgC77IkO5Z5!Q2jG=XQ)Y;7#cO'(o$YXC',(
BtPt&I.n?-D'8`8qT-Ni[G^C'_Fma<Ha8A`8ue$*&P,PAm"O)_&jTN=W07BUY6`&>&Y61YdL
Ao>oJ@mB$-M\#cLkBR=c=KVI)Uak!U)'ea'2f]Ab^4Zp(==BF);cBjdMi1$&2d?GGmVhqk-ic
Eo&PX.pIX*W*Ebf14-\qD_\aJ)sT@%';)3_8V\eW@YH;1%Pp*bQO\`npeisdHEG/bc4nGPmE
D0()X=eOqln#oZ;#1D$m*SC)UEMV;2'sMGD%4qnPPdrd%W'ScZ^ehFU);6I+JZoSW</HATd8
-3ha3lc^_\_K@,WH4e,P4k%p3eL0;m!2\\]A;Ur=4]A:9\uF1JUtN4KT,&WoU9l350/96Oq/4J
PjP07J_XkY+r+XVrp]AiK$=Gb<t?Wq8FQ!,Xud3`?rC8\-!G:fR]A^8LUg.F!:!LagRnDcCl2p
$6_0%>]ANla^`,1n.*G-jh[VIf5iUha=a69'b24BT4/MTNOC_^=?[,2>S4I\:6>p9DWoM5@bc
&%NsiqNWL,U\_;:(s2D*KKOgI2)P,P[GW6",MG#<Z_^C9Z9cZ@2bu8/YW0dq-+##<CYbZf"`
^]Am*DT4mkHQ;6lD^0XZ'+Z7cI3FTUpWPEEns$';=,Ag<;Es_61P*k%@D@KWI9u1-g#:6=kRK
pEJ5$3:$2OA0c+3Uc.aCUF"^H3iG_(_/(KU^a%UAhn8f[f(PYFL\!YVNn8>nq*Smn]A1:T:W'
VN31RCYT,BN3qE^7PN@lH`"bma_<)\&^>7'4e%:T$*?F@8RQuXal.5pRZ/Z-<hhs+3G5n$43
_R`MAsLFU6R0UCcd5+bJgQm6f\8U=csk-reK-?iF14]AT/`$-Yn<B-i[4m.ma5)/_J[f>Z3)N
8`(ZOYU7s,g9\WtQ1N_+SD"*9_?>UW_#'-doCF-sfM><);L*pd=e8W+Vc#s2&N2?3`%$*"?0
FC?LH3$Ma<:`!(H/Kg&nYO^[h".n.TUaW-WM#k.%F%A.@?O$]AmDgg(;)4m08X;J;m@6fm/M9
*3#kB`Rrl)+Q%mp!bL4-YYet]ANUDBE*\leD2la(t5LR^pRo!W:sY_rGB@4%M(p`j"A$K2HH7
YXY$p:cpg=o'3;5*J!r8Z9K"<gR"SjT`mZT[BbuZJ.$@]A)f!t)$)Yr!!!!j78?7R6=>B~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" rs="2" s="3">
<O t="CC">
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
<newColor/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="5" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
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
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
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
<Attr showLine="false" autoAdjust="true" position="0" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="200" foreground="-1954"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
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
<HtmlLabel customText="function(){ return &apos;+&apos;+this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-1"/>
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
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
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
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor=""/>
<AxisPosition value="5"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</XAxisList>
<YAxisList>
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
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor=""/>
<AxisPosition value="5"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="0.0" categoryIntervalPercent="0.0" fixedWidth="true" columnWidth="0" filledWithImage="false" isBar="true"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="result1" valueName="result1" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds1]]></Name>
</TableData>
<CategoryName value=""/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="false"/>
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
</O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<Expand/>
</C>
<C c="3" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" rs="2" s="2">
<O t="Image">
<IM>
<![CDATA[!>>V&qh\-E7h#eD$31&+%7s)Y;?-[s8cShk6O3kr!!#+<PIUYn"56=75u`*_m@6a]A'L<FfT5
haPE?jJWTU:@$:Bnd$-n;_L@M81g6.Cf/+lIs.LS1R__1U`5a@/p1&.aYEOQl1QU>ll+#WRE
/OJmqB(6'/)q,d716o)V=1KDt*dg_B+9[ZqE^3T1tnu>#U,SuBc$Kf^_IY,lp]A_[0LTs/utc
U0`:W";o6.KgK<b#+il%>FqLOEr>F!0Vl>iTDga'$h&`!RK<_3K5XP:b55&;=Sp2gn%B:bgM
-Y^B:I>*Y`Ca&ZG%Q.dd3G5ag[KMpWLp6,AFjUS:h8!pZh.4*,+7%\mng>B5M[d:sBb[GXY;
e;O2I.mW(4E\s^^WcAU:2B!9U[>B.uK*(.\i.c$k"m+*2'oJihl6GaKN!"cPGc<GhJ&J0nk(
/DOV]A:pghp?A-)DaK@J[:S.8mBhPF$R98Wst:\pIqlkLY>#`*\^@,9`aon,:Mu/Erur10cGQ
DIqf.@R6^7-2:=IdOSf=5"<S=bA+Jej3aH[;.5C+OAudC?"]AS_WW$mW_+p!Q&:MPha02,Q>Y
L",YNgKpk+!SAH?qn=R]A/$]Aj4s'+@!:$k8\M6Q";#ZkL:u-*&Br33iH*$k9-oTVESoq/4i,Y
1N85[!@5U*/=Ho>A.52W3:<3!TmmWJf>E"L]AGU$J;2#!OVhX77W:2;*A60iit9Ts;j&!,@-$
*R#kb@M>sYN3sFriH9\?;QNQ(c31W7IZ^PSo3Jo6#@*37!8^&PkTW2;@L3rNgea_%9OqnJ7<
u7&CN4'VLi[PScX#0]A9,T,ra]AB01ZS0sC%=bpVVsCOCku%QQH$THRVQ"7QL"$Sn(%]A(F\49t
M>>:LoQU9rCb,-eZTfmrJCP+aJg^Zb7[3ld=^i#ft(_s,3'VSHV!VA=Pk!6"FV0]ABCJV98Be
WK7u.=#DFLTUk#;Hc,TlN05BK'I7RQ53TR,h8!"(^;GF,9j"bJWugiW3k)G;#^%0*`^+.3b'
?/<qTVlYX+5Xo07L3"B`]AUYCRcR*g.'!Mptk*3!CTi<iqMeWKCdr"3HmNZE.c4AY@o&!`a.R
.)%M_,E&>haG)1$d1dIk>jFYs3)PQ"hcL+5LVo8-`2I2P.Q`R"BcSU_VTY@emBS9,29DB*1f
sgZPs(iZEq^(=4&]AH)$E+>>p'JeW[C]A?Wg(1_<p6Mc%iFVI]Ahc'QGj0i&.ihtn%1c.2VEdm4
58nDIIU7Wa7`:H%27^:X`UWl+LZm@*Yn+(Msni$!U!M3Aec6`8A4L#Tr0hq<[6m[Ir]A[%Q/z
8OZBBY!QNJ~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" rs="2" s="3">
<O t="CC">
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
<newColor/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="8" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
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
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
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
<Attr showLine="false" autoAdjust="true" position="0" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="200" foreground="-1954"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
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
<HtmlLabel customText="function(){ return &apos;+&apos;+this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-1"/>
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
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
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
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor=""/>
<AxisPosition value="5"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</XAxisList>
<YAxisList>
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
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor=""/>
<AxisPosition value="5"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="0.0" categoryIntervalPercent="0.0" fixedWidth="true" columnWidth="0" filledWithImage="false" isBar="true"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="result2" valueName="result2" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds1]]></Name>
</TableData>
<CategoryName value=""/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="false"/>
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
</O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<Expand/>
</C>
<C c="6" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" rs="2" s="2">
<O t="Image">
<IM>
<![CDATA[!MB^*pPD^A7h#eD$31&+%7s)Y;?-[s5QCca5R7Po!!'$5ES^Zq#\Q^s5u`*_j]A`%M'3,lUmg
JS'mgBXg@Q_F.k=rS#AAb*1nVS\D-7YUD\tYjBi.Y5omFDFO!fEoW%#4n9TS\OE7FB2hf65i
d%0ET/#_G>?^Gds\mHepDm7dD99dX_$V_ddimskB;IK0=C<E4UR8V8eQ7<RHCU754%Re^o%1
D:@4:5^n!Rjd<ehNpYfZRr3I^ZbR[#ij+m]Ant&3OZn7g^O)0Y58Vkh*V#3s-!9J^<@YcGZ-;
nG9:g&Uo5U5O(Gto0oUbUE+E2cVi80>HEF#;We%nXM]AV-Zt*3J46XJXkgmMZMJ3MQ$SaiZ5h
[?Z1"nQKo4h0b_MORc+.O(Bl"LJhcOD=U.UGns-Pf1Jh$pY_ML?!LU*Q"T5/[3jdK#ob)=a]A
!dsIE$2)EUrK>k^7WZ!/1+I[/gh+!X7L>QJNKf:.YF&(M!<Mlk:cIZ&kmd.A7\5:s97FO9kA
d)T)EJ5QN!l^W0&(RERRT5N#0b4ScDk'>kGM1-:Gq?+q6iYce*3J3<3@TWPJ<l;W/W4HeAUV
C28g5i._)/!IH?0Kdrpid,E4N+;4iQ+K+YR2F;^CN'8-o?[+r&6DY,-hki^_ZWXTZA]A@udU_
]A95DTqXitp,UZZ3a9c3G8(7CSdAl23<J=,V.6qu;3Id,B5n2)N+R7S'&-D:(@[Y36'e'FgNh
i:$lp"4.Er1)`)bi+(u>%J9T&qE,,%M,s<c7%9Prc?QaWn"7W<mhO6g:i&]A^@-%P7H_m+?&n
2$YTg;JF7N?hH^[;K9N\TC[^jH]A.;3IM5j/<dphL!dX7'$1pRI9Z'pj6DOYQfG04l\)A,d$j
HE@+Eb`K'1f_`<Ikmj:\Q(;D.'>6:g/k^A]AsTMii1*e7Xn!1C4B!&4CVYWP00?WL><0]A!YV*
!R!Q'S'5CY7(^LTpL]A1Fd3S,fHhU0/WF=&7@@3i/:BkSPGdp"=PIq^;;H=<KdO-"6>(um%dR
i'I1\MQeFB(ZOp$L(JfFsuL:7>mKB!8GKpR<)Jl$_I9WtNSUi<-,\N<b63!L-i/f%)%"Qg!G
if=q^j_(Z@l-WBQpKP3fXjI#g/G?o:c,1=gA:p]AQ+Mrq&>qJX2`o!]ASCWe(?5a7Z3&"VTO>N
^'`[tlY+dK3_n%4?K:!cfY0?kkQ;6eUT=YNDb33KFbKo=(ST!+>&;f=:;$aS;HNS_N49"6CZ
4bqqTbA&oF1*r,eWNL0Bn!edP`W^Aj7,XEB28No]A^J(lHAQp4187U*pmoR&5iA.Hrt:E#itP
M]AIC#E*=s,NsEH!4844:$*\snQdQ1']Aik@`F8E9.>i)%NS%u+b]A55Y&@K8UQHU(&_h5i]A+]Aa
6!]A:BS&hViY&:bd--cA)?*8.16I=k5H7=b3E=pB:X!1[fG&=B?DJJaMrX*<mtZ"9<u;6Am\I
1U[H0Pnai1H880D>H_GV/_Lt9*@SIMbf+->+T2?A%$&-:$'*Hcl^*&O!1Sr5i]ALbPlkn!nnZ
<nK#/CN7>052ZW?[MaVU&%gS5aIRK@Sh/<L;_HHXu7q1=L=uKEUd]AYDd9(!"?(FX(e5d^O]Ag
f`J/o1<2O\`M?mFF(?'iT6C-tH;eI!!&Ht?AFImN_\P,_aZ;NR\FPZr!mZ0:LBQAH[d_-&9D
MRl'TS`u.DaM'qX>O[=1t)&7iW]A`bF*lX&P9^./m*sK47mOjX0JL*%_GVu$,K9=)l3,`XhT]A
.S]A>,=NV,<q<\:Ib659U"3_h+U+EA;3skTYk==q3j>ostoR&Ft4J4$4s:>7MB;Cigm,VC.Y&
Akn]AK?U\'^<tZAj?%Pd_>"U(XMZuGBj(1?)RUQ:tX>V^`Yau'k,$)O.'2VtVC_3V5J4Wn@b@
b9aST["!V,I."CuN6BCE;]A(N/n37E`/A%P.W/gR?16RjrE'/Vt&Z&/]A?d_K(cpLJc1h:S@&N
gh-]AhsH^=_SE\c^O?l@UX.&T.,gq8%?/6T)9!-"GSB`V1YaV;LCmm-O_#ma3E!+8$lcuQULn
P9Tf%,!IaVV3m4ECH/]A*?ePc=EIZi(-JnTM,&uQ`#o$[W<07g()Uja1"2cA*q#^(I*L,#6qH
LM3^%r>n?RK,*q(S?"'CP#Fc\2C"h36<d#p0>G;UdqN;."B*;=Wtj)cs8(b<sQ[T9j%dm>0E
lt!,XS^&^HLnVObJcgNlA=NZob&2uql)E^F[[Q-_L+K`HHnH*U=J?P!H#L;+jIB/@>::fJ<Y
YSk+ok[4&Q8#a#:34H6\<kV<*rON)NEAlj.@L\MoMf6>&>e*fA0lG'*+3`P2i9p%4\r91`l]A
<hY1qJ+lj$Dl@Dcg86CC<J;(j6/_VdG6FC:7U,>FJ.LKZ`c?h[%1;8e;+kq2t4t@]AsnH?Y@3
jJb&pu6lsc'A?KGGHrW"U/(c+idQ?C:Za@X3<ba@CAYX:r"ug0:^d\",SaP&X%uoKkE-193s
KSRIc?l\'5IcmEZV`r)'F_aa9dJK<?tol9NN)=lbl#ZG0hK!:Y;C]A0Id\A>'XpA<;$afE*PK
#O6pm]A?a:p!4&UI+2f"i3WQD:i7dZLepI6!Fj0ltI&St&XFTN=U1LTPSu)!c)DTVJTi@#U2,
Mcrg^`:B+(&amV+]Aag'mi7^$!"@5Pck`PVu:L.fiPlQ-e6RU,N;!99@1,"Xu()3AKT9b\q:9
QbT4c[W:R7:JiZuWKd_Qk>4P:@N;Y,2&sSjIma?$8Wj<bu-acK%=A!b-%jpVQ>X$cXP%UN#?
-<-F"\'YEjp7^@=o\O&!(fUS7'8jaJc~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" rs="2" s="3">
<O t="CC">
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
<newColor/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="11" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
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
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
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
<Attr showLine="false" autoAdjust="true" position="0" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="200" foreground="-1954"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
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
<HtmlLabel customText="function(){ return &apos;+&apos;+this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-1"/>
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
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
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
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor=""/>
<AxisPosition value="5"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</XAxisList>
<YAxisList>
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
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor=""/>
<AxisPosition value="5"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="0.0" categoryIntervalPercent="0.0" fixedWidth="true" columnWidth="0" filledWithImage="false" isBar="true"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="result3" valueName="result3" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds1]]></Name>
</TableData>
<CategoryName value=""/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="false"/>
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
</O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<Expand/>
</C>
<C c="9" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" rs="2" s="2">
<O t="Image">
<IM>
<![CDATA[!It?'qMA$D7h#eD$31&+%7s)Y;?-[s1&q:S5mRYp!!&4>pYGlM"\2-P5u`*_m9<e2'NGtk&Q
(h*M,=q=,2ltUbdK>dUf=u<OUqd\5U%[-Or0r`cT*f;g5;UW6)+Vt'o3/,IGbm6)O1O\@(\p
]A#DgA"-:Xch&hOX<c>78rXGm0D^!.Vl;WaL;fd9D`Vs2Lpm.ns&0Ah7^9iH/qc'FcC69bJG3
D\9kf<jrUhtPCN31$k9*M&aQqqnr;[el&pnQHi4Dl.*G5Gr@mpps,nUTh7X*1cqYP1OE?C[f
@HO<f0o?=uKUmfu23&U\3<L,<"r$bFmTeie@S/0NkDGP3\Or<IAqe`eTgq\C`-cZom,"![)I
OKS0KW<;nPJs0@IJ)?%]AcOP?*X4sG)H6<q<)jfUl\)RJZC#VCnmZ[h<0qYuWFZL*7TY@SFSq
tYDr?aQ3^jHj"3jC<A]A=VPH>lMF-Q_I?s"QE+K/upA^L=-$rk>J?UoUM]AJ`JMVLN"+]A#$gPO
3oibN8)PduWKHBe&d`YPkiqr^$)"=>$b2g$IBj]A[6M[W)8L^)_0e]AQtdq]A:R1/#.o5g/GA:f
>Xcn#;c0MT]AZhU(%?Uod:oBaU9XZ3TI`<"]A3g3(R\&gKWhPXg@rdkB&5\9ZC3^RXlOgQR=d:
c;F7HJAedF,+c=B[:B.^CN,D>_LL4)SIlL[Cefcd&=H6uu1&#[k?gWAUD5^Q2=661lm\Zp)d
>>lt7!20Ob=X+Hob`0N7>8eUe-a;:Mji0\OM(@KbT;3!,a9h3$m>,-`m(Jhg0hhDP>nEQH#_
/u-5_M`u)b0+%Qe!XBiPM.nWZm6cA+j*q'W5^e#VlB-_s=?=W^haSG-IdU^i;7(f9Sl4OF[?
%LIuNab3aa0;>;MT!>J4C%Qrpt&Urjua.u@[G(NKd,#XgBQqe(E7U9&]A1-U>o'hUk7<?h,Ui
;b6*Jq_GTGq-C#P2mW3;'4XqRW:)go\TGq$1Rep&i=2rf]AE+,_"aKS=s3/kq#'Mf&dVXuI0'
S`C8@k3!D$SE%Rf,R(p%$n%>OP%L:'h\!MA&K,Y^2L4S2[Te9Vf-[&@TmL2EM`bpVj.Ke9kn
84VN6:;(fD86I"cCgRM;q-5WZqbWJ.6C2JYH+NZ6&g.B&rO5tPrjS>%qH'I)n6PM&PStX_L]A
=78'`Q*W4"MGHZNW\,%sIDP85>"o"qaYlUo&_h@T>R+fb;mF>k_RH'DY#5A!(V99"-*grg;a
b^=T0)US"8k]AB`\)$YmL$.H3VqYldpYSd`BJGG]Adu^;69#''iTFMF3OSo!)5T(WhJGnl\;Jn
4cT:V#s``aeXGXmsHF-jOW#5'g-:sWY\.tYb8R]AJKR\'U>(bHoKehJ2H\&h;B%OX*H>1Ti^#
1P=Lh<\?R_*F3CC62A5<Dc>Mja">1J&*O3Z]A/2si%['jRV;:=q9@nI(7G(?%Eg`V3aKO>?He
2-2os2cUe?Nq<WCN[a-nV<5$:\1)QY#0R_l('+A4knSml-TkV=49jD^"Oq'#)PqK>?DSmSI2
(2<N`Vc<7;ANB(/&dr+PL/t;e`H_f-2&*(%SrDm)"?R!%'$b&M[T\SokH>;hJs]A]A9J2<b_ej
TOcM6eq3]AF'!9,Za`#"\6f:ePHMPTN>;m(@rmM-SZN;.!]AYf(6pVCL16;c`fb!tKc,3`K&!Y
hQBA#,&[9M@U:u-V1ZOHQ>UfrPm*KV*;AB?!s0InHc`K(A8FtC@(\GD=%=ggk*:35^`mk6F!
`Q)8$:1hl=EjIlW?h]AY7XPYlFb(!(fUS7'8jaJc~
]]></IM>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" rs="2" s="3">
<O t="CC">
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
<newColor/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="14" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
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
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
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
<Attr showLine="false" autoAdjust="true" position="0" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Al Bayan" style="0" size="200" foreground="-1954"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="false"/>
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
<HtmlLabel customText="function(){ return &apos;+&apos;+this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
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
<OColor colvalue="-1"/>
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
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
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
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor=""/>
<AxisPosition value="5"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</XAxisList>
<YAxisList>
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
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor=""/>
<AxisPosition value="5"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
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
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="0.0" categoryIntervalPercent="0.0" fixedWidth="true" columnWidth="0" filledWithImage="false" isBar="true"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="result4" valueName="result4" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds1]]></Name>
</TableData>
<CategoryName value=""/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="false"/>
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
</O>
<PrivilegeControl/>
<CellGUIAttr showAsHTML="true"/>
<Expand/>
</C>
<C c="12" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="3" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="3" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="3" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" s="5">
<O>
<![CDATA[参与活动人数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="4" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="4" s="5">
<O>
<![CDATA[新客人数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="4" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="4" s="5">
<O>
<![CDATA[购买数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="4" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="4" s="5">
<O>
<![CDATA[购买金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="5" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="5" s="0">
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
<Background name="ColorBackground" color="-15262921"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-14012338"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="4">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-14012338"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-14012338"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-15262921"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="80" foreground="-263173"/>
<Background name="ColorBackground" color="-14012338"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<IM>
<![CDATA[S@iE<<*e6B]A]AnjI7T(/h&/Z[g;7]AVFkQ^8PV+\C..$9g5;5=d@>$?5cC$GY:?$AI+o6bi@Du
7"VYI2tcB-#%'cZ::;WkZ?eVSWN;!)H0`:(mV(^&e9i%43ji:8@GS/c]Ai";Nd6kIQP$jJao%
:54rlfA's'*TRGtRf69%C5fEJn=nn\I9<*Ws]AHo0kNGFm5<q\U8oe;X&Cj3VFDSkTQDS;?-'
1aOQPR]A,#mNYt?01hF-a]A-94!q,)=(!AFN%i]AV/m:N@:qudhj/Y36)88DpM3nPDCkF(!<EQ@
!mgjd(dr'sp1/RU8HWTDH<h9tAr0@c>QZM2G5[5:A<k?q4cl1a6GP99i6#SKA$I>iIoINnYN
a92<s'Yo>L+NrdZ^AE$`2Ef$oU!F&@KEOVm-@d.Ab5ROKV!((S%jr';(hlb=>ZgD*j:^ZBp`
As!((9=-55%a?kN=o77Hf`KPPmt;GktiJnPA*u8.<7NPV`!RS=_QS*DTt9h,T7%nEE1JNmjr
fo9=0uf*6*j;;l2#WgCo1\?N2Iju$\nUk,bU&qVtk9E<U>s4']Ao+!UdZ3s_c,5cJrjUBRge_
iMYD!>oT1]Aab[B7@K;Roj6]A.7/&SZJ?IZ0i!FLEiNB-E$35B2$GbR.J07+2fGlr.g?goN-AZ
s`Z_!pU8ds8m%tN1g&NbAt0inBPN<6jkOWXm(5tFftfV;i.5ZEgK.MXo1<Ze2H!=BC]A:@h=,
<44.r)%\oBH@u^FP)#U$5`'.TYa.:T%*0J)<n>It:pFfui<FAM!15-)i2Kq,!:Ls2Pk>G1;A
bVh$E,US:CNn=LH`]A+ScN<>@/sm[)VfWo3:%[in^:`9IXT0Vj)OG$d[DLHEQgLrXmf]AlE)J8
uE8^gL+?5B%Jqo8Kn$@$:B;g;=VWt@!PtiBNNS#+IE'`]ATbjQZOktIh`G]AfE:AAiSId/G^Y_
gb9R#FK!L$ifphmh%2K]A5KDXgiH,SJ;^)T_`59aMrgTL96[8Ob8X/YG2Y*3qi5K=,L_tHT2_
[-Atp)K3E#j+5+OXhO%Qn7eVY(jj+PUZ6YYEnD[UC8O0_bFiHpkKlo+;"[fN]A<(&>n4UHfq$
j#ZPc53>'_*c<2%o2fIa/-(.D'$1%op\5%;dk3DZ!Q"e]AQO.+1U\r0V8H5(HiOUUam(XnGO,
*^U"on8TJ'[\hocZeErd3osFoY!f(`mIIr?#8=5m$_k!WVUIp+!iWs1\;a21/F'T;,3p(Mda
+s*j$K+ZfO2Q8^E@*g5LViE4(D',A1>PqT;.5WrnKXGPcMqe\%P@VOj_K_93(^ubk3m_'(`:
p46UTRTLfIGg<0h4rmi'9`_qUG`%7b@619Xp=X@VFSCN;$,8bk-L"lMuA6OIV"]ADnS;69R$K
0#$#9R5B1Yi;5p;?qRp(Z,s%S19A<+RaD:6@\6A4uDh:$1/6W!p-[&+g8Vrk[Trq!qQ+6<:m
otu3pIpP7m7/c;PW;jo+n9[J3^-2F1A?7KMJ"5O"Sa(\rm/IXis!^rV#*9#frt`g8L?*hIgt
rSYb52*#hnN4iJJ+r2o+^rV6iU?T#r6a-7HT)ZhgFo4s&p)ps.tVQ^JAHA"=/S<rIhVHYkjZ
E\*kB>e[F-kRh_SB:C0OIL8/;S"VY.ST`ILl#sO,r!=KQ2K0qkEeY=YtF$gS_,S5[B*GlG?@
GtlDq!sZ2>,)Xi^jh#u2h)!`8R,D?/^]As;f\seV0ue;06=iaLd973cdr'E`a.h`P]A9"G<ErL
lKINP2R;+l[#-%96t[4)lpro(Ph5db#M]AsQA8*%t,f8f'#IXBPRu>r?]AR26`a7I9cfHON#>F
cF@-DBI*F7%4?o*HGY$42nb92)tB'C.4ou`[uX&DA>qV"pUOfHc#^!:VYLtqeL<t8`aZW(&a
5gp$+&(2)V#l^2'!g=?rTNP1(.&gJRo,fJ"L%1\qjbWYN%u4aW`b%#:EW^;JRV-m@Y=Qd>m$
.4s%$eA*pTZ=iKZm4m]AT_3[T^V,^bY4>B^dk<9#"5QeR:mI_59:>fu?D@hW`O#ou+L`2.m/&
s2lNB>ufl_C=Mo;B'78,qo-knc#e-!l31kE+D1Enp-jbWbP5bEVtLGB0N0OWimh_:d`EA0uC
j^O]A8Z\/uT.80ieJLJ*R/F4SKnR)KquddaW19p;9g(*R@n)]A@f+WpGBhgH<_gXRP-;h=8gmZ
(PU>@/Lk9_#L#@EabFk<L<%@"&+`b@4+<2u,!,^DUTtbO3`)''RS[,>jfRF2A3#`8of0Ne6?
5CI9'Z.`RlTOQn@77M6m_X@YHN*GT<?`@a<ibE$ZI'g*&eq$nc_(7*8)#d\^Wd+kE:Gg4\7p
;f9/Kua?r/Oc?NZL>IRGr#Gt;j8^RTa)&sbo)9]Aui+:%R(2eT&m3H32@ca8^WCpQu^gqM$+K
`VQZ-&,`r.l2!?6Gqtr(m(D*,Z%ZdedmUsVUHWm>0O)lVichOs0S&H)-P?p#PgN@\H`MLGe>
ADaT$RGKY'\+Q9=[mr/t6,fqh8m&IJ<$"9n-d*L+'aJ`N5k(,Wg,7hlo%\P\C7#Jf'@i$#/%
bL1E`475QZMK3,/Pm^Z%1C'FaD>D0\cd^$>_YP'km_@<!)d6djG6I&/^b$W"M?ffc)\mq^PK
%LFM:Y1AABOLB65mtmT!`18cT#^eEPD:dNRh*g'3^.<KsN+#PjV>%T29gSK<lCB/"f0A=-(\
B,S"#mG6NmL<sm,K@matJ5:4lXkJArp>,[V'(1.-'NecIA%f%)qKS'+^cTZe1Z91'0\eL6M'
<r"@]Arr"TRk!rW\nC)o>Ok0B!kIc8Ru$s.^cd>(U_cf,6[&X&n6YaQMFT&,73j@,L\'$ikPJ
V^)sI<@NkZOI?Wf>uqC0-#o\nFH1lgbT0_o'H#nTKcm4]A155d!<UrFqAK\K+"Z,#q#=+m'S9
,mb@I.PeKeXd`c./0>t0[bI&b4oH]AIbZnh]AaO5nO<.^3%qs+?QP^K/_+8^+qoLi`qhqu3+S'
;aA2nd:p0[UXkg(WHQgqp6LQN#Q6pO$05M2>2.@dd%,Q"A3H`:L^EAtB[ei^4$[QG'XZGq3F
h'^s2Ghlj*%HW=Fdl^?IQ%_]AO2HPakj+KQe`[L?otpNmuUR&jQ=1CQ7A09S=%$/?HJm`V32E
-RXg;mB0g'di.`XA9>^5S%ir'WN<B6KjK!ZMG+OmqjB":3V[X$QD8g:d:hcnjptb0,Jf"2/[
nW.#+=4M@9;i;O:84]AuQNeU8!Wu8M'S/5eGfn8_\*Mjrm@dr;H'J7\h-clo.@;7s&Q\+bY^=
_nhi+aPIp-9gGTO@n'lA,@Gbf,WLElKDY6X9+L<X5Q%XsBm8@041+*L+hTn/#\5TGKJ6F8aP
B<N$jT$cRjSd:na/[;EK:G_`@+0J;gdk<m\=/u/eAM07p>98$j"BH-Us5lWGaB_Nk`=5>,*7
&n/%nLfAV\a-BCbH4mA<l4u(ZmCh."\pjt*BJRNZ]A).tHF6Q_%q!U5XkcB+H%]ApQ$kX#\[BG
:K`UgHKUXU`'CDSA;?qX?&$?=+DnQX='R=NlLk#$n8TZJ_A"G_mrHC=0+p*H.T.1mqU-kpR:
*1>hulRi6auFIT?7B+(L&34=%Ch\8ilPJjt^<N*JfO59sltJc,#q03T;qS:tKiF:[d,`OVVa
mGqU.Y*GpWrrO0!mg'KEb_c;tWg02HeuV:^8cp)CZ#]A1"SYeCcg*GL]AnDILNIIMY(/^9$9KE
9ZJQr:#=T!Xjp0H3U1,N/SmE1Bd%VBmBr6u6&7p'c$)ShuI*-h.0S[BM0DGiZ<8^H;8E6/0h
SaA_]A;;(E9OG/"H?l^5]A7-bm+)TCRdt4"<sbY-HiV_UDki:#?.0g*Z"f>o-=l8e*'hm(jbI5
'DI3RrA)n&iH[jj&B!;T1_T4$ln;*`b7&M3VtUuY`55/@u1nlQ*:u4<i_oOVGjS@5_r_/rk/
8X(4D&&p(XK>!4r(.D=QbQ&e\ZoLf;:qk4Sdpd:YK;ZmO*L9ps;3<:OJqRA]A8ZZtL>Kj>:s,
^Rgg!OgTL2qLqKsh&?_2]AOet6f#4%+^=54ejZhNt=<^h;a7eHZli=kk]AKG+1WGdE[DG05ebO
V[E3/>:-6IrP:"g::Bgo+_@GXh8,^m3T%*`Drn"4OodVfEk>Q3'\CCr8r$\SVo#F_LV?T>?4
rCs`]A7^+$?VMVSHfhd?4jI`&h!_e>><n/ra04LV*X(M-B4!DRh,4cYh$$j11f8`WoBX\'/9b
A?o!:NWa9KlaJsTU0F!1f"Z+Jgp-%OWl(:$rfF.8>-!99^"3u[Wju9QV>E@9R"Z.h%=L8<`I
#6ZNO>9/c8a<+RjGoTf(GNm2)s^T(3SmKh,hV;pu;WEuD28;0:c`6;Oa9Rj^g%Je%c)/WJiG
\j]A*fAhAdIFquYQ]Ansr&<q2Ka[P6Gsaj!4!r^*uVbdcrF)8tJl0>B'lSc@Qpio9hFpq+373-
0K'*igVN*tLcK_l[fb$b<BKlce3]AHgS-)4g45)qLCq`3&YF"GP@+k^P9oM+l*6;gFkR_5EMN
N3,:`U5FA$WkN1tHF<<Tu+q"F+qk'HLVdP7C%uZ6q?;udtLd6!g%A#TcDESr$p"WYZ:"@>C@
'.g:d\.!@]A4QGU5k+(7hHQ/j47<3pa;_ZNc)s=t,P/t[A+o6_jE-?YV_ilck4:^1.M6QYOFG
`Rlu02N%FW=-\#.89#jbN$W0ZAgHH[%KCm'sOo&Od9-O%e\:X=e0p[IY]AhhD3Z92sPrW3AMg
;760DFkBk9lA]A.Q!LRmnR&'&m**n?Orfbc+:N7Ls#4>d3J/n%3*bE0LU-(0_j=hdrEL'!fAY
Ib]ASGN%S7h>JX<j/?%NZ66QVm+8PcJ<n!F^*G(ilGt&3aF3C)Ad-^bh^$:%ZO\%:<H&B]AAF5
$#o)/BNb?\.2N64:5,n@>+fiPSi^UeBn()tS'$Cn;0bWH6q;R72ZC>Rr:9Ac%%h&7n+/Oi.A
BgjV$DKMCn;&KhNmQ5G&AFGHju*o1>\2-a?HsXoS-mZ[/A\PZ1"_tKN#CKS:>aQQrfcG=eHh
-HMu;plg=/$)Q=/nidm#IR!%<a6`#2.S3"h/[3['&L<B^BYKRl/&DqX[QB<;k?@4H2!J'QRj
6L8$U$'TI..Oqb-0?H0/X4@SBi>BfGVkDG)c.#s(i\Hkm\pJ0YB[A!4o6/KRgEPSi.ZIrTO8
?2Lp?oETD-t&"iGSL>,AuenaV@Ce29[6KQ(*HL3\aU$Y^JO@Z:[8bK>iT1;4jY'\US'8"CN<
ToN(ak+mS[U6be2&X-A(YaDMV]AA)kP@p4NHhJ#,W@K+(FtjE;?u?TTr(Q5\^dA9Df8MtT;$\
7B"e<%DWc[f,prm6N?E=f#.hN(e(#[,nLQ9!rgpSK7c3#sr(/a?W)nPKrjQD`$M@eO!"D?^B
=[XY:eNK_mu`PF0<JVF7r?'uA=MPN4f4P(`gU$YK"#[NoiMLLRo9D';*BXAr[&HNddo$i6+0
^#FAUl9;p$.,CKF6^hdi[s9Q)ZEUC0^eTaKSU(.R>ld4KXqVR9C8$[k0QJhG(,hpP^]AQ9#c3
4>FNhfmc#1a_I]APG1j#W8oR`/rn_/^I'1'NLiZaeDN8CNnWj\_%/'NXO(7l;r:AblofZ31P3
/73[hG:Y2+n=k=&``enGZKa@e5c:'ipcMZd,Xe%:^D\`r%5Q2";oT00523#EVCb6mSl$TrlZ
OC8=h('1qYSkBJ*i`F@C"+q05H%dD7"P;X'r@kWW-_@Pe"Z6-"-W-=q`A.fRjs+)UF\;k1r$
t_TdRTA3@2mrIt6nEN=qatoWgf?iV-%T!"futUiPf<@"SSg=^1uf]AB$XB^8trcfo"focT/?r
EjUNQ^A[V#BsRepX#(3sL`Cu]A4@Qpd+4VdpbC_h;51"3;+Zr-Sndkm7i%PolX9<gimn>%@RL
/sKXq,qI8?0*"k9irn3;22^,E1fins6M$aJemZH+^KZK$mA)`g(7\U?s=^L=V)Xi.4BbJUA7
H/5sr:f.UJA>NraZ9Lngl1VuIN=$7<_]Ab1a%(J-K8!ER=?f)Xq9g-^b]A+fQp1d_Dd&o9.<#D
5o/==9k-;aY7lCj([2)TBVha^X=CZ*n\aW-u-75.^kpb3Pu69GLR3?LY,.=)V%9q@6@p=<('
8n2idg\2`g)b\]A'a,W`ng(34J$0*7G7+"lsnG&t0)#fKMIn[=XZ&?YD7nlE*UEYrKL;<_I/g
VdlSNju<UVDUrq`HZu,HXL@h=G+MWePEUfpUR''2*N1M=.SL8kA@MH@qRA$[jl-o'`Q:k'[N
gFdA\AoXQB`2675.dLOq4"7Gi$GM5*rKY/mug<%+s/?$o")$?"5=)E5Dh]AHtVoM#U+E3pDCa
Fo?WMs&@s+a'VZO[oW_+\PS=SOqfd?sl0n7--QaKD7QW\Dh<34`3M`Zscnt]A-E'g]A?JcU!5@
:]A&ZJ>Y5;,Vu!WSjj![K'*nKJ]AtpX>bpP+a.J/2D_Ln#2-_R+W\jFqCn64)nXC,H@T1@J(hA
!1/Zg)&k#>oQG7cof$;D/3:Vt:r\?D(s1=mg:nN%ojIOf+,*V=Pb"u,TH%G`b\=KbHU!ciI!
1V5XjE>hil:dFI;]A"SL8gZ>BC4=t/odMdb;WGR#h]Ag!8ZcMdqKb^9+Q%1q\OV#`%lL,59_K)
irqJ!"qjUFBro^^2hHTYAk<ahUOrR"TZOB5rBHVHP1\"I`Jf!Zg=g=u5hrfIbm[VAtgO*PBf
#f*cA&Xf@2^OAKZ>94&3l,Tdgq998<hkL,]A,rh@4E^QL9!2;JepV7[0uDl\I'3:3eDkIR2_n
=BdiP(NO,gX:!o"`MU57[>Q]A_"eBK;11XHdb?snI:D3^o0XGg<*uEGg$@OK:EuP-6ll!?Ic]A
<o^3=EVOsVFZ5F2eQ&u;=Q8=*BCeWYU_cK!Yb=Z!5C1f(=AYXHQ^-H8%LFL<B*;-*!HAY`NO
:!WQ2R?nWI#+=V[_j*KQ*8j@=1@_b9Xg_.upEU_L<e,?;^dpb^>P.(!oub,jE\5\.^<3@JP&
*lgPOk590i+T&'+;BY\9q:L(d'm.e(ZgPhVlKU5<PPulAJ<t0kMbik:(NJGq<'6UgZ:rfH*:
UeA(_*Unn'&WO(=R?uqMb'EtH-6s/r8,;oa63!p'emDs,J[b(]AK)1A%c/akKYrCbeV7h;ieA
/Bl68#-6$aE4J1:0:IAD7qoUbGV'h"*-t54gFl*Q+NDK"j5LD-^=1UAU8>;fO-`YW9qp^,8t
6?)Xj$na?:!,=g0HkhZ!6/[?ZtVcdK(ImAXI_W3&=oaV*d;J0%Pjl(QHk5SjHEBm$ZKKE%hR
-)$7"-O(VN41H,3:J9)OR%!tgbt6ck*RsoS[>F!"6D;M#-D/jD=Um:Wl\'pSrebLTY"*3ZDV
,O%gJ[mfN8tph<M[@"+[DJ`B0kNR"B;Nn^2(h[!G-8%-:3nT$)+CPBI6^c!`.&chj]AYsEdVD
$)*(BVB[a+fX3JdR!?'jLhcYk(e?Rj*#D`qQXVqbCF=jQR$X;djIC'`&/.I$YZ\H]A\f>+uU]A
#bMDS=%5KB3;nFrko'79%bDU6V<WnT&l2n_#O+rJJ"$'S1-d3=Y2fNT^eLPR``HBM@_u)#bl
[q4a&BTZVG(,%QM2U8nu!]A++WdnA_X&7DJW'q%j*@/%ar^bAG;LrnZ%cAgt.e]A7U9kgqde-p
Z*QO5PKeq\[DV78"U&`bajq6io%l'eOfhHW8#Mq/>YB)f7OLq`;V<*m>S\)Hih57J]ABan@!(
WL_7YAVHWG/#Rc1I8Rj\,pkC+t\a-8EB1G1'^X$+AE]AO7C<JGc^ba2$H@d833-3>D>toNP)k
@M^7jql2C:cf8>pH2eJ>8C@Z`TU+pPKp2981j"i[X`gHRe2EX7"X=347dCa<d-SIECPWZfKM
(qEDS*I5Z43$iGO6Ehonnl]A;eHcODE)0o@OE;s6\gJ&(0V-O+ObZg@?[2/i*:jRZQ8@#sXHS
GZ1@iH@.r"PoSK#,2fQ!&$.3RTqqAXN@1C8VqQTG6S9SH)*lb#:U%4L$o^U*3OfdV-:O>,rZ
p?#Ap%SCron1Z?!]A&M::(9,$N4Dc^@Q40p4cBlZ;S)F2\6q)[8-!UAYOOo/HO7ds+/i6d&(q
UH>[?K=DI2Y$C</R(qfB^)9lO)I@6iDE,&)&[$&\tQfg!aq,7^H/2FYQg2i[VB63^m.94l\o
dEuCrb8A]AhLk'^."ZDIUsQ-%r"CU6b5KN5C/Bc>=an3a5=:F?o#-ukQH32cC^W#a*:8\$Ed&
T^[2\-Y+NC%R/$<r'orT"%_'-Jc`X,07W5Rfel&!rgYG+l1Sm-Y5ppX=\^o/eXgCcdG@f>SX
9`QNrI('4Z4!kXb1rVIL)FD,$cN3R=:$fh9hD)9bZq?o^r=NBlFhc/CKJT8#A!Z7.4*Z/F8,
!o#:%Co$HW0t6@:.MCAVTRI<[54iW8nk8^YUSlf52]A86YE<i'8=+XYXSnYtPgsgYmi@'Fj@'
td"V<KquHnJ0g1*lPj2o[LuhBLa:mVo2D_@r.3#Vku"iF0@=.4g<A!go.oqY/kG\`dTC&7O7
=O\*eDJS3L?ikp_X,trc/-#sX9/4:>Mn,P=A-W\%kpIDNGVA8r\7-gQbEYT<&U"pS(dfqqan
4.hP+c6PDZU!WtJR%*ZYrnH+SRpF/4ZMaP^V6F6OuD&t/\F*4_3kjg3@@'d8r?DVB!%ZcFrY
@5JW3V)OGg_;#G9aoAZq(Cq4b[rj\LP)d8ACo52954;_\.!+9pZW0UR*5qV#@)Vdp@\EH6_D
9XcjkqW0\D-rjB&'7t_p.=qlS,J-GJ*#n@:T0P<Vj.kEc*M"Y/Y?%OdEe;N<<AgIXs,*!ZLU
>\Xm&&@&K0E>.C_h\TBlEcKZu-1a#),,Y1qo_F<k>@f.ea\2mehZF6N'4!7(3UQ.>A-)+uUa
V/"[$',!42R,@kIU9YjHdH109cOf.kM:g.#&\G=m+,r3%$8oCKZVe?WIH*>4@IU'gKkTr+oe
6HdH\rBSfQjFe7H/BXaHjb#aO4hkOHT-p@2n.j!Vf)j,@kE1OVrV9oI)Hq9Ek1T*kFq5meKN
Ge-6i`[-`^*tom=&Nr6h1,o/(YM)Os;cbL-,IeT#?oqfDR,/m3/;5O=+u?;=jSo8Ia9lh)Oj
P<oT_cF$.;b3IL&6q=W2q*M-&+\qC&ci'k)>q`59M2@A]A5Wsl,T$tikYB:T/7brgg3uR*`"O
u#M'Et/IpeVBN6Nte5c<)nti+U/]A@Rpf[n[#./&ddOkqKZ&CG$B'FJ;92TGGCZ>lOo)N-kl&
gEHRQ_bdGP+ncV/U;,8/@?0fQ1n_U.#[>d/0CnNuCFZO5(%W<G'7sVYB.bp]AQ#f?kak;&)OY
*'W'/aQu-U!QZbPgnU,\Zs4P)Zteh&%Rq[[5"/35ncTN<@27WYDUMnh4T`8`oNQp;kF`N`9"
Hl=lD([n0nCdgmFn6VH$E4WO_F8S$%ZjWb6ZhGp[b7%"a;dSO>?]ApTf$8#.glq,d`ng$@^:4
3!F]A=Q(Iaf?!bh9GG.`0_<LlSG@"Khm-&gUM:4JOAbSTL#f/Yr"_Zj,1h'$iXY]A4D.CS+$6Y
(QQ)R:l?@?Ie;UKMRL!ZFH)pqEo$:Z_sq>n+28@Thd7P6aXcA'sc&L%(iR]AF<pT\+-+nBQL%
%U-A%Z6l:'I&m_6NmZ+-VN[O'/6Xqi0glqSeZ`4)O%^$DVAsQUWDn_li'[73T[O>\ZcWHp]AT
fK7pJg+c',E@B/kH7-fZ2(UW)'l!]A3M;4,J#"eIG,;m!8gF20,8<'4SGKSo6,VlT!ePg/-ee
4S<@#PPdHdYRP!<6`AhM`LfRmh"-MPPT&S]A#a*ZnlW\^A,Ac:m-#8]A"6>hZ`DlfDl!]A#g#,k
!gQV+ngSo1=IMi@`m!,3#D+;J^p#:n0*!jci@okjnIPKi^j"SEaKN&@(C7n>X\Cm`n)8\Wf:
")OZ^i"VS-`leF*2k^;+uY4@%Vnl]AJM6;keEV&Cl7<DG:#G+o_g]Ae0Mm8J?lDh]AZ_9I]A3m+.
E\oQ>I8<?k\aDL7AA19WFfCjS>N7K7Y8_Un:nn5;,8Ls=tY>7BM\>:753ae?_+?_]AHG`;Mqp
4&4"-fc$Vlj+s3i7kA&@jN=#pI\L;NS8h2JJ:,u#"Apoeam+)Z?B?9b)o&^N<e&..DI;Uc1O
aP3fOIZO!7l_NiM-i@BG`E<$YVi='NE9,@r2q^a@s>;:Ke!;dp_OBV^:#X$kn@d*N@B9d'fp
IVdG_[p;FX)GplZ.JlG:\Wg)&O:MB,Y/V5WWA0"eN(s^C>1btSIBhLB3:lCJ0g?mlZ:*nDA]A
-DW@\p?::g"^^=f[m#c^[54`IZ-48baG+C5US<:"M]A"kLBVJ++EkC+%E=jfPaTrhjj7298fZ
4RTg6AcT-S'`pWB*>`ha%LgioK,5SuC1c[/Ijp=J1(t`I$Cp2st!`GnVAV9T+^?0E?\XeYjm
d8^I(*"XV318@Tkd3mY?h7P>=H"MkH9;$[TMJ8N#o#=b'!EgRm"VU&R]Au-b\K*<k02D-V<m*
X,8Q-hr:&*N54l&E#7=Q!Z&[p3oj%4EWF%,`h3Yc0p>>YsjoFAu^eP#E9T_@k$VqVIikAK"W
!AXOnKCR]Al=g;@2rTD<1Y?%o^Y]AHi7(O_%+;8%itgbY3#O>]A!/r9P:7_?1B:V<`Iu4sbM[/0
I7HhUIY35b98C_G_Y<GW'R^[Zd>7eX*u&hTh7!junPp!P_]A+HB&4ja&:aCh8[Id8BW!C[NRK
<ATOc*SuXSkdn2*I^=8HHW0q#NXC5E[+OsMO!%$h\3dn;q"67BnBLs3A&fu(3c:qg#ojH_aG
9t'e:(&8E+(ZBTD'+o5c2AC0A]Agng4,#g$J3U=pRGc''N3"K34/aS>O)`D!.W[**jSpRem,;
V@N@l[QGd^F0V;SAhVZ8`\_%L;N[8+0'm3R<cJ)mXeANDea5lhrm!:HpZ7e=3'd+:l*O5d(\
^#+EraH+J\f\Im3-]Ar9%VEBN"Ur3bP^O'MLIc=0:PZGh]A+5g4J^<QpT3aR5AFH-u5bjAj8FO
NoT\*HcWo?eR(_&I\g/-IGNeTt:S8+uAsiAY'):+X'K6r+]A2E[2VSN('a*h"'/E4ko'&gr"'
KQl[u5%R3JI;-Qrq'u-;0IK's<!WQD-gFDHR*30?&lW7UH&\"QdU7M<mCi1[GS/Ic`aQ#R.=
2U:nB[_2t!GIu%mJMc*QgJ#IJKA-mT-Cu/96irEOI%BB4uKLFBt>hLYb-V]Abh!*5Z/u;/i77
tS>0`Ei.GJm5Xf1lo!X+]A,);n5+lg<PDKVRMu.$rBumk&;)ppVr89D(TT&t4@0rgC3Q.A=uM
%Ii_PaCWV;VH%E>LY/@&Bro4WSd(12K-W,gOlb2ZhU,`_2[9fXm'Od9F2_tMj9^7"$88]A?Y\
o_rpg3F'Pp_2KW_*%SWE*'iZ8dsJ$$G-50K(?K6]AIiQg?m6]Ae&M)M`pdYJOm@1Fq)ZB?=Z/`
pc+'FY3q)Wq@W7tWo;MH5%Y$+ab+BZl9^@el$qa1=n40km?KalYWSCXAGUtoF$]AoH?ZpEu@p
"Ut=PK9Q/Jo.^lX]Aj0WTYt'U>AM_KmS?Z96#Wbsj]AZj[Ri%PjGN`5Y8TQ&hnn(/HQ*7h^rUm
?^)+3`1f7[[<k:1EhAtAVcNs]A1H'&ir"l,G*n(>f\%\C@<!."`$W1&VuJ#]AQ#KLT]AF-UOn?g
RX]A%l/*nL-Y_faK4VkpfE(#n8Wd^\@oo/&G@1Im'*)XXXNF7&\OuZqjRkuF]AnmV<.`TetIM-
J:q\<fVLZRs[o<1(!kpR[&hY'ebPSSu9uFngLG?/%J=39uFDSltSIOBP$YJY]A?I3LOmicg.m
=3bJ"`hF<P+?nF3SJYh,%epd"]AKqfQ[hKb6%'gk2A*eSEF;!=69f?"=UO4,gd%)b*[[A]AQWd
^VOr+e">Xal9eu[#31pYWVXY@$ab,kja`ZeB5:W:L`b[i8_N1%_5-ni^Lt4W2.l5(X<db2Z(
RFkrCr3\0:`uTpGP13,9B\A%H&f#S,hj75lL0K?Om,.fofV.;dW9cT/RFh-a2Y\b8?CIps!*
849*'bo:K,>IVQ7eaY2FcAG;D2,GC-ldoNsXjg4]AoS,nH22D[Ue@dMmN*)_c`KC*X$dkTIGU
$AQKn]A/uhfXnuTWMISa2RpmZsR-4gV,QsY'_B2"D$B%b:5Rbh!f'>c$IrK^<h9ZAD^*96Jh3
*.>=)@_W0.B[*T'l#7m*h#M\t2k>/)]AiF_[I?UL^>+s0"#;&]Ar,Eh63lo56t7%'it9@'VTkX
:ofaQUcgG]AD$<C/U%?*jmF><pB%d=lhA'Ic^>(g3CS+R&X!YlK1hb6VKrD$gW99m?QeRc.H.
>&RFtoXP,h`T!*\r^P7&S2=qfkJO1&/s.JE/\".!Y3\,5Sp6!7bLN%n!oOok?IM7E=7c!@,"
Tf5RJ"$a%KFR$RkoqYLGXD\usF7X?(em;fNQ5EC]A!>j&q5R,*dQCMpGEY(!*B/7H5PSl,m/'
EM1k^1M8&E)ElF&>TNlYC?O(p4k*cr!pdjo1An1.-Bfp"#3d,ZWX3_LRJ@Z8&5Lf,-4>.2#*
"k_Y*g(5_<47s?^7VEL3mC-*[R]At]A(-pMg(kP5G_>]A=au36++3XBs$RO1>t)VAhB4Y*j5V6f
n[+,M\#P87pha2CN`=D3:)>t8NbhJs8,djRfZjFE>6Ye@"I2BPS73O]A"('/?;EJoj;ugjXg?
kT<E\)EWr/RF'+I[mWJud+rEq$V<cqCr5\H9XCdadfIN@+b&,gKP_^Ha21!u8K4#=K;jb!u*
X,<o$DBm%X^=TuF@o03*M!bA3K_b*M4U/ush)Pj^SE`kYUJskP!h4hE(R%72$/%IDBr>H]A%H
IsQ:2$;23>/@a:e/V['NUbVRNV9CHBBAQY20iSp]ARWJ%'[EP-d`mf1Q3JoFdH0/f(pu\1s$c
ECi.Xk%i#sA%nRukBSiplj\,Se+!c]AB@9l41Q^hCD9X[j?gr91c[nJVpM)8mUD?L'T4C8O'A
TnVK89X129pZS6ck$n@.4Fl>Q"JqX1F382p"i?P*K*$$@QD?:X+^.u@8fLH]AM\-#KsI7<Akt
SoCtS;Rc7UnuHK:#s\S(:t_*dH`/l;!jNXj2U!YNf@6I14,XXqd*V&F\dj=_0MFG@?t\uUJq
A;DW.h8S!X>GX90#784H*#spAWL5Z,JZ7V%XqC]AKF/njD?-T/JG0B25X,ATummOe2if%D2+d
7b@Hh<Zq4TIGfFeP,(FE-^RRC'P@A*k/1*JruoT2cP.iti,A@\pW9EH^.@Isjbd61%LA_lhr
2aeSJ+;:-GK#2[^G/[h(jf3Y`V#R'VX6'.d'CG5pa/+t&Ao-j%+o[4LRC\Pnp?g1R/^>Wq[1
7pZkc!=/n\'X^Yeb`0EfT5cQ@CopPNFO!$muorc?Ip_QE(XN=_ADgu4*#aP;.TO[AG8jQeeI
d,m7LPsn_@aScJW"ndp[#jWo*h"4>dk_7iQdcWr'>gZ,V$!b&FjA8e%EBc=r-<gLX_6Br=Z[
YFaR@M]Ap8O.QKCA+0ak4'%sOHnWL9,1U9XU*D#j#S1hC2QGd%si@C@7ISom"M)-<Kb<p3uZ?
VllL#6E5h5nitAtLP1c7.DH\?3/\&M18Gesu.+S/8<QA)f-0EB8F)AOsE49T#ABJ`]Ao(Hbf^
`8^B@`GI&tD!YdA:=hkj':%i4/c\2A:Z_[RQq;oIIFiI*cO*E_-5No<n(*Rm;1V[G+>*P@Y;
j`W2VqidJ%Mg?pVW&/LWc!gWd$1s6,5TnhqeN+3!2o&9="J9[S']A#9%e.Xu!Q\H=?`'I2,p:
p)7sW8_f1G7Aa/lbaIg@HEn+)?bJ2'gO/MQV%YWteEQeruW<-$?W\rAZ3`4#m]AgO>=YBq@<7
:=CY<hF)/@FT%qF-E5TMS)LK0'_5_<oioo)gCMF7kF8T;QEAk4R'i'=gKt[kM^b]AMh2L_9H^
rf9>No:*p!=1rn6r_r]ABd&KF.ZO:-T,*)f6\U^Bdtaj`;]AD+(nUhsf3ceq[93Mt1>;7E5/-T
pTRe2mfL(MQ_!!cflD$@?+CCEZHK^*8)?J\Q-/dDcE(fE5)7;qTZZWUSq/0=$l9RUFEc7!%9
b9(UEi#RiJ_F95%)pN:V!)]A`P\/iYjdc$g;Gr^bJ$CJOaCa+,:C2[p:*WGLa,Ab5gmjB0e/n
hH*4\hi6-md*kr8-/iuhF$iCq4A+lF7U'BW[K#m^U#iP7-R&fjuBj9Zm7;Ef>a1Ht>il=`U<
Fme"gPf1&P0PV3]Aoo[iA#/MmbC-b'>-dY+8&t6u.NG^228&SM(^99k]A<1fGHp4[:O>B+OEe?
L10NPK8T_rR/>rU:0#q8,i%@]AbuS@d\[9U)/AK$cr8=/)OOdGX*J$l:D2BHr5h$#LBWm3o>6
#r0?rYqudc<%!?Fb=R9a=Ap<%E#A.>N)n_[*9%c))[QHh[Ve5at_8qc1,1%5BJk)+UYPPX>-
U)m)s!q_]A'/o:NN9P.CEnbDZ"6D[U_MJmaF,bHbE*=kY(MKjn/nrW!hXGuFX*AOU?BJ=un#7
j+f]AYV6<6-9,>pMVLgF"i]A1Y5c05<%T8r3@ViIX-PH8%<I`s/`B$L!%_3be0Y:6[a,0B:D?4
,(U4bV4'(6Z:9"-cY&8#Hs0bfhS8_H,-I>%C&?<'%b+"V:(-9)@UANn;JPuT<+57i7D3@r2d
dC`;n[W[3pL@e12j5F.hqh42Ns/9`,ChJFQ,M$7U1>n`WW1k2M"s\H\X(Qel$AIa\c:gk:7t
5N!8S]AUbm0A8#Z0s=n4`<PH>7Ek+#+Z@plU3F=''KILgl/BdC\U'&PF]A)]A@4CD;1BM-.oIm7
aM\Y"c.&YE]AahQjRkIOR@KSC/0tB>lA2Oe-"HN?^ZhF>-;B?,BJ>LtXkr4nDgflql(/s`#as
TMRb[6[j\Lf%X'YgO^@,P_Ds+'P99g)jgo`H>QtpL$A+t#9//bQe$?_e?%KDbr[<<[u8(t!M
g&9>r@hd8r+gatAFk=puDBaIT-[F;rIV0QTHh%h2r?)t(.MN>AWK6&qk0',WiC-*F/cD\!^E
"LBAJ'PSX1Mn%4Q^3U"[L\6MMbi`E0Q*:1-]APcKl<:ZnoMcSbMi]A&_Bhu1^[>tKBPO&$kT;!
>o+^o@Q+>g&k0!40qHB6/$,fKkiBW%*(<JOY&6>[aSU<-4rBr-.5i:gH^@+D(hQC(hcme4S[
Tp:!9@8(/)-4j&#<V+L<D23(UA\Xdh6tVZhta\K4?)tO^PIgq?N0q_$-Y.('l_Mcm^pq_H'a
]ATc(;PKWZ7QCaaWP*<]AoC\!o<Z?)4L9UFbJ)2biOi/SQ)6A\'b/2jn*i[3igZ=ppJ(:^ds:i
_=6bsk9IK\Xg\L<:KO7IEa")u]A7*hCmj9n?Do)PToNglC1L>J.:HN0bV!k%q1L`$OKij"C2/
'\i%JG/D^7(uZm?'BA"nFQbNM`gL1=8[=F]A+#GCr/sLHH7nfLWNb9;XM4Nr/JI9SVDjH@8X+
"-odW<o_@qdj^6]A0L:Y!M]A[Isp.aP/\!gbst?K2FMjKS`K@r(`B^mkh,N;8Fg8li(!E1*#ei
Oh7ZV1t\caX""NpPo:SR)$[5B48;BbC,.Mc*+1-RgHN:%9hVA[R!K"S:sT10(/CrQ3?:F0\O
a=?:4PN\Z88VJ7;0P?)E?,BQPR!_!lGg;l+SM?=dd+E!/a&U1,Io=/Wj%?sR4b!0".+QL]A38
)O-Ds8Y9,\1ugJIh.K$1XA.bHf>"]AAcm"CFWscL!)@j-Veak5P:WHhu%t6/PFdm-\*USs,a<
Ut<^W46FTdGR?K2j1mE?s`]A_tgB#qUk8V:=)X:/H,W'j]A(*dW6i%$=&#glO/c`590>8KESP_
4NecI#:X+,N[C?p]A#F'ZsP+LZ"K\[g#L6N<p'ln7"hr:(kJ\iM2(sJgefOsEPg*hqH.m;pgf
$I$*O?\*PrHGeQ"=7n+U6lbqP=5qT@)7dfc=nF`W'L=\!sq"NEIW]AH$eQ7DpD"REEig#X@7[
?;H">(dACFXXAF:AYnr&B=S@#?2:ope8H*e>HBp,XANt'b^<//.ajY@/P$\7OUJQ-_(;d4=L
-!uTQZ,X$gn$OqQoi-ZH7-0-_DFHf+I@8:>L%=:A`E4ttU'@9a!>^Q%I<c^o+G"%f\gTIEq"
;+)qj,r=/MW>[hQI$#Cm+]A$NC3;f(X+8NNuneQHM=*5Zi4&92(glfct9L]Al,$<T&/uN`a-1P
?E'S0iJhlb<U&>8[+c$O5B)+*!6`+/;%3er7j8gYM!;erJStI!iX$he1muk_kN<2gG47KpJ[
bn66/;7*4a3DDIk&-ucVGc[@%SmG0FN?BV$cSManDX,(*<dDn"kS+$3hPt.=C[VcKR"W3.LB
&\GLMQfl>H0(eLc2DA'b%RB(Ur3@V(X"mX\.bl!\qWbG>fB#jq<)BN"uACt3N?KPC'BjfX6_
p]AWLqq/CJ_D:OTD;?ZD>JBp5^@7(QlIaC[<'RVOup6NT3J1SDkqm]At]A2+3#oer=bK&Q3DB,@
pDc[omWL^H;S0gkEFQm`Mr$F$uOD83FH<@2FZp9@W$,S003aP_Ml)UV[N_Wp*?B%!u0MlVZV
ScXtFLITr7k176Cme<P@NCjN5_G<2'>Md-M8Bh23bLq#*Ra24qaA'*ab_q4I(%soRWG2b`Dk
%N\n+%Gs[S2WV"ECa$G%riaV8M0,K-!_26+E/u50u!Drh)gB4U6ri?ckZ0Ei.]AU?[Zrh'LT_
dp.B_C#37#&N%bBqAif_@.8g^s-]A)/5-n,KP6M`Z0"5GPTWlFP@?b!?Mt:i.;qJ^`[)&J3]Am
0lt>Z:ssr3PbK1U@$;Ra<bqN",E5]AKiA*=Ee)E:Q$nlC^ACGqoV^uFi_Zqj-"]A?T]A.]AHXDWC
HXan1OeZ+/BsGB/inC'E0O5occW-6m:IgpKB?s34]A="=OCsWL.qS-b-DnpD)XBgAfFn\Is#_
jnP.,AAO#Kt`QGUYcARV7FQ*f2(sfNW%pMWR/`<Nl%WhU%e2hPRdA=??#GP,MZ'@gFp@'^$N
Bip?"D)N7$PX4"M'UX[4X;0L/.T?@0Z0d[nt+a2n!:-ATj%-l'erJ_CfYTR=(R+j=tqujgH$
.4XFp+"1DOhfaM9+jW<X9'nqHX2rr-AdTY$>E4,Sb0E8IB<<?DRRX`='HRa$"8'H,8l==p#C
W4)i7[5WJDpFh:\%PSTX7W?45P;,oV1N+0L^NV9H9l&,"Jl>!oam#q6c'0V`ClI.fRlDh=ob
-C-DX9$!WkPp'+knb.j3A4M]AuFt.V*]AnDNG/nP-F*]A2bJKntP]ATPR--\fmNb_X7:=9JcKjPq
p:e29#=_]AN8@F4^&Q*Z[4jln<gA?\t!U57Y<i3PM?MU\N:lV;p&:jY&l5h'q+M%4%ppj7QF4
:9j7W?DkP/p#!%El^jrX'ceeD;+=$/ZO!n8fYl<n_N'DXdhh7mGNlu6t+AAY8B3N]A_F1hB;T
X7/)rmeb]Aoc04/d/KOO=["XVF=WKO#Yp(\Su-FcKU#34LsFhVH8j=*L\h@+BkQ+uh[JdLE6+
rH.?Flue"j4.qE6(im4<T!:h(B2f<o8"Fa8Wh1`<Nk`d>*De`H7O6ghfJbD,oKQ=!@N^t+1/
.N9e/UfA-o%NW,jm\8S[\fYF7Ik-"j't0#^c$a2lO58^TB8"PMX8?dFd+uj$"ut\K?qe.m!\
>G@FjTUDuW%R2K;n4a^4f.<oL,8dl`3I>A*8(>ims:AUFD+5>d?Mo1EJN13!nV_'oI)L]AM8p
kd68*9*jk?;%2.^5?Ebg'$<%)@`L]A78q%U)0G7ief.ulZj*RBqE.Tk4/.]AQkFiARlVl!\Ci?
EXp-YTC-:#c;g/3aoYuI`@J9b@[$)9GdYgFN=nC`0F]AjJH2Ra&*:YI&7d30J!2+B9%<ml<.@
I7i/*:TTg>"HUu:2uL>\qRP]AQgHQeN?,/fr=Dutcb]AM'O*b$K-%>M41K"ErgaJ\?VfMudJ*U
;kn3\hF/#?E"^24r-OjViP]A42=:_5@bqgK$4(H]A2KXlPsLcZ:3K+lFc4+1Q!-VY^ol<CdU$'
u"-ROp;FtP@?K0F9>ln^(@>h&_%RFhs7o[T,l'-V*<:I[i;oj.hkO5Qf'Y;M+%&Foj/P8S]AA
niicge)pOTNQ+'O*IldJP&oV.)#5SFNd,O8-&gi8c1@Yht'FH]A;ae_pS+tQn77n%.]Af!>W&I
auPLeH(bY-eHUciOD12"d?>;Umm-f?Hoq'Xutahq)'d'Jn6D+a1d<'t`/m1]A`$3MJg+S"A7[
0&75Z[!!\mU[8YmHpYZPrm*64%dg/YN$)G$7mYL)LAHdg#4f1Ro]A@F'ENLAiSIKEP#t.k3%Y
1fn_D(>2FEi.gM6^$b;leMIo&^>'b?:&o[^#H'qE$DQ+&K4+F8f^8m(mMN+7QQP6s&m&S13D
D=,^pY#3-ShFTa0k=ZhMop^.=V+>3'[/X^7<cgDB?Oj=>lK%am")H\f>o@#Ncrogo`&t%m:m
nWtl2SZ)gWJreZ<,fa-ZP%IcA=l*l;r#i$WieU+EF><M2po(LBm'4LCDIh(%kUW_&cfRqi:\
B]A&8PPe_*-oS%t.NEnrup9,mR3CNfX>U(*l]Al!'73o@[dA5RX%dZs(X8-(4i^T(j.3N1c75V
H?A@j$lns))#iQ._mkio58Zs_E'cAL#G:>kcu',$h#iR]AkqWd?.\7J27O,808CN.`iiU_cS5
E<ua]AqMq0E<TUCIS(ihq/I83Lr[Q([SGOi-M/B`Kb^L+tj]ARIQ?H3beq+_0HKlOr72I%!1X+
Hql_+c2Z'@M+/m3]A:;:l-J$T9r\Xu+Yh]AUj/6lLf([d#?3j=!,uf]A86B&'mJph69.n<iQ3^*
pRfaO[YP/g'll$:YuW]A8$C/i$FKE(#B;".r'ppeP\-A7aBs:qa$Ms!(:tZs"BpH%T#kD-2OQ
f3fP]A@M)^2:aPEtb,70i)Y&"P`j03&gd_s?tME%4!B@QQEaAl8*%>tnj\qI$*m6]AN?P[Xi>+
f\0EKlan'IT\^H_(S0h+KX[1P*QGUp4R`"L1+/D1qpkS;%/`02hJJgK+]AR(+DL/6JaQ/j)D_
AHV:`<VA=:iR$[\\@]A^K!8)N!%HRK4aITh3.Drm'WncgGt7L>tkP%i(/g_,tN=mr1g;ff-Jm
>MHN"<l.SK%DI-B9U0#2WS`g#d`k'\T._-ir4=W=I2@5PCJlPJDWrjdd'<2bu(g+/9RUBfP?
rU]A`a5Yr&ItLRa`4PL15U?Y+A\]A'dk.S'^i-pfu.Uph5(8SP<R+$fH0=?3MS)*Jqna[NpdQr
>C0)i*^*oMh_351e0D&6KgV.0"JI_Pbq`_CoSPr/+o;<IO=1Z>\\!lHLmo5L#jRSM9<`d:<.
7!W<]AE5dd<IX>2f>RG:Nc^[\Bp#A-0mJ.5d)h!En/#n[^`&T!m)]AM0iUZEgV<a-n?#K7Ro6l
KI5mhTT_Ss3&X?rJ+Zo-H!do!E@.GDcs4pPO4@jtHiud71n#a<f^b6oQeHU%VD1b]A8\TSD+p
+0F7E4h8Lp2Yo3/\+$m$:kD.4cf-HI]A'aq1ZWth*lmMp0"mouKdb=YRFnMK7Kio*#,Qe1P,^
=c\2b*0a:b0JjWIIg:76WIAni[^DKmGp:C_l5&<?RQ_B8P:T'@"h8YZWF*s1$Rh28nGU`IoI
5LW6RG[D%%*k<\%`3*!?0OD?F9:jSBdbJ%&5Q]AA)ZT%=H81:=CgEM1Hf2.bI7_n[KXFG]A$-`
SrCVq&`\gjgBhI@q5IcT3Md`'Q?\H-!nTE3(#mJ*Kk&9q''EgO"A$3$/&,OqU:nka_/SPm:U
g1@Ppu5*Z9/F;LnR=[-m?R3q9,m(`p[?eGa"P*nl^j#i'C30HO^)6/)D]AnkiQgI16i\+,a')
pkS\ME2T2h=Iu^M.O!-=e9ld<0Y4+6%@J9H-F?D+AR`OG43@\Q*7jh>&Xcl^XV1e,a\c`DZA
eQC_U*gdDc=Mf!0pQ6]A:B3k=H"%>,aa7L7NX!RRCOSRL:\.=n"_cAlnX$-Y5.<Qh]A.?b`%";
T9FdCcHr#:0o<9L'Od3IA#hYusSrSsfPh]A2UG?3Hpkp5%eg0rhCh%)Bl]Aipu/l6?pX`eJ/W/
>hrR5o\EPbc,J8VI\=L#?H\G11H(!)J+q>OIK:Ff4(Y7T1&n;Lp$_$CG;M:\5:!>WVJoP3ZR
m%q4]AL[#c'nBCnVIYAhEal74II@YJ(m]A/;-lY=L$K&!::,#1*_Mpj)Vm[Tm,D9tB90SbPeR1
cQ#="e+B,bW[pO%?(stM>UkK0CH4-3'm0J*"m]A"n;@<R&1@,t&?!:`O%oN[rO^BdNS+c(tE%
f=/&&\cdo'&ekg(>\_[/Gi(op!B7_2uVQP:M,o\jgt;(OX=utj\\'Fc2u%-!<RR="20^QUDH
8B.p#FNQ2%Q&gj4FSAoqAXp6E$LNJV[]A(Gdt10E)o[8L:-op*gJYC93a<rSf1nL%E$M;QG'J
"Wh`)Q,.&9.LOeAo1Bt%%.1'+?)228?;RIR2fOhKo,_rZf,0]A:9Ujpg5G@$6n"s^7I"g2mfk
b60:\2_iohlOj@?Wa5bKZS[^W&W\D=?A&CW4f$e(9S=7J3jYc=&?k5>!d'Q9+r0M_/KUQ<6>
!=ZJ()8E8Fq&&Te>3)eMf,2699)qQBY\a@Y(]AVZmdC5%Yu"XR50d+emM_)KLUV#hHPs4ac^)
ZmbrCi3,^cq2p!qG\QI9l(358Hmsqm%3*HEaS-4/.((dM&4f-?U$c945Du=]A5T4Sk&F@rhpq
)/O;j@4dfl>6WA`-kLFFU?)7R8LAKB)0WLTqk[_B)VAD8gl3"KmQ\N#[?s6k\iSWj8.]A/6iZ
/DPg$08^,AFUc464t7VX<h"9$e@'jC_q5shjkt'A)o.h/L[3SO8d?uI(/26mmn.C;VX[9kR&
+))I>`GoSeFjPjmV1pJG.kRY`6o.Isi9EW9JX9hqf)f[PG0t5taSl3ogSu/TS%QYL>Of#Ojr
23HC0CO,jo`[s3naFr%8#;c@<cH.C)s/$ALI76:*WI&ToS>q\@ZeMfU_<UAU4jDJ2saJ\rs2
K"0TEEBFSfrO9s=aKLC3L]A^(jZTq(C[jJ3l55$*&paFtAnbg"#F@&E/hb,LJWWat7:b%^M3:
:&=7;DS]AKE0Dbg'"*>pD68h3UGtp+=!k42]Ar_BG?kTESO%/hY`5Kg#=_]AiG=19qYBg_Qn;,&
*9n<l(8Wm;QVpUKb8daCcrUOWWJ>oBoJb/^o.TStNfST)oK8#!nY?(peJ2tdR,>_f3nDEKe>
&ud/kstsTdM.d7^_/keuNuu0ccCPNtONjb[dQN73<4"3j\5HD/G/m`t_aS`;+>ml.F^U=6W"
##jnh%[2':$B:]AC@r-<D$PKSWVcK'_tAq]AOn+\+5Sdi>UbG_8Y\>(J:$[NL5OB5"R+?^pD]Ai
0^9`M9D^4X@BeYk<%,jm+7YLeih,*(1Fl\qY@c-pObI9_blNNoJX=D*PLb"g4gOHArR<gko^
QSQVqYq<+hu0qV9-anhe\(MBU75G*CZnVKbYVK?)!o*$b/Ib1%<:2eLseQ`2)Ds"o[$o*kHG
QiF8&09:moIG^V^6Sat%/BLdVZ=FDQKJoN%4E_nX&nS@%@iJ>>?'_aNBN(3J7>8%+K^:/2Ll
d$&r2pu-T&/B%4Q#mohrfDPmsgY6n*@QFo/Md%4RY!Pf>`XIg4s,RT!qt?&i_R0:()t@KU`=
^Vb/tt,"2^\)Mn7Z[&P7`,jIbp]A[`+:b`uZZ5Ai+4KG$B;R-!bKe5fF>-p'L1,\K-CGG,f1:
2Kq\PZA,95=5pG;;u1A_?i9?ngb`oK%BP6Fil6=&uJsur3)H/.Z;e^$qf'9[-lLq4U.?ge%L
&#"PZ1>L-G0=_ZtH6G*M#iL+A#-"/nM_9C<q<Gb^\^1;h/'29]AK!Sdq$XH-<G*d&>0reA]AG>
>/H%tAbn5J$lr)/`9k=n?1@2OMUeulE\lekFgZG`%V+<Xk[H]A1EJb^G+1"heT?8l_>'Xs:rT
CKqc#:8<kA_?&92W9J['EO_X_<0Q_$SMo4Iu'4&pDNp0LFA;oiGbTP\5RiN%3&j3["uj5J_N
_aQ$Rj,kP]AE\k4^[pumZ/m8\pol<kIHhM;C_[fc3)FMK&cZuU_0=pt2.;sKofe`_@-Omt2Er
*1_<9a8MQU^)?r28;hNU9PhWi#d@8B[SYB?g6d$f.]A@pNllPLgQ>7g*9tt?Nluk`e4X,B3p3
8u3Ks0^1:=C:7L[5VmHW3(e#@C%31([]A)tO=o56eVj/3gIFb=iuMSM7-kAS:OiMa,K/LZP-T
_d$li0Da_qNu4E:i>fY_&*91i)H_I@eI*q\6tqu\/$FEWjn!uB,=Y7Gql3M35lF#-/H=Iih1
3!X[AZRldTgpb\s'Gj6p!K:5sN>coA%gYS7V/mOA0(Kj'/;-+')Gt)dPoP^\WQKRk,C<<arf
hWI;220Igen6Q[+U:M`r8:huR>"c;5RK3lj*.W^tugH.^OBH+&U1/1Sc.Ag[-jYI%7N!^RuT
8u%-c/@%P-El_,AeeS6c98k8?ij-MluHM:>SifU$.>8S<Mk%<]A%WLT2dLG`n**O=pu;1hY$r
^6*3&C.7PT91.B7%6GuVA/FUdYGR\eo^5"_&hC#BYCQq:4N/)><$_[Y.@jO4Ko7[;i=8aRAV
@qbKNO@ah"-->Y!:=PNA2k0);7NU?58Vi_=d>_uf*?l/`p#b9snD`,Cf8P8&UKc_4*@@l=j'
$?'2pGA,bR>C6qjm/p<7r4U\hD><RMWRXAB6`s7c7*H\cB8mP6KN[`3tgT$IQDW>iIl:n`)t
ZaG+lIk23-u)qZ[b^PTnA9t#C-CZ30?b%HHu97-;qHDnK>r55kg:Gf#I)K+L4Te-e$[R8K+1
&D5(mSdMI[@`*%j[gP,-]AP^B-'ZI8`(UL3VZMfeGf<9o4Qd;j(\nh>WkI8n7JIf]Ah9-b)D;H
)n6K=9cVmf<,cXU'DW0k6=!PL9+T-mGmV'q:Abpbc#f6q2TBr5YHf0o.T`'_=-pImF*c!X>I
gU+d=Gbc8-ml`;Fc':Yc$,P?!_:q&II,i168$*iIBca_O6l3T[a$dhpU<R3h>,sFWA)!5&6C
A:pNY$I'8&QB3_IbeAFn+hN7**?b:JW"&BW>X\+A]Ac'Lf_O9>E,pLq^V'6ASaJeIn[=ef;p_
!Bp2i(pU^e<Vsb?G/u>GeCBX/gW;F/j<sM>KU:'T`:-"U\7VTRg4!=5a6Qh1Jr*7o,(PCr<[
O3%k=_^f^Ili57F.c[Xk;<FIiZY'QAp9uO;]A]A<Hl2uq+c3a.O%\rS,=+":c3>A!]A0&HTGcoE
X7.UlTY7/-N%*B+Ibh2[2aO'AVX+%_+(mHi'aQn>Ve)A5+^A8dBJ?^tPs]AITD=/Y0dDG_e41
'q%8.Ut`.fnA9UXm:d9IHTMWf7Y-l9P^+S%Wn;$Ed&T/q.F"@OW2?2#@o#ge:dao[-nJG?(N
Z,&b-L9KG`]Ac6CC5LUSm1q:[3hh*jm9u$e8cM@rpX`K_"u_d7m!>=gCE&_[-cTas6=sV:,tB
c9*WJ!UIIFI<>D%r<^W3-YCEE.JkNg)I\\qV?%j#cE3/%4nYjVdobI)!%3k`&(15N?SkB=:"
2ErGN+n(<F3[NX(g7T-0"*]Abm+h-=W\2/jhOm^-qA7bBSbgqjcSoM_auM';n(pp3hJ1Lkg(=
9Z^0pZh[,)\4Oim$,Eq(B\04q=D1PP3MFER7Jb%=A=,VOF;#N>b='6!gtfp!-(+,C):HklU?
9S+$F3AN5JA4dmBFAME>2G=n;h?b]A]A2P#qmV0l'Zlmb]A<V)kuf2'$Z-=b-\6b!'P(a($B[k)
joVGM,ngMjF<3'=i[02nj_%;)?$\9lJLuBV*KCL<@!7VCD"[$C6i-M;\A\N5Y!82*,_K%hd_
T$fgJpG"0Kc)U'#CLBI+=EhKks,P\Lij]A'K2V52`[`c>O98gY:WJjZctACIF:-^sTB[G>cj5
V:Z[O@D&L@2ppoD18j?>.2QN0Sd`#6pVJTp9UTM4gsag_'bi9Tp$Zao$u9T]At*ph\97hmDH-
DlOkJ?q<P-H0*'c9/7@e#1nqI]AO8`q7XR:C?3CM''Douh>pj"D/QS?E2%8aB=0i="/i)`%(L
qS*@-HmM&"$uP+#TEQgama;0_-"0S)Ee<;"]A:hT9Pl4J,[SnQ;'T\4>F/JQTBJ$ancnp8sJE
bL;fYkEP^8).<4SB!m1J5"/:M!&^*5FPZPkZ$!<GF++F6o*p=#\Uc0"/7G:ntX90dKe6)aj`
dKfCG/$+n+(=XVDgns\WF>.CJ#h@Y7inVc_u)JUN5qimtS_71E31kYDP?18>7-H1bS[=mXoi
XY"AFCII7Mbc*uTM'j]AC*Y.=(qtDF8Q+O4)-caOGD_u)\#T5PDnbeR"<@+-Xq;0[XPkDEb-Z
A20'JU+$YMl\FPI^_?#rN[4?%tAH27&QJdofC!j1(/q^)Yo$IJkI`Oj2LjP%6V2'!s2:'j]A7
5Mu_t9i%aH7Whh7/-F+"b7:^c:hkL#bA/ijj'K+:eb98jM9Ks4H@;lV_2S;7CHA54FG]AmX!q
(B1c@Odu6M"lAij8Se]A2ME3)_oaCM>D3Y0Hr;[OX:Z47WIKf1C9;`D!EWDe]AZ?adgPlO*6u3
G2uM_a;"O3?HVtsi**0Jtn"siiAaAB]A*fmXVb'nKj)H/G-Y?fTYGqXf6.6&(EG*3Fj@06;&h
=1+rZ,<jg3tiMmNfdeC+OZIk!epaf=!D\m7l!A#6Y572P0GMIXP_ISU7S2>'4+=[\21gS"af
a;j3g21"Au!iRW(&<:-'jg1049G<`E+aa)Zle]AsG4HK7\^(b`As?2pmtpitj."`9rG]Aa-=rg
X:N2/lmkW'Mnu-SpO0ff1+^ThY4F*d+Sm>cW[[M1dCFi*O6pCoZ0:KG=LZt)5.#`>r2j;fG2
N84fY/%8l)usE&Ot;Rg?(=@54UDMG04q1O<*4S*KtI1rpD1WQ_'KO=&5ced#C@##lW<#fl(V
Vc/Yp_-B^l@J>E.LZWJ<V"pnIlhZFO*Q?Y"lO*/%is'gTZnqhqu&q?-%%8Qol/WZHa:Z&1,i
</i5[fq%HSE&p,OE%n7'<2lJE(;U3G-5YjmF4[uS6tp+p+mKLNIjU&.`3PsNq<_,FEdOX0en
bT72'a\@S]A@)@._.FT#.C#H@h&gajatJ0><)[]A!u4"\^!4S_Ipb\$,*V34>g44@THCf)[3LH
DT'GP9ItPK_*H33&2LWZq9Rr9aU7:!W*d4nU"<U+8uV7ebC\U5\u'r*Z+*!B9'j_Mo=pdr3s
.%)0fcXK1?oX7nk6J1Si,'=QEr\K*Dg@Sl-:*)VQc9tL/Odfh*M/kI;`4)?gd*K\00`*co7X
!oI\"P&bF3Mj-S(&Bi'7WY@cM.G^<=b\PF#_9r@+OW=S/6Vi7Hn]AQ*9+Ni)H!/1^flP@5D/6
%o?&Vp0RB:q-e$JN$]A,W*l-656snM:Y/\%IDj5tE'abB4W[$-]Aen!<-*YH14VmC+8#W;Hl&"
(br"(lXeP)d=q1lC$PdH,"K:V16+*]ADRFXn8BUFd^4meZMs]AT?r%,gN+I;'+[a?;TsCaUTtS
"u<f5$Mr+rOn^/V*X;5LdE1mAZ\6Q6L7ou`IB5O)BjsW:II@<I]A!u</3.g;eKi=;t>7_OU2_
Y77]A6A/?#-KA*TKi^'2()(Z:"7R_n8Vj<020p$CB_,m>BRr#(rh%#JBW@;WJ$#E(DR-J.ZKC
o1T,Bl1L+j;:VT!hJTA-HXdUuqHo/-#;>oI*M.gu#\$#WpH#ci^$tY;)Q0iE0/u[TK3'>[(>
=?'OepPt_qX!o"ctMk!_Q1Dt.i@m9cO)7D)cXbP7941Yg()GR(YJBLo0:;pW>aUYkrt*5Y6]A
s7GiRp*qil-'IsJDbC\?qiUa#O.NUb4u@WmUjYW2;I9ZiXdB,+[_77$7s$u^VA&L//6WF:at
M:HoLqZYWL74%0=l))rjKqo`8^Oat:;"M3SHtMCqlit#W8VltAkEefT`&OCUHW_k,Eo&a\.6
?9IBUUgDp"VL!fH$u[bq8;9:M9kYnP3B3iI-0*=;UZ8`enHRJ!GnTQ*aTf<7dY'IZJ4eh=(F
E_cosTA]A64sF/"s:9Pr/Tq&r$e?Z5TIk[?j.bJ(XLSNJ<Ob@L#%gt7o_TPdbt^Rkth'(h(-i
`LE@%0\'2Zs7'k=l3NAO*H[*:g1q5IkRY&>SJ^<>HP]A*Mm#.lk<(G=L$/EaJW(`7FqX%dLI7
\H?>65oBVubuoIbJ<%@%0cJ$C,FqT(ZFX<5/tC%oD[6iL\sGj+\;XZ`0IkP"\+N96D(*JC`s
U4\'o*ilm-G=,lqJ./dTl3?nIj:LP"Khtemh,i+t8j7E(bYt7WWjN37%E;hM`L8TT"`>NJ]A6
6@Og%!ZSF'e-<6TXECq)b(p]A<2CXM?GROJqfI^fI<t%A*:"8)lp0u3@7ucKGdU>:Y:-\!]AKV
K!.e,8"PM>0gjVinbQ)]A]A0Epqn:ahJW4\<CjC16/^i\rX:3!MPB)Ej*_Ih&W9`)A_f\ru4N"
`,e=GohfE,`7p6Rg[E.T?TE0Gr*]Ao&7tO$H"231c.`JiC9t)ImuueB@'\Nus+#+A;$/k*ZU[
KN?U$J'>$Yu6620[UfR$hNV,*p``$eZCGd94#@8G#;bYk^tkAfk<r132EJHq#E%S0$Na(,@T
1+Fju2[tHElQE9Z'A^kpmGg!i,]A@m2hJQ_sIlrJ?Ic`(3W"_CZ!=[>Vfs0bLr4uOPSHf&>+'
]ALYYs=?:[LG/<1-NDhGeqh8,Z$)HPH2r>7Ug*fJ/kDm^u;hb+\K.K7t5,P68#LOJ,nOYL3np
bIKDJHaK):JKC0(_%m1iKoQ26oKIS'fAN-PTO'`<T5B=Ur]As<)NlZbF'*'huV&2-aTL@G`#5
.V3_H_.Vrm7rtF<n^%nCL=ij`h!Ljq:DT0okIB7c.C[&-&r>ddXYeH!I-:C;b6@#3>YS2#@4
%R2Djq;7]A#n6S#F_%LU66=FJ2SA"kk`)`31ksYf';$rWSo/nBqFd\am(`CiXfb-4C&h$o%=Q
'j."kb3<KYS<0A@gu:p)6_'Y`g9;AM]AX"VrA)G#an17GQXKTN^He\/(+qq)q^+$qGG3!<X/k
A_t&,D]Ah3_O,aM*@R9#T4K3e"<'Lj3[XqVoBj7%#,b]AfQa!2CGcd:D3$nY)dBI6h"r"U%go9
>@G*j!Kj#NQ,#Z:SkaTFdg+BW@#H.p3he>=A\u^i<c$YkK.8Tu\1?DY'*U[p\$r_7pWc)QkA
qkKFqZSe1Q>r=8<;:F;[j5t*2g9Cb\k=T!YjRJaQ7\X?;q1a):L76'og-*X'G`0a3'SJ80@:
XT^1gU2$gSq[USi;%[Q/YLiPSi?!W4f%<7]AMI6&.Hm:a+`-8s-#sDX1:10^Gp7bKZRB5geIp
`a??E3'oY8kUPapgo/3eP&[b5CiWYP_0YYMqmBuh[BlY@-e2.Um_\6?00jlKqR6Cs>lcS@m`
.>!7J#7\HY"3We0!mQCmc#!\W'^Snd]AQei^PRgH2;Ap4b$.Bfeb,DUuFkCj%kn!01hn_nj$!
LOX-QJ24/FE!A="5ISka\6++Yj5%%DTmmdLGQU($f>;0@"Fb)TDEOD#c+5=>OdBdfi]Ao=``Y
$M:nR&5E\@9pdtp't6bZ$3!)ItNf5+q&Pf>(B\03HeA$\pY<K'-H$pAgZ#mFgKn(ghZPVSdT
9L2G_U6Apn#"92#6_\El0f?WrUB%S'<+jhZ(V^,:(sC,rhY8H6kYUr_jBC^P1/`&(htnF_X9
4NL3#oFpJMl'BXc<;%!Uj4&D^`ce7(GINr&LSaB790-N]AahO1@aZec?,=)(Z+BRd[jLNrkq_
%bD[lmsX0N);fbkn3n4Jd*>b\DWP0kD)YYk?smf/C0(c2/KpSHpUeV/Mq63Wde/?Gct7P:g[
_K:+m(0'-e/%2/P=Gh]A)!c"2:EknqLM:'^a8cE4P8M[4P&pHmcHdr0]AqUdH[NrjVh17T03^8
Yj^jSrpcp"Wct(4eG"=Ht+ZKGE4>_FtfBXbUP^$C6F%b*t,P:2,Y0)>(;=.NN7idEF%#koNm
j[qb&AS9:D`&kMC+n_TkY(O:uu&B!6UpD(UILY3oGdcdsNf^KP@4-YeOd!#I;>s1m$.Xe\!8
b)Ug&V]A^M$iM9e7+F@0XN[g,ME;(*f+HmKo;jsGWW=Pm!ij(CqTaNm:q4DWReEn+F9D2qY&:
r-4S[".q!PM8uW$!ijnO)eB"RJ<<#o5$7ZEK;:%L@W\.bX$&2F]A-:=jhq5mRU+%7__X[4^#=
)im0YS$N["JWBBnF1Ps0Z2J!p1lV`$:>91U4Z9`7cU$K&(g@/sJNFTfqBnoeuJOT[lW0AVZk
"X2Lb/i;ME*[6l`9QFO$:9TO40pR2H#iK+OkcX$'56)Uc2+[->=o>9Xj!#sj7_!O.IGauSbE
YQ>UODpKP#)f\"q?NQ!TWpl@Gq>"8u^DW6,Z^UFa2ZL'i.^'9;PSU6>H7rR^OD^&KRTl[r^e
EPKMNj.nZH$&[aaikj!*bB->u3R(rbE<PkH/eSCucu5bD?@p6.?&Q>WhsL5S^/7a<F^KK[+*
%8Di6W$V)Ss&#VHflj0_?WNqHumePuLIEk.m!7&l,W)\Mb4[@:26L^EN!V6OS3Gh48FZBM#5
VdC\=s]Ah!XPhgW410AJFb'u*iAJ5=<YB4r1rNf,L._&+)8:'9mZEn_,TNL`?(^c183gO3Ngc
7nmAF86AmK*PAq?EX2oW#P'$oS['5kIjs]AAR#]A&@ZKW%i5%K?q??@J;^)EA;SJll&D=gX\8O
#\C;2-(_WMX6#W/)XIN-EqZ/NptNkYg<@j:[tjq(+obs$#4$]A1?N;uVakB4-;=)`Z8kYJLQ4
?Q.@lnUUY1^OJ50&'`h=TFh#6AL]A!LRGA@kXRS5VLD*EVao4Sr?H>$Ngjh%'7=SA#2'r5GlB
VJD[dNrrlOa!W+_8(e%ONg@)R,8U@B8Sf`Gc*7K8BR%R.M+IabXO<>OPqjSf(tI469G.i.#C
fW)k28&4cZ5Z-Lla1#RiOngihCm:+md@Wu7#cppi4U#!X>ib7PJmbp)n"*+b$"#T+G,[U]A,k
Qt@X[jbcM@EUr1ajAlpl7d3c_PQ>MPH!EYX/lp(2ceXS2.BPm)udBCR12np;uL15,P`-$42o
@aaV9NV:q30i`s)o&BZ7p@I21[Xkl2fn<9&f$!+9sW-&=FeMA0lVJnCRr>I$jS$*CRlXCW9N
$SrZrG`g9uI3(UGZ3^\MZt?#:b&9!TWi,\(6Oa^\V_;]A\PGhLas#3gRr3$W\'\/(rX@#\%6$
e3@j-[l\4S[4&(-M?a7jQs'TA"a=YpA7(o+6]AQ!*`j6\GBEG'EYBnml15P5p,>VK-k5J&!<]A
48%`TVkJ@mUIl!8)1YnCnE:W*u1oJo,A1%d9fDA8N7hTd(Ge'o`?eA"2c=*&t_qo`2Cjn)O9
s3f-+\$H<R+*#=OYQhI.u@&O<I3`UEm8t)H,#jgU542:'\b\Q+/@q(b<f,A)hEP*oGe[Bb!X
\+&f'2GplRGo69KSm87K<$LoG8cGF6EiCLRqm-eV#UPGDkBJMp!j$q_blBVeSU*".HY3OpaG
qn8W6'#>g?gTls!L:rhcYn`_gm8tr&UNm,ZLB=bGM>rqGppGgX%8E51`6FKR#P!#sJk,r\K!
%&dUQBV_R=GjpkAoK+d<Obt_?IW)eC_E+.d3g<Y_(cnK:R!G*;?TqgH/AkQo\Cem>?S5?mtJ
(MY7O/S%i&8XRu/jOXci]A``D\_Q\uYP+_h^]AMY=7+9)LW8^VoP@e6(V5!KmWgcr-jSI!(u2\
2?n:*4=E;HrnqhAaO%"mRo#1p_L1+R\Ed'o92a<F8[)(3*AX5*,/^':8QnIfoj^6<SoP0OGu
MREU=;;cm;lT/abnNVm0I,X+Y04.@Oe+k7>I''Ac)0rHV]ATqg<W@MSGHuIZJi`Ju5:hL_TO&
IhkRC5*_)&2:Vi;!oJgqGT&]A<>M?Im`1`a9O3.?*%0*U$cN!JZgjms7#rg8IQoH=KYHfSBZN
;;(Z+f?HFK7K'^>kaH'mAg$aEq-d/FWD\W=0>W^@2d:A(56%N\>=5LkamP:Ll\;mUlI;*Yo;
r4L1TS65U93o*BdI-h$4(N,H%#c'gnG!$Zfu@,phQf%^&Fmuiga.$n;ANfV*6$H#o,jBAOUq
amB=Q1Y6sk<7e]AYPu17h^Z'8IQ'!%CkT`b5>do5`G7TG9&:W':)@bcFip\Xl"ccT,(U<sQ_4
ANel7/Q:l$Fe2H0/G@3etTSTq.i[YSReel*pVcLD":AI&iD]AV6q0p[8\l%lS*B[Vsb^(R$T=
%\@lma&%#32P+p]A)6L%DGoRKin%/GKUa([8%G\bp#X09cIVtR31dS$FaUSTi@:iQ=9OC[Cl.
0Is>E"\+-WKsimqi:pCog7L61>P$>La=if8s!Vbql;<pJG,+<,!4J9<fdMdMs7?3FM9>R/'t
Im>iiJ,4cC>lgZ#XPI;gZ:B3gTL]AqB6^M%Sa8U;\l_4<4Y2`L.sg>p-qGSS*A>64u;D\b=.d
;<Mi&2iS0:$7ho6l^oJICgXMB#4e?2;\bS4&Agn&7C#$gJ,hJ#0oP#%W::(I'.2b')iL$NV+
d%+JRDh0nV#_`#Bh;_7'K-.f[7/`"`cs/!3rl<`0M&^8$*T'_!c+%6#V<DcSS2NUh%7o6\^C
R0anqX?S:J9e]AT.$fjN$[)N2\#F)[os";A]AUf:C5mkJGST8p2S2,nOYCJ?>?_rCY6psOg%>i
Z+9[p@+W;6&J*VBMc)BN]AlZ=#1c%"]AdCqK;op$Vem/.AhpZJ]A_<nh4tm+oWN?0u[*;r_>,B6
R.oi[5`;G_fM2L0mZWnPcjPaE#pV+IQj/Cr]Api7PLhd[lUM,.,"1"d7R_AH;pj@K/`S)CF8&
`$E(X_1'f_4MEf9&:V*bI;)oCPfts]AoSs@^Sp,_)`Ja!eGkqFDQpc?6g7rY)j#A>S$o7#MQb
*Im1<+qFP3.O9Nir6DSuk-Z[rHm&O3_e(MItV'&C>d<9)l4pl/glSlbu^IkMfbVYn'EZ<@R\
)"oNC_7uUk[a*B5P@/EDp8WE"4H@"tcHM:o5.$gJFP^7D':i!LmZ*R%ofW^jEotJ>7\Via4W
/Epn!]ARB:j9%.#>+98%W)j/mtGc%\aDnqL?2^_^\u[Ls,6WDMYG4.='[EYif.+Jr8%).'<A$
dgGT:V(=');YW;ItR=]A2X.V9*b,#Wp&ACK,]AHro8%`9jZ1<9`aYig(:PVi^]ArlK_efVgh's-
?mW4UTVYnVnACeW`h`*@N=CJBbbdP]A]A7"<rri~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="136"/>
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
<![CDATA[1143000,1714500,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,8640000,990600,2743200,8640000,1028700,2743200,7920000,2514600,1333500,7920000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="1">
<O>
<![CDATA[参与活动人数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<PrivilegeControl/>
</C>
<C c="3" r="0" rs="2" s="0">
<PrivilegeControl/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[新客人数]]></O>
<PrivilegeControl/>
</C>
<C c="5" r="0" s="0">
<PrivilegeControl/>
</C>
<C c="6" r="0" rs="2" s="0">
<PrivilegeControl/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[购买奶粉罐数]]></O>
<PrivilegeControl/>
</C>
<C c="8" r="0" s="0">
<PrivilegeControl/>
</C>
<C c="9" r="0" rs="2" s="0">
<PrivilegeControl/>
</C>
<C c="10" r="0" s="0">
<O>
<![CDATA[购买奶粉金额]]></O>
<PrivilegeControl/>
</C>
<C c="1" r="1" s="2">
<O>
<![CDATA[Number of participating activities]]></O>
<PrivilegeControl/>
</C>
<C c="2" r="1" s="0">
<PrivilegeControl/>
</C>
<C c="4" r="1" s="2">
<O>
<![CDATA[Number of new customers]]></O>
<PrivilegeControl/>
</C>
<C c="5" r="1" s="0">
<PrivilegeControl/>
</C>
<C c="7" r="1" s="2">
<O>
<![CDATA[Number of powder cans]]></O>
<PrivilegeControl/>
</C>
<C c="8" r="1" s="2">
<PrivilegeControl/>
</C>
<C c="10" r="1" s="2">
<O>
<![CDATA[Purchase amount of milk powder]]></O>
<PrivilegeControl/>
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
<FRFont name="SimSun" style="0" size="72" foreground="-263173"/>
<Background name="ColorBackground" color="-14669005"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-263173"/>
<Background name="ColorBackground" color="-14669005"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72" foreground="-9470325"/>
<Background name="ColorBackground" color="-14669005"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<isShared isshared="false"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="0" zoom="true" refresh="false" isUseHTML="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="136"/>
</Widget>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="report1"/>
<Widget widgetName="report5"/>
<Widget widgetName="report3"/>
<Widget widgetName="report2"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="960" height="540"/>
<ResolutionScalingAttr percent="1.0"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="JAA"/>
<PreviewType PreviewType="0"/>
<TemplateID TemplateID="22dd9eaa-5ed1-48d9-9ad9-19b58cb72083"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="8cf5935c-f059-4005-988c-8b75842ce14f"/>
</TemplateIdAttMark>
</Form>
