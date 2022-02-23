<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="main" class="com.fr.data.impl.DBTableData">
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
<![CDATA[SELECT a.*,b.数量,
b.数量/a.5G新合约 AS 完成率
FROM
(
	SELECT t.*,t1.自定义分类1,t1.自定义分类2
	FROM 陈洁_终端氛围打造 t
	LEFT JOIN 新单位信息 t1 ON t.单位 = t1.单位
) a

LEFT JOIN
(
	SELECT t1.结算单位,SUM(数量) AS 数量
	FROM 利润明细 t
	LEFT JOIN 店员字典 t1 ON t.店员1 = t1.店员
	WHERE 单据类型 IN ('零售退货','零售换机','零售')
	AND 日期 BETWEEN '${start}' AND '${end}'
	AND 商品全称 IN ('橙分期-新装-手机-5G','花呗分期-存量-手机-5G','花呗分期-新装-手机-5G')
	AND 单据号 IN 
	(
		SELECT DISTINCT 单据号
		FROM 利润明细 t
		LEFT JOIN (SELECT * FROM by_sorts WHERE 是否启用 = '是') t2 ON t.商品全称 = t2.商品全称 AND t.商品类型 = t2.商品类型
		WHERE 单据类型 IN ('零售退货','零售换机','零售')
		AND 日期 BETWEEN '${start}' AND '${end}'
		AND t2.商品属性 = '5G产品'
	)
	GROUP BY t1.结算单位
) b ON a.单位 = b.结算单位

ORDER BY 完成率 DESC]]></Query>
</TableData>
<TableData name="表头-拦截" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 自定义分类1,自定义分类2,单位,单位类型
FROM 新单位信息
WHERE 营业状态 = '营业'
AND 自定义分类1 != '' ]]></Query>
</TableData>
<TableData name="数据" class="com.fr.data.impl.DBTableData">
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
<![CDATA[call unit_achivement('${start}','${end}','合并')]]></Query>
</TableData>
<TableData name="人数" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[2021-11-01]]></O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O>
<![CDATA[2021-12-01]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select 结算单位,count(distinct t.店员1) as n
from 利润明细 t
left join 店员字典 t1 on t.店员1=t1.店员
where 日期 between '${start}' and '${end}'
group by 结算单位]]></Query>
</TableData>
<TableData name="业务发展目标" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[2021-11-01]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select *
from 陈洁_业务进度表
where 月份 = date_format('${start}','%Y-%m')]]></Query>
</TableData>
<TableData name="last_month" class="com.fr.data.impl.DBTableData">
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
<![CDATA[call unit_achivement(date_add('${start}',interval -1 month),date_add('${end}',interval -1 month),'合并')]]></Query>
</TableData>
<TableData name="表头-春促进度" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT a.*,b.*,
c.总毛利,c.5G绑码,c.宽带,c.天翼,c.高活号卡,
c.三千兆,c.FTTR,c.新合约,c.云宽通,c.终端,c.手机
FROM
(
	SELECT 自定义分类2,自定义分类3,单位类型,自定义分类4,单位
	FROM 新单位信息
	WHERE 营业状态 = '营业'
	and 自定义分类2 != ''
	and 部门 !='电渠部'
) a

LEFT JOIN

(
	SELECT *
	FROM 陈洁_春促进度表
) b ON a.自定义分类3 = b.单位分类

LEFT JOIN 陈洁_春促进度任务 c ON a.单位 = c.单位]]></Query>
</TableData>
<TableData name="小米" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[2022-01-01]]></O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O>
<![CDATA[2022-01-01]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 单位,
SUM(毛利) AS 毛利,

SUM(终端) AS 终端

FROM 春促报表_小米数据录入
WHERE 月份 BETWEEN DATE_FORMAT('${start}','%Y-%m') AND DATE_FORMAT('${end}','%Y-%m')
GROUP BY 单位]]></Query>
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
<NorthAttr size="45"/>
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
<Background name="ColorBackground" color="-855310"/>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var url='${servletURL}?reportlet=%5B8fd0%5D%5B8425%5D%5B5546%5D%5B62a5%5D%5B8868%5D%2F2022%5B6625%5D%5B4fc3%5D%5B62a5%5D%5B8868%5D_%5B5c0f%5D%5B7c73%5D%5B5f55%5D%5B5165%5D.cpt&op=write';
var $iframe = $("<iframe width='100%'height='100%'scrolling='yes'frameborder='0'></frame>");
$iframe.attr('src',url)
var o = {title:"请录入小米数据",width:800,height:600};
window.parent.FR.showDialog(o.title, o.width, o.height, $iframe); ]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[小米数据录入]]></Text>
</InnerWidget>
<BoundsAttr x="280" y="3" width="80" height="42"/>
</Widget>
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
<BoundsAttr x="190" y="3" width="80" height="42"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.DateEditor">
<WidgetName name="end"/>
<LabelName name="结束日期"/>
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
<BoundsAttr x="82" y="24" width="98" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.DateEditor">
<WidgetName name="start"/>
<LabelName name="开始日期"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<DateAttr start="11/01/2021"/>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="2021-12-16"]]></Attributes>
</O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="82" y="3" width="98" height="21"/>
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
<BoundsAttr x="2" y="24" width="80" height="21"/>
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
<BoundsAttr x="2" y="3" width="80" height="21"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="start"/>
<Widget widgetName="formSubmit0"/>
<Widget widgetName="button0"/>
<Widget widgetName="end"/>
</MobileWidgetList>
<Display display="true"/>
<DelayDisplayContent delay="true"/>
<UseParamsTemplate use="true"/>
<Position position="0"/>
<Design_Width design_width="960"/>
<NameTagModified>
<TagModified tag="start" modified="true"/>
<TagModified tag="end" modified="true"/>
</NameTagModified>
<WidgetNameTagMap>
<NameTag name="start" tag="开始日期"/>
<NameTag name="end" tag="结束日期"/>
</WidgetNameTagMap>
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
<Background name="ColorBackground" color="-1"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1"/>
<LCAttr vgap="0" hgap="0" compInterval="50"/>
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
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-13400848"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<NorthAttr size="40"/>
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
<WidgetName name="3e0b9b2a-d949-4210-96e8-0e309db43e2f"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[终端氛围打造]]></Text>
<initial>
<Background name="ColorBackground" color="-855310"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0"/>
</Widget>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="2a824a77-a9ab-4a22-9117-a8ae28e38558"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[重点业务拦截指标]]></Text>
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
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="947b5dbd-62cf-4f84-b8f9-e5ea944a71d7"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[业务进度]]></Text>
<initial>
<Background name="ColorBackground" color="-855310"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0" index="2"/>
</Widget>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="4df563f4-79eb-4748-8957-62e457c48fa4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[春促进度]]></Text>
<initial>
<Background name="ColorBackground" color="-855310"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<FRFont name="SimSun" style="0" size="72"/>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0" index="3"/>
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
<FRFont name="微软雅黑" style="1" size="80"/>
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
<border style="1" color="-8355712" borderRadius="2" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"进度概览\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-855310"/>
</WidgetTitle>
<Background name="ColorBackground" color="-855310"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-855310"/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
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
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
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
<Attr position="1" visible="true"/>
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
<Attr rotation="25" alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
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
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange minValue="=0"/>
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
<![CDATA[main]]></Name>
</TableData>
<CategoryName value="单位"/>
<ChartSummaryColumn name="5G新合约" function="com.fr.data.util.function.NoneFunction" customName="5G新合约"/>
<ChartSummaryColumn name="数量" function="com.fr.data.util.function.NoneFunction" customName="数量"/>
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
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="672" height="138"/>
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
<![CDATA[="进度概览"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-855310"/>
<border style="1" color="-8355712"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="672" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="进度概览"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-8355712"/>
</title>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-8355712" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"进度概览\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Position pos="0"/>
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
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
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
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
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
<Attr position="1" visible="true"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
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
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange minValue="=0"/>
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
<![CDATA[main]]></Name>
</TableData>
<CategoryName value="单位"/>
<ChartSummaryColumn name="5G新合约" function="com.fr.data.util.function.NoneFunction" customName="5G新合约"/>
<ChartSummaryColumn name="数量" function="com.fr.data.util.function.NoneFunction" customName="数量"/>
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
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="324" width="672" height="174"/>
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
<border style="1" color="-8355712" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"门店排名\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-855310"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1"/>
<FormElementCase>
<ReportPageAttr>
<HR F="0" T="0"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1152000,1152000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4953000,3200400,3162300,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[排名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="main" columnName="完成率"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sort(b2)]]></Attributes>
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
<Background name="ColorBackground" color="-1644826"/>
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
<![CDATA[#0.0%]]></Format>
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
<![CDATA[m<a1b;eNQ4:+4)D&(6ro:P@BbB6u`Bks[l@Z>$H$kqGY(l-r?_Z)&1P\;3F<!m-IK*83b;G$
9ljR)E0>Cb&AF9*>kB-.POE$8pU*7"cRK&g2aegWm9Bch)<SAT*&?_loX,d(f5Ime:"&^!D#
UZe""/k`&RmK4`H#%0/Z?li6\4RfMr6#QVp\ZQ@*bk;7QO#QU>_YJ9eR>PZ_E``KIB)3p*Ye
he-)RDdK+lU:-P"+oqFci/j&8G+.:^#tjNpS+CieOsY%4't^M]A.mg?M:_IfU?uj_L7`VZ7(_
.PIdXf9]AB<7SFFq85AaT'UE4"AIW8!YihW<)dHt,1Nk5Vhj<Z]A5DdSo3S;O^>VS*aEbMZnm@
Io`T-Ia8b4dPn17AOVKZo-,FV,U#2)-&&^H-d<Y'j2)n144bmreif5rcAS-4q#ee-K$PC0=)
o")]AC!Q%/5&%g^#8o2=R8/!K`M@FFI?ebhsYJBRol6#Ta&g*I(O"8F]Aqb2M`oA@A7IKNR@A\
LFGY>RnG2X09CE4s%,YOE4'jE,mHR=?T,sOomHE&_^Rb*s8;Jk.\-ee-QF(p(m>q6B58FX\q
rk(JP;(<[K*f(WAH7SZdcUNuc(BU1H10ggM>X21hU0X?5BtkblDBtlRn>I)Q_42/T!_g0i*+
HDHS=bgMEiZCAn@Mp$GZV:J6k*X4i)S?&.p#1=BDt;rj"etj&E;`IfCb*OHcY'=$6aD1>&gK
L["QETP+e6j44/bW6ua=dF-clJtC@E2lj[u?JX"LpLoY]A17A9bf]A-eh5cuAp/mFE0.e*<'?\
%OaNgpAUr`;6_086+3kVh@""A2OefXHOE1>*mHJ"gSK.'NS;Zm00>Y2e*qA1@^_ASnY^RF=b
$F1U6`1<m7Gr:e6iq@8)kT2j1;N/ijQN`I5MNAQ*6%JeoR@$a@;U=u#VTtQUd@-qlmZ+&PX0
M3ES(Ef-fo(!K2^O)Kn;`>3744*Z?Ng>W65o;RlRn37LJb-.]AMQkH(e"nG?fl556A&Z9g2*f
,eMC$/_/k?Q@bKP!(DhPZs:,fJTjEtT1$^/Uk(+&Hp4"Ie@WfFs0D/CjH/=4*kGZN"Wh&7%T
MU4/P`/pdpW+bjq"V%qOVH7Qc;6`JSCTpo(,A@)j?0nC9JgS@rJ=C&Q4\ik2Q+ph=`bjVP/E
(GP:(:0eXp#I2iCQ&mJFd8)eBiC<FEM0fGf[_!)$S5VpY5#>DaX,+"RRS.UL[g-I"7g]A[pGe
_'rR4#htu%2YHGF4-(F'g5Y7UMZot[>i6iY)leP3%bYj)p79*>'Z5G3l-So&"ZF=k]AD%hYkY
coZ7VsXGidM+tU)V<Ai*)4Q'a4OAuYpK7D8h>]A=A!#)X36j<[A%)U;19\%_h<"3J2H6"#Isp
0H-(uKZ46F&55AU9\GF$EJq+Qh>+@44=jTl'N)KsHSLL'oZP#<3eLrhrPI9p\VU!u$<6Ao1j
kgOdWI%*<KZ/Os>O'a`'8ssS1\;IihcitGFC4.c1EL?',7h%h.f2W3sn_b?R9-:BV;3\$&<K
^bEO\T'gL*U2Lf%CjY3p=C2Yo:5ik8E2sf%$?/:m@f$TKfie2*dqh^F:s!U<6'MoR"BI+\@+
>BuuiuOePR/Om5EY`h2j#N8k?9OqLu5_[OHN-;+Vd,lO6F`W#a[UR4K;@;Q5_Z>G&mO$8q6^
W%hq@"q\<bq5VqLhV/XXYR/HI@+H.$cF&,TQ95A3E9AuRY7s!$Fq`u]AYR+gTS8F&rh:;kjOK
QR]Ad#\k7%pNFasoenTF;k&J6h"D0pF@U4:6E[qP$<?W59PH4%GFg.eIH\"eZ\)nf9V\Ban'u
Nk,d?O/.NQ)B+,1CIcKYa33o*LEWk-#h7Ue,/g7Z+eI?L@=7GA`h^U_BcIFJ\3!!DCi4\8l$
;kY$UgNi=EDAAc2l=T?B+Ds\uBtH$96Asm!PdACI'i9lIAes6I^A5Ee8MS"R"iTN9]AB`"Z*n
abae<sOZ_HlO`&eWQ+md&jcLa/=A7Zh-)bG;&+(Ag\oNYE"b#,^MpKjF/GmKBH,]AbW=h5hS-
X&4,I2/_/>FUUGlG:$(7r=:\/^sJ),:q^Q#qr1XE.)/fJ-elVnrP+gnnG4;>J^)"h07g^6^"
`%\_L2>K1f.&hR#PY:@)7'OouMKl5nMS6Kf'MmgI0c2f:,t(0JbN917/="Vc8H=`G)hH:KOk
'4fMAYg@.15j^LJYK]A#kp=R:taYQOZJLAT2ZM,U-n<mm"YmfG^C7-U]A=5u`3U'Nd-KrmT8/e
p0Gl#6#L'Gu0MhVd&.jtrl5Nc+SPL75Rp4lM6kRcdiG3VUMl>,NhKp;oYM9sV=MWlm@*<P,l
$_KBc".Olgf)&a/ZP_*5I\KP9INs_Tt2Abj.<unGd8Z&!98Q<eiWn$+q'd(1WeRX?]A>TP6ok
'pdu\t1tMG30m"4MquaeEXp(XZa$sC.-2E.OIa!gjl9Pf/Zl>RHDkX(ds.*?g8Epbc;g>'Gb
cXP0I&qkGn-7*+'SP,`[7DkSp?Q%=Ph_SZX41c[CjmV>G<dOQ[t!1EYQtT/<n;9%hiH.1:1i
=sS,B8jjJkH+Nm>Rg')pYhMpIFJ/ONhI^OB&m1[HbtMAP\T6b<;nXs2X`(6<bROPG)9)/88%
QG"Y+Ii@A_uX1WDV<MHg7=oZ;Jf[;q/^-lX)/)5ChBY6g@-2;tQ#>;7(_9j0ZFI:VDhL>6f`
khl*2MK6KQ]A9tLjN=/sS\!B%>,Sg@r.3jMli>H6#16uR/qTfL4,JI:FJYUJ[tC3lWi3k/e'#
HT;BgH.q!hET$Y_W0nl5MkL*FoiOl52p;eN.oc3bMH.7k&/hErm7f*ONqck*g7,f"g_E3!n.
2c#:;OKhRW`h8sj]A"+FFB4("/k,.n"H*A*]AC5jp]AR1@R\QYeeMee%aZX+:=12Ae_7sVJ!(%F
JZB($<V&b*K,$EC8U.tU(?"q650#Y:Ppm,)S[6#Q's+WWM%mAts'$=lh9WW-C&VZ!@[H)dGV
>cAX^-9%%/86n\r"=p/CI"0*X?P$SIpXBDp^qULS]AK-bca)@8g/DDO68K=]A9PM%[_kT-%9$>
\W!rrZ.&X9C@1)m"./Q,dUD75BckuRG$d_0<b9Z%u^SZk[VY*EW*caT,%^6#e(<iT7l@F4nJ
S!3+gX/_Z@@&L'DMp6_VeLr+7nc+\6dj2aTIpH`_,']AK&<diO8IuuqkH'hN<e9,DH=*C*cVX
kn;6+W>[+QpA,W6RZPLd-u7]A&&O9pls%`\d0H+*#TH+0cs"4kEClQXlrR"c#jA!S'K-G`'i3
nEKiA3]AmKkm-YN[-G>"=#&lslK#$msqMRdDDY..*21fu2*h+.LEVIqT3k(TIX>#3]AQjQik,F
/7f?7!qk-?AL1IYY4q"ZdnIe9b3H2ZQ'$WDZh>Ra_S_Qfp)KO+7oNB^#%Moo0oNUPU03%1,q
e9r+7p*mkB,Q-!GqH9;!3MG?q*4t@I?.,:YUL$`_)A0rj9.OIrCU?fL4j419l*C]AM/(9<[d?
eSVs8*:>BQZ1[da2bBR]ArNtTHXYm4!3U*c$!TF6E@tr[Jr&\S^u$WP;831@Je%/]AAqpD0NjH
?2&3Xc0g#ul\2[2bS7S1!]A7ULB76<!c-(3%3t8s4LT5OM]AI%?6-"mX\>pm-s4Us3EOfJIUgJ
QC?Z@oqB'5Fj\D5o<pX5T:L0ADUeGj0uhgtO@m?m?L6rJ7?h,E*"q*^(EYjAXtJ&qFRl5F$F
5@f(N4L%^O]A4tZ)>=cmCCWV/%n,t+4*DMOh6?nFOje3.KTN.HTb>3VKEW6[<u8m8&o%eksQQ
jje_hXSl%YO=bDH+e<X(b_!V@bXP>0,r(lb6PdYK'3*f;91!i&"*6?'lTC]A`Bc$lNApJ.fg^
LDSEC3`E/_Ic9WIIL+jjk)IO=!]A!N5t-+'!H#H*/-o3+dN),[65YQr9I4`!?rr?NJF!6S#[S
Acl$jKeE-l=5$4#[c\dUtg9_It[M_]AYbrL4APAad`,K8_t(,`'FD'KmP_$rfdi*6]AH\ljgXP
-`m<,0Y[tg.NL)uD[APP\Qe)YNt?d*?!Dngjj)<>4T0a:]A#a#N+$#(]A&&XhL".EHec9$@*+t
h()J2F3_mdQnfZuOF$`c\%22H.6cCNc?ZmWsBP,QFW;-p*#%1pdOk^f@(kA2t:5;dGOW(<[K
E`TB/+e)<>PF16.7XC/r6\+1K/?hlWdg$fd<ln?U;On&^ObLj1KSulikS-?@[Jc+dV<@+l.e
e*J%!bdX?h'3171j\QC[VDE:e0NrOaJiZ`<8_KnRS[,^DZtQ'(Y%Jfk^R'#3iQ#X@02$ilf(
cU]AI94[+)`f]AN?u*e':UXOjCGrfgNKd7\MBnP]AiANiAB3UDT%rD6D)o.TJ/t9A.*QKH*u[t8
SPM-lh)`HsY5TE>;"#?XN*^dCi&<iY`4WP,D`=?ZX1S?j=<']AuQ*>;PU*d"/$19)`p$kr-?d
01gK"\iS3>@`^COn.j0^@Ln?h&'_R`)J]AkoVI3+_L*\UKXp@39,2PQ+Ip5=8A6lm9=esor^8
KPK.VI287YK7BCmL"5+rHB.ppD^T#Aa.a?rD19:JAG!=N$HHieY4*ujLKk[-fQ%&F*d@s831
P#lff==(R]AB*4cYkkfN`Lgh_Mp!97L*L1YNV7f2CBr^1""P)V)NXJt85_t0Q@%Gm[A1Pg-)j
]A2a.3FfX-iI^VXNQkDWT9*7l]A??.Sud.P\m#r.TT`'Y99W&boEhp:Jtdu6JP93ga#fOft8-=
]A<8.NEpXHioM^Ae.m=$bfo677>FnP0E/'%!oX2i'ne&b`g.dVgmD>F`\h]A^F>o9B10lMEAaY
.DZ[j2*U'og]AsJ1+ag8KH+iSg=&NQ&5KC=)13rk8ZjH68dt_&]AlYMg^M)+gA$(.[AV&3XlQb
L<!1XKn`Gg7O,A@#/u`7#,bi/!5BJ9!ciU^DqG)'FkI6ZAD6`iRSM0+couS`YE>1t4+6oFT)
Ur='E6=olT@4FFZ9eG*lR+jebe1%?oI)>#@%(K<o54Fp7eB]Ag<bAp2:gU01"fo]A??fMM%dO3
;?mfs]A,RrS72LL*?9"kck,dgt^s[M1qdi6;$7\(lI;R#Kh'B1O1pi5f5/e7^4Xncj&BDJG(j
Z9+t24-isR%dg&A#8;f2n#;@hD?h[W"-N2#_*TP`I\6aYS:"mQ?%K2saOWFG(8ZN9Q@NY_h#
"uGVQW89bg&5EpH?5JGZ0+I9&5=/:NA*Q,Mg&!YJ5(cs1s?@gf__<K/1`_bQeW36B^J:ME>o
"R28loTGb,hs08;t*054DbDrZu,&o?="Dod:7\&TXA6ZfC\tH%+(g3lR(n$1rDL:<#Rq[B;K
u!L>*KJZhGt=*WglNKl:i;U@HiIa!rQq?8c*R>g2[=QQ]A7,sMmpO9?a)W1:34P*K@1:/t<9N
`9_:s\AiUWg)?CV&a4GFZR8C>lci4P-[a/t8Fd!T3W>iX0Jlh[EaY,BbKCC8]AjCTR6!el/j?
`"1Z<SX.f7TT_C#7);=CG"?HpfP-MJ6+g(6_V2c`-h(rpDXU5#mil#U"?,I>&`lX2L(!dc)H
o)c>eDIL)@q;$g<ZiE3bb&9"n"=\9bo'G+.De&n3*?!Q/29%jtrgmA"uGm8t/1.?T3_V\HM!
75=r5<kd6,>&S)%]Ahus^SB!JGtIF;]AP<(N3_HVV`gL6pgY<9kF'b<G+%'=[EHUkle2:Xo2)d
b`H]A*Bh6fHg3HZ,4?<#S@?^8LX-N"='ec>7gT@X[H&k_i1*?cF0%"NB%n'G4BspM#Ol=i:$]A
dQX3Z9FWJCNok(OaAOqK$b;;r4!"O%C)5tSYH>Q&imNWLH!;q"Dcd]APXgTOeF-38F"5p$E]A7
#leK#CPkl.C_Ip*`)O,\%aWV`nr3f4$f"V<fpY`&Z:fQ'2Bkjd,]Ab`H33jGu>R,gOdiDU15A
V<RrIp4Zj]A\@HK#TcNm>iRf@p[DZjmYKAT0YlrWMCS_'j<?^.77hhd<1e5VA;/oOW(B;jR&J
;b*XY-n/Z1BNBq<k')#hK4]AE09rH/K.,5'Y,W+bV.kK;50l:>_,-X&idLiQ-jiQ'#O<N7,QO
29p/5;Oe8W?BUiTlkpAr#^Q2X7hEM;SbO@r(PUW@bD?^k^Pg7VWX<NVc0@qSq@7@HHs$Gf8,
f2gMTd;<EkBK7]A?=?\A2:"QLu'^os=IfVqK2A*']AgCRlL?%[KA>,RkEb2a@BFAKQ)7OC+6Fg
Y#k_&;`1&#37IHaShWst:A=`TGuA3iYg&TPhEMb@1$qc-AdBtoKZ!(Yi;EII:*j=[eBG33cM
_S:.7s6Z#cC;gk`$8_SHA6+0eVT"q9#bDeR"WC'V8d:rV-`\cJBYJH+d^+r%FPu;fiqglJL*
0mk'fV4$^Y0+>nL]A=VOZo)EpnI["9$Ka7BkP)gU]AP=Zp)3:,0IR>MslI\M4sT`iB"I(WrHT[
?!KUj)3BhUgMqAdhi&_SPE!iI;sr/1RG,7KI6$$]A;qtuHJV(pl^ph(QD9*]A*"SV_3$/rCE,e
F3K3Ac?H(3_l%=^K'E.0]Ao$PKDb/L7WO3-lfu#u%Uea'&]AJQ/@?*gsMcF7&HKB:J]A#YH5e;O
fb*oPE%bW3]A0"Tq^'cs3#C\X!,at^KX$Qd_KEuVTM\ff$<J?cY[ep%u*(W%hof=6<q;I3/_A
>/DSGlA@Ol=bpb3Tm^%TaO''Z^4ITK4Io=0Bo,B#;kir!['l2%K2IOV\SC$;b$hAR;bRV5Hf
M,a<$;j$hY$!JHh/o1=-BDG2Iq'o#S["TOOFD7Hl*Q%\[D#[T3@K`6X<'M%P\5X4[6[8hDLb
V4#t)RN9fL5@r"Nq^.-L)gg$@g:sLeJB&2S]A#ZC.$#FTKpc[::IrH\Jjn]A.6;"><d]A]A6fM)&
@G;=42'VR7NS+$qS\/:c2723Ck$B:)6YOY5\f$,]AQPJ7!l1"=d[%,/Ok#(2fW\ZS^9i2DAD3
5m5WE3D;K/&>r5G$ChJ9Yn9_U]A'W;2V!MVpWN^=LiPu7>^MaFmo!83K:r/5V8iWbHnq.W[+\
H"o2j<T+\`rRW97Q0"G@n$IV-,V8p^<5Eh=!RDO>?%:7\\j7K^nb^L9!a9/Y=4W+=@Qt^\TR
KPR@bAS,Yc5k!0XK.d(`>;?b[o+#7f?k$0*fE*!]Ad$V[Yc<+?ob\JC]A%,C>d$beC!kC"3_94
LE#GGDYNZS=LT>RQuEdX`'X=56Puf%;Nl#2p7ST9'TjF:/\M8gKMA-3$5tJhRg`uR_))niV,
Zu8s6kdY,NV>kk2^qI>,=an:a,Nc!Fr.bQleLi:Qbb*kFQ#+^U1c-RR`&HTd%4,M$aK+L1Ji
VBk\EM3r0<6pc4:-6>N#M"DMi]A9,:9U*%8Me7_^$.31Q>P^Wqi*O=%[!r`^.^uZFjOj$gp9W
[0<LruH:'9aD`.XVpj\Nh,fWnr@i\RI_]A]A#qTLr\//cP5k,QnhY=Mg;<nHRTnok-0)bX+T?Z
flXC@<&sCai%<j-6-9_Ci[fg@67TLq%K)=;Yl`Dj3+VEuGhp[eGiju>qLu>UfE>#X&Ae=e4G
P_2T.[mcFYqnFdblc.ugXf;Dlp/JAq4]AO454C.F:@?IjF$Fp\q*:\9Y6g`TY]AOkt9&cAm>CL
T>72[VR`;=qRqmUEZI7;5i!ZZ1m0Rqto4C63H4=M$lQ92_=Zk7QOPl6^`nN.u.*hibuV(Aq(
:>H94+lf]AQR7MMmp42sMGfF%^CH?'M%u2MI*_=4@/-GaF+Z<8dY<R[6@iO@OX=;)Ei,O$tDE
qMSQTC"QnkqskgI8^Op_XKeJs5?16c#2+!Pd^UT*?]A)#044c?H_Mk'K?S@-OO^i>T?OnKQ`Q
3kTZNA,kJD^+hc\f,Yc<>T$r1V@gr\-jG)3eGS74JG%\Y_qo,;g5N5h5Wd2P5`XYaIO687<)
)%_b/Hg;kN=aLr3YQMYYb@Ng@52-kJnP*]A+SS*>%MS_&[W2_9_h5XtE(?qb?2kR922,222&W
:eEJtV:GIZ\P9V83e-44ZXD-(A_CVA1emi]AE8/N#eUTp9[lW%uYHS;J4:#\`4d]AXDW\4_GjC
kaM\IRX%_2(-t.R>RQuo:?+s`F.n,]AeW<QoP`%Z^/'q]A*0&pQgqO0L;h*a>!0>2<3G[B.WV`
&Y\-bn8R1rP<<?G]A8`/a:/cnY.l/(O^Z6aK%%iq?$q;)\LeYG&aVG1aRC4J459S`8EU@IS.7
11?MV130161$chEpRlsmtYNl9Ccb[4pM8mkh@t9)%Z/Pe*XB_-k)Q<!1RXFQ:Us]ArKOQc40-
IZ&^]AitmDUd94U%0up%8WZK(,QPjN.Li;"["+MeDds4/1*E0_Js%KkP&C&!Ro9tQWkO.e,t[
7%SOcO8#44jhYSI/Wh@*[4I2GMnMff6mS/9>niYN'Bl)@fR'TEu>r'qo"A7XeUH(sh*>h)>9
P(WLTJ]Ah<243nG))SOL@p>I>fD:eR+6[um_6-nShX[IbcR_+,#M#kg$j/eK;9S8!Y[=5l&=:
m[p4=-u,A'iro2U3ID<tWY]A3]A3OiHHcDP#8=MT3\'C[h/<iKg&@U,cYiX_*fEh!`lN3(^TlD
4WJ$S-!rZ4t"BnPgC_Dgl[Xfi+dsG`KfSBnQHlhg$s5`>Nf"KjQD3Ljmn[g(<NZ.AK77n5%c
e.WGFPS?V6LPM/(VO9T*&(((Xe-3"HcMLU"-)%QZ\/?R`uYFPISJ_m^bnLknp)!-&ZWRGCjd
>f5_gj*6*l85Sf534[\+L7re#_VEL@h'C_(Dnm+6>Qb]Ah?YRY=tL_P^G\e;kThQR)JMpqk3U
#S`#^4k#lo:N'\u3s^+`Q[dCcfVrnUq`VC!%8XC,ZOZdok.=#8_<s@ApuGP$EXcrXc3h)Pm?
eFaMHbAD7J'PGc5`YI'\_:tLra@B=.477]A2SC!))V?K+*UTuFig.r:S)8'YWo=p=S5kNWuH9
]A?N~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="672" y="36" width="279" height="462"/>
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
<![CDATA[="门店排名"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-855310"/>
<border style="1" color="-8355712"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="279" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="门店排名"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<border style="1" color="-8355712"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-8355712" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"门店排名\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1"/>
<FormElementCase>
<ReportPageAttr>
<HR F="0" T="0"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1152000,1152000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4953000,3200400,3162300,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[排名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="main" columnName="完成率"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sort(b2)]]></Attributes>
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
<![CDATA[#0.0%]]></Format>
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
<![CDATA[m<a1^'6h%f"N8fqJutrt<[F>[XkPFhes8s$+R*UBCH\!>[4YLAkb=or,tO73El22np/k%u[\
ad1n8sq!O$lBliKD#d72d:GUte:+7$;L^JD<[Banu?[4k;5ASqllPTC^t_pcLYphsWYqqtY\
)TD+o8K0R&`G2^>74q%G,_KC?UjY$Tf0-:1ARN@oYrhc*rq%<\']Asd?oQeoe8)X.D]As04*;`
o)Qs#k,IL\GTn;K&==JTDWRf-)3nuY9hCWfDXrjooEHO@kOR)8p<G%/(oFB7K9I+:#CUfFi=
76'e59Nfg`+$s+epiBb2.s2Fb<-S*M&41DItXLm*RLS]A)dRM;^Nb7T5e!Q^mN0+s,h:<L98g
>VGT-`GL^.N,L3eCl<B`ZsLFINAuVg3q^f2o)>IT`P+m]A[r-\#MpE+[,M.b.IeT-LD55FBV,
%rll8'/MP&[1<<tINN%__f=C:CD5f#IsAoiIlEH'uW'#b>*2?NHZ!>Trk/>7R`@H^UU:%B"Q
0H+s2dINSB"*1@rbRC]A[r+nGMdZFY1n,Vdh9dk!5^L$"0Q.gtbtJmN`:Kccc@r:`>T<pbg!a
F5.8qA*KE_&@+&pG"Ht(8Hp&6l_#l/IB_l0.Abh.r&Map4i3!U0RJn_b__Vj[kh7>tAMPNYL
`46]An)<+i>'9=F/''jG^oO(RomAeCBb&Xm3?paDQuGqdR:FC:%.0d.&D8`[#H$@nRJ@<-*>0
&=k6F%Hs0_R7;9@7<)[-]A=sI3p@(:,\qJ5tWHpc]AUVY!<\\QoJ"<GlHoGLH'cYV6K8fqN=-%
6HGGC+KL*n/8mX1oV;40t$@l%Ep:$Y#Ai/'.oH]A]Ap-/Dr'%NX1HLrDQZPo=H;TO9]AQQ;b7R`
hl[:_D+LM'fXt$+A]AY!JLd%0coWCLGX.MPM9Vc:VSpmE"6k>/&LNO"7<q\0dc7=H.J87_JP?
BteNTl>>ZhD)PbmV0MR+''Ie&N3m*GQ6M5;PgL&I(!e^4'bNg&A9IE]A9?X)7758V3Esg_U&P
X7Vf%_Gp,n`t=>=Q.7s@9UeECE'"OYW6k;BDW+H<QD:S]AlTbYUZ[n?8VgF]At5;UbS,V?*Y?H
4;;Il7u$,p&1FWScV8Q6<"97B@2`8uOJ_HV51"U2:0n[_I4a!th_DmD>2,l.oQ>:^hu0i;0k
a(ijjCF$]A[cGNVGN<<DW!`O$QAi?-@QIDpfe2&cB&UY3."mNL3T]AANT-<lQaZe'\(?gs@/%d
@*#Za1JsD4F6fDf3QMs?uC";=Rpi@#5(e\sNFE^rtf8-S@q]A`c9.%GDFKD\@N)0*#07SE-0l
^'$./ob_4@b$Ra^7"%h'#jaM46tDK,:G/KNf5s1YuF5nmI/mBj'GYG]AQHe/'6P1?jA=hK3.:
Psm=b'hNt>#UAk#IQ4OVC:gps\3"2Dtd=#?J,SGGZlAn:H%%"=IS):oiEW,?;\e]AAgYeo3Xj
85(s;rL]A2<o@Dk2ViH5X7%j4VY4E&"93V2J;l:f!Aa('8E[38WV;n/a88D:%a(>7&>l)2uY_
"Glh1/^ifV&hJHctOe+lfp?T=b#Gb(n=-ULM2_02`"n.9n'-?]A)X<RuT6;-dMGt+-t\L1-_J
-'Z0N6>(/r_ga0E_0b!kl#-p8V#'[T<9.qhq39.t7S\#tsi(hYT&0L5GJ3;J@\/f%?&(.b%9
*-AXZ\6Y,1(?07Bn`5);hJUbQt5A$L=bh[f96bE[RKI%Ue)o@_E+Suk&f$pWu:c^kIK_baJd
TMWVYDNB\Z]A;nCA(h"JPYIHK*V3efUrPF]AT`V<!cO=jg88O-ln6#=0UaI-I5tAmX0=Sc:%Lp
)XkFKQ,DV_"`V4Z3"ctZfQr[-YV>IDi(QWP*K=+`SoCu8eYi'J&LmpQgXCc<CmB+-@I2B=_0
S\<PE>50U]A'WEOZ;_VeH)+59j@CsUB5Bp9cp29'-,Fqn+k4lr@Kk0WqVs%]APDH%V<^W@<e,\
MEbpqo,\QE'cJu!p)j@^(R8j*[d(S`p)n*8Y/=kD;XDR*O?p\7mVjCpHmUl[O"3'$ST`P%pg
6'U^IhSbs$/DuM8)!dPget1*ED._DQ:\*ge,2.VFeHiLL6V6`:2]A;BFo6T^g8#>SZX!1B#$M
*rIqm4c&8>q]A4]AXb0APn(`Krsa4ads]A0=l)UZ"FoGO[I]AiQd6Rf_,(?)6n8fa-D9K;UF6iqN
rC`.Sld0KEr/F1k%oEOHA2L544A[uLc<edM6a5f*=`Ao4o7XSVlc`\9I[>52a`uI@E^8Ih^>
o<t),--3"&%Q.81k7)bf82bID3o:!'PGgIAaDDTfsJjG8SsT:d#Ce_@Y#uWIt+RE>*E!0&J:
,=,-VW$lr/ZHS%!,1s?[+(]AtbbF@_,J'7@#WSDU@fhTIK?ZHOg:OE04!@+7g\X#4]As<*euNf
'%=`JR7I$@mVhB'@csW"n$;S/T:qj6eN7uiIB7qe>3Y(i29_*n3a1j9/NPL7Z6MGrkMZ6S#+
o.h+OpD20ME&lq_>eRHAckaY`Ru7#f59(HOVbL#,_[^I6)/Dbh&Q9,u>I7ut.B>nblEiI?qt
m]A;^i<ABtJC:F,PV6DEm4C>Y<:$j"_5H/-N[7tj[^L?ns./Yn29Fs?,o"ne+m7V=Z%t*s`Sm
p>+/.S[ICb<#k3*09g/u?%Pf,V6KU`23_"am7:C:5X-I#U0H_UFF7F@\=c4L2fGH^=&+,4l?
c5.t"mE2Rr0jfNQr45JoN3WHf-:(ah\onRB)>!M>?,m:ZG;)R^9,-TXg@fC0VXuXH*&'HsTo
1(k"M5N2'Ef[&l=3)KMrIV^?2L"[6g$EK3(=Q!.X--UEDra.?5NSegXcQL(WVQ'?:73gPB;e
LmQMb\sMkLo7bR2NTIN"ZQiS.?A9]Atm&9/;eXKFW\g=$"+PjuE2MUJ`e33_;f\DHIb4<:A_T
EKR!,%kR,IbLlk[HFb\E5/p2&]AES)CoX8:IT(Y_1<OKA1I`taYa[&Qm@dE6?B2Uq[U<8T_/k
NUUd`kJ2@4f=L!IAUZ:)RLC"\touIaW1F2"-eLKm"g-pUU#Q0^:c&,lcu-O`a[*Z,kQ5L]A#`
+kmFnPYh/CddYC5@dQIVWY0pbHPHPIjB1rE\_nC`:n.$^B#;;0ZUoV(of`BrddR%-#2p5)+(
+E%2>5)EtCiUWWDJ0n9THS1r)-&ajS3p"D&pUh(>tX)J>.#7C49`-C\!HSGI#L'-YS;s?PJ6
5YAqno@YY+gEj!]AWJn`W*-E=l!9N29(&'#Mrud9.=/c+Uf"6Lh\9TXEcGP*^sr$^K#O5[h'!
j\[O9HTZX#8RA-A.C/"XC@s*[*qK@FEYQk_"'lO&I!L%D^$>?Se'hL?)RC.,(hB>G\4=2kmj
t1VA%,M)^"RG>M4Cbk7[P=8?D4[9d$Wj(Z(nI]A$DH<?l`dBHa6)g.Fr[,1eYj6*U*70LXl>^
I;su>3qptp\:n[F0U^Oi!n*Y"T8gYu6,fsK'EqY6,6rG42:^n@a6FHsnIH%<!2/3=4\mLP3Q
BGs:??;b5[o[t6G,8!)T,+<[dIFX8jokBBG\9$!_HqqJb57jfj(NP+>O#1q8-KgjB,/McD]Au
Jno.Cd.dPR^CiT+?V9HDN*0jF[FV.G(g^_J$J$M4[e#/>?-M5sP5"]A$-oC156n(U&5pSaNMF
QAs9=jqt!]Ap4@/J)1&IdDA"U`9mSo[.4b%s<G'%CWe:Kkrl!JafS_Raa$6\lN3J\%Q>M$`+%
P]Ar_CX=,m>_37N@3:5g+bVKi&eGko&$t^1]AN@6rPN2*31X_e_-bR"O0%?4`X[PTq<?#,/MBp
R`#&q<CI4O*;CEjgK=s4pffMa[M`sUMb[.,MB-tYHU[?VBKlsn&L8psAld8W@.q^UH9)O*Uh
50'oeMdQ+&iL/C\VPTalQ#-XDK+4<L.3$AJ8=Aq"^qU?BBYp.?L@_<Yl=a&GD]AJ*TfM@F6;d
SGnH-F9i[dHi1al^H(U**r2=IJ5IKpCAlF%;+2\$Ws`B2.45j[X&]AjRO_(i%erl]A>7QMIT(9
^24L;[@TsXDTmC+VXgUa=]Ac%YLdH0J0>d"Yr/eVBaQe(-[:B'.?a^,o9leeP=C</9I&ZI:XB
VaoK3bn9J.e4i\2C#YNEh`I.F.,JKA/tLah@d6&=X?gZ%>!S'6`&!\`'+dp]A=tYpX>)Dbm;7
!0(QAD(]AmQTaC7XHSDt#kV7kR<(Jbr*\''INV$Xj_cB"Ntn/c1Q9Q.P<P^k9NZ"jWQ,(._Y7
Zh_^22.Ia%PS,ka+Jtsr*)5rj6P,`H=ZX6SZ3!mdUME"nQibPoEDAYeBWLRV#J59@l<Zf_Lb
j'DPu`\;L$"a.QPh9'Vloh7@[S[^Z)`e]Ae\b+XBHWtI#TSR$MX-fS._T%h3Mmd'Mc4Z'-f2'
3!o/g(>]Acj%>1p`TUgAN&B0$L+%8P_9tp:jZ[Md4ad.^/&P<=AnON\kO?:l6*'3Vh%''l[kC
L:^M,Y1hrO`fAC)BKc9YT-7!!so+e"`F)/n\_N3*[E$=h>Ei."4A2Cq@j48e-^FE<K3/F[a1
a)jM*s_>P5gB@C^*9AsWeoWDX!GchLS$ap$Qn7rs`OthAOFPb[8j0CZ*Wd#-0\BCKr:%khr[
(XGEahhl47:C_G)p,/md.^1!EsMM#2qeDq4Yr)m=MAeUXps@c3mTT$@bo_tC@I??Z+)QT\+(
fuS7oIm1Xm\YeW+MOq"58.bVR*ul\8otg]Aa/NCLiDjF@]A!Q6nu$\7d+<V:aV+>Jo3=T>6JYg
hJPnEk/p?B,AIiV;[W>s7*DJ(k-[[VV2ujRgC7`L`C?9"N6GV^b=rjcU'<637eO("c@WIF1=
noYs08n-("9NPAAM`MBHL)=r%(j9GI8&@Wff#LS43rmMl:u`N3J_A--)Z[eE*u#3qsOo69Xd
!'\fN5Q(J$2Aj@r#V>Tpu(ugj8@;4j2bF_ulEl4@L#@hITA%N;#J'kk<mcRbcKu$t'm%1(..
>/^sRgWOJR]AWc:JR&mg,=]A<f;-&m8Q@;q+.@6.)LLQ$AhKj0@*"=)R>9#5S6OGIFj^&2.[5j
O)o(u@H)lVKjc[F*!\F1hK7#cI.c?dOYmCC$%J0u!tf*<5SV+b0<VDROoP\.VGZaTc$4%;o:
@W@,=[Z-Gu=tbWM)W'oYaYn@?UX<FI5!*1T)HM*4Y]AoZGBPfT2_HQTNcF3WAI]A#Xo+#7Xo.U
elD^OPeB-bW1MQ8W)[*Bs=``UE$BJJCWB^7!T!p"W=Y^HE"("0.R%)>]AV\%&s=Y%`Rj&9@fc
tj-:P]A6,QU%Lh(c=54_uH*l*TSYf;/QRF#;t("iatm)V*fHer6q]A3\4b'$:/dG*hIBnd&9%G
YdBAc3ef3OKqp[P6gVrOZ:,D'&LOO0`<sA+]AXApEDZ%Q2S&P,HuA3S#M_]AE759F]AH2m!YM7r
/O)43BR3p4.IBuDtKl@W(N\I)Uo\R>^*8!-loP#%eiM824XPq<?iML/>DO;Ha#bo8>$a%B\?
U&Q;&"1%]A=2DG+H/9E61LmmuSb1tQ2(n"&@>^BorWTS.(qT\c*-i2jZ`tJ*ib!4'8j'b.q/3
dC@MIN,j$!(!/i]Ao(^h01Y;re=-X!quf0SW`^Z5B6`_:LHJlG,TFs&A@cNXMj-57X@+QU@UN
U`XLM>cjd`j8=$JlOT=k^&5EnKGa>*UmeC)5HVX%?]A^-GGXVnuVI5$I0<Xk:6E7%LZdq]Ah=[
&Z6Ka,c\sMo7Xq$c2upGmhDjn@/m*OGE`t''G=r@RG+r[[BH9R/bgFB#:B$$H<D7Gf5X-CNI
AiZU8tP-C_-q7GoY_@1sS;`Adp!$fj0>(hV!RCO1lViPNfG=R%m5ir)4!UH-NG,UUq68rcM@
Q[;eO+1DOP"+JdHMHA]AiY<e_[alU$Kel,PP?7HH@O4T6H7?m.[))EF7j,t!N>(I?K8=Vo>e(
,V!UBmkLMX2m#&@5W4M>gCq'U'^OB&5s]AMN4\7<C?$fBPI"bpl0c[=S\G.b;ZN?R-Fnh28)=
G)W#TCW(Ne$caR$?3M#MHIh^5-9h@8Baa9\WjuhQ$hXabBQ`(+7iYA'1?>:rrdBtp3<OXrbS
j5Ce[+pV^&'`F+pa\6@m0No5qI%(<hXW'qrZoi"?Kn!Drqs.[2)Sg1/>_(?$h-]Ak.BI[a@mg
&1ogY+K)35"s^M\N_"hP-eS=tC/(S8OHm`AHebk2f;s);lZm4k.)NL@/D-oG<G<^fH8_Di1\
r\CX<9a3/h)$E^V=AFdL(Us&(rZu8KBl^k=_6Fa'nYOqj#V7^+j"U0@0P`qS!\$oDreh`)?*
>\84>p+O4Aub:E*Jn00SB>dTtArnL(D9$Wf8+WGtSUDMcFe32I'S+BuR-)iZ]Ab`aeG&a*i)r
A]A*1^`_TCu`qYJtNZUh9u%:.9OBh?57]AL/UgA#l]Ak+nSs^>T'91Tj9Y9T5FJt_i$IZm]AIkK>
RSgK^!JDoT'#)Fp+!#4Vepf>XthYH*IYtIC1TLLioBU)lS^t:VXnm@SP?*aDJm9.lVo)Hrl`
J=VhLW<9+!T:`BV)9*kT.U(k*^-*/&.fU5j%@8TBM_kHHpM=A2URm0ukOiTle8?gah(q+G`+
,c?&.*P^]AHKC_P\Gan7DbNM"E".4JU)>>kWJ3^b%$BB("61M^46mHS?[3P#/lFrk]ANO.Xa3H
!>*HETDVjZ)plcchPgRF!.KXS!mLDqB5%9a'4GQ/dljK'CB@Qe,`"qmM;FNKm#ToB<M/Iq%O
QB<5P:9'0Wurob(LYU9k..Dd/Sc]A&KK!R0%3TK5[/q4pO1.m8ZG7:t5B@jq70#;WT"?fNk^9
uRO!Kt9h8YlXNc=WX$eG)<X@2e9Ed^+Zb44GU^T7:6Mh!M!WAHAOrP_&['MQ+g=I%Wl*m[og
0M45FTMm./$'mdJP9BB3pP>^tBQ$KK_N(QgGIE@u'=j*m+HbB'RCJ+[*sF"lm/L=bRd?h^c5
0E73;^t*HqnEjna8WRYFDTt,)Y>hhN_:uK'5TmoR_BhlKk:H5R7$)hDnG;PkSZhRJ)._a@9a
T!=T(([-c1Uam$J^u4BZj;f;A5ae-K6VE,lbk%0_\W0BCBTp_l#]AV&hESb0]AfuBN)J9g`gMk
9''b8kcUq.MA9`0>Q9P\rr>E2@p'XPC61cGHEFuhN@(kD6Q@IjXYeZe4`"k3[c+#,XanCr'8
ssIhIs)p\FQ`N*&KcnGD2kk4>-]AcdOIl6OpHro!k&_/?`.r=oo;'NI:oRHP0aF?AkkMBpd!Y
3EUKY4DR\hnlEBd85"I=iI828tDf`Z(k#ctt:Nq[-^U$ZpJS1SDtnD)@KTnk`emN1.S&q2pk
:EdGm!-u2G:_T7m_L+5TUr`J2=,T.FTAn"j7M>-'R:8g+,CZs7SfdMahu,D2S0pgicoG_hIs
+@qh]A=d97m+T1k4m0%O@7]ACr1^2%#1M+Mh95R3(d]A$mEGFZb.)m;sbr7%OMILOh2\heElB9`
q*-_[oPBOq-93`;2(1HoA8,Q!e/=hf'glFiulfPafl#V=in?]AUiMEB^SSMCRW*s@qhlk$\L&
,X$DDMO\t=AjJ;-.E1Z0kL#eZt[S[B%jtmKEQMY&+YoH+`s-M#[b4$@(T8.'4ZN1;+ML\k.]A
aKfnVqqVI!44W2TF\!m'mL?@jJ,*AqP!bD-i$X'_Gq_heZ0lq_s,R_*[r-etDgR^:tnAW\o\
G7a\8N;r_ra!V"t+#edI%8uJBLeYXr^j).2qsj)@=BhoB^:$59b<8mj&r=B('CW/AYEtapJo
YKGV(i*?o*<3UclJJWgml^0TY_b+Yh)qC]A85:"24,L'LL:.D\;7L*/%0KPTPZt<8\uC^aR`:
D',Y.:&e;"1_<m!I;-5(YZ?.8a3)Eq"/of9BX9X\RlPYT]A<8V'Rp@saI&5f2riTb^n0=g'&B
X9)k7,T4Vn<To%FVnUkF[7.@Xg;/F=p!4g42s"=QVl8Dnbs9XGZ[hC<W9*8C`hh-O(3fQ@XS
QX:(LT5L:JVoCNO[Jq&U*<_fFnR)OP$<8;O'=%9WGfNPt#M^Xa2<Q=??e&oma+ZP]A2!6-3dE
[rZeu\).0#aU@OATo:B?b+Mjn#bWj,NfhS8i0V+T#dL21Ilsha=bp$:n;<<lb`j[=S(pOT/o
ujNkd&)_-JjV`=$VUG#od&e.Ou5=(XXYf>'t3n?UD(u5T,1/eoE>)k#k/$H(6_(l^E5$jAE.
<bMt8_9D=es0HFf&).F->G%m`,9G;YT38Al"Ip`5]A?ShEFDW_"Fe.>I63ip=oY+kUo29'ce(
md^2BNfi($qreSXS3AjP$F\=b;_n+`N=8IC.s^dJ3='<X,WR!lF^H?JJ]Aq4QiO2hM.bmJ>ae
a>F2cHKnc&k-?(NP^09QFm%)?CC@S&%H!X7!Rkh>EKWpM+,qn@u@a#n]A+k]A;#":-rW+@88$g
D0$AJBP2=l@YT%<n+I;`M+ft*%&87FI)+KVM#D+tMg2_+ApukoI4RiWX2#D.M0CKq`f2_XSo
V-p(#&fRmKGRHF-(4k^s2&I&mjlcZ[.Mn/5.Rbb]AH(3HP4e-GTZ3Ec1i%$TH;8Fp=#,jRB6c
$F6@BGHA;t.+>Q]Ae+o5B'3<+a=mSLL/S<1EL2)n?,M[7ntC!e#af,@`mE-bK+/<)h/-ZaTW:
J5e$X;c)iC@t[J[I!p&cuKPX9hVAK#iag,lEpEjq&Z0-1_t$dr.chg;6jNd-X5O&qZ$t*^%E
-XPTBb4!.*'('f-j$?/&tI!#\#@:8W!eIg;Xuec$">J6FFQFtno)J>#;:J(;\U0dln/`9)D]A
ps5_IQX'Oc,1:`8K(H_VdoB0W&8t*Fh]AXRZ"#ljfabP:]AI9b"0:#\"Ghh06hP'-4Z9++iOlb
^Lu\q['pl?RaF:EK"S,YOG#RVC_D4<'H2RnjX;0J4aQ3tkc-m=uZ\b2U^E(S?_01GBuPFD9%
f/*e5i@_q[?^4ZYh2gYM=SmElX)^8aq%(9.5SgY!6M2#iVI6@qnB#4Qe[R:49ODLir2.<o:c
EWc71,",)hJAiAJBeqh[p\WD0c`B3,9s7"'X_!MRq9:YNFR3/)J@BY`-:5)bq(q7&JGegh1Z
XAfKJ,=$t#$_e]AH>mhi9I'/lg7rg`aWOF3[3LNqHA,%+hY.*]A\TDAJ*5S&7s=mr9LAjookbU
c9/Eh3PJCD4f[^J,+L<3)RKI;q:OSpRpOCoo[<Pcdn@)m'Y(LbVc%j!Oq_um2?dQbdf;#D^S
&HdGf*L]AAF.@i;>MJ5-cP++6Q<puDsQQF4m'[E)pK&V!B>.o.4J'1U$5^_/60e^`\#EcSq_S
u;9G2lB2q-.q=Z.B:&k!!KK>NZ<'5[p1NfK5YLB",Pi<04[7Yj(0YRmpo#]A"TAH"^h;2ijBY
T+ipO2sn45VM">I1V*m_&ahp9i7=!\<.5Zru#lFpdh]A4Xrm\sDg.C>M4Yd`qjJ9"$D@FMXa0
l1Z@CX&cMmt~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="672" y="0" width="279" height="498"/>
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
<border style="1" color="-8355712" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"明细数据\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Position pos="0"/>
<Background name="ColorBackground" color="-855310"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1"/>
<FormElementCase>
<ReportPageAttr>
<HR F="0" T="0"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[2476500,1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2971800,3009900,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[区县]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[门店]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[5G绑码且新合约目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[当前达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[达成进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[差时序进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[排名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[激励金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[1月30日前完成指标激励金额（30%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" s="0">
<O>
<![CDATA[2月28日前完成指标激励金额（20%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="自定义分类1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="5G新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=e2/d2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=datedif("2021-11-01",today(),"D")/120-f2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="总激励"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="激励1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="激励2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="2" cs="3" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=a2+" 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="3" r="2" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(d2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E3/D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=datedif("2021-11-01",today(),"D")/120-f3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sort(f3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="0">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K2)]]></Attributes>
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
<WorkSheetAttr/>
</FormElementCase>
<StyleList>
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
<![CDATA[#0.0%]]></Format>
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
<![CDATA[#0.0%]]></Format>
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
<![CDATA[m<j1a;qKTD!X7;PdQp0\_:GVd)61nZP1HYBU..R?VF7Hr&=I&;A?o0[Wrd-<&/e6-@T8)\&X
a:IJHA/'KZFuQKE)$>80DIBK%=!!o,>>Mn*Rf:hraFKd;8O0BC0=plWJ"o_fr_:D-Qq@dCUM
4B^o1(pi8"noG.H1dO9EG>P14ikSJ4]Ad'p8eIJN]AQfZ^TABS`p;nNhVI'(Hk*&CL#N2CN3,V
873$LRQBq@m5_gC!>@-G]AK,A\:i6/#ZS%*]AI[u&(?O[5&O8ABU\ekn\m`o_.;;LHOf'jUQ7l
Wb.lhhX:W]AjZ)A\\hq6\A7iLCU<AGCP*Y[s;,c]A$+,k9,rEglYXX$'QB-d$8'DbR+H>-)"0'
h]Ak;TZ]A!o?D[[OoKe4(!UJ@J:99;itiNpO?DUdORfi/%n\!a3""N/QHJBX'F_WHl#N";j$[,
(D?$+:S\m_#EBleG%]Agu11,%Na-pFS^2S8mcUge$WQ6<3,]A*0(J2tmrRD]AWpd3T?*4-VMn#`
Z9M8#/p67>m4[CDf&gtm]Af4[%Nppj?jZ_oRQGUX_3p1OR(G+R>\L*PlLUnO^7,B\Y,Q]AH$a+
(WJj8q^j'p:U<b"CGIEU18<#^%3X`F?F";^qNaYaD]AM3Ws!MGCkJ]A:PUh+,59L9%'9hSH""U
H_SSqc(6T;."<:2+mcL:9"[-QeoDJc'<RoO?\R,k'6_XmqM_q*mHOQ8GB]ARp!n:uU=7$C3lb
qVVl9,b+YHMiDMu-UFPlFoFT`56#j"g'kHmJ8;5nFG%N?_E[G1%\6kUVV)TD=.r@e?>Yrb)R
)0&$)ah&FGVgI]AQ9lgs5/:9Y*NsZ]AkUUT4oH4\Ybst%>9A*/>u^]AL#>,MhhK&o`nUp;p9dU[
>)u<YT!KIAgE?C8G8)r&'8&\[[^bVgHj/W!'APqcd`LBO&r$H>!:+KfBLlY$T%9%AiO$c$DV
\s!6/rU>dIC+P=[st>\T0V:IE-,tUd>_t%",_#8M/$$lOP=i'br2as3=![^Z\Ei;P.hZm6#q
1Pa]Aenir=78[eT9"2=0:*Nq+/UOLa=3%!rTDsX8)lP[>6f='P3aiJ#;-,9mnS^1V6Xh@;4!?
et^*nUUbIPk"b/<@7Pp)IrRZ6?sC@dch/B>F151rq`BU!fFM]AG\F.4>gZf)$V#GnE`''W,//
-S%2O[Yd]AH`G:FpsqFq_SE#93Ief+*f>IrB0.IG4\3$i-E&P4@-/m>-WHei';5NSK@Y$o%l:
G>)MiG1GadB7pR$RMs7^K+Qoe\%Vc)93[!M4Rq=I/+V!l6n*IV%3nU]A[%]A%j09GLs[l;2HLD
4t\o-USX68cJqd5`4j,ju6O<`WJ/f&H$^=m8=sjk>QJ()Sg6,qe\C9n3'ZT,Udd[ej4GClqg
j.#F'"]AI1F=3a`GpRAZoeO+06(JcQ/Ln'c)H/8*("N*f?t`Fj]A7f/;N<L5;AMp8eF8,\5rMa
U-rO*=_Y)`5+SQMFPV2cJ*o.F=1kuo-fQa)\lNlncnA(5=I7Zu'NumM'&!2Han)%3">m@)K]A
p22QTH<:X#:*?+jQtc91$`1Sa2$4M62UDK.N#J//>rpc%bBn8WrL6b?",;RMRn\!ZH2X@A?l
DBc[ql2#aBrP&P^,963)k03Jo:L#0U^m@T=^U>nilXE_,(XKt-_/n/e$GVk-D"<,DcBGIoE1
_,.>5iYE>gpGkrdQ72IkFf0oOR80sr#B:L@LSQ7^on:^9flNpnCO'W5aofA@nS2ICckuWBE_
.9Go.QFai^\DD)i40co`HFqWX8cf/.[D9h/H4FmYOHMG"1HQgs&]A*&8h8_J6OMEHM*DN7%R(
0d^#jRCO]At)V:bOlD7i$U[9-""l@7IpO7sh[!HL:nY!Z-6Q>7#gUO'2,J:_[O:*C"I6?E]ARc
`(?08%<oE##:HkRj_"ik)ggKB5n7`T_K+QWSJiNRImcn_77L2f?k;l9nn/iU8[:IWRO<]A02Q
hm;q\&R#5=4j/0Gkh3!tjIrXr1"0#3h<[dN^=P[uHphQrA.X5ZU%M`Fpp[5lPLR.8l<_`HK2
>g;B76oUu6"*H!RQa5u6fZM"nqo4S2B&.:MgMq@?.t$YT@-UcVOf,g\5lK`e$djXPqd:DpS*
nT&KnWR>JKq%*DkFJ\c0FK]A>_9.`5<Vl::IWS:LbI\?/3rk=oK=I_RM7M=\>PUe-KHohlj<)
)7>KaltNdQgp>YcSm?aG(R;JR\hmeu^\DEkJas`DqY\fJ&WNn4;a9pZ8CDepnRX9>,8R1%I3
$WC&:E8?a8gKOcEcOo1g]AbFZF0/-i7MNE"uRIbqF\$$^lQrm'[k&%";E38?$c0$jOC.HAV3_
hbq-15i$jACIHB1U9F,cs'Z8@UVkb#.I$uPeW$4LqZT2ZL!tpRnggO5HcnVs,5ddP0,jKWJl
WM"%05@M`l.!^<Y^8;]A1'iNV6=cg39e+6edW'(:W%96qkVXCeNpK6o/k;3ggi3&t!^15X)S=
j`-l*/dZkU28]AhEptqNV3aFap(gb_kfL!m1bFjAK;h3jMs4NA5quQREm:eq=1k223V6"NXUb
ME]Ai-VXJ\4Q<m,ro6d;s@b'dmdV5qBg7::Qoor_U+T`?_jF)!l7Ae4!61of42n=e/7b5Na>V
j8h3[BAMA[#&(_9iW=cna<K%!sP3mYcTt:M,NYlO&&B.o`Jji%T>$jeVNTHsu8t"`4EFU<=b
ifr<NkYcF_W5#fp\6I43qs/%OH_r/rd>]A,kqb4VsmP&Og+2:iJ;G\m47,RJ2E-R7d0!QCI1`
DQ^Z&!+W7[!&c/9GG:Yn^:&fW)$*OQ3OR\o&gf`JV^cNF2qVQXH<Sr[NR1W/h4@;"hk8?34W
d`NJo]AuT??F<`i'VmEN@+(He1?r[!-R9VaMuEdl)A3.&.a]AS72Lm:05s2+lp!8R(>@&?Ir5n
iMTdLHk?=6^hG_8fo^AS(nf;4>b0pFmlm5;5:10#M3hR:\Y,5Fp&6`4\UQeY1&j_>0USogd!
BlYP#)?_]A:$@dMkj#,Z"s)9@dI@,NfSSCCe:"M=,QTVY]AFboGuIY>T+e<rdS#:/;QJ>12%*V
M)M,0<Dns7&OsjaL!PcODZ?d&U,)hD!Zlj0rYRQ#18iM:^:guc.[@;qc^7_&H"m^Ga3GR>J8
>/GL0A12jm<O@R9kt0X'(sX&%#i6E_090-c/2+d+U5/pNN]A,]A'Nc?OdL/("]A:cYnXCSN9LLE
q;%@+M4l[#[pQGj;:bn`G*Mg/1L1@?u[L(7;sg<K.oTdp[_NtG+F,D;cus#RnA*HH#6cZSL@
j?Qoq;X-HaZG7+"`+dKT:7"N@h%%U"h2IaaRiZIeoI;ZWF(oP/XT"+#N5:llDSoK`><><9VN
)ZH+rtEfi.[n9`r9!Z??4_R?MZ5!)7_CqTJ7GNR_t<N=58'Z);]AuHgPFlJ8sXBqp;AubnAtY
e`?,s^A@8<Ca0nq!j5SG.o&=!'!(<WMD%K"<(JF).\?iFpm9OHNIBq?lUA.P7D30(L6lF'6;
sqlUA3)gN<*Il[:C*/B$PQ+jN]AF/:id3,3*e.aA,EGn`J/sK6R[PiNhq)`6NCU64521qY$gN
#''5^3.MF,sS)rE.<bI6o?</@LQNAhJeh6Qjh`Q/E3[*V^4Q]A`2E"q,!@2X&[mV_YhooVY=d
lU+TlFIq`#IHA'k7B8FKk5e"mAci]Ale5UGE1@A+jh8?;@5Hnp`a20U(O>)mq?#IU`mI'_p<&
\GhCR=Vt"tOR/iKkZ0b`GFnRJDK;!%3PbASL;_2m]AmD:D-U$s/?`\S;abO.D)E--j"\c:0<V
.VIQP3?_t8CQnmTAi;Am+p3<1`UT%pIV6=3I!u9lCqe0b596A0t<Wm0f(*Q7pN>JU]Aii92Kh
&sBa$dOAW9#p^]A\Ek]Aee\`)35je.3q+M\JW-$!2U#@TgVaIY4G6d#O'oJO;h?2nCEbe*@/sB
><0g,H.G45NISA`UuC4;="`W*Sto%96J&KZ/>h5*pHW@fnT)]A2dI*$?8=0\BLk65]AMLqct0K
.&IQ=%5LV.;aT0]A;i8QIe0-7n%KcTn6bb312^UmMO(Ok1-`;[_FG)AfdZ/VZc!B';;lMT4=d
267]Ar7<BK.fGiiR9q)20:T!74`HIN]ACtT!F7(UBQZ^f&#Da!/r>t?#*:ho;("P*9IW_9!&dR
)ZVs10l#^2b6s2R4?f1[%%*$Kpl^KQR@TX5#0a4mt"2Tg.8qV5eD\hU[9#H?iA21hI0'PFh.
U1@,$t2Rq1M,__*g-_b6UUa@TIW_g!k.BQY^kPH#)5S7hV6+A,9`%5\Io7FR8(:8#^#u!*dk
FGin0S[?B31kW&phk%gHW]A%/G^GT!QtZ<m0-9dj6oqA4N[I.S^%0o)>a7SFi,3mKur^U$c=,
-b=>rn'LA6$4"fDeS,.C)T$MW3if(T#sEL<_)BU,=/HK$pGN";QsPTC73`3sM%PXsOm0@Nqj
RE&^)Km:QU7#^cPp#8Ye*t.Fb(H)jJ6bG"67H36]AC=^l"$ge12DU<Y^XNJGqArT'qlt+B2,>
6)D:U8,$dUt=/-CNcEQ9Yfa&_t(pkjp)VZbrKQ1:j>XMU)o3*Fgm\_.KM)`S%SZ3qrRIr6`%
KsaNhjJd5$nudg8roN+4TOX%jF5N__s'$Wb2dMLTZcM3UoWX#\]ApdTT)jniS[iM9j$9<ph\c
6c.UD<k\/Nt=Zk\lrB(9GZO$6N?E>9^T;pT/O.mDK.AYkH4lL@9Q"7^>R?TR2K6ZtJ+<gV;R
WYHJ-c^+*#nUH'/eOA>/NCc#e%ne?pm@^!W#qpbs.V/]A/RG^X.mMPIQaEWf%3MD:O+^#mV?\
(1Z*<WY>4FI^2eha$4d*cZ'Qjn5d%+#XrCGfV?*_;BL&gQh&Qe5W^X]ALI0_dHg\A3Cd=SYN4
'@^K2V;)na;S387flG\>CqL8["I\3d)Le$<3OYF6?Yk,Gc"pU]A(n^:=Pib)8O`5:?Sh@_`1O
'*If=s33lfDpkL3_.bDd7Lb>[E&eMZ4iM+MXkS[3<\>E2ET)-=)$43Q860&n'VK?@[s]A2>Y@
"_Z6"H%=_>551g[ZSWp$YfbjC\MlnKki6:Zu/ASkIT\EOX.c>1]A6J4t1GIBa;f@R4<<ft'R9
\,f98a+2e`5s_$I9'Di$FcVtV:=M`VR*QgH(UV'2l5a0(2rS0rlfBT?GU`DLLGhDjiZ5#+9`
,gY5FT4NZ8JAq!\94Q1UC8L?2pR3<KHD:1hjsaD2SHuA?Yu]AqVu0_6:ZH'1lc;.Dd)PmR$KG
]AiZ<R2X=2T+8i/^A,kFj-ELsIRcFQA/e,qe<hqb1QL/+G[io4.iX>o;>Bj7SUSlT7i0+Ft0o
@!)TF3"IMm01)"`1GN5NP6Ac(KX?a]Af#J&GY[Jm`$kmr#:Ik48Oi.;c[nSl+H(J]AAF@O%o.f
0OifU,tV%(&@d8!REblHOjc43T7q"O;lVoQ[e[Ze/;G.L'j7V9I&&+2j%$S!P"#BKN*Je7Aj
QRsej_LR=I>EPG#X:022g[FhI0D6d^FqS5]A4u@<Cc+CR*QJhGh1\OeSXAD2bWk]A)BT'M6GMD
uAY[)O68$o'nsOf+f0Li5Kt3J&tPpeDpX-!DEMe>2FqOBjf!M<ds:dh=!2)C2-/0h-RjZ)P<
)HX77j6e5rFd^Z4`j=7.h)V6L.qh@NgbV1O%$?ctVoJ4]An.O(*;kV-`Wpb($aclSMn)UU4kK
WBTYKhfiD0-O'Y2X$X:CCo*FU@1B2Ot!/d&rQ@>&8muc#W@,IVH5;uNOm[s]A.A0>c7!JOi*b
^a.j.ld[m=Sa>,WQF>!LY?>VBC-KTi<OAA@^GoB\WY>@m^?M07GiYo2<=V@S9%,/)uTVlRhW
DR`j_[d'*bef'\?H2[8Ak[9Rh(3'eka!^a67,_U,T1F"9#+T<@S)Bd)X<,@Dd)l#"B>j6&?D
oq%!$)h.E)ct3'3-rGmuW3Jb!*)d',m,6m_,=P&G0GkbRXKc/%R'HjAb6bM-Cqk@9.K$p$([
2mH-0;CROFRNm=5)k)F#\RV.I^^W;^43E.Ln$<2-2Bo.#hB<j<8#ndH]A#q]AE\Hk152A)7e8c
PqYO#jj@=J=[S)#$+3&nBT09rcBjV?HZsI"J;='<"=lE^c#BEE7L8[o"bV%Lc)M`"LggdGdE
<27,DsHStT*BkGfC2-U%*s-)%:t=CrN>0^DnfL;SJ1dElhK:;9WbK,gH9I's]AI$_R'R,7]A$P
HneZ\Zr4l`_B6irhR&XXeFV6V/J-5`e%[4^DRLCiHhM2<8;RF%bmH4VjXkb&7]A/qQ3Q5pM?X
n&!K9\eOme^-;Daa@DG!`mA$=DK8*g1ZZ*<&CeM:iPRPm/q"oZ?G\M^%(oUZ2'5b'/U(im/.
?DC"DH4r2)on+u!O4''5V'Pon#r1oUcLc@7GqB:^ABcm>aU&deVPBr.4Hu,SkqfE4.-g-sRQ
(t.F,s(meZ^PtaNFB*B:6I:!FRhKLfE>BmKY#1*^"kj,LnR6:e5\pAn+0h&APS&AeSYkD:PO
uK78O@&TIm0G2#9`S?g)$_"')WqZr$bMQ&7*BOg>u)!YW[H.4uMLWYXLHJ]A!PHRg\G*;n*2t
'dHtUcNs#HXld$X&hOF;:'fD^%`6ZI4fu=V<DR3uD]AkN%e^r8'L1m,6f\27udt<ET^!PXeI]A
'qr[<C09d+tNIoUG3f!FJu>V34c%XtK5g*:+)Mfna4N\ZOjWYnKsLms4m!:/V@mj0cGon0_0
!^=u,TShQ)N14/J?/t63OURTNQ^=b/h?8Gd.):%d'H[W:Eb?:!8d`e>sEOa9ROqD`9Uu_/r$
&O`HLm5CNK"u5cSj@p$*Zt2#O9[X?XlYYU[</m>U0D@Cf;AY''j#`N`PntqTudMtq3H[9fjL
LH7>4"\Ke.?$kC\nEDW%HIIo3&<;u_-[2_dud$l3:kVq<K^@e5o_C'Mc94e.^Z.Z;lG+p';a
!;s1d8Rod[kMWO*<4`W#J<@gWIgk8t&[DgQkLlt(,?PoL$<fG&TbP97I&m&.$?\J:0,hh/5c
ALfO^<u1np8Ig4%kU7R/Psi"l1[LRWWIJgg)>T:1]AX)p2l"/YY9oLB$O9eks#$AcciMHV99f
*28AU@hp'dNTh^h4+RL69N4k#m.q,&DL*P'PdDP\AbjV$.S,%WJ?>_!9'rG%S`1jahlR)=t!
p_dj($oCj4=]A&_-^>Sn`_X++r#Tti*/X#2)d&=J0t^^uG,Ca]AMo%POIW\=i9kFohLH9R<hMd
1gmN%76s0hrOHb@rI,QFZ;3lj+_>//VQi+/YDk(#N>%TYJFN*@58'DJ9A6GdGJj;oAlfi]AF1
;Le%4;bTN-9>>U6ep/&"rK_Gl[2!CuNF3<9OLDf0b8:))\c&6jRT,$BF\Ab/1q0K.:N%Y`:,
i3H]A#/aI^R0dFVm`Q\%h"TfG1MP0Cbi5$@_$KFg]A(5o4-G]A1LG8;krp_cYYMS+ZFNLqfi>_:
OZhjK;>8f;bjGDnOQRUIGec;m,leMHHMS;ei@3U?8dVqe]A'mBUX`BgcR[8X,A_JA("/m!Y=5
_B:F'q)jg.%)q'<VI>V9gsugY,#%/!`Ho#40S=+6Mp@LO/$5fn2;E:\dWdU+H]Aj:,`k1(Y,H
kq=MBd6A-f%Weh_3AA']Ak'ngfg06ZP1]AWT87hikU]AOo%'c7ou67fe?-B,p7/tI<kiCX7dUEN
@e\%+`>)_V`D:Dp12YF!e,4d#W<^g;>J`da8&\]A<_.D0^p[K4cpq)NRkS$/'.l%j^bO#*NoU
U\:&SP]Ajg.#c9dCMIr7.@c^#gA=qM+B:h2?\@`7$QlieY;Tu%J>X-g=2X1[C!F-4\s3m#7JH
CMD;@>7j!2iF6K'2UH/Z'Yl7[ME'21BG;`Z2U$<>i*-rXpj.OY>OEmtM^H`P6/`sT'r1`i@F
_nq2O60Rjb9&O(Z??))PL6H'@82k9^NS"Z>(2GF.3YNF>49/AGY=\h79h-/Lq%XcP@[O+-Tf
(VnK^Uq*DO:k9P.^f*+cO&)4;)OMs'8(,N]A"$Rkt:O.3XJp3'K^9NH);I3KBG9k/te2$5,".
.8UqDkP+K72g<!/l;FV$c_:65<F-88Ti@"712lOW[;XWO<S:`O_Iqh]A@WMer([m6D7a,iA39
LX=e/a?@Ji#aTRZo<!0I4!RWf<K/2fDJs`YK.hp8#SL;l=/:."Z&'V(28!,;ccD\sC/Tj(1[
XFP4$sQ8.tk'`um*9#_:A:*qK<m]AJM$>,tUnC:VEMWNZ/mc?@:j*"c+'4q9RrEtQ_h3)CZ8,
S[ITarQjkN,lG/En5;6A#cgR@g(.gjRN5DNX#;,A`(c]A-r$XL,eb]Ao/;XoS6'4!f1WU"=$qd
WK%?Hi1A,,6qNAY"4MDC,b^)5HLh2e!@KHMKXf4FrNPXFE8dl,30Q#c!5K;[-kRV*qt7s9q@
:u(3qd(>V/9]A9t/puA&1P!_KYXiBjRElX52`:BK@c3%"B!e^MZ>!%+P$N9rfXO?,+#S.B=$[
to`bgL-rV'2B]AL6T#b<$+c3TM-a^*&9@qcjJ5<oXO4&8JeQi$^]Ak3.p,U=B7#8_mrjA0(Lqj
!bKVAI%aomk=qT1/gN[$Q(1S1(-]A=8AQp*KWJdM'^H'!\]AN$UrM[p"-5ji8Eo)Y\4T@a$Rjp
gqN&80tB5o9/1VVciZ2'pF]A^g[[[J7PK"*G>f0C$<b<kIIWlaPDb7R4-a"<!?\!SRFY9&4H*
tlW2rLL;F.0OFJT8sB1Sf,0[`B8-Ndlt:2+_No<Fi9"$r*Y<#:=q)<4EE9T`##_]AZ"UYtF=+
XkiF]A?\kjsb+m4#b'5")pa[)Z/%S-6&KX?7I8b?a8rfs6\W2-uL/Jkb#:\dW6Q-)"+,!buQY
O.Ro'eW51La4I=^NYkH>\S!-neCA<0*mX(eL'=5m0$Z78qh=a!?a'Z[d*j-0B:E]AcA`XXIF5
3$>J*,b+0"$aVHVsh(`PV`C6FsB^'apB3+(L&b0Ua3V":@Mu'"XNF(KnNmfZPqj`/pMSMJFZ
XeO5`"Srr8=.fHeN,k$Tkdh!5P&b"o8L6aPq8OC@j%d.H3E"Y6Ha0>^?+sX.Er*_kQcZk)sF
.LkR&B<.Y6EEcs9>kKd)clfhPB8'3f`+qUF5kCoZHB1!VKjV`#cmST/iV95&WpXG;6/C@+$^
V9#OakT!uOT#nM0"W3&'9Za+u=6RP(:ahRFR^L6_,>!jSl&r;@s/oc'l5DSSOZokQ?fPd7_L
YcRm:8N8Wjb,GFEa#4\N5']A'.K`b_-*3$SFt*Clj(SY`6ZA;*,ru"+?MFJN-fM!*mOgoJ,iR
trZOsGAJuFXgBC:lGgJAGTW_%iR9EHtmF^^U-C#Vd!Fe%4b,c=L1V6&=pPoQ3E"]A,Y<5<B7C
rA;V$(DXU"5hC#JW/Dj_iZJCA@([Moa!1q:-'S-YO,.M`o6f?lP>V)0$;PG80Gl3?7?K5B9.
Fe"0-KK@`MtHMe@"R83+1l8[)KEHQ?UZSD1s$HI+sl7A)#^&l$Na8Dq/%Th;A%'H5Wqec^\n
PfX,"E`_TL-gBnOYHKZrQ'"P5C%r`D@bon9Jo<OL.79>f778Q+&n$KQ^C(\3hI6,=!f1I(2F
M$^^/6@+Ls.Pt)K2`CVt)#8[cVr[paPmOB(<54EapLEqXGG#EHK9P]A/56no:!Z>YTt(MYX7a
4n9PiQ%2=G#U)_D.j%lFR%:K>##%6',FB>_4,TSaq`SXP'29G7@^q#@*k"V%oYg34#32lb<n
#O0RC=B]A\,<>1kiB*SeHFFT]AIe.Y!oD3dq>:AY,O;"PJp`]Af<=#.F>_-oorU[M]A3Yl-a-%a/
IaGs.;J$Vu@bOS0%8aI$5kNnqtt,[F-G:Z,eqJaWe*4g>&]A[F)>1=,]A</*aEn;:Z"3)l5:"Z
>#rEm-b*h">>dk"W$&=-2o<HKpjT7\a#UZ@=]ABp[+/Y"S6Vo@s]Al`f3f"jbA+GFr4QO*Up1f
HuV;\Jn@Zims_M$)[UWTJF<oD4m+"$t<.0B$t).t9V6q@-*]AhH:?\?\P*PB_mO\)rZR6MFUN
B*u9amPfja%JiGk*T@=f3fp?U"j/qU_f@*7q[25M^4-iFcRM>#>>*3GTB7I?!Rlm:ul+T5:A
<k-"2umdTHtf.#9I)GcQ2q5FCpEY;"[#R&:b_H,.B%<P66S]AV,$W,>d(:&>as!\I[NR4KcAI
e3>;,CpgPg1`1=K#pUALl5k-4NbAOp]A%rMs"0K,mj2pbj+^@1&c@I1XH-^PUjjo^UA_^o4>Q
S%N#-?&k7Ha'1M/4&3U4^$235ZHDHr'>]A2gl@Za%QeRgb)>#\"bEY_C;u09b*\K`@oPi.s19
8c6**L]A+"DM6`]A,puOIjG<q%dfa/$Z&!#"$&R_\&Mnt2a\\L#)1Yc:X2d!NZXIsWg&X?XGs-
N0KZ'=TE0DH![L(VguFJ\kE'P%'#a`@!1MX2oh*3O>7*IRnVVqP@Pbq&AkY7,e)NPn.g?$kC
7!P^qk`6*kK+;t$c5&"r2;6qA4JVaP.`9Ge'6(m?klCS:ahohYk*9/(=]ACe%)&Y5]A6"XDa-P
@8.#`(CH[7XC-E9h,`_]A_*cVY<fS"kRYKt8elR=Ycr_2tth?#2Op[$8:L,"C#J+$J%U@^Zg)
lsA'a'oD3OcLU_q2H[-oc,qPL4"JtXW*)(G+m7O<PG55H-8.kO%EWfFE@sF9Y6fHdltp/mRi
Z#=;eDJYh*7_PC9,eYL0.AtOU'guKE$OChf'spC[qDBA\'DPn,QZ)d7.V]AQd^^<;)=s]A&fGH
82O%/*2_T;U)nD>,^BKK6[*O"HgL_ch)$MC?CnCdpmu9E^9.)fGF%WcT4E+U@6VV?$=(SPR;
ZEZ04I/LhR1/^>eh1cS`bb[jQZK_Skmq>'ns%IJ$##*AX4*LKU26?Hg^?7m53X<[LtR1Vk+?
>6GGp8FMWL>i^/WqYf2cbr2!2`ef1kW7>!;c+MHnle<c'RsQ=B9r:noH"n,'+p..H&TJa?RU
'^2)"rn,n)*++_N`$RXej&RQMM)Ras[W=WfQplc!XNNs)iQ53RM^"48!U1cth/!kr*<O;VU"
:3^VWOtCA6L<Ib"^Xd>QJ1G&p$KtQ&N]A^Y4_X]A*^1q%-<)od35YWALU_eCOiNNZO1RU=NpoZ
b*I@B&BaR%ZMe$O=6h=Lb?[mYX32=Mp`<MI$Bb+h81W)Pg'7,2I%BZEUG>&:^'2AqrD]Au$S,
4(Gkpi4("K$6jK=Mrjqr2Dpi1):F`'AJmScknKkbHhi,GkW+a*r"Y]AnB016jr[HXpe%Q_+'!
Scl;c1g5#5J7<J'5iM48H,-X>P8diD(p8Eg[siqUJ)6VI,N4L6P(e:2!LZtUJ&'n+G4p5%VF
/agt2+<[COZb`KGh+aiXh-l*s:CP!MiC.+gn*-sH`Il`BZ[!`jUsn=XT=Z*&PoUb36I-NF$2
$*2Q\2f2%J<PDFdBjJ(qntB4N5<bAZ890,6Wm<fk`')/;]AQ*O[[^.E\jBP1n&`@)soa`_#A"
9W2FlW'hD,\$o6aAf%i<;Zi$A&J??BIdL:N\2Wg[Hh?BJnaX%0U]AbZofRFq/)lU4A0%=6[XN
kisiZ/1>gbLb49jtTT/<&kFr2MhcC?pFH(^quhC53V`[;D%YNr+a9*[;*PJ?C"a1T#c\\nj'
*Fq+X`6aH7?/KN(Ps(qS0)./Sarim3hbU1_Y%-ktj"K8N!QkLJkKau->30"4Fpiud,JOj5[/
G.VR!hjJVkEc&k$f&J]A7aW8SPP?b9+VdVT"FOrCTh@gidq167\"/;"'i_TYRM="258#VX#6#
uS`3hDj64(iN0<\q;S.]AJ)F/o<-!j_Di;("D'"D]Ac;JCkV(q_1;![Ip$IFBmj)%>C%"]A[%Fs
3,)'AM\!?X1LMBfr5XY#\CT["N^O-73PnX&OO@-;rSb!F#,aXFVafOpJ1>.kX22<1?6:Y%Mc
T6?Jk[d*XF*P&"%QEt)e)HY#*W0&[mOO@drB?E&7b+e(Bb8Bg/VcJ%qiT6_9P<p\\)GKH1^9
rSln)lsol71MK%l2Jd>Nd%^8<aOfT\MmUoCRCKq><p/E0cW=I`+9L[fUG.`b/11YdjnCQ3K!
5uT7uF&Z"QqR^An:1Tfh!(b3c`=/ut,mMci]Ad/3(eT<^%K6jTHJj=IPiC&RSEJ:&sX'&6RZh
^GXQPP+$%IiRljCud,CrDasa)b%r-+8%ZV"lmRDg8-FV$]Abf27f.'+:qhs1PC[B*E"\AB9Hp
QR\h:HVu6t=K5If[]AJO0"NX6[(@j9Y&R=j2k71i9Ff.HeT1Ka-1PSSkr\r\ZedEo1B_A`=>r
nqqM^?psj>`4uCjoN.p>W\,uAb6\q%BKhA-m_>2V&(l#O:4KE7bC9"iSW0F;J`Gm(GulGh94
P3A'ZDGO)ErNfsR]AMd,;MCenbMD5ps.N_C]AKq?D+_57b'd!]An<Tj87XM?X76JX*`c<P%6n.b
=Zh('l%ic*KSBhfJ5OaEKPY5W+N4ZjLLt$iJ-*l09HtEkUGVD9?D,K[>8Xu3QntL+h]AEMC/I
">s-U"R8jNT]At=qBDuph`QaZrK`T%nR/nS,T,9?W?M^)u:fBP3uuS:u%p@j;T3N@"tK@6VEu
r?B)[u4C2rcDdj?3F>I%,1Mfq*E14;Fr%;Ytd79V-31NF'herAUFuF4mgdCE.nYSqhL'j69+
[D#]A?`%%@-'H!R>q<Ol2lKe7jhnA^f=+^o<s8i?C7R/2'j)h2(Ses^c<DF59&8S%oP`CkTQ=
$LRcu7j([1os3&\e[CDnDaUr39#ne'_qqXKX+ZP_H6o6Q>&o7f.pUZVY2h[=PR%Bsdr<oS2c
D9%:;<aa8:)p>s3ddZh-32cN4&GZFN$nhr-H+()4_mg$.>,K3;igD6ZRdc2*^poQY)7A;G\,
<?7L0MPkEp6LJ<@Wq$Gh2hXj='(>(!?V.JD"OOGM0@2\D6j[MZ0Mk4D?sLS4b&:iUP=dCf*f
blr%R3kctqL]ApTgtf@agCCSVqd8@[P$%ht`Y\iInUY0lrXq$ljXLD&H`o]A>McQnjUlR3IITM
^`^";XFoDb+lIJ<+)?M.6?3@n&`?Uj5.JF99ei]A]ADOsXAmTi6^0[fV+g'Y/JMVo5Wgh&//Y-
^;:NOcG20'N9nm`DfG?edWS)aW/T(ScL1eIIaJtWPUb:Z)<DgQLL0(qE,76X@%j'ol0j,D^i
*,u6/o*V'J(2$9$5r3%$b'[?!1cGViQALKRUtue^)=M+OX<:kdHZ^7_NW9fn'K0"\WjF4U.B
K;1ETLYerC!a\f--rFH2L<N7[HP$"@q@06gta-]A]A]A$q!l6d^NM:QN*)FJiThjW`g'R8sF@d(
AibbC.cl)mU!hM<=_@!N2*fb/KnK8@k$WU'm+7NF&Mk^`D$H@BhClM6*Nj(Fb%+Z_b#*\*80
#"DsH]Ai42+l.]Ar=7IQeX*qF;FP&bJ_'\VhneL8k@%5<q-^pEG9QhY'lV_:Ul?oMmiJ['?iR$
mcq5$W<`5m9GF\-)38IO5%?M%7t,>h<7jht!\!-Q'OEqJ(2bikc=i).HQG6tUuJnetur!=`F
d(1cOYOV_e*!m45gIa)T;HmjNH).D-*V%'pR.1]Ac8>n"M[%Kn>nef\P@6UZ'b&]AF/P<ZYClR
G8hOD6*S(Qm:2983BG,TP/#)klGW5sC4pQ%EmOHQM;igkDN2C4+aQ\AG)fFSDq4BFXUsEU==
3#e)Lb6k2NX_u2'7s"NL=NFbE1mhWXPa#U6jYsf<ScM=f>MNh.9%0K^)HA5(8i"XKdme\2:T
;A>:<#A6HN;o7qSY"CY5)*%P8t5_dkY]A`p`AsG1peS(/rQfTo6HrY^KC/A-T(F(S1^e003Z0
,E8ig3QVbFMGlgaTK?"13!+a(Y)j9ZafEgrthnQ,a%C"A]A:n9YYA9cHQ#]A8k'dMRFqQk<8ad
s1$b8W5AR-<dnWc(f&[tk)8L^Ym)nC7LNV>-@NsY>9S=@"0GB`.<8(P@+^fZmlgs*0K5^rGf
7Tk9NWBp6qXiUodSTSITF&qr$VqFK1pHpf'Vb#;ej`d=do7`>OTbHg$MlS,L7`]AegXKpZiW$
i=pik(9jQW!mPr7ClY3`)_WG9mh-.X*eBF\NfhI[l7OA%p3jkD,:!N,_^#MnVWhauf\[fU4`
\:S2?TB@ldC=/`Q(Tu*DK6Yi-Vt-.CGfJmTT5=jNmV_cQ6$>irr+W0\Tu(2aK0om8bY(r%O-
Dtj</,#q8tn+`#8sA@o3[Sl<PKQ%O2YA9eMNEj*oPr5.QTJeU7"an5\Q?;SSCArIt16);N1.
#3bQf6^@k2pe)@PQk2nVA^t9Q5u<p8f%<\\X>P9BH;I_QOu^5=I-Xu4(nK,I-hfBVFX4J\K0
C/k$nQ&@L;f2o+^G!eDH*om6Dp#K5QVK%=5nB(dg^.1+=iQ2NFnf4ZF4>GFfc"NnjIo*Yd>`
2UP4RW$pTBa)Ah#:C1$FSI0BQdBUHl/Fd@BFd%aqFoe?V_!<t6#DgL4PiQR0c"7-D,/q0%K'
&rc"Y2c1-ZRM+cCa"r5.Z_k%iBkEa2i$DG;Qj1S>99$&P!,NuaI\M+_3Dkb:?uqkS#IHD2A:
k<XV@TXSqb704iF"5#^#s,8pQE[PSlmmF>;Z8<ujq!r<s,u1*dU1NOW=[_qr\8qr6[a34Nbh
(X5]AHJs9!UIj/fo`?@%sS+pV(?:r=FoNt8ih=4L-1:R1_k:]AZFHJFNC9/?>1'pROE(GCWXEd
X5>m5",!gWLm<01N]As^s.31!c*:4^$DXBf&:hnf-C-2k?Yj:_Er'b1&@0q6au(-cLB^t,)^b
%qNV.B=B=7H49q8:5lhFTF>tmYPoatY7a7AXmQ&k(<>Y&6p.&1Z*t<,!2&d$clr%oH]AR,[?g
]A^s2ZP'Vd'tf'DTY>bLh:>gk$]AEVS*e0@*3r`<O)T'84HMR-XEJS3lciPip-Z/K/I4F:(r0O
@Qqe6L^dC^Oj@a$@CUF-i1d@%b_"IRa9k'JZ\NFr/k+J+$\X1:I]A;IemeSnI69=QFuIiMp8<
D8SScDek&"DcnW!VJhqh;b"!#[l=3=LN+JO.Qln.fbF?QC3TS@k_TZ6Aulo<5!nrIq>CcO58
g?Mk$T*sYn5FGpC<`MJ9n-1(9gAUG)iRBcS043`d`a^<Y#<D]A&+#!hJ<\O[)UE;6I4@EhouP
N'9]A64[+8t$f-+CK#ba7@UBVqF<kP.g47)?pr-&,bd0to9m#=QED\"e0rUjgA55WZ_cRb&?`
A?Z5M$\7UiP1HkHGu>Gb.9.SpqVtlF"3Z.qd6Xka#f':q^ROD,*,i5ql`gj+3#2D>5V$fbJ/
^n*+cHcmW<V?`U2_fG]Aag>!Fb'(#([.97%OE1Z)Z^#]A3[W14Gt-0V*PkdX6T)q?[#$m7(kj&
$K^+J>RmKns2XLE]A3+IGh@#@jp`#t-=!63o!U>p%gepqW5U-AAUei[36@V;P(t'7]A<]A<X9:[
c!*,%IBo)6jaZ]A]A6#7h!K%!qBmfE!EJp07'#?(:4'-^9kq?5k#LZu3u"fo5Ja6LJ6u94o$:L
a_1/!idfZ+QJ]A/JOG5\5VIs_'?4OrKk:JubYp-;\u?bn0a\:X_;@bH6*\Z,enA3:e,6o)H;'
VTlh36e:5$_5BG=o_H1[JrR:(u9\VhJ[s(QLC?^3O8_"s-!Md0hs'bNh\]A0*isc9V'7Yo9(l
VB6WRt[pO@o^cQY$>lr-[nH6H_;gp2!dQ4$6(3\]A:FX07B*"k#lsie:@7$t)B#d+SXGjIsC]A
KX^fITslaA?42Q6W4"fT;At4BoG6ea>X6O%g;S@#K)4cQT-OYkD&(P[]ArGf.2:d6tPV0`_k*
CZHM;eqRI.3uf"[F=a_;0I\>TVq9&4sBfBL)aMDs2r^OEg"AFTM;FP"JQti5%"`cj]AT_D+fR
*1l(JJ>VXdc_'AVkaSlDe4-S()+SP-Mk*5KA>+gX>2%/A83p6]A+1.,?(9WNFoaHB@*<spo*7
Ap6GTuQfp=:jc$/AV!6bAO:r)cXOuOR!%m#"N.Q`%SQGCn\Cc%f`kWH%.Cd8JYmCP+l83_hL
gI:k,2(J9jS-qTSo+bmo-Tk(Oq%k1[L4:TrFZ$gUQ1mTiBEL4d/U&@jfreq=CtjsW*#Za1k2
;rAFQ,bZ!LG__htD@9#rj1ceUr[oAl#>,9Rk=Q$:1jdCLeIW'gdq9Pt$S$[<cp:tMmIZPFe@
-cs2mq58OWFPL)e<[J:ei4!K$#YE-/eH:>=hlA]A"qDlb<GloFoMQF/$O4sFN.Wo86MWFhfH(
k/M?2HXY%fs?]AqXl:`[nB`B!]A@eXN/jeOkaCD#sVOjdirUrkG<d(\.DVGIqm)O-mQ]AfM!:.n
?53U$S[85>b=<j1RVkLGTf5JOp<osd&Don"m@t2^^t*L#Z6cceWL2QH_^pD$SQ&ljbs@bf+u
`Kr]A;A%^KEst%m>C^_+r7RrOPC$\E3k>=?:1".q"eti$"R#]Ag0DCq#VBg&(%hqJ.gduf#,UQ
F+!OFMRm'q5(!9H5Q&(+OJ#7Jl4;(HV'.aqB2VX,MKQ2A%.?F7Kr6FgGt[k6paY[;1II%eJ-
<kW9nM3#*t%aJfn<_^FAac]A]AkqiZiKYfqD!*Y]A]AM`g<^+)RXR?e5!-&o8="!okXbE/:12>Xk
FLec^fkP&l@X#-;e&lcc#IN.ccI!SHTY4<ClG15[.%u.OoNhFOs0>Drrg9>5RDUA"H@!@.>"
@r#,FGPn7f(mctkB(9)^Gl`F4g.3Ub,<Flft!,[SU\mLal?ekP4+>#%#N1"#K%V'j.7R1EGa
YWV]AB\ZQ'i,el46ShE6%&kJ\>anQN&V1kR]A4'o$XT)Sf;BLeelJQI]Ag!V&m4/7RuG,arMM#>
D$.8+)T.Q.582mWn]A%77U,)keI0#*U9)bPem=lIH&45FpqR+85J%QXNKas!L`^Fa`MI?!K"L
"3s&r*D([^u8s;]AaRp(%TfmiSM]AZ8\1;3:ium!V?G[B43t9$SS85_N*+$#Oi-lg8Fslq[MCr
b^Gt\.=plDNCd-3_Yl9b&XbG*In*\+4':-$)Ta;'a74E=j2l#YYqMS->WE?e.n/M>L!G$6<9
h%t,_LHe3eM\+^-,%k0o8YjFF!e7Rm4BRh%Adr\eZR&+H3l<TRjhZR`p&I@2arBC*#0=`(f?
t?0+_>uQq"9*j+Q)FS`UnQ:[NgV%%=YUEIo#Qa&&m^s8/dOd3YpVKMHIs2a2]A\)=,:Urjt>Q
h`ek[4W#CNb=eagG,Qe8D^)^/mJrHF(<0lJ=Gd.j%9CNTkYW!qEO(L[6(,u9S?Q@Ye+,l.4T
U]A:Ag*6?K?Eg+5a>^U*TI*cKm91;7BMD>iua*)h5/R7c"?Ac1F9#%KokDK+JE!0*6j!cJWX0
oN*\GP.!?rSD]At8AZ3%3FE.d*7e.L7=R.Bkg/ISb09<q5C?iSk0L(bB,S<Ys@?1WQ&lKMFhU
&Xd_>O;QGi8Lt.?B8WU_[BTIGK'pl[ff<LaqBMV>#Z$Y6HA>uLX\Bg3qbk=BI>MUWk>BuZW/
,*;s5&3&6ICJZqOH!0%[,PCp"Jo@s+5SD^K:tr&d=;Di"C>+Y)k^V:NQuLbP?5N'\lZ<DqB=
'[hr%/T.Hgl9f&\A*J)uR7`15bC*@D+p0_N"Bs<L'KZF1)QD8[!$Kfm"2BO;8288Z)#)Q,K7
>k4X.>oj[hfCf7j.JV?A<^Md#.l"#d/=P1oRL;)_Zdk`T?A.eQpk_m3HZ`.&H2bAN(Xh[T^I
=IEiJ'dk'j;,1Y_aU9ER09RLIrCq>oZD,jq-@"O*O1aQ)f5Sm69<&C;WL=!VmU\-R<r`f3JF
WjnlMGHT5YbQep[?+:q._7\P1q!#gD;-#gO_Bj@]Ae(01'eECLe]Ad.F.?Fg3>gf+L,>E6hQ_R
He/S_R]ABFHh3!CC==FYij^,lY!3`2d1o*,,K/Z2nMQGhD`7XQ]AfOELN,cB>`99:(O<IT7loh
KHI.Pmfdh/L-oKoG(GMR$`FO79q-Vmg2rI\4gY>]Ag\bYae0+ng;77rh^6pnYY_GJX@+@f<8j
<3f'(TX6.mCUgA#EZ/&-#eC(/\4ka!c\@VX;-;jQ!+,qu:sP<'.o1.+4G*$B\+$/c^Ua37HN
jA8';.WnIo5/)N@#nnl'D"deF]AXNH1<h\[a:MuRH&Yf2S=\rap3`B^mHe]A.h+Pm_7biAKtZr
b`8FL"\n8>GfQ+S^g\p5W>Cc.W)/^HqC2d,C(:%P^I?TN,FNNWY^:sPlt)KW\16L!'_X)e$I
#h5'qG(QLurYg4*4?s5D4u:X:HaiXBPV60hlAcM#J3GN&R_G7Ki[1Pb]AgrJ+hRq]AOGPX"Crt
/H"MS2uaB~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="672" height="324"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-8355712" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"明细数据\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground" color="-1"/>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground" color="-1"/>
<FormElementCase>
<ReportPageAttr>
<HR F="0" T="0"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[2476500,1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2971800,3009900,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[区县]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[门店]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[5G绑码且新合约目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[当前达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[达成进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[差时序进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[排名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[激励金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[1月30日前完成指标激励金额（30%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" s="0">
<O>
<![CDATA[2月28日前完成指标激励金额（20%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="负责人"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="自定义分类1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="5G新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=e2/d2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=datedif("2021-11-01",today(),"D")/120-f2]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="总激励"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="激励1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="激励2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="2" cs="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=a2+" 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A2"/>
</C>
<C c="3" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(d2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E3/D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=datedif("2021-11-01",today(),"D")/120-f3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sort(f3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J2)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K2)]]></Attributes>
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
<WorkSheetAttr/>
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
<![CDATA[#0.0%]]></Format>
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
<![CDATA[#0.0%]]></Format>
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
<![CDATA[m<]A.=;qLaBNNlrn5cq-jP,&jDp*o!OaHV?YT@BT'C[8e"%*/ul#`tb6JlX0t/6!14;N4]AXPp
$cpW2PLa!^m>+8\b<t#U)G[1B.H"JA1a`CY@>6hXB@W[GW[I3G4sII/D[qgiHqoQ\YB@<c8!
=@(uHcNLp<gF92G9X.),epm7oP]A,q$gnQhVCIf)XOL&R+4[,q4+$3ke`oPoPJ=kD\J4$2'nE
;o8_LT`lQmp1'"rCt?,SNcN>1pGFkn-S:GM<W2E=rSHZ=8pSF7cM(<m"8F8XtMl&BN2qh.`&
3&VfI8Jm7ZisMN\Qd(c8?U7Nr?saR+0l&EXW<C-d0VCl_Ht1[&MdVgB,seN-j@"n>>]A770GS
Y\*P(:h?3+Wu%sP(aS'^gRmQ8q&IspbV*>3#+P^/S48<g5U1u&3B<q[eBuH\3"gI[nDH*^b7
]A0'XN:R!?'>SDhoqW+NiX_1Z!#aW=BliDNYoGf,:j,LE_dtcUip)d*A\ef)[1<cJp&kO)4U-
R1-7Cs`="SMXfSQ,D7c:O>pB-JEbnEPSZ`45)Xsg&-UKlqD^DLL_a;X\NfH\!S>V"R"6YA78
/t[^SBPqQgE'FtPOZ5j"D6d+6>`_Pg+_;E3bFRmZni6s`/#.%NJlQ7B!I80#ha7jb3Ua(!n;
OUKZ%U[i6Hll]A-7A;8B.%`q=Fr<2'Nl7\*6W*290Kgc(!5=RMF-=lBN;ZS.-A#Rmf00)L/>l
Bneg0c1\kFc08#/0Dk)sL%/tnrD+-IC2Af@[.F$_d:JHU1IKtuAaBrp9:S3df`IN-ZS;g+kD
dQU[kFO"4:O./B5P0@ZL"_K!RL2FmF-:;fic'cJmGRAhau+\@K"T/,M%dY"DbpP/i"o'!C9`
Y)_6XkmsKeuL>ok&fF0oofTEqEaFU^/&JeP[>CWl<RIp8#+GciS0-PTLIMV+'SK2\(F'11WB
(o.H3)>!7PAru<^g")F!]Am7I51e%(g^#^]A]AgT3go\%Bnad%,0N`)VW4=2SnlZ&"</EF$M6&g
aVq^j6X89n#^amf1<Zg6_AGET(Z!^:Q\a#L(VnAYnBP!f4jdLtP/d^AITG@dJnSjj:'elJJ/
'F0&":<:fB-/[V0XU+OnBR(VJ:?C/hcXA]A!rU5-brXgENF"JYZaWBJ7UYT,m5`LW)5.eL%mb
<V67*VZcG'+VE$qWn&%=SW6ghb.C4Hb/t#C$Yl/7kS%U;9Y(lb]Ah?JMMZlP6V6,c.p9-+dIt
B^h659`in$(c#+B#OX8(]AX@$f1hIKjbj>Tjq1F?*#kPuWm[gkk/-(Mu7,`FbcFr51KpXon?j
XhW-a]Ar9h5pAAEb>T*2D!RD;)`=s)G2>Yo%G`c$*M0IIUR"=@0hSi)S/JatbVd"<*\KjN^Ra
6,%LbC^E6]A+k3ku/.qQP2<;9#^Nc1>`"8]AC?DQs%&uIdpWNnUT#OB.I?I>"5@CG6]AU&Q=6"u
ql]Af3]A;)57D@6dnjSoM!-U+lCfja^TIqsGC=V:q]AofB7LUF3(sG@`,Wpkr<h(a0eAb'aXLX"
9LGAM@5b5uhGW%]AVugD9`uXh?mTC`R95>25=WdD=#L%I@DgKm/Im&(tDe`dZ6Q,ER4?>[r2!
X$Q'&.E+4Y]A&@pKelA:"A/Y8a6(SAeL^V;PVCu+B+!@sqGTYd1nJ-R0Ro9N]A#6PLTGXE-5P5
P6*;8UYR>kSbijhA1c+5=1r)OEJ[Vc5NJ?%C_&^C5]A[.M*+=)a4?pYPR`"$ZfG6>%u:T!hm:
=!,tnI)d5?#2K:RR[BB-GFI8+:8&.!ZH\u'6s-;XW2>?Hm&X,cfT5/fB%8UBbk3m#`KPY"pc
ATMS-P5/@mY#UH9N!p!P6b(P.im1js-4&<ZIN^Ha#.!i7>e^dj1"%+_B97g04i<G[kp9mVje
S9?WWp'F*?W^kObNsDe/UVAas`m!mo[AhkPEnYf8*&a_P5b/1ji&Ri-&a(?!PPU'+EP-&;o?
R^q_9Mosj/M%!]ABdoc..X1WJD<TqGWBj4j%dMDgt;')'e>K5hDN_'FhT9D@!'oH>B#.=4k0G
Y>u8[hLif61=/tk9ef,!+Eu@9``f+>$WK:h(">Z?63`0EK]A8?OY37/Z/.YU[A9e4Bi@2%9+g
n5fA@YaXdRjc^arE5,eb1drfu[6SC.^Ma<0lIM<YlY]A=mI%Rc'YI0!qMnVre.=_lPUCor"UF
0=>&4'':I'0?H+ZD0=&XE>F`_5(YcN(<iek_=XGbA[5"o2W9ICoMU(SDnLd2"p!<TEV@q]A?N
^E?3-OolD>P:QWaaYo"oDY7.U4P!D$&n-"$o;`4(!C/Hi<)c%frB.GR`"`1@JhA<V>TaL#VA
b)hPqSFW'g[PWn6@Gt:VM+$BIs7?Z:QF58F7Nnb0U6FkR0_6?tupYARQC,\>nk<dH)YE:hL^
,(jaOXJK4m>l%UZcQe0_Y`;&b2G"em^e[<"RMB,m6N,C^3J;W5!I2n8rZL!9k)@3<.jb[kRG
c3+f'Vroj!?)9Lc2+!<X)kmP)8IlXX"b4=Bl.Z^<:@81cTUX(*me0n9Asf$Jh_Rrn8IFFN0[
-F=?`m@g,2O4*8#nI-"K3(hY!0N@:gE0bB^V;A/7MQpjqQ2"-kWZ425>7--j=AcU96/-6VR?
3^"0"m:`l6X*,2_lZenS`h*U7c/hkN*;NE[h)s7(5Y.:lD^:\O_,XW6qaV2QC^C.rZRA"9$F
E2eSEArLTC#km'`0<`H)$Ke@"mmb9C/[p;r2,%F0SJs9#R"56*jCURaslkp5Y\_oaC"=u6#'
-+6sp)uO]AH7f?A9%0dpfS`ke@X3Cke[=m\6,S6XD^Ul:LUUQn2^Fs7F!9JS+YFi-1"+;r=@G
4lNb!hf8)qCnM*L"3(ABXniUFIkjNB=Bd?=CP+]AeN=kP\Gqa9X5!DTo*7`rg"I&RbG6#Vj<I
026f-l>>pN&`L$aq0oZcH0>r]A/j>VK*FE+*"U&sr2c,24,uo<BfUPZ'dQrj5Y>gUEif$a@Iu
8_;Pina5NN'PV$`)P5nU@uNXfuQJY,>.o%C&VtQZDU-G<>C@ERpdq/f1lXe.U'%?:AtLJiDh
9FZrd>^u)-U(WcL\_5s@$;nnuEC6<C#WGH(1e;!Gu7SZ9tX`4H'OH=h"5'KrpJN,'/*kMD1e
?.BNJK)cUL_H?o;?+Q?qupRJ@ECu/.uQRE1K=)LMT\>R2>5[If7NU%AC^dJ_7$%_2bVWU>lg
tQ-+CWmI/>1IQTO6/>'aj'0V(j'7E_>H]AC!52o$-V.B_AW\K9JHnF%O%a?tEUYIF<j(_]AT-d
)/S:L*o"E'n@pu#TG.smaks(LP-26T?HJ(N*nY&A0rp_;52L>UX/EmFWTo3u_2'kGp.LO:/5
W*<Jm5:*bi*"UbP`stiT7X4@sR4-1!Vol8KH%^A[Cp`>T_at/F3OH]A7ie!iPWlA%L,,$0eI7
c!c:[?6aOOC`u-Pb]A,eAr*P)p+PX&*uH8-n:b"A#t<')\9R,bm=C^WrmkiRPY`ARn>F>qu&I
q;^S7S%J2*q>E.9(TRSTn_;BQ%G5GIkL'fkHUfj+nj;hkmtI0U0_eF'CTA-bA;T\4H`m#6un
->M/Xp6C)B-LO^XA,T@kHQ,\=TPj[qPT?U(ikG8%LSd1P.MKCED)jlLhePaIN+'L-&<'/uRQ
M@:\]ABf!r(d^(:2RM?X4'F.NKCf![?@+pKa4X?L?+lCbU@u#h03o[G3ZO9=cK3%qD&VI^IbB
C?Zb%)bpL*HXUaSge?kL^:J(&XpV$_J-BR\Cec3?\k!%(,=RKjb!"T;E-bD;N@@V5UnNg<X:
Sp/q+Y/P9=nIu`f+h<;qNjk@Jmhu?N<$;D8Z]AtF`"noFSaodsnL+.PVNk6Ig/O0cSRT6IVZY
Fo`^C.CZ['QggpjB/:6?!ufd\[]A$\LN$uE7Wl@4$&nG#KIh:g=4)5KCQ#OH87f3C<pFBXqaL
Ce;jV>\Kf!>63n0#]A4D5[V:j6rt"/2*G=M\^Z_ZD-!cVqN&@`Re\24kTQNc'Y"Uap4ILsL/;
6H<(1cGP0s;p``W7<?A#?t-4%FdUI;fAa3c$=+&KLKX.89kc-qLq?q4pD[pNB;@M@GSk$36H
(.k!WYt7=\q!8WtoLE![W^sa`lmeX%P)$lQHH(Dt+pNc3-!c1+_I_2g/+0MJQAk-\.T]A0Zuq
+Ydq\d0"I[4$1Bdm1XL)a1_T2ZfYu)A3%)]A=,J^_=M;M2+E[3a`=6!_-6$-IuHa?VA4\u`N$
urDKWVqi+f).@h]AZtib!9O>p",2?SSe#rigUtFC:%[5f>DHWhA]ADou,ItskHa/[&j*5=(2'r
2udp/?=%onRAFnA;:g"'Mr41%>kNti7&H6T2#(,?3->e`bI@5bMJ_\CoO]ARC=/Z>bf[0'7IK
c32Y,mK(u)<.g-qC7GbFT^?$5q=>[J"4ckJ`JuMGWTW;3bngbJU"6`h%]Ab?oL1D]AM"mkqq2.
ubUQ#UT"+"(b7&>mWNTPs8]A9^>D87`huES1GP*)-aOmX8N3q(jYu<]A,>'HI2OKUh[npi><?e
eD,J*c3Y')E:#!G((phd9LQN\;0.aW8G4M&HD.h^o<V5,J>[.2`Y>STM+OoKAkqo4fIGlCB)
fQ(1FW4s>S(YLOg<a:?;_0XYV=fs)?deUX"`id)`qEU0@'7b$Et--3Q;:au&#_4W6SgMo#Z`
nA]AS)j437qM1T)UC+HWVd4=pEXDG38*sWm20,p0Q9mj%hO;$u5F>EX)C8CD0da\:]AR((%NIl
?+(VT"1D=/1_l3&%RE<Y^<_YXrL,n?6DJ/Fj0eKg^$k-Bk.$<uMb1":5YqM0<riT6b.nJDeb
!4nUdTJp!'>9b3W0PJ;u"<QUJ+33iZbP]A$T-/eFu'F,?]A4.63olLdVHhO;`_6Q-[d5"P8]AL6
K!9jZ(O\T@r!AA5f3rTlW%Zd/:maSP9$M6cZ%e7C*kljGY+fr'>>A6+WC#?H8S0qTiq&$&M]A
dr*3+SF,YLY3'/.lDV1]AJ!,Mi2'stAtI%\1`XTB1h;uaf@#c5+ZSo>*lP\c\GIIY?80,[]AFJ
?Y;R/\jdlpFFVdHZ5e&tJ6J/U3ZX-,UUC\`A#L=tA@k6lgh?4KNh2q9Vtag3D]A@/rDTK!^10
4[S+s0H4:tT]A(]AM,']AQ"O\Zi(K>g;qMsD:W69NXlaJYR[6FD%]AoWf=#HR"]AMr(efp5Z$j!LU
kgV;_uX0Tt^nQ[K#5Mm@3V.@BH1ln)*-Vm3s.pc>I$]AV"LNB2?SR+I#+NB_Tc7[<IKiES0m:
K^Q"NbJ`AS946<^$%ub"P<(;f<UM":k$]AZt4`__`S]ATeEHYWoY=IUIT=Q4ouI68QiuFf?"-3
85[TOQoCIcP'oup.,UiM1D&F>opL/ODiaeko0sDL->&u"2*Tb]Ae<a@aNnSt7bXKYR<KL:Sfb
Ag[HSOijVBKZ9f\E\QPfQ3S.DjfSU:PY`#ddK3cTG?Cd'aaF&0_<=ZrKXh<J2X1r=-)<dV"c
)"BYF>rS?h(2J*KD40A.1fQ[BJeER[$u;$;m.N3`+.26"=tl(0a[gjXMbM=<We#eHiA97X\I
X\qXQGAeca7[^R#9ibKI%AUS!g2.*#tnnWq..m&[+6m3RY<=i!@WWp_ln"OK.t)Yb?.k9X:h
7]A=96eD@3tujf+Z[4gEf!oh-@)EFd`o4!`.Tj)aWF7k8GOo<nO/m`3ri(cF=ieV2c$gtmS-)
;&Wu@NM7YBV`"LF$#8TN^;Uf8,915qk@20T1o"n`<m/dDChaCfp8jq^:jlM?*-</C$OA9R+Z
R([`)q7=A&DmVBGbLDo(GQR*K.EQN@2rU)]A[me3e0F@D'-hYG?"k`\q.qA3`ZVPM(I/dMT09
cB\'D=YpNSm0Kj#iX-O%0P3NDIAc"iLUO)BLc%sP_\.h&rl6JS6oi\3Rq>5:RB>GWS;F:4Sb
$aT%^YrGK0QP&P#hAi&GWU$]Aq4R<![d"9qa32cQYH]Arbr6Mi:I7eA8>+Q;q.(d-I&M(\a!88
2EF7>i$a+bW"6OSXA2Fq&VmsOe:^h=PU6\!Kls%'IZW&6W$]A>e%Y!uR@iY+jCUuTTlb+eb<*
bl(k'\Mc_U-.!Ah0sQd!\I,V9Mp5Q92XOe\kpWAedP,qO#*Im,l,8\3J%D$)2T`bXC<7o@nC
u0B#>SN\?kj7U?&eOo(Tt7V5='Jou.5/o>teZ=g6Pl@)9F/O/'@q-Pf?r]A&A%+3u*^5I$YO7
2,hDU;6nZiJMF/nEM'&4fd__.&RCTMRe)IKA`4;%f-u9feOf%g03s>Y=c=C/UG@cGpNLT5h^
Ne3pcKd;EUJj=p5o(%HS.QaY4Q+Y<5W1qAkC=McQi_4?lqfue"65CcLZ,u8^H?[jPR]A\C4)t
=_OVL:4pf$[?u'*(9(k=GNJ96Vq9<Zl4R/7R?K93f;E["CO(tV!`<[#3`'7!cK,<W-L*thr;
Oi,B#[u@h<&UF3-/rt4An3sY%<o5bK(PccJY4b[F)LSdR86Bnf,P!2-#/ub1IE[b8$:P_AmR
W]A\FG?+0!F4N%riSgR;!'=@GPu8Y8U,.kE8H"ZBhY4e0u3l.S"l,VQ2^.6\6eWS!M]AUl\?JG
"It&'\=cPu/ADq3W\k.cEbJBSRIBZ357G86(rZZ\[JNNLms@kU(^c.7IoA!8*I+TaoO^QGKG
q)oY`lKmi.Y@*4i3l^i_1lMFSF:#<*HO?Mb@!aG@!P`"X5&J_=QHV/*uXC@n_810d^_s!SPL
_@P8[,=AA9SXR;C&_sP:?::bn<56#.+GM4:G%>@b*k1csSl\1R^[F5%g",W((A>cLl[^^cSP
DR^g\;_6Vdd?Mokl-LAb&t!J*9,(BmBV##g?!#=@K%-ZZ:rs<i?_V4S=Zu3+2it(5EF1hg?N
FPR92<Gg7*E9'NfE#/JW-jU]A($m='_7Hs6Wk#Z-Ltb!ug$Scl_^cDI/@ATD!:</"$2j.c=;e
&b`hW@U+,Z4J1$6)28Jq%l%^ZY--A_mGW>,2;E0Qg(U>BXsXnCE@O--3H_;Q$(%9%NBd0;:V
f"u2n!es:Kqi/ZF8;63g)\Zo.?oG-ZF52a?f^rc$Qkm)j'&_0q#2+Jhg$M:=1,Y*&PaE;!;o
8P3*$q8$%(3VA';V8@B^nK8.6p_NEJ+P3'qcF1k5H;fuF:\3(;,UiSUj0E/'4ikJf8RLR*6k
(:rC8F]A99[$Jk)j3AlX&@LE#;(Y"j`T.45A\Lam2ZlfkEm[VIQ<?;J^3M8K%NKXrn%,*3T4D
m8jMqONd>Pl[f$jW,e(Z899$nJR?uJBUPK;#Toj5N0q)dcGm^#]A"cM5aM1KIdJmn/7LEjJ0X
i"op.mjh/)*[]A&-5hT0tJ2Tc"S?0J(2i)JQgVJQH)rccHmlEfpL+_8r_L-5>CuZX6&85tThD
*1g,CNEr2[2]A=6A&l+p8qC6dqig?rX*C;#G:/D3inS'roA9/.$sIP81'\lE&W?C_F(5*Vlmu
d61u\0=*'uehA#P:.a7QtTnlCZ<kmkPG+`VR#&Ob2M45U+l0RLh:)2ABqA!#:)4s\_Gl#TsC
N$=]A(sbub3'VOOd>$]A-V/>A9KY7]Ago1\8sZm-E90%u6`Cgj/&Gkg8;fnf%D?M<t1Ys5:+s2"
?b7Fea79if\Y&jOE5<1Tg+Jh\ii3gn_a<hBjcF?J!\L9eB3!UNILeh'n.<FK7cd\Kb'Sn_Pi
af'h2^8`Hg$F8[]A5;oNjlPJlk)5p$,Mo/(-WlWc(qXF"u$5mQ-iGJ5nS1j!-\57N3%RMB-`]A
+Xtkrgl*ThAN?#6an5,//<JSZUKjZf^DdKbhiQeU1#>1MqR.U;K?9Ne>/T1+=Yq\f4AOf.>2
/9CG%6+b9e!ETojm%!u^_e]AE-%mj)PA/0N]A?d_Nn:<I0:'buZIMH5G;aT%f<6#P?M?)q+"R)
(?ZWgoD0G]Ao%hU\Vr#9ZK#Br?*/Wq-M(g'H\'&%3@abUe]A]Agmi1mBm2&SeAXbZc"k6FG$0]Ah
5'Al/oeC5rfP'sVTK$#H3LmYTo)PKYj4!rnm+iD3ms_oKPNkdZ>EY:F<op'p=@qcJkK8k'U]A
!/IEA>nF-fYs"REjE9RmShiGSpuRq9fKHW&X,MO-58F\Pobos*,8pUk`G<C+^)UudT_Sd`ig
qkF]AnojJ<SZMKptipC_]AFR$V:Pop,e!]AiT$EClOu(e!QPm@"+;&g$CMQMAiLrCKkQK>=INaf
:Rs2go;K!in?V5+Tj;Kf?0OA*RY$mK%Z>rue?jCu$4=-ER4=gQ-J!rr>:usXVkE3oq3UX;`A
1"\oX?pn==NnjjOA4^CSD]AOW1uB)s\AQI(Xb,>thNTk(VkS\o+rgP'CABS3SIsPdp'!(ncr#
s;E@T5+l_0u5<SsPW/A%2d1m3N1+S3L^'9F]A3X9NOF]AZ&KI*k7Y(76rI3jAF2A@.Vdeo`:sJ
;EoOrBQdCSmIuN3^j0CBV.M",5I6YD-g:hH_H!Vq\i=pIHr),h0iZVI;P1DsaoZR":O^nuF:
qh/oa[L"-8QkK-Z/*:6(.Te;S9\f9>1?-=MVOC%BP]A-C,=;'qRnnbVkbNf4Ar%I^HMCMlS((
S.tGL7T+=@(<s-t7&BF4p[)r_MjfM]AAbhp/SkF-?E)*6U!+%JPo?"`;+aY@BriI%\"A.mrP?
DEZC'U$<$qj2s,F@CHSQAA9iEAcdD&66sN\@2)YiIRO>+Ga9p`hr;O0a"pIL<fdu2MaMF3,s
10!36b-5U+/F'Zh/B]AOqi'X`qQ<Bp-(Mao4Jk2Lj(U^EjpH.FJ>0O#R.,ST.\`8e9?]ADVXK,
:msU=nA`r9`aoVW)?'pIT4Q@ch/FS"5RY07aKTqGlM:(gR<^t"HLUff:PQ2HCF_r!0.\9^o3
L1tKXZcFZi[``,Qh4LlX<goq&D2<8#?XK#Y44gNI0&>ni(oVK\-X,+:W1UbZZ=]A:sM[>O(<r
)iI_pgLmK;CQpoQZk3(bY>^?RDV[m4.'R!pYpno5:$DF;3P+t"a)kZ8.qQ$WZ=<9im+^nqL"
Y"d0PbB=tq8%f?L^[6G:W99P@P>;rccuj\o\t>S2929I%1<@[BJ>rK-FU9(r3Vt[*Z8B5?Ph
.ig.r2(W2(QHFOcI8nq_8!)t?b0U!*S(`:k*O=nsb#382D$`cCdg+UGg@;"f-HO')H^+l5+F
@$WaOP37,A*3Jg(Bs8RBqW0>DaAdl`etciBW\8'U%^*VfFk0W2[3mBl3qu7\o<]AY&We1lpDS
@D*,Z>d"aD(6E(E^hob3'imp:cZ8#47_$C*8%;5J.j$Ka)8&<7S8m-Dbkf+*Hqe]AcR,%SbYb
ZFm)S&>fVs$$_LsJ@PBHoOOe_'/23X'enX8/>Q^u1Ea=J1mD>M,op@hsDRn$5LI2M^#65"27
V^tPL9=A_dtaHA*\!"0MVI-=0ZPE]A:UL:s\lo3'l&EBk\WY=U=Agc(_`uH:hg6i>J3XJ2hM>
+XqMjg@:44q5QjNSc.D9flp/2g!A3j=4HZ`1Ccs@'&`6;]AOX8<QC[5K*1Z'0prDVJHi>dgP5
#@uDV]A\[f%?5PZ*G1`h!l-.<:Psbs.'@b)rG_u_RQ?sd[\:&[?Bq$^X2kil%.u6(Th6c/`q#
S4/Ub)J5."fgZ'@)fu`blqh/ZLj2<16aHX2(^C.aZ.'7G8+s\e<(s-)mJXd'e^W&<'.MK,3D
`oQ!/a<PQaa5E,mT1\tS0JW\.s(%ale:_5K$pp&kUrR7TV<:os%</^htOpTZ]AF52md3f23-7
WdXGO>:T3lAL%PK-<o?Gk3$g#a-H:,/0rd:8_p.0QSW4MiC.K$rLTl'<+#EP#5!YHl@a,-MX
SrMhS)''SIZ/NJ,if#F)4+\=TT)r*8DmRt7Wm_A"0^%GZEXT\p(H9M0-AK0URrgVoOM.2Dtd
DlqQF(+Z,3J1mFk%6lKqhH5=Hg1B8r!B>31Xua@8Rc)D'L^h%G+R6e,mUZjFF55O;.Wr8^*6
@pRp/!8ICFUMW`I/PMH^32J/a<5dLNB*F:[dX7dJ(S6Y``!["Y12s)Bt9>eUCWmOS^rq$6sc
o;uZ\Jd\E`%d."rLfbT5OW_tTjoaF%tr<1hDW-p\hRsaY5d!>W4aOWB>f/MA[mcc?j8)G5Fh
po#t1T`3Q'sk:k@to=240]AiOCdSK3/qb-A\Gk_FdI#Wf6^2PHN5=p#=]ARQl/A$D!)cl(/112
D8gE%p;bYuXP#Q_cH<]ADj`jm86GQ?(?8Ygbib^ctAQHn!7MN%/'(Q"oaYp0#s+G$W<uLQ3u(
@WRePBlpD-]A:Z-nR5]AYp#s2*r"g*O&(?eX_o^!Mu1c:XMh\O]Ar8IfVV=5>[.-k6:'FadR_@%
K[FkNGS1nW,R6HtF&k`kQjR+-XN$H96"An?QZNbe1B=V["G/fR%kuA?B@hOH3le1,'Il6#Z&
mY.g,I&8UYhf=b"sd-8MY!M+\6ce_\-nWteq:&#i1dEs-Q?+:]A/e5ZsG&RSoGfpr&<`7ULbF
<XQG9]A.>cp@9=-re=4+OtWfP#.pAZpB5!`C(aF!MBOoO\R$PO(QU>,3)D02gIi:kmoO9"8g=
W^ftub$&2k]AlDs&LQ.>/3F[\b&<FB'm<oO'H^6/0,V*K3*Ckd4s<V)78':eXbKmN$GuN=SVO
k]AJD=<g^KH\:0)qg1#iN_Z*H7?tqnX]AI`KKguF7&O'cEI)2MMKjO"Q)M>kd]A57>?c&4Ce1En
dH*E$"a-2[MFt"kbXmXqtY',l=]A+p6F@pY*uIEPEnLK#2(!q"tgutAHe_#C<]AfCn)8T-#u%C
/L3lfJOq,bngO0JSmY]A*;]Ac=Sr@h#%/W,m#Z=8.co!@\ti8HZWUO!VK15sn<!/8rh'Z*'tRW
;=G.L?uHnA>b"^^LEtIFeC#r6mh`X.K?(6`3Uq(Y$ROVEM9C-Z%684dH1(@h`!M5[LO!DKm3
8lhpGG]A8u4KJ+NRDAPT>)f+PTdGkttm`H"]A^NID`Ep"<16ILKc;)AI-qroknDhg'4CrC1q;q
Y*p:196R&2RQqbue(l;]A]Aj!]ADTWmRj7_GhmZ,=^``t@O,FY[S;I*-SCfKe'/Lg>JAX9NSgDb
1T;R\-rh1rDH\"&FXUMq\H/EHd0rM9]AM&_BFA.Hf]ARrP4@S-K\#RqI=Nm/(Ih-i;7Sh-,\Jl
So.EjO1d&OPh0BCO0?;9`ebTp73ZDoH?jt9`WP@2K%&-o-*<X(Gm:]A9t.^D:-o%XCcIc:,l<
Q5XfL:NrVD$G6]ARC1bXU(T,Lf[D8"/89ch@Pkj(Ck`t]A)RtK9cH71'JomcCY^mLOWO*`lU]A5
qX)`=?UAnV^RA-!H@ZLYMT&98bg`qYY0:3Tg?WMCA&q"&ti3hcchaEaTs!Q;SAVQD@9=EQ#9
bn%#L?\:Y+*q`>6Oi^Z#:&6R!#$@jBH6HKK]ABo1-U/D2@GW9qPV7@DO-!KX2>ZrZt_?:\Zr.
tpS\BPT82$NPd>S%/X/ZrRNjac??d"M&N%/8JGqA/6)'6DMRs$j$Cr-9lj8H&Wn?0C3=.Tu*
$R^6)0#"VuY4]As)>6m:l/\<DjK<YXBDg5\f7[oFpOka+jXCkgk<W]A2@p)KummdUCc9YQaMml
M&86`W=VN"^;S_oZrB@\H,OMq6UjKA2p04[[66A<mE1ZmPWQPcgee?;W2qMqhAj6\b*5()_L
'Z$/FBX*UqMN$Ld%%$BkE3(;U]Aq-1>'qd>#GGlh7WRgit`1N']AT(]A2%M;o'kuYSa;'^J7L7p
,:C[F]A80VCag77GZ-?>ZCdqrg9!p!%eVh)D47#9=%U*ci;P;\E%4%d]AOMgS*$*NQ:2:i)B+t
RPcXL5oa4/5?8@$L-W<IfukRg9HGiY=U;-sBd+?V@t-H__m669@HoDM7?OpIj)C]ABo6te.0D
Al=?M]AGeJFr;_`qZKKbFrTfV3!F]AD3ZIdGPE(oS$IjA_^Y#`mkTJa3-Li/i:E#Na/8Ie(<55
$]A,F.8+_F8,"]A>;f\<h^((_J/#3<da!!:ZhB*;#4t@dbj_eFH2=)0fIVWOEcc$WlegdDta"A
&[n<)+uG(JHib7QU]A@(G3]A2haD'b8nt1#ZT]A;1J.*K>ud&0aqn((e!lq-6A@ZM%@om0&d(Y.
WHCB2/!!u#D@>_iJW9<C%pDr6MrAmiLmTdq&,6\SMU[R9X3(jl,51uZJ<d?oCXqg"nKFfID?
CKKB#)m5!hC=0/T"r\#^`p)SCBE/m4?kMlPFKuI@@hj#)M_)=:j1RJs`sdB=MStBn??<nKRl
rePYQ'fSU!;6N3Y-Sq\(4+T9;d%]Agk>3cmmUigEl4[*ca3>celOO;F%C$@0\1GWd-Eodt8k+
UJu;H&9k2)UD<p*NKTKn,*fBj%IVa./9I?`Z9I2D0M85h6lR(Ql>D`aF=iMhpLP0l'b\W?F3
*$-"5oHIqY-3mRcd3d2=/?>0GM?Tr>0f&"+t2bn(7=glRWi,K]AC&O9dC8PH,m-kRN=l-"4[g
M<-T,r-kO,/#/nB)9/*J#NsM(\qaYD>Ufn7dX1=4$!tY),&t[R"A]AZ4_6CoV.Q_I*B]A$`<aK
KA'nqmO#(ie"P+aAD(j(O]AW2<SHR37#;WVljF&-mlZV%tQ[<KdW;C*V!=gRWBqfP8.Ig_kYC
6AR-YEYb-ApIOI.W)m^n7=f4BA$q[&IfKY<UQG]AFMn/Dp-!RLIR0RQ[K5N$4#U!L!61a2]AH8
q[N3<J%!ZMd2UE6f)9PbFt(!MAthPP,u<oR67\h2sYb\[_luAc<DW-<-&g3\fl&D"#tDZ5RZ
g"33T.b.D]AcA'u$;43r&^SA>1QZ>R-`?2d9.$3?#W+W6VI;jXU6`S0odU!:;a*@Nb3/AsZ&)
Ros8c_qgM.%j#gr[%_k0XBeA4kRC0cp_b^=TY.eR@?%;s8I96+RBoX=4n(d/[C9C:An.[I#^
&64>#;:Qmc=OR>Vi3f:V%eo`o;#?=Ff0(k2rsY*_nm4iR=N\$lVf7mQ&'R)Vif5l`UidWf@)
r.D$VRAM\N#^Zr#gH1^tcPceLbi4K;k,mV/'rH>qpS"VDAWf"e:os\\D/n3-S"`2+%C"4Bbp
PEhGQQK9EQ0-E<i)4LNoW)DMaWWE!q1peLj_7@\_I8Ku:K*::.@Y8+C(!6"=das9j$d1SnC=
"T;(g&TXb$VNBhg:N?9,"W!$Lm%@9m:4-CK\^X:b)j'b?:]AcdlE"\l)r=8c>"n;N!k2g-BCo
=1Aqn?^BLSbINa8e'J$l4$?Y'OPh)K4Re]A/G`/=U\KNo8m+6]AK2U-SGjm;c%]Aqfk0ja7kpqN
,HnPF1RbV62q$&^54*!H3e=[eAf>@m5goWL.!=.c&_#e#^>4.odb)>$jB:QOD=<lEl(l!U`O
?:^?b?DLC2&f^*H,.lC*ZXEL5J%0<7E)S[Y>9+eLYNk9Bfj*kgKp-u(R[&]AR<75;4_2rWm$W
T5bH+Z*h!n87q]AmTX;iL0R>VeHo2em6qU<C#C;Dj'$7!oeajq,8'=\f]AgMF:SE`NRa5uNo`>
35of0,gO4(`V\c%M=Wb14-5CFf\Q-958kK/-Pii8I&NY&cS,dtS4@ddt'qW\4gSIj+_@&?e3
/&GE3BqSuLJo[oo0DbR+FucPPX%8Hp_+\,+r/_R%C3@Eq;(rPX?[B%g2VN-)O12C!4rW'W<n
c:A[LhYYpF&U&L*/C>$j;GRgI)*@>P-ZYY44.=HWEL4*NM2EG]ASnSH-Ipe'U&.<Y30uprr$k
_8q8SXrWN36!lQ@e;VLMDGg\>[\H;I-hZI,sS\aOKD9bN+$BHqflF(m.^[\C:5(8g`7=4pW/
$;#Ira2/d2t,]A>Wkt'+8r=jE05d&I[k,ILo,b3<"\k"C"4,hXL(l*QlK2e<O4^p?>`n1%F`U
Rt07M\<)QZ<+%*mZo\h6se@'tlDaBemmYABKYKi#+>(-Z;O$DM_,"(#JXlZR)oGrb0U\`aT*
@Rn,fI^XI;QAPtfC:,r&k`I$$Rn]Ah'dqrm]Agh.8t/b]Ag)b:5;lj_d[NI[sPY'n9'.e5I!hL2
[*nL#I6J/^L"_E)GN>p$/WafrED'500?+QJ#5!SSF.SrjJFCRmVf4De50V1(\P=nRY>cC&O%
426FPWd#_ieiaJ'FmKLnJA+U=G;Re!c;arp?)7uh<;uT7b&':E@C%L"&3UjZZ[Z[qd*LC6aN
aIP1^PP*f6cb7:C6^fT5'e$paM*dBq(PntECi,gWd%[FIYf+6=5sM1QAX4-d'h\pQJ2b)NP:
MW+k6id?OaDL>'GA''jtq!bD\Vd@]Aq4Z(+C\DQ=#?HkE208*6&^+c;CKei<jhIVZhdZb8Gig
(,WE1hg^VQ]A:H9m($Xp]AhJg.]A,Ks"hI/.9cGf&l>mWA,'o5`GhMYs1l1mQ8i"='b[ZtaR:ob
KXW9*aq^kVQZ296?NG&AhebLL#^rYfI1r4^otXb2Sn:%jULaWgW4B(9bUKh;\&E9T'-9OoS'
?#LC\r8$e!F34CDTUtOEK$_5sL`Y@egquE2NDs3fZKWeIk)3L2rj%,mHYLGd#g9\3R$>EZ`0
.\Yf]AGcP8FMa'nF1*O(+:Q?cK5^q;[PB4\>#1t.%LB2q%)Weq<3IOod@uQHR5[H8+f#.l#XT
#9bWo2&\H5:j5OHorf>i;cQtR^+E<;\I8?<O@K$t)%D[+N7b[Xm/)&uce",=sUq/^mB:\j\1
e2$PSoX_t_:u``9F#3RgY9'4:*9bYW).n)D-W3ABll@b87oaIi"Z;_PHuDA3ll'D##epP.kY
!5Q2O3_f7&K]A5V:O3i6Tk)=pVQQ3."gE[fd2J-FZ[10.!c1^Mhrr^Ft(R':Rt27XR[r"o-[u
Ue?5"Khh,7db1[E@Ve'_Fc!MlIcQGCeXiC@9/CMp<'"3lg/gqLPb8BQXeeKWZMR\."'SlD:k
!2E#n'3RSPsZ4D2!<I8%R)JZgX>k^bd_>pG^]A"C-u/5-1#Qo,%)C9D*/[[i;K?CR[36M]AiSk
E$boRO&nh;loPq90<-jaB=;\<fPRf[s[m>]A6gbb!pl]AO"%6=<YACM>1?ar\pfI\Hjfc(HM8f
6U&m,!U5cIj\1t)!c"RpLu.P_=[_9q4L;gA)X-oarJG9JR")o#&h;q#YQq(=g)S]A0jn!b^D-
Kr)(XV/A;@7kRC[TO+ci45"jK-n[Mbm%'=u2eUUFB]Ab*I[$`Y5=/:nh[@"cJ0p4b?I3'@2jD
RCG*\f]A7@E\lUck5#@>DU4$4sKm?,.(Y&S`0\np/UZKp]A^Y5R`5>MlLO`a>Psf?'+]ANhu8rX
3n+&8;3IYC/$SQCs7I@YKlWs]A>tlKne0emNZZO:EEf3eC5b'JCk[./]AL^o/kKL<jNW;7a*]Am
jjr]A27YM/rRV]AMP9NJaY9*$,j&TNBQ^@G1d*QG5D#j*bd.r6<@YKW%lMLBTAC3.j6(*f/p.,
I,\<D87Y&d4'^VnnGkUNRTP,]ANdHp:p"#!"$8_^n5KDIUS(E]A"g-t=qj.9aIH.G6^fBZU^FB
a!1>E3Sg^U>8%%Y0JF7<*&+O,L;nQs=FG(uPc`iM/,<HS+pZ82LCfg$mAePM6'`SG>>N'N8G
WURRGsXA+#-Omn`YS']AsY"H,CeO-;g$%*8f90SQb+F0,*d\1SDRo?gEcV797s"/,"q#?,7P0
sqB6rlDJHL$&*S2FAgf\=9p)+EL,IA37*:ZnF0A6/SA%'j),Foo;1h1?I,2H]A:uPdtHFK_b;
'DXWR<<eV$aI*O!U?_fR[1F$PZUlKC>T[dr"l$-6;+UYG^UGhX>!p-uEJEO+FXPoNDVRJn3d
O*u<E.JofhGbO!j%nVo^=hXcq5A7,__Bp\iJPP=;^O5Z<ihHr+W2W%Y6_K@=D=-uArWo,6R<
N]AZM!o&n(RV'G4J068J4Z8*a%U[F]A:]A&@:]AG6[l8Hd\q5*.$nC-<s[1IK\_J(*8Zp&_OdGc\
`MJD_tVYN\G_Q6UJ5YlqKT0nQ\42fC-:]A)(K`88mhHE:%(M./ZKH6[M=ED)VB]A*\L)'_4aRc
**U6kSk2J2Y/tRGio#9)`94g%1@bVWet8&kV$Y<!baRLgLE*g6`2K'JsU7b^Ag]AF%0!@'Q$p
$kEruh26gn\T#GSaFQN'tbs4R,!!s'M[FDeEg)Jg<cbfEPeM]A'cbA3&Og$CF0X+(@RR*I"^:
jL10:^GjD(b92k?s8H(1i6OmKleoFEI<rM/Uh`8ql&+<F.j?4W/]A7XuRn=$[p=OI[F>P]A_Qg
U5-c?06Cf4^_Q:iek+rJKWP3nK_!Xkc?<#97G.Bptg)HF=u]AmW$S(o]A+S'l!KDC5D-ID['RI
u\6oYO'61D3TmMhi&j3!S6=Xo\'F[274JiZNQG.OcF:,OH"E\S-6YDlXhi&7;/m.TZ8bfK3=
Y]Ab^;9kE9XKt?IpBIS-rMF9e]AAjXsROX00GtaAW5Xh'o63;a.\/'`aP_mi1S8dTN'NTg4CH(
--ijQ@!Icgb,O\E8EDC4E@^Zr''80(a[:ErZShG.'tX9NU1-XW9.Wbn?fShu-EGL>7QSO*i;
>!C!_Lji;:PBMKJWWH"oB8(q2mM@\$KI.+9.^c5[d<pA3Bo_a3JX$De0J$\M=[S7K^(ZsAC:
jM>EaoHeV%4,*m+,h=8<dl0.<M7EVj#_T0@[J=^V+GUHoHjFV0t!2#3bck)kLpK`N9-j]AUPc
V0RS$7<ggM)9K\RoIG7^df4l5D,#;ad=VTL1G?p_*#Pl\c$Yu9HLGepSp$(*8F]At$ba)o,r8
X]APgffjZkC@#,80Y4F_r2C7_`8X..H%8KU1ErttFkkmRO;AJ$5hNq<D>S+5h0QuqTO"-UF"c
n7^H)c&s)f*?B:1$6_nbeW`"_dX'R&&$X$'G\m`iokM0sibeO5^$:ZjqsXg(+4(SXE!R/s+7
o!J'A'1a_R3>s^PIg/*7+NVjU2[m)XC%s[V.C=e:(HPWb@p8Lr;s6'G@E2\C0]A?QVl[\\;a!
m6sdEe?ih>si0FM`t_*dfHeG)CtL<Cam]A-O!X7KpR//5&,?2YM/?hk!P\/L?ir4Q%9@2R+.B
*9"`27V_;sqn99^In7q.Sd,^j\QF(MS3N)!-ZQ%"J^%G\:0m-&0;\lHX^`JNXAek_Dmn:)u#
Q,g`+kSu(Os@VhPOY8JLomI'-mj6+s%`fYAA;4?fkMl7o'8MhIZACt4M#ssfR;F1`XXUl`]Am
B0&oa<f4G@5KDPB+K?er&\n[h&<VL->'ekJ2rS+[kR8!,T([>FOfBbtsbQ@t4QL[?4HBj^s3
ADpkE1teD-QL;h=;*6QiZ1[baLIT%"^+%:,imk`;*7O)=(N<$WDuHJ)0FGR0U?KA@W\qVEq-
!k7;NsQRpB@TElhmeZ><0^)ESkOLL^<uU%tK6E$:S]A)!>g38=VLepUu'V+]AR^)qOH<`![lSD
r1.Yd]A5a>"$g!D^J8_'8&I5s'h<RN_7J%itd>T@nH`lT=GF@Y;SjK4^_B-tokKih!M%q^gW[
pMFon7IYb]AcM)i\7%W<9u/8#?V0Y[FAeaoEumo6R[i!H4a!LoADu6ip4^"XpL/J4+QeI2)Bc
Vk$D4EgXbO8HrV=o=n+sVUDuCb"?l4^i@juIR\dXcPNjj5,U`nf6duJ'5.fM:35`P4RRWFZM
WQq>m8#9"9piM]A`Or?#K\%[Z6133.V$'6R)_?rcGF"/]Aj%uB&WYH<l;2D[QPaY9Hka22cm%%
ud)ZK(uN!Rg$/h&la+:]Acu`m7aO)lBtp.2eHTQP%i@DaOOZabF)Op]A6a'?VhY%<5TuLen.\c
JWdt.foUJ#kX'H#6<<IcqlApKlEqOPIH[g>)^XY\51ch,*GUO%?+0Oo7A1i?3HHqNP&p#D=C
J0"%\_$^jH)<:H1CmcfLd#@4UG05$#9DZ3I!((EEeHQ2]A-1a+U4@Yj[f!OIphO*$+]Aml_<8!
_Yh.qN>\?;.u/mBZ\.@=7Ec(m'6q&^]AO%bqoea/tH41Us=X,_&)9bMU?!OC4/\>eB@bU=WmQ
.)4t0S%Vb!4qd:K/%tM:OG4C3&fU!^;JTl=n@rMV7:RUJ7[Fob[XrV-]AHjYCk=X)g9I+g]AU:
JBWr7d3*&rC`nl$B3(k2DpsET%naCXUnfk/4AcJC+]AJC3@1"$?^*/dQJ?-KhBK`113h?5oKf
T9++>40[o-%<jW-a6qgOP"X[nrZm`uNpma`[$;+`,]Ar"\OY21?5)5+@X_g>(g%Q?ZI_H8ph%
UY(l8(LsECAIU6:-")^7,XgB/44mV;gpC\^YTDo%Y+SYKq]Aih^Hkjc17>=P<,l6SW846RSS:
d0$uX;P0euIie6'%H=U-^tjQ(3DSX!&Uea9?/koX3TIt8^*0\JiB?f!L&YE]A'*:&.AoEh=e*
BrB?OT8Af9S_Q\mUrOO#EC<`!P`k0`Y;X6`;3T*aT3-$;>H3=c/,eLZ`7$%W='b5]A90-aLg$
T-5VYg(j(=W;k(6_qu==U.5#laX`>/(9s=9)rp;IQGIj&gc^K.YmGRnP]A-W,aA)R_m$S$'3"
T:RT]A>__9I<k$MEjIqtC"m8UZP")m[5R`PK85h!+r$ks/L+d8[gOl0rWAqCt9QR?(tCUZl)h
@Z,G*MV"RYX)cn04hJ6a'X7jIr?E#h6D,1anqpcD,@9r<ol9/mYg5mBC:M%rPWd_I?uf"V"'
prk(M?GG)!dg&$8K:R$=K=jU9>e5rl[fDmCB,Q$M/une\;'?Qtc1:h&BYgG$0*RcUNPAeGDM
?BZ3&34$USP,-?eS#g`5i(6kHNI's+_O4qn.0&LM?+CRcOOT3"LGlPH<<YfPql`33^U9,uHn
(jaV2nRs/%`eVm4P041&snQScX,;+ss=%[aHf-Q,EVdcf&'6%35V]AShH(M$S[#fs4qI#i?ru
5r]A^~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="672" height="324"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="report1"/>
<Widget widgetName="chart0"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="951" height="498"/>
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
<HR F="0" T="1"/>
<FR/>
<HC F="0" T="2"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1333500,1008000,1008000,1008000,1008000,1008000,1008000,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,0,3886200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="2" s="0">
<O>
<![CDATA[单位类型]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" cs="12" s="0">
<O>
<![CDATA[新装宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="0" cs="3" s="0">
<O>
<![CDATA[存量宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="0" rs="2" s="0">
<O>
<![CDATA[5G三千兆升级包-20元]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="0" cs="2" s="0">
<O>
<![CDATA[小赢家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="0" cs="3" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="0" cs="3" s="0">
<O>
<![CDATA[5G绑码新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O>
<![CDATA[新装40及以上]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<O>
<![CDATA[新装129及以上]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<O>
<![CDATA[129及以上拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[新装239及以上]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[千兆拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[新装239及以上携号转网]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[新装239及以上携号转网拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[紧密融合加副卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[宽带,新增-融合宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[新装融合副卡拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[新装新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[新装高价值新合约拦截]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[升级宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="0">
<O>
<![CDATA[存量新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="0">
<O>
<![CDATA[存量宽带新合约拦截]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="0">
<O>
<![CDATA[小赢家增利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[小赢家新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[新装FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[升级FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[5G绑码新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="0">
<O>
<![CDATA[5G绑码新合约拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" rs="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" rs="2" s="1">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="单位类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装宽带"/>
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
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装129以上"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E3 / D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3 / d3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装千兆幸福全家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I3 / G3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="紧密融合加副卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新增宽带及融合宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K3 / L3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=N3 / E3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="升级宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="16" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="升级新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="17" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=q3 /p3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="5G三千兆升级包20元"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="小赢家增利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="20" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="22" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="23" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V3 + W3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="26" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=y3 / z3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=b3 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="3" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="4" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="5" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E4 / D4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="6" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="7" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G4 / D4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="8" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="9" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I4 / G4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="10" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="11" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="12" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K4 / L4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="13" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="14" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=N4 / E4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="15" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="16" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="17" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Q4 /P4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="18" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="19" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="20" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="21" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="22" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="23" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V4 + W4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="24" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="25" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="26" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y4 / Z4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="1" r="4" cs="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=a3+" 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="3" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(d3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="4" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="5" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E5 / D5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="6" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="7" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G5 / D5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="8" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="9" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I5 / G5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="10" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="11" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="12" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K5 / L5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="13" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="14" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=N5 / E5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="15" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="16" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="17" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Q5 /P5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="18" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="19" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="20" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="21" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="22" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="23" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V5 + W5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="24" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="25" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="26" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y5 / Z5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="0" r="5" cs="3" s="4">
<O>
<![CDATA[厅店合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(d3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E6 / D6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G6 / D6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I6 / G6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K6 / L6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=N6 / E6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Q6 /P6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V6 + W6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="5" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3[!0]A{eval("b"+"3")="厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y6 / Z6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="6" cs="3" s="4">
<O>
<![CDATA[渠道合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(d3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E7 / D7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G7 / D7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I7 / G7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K7 / L7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=N7 / E7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Q7 /P7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V7 + W7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3[!0]A{eval("b"+"3")="渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="6" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y7 / Z7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="7" cs="3" s="4">
<O>
<![CDATA[公司合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(d3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E8 / D8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G8 / D8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I8 / G8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K8 / L8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=N8 / E8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Q8 /P8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V8 + W8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="7" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y8 / Z8]]></Attributes>
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
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<![CDATA[#0.0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
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
<![CDATA[#0.0%]]></Format>
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
<![CDATA[`4KYe;qq.$)N)%$&-Wf2&duZFOkpaV(-kJk///+2d\MNfOJ&P.PY`'i"ri@r7!]A;*oRQQP+@
)lVcr*EF_6qmEYC$#skBsl8IS!rHhDrX2a7HrR-K:o%56$1t#64`(^S/KogAh4t-ih%cnco^
&aq*i#2uo$Z@sI\;SUe)4)@06h0PFc0jg:NQ-O3#*es+@cS6<Jo\_##[LNE8e^:Jac/Iu>P(
V.ZgQasGd:+TYMPKp`dOi?-*;0m1Qe7I_<gbY.L+!NLZ#$iga9!0#IcV$5/$a.l'VCpbK\Gd
\>^/>#E<[LbCX,o<6b:\^E`"J@R=/J]AIZek1!.m4Pr9lU24?iBtu%'/`CmD9?-lt;D_9\(4q
hG]A#PE[h#WbQ&1ZBK10T3:A,+I89pu\,L;3g%Ef6=#p;jTDPkZ$)MN(>68Ne\Gs%2.pK`l/t
Demn#6PGcR6G$Z_,@*:uhTS[9i&jWP`\L;G@2OLVg/@K*?KUA$?S]ADL)7fe-,9d@*1?eqhZN
;SMSTb]A"J!-a`Wuhs-.\DPXto&RMFaehF)1a<9Tn9/IX-bCDcrb&7GJ7b`q%'0P.UUfE]Aq$;
=8:jfG."+7KbVLoV-8e?l&k>k(_Wmc6]A$9O$XpQK=#ZO;NOdl>r'I-n!UA&@I-!OFH)o9#@X
o"<aVfcO#`clP7oiWH1?35JpNJ5Ym`@a4Fsp$J'[eGnbe5uJ,/*P:HKegXO>FLE8!B)-=1T'
0L_nL+e'UabF0uaP9Gkt1T2sch;]AW+7WjQYj/4npFf'OgVOUD\)aBcP:'-D[VttXg0#kFI?4
i)5qj0iRq;YHGa,aR7XSPHf>tWe!md\"4N'^-f,XW4[/$FN8\cGGjb!pu/q,$^3b\<*Hbhsl
+`lGPFNK/G!\*p&F6t1\c%+K-b$`-<ILY>0aYcW(r(=R]ASUUt!@Rt[uH#CnG]Am:T6Qf_Pt@6
+mbjeIYP$,o4i;I@TL"DV!u7n#:/WTH:I8J[%;.bEfAND\Q/iJ]ASZkK8@AW-,6Y&6)&ZQ$..
o9crDDbgaH6ISTgl)VH\@nZY$PJjYIFi+Y!&A_cEoH5gE1e%WI'>p>Y#LqeZT+rR?rUrG9Hk
:I@t\>ab:_;p*bD2fb_O.PBN^!KDP4YB51UU<&Ds>D)#ek1"$B7J&&R;H7uu8)$k\"na_Hr]A
^#Rf_;;Y9n-NBXU@aCNC-=o>B^SS[t<?NfcIeTI*YJVDBS%,#:=moMrSJ0/NIt2gRo+;Y]ADm
k_+&tBb6:N0KjTK?ad%\')Y^YIMJN)AhE<\4?ni%KLf4H\UEZmm:1r0d)c*3rN7F'n/b%-(%
#ZR.T5<]AQP*/8[eiR'0Vsm-5/0NEtA$$+pGPSd#.di\S'_IrQ+fJ&*_b/+nWInHE!GKdm$a)
*43T0Z1n%((,#>4W]AQqp"<r[pTQNi-OG<B6X'B,U/0e7#Z8^;B/q?`ps:G;5t6pI)dZN\rPT
rm)d[@QSb:"dId/X1J1hlMXou\ITAaijdOTC1M00BJcG$Wuctm=`_$q3?fVGZ/l*F9!O*J0H
XRmqQRl(<$QK>Nrio%SQ20(k@!%kkq<'p7-F9*g8$:?ec]AHKjnV_Lcd.:1`P:g^HbWhDB$C(
>qf'c+Sj2qOYV2=l%bZlUhs2@nMYr80&j5+RAZql=Vlb^0a]A!Zq.SdE75e')`ocumfRoK%Z&
qj:U="m-K,XW"@e$#<0s.r/7W"5XK\k#@F]A^aC"b?et2deip%ZM")9LD972$:nC@-,pe+QFW
\e8m?9<+q^%[!X<GXTMq/-+:6!+d[[I1Xb[F3)&8<#O.%]A$,bne#dp"$="MBDHQSEiLo$8&p
DeirMgC)Ma+M#7Ul^h*_-E%'Tn2_6pZ*>m'bJu,i:>IN)L-P*om_UH\]Ak9!84Gb2WH3g6qA2
JGVUDoIlV,^%nmMXLR!:c'XUkrir"#CR%]Ai]ApN>Dt_#h-A7bBK-$@d"e8fVj_T<<2p3rHFku
V?<O.9f"/$WD*j@G(^uI(jBA3X@?Fs_]AsPd>o*NYn1mEd_;nR#2p3g_@UDO&M$@$9P<\XZi0
J15%@=(0/q!\!BQ\I^_6L-1HW>G)rnkVZZG+4_F)JhAMDb,J3>ML1kU*]Agf+2(&Wkgk:\nJp
DlQgF?+2Q@q.6GeKQe^Rr,S:_.`[)H">kH0IHT0]A*.,ebt=P+oNgcH^T:Nhum2RZ&[)fkuiq
Gq2JZ9AHd)HdQs(qH%J74]A#HFM:u2=mY=m*H3I/Z-_?o[ggNMN@*eP,#Ddptm7-Y*m_d36E)
6E0*U]AW'ETnNgc34C&q4A8G(?mHrNlplF%[mPVe1e=6YLkSH(JIk"ah`1sGY]A?Ek'0#\YLO]A
c`,>E6iTXJUT_*LGP%l>0-b,qPNYGPLEJu;Yc@l_]A6_;1aLqPZFfK/>7;&/T(RNWZM7KCla9
7hJ$&-&qA=#*>'IuYkMLT3A&!.)TZ(",pMWX%4NGpU%&n;<EXZXo4AX((-!$ctPcfBh0s*3!
)ZlgBsZ4FS.C9SVT,^gGLVYjlU+-4+hpne0B'EY@@X]Ae`D'2e)>d:>.,>.kE&]A9Jc?^\9mX&
rjp$%&)>A"4LTM<6dBb?-a.!3q#?J/DTF$JDSlmm5R-$'Sh'8Ve<X0FbeBgUnJA[C<9(4Kh/
Y[cc?i.\@daVIGr&*hffT,`COL_'IoRFZD4]Al6RK,=bn`&nRmIi0mh=djq:\#$Ej8TY43d_A
>8)u:gn7Jui,_$5iJRYaE+A28s6pMjsYo>sC7c#ZrR=^aV=MuJ=K&'D=#BSTD#-gHZCGS<hH
j&7`]AX82!e[>P(RNi-6BjYsY<lP-ZoG@o@eqV$*D.VO=llH_2+VnPqdg]AaPFU,kQ#%^&MLa<
L5q@*>i%`O_h]A-??5g5A]A?Ero%6!M/?))IfhLB4G"r<!YIBOBNfr5=0CM`IcL(_;k`OZ?3n(
"Kf@X`="&e&0%\HX:b_T&uHY#hUMO"]ARZCq4<.N(:Fl]Au"qfk>lrt'e.GR<?(^d><c?.;a3m
bTE>a`[X@-qjYP$"e:UNm:_\9!EahN5s95`Gh1,WO.0UZO+;M1Dk=FkBE0j9]A7!2\biK*"`S
9nJYTC=7oo4(QY41]ADo,=P3+<m]Ak&3APH(cl1p/?i&7t[4FdUo#UGH7ochL@?[]ABdhE#))m6
PI<,-Ppd7)??iZLjWTI?<#fOr]A9"HKt1%ra7FeU`_@$MD/JLW6t?)MC?JY?g!t6A:=j<hD2V
&@1,WiY@M@t=Co916^L*]A.Z.9NONiO'%eE-hplC9?O0r?Ao4i^b\Qd^QpIeaB#2L9U71qI?a
mD*_O!cl69j0SW`^'ID#1s03oc>M)h;-+=KMllO"I@<(M>na.p`Z\&Y/nm<(me4IFrf0kC%.
dX7idSWM7Kh";7P\OC*H%iO.ailD'ii/He^:eTZMjnK(5G^M[GA@rA]Au?Yjo]Ar(mYM<Th!n_
EcCN7LiV#Cg?9D8o]AL=Z9B[Z,B5RNi-<)Couk5"sY7BKeD14>oT)J/0&mml9hp&,*N66-@:1
Qlo.8I88QaYXhj\'X1O^;2<TQF[`&aUnUO\4^ne@Q-hEWkI1HP>5hG]ALi1NWmIQ`0psuWJni
LX'O5<;gB_3E%61>HoXT"\k!\GEiRi&Z8_sB2j/XXm]A/uY]A%%&`(9:GR+0(11![0N=4eE2V?
&NA=1bF=hbI0G&d_E=!cpN0^^P$7Y9;"*j6[FTpoSngj]AqaH3\LR<$5bRmAf?,m[\^&q#j-s
-k4q@umFf`be%"/O!Rf]A&B%20Kat@j0I]Aht^aj1E9Lcck+2KEPfC2]Adn;aPR=fKN:l-ph9]Ai
0Hba?peY95k2JpD?L]AJtQ7-@rF@L=F^2pL[!a1uPW?<T]AfQ.J!d9#ra&G>gs5=ASe8Q<W1ZI
jg)<7\Cg$-NHmK?:*+=46#io9=nW&$]AsumS`plGm=%Jlhh&9GBB%!,f_54i?J)$lfW4rBep)
8e^@):2&ZBjH:R,RBW@jiY<4ZpX41b[kI6[Epo;B]A`omNJt+54d./+'WX'Z<`*8_qF;(D/m`
5A!N;5ClGn7L3l]Ao4E=6*J'[a&=eJ']AM$8IQY%NTCR"[]A;,k`_IZV79?G`.=nOpk)9u0fBYu
Y[#*UH]A&E(=U(1AYsqiDHAJr-W/3nrIZ$2ppKWe)SX`=oXTJj$oVcaW/8L2VGa@&EA=-"e,e
TcLHngd4!hI#PAeKm`C0NAF?%?8Sr\SZjC8RID:0n`>-e>DSD+,WYF<bkag2lr(+7lin.N>h
"TG(jVhc2pM'unaEjQXk#KmT+-&:P."&N==59#f)>Y`#!DpVf*l8)"72,WVG?U$qlqdHVYd(
>W\P$L)"2bdnJR`jiHrW_@^9/0[:_?Flb\_[<0YQ.afa$.+eGgB@>YQl\%D)*F%SFJ%6VH6G
B'B,9Y+$12mk7W::>'9_9gD-)GDbUH,-)'OeWD7tHlj,O0JUUo<;IdfN5$2LN=g^&)[#k:n"
UqK_SHbCU;1H_M<JTFhuOOME5g,jiHuR;LJI)O)Y4MM%MoM0^U5+VG-;62AO?Hr"XHB^RYa_
2,^ZY44uKFECs0jo_DHJDA`gl<q<kIZJ*?e]Aqr=`;oXA>gK[`oKM?H3+A2"45^Vs#V:s3./:
g-n,$?Xlp^S-hN!h:F\-uE9q]AU?9Ong^i]AIKV6ib[#a0knjIq5g(*XVj"SJC0:tLEIoO,30B
K9c3<ZEHPSF2F68^7["X@knj'h$4o^ZK#mq=Oa$=TJr6rOq=eN)OToGZtCDaul^TTu+ioWcP
:@:&m>kKB37Jd4N,2S-V=1k`<HU%KQ\*chWi2&sG=Hbit+\_9:h2+Fg_"S$#Du4^"XTlOI#j
fE'XQAOhs#A,F>kVDdd6qNIgY]Ac-hF6h7:2.<g5:%j>ZL4C_c4D+r$QlH5)f`+P$]A.p(HHHf
snRX>u2sc<*qKHpu-fEa"%Gl)e)J%Kn:.fq(/8=d!4_>B`B#+4"J3I35N4T=R7Jds]AVWFerp
]A7A4>)tMX[rDCO36oI):Q_^.k=PPs]A^P^T7J$)/JZeF$Xt_5[#uB>%o0uuuDa:c'M,QrlV68
5-b<E/3HRe]Ati\4>=X_0G=>'T=4Xkku)k8UsaP+f2GLhbQ.FSM0%86D,EN(hFapF@6[/u5]AW
eFug`'DZ8+IJf;X7E3/qQppo#Q;hVNCXsp>:YCo\(F+r&2eVH-EHBd&[3X-$UD]A[DZamSf^%
'>7JN#h`3dZXufAQ>Fh"k@L8fe#MC<('`*V>W,SB<8%79&]AE:D0E/Vl35Pl$.J+D4+eAONr#
>8//`D_5tM[^+go8)7Tg"QMM\2UFrhGLR)JM.41Gr/Q;n>1R7Eu/Q:aYiqAFZ^F).K<R+hCM
-9<4V5oG*'-T\F@;Ai68i:,u>]AX)[I7AZC^`=n?R[&*c@>U20;]A%U'rc*Gj$N8Kp%A/WD4?0
Ih^qJ?3_m_^Fe#+%XW'ia0^.Ui"h:nM-p-Gp7kiuTB"N*2.$gD>sBe,hZ3<(Ocq[on8$G;%;
a.&K/Dk6L]AgA,P?YUsn:SF`95R$?0>]A47@r`/sjiYZptlR-d-qC<L0))@NK[WPW&pIb>*q3Y
IU>^d'stH&ee+/.]A*Y&g,j]AS!:@E&ag^rncAGS^]A7`=B=kA5KGusieG2Eh>5rbkKk2kQ"j!/
2V'rkV32q&A?crbXB\tUG'fNg,bdcj:3&WX"UDC%Gk]AT3aZg<=+[oUeD>]A1e!HW[LHBm?e:S
l&DL5Ram-*)B4@NDEZhrb3/n+:ZYHJs]A077W0R&6E&MenhD#(b!m,G>1<0l.OiG>5!N=@ll3
VV]Ah]AJ0D4L%=S%0pJFAF]A)2l,6U;nU9,U)2,/I,`BZoj@5bJBFEM%Oc,J(oS8tojKd/Ics7j
m#p$:5K^G4Z1P/tLUP?9T,L;4</\*u]AKGu#ipV!a4l-NjZu8mT_<Vd]AfdBA=2%Ahh+N*[<3)
h>GlXPJ>S)C58>i"]A7:W/>mZ:/,#c;Jem8W<Mi&X,m[iZ5"l2@+;7nBnjiJ5QrBoH"0[?VrZ
ndOW-q.cNU8dc2bK:"U0&1G"MD@-`L<YLl!ObPF"CAa2FD\lFk<o.mupRm]A4Q5lMmhUp%0Vr
31eI'UdR#qU8%;"AiO1.(u8PdioN7H*Ug=5+t;2Dpc1dNFKD1Nr.s#cnBBerT9//?/dhIC?E
F'$#5s##T2XI%+'h5HohD4kV`V>^+>[Rh4qM,$R;\;N*!h-g32n/*OUVIT(.pq`(i\(Re,L9
ZppC=li,Ee9-N,_L\d`RiUqE^@YZm4i\:PJDhkNW]AJI<<#]AL/Z-MS:f"cT%(X5GF=nELH/6#
ae<(/fX]A\(046'q2*80%36RbSm`flTQSGLm`L3cSpe\!Fd:M=u_#Z]A?5cOjI"aY@#`C-Z%f#
I.*X#X2ro8%_#T-RP*AhZGh$gVpJ&5:+\agAS*9^N!"Z>CPGXF%q;'jm0Fgh'^,Y0MPLohHU
53igGK5uj;rccHmm[=8\^(-VR^gh9QJ]ARj&/U*L$;GMrb5Ld,%-)Q2M]A2=Y_flFW7;kKN=D:
Zb0%[Y@OBJ,Ta4gm/0#5JEL>nt=98hHC8%)*;23LDNU/mCd!le']A+X>,;ANOZtWDG0sMpSlH
4BTkK(^>X\6m@#$i*g=Ir[;aFlUI"-`Pe="NXq1(=-(u5)K%pINX$Zi=O3A7rY%+*YgW2]A?9
Ci_)a&./=pm]A4BJ>\LCr?*<4TZ[>7TOu1LX-'<)%5K#K54qn8YuM/:E$`iL27B?IJ!`WSS`7
Nm,"Ht^TssR!IHfD?K+cqMrW`<MgOZ&mPc0Z'B>iF)Vrt:a%ZQ]A_WS`IX,Q;GiqCmu?<^#]AP
%(32eQPma/A;$&*H(m/^2*QJe>1e4X4j\#dcY#Y=[Zf!efNge("'AD`B<YK!1.,ga-%8r/&t
^9p@ldM"eA3_%1j"0E%55J,PD<0agh_j^>rJj:S]A6F*Um_i5oi.T@L@q\(5*.9TOb]A'"&E1Q
3T<,`.VHD9bu)ZuGZ00m%VBf70h_s!:tHgX@Y.bm+^Sr1fab[8&,Rl@TDu_S'\UMl3RQ-g!a
J<F[7;(WBDgqGbV5%&lo*-6m<ErcHjd>h"2jL:B%PqL]A4=6X)iY2*L97P(#rr584<e4":Po!
sl@D5s2Qte^>WrN&hV?oa=dCV5k5o+0eNTLY]ARM(+"tsX;(s4,4%_P8F@cG'.\RV\'HI(3[G
>'&bTl(akppuVGK"D#lM\'(-L)4.UfYSH02!oe?ik82*j<ADH:bR/D^`RVe\`@8c.iK44_>8
5_D199O2GD/W+6(C;H,ZM]As803\^BS2i=O12%%s"pkTGqqGan]A7C'IkLW*Sp@olA)>?e@H96
>TP,bcCo8"o>jt8jsheHr+pH>k,=O8X$k(@,)9:t:4om"I(:Bo+k_"!FnnmH,t!:l-FfRh`2
[13rZLO]A*EKJkT9cT?_Bh=.m7JHrh4n[7(mu#s2>Z[K7K,!*:#[7[%)XCQIR,BI>+pC:)RJI
deYHe$%<$1$VYLM^<JiMC-W@`15='^dY#`\i?2b2AgXJ)"W*m.,U8'V[02,/IZC_#d!leY5W
_Vsef5JB%05@2X%9q";[bN\SCdm-hrT!n=+$#D*(H9P'M,Jn/-+1S@kda5,hqkT"'3J.74C/
g`5Mo^t6MV6Is*;1D6%V$OLa3ZTnIg>kUPRFBoIKQ_TZ5M#EdLL!h*j*kG0pT>'SYVm1d;X+
_C#&r!L96>[ouNWX)g:XjhgOK3KgUDKA"-8nG^//k9AV?BQ?TH/SBTY[_rUMNF20MiNjaS1G
q.sC[\tX]AQ0EK;/2t!#%-%_"#C8=`M,#SEV9,VA3kq62G0<A.o#4<KY]Ak.ko;0knX!]A7FH3G
EBh05Z90-83J&;)]Ah1uJ776Mh&qL^#(:/.hcgh['"rneG`!\C%rkJ3qmB[L=__2pRk+2cYZ#
W0#._DuXq4NU:ZDd<W8Ljf\rd*J'XTg2P:E"]AVgg44AZ'S:4)c5]Au)Ho4-n_1)(X?=n(<_V%
(40NBdY&.Q4P60.FbXXV7]ANj;\HN9="0*YhZb/.cLBFE(^5DMWD\72rj^K4f:7d5M%Ys!k76
H)a#PkbScnT.jr$o+o:<!3f9V(`0B*Za>uOLmN)n>'PjL?LbQNT)5C/2"eo?ntk+I"]A@U81J
FcrW90:e%X@-^a!9hk>CDS"r8W2HfL9bpQHWE!Nn>1udoR_))t15%:gZJhg>NHMn6MKhFpW<
bXTp06dOcRT(52(p59%]ASh/8-<;2(oEr'b41GuIm*dL6uuJ:Zq;9ju/jT,Bb8:N8oPeaGksZ
aE1o,B\Mgqe6(3:"-,s/p-)ag\>c+/`WfeSGHdl"rJR$XNkXeY_>RZ1B=nL6g_gGIZM=rjuJ
KRjOOcWrhuN:Q\U\-;@Cg>=%6:F_h_30LSRbk2A?=5GW%+H1D8HO4.2BKn5;9RJ`HHfT)6>d
4hnME;bD3.*;6(\E?C0bdP*h]A30_aq63ubk,c1MGg:;61AXc_1jS^2%l$jU_TI(TpA/auI_Z
o8ZmdE<`fM9;Q#mp!BYNSTcN]A+J<#Do-JVJX&e&-<;R1a$!OP)+Ih>5?6G;WQi&@_(6J+'k%
5/)4/5d/4BbpAG0W&%Zj_^H%)rI^:>HaV<85)V%F*M0.$5UuP5R6^+8RjhZY-2ZP#$D[VDh_
,@K@De?rofI*&uX6.t$3NUu1d"TX0K6J_fR*6GsN\+UO\?__U+_FS?q(pMEq(0W=&^nqL7_Q
-C2j`psd(?;Hqlc++r@9"M8JkF)/D$7ELWTmK6-16tgr/hTWf^p-=oZ:+kq9[>fug$EI&F"i
ZZe`)]A1WE?:X.^e[Hjo=D\EY[HmbXIh>*dAXNuBL!4nQF;]A@<_pZT.Ebkb&k,lX3rnCQp'K5
8pU&Jej)08i<#e]AF:PSH*TXO10$i<&<C/T:UCV*s\f&.ShH";Hb-)4JJcQG[YW50W+C6p@8b
)ShR<rkoJ]AX7@K!;"WjL:]AAn.<=V+>+"!,cRLs_Gj\mLDtBsRKnFNQE;4f<dkfmqI:WBt\UA
%3()Fh4bWP7SYhBG5%:'Hoa4WQNh-[%B;MUqFb0%S?7'Et6bqgO66))GX'6`Y>.)/dCZ,#4`
MpId"Ig#\V,%Y!goi:rqa27VT`$J@r;eXT[uDWJ:f8@E[W<.3\gV#]A$O%CEH'%Ql?%9**[*/
["1qsWcYcAM[M,c,t?EP5tYDQ!LAY%_=nC6GoQj#9)n2soLnl(*Dag3!H2bhD.XuV5595VCq
o%+((kukZjC1Fb74)lIc]AtNj+tEE^8*at]A(:WbUXWrP:A=gn.!U>o;4*#fA3]AG+3*PVl1tPJ
@eP2J))`[sHQ38SLi*7%aTtC/.g?l-"4Xh?$.GVn/,ViMf0oud?h4h?>Yssu&>r:B3[dXIoS
sKKVD$9.?mm6?[HTuC0]A]A+V#QJb%F3k*_!7scRj*h@\91IUG%\lBdR2.9Q:7er4+-7Cf6c^>
R]A=s5j7Pc-)t`7f.4hnjm53OuXfG6^rY##^/#.#6YXZrH"!S[]AA1g#)9HViqG[>E+2>kp;0.
K&Cu5[.DQLO%D1U44E_,qa$lAOn:=%^P5qlj.jnJ(LS>)g:l7jW7hf@Tp:HAM!jB2je?tc19
8sY1gSA[%@PqmQSe%'LAT]AEk'i-_f$h$uQnTrJPnA9XCD0%!CE@mROJtBE1q8p#QQ`&pbaSp
Rf6=plLs*@uAXe&@choF"$3Su%+Fn7plFFciN1XgHIV80j[";j]AV]A2PD&O7tp[b$0`_n1UkZ
MN.<0W4Yg'5s)JBm%.8rJb?2]AmX0"#DM7*VN+hC$:&tm=j5\]A%<q9Q9.i.KH;*;ghX6tu>Y;
bn('$?s_,jjkeFJ7IkhMq#*;_H;U$(=uQksW@lFs\A>AY5c\D8Ug?N<//R(?b\Xr[#p/_>:.
BT1`nI"GM'Oi&u5]AnC_kXdmTi98@X]A&,JP//giCk>!XZV1U329s%h8"R1dhQ)OCNs"\Z"[b/
\:rLV[P[UI\+TmS!F8g#plO#M]A4dL5BZ?r`=og;cSp(Z3UG1#ofrck0'8u]AV=]AT3&or._V)L
m(nV1Umjq08gn(R8D&@%!#\>W(J`-&!Y0*D:S[^&uSEH3a#N(jV9l,-?CF[Cp[#f[Q^YT2L5
O\41!34;9aA_'FD<BWP/N4\R@I#Sli,\llf[Ga[7X8JZcFt'CE&EPdG]ALM-#N&G2p*3p\)`A
4#dL@M:`EIG@kf&8>HIk%VdnK2@UmJcZH71H3:[KQSN'N#6?JnX'hS1">dA7f9YgHIW?E1k;
F\=:J,*tMTlf%C(&u3#Rm-CA/+469ELE]ARLUnXaDLOF*$\`W#<n8j4SW=/Rq[MduJ&msR%3+
#USa';F_j"K>f[lr[=*(Y;0BW=0+rAofqE]A>8N?SK)$hf.t.U\8*-ma3KI6_;pcbUjY5AMqU
NeAh6'pn]Ac0i^j:HqfmZr$1HH%%VA&M7q+pr)5>^![:MG,.5D\!1H+@_LLW#97.`e_2e3s`e
:NuD,iSPiPh=knBVc(5qh4\#'6j&I/"B@p647NT('"(:`A;$182A]A`VtP#<L#.hE(\`CflM#
pSW+*0H'LlLH1a4:!s*d3C%f5qY`/1:\l#7bd\M/qX>&(d*AhKj^,?PXP!)7PJB0E`>JlL53
:4g\K:W$1_\a2^V&K$27##ZL!mWS[h+m6aBJMYsl^S-a%oA1WI"S<50Y!!p/=T7raR/U]AGM?
(a,$/+ITl2Qm^qhd76FI2S0cu.BW3FeVi9j6H%L&&t/Oo:2DB,i_3PITJA&Z@rk0LEOl>o,]A
tab2B0e:c@<eY#.[QUu`!ejguGqG@dSC8NSI@'3[Wjh^EdJ(QBYOb<ae`Gd^(?l094bjM'*h
$#"=[0Y/[PtH(>/Y1!#CF"2>Y1elH9je@1+[#r6Ruo82TPA(X!.dG*+C1C8Sk?fb2ab=ac@f
+'kO.:`dA]ANT%pY*]A[\&Qr.7ai1*'&2'g8*-?;NiNU?5leX/^hgu_;]A/W]APee72g*loKYE]Ad
+q=PcM-99'Q?#2Wl7(2P+Q3W;)MNF4RSf1q^jG@qZ^B:]ANf$'M0+M&0Z,g?,IrI!@WpB>c_j
DU4*)!$0$ST9h1M2G5p7W.EB'6V)kE+4Rh(h:Q;\TT*dWQnt2#K5Xb$>`7c(!B`2[M4",-68
,^-BbZ/FIV%Ah8eg8B@]AFa</^4/[I]A(U"h'jAh]AA+=#h)62T6V_$u</0U:LL#(i;Z\o0GQJW
p)U?lEGsM/(FJnnnumF?"([/\sS8W6RF()aS<o:T8NMn)&Usa,on?CY$l13q/@@J8p$75Oh<
(ZkWS;Or@k_f.:+>.mc0<r9Tj!pO[m9Zkq@`dYAW\]A<c+SJ>&\GW;c%G0_2?*L**UtF+:_3c
::mt#>+aDugmu)7En"coU?pKK(f4fROik7$)H#I<iL:/(cFB60?E:/G)#fE(@.Q@$YXV?A9>
!f"ok&qUNr^=e)k)dL@q_e]AqEfR3(ESfR]AVgVekmC]AS''7?J+=PqqqZ7fGmQ@]AsIoCp6g0%\
iEW8He:>s)mh*tJ(kY22Sl+9"jOg_4`b7foprn-*L]A@SU<W_=$41bn*.2:BtAkg*-BA2M-KZ
O;e35OC-Iid+OZM8i1k2&!O9[#V9SC[U^VSa1sXmfiP[IYI8*[I?:%\@UP@H1"&6E4PC(JZG
Z+Y1]A>.g4?'r#3YZ%VYq%Og>IGMMlmaMrn+&GhFp`MQE!&dFPa]A+\EYUOS^%nf[-[23)G/sK
%%CU)Q%fr0iS?IIim`+ZI:">fkV!JP1$XIH;h:K0,>fIs+P=8"T+Xb=Hhlpf-G`>J_Q-,gEL
-6t'4p*J02iKI"!QoOk7'NCXurb5>dG*:^X-X>")lYp4g;W<I8a5o*-?/<YtUiT5moIho;en
[Xi3@L0BN""p7A_0d]ATsrJAqp*_@Eh*S>)Bo[==a8N6=48W.&K-ihK</[Z59VdV:)<AXSqc$
PkYnc=f2'^VF3p\0FPdUphO!Y5NX2q!`o\50u&2f=/9%h"U0eU`Ad%Dj(;Y"i'<Uq;EZ:.Ht
Z(.U?L*rgZ[j>jM_uXp(4)nF``cWnmC=)+VS!Z!_)IN)JDYmIi:dENigk<Y0gCj*S'-`7(%=
\Qp]AVUMAaEWEm[X6L#M*VtAVZBZf<)>2BZVR91V0k%Rn\6=1MAPNVm"eD9rB1XOqh1r=T3pa
C'XGHCsCCm?DYIFN]A0Ro<*@LJU9V%G'mj=lBoRSldQ`V.W<I:Cc4\g"Eq.fTY;X\L%Gno/ui
Jeh2<R%auT_Fdi<QO=sVEOq9BPf8IGTnn:%;_KJJQA`HMU^RjOhPE+<oEX>/d53]A4#3nqm]AS
TP9jEROsn6Xm$Z&J2TDm1uqmWE?KoFQdM)g'ktg3(qrDW5UaM]A]ALLd\[oC"q3\&">1Q5hX1;
08i3A;*gR/tulT%.8pV4UQnn*>1FN5+b@+LX`9Gl1%SP]Aen9&mJ:[8t\qL13iX@Xu0I^"fk[
=Pj0:ChLG5R;qBtos%J0AV(eh-<b_?nFSPB`?9`)[%SHY:7^aDdThack7LShJjCq#g.Jc`X$
EG@B1cON8FoSh=R(O8"KQkKUOD`jo#cGARX@uXrMUs^>K%jki]AO7drKM=JXd7$R^+G?:?&!F
4/U/#bFlp=)&&NM`RSC8XnZ-Nona)\(+=_2(bAV\ZIAk<[n0]AVDE@VBPAYg-YdP(>O5_["i/
P,VD,>?m1$N--W+lEWN*q+>O^O+kGP1"0ugrVeF;7O6ZRTGUT0t0:<FfIZ_V/l36?t]AI-A&(
aj7+qEX\'%H"Doh"Mj\]AM_-[YB`C^Mg62ou?F@C+\2CkAeN?WfjnL0^g!?#o+V"E-!lUV.A1
*<u^#$0odO<[IC25@064kLjl&P%i.-gHV(7<Z$6M8,'rk:Y^Q\G.Hh9"k63sXnp'p&1^i0o#
j?#kUq*B[6_DcgEfhuh/:<8(MrZ&CNaWLlMEc:<k0n2.g5.T,cCMMfo:I:%_L[S3k[Wi.=-m
"3OJ_@/<&`eb5,?"!MM7j?e>4^VGa,JPoA4&ao:Y/0V$SR)SFjQX(#0<hN#Eipc4?1+-0+0;
)fI^2`R$Eda&Wo\BTB#"#`,@5a$mSc$7[b#Q"m0.d(@2nnPo15WLn#kN5+Q8&=U<6kH;CI1^
hNHF\M?^K,kM>rnAQdZ!p")'a+P:Wjn=pqX*`m'p"CNUnm.\RlTC\;<o5=<(T"q5?Pa[:E&m
*+*7+]ATYeU4dK^gJ(JI4M/s1%o9q%j9gN)$*Gp%BFQ24[0QGBF92WC'ZjQD[H5BF8'CJX+J4
b'><c=G*Hn879\3lN/*kQ1#oS([7%`^Hok?5:03^tLmr=$PAW+ou%!=gBulDfu(+S=@HR_(B
=bZbQI?C\jIl,FrN$KpuTP>;quq2k)CKs)nZj#Pa(.j]A=uIQl8hm1/d<=9q^K<,:[g)$^$ep
J#l%WWL<K3b5-u<3D;)IC#YeAfKH:obo+fiJfBK9D&0h2=$]A34Ct"H38_fDR@]Ac4>m%)9=l,
bN5'G,!.K%U9eTCm9oKF711=\_E6="+V.NYk'Am)eL";B_H[52.oXb(gSgI?C]Aehlf*A>CPo
q1FnF/\4UUc&%;TarfSiE3_D.6,J;.Okd_"VpA\eU/JfN+h+Au%paEF*_#n7i\;-s+]A2/C2a
LbXZXY%"CW$p&k1WYt`&1(#d5-Y7Ts"`Q2;LBh2%Cb:2pA"&"'nI?\f$^ST-&9kI6EZ1JH@.
liHeuT`4k.]A*l6Q2F*CqW?!Oro4*XshY9YQ=]A1A\]AMPe=B1#G),K_3j>;%sa2I.o:<Y4,Wjj
dOB-8r6"peR%C\T#K)H*.cNLDm<LGQcf_fHJ7()QjG5pSY>+W)T9B)hi6QPXX9D/(%&^9<ga
7iaA%QiT^Y1.jETuHFG?#(Y_KL7lFCG[aQN!)nWSroY@4`Tgr7GLh9rPW?\E3pcnu&b#*R.?
k<fukbSlJ0@a#ni+PGnJ!%5C(/8ENA5A5K(FcAT_)RZ;Z@._>?2orA:'YH788Eig#RSIZYGY
sDVg<#hB6e5k:f;P=G`9-KiT\Lp2ekWA,kl$XB[j0ZoNk;9:AAd$ubkUO[67*m0Cq/KI"FBb
G>_@%=?+H&D'n*.>%W^(!(2TngNKLZ/((&M+e)%H:+lD^@nh-`g!u0gQ_D1^.b:L14amP;Nq
r.snhg^DI(n=><S\3m'1`<Y-QRDHodaQp8irKt7Q+oTA;$r#mAMYY]Ac?k9@3?ekg.r!`sMDC
>#JM$JYd@[f$9J/G'.LMlQT*Vs4:D8uOB'K5nl'c.C:hjB)Wesi:RPMo^p]A4&r`-i)t<q.9d
bE!u$N2EquEgf\5WO&`^l(d@G"(,CNaLH0JNt2gdBodK[<`a2LWT>n#%W,l_I*QVu]A?Sut2B
Q#lNp'7hg7j5Oj>bH%:I_&e3PV#+^5]A]AcK/'3`^F:r=pnC23"!0uKdhZiu!Hk"nPE%j/hJIg
gF3PU1H;t^*r;'(<>YEAjCRjPnB@$pJo$`#eOLbPZYm1g_+ITLkT=7SbbaV:Orq,1jfI$I;:
Ag.[R3tk1C%i9tT#G<5X5IcSg6@Jc7^CRMXPs7Hl9u[7K<q7[\jtSGf:A$8=+hQ)\C_jEI&9
mMGd+OYo4Ous4LAn[3=5MedNKL=c\bQ[cY#Nl.eAbbGe<eIH(/U_)qKXMlcQ1'181!2UdNU8
,t9sG^+g;3mi)?njcDWgFDn)C6/Hdt_2K(AS*Kd9<]ADsKl[k'.K-nnGNCl8eIu7CQ6gFt+k-
%37@(@JSeW%G86aE28&!p]Ad0rN\H4'baXIq$#J4Hk<CU/K1ofIPq(SW+.'nn/,k6[(."4;bH
.&7Zk&M1eA$9lg8Y&Y:b,!0sHGiYINu'*4)p/$_*7g=J2)ph:=lVE[p&!.mu8AT#2-Vng4qb
+:$9ERpM=Gr+OpoW8)bp1mVR`8r_VO"jaJSV'rT@m96b66.:ZQ/O@Bh);]A=e=!pT\9&Z:c+*
au6FUJc$"R\I4&Q1o"T)*nUQR*]A.S1`31ejI[j%$\LY]A*^RqOtO":V36iPHiaVOH@R]AVAh`L
Iau10:$=6XHA2+G"h8ommnW[1`Jg2R1iIhVfhOd>V%?"U-pVuKL.Z).mf[C"h:"]A<gc3Wb[M
;Vp)oq]A0>3*0LloR=7S-o$,a)+s>lfGcF;IB]A&6krA2mNKYG;48oNfN(mtdIa=p%#nq!h9;)
`-Z.giZsN``&aPFTT03ZKG.mk2l`s#%>P0.;NeG88&+f!BMc'qd[7:Q5ntsRtnjgL=1GT&fp
tC`A3$5_G2Uai#G@@H/hUPi]ANFs2cUdAuU``sD=`bfD'dLVC=obLi9OIPrHPAcaq;Ds^?f%[
UOEIlku"o?0OU)?paT8ir#GR!G6>p]AtZjuqgq%@t'+;5sb1jF1iEo%>PFNA$8Q'%S1r"6gI<
<rVOg(Xfk-pIe7W2:X6/T_O1m;:T*(c-=l%;9cT__k(%\X^?f<j"cqbqY)MX1g/+ji/S5CS(
;-c>o?p2RuY!$CD9[2Q/M%^QgqYG#VlDcpR?q/_V7#qM^[Xo+jm4P,ST/8&_S]A3:r')gfo1i
b,&@&+$<6P/eK^4+^r&$tX"D`MSbq!H>8$7S?g1lF'%AH(H5\X(H3cC>q?=^Jb]Aut:d-TrjN
Fm!$q$J4H:mUf=fd/E<XUEcnAW.5jX)5_%QKG#9.T-8Xi+m'UmgT:4+TDEF4WNjVRf<EGiim
:%L*6tm;8Z;Bkb2sA`1f[<^/hc^(]AqHEMsl[N<L3mNc&=U*]AH^?#3NYlO0\rr9%94X/VX5,+
2Ho\_lNh8$D,iT[5C8\06h@/aC@\Y+eicS$h-[#BK*i">ORaLfJ.\^hfSu2WO/28"5CR#Z]AH
NXt-J9o&<ZJoH0FS!-3*Oe7@KNVg,=Jnp#o6?+iPZ7:KJ!(K+hbT%q$o^(NnpuJb/hUA0e@q
M):u;Pc/7s/M[K/:"C7Gb`;"d\YeHYmiJ88q5@5-N=J4T$-F9[6KeegE/0RaA^cJ;Y?Tf>fn
#SXnBFgUBA5,\,O:l+bI"43ih)@I,T!XWMs)?M7#P_=Dk3C57IES5<(Y8QnQ641gj_V%Z$T%
l`(lfn`,9Op+?TD9LoZ>*&!nHZ_]AQHY2@D&f>ceecJ3MK>0ncr9tUTnfp/1fH98+7SWN109<
2T+N"E8*ikcek@G%lRo>)g^HS>JB0*C0P#X853<qWU3DDKW+bW=VJS.:siduF2-et,#FT+Er
k\4iL:(+FR`f%91bl4b;<Boe!&kCZ*Lli9%b,@g\L7N9DC;qPAInJM17:53<VI#YL01/h-OE
[^oS\Ze'Yg(&P9%fl>n1NU:SJU/MXN@'s;$>mTdH,0$?5BE&Y]AImrpkVH..Vba$9CFb0$FVl
%P0.q#.l<=iLQNlp'GaINO]A22r,aG_82Q"gkUC%ZsPm#Z<ZjHN]A[e%T),f)-qA9WfDkTA)^K
UQ9BkMd,AH%CU#ok70J6oO1jCgu4=0J9B%\8Y@s+k1]A?'^]A$5)h4oiQ9K]A!,u5gOoNBU&Q$X
%25E**)A_nHe_N3s*sggd6E@g!ro7U_>i!D'bT6+]A)e/O+[giF/0qHE2]AP?g%S\/*h4H$;Ys
b'9n1U9"K'Sh\+Lk26;D%;u#/?Q8WS5*LZO&!:RaJ05&iNGGqCHrpYE/<aSc%Rk0?4"?#KDq
#[&\':^64qSbZ1YJK"ct)^rT[[+e;3W'7s:SL^C)saVm.(\kSV!Q]AKmkp9$$cOLkfVE:R_#"
Cp*h%I;kH-mt*.D?*"TK%=_Zh_BclcY.FCdbH0'#,3*"HodutgRC`U)<\_Fb'B#KF6!7\4;\
M[!)\j&5U$RSatqrs-o-K-?_8`g0TTblY[FH-8hjZ#5BEl'OucX`;>AdT.3Q:n4!*k^dDWnC
AT/t8R2uSnE<Rt$A<-Y&J'u;5o_"!U)4=u(O*'5>"[CZO_(,B*55HT`Kf&'hJ)Q*BIMTkcKX
PniPWnLg_euWs7l)O"'kCbrl8n1dl#4ZGDGP8n`Br!+X[,Uk1$2IXBW7ttarG0-eOB=b6[eA
No)g5KL5S\Q&X]A&%0>Hj5H?"Da?B"'lI-`G%!(]Alc-ZL*G`[4?nPt))cl917fV5.@2__W0E@
N/\cSa7f2E`)JS%04.fjOYKu(Rg=j$90f9g2cW*bR>=o$TnDbM??iOEm-r0k,Okq5`bCXn7^
U''GlMfZ$<MJ3-FrC8a'UpgFKUZ5HiRII.pM#6>n^d_t5EkL\$ssU=tUZ6IUc^"Y2KNV0kM;
FPQ<M(WrksfgE+c-+^,+YM;'Xb&`RXaC-3smO_-/")7<c3]Au\N8G)t(64O*T$.lak'&C6F=o
jn(L8_UT84_bF9E<Y<qS&>9I,SAr+H`le",K>Kn7gU'SlEcrPR]AH[DZI6?=^BsQmA;7(RSCf
k-@d;),b`8T6gr-&>fOo`U4s%'P/.f/+/Fk,^WD/+4aWZ5%1<f\3$%3qbae6a+:'G.TFfMLr
j>N]AEjq,OoAM"7Fj9'L+#sJT>b?W@jh!,-&j"=/[(86P5P7U^]A%Z>7n;Y-^".[sL,baQIFCp
oZLkh9:#J35-.46aTalrS;bZ3n4jf.0V\nOQ)Gk6V\O@6j)K:%10r4\V[^Ps:,`60-%cVCka
^:2TdRU!g(7!XhR?Y&M$djD_Jh`K^KcBg>)R=*)$:-tM%W#8H`oR6-FebB=ZlS6!/3ae-cq&
s`I7cI%4+s[N9^:fgkZg%1m*o[OLZSZu$CAJ`i\?.GeSe80-TQs4p_">#oZub*P/CrXhC"lR
@'UX%OYMFKA'R*DR6mfb0gTSX]A]A:Zl&=TcD9?(DXM(WfqLE_.!1hq-/7)nb/F+VWdjI<`(G%
X.u/!`DQ[*;,<,C[$ks)2tTZ+Z6sG9/i:UDQ=XP*tKn`<EJ."d"_]Aa7g3/Y(K2gdr3ORQq.K
OH-_<*IAJ%DdhcVj$DD3<S4.gKP>)@EV?>ed6)J(NJSdAoNGaY,3E>^1'R?@3$Zb-ijK5>>"
gqJY!>J^[Wj<`d$+Nc0_oKC@We#%c4C`]As!B?bPrKlY7?:+'\Z]A;!)EZ-C7I;4m"PQF5I(WY
2]A-$d?$?V@D1dMNJ<A8-^\?h?i1!07S>b\A);@HrZ<hND@9?KH%V[GJQJ'k!@$ba&EnQGiR!
TT,]AGcF69n=qc5X?Td8AEp<t(]AE>5krf"bfZ37Ce-Q#W$:S>4P3=tXm)`#YJ4"Lp&K*fdNs^
h,u7?gjQ$c.u4n64Hc8=Ek8-*ini,]A#1i/821A^(lO`t\C\T)qR]Af*WT[k\e$`?Qrg5qWe5K
##?J22uXkMm@-5/A9fVp&"Jg^.T,G0=NS[EIj(qJke?f#pP[qPfpMU&J^/E0Kt1LfKPE3G_,
9^(DBTu/MYPl(52rr?1FqU6+*@ir+q?:tbE`1V$9qbG"O,!Jg+J%4FC<)C-\Z)LqfEI]A@U^/
jZ(AKQ[r^/P#cpCXrMgp-jU$5bI#VRH)jY*G\SFQk4*=5_U^5@Y'CY,!F-Z4>"&.:L59hu`!
8ftc.QhGFu0.85=.p_+WU$trE*LN95859-,C7bm9N)1FZ.=&/9I6kiG=4VZ\pP8gmXndDI8M
\bsJ\;R?VB,hau%e'"3;7o9YFA4W"JmR[C=SD.Scet(r&?M)qA$sm]A7o=3^HjX=.jaeasY_\
1n%US8^=\H`IMqgIq^:>I^h<J4>Ru;%BoONtkad=C=d$>9=n8S=-f^d>MSDDf-S\UmP:%A1u
A`+0WbarU,U&<'9FSgF'?f,cPLGkN1i&aQ;:r:Y[Ze'^"qT,?1mC&O;qhr6g`964<#luDfNn
O<uIk$4so,H/DTrE='7Y!L59LJNiUFn6=7mP@C7k[oZ5Q&R,lb/Mfoa^.^\Q\5*O7<br,Cc6
r#ikU,'P=%,$t:1/&JHA"h1<Yb)OYui'u7Qq27?SS5fVVf`B,]Ab_hj*G8^A`c*X.Q=-";B"3
B</A_.RY7#fs>An%98*L^5)'s6-p"NOuSCTdRFb(:f[.*dRHF]A3/^Pl,o-_o`,eCnR;)[?\?
DGKbCRN5.p"YI0_ddWbRcMn.iJhXH@jZ^H:G7*637l/gkk/(t_/gN9_INUEA^0aHno7G0)<1
pe,eC:`LrkQYP:sI<**<dEdo,c/pj@kU@(A'U@2RIjRqIl"c=!DK387NrF9J^b3FM=fK>`9^
6&jnqJ1TYET9O[4PGQ%-<F(<,]AA`_8I*mN9X$1dRck:(3361>9;SohJV2:S`Cl%=%[.3H-j"
X"6L[tZ]A>49`b3P^%Q9e-#39ne(6nERYoANT-X74n>GQVXA90IVR(r!fBR74?!6DoK7.9u26
[>c*j7%[GqB_/P5kK8W/+tPt-'T.<.l/W,2g:1O#VARbAl`lkC27=:hU`H)jW.Yl=u_2]A\Dk
DQC@).V&C>S-EW1C:*SD.?"*!m_i"+&,;su1HVC']A3k.V\_fg0'Tdf:=hlJ^f2_9T>OM0nrp
>qF.Ni`LM7^rh6?V]A,J&.ksY"]ARFc`I(T$<TXL,c4^#)GCfOltkeB/:I+?+3]A5==0EdQ3W'A
qY@%;R7JM!.EiAu*65%0:N%CeH.I@jSeWi6ttl%gs7"2+WFuXQ(^M0k=p+<tNsCPFG80cC<=
4M3KBk]A&GS:cZ#hYl-JaU#&u\t:>G=fl=\7OE"r%^nn*o$hn"Ku$`)HO6@>_5;Yi9,Q#.Uqm
ST/*AVC1r(S0Wcp4^`jAC\m'9?e-ASp0F20if*RL*\gnK3^12l[pAs_dW>_TA+-Of:4'on`*
tn]A;]A;D:Oe-[;"LEq8@]AnIJaUdi>X2H-?]AJ_.NhK@F/D"j.[6fOh;5[pApP1<p4IRF%eXX8r
G%HbM*2"2adX.8NSE%]Ahn*Y3ZCX%.n3mK84b:L:BI(QmES,:Y:[<pD+f7gMSEZ;Kni9>,WYA
uSU81E\e^NRh6Ti1=Fs1BQ*^2ECM97Il8,u5Rh9!JUM-8"2`#u,ERTO:Hp01`?!+JdVVF5bu
/>p_2j]A^S-\M#YK9L"QEL_=@O+R1lk/ob_<hEO@@$NH:=Ygb0pPL?"!2Sc<jcmR&/WadA;a2
3+eQau!V0&&150lS#3'KG0uZeZM>;)='++=VrH`T-X5JH?H\i;"&nD:Q&rnS,>**NnF\ce[(
/UCVt9F^S"0l/GfOaU&6X*CT_=@P9/9PQQJ>j-NH%E3NX;mgkNU%<GTn2jLIus*ij;pl[`;.
jAnF(dOTBVhtJ5%$G]A\#.k8&U_YjkJNU"q]A5`a3t63,ELghs+s?iP%^8`m`imLLc0h4g\r?L
M=(!<$o97hOm)25,L^:!J"RT?aFRJ5E5"!#*156T>N#4f^q:T+A3#We[#?s7-EOfIf(QpgS"
>hh<!kQBL0]AE%]AZ>\(;)A[_M'=C0#t%iSq@Bc0bKPE9+!hs4t#X6<fnikMh;!PZi'W+?$dR\
9/K3I[0M?'Nc/&@;B-Yed6V#423a<[jD)`mXfQ"JX,;b+<;$Q%2sS'?dT8b,&f,Qi[!g@IqD
sus.5e/7Wj;PQ"g)SfWM'5-e+qFgcagR:J!Isk^j.TB`uY.Kf+MfW(Z^B.nS2I"7Lu+kgWPu
m&#r>^NuRF$O!AAO;Ksd]AY6[#VH(@71*%h0,kPX]AnG)I=W7jl*M'i.n"I`_JUe`iP%G=QYn-
(,T9Z5OF"+4O]A*F&.u)p:UmbH_gp&WW".(G2se;gWERPoL%lQlj+n\2n5fJ.7%h/)J8CS(C'
T;P!h(`23^4Y*\Q.LV$;nR+$K93+['K;+iKXkEZgZ7hl[I7juL<nn;!hQ7V`e3j5i"o:o66_
0uaV'dbF?$L3&eO[Q!VLJM16FBWVr]ANk,0Yd78^GE9">4#_KJb8/`8BJE_pMW4%aVJMInegM
VLge@Fl0(@hg;qJk;(%.(sDcTG\Jij-W;bt9m[76Z("6h>rFUB9;ineZd<=+A'q&U#`U?1.N
Ah<6bq6*h;fYC\*3F7'kikS=hXH4$ED5QEdR8#J?*XJ3t#blEsl.U8t!+WEoS+%2/E=NT\3d
Q2l?19dca\n]AhMYXIr,Ck>SgASe(iN%G?[TG>WCsiaBd:F'Pa4X)FbIgnt2\T('&'rbUIH<]A
'Ys1+<9gmdeL0)jJcq&hoT\bGnmH6eGG.b`!h:Kb4G1+'ElaM*p"^Rb%7p$#/`-J`W]A8:8XQ
sd63iF3s]A^)cEH+e'C8'`+3d]Apha;0ViSg9/K%+WpR&F_rf]A)T6OUfBsok`.Hf=Kru`JFs!n
`A<fL.a*V'uqlW?&(+pfDk2pmhl.F4[q9Bq#VHu?I'l<A8faa*Z?U5J_X'4l<<)%3C%j6h2]A
1,4BQBJrX+[+O'Yl#,\/5!n;5YAEJA55^e&A9Jl[q[t`6e19,/H:I;q0oR\a8"sM5,EW4)^L
ZUFj_]An1Yt<32%XWC<bZs!o?[1A.=qtQn5;VrLU>7PW_68sbb=IsrYYHtN^Y4&+Gc94QrdP,
l'KOjPX)jHj8I1_]A.Nq9[m"uuiZBH.^F&"*W:kTCT,cP>3Bj*2n8(km;a=bY<B>u^eq]A9DI/
=kbo43Qf7+5bNh4WZE9ms3g6F^NblFktY4Z]AjJ?NJ:eR`Xjf(:Mu+;4mqpP[E=WCoQ27WQE+
&qdOj6j7+FA2C;\M=$gX>#)5RRMSH2hBM/`AbjrmkOb.Ve%EE(gOPeD@I?/up3^GsBd&c!on
:6"r2!j=l&(LPY.):$`R06;=?e[m!"hA+?sYU$;+r*RSjrsGY8k:S`5/`^0-B4@T<;m,i%P\
`]A`QC"'RVHrT$m@oH>U^Z\R$_$'$pdpjD(@g5;$HKDEM&9DeUK2R<]ALN\&,1!Cl<4lH`JBcW
#a"\/OQ[9f,4I<W#G)NXf:,2SC8&tCer+hK\0U.2^MFh/8;Ho(P-tW%^%l13>,Z\\M'PE<<D
u`k"2jIO*;ei"A`C;/1bZ`!DmCZmr11G1!%F@.pK+Yg(`GatYD!Mj_(!ZMOpR!VW=JBE>gR:
N1"J#1)RD.P85YYq^.GA$-2r5UUQM&68,8@9`/m%WuR($%+]Ar]AP,PO2*J>B=mGQ+n^AI;OuX
7dl3rCB*T+HP@Q7C2<B6-i<d1faLj&jD!IK1Z\VZgV+_iDUjK;H-8RVQXt[^N]A8bcXD<BM`Y
:2:"Zo-^,Ae*hDNq-7dd&ngbXF-Z"n^J&(?;NPANS4^=.-5E[W/.D1.2`8>A_F[`0/=bfr@]A
/!p[]A(DTBf[@Vlc\\&I%,b5kIa<Gq%NE6,DV^lr`Bn-VGW6md<e.k\O37bO-LepI`e4u77ep
"f4<:j^.m.hBj;O`fnp7`Q8^hdo(8ea_$_oG#,TYs-u%U?DGsij6[':7u.FHW9/X[<(cJ_=s
+9D8Y^!Gl^Z68ADL$N)s/QoFCYrERln+UNn@4JVWrg-G*-,;m)0GaY[$+GeJ1X+>)$T,4-G!
;ACoh*P#d93VQpoG>ZWr=0(i'h;N'0DiTEZk1\"OX#GdhnQ$4E>lFl1q-f>d37k.k_K.kk.M
%S'9)VQXIg8&TmqUQ#=)+Gd$R.`9"@.J8?dKmKr,;scAnB(g\^c&'@d&Km'KLf]AW!"O.e!XT
h_qe,UX#M3VX1V4&<LLY&SI@bu:iI:)*.2f8:QcDTcu620V]AAA23$*Sj9.p!HW>h:p8P"q.8
ca!7EBiaHcn&3IH:PWFRQ=]AqY@9t@2;5=15MpDM2FaA(MQiD%lf.O6/lX(c<)KaDZU-RZ$&c
>.QEsB=:%S2VB8AJm1?-u@N!YGG*`Rg[Dl6fu%q^qqFrDOs`j4uce2m67`[VJ+qRk)A72oN:
5lKN5fgB?..:JcRdPICb6EZ4JA>SQd8W@I8r?<<D^$Uh<]A#tY,9u)[+nKh!2Wf67(%.:7Iq-
<0QJiM*s(AF]A]AH?AV3SbD"YFZL3FM-)`Y#[9#HH\";=VY!>cGk7^bV8IL<nhT+dq;o$.)$fO
!&RB8g="7F>R3r\Hh/&"/Z`cq[bPZ>D68$]AbhSgs5U"Ub"kqcbQeJT(EaRt6!V\I)"dg,i[6
/Y`TCHie,S\"SHeItRQ09Z'*l^APV(e^W&G)Bl"`FocAQ)WY-nYmS,J,BK=b?>2UHSJHZq\g
>mTA`sO!NS=eEJ<5%n5T'EkZQBo[5-D#BD>4TmKu17+M#8JV&N.0)W(,rAl%qo^Bkj&pC8K0
jbpBgH#.;7_;hNMpGddHMd_nI.!h^:"/fejPP-$fo*I4Y">"0L.Md6ZCTeKUWVPm)m-O3=<4
o1AC_176H2b@_b]AGU6;=llc>A^(G:2joSr);ol5i\AWGV=seb7=CcGp([imC:Xa[+<u['G(J
s,Gm<mk^u6J:!P#X]AI)kT_/,s_F/jR3Rf@A7Jsa3Sjqm=N`@!NnNk3TY`E;+,^WEa\X=s#hr
:F%V5e]AG*A^\)fOHQWq[P*rTh>t;Qj=h_O7;UfirkYZ#hm[<LfjiB?q.fE]A<@JHW[^I#K[R:
fN"*rq.qqnd<)8a;%lh7e/1*.9(HZ:)JfE^aPc;YW--'BYJh5oep]A@gA9/o>GE,\lS_o]AWh6
]A_]A74d#hWE'>EYV,(e51fo!oA0QMO_'a&qo?\P,YfNS=?@X!a3jFFV#LIB8eo#T61[4X!3mZ
)T$l+M0mk7O_t+_rDJP1s;J&jmmS.Yi9(i0hjI)fc#J?MK6`9P_n5@c$)QE9dBtKDp%hlrVs
DN?]AWq]AL94Z?G1k1S,71'S[Y*=5^p@g5@8aQh8/boAtKm!Yp1!#9ht.P&R>/N]A&_Cn4,Q(n9
LiKf@)eA6[9$MHeIbBHj0t@C*6/2]A?UJ*>/t^j_K"EmtaXVo1619jcM(R[%NGQ>GBgF>BaY.
H!T3sg:HMtVr'RR*=(K9#)!l.dYMT"Zf4-'Yp1q:$A*Hhffj=c:-n7nZi8>FDJH43mGT-QWe
APWS0Ws2'pZdlJSh[5WcJQ1SAL$"ooUb?)=S)WC#j^tX'%uU(&OFaO]A9>BeV.9Uh>'C)VGjK
o:*7O1)WHNAW2r;g8F7OIEg!T3bJW(%4sKVG:6ptbcA;D(%n]A@'e6)#&lTV-J0``[T:#dG]A:
,R1#Yu+rI;MZQ2'6_`mj[5t=@n-`=-"aP?rnA^js>_d(&B!VIpE.5b0p4ni"C8$@96cuu*ko
'?ElV-W=u_C>+<`]A,L2n$k"iP>.i[bhij^Lqn(hTnrDbZ]At`9]AI.1@F<5r&[catk43@'cA5<
K?d:Z&ZqdoTh%mQ%t:k.Vq^mjnT@8\)aYB5RLYfCp`/*6[=B&QUs4`LV,;g=YZDI8*_+Vgiq
&W5P@#3>DH8,IVqGlf>sm--4:?R$k+3VL[\,M%8I!4q=iaY2fM'/(dIaK=EafMaVif`@-a26
QceGdYp6Rr\fY%BArA_2&0["$Kc]AX@*0B=#_&tArrqY]Ai)0n_^/(M>qaSjNRk]A_n&).o?A[a
:<=TNJQQKSl4K0Z3.Y-U`eC,d+*jM-cU\CGAi+H0c.>seQGt$Ri30PrneECsY7Xr2p[,t+"F
@_5YrH+<B:oWRG!^9*.i0s`"O_MF!NT19da>R[mjo%[fQNThq1PAWDg*Z7<O#oosX</[3FkA
pf;c=1>X.4tV88/]AddCR<C:tbah\A/L9>H/@Xd[!>k-ZNR[#XDQdohhE$dg)LKYe7_%Gr5su
Z+.%PF/JgiN<4e.;S)Qr;2WGQ)POHNWi'HXVA%`CaNZ1SDl7u$?CTr*@TP@EL?>YXJEhM9TV
21J>MB=5jM@tH!N&@NS]Arr4naj4QaI2lOrQ24,dUefm^33=_KBYs2P7hRfT45W7,_M52K5BH
3NQ:X&9NS<glER!M=-tF+6h->3Y`b=PG"HrH+LZ^j1&HgHcQ.'0:1qMG*;GotIQ+eK"!qp\J
[cir`9u`]A%,]AU8qL^)S<`0u]A2%ujKZ\'J;*6kNRD\]Ai/?#Sn'5R6#JE%dGH[aE6TVOp2Z(Wo
;(2&h7KC!>P&cVn-M!/AMmBuXB_MjPpX(j:.-:"C_%3u*7JOt7VlFI)$ornC7-PFc#fS]ApSF
5UNcnp=_a%Q_YqGUe`m/O!maLn%EUHF9I.co\]A\J<Te,Mp]A13*<U1gI'.COf/W[[WgPZTG7c
>:%AraI1cQp$_$jKf`p<@qsbd7fh;A0^qi"3N+I"PaBYA*HgI'._!nme_<i`\*4e%<n<0<9t
FkmBA\$$D_V`S.R2q8lurJ`V4!2XdHHine[$pEGe0B!!nPJB4+?3Sup=VFt-U\/c"\GF,J5N
2DHbh9hmsO!efGK%9<Y+bOQP'*KS&c\Y9.H;NKS>\Nl1"IRk-2lgkYjBE-*8T1)Mh/6a?BaJ
1C>&'B*N*,d6o8STl++[&&$gUb1<bKB90U0<f\2]AZsb=Y/Gh<sVopbn")gkPbcXO$T>p%\p4
!8R7%pmX]A2K/qo%1VS.ACY5:g*aU3,iF^H[l(/O8O%S.*q@MtQX;9EPN%f"G&I7EOrNo&jPD
]AIoWsU!S*ItAZGlT`-KZ+mCX!aZ+06X:p%MT6Opi9iDqsof(e*uEL/Wi.W)f/e]AoM]A?Ck[)+
L/rrLG3."N9[[PR%H/JI!V7s8./W#OEU8Wj]ANuG*#HlV^J8/NfS?+`5)-\`C;7[Mb$AEQD7:
O>#Ep3Y(j^WU4eQW</8L-ZXL%W9$(LF?nPL:mr-n"f'7pZ?X`3CfY[lWJ'a6i)OIUA\>&\Cs
]A0(,,&PH7Bj,:iIPp>i&b=oeIEaQrdqDi0+fh73^(^;YU0nEYL>ilFhQjiOE[$Rc_*;Jk(rW
?UN:D-rOC6lJR;Vg<#a#+W0Feph5)`agP?Y"!Q_UW3Zh=i6)!GH%daLiFMPaVE?Fd>[T4rC-
dPTk>mXX:J.2PViX]As\<K?gbV3F5Q=UGBK1SH,>9:a?G,!`a]AtT=,8I.EH8\r4OF/"qUmdYP
oiq58!I+=7YPlkbDQ7B5Yd',UNQ28@`jm59f$CI42?*hG=StZH3_EB:dDB/.f@Q/L&)i[@#A
NFF'_.r5NqI4;"/5MdHgSPgIQ('Xp%4SlIEc>K+AiJQcA;Uh0Ishe2dZ/A0dg&>.p%[Sb#"'
Y2^$.TaTdBs5:\XAQ[*HD)gNgC?3+Jqc=/qSE>7,Q;1()Z6'O$T@La<8.=%+E69*MINoB1f(
.4ceW)16=3O1U6g?`JED>br5uEQ&84nNsj-pdZ4c)e$O8?8Io<1//BWiIK?Fl:O+%^tUPChT
K0:3nM9NW>5SMR[o*q1\&SY&>Ti^&@s_:r+MIt&Sq(alK!+3GMLf/RQ]Api5@!f%6A]A[BR=06
eP$51UEkU?1_Snkn,8B8dgNFcn:C"Wd;K$\U'Un8i]AK^56ZH*uBolW&mFd$A&p_5pFV%ce$;
HR:4*\5)2([X2G#j,2%gk05%/"S1iKmYXsm!%eU]A4;M^q`3X>5t"Vrb:tnIoj*;(A3K60ka%
1r<PAb:[hli`j$2Cr+hC?HOYeVh_\mDr%Qd_#;_>id6N0jhSf3,`Eeu)$I\ZJoJs_mu(Hgej
B#&&:4j&ctCud5U.=UI(;d:&0boMcGW.j$E.lkBGaXWR-<(1L;=(Me=f1AfVCZ;@Lg,/N]Aj=
Gdnc@Jj<I>6aak[cokm1G>1K<oDT\JPja"6ho"2$h0<+E[R(bs2JqqAl0qjjpkhSqM%tUCT1
ieu"3BlUr(m(HAB+mWH.:b:mu):Bf9j15rHhV=iqUej%.e6Ljj4@iD?(nLPS*XM7r,;IM7j9
%NeHl0"m?B,BY,#Tu@j:El@)o=6^OZ.?]AX&bR`7\qu`6m-de6Lq:.F!59ON[!W=*YMhc0[BE
ea27XB(\iqOKDHh!a]AN6.L\n#lPFU3`R_C@EbO\$55;4C6!Ke'U\"l4i/2Q#8%=_SYGNojS'
P"!#'oHETjY+K^fNU45.8N$>.^lpJAU"fHr=6UJP`%ZsRcAE(Z)Rt<0"7+o=l"31S#jIoFH2
AONeFlDhB/6BkJB',O(-rW`s&Yp:j%a/>r]Ao6=\\KaUB+Rhl%iuo<TocrJ5/i8Wj-4f$G<c:
S$\UFO&piB!E]AWP"TqDUoLUY\bXBUA?#)=HNG0]A4lNdI7ne4D9k$`2G2&uE)d^Pd)/6t&0ud
Z]A<DYh"T.^8?&4c@C1(qZXG6@,sEOIJr\K#KR-9r$mMoVMQ@b#]A>%P#;8N,GAi3N\A#D*"F4
0=)Asa?hV/T[bM)==N&2?Y?36p0AhbZ1CK3.OEgLDs7T,d@(eV`.nnGMlKB%C!IbPEp]A]ASr9
/)*.+&Qp@aS;k$&3320DB34]AZ!5uWn"N-*i88)&S1"J]AL#o]AkOPru8\ld#=u<E:+9#&5+LH+
dE:6t_(G@@YS1?VOt;ZX.([;H0]A[oFO#?geO+Nm^MR1(VFs8"\(gTSVRfJe#Rpr=TEU3E`o9
(H$fiYm*W0UPcl9Tqk8/Imco_7h.pSWg[NcHW08?JTmbsfp<i?j[bT&q*fUD1qn.[R4STj(N
Xs>)WilI04B#O87K\OImn_h\D6?&-`_qPRFS/m]A#moE.kqFZiAt7.d'51M49l,WJ+pLdXPOu
ss;/(=?bI.=d.)QhZeL*+FFsH=QUY8>WC`g\dVY*c,C\AK5AYAmWOd;,$SklX$5Zn]AVXol;7
mPPnlMCb=:c'c.*bqcdS[BE.d*p:GH0A$$N\O/m8Hr?77Zc+"WaINGS'2bR(IS^L2K+>)*-T
"%W6J^$H#D>KCO:c7qKe;"rDm_nuh]AIZ\nFiC)eiL3\/38-HY'>S<DdZC%9T#o2WprDR0Hta
-ja+cQ%GWjSM3lrW6A/NAZDSs=qX!pC_9StPQC!2hN3fNY!'%c^XsI/82f._RZ'l\l+(&2c]A
pY*ECDFOS>jR9[SRspPInini4c5.aZE)n[@9k55AOK5PNjTiTHP3=3J`ZClH%g]AIEHZoq3r!
fMg>$>sUsu<H_T;X*']AB)kQ!#;@Mp:;2\H%WoeJ0Ghgf6X%e;?e(I^36r(H77VK@L:]A2c;5#
T4_`6[R$Kk0ZB(qDJmMnL<`4qn,0b:N&:IhZ"`e6@O8i<S2u65C]A`_c5OMJEm$.-`G3%i%$N
k:cCj3TD;gftJj@NMr:<r@fGi$#C1$*$nn$?g5jd!*a36#uAdGmj,Ws^%-)Oj7d[p.o$TP%=
-?"rC[fa@#&XqRO!TIDU<ep*7a'/u/(M6ih%S]Ai"o?#D3[1P@TGeNGbXiQnrVF]AuE[Z5OT$F
dD/PW$^EfqI%Y*JG@Me9]AT;e0;h0&h)V0m\UF.M]A>3QH>6be4YPms]A"*\g=r/Fb*lC7tk*[P
qmBo\<S'QEYMP4o=]A'T46><k#b,8DK?$M9j_33iqi<4@/#*N+.a%:tp'gH:R3)ZV,57GK7,R
8a<1nUYUV5[94I)K=fAbOTUq<atq:"s+STi&7Us2OTp^$mV#(%Z"?!]ABc8n.9'hIcm[A[Jc\
X4>^qp;H/@Gn/$8&HJ*dIt4ShKE//,i<sD]AE/#NZJ6iDJCtDk9(9foX:uaDTL$Z,eJnL]Au]A2
oFP[DuM'j7_*!%;j"Ce0Lht'I?3mlQ;Q(P5;]Ae^+eegfN"]AK`3`CK0\m#NjnESMs/I+Lr%`i
ThIf!?^MC^44d(C7ZP*i&j<P=8(SQ_qVIY$'loq=]AHg/;Wk0%d7GH`if@%[DI[]A?Ht+YpKa;
;&QKk5`r']AYqa;7aaAcQ#(?KHWmaak2L4irmI6L%\Rk?_\;2T>@K\PbYf&%!96h;HlK]A*\En
chO:B>;?'W$fB@Vhl,?si$VWVij2,^qm1G+bLATAlaUf5[V"<Fd"^4SP[>?N<lJkQMW:4"5N
DOeMWjG)8KpZ'+BRo&HXK,\@XWR-g[$uX7QC*",LLuK0B&0cFtXub-[ThpS]AmZMNE3!S;X..
cA%.6^bC-g<V83[e$2#:uNWLKrZNqW3RD%(-:=\F2+[X"27`$m*?[b*8!MT0#&0\]A/?r)NWM
*,#&)aKk.*`j6l%fOFM:6rqd6qm,r)EmQq%a>T9=?DR8pO/ONg0".\T^_Z4:/U>kh/5"Im8Y
JFJ7qfLqnDF"d$<EXKBeM;.VL32Sh/NA^W2ThfB3._^>_ng>bSN$DDhpYZt5/::Re6jFp3TP
DY)"P>;,$!:>k7HIn$Z#(J?7;LIsR5c3D-VZc!Hi>$2i'6S2B>cPF51r(3!%2aC3Foa+f?2>
f0/G:s#P;sH2G]AgST1Nja8YFf`HEH>,a)^9lF^>jL,]A;hdgSY[n^:3HkGlm[:9%i?$>WX"Xs
#DF)*<Ba?oMs(PjOIq2(H?mr]A$P1E'+nVkueX&#bPdE1qVZ=n9hr^*2g]A><dGahIPMdu@8gI
8jZ?0/@:%!.#I.[4ZtZa+1a3Fe"skIqWP5DZj5!"U.J>m#;4+)"kP\nRAF%]A*ZOBId?gkTUh
0i65:P%Rmml$<I?87^3dXu'(UUujAX11c%2LDG<tB(^kA!InY:kK/nRYn'n>XL6!*]ALM0aE^
d;6UD"lR4KLUciAcd^8G=eGD9Xa0pcP5M7YfoASZP9,RZJ2fHNWrms83,4(q?8)geH@:;5_n
M_q7o;eHLXg#.m8jCFn*S$53S^ERL;FFPbn#*d<VF"'_$foX(d2)CSE8uBnW5JKo!E+"7#F/
Vl\-Q+%1oBW*Zt(aS=m"`I(CY\lS)u:-*kGl]As]A^_HZdG0^IBldl0uUe9_7FBTGnJI3)e^6.
3L_s@+84#.\Z>?KTSTePUib:cVK&\YREdp2BRC\W@7sABu!/Mc/nN]A!k=i&\t3u/F:Eed,NN
'/lOi[j9h_DDHf.+5QELM1R;j67WF`T">g6tad\tf&c@bB\PTOX'!!'9b+l]A@Eg`qbjQ5.lo
!,l,"og"H0l8gab-s<?N(89B!V'*G<PKG[1]AJu$QqM-/7*TsDQ#_>R,fIQtDJ@i4-*("Uq+r
p7(\_GuHNtmTYbj5Y"i\m4SSrouom5=b9e9?HtFQO`EAt>;0Z,$hh;O&mh\StD'j62e29fI1
ID9n$[q'?**[2"#cjk@lW;lm,!B4TEkIJOoE6o@%+$2EU('hF=W/U/>"O@Y4_#1+/e!tg!59
=,LoS2\qGo$aYI:B7='GsVJ<*/%jXE:mBP++JOG[.cNE6%Hc`?2!**1h\j"L9X[Y$N8r7ak"
M5X&Rb?O>h:\cH23hObPERI;aDI_o$Y/Wo%m4!s2GR=;6ls?If&q2juQY5Me.[4+$,h.</dc
qBtVHrQ=N"8VEh3@VHb9+koOmWGCS6+b/*H^@j)oXp?]A0DaLVNKZ.MGmleaqRoKo]ANI)VSmf
U+C80nGg@OLq(AKSkP,ik<85->I1'm`YPB_VC#2b:AX33-8NEPh\cH3,;%*Fb2T[+YRLn`S;
9iM7Y`kc@T?b1UaI.Y;hO4jiA*5XSja0LNGLOR`inWojZS^1Um^rcpUESsZgC1Nd5YCefH/Z
`[TBbc5Z>Q"-kcj+pnc[1?95(i_p7`JB#@%Bh<XKt]A$.'W+JOoj.laLGK:E0+^?Xk9$1mgL/
n[Ym<HY[,NRrLW[X0*3mh#'Lm=JR"!5O^\V*I>=kGh-;=.DilPJn/E-6_^ur(FlU]Ajd'Yi-J
U<3$B<PK@7e?GC]AGJ5qjg3!l6SBO85:]A>-X\q;BDdqU0U(:5q'@Ml52-#bTIs5Y5#7K3isPf
<g00E%>>W@9`S<1i8dBaH`_/*"4Io&-=8c7u,7_k+.c&0P5,cfbl53(NbU)]A,!"MhXeXAV9k
+n>&-'6OW.iem=R-"4$=u2LN)6995VUY7U4DCCY'`N62RXgt&k<6cF=LRC1>fTP#J6QNdhQW
F=>:j"(j^%>Yq9jg<>!V`hEBdnrq8^)#NA?Qa";EK"H[>dN7.ouFb)UaQ+-A]Ark!PqmF+XIh
3X#<HIM404Bo(IRqie[BAAhAo$I1**.=`,G+rd:rf!C_H<9l(LRA_'YUUIa#jP<FmI^oU.`Z
\>JPb#._E!i**nS&gZ;Tmm]AS'p!3.Y/Yhd5$_!O48\qkIEAghM(\7%2[\lu>"Xu*c>%%7<BG
CI(.g!Cl'@C9KhmodOWq(qD;F2t1Q<[2OL[+a,/0QO/QT9YP\V(SQO-cJJ":Qq;l<DKM4003
'Ze'n4GhPYk8,I/l'l);Tjga3d0K&-5!j>t_jh%1k8!0h-==l0i]A8TFlk)Y:hWBnJJL/on8G
<&_(8"msbhOKD$/0=dBgA3"OZ-q#B.j'UFMKE)AdH)Uumt938&`&gc=ohas<!FkcIW&#;Z(o
f%FWODXfD_Pj,L5C>N&FDbikRpXP`^f<T*Ksd8en\dGYW]Au#dKf=#X5fS4kL_R<[3'*qXmiC
6g`6(cqN8V<O48r!uk*,6?Y#ZEo9@(DM:D*I"-6d"ZMj&,US\NhmnIXJ#F`I\q6ZN.gKi>ND
5&WepD[%).WVU*Y+'u(sS@?C@BK(EE1&SD+3"(QfJT@b,f)=4P,:Xo:MI5H0Va&.s6F`n.b,
>Z0WF\1u.O"=)5I9MBU86XW?h'gZ+j`0Kjgd>=pGe]ArsVgmg0!!>5Am)G#`:`X6<(DWB>&+B
;_g$L]A(L$JrEut_"@cuqE=h:"kZi^lJ<Jh9JB=0[hi]Ao;Q7-,V7&oL;RPmZq<*'O`SLsD#j<
im.p3*Y`6sL&6Oa,R*iI<]AS,mIPPE,9S+j),=^NUYJj4r`i8e/h"n`FN5&>_]Ap8qU&gcPtp$
oM4on^/eGTOu`OO?\p!%Z/dg9-[k4s]A2FsoD**D+P@%,@I1YRH/"n1XO<9L.GLA,tVWds1C5
-MkO4sEKW1D`kSqsdfa6ZT^9)bk3b8%YjVZU8ZB-M,IGB+)CWu^IW51f+^Z>qFl/F0.oikG/
:C;AcL/qu7/`Wb3Efp:*-hsZ3hUdd&>O[5:--Y/#\1@,+%`*J9=]A-3b&r_B.0G=GoJ*FnQhB
gtM)ZJd;"JLHeT2Ck]AIjK[NQCL37`:sG7I>+c^q!D%.o@Pa\lc[9uI#9=<O_@B*B4Q*UT)MU
mKj\GI2,SVDlSqPhL4uk#oI*.TK>)@;k=oHD#/Ns3u9lW@m[hua:IY''"9jDJ\q*r(u9k:^J
mIL^+R#eS!!O$BL*84]ARYh/77ej@B8?2E?#>#ABbIBZNW0Z(MZXnR_a^Tgm\9TL[k_SV(^'X
]A\J3Zch$;Au*g>e:V"mTPEu<B#6l[_9mr$YR4A.K?Jcmc4RC(l7aSQdslFcq/2mh0HCY'&+N
>_#.s_$Y@>XrFEQ^iZUQ?0<rU1JX5!P5@$7d?FGS2]AtCV67k#C;\6l5c?PtPbnUk&J1h;PDl
ha,[.l4)e-Pmi2LqCc9b8gr6/_Wqpf3437=2fm:Wab/Z3?'H;]A@u?Bakoo\)\ctd/lbW0j!'
[NcB`=`BFiVbm35)e>IpO+8V>c<1TRA&kRn2u.YeG`G<50"5rdUXY2kC1#$JM-l<KhXI\:P^
A_,;B.-H_T`9I.p?doGK>]A;gBEnSpl9=.q"I,!jq$%&kQj>ONGc+,$Enpn1G?!+K,__OHqlU
;KWYsN_Yc>e8Ts&(>;0W_`qQ[F+2[R/LkB=l/8SI-'um)-"BpGkE%'U-``@a=<RN7s0t@U9$
\(ju;rau]AMs*;8-[M0Tm[M1rD8#!DaiE&nO[)&^'=h+'+BmnOQb\:o;0k+PVk>?Rg'F\^%W$
2h]A%I]ALb(rN/4rO(0uV1)l`>4UE=hlut:uGDg1o#S<kV]AYQba\!+r*Aj1;W#5]AGS@oqBh-$+
uTdN]A\X+8A=O[=uldrdn]A<gS8&.Iolde^]AhHh6CW:KYr6oRD)D1ff'fAm:+J(;U&MF9$+&52
6*YeVc]A)d(>%)KcmuTSKGjNM::%ZPgPJDPANn%JuQ/@+?^YO-BNjF\8@,%ohcRi8=epf-R9^
D=(K$:J$P5m5VhmgA)",sGLqeKD`Mlf#!.u;pL;C9`e5-!Fq1\KRXjlkrZb0eI.jW6+jiEQI
ZCi`Y/c*`I2kL,Y\W3q5IWM2I4ZsX&D*VF@M.,Ua7]A[]A>tr1.>IrFQ74"oV>,1J?nLgYHfto
T.l;=jC+IX*\2F&D#7_[UFO/1;3t=?gt79n`DrgHQ5RTCd:Ra#3"I(CPuUWM'!(g$8TRiKl+
iVX1A6#WVSuWhL`uI$[L0Y/,/e/<7n^38WBCKZi#jfs6o?ZC`I,6rLhfM1&nH7HqJF&g(]AjK
;t#7J/H:aXXO*,Abk(h7a"+SDND0R]A218;DoO/hTkb\o'8r`KjRu-7(,/-KE?dP[=i"#o!mm
1Z*mb0i_c#]AA[4;BiSEDoN>E89f&cf:shncsJZbVh=h8RUGW9s'VohQAeM-"e(0WVV<8m"S5
;[DD4t9i95D:MI!-CsAUG#O>=2H[Re`cgK2RE2dUtaR.#,LU$3jd9*_Lg2nt%Mqa_';(8/!R
arS$%.,++]A@=PnPhUj)LMW*6>I_J4H=.D%Um!=ZF]A2fBf-BYE-n3>j1\Jdq!1c=I$btSj767
\42f3$?K_'/[-N>[./kHD`4`nNEFd()dnFqC%.H]A$([)Ph&W[ien@k2\k0YEaBWUt^(ka+@i
SdQaGc89ukQeM#p4H/*\ZRmPU%oS;P2A7(9N%cf&>oYeWFZQu06hS3LlISl%J:^0U&XuAXg=
eWs3JC@GZdI"[K,MUo[dl<>n+g/*0"+tKe65$QS-Ujd4G!<Y\pf1.F;hSuN41@Jr:9R-00)p
i``-Css7>VPh-=oU,IMuF%L)5Uc@,]AqIu=0o$P*5D]A%;PSHG:EdHnu[b>V4SW0E/_XoAe"&,
g.#_LZp0DS9pgDr)jKWkejK3WlkhfQ+kTg`_0en&?V_RqI5BS?MG=$_[&'8Vj#X.gOChZa@<
Z7TJpOUV_m,qdTn(k_IWKZLH[\[[<_4-6ET&[LV>'%"6=q':V++&!_6u>5+<85ZkstWMgaHS
YE;9n1[3?;;oj,&BkHB0.c=hm_:tB<l393!DqBiLVkLbUBcfme]AT):F_qi^;=+$g(?mh.(8g
\VVp)uV\9&FZ!AhR!-dT1rTZd/pZbmEG>10I.O1d7HYj=BBT!+S3*+0dBXZ*/n8Fg@FZ5g^j
L:,^SKB`qf*A("R9[+`D^l/nrben3]AN#=WEMq*`.S9[I`qOH6A<q3t#tUrJAns7K9>J;[W9X
'I9pR*"MGBnWlQBY!Xp*14;&Ts6I^78cI?\j>JZ`.&XeVN/R80f@YA22Q<pJK-i&<k:?`rW6
luSE7`iOYbWtN!S@H_>/qQA=qee?ffj0`@NB8448Ej`S+So5Oum@XNeY(CMQ;\?'oCbh]Asp2
8L]A[!\6b%K[#aH,T.5AB1dL&T9\PtqB%iu!NmqVYN2Zm_r8R2/1>pOW8RmCi3k4=%*84cgd%
L!>RJJ)Em5gKQ_tX\8<gO0uj:0OrA+I\]A*'fbMDI@5/47Jo9KbY"pQ_Uqo>-LM'A_NUMfk>4
mVH9j'h,atUKD8QGh62Ta(M*P.0DiA!hQ@"h7Nd>g4tj+Jri.UmW'eA7#FKU)Dp\rgRIDS,e
cn&8nZg;-&N-S[h8anl\p4:^K.JX)bLH-"jBA'>[)6s?R/0%%bK[d3\9q@)cV]A4B[?08hL:0
`b_OF1JBSjlGd"2PpePtm&$@(Dhp6++hK"kKNA%DsF7,P5bc!$=(L"W:k>#X[de%_dLI<ql/
9S93e)ZW;Cs#8,WT`i#$=-MUq'lKmA\JGQ%e"0]AJ?2AMd9S0encit(`Q?Fsq-4[ohrnQgG4m
'2>V@2%JnclOX?(GT1:?%qJ@otd_L\XAJBTLPIdb2bR[`jhNq<P;,(B5N5+,+ga!7H-GBjn3
m,W7KnJ;)2WakYd)3Io?TU)/%A[9X!CS-4'fG/M*C_*YK;_r@''lX:oBP;i!Y$5t%]AE@$$:]A
hFHSA!CMtD>bj-r_;EhZ9L%h,S-b=Y@p4h6&MjJr4/3XDt&mE!N6Xa_"JO?rLa=#Af"mk$Y+
W*W>uod"5rmT(Jb101Kb7K\uGB>rlNRd;*NcsOeWjB*F>VB0X[oQ)TW`O;bG/ED4^N.OJf5&
XoYOZAf>>WJpH7+a8D>#:2RH$?J"0G&j19=<"r&T,ELG'*K4AD'4U7+fp2ej#Mf<H-7S?n>,
JGT,=cVIT)Q<:Vf<I8&i53!r&b6ol4O%a1+4%Bq3Ka]ARjpK^:m<<hZ0!MM7$R2=YHCXoqp[E
[D]A:^iAZjPEXT[cUY+PsH?Ja/$L:PI^HVX!HL95H3f2;C[jJ#X_SLD)M:f%;d`/l$hAX4ihE
9n[fqhlUN$;"Zt9j'Eg!$lu8$qn`ST"&9I^'\#5O("WM_16r*I*dj_/d9*P,^1=(J[kg@m<k
;U(;P:?94]Af=\/t7HR-Ift55PT[rWg75@A4TCIVBJ:LKt68AfBo%]Ag+m_X/4&7fZ$q<oYhU0
\W'j%V>!HOe>\qK2B2^.mN_i5\$egn0m-_d,VV__'>a]A:hnMAO?JS.+(/(C"`IgB.lMZb0<^
Ad<Z-c0PlHDN-V"aKPWYjmtlk7Wg893\o\N^dTF'=>YoA!\)Gg(Z+k0YMJN+LRZi,L]A)a0+<
l)3[G,d1?TW<M)a9qNYEK=u;(FR(BYV[,jZJjAZ)JK`Z5%X^XD95,i%E=?=FR/&MM;G5RAF_
f0`hM/+/Jh97g%j2:s+%n'#42ola:rXM<Y!A8]A:4Jb/G3Lu.AWbp>I/U_qtNS8l4mr+`HF'h
!&=q'5fb</ceFfnUN*Q]ARhd4"s?W95j=&@4U)$<*>o#[JPXohV:1+.Ye#5l)tZAP4?PL@O*`
-pB-O."sYuXid4/qc\.f<*S'KJ2:>No:3R.hq:\d-($Nh\%r8%rcJGm'[*"UkH`Jl\UX7hh_
\cCYdX3gCGVL6"8tO3Z@`-eS(OAj:CdeT@+q>KNmp6!e4\q5B)_*NBBE5RKn$djQr6Fkm:F#
n@1Q[)pZEt1n[;:/f%M_Rc=$-9&F`Kq\FHhj8'c\bIfK~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="498"/>
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
<![CDATA[1008000,1600200,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[分公司]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="2" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" rs="2" s="1">
<O>
<![CDATA[新装40及以上]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="2" s="1">
<O>
<![CDATA[新装129及以上]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" rs="2" s="2">
<O>
<![CDATA[升级宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" rs="2" s="0">
<O>
<![CDATA[129及以上拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" rs="2" s="2">
<O>
<![CDATA[新装239及以上]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" rs="2" s="0">
<O>
<![CDATA[千兆拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" rs="2" s="2">
<O>
<![CDATA[5G帮码新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" rs="2" s="2">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" rs="2" s="0">
<O>
<![CDATA[5G绑码新合约拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" rs="2" s="2">
<O>
<![CDATA[新装239及以上携号转网]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="0" rs="2" s="0">
<O>
<![CDATA[新装239及以上携号转网拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" rs="2" s="2">
<O>
<![CDATA[紧密融合加副卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="0" rs="2" s="2">
<O>
<![CDATA[宽带,新增-融合宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="0" rs="2" s="0">
<O>
<![CDATA[新装融合副卡拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" rs="2" s="0">
<O>
<![CDATA[5G三千兆升级包-20元]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="0" rs="2" s="0">
<O>
<![CDATA[5G三千兆升级包拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="0" cs="3" s="0">
<O>
<![CDATA[小赢家拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="0" cs="3" s="0">
<O>
<![CDATA[FTTR拦截]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="0" cs="3" s="0">
<O>
<![CDATA[新合约拦截]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="2">
<O>
<![CDATA[新装小赢家-增利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[新装宽带小赢家拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="2">
<O>
<![CDATA[存量小赢家-增利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[存量宽带小赢家拦截率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="2">
<O>
<![CDATA[新装FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[新装宽带FTTR拦截]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="2">
<O>
<![CDATA[升级FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="0">
<O>
<![CDATA[存量宽带FTTR拦截]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="2">
<O>
<![CDATA[新装新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[新装高价值新合约拦截]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="2">
<O>
<![CDATA[存量新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="0">
<O>
<![CDATA[存量宽带新合约拦截]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E3 / D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H3 / E3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J3 / K3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=M3 / H3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=R3 / f3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T3 / D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V3 / F3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=X3 / D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Z3 / F3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AB3 / E3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AD3 / F3]]></Attributes>
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
<Background name="NullBackground"/>
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
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<j7cP?53d)mE3n5TSUR6AR4+auED"ie:SL3`_Y/.^X=L<Inhc"j9UG&BN\]Ab#BjiV3S'BQ^
0+<'k.>t"@uLLO`F#I8dHS.#ioGc6:f2rnccCA4EIAk^X(qYHHp/PrhFhTqmN*hXCnZKIt%<
A6G2d('ak$BnGUP&?[EFdk)f\[lcR]AJ?2nr%o*#^+Yb1mU[9*B3<&lCZkCaga%3?^D$]AGPcD
3;@\qa:;flT21$J7?2;YPF_k)B!m=IX)I.1pUP(a2aS<cM'u9CHgL,r9Wa!hhC%5G\>&D@P7
SmpY:[>B@>LDD%8IkQpGdC8Tr\#ok9Q6k]A@q#IahN[%n#7aFOS`Q7gTD4i;/@GF^7QDl)N2U
G&lI.#&XK_N=CtkUiB">]A:((o>$"dTOAOh1=A3$p/o6%4gF7\iCps#l6/Z%A;>F"C?fSiJ]A/
h6c[eFG;kM\%-LR&%c!>Y=E$t0Zjff$I,FT+KU@]AmoB4Up8u,TE5+:ZX[BT0p+/*?A$t8$Gd
Z:PE9!@MMGH1ML'5;h>CjW<C,N5GgFQk_-XFE85Qb#!mN!'q^>I/6?,@h>T+U3dE,He^17`m
!M#"r,)P6Cp%Ke#WE4Y1oDIg6FbUKl]A'3P<8:I&b['(+r7ma'#TR#E_[/M8(mAV@g,[Z6@([
XDG.<cX[X6XU`i?2H*W3"@bpHY#!X+:J(0IZA!%X:qVGIWT;Ro-EQ'$^7>ontb`YmHIOJ:WN
%&LA$-@68$&@hC#V%f=kM)R7/mN)B!>PeZD*%HCl3BMhD"8!2A&H,)I>%#Y^fjGY8X7.#)qZ
(SV&RK7efK15DTFs^X0sp_U3b?"h9$Mh1go-a*i$=h!@)3:YTKp#eXa<W1h"4d#d<BZ^^A2c
Il'4;;Dj*FGFHlB&5IJ`YD$US=*&(A:RLK$/Z2P%$g]AomVg$W7"+h]AT1`o6F3P?G%5bSLW/m
f_YaZ:mEueTQj?NM^fSV9`K-@@h@[&/UOK'U)O&#:PD^XgmVh)@lFccu(FejI]A]AZG&P@eFra
=PIk!XJ=`5#DL5rj2QF.G\brS;#@uPO'GRe=,=##&r\_becdO,%M37]A5\#2s]ADb@K4EcE_pV
`$]AW(f"M9A0Ns5(7YdU[26VaJaFBKp]AWo%2'tHQLrtRpjQ7:MF6GWrAacU>"U[L(c(k:0@m]A
:q/WOgM+PQnXsE_huA51qI0D\_b"2JrTNiA[26;53C[;NC=j(!c1Vng*om9Fg9TURoW(AbZL
NWW1ofC&)-uZaD@bK\m$JNrG*rZ!<M_dtDErIs*SppA^m4E4i51n=A8Q7n#_A77M<nA\;ZbP
+7t8c<s#o6XG#BmZ`UR8.uPklBt;"-"20!hqG[=N+Qh]A2\W'9Ho(m3Q6ihP,s6$/>X6M/C]A_
H(S3Xm8EE\nB$)\p$M-*<b_qc"R3AhJl#ShA><O7]A`YFBajooBUm<J.o"TC%9Lb`A58f@m_+
o`lR&kX/3k).rcuL?GudSJ_+Ji3Ri:K?s8=U!r-6n,IP3f'`l4!o>]AKcIkht5SbJT$oN51$`
mqT4$:o__TK<"9d8_UC"'bl>YO>9Qr8<9Ms7*ID?ZNS2N(-keP3$>TBr=Mr"K&-PNi=W!ATj
QS"@3^fZHOr':=g-N*tNrM,pam]A0jG6e4.H0M+C?"bo`d]AW'-=MGA^=3`(.OV!_)s/@6ZU\@
l5dc,'=J5;o=:T1Dq958i"[[<+[bb79UXDbrf"XS?YjlkNUrHgL1eK6<%u:HX*AKL39I]AIh#
ZW;qU/>.#Ct;YUmh_Kb!!bSs4)g5O7%qVU#nlPGp:AZBU_Xk[VS(Rorl.YFO7"@)eA0i*p;7
,"Sg(-kii41SY1QWQs#1Kpq-#Z?WP\3LShr=Wq5iZ-7K-rTgn0@d]Ao2L-G"CZ\=TF@=S-1-@
67Y_23$Te)N+%%Mq4.-"%4WU+.*?K0?<%(`VD-oft>tACf7>6$d"1pq@?c>)$m(mp,9GcN%u
G]A#kV:,ig#<r]Ajpfq;r[?BS45F4\HA;+WPR?=U95rrF8W`!#UDsU*gZPF#XtNA*aoj=@Uj#F
K,$Hb650*P1tpW#EK<+heUIYkF^LN5jIQmESu*cF=&GK#U@GXZ>#/EaJ1N!I$D@&[#B2#>*k
8!lXUtCiL!s+AlbYDHqTod;]A0]AoI,]A1bhooO7ZZ0M)f6Cd8!bDLfG&1uLPNpLm8Jmj@j^pO8
347gI?;3&(C!\>W6K=cQlG*##/Yh$(FKbCB(K!sQS*dPl'9*Pm5]A?[G,e/0+&JaOVT;j^^fm
Z=^qFbCg7R!H<p`$V1Al>9:HBH<UV/@ueA9gdsEhCgPRN&TmiX="=o-XH^cDHKKRPd#$aKZQ
h/DNQ$7`"Mu&A_(`AsLA(cX[@*6Y=6?kYp(^0:P&b(`e%%ZZH'!.UaNsF>KW!j(uW6ID]AVTb
qT<7ZEID+dHR)t6n2_-+F;&X^GuNMY6#G"Y+T1I4!m;NpDq6NA>a5j@lSt!8nfPRg;BQd]Ad8
uo<c0V0[W6V;6b>LL2rn7MJV#o:P"*UV^OK+G-IjoAq5KU7Nq':@5%N>!j,_Bb?ra9o>W-_.
\.KS\@%F0b+mPS.&A@I7/*suS:=8I"S]ADh#0;M)+g@(u/jHl,4dIs#le!La;RGr["ls\)RFn
sDpNO`a&>0Q_nrCI:]Ag&ond?[u@5TQ[\i]AN@AnLJF8dWT6oaUcLDFF@LKFA-qgC>:[S),(/u
2?Bpq-m4/!3`=S*d#F7D&H]AZ(;r6hP%HeT2qMPAZr95r0T)%=n8[2Dq54#+b![ric[\7S"$f
@72p:Y]A[sEdIS#CMM*<CP,2iNgc2F^ak$r&CpkL$H'JsHut#!AYIE>NG*-$FUgTZ/JL`)(fr
5#f(C&Ag_RZ3MX"2T=W:`F23dT1H,.jYq/N+9\V%h'I`cOtTY2c`YNkeiD^uI1h12"+6W.XV
`_?G6\,\&3O1!#o]AP9ka[@(jJjdf/e9LW)0erG[OS6X!fa$a9(@o%L+m&[,3XOAZ^j]A>b1X;
>FmPFC#pin0`MdL;GtGe[)j9&m=H<iBp/Ip@>"efcAshARQgLN6#(;$WW.ni=u(<%X3@hC%)
(e3'h>ZZCm1%Ar']ANphB#9F7%Yd.X29P0@qhm@GbQ.m*YT/<FeLB;t#U`GdIS7S]AeP+1.mZ]A
]AZTZ$35A\?8C6d'hTnJX&92)6")$5)-O5))8bZ@OJVcM2d)o=5Q.#0$7Q]AmQkj2NM2:gbWh!
4fl66!piVG\X=\)9S%OgiaKqhU14k\%dj-"\YTWq/cQ'&gca!&8Y96a"4k(*PniOg_iqZ]A%%
WD-+,lgoi8-nNCNYju8>3cYohrpoe$#sD9sCX%LVQj[?%o.8pfVfUj!7X<,Ec(aGQr4T=_jY
[(u1&r9kVR$QSN9HIa)IMK?W!u!(!fNR;0cs(*a%r:YdcicLM@%L'/`3ee;Ag-]Akh0q0&0\C
`*-!NV1Vketac;G(G56e;>1RJ[+H_90f4*B_>cNqAP(@5=\-4M%#@,te&i\!p`q9Ed[[@S6-
e)hh]AP`0AhRAs&ee0Dq>o^N$^(0![CA1I3X0gsBd`S,/\puhD<N:strrAY.HrfD0"r14/D_]A
^/_uWAml:O8LQ,0U4r$c`:*&$@jd-!#OF384%<E`'C7Yaa;>Ue8scoo)bo[VQqD=?MVLtSP]A
J!ZRlF!0oVk;ah=-2J$R3Qn;NA$'9d<FoOTR*-,*Ch,Oc3iUaP$H(,ig6Vn6DJf/<*=*5OL4
%j@3,nWjIAgHKBOl(.S)8e75Idb$0R^U@-T1TfX_GVqAG4SpkTOADF$3#H]A,a]Aij,DT'C!`U
mWQ?P>Ur>6hD=6+uVLh\+>@!Jo27tnp.>p4>d`1@:-4X6@HMFI.(O,YmGK\9on9EhDatV^"@
&c^.%\*G&$/<ZVPq/=i+XnRos7.5MT.XB"hEHU*#O=pVFuFhr936@b;(j:`(/t,u1"#_W1Lb
U)m)u_1\lS<alpC>8nK,\EL&UeNN]A0.542\MiI-6k@em11S0R6d^/[Aj8:7o2e-W8)joF4pg
nhoF=rCc.3Hd?<89\cL;S&X3>HQ59&iUO]A%kN^!_0=k7L\<."Q=6-)9iL&N9iR/f_TKVD1f=
G9*dd:#]AX"%JJ+.H;[Ns5^?nYb%T)TfUbr<D*p*5Ush8Q7">lCnCqC6@t>`cG3WY1FnT3W,(
Z@k5Q3Yd$c`_sO[0GLipr1uhm@ag8:R8B@VR?_g#V,SH*2knF?m3>aU`8#T+ti^GctpJm)lM
`:foV:Y$VdR8O^*%ol!%*1rkr2_ciYLU+XX.Jo8j14B7p>%SDpSR[W<Ra7u/7$K/iUMbiU+k
Eaf0?JsD,AUqq3d=%@B#a:<?9aEh;"&6>XckYM:0G1BDC20T]AFh^?;BqJ8_%_p@"76r^W#2`
h0S9j$08"Sp_"sQRR3`Tae/Q`'a,1D40ir+G+QaIc)0'/0pF"]AI@1a@9Sg`j0#dJ60-=Hd8$
3[*8^"cNXD.je]A@n0^11CRm23Jr%a#f'Zr\,)72?A46@40tQIi#.?F%T39i7kro>lgI7Qo::
W:TuTKI?U\33A+n!kiq.$^Cd@PJi%qZWblVFhT2E&'lCAhPXF2;a!Y(%8lnDNGZ,Q+'kLgG`
hIA^.EpS)q26$-$S+NBr\N.b5KO*phY>?6]A5,O%6$06fb1O2RH^g$RW76KfFqUHLYk\<lH^D
iP`QLrcd<E?a.QD6YAf_/*AEtWL:_dnrf4q0Q!3Q<"5UA3!rQ44[qtg63dR#;NoH\]AV$>02q
,ge:.q%9`M4Cpr.;KOq(1,ZQ4b1h@;\SKUa\<M`0NeF:`RNl(Dke$R%mDY>f^R*D_1]ABC^M>
<g]A$Wi?V='W7s1$]AV#ohc*.Wq>?7PZ'^iX!IKm-AHFRZ/2nDJhhkMdEXk@&q"pc'9)<X$n52
Aa9nL6+sm9(^]A7U?<!=L;(*t&DPEL5J\E[%r^+5oDH,_?7UM.[<1'NIDN9s?G.^Bqg4CMBZi
p)aj]Ai;in4AUU2Vj@mt&%r('s/%9bVTY3,lV?mW'Oul3/O]A;&Y2/IN35X1fejG545C-OWCbn
uS'8I25idi-$*f9I;,(6tGpG]Ao:)8FF*MCgf_k/0Zla"uZR\ADiBEb]A?3hrNariBn6d`*>_P
&^MTR05u=AMOEa&Q?+TfnMRr=K4;fW(W+.o\CISd9A!:W3!&h]A?HOY?05tg2g.-c59p0*kl]A
8:VQP[Dl'qXKN/dh?"5+<juFa]Ap1OW/kQALId1:]A?A!r/"=VG8gou$rV#Vm9LabFL:Xnl[&4
6<,TLJ5SsjIS]ADYN6j=lg!j^Ebb-t'$]A_rDNlMcgkC6fE%f3\L(g:$%Bct]As=XjZmufnCF/"
l'Foh\01_Uu,(0R_M]AEAd`+OTQ94D]A(7ECRm[u/C3T4sk"()_&9$-0=-r::kVqA!4\Fj<=W4
=4Z>8LsqR:KS7VBW9P*qSF**2A45uq.h!AT58a<uimZ``R%X$SbgN"A`CTZr@Q`8mA%+P\Ka
CZFDl8sQfPZMP2ph^MF:bV2.`X2m9S*WK_)JV&a_`^3S;GQ;'?aX+pBJRkT!R>A2RSN8%5cL
5^5/"@qLc.S4hf/cp5=Spc`$Kr$YE6Jpu$C-Ps@E9!4cb+:0@R)bl)<"mF*Rs9cj7lR^ZM4T
LrqJ?^_EILgR;,TgP$&sLfN1X4-KVkF"[`,t?7cI>)tc7H.H2$eJT"V<?8`BLJ6NL_fm9I<O
lr1(<E:<g/uU&h<M3/5dX%:0Aj[j6/H1<]A;d@ECL)uM':L9r$'$"b9<.hnk@o$0-YjY=;hF3
`q]Ad.jC[:9;6?YT<ZU:%+u=RijRFK5:nhlakr52QS(bjo[2=3r)ddia\\j>%4t$aZcT2'#D:
H#U!?B&,GSac@Er`N*(YTr]AS1qh=i3nX.bI@VSTd3MT;r>a@AJ0uO=PliZRf]AXlj<Do:(f32
]A/qZjU<!:/eY16R_++dT0o3j><'$4"O)_p]Ar#B?8nCA>.L(>kretIGCPE3\KYj*/C2;DJjhh
[ZJc8jQZonilI3ap^[+TW<W@d(;'<[ui"J_pVKZ-"DO,5S@55Uin"_3bEBrR\5I?ElVRdo*D
DmZ7G;N8nS"\:DhV2Tfo96t4&N\f'CN:,.5t/k14sto5Al,S\K8]All=<3d=\iK&TaX5*peEQ
YqhR,Pn-i#L&K9'k^h$=9)c0OF=lnA&VM)_H-h9k8eQr())T#2`&o8P*GFAu^EVgY"_Id8>\
=&[L//f]AG21,0]AUH'cockSAuLU?mZB4-$f`<E#$@j37hnqBcEEg6H%3kEr0CL\6'HS0cRN-.
N-`4_&2L:+2(a6N6]A,k-)544)GV]A-S[kCr9Lt_,q@A>XRP`H@4BrP44.k%$s9i\QZU04K_o2
QmeX;MANX9+"dsut/mWA?-=/DXjjN.(LKCrj9l6r#<gK3<.`i\Y/=S8'$WiAB1K"EQ>*V.s%
GC@gfLpVgks1ojcS>@RWbmt=EsOdb@,/c"I[O-49#Ei>bM5.ac+EhI&9:*ciX@'/TF`lo$df
nugD(R&,4.B>(.UO9.m:MUZ*CdoJ#RqbHgj6![+(rZ(hPK?TgPGl2"st(71e19f)j>R5Q%&u
ETNXGZ^A?bN43\10Ad-"XC6:G%69Smb3<#+ZP[]AVY0QgO#F1@P`oT42*krm*9%W/VjD.&$oW
l,T>Uql@^V?3Qjd!"*ZbBI]ApI=J*LlSYbR%nB\0/k^@24]AO.'^*>A!8NBi(/fAgDU4J)EaY]A
"-/1=l=t6QcoM)&#[.5<m;?TD-'ajGYb]A>5S99I;LUUENLL"3JFRKYd_;,E<ITXPi3Y5Vm2n
(4bn1O+)>ZHT[+rf&tQ'G3_.NsZAlT5Z=mYk+EP?F^qbD1U)p<mctI[2(jPfimtK=%AI>3Jp
ru\1QRf8lmDY3F127BDn]A<J,.9E&F1H%FmrD$q"0nH$#u&E)([ZT^2QR2#**h)9/.W]AK:J=g
Uac#CGi6M2[!/q*hkjbg:Sd?`.&ukQcZ\m4.`"SAU$@QPo<)1?RiePdYCXQ6l.,opCb@c,(4
X"LkA9RT`i]Aci,?3V-2%UMhNFYeta<kmJWZ\\ZV"sm=)WmHQ7V-?!$)W-U.m686+.CQ+:MK-
Gq<DJ_`R(S,LJr0R_m6LhE&Aa[$6bI`1X*DUoek7cZb41DnL@GMjXQDOS<'?c8B4m<h^uZWa
/b\TR'X3Yo]AREA8Xt%hpYap)YB3"YJ`&e"56!qOD0kTU/Q1ss-bS9]AQ]AqB=6]A46HXQ*q2Z@n
j3DRt#`^+3#Xmd:sU'$X")c?nG%&gYa=np#(O_XoC-gUcCJd-J5Mn:j;\?L[H5'Iu_N1`R\Y
Lr_?!?qsmq;D6D8P*TPs\0APtK"hV.\_SPJEk_1KDD$`u:6+Z+3i8^^q@OHN2Hti!\K:/bkH
jtJ5?^pH,)'k^-@>F00(3ODPdN@+5]AWrmHiaaQTR:/3kt__I3='+,HEX,8"76KE<<Mmh>k=6
TbJLfpU0IiVlWjZPX?9ucChsV3du\.#_BgRo8W+c)Io7;W^E1:qjB-8!Q6B<rIWrqtfSWI?X
J*<?&W9.scqYKV/?pp&VH'k4$LnI>>1:AX6O'Ie#W@#+l!e"8I]App50i9(b#(gqrDsfUd>NC
3=?sa]A\W*F'hgo8QrZJ:pQF/4:HV1Ub3o4gU-dJ)I&>J?gS*0VK:/+]A;s\q@9!+f;TAl=.f"
h%aM]AVcs1eE%0t9^;rW:T\<.<DeAHncL!7XWD)ZMnY@Y<_I[SE[k7,+KVJCs_:ZP_ckNNsk!
20cXU34cP6%aVc#i/,.,kX17/Mpg^WstldPpksN0l[4U4$=%D&G>F&-Y;*+hhW;^N:f."_0R
rr<3cn61XCKJN6*Nd/"&+kW<<BG`cK)ZpBj</\lW.PPmChWS:#=X2Xgj(D;Sh&XXSG#su`+V
IV1k+QRs*[B-1D?94@]Aau#n(#4.Y7a\V7-]As*".%Ts3)]AN/T"7=HmMhXPDIed08p:JY%-S8c
\f/A0n6:'f=dXk>Ws&lSOQ<30.^2@GKA69@#M;,t6[rZ[]AK6F<$fqSk02/:LG#b"--HP-%8M
M[uR,2,sci8I`n1N-OcaD'bV)<(kggO,^PE^>]AjVP#DQV<V0?Qr@(0l9Su4X"+SAe;p8:n7Z
/EV%\tVXpN=O&D"lU6M`2)8pFOVler/j!%cA2Y-$u8o"blWO[LMNqY"Ge/*o?fAZ/(JA5D+d
]AY0oVGg/V!a.)I89f;@g?8$ULm>t(cEAO%m_^(D#AOVY*;`TIa]A$cjt]A#Dq_Y";J8"R)!,d-
iX$\".IM4pMFq?Z-^"o"<`3mmB_,Q#+<&25H<hBYof?^7@qZk]A<adO`<8KtHWP>6XTi'KI$_
AYdRR]A%d=3tY0N\X'9*M(D/ZZa[SQ)B;GO`BdAq1QHH6eZFj\&-`[Y$M&*LO_F[pbZt@:VGN
%=e8t#:%8qbMb5ak&LFZ>qK7pQUhuD?>aKK8&(Cm+@]A-q"U=X#rqf0\?:!$t\4"EZ)/SJb0#
>N$KqD=pkm?$H#E`st;340dqeI&i>2Kc6Q-,&)82'=V1JoS[.Z_!FRG'%.I`h0WLku;d\"C7
f"fo"I:CNsY"!r`u>o`aD\1*]AO`AYIM",5f+a0mhq$4rUP'jK,BG>%FO0ha"n4]Aoie&W4Fn-
W<MBPe.Drf/$]AG1n,j,LWn(NiiD\a8m'GI$sDQMC`!.X6*Qq5['ZOsZ<f?.'4F^76e$d$3\P
!-i94KQE.VR+Z\n%WMQa]A61WNK4hNmF,FZq%"l]A:kWk;b%jB5D03hAV=0_gpP+]A(.DoY*I@G
8jg\?Q36j416`@<djH-NhH%83(5eV&r`<o0(JDUW)WrED?f7p#6KuQZER`TT#5"rRc'sBC`[
forFOfTk5NmAQ8524<0MKQn>VC,6R@X[lg[1N>F;!s:%ZM:EP(qt7!P_/[0N3iLpMUj9.02r
;b5mb)QpB<9Wh'eWfZfI^S56N;=<Lill0)r'FtpOH;!rhtMDYgt9?E5_/3ITC47o.p+j@cb1
0b,=%oL(4F/ihTbMda5%@R=CPmUNpJX8fm`uU*4CU+0W=QR\U9%GM3qUUnu61sjaFdL`kb(7
U3']A\G1iV1WQ9YQ2rBF5,(&u@YMa$Qe"en<pOic`=h4f_:VrGGrt<Q,ni$ebh9A7Mi3A3sD>
@=;^,^/8XZet`!s9rkuAi"K2Sb!o\4k`-SBeH%OfOG^VA<<oWAI>p*HHbF4<-V;^.qp)-TXV
X"oZoo^=@NhCgBEN<r>[0biY--_OrFC`"(dI'N.-EOc7jb_%c($h2b?"&8B(Kd,mj3Vu!\9%
9kC&lF\1&N/ReFrdJJ$#:QTLD?rg&-[T2qKm@,BVqc2P4;5?-CQJ(=7\%/_Lu[MOGfU[Eh^f
eOW'JGt+r1.4CBCkJ'.79f=7GauZ`f[s\OH$6:d8l6[A%m1\2PEjYb?*1/!`aIqKNsR7VL!9
hj!CABY2G0eL]AL4#OLP+-6?mCR*N>)1:K^HdVPWoZtGTrQ9c`seK@&5KK1sNY$YEGI`=_bIr
mQ*klZB_E1f1`*3?0]A2.gM#d\%h8Pt19q8t9s,3)gq=M3&*4lpK9ME)IE'H&752`W%QXu+K[
o_Dc3S.CZBt?E>Mo/u9)$!19fYXD\*q')VKggLcB#M[Y3KIV12rUDCTkJ(&6(K!^-T5BYdcZ
[85S'+&lMa#8uu2dPWiC/5\_]Ah$+oON0Z,8qa-nT,l;Ifs-*pZbpDPSKoaFc9PD>-TO"Q>\<
^eeHLPA6Wb\1E/7_E<J+5+dA($q(!*i,PN'/njo<(')f_N';H=o?1t!P<7`fMK.;Z#!^NK.9
U'oe'V=)gs2@*buKTk@3$[At3b4GP/*Q""T(E-foJ*.A=PBE?]ACS,8B5]ATT6_KA)7WRfu<BX
0AeE^QecMH\B,.!3<C.>=Y5><<2E<If.UcQB+;@KCtY\$71Knu,rM%HB!('(9tkDc28n4UBf
bE3HOKfX`H1=J>A"B.4+KG#Np_AYk3O;ql6No*N:F#^f>=t1(:GHSE8("S@W.f/ea50modHr
_^`s90#jb56N+O=U:(Y0+T@afj*?9&ZrZ7D]A3g\Jp1k@M)651*_ea33*_GEG*B&kb;q6/]AIC
=;uM@E,<%o)`l4ZCs-E1h4B\S/GK#9!ao%^3_IXE\"J#p')l]Aq%!:n?J_=p3T=:tcU:ejfPP
b^7-iQ0Y<c+/$k;3q9PkM7Z,-0@dk*<ReQ:r!SMHfs%LM;C'Lj>"@\)H<F,OQNEl8.Pkq^:]A
Jg6q.?qHlcjNld6b),0!KZ'"9mjX)-8hK2nSeg9;e_BJk[P`6g`"entq1plrYA-j#>K\n0j#
h&SoPW&BQLKnc(tGa6(+F^;=B_OFSZ*m;D27F(AWcZe#uk*gPeN)JcRHRW+tV7"6Hcs/B';<
8+qX[]A&P\qhZJ?i7,Zs<n'lhKV8[C7MmTo[8Z[Dr/:H;qT.E@Y_7#.39>US0aJ2q!$[;R\9(
+E6<HhQU_Lt;]A1Et6%;@_JU/R->c:N5G3$dS46ub?EEs8'Sr#UQWa&h^IC>c/(ZZ'40.&*>S
(JWlo>!4O)TBo.b6rU"Ia2;"b@s*H(;9PcJ_2>kBoFqq>V^D;.i4oR<dR.\g[s'%0T,XX=!(
$&t$X1taeHH;F+NTIBTl#F?ZEcpt3T_ui`l8!unL4J<huns*/?=eq"p64/B3OS*)A/,ROdmr
p4n3aDGAS#g@?c_mOk>(rtNrGpkP0#o<K0P3o?P>Dr"L&U=7$G\>Y#M/"D6;96=4s8H6fRm"
IQ$QRVG!1<V1S<c2OWhW$SfqhaFaWdX]Al?".TLO1hNrdra_%GktR%A.336pmBQ^D;e6WG>oF
X%(1-SBMo<Y<\Kl&15]ASq=ta1I'NUD]A3A*[E[X_0JC:1$_C;YlII^uO6u(9c)Cd2]A,fJS%q=
-$'_"cZ0+$gKP,S2T(Am'-<4Eu=1.T2mVQrQMP's(p2N4H3$j*17YA]A75>`2"/*SBgZ0\qK"
Is>6g/Oqe`h\cB$/<nWuHahN828);s6rp;H9=B_7L]AZJ!Z^"G5:I!aV2['<N,b)$\'s.pgK=
)t4LttqWFlb:#WGeE>^BfF$79D/A7BBW#MiZ2a7/FAYc.]A%`WOAYcmVY`6S0%lX<i,rL!hTP
6:.?c+p>3Ze@I7*K0$JM'@F/G6I)[_uQm"]AOo^C$+oG3F66g]A66YVIT7rM1uYTe'GSQLgWsP
0Fs%<8[8(ArU3d_G%Y&2OZQf#f_6;S&4Kh'=:C(D%t3n]ARJt',F1V!./<(LnB$th7kJMkA`i
krdP5fj1=\5\Wor&Cc?<$M__j8uWClLDb:[#bHkh>M>5-><_2I+%(hi/LMjq@$g\I0&odB@<
D/+M"59=n<9=g9:3/"$",cVQPN+LNTT\bT:iU:1UoRh;N&EU2R`f-c;<(4CX=Xmu[-HrW)lY
^q>IoKXa4;fM-8M@b?16eR]AY7YjMRHrbe`h,)QN"Y:*"M]A<48EZeMV5qY?#rZQ8\Ep2=*nUY
de0LZ7Y&n!%R_6@ZM,sLrNofU*=;AoTfY:a7=\*r8.0L:nkRl_O9m@!ZmEV#QOIJ6(*tc".d
="1.49N[8m*a@\6cd(MZobH.-O*bV<7SnT0jIUYRYXGH/]ANR+^9:VCs)E]A!Q\[9mMQ[/U#ej
3A:J=;tr(l3_0*NT6dOf7(/(ZYl<Ki'*Hh<H&pDFs^T:+(8`@u!Wl]A:\UBdJ-tn%"J-i]A^qR
c'?+X4o\>n+MNWVrK`4qX(mpn&(Q-e9"LA6^(+TD_tI[>kP$2cmi;Wiiqr20o>DbCH$CLhpC
jEGCVUtd"!J4hLGTbFkBA-]Af%]ARa&"Wh)k/TnI[l[;QhUUAH]A:Z&O&?$KbeJA5OTpB8?W63$
QMnird^EFTLAR8A&1D0$(dHc<fFlmWA[3Wsd/m#]A8@5KJIs2e6CF-t=VD(L^+nXUXt>'a*/@
9&o6RB<tM->uS[abfoX48=/h4hM\2cr5qADMJQG3[L<M%K,1"M8lBdHZ*WlSiXCYk<FV;m+]A
&9NAHn2;DPhlaQts`;`>i5?LMK0O,JJq#+Y0uHu"0Ns.K%WoU%_kI$f-NM17_+Inr.N_'dOc
hd<-@[FJncb^]A"Wp@g$VrV\P9BKc=Pe*Ed>6bbJ9>]A$f*!>5E8(r+RQ>oP2TSVPFTq[r6Cba
lefiGK\D`'\lc>Y`X!%<'CmZ*sG]ADKsl+lad!>"2?h8"+WPcp7HmB\TrICpYYuZAOh$B9ACO
B)u+9ZbG;Ht=gLX(o;f()7HiFr;'htiA+OWgr_btC*&0Z1OR926.1n]Auho4'C5^/;\hU$W'c
XdaO7^oNS)r9hd4=hJ,JI!LV%:d,cV&B]Ag(V%FlD`f-\P5d;VrMn+,C:c^RWKm#!."QSd5=C
B3bs@H2gg@AVm":?$^i-i52?t0A*R.7iH91"1Ikj@cW+H%)T:5DnZf^"8ip&\#U:*k*c3)%k
Q[&.Y]AO^L'.^qUACGmq#5@M@J`.7%6hX]AtL*b.l,<P$ukft@*9k90^@>58AckHWnf@/S\N1l
C$ZK7Tu!1>Uu#B.\Bh5Y,nXA!3`Q.$1cM0Bn?R'[.RNiuNm(Ul?FKLIXZ"M!^]AB%EW4"PXY`
cZf#`[)OIIJ.l<Rj`nQ^9!4JgSEY!Yp7qjoK5r(RAoedcJjr3\LkbB\DG^V6Y^k>JW'P/Aq5
Y`$<GBbD#[D5W"j(pAtn/B8YAbSP3R*dtbo]A+d+s1n9EUR1G^l9=!6Y5in9c>B`>XO&Q&4aZ
G@Ne[#=k4G`2\rWH`msbf935+2!HP='pU$4'$r0[SmgRT3'qsD=H::"6r=`hiND#KX)FOe+f
ohQe$@uA&f!'I]AQFE>qk12tO&.Cp;e%=]Ak>78*7]AV:k0;pUTYN-4iu?oQt$Dd$nIg8"=5IDI
n-cXR?H54si$9or]Anr1&LFJfKEgV?*!hqhi-25GP.eZlMJX;]AZ3_o]A.f<`W+!*iOmGZA-=`?
]ATUmFFj"=EsVQ;HaU5nXXpFuIR'Qu-Tbk7UKh&\6hN+K4U;gWT%GFjuV]AFQ2ENRRPmcUk;8l
':,UZkMj36PM'kgd!V'G`7d$5Y?\]Ab&cr3gl%9U#u&5>heJ5K&q).hlM8\t6Bd"Mg#VBkZ=>
@q9:s#kIhY"X$[p8Xo<1Dce5MPKA+'-j;<?,C/<I>/mbUn-)2e]AS\a0c9k"BT_0(p3siCV#X
0i\Y&!;Yi-oB(CiOVJqE?YF+`$&!Bcdoo8=a6Ng=iH5fq]A7h)hkXus?EWEYf;sd*$T-%]Af5M
Z[>WrDre]AfhbuNna>j]AQmbo>=P4:>bo[C<u6uk`(lNa:i?C(0HMl+m4J2OX7&PZmu_[V6gK]A
jH]AQ$@d5t$fh7>(OoY_5qJpH-/*lFame\2Ad:*<JjOH[B>9M_%X,9]A0\[NQ\?a$l&-Vte?jo
GIH5\'Yh\jO'#EO7&F\UFUcsmmUO:]Ajc:L8TX3cFH;d8'S%A*(-L["]AQieu`QH5=n\"tE><'
^mFLO(8kk-!YO*[U[Pm_?1VY0QOI&jAe]A*YeY1Jd:pO#=>rq+'+-noo?\ca[;-#3,2ZJu:[I
L=EO0n>IXXhUNLaO<otBnoJf^q#f2nO-cALa+jJ`]AQABl0-,'6rR>8r$RK9;hMP[6*RU@UgK
995?U9V9!6^I.*3S!3kUF?Y"+%%[H5srb"!GuiRFuW&ME'*`[h4:>G?F>;L&]An(.'&,B2q/o
=W%.T^aJU#&cPb1=5Vt(a>j#6LkcpS+^B"86W0j0)*$,'XpZdgnro!h1XS;_d+m!t6MC@pP?
L7@7T'/ZS%LsQ=DdXaaT$1QQ[$(DgU>>A%UDbAf^pdM;.GL,8HP-qF]ANnFQl8D'a%625Sj':
9H>@j4UnkN7'IECbP[oFt%T-8>NHJDnK_%Jcr;5M>YQUOB'8-aSS)G5H<]A=t4)(%RaX9TQeK
cUF1!;bWN$c?S?'h3DK8IRWF&W@JbXDX^c)Sf``"V0XW-J/?L$-:%9Z]A.X/+mTuSo"qYsfV,
co@>gV9a0mcM>pf?j+g?LfO=FVn`TA8-_`qH@ag.r<<DtA@)[Q<BOoGD&W]A'W@SJ\L.Od)TT
/+K\3/Ye3G$oDEiLN\Vu@:8^Cko(T%_+9+C8LNI?@=m,I[+91*dR'EuRi.-Agh?Wf-DS2V<@
Ro,^T07(8aWk?&]A]AJm0%HkFjgn7`"-jHot"QD[qoc5td.[#X@A`bSW,B(,t5sEMj]A%>a\Ce-
V`Q]AH3C0c(Z6EjqgLAg<$$L"0sE`;O$F5rXiTrFITFX-NaF;86q8o@?GTbO+9``LV-]A0a>Vo
dAA"@a<Skb,-u-qLQ_meMu"?,&q>V+5l\>>Vtbe?nb-\tCuMnt\P'#bh<hs$T^kDT-'Xp'lF
'dh&Z3f#Ln&eH?*@ip,i:l]Ak%;,-J#Ii:"_VM^i!Hg9WF#:JIfd[2!QQ\%j*O5M"a:W"'Mli
X/\9%\T5+A#/-rA2`hfqAH5M>lnPh)_?64WN]A3BY<F.Pg^7e)EW0gm[:VF>Rp\Q`4I:Gqh]AH
YFI6WEY6sT4du:dtEe8BL+Ws)#1E,WH[6Hn?Y_'4C6eJOZ,I!\*NVIjp$Z^#(]A00h#L/&E7[
%KI3^_\d,?h=]A;lnC5`MAtV&/cQ7jFpVRZcNN[h?Cthk9S^Z/$.7.#59=>^30Y?:#)4D&nAP
YBYS-K@+#d_\Kd(Me"D8AYja(p1#EmNn3.8ddp:T5NB!tL\e1Xe0ErjN!5kjD0pmp`A8G$`W
fq/%_P*O3TJ^.mI$3U3f(Fe-PC^U6bd&a1_r$i::f_8aY!Cd*i?djN5*#d']A<l0@43eGb\7S
B=D!@4'8buXeZ;XZ_K#?P*/_9EWL,,_6B[C^,\*o6/V`76&P/R3ifkT?%Mmf_'uH[*qD'>=@
qO-V/T4C+idV,3[cQ2dms?0&[/"odYt^eOM,.DNC#Ou@@LkTiP)qK*&Lc>G_[O#7[;d9C@QZ
-F85sa=H@e`VH18uka$P7(!n#Kh`B\O5"G]A:)4JjS(%s4$+SKR,&6Cs4i"iZs&<sRMM`GScF
'Z/gJ@NkS2DW-I[TYH]AQ(J"@@M:ZRR<OBqZ)A[dTGg:roIb[D&$a"6u:B\c'#<r6qf]AtK@I@
d=.#4dE!7Q'%BnQ2M@K)SpV1?/rmdkK@.b6d,u823C,o5<TlIiQK^(?pnPKX+se*O,f0bKGG
/&1]A$B,YY><dqF6ADilF4J'=dL)AtgbP15D-r_/0'hPL6U8p`rqFV00MP)5=c4I5:G_BW>`H
H,<V'I6(4d(l6L*ahH'c/\m@U"c>f6j]A[fS_WW,TsROS`AWY/cu4>X+"QYK_X]AZ!Q8DVmcXR
eUXt.)!2X:KaaF=Ze/f]A;qZfW2_/K>aVS@CB4fiAR9nX_R,-nR361nX#g[2o#W>I.p)W@%W,
Mq`u^X$Pft+5I,rn(.ki\s':o;VZ-FBq*-XE'/.rYlJ1i4=;hol#"s-:C7'r#+5J03R*.*jA
SU13A\:7f`*3Yq5n9WFSg-G)E(MVePf_)e?CIY`A)"tK]AE)nl\DEG=$NM7-NQB]A"70@aWSZP
SF"R`>F\[rId;Z]AW'%'?)lXrTG1N")uJh)WGGUl0LGnCGdO3tE'md6PN.UY:6"H*5uCrkLjL
DLq;GZtTdIXg%6n65d_p3lF[!!~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="498"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report2"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="951" height="498"/>
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
<![CDATA[1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2736000,2743200,4800600,2736000,2736000,2736000,0,2736000,2736000,2736000,2736000,0,2736000,2736000,2736000,2736000,0,2736000,2736000,2736000,2736000,0,2736000,2736000,2736000,2736000,0,2736000,2743200,0,0,2743200,2743200,0,0,0,2736000,2743200,2743200,2743200,0,2736000,2743200,2743200,2743200,0,2736000,2743200,2743200,2743200,0,2736000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" cs="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" cs="5" s="0">
<O>
<![CDATA[5G绑码新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" cs="5" s="0">
<O>
<![CDATA[宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="0" cs="5" s="0">
<O>
<![CDATA[天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="0" cs="5" s="0">
<O>
<![CDATA[高活号卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="0" cs="5" s="0">
<O>
<![CDATA[三千兆]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="0" cs="9" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="0" cs="5" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="0" cs="5" s="0">
<O>
<![CDATA[云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="0" cs="5" s="0">
<O>
<![CDATA[小赢家新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[单位类型]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="2">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="2">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="2">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="0">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="2">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="0">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="2">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="0">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="1" s="0">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="1" s="0">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="1" s="0">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="1" s="0">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="49" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="1" s="0">
<O>
<![CDATA[上月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="1" s="0">
<O>
<![CDATA[上月环比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" rs="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" rs="2" s="3">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="单位类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="5G绑码"/>
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
<C c="4" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="5G绑码新合约"/>
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
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E3 / D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="6">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="5G绑码新合约"/>
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
<C c="7" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(E3 - G3) / G3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="D3"/>
</C>
<C c="9" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="E3"/>
</C>
<C c="10" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J3 / I3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="6">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="G3"/>
</C>
<C c="12" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J3 - L3) / L3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="D3"/>
</C>
<C c="14" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="E3"/>
</C>
<C c="15" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=O3 / N3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="G3"/>
</C>
<C c="17" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(O3 - Q3) / Q3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="高活号卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="D3"/>
</C>
<C c="19" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="E3"/>
</C>
<C c="20" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T3 / S3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="2" s="6">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="G3"/>
</C>
<C c="22" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T3 - V3) / V3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="三千兆"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="D3"/>
</C>
<C c="24" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="E3"/>
</C>
<C c="25" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y3 / X3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="G3"/>
</C>
<C c="27" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T3 - AA3) / AA3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="D3"/>
</C>
<C c="29" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="E3"/>
</C>
<C c="30" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="E3"/>
</C>
<C c="31" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AD3 + AE3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF3 / AC3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="G3"/>
</C>
<C c="34" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="G3"/>
</C>
<C c="35" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AH3 + AI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AF3 - AJ3) / AJ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="D3"/>
</C>
<C c="38" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="E3"/>
</C>
<C c="39" r="2" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AM3 / AL3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="2" s="8">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" left="G3"/>
</C>
<C c="41" r="2" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AM3 - AO3) / AO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="43" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="44" r="2" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR3 / AQ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="46" r="2" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AR3 - AT3) / AT3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="业务发展目标" columnName="小赢家新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="48" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="49" r="2" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AW3 / AV3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="last_month" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="51" r="2" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(aw3-ay3)/ay3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=A3 + " " + B3 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="3" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="4" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="5" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E4 / D4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="6" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="7" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(E4 - G4) / G4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="8" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="9" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="10" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J4 / I4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="11" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="12" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J4 - L4) / L4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="13" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="14" r="3" s="3">
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
<![CDATA[=O4 / N4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="16" r="3" s="3">
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
<![CDATA[=(O4 - Q4) / Q4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="18" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="19" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="20" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T4 / S4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="21" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="22" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T4 - V4) / V4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="23" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="24" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="25" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y4 / X4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="26" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="27" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T4 - AA4) / AA4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="28" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="29" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="30" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="31" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="32" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF4 / AC4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="33" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AH3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="34" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="35" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="36" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AF4 - AJ4) / AJ4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="37" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="38" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="39" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AM4 / AL4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="40" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="41" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AM4 - AO4) / AO4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="42" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="43" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="44" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR4 / AQ4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="45" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="46" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AR4 - AT4) / AT4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="47" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="48" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="49" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AW4 / AV4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="50" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="51" r="3" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AW4-AY4)/AY4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B3"/>
</C>
<C c="1" r="4" cs="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=A3 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="4" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="5" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E5 / D5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="6" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="7" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(E5 - G5) / G5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="8" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="9" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="10" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J5 / I5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="11" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="12" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J5 - L5) / L5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="13" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="14" r="4" s="3">
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
<![CDATA[=O5 / N5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="16" r="4" s="3">
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
<![CDATA[=(O5 - Q5) / Q5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="18" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="19" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="20" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T5 / S5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="21" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="22" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T5 - V5) / V5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="23" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="24" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="25" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y5 / X5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="26" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="27" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T5 - AA5) / AA5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="28" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="29" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="30" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="31" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="32" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF5 / AC5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="33" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AH3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="34" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="35" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="36" r="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AF5 - AJ5) / AJ5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="37" r="4" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="38" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="39" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AM5 / AL5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="40" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="41" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AM5 - AO5) / AO5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="42" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="43" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="44" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR5 / AQ5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="45" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="46" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AR5 - AT5) / AT5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="47" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="48" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="49" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AW5 / AV5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="50" r="4" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="51" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AW5-AY5)/AY5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A3"/>
</C>
<C c="0" r="5" cs="3" s="9">
<O>
<![CDATA[门店合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E6 / D6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(E6 - G6) / G6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J6 / I6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J6 - L6) / L6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="5" s="13">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=O6 / N6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="5" s="13">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(O6 - Q6) / Q6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T6 / S6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T6 - V6) / V6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y6 / X6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T6 - AA6) / AA6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF6 / AC6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AH3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AF6 - AJ6) / AJ6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="5" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AM6 / AL6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="5" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="5" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AM6 - AO6) / AO6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="5" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR6 / AQ6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="5" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AR6 - AT6) / AT6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="5" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AW6 / AV6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY3[!0;!0]A{eval("b" + "3") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="5" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AW6-AY6)/AY6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="6" cs="3" s="9">
<O>
<![CDATA[渠道合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E7 / D7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(E7 - G7) / G7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J7 / I7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J7 - L7) / L7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="6" s="13">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=O7 / N7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="6" s="13">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(O7 - Q7) / Q7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T7 / S7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T7 - V7) / V7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y7 / X7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T7 - AA7) / AA7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF7 / AC7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AH3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AF7 - AJ7) / AJ7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="6" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AM7 / AL7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="6" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="6" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AM7 - AO7) / AO7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="6" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR7 / AQ7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="6" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AR7 - AT7) / AT7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="6" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AW7 / AV7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY3[!0;!0]A{eval("b" + "3") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="6" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AW7-AY7)/AY7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="7" cs="3" s="9">
<O>
<![CDATA[公司合计]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(D3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(E3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=E8 / D8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(E8 - G8) / G8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J8 / I8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J8 - L8) / L8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="7" s="13">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=O8 / N8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="7" s="13">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(O8 - Q8) / Q8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T8 / S8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T8 - V8) / V8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y8 / X8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(T8 - AA8) / AA8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF8 / AC8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AH3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AF8 - AJ8) / AJ8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="7" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AM8 / AL8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="7" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="7" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AM8 - AO8) / AO8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="7" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR8 / AQ8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="7" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AR8 - AT8) / AT8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="7" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AW8 / AV8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="7" s="14">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(AW8-AY8)/AY8]]></Attributes>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0%]]></Format>
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
<Background name="NullBackground"/>
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
<![CDATA[#0.0]]></Format>
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
<![CDATA[#0.0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
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
<![CDATA[#0.0%]]></Format>
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
<FRFont name="微软雅黑" style="1" size="72"/>
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
<Background name="ColorBackground" color="-2500135"/>
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
<Background name="ColorBackground" color="-2500135"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-2500135"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-2500135"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0%]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-2500135"/>
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
<Background name="ColorBackground" color="-2500135"/>
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
<![CDATA[e@^&he8>6c4X2=7,=RH*S_70t8I-1p/!=Hn/Tr>X0#V.P;(B[CU$R_9Ukl:8I4BT0Z0t?p`]A
b5O0kTQ,lFa:cqu'jYqnC??me_GqmXKOr*om%.\)V_JT#Yhu6sV`-'_qXjmf3>Q_!((FRfEG
42up`o^6aWH8MTXU(]A[CBA9@Y,Xe:X73`VuM<d!h9KI]AN>=Nc6>`I*p8,iEP(hKH+_Nb9o"U
+o^e@8#*h62ogVY%?]Ajr,Z]A$ioj?qN!$P)oqMkQaoeAJk#2TEqsPOYY4Ar^jM^J-Mi$EdeXk
)K<I-PlYY@R9raebE#shd>p0cX]A\(D,pm>#mDqt(jIf!P#=TsQHaCXAJUGY%D=>7E]AfEk'"K
qPJ:#lSCh&GM3kbKtMgefb?OVheBt#S@dOUJXDQ]A3OK+R7K7Cn]AO:X'L4D7cJ)aE(>[IrTN&
[aqIqhd)HQtd<i99+V);\(Y?T.hM3kWXQ;%g5oOsClc%Q3K%3`,_[X<]AC_#-)H';_ka.r@$l
g<>tT4^?g1J.0$Z983qL>llMS?4K+Wu]A&sUqG$]AeX0^3D4-gaRp1VoG(H/N6d=,[*69jM`"R
`Ag(.g&dtdXM6U2`LX"pgrO(Q#1?9b/gE3[-Q/Y!c%Y]A]AuqN9e]A6T)Y`Af50jZ^1RnJ7MmK;
""5!n8sT*+>8=aCu[F$<_gl!l+T`2t33Hp=%jjdc!.J.FTK]ADGA`Yt6H)BU^(fHPWMh[`ku7
\==#57m3udL7OOS6&WGE3<;'@[B:1$9p8,GED125UTc,B*oT9o2@g;H/f<AB>Nbq$<Oc0\\*
*4LFmU!U4qohMPV3c*S1cbDLMgI]A6H'Ib;*a.7`m!2di<JTq4:Rh,r@[JnFLf?_+m&uC,Gm2
Yq`5"*A(Up%i,DEsA_mGY'@N'R?fo`SNEVgc6!Lc3jQ,I.@6QQ?C[2*#\Tl;V)HT[0m\Q@X1
O&f@.J[Q=P.<>_1?L(E[G%?l<]Aoaqi#5b"d,+EX\C/"RYO%QkPX4J,/f^jB)`[7O>l`!:H&J
%9M`'T1ruC%/0&>!lYs7&$jrf'*ZN,^FE06D`ja?CXajgei^(`sV)B*u<0FJnmFIp6!#bddH
7'2`QQ8"R`VoC$hI@'!8L#:?tLrFgqbg[0!+6:U/CTnRSM@K`fV8ifudUKr#^)MfV'[p^"@B
_-(kH,pLlMcg,g,`_TRt9_S[H?$CO]A=J^D7>CK;IZ)#DAhN:M,j@f\Qn8XJN='tCOf[@O9p@
k9HZ!1/ku`=ZO0P!0#6+G;+%D&q%.G*mSXPEZHJ!0)1@fL*CjVUUln4$VTVZ4=O[<up7@W97
N*kePT*ld4+V-*`>9h/E+PFHcI4<]A$b!V9ZprHq*s[R2>+9.$dX,6HoL$W*$j&uEkGtNYc-/
apO)Ph`($c+(8"E_Tf*uBB8tpG-cLffDlY1ld+6O>OqJbHoqic9Zm;^6`p-95eFOqG&3J"p]A
UY79a[/5p1FC$,dC=B7LU5;UpX*9B)&*5T-ZDGe"9S:qUElRu#MS_5C`N7fg.KTDad;c<UqP
',C^aH._cH>%i2!^S]AIha7i$gC<QEpY/pbD)X'Y3WSAg0>L5V(50:1ZA1l@g':h_$NJMATH>
X##XY'1p9hpZ4S5;*8e#g98S1;U=?M>mYMRPj=(Qne?aPUELbF)G992VRlepa1u@`nnaaKp*
mX!H3KJ.uDmt"40*[^t*2,FH/fUt,48Km@5UHuWlLV7__*UKPFHRZ6h1s&=^pi!,,a:E<K4J
=bInqC%f[oRsTM;N;Xf?[lW3bl[H<9+Y2(D$#o#Qo!MDHgE[!C>b*cl2Y'5@TJ`V,N-7!^82
HgokKKJqh"a#^Y'<M-V6P=5Vpfs#T_-V$I[DJ\CoFjhE^G%"U#afVpq+clJeY\36(?\rFpj\
-%b\t4'BlM&FLjSZ9nQ0AJ-C/]ANN)LXX(a2UZ#K0Ke=._A<udsI,i<fr?4<%e/N;C@P?7[.0
3.V5gF8Pc*n?Yc4)ZfZ9iHG/pkF.4&h/kuiEl_6^Fm*:t/4oq-f-6']A8bXoiHQ"FM_qDkok1
$q5^A7UJ\neQRP!&KJpV>B*-RdU]As$7K!Q'mo=!Vc(97md=-hBP"^JT#=nV[U/X16NB^aW*U
5``qiK_CSMnea,*3n[@&Z/Z]AM;^4o#NO>,!kh322g7RbhCK8I.HIJ+-Sh:A%T'K<,GTqk,-_
W.dHlMUFXP9@&$/<<D&%m8KI;QeL"<3X;p>$2@!QbB<t)F+).-<>jWYSk;G#ORC8I=HD=,A.
5^&GjrU#S\p=Ms27Q/I\2p^<IDggrg<$8\A<A_o+@[&MSWguGGcr3HA)J3*TU1(Kg`:#<>NU
`PuE%lfP\.#A]Afi26S0MsdN[csPr74q=T#49+'r?RKdRb)pE%`Q(M^6Og8a(;-=V1rlgK&UO
1;%jPEWjBKQVUjf?',qLppLZ8a1b7KqA&:H6($%F)q"c_tQ5AIk14QrQITN9$lok$)eB"s'-
;`b>=5LeM:=8kWOg?rMq%egC]A!';Gb"6_$$3j<9fuar,tTNMSaiO@`fO7g3;s2?/DRJ2:gr%
qMC^$QQ`AE/s6kZ:n?D=WrU7R:3tZce\X-'5/rBC>Qrp#2bIYGW9XT`_(RY:+61<,\fk_WS3
P&\m0(&PD8W-qkMTV$)C6JsU&3K3YrN3p<&'[gq2QVY&`deHVX(\sl-Ime1%78MB0VWD3*LJ
>adKpT3jaiA(X0TnA:N(fbeI:MB*gajr1_o:]Au9sI!;b@j["uZZ#K$=i1AqfjnQ;P8Gk,<#L
:]AOSHNV6%B6I:C!L/8&^[`Hk6H\mAY(bHK\Y/'><r4pD26qqNgmLd&Ls9Pom52B#PU8tm!(V
oS>j?:HCELDD9T!?#.:q8?K++<MY^apiH&FZ/oRp*0#@LLOYd=T<4pB`3D9!g^,f_5AKl")N
]A_rV?PAt#^.M,O]A'2*]AhJ*#iZLUS>SBf,H"IcKf'mK:VsBO5H]A`8#fEreVkO&Ee$hh2jn)U7
HCNDfeZDU>d7p=IW/6*.68QdqA`**"7M:/hFd]A'Bus%_eN6\S5IH%/0_^"C@/uoPFgK?.mh2
`80dSO/Yh>BSoL((,guO:rKGKPdZEA'e(9+bdTqJ5?]A9\I%m!bW,6pBo2U%Mb`+0sZOktu[H
^Hp5d.hDU(&:6<;)h,)[!=de*6r3e;Y7q^B;+(O#lhk#0mtl4K`U2<C#Q.S_be<%E>76:0r@
sb>EltG'n28<D(B+ulG@IsKL`lq??+ZuJ%F9Q5"^eu'B:Sk$p2oH9B?kGs-m\/fBqJpmEm4@
$sj$5r4e3p`j=8&m7D;<g0Lc!0/6nVJ+P"anPQM3EtbN^>n&B*^2/;MB99JaOj*FQj<ZfD"M
?5iiWZ,<h,-\;dH,"&eU[\PK3B-VOKQ=P!BXl1Y6"hh\43l"lgk&?R.)2oP2_LuJ$iHTlONQ
7hYC*`c?0K[lQalhYE*^jEOtf")I>LBs#t.\\tZ0R+-%S#GsPs(5;YKG)fXMKkTrY_.3\Bos
$"lPg*;V)E4Y*jpet]AMEgA.k7JN:QqIfgl&uV!fdl^j+%2\AWjLUhSLDD_%`DD,8+6e4V01Q
Sl$(rl"8uE'k\`RmfmETk\(p!cS@rZf>rb$0)fc[?"6*p\V34!=U;%KSN61*tk0UFXs&@@-+
d4Tf=$Ok&+`'-SnRlJlWr_sJG'N))4N%%&oDg^!^_UcNkjsX\0)rCr/<$DdKTWHhJ=1bdEJ]A
b<Ho:27<=c:Bc)+>goU]A:pe%'7-GVhA5=FiJ2J2nmkcg?DDQ8[VMT[2*8]A=3f1#r6su$?K16
Q;eP#&QSYT$%0(nAn@9ZU/Kt^30#ram>V!2mF,L,9pt$VLh/q9GDA]AD^CNOP!9CK?-O`n[nY
I&*cFMc_Ij!8#5bq>#I('o0cn]AVCq)jlf)h-C^aS^$AsA:qbM-"*8FiD_^9mRi6#9b_eqh5*
^5aX&@90>YA=aoil9O%LD/Z6P*UM_b64!SCdT>c:D_Hs%LNJ\nRqiIQ\?1,(W\optt(:92W)
[=p*fS)0[CE/0haGNT"bGC&:aA2Zp*/e7/R3.$V6RHJnSOBD5lK&t4:K3Y0.nb@,9)Nr<m!"
Cro+8.oN:Ql<=Y++"VV\->\rR+jX-6Jg@o9C1V.<JD^<Kj?1_2PJ;;_raDACrHgT?jj%Ll:Z
VULhF+RMDI)G^d%C00c%BL+BEU!;;?0%MdE9lF/(%mOfLof"[P3M]AjLrQ3.IVC2.9HRL36*>
\5IO$ktVcBV''JYjI!&(q?au!)0I4>9@)$m_+c=T]AaXBd9U6?MdtWRNd^-@iDSLQ3eAIm_PR
U&3@8CTj,V!X=ua@t3cf9ZI"uKdj5M8&77\N:hM>E]A4CfNm)]AkXf`B"WEC0R`A`e]AKFam^Pk
e[$5ulqQ\,XqR#<:b]A]AWn>]AA^=qu8$pH:g6;&O3+(!kE@'g2_.J)P.tI!fu0lUg7.$ZM5,bG
b;A)V!/(7o\b2fU.G/R8i8?]AkVtdLllJnDU7Uf<OhqL-oY*LE_?dpkmU<AFY9pjr&5k+kn;3
W[SPO]ANGs^SZ/u_`]AHOE,iP)CJan<a64tP.ehDec?J1B-8PbE=oVW4I[j!=3PFiYJF[pV$"o
"^8^$3?M`A\q&qp8f!f?.+JU`@3Kaj!_GC!gjPJ<dQ5-lb6Y?;:8mt20Z2RR"@FERKDirY/W
%7KE,g#G)@NarDR')c]A3;=<6WI-(';C;!NbDi@o)J@T4'PANKNF_kDpe7]Ab0n*B!;,d.i(AC
k/Gh0I+>)'q'217g+UN3k:[<Tktn'HA&GIrW?OLA6SQ[ScGlq^Xl[HVkIQTZl&!`+LLHE]As-
_i[ZPp]Abl*,@go31#:7N6WZ;Ynb@pUL44$F%d`f5!&AKW[9Fs'AUWr]AN^1Od%EdPu_uOObc7
FoMU/M>DY6%U5XU_S3rR1!jF4`6?48?5$[02G)9ZnHRp]A^"<2Tc(Z?aM06qpm:q&9sjl%K2h
Qa6\*h<jP*gZdgH5NH;kcj5E@GXGcdqJ:`FeU@QnNQQYFBlK=s(r3rk7(e^?/`upSH46".#V
khaZc$5L^GqTi25W,A"D0UO`oSOFaj[f3A%<K]AP:q?rI#!DlG6E/&DF9m_u"!<VQPN2jb&^=
)L&Yn!;%8:P2#S<.5$QWOh]AqmT2Mu[+!)3_KtM5#`80gJ\8d[%3NKr\+&K!_@Q8PJc^4t-J<
Cq4Bk#"E]A>K0<@eg>COR2RCBL_qf%$O1rG'DO")03t<THPAkVCcRP@8<[[9:%9):@V!]A*2h;
@icmI)V!BDO,HPFna1"044hNEo(k8NU<K$j)';:T=gIMpf-?k0L>b(8n,Ae5_dBlE:C%\O8!
!H3doup,2/^+A8=_smQBm!`3OJdHH-bWYOkc7j1QH!^R+1<fh?iBDu\Q>9`:oap,W@R)-3de
G#qh;!CMd(!&-Bu:<$d0(5(?;e>_"/ApbPXK!)LlWW^:h]AT_u#3^&R=q8BSb!<eagHmT?K%(
@htY1.s2ZPAd[d4UV`akQBJSrH."%mTG4NXc#'C9>JjuHnYj?F?pBV5HB7f`=V=0MmU\OV!h
K'W#t`Z<49]A6Wfd8/qA!ZGH<hE$a"!@A'A?/NG%pRUds+[OXFPO%>T&g8FkC:oiLSVZ%iW]A*
R#D0HOl)M,&p2rIHduIf0_Yn^3p=\"+C\:5</$YS)[_CaNI#SpqA+ud6V&6d+U'#d&2dCYaE
^+3nQ6I/Z]A#8=*EZ=NN)Y/`kTXM):O9Z@D_YWrTaZZcq,3[!4NOV5f3fA755j^CIZNgFtmFh
IpHfeIoa"o<ul8:ZYkVl\Y]ARhRPElWR/aU)[GF(c(ee#3fnch;()#\lc*-A^Uq1k[rQ%HOg;
!RgT1R8V98_c5P]AU5R:po?c&6iWDSHU$CJNTN&[*IX?'S6gJBbFbj,:V1tT4Pg-04:MSH!ZU
1Hf.EbH(<cjohk>U'V$i2q4-b2T`@euCi(Q3s\NG,Gc/[kY`+o[W(=ckmP6bu+Mi@?3kcPo2
L*Zdhm$ts3b_XBMr$f[C\'pkNICjjUb?!XS=D3F;9!UsU*-3YjIV;g`47]A1WUa]AkHPor1-M2
Ih$s8%;->"&m"o-7HeJ$VNUJ_+aC]ASNGCPqSX"oBON$bf*$@%('sec\BP=2\=XGqK.r9RHer
FAfXdC+Z5`++EFMRAC-tBFl47<OaL\40`7iglR.\5[OoMSgEd$PPhn?"FI&d%Xl]AM2jY1,ET
1q2E_Y;s^Wp7J^\bO.P]AjAWnMae?-B?c]AUYD-!I>IDt>egAfO.0rh9B>8MhS2MOrBf4W\pjS
Xc'Ih=I.(n&n!qt)U@K\8!;=Z128[FXpbiV'ZJ,h.&\kY7]A^J4\=%P6[9FlS,0gjRHaSp2E,
e?;"i98pBhaj?4/eT"b5#q58`UAF9Q5pWOY<+oJ^8PQ48'rl?FG#`*OYUEjO7=44luSF:0:r
0RG64@WWYH@PmR`h*!4,6]AQt2^`:D\G-X`lGbY"el1X7`0>O7,jR.;dqNtP,,$Jo*(j_LO.d
6M8Xil7Eb@T@gM=lbTDM+o[c\l1dXFl-Z%fJk+i.S1@J%efCd!\^P:T8qAn1=he_(/jqN.hm
ntF0%g+!8`%h/lC#55,-JT3/In<E5$,9gML+.g/<d9<UZe7,:k@s>`TM0?1[jTGm0&kC6b:<
!TArU@f"j[!W,P&^(,;KLABlI9WE<E:4>_>%1Q+n:7-,ZY^E$pR<GkkNREZ9Io?@#B0>Z&5f
r?S5Ks&/g-cf+!7SEEMGfelg_JSe!iI?pSLr]A-OpMIg!\c$!mVriXtk]A<k0#nQmqE%`Y#qG)
1<&HkZ_O?$";?9\dtAQU%Z.kH[.41L%Ng&p2)V0fk0)Kjhq<CSip.G20g;a;b@q8nCDBeVO]A
bl)7=4_"G/1V&S))PAap0%!L9#9D/\NeSLb+IrpJ96>=$"bAe);56V3oG=J1:Z6k<_0LPE+l
AtG(*.#A2='*mL,@0(\C[7sFM.pB`'@HhM5cO]Ao]A&2,V>ieT>[^fPU>$o&NIDj=*TpRGTA,I
L<\8:i<:QlB)h_6l4"+Fu=5D!mBc!B(!T`hOcFNm6%\6E!jURW*c=LjUu#4<e9$[gDouW,-]A
C)Pu&]AP/*Y3Q^H^&6Lf>X\EUK):36-7<=5/-\=/DM0F$O\(Y0J*cUXT[XTd9mL);9676^^nk
Xa\Eok;t:):ENWMGdhPIUR]A4IT,=30X<L4jVTm,2g'U:e!LA0q`2Y44)kg4B"d0heGWG+Ie.
(B()+5tpM$rM\.L+X&r#[5(NQf;DiVb8?1F(+nLS,QT,cAQ83SpW27*GD<1;rLcGU,/d2)UY
o3%q4G(,LR`82uF]Ano6e0"j^Lph(4HajN*iKdTUmLP]A:]AU"9fV$-VYb^n^bs"H3!'6/0`N?K
$_a6VYQf0dCsROn`Pm)R%9!#j196<W0e7nTB"1Bg*b/Mti<P[hI(IU.46nl$Hq3?LWsL[(2n
c4S)?nn2^V%PT(uNo:TUedW3ZOd`r0u@(o^2q^oQq0EkQ:>"H!XHgSuK_/74`2Z2'3^9pn\c
i<QQJfId.6eb@'g\?JFSqkTj%f#1KV>.@.38(=ZPGU780X;=AMbU:06O9:'Q2BR>P1@?J7bR
K9KSZt+N"X&l-t7ALiJopT/8=-all@DD7&B\V:sLMceDB,>_ImWBX%+d`8i:,a>]Acbr3?#"K
`L>FLQo;AnT;e):NOAU":Ca8QHq_PCPMm0-JC"PoH\`OMff*!XCRhYJrj-9fN`p\0L,8a&Ib
qg%rK%Ob\Z<u#UUsh\C*4fH^<m4%LcCljojJQQc;mY>//V^grg^Hn&?O*J<Y0C.)FTYp:MWG
m$PgFT9PbhpTNd4eg\"<o*>YOh%XV&md`9b5]A:LYnXebcEcf?,g!kI?U!^^6)j;sS>C.BTN(
<;If'T[)JiI.?i1>?Z\6&:Q_)Sh-P%RD'=R'1^!_s@qIPsfa&M:6C,g4W(l>d::>88FFa]A16
K2(7AH@5R5_0[XcJ$f515mCIn]AmIuC<JDJD#327);X<_*sWc1$*eeOa,Bk5hL1K9(Lh?N5FR
<fnbDb-oiPI\`4o/BDJL@g.+[4@6gen30FME5^UQ4.R.._P:>bP#1?)'7CSEZ`i:+pN=sATL
GZ\%MmI"FZ`DLH"\7=&d1MgY!T<[%k.k_>?DGh1kDj1c]A!5#Nk#t&f36tMrA^L/_u('XX<nc
Cd*0r=VkS:?i*?sL8%?A\<09LQS1DR2E_EF_g2%1"k@)b2D2"3H[!+L$IZtu>59:@+Alc?b[
(%*"dCM0mClrVo))/e?\??H-^>G1@6`^l-CFV%J3)fIH^(qq$SAAD6Z&[oU)OT&MnK/,Z=,3
%t`g)En0M4]AREQ3%t[;t!P!t;%TqU%qlIG0hDgS2fNR`Kr#?F"%-'WEpVK$"#!mn)K(*I/e_
qtXe)?IpsF1VuSRZKA*b[F:)g+hXZAQcVhaG`_Fm+Ce)Gjk*;+5i"te>g&\']ATbs$n[#n&=L
j,"-q:%Y@NYA%n6MPq-9sY;)=9t4<P@\B-!>Al?^qt=>0M=V]A$>Z?.3=]A.p`_#(%.g4-->gT
($oLXMFNf^`O9Ih<*[Zuf6Le^s]A)Q&M)k8Pk7t(Ebb]A.6hk)@qQZs.KTfrUF88>K;9\jUV$k
%^$EpHYQA"WM1(38A[G2aZIGJl?)$5'OM?_:u/(+'f%$n/-/U>(bV>Tq2L^_/(ObgVq@`@er
[D4R(+=M)Q[)YWj'Xn/i%J/$mK:b07H''rDWJhokVhoZmCsGJp-6]A[QGQ'f=3Y'fH2MpHR_a
l&CnPd++S+Wh$@g;bdF#*fC<>ZttLmnn2=g3^FmlH>RLbfQ$ij;/Nn[LNKjWg$mC#T0t3$#C
:RV]A.$DI=!g?;bhiiuB@C=a"i'cN^+csNXg)%Uk/LQ$"0,Rsq);s6pp8@Ch97j!hGQZX"Obl
TGU8R31TmW8H@%Y^=<1LUWT^6bG)G#:L?:DY"Ji:)lQ:@E+>._`crb_(VWG1DVT%&J/=$B%@
?m:ha?akVd5j&ReV=o@(hL*Xj*jPho!EaDYD0/0hBb^N[1l53T<qB`dq/"CH/;DdoSnS*3.8
n=83`=sF+6g$DA#+8$p9;6e:4_\;nqF1>H6',GRVad;XZnNk02SoNOrfab5'DdF"oQsBIl14
6hQSCoiMB\RailCCb%#EL4njT&4mPHeh+Me+h4*ZngP(hTB\`qM-D1`gP*U\O[ncmFi3OeM.
0g>Jf3W:-u1s_k!OHH^DWm4RB!=YK`1FkT)3Qej'QTF45>p<%fT-^.NlZjo'raY_cP94X!`J
%bTS$,^^CRAgmBrPV8&qi=S_p?#00"T\oD8sIu$3c"*HnW>-ZXfi%7VVd9"mL/;3r'eh*?l0
UJ9bPbUt$CAAfLK'Y?K[ciF**5"oY"p`83F@85(HV\-V*jjfglYRCBdhjIR6cI9qN*Y8EmIF
P7J0KcO[u&otK;GnqrUBb0/Xb@22n3,KAJKb;KS3*=j%8eJE=pDp^d,s'.^BZ/+ie+8O3r:K
cDn=g?):=t2:?u_7Cbs+<dQ)!1Ka*N*gM/L-9QTGhi)^f`8d$MMZhf3Tc9$[+8#b+`V!55"r
f&#>]ATrW<P4bjn:-+1"^*4PY,FFsredQN5%Zh1PmfR]A8hte)?(3lS-9l3Z(4sCWKo,sL@iof
IVUiM!UDueDlgLp$h-_9bj+BRX$.r'G)9i_BbA9K?3_H=S9[tt*)4#!"K(0:OWk.%@J2V&@[
L]AKb?uT,q$*a'_Q)]A^el]ADoF).:4ba9[RlUJkI65dKECSZ]A\)LW*u').9*d;[<M_d064aQ?D
=DOo`-!C(@,%VbO:hQpLdZPqAk=;T@SN6K_)s*[=]A8Tt!M5'RIWZM<+b*Qg^U8GhnM#/=psF
1HHkY?[]A1_1.`TL3R`[<@52D[Ysg]Ad3j6M%m]Al;MQn)WqV0b_EIA!ri8TrGpaE6PAX]AlC@@3
r*<!8F!Nj/;p-Il@n,r\VK=U(2D#Kk[ij'X,Ob]AK+A?qca@!4IQuJZY)/\?;K46fWA.ORL1a
;^WZ-khK#6[mR7Y1lJMeFSQXmfPMuZR`F,#QZ/!qY=;k0+[\3#'pQ$=g#N#%C*!lG53^\d$:
%LoeG5ug8pe,\p71_q$#qM'!%%FsGit5RHHZS1k"NrgU]A'6^<IHe`;X\L$fhWTl$^4ts':`A
T1dr\=.s4`obBp2_F"ps\7o`:(HLG=`&g)d.^p8PfS!Bk8sV'P/m7%a4<(8'D#o2lKg@8_WF
XdlsX"&tQB)S^2R.J*1L#N.ZKQUf^=UVf'jq6JsI\\(VIJiAsO:>E9V$h'P1C$b9tbm@NgZf
eoP_4%P+Aul7hPM!]A-2Fm(t7Qh\X$MG572AXL5!kFiM1frkiD.idcSPjkKH"BW+mk@?ST7cY
]AR!F4Do<\AJ6.6mY6<fUDr^h#pgAPkZl?c8ka+\$"&&ZEE:&B5P]Ar.d-QDcuPojq0g%b<M(.
BV7mQL[0qjAcR0/e.q?cfu;:Um"<8T^COD4d0;Y(qGIH?JY,$d_+UTiSt"=.aYtW7_iim?>!
q<m`G=A;1\tq3q6J>p2BhXK$GY#Ur.Q!fZZ*44&/^_?@:Gl,3'8;@$`iGB8N#7V;)G&_6E3V
k?8i4Y+A8(6"WGf`c9BubSMc[<HE!haq99iW\#YoXWbV*D!oD\l5*t8Tm:a0I;6qAkeg3-iQ
>Sg!n$6_^_p'NB\oYQgh/V0fPrsTDQ-k^GY!qU_Z8>@g3&%uLBZSJb=je]ANmXHVfE>&Q%F>1
l;D;s]ANcD%K%Gm8c0^J/2+6F$E2!IT0/,bE?Hh;?()bQGD0sPnbYUc7!oAA/-4#_8QWf?C"f
chj2=7\)gUm`uJqT]A^s3:-?<bidioJ9gH>GEm\g1;J[k3g%YbmE_6Th-O57!fc;hG"bLicP(
]Ad^.M\,4LK=0gEa3U7$CrR"0PYr"KOCt_)*7Ps15oH3sVcpk[hEH\NWBlr1_Go<D^Z0R:%*H
F5l="EO3j."A0%Hi:a-X`hBuHUUhA^$i(i4'bNW-a+4bb3g!/=2Zne-I4R"(kj,$AXftjcoD
-n.W&TsHhDXq4Wrm74#!_hus*q4nlC!E_LkAleI3'9;I\+]A))O'%e?$0PZkM4ZNO;2m0^p1a
^De-bt(@rp@=h)+EB<`M!PDM-O%F&(nA\juumU,P"Sc&C/UlVUTUYT:3763A$_\/Pr#Fa34A
Y3e.Wp&\K/>&FID#]AaTpf*6EAY7KuX?=dVh+[%M-M[rHU:gM`W)KB#F9V]Ap.fCj&*&Y:'=#/
>#$qs9=V:O6[Oc6?aY@o]Ai<&dX'Gu"Qd\^S]Au8g2AIhG-9\<N=A?d4``a7I%Un_FT,Nrl*!G
AA]AG*hK:#\8+9FWNXaHY?sl>p#msL7=VeW_5I"_3XtD["E1&@&.WCJOF[R_50K^U)J"4,nMj
2W2;J'"JrBt;8_J0\80Po34>Fd6$'m'$nGZW)&Uu>q!dYC;A-u?*9Ae]AB_ls)'S)Qcfc%tnq
J."Ak(HLeVoqt:n;e0^/sQ8(KmS@MKm*:tEjX>UqSU&#'OeD6ukOV4JI)1o(Xk'_je<]Af]AB-
F`oindo[W2C`Seh7.R-f86=e'L0pLeV3IlK(4AQc!=Cg)1T3-B?h&qSAL,aMNC"G,_Y$2/P^
\n7?P"fAnIdSf-i^>,80j0[Z#4s(d$_-+`u&&:pEe):%X/L#SQ-l#^gcSlSZ=]Ag,SQ%h-uj4
-1U3.b1`Nf7E7QNCWCisD,r!T),_g?2ih(.1X([nf'-$KA0&A27F=U\EBN'1-(mMW9>H!8mH
R4[#?;U]A\NV0:h&b%FWKBW;o49d3_4!,*5e<!6AMl^:?@O7`RCq"[$DZWun"-8]AAKMo0h<<M
&R0H+n^>F.Hmu53N1"U.);X1#kpG`>t5:kh0<cD#=EmT0ZRT?#D>.>R\PF&AfC,0._<*;O8e
2-jtc6amr(e]A.+eGO2G`ulh_.mdm_$Lc6HQr`o0(XbOeGADh+?Ks;F?Vp(HhK]ABk%M!nA7-7
]A&$"dCG.`5SGSonHl$Jk^krVGN\"ao`d>J<l(f.1]ANh<54Y.#[W+5=#]AhGdESM!KXc6s#Me-
c@EHVo[n?,L%!O]AlBR;/>9Wr'>2iPtas#t+g9MQs?mnnDo`T2-L[g^F,Le]AoLu%B"C"E`jJ9
"/(XLrQ`^sXR,b?p2N5"?LnFJn;*5$mTh2\eX2>*[\FUNJ$e2k/kJ5ge!7#jLuK7lSbM*ph)
?#Ecl,\mkot`Up"5<X>S!??>;mjYC^pSOha(7>I4&O-0D0-TtrB%6t$]A3f<4rDiF"0loR9cD
"JhkE(Y6>lrAmUnD[Y2D&b9o0SH?NG7mOef6]A`_(h[79N'Ki1]AfkZ=4.RaSZA:;>GlOTIs#\
^PM(s>P@Xm\0C'Id]AQMTie,skT_%2#kl"P3I4#BfM!bFp8d$f[)=)K2^E-e[d=Z5[tJPY^?o
2_3@RXT^VEL`NDSXp<bU1l$S9LT6lWe,dp6T5-`6o86[`!ZpCc-@b1eRBr'(`g+qOs6^r&?n
su/d6kO=gs+!4>To<RR3(K9\%f>S3YZ8Dp3j0m1LTtE7$Z=g@LZ[6c+OiVs&4$n,fXO;-GS!
I/)Aef9D_q+a<!C6$i:f3(s(Vd]Ap>^(<CNbj*Mq@Al;V+PFB'Y8ZfQR/<%c`e87,+>7C]AtQD
,L&2X]AET/RSkgi*R=pi5LBs]Almm_@7jsn<P3c`c)Ub0\q8tp%'i-P+%/_VBbCf:)Y9S+R0;&
:,5l`Q-h*X9K2G9(i==_=7'2LE)4u6e"_"XP0,=Kk/lk\!Xjj+XDFcTb4Mb)V,rZQQIK&<#N
?uGn^!Ro??k"$/.Zg6hC)oH#@K_-)4.gfuTSC7FWG`Q%%O"8iEVF]AZ!iP9t=V!r"15au=+@\
>"L-$kI3?CCH(5OD'pO,KT>R`U7f258+$]A@/5_0h*k@$Y`J/DBO')@\pnWq75o4p`^=;AW[o
X?I"m#8uNg-Z+J]A=Wp9_Z>8ki9)dcC7R+lqNW%O2N5Z!sXY`tmAcH3rU5I9;$hL\J$;@$WiI
X@nMGEHZ$bL;MRB?7i?]A]A!5]Ae>t4[VFUB<r%$se9eFs\=R]Al,Xt+#aXMgg8HAlm/iAn9rcg;
lf5i-cpj3$n/CiW.8YuKon$_Xa(-\C#Y2AJOYSI1>nPZ.G?(<R]A5]A\#uS5@iOT/dCHQiB(#2
YJb_TW`tL?ISgFcFN.%O;27/HE*:7fL0((Kl=#eI3ndfKP'DZYV`\Wg.pd:>6VR?q[!kMPdr
"g]An)I<H`PIKS04MR==lea@1NCZ;3't?Uq5>_CHlRB(Qt*2K.*g8*P>S]AXEK^N7p;Qg'+hRk
Vai3C`lEputW2]AmU4HHlSL%(WN6_Wj0E_FWMlqGVJFSVVGlFY'jdVEW;J/<8"\]Aqj7<D)0Sk
2/q2KTK_Occ$4<-SKMJ:6kd4.PSK\YP<P1&#QKO*olK,P$LD.mT&+_oN:O_+YRfL[#U?lC@,
*Pd;r<mS/`\a8]A5?39bUMNR'b_6"]A_t.?V@=Oa2^q5WQ$@q"W`_dnXt<_Vtd67.(Xe_d4Y(A
7GMgK:AhOc>te[p`[d&-Z3$T"TDA"kfj$P.UMiRuV\>PJK5hWS5IYG=)3krd)@\eum]A=D==Z
)slEIEpU>oj<Y3e%/F8c569$lrS:@bq*A*j-NFdMrZ$0X<m=]A=UXEh;g!QR&%]AR=fj@]AbXt7
35tua[`\O]AbJDXB#IX<sfR%(qJRdkFed:-_ls#E*7ES8:4bGV2SbhfoS`Um#1p?gBZ#A9RQW
[4Ta+F1]A)BkPBRCXa4Dl"lAF7QYrunU8Y?FlA\]A_eZ8pLt\rW-$N8[W&'82]AW2\H3GYssZU4
LP7FE^,A^kc^"\-CQ*^ED*DamO^X.I;FLs9(HX5ca!adH@nLeb>M>*NmaLODm,<?^u:^ee?I
_/mi&AMj/S`=uhi@)Jsj3nGVY1g?\se$FX<K,?YQ9H"5E=q4)fNrCpn[$oTj%X;Xfb8SY:fX
]ADg:?]Ai(afF:e80ejQY<>X>q\c+$]AE$8L5GYg0["5]AoQ2gVL?Z6%eq=pK.rZG)_Gd/bk0/cS
'%W_\r:8#Nt529#NIBm\Aip;VU^>hiu^?h6*rf%l8Y_:#Q`ZRn`9Mb8AbZJJrm7>^O`uBluU
7^4d.Il4B8[iPdEWIX*!dKTHZK+H*'ZUj#]AB<2jA-)U5[M<lV8Xkn'q\8]A=;UU1a2S$#<>0]A
l!5%UqUs(Ka*)J81ASN2u3F<hm>`:UXo%TmQk3tD*o81GSsHg?*[/.FT!e,$=B@;5R\3WBl\
Elk2YZmp$ljd9)X9i%@?L>e%c&X6t)85+h+GX^*s47)-=E*eaT)>1'Fp0`WEPo(^"qg'&^l6
Pk\*\)3o,".UA^O2h6$/@^L4"I/<aH;'HY9bl2j2,(\n%uupi8aA3),H#(.mLQEb09pmG'dp
1U]A`E#%kj7_R5;P:!&_*lkTOFV:Ue@sT03cXEJ]AI05uUFO$^5GQ%kP[/Gs1!m.>4&WmbJ,#*
KV6=^7r6X_`+m_-IIoT51b($N2H3hF"_<-P<EUh8kE_Y`oUT]AD&lJnTP%[cIidU;5S8_I'g1
UklSO>Z&^Ahr_7>V`QPPUlShlJgb:]AS,7*@/Z0h-1)L"n?#)9bUr$^2c,)OF,g^fT0H9@\\2
8Xl+`Tf]AMY^sPJ:e$c4lb&?@+h>N^Ai\o$4[lWc.(]AO:pkDH*2`uDo\95'H'&pZ4UjJDB[RN
ets86,Ca8B/1qgN6<*V,g*ckXujBLGA7iJ_PUp8[._&AZ'>*ms>@n34Re;\RO2]AZ(#ED>CoC
=k%J-Ff6m%4.huIh_AYHIg;]Aaj_"9\u4Ke(!?G$)]Ac'S8NJU/kZLd,*qjmQT*T0HJpp3,"\b
]A?>i=.m(AE18OT16f_*rVRJ^A<"ClrTJ!]Ai,_O_>@A(uQ$_1r'XKODp>[(Pi,mdu=#cd4i%h
<49!H242MSe_s+"1eCJng%/5&?gq;iNfZc18\$\tE?U:B>d`(Qb.X\+pT[2me;=o:a[B6q(G
UW%.u0OD0!Ukd)kB%8SRT(rR\=#ccL1qo3T-k]A3uq1ADr:%u,Wk_n;&-a[pbc+-S7EW[!:r%
bm?k-gOM?Nrla?c%;jGi_`o4WLYrP1"GjLAtM.g@N1H`_><^Y+Z&+>URC),_mGElaN:3)1Mn
Zj*nO_5BqLo2?@c?b$"F?s.o?iC9*18?,-ukIGN5B"io>3a+i]A4pGj"QlLe><:io"sXbs4V:
8'I$:1bhE5R$NRTu#fMH:&%tk)p0cB7GBL$L5Mb@t:E0.DJl?U.]AGMU<?FsUO(ggC:u^iIJn
:tLV!PED0Z47%<)+Hio^e+rV%o#D$n3#XZ=o`B4L3D6V[BHb,3CY&"`q+!e0p"JdI^M=2n3<
D_D?o+fNR"&"W'?rN4.E<rCjMF:)`O+;?HDht!2tO($*CeYs2'BTGP6&48YZ41-h92%C4#Xn
5d(F(O]AKlH-:8B,Gf$;+1^L",l=0Xp_/A"7pH/aZ4V?T$RV+c1a^_i<;>^'@[G-_=hA?NO(g
A?$9S)BZ^HAb\n*k9"8-YYq!n1YL-HXlm5Gqo@OIW@=>`_>Vc)1CL@IOEm.c5Z[umq4=0iM)
-Ebng6$F^@#W@_'fY^EZ22CNO-3sSP:d),J*s&t2cc_,gE4Pd9NPKYoGaX&n<Hb)Eq7dToBR
6N("]A#)+k'i<O%?B>=ohp/cLrg4Xh<&`%DjI@05/:Kc<9nL`3h%)*!R]Ar>QN\rc!(`/N]AC<#
683'k+0X<24A?i<3s`GYX7pi?I;pYggsYEZ's8'Sq6M)8?+t3J<0pMi(sajs%3M[?46\YJ9W
n;aP9m2'=MMRfiI_V&Ee*VG6JEoID`G%FXoXdDFK9=@0sjipj8lG_[JuI2MJ67.%_X>&.NFq
XO(gHN_F*O.%lWlc#qcE.k&^`<!B91-+meKeog?\\U#2D6RtQ[bkVU+Uf-]A+Gq>nX2oF6^GQ
HFWl4P`$J"%%8<]A85P>n7"3k)3e7gA#t@[CZ@jIjYq@hc.BNNduaLT1tsuUs5\QgJV\.;\#r
r=!#nnVedUIFbNfl3^+%?T8^[n&<b0N6B61V$jT#>j=AX5TlMqBf7^i"6-p.=`)h2i1T3b1p
==#Ph$p$EU^W>92?1c-Rd\CqQp:1m"(r`o[7)m(cXCEN^StHg=qLpujBk>lrZ_2]A9$/kM,&K
SXmQBeU?R-NdIk[ok6!+=_e+qCbHd_Ro-6+C0$lniA&cag[T]APEHSogH(f:GnBlXquiaB2#J
W[^0G1Np\`"N1Mo-r0[l,R7'gm9(G?0<NfXuLkYn9C\*:*2E0jp6lDV8f=-7+S6'0HFCjQ*!
'ShjX#8@G.7kk#Djo@c_*aQBoU#>M/3EMf-_)eH)LeL=nVAk=K/fGY0Utk=@5lh1`St,ga&1
sB:\WP@W6TWXIjNT=K,dSI,hho7W%R]ARW/u<sCU#?g(6m9'G=VR5dFO<)Xt6R4^fMiWe8$[e
VU_'`-lGS$rIO8J3`fJ!q)s8ZoJeS:>\P((L':NgNsL7)91.P1J[=(.:`0=YWLL&0"7cnI_1
MX_L^fd7\YGhl0a9g&^UA8%=5d2\Oad9.S0&1!3jiAehCCACR<<IDXI>6ioE8()cLTh)\A*6
K[m;oWl>PR:h7Y>P:qZM0T5jK>)6$3$1>XPR#SbH!J!_qGY[0V>VrM[]AU<,#c9LL+4kZ&c>n
_1%51]AE.J$qkf,8iJ@c,fI:=?u.Nu_8DN'K7ChOT,1Yes*>eU&YsQf@]Akb^k(klt$8*9(>pf
B6kr$I"=pGXg_YVh8R<J)0q_ZosQWRF=<Q9bk^]Ar1&mOM*T85`*!_@@liE*k!`)#_,?@f._`
3"'s`cu]A@Q0UYWD\OTfR^!U\C-m#VFqbO4hk0(KRF40,1#G,1LN=@$kII&N-o*%@k1T`j?8E
e_h;]AmK=au/tObf8/fEO6pNECBhLIhZ[2.d>/s?s1`,'(*[G[V"$JRc/`03c1_q1-GGLZ`]AO
m>3$q]AA(Nb@gXpQq8%J#(Y6+@G?dKepSnC4a#f\<C@3OMrX'bhglUQUpjo`$\cQau7_<<C72
.TFb%Sk8Jc%O-0G>Gqc//S;k:li#EXG[S?INJ4F2eaS,lW:uPTF-IEs7S863X;V^<k8:G]ABl
jupp4c-1ph>@X*T:oqD=OO,[.ET-7pctmQ]AP0P*Q?E,B]AcYL6o4d3[a"ff\CHkF!BKUjL0Ku
5N?if$?u4Q_lnm'C@ik8EZB7Z;F[>78Zsob8D##thRaYRmQXb6c2kXqL,,emF%:obZjlB/>M
TpXJ!/Q,=]AtSFbXcm[q:'KDfKujAMCJ8aJ%hg5(_8#DTE*D&FcZDC6c8)F73cm@s*BA-#D2,
r<UAR)_+Pr<K<*o)l*OD+%H&g9?+-"a6`Fa=SN.=KZ*e-CFuMCenuLVkIC:K#3d)V9pa=2(Y
H.Oi;G%Ok'i6m'&+6Sj(r^*A>qhP$dPZ#Of6$*MIWS+i.("-TP&,B+>5/:::n;_Pk.:`AJ`]A
dmIsCK"YXciC:/L>h@Tf[C57sugdN`W4Y\_G>0j?bsqKHIO:'.q`+`?j^rsrWfq<[\hO&Qfo
5n@3Q7%LW9fg,Mi3=e'Z>%GC1H16I4QY#-6Md(E)7oi*BO9ej90H`UVXTn<mk"(n7#ug^g0L
]AQ"n9$!&B5ITTQe*Qj+CAJG$gSU(K?^o26RCSDQi"XqH5btlU!g0t9m]A:r)]AbO"AWjncbI5c
$&fT1Zcla,g<tjPf!:Y6k5&hn/F@om7e<:3JTK@nUSS+]A$DQZ\V#?AFkjoY]AHO6u$O3+)6E-
fD.%Q2B$FiN(<94#PLPd"YeGi1aDiW]A?=%VT3BZ2a&N1rsXVbaMY90-::K,p3PQtT'Jl+DjY
*RH4Y5+<bG']AdUE.rV0i.iPG)oI.^el_/e`M610rCO06=\,43L2LZY#&#2/HM^Vl!on_iq^7
@0tTD*^<U8:_#MRotB3CP=$'VKS,tX@8fSrG%H#">ZJeTc8qZq]ATKfkh3>Qg`V6_\I^;1cE*
5W;l/TFY"<kk7UK3@n70$o(bXkQkD35mZ$pQM,#bA^eS`1_2b6lp5"jjOL]AC$YE46MLPC*nC
ZkA)kV\l(Gt,d/Dd,[GAq1umV7dct6[p)]ABQ>J!DSJ)RaXjehJB0VgKu<?5E9]A[M2Gf;Z"LU
mpoOh1Oq_::F,n=+s+IR+*E^9tNO_6nlM/S-C$LO,88gE*jLTT\PF7Yit"o0%-M.aL%gm+e.
#5Jo.kpbA=;Hl\9;1--$+p(\lnKD!aT74]Ana#0(ZUj''tE0Z`/g+au&!JNn:uWgRPald`C$S
%HKPn0iKb\p=>%8?:tQJ2NHiSlAhMAl%1/F(Nq'_!Uo(4chWUcnPhNFLiAT=s1;^cod\PU?]A
GULam4cdgDCb.Y&':SBW-']APclSoR7JsL$gIDIl2Eu_+bOH5)FkRibMkRb=+1%TI)["On&B\
&#^9`dNa!lb<U]A9Rid.B(8^DlqZ)/$#g]Ai7OcM!$LI&[(?c\g`:H%KHW5ng\0\#,Y[IQWG-h
I=j)IfSBBbJN8@#cAms&<ViF$O[31(B'V3R=M';s+8th0n3'ci2YB<c,3SQJ/@u%L@U)ei9)
L^dR5rB?$f=95(#lm*D_U62CF,Yd3I,WK^Ql>f\G:,kZ0C1&=#<EaHppHY7n0OF'^Y'01noF
h%t[<QnQkN3u!k<gltYDaFbDU@?Rr85#j2>ArgRY]A;117IC!0p$92#r>7.pgU6Ghobk7Y>WL
Yg@D+#P3YaVM7>;a[6^)dnZj@l)M9FdF.=kJ1!XXlp5h?S8G0on]A+iNocY4?qOl9BaD;%itN
FcHVLqSoh0jj73$]A^8kg@HW.;4js4ni&&JR@1:J*1mh5KbE4)-h>F-N_<k/MRhX85gq3?(RR
P.u<5FD6*%L`n1Lim7j<e.55YI,e$CfI\+Cbe19h\sE-=X\.A1tcTkdB-Qe>9QE$^fIse`/`
_n7`bl#/b&!^&)Ec\4_FYleX6lO6G4k/n@N1(!!Q[4V(sOs2r(dQ-iK.kj3AtnPmXq3R2n\.
h54nBkFK4<%t1T$o^EmIpF<K.1AH-/Vi\L\KZ%_a.!51l%<CTONHKj#MttKsqfKa\XU$_"/3
?##;-<K=dFu3WZ0/dp=oEj_%8,j/<`[H7#Zmoj\.;,eMJ6:fhViMJ2?]AL23\r-P#/EJZ7GnC
-0e-*N5qboJ-b=Qr'n`AuI\bh^A8c?+jeZ=jlZ^;R`6fXe0CC0UN,dC10E#5?rS=`V&KRa8q
<J;N*UnE-ZN(#O%A5O=oqJb\"h9@^^NF'E"VW#\,E$jfC@+bX-`Q?/fb+\E^4#ODr#$_.(_P
7RT;HYfZR3jd!]A,>S+fmUuQL?S1Ws2oh4II:uPE2\p%[;@UG<o:jOLc"c.ASUUl$1A2Jl>_3
=D<Yu(g@C-ojCYM6F7@M/K<o$lhm=b$E-%FZ&TRt>32U@BD6e@)-3KH>)lERK./\ef-!ag/p
7:kX`2X%N\>`Dr%lGhig3_"lFc:N=d%22)af2DB>0FMTH15*NOq(0;<dSrl0USrHf@@$7"po
Hd$8SuJ!BpnDAOVG+N^#F)=MJS&@*@TQKVXOpps8DYC,l9K5C<27hJGUbJka)N>to&fTCW!p
r$oXZs$-F*SZd2!crc,/5-PG85VZ%G;%iDq-ro,)U"WLG>;tHTea<*G)tDRh]A`/Q'b4aJU1P
'..[V:FJg!>"-(rqS&P'Ro8begJ-.ptLc*^*f5ohlRWo`Vk9&C"]A)Q@@CN_jr?3$S`)d6ll_
VHR9jNKmRa.ti&S)B\!Q1&WRgf'$7(jQV?a_U75fMSphfIr+M3PrO>ZT5OgL8.&OFIkeq0?V
CQ$f4kR$?3Qk;fPsdf.%qI;77>?oUVRY18%ajq?iRf%ac;\>K$FZ4./npO3D#[CQW<$<fb)q
@H8WYo55VqF(`O\W#i"(+h^p&OBmhV-bbZijmuH8$gl8,5J"=G\/,:6WJqK.0]A]A+mpkF.]AqM
H_$;P3LOChaDsG8rZa-Y]A]A$2YVqI'V>02oT%s]A/$WEl*XisFrW.f-sInNGWH,+'t]AV$bo?=l
okDTX$JqeC:b'8QIl8hiV?/"P%i1-\(Ns58A14hn.Eg'@'3(.4<.MU]A'^/mPMZhb'dGN:Ge5
_'s@?=o?sJ5:u=P;*`M\-DB:'?#eZUUR^T-'X-1$i4K(&";sPH9M;=q-sj=3\o`;M3\5'*)V
6`4Q)-n3c^%>149JNA.@"b9J%css)I+o-[*2V7c6pc$Xg.c3E`!`o7YU:j:c>[3XN0.4c';]A
MdldX2mRK\S\*'iNFW/Pi<Zk^%ZdmE+2a'CORX]AP;XQ\+FM=&I'+M[#TKq0pI`?6*CS&5D$E
ho\)Z:nO6VrS\XMFFL[#8pU;bJ.(,[,s4>>O<VDl-s1n:II=!;J1H)GWi-JfVTh\<R8<ZhQK
:qkpUL4o6OYt[r`=e's.X*Aeg'7X!lePbB(!i;M8HP:OW$\0C^ul5K>nCq)9t]A2nrKTiq>Sr
X]A+0KOOp*cVbfB&_\p4^lA5(@`(^`;Sc3h(UX/m@TfeD;p/bPd]Ar,W>0-"q72mRS1`B3><p)
!hoa=m,"rk+MGfOC>#MkVMPKGJPQjs.+Y:O`Y8aYU3`#kR.:J"e1`]AZM=1r48Bp?cAgC2""V
W.dt?Z%V]AUcJ)(tZ79G&`(;;Zns&133$@eud5`W'!+W6PndC=FMl-<Rp=:R2;Vf/,1NU")U/
,sEcPpd>D0jKS37=bE'6XlL?)PJBa>cm0+$3?:V=CLQHN3f![g-=H!R"ta7AKC%;N,IDf/<c
t(([m([-;E'on9%T^@-;(\<nHr2r/JJj7#eI"[aW!Y/8Wb&VjiQ6+B=m_lPj?.6^"!X$(LD#
cDKY%'i".>]A'r<Brr(_G^*qr78!N#j8c:SF_-'.-GigQ.Odq3EL<qA!#e-s!.TH>LYEJXSK8
oo_PKbJT;Vqqkj$O[d6kqCIcbQ,'XH0$`[j4noAh9*.83?)GP(X?U;_4,0HL+)d6njHspT2E
,[B\//(Su`[0^X)`1obHQ"n%ZXQ6qCs=Bo"*8s?]AV?@0a7-nKbhbP()9OZScMEn3o3<]AYR8?
OL3mHW*IBG1P`J1Z.%Yq2IqdBsc6';EYO:,DQ@MJK>qTV?tu<F8KN;$ZX*7Z.N37Dfk>7V>i
''E#.k>(.=%r]AfnAUjLqBFC;19i(t/el^+s;7NZ"SFDF`KtHJ&#I@$iTs7O9FWp%(V1N\t2#
MjU]A]A\nh#Ok9Dc%V6I/mc&:1`HHnN5`"I:Z'/p]A(7,Zo6^"/lY&ijJ[ZLR\l#ZrG$h^GQjW1
*IZ0?9rPU"[(u6to_\n)YrX2%3)bHD>-&9Fs!IB[3dOQJp"^>$#qXp_]Ai;kc2Z8Vi1kkABP`
b=D_(#Vkb%\pO1P8cJfrVb.qaA<XSE<kb/'%\b`/$K9P-tnB\[2qAgr946gbaT\>V&QHm4WY
^!8"nXYb*A@A\XPikiHpY1&H!)JY\TaiY@R#62LnR\3;6,pe%9@@R+;aL?rF2.BPICnYic[V
OY,fR^p#DQ2!Q9P7Z=s8:#79Tq@9,nl%*B$V;O("e^,8DIAMY-Gd9:O7^[Z5te70Y]AXX?7lN
b.Spp'@gqks/3R!$u7WQg.i2jY`>A!dMrBU&K!r58eN\2Jri8p&Hj(=5\U9D/I>9d//0>%F9
mbU"iNq<4X`Y8#Q[3s2,Ze9kTL6U?\08gR<)-]A4aPtQpUc/ec]Ar8ncRs"jlb:tSHQu"opVAY
D#3SA[IUA9Z3$+\E+0qHd8PZ$(c:Fh3k8GS.pEhc;1IG$(7+'J4kpik0"FBV/8f*dp['UU%g
f!H94.G[W9FVBtD>-n3KuWIApEJg-?H#7n"#Q5:+TuPC0K(TB3iF`;DC?+;*1TY3f`^L%ZHb
jQ3tAjJR^/C+pGUHl$uhV*>A2Z8`k)i[i;>D"0@pWXCUu<(KYSh)=]A=:D\+rm,lBX_B7*<]A3
k\qm5hTR3idU^2Qq\Rl*MWhH]A\2h+-Rq,kV%?U6J4`pF4)t4HegP>*Z#kncFft8c!"l#7X\Z
b=\)]A?-p32u!,a^'nB7Tt'OI%ObTbP@Qd;)o7a;H=E,)4:I;O^b;F]AO#"WRedNF(3$"*qOXh
9jqei44653Slt0G(.->V<^j-0QJlWPjE"Uf2:H;,lW8aJuhPs]Aq76Gcj%FD.WCj6Hg]AMCq$0
X6V4H%Vd<=qctL1k#<J`jtBF,:#hhemLcPb+'PZ9>28e]AnlcR#UO[/REFf2OS-YY3]A(+gM@"
4;Sp>pGTmGEOlG"l54tlKp1hFh`HB='OKJ0-Aoj,-AE6f9%UQcop^:1t7-!dem:'k,l'16sr
0+5_]A;9.!frFeIfPt0!01`"K>]AJQ-U":Eu%-&mU6()ar1!_)X*TfdALO[gAbU(pT)"<LhU]A%
J2N_UWkN@P^7541P4\PL01/Ec35r>05?Q`G*7=i@Wlj71.,Z<*M/7WB0USV*H8LW&!s32:3r
^iDlo0Z):dXQf>Itm<1L+2IHli*$4._d@B%BL@G:(fG?c]AFb*=X=R=[A-LtDqSrY<`81d!mE
m#q(pP^O:6U+<0c^:^#c`[l'(=dKpRV0Y=Um&MOltA<mON5U^g\:a5irnqP4!N&?flfZKP\I
gpVR/jkfr8i%;Og"AM_OBuR,KlpjU1XG(!RsQjOZl!NgTN,=+XW/ES,VE/bt^Je$!3Gj]A0J4
B,D=KqK]Acpp3DBTc*M8(Tj&is!tfBL2Vk8P6O<1e=%K_2:3!V$^brHc3[Bu(jC:m(/G:>L.i
]AaA<7Y0>ZiOIQ1`M1#'u,qG+&ua40JaS`bFB<o.ZkBF_k*jT\6c1UDI<BBGOg!P9$,KW$l]Ae
k8j(I*Hg&%KD0Pt>!N!ef%/)@Kk:3d#']A`c,-0JL#m-_XUSgueuoM&]AgSGAY3SDLEI&rpOa4
6b1o6E);RaUcnk#;\@^M]Al<F2EWpL]Ahm/lZbbV#8,V_d_*b45ZXG`2?5_"ipF@5%%"OH-X"t
Js(AODdKt-<KDFV7un0.uHX6I$eHdN`a#c@:c1(qXsbors%X]A;kMiG-BWgVgH)!@KB2)rUp+
rpdUho'e826,cLYl^V,'/FA+'H8JKU1/Y8fS`]AR[H4N+441%1Q!YK`jUBB6jeEfV+L-0lCN7
mD>WC&S1YI0Pe2=qM[5]A3Wf8(Md7*!(7ff$mI]AM?QcSkjB+8fsG1oOV9^1KD<fb4>7BFppkb
4a/?U0<V(b8X;X[m(IFh<NIe]A/eg7Z+1g.W<k=mjSdmNDYU4`R(-=q,j0aM*)"AiNjF`d%/b
L1=\P?W$\US&!bG_CoX5[bR4dTNTMP<Pfknf/QQ<n-8?qC<Xe+LJ0oTA$AY.]AEbY<Qa/%=Ot
.AJ^RD`RG<R0l*:t=<EQ&QR<Q6SVsDXC9L&!"-jR;P+&M[=IB8!D@r-B2=kN-r/"0l&RAKX@
?6ruj/:(q*;1T"'G+OVJhT>!DF^B2DM^bEV$jHK%iHN]Ar/-:lDGbQJU%."m!;3i6b06"\1$H
!q)W?VjLm?,a'[+c0=;dcT!+EY]A[LVOY4rNO9`>?$.8R&4h'JBcAZ&Ns\e',Rh?frm7T?hcn
BN5EZ-+0LYKQ3sOKKA7K`pPF;tjV%Z3@W"r7Kl-ur"`[/6<^BNVOka9:#blWId<;s5Y"r\k+
u2jP?A('4#QU*E\eK.&3_B_=j4i!^cO-IJ4"Gq$7V.5$fW(+@gl3-;RhS6BeMunrkI@qIhAW
@[g/bQ:Bu!c#([/Cs3^[jiP?JTYr%RJI-5/FRDk[Y`.5gUN#r>&!+(uP[^CAUX8f(!q)3npE
FDn54`ga`YTc@^9bb;]A8egBhcYMN=dDkVE9,q'rNF0iF8Kf:E/6V<`,pOSJ2:);iJWOja:r8
sN<r`/K/JRn#OcqhX(bKu_9<U@DS5jhr6!g+d3%3[#]Ac8t\dP6LdsYB#D%l7JanSs$kNVs$C
$*#jGmaEe1lK)<F-1Cg%5I"sIr6XY73PSOYtW4Se)V'WVF1S(m>+@>7f:.Zf`?K%66+_MiJe
8Vh6p[RhC47DQM54rHI=P`'@:5[-4c2IFM]A7?0/3n.Yr'nqk1Ne#TA2V_:\/pQt:$4PXIDI^
l@]AQMq,rf;#>9%t^B1I$o%pqCu8)V\8an8a*<V4uiM,fBoR"D_R!&`<Q!n"j(YOmF"g7gH'o
_'pV%%U3FQ=3AgQV2Or?WNZW%bp,*$kKJs2Btbd5E_W6tP(/I)5<A97H_VMJTi868NW3+QlL
@cW\k`W2E#nWNnhfg4S["f%Zm&KC,)`*D8UIMT>fEo^b\kj'7"BOnlo8X^P[Q_"8=#OF$!lo
j;Wp17V;fkt8BdOc-/(7V&@VG\p]Abgu?,]APZj-1E@Aice[nJi'eSKnA^U0<O?7TDNU`fe!hn
Vt"WZm=IDa]ALccis7<e35P&6rKP`)*+!O=P'*V(e[u>jB8btmXuG>[U-SuImN,BVWl*/"X#,
VE#+)]AW^?J1=egukoa<+!g<M")!70Dt)XA?>4)JW>]A,i4&6DPDpMC^3&LX@@[>RWmLo(a>%M
H2D%.&WDf&_[UsZG6Q?9YAq*n_BY?j'OpS8E5mTQ-jXook6e8Zeb!hk1O06bS$5KXoX:/\*p
$T.l%6=Fa@[mI/RLI,i++&_5=f\U!3"F8I_4>%I]AM(\G/Od[U'R"eBMkZkQq8k!GaY_7M/J)
=&uYVqbZq]AQkYbq"2@j:[qnr@.=+uCB8WomQO*W?\JnsQfNt7sH1Q)IMB@"UoUqG-UUBh@8D
B_h_Mp*JK$%<C8`-+V7lp\BU?Rk>3Dh_Nl&J7Dn7DFe,.?3"'b7qkh5:H3X1LF4p".3TUG'$
D.OF.c]A^IC3%a3@3OBq3JYL8*k&C)PSFqh87G'"OSDR@SWn:p'H_`C44,&G9Tsb,_s$=@ZgL
'puXB,eeQ=KN%G(X6Mb\h7&'Dm+d<JXnZAO&sAp#^<6-j9"W<glE+\6KeN@gs"C0WKmtVp[O
/\5L(^#>!GOJ[!@kD?Ks7.Wr4mWC#J(^V\u.<S::D\@T?F]A]Anm1S2RuOfoM]A;!pkB(0#%@RW
$ce1,4=a2>YQAHOROX7S2:LnN-K8MrJRej?!g`Z$ca'&77H%fd`Y.)CXFuLqNb$mhp7iGfMb
gTsQNqB?k9%g1&1G'!?WSAU.m6</u>*<JYAnnYa7V\8:D*Z;s4i]A^D[^Yh37dhS(B<?t7]AI=
^W20!<`ZI<e?5<,M4li=m4Qe[ZJ>1Mq,IrKBn1kd7#f"=_lDDbV%`mA41UN*,G/>-tYko6P7
1R#i%dL?P$d-Yb\W``)8O/ZH(QX/S2%Zu.pS!oflj'IEMhs]AC82AYd?r*KaVEJg/a^7n6ckS
G[g(p[.0-fhD/J"'GG&K<".V6'd'%)$,kXLpMa^3oUfb,>L&oKhP.NWpk8<FRk/mF@b_G5s:
e"G>DJ[S6C2gRKU8>DDbu1k""_VeR.dF9]AU6PFCk-@Fk<dEnPZ^k^Jn(kc/+R4b_Cf]AUn\o9
4roVH<jL]ATH-cFo=AgUJh]ATpGZPr/$Q]AauGM<j/4qqD<_./`<6V9e22U[aiJ)B(`C%ZYN2Kc
$Q#)NJq3Y.JmQk?mZ.o#^ZCj#i`S<"[IoDQ5eZ.hj&1%h+bS>[V5[ZcmL-=cp)pB8Z;M@+,e
;+WlfbXdmWg\V[Rd-RshB@1-^Ikb\^3lDfM3T([a^XbEh:dcsU<9rd<FJ<BVm@2^&!""7mk3
BK,Fr6'Ik1bl1_5.lU8l$=Gj`M*;<m8ZkPe.!ZH/9q392YQn:C*kSN@F9!k/_Nc,chU62W=\
rdrVMHb=^\5_O>H<T#3@M@!Q:C98a+C&7?3CT6?]A7a)MQarM,A5*0siEr".0L0[^VE6%Fq7Z
O%rmYh#F,Eer:XiJTf*!/4NpL\*QP+GsI1VHT+5SX(_\>Q!;6X\u:kAS@,L8e=3'-7A/aTV'
(9MOIMp7\02KUkmAf%6NAeFc(ocCC-oGSNa7u\h*Sf''*M8Z=q6<\Oun\7r4M"igA)]AQ9T+3
POjko9sOCdGnq_KY+h)+7>!?kbZ5_fA;9F2_?,mV0pnAk'$2TH_6F:9+f!411Th;i0>^2LXK
;-`b)F\kn;!"9Wkn%7m[<.[*<nX^Uo4C^$0LNM[7+(n>0E-_mp:A6\dPX<T<"E`[20IgKs/X
bO<X`+JpWO[We6q-/=U"U-Ss>nYe;]A@Sm)KJ@YiC=5">VueW2>cprNVSFP';Un+!FHFFZBl@
XXo"'%C\9+4E<CF?$&/gXdSH$@,Nb2pak5)_5#p_]A.`l't$PjaoY&m=t<Wu(7]A0BE]Ab';G`0
u\hM.8)qoTaTel8a0>pn`]AY3dq[Qsek=JdenY(PgOJ`EmAp2(YH1FXOED$RIg/dk`X*5#df&
'NT.]A4ZRlg;VOIY;b$hKhr35:<f4bXDO4DZ:6:MQ&ro85TC)!tT$NO&q_=:n5PD9Ke$J1$MC
-L]AB@e-$M;)JRDql45aGIT,PohF^W0mFlD>P7D$@/Ya-@a:IO*D:YV#@Q%Jn_ohE%I265un_
7=OR`8I6J2>a\M<*Y>*ade0@ei0<6=P^)I@!m)diQ6A0sG)of.n/Ap??,qO35Q?iI7^Vk_j*
R!-U363*AC^<M:m;R@VLfYrqW$=*U$r&`f9f8sn&BKaYkc!%c&$/`\X;rr2UE_o-#\.M9ME#
pLh'=A>;EnDOn4^EF`Z9Ebi11s,A3PE:5$=QK-?Qhno$n9l>9HWkrI,RM\9>;aC-miR<7)"Q
<U6qL5OUrI%7]A+?7*5;nHe8opNakR>:/c!u':.)XEuAr1f;CmJCW3']AOWN9/+bDpQ=?,Y@<P
G/lablAnSrN^*a=uc]AUi3.Q>o1PF_\0X:.Wq0QHW%F@n]Ae%=6"7jV@$RYs/#m5]A;:tT'%^X_
ccQO[ch58E!gd[Q53XT%q+#hQYAIEb9)_;n8=:NpA1JE]A/:@A!)T9tM3JR@V^lmG5pH3uhsn
_MTn=j`+@U_UYST=-\*X9-\STN*FlrMG9bm)QUTWL##BLf[IYp,%6^H=kQ[Yo4^ZY;s0'=UZ
++D_N(f*IYKKZ5\;;H:B7U;iR,$0-$f$,;EHb"?u(]A_L(V-&gr4!BP86[0kAn(m%+TK""t/!
aS:%Hq]Ae269NH^123cBH3Pt7Fs)mKT5)ZA;%^qGUGNZeC=r_DJ;[l`UJgU/DO:DpCG@kVUJ]A
buR[fP3Zm>C<BP6Ee,r/;Tre_tX)EdcQ5TO#D`phA2fa0R#&0U5lp.=KZE%BLkY;rCmZiS)c
+Z#N9!Aq?mt'&^Xj^0[:h!81TD32f#R&@B[W'%gdE82T62BrDY^bLKOVQ5cOj(U1Ehq92o]A2
EPDDAdr'*lF2r!X5d/fQMFC]ALB28FqqL]Ahm9"RZ/hb7#[fV$cPp0$6,jep@:*DXO:Q3DhpC$
V'i"&.UkFrLCbUfb16[+Uo4Ut\U/K?"+/sV;*XPH#d6[ec/+]A^fNggWIPQ*ARWnR9dMT&VTf
'rYjEbHaW4d"10I)LZV3cLtoj=M-,feJXXV+lPT^U#C+Rq7=b89lB9ShJmQ6]A^ejR7_ncHr)
V=%#i<k@*%b:I4``tq,&j,bQ/Kp0%-cEEB$Pj>2,-rOOUeXGei1,;<9Ag5n5VU=A5",R"eZJ
@HS#V-L3KJ'o'@"m^TSMf^ZI3UPU6^MqJ3JsaG\I&]AoJ+B1!#75)n[d!:B/d;l,2)HH>tL2q
4jkPRXlq7>P8"f^$/#tAJMC(+^a=CYBk%[Cg6Wl-fG_=V8jY^%b4lLO;5!'=#acCA:&'TDYk
C=jABcjfZ'h'</74+)^i/M^O"^5J98groUAN6PWH;!WE26s1U[$WSGah8FQd.*IHr<Ubm>!U
hG4UK20$U_f`cP##B_FL4pDY[Q1+5X<K3pZ[Y4:df,&+r!B;;$XPF@m7,N_@1EDN1EPUj115
9[ns!OOu*a8nMRA+>=Oc("&<)*Nc09Pk2g='_g3A]Abh1p!PVbI]AG]AQZoZ2G%r*$e8;K,X\Mr
cBu'JB(Kh1hFZl/BinPFpiZ!3HR!4be5qO1h"I!U(`EiJi*M1X")"c[NanLlX(0!BQ4iHLBI
2(Eq%&GE\$^b!2Z9D>HE;0EqT!Q:<\8idRPhe'd5k;W6=PM%4K,ju?a?Sci.Xs1jDg`bdq!^
q/:u$421N)sbi(Rr,r.)0dJ#6\j7\n35\j&@VUN'<GN3g&(&tRf"'-u;FPotm[]A(nA5OoYTH
[B[PP.*jZNBMEcIi/I*B?f%E.I?IG.T5mR_]A$8t//>MM%'t'=mN,2HtpD4^nr^4V@oqGF&?T
SZ;U8_i@'_d_UnT4+lWM'#Mh+&8U-F(KmmYK9h1$=dSqgYZB2E8u4WIj'5pN15t6*d"-WW@I
I:BhRp:Vf0nW1d=2W[s.3Se's'_pP<N:4/!-r5u,plA66'0e^.W9!hUKrgAr55KRG1GC'/$H
J<dGJX8!peh*!XPC)%fn(e7]A-oc6bWgqLgibqA7,O@b]A%lUg\:Ug>+TPf.mBY`X'[,5B4CEH
m_iE2W6a$dj"A@^uIcMjN4Sf5q^T!98Ws7#SAMKdH]A]ASs>\dE3>HLkiLXh"'%@/Fh0pJKrV"
!QLeAEPF)6MaU,@Vi_k6.?.gA$HNV2CIao9dhC$]A1t*<OZg?Ii68s8;Fe'JI+:\PLX7&a5X\
gt>p%6lo4ADI*'lftGs)>&6:0c\O.\9Ms!Qi1ZMA-`XM"tg>FPs5J'mMY\4^e"l58V')dP`<
?aEY@6"Q2k=:(E`K6JNJT9'e@'TZ>9e-s3!:Mc,D*\$K[:-l;JKSlnY6R2pD&UOZ+,/bEl(j
B`>8V0liXg?DhU!d%UXe>::bLr[#n=@A0_ZNa"M2<M=BN,&Sc]A0]A.9X*p8Ur'@c?0li6JZ-2
m,Rca6<:4dBSDCheX>\`q]A5Up)(D\?6X`n)Y>q`cH5%^OC3,AJj`H,l\W/9gaJB0/;0K^L<U
]A,&2ZjgHOG2DfY1k_@C9CQuck$lt:-WDDB?G^[j<\bEKV3b@kQR0j&P#_l!V2/@\LEt*!>+^
[2&&1ENM<Se8cl*?eq#3NEE+ec)9jU=/5HGBk0>"Q4CB[ne_PD]A0%6kA>.f5T(/@#aW>OSd.
_I!d-SA[3bMSjhSA996RQZ=0HW]A0=d+cs:cLV[KOlohA\`[6`9.bA&jH3ff1'):Ees#6j7``
RYYNQ!/eNm*R1_($;:9Ege&[q!&G%EtOC2Q&RP(@bG%l?[]AUHCMi+/LHFYlBN$;;01>K36<k
-DPIZ)O6\Z's)rib::_A;g+VT+a^0c3p*;2_%SbiG4a\R(JY2!&UWgG7q@Wd$d8SHrN&k>K\
R@L>*#b)S-cijrO5=macnELj``8AiSK@Q"qXCWCihFN`$UI0YY8R%^q11=pb"5aEtZVXrYA+
O2*5F4oZX`+[p[V8?7p4?IBjt?_7CGj,6?k)HW#3[kLCb$IF'V0nK/c"'pXN/Y=8W6gIVrG6
R[b]AlcVrG8T)O&WJl:!1HA[*'*7%Zg+DYPRZiOupAX3HUo]At0kA5t%b3">Gk1,NW]A8[<HA'7
bG*WK05nOR>klfce>Pq><fH2U:Hi_K]Ae#kp3""BDRVFF=(?I.%@LL9W_Li@iKUpAS.>+ugsm
JY`P$e_aVI0'02E$1LkV*,$qtB]Ac$^aKNcf\^?,OOY0H[qL:W?"Df<g._8Ql$P(_(03,?COh
gcV+P;[JqKWe61h]A\4#'OlI`IVd1IV\'RMRNiM.%`(S#$Njr1aY_kU4W7)u;:YnHuq9+#g)p
D]A5b0(3ag7LNgC%)P%(ID9@Cmj;5cWN<Cb_!^IO^t::okS2b)WCX@hkXLRlOAX'Yqo^,"Q%f
a)7k/5q,r&DM[O=O\_8aLBa#B:/o*MBD=Jkqep,Nnp.h`D!kO(R96fm+L8te.Thm>7aQj`.9
:ghXHIt`dFEkg3aK8LtE<q4[4Cj@9R.5"eTt&%U.AVS$]AIW'n/+$Y/;CAalVIXj9@>s_MRCN
Wb+Oc=a?Ao%ZJ+/$PkK:(MWP'>VG[p%,2"UO,Pm`:f5P8<Icms(uQ-j.NY'(0E*#H<ZVHE:W
lJ"DEBf^;D?#mMtaur"pgsRKG[i)L,pJ_R;UI"bMRpeV[&[.+j>$/A0:nnMdHH>CKiORtpN1
;fs2T<S3Ki8>S)8S?%m'/_0AB$(W'Z,r(;]A4oVo>lm,fZ+ZD3`]A1safD,e6[5FnNp)sO`]ALY
"5G.2M58*j2#JG)'W;a/_hEuNRZWYt0-n-G(nUQR_*,orZ&d<`E=)QU-J/-FLW4TQ'`t54tc
Yhj:*@O\?`itfc)qI*<?NC=VMaHQE^HpQM#)kC+g*]A&<"5G$t/oY[O26N<*pXjUi,C(*4D</
&+YoCRN4_LZpdpW-ef.4Qp[mS-,<l7l-:u2p4T&_GKn!c_<\_h?_m!.I]AY[JEdO'IYlT'clo
42!esGXCmI+`J*CcRj`KNc`cbmc$t9&o["J'[F:;:<B;M7!DHS$J\XNKKkgKJX/IqAO/o?Kl
s/Sgl5PY)pM62.imMBO!Y3#n'ko8U62!.KqL]AY\3V4q/SkeZ&Nu$7OMY/e1^7!ZQQ675Cep'
2aK]AJa/pYXI8k)Tsile_dXqqJ(LP@V)C^R[u@fI]AC[7neEB.)icmaf#nl^`-J-1;hNeP9Lf!
qD67:fY$2`(7%=L*Q0BOh!%3;Psgt5`p\7bCuGYOi09&KR]AIbo/kj0L[5)P0%bZfC9p`UBD/
rmgeAT#oq#6h<A-<0i,+Q`;'OU.4J5\#cP.E//3cnR'\/+URU%^tKM0<@A!$2>bqKb_pj)30
9@sX9800.VfXiq:mhpRKg(>5ud+.i/fClOUTZkATDnmIh-"M0Te:2G*cMNu2XG5l.ILBF+/'
3uC@_BcK2t=!HQP3:Xgi^b/YJiI)Jl<>>'`%=+p1Tl!D1Ud3Q/Kk^aWL91NO]AR`S,f5Zc-*h
"9Z!61j*j6d5Ir=ai)c\Z=iIO"OC5oYo),JVY&t#YkjYGIS-AR:1us6`e7@FD//k[7(n-[""
%cJ=9h2b2H'IVCT4cs/Z'A]AC`sH[PHCaOD6[+9XHFQ^bJC9OFm[YKrEVnG)nMjK$S0A_,I12
4jc4`2)V]A2T!#D\eP6W"Nrq+fK#IA]AUAB$r&,lnEog\qo0i.F+F.X,9"/52)+Tpqu_W2(!iI
NETI?[[dOMKdj4X0__X<W#tH@K\kL%8J/XYh5R%Tq&`d(ekO2%$El6soM@Qo@gos!j&'`bgc
.Ba3DObS%nL==^T2#E'ftuJHFA8r6/NMJ"a27H48k@>kuW6ECR)0%#..`,,H^K#3RNL?k8D?
%io['15Kc,?]AfbSMM8LG$ifl=Z\fsctMJG?0g(A"$Z/lKLXmCop/1W:5.@De^(*/s;T'tsTl
S,Bbp%.^J.Z4%%KAoe,[X7AHo]AUSkm+Ks90X?VE[mC;P".=EJoU7r&0oRj%q$6?dS'j:mX20
=YVrq$0PL3Uo_=iOsfA@@J.0/i+4C=+sgHYr(aMN?mo9Y]AK5_jR;GXq%.l0\1VKJg=?r._3B
8p4cO[LW/pm//(7,)>!Q=/Yo/eD>VqnU0bR1Fom?':p3K@VMc@Fk=\Lc<7'B'0r1M0/3X+^Q
cdd-gD#'b\gQYrmVHoPtB7S.>dd\E^)/r8A^:qk5=XM1dpg\K9q?pJLMP8T(+hV,`gG]AWG+A
mQ2\jKiH*1>b]A:h_5Q;o4CbU9DGEo,'?fLY@o=CtN'pA1WSeX0iVqej%/dAB05%qY!\JWPUf
88BKh`Co/ftd!K[tuPNiU`S#p8^$"s"&OV#nRXZ&8s.ed^k+hI.9O=^4KSYP1;MWB8EMC6UD
[=IF[?KZ_M#u1Ge7JP1j)7D>6srcV9MuS7pJM`#J7EU6'V*qX*m*9M9r#9,mk%'qk-o>.5fZ
pX<g:h=(43^0L]ANn4qiIrUq,/,bc["I.9Bi!!\_&R5$>lCR.j]Ar9%:b/(sAlIm^9b(O22@f,
T.&?u<U19Jh=//U^2[I-9>+f9*Y*d;WL*f]A(pTTtBZGi(lE6VZC4@_fLb1fC<EH9A!d0:)A+
*s+XYF/Zn?d^FXhW>k*:_YEq4l#D)l*m;l`(o[5%:A`W)DUI`AfILJPDF@l9$mT]A,$5@Lj)n
4KJX1W]A>;JUi$dT&c/0!e<K9p]A^t*Z3XS(Hh%(gBV(9Fql?1J2]A_dU3%fP\8bQW#pY8o?Th?
Y76n1rCX"DHNLWnY"XLNL>/pn4UT%LDe8LBV$%D3?3>HfArnE<5k*bFGr=q6.G`rufMQ7ur=
gX!IGa0Vm`;EnJj''i/gaZcAQrSR=u91+D`J+YHSS/hQiZ]Aq;Gh/F;g3VaE`$t?E+_NO9=@>
/04cVaE*W[1ft$$E&;NR1Qsl@P)4%>D,e9B\\.[tH'1Ec;b,2d$322k$#b*L30"4:tp%!NPs
/^@H4-rn!t6;/EM:(AT6p4!jGB-;o%aj4'7-.s(\T]A$96ceF5l1G#CgucY$r=8gVV)#F?W%%
0;EO91&-0FQ=(&r/WJ9>9!YcKU738d*BZNQ:1]AN"LaWoDmIK7;-a*t@uh=!8P`.^kX7=6Oqh
%-)t/.lAN2KP,YP`<@<IIKdZeU*i6J/ZR3t`0N)4B,&n\I:39>S;Osl.BdT"t8.+!nVGdoS*
hn6AXjSp>jPKCY+kSsn1[^rXV5CpPX7OAi/55T),d.Qp]Ah-$=D=-:P\RbJd[q(Wp%PD2^7l6
jn6pV8ZBik`Xu1haR$IG04\(EhYEVD28P3Nt\q^4C(C*r(*b@[_:"V$A]AbL"kJY"eGMo?A%A
[hJ_m%(al*k#Gssm.!1P06@\G?W^@1r7*7XMIbA8CA+ERa"O6a$V@R40YFj=m!e?;M^\m!R;
AHEc5IWf+JbGR7Id';NZJ&]A(qmNMbKJ0P,dYi5)Fa@1bXdkt0b)e8O'[H$*@\Cc.huE8i`:9
n]A[rcUUdiIb89H*L?&$lQLJG2/qPAcb-]A2B2?ZM2OU^'r?k%0eLeP+)/(dH3:m3lpc$j/:%q
OC0K/-KB^UVdLNlj)Z<Yn[0fKFaQYCf8cG5$J+VCY:YI&:l5h!aiO#q#L1O@9IL^+!FUD$?/
U4[3Yq&0>.o(Iq+R1js(tUG#RDiX#oXo.-E#bZCF]A<0N&Oi-_#=Xhb6S7P-R6]AKFFV//m-f7
o'U2Q.@QiV.+SAahSQT_9ZjKts\+L<#hf)ECSu$a\pXt$22sQ0%l*:jqhe\,GkK'3BZ6]A(G$
Y>56.np4^P;Ro_AI`c.AGGTQm:uM\V#<AW%-W*MIT(ne#eU33j&5^*!Z/TG@LlER3CmK[G@A
[M^BWYBn:nU[mJp#Yn/Dd/4Aei6^M*>!R)UCmRZ/]ASZuGac5DuOD8u:`Q+j?SCGjC9@;OW>P
'ldUsVq?Og7XhtL`l]AElNgPaaMd;NLBRgnL8TX$(jL3cIfB[IC^YQnO!-8\k*PQl.^e?.&BH
iOf)hKXq&B2E1pM^2_NU-JNimG2aj5'_bhYD6+Wt"6_!B;Klmh5$HTcJN"6N:gJJ+B0aJ;rd
_>f8b8(u1f@ZO[%3k4`(ZUD,KLh'299*H%9$S-kYUk;.a&1<@!o/:u.hmKX6%?("pm2m`C)b
cVc758Ct7pL$o9+Z]AN:N/=hH(3)lZ;J]A2i_BNgks4TML:TgmseahsL7nHe%6.E2D^9WAl.`b
T0Z'+l,>:8%^>KIlaI.N@p$A=R60&c7!Qm@#agF^XV5Kf>js!MT)!@9X,6%)tb3<$,t0:p8H
7T0`+YF0cMXU_Wk!e75OoIun<!VEE+GIr]AHr-`Vu(Q7u>enaEH%^L]Ajj0)A#!L&`P$@hE7Ur
cFMIuE$!%t1aB=V^oD?2Ut[BC[cSS3QAnb&S<P2i'[Q#>_Ks_;<Tl'q".,n;G3ul*kbu!DHd
JDetK^_m(=#!R*_)>*[P:Q=q<<IXI")=)4%P47G3!qrYhXaUVRoq7^B5jA.TFfBV%dIO4dVi
p'nf^0sL=I8f^G\UN.U&\jf,S4hoR`paj[4Z%L=hqc6tIY1.%T`B<M?d9Rb(\I%FKT!Rm8Ms
pj&B%g2@q5D&7&',+jM.p5/V8seQP31N(P`1#-@@uOH`+TW5%8dH-O<$832-+)%]AKC'1TdX9
cft?PLbtTZNDY!h'F=`+1sZ6X3EMNsVXnRLM\)n"[On4LF9.eO[\$AJs6-k/d/+t`^>&:p*.
ohsF2fOhC9m]AN&APr20u6*%K74iC]AYfZ=9G'&rF$!Xd#=7V435os?73"/p]ATd5eCgg]A@e8&#
!P!A#(QW#XSYAdJKmN0,C@>XX*_;:)pC9A(ZZFuq3p0R`AaO]A>X1!h+sA4>1Es&L9">_+lOk
:!\tH+jqr4]AH90J4@d!/HS\Ug40gn=iMZ6JEr63XN<nBL3R1YU3Vb/\F?:-K"adKOCs;M*!a
>FUqTTBMUEZ-/2cB:K/Z\/r=+M=*"67='3P8%ET67O@pM.Jp8]ANI2F-JL(6U8_LtuKb8`W(o
']ANT!(PpXG,Z*.X$cjSco?[EM>ullTBV]Acej\IB''l%T8p`'84%nC"=ORZHXH*&,KI?C&k:t
YuPF0TPeYH7eoasdGdf.Rbima!/a2a6D/3l$ZlbVG&Pht'q>QR`mSItqM4ZD!Y+>9K8pd2#;
.ccnY1=]AQJPn=S=-/2eq8!c3<9Z9<!lh!/&56bWn2q(,_.Dm9-$@$aH>s2%"PQF/A:`XfoUQ
i=C&YpbCu=eG/,/AgCA8_F/JJc(Jklf)$1O(7g$;\P(2Fc]A_VKYG`7,^\@heOIr97pE]AQZip
W&j.ACpDf`0NS%32^J@e!K!&f7f@_o#WC0ZtWbVs,C!Tkr!We5=p>JQt:B&"egbb)B;C/?Z/
oJr5$/Al:G&W%Ho8GP?snh!LX+R=BXbADR8jZ.kgG?!J\d'EgeYPp`~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="498"/>
</Widget>
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
<![CDATA[1008000,1008000,990600,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[时间进度:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" cs="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=datedif("2021-11-01", today(), "D") / 120]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" cs="5" s="0">
<O>
<![CDATA[5G绑码终端（权重30%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="5" s="0">
<O>
<![CDATA[宽带（权重20%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" cs="5" s="0">
<O>
<![CDATA[天翼（权重20%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="0" cs="5" s="0">
<O>
<![CDATA[三千兆（权重10%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="0" cs="5" s="0">
<O>
<![CDATA[全屋WIFI（权重10%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="0" cs="5" s="0">
<O>
<![CDATA[安全家（权重10%）]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="0" rs="2" s="2">
<O>
<![CDATA[厅店综合得分]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="2">
<O>
<![CDATA[分公司]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="2">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="2">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1">
<O>
<![CDATA[人数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="2">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="2">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="2">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="2">
<O>
<![CDATA[差时序进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="2">
<O>
<![CDATA[人均产能]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="2">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="2">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="2">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="2">
<O>
<![CDATA[差时序进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="2">
<O>
<![CDATA[人均产能]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="2">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="2">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="2">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="2">
<O>
<![CDATA[差时序进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="2">
<O>
<![CDATA[人均产能]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="2">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="2">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="2">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="2">
<O>
<![CDATA[差时序进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="2">
<O>
<![CDATA[人均产能]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="2">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="2">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="2">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="2">
<O>
<![CDATA[差时序进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="2">
<O>
<![CDATA[人均产能]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="2">
<O>
<![CDATA[目标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="2">
<O>
<![CDATA[达成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="2">
<O>
<![CDATA[达成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="1" s="2">
<O>
<![CDATA[差时序进度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="1" s="2">
<O>
<![CDATA[人均产能]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="自定义分类1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="表头-拦截" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2">
<O t="DSColumn">
<Attributes dsName="人数" columnName="n"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[结算单位]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="拦截数据" columnName="5G绑码新合约"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=F3 / E3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3 - B1]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=f3/d3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="拦截数据" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K3 / J3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=L3 - B1]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=k3/d3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="拦截数据" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="16" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=P3 / O3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Q3 - B1]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=p3/d3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="拦截数据" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=U3 / T3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=V3 - B1]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=u3/d3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="拦截数据" columnName="全屋wifi"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="26" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Z3 / Y3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AA3 - B1]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=z3/d3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="2" s="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="拦截数据" columnName="安全家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AE3 / AD3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF3 - B1]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=ae3/d3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="2" s="4">
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
<Border/>
</Style>
<Style imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0%]]></Format>
<FRFont name="SimSun" style="1" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border/>
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
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-855310"/>
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
<![CDATA[#0.0%]]></Format>
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
<IM>
<![CDATA[m<]A.A;qL_]A5S75#eFjZb9Ppp)hQ)Hib+-g^V-XkigHgrF=t2gL&;#R##-([<;/#8I&K)(\=/
f2V)C7-C8gRAi"/:I1$"Q"()$gP:%O^E[[-d8\5#(l;YOD15YK?P/)7/"CYI/iF[si,]A_m-\
g65D]A^imTk,DS_XJhY]AGF2`D\2Zb8PP*qhgb_64\8>iq/#Dnc3W7^648b?IT=0,ps'/IL67I
U[_$hhoaHQQ;]ArHh!m0$R/o9>uOq>Ibs("GEX4H#Pa<c)*6.[qc<F7?<,\!NW'DT+2fc&DV=
\Mkh;5;T<cM:++*qW]A,q>rb7D?O'tZLo5EX0RaYM*P3g15^(f)q]A%WL,,RW9B2n01q]A3Sb,8
:hJMN"@>*b\F.mH5Y;,nE]Aj2d#TM=7H2E**i)?jfFth1&5fS8^M6m`%mMo(A=:')-^cp?;<q
#=$]A9cb`ci&/d%_.(.qmfuM2i4c2GgmBH`B.WY";eWKg[Yij:>+'1j<B"DA`+GN#O\Td@cgJ
$rpsqVE=o_)#ouOFVg%F91=kU=]APD#lm/Fh;=)]A87N*c?FfaPnE(`hb`YkWZnnB=Lp6mB1[=
AjF^-Kp1(Rt\3k+1\*6&GSP#jZ$o+;S5P-8DXY[9kY^;]A=R?fVm2T9m#?FAkEBjE@;epMY)c
cmC\g#''r5*^D'rNKkga5E=.BtURH#VfB\D^%J(G:)pr!%^<=X'#ZTLqg?1BH7'h%8`$&I;%
1[5[@.fp).c[$KbAe#T"/]A/7jKJm(_.>Bk'oGjuRkfP71HriUNjToLe$U3.'d/MFAr4?T(WJ
NQ*qc?4$L#7!#5a);C7bG0PpEI^+5$)^Be$&pUh)=!T&.At"$BD2^9h_'u27PDMesTUU47T"
!O]A*^M4jD9Hftc(c2b/ad<o2k]AmtB:>#YDRr,LsZFl$^*eb\PC6K>%t"_F5*eCW;oYfKVqpb
BB!\hMggEW3!@?8'jG[*T0L`kT]AE+[Z#XVR*]Ajf>`A-CkUCI8T%HU!Lf^s(ecV8=YQ;'d?X_
q[dXKJCG%FZeddG7M,[md;cCK[+8mHI9RLZ(l`QLaBb^e+&=^Y%QV046?\]Ap78IG]APY7mS/$
CfB0`.Cf,rV7$G/Ac/qP49TI0]AlKZBp.ATG5r\pPHNPQqFU8*I=Z;h2k1nEF\_tY,(ac5m?p
S$M54[u%n"X8d<95N@e!Wj`)iPCE(2&E\=AN2]A?BHoRK?65<b8@(P'#1pC9RHeIk_4qW;o11
l$a<@l-Pft(+L"H_r3EAYel0==;Hr@7M=+G*18mPA!RDUeZJYQUX:*cSeWPU!/q'Y6Sr22!?
9#pHEt6$K&TdjGF;t]ACXM)j2S[L+Agf)n0E@UMt=gfj/m9^_4642"D&rV*t1H[qj,:PMcGig
M!mA!QfZX,W:BuNCs2<h$sk[%sTi9SIPZR[:t2s[^gRFA()9a4*1ET(_O9F=:oKYqMN'I6-5
jl%Ku/4UJoG;h[8W?:MVXqtNIfQKa`_@1h(ZH*Ls,2t224hde=na)<800m[O'jD\i6Rq__O$
aSqG#&15GqkVNbRMgp'(ZZpnOpT5kDt]A'K#D&aF@rm&aJ_P\+B)'4nmGKm*CXiW^ac\3`$-_
7+H'aa2Xnu.`Nb\W3cH@oh'%"HG`]A(LhI95I]AA($GgNn)GnN"+t/BZS>]A2b3+o8K+=*at=ZX
)g`kT^b?C@m$1Ti3Z2;e3)R`@%*]AG6_)k]AgI\MDE?bEKc*o2bX3tc4p*#W($0L%cPN'<:kB;
/AoF'IjBdMJ;AM#"\*]AS7gkhE9QFs4ZO#8%2a!#23d3&'ij-m/'#ro48s9lgA=%^`PDS[(I.
NAO%'hjPh]A:k=\jib0?A)D)=E:1UG_A%^s.NG7fum!9%I<0X_e[E7V4N2B9_@a)31&%Br_.s
N:;i.2dM+1#8Fn$Z0b24I?Aq8I0`0lj5;O'JTWN9r')ba8EZrjk:\bMNGiC:Vkl)X%5VnE'T
tZLWLQZT5(*#\'q[ctLbNjERVjV+=<@$:LsPVS1U0FEj#mAa6fX&AISd#c'dCVJJrfq,K<93
6^D#TrQRLj.b.GEhB<ko2]A1".8B-ki5Io$0K+&XT=Zq+Tbi2ILKiJfksVn*d9:5F<#[tI\q'
-hDcJX^41:8#7['1j=1YKapbH9cq8-RO\/Q`%HO66=#n\YMCLjT(A8(aO\6sor<3oD.Pf(lq
:]A!.r$k=5[H,p]Aqq'7RXXP`/elEKJJYu3^HO<M0;CUoIe%kA4d#)o9>o^@n57U+)HY2M[M"\
:f3AH8LW"5U$4?`a:4TWkH>9[.S`p<J(=-_BZ9m.G!d"7-k7eu;eTPK%X@ljh.s(s5`[ajP!
28!Bf.hO>HK3JN98V$4;qX6A_59(1ssY`/h1$,;GjGN=A)BHJ>CpU!]A7K_S#D78@+ieRA+8'
5d;#kMXNDKQ&;B]Ad[Hdp?pjjVXf+LbVa+ZlOdU&:.Okq`%1M*k1I=k]Ad=:FWae1/V02Du#$N
FNo-AZX1X(5uMO<F+O*1heGRFij7K=O@Bg/CPlQn[^[olNd5C-4+oJ1%B<g%I]AN1)YaJ<6Rg
Qe&QW(`@*W4Q1KE[sJEMh;f*o8hQRc)\Ssj`@JD"HAs0)H['fuG`'p>+C;s"%t#qaD\J0=-^
*dgZ7`2cEtijT*:=E#oj3DS3$AkVN%);'rdB"$rC3GdBgu)s4S/'S!hkUCf9C(#\X!mYW^AI
#2lnn2Dh88Mc4'Tnc[57I-(BYHD9XAkHU1V;/siifb6IrmSFYFoZP+g*LKW)W_NGQsB]Ak_ia
H5&:4[o'.X1JtK&gZBI4Z`f==*ZspAmSWh\t5B5UfduH(?uY'?DsTnXWV2.oCDM/<MY8YAB-
ZA*d"3P>h5X>7i>u0Y:hR$)8pR"0ME7u4O*J^G?:TamAs0=`r^UUq`\tQ8`\)nh)e[VOK795
C$Ul#n(X<SZ[0Wo9J7_(Y8TBK[Vre2UhOasniTc*.K]Ach7kYF2)*K2HcDb<U9bj0YI?B";BO
(+II5R!M4)#SH\"V4FAQ:3%UsriM\[*pKL!R@;[Q:>M_W.DX^KgjE9Ve!J77<-[?bZGJo@c0
6a$cu_cl&XOl^do>5('3RY"Y[9cA6OK-hkJp9?Jm;*t*jFP0\\D`al4S?V"9)W(ZVS.5T$?"
,jTKGjorhdmu"Mma82.\e5!1FL4nrYu1<6\3]A^!8;i<n'+.9M4R\rt;]A[La2//Js.5TbMcOK
+C;Gr'Xo::eTY`-u@H7\%f81FTJo[a61_,sbX/VIeZ/%ooh4=:lu_8A@o-,8cU[#men'::rb
4dN414sC3VgaoTG4Mkii4R4^H\ui`_RV]A0u2Mp;kN?L3O[Hit[8-(Y-rZ.Y*mJ.G_(R>\5f8
8=X#3I+J$,s%G]Aa:fdM#,(R:kR_76o7G\>G$;#d3m,pjs8K(M439-Q6?A+q.M(\M3?G*f$s.
,R!AeNmjbDcQ\Va)9>,goE7dIZkAZfOe+N`;mTPf.P$+^7-jd.LpT^Q5#44pZ(rI)37)7^0d
;MrN$9_o`,ph/cjWObK^pm8`hYn_]ASTEjHZa';H9[s_C8B#D*F3\+Urb#5iD0hXZ!`@k@&9F
F+\MQD(kIKi3Tj^u&/M:o&b'r2P\Yb09l]AR!g[*A4un2Z1'$"WYE.BW+'@Fh`$:;6Q"3<,qf
bhdAoY)qQZR%'8TTD>1\9BTPR+d16tWnW-W#u"J0e5haW:i/Ch>irtF[opb"9:'tlY#HO?Mh
dV>X&q^rAr/qE2_k5.>VB-F>0/@SJmhbb7J8C;_HlKD8t@;)a3p6nQ!iL8a,M,*?rc%;U6\[
(>+o6T=D1&qhF6Hm;'%?r\Zg8Wh17R&cS!JFi2$]Ar$G"1lOJW<:3)gsiViFb:Kd9dgoc@3j-
QX:#K,oP2I(%bH2p7hCMr;>:g?$^C1i,Oh9QQo_V(cu.^%ICIc8e'/kKJG#&MH!`T,pO>PC*
&V"8^LcoqYq#O2[=siuE:$"k^!!jGqf:H2?\92+\DnS]AInp`cJMdQg7gHb^IoA3Nrrl1,SeU
YDfW'\']AB7cu,atr6)$B4hOGGD`^#Xad-fO>F9P`4S$u>,.sU/4a=n$(,iaaW:Yc4mAf8e_c
`<Nd&(a,ZEitrZm:prYPPIFWL5[7WR@M-;K6s.MQ*#:;PunH%L+&Q#<(8#KngWS;iVJeH+?#
>3)acWT9V0PT^OS8Y.^4o+hE/=G]A2a+cdT;JIJC,LhN[hLRR_enjY[Z_o]A3'jItbK>@:9XsK
q+2H@0X(t0)EcmHEM^/=faXiF+%GoD<LYRR\$A/me(t,f5SCIB`HlY)OIK;?8u,8cS)oTfrl
"gGE9B#:%RA-0M=QN[(1+%ifGm9&RfIg?HQ(R9R-+@p/?Y+5&YZt%n&oMZ1>h.2B-'8a&OlN
^P&KUK8rmU'f(:TeTa\kP'94VQ1U*_^auRSMm5OYQGtCR3Oo?@kZf\d=^QioO&2tniu<2P:7
iPJ]A.Kt3OP)Dgd6^!I4uIX.q);<^l!po=^>E@_emdBZT&ncT^9J#EgOa4*"3nGoDUh&jcqjN
2WnPE6Qde,>Ub<Pp:\HNo-5VNrDQEf[fS8":(>aVphEbFNoq%>pG]A[-qc8-m7SWH&dGcloWf
m\bV#^p;Mp#/k*H+@+3]A!Y,dk"UiL_a,t8kB_3dl,)Mi\c@H<[^3A6e.FOOk6SBF'Bb,"+Qo
`:fhcY9?G1"6H.K`%)/K8FUX,u9AN#"D1cr^(H[os\lI*(_C1#!.bgb__<T@rf^mV2]AFH[2;
JT$L%B/uP%.4r(bj@o.[LhsLk4i]A3R]A)%YoV/o@@Uo_09i;M%,Ga0XlfJGRkc*^:C;0u=LY)
XjC*SU"O_aZUu(a)3=*FEk7?QA3]Abn$P]A3i\^JL<h'BZEYPm.Ojt0C._YO;_`"!cT$o5DP_/
/jj$,X_"W.5rBkl*#qAth]AM$>g,59fuK..0l9^XU+P12g1.OI-2]Ai"/B^!d*F`<OQU.Yg7)\
ZZ>AjQX7oIL8AaQ6=g%4g+%J>?PI^pS%D-$bS=>g:B[qq=nq(BOkCK[]AgXMl(31AH&To+MDR
%ABiYe:`J:`tUi's)Or>CtPdG,rD[sTbDQKsCSX(Yu,..'bFCAmo=)7-8hA3r:.`P$0;Xq;Z
=154\T3senKdYHi'k.#B5BI'QD5p]A(*d<#mq%RR1GkGSD@l-D\;%8\8Oe:.DPra?[mR/M+=#
(4sAhe$O?e).s"`DInh6p]A-T5H\)c7<X=]AriW8$+s`.$V,LL/e=a>XX2OFI^lBe)D4$P_8U,
2ChfMHft4?Edf`WbgY%Aq#Hr;q+Ps&(2c#*APS<W#FoM'Q'uYn"%%M=l:3hi.S?=iqH>QlF1
/2!7"`OS;%8U^S'%<c5\`Aho/n3>d,rbop"R<fX'o)mhr?L*=@9jk32(k?N6@!s<#`FjX)5d
5E,1VA)'I=sEprTY%Pi4fj/)9c"3/UIZH+%GON]A``a-lM=_r(W8rR#k/kORj]A:CR\,5e,4-Y
4P`"ZcT-.*(JqkYH&0-8i/A)jBCRZ-mDWH3:<1Hk4C(Or35jI#oAA6i+'Ys!ZsFuE;Q2G$d-
fVuD2Vm_]A>:9J4tH2u.N+%/%nCdsboeK@r(FeIdFX.]A4$$2[Z0oZu_uFlmo&(bI`?BInff$m
C]A"DB/I4J)Ulu_=fa+EH/omc^#L-G7^jo2W"+50iRTD%tGcZAMM]A=0d)B>PQEU-p26C7lOJ3
c-L$:]ALL\lY:[KNh+@XU8KH`TmXN^8ShK_WeQD*F9H\Z9fgP@>#u/W,N8@?,\V\J"aYqaa?>
@k,&6*VNA,pg2WK=e.:5jnTHYhlP0PT(QW5Ia99SV'_.0U;3X%?3g2STu8)igQp"M@R?Dfpa
;r&*p$akGKH+"k/9:41ab[*Y2c7,CLDk'S1"3OiSC([0h?q.2"Ka*:,of%D"-3AUmHe9G2Vm
[#c96K<8W3f0g;DVU\pdi/S8ZO&8%7-hA?7(Clk80orb8I5gS:._L@#1;-B[4eGLaFY1R9JB
';3tFfcCmfK]Aj>kLi9lW!(NPiB'rR@,>0LnsC_66)]AG9V:.30OMhG2=l:=s_."1#NZJn9&od
J?%(9Y/O\A.^6P.9)j+1K1]AcU%-KcXqHg[jT`>RZ\+(4['G0B8HbXH>Xk]ApH#S$aMp#usM0f
I[#/&tj3L;Sn]AP(K?Nn:4NGd9%_"j?m@,c$_4B*8se1H4\;HZ9S&ePRfck)SC^$D`P%OO![7
A=tAk7Lp0+]AeXn;J2'j8?493^MXh!1ZLST%,Tfrf'B]As%N=l5dD[Fg@:-3)MI3>?H4s(DVT!
^!X#b++`>V>1QiUW>+ZTDp:mc00W<M3@fkGj::3jINj4"jrVqC(GpCp1naW(tH>QWa!-VV(i
P83sl_-)R;%E-J%n?gne!_MI`*'X_ugGguiIPWIaBs+6OnI_bGH9C%?hdXrl(9]AXA]A";'"^c
6tH6WiT%=<lpQ]Ap"h]AhcZYhu3h(H/#S+[,9[RkpX]AJ6-j\I-7=reqMXCZ[@JW,<m#i1cmg;A
Wt18^.pbfB&WEg6ac=:D$fOPg06&OZaCBJs2(/'A7&+Ri?42>`!@g&BZm9k@sU!\JfZjm!;B
Np_)dDX[g_mrh2/Y#*QB6^h2K<WE4MmDcS"fdU"`,2)-rNR(TX;1hhlSXTpYoLt\k"lef/5a
`FnMHbj/1O&'N]Ag(JD8D%79fon+O2n3=*XL'$r_$uJ*ggF+)n4DBn&7\OBTV_oceG>(KHN=B
7*lrb2Z/uou#gc(FM:P!Z9f$uV9HDB[DL!jkK\UMqmIXLo4R[Am3]A3m-W&Uc[=)nND.*jm(N
st3!-,N?11?8F>\I2-IhLP]A0HnjCE]A"J;8"&@OMJpu(,rbW\M?(goN??MR7r1E]A13.LnS8a:
2=2b:(Dp.tJulJ$b*e#)<D[oU'l92D&3RC!peEs9.J@[?F9@i@m_oBNQ<*e`^C_(FQ*+%o;A
p4@!WdJ7`W4BP]A9hTPD0V4S@(^N.NHG@c>V0e$8UD31(T:Q=CL*Um&3,?m<@9Hb:#dE/efpk
BgYOqEMQS5P<8nJXrPC1g4$Tma5Ukf:[mkrD)>fXh@m-\75^knjH5>7^p)HX'qkp4g#J5Vuh
JAEgn\%6@<cc`G_6j&mnW@ahBKI"sQj:j+:b23YJJ7'sq<qL3)<j`9heVg>.K;8IiLqp$fJD
:7mK>o@#=,(Xn=X)+ft3KD&$I5HSh;u(/UJDm6MXeCh&PDoP5oDPPgWoJ!ZNq/tc!M:X;>:Q
"dMn]A6-pC'`EoL4cF:S2s"P'QD:_F+BlT;H^Y?D\u-oJs'L(L5n)Y?uI;(=L:a/RR(k=3([W
^?/`6TqPOW>UfK9OEk!Hj[i<dg;6YM,)KGI?Cn4hFN!L;LAqZL$:?ItQZF#&+I[29O8t`G$=
KTS+$*=-6b-;MUM$U(D*.4"dJj)GK*Ts`N!C9;9UjEk$h_N7=kpL;#S6-LYo>RAfBImX\4iY
#*?3b'VEDqt<8k3.`O:2#T-7t$dWMG6N2M!6%o,*=0*fbar,D-EL#V]A%C!1CS_l)j"9l>8kb
?YHni\5EMqn0#[jiJJn[]AU$QJ?3BQB=ReTjpCV#OpSEHJ?uQTL]A1]AkH5_\t:N0k^q-h\k:QU
+-g"2?iH.GA)1<#B/6dE^D&Y%o4b!0")]A?Mj;Ha&rt]ArC7:JCJBn@P+33(8YU(S3]A!'cHN(&
gcB?Ao,)gnp8\mGO#V$F&NaQrlX%t*5`P,ljY]ApCQ*$Gf*G[Gl]A)F%3#@jV>%3NY'Fl1kh4I
`)8q4-i!XT*2_E"fa>`X@SVR1BU->@(dff1pZ2>jF#B7e7m;Q#SQTdTZ3ah2sl;faZVq&D\o
E52I60LMG/BLqbl,E_Z^F7u[a?<0NEj30Rd6m)i8PFToEWL58#ffNZn[J/c`onq"mF<72_"6
6O?(Cbg&SrJL:dNOH-B+I+i\[5R`-2C>*(Na;c!lUijn09ZjX&)m@=q*4J=)>bkS@kb]Akau.
h^pb+I#2%%ar;rgS)D+LqTWrLe;@UAVd*%&#d(gaZ2c9r>NihQG'4:!Fd:S#9cDc`6Vos:+[
D<NG-(CFJIULqmY/p-9Vm;5H$8_T)/B%k:dj@KRLpZjp+%Q7#e4d-g7<0Ipt21C;PDPP6l#C
9NMR9t+X@3'?S(I:YpY@@(\BUD@r1'KB=oMR;#M,8isRmA,Z"_KO_[<5\(0,5tVjn)S<E-:`
5l2!F]A#USj;WLtN>d"-f%&lZ=^L+!Z9J;(7=]AlS>tp`+i$92JnYkI&"j>nW8Y+r#&RkB?!&g
?'7g#*eu";/&ZCSSsMfd$9f2ACS>UeRR>?0E^he`h-G'*S)QDd+dZqf1RCb1gj92AA0sN*$F
M.=1@C8Zl?$SQ5d.Y3<t,kN#OR#pf+`_l2kT:WPZOlmRQIZETkjl=n<8hM!K]A/2e?!J<ZO21
$8aL?1?/!<`3QhRb1LjphNF#=4C5cO*j&`/!CL4&F[H26[a+jTRa'=uEcT'7lZA&:aWY9JQn
,4n$Q+WIq8ppY!9M4.?-b\5ZWNItHp:3K%4LgR*j/&_F0?Rtg"8'!Z$Sou;G8dh&4r^^b.iR
E8fN1;AEMccdVGg^K3-L8Bcbafe:Su#XT;E#nZIR\3\tCLQ:tb6]A<jFP^N=[6i2!Q[d&_X/\
H6:YoS3N4.piGiH?V.Ai95"mZK:M@CXZ_,$(D-1QGDn-H,SK1o;W_)9]AcpppfgQ6*G=7-'E2
6*`t6KPqe+JZXqoc865tA**e2b(d)#alMHkuOAo@s$aC:Z^&%ukNr>>(aUW%5bKZuk$bZ62?
mXGi('C@Z[2V08]AAj2["DDJ$8Wp(RB,^:kki!/7ro?.BNeRR83qVt4V:bjL%CKBF+%9D&<Eu
)^[d?3k=!OAUn2nfpOXgu39P5?bU)K)3Wr6c'kZslDm(pfc@S>:2n?X^skZhHD*HDc5"\"nj
H1E!nt?QrdV8tXkk[$aj7SN5uG^]AQ6W>bd+/pNeqUn\tAPMYIIQ>B4ZbVD)0c8"r[$UE`Khf
5gf1KEm-EY2Rb:#!\!#&ku[)4V:JZ1"="!9VW@I1(:&ZX>"a.Y;m=<84);3)5A*^)Hq'j4R7
Po<j,p>)>Iq]AP2n7IF,r$";b`(`>P*?-.SUF0N1-V9m53hDX/.7dq!@6:4]A(%;JV"NIah5G0
Q!UKr.[uA`<%=8]Ai.t&#c+?^e1X1JU5Z'XVFR3M>T4Z5SB%Y<Oie'"^6+7]A"3JMpYfjnnUFp
k,<]A!JMnJYqiq"qNfuF`^CVLh;HXj[W;qY0uYZZ^G6h*8<S:coff29BW]A@;%5fREENjTXn>)
#lN.ZjD,d8ET=f'.#0?7fNMpHK\0sj5VM[-PC2*>tNDD_(;d'K@\3Ke0$0KFbr-T=aA-bS[`
`4C>\M^D]A*]A@_:Br53,66K_FB&O$CbDMK!kO[al<=AL=kN?i[)@_m0!oOet5g*Y6#W%Z'%f#
OF.>EMQ)=POT*aEiO?g.'/^1`bqIj<<-8Vf,be*I7>63hbiP03?ZrfK`Z9,Pu;J0tO%Z@doR
+QP%D)mQ,[Q[;,VfJ9D>R=fk4A4[^W<MMH.K6!#BF_KbFkZD]A&:L,]Aep5jTN*"@.Tq]ANe>j(
H\Vr7f.PPo#!P]A;@7Pdm2WQrh^>qBk;UspYtKG^jf^C;WoM1,:bqVPsF==$p\*'@"B]A.*W:=
%iE7TQoA0eoIaDoP-_flqF4*sKgZtj$W^pj;NI&Cp]APt65I*(J*.rgWa7O6^S*i#L+BmZ)6L
W@uTja1ZCY_RRa;Qi5HEea4aJu".2;QB2bG>U/UR[<q"6EUA.n3>R%;XY<NSg/SgL8P13!L/
\U"Q7F"8)RtT67#Gi#US;]A:;_;KP)pT:\uGmkb*cd,;$8LMnaq?X?Fm]A5q3ht'NXL`uau=LA
]A;Sr-5bM/]ASg\"WnoMSt"783rC7]Ag36Kr/`NAuY:L)SNYb297&0#q'HAWeWc]ANO-fN&Y,rfF
jcl8.YNd/iGN"<D]Aa\@Eu[soA10Q3l=QQKm.VYjpor9pEmV(b)XCsPO#(6<rs&.G5V[S=UF&
*A0@RS!o9#-_rR!8;#DO$&7)mi:[,lclRn"m[;h=j&OZ(BamI77%?V\ig9JX8JKFDFIBmSL.
clq6><O<5F+P%!EkI_5q`;3/$$rA-*b!2(%hLnZ.s/?;Mm9)0)o%>qP#V8[#COS1.cgfo;Uc
u@[!c4$U'b+a?>NRN`[q%GUaGT,bP)R;./MoZU=EC13us-^L]AZj8*K-N=Z"l%ZdSELd&TQ5c
fp9J/_!mo4\ZDX1KWVO1Z-NJWR.&RIl.,]AXV)cF&k[PuOH.8B]AOD:5Wolqc+Gs=tkmPd:=hg
imjK3>WKK[icf-ADh<h/+&oZSW]ADl5KGT<Vm(Z(9<c2N:e]AGW`<0B%CP:?CP*aFJYnt.asj'
pW)b/f3'/^8FS\Y#PH!&O2j2bQN?SO7J$%>fcNG:iYN,C7LD#F8N[:WA6ii^sg(1o=`n\h>I
>J1MV/LOne*mBg5^l0ijsnK4Xd'hTo;+f8cIW.:-S0CfWfX1&9ZGo8L*R7(HYnmMH>G8/cul
5S#8]A%>Gf6D=I!s:#0UiohDod/]A^ajUp%@<PQD*UnSGOq&=/TdGpRmH-W.O;,KV,W*]A2>mb`
a%GWXY[19U23aCR)Htm1Q3MZJ(uX#c0Y9X6I!0M/$T,<p2Rk)RF22EO'>$8h9[0l1mJqSHXm
SM"6#b1X9Q3ud_pFZ+$@+!J8bS:k-lqofVl<clieJk7/'iG`iihQS1<-aJ?G878kY"00f6:4
+Bh?[E=gM$;9W6"Oi6H:.CK%0H<OAIb,;jS4N2)m9\B1b<_?b@mP7nR0Cb.r?N*N`^j9:i[N
uR6E+TY2*Znc%W`+d8@j6X)`/:Tt!9i6"b8?nH>'*X9I5)L%ENb00o4R16L&qK%toRP&QJut
\*gF\QRmISIg?#HFGR67_CTQj>5e=^9.#H.;)X;<5h#tN!&E7%ia>O`44b&-1N1=?7-]AhCYW
lcYH`nX:%?@(@P[^#VjZ'-&[p_K.R`W"Dl>_KC%Xo]A?n2NJ*7ddJ7?*7uH6V?OPQH3qEPThp
WF2[-o]An^ZE/?D>M)D+*`l'D@*@kdP)6;6.Ym/4NOQ`UC$EXPWGK-'S*EZ<H`1@GWE$7dZq5
H&.SA)p[KO4b.d89o3/!=e@"0"=9_Da;S>(+l;M,@1aL]AAA3apUfY-Z?'di/uSPs8dbU^<I?
O"bG`2sLo`7/'',4dQQbk:*iGVg+1R1GP27rsVZ:(IHK#lWJ11D#CCnsMTP-q?\CX=m5c"BE
gl22ucj?Mj2lT"6o1WcqIBo-ZF^FPjm)USH4<<^l!F@I]AshQ]AYbJ\&kp1_DGm1Y-/?dM44K_
m9KGuhK0$f*!31RChdA,KXXq'LqN14>(r$9$EZI18C$tA_Q6P>M6H?f3gIqdbRJMWEGMCG)S
KA*4>qIf=r#E>c!Kl5nh*Df-'PuRX8=8HHtH84bT$qBFZ'%M3V>BR`hK4j".I3tcub6/En4"
;>&iPS!7<^j,Hu/"H7DRuOdIl4e,85HcOLo]Ag&"s0VSf#?Cfe_bEl64+9DqMY\7Fq[lQ;!F`
loHSkUP5u<M_#,3-*l&?PE4CSM4*j2O_):h5cG-TIZ^iK:E%iop#W+=s'i![g2CuC%pi+Q5Q
8um1?oe.6)KoOnu2qIU6h01r;7./,i)7-bT^?$a8m..dpHZ6K$\QPOG-^>lC/-7-TSU)NCtH
f'OB8TBbdg$.YG3_Q;DZp*nUG5AS.4O+>(0DlBYnI0&?X$lOi($g?c#8;#d4%l>ZYh'"a.=[
hf<X#`RFPV&Z,p#_(kG5?bCD[`3?.^%L(WCUEU[#2Kf34E6oUUc-Q*9H%M?%<SBV5@ZeggW9
V$7m&^RueW1f&T0_AC-RqqZYbJB2=9U0e0@N`sKMZ<j7`.<dSAs>ij7iaP^EI,gcImR+h?2.
^DTibI4`oo4j:oEb^qt<Ck=>4QZ%D2]AbpVhC2fnaBbU?QZXB6?d>OmoMnQZF<k?&8DS4f>Yj
Z6$s`k#Q,]AN`26DU4gBJ0XTpZ[VVJ?RR--\t]AOL/nrQca#f8R(d'*o.K8l=5F"Z4m*`FC0%6
\`M;f1!e&\W8Xi6k"@?@(auR):E@kKKETtKkokmY@oDe<.+:gkONn[F`KY%`Er44PT'h,7D?
P/OMfS>26;.]AT*.gP!*DbC9k(J,de]AB[%DQ9T8ErC;9Ebas+AgpO;?L5\1A(g&9PE/_keh$l
L9Z>l1CBM\:'LnH:<mM1M]A&fR5`9Xek/67cZbW'^=8ZR[;+Jo&;jr!LRYaL4Hj.L`^^[[SlS
3"W\bbO<J,';c9Z,r1'gq>&'oKOC2C,lP%oN+7Y5guJ*#@5.3'3:S[@s2FbHtk5P)/,1&QLS
4(9hl)k\ZZ+Gi-Ng*p)WD<Hma\jNrN5F^63`962_h33['.nX3BQLA8kdsY"YBt:HOm)qU+_o
<p:Z/eEYLpj.VHmj^-58mDnPU<)4>!`185iMsD)kD)9'iXGq`(i-s(Z.+hC=Zcs8%>Ti=o3.
%o$<u#a<'-5k@oB2K\5Mi$;RbFd"IF.8,J2t,t2L\?@=ulr!qZKK=be'b]AWE2U3;d6i:cmnr
A4L5Me4<^1u^UbBRU$-oh1:'<5KQnR:+5P'=BND.FkUUY>>_,D*R!ffmV]AXd_;'TZp.(bfAn
'h:%isFi6?-iPbnBW1^,dXs>&)5fjO$;+P9o!*`Kgl#]A1mi(+OB"BsWB4^pi6im3[@H`<?d0
/nLL@q)98drZC_m_leeWllD)YKHZF9@.LL//N\e&JSQsVako+=prj!CIFB+LK=]Ak?Iur;Wh6
H>)>d@VPN@s)2C$@MXT\&9<pk#Q&)cN*\`R0Q#gSQFd]A<S%ckq;Ui=:Jidesl7<#+ICA,bcL
MhOU>Qc69?8<^LOAJN'CU'.C<oIcJ:L]AK."#:3BCB14/ZaP8V<+73S-nlebNO4fZ^a0kT1fd
\=D#goOSiuNEWcYjqKT>pog)5/OaI)YEAdr^qtPAAZEuP5f-qY;U*e'Jkn&dS[`C38]AkfZh$
Uj/=LJq_g1r3X%+JPqMTf'i<dY'u:nAc<Dmb'hBE,f\uk2?0X"G5*PR7G@[gJ/06NRga+be^
i^gKCRZ?F]A4"##4:@"tSumC%Bn>E8uG]Apg'!,1Oj*jo:@e.!&[.kN0ju0\<$WC]AcNN%hg('d
C)4iM>H(Sf6=3oo[XB01?-nq-b.9c3EdJdqe^%P#ar3:#R*kZ0!RKI^<qF&C`_'PEpN<Q^d;
?8RM3]A<#m.9gi8om2r"aA!3P$MpRkLJ+O=WK6,lC+0CdSO]Ah"sYbqF`7+.e^p87coo"H:u]A+
s<f8bIEt(U\0%Mq(6#,"`gGs+J_/6BF/%:sORdXA3dC66@s7CB!6[sT)4=08XbtPLaO5+6*?
G^FM[=*96=teES]ACpD1?GN.D;q.m8AV_]A_XXs$OMa\m?2LY8;Aka$#i$/O39Qfq!a-W!PnON
37nB(iIZnTRCpX/2<NT_HA'R*5XG]AZgtE#Q=;IO,Z^Z(SSYQ.=C6#^N-XG%KHa(#k#ZgCQQ5
<^FZo=bU)#]AgWtIS[)>Y5/aFj@_998E%Hl*gLoP`DqT:TI$iemP!2&c8G8ZugnVa\lU;m-_-
\khLtYYqF)Z7(\ppd0r?e6X7\&\M$YBn*Zb1/5A-f@+i1n`Y58L%/J!!0?/)]A?gM<btJ)8>Q
mLETgu8rcc`WTZC,fNbHn9/;Qe%2?cGg^j:qXsG&=84Y8&KuKh8DC&BY7dC;TQHaeM:;o>VG
6irs_#H@Se9q<9*@"7^eT6_9pPX)NPu\nS4j*s$59a$U+ca4m^!r1u,ujVZ[!K%.L9J$76e_
?+\+=.S9!oO:.Ld?Qbt1+\f#h-?7=Ufi<3]A#9c'mpVU>9aIROsrQc?uYD&$<2GATeL-T;74U
[^KeMl.&PMWgrPZk)<IYZa3o:F/J8"AMNq@LGe1u-V%,4c/\*Ya%]A)q.?H9/]A\u-2YPq^N\p
;]Al*.M#6)Og'5eN&1:P,,>Teq+jk=;X'Z2\#0Q/a&"m);(t1X2>AugEegkC!>UPInU*^[/At
\,g5R]A9m4.Hak+8uTLF:`]Atu]Ag_-0#cl&\u_dp/:jg!;DJ?cV2HFX_D3b:V$"RcRV)9;?H=?
CjopZ.;42>iG#4&/^iT31UI^X_r>ME"TVF0ZtJn?("(rJ]Al9C#SOO^V]A#!BeHK)F^27N:GLk
Cr_tgV2ni[a*S7c\7VIrPMXE!eE&$6['M,\e=Z2I>1:uc#FoMMa<n"qPCAl`p$CssG5dTDRn
d!31T(-HL?r&/.lB=3Wfk/sf,;6"7%njZhtob7D&5H^NI/_K*7_,_9Z\0lQ<qQiDH0;"2+-Y
I?/2',\[qG=OsB!&S?g6))X5seR[T!hZko%qg]A%_lurc`.2n[(-q*;";3;1&LC"EOIjH\87L
1[a`FI(i0$M?)6+@m[TcXY`*?0gT7umJj0`'T9*2aX)J]A.)tR*o9G)/J51]AOl5/t#^Z@%JlA
s:f^;`ns9JF-[Q'$c!bC1tY+i5Pi_e)k,?QO;0UG.@GN`$Z&5&Z_2'jb;]Ao9r7;69<FhHkMr
^KHQ"<>i<*k$c?j6<<PGW,S+)dUR&Fg[E(:.=K.T#]A@I4!I.t=qTs"Ce/<JL<&=aQT2H4?4l
dFr"$p>m83kD?t_lT3S)EuBl8NsO8@8*:t<7*JKfXXR-2d_4A<s$5`\0l-S\fAFQ^iIF"6Ke
GG&5HPHElj(o^+C$".aQd8q=QZ-__ob5bY!qn2SSPemgT!bII`B;Z]A>,u*VDP#dV`Vi0P'to
/5q8:<o).OaZmTA7m'.'i+%SlM_lWB!7+BJu<KhHf]A(_cj$EL;O5+?dCBGJ8.`V3ZOChf[r+
6(%#gA<bi$-T6!-^T>,B]AghG4q>U6D:6FK.]A^#ZX)Qfa8t#?-U00HHh>##h]A2-AHn5]A3)Rfr
\W"G&E2kHt3'L_G2A`Hpn%L!sIOmFn\YA\4,s/WsO2J*iibE-"qtplosTD_RgdDr5i38$pEo
<Od/t-MX[mIRc@/aH$;\\GS:R<K6S7!o>uH/GGVu^Sh1I4qrA*niO$kC!JN)bNBtX4qLu_`4
L&YFmJZ!YtUUAI9F/c1F1-aKD?rQ<<iYu??j]Ar5Fd@a@h+a7dDn,7F)rs:f_?:)V;\FKW-aY
lq8A]ApSXcPPltg4eUG9&K?WGi&j[K]AddI+A$MY<9XR*^oCrnZQ^A76>\FN]A]Ad[BtE5/lTuV7
B^on5A5&Bl/tOF>B?5d0%$Ds('YRX!)[n<SBd6eP>dU,>[,7E<J[210Dt(2-sE4U_#iu)idl
"]A:UXeV$Eh]AAZ?=W%+)gtIi$d2qhe'XPc-epe?G?75&eZ>f=6KQ")Zh3`3<+MSITC&`jlJT&
lK<4L-S0*URTe8Kij5A\+pWaobY77"p]AHF9$cLjaM(ci9MC]ArZ@Tb(*SWsANE6t8:/CY52jn
4f2:G7i+pli\q+RY]AU'26#Wp[#OYK9QJL1\DR)JhL4E$]A[rBW%Vp_E4\9K[ml?Xecd_o&#7n
$^U(B0YT5"H;T8`"XDr&UrERg9`rTH-?S!re_nK%T/IZ7KZjb!<3Yak%gUt\W>VdQhCYE;&g
/"/jo!nODn13.7m8%ufco#nEX+5M$4:g,(qW=bL&>`B?N7gM^)]AB1(5oDh"ATo`'/`7I>.5_
usf#IBaLP3tel>:Z-QJ(_g7_[t1U((@;Og'ejNEuTjXjga]AbXSWVLZ=J09/pUQdlCP,)k=c4
[]AkU<OQ7&u8Kj>Eb=_9m*4HdWbW9LM[Ru/VD6OWVl52/@i/DZJ[0\59JpDGOFQ#/Tj]A@)mG&
+LoPnf7<:^C)Z/&mf9ZPg0jo2OLh"MGGG[@Ar!(SE"6=YUs6"0T`q%q(+Jm\@:a?LZ$7^MAC
6D0_'Q;I!cj)Pbh@V;/VK'EXY6X;,u\)B=B=]AksUbWYdVJ4&Hk(bdi=P(?$08`l=3^R@aG8H
6&dqW[^bJD8VsnY-97]AT5`0TUf%8C]A@,Y=gJ9J.qt%R<m^'A"8c,eZhg,X*+oR-R#0at\)^?
D&1-n&(faN))4"@NR]Al"Fb=F6OoDkn:LXJ"phCI\kj]APq"]AV,k+l%5e1;]AV19ZM2A]A.rD,D[
TNYu/=/?O^IqHXAjO4&\V*-0#@RT.o=4[TUK`+rPF<ah_c\#8ZK#HfL:X/,dD%1)5hm)<cb*
jomk&D[Y.lc4&+g+b-q?7Yj,Jk.1iZAWQPA"'M?qH4*1;(;f56h;l0^k"YK"E%@T3-#m?f5j
@k]Ar?$"5,E;L`E_#0rR&0@.23OBY\A\Ng\If>kH'Nifc>rr(eAOF*Y2=\8/9N/=c.]Aitl1/F
ue$7ksf?3FpA+fNKZ49k&a4E6Nb4Mg=#FnC#kVerBR\+#!q@p?OTt^k+E2YmN:9,n%Cd`($t
9"[nLT#.4k?O%Qi/7FKb%d5K`Nr^ZUC7hfsSu-eXgmXMN0mGNkJ`b[D(..7KZh\BH(R8&h"\
K*h@@$eQ5G6$1:n[sBRC5b8qVJ6)+[L[</VVpocL/S;mB:j`mPS?Wku*QVL=&FqF`HYqFMp1
D8_]A+4cm~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="498"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report3"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="951" height="498"/>
<ResolutionScalingAttr percent="1.2"/>
<tabFitAttr index="2" tabNameIndex="2">
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
<WidgetName name="Tab3"/>
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
<LCAttr vgap="0" hgap="0" compInterval="5"/>
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
<HC F="0" T="4"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,723900,723900,723900,1008000,1008000,1008000,1008000,1008000,1008000,1008000,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3009900,3924300,2743200,4419600,3009900,0,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,0,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,0,0,2743200,2743200,2743200,0,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="3" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="3" s="0">
<O>
<![CDATA[分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="3" s="0">
<O>
<![CDATA[单位类型]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" rs="3" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="3" s="0">
<O>
<![CDATA[分组]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" cs="6" s="0">
<O>
<![CDATA[业绩指标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" cs="34" s="0">
<O>
<![CDATA[业务指标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="0" cs="7" s="0">
<O>
<![CDATA[规模指标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="0" rs="3" s="0">
<O>
<![CDATA[得分]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="0" rs="3" s="0">
<O>
<![CDATA[预计得分]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" cs="6" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" cs="4" s="0">
<O>
<![CDATA[5G绑码新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" cs="4" s="0">
<O>
<![CDATA[宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" cs="4" s="0">
<O>
<![CDATA[天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" cs="4" s="0">
<O>
<![CDATA[高活号卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" cs="4" s="0">
<O>
<![CDATA[三千兆]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" cs="6" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="1" cs="4" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="1" cs="4" s="0">
<O>
<![CDATA[云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="1" cs="7" s="0">
<O>
<![CDATA[终端]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="0">
<O>
<![CDATA[非小米]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="0">
<O>
<![CDATA[小米]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="2" s="1">
<O>
<![CDATA[非小米]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="2" s="2">
<O>
<![CDATA[小米]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="49" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="2" s="0">
<O>
<![CDATA[预计完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="自定义分类3"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="单位类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="自定义分类4"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="全利润"/>
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
<Expand dir="0"/>
</C>
<C c="6" r="3" s="4">
<O t="DSColumn">
<Attributes dsName="小米" columnName="毛利"/>
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
<Expand dir="0"/>
</C>
<C c="7" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=f4+g4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="3" s="6">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="总毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I4 = 0, len(I4) = 0), 0, if(H4 / I4 > 1.5, 1.5, H4 / I4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="毛利占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="5G绑码"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M4) = 0, M4 = 0), 0, if(L4 / M4 > 1.2, 1.2, L4 / M4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="5G绑码占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="15" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="16" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="17" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q4) = 0, Q4 = 0), 0, if(P4 / Q4 > 1.2, 1.2, P4 / Q4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="新装宽带占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="20" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U4 = 0, len(U4) = 0), 0, if(T4 / U4 > 1.2, 1.2, T4 / U4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="新装天翼占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="23" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="24" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="高活号卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y4 = 0, len(Y4) = 0), 0, if(X4 / Y4 > 1.2, 1.2, X4 / Y4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="高活号卡占比"/>
<Complex/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="27" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="28" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="三千兆"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="29" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC4 = 0, len(AC4) = 0), 0, if(AB4 / AC4 > 1.2, 1.2, AB4 / AC4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="三千兆占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="32" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="33" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF4 + AG4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="35" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI4 = 0, len(AI4) = 0), 0, if(AH4 / AI4 > 1.2, 1.2, AH4 / AI4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="FTTR占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="37" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="38" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="39" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM4 = 0, len(AM4) = 0), 0, if(AL4 / AM4 > 1.2, 1.2, AL4 / AM4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="新合约占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="41" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="数据" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="42" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="43" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ4 = 0, len(AQ4) = 0), 0, if(AP4 / AQ4 > 1.2, 1.2, AP4 / AQ4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="云宽通占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="45" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="数据" columnName="终端"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="46" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="小米" columnName="终端"/>
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
<Expand dir="0"/>
</C>
<C c="47" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(D4 = '东方华大小米专卖店', D4 = '益州国际小米专卖店'), AU4, AT4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="终端"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="49" r="3" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW4 = 0, len(AW4) = 0), 0, if(AV4 / AW4 > 1.2, 1.2, AV4 / AW4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="3" s="3">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="终端台量占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="51" r="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT4 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J4 * K4 + N4 * O4 + R4 * S4 + V4 * W4 + Z4 * AA4 + AD4 * AE4 + AJ4 * AK4 + AN4 * AO4 + AR4 * AS4 + AX4 * AY4) * 100]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="3" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(J4 * K4 + N4 * O4 + R4 * S4 + V4 * W4 + Z4 * AA4 + AD4 * AE4 + AJ4 * AK4 + AN4 * AO4 + AR4 * AS4 + AX4 * AY4) / datedif($start, $end, "D") * 106 * 100]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="8">
<O>
<![CDATA[邓群]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="4" s="8">
<O>
<![CDATA[业务厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="4" s="8">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="4" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="4" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I5 = 0, len(I5) = 0), 0, if(H5 / I5 > 1.5, 1.5, H5 / I5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M5) = 0, M5 = 0), 0, if(L5 / M5 > 1.2, 1.2, L5 / M5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q5) = 0, Q5 = 0), 0, if(P5 / Q5 > 1.2, 1.2, P5 / Q5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U5 = 0, len(U5) = 0), 0, if(T5 / U5 > 1.2, 1.2, T5 / U5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y5 = 0, len(Y5) = 0), 0, if(X5 / Y5 > 1.2, 1.2, X5 / Y5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="4" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF5 + AG5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI5 = 0, len(AI5) = 0), 0, if(AH5 / AI5 > 1.2, 1.2, AH5 / AI5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM5 = 0, len(AM5) = 0), 0, if(AL5 / AM5 > 1.2, 1.2, AL5 / AM5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ5 = 0, len(AQ5) = 0), 0, if(AP5 / AQ5 > 1.2, 1.2, AP5 / AQ5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="4" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW5 = 0, len(AW5) = 0), 0, if(AV5 / AW5 > 1.2, 1.2, AV5 / AW5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT5 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="业务分公司厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="4" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA5 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="5" s="8">
<O>
<![CDATA[邓群]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="5" s="8">
<O>
<![CDATA[体验店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="5" s="8">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="5" s="13">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="5" s="13">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="5" s="13">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="5" s="13">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I6 = 0, len(I6) = 0), 0, if(H6 / I6 > 1.5, 1.5, H6 / I6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M6) = 0, M6 = 0), 0, if(L6 / M6 > 1.2, 1.2, L6 / M6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q6) = 0, Q6 = 0), 0, if(P6 / Q6 > 1.2, 1.2, P6 / Q6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U6 = 0, len(U6) = 0), 0, if(T6 / U6 > 1.2, 1.2, T6 / U6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y6 = 0, len(Y6) = 0), 0, if(X6 / Y6 > 1.2, 1.2, X6 / Y6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="5" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF6 + AG6]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI6 = 0, len(AI6) = 0), 0, if(AH6 / AI6 > 1.2, 1.2, AH6 / AI6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM6 = 0, len(AM6) = 0), 0, if(AL6 / AM6 > 1.2, 1.2, AL6 / AM6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ6 = 0, len(AQ6) = 0), 0, if(AP6 / AQ6 > 1.2, 1.2, AP6 / AQ6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="5" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW6 = 0, len(AW6) = 0), 0, if(AV6 / AW6 > 1.2, 1.2, AV6 / AW6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT6 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "邓群"&&eval("b"+"4")="体验店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="5" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA6 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="6" s="14">
<O>
<![CDATA[邓群]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="6" s="8">
<O>
<![CDATA[体验店+业务厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="6" s="8">
<O>
<![CDATA[汇总]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="6" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="6" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I7 = 0, len(I7) = 0), 0, if(H7 / I7 > 1.5, 1.5, H7 / I7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M7) = 0, M7 = 0), 0, if(L7 / M7 > 1.2, 1.2, L7 / M7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q7) = 0, Q7 = 0), 0, if(P7 / Q7 > 1.2, 1.2, P7 / Q7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U7 = 0, len(U7) = 0), 0, if(T7 / U7 > 1.2, 1.2, T7 / U7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y7 = 0, len(Y7) = 0), 0, if(X7 / Y7 > 1.2, 1.2, X7 / Y7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC7 = 0, len(AC7) = 0), 0, if(AB7 / AC7 > 1.2, 1.2, AB7 / AC7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="6" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF7 + AG7]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI7 = 0, len(AI7) = 0), 0, if(AH7 / AI7 > 1.2, 1.2, AH7 / AI7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM7 = 0, len(AM7) = 0), 0, if(AL7 / AM7 > 1.2, 1.2, AL7 / AM7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ7 = 0, len(AQ7) = 0), 0, if(AP7 / AQ7 > 1.2, 1.2, AP7 / AQ7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW7 = 0, len(AW7) = 0), 0, if(AV7 / AW7 > 1.2, 1.2, AV7 / AW7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT7 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "邓群"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="6" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA7 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="7" s="14">
<O>
<![CDATA[杨盛翔]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="7" s="8">
<O>
<![CDATA[高新包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="7" s="8">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="7" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="7" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I8 = 0, len(I8) = 0), 0, if(H8 / I8 > 1.5, 1.5, H8 / I8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M8) = 0, M8 = 0), 0, if(L8 / M8 > 1.2, 1.2, L8 / M8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q8) = 0, Q8 = 0), 0, if(P8 / Q8 > 1.2, 1.2, P8 / Q8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U8 = 0, len(U8) = 0), 0, if(T8 / U8 > 1.2, 1.2, T8 / U8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y8 = 0, len(Y8) = 0), 0, if(X8 / Y8 > 1.2, 1.2, X8 / Y8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC8 = 0, len(AC8) = 0), 0, if(AB8 / AC8 > 1.2, 1.2, AB8 / AC8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="7" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF8 + AG8]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI8 = 0, len(AI8) = 0), 0, if(AH8 / AI8 > 1.2, 1.2, AH8 / AI8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM8 = 0, len(AM8) = 0), 0, if(AL8 / AM8 > 1.2, 1.2, AL8 / AM8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ8 = 0, len(AQ8) = 0), 0, if(AP8 / AQ8 > 1.2, 1.2, AP8 / AQ8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW8 = 0, len(AW8) = 0), 0, if(AV8 / AW8 > 1.2, 1.2, AV8 / AW8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT8 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="7" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA8 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="8" s="14">
<O>
<![CDATA[杨盛翔]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="8" s="8">
<O>
<![CDATA[高新包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="8" s="8">
<O>
<![CDATA[渠道]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="8" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="8" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I9 = 0, len(I9) = 0), 0, if(H9 / I9 > 1.5, 1.5, H9 / I9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M9) = 0, M9 = 0), 0, if(L9 / M9 > 1.2, 1.2, L9 / M9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q9) = 0, Q9 = 0), 0, if(P9 / Q9 > 1.2, 1.2, P9 / Q9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U9 = 0, len(U9) = 0), 0, if(T9 / U9 > 1.2, 1.2, T9 / U9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y9 = 0, len(Y9) = 0), 0, if(X9 / Y9 > 1.2, 1.2, X9 / Y9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC9 = 0, len(AC9) = 0), 0, if(AB9 / AC9 > 1.2, 1.2, AB9 / AC9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="8" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF9 + AG9]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI9 = 0, len(AI9) = 0), 0, if(AH9 / AI9 > 1.2, 1.2, AH9 / AI9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM9 = 0, len(AM9) = 0), 0, if(AL9 / AM9 > 1.2, 1.2, AL9 / AM9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ9 = 0, len(AQ9) = 0), 0, if(AP9 / AQ9 > 1.2, 1.2, AP9 / AQ9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW9 = 0, len(AW9) = 0), 0, if(AV9 / AW9 > 1.2, 1.2, AV9 / AW9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT9 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="8" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "杨盛翔" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="8" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA9 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="9" s="14">
<O>
<![CDATA[杨盛翔]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="9" s="8">
<O>
<![CDATA[高新包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="9" s="8">
<O>
<![CDATA[汇总]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="9" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="9" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I10 = 0, len(I10) = 0), 0, if(H10 / I10 > 1.5, 1.5, H10 / I10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M10) = 0, M10 = 0), 0, if(L10 / M10 > 1.2, 1.2, L10 / M10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q10) = 0, Q10 = 0), 0, if(P10 / Q10 > 1.2, 1.2, P10 / Q10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U10 = 0, len(U10) = 0), 0, if(T10 / U10 > 1.2, 1.2, T10 / U10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y10 = 0, len(Y10) = 0), 0, if(X10 / Y10 > 1.2, 1.2, X10 / Y10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC10 = 0, len(AC10) = 0), 0, if(AB10 / AC10 > 1.2, 1.2, AB10 / AC10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="9" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF10 + AG10]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI10 = 0, len(AI10) = 0), 0, if(AH10 / AI10 > 1.2, 1.2, AH10 / AI10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM10 = 0, len(AM10) = 0), 0, if(AL10 / AM10 > 1.2, 1.2, AL10 / AM10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ10 = 0, len(AQ10) = 0), 0, if(AP10 / AQ10 > 1.2, 1.2, AP10 / AQ10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="9" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW10 = 0, len(AW10) = 0), 0, if(AV10 / AW10 > 1.2, 1.2, AV10 / AW10))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="9" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT10 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="9" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "杨盛翔"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="9" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA10 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="10" s="14">
<O>
<![CDATA[林耀亮]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="10" s="8">
<O>
<![CDATA[政企包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="10" s="8">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="10" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="10" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="10" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I11 = 0, len(I11) = 0), 0, if(H11 / I11 > 1.5, 1.5, H11 / I11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M11) = 0, M11 = 0), 0, if(L11 / M11 > 1.2, 1.2, L11 / M11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q11) = 0, Q11 = 0), 0, if(P11 / Q11 > 1.2, 1.2, P11 / Q11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U11 = 0, len(U11) = 0), 0, if(T11 / U11 > 1.2, 1.2, T11 / U11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y11 = 0, len(Y11) = 0), 0, if(X11 / Y11 > 1.2, 1.2, X11 / Y11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC11 = 0, len(AC11) = 0), 0, if(AB11 / AC11 > 1.2, 1.2, AB11 / AC11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF11 + AG11]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI11 = 0, len(AI11) = 0), 0, if(AH11 / AI11 > 1.2, 1.2, AH11 / AI11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM11 = 0, len(AM11) = 0), 0, if(AL11 / AM11 > 1.2, 1.2, AL11 / AM11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ11 = 0, len(AQ11) = 0), 0, if(AP11 / AQ11 > 1.2, 1.2, AP11 / AQ11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="10" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW11 = 0, len(AW11) = 0), 0, if(AV11 / AW11 > 1.2, 1.2, AV11 / AW11))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="10" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="10" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT11 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="10" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="10" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA11 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="11" s="14">
<O>
<![CDATA[林耀亮]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="11" s="8">
<O>
<![CDATA[政企包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="11" s="8">
<O>
<![CDATA[渠道]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="11" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="11" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="11" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I12 = 0, len(I12) = 0), 0, if(H12 / I12 > 1.5, 1.5, H12 / I12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M12) = 0, M12 = 0), 0, if(L12 / M12 > 1.2, 1.2, L12 / M12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q12) = 0, Q12 = 0), 0, if(P12 / Q12 > 1.2, 1.2, P12 / Q12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U12 = 0, len(U12) = 0), 0, if(T12 / U12 > 1.2, 1.2, T12 / U12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y12 = 0, len(Y12) = 0), 0, if(X12 / Y12 > 1.2, 1.2, X12 / Y12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC12 = 0, len(AC12) = 0), 0, if(AB12 / AC12 > 1.2, 1.2, AB12 / AC12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF12 + AG12]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI12 = 0, len(AI12) = 0), 0, if(AH12 / AI12 > 1.2, 1.2, AH12 / AI12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM12 = 0, len(AM12) = 0), 0, if(AL12 / AM12 > 1.2, 1.2, AL12 / AM12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ12 = 0, len(AQ12) = 0), 0, if(AP12 / AQ12 > 1.2, 1.2, AP12 / AQ12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="11" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW12 = 0, len(AW12) = 0), 0, if(AV12 / AW12 > 1.2, 1.2, AV12 / AW12))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="11" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="11" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT12 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="11" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "林耀亮" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="11" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA12 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="12" s="14">
<O>
<![CDATA[林耀亮]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="12" s="8">
<O>
<![CDATA[政企包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="12" s="8">
<O>
<![CDATA[汇总]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="12" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="12" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I13 = 0, len(I13) = 0), 0, if(H13 / I13 > 1.5, 1.5, H13 / I13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M13) = 0, M13 = 0), 0, if(L13 / M13 > 1.2, 1.2, L13 / M13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q13) = 0, Q13 = 0), 0, if(P13 / Q13 > 1.2, 1.2, P13 / Q13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U13 = 0, len(U13) = 0), 0, if(T13 / U13 > 1.2, 1.2, T13 / U13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y13 = 0, len(Y13) = 0), 0, if(X13 / Y13 > 1.2, 1.2, X13 / Y13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC13 = 0, len(AC13) = 0), 0, if(AB13 / AC13 > 1.2, 1.2, AB13 / AC13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="12" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF13 + AG13]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI13 = 0, len(AI13) = 0), 0, if(AH13 / AI13 > 1.2, 1.2, AH13 / AI13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM13 = 0, len(AM13) = 0), 0, if(AL13 / AM13 > 1.2, 1.2, AL13 / AM13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ13 = 0, len(AQ13) = 0), 0, if(AP13 / AQ13 > 1.2, 1.2, AP13 / AQ13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="12" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW13 = 0, len(AW13) = 0), 0, if(AV13 / AW13 > 1.2, 1.2, AV13 / AW13))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="12" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT13 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="12" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "林耀亮"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="12" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA13 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="13" s="14">
<O>
<![CDATA[沈平]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="13" s="8">
<O>
<![CDATA[高新非包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="13" s="8">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="13" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="13" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I14 = 0, len(I14) = 0), 0, if(H14 / I14 > 1.5, 1.5, H14 / I14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M14) = 0, M14 = 0), 0, if(L14 / M14 > 1.2, 1.2, L14 / M14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q14) = 0, Q14 = 0), 0, if(P14 / Q14 > 1.2, 1.2, P14 / Q14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U14 = 0, len(U14) = 0), 0, if(T14 / U14 > 1.2, 1.2, T14 / U14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y14 = 0, len(Y14) = 0), 0, if(X14 / Y14 > 1.2, 1.2, X14 / Y14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC14 = 0, len(AC14) = 0), 0, if(AB14 / AC14 > 1.2, 1.2, AB14 / AC14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="13" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF14 + AG14]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI14 = 0, len(AI14) = 0), 0, if(AH14 / AI14 > 1.2, 1.2, AH14 / AI14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM14 = 0, len(AM14) = 0), 0, if(AL14 / AM14 > 1.2, 1.2, AL14 / AM14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ14 = 0, len(AQ14) = 0), 0, if(AP14 / AQ14 > 1.2, 1.2, AP14 / AQ14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="13" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW14 = 0, len(AW14) = 0), 0, if(AV14 / AW14 > 1.2, 1.2, AV14 / AW14))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="13" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT14 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="13" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="13" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA14 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="14" s="14">
<O>
<![CDATA[沈平]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="14" s="8">
<O>
<![CDATA[高新非包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="14" s="8">
<O>
<![CDATA[汇总]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="14" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="14" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I15 = 0, len(I15) = 0), 0, if(H15 / I15 > 1.5, 1.5, H15 / I15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M15) = 0, M15 = 0), 0, if(L15 / M15 > 1.2, 1.2, L15 / M15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q15) = 0, Q15 = 0), 0, if(P15 / Q15 > 1.2, 1.2, P15 / Q15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U15 = 0, len(U15) = 0), 0, if(T15 / U15 > 1.2, 1.2, T15 / U15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y15 = 0, len(Y15) = 0), 0, if(X15 / Y15 > 1.2, 1.2, X15 / Y15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC15 = 0, len(AC15) = 0), 0, if(AB15 / AC15 > 1.2, 1.2, AB15 / AC15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="14" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF15 + AG15]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI15 = 0, len(AI15) = 0), 0, if(AH15 / AI15 > 1.2, 1.2, AH15 / AI15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM15 = 0, len(AM15) = 0), 0, if(AL15 / AM15 > 1.2, 1.2, AL15 / AM15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ15 = 0, len(AQ15) = 0), 0, if(AP15 / AQ15 > 1.2, 1.2, AP15 / AQ15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="14" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW15 = 0, len(AW15) = 0), 0, if(AV15 / AW15 > 1.2, 1.2, AV15 / AW15))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="14" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT15 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="14" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "沈平"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="14" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA15 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="15" s="14">
<O>
<![CDATA[李康]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="15" s="8">
<O>
<![CDATA[天府新包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="15" s="8">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="15" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="15" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="15" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I16 = 0, len(I16) = 0), 0, if(H16 / I16 > 1.5, 1.5, H16 / I16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M16) = 0, M16 = 0), 0, if(L16 / M16 > 1.2, 1.2, L16 / M16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q16) = 0, Q16 = 0), 0, if(P16 / Q16 > 1.2, 1.2, P16 / Q16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U16 = 0, len(U16) = 0), 0, if(T16 / U16 > 1.2, 1.2, T16 / U16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y16 = 0, len(Y16) = 0), 0, if(X16 / Y16 > 1.2, 1.2, X16 / Y16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC16 = 0, len(AC16) = 0), 0, if(AB16 / AC16 > 1.2, 1.2, AB16 / AC16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF16 + AG16]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI16 = 0, len(AI16) = 0), 0, if(AH16 / AI16 > 1.2, 1.2, AH16 / AI16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM16 = 0, len(AM16) = 0), 0, if(AL16 / AM16 > 1.2, 1.2, AL16 / AM16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ16 = 0, len(AQ16) = 0), 0, if(AP16 / AQ16 > 1.2, 1.2, AP16 / AQ16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="15" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW16 = 0, len(AW16) = 0), 0, if(AV16 / AW16 > 1.2, 1.2, AV16 / AW16))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="15" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="15" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT16 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="15" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="15" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA16 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="16" s="14">
<O>
<![CDATA[李康]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="16" s="8">
<O>
<![CDATA[天府新包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="16" s="8">
<O>
<![CDATA[渠道]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="16" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="16" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="16" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I17 = 0, len(I17) = 0), 0, if(H17 / I17 > 1.5, 1.5, H17 / I17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M17) = 0, M17 = 0), 0, if(L17 / M17 > 1.2, 1.2, L17 / M17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q17) = 0, Q17 = 0), 0, if(P17 / Q17 > 1.2, 1.2, P17 / Q17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U17 = 0, len(U17) = 0), 0, if(T17 / U17 > 1.2, 1.2, T17 / U17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y17 = 0, len(Y17) = 0), 0, if(X17 / Y17 > 1.2, 1.2, X17 / Y17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC17 = 0, len(AC17) = 0), 0, if(AB17 / AC17 > 1.2, 1.2, AB17 / AC17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF17 + AG17]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI17 = 0, len(AI17) = 0), 0, if(AH17 / AI17 > 1.2, 1.2, AH17 / AI17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM17 = 0, len(AM17) = 0), 0, if(AL17 / AM17 > 1.2, 1.2, AL17 / AM17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ17 = 0, len(AQ17) = 0), 0, if(AP17 / AQ17 > 1.2, 1.2, AP17 / AQ17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="16" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW17 = 0, len(AW17) = 0), 0, if(AV17 / AW17 > 1.2, 1.2, AV17 / AW17))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="16" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="16" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT17 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="16" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "李康" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="16" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA17 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="17" s="14">
<O>
<![CDATA[李康]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="17" s="8">
<O>
<![CDATA[天府新包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="17" s="8">
<O>
<![CDATA[汇总]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="17" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="17" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I18 = 0, len(I18) = 0), 0, if(H18 / I18 > 1.5, 1.5, H18 / I18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M18) = 0, M18 = 0), 0, if(L18 / M18 > 1.2, 1.2, L18 / M18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q18) = 0, Q18 = 0), 0, if(P18 / Q18 > 1.2, 1.2, P18 / Q18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U18 = 0, len(U18) = 0), 0, if(T18 / U18 > 1.2, 1.2, T18 / U18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y18 = 0, len(Y18) = 0), 0, if(X18 / Y18 > 1.2, 1.2, X18 / Y18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC18 = 0, len(AC18) = 0), 0, if(AB18 / AC18 > 1.2, 1.2, AB18 / AC18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="17" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF18 + AG18]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI18 = 0, len(AI18) = 0), 0, if(AH18 / AI18 > 1.2, 1.2, AH18 / AI18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM18 = 0, len(AM18) = 0), 0, if(AL18 / AM18 > 1.2, 1.2, AL18 / AM18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ18 = 0, len(AQ18) = 0), 0, if(AP18 / AQ18 > 1.2, 1.2, AP18 / AQ18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="17" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW18 = 0, len(AW18) = 0), 0, if(AV18 / AW18 > 1.2, 1.2, AV18 / AW18))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="17" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT18 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="17" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "李康"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="17" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA18 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="18" s="14">
<O>
<![CDATA[罗娇]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="18" s="8">
<O>
<![CDATA[武侯包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="18" s="8">
<O>
<![CDATA[厅店]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="18" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="18" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="18" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I19 = 0, len(I19) = 0), 0, if(H19 / I19 > 1.5, 1.5, H19 / I19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M19) = 0, M19 = 0), 0, if(L19 / M19 > 1.2, 1.2, L19 / M19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q19) = 0, Q19 = 0), 0, if(P19 / Q19 > 1.2, 1.2, P19 / Q19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U19 = 0, len(U19) = 0), 0, if(T19 / U19 > 1.2, 1.2, T19 / U19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y19 = 0, len(Y19) = 0), 0, if(X19 / Y19 > 1.2, 1.2, X19 / Y19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC19 = 0, len(AC19) = 0), 0, if(AB19 / AC19 > 1.2, 1.2, AB19 / AC19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF19 + AG19]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI19 = 0, len(AI19) = 0), 0, if(AH19 / AI19 > 1.2, 1.2, AH19 / AI19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM19 = 0, len(AM19) = 0), 0, if(AL19 / AM19 > 1.2, 1.2, AL19 / AM19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ19 = 0, len(AQ19) = 0), 0, if(AP19 / AQ19 > 1.2, 1.2, AP19 / AQ19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="18" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW19 = 0, len(AW19) = 0), 0, if(AV19 / AW19 > 1.2, 1.2, AV19 / AW19))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="18" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="18" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT19 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="18" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="18" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA19 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="19" s="14">
<O>
<![CDATA[罗娇]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="19" s="8">
<O>
<![CDATA[武侯包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="19" s="8">
<O>
<![CDATA[渠道]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="19" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="19" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="19" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I20 = 0, len(I20) = 0), 0, if(H20 / I20 > 1.5, 1.5, H20 / I20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M20) = 0, M20 = 0), 0, if(L20 / M20 > 1.2, 1.2, L20 / M20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q20) = 0, Q20 = 0), 0, if(P20 / Q20 > 1.2, 1.2, P20 / Q20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U20 = 0, len(U20) = 0), 0, if(T20 / U20 > 1.2, 1.2, T20 / U20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y20 = 0, len(Y20) = 0), 0, if(X20 / Y20 > 1.2, 1.2, X20 / Y20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC20 = 0, len(AC20) = 0), 0, if(AB20 / AC20 > 1.2, 1.2, AB20 / AC20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF20 + AG20]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI20 = 0, len(AI20) = 0), 0, if(AH20 / AI20 > 1.2, 1.2, AH20 / AI20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM20 = 0, len(AM20) = 0), 0, if(AL20 / AM20 > 1.2, 1.2, AL20 / AM20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ20 = 0, len(AQ20) = 0), 0, if(AP20 / AQ20 > 1.2, 1.2, AP20 / AQ20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="19" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW20 = 0, len(AW20) = 0), 0, if(AV20 / AW20 > 1.2, 1.2, AV20 / AW20))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="19" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="19" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT20 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="19" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "罗娇" && eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="19" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA20 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="20" s="14">
<O>
<![CDATA[罗娇]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="1" r="20" s="8">
<O>
<![CDATA[武侯包区]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="2" r="20" s="8">
<O>
<![CDATA[汇总]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="3" r="20" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="4" r="20" s="8">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I21 = 0, len(I21) = 0), 0, if(H21 / I21 > 1.5, 1.5, H21 / I21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M21) = 0, M21 = 0), 0, if(L21 / M21 > 1.2, 1.2, L21 / M21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q21) = 0, Q21 = 0), 0, if(P21 / Q21 > 1.2, 1.2, P21 / Q21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U21 = 0, len(U21) = 0), 0, if(T21 / U21 > 1.2, 1.2, T21 / U21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y21 = 0, len(Y21) = 0), 0, if(X21 / Y21 > 1.2, 1.2, X21 / Y21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC21 = 0, len(AC21) = 0), 0, if(AB21 / AC21 > 1.2, 1.2, AB21 / AC21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="20" s="11">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF21 + AG21]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI21 = 0, len(AI21) = 0), 0, if(AH21 / AI21 > 1.2, 1.2, AH21 / AI21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM21 = 0, len(AM21) = 0), 0, if(AL21 / AM21 > 1.2, 1.2, AL21 / AM21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ21 = 0, len(AQ21) = 0), 0, if(AP21 / AQ21 > 1.2, 1.2, AP21 / AQ21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="20" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW21 = 0, len(AW21) = 0), 0, if(AV21 / AW21 > 1.2, 1.2, AV21 / AW21))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AY4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="20" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT21 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="20" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("a" + "4") = "罗娇"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="20" s="12">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA21 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="21" cs="5" s="15">
<O>
<![CDATA[门店合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="21" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I22 = 0, len(I22) = 0), 0, if(H22 / I22 > 1.5, 1.5, H22 / I22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M22) = 0, M22 = 0), 0, if(L22 / M22 > 1.2, 1.2, L22 / M22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q22) = 0, Q22 = 0), 0, if(P22 / Q22 > 1.2, 1.2, P22 / Q22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U22 = 0, len(U22) = 0), 0, if(T22 / U22 > 1.2, 1.2, T22 / U22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y22 = 0, len(Y22) = 0), 0, if(X22 / Y22 > 1.2, 1.2, X22 / Y22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC22 = 0, len(AC22) = 0), 0, if(AB22 / AC22 > 1.2, 1.2, AB22 / AC22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AH4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI22 = 0, len(AI22) = 0), 0, if(AH22 / AI22 > 1.2, 1.2, AH22 / AI22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM22 = 0, len(AM22) = 0), 0, if(AL22 / AM22 > 1.2, 1.2, AL22 / AM22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ22 = 0, len(AQ22) = 0), 0, if(AP22 / AQ22 > 1.2, 1.2, AP22 / AQ22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="21" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="21" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW22 = 0, len(AW22) = 0), 0, if(AV22 / AW22 > 1.2, 1.2, AV22 / AW22))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="21" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="21" s="18">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT22 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="21" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="21" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA22 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="22" cs="5" s="15">
<O>
<![CDATA[渠道合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="22" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I23 = 0, len(I23) = 0), 0, if(H23 / I23 > 1.5, 1.5, H23 / I23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M23) = 0, M23 = 0), 0, if(L23 / M23 > 1.2, 1.2, L23 / M23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q23) = 0, Q23 = 0), 0, if(P23 / Q23 > 1.2, 1.2, P23 / Q23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U23 = 0, len(U23) = 0), 0, if(T23 / U23 > 1.2, 1.2, T23 / U23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y23 = 0, len(Y23) = 0), 0, if(X23 / Y23 > 1.2, 1.2, X23 / Y23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC23 = 0, len(AC23) = 0), 0, if(AB23 / AC23 > 1.2, 1.2, AB23 / AC23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AH4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI23 = 0, len(AI23) = 0), 0, if(AH23 / AI23 > 1.2, 1.2, AH23 / AI23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM23 = 0, len(AM23) = 0), 0, if(AL23 / AM23 > 1.2, 1.2, AL23 / AM23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ23 = 0, len(AQ23) = 0), 0, if(AP23 / AQ23 > 1.2, 1.2, AP23 / AQ23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="22" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="22" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW23 = 0, len(AW23) = 0), 0, if(AV23 / AW23 > 1.2, 1.2, AV23 / AW23))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="22" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="22" s="18">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT23 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="22" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="22" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA23 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="23" cs="5" s="15">
<O>
<![CDATA[公司合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(H4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="23" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(I4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(I24 = 0, len(I24) = 0), 0, if(H24 / I24 > 1.5, 1.5, H24 / I24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(L4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(M4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(M24) = 0, M24 = 0), 0, if(L24 / M24 > 1.2, 1.2, L24 / M24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(P4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Q4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(Q24) = 0, Q24 = 0), 0, if(P24 / Q24 > 1.2, 1.2, P24 / Q24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(T4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(U4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(U24 = 0, len(U24) = 0), 0, if(T24 / U24 > 1.2, 1.2, T24 / U24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(X4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Y4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y24 = 0, len(Y24) = 0), 0, if(X24 / Y24 > 1.2, 1.2, X24 / Y24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AB4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AC4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AC24 = 0, len(AC24) = 0), 0, if(AB24 / AC24 > 1.2, 1.2, AB24 / AC24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AH4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AI4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AI24 = 0, len(AI24) = 0), 0, if(AH24 / AI24 > 1.2, 1.2, AH24 / AI24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AL4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AM4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AM24 = 0, len(AM24) = 0), 0, if(AL24 / AM24 > 1.2, 1.2, AL24 / AM24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AP4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AQ4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ24 = 0, len(AQ24) = 0), 0, if(AP24 / AQ24 > 1.2, 1.2, AP24 / AQ24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AT4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AU4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AV4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="23" s="15">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AW4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="23" s="17">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AW24 = 0, len(AW24) = 0), 0, if(AV24 / AW24 > 1.2, 1.2, AV24 / AW24))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="50" r="23" s="15">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="51" r="23" s="18">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT24 / datedif($start, $end, "D") * 106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="52" r="23" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=average(BA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="53" r="23" s="16">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA24 / datedif($start, $end, "D") * 106]]></Attributes>
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
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="NullBackground"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
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
<FRFont name="微软雅黑" style="1" size="72"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
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
<![CDATA[#0.0]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-1118482"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
<FRFont name="微软雅黑" style="1" size="72"/>
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
<![CDATA[#0.0]]></Format>
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
<![CDATA[[(?W(PjS?,Ia?ZULc.o)/4G`glV&`oW$k88aM'1I0Jc6s[d<l>,U(8NAgehWfWm;VQ"=dV%(
!XBHCf'4mJX`uj8Zj;0uqLd]A<?:dcL\\4TC]AW^>Vsjki=t8S!.`,Jr7T6n^l/BrE!8<Rj2tS
B+rgSS;@UpC2SYlh<,[Y"dS$#V_I"")3pQ\!FHZBa*/il9pe@VPIHmfC2!6<0</pD7E\FRLl
RHHAd;idhX-]A/RD6I8c)E6NVoX$!ie\*/6ks3.QeRl#P4)q0f;$)a:K(^C.&.n;979mn/FnG
oM;_@IUe))5<,-";1&/7644sfu$XVcX6S]As+3$L_G1Weo4N)/Yb'Kp7t_c!/"E8s"pndu'?L
).I?8IpXi'e75rWO\Wa@YqAl2%%qV8/Is.[A&q`uIl2L8T:kPh8r;>2dW^GXfRu:B@+?B+$%
H:l"do+II`u\'&4\G57e8o<hGuoR:DsKo6YX&pL)LrR(0jl+iYD:0AT7^gS:(r*g42mdC+"A
7+o^N3Iu7`k![&lh#*i1qWE\":@uWDHESNdtJ\0\)#6_\G+'7NVo%5@cCF*7U*-`n_?i5adj
IYHOIGn:Abl?aje%fN4>5t1%_>uMcen_Jla"=fU1088aES=g5IcZ0h3u"dPA\.6^btSgU@#O
HLoV5PNOXP/CjO)8f0'akdS*`,@p#*)@+m/+oW#`QrX(l^/%3.HT>ZAHP91$T#5mFng=kd2:
*B7'J[_Bu;)QDZun?@cREuMldM21,/AB>,T%Z+Vk3ni0dY2l(!$si9Y]Ao`sOm!e!<I*;Fj=\
+6mmgsq]A7fcT7aP_t)Z"7)e:`]Aii8^5RZC6R:k%sd8'j(NK+-:'\"9U<&F/O-8f"g18G7%r)
aWEBaNA_Jjk40j%O=(DOD8(BWEl6"CiRP>F'pR:%RW@0J4J3;Qc%9N()!F<FZE0/ClT&RbK0
14/&E49L91A*@LpgUr3aG.4:8b\_#mOPf)othc"h\tl;S&+ZCD.r7"]A=a#Gn/K$*Y?EU3R,T
rLhCd/8A=j)KntifU3PZ*,jOLU\)^ERGg3I,JCZb![.tHPpLF7VcD?/aQVW3-$/aqs9XOmLC
Z4g<KAbV\6jaN0SS4*p:hBuSEE1RNU'!tn_09-3ocFd[fnhOu^,rE[+74Wel=EY/2d?u0"pU
?sR[Gd`!AVWG\EW.-$S/oS3h2g6Klocpd[0k"1V@80I=N)2MY*H#e5n(2eki"Sc#T`E(I9FT
k#]A<>U*-^Lf2=CqroUr+)7n@^,Pgd!G@DaCs:nU>S>#+Q!isaA]AHn]A1<7Orc=OY03,bO-?!O
KodG+RQD_+lG.CQqSC/FnWS+nR.00i[C.FoJ]A2&=Y$W;4?F1`QH,+gh4r!Hf+<Ro;V<cL63+
u\q+6JoVeJLFLlV,K:H90JUDDCZ7f[`ng<q8iDB`BVI,CNSK'\usU\,QjB*G2hLK,s3EmIbl
*gh@*<8H%"<"H.mPH047>0Dm:AplN]Ai]AO9fUn=Nm[Zb'3r6Op/od`X<k1N!p_5%r$<P+?[c&
iY/3$!K5;!YtQl.4Y+\Eh,VC1aAZ<E`f%(?pd762OFh?*FPTlb<mX`2q@&iJnfO;"\j/EI]At
m;%-IG:jp54rQ&V>q.af7n:i=(IcOLA9]AtH:_*ojM,IVFs44Ra<4;5[$_/4D+3<p71"\t6:o
7aRBN&gc;j40Q$Wu!GF#n;.F+Fed0fQ\15S0@(,ihRUu;K8jH@E1f`]ApKp3^Jhf8Od*?C&]Ab
4j@,<19A:jfg8EqrrXue!%5_RX53NId0H2h,Jpn5FDmf02]Ad<mTfTEu:AJSRA8q-l_I$iK\H
i20M%o@%8$/Tiaa"#:pF8u_>^Q&90Vip[2CR+GFWIs'_F"1Xhere&KAJ-9nH,r0ZOVJ.n$oL
QJSj7Y&o"se^bk>fiD9J'L_aRWe-lLEQoN34E9*+K#iHGn\=YZ$daFobJ"BZ:LW1DI@CaXfV
.rp:k$&HquM&.glC#\)TR@gL`)%Xii<QXe(ILRN`k#RS_bnIbscIuFn`2`+TDa1$OHVcsIDD
JgpU.^DFpU&)t;dQ<I'=AbM)`BrLh@]A7'b%"eH\.n6EG08P<iKBT`6/!*2j5n%b1"HPUEK<$
89O=_UDkt1A1HD%lA(O2C,0lG./j.N1DP_bu\+El,`n@pg)FI;0Cg&u9=EbLg]AmdSg3[??mK
D8n9t1d^Tp`k7&E&9s6^lgGGV7@pp6dLC)"0%l6F6UpO%1Ei_*]ATjOZes1Yf4WPs^"OUj'PN
?p^d8^g%0PL<)hppusj[[OG<'8Kbc5*.R%Sn7L@tF?qL*B'\aMTT+3Jtmbm[,cfpMPG>\/Z,
K(BsD]A]A6F;B1&&0?:p5Cu\ZLDLbsC04-H$4l%eTk5$4(L>1#G[(jPR$((O!n@rjSF]ASDqbO?
bVW:>WZt!`h1dcH4TTCl1l2PL/r-<ZZ54m\Fim,Q;/j85B*>bI!sPCZXQRko610oE'[M!(aa
F2rb^Z4h=jG%Y+^EkF7O_$W.Tb'k9S)pe!IQb4Ad*&mIEPl:+`Kl.AON53U!Z7LU+j)('hRY
r]APfSp>6G_I6BoEGf#S%3uLDVhFPah>f+a=lc!7I@H8-X[M\u)W9`'*X!bA@[1d\k7VMI@^i
m+[o[WT6,JjC?CkR,+C5@T2L!hTskF]AkGJAIe)?eE'"3B6G&Q*a3?$Ul5i_"@W8H7+DWOQc/
C6L=KDhtio!g@J>G'Q2L;0GF699YE'4e]Aph2U$VJ.!H:$somXXd1+4f9PT(bBf9),u<\NItR
602sE_EFVo=n:?<+e4_cP^UZ\JkkA(sB<slk+Z]A7g9i?S;Q9(NQ?Fdf'RVLUOc^piYhh'\A:
W=m:H-bMIo<7V&bV"Fuf!c4.?+d76V:Mo%hTjg_3,'WWWuG!oEf+kKJ)Fk?e6>9&+b;?DHre
[Nef_k[aMPOSPN4N!]AF.P65p5s,%juB(7u3d*)$I*h_lU:&>ee:,:Bc_r1Pfe`-T%e46bY=7
DiMG[b::Y8YEE%K<>K%S,*rdcYuTDeT:^V_nUi'"%J:Mq4Ia72E.&F!6#UIo]AKKd3jFDq<L<
p!+q"$1@^t5e$MQ`/DehS#rXSl+!:L"*QT<2&&/k@6NZ36Xp3_<J%2^+J749\mn^a`3;K*C&
%CHEhGND)9m3J7WG.bq..@eXHZo)AYA,jWYtC"lTFpL0nQJ65MmRe+#bCT=T<bi?4+j;H0>q
7BOg_3B@cQ)T6<9B^UOr8:q*VUIlgX2GX]A7'hO7+Hjma9ge^TZTtW&f7U[`aB%W0$9rM>Pr(
G1L6aLBB4;I)"q-Z&q>dVc@sE`Ja^es.^s8j9UL"Q-VppLJ6O'DT8L&,B#tIhZ>0=<Vo.%_-
ZM!qD=n#*0&UEoXU$SGf1APP"s$(29998>8.4jMgf;KgJ`m\Sb`pgs3\PG>G7nR)/gg7atct
u_p]A576*hnUi@%Q&RLKb3V2E?qb:7"WQ:`-kWn3]A16MSP^7p-1apBJ<Ajam<]A`td]A5*ee4mP
"3najY&F'TQV`[Mb#m5p6i_A\AK;BE`[,T\,]A@eZAjdG^VeFPI\W.SdmYh5%I2n5DrfGkScI
l(i?d@23l7Cr[PlDpXI>2OD<Dm9ZoXRL,t_StY"^V>[RsieM)T)LHnfQm'1"bJd9\n!WEOe$
aY!t.H8Jn+@-l+jAdmoQmOm-h9(/k">LD&-d)mSq&K8$1gd,!O-t8*jkTC*o!q)4Qn=o>;_(
UFWp:99oI[l8L^dBG2D;HB&]AuHRj>AnC+q=,)eOX7W7,oZ:r*&.eW/Y;nP\BlV<@M>Q>UKb?
lI?=,p*(9Pj`eOJl3?R34qgAC-!m8UIOcri%<+1lPZK<oto!3RmB.6(<4psH^]A4^lp9"D9^/
GrjWV\]A&h/tjPaa6&5%gKjaj(ZX1,KB<u=EE#\Q@f7"'Joe6p[+Sc(Bj\%V<%g2+2q),)M9t
,J#$NRJ\$jRk.rA6h'+,oU#%rmCC3iEVH3$45qO/(T^84B1cN!Ah6=(/KIdMFYp&aCEMl1UW
C1"?,o1WN']AIN]AjKmA`u:roY6.<ZFc$hA^MIW.7:2KE+/RO:(^d1j[F4&^4SeMjb;Q2%n.E%
TU/nQ+pFH#P^Ymr]A2YC("XH)+fpB^S(>."Hs[?ga/(&)&]ASJn/mEE#[8>S$@k"qkb3-eg5tH
82Sp;WIiD>,7f2MG]A?Jr1pL%]At)]AIXm0!R%K.Cm[^<Xknt'D7I3/aJ:P?9q;>bgT&YF%PgYr
&,l7SikVrcd`8O0/AX,'TEoQYJ#lMB0"mk!Z$nDh_=[GMEG="o+]AY5e9ZN:+t\UE`iROd_Tt
"M,kAq]A:mp@\-QcTW`g)-M\306@-ZCVKhtV:$^13D\D*(tt1![tYlbHD+#Z)S)8O*Up1.J:R
,N)QG;l*ZqfA2k$F6oIu$.m#j_WNmrPN&jZOY02EAC342P?jo-!AaM0:!sh<&:(]A;VZ+m=MS
s/`=Oeq`=`4Jt:H-\BH,Z0?q;^BEm>*T#G3Q^!K5-@\$t&f/%Yo$%FJHno,K/m`oA-@]AkE?0
\34UbX09kCPnB>(r'L/nAD2Yfq[EruP7nRn^g+cg3j,Qb^O2$Uq+B^?K-ZfnE23s;1HIAMMg
iRZl<;4n5.pn)&^-(`Bp>,QW`Zp,;XQ[")pbBsN]APh5R&n;-WX&2jBI">Y9!-laF/^(JCD.%
]AN<k9:DUQ@>lYC)<cS"STXX1DoP*`6r-ksh8gpWLEd*PEi(*#pl:&UUcq9o*@4O/l%\q,!m%
+AEAkc*J3+.l$q/&.g#c6E^K04P/>?'FOino10Le;K:t]AjYN6tDp;O`U_m`SNrd/!C_jI?B9
je;l&dKN:Pr_FO&!;kk\._(SMGt!S'D8WAm>SDIl;lB]A#3Yhjd<8&ecP3bKguFsV'.8dQjad
"$fot]Ac!?$hU3`bMCM,r8:EKC=ZOc+3LER.2!M$>J`M<U2bh)ZQ00/@LlC+h48i.?A=Jh(&I
?O#H8ik^c,an'"_NLHVb..S$B1]ApUeTuU<Z7/g:!DrBjFO!u"F%m/@W^]A!fUdVoprnN<n?aI
Z"\?"Ui+_PtTc>m.JOjK43l>\tM]A0Q%(^C8-5l2*1HbZ(OH1>]A4Lda8/0CB:.^D9/c_/3Q*,
3&>&"7f.0nB:2^g4nbKCP@<ONMRGIkbTA?BB$UO!ZJr31<l2TB/>ehK$(CElE!pQ<7IsnA0s
J[fnDj-i]A#\[4??#8epFd+kS9&&9ghTQ^C:\@Ic2m#m.+9\2"$C"&4;/,SS$KC[9>,+l.M,i
M]A*,\H"6RIoa$?b_S(@\7-Ig!Y"^<2n%SQZLg[1;iUYis!H"+a0J1#@=<[%,UcsGde!7/)cq
m:Fj0:s"4Zp.,+/DBmFp$)>Bn$7CqOdkrL$E0KHk;"$"p3[&(['[hI95G[TC!(:b-#Gbo?Q+
WfT1/)5$&nX!W?$!`o[VXC7I?Yo5*1sT_n9se3hpqj,@?g@ENJ6'8.I$NK33Um*$r8aT#[No
VgDX(W1[9!A:Xi//RS>cE:.i+\)?BA(&MNki'Qu="2=!V"1:=aYa\%>Y)LXGA>>>r^*/,i+f
sU[h,fG5ee\Cr-Km9@>m87r^fct]AQA/nYMSQ>-qGWECULJF@\fE=7mjh^Y>Yg*$Q"Jt(o5>C
oMV71TT!+^`;VRP.2"+Xp\or0;\GOqnlKBe`/Au]A.>ktABfAAQ/C#BQP0MS`l^h_50<tUM(k
ZG:b7^#2A3_fS;p?+-uRth`>51<2VPAKFb64'11@B$bPn!W"%FL/glentn9L!/BG,,A.,E2.
9hU_jU*a/g5U5^.8gE)NW\iYg>_clT3Vr(-X/G7f&(/J!Nt.u?/J,b"(;WGqSPB/]AU5PL7Q9
O<qSt#$SQMU1o]AiobnAcnS#L]A;u;_J\I9r@c6S'J-Y2jLEJO2QB89)D[N%Nb>BPs;1:"W,N3
e.__.cKFC!b0TBS,.8+]AW3d%1M:$'^+TY(HRW:1'.kd@d>h/\&UmJ\m-+]A">XX]A-mTo.^3$`
>m7o)HaQ\@$-aZiBQn=67Is#1u^#=;%K'GaT%7+DCZi^T^qf-%HqSutZEG*#mj7d^:l`E<UD
/:4o(j0-AU#(*K["q:f`ok>h8SP.m-Rg?@p.^?$-nhQ$Ga=em"H00J\ln]AuZ2dM5J&*QlB(<
?2TW^fa$#23_+b=[Q^ED)\lM4KQ-gLTN`<G]APr=a]Abo'W/7&;XU3=Q]AUtLEIJ)*)9[c9MYK8
)Z;6Dfph@VW("",;+WR*nNl<08A0fS=6!))hqNi`.jTD/(aYLiMV:J"`m]A1k^%=eCD$\76c3
F)6T9Q5,(rIrA06_)O,P&W''Y;Ei&HY68mu3S;#SOAjK\Ra/fk-qm]AKg1ed;.[:m(?e$)Iff
,^JXjZrlJLO6WS8Os*B,O7pn2%=mS*:f22HX>9bf?M4*pMLp,$eYB+Np\V(:8s!ng\DP42j^
,Z`%VF&$S=eJcYC&U###f?EAq"E=;j=5rlBjqX*ct\>PD1AAL(XjEq&@NYGY&,^CLge;B/OU
Q#$+_I9e+\4dB[O#CR\K%^K1&Xnnrb]AVot'6QZ"[8ia<C3R>,;Bb]AYp@%gU`\!aXE(/;X@iM
&9)SIGPKLWfWJ*40]A$q4,!5B]Ad#W)sL!n@LgI[eR5sMe]AY#,8L8Rm0E,,VMAMO((ZhED<'72
/8\%0$VG-aML(.J`N;@2`Sd*A0Q^.,h.,Y&HYa*X-?K]A5bX?oJ<qS@ltaN'96aPC$+!&9M[s
PBk0t'2_(#<7.DG.BVmBRWA9=(s)jmQK&:K*^NX&KETi#s66/PQ>nr_5-cmo32sjs6(V&3hn
igl\-,"CS:-;rho4NaTNg'cP/)*e#7eT%D7G@'NdNRlqjf.Opfu4[gLr!t75,F^id1j?_U(I
S9QlsOl(s4)8LKd7_KpX(O7jZEFW'KqAO4MbTCdpu9CW\A3ojlpeMC;HD0m&64/U")4:B.7Z
;gB7;Z3.pD68`0]AnuVA^Xbq;5]Am\PF`>M0/5/l=<6tqBnP@3LYJKm52Br'\uVB7F/'C[`d'5
C$2"2@Po-B/G$mPnr6Quj24YeJG`9j)4Rk[u(G+5m%+P=RD[R1R=<.4mm6?qG4!oCuI,=npF
_'0<ED;j++:/ks]Ai,;1ou?/17jO;%^-pP.&H;bLjOmQ*sX\o(LDdgr-&f*%sV76P'I`r$33e
BJ%JJUY&)0%HE`mFo\#I/&Sj.]Ae$jW,o>A*p!:_\Hr=apr:<$C1.83kg0@YE#"ouf.hqPXJ'
+>SB9AMkjha05kh7m-K3a.?(dO:OTDqagcJMNCqmaB]AD\0J!ts!Z&J"pZSt3Q$(+S(X4YZ-Q
-C$KZ+18J_-aB&-CYHRN2tFo@hGWICMAd2$c-P?0Vj<l\:F\s;>JELZrE%'JWEt3')_5npRL
8NC;sC?X*^#[@PmHoQ1W)M=k>MXgCqlAuGK5EZN)Y^E9$t"&I2u0\2m&3kZY)=feGG@_HgcE
?W5q;:*(R'7>5q92OM]A=eV:ZV\3e\r"_S`fh;Ho`ZY&`m3@gBsi9`D<:2LOSO$eQJl3111"F
*u4V%JQ;\.tnlG7dW0D7Cm20CVoNrmu@\ul9!Ced+%^#'J'/9)<G%g'4K-9C[`rO#gsr2fG[
[,0g?mTB"kDkBFg*;79lY#7u+b3r]ArBMFQEr^VT^+C:g-fS2>rar_W;)n=n%G[k^Fhdb)NY5
nbqD`e*9aa;@bi<=D[0N_a3R%kPa5sa;"J>l6k9C8mjX=Saj9!L2X5MrpEMCZi4--(f*UE`I
88YM%m"gr,,na(Gu+p5N%b%7t*TcW@pE60+[m7LUc[@hc6oB;[WkSs6iB8ltmp*'tBUj^Xh4
p?Q42/"s&6';AUEKm-ei\X^,(Kar5$6ogNHc4&sE-KO.-B@Am1J_O>3tPOWAp_G6JoY4:(?E
!;[W(+@qZH[[3(hLO^C1VQc>i(9tC]AbIqeL)"R]A#?X7S+^[0X:=GbK->3*gYnBI;PF'8l0d;
/c?c>Rf4trT&<<Kq7;>2rCd=WYW!+p]AiUs2E2kZY]Au2%F2W&?)@J0'8?64_YG7/HCfK2$iI3
Y7<IIQZ@IkVrQSq6!YUZg-hn2;VW%:DPt$]AA#6uG22=LS\6MB,?Uf%4gE!:?2WHccN_[+B7h
hIgTXj.GSAYhWVds?nf*/tR<"uILndF"54k`2,`=HBX'3_gWOHhY?[`c_IpM0P8D*SZ[>CI\
c[D[lGDFf'(@j&jU[[I`#dV+:aYb5L&*hM'USVosK-!R7V0cLCgr.?K3:t;7EK?#'%djaPR/
OVH#5#iMd9X#9J<`TbCBQ2SQ?[d->78u\ZrhCB9N=rJ+1XfZVqNI?uMKb2#dXas,iH-k*r8Q
4%WGEc_@ul&YZTP#6"?'j[Cm$7HPqdYE)`<<SCoj:<^uj8/LC]Au*D+=ru"'oD2j$+UM)g2$'
HG%8u1WOZF-7,&nl8A%VH6iE+#U*DaT]A!I,H^st;%Wp[6^DK+LbA)*qS\/"-as(.7-DOE'4M
jiN+<3b29?CX:6/T,eZ,1%D1\Gt(mu2(J@Am36hI;&j"_-W7\*=Xjj\42,.\:ZdeDO$XS(%X
`6E5=jlnj%Pku9*?M>WZ.*;;F`/;:5@cLqfi7/Xi-(!PMU9FW,S7OtM!*c0BOOHW;>%9Ao"L
XG',r+d#s.K[[$SpBXqPj9t$r!og4M!H\G=(`\""XE;l]AkeH1'%-\DBuB,5Q,nn&ibYG.N*R
I1]AS=Ip(!U,:3X+>,nD?0C@Z4/'6Ug#ZYcQeBa&\?A9)8uCo7d@N\YmZ3X;.7MQFP?l@@,$)
XankKPYYOQ=o+)N0j9POUCj&,,D2hR!.0U1e6NJWmsoZ]AN>=RkEFn_,O/B@@l9X:1^\\_q5N
]A(TTe5jag!g7d,.a51egfU/=!Gf\b3[5UN80:6W0Mej)9%t+Lu,F0Q^)+<]A;QVk5OB@X)?Ha
W6G<%**COO8%gLI<\;,qGAta:C7nh\pdq\LX)XQU6hQ=20ML6E+]A3&M_AYDH-`Ns<F+qo*Z%
'q\j0eK>]A5s=4DQ8I$*77a,sV*X?0URO,VUMa<1iqLD65^-DsW3L77D?Uc24N?21CYdh>*d7
#=Vd'%QdgtEHfoKE:=`.[af.XEd!.:f!aJW2DPpleqoL8&CS,;3h;T4'l9B;j4H'lAY!G`YG
gLG*SL#?#iqQ?$.JVd7pb2-%O(\9U^/l:`[MU]A/4p,ibjM\PLL*oK(5J<s^WIu5]A-$f+qpoE
'q2(khir`fE*oL7$ss'@!o$4Y:TJFUgOQhK?$43uOI6=o>!O<SMUIhDJSYKGjOG>A]Ar?nuZ[
W>YD*)L*Jg3;MV,&e#>&Ee'GT#VV.$VcAC)P]AE#tbdF8.TqQ!Lr`jD#k%nRK#''Ae>%-hd^M
'))`[i*b0ELM8XEs`]A#RJ?.@\S,e38WZhNp+^[9F2cTtQ0HGc25Lb(qj,7;@+VlcB'kmJ,JM
*N<Ak/-Q>W`ldI<;(2,C[22HX=OqH6st_Wcp*I,)o;?6?SO3(9/[!#sZ-Dm^APQ8)qMP&7L>
c/f=[;U))a0\1%4[>MMOlS?]A;9D'Zd,`!OHjhIV)f@rhlAm875+>h`3:I?2%`s@Ek:u`0Mh!
=tao]As.IKe4?i8O=^MhC[4oD6V;rH8!?hR8\LtqGjX,=\lM)acpRf#rBja$FF%8[WKd(o*P;
U98fpicp7$D]AFFGn/[R./=[(<liHQ'EP6s*<bgO94D$sNin;Th4BetWF$csJ+=uHaU%mH.5_
]A[%hWTgFKV*q;5oQO13j$k!S1TFD55<W+[#nMFF$?3*f&mk-H/PiC)!da5rB`?k/0AFO)D/_
n.It+L@)_A;]A<pENI46b-YT@[t>Lb?=Zk[%+D?k7R+kghM%2Op4;Ka9K@<BF0.A*ub)hW1&F
]A9jM>HJM7oiBErL.D_8<#1/HSoGqc(k1rtdpWQM6jiDh38u)F"m?N79:r`oENYPFcHtIAO_j
+43X6SM/ipK*A$ZiaFcl'Lg<EF>lWAfp1R\47]A4P%V<MBC-uB_4-s?Ru#N*oUZqO6Fe[f.e^
MXNE5Ennca(hu)o'NcQJ`.cS%I)i#`E`^))>,U7-c1>O+DXljRdHK;j_R.mkZ4+Z[a/i=jaE
2G\:rc@eGiXBdF?-($#V-)CN3#,G8$rAnPYa<Q2HMiC*M]AHEI8_&iF(O>_:7?DRg$,#BCjap
<3FY>UTa.RNZh2f"0?5!Tch<O&_Z(hB+84J`DA]A#t+ar+aC@`q70EVc.N+^$S/^M$pT[:VV_
<9`g!!5=M=,Y(<q2jpcrZrD1M(`=VELP\UF^+PQP"CbVhD_CgcVjYhmc.b*:n^I=YXk-tKF[
87c1`NHL]A%BaohrcH=n\8\B`"!Mek+U;l;RHlnN[Z82hli06G-uej6Ds-'PPI/b1:C9S1<@'
Z_ilL=<`3g`APsWE$iN?i2c3AOj9NG?E'+d>hO.<?5kh`f8OB(Oo(`<-#;O/\%bm&1nBJ&S4
a9,FqE1AO*R!JZD&c-#N<qQT$ZgKZn%Ob%6UbS!mA>rL6]A1CTihO-mc7gA^>`//C#M1sJgMJ
eGE_)k3\\u0fo%%XfhhsX=P-`JcKF'!'%M.0l^m*4N79\DLF<\EJ5GZ9.9,-)^;/?QED_\Ca
,Z;_5L2u8P^`s.16mHKeUrMoV+Rm:(?JPmjg-7>r!XKC0hbSX==?kq4-)[`MO5r-[XmD0*'p
.RFGr6hWVh'cge;%uRf'W;-U,jP;*Ki6hV2>);XM`uKh=(G/j:Y[?m8hY,Ud9T2c(bcO[/Tf
l/`3Ej?/fjq9t(g%lRqd,eonl'NmEFK]AC(C_K+%P,*P:W2F=LGDhQIK')%le!r!%^+>)p+\l
mk5-Fp<b,&sbR>o0qDeUIo!VKA64U8&.Lf:*OGSBm@k,P4os2,:7I7*.)%oZ_@3.#u%/s;s!
Q&d*D97hf[>2pMeZ>rG:=gEpeP)fW;VUPU$^`!5q[3^<:6mDS*B;Bu$#.>mbPIQ;l`i^FL0D
:KK?aX]A>UlGtt$i)c6bVGX!po7#j7R`fEfWpS_K3(nF%<eFU4r:[P,0:Qg:P2ld+DCsm#<NG
=J/4;W!B:!sV>Ydipt*@r]A5gc8PFo6GRORMk(87XE)dBfSKF$K3=o2IH^^e#;(]A_&Q8_<97S
5m&O"\AmW-^]AGn>&=ls;LN:]ANOEW)Wk?69DYQI4o&LNHmt)iSgF;%5F<Wd&d,Z7Yb]A&B:Z4Y
.*N+pUNWUR4ies(`\!^[k$D,%4/dFGfN,!A_\m\\?=U^Q34QHI0H/9r41^"cPM_O2(/(MCk]A
^6f]ABS?rfToTD>Hlj^<B$<Z.<n&f-q#=Mq(;-+;Jft+Ku-j!c%ZLG/1^f'jf"nQKWmf(\NtH
"YnDcCTqt<rAk_aYM^D^9Q@,4)CRAd/c]A5(*.[VZ3cFP,+TLOmfp@Q]AnZp6&i0iYQgt>B9Nc
P&%pS*^*m,KP8/H,sT=o[dffmc<Z%@PdBAXs-qFDNH\"4?9>0V4%ojqA`KNGK'IrfZ$d)T)k
r[>qF1Lb_h7-[?Y,bSr\f``Dn9%i:=#5F^>%U0lV+4aUASm'4.62P\p\mO%n$D7U^`G-4CUh
G_?.[I,Rm2OZ%%fYZ&o7=1:kgG9H?:]A]A]A52oA!"5]AfJL'bHpGT>3-H+!]A!*ASfj<f?q&jCD>
U<*H?;Po;0+NRnGf4K2^7>[.[X?0B^^c0PHH3MNY1Fb!Y`^3]A+i%UFpG=b5qL]AnjYVdFacGb
[(s<E+\IcR=+;/f'm&l4ef\/2o8;LJ<erg1m7V_9<%0:ODq]AaM?5[$!<6&njYZ5WZLhOmaLu
gkdkpq<H[!YU3_%DP&br)3$Eh';5UW_3UEQjl;[N%6,$iL1@0)$h,]A$;IDa#u@=e,3p\hj7?
"3;S<m^a%tGMVlRPP<nr"2:(p8dSnm.gGO)RhLLLi]A@*.QAAV($f"'cCPk4-j98SKk2dGUi1
0GTP^CQ/_]A"f4)h]A"A^^EJeBX&hs3JFX%8c.K8-f6KTTMGkc^CDZuONa6cfU)gGjA:.K`$sV
G+*?8;["[u_:q:2`_UuL;iF9JED0hA@YW8,K:XP>r7Z2$2%@89cs62m'(4n-,S4%o'Qr*t2G
=dGT)[-ZkqnCkK.'>".'./<=X:8c5W?`J42fqUi,0qE/X4ic%B#l7iK?pp#Q)U+[ccTEh+b]A
VdnN&5osV0l:<"d(<U6E"0G\l`iR2Tu=EH`0U(@[,c+.K"fV1GYXQTA*[1e'7s^[I!W41d-&
)E!Fb(4S^5OiMk%bHJ`AibMB$S0Q1OiP.6Etg_C&KYS@j`ppRiHaI4d%8,Un[L#j_"n\^bi:
WU\0(0iLoYI7l_U&7HJmJG]AmVeNH6J.O6e/?\O\8o2,umIfZ>&(e?W335*4<neB:mmN%?G!t
3a*$YK!oorOA]A"09d'HFpjHM%@aCN=Zf#^:Qrp>5H\m$*aTe,@ZPq:%c'NbJm(YAGAC-K8[Z
V2!t;i=j<_Fs4dqfe)PST!cK\4]A,j.AYN9jTfJa<D-VtM!k$T_45QtiVWY]AkW:E&scmJb:0\
k!3:'g.$Fbs1*^9`4)m57^hA^#GbhLdM;D8Ef;TsTlX#3GtXlhWM=cTSN-Zh)r!>'C2=T<Q#
8%<%&#T=\e7N5:6r11>74D;rtHZ75\lk2IO]A!MmW!s8:tHFZ=6HPHZ`,^TeDm'JLS@HLVR.*
%V+MDg3's#PWaPVu3HlZc<6m*;Rmr6OatVXPqDWrh+SS_tjUOb52O,H$m8J:%clHV2RdWet<
")e:DOs3^2WS:C%!p'P;j6&Xi1O+q/_afY%muQ>Cki%33!XYA;t)j=ka8CLEhr\`iRPI7r9g
DrQ-14X$BLmpc-W.B@>LHo@hom(O_*5#kC`b-/+f'M`Y[rUMQ-'mP)Pf=<B29^'8bGs#\LJo
1cg*`Ypj/ihM:AeV''G=l1bcIRq#]A6N%_X!GEbrG@jLUBG!PkhFo;C@cs9gsBqX0D%0nK"8F
8T!-6Dfndhb'sm&BRjJjl7V:t7Di\A93oRR-HG$^R$cY/YpC+\9g1oK#5YS?]A57SHWM:`_/d
Q(i!7rn`UMbFtN;YMKM#%Zk.)ZBCAD9V>bpHOn0Jt=^-'4%'@Kt+q-c?;K^eF=ktn,?X^iAo
eNWAN^X5h[Z<"+),*i1=sU#D,J\B(23EDX>oMb\9G2.gZ6!N?5_Yn#l)8s$.8m'XEbB;D]A&9
3[YfkK/UH:*)f&%GR$$,')#L[CcTlG/YS4hm<!^K-+_S'_M&5[rQuqimh.D^XRJb<LXA'"5_
-)Ln,0Ei'0<V>g@h'%ZJ)9GlP6_U(*Wg.q_c&8bWP>#20E_dS8nR44K97[.WdmR!g'4*fjrN
*`6mpVAKZ86Ri`_>`WjccqYo;O!O>-o$@lj7"+"J>"T>Im2M@kiJ/IjR+hX!<6[/NjepWAh,
b5rJ?cGoB:GR4Wn,G&!c-KENGBG"ZIpUlY24dpj^9LWAs4:$B*i>2sn?91G;nLt@7]A\%LHtB
N.6>DUpS<)ANH<U+;7Z_<t_=Rq1*k4kdYULWI:Zd57d=Y:_'L&!T-I@$l8JCo,lfJCcX<)p6
6bTHkDH`i6\(:"W-H:)tNPe!5[n=.U0+b+eTK#8VecU,B:^lI`NP$##A+I?<chJ;[Icu0>.'
&KI9pj`Xfif;tI>3q]A2og+dR\u(dH'a0&;"=AWmF882<[7NUncG5,L3iAGkke"k_HcpPelT5
*.uf@!\.WnPH@5+?D]A]AH9mrb:'Tdi?Sg;q0$2t51dNY"pgeNYq0oD0a\<9i+*]AIoVRc]A<0pF
.$-uO;pc)MOPbck;_=W7jh:-Q;oR(6i-/Ji4P^I4mQ#k@;!ZBSG0Q,LGGH@$fbdnVGTW;*K+
>hSMMY"8$.]Aq7Ro=JYf]At9F8uo^SKk,AgZI8M=TEjE+"eHM)u_t>W#64>fYP0`6P?[#]A9,;T
3<$LL\X*3'^h]ARPj5)R&d\p*PcS+uHcsM+Ad<*-;E48<n->X]AfTdICQ40l7urP?3b+iRLg1b
6)*s,H!&UMcfd++Q#9Wo9T5dmQP87(aVcQ.(2(qjFN%M7RtL>'BW$&!kY]Ahku.rT[oQp-V,/
d^n*0DMVOL(qWCeC0eXbQ<OA9D**`qor*!p]AEV!<qq?>7oX-cW=KsDNO\?nu:S.==1]A(E(7"
O6TtIp]A#GrY%"+1KS+=#V:SgHg.eX&e.je4%<:T`b.N4bB<5=/n)4Qs'RCC.W7B5hg]Ae`['l
f!HH2n`O^D?a;)/b]A_-th;]A^%?AZX!F"jm/eoJgfM3Oi]Aie:%oK0ad9aknT0WO)k]A<en,VPH
%"l)JNs'aeGV@2QT<>'W7Qrm"DA)_]A1Zprtr^pS7m/0&m=1Xd5MY,^Z7P*QJL%)m1QN81jOi
ubt'dXXYjQ8AOC6BMpaiRYea:SdToZGtE`e*,Oe(mRL?/O=?AbaQ63F!ZeKX6TSW]AESX?8'n
30UKf&.kb<*8?$Q6bc(0/RiRPe4CJJ1E*`T4)d5U`5]A?7ZV$WpI;ots@?j7!nYdB%(*Uft6)
N\h\!2lAka?d_BBsP"u6(<b"$iEQ5m;@B_Mi[8BCa8bDA;VXjp^ch=hM^R&C/r?Xm\?8il\<
U%k(h@A8XBK=;NaSS58Z1M+Qr;O@OPVRed.)l5MZX+265sTlo^`bS>+X6?t9*XBI!9llXS2[
3>[88K?dL&6Z^S7Udkn:r,hkDSaJnbYX;+BT`ZKD6Y3"kE1\0[8l>>`K\H:^/Hdhl1V7#,U[
HB8^qCs)JX:bGg5aEp)@eG]A:Y$H\Mdi=%\sB8"G^LCg10sO<=,n@O__<5+[#$mKG/>Goqr2"
nU*iheo3ma8'9QSI;:cnkYKfgDg*<dW+@+sEZbS(i%d(QNZpcr!%m:$`E'[p9JbRkV!I)--[
<[d\KYCe-3IL\3$o0%gpB0tLX+054J\B,K5Y*:%7'5oUhsclM]ACO;FdW6A7#5R-\XbGU%3dq
J6UUpEd3e)oYU*6/'XM=upSsGP6<1<L8PoVn`m;e,7`dY(_Rh9KRj>'^?;m^sYZo+3>Ooc$;
34"GTQQm.DF'fF#AMpNLO-<=h$9q%.DF^roqbbP8-j>bhkq1L(,]A`2Z!P%;((1I@(/EEskQH
pP/`.Q:c"\f*67@!(W6CD^QF>&o\\OIUNnoj5>QL7fVAoXl'8.K=0*>')`\.l^b;-dInl;;e
L=OLna.f<pYSN3[Xn#`AY8fB-lT1\a:p5r*=:[8S"+C9%r]A<Y86Xau$B#"7c)aYf;cM6;mn7
=rX]Acgt%OjK.6nbk7u10fe^',JR6MD(jgpUjf*6g@Md+)0_B"*L7KU)Y$Ncf/]AFD2IC8q:9d
pJ7_)]AAU^b3#`aQHBmV*E[D@GN5G8sKRMC=Oa*GY:B<iXj7^$F@F3da"H+H\\]A[S8CFLjV+j
@[n3^pW:I^Ve=6J68`Dc)CI*UZL67*rD?&Jkai1'<7Z11_/OEW%-$egaY#GAkXAQD>4gAn:Z
"/5WJN%(f@$@;*:7[uTt4U;K36^qbN\uaMU$\D\\)s(q0og_dQpT,l7q3qolV,BrUl*S9]Aj:
iDbT<N1lRk.$1RL)^rTr+jnqcG['QkQ^P1)6_s#A-_'71k@tu^\#)Cd5orX6Z!KA$_56Jo3"
kd\*%R'sL4Rkb22PW^6/dj0HU)/p_m@?Q"^<rcFH0.r8SVjW8m$TL%l3\puZVXC$q$s%'?T^
oLbHO<Q5GP1JHWT&3q]AMn^mDG8&b*$;%mBS5SeI0,r:.kCk/:Z:nmaoRK]A`^EKG-DoFFpl<F
bS?An#Mpb@r%RZJGa37X3+Xpni\jF\:;&(orjg9$&mLp/E."mkI;fMI1]A[o&-aX>?MEV&K+3
"?"b9.:Pj7hB*@uXjh=BA6Yb(',MK.Ce-2k#Ya0L6u+=Tpb>)mRuC(L.Na1pc&+kQ<_geYsV
o(l[%C*[n5O'[OPK/jkS]A6"]AACf4fg(Wi:qk.'/@#b"LjWW6e4!f$Zgbqdd2P$1&6`@>hV3^
^NM(q12lY2j)f/^rkQ)G3?b0,fSUA=E`gA[gB7P.=C>pOR0P^82TJ9J5LsR/16[$SWIm^2X+
oYD^f,j?@q2HE2<`lKm]AU<lT3u(2\=[<i2[*,O9>0H!/<@J8'`iXqJs\#]A;,JLR.HI&\l@>L
:8dC;*MZ=uC0C+/DuOu-rd=iWa3nh<oqDu&mlt\k`Ib]AT!WN,R4g4l!Q@2F$f7)AMDN@Kt_V
c9Mm:2*YRU4Xja<6ki(op=e\nbr&8i[_rmT4%4%*/!`@=.?rZt'0+!6L'_J#=2!'82]AUDBB-
^\bBXs`d*R\l95;CZMm./[*<#nV[qFlE)m-VXTs^a#A#ogO0I8nqF-S2#VYZ*l3U]AY@Rc$_F
:X4PX[3B#:481+=@(L8VKq>j457m9,mh4RnA'fHYBP0:Sq-euH-sfts6.IuLMD$lR!CX-@ho
h988G*48tN@!+e=ZE_KieFH%`Ch%RE3n<O3/HE)rlfGJ""_hR%'9SlXnKE5O(*`'r,a/H00P
dTiE_*^&Ac82"rL=;JX+J-[fjRr0%W(JoES?9c)IKGFpU*r$[gf'MsOIqPgQdM\HrZE.D"O3
/.n$\O3o+f^bTb\PQ"Xq)^kd1QX`W>nNpLYu;-4+0.)8k5`kRDg<Q#PhS*FuBZNZnhmYjEmW
3TFp]A0>iD#m4Ko>OKi_1Ak'5-6EdG!]AS@hP7eMO0.l#Q4I4;Z(kOjnF-G)Wj)r!r`K]AHQ)kQ
C=7.32@dme]A">j<_pV'0OGG:Oj!CZ@4sDg\&pJF/);kSmgV]AG;c3`O9;f3?Kb7J++6]A!#Wub
Bk.hn:G3+`VG`ZH_Yj:Jn]AT7f$1?DjaXpn?VOD^4]AuEj$K^8$#mlo*7!)SG"8?6iiudCB%n.
^%BGq,4!jK*%-eQs+'kB9RHf5+N]AlI%<;XDW'8-4q,\!m"=$NYrD2$#B5`Xqqpu8S';^>OFM
_2[7drJ]Ae;sOl#UkeSCC>_qcK^HYehk*`Fr9YZjMLO&N;#gmIPZ`r;_hHUbB>V!gP5^D%`$n
O99T0?o5EFRm)dYMk+!Y0CX71hB]AkcV(*,-9bBI5!'8n:*YEt_g'_0Aq93M!"9DA2S]AJI1-K
>ob`]A_tK@Nu4CMga\+0h1;6'ad**eH*ND72l<2>q:<Wc6cYJ'd",bF^_]A\22MhHk5F<0)OtL
_#$U,FQn.Ps`"Zd0;<h_>@,LW!0;=)XndEgM2]ADPt8p2QuQlK&k9"K6HLk+8KuK4CNJO/iq'
Hu'#6Lq:C^hN/?m6,53.ke&6q?TP`';U?s):eE@!UUUUjb*jD85?KVR_ZMe3B[;EmJfNk8_]A
e7rM_2R(:P^m'EbS8W'eHdNFsE.9s/a#!]AuLf%T"f]Ai<C>T%^GUceWZL-@@6M@h_f\lO1F6A
t^'_n".f#k>a(kc<LX6]A/B8=ZCkd8n7).1Q<kR?b)X-9#%p+5(jH&4lOp4B>)+?/uI4RBu`c
GgaP0/UZ8br5fh5M`*7l6WgC=KI5qKel.hU<e'h\)EO!+c=!%p`!H@kM6#[<3C#eE]A=Y1g#h
rWG5DJ(dkpp/bK'^Z=P$bHUZ^UA+(Xk0SN//ZQ?FOH,\C-#G?+\%RS9Fc3@'daIbE,'Irb2@
r:jkKK]ABDT8ZT4.^bBLJI^+K-h#0\lls;gJ<*^//E(4*_S)APPA+$bh[p-48#*C^bGB&Q8lf
u!pQV8fO<31r'Hfd0n1>_-`k)jsN%/;BL`%X(,m`TNb.Bd3(J=nEt0aIi_+-Z`_.J+sr:.lL
RGPb8YC-i,Amc2L0df1<]AD58u#,nJ5/Fp3KSFUV+(j^-jW2_rH#OL2_j)Jd*q9dQFAm7a:4'
A(jF2Klbf?C5=41@/+ii"ojJ5MX=J<;c5k[tnU]Am(-,.jg88NDSG4ELMi>+mJDmm`Vp%?a!9
Cc!Tt=<5J6(UeFj`UcdU!A7^.J=ij,)P@`3XFh^B00o7M93H&cURC4r,JThB5.QVXRn5iUpI
8P9#!;qL2/iXqrL7\!9Z$PCR2U?1hbE90:.g8LZ.dBLaP+QSAAW/oiu9!n[Ie,s8'ne:4*o-
6=`X_NDio+fFb@G7t9+^O>W.IIo#I:D;#06e%\c^lCU9kb^:B;58g2aKINYo\\mCZ(+p6n>]A
@=L']A^KOonJ?;e7\-_CT51dtnF9KWQ-<1.$sUlZTHloTuT))+BUnX+N3Q9_V`0*150/TB7?(
PW.\IEbP7b=DZZ&S3&+b0L0n>7E8qYm%g@^&_.lhjP.(jEj#oi9IdFK[q49;$6N0GTW)pb'd
-1X/A7m%fGl\:p-mg"27=-5P'eW=97m-:^l9I.!Z2iCn7SN``0G7AF,2nj7='c(f99a_9)$E
V=5am+h>o<"&WdMkp?op\S!Ge:LM7eXhJ\D\ZGaWaQA7X=!InfF/0WR)U&I`8]A)l`jtah:rh
b]A6juus#6qYV3aRQ=X%TsK<Bi;R?XrNmX!+KQId&HA^c/?O'>*)pEC=4lYOOV##TNCa_Db%G
j+7[M0"CI-)LeibE*FA@KgO=V)aBU$gX;/7N*ju4JhSI<s$/`(`??n3ngT3abDg!,or_FHL!
B"@&irO?k;ZrB,Y*?2;[jLLCI)m6Ylg`MD6>N[UZD_'<LA5!U2d-j,Su&cOISmZ"Eq)JGc\F
_:5_VY[;;_2ce5nPr]AsgG(.a8H>K<tAOImIN9LlKrAaEiEK)btU&ZWjbAAU%M&0hFIWdjQ+0
AbPKeS2nb_OZ*A2(G1oah@Yc39BPA>Y%`A?^N/R-?d-)RB$%f=GR5KMI3KAm4j]A3Nrghc'4)
m>m>1u(+jP9j)-Ws5@3/NsRgohNAbhpE\oCVTE6.aY&-"!O>$?#Jq$%KVNp&3?Bd+9Hu<tZ0
VR5#DH=iS#^/*\H/lhGUB5Bj!J8FR4U48'kfV(NVupKIA`Nl-l3_CRlVbm:`uB(..5%lUq"F
_')p]Aq8.),`eCtQXN_!-lM)f$rTC:C;CEtF^+neD>l<-eGj)mYOt'8==i3GnCf=5,r'$Bgq@
X.6<U]A;@Nb.pU2t*YrTm:iEs&i<K>.hM.^Og?RS?#X>-Qd^%HHNj"h/debK[O*BO2e@H1Ji;
b2/g]AOW$`ic,d!LOI+L/Y<+9MXHi75Z0g>>=&LbeJbtM7r@6m=p$PE)='9#2hGh2jg<_S*85
$hiUL1TM/:Bu)2@U2`jb-@^F',qiPU3@nXXG&W(m95lVHl2^lbd5AL6Z<fg`VK=(3Rm#JKPH
PkgtuW)TI_7S%e?$(2(O3<jcVNR=1ZPoCT3N!(#-BL)pX]ACE[>_[.#:\apYqrA7&Lick>`1S
jNIq,(<A3Ac:aqOe)?5Cq8gjP2(S4.2n0)^L96ILC6k5di+b-O2i?PnDh(QWnBI]AC>5)'47"
2Y5b*Ku;SRsi?$VU9^=,@lp`BR'$c&mb`o"2SkAk1tA'oE1)n'B4r0OM"[`Uguj`*N;IaQ_t
5`7<l<m!sS3FpY/G4<THLI\tC>e'Kg\-_L2Yf4d\>tW.mh"cpPINLcN^!VMX2/=>I@uJ<nXS
TIlbU++7c@kY_Yo4\h$."$f\UEF'pi=J-riBa(Z9?6i)Q'fE@-B^$Aq]A,d-AL:N\Gha#]AOT'
d@BclYj$gtMb9+ag;3JBs0'l&fna)F*-cDIf3+Y1ObP1sXi@EiCmg=F$)<J5RJ![m!#=p&*!
=d>h3bSqGSj*-4;:t\p(&Xt!k^QRqcV>i4IJ%*er#f!D7YXj%_XNMF$@@frS7&$EUcE1JAF>
t%ErgpG?hn^eh'^kcL]Aa2"QH)pKeu58^JP'IkE&tQ64bsnn=PiG<ZfiiK"25c7'V1p+CV5Kj
iKIJ+dT.)=;5ZLgH0`a[[hs^,V`)]AqnJ^UF=N/_R]AS5Nlr&#^Vc42W0*#"-2_:QK()9BJ\?J
!fDOLa`57g6s:bj>es:R8oF6XOFI`Jf;RO#kOoG7u:82)/$l.BZQ(B_\B`!R)jm@E*3sa-_(
gcbRSi4L>fg0NB9H]Ai^E6NPTN-IJu=4bk^RZgm5!Me#m`\&%H7gLm8/t/%Xt>3tGRIR%]AZ>D
B%/Y^8K0Ke^+-uiThW_q5Zr#AZ;#fG52$oh0at7icma0mp-ZAdQcc6PJ0/B$!*B&IY>9<"A&
;_']A]AR@PXkdY#0X8J5J69S4WI,WJb0LUZDT0-,k=[t8>=#`Gpj1XI8*G!Y>.*_jiHJ!.Z&rb
+\)U[YoS5+DbZX_Zs*)2FZQkZ2tgT<!@*\9Aso`!C(qE5QZWDVHY'Db:;a"i!KIsgX$k",%c
RZ:dWJ()dr(p0.^H.;5*CLAb2cOm-,L!*F?S&\eDoW:hUfUY#u*VEqo/;5&71;9p:=a(J+LG
&K7hMAX_;bmbVOS9=(-jX$N1%$[L.69&B3de2I1I'5PXo4W%Vo8s$7/Jns]AT.m(WMsWR*m)c
i7nbgkaK(XdRJ)_P`lk)iDU:$'TT_rKI&+)-cpkc8,jKOf3W&6g+QZ5G)+]AX+?-&#1WZdq33
dI_DCcPk_2MC?9!b77\lTq0BEgikJHBRVgebj#.R9%X4<hUj/DIc(S"_?,ckNoOEEcuq2_YF
0E"fk?[D%g\#H-UWRcd9)i5b#k6#SJfBscrgFS.YUf[2d9'7K&?Tt:[:VXjCj+iGV*HH35Uq
"f<5+@&m8B^qR1N'tSf*1)7K/Ukg2i[Ni=ZlX1LWPa1Pg3;7+Wc<H<m=1=YX@=,BA&uAJc>g
f?l,!4Gi%BWLpUL[TFQC6WNh-kh_-<8'gXU^OTtFIr@,A%AH!l:<2qbdrA+AI<3Xpe+<d>@1
s&koF23oi')2Bb/I9FX<s9>m?`oap5Geh$k:FA^0GXb/L_%Z]A$qePg0Pmg1/UmAoG$rUY@MY
qEf]AM]AFA?K>>UWjr;j;R>n:VuOV7r61NDT9tahU77%'o)-*2n"MmriGB)WQmLu*LW6,dMG\W
njbb&n4u,G$jek@@]A[!f2T=FmerCN(3g+hE8beAi&F<+aVU`J%Mt?-'Y\8#<N5l>i%p."sB>
Vu,;+c;Sc1rYnO6A?I1WYV.pV+!)`E9$dQ%-e.13BU3(_t"1mh##/T"JE6+hHqE4&cd'/L$-
Z'6?[a[iI9Y^A(*t1P=BXcMC_U/0Hl!di@uVfU^Y3Of?*dHC48Db4*Ml#-%?drYdnlOEC;>V
qdl%O5]Ao;W^fI@3MB._e=GER=gdh5pBE6.ndd>,(1qsUR21VLW!<PW[YUVemHk:6@Tj-XO#[
%[lt3]AR#b9"*%c/_.^Oa]Ah-&=\Og5WK,P.sR^\D/2uXA/rqrP'96M_#?dk\@&$%\5o[`G<nZ
KD$tsm$mb!qs+PF*L\+gEu/%E?lsfQ*lD$"7"+[/gbF7r/TGFh7\B\rKk$1MHm0"?]A&<M\-@
k_s^c9k]Aj:p=EjaYT*#_O@ehs_?e,?=t\"2Cr!OSDVoX^)6+B:)7EOSmc4[AX4?V*i[5`:JC
\p^Q#k)q[#1dHTZKN]Aij&[ZR#mOMPS5PG`;6*,T:#HP]A<,F^l0#bSG-upcaM@b)DYU)A5d_c
Km_)Eba2!pbo(;Lmc<kI8ZeoS^G!tkMM(bC+jld8FNI>eJ00pKH.hp,-\Jh!Xs?<F=bRb]A:0
[HA0%"A6b-TlTeCJ1RCLbY2-H2;$j7Tqg!81W/9q"-hh]AA7@TBU=`Rima56\`GUoP!dEqdOb
kqB>n34/_(.;87Q4qmB'B?GF;pV9lV-Zkm"\b6[G?J>i.@EBSHaKq7pm-]Acp(!^oBJWGH4$o
E<46C8F\*dpRB_<S83Ul@M9Sfp['18')=F^48X3P,!/8!r**=Vc![[E$p)UMZ,ja!\<\6V7`
\Wl;dJF#@9rD)O8D@1BBl=clMX0Cms]AWi9johG-BK!XM=o!GMV`7Hp@NUDN1.9/"^^+@JJkK
CfWhUe%[5?+T[bH^A%P+M]AY/Vg,B-gj@rQrT>-W(`CC3M*#Kan*E304m-&Y;s,es*FH>@"u2
+#B(1_:K"O<foobT"fBDM^3CdPM>Q4>M%[InjDSt=$G:$G"-OZ"si1pUVSBi54,juXi4I:?i
[_qdoT1fBkjM.,hMk9#IrGeVmJgX6-<i+t+6?-^]A'>QG%j+icD$L/tk:1#9X<CHE.;UlQo'I
FN;)%kYF'6(Hhra'nWE4h,jZ2T@?S<Sd#2)=>VH/kFI6k\PRQo%.lhX20d:LC%#8Viq4a61r
[,"U2E1?7Y4!-#Z?B-bqPYB,W\=O[4fo+*l2gW@Pd&)X<0iG^nqPtHF\0O7>??FV6<%ZmEh[
.NOcq86TBQLXu&K4-o7PH3F.0ir@Z(X=^3Z6)Te[^-1Bj`Ya*VFj_0QU]AimMR=44^LG(X)bT
/f6\>HpF8KgGP<mNdmtdo<Ir\u>=#IC+#0:<m)hGjS8TGL]AE1usH13I7>7F$!G78O6"7#X^T
:'s/Ci?9Tfis%8IJna-eLjIlnNaf=22`X!]A'$9S6SZ5<1XBENJ!eTOj6ltEns#rHR`3`S?X]A
A=DUGL0&&n9!mgo1;uI@`IPG[6>p]A/#/0'*r#KF(^O_%eOr4+B<1EAM`c`Ed<:+!_),TT<q`
OG;64h!43ZmG3h;Ni#YH.VK9?E)hQ1oH<JsQD!Y!RPqK(5=65ApBFZJubc35XK;P"26sJqW@
j@qNU#W5OGU6KOLX$_u,a"9\5OgHf[I$.!iDB)'=i4sd))eiATcn*@:?)]A/=JI?3IQK.ias.
Bg28-EE?\J!t2^"u-;&ma0lDC-^Eb*Ljcin9/VR:%K$p$Bh?$`hnK@MSebj,lSJU,K"He7^;
RLNi'Ob[l+MAMm":k$H_#2DBS.@'l2iCuR;bllS^)``Z"$Mg9Mjj>O,g7`(#Q#90\k"WiQ5%
5[0[KBVI.)QN\U]ArfS<01_u4@tFTR0@`.grFd5Y_5>^Tftk&#BcY,)X_9S,SWF)+KrdJ^fkg
NfKdCr0PmRr8kc.8eWlbcGc+NgGEj:tk(PE9H^YV@,1kW-4-]AXKk_UDsUr3Cq4JHF^nJ)tl5
C%iZHg/T![+3</<.K=B,;G"N<LSHOO9o1C6O&=Q=0=M$g8:ap.fSQL4Y!t1fDXD"OgG$eTs@
S3Q4r#pgKOn_!KUV!!!*Xn!lUAo3R\,0OK'9<.#aS;UGS4WHLt_?n6GblSo%Z'L?01?.I^Cf
#rGuT1jY4J>k4I;]A,jQ\Ju%=22hPdgF\FhTJoQ3n@1oK/>6dZXR;Hj__H6g`X7O?'6Y:"6,k
$fZ4+nqGTEe)KBFLHKO<Ud;:n=\JYRioOrh\U1V8UI("VeO+PePR,Ekl7;LG/_N.I_U3E8&`
_agP8bH(C[SPWp#B96_8I+/GWRibg/RH1%0KaRUEmW0N^n;jE2I[L5[a1+_1[E+Ttoh@%=#<
A6i!*PdNmcf4C0/^-Fg)o(et?2[^mjE@eenkr(B:i'r`mTR]ALR?%S!n2'^FZ<t=/Y6$/od/\
^B+[G\^!,L\jXrERNgO7!H,#sJ?'6I.f;XWe1XD,VUr4o*H&UB,(2)2H^59t#8gi@.:G0Zri
OGSk*,BDrsD"Pbr2DD++%TA$eo!)X&)3]A1A'pGYsW>S;[O+5Th97l2Zl("RVj37]AXb@5i\<R
"QN]A;Un^lQ"n*oMU<bHp]A**ik?jMe;(Nk:Q1%AlnEuBU)M#nF8#Z*q_r5MV&?`1HW\KHU+"j
+QLOFep<WS\((W$h(WM-.nWXkN.7?OZZqF/Cq@"An2b$L[TAE0_j"WC8PR9Ig3bgsR^ceU((
.cLt*NbOil6g/_-2R$]A@N=SU^$K`gDih.`&KLJh7?XMLO^M0;5Nu^)[HcW$'t=afluQN89/G
LCS27MtT4LD:h7.H'4A&l"gsbYlYj+o\L9'N^qe2kNf1bT@%gOm[U`%E$5@oFg?4'gdG.,^5
'5Z.CfMcY_Dshs$d/3Le:8RH!:3!BpHq@HG(YBRcAm\!Kc8E(d$+B+]A(ocEnZuX.?<7DeaCE
1SSN^s1,.[hR?oX)7Fem;J9L=A>L($`P[o!DdWK*)$odr+-'iTL@.,r1BVhtY\6Hpo,7m"d"
0P]AUY;e4fOpp]AQO?aClZQq(nH:0+Z?X)iGWN&hE1%IJMI!/NH5`GOCS[F3j41F&/N_IF\9mo
)6qYlVj9@4NDe7U/FE'ZGB,C"]Ao+(hpXpR-qXF_pK@Ma72^q?q.CI9B[6@DU(5jghplm78GV
'j\L4mAZ8a5Nn*otH3WiDP6ISJah7#^M3S'Vun\\..!\tfAj*QTAUa+='nhf;uq@:R,Za`4g
X+nY`_SmP!Xka)fcp*+BR!YAqK#0QJ^J78e.#"R4335t1<+gQL4ZV:G+Z"=7N0<U!/;jh)?d
XdUl0KG5Fi&&Q5bO/!/?N4Hm7Zn1pNB.I4[J+o:[/@2>ZJPli(aXV8%2)-p<MQ!,mV<"XtH5
lpApf`$bJMmf6AJ1&&G6%%:rr>20Tuqp9i"V/"(@np[llBRoKfh^7EXjlVRpI2>8NtbT1[;"
B(I[N&mV;8,4G<j*Conoo&'E!6l\PBe1OBTj3?AY@SCW-B<+]A4NWV(T>-/mk&IQ?`&sfW39:
pIin8cVOUjq*KX]AG*Wa.Ra,LZ&R9s:gb7O2U'r_cNm)-9h,R"*oJa<FZYZ`3qt+l>\fkX+lA
P$5MH_(-ga'C]AKWMVl]A5cKL_I0\"._4+uY2LJ$['dp]A1p*r=BO8S1(kri!`]Ai=`4`?3Aa)Pl
(95gWdhVVaW,c?:<`a#,U+tJ3pLe`q+>$7R(o;^>;D+oYc6KX%D)iG"o(%cdp3<=GK8j@S(-
;]Augl\3R7^(J03q]AHjmH@GXG[-gT^\>3'M"pamjI1FfJcEa&@&>kk_-1(jW@d7%\X4N3o_SC
Ui;oODY6Tp;cd9gt1\^fAP/\P<*A+=.kW-1QB,$rMPa8/"*(DQf*RW05^j(p)c98Q5Oai<-r
J*!cIZ*PMI9.jt47Jht]AU+NdN$tCQq00^setBl1f\F,afW\c;N_\@hNV9e=(*RjlFDN2=?YK
[I\b87L20Go7Phh&P7AV=-)I]Ao/OVF#5)&,,Bl+A0cd:jXI\BJQt&F`A6/C3V9G!RP<'_/;^
0p<RKSYBRM_:=D.@Z>Y9\Z.EU_9d-Z)*locuPbL0:O0EkdkiJ!\T$=pS>Oj+2OO<DF:!&lPZ
&k#Zm`NR63YX8Mft$_Q.NOqPJ4[$QADE9!UX]A\?F[%M*Z/guV/g(]AZQi)s23D"pu@hM)8"4n
"7EWnQtr=[,q+R!'+3?8j9_-56V%EDl]AL2`QY*N4bCak<If7@f:^,7VA$"bU$@M7@bOd.RJt
gqK291M==,tcfB[I,@[h2u>.mBlr.$8)<Z'_*Z;e4P3\r'J-(qOr?o1(++g=E$Te`/.L[@pO
b]AP#/jZ[O39-iC8Qk%-u8dO9[)p+<d[NG?B[[s/H+)J/?%W9pKWW?YY'-W66'1J4==Dn2f=G
!\1n.<HR&W$0a/Ru'reo%8D)70BLM6%oe9CcFo1dDlJdmZ28@Ocm$<EOXTX5,B0,q7=sar2R
<-cXc["JoY+m4OP<RE=WZ]Af`8LR8(m*i7nV3F]Af]A5P'(BN9?GsL\FhmWVA?iq0>-`DDE6-n%
Emr_MX$R=j+KmId(7*uMscD!;aX[Uo);*9g$c]A<c@<ST;/mKA0u07./Q2Qo782+jK@5[.b;E
;#,o8qM(nZc-f=5"TL7guB\8:p,c`pFB*f(99$NCg_"smke'8T+AUE\j/RFRZM.J3=$7L$ZF
NILU^XDEJGc-V=eYj\1,_1<O9T6Og&<`j=W86q72Pu[66GE0[$*LHrVdS(CD4/4'8^QFU0B%
W'P%;&`;n!4@[Vo2fuLlN@r%\2^^F)4mN6uK-_h8pCJQ5`d3BM=%iQ_TVa\rL[9;eCY(\Kfi
GpdMnWI.J#paOQ;$:6iXa\IX;_K.$k?G(m'#!EG6U!dd:P2nrP'rj9,eB]A=>*ggHi_P=C%;>
:;M&Omcdodip3al.gUT_`:5Seg.h9gkALqAPj%ZmWJKki6Tq,b!Fk$L&HMC;+4O\IeR(qKY*
gO`AmA.D6%]A"^)P`9(G1Y@)>+E_XE6na]AE"&;=fqkA>1tW9<1H4d7g"]AiSC2RP'fGk'3*I?`
PcpTJOfpOqkl9VO8:eY7j.r9(gH/o.dg>#Zq_A6619PMEcq_fBp.5JY^'>[6Yc6qp]AWNgq#\
R!i+r*1FS*:;kcR$8sRUb1:R`u"2<Oo<>OaLg6&3'mh7CK4&+N^X06KVX\<F<!8f'%Sj=*6p
bn-nIY?l#(YnCl"\+;Mfr,*F`@l=9*_ASapLs7,@3<U3l2<EIn#Gb<s$]A&'^*f/Sis.+AW)"
cR7Up1p'f-'npBZNK<;ClH(jeH,$@:4DVA4#j)55.hT'o>oIERD]A2OpR2%!U+l?L;Xdbp's7
]AO8H<qp;)n<Kk\f5:[<7:[5>l36IuXVI),JR;$Wjdh\&RNj3Grrk\HZkq.BmYX.%$NhB%XZ?
H[NG?l6$kq!D\XA-?c$8nN=kF<K)E!A$%m?8A-.[i;XDa]A'PUNHN8IHhqfIVPqt_k2GS#A8V
a?Mg&S`[^s^M.*,'mN@#ZJ$r-6;q:eiq'hqgIkkRlljD=Tm;oiHUd0`#%TJ6Bhfbjo(Js0``
+kgAg<hP<p,g\K6Lon,OcfqHT.PMCJU2]AKu,5$QJp.r[j;ji2&U$:M+#,70,tK/7q4gkZ2:7
#b+#;fM_Jpj)p+cMouj<cN7=D.kjTnoGU#$El%&p"E78jfS,Rc2M4No;)RF+^gbgcJ*ltB@L
m_TdAIP$JXNCh'8JbZ^@a-pGM[Y;8WK5S&(tsZqU^<_N%\dVOLSdNp^(hCWsjrm;pNN'HBc!
!@;-BqB`Jm8HGp5_Q^aG^@&pT?R^h\%W1&$o\YA2,08Tu[UR_1eVGU=G5X:59(NI?U%GHWl\
hC$DYS&\n''U,RI`@"X!._r*5c,YK@P/$-TjoIZ_E.$Ljt6[?fOZQ'njUbqHkpP8Sc,U!ABf
$kB<\XX5sm]Ae3?@0iXXRr?kK=Kh3pS*1EFGd>X<[S.']AHZLiI`Y:I1k!&GcQZ%.X?*IXIDNM
+[cd1G\07rYT(Td4Qr!9Ls"=q]AGShn,DCon-+7eE-\%p!=MC.kbKnUZ/h;@po+nEadRGK'`V
CA/[SiLRX"%@s#SSFm3Ltmk2$gMN)79"cDk/7M'_9`+4cB=pA_psd=&lt-btR`B$lPXC1qh6
FkJ>5r'Z?7D"'.;&+JWb\MO6m<1[X45uO(_`(E4rCeb6VL^\6Abl$q2R2P3mlT\StrXiuTiB
b[cJG;$&.2[!mpSAW$2oP(%aMG^?*u(XKms5t6$gWY#h-pZP'U67fI2Q[#4d3+D;"48&F1!`
u%l`+CV-nX!#)a$^"X=G+5)g-Qa40[Xc37qiJOQfQh]A"L(Ehr3^;p/YG5>d?IBd2H%8PH*S@
U6j,<?%a.9.,(aW,3VW,)mtf^nl1UhGqanWUYQ31EMla?a,uk7$nQKau72J=A"=Z`FcNm3L*
9B+g;MQgN8"hIHFcVPuG52db.h_VlLeCo;`d74c%kMdAad'@b)o]AU8MY*qa\uPbOhW1;1miq
8RTKejtS;iBYe\$_=tSY1GIk`]AN<eOXkLW&A="<-k9N1)`J>uL2NE>q)r&eJ*Z,3.r0p<51]A
V0G)UCgMkh`pufbVV(X*e:@of'Y)L5Lb_D1/S1S!4=aEKP[sL"Mp4.eS:dX\Q#MB4]A:J`[uL
al8^,_S"b=31:Sq7`!NN#V4Vm+#u*,gImYr^7K4gUb]A*UbKf<R2qIC'NEqgk!RaL]AK2^LY-G
Q@UW7?-sZD,jT`9(&cXIX-N!&q/,RL?bk\&L?jcd7j&=)oQ)9_q2-8/c[2oQ#%^.GOX0GROO
m4hB<Us;=lO2U@-ZA.V`TZ7I('R(J+,)>E;9gnu6pg)-T[>TGtC^6d_6T/*^0CaO%;#TT/V]A
7Y+bU]A_?!f'QR;/r3aSMfCt=hNb%B&J_u)gK:<!4&JIQ3_4\#GIb(p=J`,%.`4]AYg>cWU+53
l!UNXnPRlF21iN9oIRZ8_f!TYX`JH?+P6b.,G%d2f5.\NbZDTM#cpPP:4S5"dA=BX-K*a-po
L;U#!mnk]AVp\Er3dQPGV7.lK.rA]At<_5&lniLL\JAdl['r&#TVqSZ=$-a"\>#%'cf`;)G.b2
e!;p:@*-$Em);M1>fBH&ug-[i-$.$KD*N;O+Nf;fgK:IBWge$4m.pboV57>WE6FW(TFf+J[9
8KRM$[Hq.3?aIXNZirbt:#I!p\!.tq(C>c]A2G8$DJD:$.PNX`@HC(@@Dj)q(I%rZ"qm-!%es
Kc=rL-6bXH"BsjM!'C^8V!Kf0+Y/Fc6h4GWed?_E%Y_b#gmGRiS$@r]Ac.`mHHma.Ce3AIQEB
m)8Q"cW$]A4-gl$5Zs7]AMV;=#QeHSFGW+$g2lTVgf+:&XC,D!=!12o"I^03]A0'\r)NAB8R?ZC
eN(HTWE-l'G1^R$r//aa4g@TgdW*R"aVY!)JOl6[Zr_&--%1l#a6j#CO"W+jmgha/hS[1n0j
tZFT1u;^1p;4b,J7^Sm/Ni(eZ8;f?_b@\&S,;T8,Ul'>14*EP'b=9bdRriEgmis&.]A<_"P<.
V5gUMFc45;[l&oJDc=8''$*c@F_WSXrg(2'&%bR47]AQ2Xj,e*7FIa96me-;di?]Ao=`q*ju5I
Koja!S-,#]A*4hDN*I(4L.5c02Ol%[K"O,K\obQ[I=)N8"2I7F3\DF>g>(@/-+);]A8W<bJUO/
`5s\<Qk-Rs5DQc+8q[6XZ]A;ouXAY85ZCEOCJ=O)=o/\h]A3T%@Yam-QAk0dRdp6HMBh3?e-ha
hAI"B]A1<]A@rdKR99]AHQg?4u[MG2$^:O6=MUan4Op")WemIF=asVbcq&Dfq9)ta88.gR@VJ(6
S$7<;=!&!B$Fn.dNYJ`JG[r%]AoTd;UG8`S/gePK=('I;H(N'\,=c9fF98H'Wf:p+]AKE,mBWX
1&;:jYSMW'U5Sane!gj;]AGUs<eg\96+BD+ksu1%O`Vfes5&9:`S[3:TPgjh<r"^l8q\H!N_n
T%7e,Sdj><&K?Ku$4?A+754l;mrT;L:[;h%Bkqhodnmg:Gshr<R;q:%J/#q<+uA3@TA]A^`(/
ESk5joEf4%#`G<kFVS$CBZ[q_':WlJ?CY\b1JJjY_ga=V&ZIbA?K@h$#R!g3Ha3KGA!N?*LJ
d3,pK1c"bdZHcB5MM!eD+4@o3Uqj"hZb%<?S_PBJrgp/-LGYid17#[g?_@(NFORV4#Us<*8`
2);k8I6_<h!3qX%/5;"I#bFg[@>$bHo;gbbm+g.>M9:0,4N"D]AQTCh\KMH9h;CV`lfY5`*.R
/;TWdUEAH-jB?!Y*cLVC[7eFRY5MhQWC&1`06jE]A,>.DMP.\MaSC#Si]A/!les]Ad)=nQZn\pq
qpkE-aAgpTYfMBOf@6q_+tIFk%L0\e(<n%[Oo9<_SF*>\HfnBD<7SDZrbDr\!2g(g?mEc*co
f?]A\$;+M97'7m)-T.,mEeSh*P65d]AcB3*HCVoroRc-d/f'8-50TX;raf0l`\UAA%Go<1=N^p
dYdO(gb(GmB=t24A=Y['tG)Mj9g$a+-1bJ_`<T2ZC'CDDb.f9*$-XtB;jdm<&oG@km^i8oRo
1]A_n-KY9eCfKn=(/VE.5*1]AQZm;C+!sX!m.1iY#7__KfM3#I?R'IZgTjQd?qA)T]Aj@[huChL
?2PcOgsbJdHH>=moVP:!"MTk5_c?eXP'IQS8&Q1")oU\LebkhpA`.Z1;LYPlUhP2^L>]AohaI
8&-GJDd+^4f%cMB#N^<jhb#@X1AWDF+a(S\RD&0p36.un@2Z)ih2CrbUPEbkX?h7T8\V6#pQ
9gD3V".Y'uW4roq$3ZHrtm6cIZ\gruI'rDr$d)0c2B"Y2e1,DFZ?ig0/G&(B??QPO;oYIpfb
tTd6Ilh2hIIF_$rqIi'dIoTK?RP;"]ArU(/bSs'AV'X(mCX0I&-sb':0'AIA7Y14qf\/f_Wo0
)HpuZ.`Q@[i*?ZBWHV,^X.uI3\p-c3dD>tMGAeU>:S^pKFS(F<R5d=rmIZtC*7hEVLa!!IOr
ki&X$Dm,Vh39>0Pr^_J-sGFB#XIgejdCO#nik@(\09cOn0,P12b*cq7Z"W<KJI1Lb6%:,ZER
kVdC*#B`b[U"G.Aot^pAe(TK,DdE)4H-Kp$p=.PY(A3cLq/=Ze!etX@1OeZFeqQ/fs3,mo<4
KTCE+uKNDsWh2(*dhWMj-!Hi6O]A?_3#k@[HgZm+kr?YR@=Oi>dPJtn2+st1N,-%4'Y(OED#G
aSDXA1fG7gYIiT8gP`PGI(?pRUnCcY]A)qbVtqsqo-(0?]AQ/^_.3c%>%76^QfVIdGIL;)3Q]Ak
scS6`Y7h/EFeOimj,fbNRmef%%),ACU.j_9_8ht-F><X7Y+s\d/j'po[s@@JE-Cj=X8Nn>3p
!^bMmBm3^TmpC-@U/Zm,D%9HZbj'B[HX>9EXWNB^90bj:o@,G*T$=UqWq[FCpAJ3ZQQK0u+3
9Co^bD%;n23M0ARD4bGRZC?!-2NrI&4\t1qHrd\5?K]Ac\\2G>=pB7kLD5MgiGDMj_(*2Jel$
OV%e(ur-Z-a#pY7\eBq)$&qiW..V7#[*Z.5AL1:gP'UZ>ql8Q%#:OL$-_sbQMB)"dJYd5/^9
C[?TEcW`@I3@$d525:Oi2q]AUX(0a;OST>r]A^O%E9I^f![M^0_siVCoSR6f;*6TM"1/6=1t]A%
$lS=mbIg97Z;T$T*h`*'WXl/>QEMXZIS!J<o.aLZaVQj"@A&a3XP=C0\8-KKuD-#Vn1l$SW5
62Sb'gn%kn_M#u1*B0>VoM^XOCC.jLt:P___lfI^kUrOJ/GqCkkB=jAD8h2-3S89QnS*!$_J
i?GTPE-^m%[9sjQr(:;"E)G"b'm.7^,'KEO7%^g>o'dA11M%mqo-V8MUE]AkKP*<^eqe^rDTJ
655TW6+0TU*dnM5aPj+G?W)'QYK9Mt4dZ7%\K_MZQ+K$;+'DJ(,]AN"Z0]AbjqmL9Q'#h:"u<.
rc80#q"#s<1n>Y92?V.M//Ldp><3.OqeVV8I-9b*cU]A;"X-4>9=A)=R9r2HB]A6!/B=piF#?!
%#hfQ>\0;,g_\tgZX)ujLq^4^t6h$Bd2c_L6.d*+hN(=%!Vnm+*JCH'Z/?UW*)a\4k^nd^f,
'NjDb'O$Np1AKo'2kF//Qt/#hfSZHbe'eDN2l#-I,iPN-fA4IaAP6?R@%W%.1?=*gN"NfeP,
V']A0_>_T67W#TQ3-<b`W\kK68a>4Sr1$qiel(S%c'-.tkE%U[un%G(&nR,lM0Sf/ZR4>LP-H
Ugf,G@+o=QNN)R[k2aVrgXp+3[XZYKV%6RJg3!)(bm5j)T?-kcEc)p'rOX*ur)fA"S)Zd`+^
/j:98i:X-Sd*$0*XXKt'ilq52a*;GpX`>,mQ?1[3BjQ,jq;=]AC05ki@?]AJ(Kh^mC4@a[=u9L
ATmqkG?Sh%SPeV.EOF:#C1MYLALR(B[OBbP^R:'r#:5:H)HVMCOIr:m&M`V;Ir:Y]AM8m43Bg
J=hR'l6<VbiS%2^R+[nUB@hJWi?UUD6RR&24UIgM>Kb/e1:/bjh%b=LS^=H*EYk!@2"Y_eMD
gol\Unnd^"[.'^I%*.A/#o2_boCuHE"']A*sV`iH=FVBW(f5K^VeUANH_oW6-hjhI&)0.>4aU
>=2rmZBW[oLlLK!+6a*-jncK/2>YoZ:Mf3N-d@b#K+u0P)dX[F26<M`c7]A[W.,Ap:^-S!Z+P
LK;qT@70VD\N4S&S*"eoOU8M2>l[G[[O:';;MBLN6;?"r^h1c=./\r;HO%>ssWs(I>a&TBJX
)+oMd4]A>Xp*fV(hCW+4#iK=[M1KNX)]AK@9j&6?\W",jkW_IA;l:eJ0pHBUCeMF3!UBePI`o6
C)%^S:sEt=j#s8CTb+H$@flV9psZ_@f8[Tk0V$T4.IqTi?(_(R(o$B)]A9DiIG/WaJ1i/i:ct
9?F(@'PW'f/4^J@!:1QFUWC8.LZk(,:JKQRbG#cKara:BZ;:_\&m03tXqIf*ZK:\?=h@YW#H
Qtbjgt$9b-gk)&l3;+!V:T.`Ij(d?7FJ,ri6j9p3e250[)%5b77jj8IY1MT@9Ce%"/R-+f8C
8POG?"P39jd,)<.o]APFaG:IaVeG(&;aIJYtBGI(b?3HHVUHsF37>:u2RkINH!`AdE'Fo$YbI
@I4Ke?bmlq+IJ//sLEjLAW3HUr6(o[6OTVG1r/%OEH-5a!h<Q$GbI2U!;'`+ael(_=D4W^RW
LN/l^j1n/h@i]A+s,HVjuo4@@MRu[IoV/;oE,e[UFi%cVcl<QVl4@>KXn::hZ"H!%hmbm^ZUp
'kKan%A&9B.WCb(,?bXK<AeQ`UR\u*.CdU]Ag_-1J<=#UHU'CqQ4t2Ohm@S:Kfi9?TAK)nH#D
n8J,<?!Cl14(6MZV1='b[JX<1Ys5Ri(4uR`l_L]A?1/d>]AbVQBP_+2)8XC<#O!(U&WDTt`aQD
Y]AWN$Q/Z%;ZSoV"si;9P#$J?S;OAI\mEH.N$`A6(D(-Itf#LE62qVfs!9nV!B"Lh<A:GKeP_
5T$c[;hoI!>QpO'hK+?kCA(3G%#BZ#(j\D*;HR<]Au,n7I7-<5e?<Z\pV1u1O]AUK.R7S(]A\p!
G%M/O`cj03>`KLlg,f65-2rbf#l:R-/`hi[/u?6Ze?;C4ak`#6;d1Z:tq`qG?_d1rnmE<RM!
U=7tfCPY.F=AGRB?uD)4pr01XgQUW#/Z<=JK>Mik$6FJ*maoE&05R.j^H,&s?rYmbB(WF'^b
gt?1#kGO.S;A(fC(FCFb/l%]AI-N2)7V<4H1J%-S_7tA2Ge-3)EoCS<TKK%M9&,5T\FNKDq-@
r$=.fiLr.PW'Kkh$mA$Hfhd',Sr)/*nq#;4ejqR'PPl4-ZS_93R@hL5@0l9AdZYYZq@S,O4F
b5^D0@<:Zk>)pjPu?"7n:!p_9./J8cdIT8(+4\l,%IE/m6F:ePpFfl]AV9WFlD+!iR*rOTA*D
UM06;)7++pi>$Dg_4o,X8E$B1ko)e-hM)6SVGd&ts6#`jG4O=Ak:XEf>;hsf#g#7H:/g%U4,
:+-Xn$l9!qrA*8%Q$[RpZ]AQj20C&8o,S=dS:SAt&$C=arA:/ZQ#c.cbHs_`RC7A<P&hPFJ.p
Ra86t2E##2?CQA'l^j"X*o.,)!P:1UNiu_*P(MEh;9;OK>,9cU"iX#?%(-Apt^KBUft#+nQ$
QP<.qO9(pH_F1r+a?MaV^F0j`uS%cT.ep60PY`cCJemt^?)B)Xa4iQ&9PRu$/i*liS?8rY?R
$Tq?6!l%#3b&1??d>up%QeKR4Jn!K*Z$tuIonJmh^o^58%I!XRUas,.NZf#S!+UcIMD.)D4B
%Kn&S_ndf*9diV,\.\fMu!\hD,Zi6`K$U=I=g?1ahkb/nbaje7I/;'AND@!)''L\]A&Y!<3nq
K7d4%+l"u=3=W*coDr:gjsrWqPK]AV)eu8i<0Yfu(d-Zh__Soa@fODj025l6V.eB+B]A!Bq#ej
mt6^@V!%^K_Z"!D,1>a6.q[G,$+[2-Y0o+:FfGn(.fXmr28..8!HQc&2#s5\@dB:gVKSH2KD
\Hr2HT[NCE:2>;Up?W9T"[aY(>B2A6N[aW),[$afVH.qKhh^!pQjW/40YQ/p"jkTJm!;`tcE
p.8SdUuAaE,*i[f#uEA2m79Hot8CpDJE?^'oZ4V\=-\8m*)HKaO=ZHbEEV;]Al.ho^)JZ(m6d
EtHG59aDh\(.7(I]A)V&(eAb<2k4c<RfT1(*M'pqq&Nb]AFb*/0$@A:bCqfVVhNFpWP.[U_P;s
_S%0.J/6#Z"**/KcSA`&Fb9uNWAV@HPlOG+g8=r$q/WOMK\1^+Q?8m^5;I"L@[k2!C\@i?T+
nM@4[OJ\gV)Hf!0cp;ECAJk32g6YkaJ"O"eE`B]Ar.HT>N5dcp&970m@P1)(VrpN"&Ac_7Jn#
E/DX7N5bluajYTRHTpNm^d3_9Z+MY##?aGUeW$G@RT_39:V[4rOiX>P#K2bfEs.Olp]Au@tW?
^a[>Rs\PW-hBHE=kj>B`=88je1>ZM@ue6l=T-<o7]AEfQCA6:s)#_Xlqo6eM\)*0LmI*$`g9H
(l_K=5<]A_g=C^"!uL1b"\D1-k/HkjI]AiH`K6G-6#`RnAmIQQT5n&c0i^/%0Xl_j`,N%nh([a
)/;AEZ"H6<U]AF/*Cs&$X<Bc:3@G2RVI/s$V_M2cILl7ZnY,[)%Tc&:G$`utTRCl@_Xcs.+?,
TlII'sXPO$if\:@IWHU1P5S<uG/i9t/"*]AD=O[3`_4SAILUXSEb+jX(_UlrD\(do+h4Fo02@
#k.U0<K(J.'qiVS0HeY1j'EZ_jPn)E^;^";9K?[W=nts;a4;W,*2n"+\.UVsY7rYPPJiB0r"
LO:Tk#gT7Z@s\2bhKN]AN$8*k?a7D+hOllqHr]At"$\8NT\KrSX'#g\\53h.WN^YIDq'h8gVW"
ps[H\BrDjCM%3#%J.gR8QA,cN&QlYm)2lm@_X3+i.l5G6P"M%n;+UK5b__h$c"UMoVcEH2jK
h$f7GORSSQPMWsA7JiFSbP<.-)Fl%9?AQCq#)H$S71\C3E='S@&.9jM2r8^;aO7H1Q%LFTqp
@,clFYS'\+[g+=YUa@h3Ffcr/hGH7TABb/m@-8pto68r]AM4?Pt;oD,aKuFZ*Tf(H1Rq/IWSb
rF8OqXmjj&'U#p:coPt8[5']A=V>]ADG\;G@D?;#C,JrZ<\sF7<9*,lXhA?Fcic\#`ddB'LLU8
ktgsICp_iH*ntbW$kSb7E<:<W(W_M_sAYp6&`DKO3nWYC"r=b"CXYd;dcS&f<qns)2A<\)dh
]ATbD6`<H*U'CV!X,@-[Qf?Wc87ucEB:BPIrZ.+$buUlItNR7oL!*]AY'(4?5PUVV!b]Air[P<J
;<Vu7T3M-6V#qVN+K"0j^V#]Af'#<AgiSeiLY=p71%7QlCfrf[hWMTft141#2\Ud%,'Y81#Fl
blG52q<DB"QI*jhmJGbCnRB[GB$eA2Q_oTanrW.@T\:4$Q1]Al?Xq,9XNCd&9Mm\=TO]A_I]AJQ
#b['M)e[G%9/)L/uDCQq'#XW\8k8DUa.2=?2*AusGC2&$tQ]A/8P'@g:%QHMT)PBhin-a@AuL
!@K%NiUEo1;c+n$k%+T<G;Z8e_H?h(B3k9F$fX*nKonp[I5O')mTSUHWiPI4B@1RUEZkg<2(
RcC:'t2n:hD^g7$OSP3';Xq5.?>k.bs<0mrn%55c;V$e5paRh&[dP/!lB#b8A^I=r!9U8k.A
1%pTi&!i`o.6c.h]ABgZ9%L?H<E0R9rOREp3A#u@Irp%[Z:Wh)S?bXF@$7JTSa;e9c^ps'ie+
`\gmE&s8!E_s+)X1!Y!n,FN_%m=5^-^%S`2MXui?kCFE@b.ZkuHF+Km8pfMK;;QF-=om,440
i\:$>7"`Q6m^MT]Ai06&[1:\!6"@V_Rjn3`"J(QiWFD,VZL(k9)\f?&DLrc0dDipFfigS=uLJ
V_;-VdV_I"r[]A\PLbBn+E2#YT_Q@G4'A@k;cgEXcG<oC8H!%A@*A&pH#;I;0KmLrV85e6r=8
h=]A?5aVAUPVPBA1l#XQtTBN;k&5bl!#0V8Nh$qcZm+0f5W`f2p.o?ZNMP_<Ve9L)l-:[i5\#
-?2;.#sg1GU3f682'LIFcQc/b4**ok,.3G5??;hIW%mQ/M9]ALA[.GI5VY975]A^oLZ7SdKm`@
:0"ZpE5'I>cY('\p?@mZ>fe9+E;YF4Mn5]AL[lr#,eo;9cMbp&u%VG5ig&oP":9T[a19b7Q?*
Bf1[-E]Ar@c4U\VQcK=!RPpCc<J$<C(;0`&gH=QH+&@#r(!_7Ud>m<H\5$-.:13cEPmRBJK:.
N&%q**,PeR7=V+K>N9r7S>3"'!%fO`WVa9/7i3O1gAg,m8^dtf$LTmR4Bbc=\rP3-N+-Y"1t
WB&J%k-=Z5eAZqF/Cr!=YK`Pk&4""L#Nr9r>bs6E*sRh`#a*u1'1Y!bB7B^-cDLokPD$^JG)
531RD]ANj2;po@tK7H@**:;2hr5*?16fL/9kj/5,qPDXRuB=Z#&>d["5+8)TaXYOp#6MeqpTD
\W"QCt2bc?G:N1!,nfSjKOh-_(>tC0I.b>S1OH:tUoA/&2FPq\;^o,8eZ&3>)s"-``JIN;dN
'?1SW",UPe3]A64AUohB0M5[jIIS/Ii.N+P+g0''7*&n;MrE2m`%l]AI/n^8h3C!S^]ARjZ5>)A
&H-^jZ691ApqR#YO@9sP$^F"7_F/_\J<i$pQ`qeYj:k*d`^8(muq'r^EpS7's^0@S?J]A;jn#
Zkq.Kq.%H*-1WW32o\ZB"$0ZdA=NPb^)P6deLFsntc/oS,rX%bp`(;`96=.:J9cnSVej7hZ\
`eB1+e%:G.C&)d/r(%nB9JIOm0qM`N2_\r$\NBT82/ZMO'Z`Y]A(S92k1&)SKNpX\hcNVHgb3
1>^3,IH*^UsMTI/YI^EfdQF8rD>inAg(#Os>Wc=4fp86S"ib7VL<f`ZWjCGXK.'0:>aNn\f@
m4!$CaI]A7fR4kB#>HW%%da+:0Pg(Xd<Y_8Hpb'orY?dtR40>c`\5Qu#>9"9)h(#cqAE_C(F`
=fg9ZTc\F/:&V<q.`oGe:WnB><Vpa3?j&%f654H^4?0fm:3s*>LCmjQGWh@_R!/7><>:@r[V
H+_%W\;"ZoV1QLaV0TWBl.V8bMATH>qI>!Mrur.sL11H6/]A6Hp2QkiY1$hR_Ni?\;!7:!pJ?
'Ki*0j#^\ThcoZA;6`EKbV%!fT^1ASd2mQtZZgG[lhF&Y$l+@6Xg\tsOGT.-SAVYP3"Q$B:C
=dhb]A]Ac%OkZ3]AqJCd:3u;As4q>3^(\hIB$`1$q7W=#fh2Ot"G+5e[Fd3A<YOh2MPQeKhko4a
fZRF)8!@kc90-;\!QX@)kSN^a2C(CQ'*=_IFAR+]AP9pfb<Xr1,HTp#5`V7hJ#TH+h[2Tbeed
+%S'08rYPUg?0%#Rf:M<$[og'PqF28[aff1k9MgD->h1=lFis*FE]AsFh:.5#Xrgg;Ro"\m+n
i8))$\As)-*Cd_]ADc7=$N6*m:kVBB.+k''k0k2q:k<c\btG8sPDCId.VSkD>\G[_d%'[TsjI
cq3@Ud7VOpkg1XV')GiZ33YbmGI$+]A#TH1KYRQgX$UNA0EMVu-$A/u>7m+Si!_C*TZO+J_JL
%;1j[4&Vcm[.UX0,J-X;![7DRWMX/(&6f3>u8IhB@]A2Tp&/NZ`.-)i%S'62X@tmC[%Q*DBc'
DPM!h>B8FF+??,ZVm;/CGHjt[Y\^r]A%3'o,dJWgUAP\r\&d[7>P?pu$k&!59Uf/Wc@R^FA_D
BM)pgRt-a*[%$[7m)u,$M@qnJ3b^8n5X`dh8LpJ?sd.((Y<jko^Ipr3t3p@\#?>MI6iQ]A8k7
SjT]AQ-iR4je)]Aj_%u&%)UtT[_K`O?Hc)5S*gok'NQq3DQo7-0od!'kG$@]AKXG`<V6_Kbmh'"
+6RCaMN[pS"Yd9$I*fKN94"X1//bhIalc-fWYrWDIW%"]ATJZq\bk'76Tks+Z*q&H)2IMUC.)
2i7=a9dX75WFB5h^KU8MDBZS_dAo<K1_&q!FBGdTDKO+k`4u3PVVpX$Fi$(.Z>X8NE_<$03J
P`ND8R,^B#,$Ij?paO':-Q=\C"QJ+u[,,fJ:h=Mkih7^_Pp&-\Nb2g,!Yg5ts?pafo);D,$V
&c7InOBJO_II%QJ,sqddR)cK`9u^ZiI++*HN%D4YNVR4N<=_00f`4PlE*j=o`ngSPu1'KeiH
8)5J>1DJe/J^&:`Ym0O>f]A@.d9,K?G[OZAXr=TYYSs'<qV/(F%P\C.ooM3U_3gkF(eID5/X'
\dpM1=@cQhcUXT;G]Au,Xn*/DX4SJIeg!A,IY#U>j9-]A13Zgr"<'P).V>td"%b73S*1mO;iKn
Q>dZg3%eifUrpo-G>=]AP7B:ct[2.[G#CSl]A^o/d11.6_B(D)!cj3nX2T-REe\D3W<VpI'WNA
doYmN???`_uR7r%&\03Eio7!N')rmM?8fjI6=^Xr6E2$3I(H&d+H/Z6cnb>O#Nu6HRJt(B3I
E[`MM4cjW=c/Nr7s?6hMlRG7?8%c\KSZ>_+*oC5NN*p$1JZcHKJKpSPM9idNqI4@'ec.iFdS
IM>/6amH?^p&33DXi@c[r+@Q7=F^.;1g`5GuK4;;H^6sFP#Zp`>R@:(Y_r#Qs#SLZSsOZMrc
mspeXRYe3s8c^K]A'/)$5*6)]ADb]At!bmV\-DG\1*!;&<YYF6-FD#bMf'383QM=Y$[5[cjWc$I
CV.7C1-Fr%M46^4#]AuJUro1#qJS[m6()t*K#EdqQf*@mBVsr(FPf\dEe\,L#csLnF4)KV^:%
3=.Y]A>isn$:*b'jSW05K^m#-fd$kW^;k5k<d$_r((?>28ue9:,X6k_keU@IHG4+u+6pSRco9
.!ZKGt$@,7;h):bSB?$M-g!4W6ZW\`RI&Lm#7!VI:O6S1J.sZR\1BQ&$<*u4uE[5N0H^uE_^
eF5qqsLhEaP:8FEd4q=*)Hpagsl9EgU%hO;:o#jm5jGTgsROq6\AQ2;n2F"hZ+\%h[oG.&6r
3\#3t96^s7%M,&NgV!XfW3ahd%X<:#Ou]A;2CjNbocntil<<:EF'm@)SoPI,B[J1fN=<=lpn'
?JmH#0iA>$STQ^\:>SJsQ`M"$rcuZr\rob%VHF1&"TICh"6KK:&1.cH,M=ZCS/%G!9oap+1>
6L5m#WfO5M@/$I&*n2bTYASEGqnJrUlZ#%D>40aC=6X6KC6n`&-U48mZ]AU5EGLY6DBb,@.9=
@/,qZ/B<[r3"tK0-6:S'h$2Qg&1XA\GeF%93!`NqH@N'=_@+b@O8_,UZ-Z``lQ1&-T7jsp_1
kfmRS8\r'[kV(OLQub5gk_`f67u^P2!dit8d_$IcuUGptF9ka*Ne!Ld[=R&QQRCm@M4-_G=m
pu1tFcSo>R6U1d&n`LA"2m'_W^(Q-bijbi\hKW^Mp-dIV^qRhW"PtH_ln"T$]Ak,#R&#XDp!I
S`_Mfm''g2&3VBS#3Er'9-$rLo!p0ZG*goUMkI]A1R&Abt<PWLP$eq'BEk!S97J+;fn?E"p\]A
rlgn+A/LAYIS"%RggU[pD?$oF=$E1F[%T/Ca-bL+i.lSk<2be'iMJp^9l+]A?[Xg-[L=]A6af?
p.Jq3Yht.jO\S;G4SHj1;4N<bBF(Y\j$Z>%iVWu:Ok!a\sR+2+0N.G$8)>2@gBA7;-eW82$(
Wd)6[YZ,>?(6hVH+9T0`sV7^idp3DQuZJhRZgc</ehbJZp:G(mS0Gq!nePU\"<p76sF:`h;d
V[o9R_2VRqeN6_)&FUIGcrkg`<2-8Y+P;U@g'52NjXkf\?Zs!JPZ%*%06OgY$[s6&"ejmR&p
1iKmPd;?0*@oA!b9bDoo_*c)5MLonuOqlnC5AOk.=:_kO6Ka1(lo*cL>XD%_4/o1butVj1aT
cTjtp\9p(N:NIUlMCLDJVn>_ggHWMom.nB+Y9,fTW!86Jm&^o&7*ZOajAn3O-/P-YYACRr&I
c1QW.*D6_R#"5#dT+e;*judR2G0nY?n_GNl&t:sk.ZYrSdOo!#t1&pXk0l#N:?X9h3iW3Y)/
T]A^/b@<EKPE(=4aZ=n@.FonrD<Omr`WB"BM@$('U:K/B',N.^fd(MJ_HhFlgTbmG."InG#h#
;L*:B1mPp3TRRD%:AF^]A?TnS-ad-;P>'poB/nM2IO$UHZ^pF9@5(=8#D\]AWf6"oOL65=^ai*
Apg#@J_I'7h:kn#o7^;-/!qrO3^WTVf.PHrTgeF<g$YB@@JW.#$,;lSuJC22+?Gob'$##/0%
Wki$crCMPmfk\h-^kjHjP$XNI%0qSZ;VR2k$?B`LV,OEGF]Ae,R,7r?AmB'9R'FN5HZ'L59J(
Y=WA?dk,TCU\^<e;6AP'3l$S8l+QGPRuCN7>kd>2Tp=dr5>4T66#?Q!mN_h,Z=>K<UXjDhA=
C$$$R8CIA2*qTs]At(GO;%VTYk9qHAJ>+.E''WX0oKS>5tK@\l:G*YqC/-ho-G^K)%s)s'8>.
qU/aGD'Wgdo4ORld3lidLMGRN#.Lr'C4\@4KP\n*;Fna[D!hcS9$1%c9(]A$r"*a(1#oou3kC
?*CHJPsNW$aon]A[MVlF82Ym,C"Jemo=J[O$ksa$%@W!P):]A]A^Z#e(3,K(l9)+XW6YNW9LfQW
`4H(#P/d4cJ<ssDGT<9QU-19UQ*;eS8-<VZHS(:%;X*I#907LdP(u.8u8AZjLf<qhI]A[ABoe
n$JR%#Z0ROhH)j:ADAHn7o^?7D?YXi.DLgc@Dh:EpCs*"k[c$EG"0IV\FUsf5R[j`+bL_<;P
aY5&EX4jbA;E3o1n)\Jb#sF`e48c8K3H[ZU:7a9-AQGe1OD;09ZFGg:\I0Ni,LN)@^I3M*)#
Y%996iF#UPG:qb<1)c?%-nLsQ>DGh/VQl\P*($3E&(m=43NSt(CF%B?KPBU;`\*dPIBoo44u
W$'6ICB&lc^r>5^oq6XJ%Hpkb(DUe\4hGY`9>OHX$(#S&6#*X&'\mj!h6*)GMs^=cutoQ!FH
YmIBKO6r3oRA\XF<'-cMQ#AlbdiqOB0f&0B6.3hHMooBs1,?%QXaa,,pWXmu1A)r;h2u?3DD
=e/"Z-`Ho2N-$3gd(@sjedKp'VIgB.iuJZ&P(+,$-M0n2,<`o^QF`lMU?J@oT!UEcf)#+"La
@qfr3\aNnr(LrkeCiWpE"=U9?Jt'a;qZ0Lhi'07IbQPsGd$;jX\_66C`aZ^\Ru%2F0%RkO[g
%n5Zc\2TS9=b.p9;(h1tqim,W!')&:)0@8j7s@dLl4GfmlZ1[&m[>[L9fUI-7"J>hinNh:::
O$dI(86sLglAZ+GMLp#.c;@n*IYL;TkqU`EZTHKR[TJ/9+'uMtM2-=,n4Z58E/H?1AAS'trm
Yh<!=HU#LcEgp<ST9hG1DF.!#%$]AqJ/1e_j(DEXs7`p+n6m@9Ka-(HOQCWt7nIGt3"DgXUcp
I0G5HEJG:`G!+_UZbo8X!92hKA4,Mk+u8d:*PLNXOH0B%3Mpk()\Xdb@:9k,dJe'_W2RQh1O
f8o9A8nn6V=p6R"V=Up5i!9TeU"Zcbat+JXnao=a1jWpD8a72b1Je^Q./_>6)BYA8`V^<AVW
dKms&Q+Zr(5X_j9Da5R&2[(nie4-N(qUoBIL+LrC!h@FX^qCuBj+S&X'n'LT[^7S`kjE)MVj
n5;N(>`rJ@N,k`L>3kGB_9?dcI-VL+cq9'Z0/sl(.WASa5K&WQK5BWW[+Kb@@N>U6;1k,eG'
D(5PFiJ.f3GUaE=\#%9h9PR*tf.]A#5VKMVp]A@V.D-?TAdK:;9CA[rJnTI>/)\4jAbYaYT-d5
D^)0GF_;qn9(_^L^@-sM3G[F+!C+Te0=i%+;0.n)i-VP6\L=E7e2Uq%QWf2-m45-!OK:rXm>
C$V4,usY$1Je<8K_)V8bl$]A?-[0(SET,&FYWf1osm^*p*Uc%i4;dB"t\;C..Np8=HGoG0PUu
f(X>laIt[ofk&gTV!"X:M0+!!an67"Ci;[m&)j<DpH;Y2Jr/9sF?9bTC%Y9m86_-=*$(#K5P
]AhtYb87!!N/=9cGET[$=YDI[#Nbs&,)+%.Ea#.MNHbnVgn0iX?:luj&$:H"*)Q@b=#1en:am
*V9'F#*9@6tNn!o7.YF?RaH+^N)9g1>O5<UR[4d=s-VMW"i'qoUfQZ,7?RG;Scpe?SFJW/'h
&QXj:t?21Yb0pMjlGj4\0b]Al5OT5GL=B%?TFAPJVKhW;4$JB?/\gN_Q1,V4"+8FH,44GY>)L
ha<V.)f.:j'Q4L<`>`6eu=Brq0Q8#s<s")G]Aqc5fP8E6RiKh,?iu)3?_N?S^&Y5Va>;E@1/Y
Er'IJ7U?nP9g2p/'.8WP/PANNIce(8USF-8]AE=g.>VDW@8FG=3og\TG$jDfliR/i?)1HW4Nh
DcF%%s@%or(<gSmF.G<%8ikitX<$q@Q,T]Al*Aeb^_Fg`pm@F$Tu$L9,AH0+h'p!H,Mq'eB"O
]A+!nl\1N;h`4UedcSC&D6c5BQb(&AX5ARej782IcB'\YTiiG:>@R1V'?XC.r[a)7gJSsb"nd
LDG7O0O)e3TTSqob+aCc\2SKYlhBX\I(pqa.YLcNm?=-s/'2COG?7tX0b5C[lbP$`Rtpi[f1
0CGVI;8?.AQ.-it,Ho<-W<3P'>>DD>1d&D,+"!rkE=PRJ"+H'V,44l+J-8g62]A3^SKhoT\tl
A*#E-<dXFnp?WPEH#Y",%(,^(96(%0ElshaE*+DUFIRE4kZ:ttI1[gGeol+297^`ZL%EFR:O
0UE+b=e1#I+F]AW&$bh-,p[GD]A1%s8j'5\!OZaP92!7O?K/CZC_2^Ta`--IJKqic\Uc4?!HL*
kfW7Y7^A-FEm]Agtun(T4eU&hqqKTl0XR-DL[YAK5!l(m=joqkC:4ZtHr>^hfS>4P<XV8`iQq
4\",l-Oe_TsW5(EMK=X,YEQ`ld%,]AG3rkto6\C[UBaQTb/*pJV+0kR/@ge`Y#fM+7N'G<#6q
H9a."uuck`*R4ekE^$'=XQ\Ru'.^Poqm=s8X#s.Ng;LXAn2OF2Be!HOP13P=8P%PrKuUl/i@
-2BXjhWPE%hZ*SicSlN;/,GG4@N;g!:Og,6`Im-s=_AKdU2(R$i7_d\3k9]Ai+hH/fE**LK9h
u-!GdilBn1=g<%o:I2Umf`!)@Qi#ReJOJ)&55"(@.S:1$9.s3.sprI-DG506A@7qouPK!L4d
_1=fk?[RFY`(X8_GDoZr*I*"8tDuMA;4h-1MXS8Ql#=`,d$.LTQ2''I6e[R=WSSS33#&N,'h
MRic+AW2?S.0ehqta(@bDn)*Y-kZrAXfe.OQC*_W!X(]Ap%Ho]A?B<aA^mYfr!ruNk8'T;<dB$
+c-Im&_7.Dl^LMC"YNE,qs!@20\k(X?i^L@3'a*4K9D=>SPQ29e;mdOBPNXuq"n'p?.!l>8u
KT08["=Zp-bD#BK#Vk98"6joT+5Ff.>^^>%2@VnEi3CgT\tVc4#2Jnb[#"V;8/mNc%%Ggd4D
]A4-@C&5=D*NeJI-RY*(6*QT,&6:'U%b,+[^J>N`2FK=?I[p$7%L["cg^aD=GkDSQJTj'O$c%
nIfLf2rDES'-8hYh-upP':\=D-k:*L[\sG^jnk0/S3PN$En)i/Va^irk@sc]A&rl@XQ;?>!8<
I5UN+fInLS.^)-mLu[gT2?+XSip";;'R$/rD1PJ&$s*1s&8RhpD[5'Hb5l_i1f(3`Nq:N*#G
5JI\C.,2-[>\3TkYKR0&f?<o2,mT-uS#bBA-7fY(drYr>2/4W*t`.UG+lfJZ21bG%f"SJ,mZ
dEX8%`nY^6Qtmc3BL\mXeF7P8`pBG60hk*998\ed_CjGB=+&.Wl"dH();3-Rq4.3!/k%LpSb
SMN;b%,3F\3BNZ<9@0-pHC-3"F-k+'URj<kFUMHs1WV&?)XtT@;Zn$YGC$]AeF^/<Q.E;:nAS
Yol:S:/e*'(<a[6G-&mSH?'/koN,#J=DMn_]A-6abDeXdHla8f:&^Vd"\7!IB[R-J*PpmMe`W
B@JHe=PW,XpF3LTij\DNj/oT%K;?$rPX_uUB+$o[@'AMaYGb!;B7(]A$K-@$Nt[O[!p.D?;L5
j5_;X*aSKTjiNr^(hKNt#WpE<A3AR!f@GrK25m-/ba>dQI+i8;m;l<XjDb5eI*9%Rjlm3J;C
#E[dp)WrtL$>l2D*k0Qh597R^Z1h8C`HhHjR__ScclPPjXihe(j!t)^/\)AR,d]Apd%41:bjU
>cIW0Bd=hSmoE#Vq!Q!>6UbOG[g,VcUgqpK$:?Hg7d:))-opEhI5!r_sh1JW(>;)R5BrVY7"
sii),JM#iss-;6@pqa\4ifBBE,-Un^C*Y`8Y\A0pAYNkmX]Aa!I/=IVr'Y9k?,D+'n=DS7;h"
M[\&LX7#t;!Gnh"#PuREX)k<GL**o'-3.k@b:T2Gk@2P)QtOJKs8L)AclYdS#QSN%Mp?\C*K
i["&+UdK).OD:<BB`nMi)"WO^H[!'eY<r7T2\*Pl;NNoiO#A!4/b$]A-+S:XNKg-G)7U)5ej0
*RpcAi7%Pg-`c3fe521tjnEX%\r8fbJ=H,/N.I9toG-ud50o^jS`n?O:Vj5WKnan?B^FjrqB
Gq]AGAeK:jk>H;cO_9KL`iE9K$pbD+O[31M0+CBJ4MU-V'=_9dN)5K6\n*jF@f$TcnX&>1$II
uh/;uDcguPQHIr&Gb[N/9m^VDjceijba*CB092NW0Qq`p(1HYr4jXVb=i?laL7P.DKJQ?j<]A
P:q4XY"bPQ.[7m>spEmGmOC'l3<sak8&4'o4"Bt1<+Sp^#4u6D!2je*P><Xn\nH?JEupYSu#
Ii(Akml`_[/)2?T<<D;kpp,Bfcg>#n<T6aYujo6%_4Ar$8icM:8=GP8)OcH?T2KFA@qo3o)B
G%9,IPQL4=VI';.Y0.=AeQPUrj[oU)68#dj]AqiJoZ!-58ljb:E^+DY.+g!fH0YKi)aPX\53:
$SGS!kGoT(&JmL.E)d,p)/21@s/&MXCBTC;#Kd5kuQl[12kk#n]A)i"SCuK%UE;b^9Kb[d)&s
QVj%ECh:Gf7$,r"V=$.J2Z>?L!I"F#:E4%di_A9>T0\IVu6B)dN&>s@5XhWg1'*YbB'5lbni
Kcj1=!Yc9Z6VdR=5B*"$`Hc7#mGWU=Y3D=m%e=BR-9=)dX[>"=K$b`,Y+O*98fE,Xtk'QN;6
R2SI&(m`?qc#Vdt0r4UN:s2:M5$DQRY1>/fE6I:Z35O.]A07EmHug,IqfnR1RE;@C]AY-UJS"/
s79%Oa@e:5D<YYIC-3Q8W<79cof]AgI#Q2Ct2_?[:#6Wh3aGrCGQP0:Nqd&L@OK.e"8j!FC&X
d!#(>K848[@e`EF*bOUsmUNb4YV22_97ErJ3$Z'@Gp;Q!E!/A!,(i.:9?Vf?idnCoKa:[R;o
lB5'Tn-SOh1+i76e-Nr?U2'JY1\m/1`4%FK`Hbc,,\%VSDJH3G3bees]AnWTJ=4=_ag-6k[79
7[Oa;!XY`J81?:gm<'1G1lE<"m6kIj6b,Q?PTKSVqNs%IDb[19I&42ifuUjlBZ3pfZB8f[^d
i0P?B=W5an`cK53)+jk3`3C2qcM3q&jaSh!IGW$V]AUCOYgu@VW(oGpiWsDGNNA^T#n<(=OBN
1aMtG(21AJ[&ga5!e56J+;>qh_?/O6?-A"n$&Z5,2!lr#"@lg\o"8QV<RdK=G+dc*^a;iZqo
kHHG4ED3=^u0KmrQLPg5*,<-CQ9`SS#t>aLB#WSs0@VBnlen@X%(lA;I.B$%>BR%FVoZS_1J
`:IE("0#G\<+49j-@)LW.odUU#hp@Z-Hri%^41!&^f1,II\'.T*D6nXVCE#HUO-]AUYXj;N7,
d\B2n!!RMjln2Z315qa/^`]AD'is1>Yif`IVW9_2Q#/!N0VJX8?<&p5[)=#7Weh<T")]AN6V$-
"6cmWED&b1ofPC@IY4fR;^<pC3D-mkHZ$1?ot&JB%_jHClQH/`uEW/8a`]Ae>ffb+DS'H<P5+
B;.d5kMC5VE@+TVhFhp"B_aI`$M_7?ZIHK2@YRT^#sb=UEX4-Z\[:fBWPM'*\t-`:<^)Z<iR
3klT<ch&`'/JB0]A+<sAH4YBWFM.@<TWFK7+roFGqA1#Q#3-PUDU]AK;p<'Q8s=TBESq:Ma1sn
g]ArN27V]ANO?2&'t2mqeZ5b$e1,g#S;=++5^C)R1,;H!iTD\iEe2:.12U5*]A7=C,t'<FMpEaM
pdY]Ar]Ah"$I\BUtms)n+`\]A#".)"Nph`:iA?ct*i$9\1s(.t]AQpmN8(W$rjWM"[O4eW7l>;h1
/:g@Tt2mUgp!<oZM=HV&sK?q&$3irQ^0fkf.>IYjcIT??k+r()QG@XdAu>,n5@;&=5.Nm*$Q
<9p<9joHHm?&q/#aGK\_RJ$/kaN\ra<CaZD2.BS1#iD532T_MnINf*j4IN$#D1A`t:iEF'pi
;/n7/HK%N)]A_LCd[paZcSK@N"QEG)hnN_eD*li+4;o$G!e(F&sb@SeOm*'2&RmgYp\1NeHaM
Pj0&bWNRK&q5AM>m(`sJHrhnJjHl-P!JiQ\XfVXC;%/)mFb-(3k"[q,ZV)e/M?t.%\d'FWs_
*=p(:G/8lD4>Wl)qmpYmf#,?H@%Yg]AOT'aCO;ipD82f1"p]AW7UA,UENR!/4qGOtA>TX@Z\;J
qJFLfY'5[%UtQLORlK7dK)jSIXjR*c<Q=g>*o0JM#1h`hMX>TGVn+50q*4&mIWPBBE7ZTApr
WTCt2?g20=m)5,oWTRhF@JQHNC;FdjjKC7E4ck)JZum<Li7=J**SETWHd5h4kGCWWI)m1uh!
#42kMuf='^i(BlXiGkCPSJ@*3h<i#e?toDrct0VSAB\#Y)EWiH@<bdoAH8QS.42":)mdk8`E
mf&T:Z>&-\4=B7FQPF`r3?(_3)"&'%ca3WQ^G\BaW/PN4>SUXO:BuTu#&.'&6X`;$5/=R97'
q;EZGMstiat7DP0CrJ[ahd@2\q>I%>n>c(K63,7dMitWp\5VGV$;!^L9U3]AO1\#k$7+@F4`m
>2#eRk2gtR2j&=C&cp&#_R!4;Q._g/tdg'mua'DK_'>2o/'@4drc5s/iTDfF"Z.i-/H\7*KO
2h(#bafW<AaYom(465=`@(]A;%jORc/1k%,PgfsGY!J]At@S-/cY"0D:mL)X;T'e?$GKXjVd\^
*=GXr5.-]A(;I;&>(#7:rCDgXoA=Z/JXK%QHj7u.]A,1X]A(V.(G5_*WrO>6Ee5B#@N8qPQhp^>
KM,[/E:geGiT@$b)B/3ttHF.^R*s+/=*b+p*UX+kVM`o5=6TrcBaZ??Y;Id_RAJCan'tLh1'
jR'Ea*ga`i\.,^Na6A"%NF#?##XaDn5-i"%#f94j#A=2]AH6YB6%Onb49Wi!QTnj\SSPW_0'_
SbL4QO(<)o6Y0#$1rVI.Mg:c,SJ2]A82GV'=oFFgT-gNOB.*3>,l?7h?#u]A!tI)#:t^2OQKJ\
aV"%9YYOD;Mj1,9]Ar<Z'k;-O>>L#2Aqg#eM^Z,8Hl!js._sm&39$Ag-KSGp+2N*D1g70A01Y
K(%.r%CQiFJHoNQAUGSWI>6?Hj5o'od]A.$M:.(ih,Zl:g$]A<LQ8eN9KXFYpX*"3"Us"nrC5`
9?(//dLusK60a"?WRTc-Z(:hB"W:bdI</GX^+^ppWZ<eUd/e<:&BJrNid_!_4?eoq]A3\EDe!
32.6frZV8H;<B75tqf[hmIs:6'"nIWYG7@m>Y*%Y\Sg'j>$Q7N<%MNTk!.rba*[8mW@spVM'
S2g2J23L^t6QEqn\6"610>[2c#`lTuii7R>"/A=G!F`39Er:,.E'q,?s/).30&_mX[8L"uo4
Ujbi>K4NF0m`\rqSf!!5>Np$V">uRM2D."5p7bjjH03<(mmA/$.thRaRuhe*^H=t@>AT]A8"O
'0*[2AZr%TtLhf0DO!CutZ`WH/rPK6h:s/LA(Ij$O*:\ml)4eo3BT(Jm><W=?67N>W.%b[>#
QQcrhSnWat[!A1bAI#-]A==4P"J0L2]A/K9sb!2[NL_nZ*$CleA08XK-*dT(J<T!F1ISQX1Go7
d,F@B%@;KCf=nq`KOJ'K+A7lOM#[;1l+\^@oXtn2K??pQ&5_&0iJGqIo[fQfuDi6T'8;?./P
7EE!%#UAKo<MMp;E"<u<iL)_jYm!L%!_<*aG'M2P\I*d4YDPFLr@1QPf\-IWmcPTOU$E##sL
7i=DTS@!iN5DOR]AmN%!e'O!p\61F`U6o+kID&PSi;.Cu]Ajs!F\VF*ISl/[k=WaW:ZD=a>1Wg
ZIiPi@8k[u/4-E^2&ppG7NEBMK9Q0crObA=lqY$(B8U#.6:fYU5M7Lg_ZqH3JV)i-4O`;1]Af
egcE<+Gd$Rsc3SW85L+1>P*9MYVUFBZ&@B#Y>9jY9kgXK.0n=D'`&(i*MZRX"]AOk"]AAL5OI/
sYY<8`I=F7C2>8:-3?YGS>o'L=`M'Jo2;uj@;FeK29QRph>0SfLPpWYg[Y8N$*;_)KkH5H#^
ap-UY;6e^:P.,peaQRts?mNI5(5o-79Y-S%&6G:6kQONMZor_d0XV#''4V3"q@]Aug^=1!+I2
j^EDe4?5?Y4=c>DlI/><q`IN4g8JM>o$S#RF"5r<r*GuKQ&#S>#mJU7lY(%2^,C'ch!0`Q3+
3jbXieZK\IW_;);8I-@`>HNC/l>]AIf^./=c+G_T:FDadE\1WPSeGq*nA'j(pCEV%7:Yla+!9
`o$%H]A"]A?C7%?62T#6"k-LKs'o=1An[8s^Ik9W,#f*BDn"OpL1aC+?iWb)'mhTlY5uBX@]A]A\
WgM!L6ppdoAfR2,Ho>D.B1Li^iCZ(b?m`/rZ'IA\)eU[<=#dY20@@Vi/uAGL@Oeq8)]ADm\=&
VZB=Kh3iaf2#^%P8(*W:1l(#f=d2R41<]A,*NfWesV-?"88=901P.5K7k;H=%E(##$VC*u/=T
<Qk&?KTt)5B&hmqDA;Hl>4VaU)^-QId;Z?ZoR+cHdDf)p_G^Ns;7Wa]A>j#%W#lsce.F'a7p&
q*=W+0BGUX;Q$9fg0'RD_2a.*2LLf$r:m'E?-Fh0LV8!Y>H<D6'_S&PJk$)PL%3lp8RUo[M\
o$S%Q\Kq\HV>fhjN2d<+3+!=mZc?2!(_OAd33lm_/0]A36Wa.)HS=$u\TgpssQ-9._A:/aofd
/b[H*.$p%]ARZ2&%J"UnpWm;rm"[;e!b7.*HdjFl`7"uZ1$l1HWW\hQaV+!O)`ZmtpQa)n>?=
Kt53^+#P\W?1[tmPof[d.'aT.^&kFpGC+_p&>1+shj5Jg0nDXI!rVuA/;Z$Tt1LhZ6SD[A3`
6gRd[F^m4FBf2.F^iIYum&c?S]AB^WpTSt^OA[:'LDXgB:6O)/[-WK#!=l@0uhp4;YHTG6/1[
fkVeYp:i4<m>R>oLb:]A/QXPjLNDkcuf"8h6%4=@5OR]A4]AE^=f]AZ:HSiYRA/Vkh?k,;gbV?C7
Eb^_P=D0F<G-Vini%qbS"r.(&,n[$46d#rHI@9^QXjWT/A$od$64jTs9k08mfX?5O,J1Mmq5
hN(Urf,FLQa!i?"^iepp&(Z16&X#C%QSF3-$$7^maA7<B)"8/+4Dm&<XMhd8c!XQ$OGMaUP#
nL<[%N'HmsNDnEiLb)!Hg[*2,XP*F7KmrG-['nm>r:S(ET-6[,0i%hK-_0%XMl1ZCBDZ&"h-
3%o2Lkb68Ms%bd,;V%u:#k^_*/%fohnuC[0'>K/ib?3&\=ZMu>7pm3kP;t7amJL*CF?]AW]A@N
KDGZN?%'Q3F1]A(sOd*gXap.;TSdM)>:W'eaQ5mPtZq-NfK)PcF<4+SZq[;j]Agu$k*p2-cF\d
N!iLgOk&tsTC(@.Ln?W@A]A)33jS*L6o,?1FWNXg]Ahb%PRi[b^sH@8(lQCt2Z42,:)ooU[ZO$
hAbK4)c&FW=TVSmTJO0B8>h3jnKP?38R;BLZM]A9d-*Na`K%Ikh%KVKhc%PK,P9u6/6:l;F1j
W\h)E*T==HBkpBna,<CNBan#H^,G"-1(PKjBfXr-+7cg4,o'Vbl/nWj9),96t+?]ATpR8t9j/
e#IC-F&2^@6:N?%#_QDDE73UhO.q&sGgU5M53qd?b#P?cD4tVa)*eQudZfGu!#nM>%K%PIk_
9euo*>c:a]AAn[8W8_#O%smLg)Vl,:ni;4ONd?NH+"5j&#F.V(Mp/YTakZCH+:3g$X%#VqZ\e
#RUjbY#p@AlaTdN\?C(C,UF1YR*]AU8AA(e#s9b8@UnbpE7e"/HmeA'GjrbE\'*O^_WiW_,WV
b`@[gGO+[+^_![bU>>Uf@\8PYOJ[;3)>9*Ek(ocnI-7TRY$90B&U</rAc_W^pN93W$_n<9>l
1C(c065@P4VGM<=(5fS2uUn]ABb-c0Z@P#--YDXe^"c^OZm&We7kQg6o@BA]A'NA2Y_M3nXNdj
$G('C;cD7<bhO;;XHD>TR[pc4V44g_3McCnB;uh2MLSqn5!/39%Dp[DJriNCD"?.U8.(h[_/
,Z'J9kri?GH$%V1>EkTUK[`MZjqUBinfpI%SW\ASV1o^-&10]AC6oqA7k2R>F\\C]A/>mL"8ei
^&#Yq,RKZc.0@\dJE,mDho1^Sc`eTV<H@:?-#;b,H;'R4a9D=i`?`]ASH!/GM%=n.>Nc]A_#<"
"Xq7*FN4t?LG8=%Ui.ecV;&nne!G8%Yt*Eng"Q?5rV9B;dh.pR]AjqW.l?:3JOTLN+Yb9&TWh
GTNU1>h(EPa>Z\b#=>e'<Aa&\5N+kU]A`D5YEC&2*k(8><Rpbli)p>r/<ZA\3M>&3gO,`3]AQY
+/?#WQ=C%2<-Ha"0O*R1WR@n*0Len8l5R6)#2BP5b,6.nfQa2X'k5K!^]A/3-X@-gtTJYSZb+
=-G9Uk<G@RXTV,^hZ0VUp)0hQ_(Ab%SU"hp=?KgY$nXgSuu*JE67"HCHHb`ODRf1r4>Yne*%
#8']AQh):q*,c>e>9aTM\a),SP4C$L>9co/&*>K6P=4bL_jhX@@g`qH%s$l?'boaLC[%+$jEF
)chnHbg.dV$`n7/!SGYKh1"-X(tP1Lgu\ar/L]A>JjBmS<g#R;[c#p/,/00mNh$,U^@7hB3q$
TRY(Ia&CaaP3o**-(SrSZR:qY6Kk0a\s3ac(9$bRXN#Lk'ODVAkpHUP1@ou>/AYnX'\84+*r
f)Gc+jOP$To\TmO?G-`Yp3Ji)U>Z`MTC@g;-q;RiUq!R`.K</Z)e6!44]AHbWo&hJ\$006hfP
W_u-#[<V)Hdg\YY2"jc_A25AQjBicBRr;]A686'mJ<DK+eO8rVJImDX<sh^5f'+mJ=#EZPW1A
/VPA(lm0S`Lk\o"4LQ%c4=i\"e2rTK@J"-40_"RB5ob,B/^p'&V;]ACk]A3SYTN?#Q*bQL99ha
V!9_nStU%nl1]AZL]AMUQn8-X>;Te,)G]AH!jFHZ'%)E$Rq^Z9ML-AqWhA!EN4J?HWdg4cV4L.F
FbHVD4J'%IInqoMXI<XOmE`O(DD9S*;'MWl0fHEl$8NL+OTKc:83Lc^t?BZnjRJYSI)-N]A<j
19!UD5']AasT%p]Al)71ifR9i!f3p3f)Y,Y3q)ipq*(\athn8!p/BWpWA_u\^5E/,]An(VWId;Q
%ZP&cXR18FMA/a+\]Ap;YX^<R^F]A3Rcqn4ElA71Do_sd<3hA9r'LCf%,cR9^<6W\'!1aWA2Cs
:9LDgi4U1Q.mc&.21mMCO/KVN,(?RhQ2gn)dF[HOgh7p6\2S2![D*#hHP+]A*t]Ai:p^Q.,g&X
[Ehf=F<me!9+D<hJdBr#9O<"=G=i[Hrehbk<"=`oLmLF,F=Z-/iaZ<g/PQs:))hTjq$:-T=V
2@9c3Z^5p=L)QpHQiQe34Y#g?8F>=g<U#ma5*"<Bk7YHO0;!%+tmN.D@^<NhY38Qp:\.)E2;
%YV638n=N_l'/DoE<=GkN+2rEG[K$0-^>T_V3Q$8eGgl+i$Rn-%ijbp/MiaP-TJ6!*tJF++:
VNDKL$h!T??'h^glq*Y_2>h_2`Dgfra_Jj4]AcK/W6e6L'BR3rg50$ZT-I*ca6Q\3/?1<R`=5
1o5`C"IZmJs_m87(m\V9'8ElnFVqC'5EfY5PfZ:<gG<;N1JaHlSbrBSj?tuSH&_b7H]Ai[CTR
`rC!3CJ2"d@0Oe%&5p_GG-5-KQ@k/:]A1AM7kCr'hE4"i/YX4KCNXp842?6neT.IdmgsRnQDr
+_%)jV7Lk037$"sNeJ0ch.4fgNc9XO2'0h#A%\a63=fUPVu3b-CZ_tZ6Rq@fLVc!j]A26d5Z9
5hBl[j%?$6@,0^e`lk^hEn+eJ9Z?fai!A)u):pJ.i<-u3oY-53G;MYYi*lq-_J:XX>6[l#m9
T1^<J3U`;.>%.<(Yu*c8qE))FF]A59'%KM^ZX!d8IEAL&i5<l]Am@aFP[=N0hN(4#-pC<fjGfH
VU5sNlfWJ"X[+JMP:_)*c]A0W^Ug7NLbPMb\.Mr*]A[Pip%u-!rji]AV$?2'p,_[6:GpE]AoOC%l
teNE=@"'F:I6u%N+t+Bbju&fS"8i`6208o&le6!,Mf,JUSUo"pP85gSd]AfXhT2"bZ<'%KqWZ
it+.)j"XBM>jl#0Ug"`g(-a<.Qb7&lu<Wl`cR#alCh96HJ%FGI)-@i1Ml69FdnGN@QMmo4g`
1Db#qSBA:.!hH*2>_-%*6dMC[I"7ng=j*ADn+)C+9^,941)+a,4u&N4Ym6!)/+[VDGAW(lIu
^I42g-sQg3mo+C1n6L'^l2i?g:Hj&q;s>J+>J@M1FQL;UV9SmB<h5QO<*MIqbaB>tpR$iL?;
bQE85agmGa3\2<;nnGnqi[CGG%bs0T#-OLET4cb%irh#i;,HR*nfrD0!C))Z^p6&Y3U[_6He
.Kp]A0`R-^EE'&-,Gil*]A#N:r7I#t-YDa/#<9tb$Na,7[as*!6,(hWu?U>MMkiVo%\RdaW`3b
"VDJFUg#Qf"':!oF\DZ".5Wi:`drFb)Y]A8Eb]Ae`f?Tj%=UppLs#6db]A#Fia4hm]AtMtuGB25_
G=/nS_@Qi@-4sdYCXQCD]AhruOhWsVR3,%9r#A*Q4NU\JgUm>&)'>+/9;2F3L\3fP/R<i6sYC
Ga4CDrnaH%oqBITa24.l`ft/t-UJ!AXhkF_(2^*FNm\Cs1[Z;3,a8'SfM0J-K,S_"RQT0p[j
PKB%Z#/rF"r!b!HBQ0*`jf"I.0+Km_uiJ<E_"Fd/pj\BTV*R$T=Fp)Lt()Mj`(7#;'b$\Jg>
-5ZP`ktSL"C/lL5<185s%aBGEU,Q!1%('qo5.IoD2NpZD*I>u"s:d)#:Q`GU;('ME`FBbhQU
q-V!A=#^<QGU8%f_>6NSAu6i]A8jL=B%^mdooMC$M*gZnj'3i.85Na:]ARR9,F)IZ0j*k["!#X
PP\#tNBDXX`[N2,D_`/_11s<2N+k,8X,atb'&AS.<90(.^<(\/#f=8ormtS=^\`Q"c1S6_MR
L6lfs.S6Ipdt4eV;6-0>(/1a\GuRrYp-Dk'#qG.ZpL-ZfM+__:e="Mp$JN3J40(1Ei?@QQ@2
I`AcD8Q?4ZbY*_746mbkL%hK.]A^`+g>%obHF5B0etiJ[:VMmkGVGup2FBe,[Zh[b8L0-kCNn
ou5#gKn&<$#_Z)*0amifISW*JD<l[DT,(COc=^trBNCJS/@jD\-N!4Jh!;@G+M%`e=%6(T]A:
tqn3g@q@(;2f-8E,5+\>5o^<G##b",UT`sFU*ZI3EsSL:!LCQ=$c5L"U_(98]AJ4bd;kdLZ\S
$"o(%IqYd!LS\HL1+#J"^?&!+BU`YE?dOXP17Mt(?>DJ5"'!ce$oN;gnq!j\d:fN13pN]AKa:
c;@+cQ5VGJF!M>k6d#LDM::=Jb\!'*j[^TjJ<d\E1iEJToO4`TNP"ci+LPkda*kJQH@[`CG)
r0Cn;"O3?0I>Z&YR*!?ekkJ_KjX$-mI2,8LBY#m]A;0d>>K"Zn7/3Rdid#aRpUi:f7O"6bDP\
`$^KUc4haAjSsT'O_GQoIM;C>de1H'BP7l`"P<,=<,$U$o6Fa%2eKOlo-p/Qa@IOBHg:<JB2
a8<G5Zhk%JseEo2-n'k?G#"4Zm%P]ARIkgsNR_[,bXnPZ_XU[7q[f!:<44E>72O?Q>-n3F"L0
4,`GEK.odtP,/Q8Mq6>Zf]A1*;Wg2)dLM!>L>0\[Y(WHL3S=NU%7s]A*PEbq54oiN4ZU7Or;ZF
*M=mGsF6Ko;s+TcV_&Utdltpca3s73ZPLE>9o,+ec?8Ft+d7q!Pp[%s:pjV/m:t"$6qhfoo9
ne\H]A?Z>1%apQ[T;0S4IWjcFo.YZ)$6Bp/@>r4(,r9tVfXoPk:#0nLCb-V<EP2m(j/e=fYs:
-\n!oh1'>iRX"X;N)a3O$"Og=$pTd-`Qj9kk_(TH%+"MP-;G<2-.ICB8'KH+_gh,<XpkHXGB
she^Ne!:!F`4EchORlO@s`B>&.Rl?Br2L,X&M3Omc&Mo`_4(]A5e5e=1CT;,#V6\:+9[E2[-<
Ib>[3SL97GeMh$`c+SLJNh',`(6TlmR/.!`Z8"No>*sHcoEu:+*\`cN$JS>9nhC^3mN<2l*Q
k2_ViU.>T%:)N-^=!!2*l"a3im/j&_S2ii5F,jcR&n0HZtd?5X=,Bd/Tqi0Uph?HZ9XJf2Q8
1k<VB67i0d$fs_;:$Vd0+,QKIB6'OZT?7B?m<elP.Vu4kNPFo(6qk$smk'3qIk#,V]AY%'oV4
Y"9f8";!qn`e*b)nBl0^1Y$]Ake[5+me:l"qb9L;M?u8DX`9ROW:L>iIhXg5cF*S9jf!X]A]A>G
7sqOoJ"9X@3\7]A.EU@9^Gb4<#CqKe*f@0XY:RSASI3Q0PJl8=F0]A@@U0,lGEEg=1=5l04/#l
UJhO9c\;psHXqmTFc]A-1ohU/5bN3k&,_>-a2/p^1QrVu3]AFe)o$YL3VpA'l'E7]A%bG<3-%fu
=G\hB7<FL&T65bdoLFXNuDh_hjeL$^$=oe`Og+s&e%IU<!<WjRQEU5/6)ANg5P$3E@au%Are
*H\b0&5!5GMFYt>lW9oo!=EF7Al3lXuK#[H0?972qJF+:D<!E!7X46l'lV!3(s2^.7$>H/\;
+j.KU<&^Ok)0j?B6o8un6(`ITOH[cpXj#m&;9I!njd/!d.ra@L6nM%4ZIqN-[iY$oPq=M#aA
/9r@j!OFsnLK3%7I3a)]A>d_sm_H0r2*1]A$['M1HHcn;AG*5L6gY`0=#;pc=U2pH!_l+@Gu`j
'l'[UglDHnAA;f\Q=9pP4g&3Z?_sY_9oG&O0kH1RK-"F[HgR'1q6QfH4-DgI07]AV^Z7.WRf"
9mUe9)dc(mp2e"F$um6&V.edUiNDBc1F?j%;/^^#9:".[q34O#m_ID-OIR50mR&(n<O\;ikI
:pFm^8/X>PVVHlN>KfFW#8$4$YGQ:,WYf4fHbIr:]AK?!:t5t@3R-[POkaK3%UK(h""hNaOBr
,7*P">/)tAC'[08pciqek'.iGaq!glkCU1/"0`sXZH5<1B4WKkgIY^@gW+LE`oMSA17-B)i5
AQ&*^=?Mb%&o]A)rG`(/j&aKWVktKFLf1/i%4+KLE.DaJ6UPKP9/U(E9;3'blM()Ki$*Yip"5
ifhYDSL[p0V(d$mK08[*q=#heXJ"0UI(OD3!95@dHNd::VCmR2l?><WbScY_e`8#rRD'He[n
uT4Kg5C$:2%jT5*&*)m>=[i;q*]Ac#fE?.Z`@%3-S2=bp3G[[9[*6(9sgg8*tr7uVc""A6ppk
c''4,UHi93Z$c>2Kb(#4?1OF@SZb.)^gWhNWXmSMupf?3]A'1J3O;,#L8J0cB^DV`_:gZ0_^P
ebm#N:FZ^_KtWBF,iS?D]An%%;%a,^nWi(OhaneFb\iL/Z<^a<.LW;#\8.^B3I9iJrAb>6A]AD
.-:J50O9f\!S[te)":K-sRZW2HU%\%k(#!W57")mHPYl7ta:iX*GDc"$i"?D&Rc^=ri`5D*D
@=J.0gesD(kIB7&kZZ2u=%>o(K)"Nu?REJ'2#L)$^d\-+ff4>YCb2c`JAMN\"XkRRMH+@_Vt
8*%Ie,&bjB")&]AejIK?Mb\7&<6K$.(\=IkP<nLZin!+L&bJm4[O^4G+Dcq'-;4k99B>Y4D41
H[ZN;hdVlkAB@Mj0$6/VEKoMuJIIJ3+*<qXa2ik#APQp&Qh->dmLk\VEf4TPAi=,TJ\J1aS/
"]A3k&boPH@F\K*drq4%_19Ramku7dluLidcheE)k1.s%epuMHYj>BMPRLR_`S+<c:Mft=*[#
#:2unh_^GAroU%DodA1K%iq&ORkQ\b@@!>etbAA^jL\%>G[qY/JWD[q!k&K7iHIBDR<G7t^!
0m?!&mi%(#'4ZHK&uAC@EQAY\FtYC",9MlW5B_gI,2_nX*hud[pt&>/a3S*8&^Ij?gV5bZH9
C@OB^utP7eM=_16[,&8be/=p\iY<#9PY_ls(01qItYtUAP,^+0I,,,sIF^b,l<u3IslKn"\^
n6b"?q[KR.@b*C^."aA%-4DtjFG/<;&aN]AHHLHQ;m<;_bC7RgVJg!(&u/>7D<<8H$<ZDgr?^
+a39nHXcTN5Sck=du"Ps!`^g,!RqNBMkq5ZIN<nY3N?bPd1Ch4]AlW-miL)T"$T[E%>i.dQO#
Q1+57T("?(QMB!s--/67?J=4>H2rS_ho7H-GHlU*JAjRZ1?OF+7)[tBW_*UYqAXGD\*k4:ST
N$,s)<pCW0.RTt_s2]AU7YudJ%[]A!j$N?hSN0^OZ5:_e9;DUk!!ahqNXWk@H*`PfI\SgB+UZ6
QF\34mcHZJ98=Ad3gD(%diu%jF1Ec9Q@[$i+Mto]AP4$T78-u$nR4YGS<K$,DG@sd:5tYBpT?
i.+\S8JUeJ:dVY0S(M!ZZS</m`eW;^rZ5>rm7T:%)M6]ADMQ?1gKJ7i_mo4''g8kl1_L`:ZF_
i]AR3@86YKE1q.;06)%q:Z"%t]A@rn5ET'B)UR[ci/oMmLOSBljg*Lt3!$=P#SkCI&*%:P[l$g
>)%;%ZaIf%VN?&)[1:b5Q2P(MPs!A(%$/i\Id:U\9\h<a"1jpjs=U,7FO5oBuDGHI=V1f(-f
%aCVlYPS7DH\LD2.%RNQDZ;M4j!F_9\ZP+**.,b,V@`p$md[M11%%dIl5k;-,DCX9\@NN'-N
G!q31I]A1nQ_7SS=CQ.06$bY@jYBaqk#jNlm6HEj\3qIXs<g-"DlJ".j!h\`u:X/6YL'Y:@%N
llm/Asg27lT242g5<oq.Y\!:&pZ?Z:Pgl%o#Tmd%D+7)(S7T$d5MR1^SmYPsXn**h.2f[*@.
9BI6(9>\<&X=^g!^@H?jRl>LN2(Jj@)i*)$j3_i2\5+#]AJRG=s3PC)#CMT@h#"\/'UtW/2.G
dg`h87uoqnKL:!H,liT!pdKeuTUL2piVKcG[p`/jDJb]AoBO!JCT09rg7A;$!Sk/hSJ5Z'"f?
*)^CPf<UUB$G=Pk8t>pq!%GRY\QF\uq"^-sY?-EpN+pjUb2i`n'X?5Q*Zl\cHK/(77>_.GT(
]AR#IctOk,#sssQnkMjc,K7d(7t^F--P<ogF34%#9$"g"'G)ZdQeBA=&,eH]A4n]A\]A3IL+n/=d
]ALNX+"bE:=(N6XD4q6eK,,dC3u,P4+*pf`OQ<SuMmUiS"VU4qnFk?1S-qs>K[M0V[*h=Znsj
/mGMbT6*0D]Aa`;qAqbjM\'5*UXQB,&b$j`MU4=2o>AB4'h5#Vp74[E.,Tr=/.E;0ppJdIU@Y
rGqCCFnCaHks<7^@C=G7a.Vn]AN98?_SR[^SApT/J[h4;2fmit5N@jaB1(>$h,'2ak&M,p9ko
gu-.M9:X6<ST^#1BpSVL#9n`2NO/mCjsZ#B2MZ?WVWG6CQBS+b7b<(>>XB_nJhIB%?d@g:NV
HAi*UScE&.%&OFhPU0s$H*TB`(0`899!i4[J0!e97[[c1qCoX7F<j)`6YH-#:Jr^^hk6emU=
,:9ZT;,Lb@ri3B",%(H6@8)C6J.7nhD$?=hKeSSLB\;]AMkCtltn%^>#L?8CHB,*"P9^Dnr9k
Lf2Q!$r3OC9TbuWcq!>k*3sk&AW'?FCu=!D[8@goj8^R"-$Q8S:a2CP\Yln?%eN=&%IcZg\g
!6\slf\Lp2#.g'Jc+aIh!\)`1RR9<lL$h'fC\fIfl^W?ZXYr7pj7jBu*0S+Tu7M.uO(0c*h$
'$YIQduD*X42Q'@ZaA`hfREQuFlta;1R?+qs!!I`\Cc8PD*7hoEZ5]AXH,1]Ah<RtI="ifBYeS
OtP_`]AZ6e8*7,%QiQ_*S'$Dqn%]A/h)>qkperqW!$A`7j\T$MRJ8!!%gUjM%:Tp-JpTf"189;
Z(9[Neq>A+AI0hTc47AWA#o]ABfq#$q6&KA`S']A0^4<BFVirG?]ABSrm7$ZD3>7f3S^uW#`5]A>
jKQ&RNL\@m.U3KrK*-=%9Qq=L%bttNQ>`iX!7=eA^2#dm,AQMGl4P!Q=25rI&8B+D:rcXE4+
FnK)K=@Cho2^[h[C=dQT@#(R^B_M-)T/l+?]A!GfrFD-LX:R8u2`g9c<6R03qIQ</"qNN^#4\
@JDX([F'MKN6F\1\Z^BTGG!kg`.-J'.P'gmTGd^8c]AuM#eqNegJ(s,n5-nECg/kL4_mGe\pe
::p2g74Y/bi.@%%'.dfq4VP\La>?bC>6Wq@@:ojDL=#&Na3Oc/#'rg@'DkltSC$k+uYHQ^Gb
T\VUJ>Y]Ad4_TDp@@*5[ig]A0@XbaX]A$Y\(!OIECNGgIJ@rjnM=nLk2QSV[RfK1NR:gA^#(&->
NtO4KV*X7eX_%G0,SXT;u9F0$[*U!B^Lpg^gAe)o#5qJ5X;^J\Bb?M;*d>6/n.ug:_DKB!g]A
8CJ>G8m;lBlEM@$eH=B&YQ"*f355*>D_LjKj//D=FW/6A7GF3S*oAQ[@U+n:[cJn/b"gA$p7
i^`<R!R\P@$_m\KpKGe;#d;m_gf(=__o7Bpe[qu*-;e3a7p)WfT\!cQg_mu[Ba6KB)o-]A,%0
pRRK(usKTMVo,FE"p/h&Ln'cqYmg;drD*#;UOC-WVJJDgNJUN&OK!9uO"uX>E6/:2FZ)NtP'
Ig"`"EEc[/#GI.'Fs,c>ko5EUHImP76iM2Sk(&r:9_l<ZCA3N7GqfY=t41KQ`LMK,S^5dEP@
$k3andd#Xh;&[#P?Dp9SI%U[h+uM9bkAm?q(g:D."J/PeI-U0Ws)p^j=g3Z3^2)ip2YS1>N]A
1DlF/Z6UTL'X6)jCYk[g34*W,UFIGe&`I%*qk\m9b_=/!#>&mrF9!,U"l-\^)jU?Yd+1]At>-
?,G@?K5#B0PT\?c=M;[+JZ"(ToolXtcfZa;2qIQ4?pN?_VYBQV?+G:Z7DGl7CiTbQZ#34\/*
G`lL2Fo,bil*UBlbTFM:S]A5Q[>ra!s^+7G]A-N,,'keL_!Em&IV8A@&b3OTeWn(JU\2B]ALf8u
l!1;?(h2^)LoT&>k4fKsJONkh%reH=@Ssnt#3Q\#1<'B4AMk<5Jjd<[:G$KuW^Eh0iqJr#ZX
j8Ns[[lgA&n7cW81"*YEmZ$Fo)qU)(6^BC=k5c[;@2[,]AH^]AH=QcZf_u7!Ve]A)XRC;lQ5\1=
K<Eq:n9J!.e=N%,148jG(pE^^4L`6q9.CMsGNfiSR+&R=ehoQVF4MbVL8SB:aY5<Mg0e0ro7
HB%S,C+K#/9C6`Oj<pkDSU#!g+_n>-!'1QuC?el:rN'S=/=MB,cif1SoUuI23m$?OepO;KJ4
15b8([mg8QhscmKYLmmm/uJ`Fr1qW&Js&AqVGQak8R9/hIh8,uo"7iO.[0ZdKp^Xm)qL$U/T
1&IA0$Q=6Lg#ut<+5J4)S^7+#9mg'=]A]AWY!urW\@j+5<e<Q4cku4?8K7.Y5VVlX@0J*gCM*m
o8;eLJ[;[_EPMoS1f&UCi'F]A'Fu(>EG(.ApEa*tmY.ri+l-7@kXg+-:cCp&]A^?fBjh1Cg`ET
ukHqo<J,`]A>J(3RM\DX9F'0n:+m80:0_1@U)r5VBtd?CHW=d?2Lcr8&hM-5$'2P*K>c]Ai7(V
B@KIr*Ql,H7'.r6pc`(c?d9>Fj3hOL34ECdS'=LhUQKa;ZK9m^'Th(bhW39JfUa4%\4XQ_9i
\HJDlRP1kN>IsrHl@JfdCcAE)bqYG#(AUPDIo^gQiB)G2<HS]Al(S23BDs!5QsiG@%f+:M`ti
;+73t)e21I*"N<00&U:Lf$M\E%*BA:@3#**!Ufk05.O;4%o3?5WY[bg"PQ9d(noV<h*HsB]AI
,<^U*E3O8=iO!]A-#VWOm">RrhStf8O2VUTjiRS(XSj%hT!i>dX/"#cO![]Aj5j97Y>>_jMOLs
IEmXY^m*TI9Bqb/V4l9/3V^pr0>/"Kg&8hH*.j,j-"eNtR#_RsVhWi3,smi/Fs_q>?H&DNYi
."Dk$(#YeE?<*[g[AV0g+(5u^[?HJbkRT&+.=VUg4RRj5DX?O'=).d5\WSm#cDoo"0-Ce&U>
rN#r=p+;9^\RBh&Y+_8`^b5XS0Ep:.;]AVE!q*aCDQ"@4#g:RYg,kQ=.FG4?#b/R3&5uH8['+
Ql1SRB&!0]AHT0EA='0Cg4e@I6J_KJ-8TsZBX/k/%6"]A`5I92[W?@=":P!g&np`<#D+S@8*kk
28-UMkr+)!:%NR^eo([n_AruJ%uhW^U")7$*ALQdV[O9>B!2T.dDia%A:6'XcU_W8AnqKP\F
P[i"e43<S$:Q.W@^*IJu'5IRG6IOL2rUhG?(T!QQ`[^OI3_UR^8;[NcqQ&X3df0m\b]Ag\%6T
\V^P#m,.QW-0N0^T4HNeZ+P*5_K:4VETW)m]A.ZD5EjjVg/cfm\,kA!PqE>;-:?,)U6k:4!Y^
&\?[+`Nj*M5165*_"[%m\f(k-BAP^lJ]AV>2^"ui"$XUr3S=6*HkQ+U%-6hr$Y)2rIS]A44fu$
;i5j8S5'@QOK6_RSeu^+/(r.CaTs(YL0Vu67Sck1/ml$!,e3>.dlUnWR`\21-;?WSMJ8j2$I
^e?-`:6S\A%IeGiW/"[@NE!c`_+IjXV_,P7GXjNA^2E7*&F[d_+V`UV>`J]A";TRYelX.7i@:
5qO-:L>;#-.R+-eXKies$(BKZ,u7Vsr?j",!$`9C##%FV8+P1_PX\?@^X0Z3R>V/j:bVog1^
FsS)]AMDG5"p(pCVU]A6/8Lq=Iu5@G:N)VS:cb;E@us3&L'bZf;5m#KBD<.'>dCXFWh`ARR'oD
^#;Z&':ji%J;1*GgaqTD$3o_g8T[A*9gUKu,?%>"N07Z169nFfYNl(]AIoKgj9lEdt_,%9!V[
=<s:]AtO;L8/FRf+O5C</F^7U.2J&0$$]A*:UHb.?XeqmK7*!l/#eT=Fb5$d+tS#;_&<-A?+dQ
akTdM\`?%[+JXH)pGLqHSrgX6i-]AR;]Ak'^r^VBV*M0a8X->@gUKE((OMj1t-o:TN]A2+P(X5n
seg'pi@2ZM[+&-'DHd8^'h@X4FN@2VD*lkXY@7N1%f<B#-Q]Aju2'$8%<q-j0(KdMlY\At'k_
3!J?io7&3Tf:?)%%Xm5((W;AdfRIV7HBM\<qK_hj%0U]AW47^BaXS'#u_PrFu\^ZJ9AYC8t<h
7!f17Y#^o[T)=8Jti!K8EWmOYuA?&i1KPp@U3f2rqACFZ;jUm&q'A&-l+ne&V_:lZC+Aa4(I
HR?!PZ\nJ;FKR1G:q<)ZnZrZp'fH,kIW<!`W&k/t"!j2AQdi6Wa5SAa1Rrg+uN18u$QYaj:"
nU&/%4X[F*TPfER59&iTWulsE/M$1Pr3d_lSE1m4i>Vdg,W-c*TFc^:H9N_5dMeOhR6D7;(#
*DRMh2!C"Ce8d*!uBgLiXnK17uZI=n3IQH@k?'&<j3GUfr&mHhcu.oQuda(-q'Q+#YQ-^Xi6
gN07)<fZ0GXn?gl9At,imm,:UoSb_%"sCIoJ'p7sj]AocOgPq$C72^:N\-it\1G<"!@=e,_e&
qV3E%pb#0>,4%]Ar,bD1gp3kOU=\:M[?EHq4Vcq`fR<q\?qEd_C$Mi"6Y&I?u6>22Ya8pN,%P
X]AtKbjSsIR_Pq@qg9g,W>Z@NbL.\]AXd(9TIT;"@1h5A`G;;Y4L-9Ec4sdZA]ARo&Vh`+nnINc
ip1?/es7Wc.<fj_cG)fl:&YWf'8*O28Z+cMMF\Le\1U"bg6$80nN#(G[44952i[(Gic^)9(f
8@%J";VUC./GpJ>ad+,'@1n1sO`^?FSJaH/7CaMd\TZc4bkHj2ON&iGIQmTn(<St-@Mo8=f@
oUIc^<?h9jgJ6FkQ8g+fV!=d<Wk:6biUE<_)-!DVpaXVY5S@4RjtZ=A/8;_H]Al9.!C"d?oK`
JF5?Y_YnT@C?I36<bk$EBT`[5:j;WDfO/j!8(@l(/oS+DPjJ6H+JNodToaoHCaK[=7\oZ)48
4rCe\?S"NZ*pEE,!AT5+[NqHg#ZEH.D4V78DLJW772)mHnB%b/tUsc(elp&;seV1o!@X@UUB
2%TYBo@BUI%/3;X3X3RnQ+Rhf1(YV&dT2e/h!jGLEl]A?6ANfDf@L0n">#6nW-roh>Eb]AXHaA
u?9nG,aBboVaI,hAq"KGf,/k/UB77X=tgh]A^9b5Nfkd[Z=s^5.<SoX>\5DUbYqZ%#L+C\oQM
((Am&'OsKKXlqAoaWK%Y"lK#,KVVs[f=9Oaq'pF@0u+UqQmP.I+cK0#cuPD_BCeJ'c.`a3OS
'`TTXZY8GEep2p(&`TVps,H3ZhX5k<*<E5BlAc3Re0N+:SI]A4No,GQ+t#6U[V=J9r9pNhW%f
q=&f?q&bUbk_ELlQiZlXGBl9d$`Rbu4L^PZGjD9cpa^_3YStHsd`\^Ou<U[hFIoQ?GW*N&tF
N&Phek<2AY0!S)2I&?D96f55E<h^aG"lA&3f8P>R-&19USH9e!dgfNEAMCPefVYIb"`3b#h(
Lu1GY`7aYN/b'o(f@&t_9<:ps$=*B+VrV^:EumE<^B!F=aJ%^hFO#4KtRNR>9d9Rh7hFm]A35
ni.Lu9V7s6!FB5C9>@,SJ=ll"n9TD)O?thT/)irR@FAg-E,+f%FHanbC1M_<4[IQTar0qPpe
YgUcY_)*Pc;u^UiN;IQs&1TLuZuGFAg*XpZ,b(EBXp1juI8Khr&#DE)S-]A>=+UqnPaC-^WiE
"+P=k#Ut5\?ObZk$]AgYA\8Ss-8'6+J+Q_]AL%POIal4hNa"9B;$&X17Z+(G8_o2O+)Diq;*4k
?/gHN:,7*I!K=#iuHj!GF;2RR%g<giJ0\-1C#MO,"c&ClD?Yh4kuJ-buoUs<48>`J.6A-$Uo
BUD?C<(0f^_=$efcuXRGDi*d[3^?5"OaYhuEIA#=*q1NBM*E:7m9%Z?>NLW.ih?jmZo0R64o
l(@iJh$(NjE[g&<cF')*_(3&dl6D@HGn/G_>A]ATF\0[)AlD%boOkM7Z2`rArWU[-?WMChj(^
QcY]ADX-l:9S_Ro1k.S)SW3Pact8LP<-?(q^5WiELt#moKE"1!NNBhm;]AV<7rt-hjb#AZ"9QJ
-Ebl.F_r25YRWPakb/(#CVF9Q%h1HM';%0;2M4nc(@#$$b(C`oOA57]ABek>$&K8K+Il^f?Y<
_jPKK!D4ea_]AduR]AktHepH#[\[]AfZA:k[0-'nl?K")`8-\WE68c;r-3O"0H-Y9tNYa^$C$3Z
c#HI9,=TmT<#92<D)m0_H;5N4"Zn8F`b+7Q%6S+u4f2QHH:jHN]Af0k^/;0qk#p#.LjeH`j\,
i\W.D)eb<fl1gS>B2OLGZqL_+esgfugk/fraA18uG$OrtJM[o.bN*o"(\^B;)n)bqZrDIdi[
7I;f07f^"bdP_p>^Zib6;Z"/"RK"_/S>@<<K.ZTkhqnLk$QBs2AjqYCEhs8+2f#32-BU[WjT
?(J_+5d1k?V3^kCW(%+2d<W6l7gQ#:/TBsIH)_t\2oeX"qGe2@Rg@)nirkfML3Y>Fg[i<upB
`[""m$825BNJu^1&0T7MQ*puLtqq3%``D0jHThlgJP9+0LC>MZh'N82?VTP_OdNci`d3\42,
gXC+q3.=t/;Ri9f3,fl:jf(cZ(*?CC!d5q9#:5Gh-$aei&%[gQL]A\tq))29"cQH.jba[?CE%
a,W76'4a3:c?*fYi^FiomF6$4Dj1FIS?7M`n:Q07M-sO8[:90.8JA)`L&le2X^-h^A_Yq"Al
r&WIVt+%2K*YB7QBQR#5d#E67EJh*nX'AH_MoY#6-<L+kgnN'?;W3Rt>t9Y&?Kl4%o(62Y&e
@Dm@K`kRbn.qAP7e[2[YC%/d0_l+eOpf#)6$9\J$S1M&M3S0(YPI+Fh!^C=[*o`$d,@,ndEf
(ut'RgQ4T1F/S1Bg2<tH7D2iDWp5EC;\T8NF<saD&s6#Bbm4.d\\Y;20tS^j\52:YnLuWfLO
5jP(Y:+JmcMle\[6"mj(jBMbf>3.KT'CrR]A@,J$q/5CHs7E2.!a0[qFEK]Aa89HgT<D4e[$\%
!d;GaeZYlF25at[m1+tV^S0-E2uT3s7TrIB9U$#dq.H.LdpHi&&oo'm7E!;8e>*;RXUIW>3#
1gA32F7,o*C9+#6A/M%,\?rNl[4\`2IKRQ]Ae<#Zd$hkkBCstgb89jW\==701t2)^*r/P!p8r
5;*?09E5qR=Lgs6_r*B<VMGK(MZs*o+2f$BTR,^uRn>%ZQTgZuLKb<Amdoq74Eh&(_ILRHdW
'LT7cfXP/+m%U?(8gr:G@;^qVhYN61'DHdROVX4Au(SnAAlK1GSm6@s06BDX>5`MlNF:6_cJ
^(g,D%C&$W=^]A%\*XR([ZffXPkt"/THjguS#)%Ao?taG?r$%O$T$MB)j"7&,!)Z7gX`<Vk?9
?XsdSHLodb_13PNpP>7,e=@dRLt_>n$RBm/oK+;9GlB<m&;L]APD)G#l\rCu.QIHg%/gE3P;8
&k%psglmPkLBbV+f&1M3lODXQMhif8>5..8B`_"i^:=/u\-L!Q&p"'LW"q.NW(Jf;+_,ff'N
I1XZ:oXIl,-oVJD6j/`tQE@_:."$,dCDMCf]A_iO0eZf#",6gp-46%G>NoA:J:1'$u^ctL,Lc
qn&GIJ16^o&1lb?TQU6q\n;BKkhPgmq.MC4o,0q-@7Wq]AMr:7f]A8J"hsBUJ![:icqK9T#EnI
eS6MW*LBHi0c-YBsqWp07lB`0,Bo;t6$V_-?3D>U_&D5ZWbm^2!6R*0,<Di(tR\u>C!geD15
C<'l+q0WkE\n%*#0tq_8*.ATcSCfFO)YuFg)'Xf]AFYU\Cf*07lg=(Mi5!&'9fS5KEOYR>J8^
oXGYg(&0"FZu$br+\'8du-2'gt0u^dkHA=Fb.f\;!TAk-a)AU6f-Xg6K"CbqisuG1V2t]AC20
mbkUpgG<l2.,euB@geQFEmpmct?Su%^1@b"<36\?J-'\N'XVD86)E<H;K7]AXp1k-20\d<U+#
R-)fTC.39_>X:4(P[TF':E?+2J%C\Mp,Xodt&"\SY\Q!g9G]Anb)!_,6BF;n0oHB$CPuSkcIX
5\PT!,i!gi7QhuAU?1OT&19E.;ngZ8*ZG9/PDc!58g+)LF&@3SnO7q!V6#"k9XZ>W3grGR]AD
gMW*fgrQ%(nVaVM0l(ZRBK^TqU>+8u521QP$7-8t7<*f("XRk`N&1+s!6g`W3XNpgnUiQRga
h"OA0r(.%onbV?T66NkMh2T]A.i%D:(QnIPZ/j1N%/i=5as*<JM?*^0?B(LXBqc\!DJ7;(!$9
,<Zrep/]AnZ"%7]A8,:[1,T^cm+[:J;M:fcusnHu"R*ll(GK*\[3cW;aq;0qtK59>p2`T4EkAb
O0c"&YQM\M"SLcLP-&OTdB=/qmMuk9fn[UeE>7]AR'f`79uL+u<#]AiVWcOFd/'saKJ(]AE$52F
(d&ZNTI2g=(<@UX5fbatF\;>1`^0)pTiZpstIALqIo*,P3.3#r#EOu;up#r=qq+=HV-lMK<Y
7gIpD#"\(\17=VkRZSSa,R9noMmJ8Z3F>3?^D,lA]A>I_#l'%GMq6j<O$R5okQoI:$Z%Fj*jV
L^F!e]A*UDZ7`I,a)cgU7o9!B2b.=I\;GV<V?'+eWK<%UfCa>T1bV!V0rX]A=jcZR3ZMIS0lU3
%=Xt-*6Q(7^j3b70mT^2(r=!%eMp.Qa^]Ah`gE?\81J,Oc:k=0+/6^pFa'HU@;4-QJ'nj#+VT
,#rsL<7(GIJ/#nRrI.,`oLLqPk!p+[OIV??Io"Gc2Y57Xg$Jm[+cCd>\?fTC^1^1^@St?Bn%
'nd:!SXn"6;<2W;[OkIiXrLi*(fMVPV0'=Ri.'#C#!br\2lM<,8dGU3TS&%kptN]AGR(H8k8Y
@>oWmhBr\`E.WJoBtY(lL5H>FZTIAu,)CEs:T&Js(hD*_9T]A[SPkT`,0"T1aqtQS8*TnPo]Aj
8Y*q!eq6$7A<>mE^%Tcuss[GR>AG?A@N*@/e7sU*)j1oKW:%)$[h84d^L=5AjKniRZkA)j1Y
N4<jAJP487&%HlgMQk1Q*H,k]A]A[^gDu2ltIme3R9a@@nT'I4?0h]A#O@/!\LnA_\oj4L[B[\j
]A[%LL4W^_D[40([,LN!N,^,^)&pIbMW0&<oC@IA>P.a'Mqj>*8;:^kna[2Kl'l;\+\1!n`=g
4KbA:(2`JNqlkD%TOE9"WCN7b_&TQf,PbeH!IKs[HF]A5;SZZn7[f@=c'JF/X_7^408q&"-IQ
bk8U!2L]A^\`B<A23kb-n&HRcLBL[5Z49<:L8<sh&L<;j\C5o%aE8Y<]Abt\%\!sbfBph&U^<+
6M]A$tXd;QL#$4*Z.XKN;*R=Dr&`^3+Vk+0OS^L19X9=6EZ5+0/GX6[Lk*"gQ^+BF52NZ"[N.
<rCdj80403-raEEcM[[OR>_c;&4S9T_W4.I!RNe,<i9t1d6>P_<#m5=\'eQ*mB1#C;)?Zd'9
G\]A"5oX\e[dWFEk`#?CcPL,V.4YXG4e4$f6gAk]AH`_>J!%'3Oj0]AA73<OoR7ugc<S8c12*2,
<Vk1HL#Y+L=0bTcGbj2N7OLa_/Y#ODtA-*I*agQ+RQ[ah!=l463Xa2aapR6'k)jLY2-?<k`[
150`"<%unI>*UK_!(66MM.%#%)Y"^9PENp*\[i"iR.b^<*cH)j'`q9%j*WNo3AHhA,LW!79"
;*Xrk)_`X&r4C-*rY?M5um;2,;30Xm(:f91:AUNX?"5[BlYpB\Nne^9WW?=/I`\M=X/WTWN5
5<g2@7MGj$UZV(Jqlfk_mn3WA'l!ApF*Y$a70h@Y@b%t<AGq`0n(SgojjLVdNh3pYi\!#rU.
8E>hFS]A/;,gX\$nbS1'DS_S*OF,0ffe-*UH==1e*ZPRZB6bW<Pl..9#<p`r?I1MqAKU>LE&9
2Lh5_Y0-r]AX_ohU^W*0f.Qj96C(U)jlamrt58aq>L6/PJs'_3G^J/X-Th]A5d$*e)4s%1F0kt
:bR9aRba*4?ugWgU?f>s;OqbWs,cU$-C&%ShRn3Xs'Kj1):inq2Z/)u@R3CJ:_6T`1mObk5Q
Wii'9QT(PT!@`3_9;d&L7^>8deN$OBt:E/4;b7&;j!beGpaX#UC[@rk[EY=a,(%hs5]A^le6_
W^79MA]ADTsr.@pG6B]A"5*C[HH6Nbu&&V&qm8#cZ`_7n%\D9H(W+(T%e1Mt\V@etm-s=-B2,_
UE4bE@O8kiaN12<[Rt+ekOg6#9IX("nY[Cn+gc`Bo$<[@a"`l!1FP0;1/?kplq2UYQEUQII^
2EU.0alnu7HSbEmnFN+;s^(J%oZXe9tARgF3&D-S<_`XNSmW`dDW+9ETe=Y@ZRm_u4V<WKAY
N,m$C`NMJSL'o]AJNrOPZ_PV5iYB8_oMuIbA.`Er,^XO1gf.pPXcdNb#YF8c4Umj8,"EYu=4e
jklJY9t*%#rLne.C3[PhC"6D$Sue.^XhNdo5Rt^P.u<EeBZ;\IQ;52!<2PKfb`0F<$>p47="
:@1Tc-C"cNG'Rq->eNUH6>#sF.e[UbVjIkJ$`VKiX'*LJ(=`@Ik)4ZM2\?<jr2duLK0[b(Xo
t%g,:A]A^rpA5MWA(-rdbgk-r2+CrQX$.)RMFcS4=\.a#&,Aq*f'[YBheFfqB,BJ]A70<eSJ7,
0]APiOENa@^nXQ1d$N:-15jAh'(:HJaR;/[)9s2h((Q@2^bX=85HD(+UHFrep*Aq\(hc.BEU^
9a`^LOkQ>TSlckuUAA7`G/]ACY5H'3,"4?MZE]AH'4KCqprjBX@]A<:k=e@r;AB`X'mc)W#>MH&
5-6IS:V%^il,tcVX;sdrd@+-MU(t^?4G!BiLfs&9O/M@/YjOFi<33WQOtuJqi/n:L,C(Z!5*
of7PA:^5^'8'NHWc5".s6M'LlA?%B7r"judSA8qpW8m"`3Hko3tD%%`rE@Q=*en**S!--9%M
X,k=<b2Il87Nn%2#86(="2d&DKVPEgt?ZZ4ju1K#pd?Mf5[oZ+pd/VqO64)V0\.#X1b+j3[I
Q%>nb0IVhI]AE>pC1&8_>Ee-CAsKf\\+"Wt;A&EJu*u3*+Uu;phk3b'JDsU>rS>cT4JU$gaMG
Xpo59`KTkmH'oRGe$7`f@^r]AOE4n;\lYPAXR7m@L=dSg-dch^eS%gj6P_9'[9n0E=$PR(d^-
K89LBbEgR2ZcbQHRF^_P+H<XWMIO1J(\1fu!7[S,:ckEs[^cjB<tiA;dl_,2nG,ngkl-Jq\^
nL7,5MPgSiRCdsAWqBT(<,$t*.pa79')LC'_A@JD'%dP@c<it$kM+OdK:?5I+)h9>Aig9DEr
>g0Om#+bEd/[Fm4tU&jW!+cJj@!oM^&\k3f&G&$H:E$Io2#/XG@1AFNpET3nQgX&59g+k;_:
G@>@2'Nc=\MG'2/r9[&?qpJbLcrn>c&KhfljiU\Bn([=-WbP+d7"!ukcc@pc=9e@lB0OqUlS
[JHEIK[MFUp!B@UrL6##k)Pr+,nD&7ZmrpU&r;(e..2_%*k:\md!@$nS-lg:F+X0R-FFA1KA
loD\;"J*6[D*'l0O?f'6^[j\^C4;(4`lVA5<nM#L21!FeA%j"-KEo?%o@"qGoPdDDmVY34AX
*fm,H5bJuuMLrpn!W">/%gnW=1Ko6q0E;9%tZ`jqoa?I7,U"j.FU7dac3:fVfVK"\OX`g`DS
OM2Cai?Uu+o3@=4i`mPj_l5hSoH7<%+f\-,_3G&.q#f@lbOur@/>+XQfdSW>Ct?t.Z0@Z3@\
=O`VRE`]ACMnHK]A*JHpE"=;J+()""neW<TD*#BWpb"CrDY10]AT9VM^/k.d[YarCgSt*[E`;\Y
6B[eLi-4$I:8!aJ6*Qs2k=$E&^JWu$)VX2C4$KVU\:fhYJ\O(l(cnbm&Z/NGYa]AF^3()\&;P
VC;I8cD8FV;k_,@jo:Cj=mpB/:VlQoce#^NC]Ap+9;"*p)0Kgki-_))(UEF#K1LSY8ef+U*,"
aa"]A/b8H8)DY%s1_DO]AAdNSieGf9Vh[oDH^-h*[?]AD+&dJYI0WU<ZGE15990"RehMqan;F+Q
2-M8dAp[<KQ:Nr`7pf1W.Ds)BG^;,QOOo/f"^:YdAdi31(Hq?#X;Hr\3TiOH/dYCd8]AcL]AGk
^,3u`+OIS+QiD"08n;7;IPGH""GGs?qJ+am"-[!\f&$-<Ydk^M1[::u1.Sph!:hhh5C[QE9/
,=!fF,9!>pc'C'+I*GBL:^#O]A5\uCL"*aGSg:[3?l!tb1aVGh:"`'Z>>;=Moc+OEsO2\[H:[
1H:bA>HV)AV&VdNRa5/%K\rB/39SQ?DQV\6/Ym#rC_WP5!di?1MqMF3-IYd!-_YqZE_e?)/L
HC9]A*_UjO&!44?<BG5,BkU6K`^HN,B8k#_ktq'E0s=!K$;hfjuV5.<P5-E7cMRXan)UIg9W^
(qjkaf"AU!NHY;S/jYmmX`bgiY/g>f)ZgANF6Pr[G=I/)LEmrfk.fC8HGKI4;hJ^W>\\344f
2Y!m(8k@AJL:8QVTECMjS,PWD0qEB?"C(#3Hka)eYlHMsSbml+rYf/,++I*Y6YY&6--7Zl7!
l31Y:m2j]AC6WWo,iqD)J$1*pQm^M?3>sm9CZY1pF]ACqZ,BCaFHrM`?Y^BQlLqF^P.$cHF*'&
;A`A%b*GQFrD\4f'>G)\0Q$ZTC-4q_:h+Y4fR<P5Ad.FUp)p*5/&kmY/b>H0[2ZYKE$t^VbC
lkI9*I1.Q"5<-jOUnY_gV/">m,g9lB)8)h?K:T*'Bj&7G9*/`JVU8^-o."6Vdicr.DF'IF$@
`4D)0A;/RrT'3"HN>SH*5Wp(mp]AL[`KV1WK01e2#WD3tiSAad[?r0C,(]A9V>$O)Nk$:ps\/\
,);nb:V6899R:2GBh^+;?Sk]AA3+cOE@+RI[t.g8Ub:L;N93EIh(DBs3K?]AB81bMen6gGN/!@
:Ei31E`*,;JZb5X-%DNk]A9<6N0eIZf^@LcFIN'"EP&>6"P<m/;O&_##@B'$i"48tLkOr3",S
-Q+PM<bd)CjSNKVo3^4=*gfFZqWEP>Zju"N_6$IZUf.9oAW:b"W#L[C%a]A3Iu']A?;Q6QIIdu
q;hWh>O5[/jE?F%J<ZH5'q/So@ofqKN>IfpLl>rQUO>Le&,lYpX8uWeT/3E;qD^bI#gum$61
gdd'AkL^YM*Y4jAu2'/!U:8BL)(gRGWP*V3Vd(%Cu&\X<1DQ$`C61K^Qk2eEc[-KW*2Vq0@q
=pN.te(1$*WmAuKdiiSSV4F&GiSD]AD:pNS8(McY.laWfD40<ee68,j`LY>,1QbH4O=8Yl`.d
[P.A#eU?!+ak=i,1K"kG1;'SH3IVnuUb]AV%=s^+`*4K[fPOZhJS^em+pT[AAZWhXg1DLa2-g
^]A#^#i>U[@+1`[:4lC<M<W?`ItN$f9@!CAARPX[D:F&913p9XW:#epJ]AWVY(s?'5'tM7h'e8
"!Ad0I;O(WRe.BfL/Bb\$Yr"='o?*Rr_K,1X?`%b`9/"-(f;D=!-;ic&Ft+Sb5Lqt-QeL;8%
O8%8Y1t%<f%FV\JIYd5bYHDW8TV5TWQuT7`kE(n4Z>n[M`#$MJd1cDMU:S$]A;_T(_tkcb*&/
RmW7%B<!WLt&\W$JamqJk'[9-'?kS`>i!/8\=oZ!sULcJn^mm=a4f&:@W&S'\`q5hG&\pS/"
I`R,T>,6[XJgeg/GGpB?I(UlenScUW3jXC/N!gE&\L3H#"B+YH7eX0.D;c*((U`MlJB1dHXL
DMY@2!m]A4*eRf,TK2IPrjb$X,$jTAZiUcH(Wqi>S,=fT;=Y#ZbY=GV;,9>HSJSf82g`9r:D$
i)g[umpmaFs/1I1$'>rmN<t>:s$#M8K.0\_k19+gtG1=[gh.o/i4o?`j_@'VB2nNq/U_#+o:
I@ema?09J<3rl+qB2^a05&r.N:TGb[-=0,hN1KM/^t?U]A6)*pR%0Z<hB"@8d<lWpk?l;=6X:
L+fo)#F0M>3?hq:.h)9-3'hiBQQ\*6sn8VE]AAK$lOJ?%e&`dJk1&UVm_o=^<=8!D)VT"lh[<
Ej4XD2Z28lDqu?BSLdbr@'M2V3ZXR@p,IQ=RP3$A.Q2?DS'iPo'EVSek7c1<3_9H5Dq9>FXW
qOg5<n-2fFIK`j:`4)]A77E&-K7P.j5L"3R;?R7eHJuR?F0NpQ$8oWZ,Sg`2U&'Z_;lK+lbC3
;`=2KR:=&N5Z^F^9hm?<uS\u]A#rhW[C7O\gmd3$%qV:C"Q<aT^hQ0jpn8/N(?HpC6@T0J/M[
qh]A[XV)_T(;>":C[f+TIQ-Pk7R2cr:!;YZBbX-WAed2]A-B/TZ`D5&;(E]ALF3/ZOo9D\1Fr=A
bWO>F2E<jPOmKoBMMZf%>U!NpXg?[Gp?aI_9*EOE&T'd+osN=bO&?YqM&NH\Qc*!0eQEm\bT
WIZi14/Cn=Yu'pqW:0`u,*-%^hI,3p3)P)5ELta5Y:`[j%RhOR3l8n\cB07Y?-PD<q\*e,9%
2T2&3Ea#*9fQih[*G1,P/^^/!?=APVBi>\7\jF(&Z9M'D$CpK(-I:**7(2&`C7aTeVo<]AnkA
r(=lo*K>qeQh6Q?_:h+ETNDE9g5PDfqm6eh7fA^(L"p,NG-LpX]AbqgK-9=QSFEhCq0g8M<jE
:NRfITRk^YU;s6>N]AK_B=9`iA'_b^@Lq>lW6uOsog)m32<SXOP:[.]A!4C9+!7\k7>HPJPk8!
5\GK'7qQ_/0':L%[]A%($(iL+k%*ngmCT`#l.h%j0rlq>X\Pr&:%p(aCLT?`WUcflu3'[U\iN
/YXlOmf\!#IYBhXTmGd`(&F>WnW['DA*ckfEL*CO^Q]AD7`gZJIZ:5Bt%he#DFo)E6+gb=aL!
T:q!Kf#O<PFa&<7!jEEslo?ZgHu)Hj!Y$qQ(49NM]A=dToe':"WW8!$'tkd43#@AHur&;FfrY
1?U!E0T8^(IorP2-)-u'%SSk&E6TbgWfB>-6<\d[pEtL1>L-e(h0f1p6BZ4*E#u>:mTQYm#Z
^Dnkcf+NP\9?H$Z7UIc-E9/BMoVN;05hKE=@5;f=1l?pb)Yg%9\i;JQJk9&>Xo6fAYUkd"ur
FhHPcG(IB4<hZE\%NWP"$(fp7sdEBrEO2mrCOl^D..c`4$&e.;uQ;"Y4l8<QuMY:6E[/u=D/
JLIml9E%k!CCrZFGnC7=&>9b<Kgt5m4Dl#Rp!!h-Gu&S_rhR'W]Ar`>h,]A()TUp9I7P>BI*Jm
rLc.:rCrIAKiiAs<+p\!WTV@9t5Eh1g82Sh*S?C\%:+#!1^j(@kdrGYU0ijlII<YuRcM^R/_
]ATpnJc[T#3WF5[PI.UPE"0f%K`Ng*a<;<X$WY]An1*.CRC,HLg3scSn)ER3u:H;M>u7N%ZHMp
FlW[=gF,GLrB)<gEcs]A0=OM/K4)>EkX%`ejSaPYTVDtBDM\g6O1DTEH?lQ';KfStZ5l.b3ta
5mOg'I-ZYCa%<E2eN'AVlnoF'[e\#/khRt$W<D$>s5e3LO!X>B34`T-A!D_J.0JV*OVq>gCS
%Ukn%l)2]ARZs8;g$q1rV33/p%'-O:9,TO0s9nuZoC7`>&>Yfl3_`p&_<mj>sF./Ea.fjdYN!
YmL)>PrOa\l)e;BM4G52Ej(@Z9it@-J<:Lu(^U-$MV9*\Vi1?@CQK]Ah,iIWaGnV0r&Bdk7I/
@1fsnR!Xoq4QrhW*"a<?==%f.hAQ-t_M.!rE_kI&H#E57aeY\%Je<9fA?%+dCMe1PXq.XpLd
u@tI(KDl_I>;EZ.:"C.M=AhA?scdP-8D3K9B#eC)l7JCar7%8*hqZ)ffVB-bZ'K,S7Jt5=Zc
t^=Z[qor?\<tIoG)Qj"OJ_JcPeaZ*Z4o!SYB[1bX2EiE0?n'S>=U:YT;::YiM\N.RRaQ,!kO
Ifg_]A?fn,\`XR$OQmP2&gG"7V=-hVKpg.WP2+_1Bea*;elp6"./FcC\SGqo@RIOT5BjB`_%8
aLd<>9JYGYTc\_7)Hj'-HA#C92^ml;EH'_jHNY+7#1E-O+p#cFN$]AEs9?ZHc0u\T$-mG)YmU
P^(UW`j&)Si8mqoSObBmZ_/Y3C(V8]AG:24JfWH+>&*hO+=$.*IP/_BYS=K;=f,1[l+?kZ)F`
ZZ-%Vs>_!]AdQY%g;W@Pq4%cRD/3+[j2l'd)LC<X?qLdF-VfN$Wg<LeaiSMXLPkf8`t#8p?ZC
FTD;[n,H6j@bdj1qX.92S*4=u_b[6AW">,u2UEk$#R%Z:]AoaO4$Nk$4?&l5Q+DWh\:TP20sj
CG+J^QBGL5=jG')(#0*k$E!^.@!u0_3r&!kLh\9br9NRYV74$TFZB:A=Pa*Y$Se6nY;l]AZ[m
2fd+43GDH\K+A2<qtq:cC:dB]AiQ.b56HBI(^8H_p;7r8#hn7_/`mIQ.UM1AI$AN=iFRML)/m
c]A3kB:o`f6P+@F+`M"WF'e[*_M4tu"N_L[+$%&e.8;Ei(h5&kH"4EWZ"V@Qmg5&(jl8mbJti
l8VYa?VRC)EJU;bjpFZVPKTuQ:_IC\XMg#a&3U\"mkYdYZ##e'sbPD[e6$E+6E;VE@cP3#XT
o1d!PR=i6:]AP6/gsY'qmeG`+GTmXo"8UOmVg4K`9tu[lMXeFgLh0K"GSI:hAiUC:=17<AV(.
Q)[&*`#J!)bW6VqbCfP,;J3TC>F59nC57F/Ci4M\:Ld4?;J%$lo[R1i7l,,E/9h[`Rk]A/VBi
nB/0'gR.^Ti9;8X$424,>P81WF+>a"H-q;pR)_=Of,W3bbparG1oY!!cPG23!jK$a1H;-AGS
5,I()3;5oPDd-@b"GY<k)p[]Afj-`B>bYOX8Fo9\7KXLo%CUD.f(ClFnEJ(J0bT_rY2(S!roJ
:117>j0.gZ*Tp$4Su!d@W04$=6'#B<HluETKu>F.B6l4]A)G>m@IVk.lL;0N.Zc=$@`?2!OP&
aiJ`IFtkE6>Y&,$=efEqt;EsE#J8'N:`Z[M>R,(?m^ARRX_j$G1"?J/1Z]A='``QI,-^.JoXf
S0d9ii`d?,?eiPA&GmmqP"fSO[a#ujl;i_JZtt4-Q.:k4%\3ZEjbdKTLQ7A-%"*aep7]A^_Jo
c4%66]Am'b_#Y9T)ld/r,f4fQ]AHWE!'_XL=AD560N"^nnnA!O80u>92uaY?H;/@4EoaHS8EuS
opV#iUPjVo3e)ab,>hM?S@l8"LNlrd^.uQ[`$8"[i+_M`9g)dn0GR@sSQ$<\@]A'(TS(_EoBM
`bIbXrmU0gbB>8&@_<b5*;DET'*/oE6gD'NN+f*CP3P4AZ/:@"is65on`^oh3e9ZhnMh$3ns
M?4GJs`h]A/KL,YnQK*I2@qegU/qNb/dt"c1WVD>g_JFaE;Um6_R1mPZgU)0SAQ#AZ(kQ&Zp>
6FCe]AS%[YEAnEPW=,Z42ULE`m0fC%C%,&9-j91-,Gs5aU1[;.aP2#t=4o"b\+(Nf7(#uWOEo
AuR,"r\[S1-jqdtCPlpp]AcY07o#c/hdX$d/i(PL)d2pI=Y_&FM0Z'WNXq*+lgJ!`ZYalM(.W
Q,<E4;@IVgD>G5%k@0H/LR,%OuI-hDb1h1FS"l]Am-&.;B#AmgFLq1l2h<Hp<TE4&<%,o<0%7
^PaVB`R.2.4qIgo3'Fh_rZ[5n92qUN\c/a0ZA5,#-K^W&AO6W;NS(oSN@5BX9>VpaaZ\r/_G
&!j0@UaIYVP+34t/7f5'nTp-.<i9LkOg,iYR#JI^1T-\(G&V#(u_>\2(PW1ujf6oFo4p^sG.
9!H*>%[o:rp7Wi?h&h!)g8.?XkY^Ms0"(Jt^j&R*RC/_p#XRAXMm''Gc@BU(*4N[DgY54Z6`
B<IJmFFZD0.W,rEPAA7otd*AhLCP5c2n.8.:H<G)gTam=!,>L=OB%pW/JZLHUAmK5%-lfUl'
c7@&Nn/H-SdDuePOK;=[.)ILjf,G3U3QR3_Bc;@j@Ng(V-Q2Qj-&"-/mNo4LZ2<`;0]AE8Y5=
]A[bb(]At_+[pG`ls+`r@Q@W>O2<.J2k^?q-*euRf^AYHmM!qURp,I41!kfI6OK%d]AD.Ft/o*&
SVGOF1ua+)d^Rt,&PP;gkXJ^KN#X)>*5nQ%ZNeN3\oMK0A\7%FR7Ag"q2^FV%-#5buANpeVh
B`T./F0+X$T@YP%dcUMC:LP@JU2=`+Tj;"Ck8f%N@NSfiQG\*"T!NL_Olc5G5?DfF:n70-6]A
1arTSE;heSCDC_hp.U^ITjab5Rc#a(E5%s&.N^Y-FlTkJJ^#)l1##B<(Z<U8gi8n3)@f%=$3
M6Y.D9%Du70&/^lAr%GFp#1Q\p[W9M3PQ'`'1!"+j\iQ>$kejbAC\lp?L%<V@*\:J;Q[UhGf
ZU2Zl.9f^GgnIOs0B_AY?h0ZOZB\V89o"TrAQ\_j\!l<DRLCak/5"5mY*k1hIZ^;f;dWX`F+
OZn."F?Y#P]A-+71Q_Q]A!KML]A7k~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="498"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
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
<![CDATA[1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,1008000,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,4419600,3009900,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,0,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200,2743200,2743200,0,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="3" s="0">
<O>
<![CDATA[区域经理]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="3" s="0">
<O>
<![CDATA[分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="3" s="0">
<O>
<![CDATA[单位类型]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" rs="3" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="3" s="0">
<O>
<![CDATA[分组]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" cs="4" s="0">
<O>
<![CDATA[业绩指标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="34" s="0">
<O>
<![CDATA[业务指标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="0" cs="5" s="0">
<O>
<![CDATA[规模指标]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="0" rs="3" s="0">
<O>
<![CDATA[得分]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="49" r="0" rs="3" s="0">
<O>
<![CDATA[预计得分]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" cs="4" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" cs="4" s="0">
<O>
<![CDATA[5G绑码新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" cs="4" s="0">
<O>
<![CDATA[宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" cs="4" s="0">
<O>
<![CDATA[天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" cs="4" s="0">
<O>
<![CDATA[高活号卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" cs="4" s="0">
<O>
<![CDATA[三千兆]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" cs="6" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="1" cs="4" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="1" cs="4" s="0">
<O>
<![CDATA[云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="1" cs="5" s="0">
<O>
<![CDATA[终端]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="2" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="2" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="2" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="2" s="0">
<O>
<![CDATA[占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="2" s="0">
<O>
<![CDATA[预计完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" rs="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="3" rs="2" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="自定义分类3"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="单位类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="自定义分类4"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="全利润"/>
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
<Expand dir="0"/>
</C>
<C c="6" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="总毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(G4 = 0, len(G4) = 0), 0, if(F4 / G4 > 1.5, 1.5, F4 / G4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="毛利占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="5G绑码"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(K4) = 0, K4 = 0), 0, if(J4 / K4 > 1.2, 1.2, J4 / K4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="5G绑码占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="15" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(O4) = 0, O4 = 0), 0, if(N4 / O4 > 1.2, 1.2, N4 / O4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="新装宽带占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="17" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="18" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(S4 = 0, len(S4) = 0), 0, if(R4 / S4 > 1.2, 1.2, R4 / S4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="新装天翼占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="22" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="高活号卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="23" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(W4 = 0, len(W4) = 0), 0, if(V4 / W4 > 1.2, 1.2, V4 / W4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="高活号卡占比"/>
<Complex/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="26" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="三千兆"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="27" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AA4 = 0, len(AA4) = 0), 0, if(Z4 / AA4 > 1.2, 1.2, Z4 / AA4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="三千兆占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="29" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="30" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="3" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AD4 + AE4]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="33" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AG4 = 0, len(AG4) = 0), 0, if(AF4 / AG4 > 1.2, 1.2, AF4 / AG4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="FTTR占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="35" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="36" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="37" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AK4 = 0, len(AK4) = 0), 0, if(AJ4 / AK4 > 1.2, 1.2, AJ4 / AK4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="新合约占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="39" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="40" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="41" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AO4 = 0, len(AO4) = 0), 0, if(AN4 / AO4 > 1.2, 1.2, AN4 / AO4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="云宽通占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="43" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="数据" columnName="终端"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="44" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="终端"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="45" r="3" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AS4 = 0, len(AS4) = 0), 0, if(AR4 / AS4 > 1.2, 1.2, AR4 / AS4))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="3" s="1">
<O t="DSColumn">
<Attributes dsName="表头-春促进度" columnName="终端台量占比"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="47" r="3" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=ar4/datedif($start,$end,"D")*106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="3" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(H4 * I4 + L4 * M4 + P4 * Q4 + T4 * U4 + X4 * Y4 + AB4 * AC4 + AH4 * AI4 + AL4 * AM4 + AP4 * AQ4 + AT4 * AU4)*100]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="49" r="3" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=(H4 * I4 + L4 * M4 + P4 * Q4 + T4 * U4 + X4 * Y4 + AB4 * AC4 + AH4 * AI4 + AL4 * AM4 + AP4 * AQ4 + AT4 * AU4)/datedif($start,$end,"D")*106*100]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" cs="3" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=A4 + " " + B4 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="5" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="6" r="4" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="7" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(G5 = 0, len(G5) = 0), 0, if(F5 / G5 > 1.5, 1.5, F5 / G5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="8" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="9" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="10" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="11" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(K5) = 0, K5 = 0), 0, if(J5 / K5 > 1.2, 1.2, J5 / K5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="12" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="13" r="4" s="6">
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
<![CDATA[=sum(O4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="15" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(O5) = 0, O5 = 0), 0, if(N5 / O5 > 1.2, 1.2, N5 / O5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="16" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="17" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="18" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="19" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(S5 = 0, len(S5) = 0), 0, if(R5 / S5 > 1.2, 1.2, R5 / S5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="20" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="21" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="22" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="23" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(W5 = 0, len(W5) = 0), 0, if(V5 / W5 > 1.2, 1.2, V5 / W5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="24" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="25" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="26" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="27" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AA5 = 0, len(AA5) = 0), 0, if(Z5 / AA5 > 1.2, 1.2, Z5 / AA5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="28" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="29" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="30" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="31" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="32" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="33" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AG5 = 0, len(AG5) = 0), 0, if(AF5 / AG5 > 1.2, 1.2, AF5 / AG5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="34" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="35" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="36" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="37" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AK5 = 0, len(AK5) = 0), 0, if(AJ5 / AK5 > 1.2, 1.2, AJ5 / AK5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="38" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="39" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AN4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="40" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="41" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AO5 = 0, len(AO5) = 0), 0, if(AN5 / AO5 > 1.2, 1.2, AN5 / AO5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="42" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="43" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="44" r="4" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="45" r="4" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AS5 = 0, len(AS5) = 0), 0, if(AR5 / AS5 > 1.2, 1.2, AR5 / AS5))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="46" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="47" r="4" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR5/datedif($start,$end,"D")*106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="48" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="49" r="4" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="B4"/>
</C>
<C c="1" r="5" cs="4" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=A4 + " 合计"]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="5" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="6" r="5" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="7" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(G6 = 0, len(G6) = 0), 0, if(F6 / G6 > 1.5, 1.5, F6 / G6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="8" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="9" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="10" r="5" s="6">
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
<![CDATA[=if(or(len(K6) = 0, K6 = 0), 0, if(J6 / K6 > 1.2, 1.2, J6 / K6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="12" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="13" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="14" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="15" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(O6) = 0, O6 = 0), 0, if(N6 / O6 > 1.2, 1.2, N6 / O6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="16" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="17" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="18" r="5" s="6">
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
<![CDATA[=if(or(S6 = 0, len(S6) = 0), 0, if(R6 / S6 > 1.2, 1.2, R6 / S6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="20" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="21" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="22" r="5" s="6">
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
<![CDATA[=if(or(W6 = 0, len(W6) = 0), 0, if(V6 / W6 > 1.2, 1.2, V6 / W6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="24" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="25" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="26" r="5" s="6">
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
<![CDATA[=if(or(AA6 = 0, len(AA6) = 0), 0, if(Z6 / AA6 > 1.2, 1.2, Z6 / AA6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="28" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="29" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="30" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="31" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="32" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="33" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AG6 = 0, len(AG6) = 0), 0, if(AF6 / AG6 > 1.2, 1.2, AF6 / AG6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="34" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="35" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="36" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="37" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AK6 = 0, len(AK6) = 0), 0, if(AJ6 / AK6 > 1.2, 1.2, AJ6 / AK6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="38" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="39" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AN4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="40" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="41" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AO6 = 0, len(AO6) = 0), 0, if(AN6 / AO6 > 1.2, 1.2, AN6 / AO6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="42" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="43" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="44" r="5" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="45" r="5" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AS6 = 0, len(AS6) = 0), 0, if(AR6 / AS6 > 1.2, 1.2, AR6 / AS6))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="46" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="47" r="5" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR6/datedif($start,$end,"D")*106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="48" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="49" r="5" s="6">
<PrivilegeControl/>
<Expand leftParentDefault="false" left="A4"/>
</C>
<C c="0" r="6" cs="5" s="5">
<O>
<![CDATA[门店合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="6" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(G7 = 0, len(G7) = 0), 0, if(F7 / G7 > 1.5, 1.5, F7 / G7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(K7) = 0, K7 = 0), 0, if(J7 / K7 > 1.2, 1.2, J7 / K7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(O7) = 0, O7 = 0), 0, if(N7 / O7 > 1.2, 1.2, N7 / O7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(S7 = 0, len(S7) = 0), 0, if(R7 / S7 > 1.2, 1.2, R7 / S7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(W7 = 0, len(W7) = 0), 0, if(V7 / W7 > 1.2, 1.2, V7 / W7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AA7 = 0, len(AA7) = 0), 0, if(Z7 / AA7 > 1.2, 1.2, Z7 / AA7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AG7 = 0, len(AG7) = 0), 0, if(AF7 / AG7 > 1.2, 1.2, AF7 / AG7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AK7 = 0, len(AK7) = 0), 0, if(AJ7 / AK7 > 1.2, 1.2, AJ7 / AK7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AN4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AO7 = 0, len(AO7) = 0), 0, if(AN7 / AO7 > 1.2, 1.2, AN7 / AO7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="6" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("c" + "4") = "厅店"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="6" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AS7 = 0, len(AS7) = 0), 0, if(AR7 / AS7 > 1.2, 1.2, AR7 / AS7))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="6" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR7/datedif($start,$end,"D")*106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="6" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="7" cs="5" s="5">
<O>
<![CDATA[渠道合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="7" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(G8 = 0, len(G8) = 0), 0, if(F8 / G8 > 1.5, 1.5, F8 / G8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(K8) = 0, K8 = 0), 0, if(J8 / K8 > 1.2, 1.2, J8 / K8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(O8) = 0, O8 = 0), 0, if(N8 / O8 > 1.2, 1.2, N8 / O8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(S8 = 0, len(S8) = 0), 0, if(R8 / S8 > 1.2, 1.2, R8 / S8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(W8 = 0, len(W8) = 0), 0, if(V8 / W8 > 1.2, 1.2, V8 / W8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AA8 = 0, len(AA8) = 0), 0, if(Z8 / AA8 > 1.2, 1.2, Z8 / AA8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AG8 = 0, len(AG8) = 0), 0, if(AF8 / AG8 > 1.2, 1.2, AF8 / AG8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AK8 = 0, len(AK8) = 0), 0, if(AJ8 / AK8 > 1.2, 1.2, AJ8 / AK8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AN4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AO8 = 0, len(AO8) = 0), 0, if(AN8 / AO8 > 1.2, 1.2, AN8 / AO8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="7" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4[!0;!0]A{eval("c" + "4") = "渠道"})]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="7" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AS8 = 0, len(AS8) = 0), 0, if(AR8 / AS8 > 1.2, 1.2, AR8 / AS8))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="7" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR8/datedif($start,$end,"D")*106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="7" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="0" r="8" cs="5" s="5">
<O>
<![CDATA[公司合计]]></O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="5" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(F4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="6" r="8" s="10">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(G4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="7" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(G9 = 0, len(G9) = 0), 0, if(F9 / G9 > 1.5, 1.5, F9 / G9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="8" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="9" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(J4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="10" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(K4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="11" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(K9) = 0, K9 = 0), 0, if(J9 / K9 > 1.2, 1.2, J9 / K9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="12" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="13" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(N4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="14" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(O4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="15" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(len(O9) = 0, O9 = 0), 0, if(N9 / O9 > 1.2, 1.2, N9 / O9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="16" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="17" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(R4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="18" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(S4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="19" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(S9 = 0, len(S9) = 0), 0, if(R9 / S9 > 1.2, 1.2, R9 / S9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="20" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="21" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(V4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="22" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(W4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="23" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(W9 = 0, len(W9) = 0), 0, if(V9 / W9 > 1.2, 1.2, V9 / W9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="24" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="25" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(Z4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="26" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AA4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="27" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AA9 = 0, len(AA9) = 0), 0, if(Z9 / AA9 > 1.2, 1.2, Z9 / AA9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="28" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="29" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AD4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="30" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AE4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="31" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AF4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="32" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AG4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="33" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AG9 = 0, len(AG9) = 0), 0, if(AF9 / AG9 > 1.2, 1.2, AF9 / AG9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="34" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="35" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AJ4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="36" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AK4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="37" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AK9 = 0, len(AK9) = 0), 0, if(AJ9 / AK9 > 1.2, 1.2, AJ9 / AK9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="38" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="39" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AN4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="40" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AO4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="41" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AO9 = 0, len(AO9) = 0), 0, if(AN9 / AO9 > 1.2, 1.2, AN9 / AO9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="42" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="43" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AR4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="44" r="8" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sum(AS4)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="45" r="8" s="8">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AS9 = 0, len(AS9) = 0), 0, if(AR9 / AS9 > 1.2, 1.2, AR9 / AS9))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="46" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="47" r="8" s="9">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AR9/datedif($start,$end,"D")*106]]></Attributes>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="48" r="8" s="5">
<PrivilegeControl/>
<Expand leftParentDefault="false"/>
</C>
<C c="49" r="8" s="5">
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
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<![CDATA[#0.0]]></Format>
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
<![CDATA[#0.0%]]></Format>
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
<![CDATA[#0.0]]></Format>
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
<![CDATA[be/.%;qok^)Is3k&D\*)"E_7m)[);#ZsZ<kRL"]ATEJsH9]AdBDN=Fd=m<="C[JI!)bJ4)e]A8d
RgNBH]A]Aq84!S*,c&:_k^H<Q^N8:Z^AE<P\`Y%MX?"n&@ugC)A'W1`>AFWB%E]AVT+HZNsF/L[
B5eeRp5\j3^A:QUWnBYMc;#8`6Vb^QXH84/h$D/?_-rIjIXhD5_p\2b<PoGa=*iVKm/u\X=N
$u=3,NID%R,c?1WUuZu*SspNL0O?lUOdC/'mA!QD`:MS2Q%k)H^:-?M\T%"4_C1rgGj9Gm+E
WZ6]A]AbT$pG+G_%Bj'ZmEjeb0<":ItES7gHt%FB4WYaCh>fdlk7Kug7Im%A!Af]A_<nI2Y9`@M
10nbl2sS#&IWTE=*Hqec8m.:XO>Y)113F6/f.R)!UTs!FA=hSB]A"=;3\p3ki-J3agf5mZRX`
>;9Ld/_rqI(2I';rQj%4S*e7J(e05L*?i-3!8")@=tfOH\GtDpIrM<#80_]AFLD*pZD8VP,Mm
pq;'KIli,.Srdc=1bT!@be,8*nk9!6P>"\Ak8Z:QYWkS@&5a,07;-qJh-@;HY_:CKd$hbf@;
=(ZD]A*M*m(tOjWEu@lcFeeh(3kmd@<Lm82<_7E(SNR#fJi/o9($Z]ArWBPQ^YkD;c2[4XH6Tr
6M]AVGInqcjiG*kW#B84O6Nf`UNnm[_&Yq?`>kkFL`QNoiDKl#BNSJ'#A2;qY9eqM,+e=,Z:G
\H5>lZlf_9_.Wu/CPUOX!p`hDlM&/RV5*78fqI09p>fN&gYQ19m(RfC\XSi]AG%Vod4p[PN<1
E]AW(,9@_"51NSHB^L#o82NSdA=YI?)^6_?/>S)`[plS2M1n4/YYT6iN0Vu3]AP$q%YEqEO=t!
?]Acs8e+4O!jq5s33\5LoOOG0/`4bfB-^<p+_<5'"'+m07BZW&IV?5Bj67oDIb`N=>mPse(:J
eiJnpJ3dT+iSHj6j>>(iY&PPkEh5H_d<rTbAl>!X9,>"B1c?eRp*LiSc^-'qSDkQ4F9+=.AG
biloJcS;;Cbss'eAi^`^-[I-!YLE'q:maE&'M4[@Jaj5+s.()I$pSd2tJ`o*3=gT6c6_?G@T
k,q6f?CJr\iHT+mL+@iPf>s7T-0_D0T6Yk,5n#n]A$Qc,Di(#eaG8-o'3i)V>HUdiS.u?jWZe
b?U"Q.UO9K`B>K?`P&qU]A-3;gqDlo;AhY]A()]A06->pe@N!pg9lK\8e,W-OHAK=>Lh[nQNai4
EL"?)o[em:gO2VUK@s0$t,u3@9SamG$\SC?6kh]AbD*Hr7`bZS69i:.i"U6e3%A8EbQ1*588]A
);QN:2hqU!7OV-N+(CRXL$hV.JcenAAeTeIZNkkK\m/-TnF4[&=3GU;\;A,k7)W+Y(YGcC>9
rN,d8L'IS]A-=O3R%S46i-emE<amJJC?oW@EN$G&qcCa`65*hjM,\FSK/gCWL^sj.>Z2;i.pk
e<Kdd2C\DbM[YQ?inncA\7TkpEuCCjs/$P1K>ER@qERQ3r4d8o[*+?q*!Jq(I+a_Lp>"L%j2
[u@V,bMO=%HHF^L$<8B>2N1P6$-MD3WrVZ_Q;=RE^*H4un!gqSCL]A:)-Bl?FT+[j$(h.5<ep
OlODQgEo$5'H3lfkdFkC5%Qs(/rJs<neDW(q+;!j:Uc)dqRC<e^Qs1E!H/)sJIgCDg>OXlMI
F'dII&s$;#Dl`C'.egULa$3UQOaqOKtpo,1X02`=GR_0.QTAiHc$1+-5jd,B55Jj>9QAqpAF
GV6k*G'OBNWA:sYt7P`M-RfWJ&nQ-:O0[O$*TRIF5s-/Y);]AgCiIh2AuiLW#ugU/u%G>pZ,P
+E8TlI.j;M%]AGbYEUgksL"E4udILB6nSp.#SFi2Ya9Xm@92Snk?_5.fWSu$=hRn*a0S/)(k-
(%4@BQa^pH0KB'FZ<Y$g/:uHI?AUCE0E^&n\:)31J7HUZn"Pjg3nJ1Hb2c2.o"7Pg"VLC?Ge
OQ2YD*&hq0L?0SZIPQHALYH2@X=b"O"YsQs4\85oGIq%/3_!m'?]Aa"M\\gh]A[n!c9h.M/rtq
+:<VRD*nA:nuI?[IX-bc7ID`5FAE;)u`E*#&-(2>MV1YKZY,+o'hcG4[EW>$n&i8Zj\9I+1_
m.rE`R*SMPWtZFh(FN7SY\Ireon\]Ar:s6u#9nrKg(6L2,`!nGn:L8`+G,[thCcDFa">TBudg
lS6ks;5?.b9kL!<o;DUk:O)ha4r@^NkTbk]A59-B2KAd#_$=I[i+Qsk<qD4qG1k*?-(dN-+2=
MY/ml^JkF$8W'L/4ifVm4eiT[mHcb5_<JYfT7_jD-Li"i'bk#Som`=3Ug?Q:Q$@AGVBgVl"1
A<;OQ\)-\#k%<ZmC&*0a2q3o0Q0jPlh^)-%<`1K\Z>$]A;;56"]A&,Pc"?^R%Q)<bZ,rT^]AK8U
7'WK2]Ao0XW\'dFPg%mBSo&^oi-2a3Y:\mD%T07!%X+thLm$KhQVdiLVV]AK2]AIu4UgYZTAdI%
]Aj9<Dutp<!/jgbU#s$8EXs-HXn8]ANOj\c":2$?%5<>@mDbup0%/m.!>>fA\u#e/V51>p;4T=
0a[@SD;V.oqesCM]AaoLWZMD3-%1iFrbl>MY*;3=j_pL-=+V;jilUirYShFVDQ?E:034grD9l
W$HcE"sf/0lg%Xp@J+/jl*N\:@>D_s/EtJ?Mi?0Honi+8"T\hd1)FL^h<<G(DWt!^eXgcsX\
sG!KA*B^A/0710:%a+82._J!qR0d58#3g(QVE>]Amk&6Ah@/Rjj_&_1sLW[SD14J%PY.W#>Zc
RXI:=]Ai(RMSagJ5q_)]AD!4MX)L(4qfE$AkdFWfApOsiH1Pl2C.?b)>m\SJ.&Bk#P8T%SXRk@
Q<ftr?"4?E9PFL\g(e'9kRVjH)Z1Kk+/WRHdgD#fA8C$Wg\`X+]A@=7P-oqM'WW$khDiGP8A1
J2j0-%`'Hr1GuBRB)?5/5"Q33j-OCNAC-(=IA!XpPmO'iSX)Ikj1B[1/jM_4X/j*dQ>n]A8$^
n%SltlNp)\GA'2h1A<S:J>VA%bp6D34LagRWV4e;TL2]AIR4=KHm.[i_K\Y[?`_D72\_[`;l1
dRU&@'b7m@GDY/:D0?aRdZKM4Bm4@r3`7-UU_pE;Gh!sY3S%aCojdOlcQkr[.\8TsrO]AF-#:
'!5f5J?ji9E:p<\/XiqRu79\J9t14*RV:A:O"O&bngu]AUXCAuT9Nb&>C/:.#,oDU;aU9\G4P
TOb$Bn6k;%3XA/%t>XjRmp3R4DEksf1D2Xs;E29XPU!AYQCPHfPmRuH1X"*uEhf(FpMo2#2Q
"[(mp]A@,kAl$ej-Pe27+#BAO<g9rppoj\[H2+2?+.!5:]A"fSP]A?31YaP+[sSrBt2YH8ngue2
?Kr-t'4NN&"h[8oCVOok<JiVBQ=Z=;i3_Ejdi504_s15eA[4/PQNN<Lp/d7S9jME(\h';!$$
<4+3YZ)]A()3L.ub)6GZaHO@LC%\&`oI%[2,-XIUH5<9khu!'7742"5i14R\)JRGbSm_P8AbD
&UaACam)_a.]APM]Ak13mJgf=6B'B3dZ?L.^RJ'J[?Q%UsonfG5P6pd`jZNTgB`E/@jo$C@K\>
`CHWR%k9(B?tI_m<)r_Z;\=kW(s]AT-LaA8Qosp4p3eN;-;sXi]A8ml'9toT^@9,n$Rb%He+c'
6/,@ab;8[T=&qAZl:NG0UUia@!9TX'e*%$]Ar$?6/risYphU\2BRD)lifNO`:Du=`5B&h-@>D
Pe!Y1,A70cAJ:WEbtR4-X2Zm-54M6bT?mqBu@;jKQC3PF!`+!53m/?C4P.)K=kdC398j82mJ
j/%t98A2DanIRi1[ba^=j%6PL$mjhEC'q[$1,k:<+0;_R'mL+LPI]Ar-\Fp`C@&YC]Ar*CeZD6
H;ONjr1baFk'BfV7g(6"l$&b7^B?3_m9]A`2:TS>,g#G32:_="V4_16OY(@_#:Nc>p9kN1c:5
R3fY_EBno3YX_t.]A4^.\geUGKXrj8Z-RE)ot;=7g;1p,,c%i?BtXH]A]A[HZH.u0gA%?Uqg1"#
oE^OrhPrKCWgKEQm!'Ff'$AFghndN0`-Dm%p"R5#Tq*F5ZM&3V5!U6!ApP(hU)uCQ,+15i9`
;FF%-`,;O10N?[ZH;X'np-R&gm&Y^HYTX8WtaeVZ6V*21l+[4-He\^E`dkrN`B_Ie?lS_/Fb
XTW<f3SKhkETsh?:r^p>]A0hY:Rd<IA?<*A:)J+((UheXI1da6EWK&Tgd_^;KZs5eNsiIb0mU
?]ABS@Eg*H&"3lBh/`VaH9/KXi:SVH0DeeoKW]AkYB*"PfF*UZ(JQU%\KsBe0pIQ$@K_aX-0\?
?>0bnPFJm-ln;8+4LD^"UfHIoNA6A=E9'E4?%(5_>I0YMu7$^H\&OtZ#@GQGTkI[^CThHflr
,>gVuk<n#65[g'.1LGX?qoen9\$Z1F`lB8'iqrr.@E2*9Ob0!tp$k]ABUs+Be$<5Bd)C0e8d#
6hm-%n1P2[[Qdp@\l7PDC$CMErfE.KW[T0jK^M`ks=#Y;#r)Lt7l*mO9R5fX_J/4l.@c9MQ=
!Fq`dY5R15sdf&_GOg$Sd'_eh7``CO@H!:2uD;Ps/qS`T4G-P_3LnC"#EuV<t3bR_g51)AB$
Gu5$U)dW#%bt-bXobnQK@X]A^E;p^A)5n0lg-^85JtU3X+QR.?pSuq5#aoj%DOp:$dnh@oii[
<L6J^<6PS2._(8/S&F]AR6$-GEoWf;j?=j]Ak1&`@PqO1lL0E1cX?tD<S8/?0/nlXS84^##OBZ
WKqnroWAfoD5p[V?Fh4=p`pOj*13Z0Qq3RRKo;B]A<er3RVYaeUb!]A(FneK:1Jpr=B$+m+m:9
Orh?OCCuc%)'WA2!1+<l<rtmS`ZikEnm\@66#/c<[3*_Z=OQ\+OBN[j=NHSkR([FnU^)_QFg
\7\,S%R&r-BF$3SHT=`#GR&TtHR;d;[*s*R]ALGKAC3$CmhCW(J[X`6a%D2[>-PZ+='VZs3*j
eRXp>o245$,U.+]ALStI=5up5.*gB/':7V.W.'6F-d7TIHbBq`aE.khla6HiE(&3f_O$WT2./
FMWJ1c0"5AB/pg_9t$3X65=!,Din)uu7+R=#J[<>M<Tt(P)=Z\6WdGuer*Zs.=YbZdghY*YC
2#t$7<j:HMR%ScA1ru61H7sbn%%?a3@CNokC$-!I(rn(E;>>WNNPCW3S!D22'qlR5nr0l_0#
g@E+f_7RS4GN&;W0%5qOQBaG4[pbelpoq"2u"-Lt^pZ22LF<To8p`gAt?<E5_^/mAeOY5b0o
cVL/I[0K+2,r@tP/Le@%Wq1>lIr+>.MdffO=%W5*cih>hU52,Yl?G:^&T!@uo$a@=q8HYY>Z
a]AcVG3Pp3*t)k^H\qe1=8kK//AQerV1)gD.ELUuRg[Zu[]AN^DLm;KFH_U@=O*T(;jH\sok(8
mZ;rEnkQb3]A_I]AVpbqo9.&O1s0n35RQ.*bn)`"DGF)nmb'eT&C1mlT&TZV]A\EeYGt_Je>dX/
T0A7t.GbOcN=0)dVMK:t7_aD5kad+&WDEDuccF"UDU+^8.7QGL.%%b-&7spLm9MoK-G7p,7=
`-b5PTR70ZXOm+2ZA+k%oeP0ZZpQ(1c3u9)EfK$khctheL]A:d``_m6qqR6@/O7CW`)nsRD@i
WpY`TZ"r[YukJYck)J.CWDgcdp=!r:#=-k$6X#7:j!9"<L4h1hflmmTl#KBsN9c+8rA]ATA7"
K%bh2Rh?6_c_H-H2`'0Jdm/mpt:PIk&S'=rc4l'ErXYV^jfU!k0L&LafhWB<[Kj&H"p3'"ht
[1I$FD./AeP,J,0=BQ'd*<M@_Y[5K1`;mJJm?YMdm(5K.!C*icu>*.cAdI8H<)`JYkiVsaui
fkqA7KUq6Om2N]ABrmpuN[M-l/SkS\Z-``._fr'MhF&eD9R&tI'>V,LTkQWHiHE,JSrF'8E1-
u4X!_5Mqj'fu479dS%:."&lcLmq^[/)e,[GZ+V#`;bqD`(3:6cQNq'RrLW!j(ClFWQ*;+[(O
WXSdh"J9Ab4B%WE7.JRiu&#[\#7O[VL5sbpWbl^mQ(VXmT1*Ohg.du*>MToRe3Z)@`!I*O-f
_,C!dPM1=L,HB?LriRT6Pe(-4,3o>=5-qjc?";?q*F-<mT!19<4KLtbIV-)E^aaiL,<a+*L%
iKeld(EOj7?12IWVtSjoXE^EIda3d,f7WbMD!Nl(sDmj0=@Q#FaE:3[C-;q\mTl,7e(JQqt,
hCG!-832^M!1NCidMs&LPC]At.6P%+P2kY)L?iK13=RTd,'J[$r@h_i24D*HOZnd3H";^0"[G
SQ^)cIJO>ib[u_H#ms:2j!.@piXTif!"@['c!\Ek>DmbVZ%\hC;?jJo$%H&p7V;.Pr;1Y6KP
'0dofbY@HSKr`On'6WtUpjfHfo/&:\:T(RYTk)tC>d@QbEb3#Xqf;%'riupDNEZ*V4c#V,<!
&fP2Q=9h2dlT-g^t9[21A']A"/%=KLCTf3Wpo\a9J!/auEj.>(T2PW:X2?5I[/#tDe90))Bgu
b"d-_D_"ePH.,]AT#G1>)l9IeerK!B3bnGY/Us$EEo9ZlrX"+$>>J.33o;ZRn%kd"tf+CC3Ce
crsPL:TMuPX*_(n`XdMp.lDS+VX#hF46OoJN;5]AJHnE`O'hhFd?Q9@:T]A2n4b7sZ[>a?cofj
2S0#&sq5MDaF?B^6s\nF?ZWChoR<>YG0lQc2Gl,0qpE[c?kYKlOF'1[`MCLrJ',druF;+KuX
#E8,Yb-hDSnb+8!nT5%(i+U\fD-n!!jh6]A/?[(rAm)H+HLNqdkm?Gfnt/\]Af0bl<^0.N&pE+
tjaPAc@L+-%^M!g#p>An\U'L[suaG$FMoZQ`rQ`@!U9iStFU\.r[TF9"Al9d_f\17J_\L&)k
_FK7q@G@Z6[BC=c)a0tnB\pNH64V*oqTIVY1?"M_<.;(H#CSMl&<?/lViEgb)4a49!%Wn\ZP
%kQ*HaBHa1eTibcNEJ=X^>WXUckj`fE#OECp;4*cWXT=nCCOHk</"ZrjOr4'nsrT3oF;P(R0
?NGPBQ0KFTq-SV9&*TQo9Qs5#@Yu$\9?c\4?HhPUgFA-36d'9NG4;m@R83q3WmYceXDH/U)F
i&?QG7YEla+($Q+TbJl3\dqN@\fp:=.gaI0#,auaSej<VI9;SO4ps/tErVL_4]A;`s8Ih(Bh8
=sC@=F?E]A==74M1k/(f'eKU6+:KdV)VdNu@B`A0oC/7dLmY/]AQs.iDe1&+i;sfb^Tj3.s9=`
I0KWpq>?uKNqe:V76(N2c*M]AG?M/O<ZG%8$C5%/hei[TC.567W5(*6%,F5b4gVYggtC>b-]Ab
CshnHmHtN#r(rt3R3rG;Vi&#%C/^cEg!;lZqLR#7)JTumE`h?2WldFTq4Q.n:I.XMkNhFG5b
GO34O[Ke$#Z-#;`g@W]AP(ZpMJQmd<D1?WS;rZR*'^eRf8I25%/[b*dXcA+Mi:A"locrq"Pma
(kkkiD*$0<mdO>E<:M\Z(g1Y-Zq?0?V21_QiZ6@3>]AGR<LLuboUgtkC8gZ_)Q!14_`!Z=C0o
ad(jhPW?,"OXT[7s?8bgBO.6RKcILdM$]Ac+3J^eDp>YEkde"DN:Q_YU6rN6cX+skb\&oC.@U
=;\/4NCEmD;G83D!"OP"aB</rnnlu[D^!PG]Ak5+bk6o18L_c(L-d>5>Hj]ARG**;'Dp\%!epa
s0[VM`"uTQ(mD.D02<;MN:EK7RbIb:6$OP>@'"U$%aKpalPu-X3C!naOgHJm@<hQQC$u)hZ3
\Ka0OW_)=_=6gquu^qm9B&*`U+[fRPe2.F$<DoJ2?crYQ=fW0er9X?eX>a,$19#Egt:M3N)D
kkY>4YA?[:\p4m\)A=emNV!id(^N<$i.p_\m/qXc8*E5`l*hDGrCei&^$"L8OSe1juBTC4$4
D^ZjiL?qofSrs?Z>H3E>pkaQj)lBB2OCcrnUkXMI:sI$Dk2kf@A'AU2naE]A<2t'Mg=4?Fd1E
X]A<nS2<hpYX>SMU,&@^l`W^LYR85,efP?[p,-B5#!;r5@9GjV;l_W/)b2/dq!.faJFZndm1E
+81$FH&5E3&[=>tqoVQ3qKKad'9=;fNlD5blci-%6:&^+a>F'GajnK%TZn"DLES=;/:dCt5&
6F/P/_V72=\J-%Y6fFmX5U/7g*@hC'Q1c0b:0/an29^5NBWpEt>,!Dsg]A;_L8[VfpoFV3KE,
".1d,P-d5"),.iXa>Xi#b@q[g5+.^T%SDte^e0rS\Wi$$KTD-dBC+#X-p+-[6mW0Rq82sU]A8
3V>YpM=\h@Mm4ooen<8)jY#hg9T,q,Pu<DC\r;UnVf'lf9*3f\$69"1=L?mCO:hVfrD`16DG
J/cI_GE+c3;O&#&_I2l_T!gGBjIp\[/\!)^gc?V1uda'g"ArLaPY_=aiUFjb-WUeX9UHpRM.
e<S8r1>jd)Z?*CE`XQg9;qU<GCF,)HPXnT2hb,c\%$fQl'-<D[3sqI3,Ane?"oe5$@2#g:GO
W3&?[DDpHHs'((1ObKi.g#Z'C6i?\/JgU'sb<RB,;s&WL0[d]AfeEcY_kf?I1'fakD]A=6\o0_
LQr_M:bJ,:X/%fc]AWr4C_4iN*RLj7hEht[Lc"0&]A'Y:`[H$n_-\q(^!1e$[<75JX6TcS4U9S
)ason,,Fti?=(Qm5EX)Bie\Rg+I5e4`CU5R$nStj'pb[#Pt!?m`\P0SCeAWmDQbNT0h;s->7
_bR8.7bMB),X(Rj5tAoTn;hZ6R<0D&AA[/(=?fHGd&=NTA*lA8Ll_r*197E/!ej9sg9;8#Ho
HcT'5+=;.o$1p`g^Z/iT`maUI*$kUGM20[\*Shl8Ot.B%o@<09pKjU^B[upYMZVBD]Acg4t/]A
BXa$Eu4&OH3h\rB"p/$G^Fk?6H;5a:l?+=#U#p)#C:CI):d2.tc*Y_cSch13R4"8$#E&DY4/
\[_(N?Y]AU&d:BFUQ3^j+s=;4[1?_GZsn:50L)uX[6oF4$_9ib>$h,;`o\@A!Wj4TSuBWt\PX
RbhjrKfjM=6(U1YSPW[&We[&A'S7(V=\(``Wsl-e:DQrO^/mg<'ZL*fPge1k>D0f1)aRn5D2
&Z]Ab2c58K"`*.E$5Gn8/Tjl_ZpPV\SJ0GC/U&K)UIdFB?+r),_kFiZ8f,EhGHh+"UV,l,)ER
!oUA>;'"?0&0"SUTK<WEABa=.O^ZJs<@[.LSZti\F8g`-C+lHjRYq@@<?IP1f.maI/uU+N<s
S3PbC^JKWLe/L1Oa7tOW'qa"`m8]AFu1h'I&gpEZI(0U,;!L'#(7JPHqCP.7L9b$c/>j4am?A
MIJVd4Z";<&Q54QAAA?s&C+*B&Y3S>:;U*XVjrud61;K0<e1RQ;a\6drle(j;O4N<0$-'"s?
!M`JU..02h%OlUG@UV31A\!@?;!(Wj=%<'IeOJ!qs="G(.(C;gg$)30@VJgW5L]ATSr2?ZO<2
qik"b<K(XKZ^&m'%0?&l4\$#U)u@jD@&)R/fLff/=E0=M.AHgTSaMHLtamlUX(XEgcsl_?X^
o'AL_3F`b'/meU4\%g]AX+o;T.r6uZ"5,YqiPOqPYE7nsZ>,nXr@8,np+.@ZoD+6_/6A7XM7V
!8K=?O61CbFX>BXqqb0n::Vfc>*)(t3NCh^7,gA<W?$mok1kaRs*NAA!rF).QUgVsDOJO4CV
%^uN-If0!o[7'5*40.lb]AZ*hT6U3N#;`oc?:I'h%/hpuG7Le;?aW;#A#92i:phjArW&sXTWW
kJ!A_f-toROa-Vg?P]AB!d:Ulptn.C0EO7%:$UljYp-3f8^6b$-)0BW7-(5?m@JK@oAVcDTE4
j?2k.`2V0elT5bD2.^CNO.U2q+An6)E)FmEkBZMD3=^Yj;6j,S?WVu)(G>To,dcNLe1nYF?c
+/$+2WX$Ojm617.3mDWu<j3%ADa`QQUtYYDr9.".-YV8V]ALEq;!q\M\CGCN,,\'L6;l6&B\r
>r&Loifr4S]A'X=!q!.\3u'r.3LafP]ANt>3LBaa.?q49c%TFaIKBGXG=^CKB%?tq4(th0UB5?
nZq`unVstaW/giOoc2rB,(e'`^V2mV-Y!F?.6F.mU<j8@NiX!DkB4Fi*7pD6B%"Nmmg2,jlp
J$ts)7j'L3"ipPL*I7&i&uH=3KH`Q]Ac@Y/dbj4O\>g3*U5a%Z%IfZBobEgq;N4pZ#Lk1:0^#
KZ>cCr`&X1M2L=4qba0HO(I%eM4Q-G_V]A7:^\U!?ZAVje</K"lgW27j-GEmQ27<L:]Ac$Do_@
dV6n-r!(TJhq:Yr`cgH\9hR5Yh&\_SJ/aJB?^>-A6X5saO>=l!B5IN+>3bZNF5<\;>tnb5,L
unSOeA"+VdoVY<AVZV?OoP1RI?:!E)BB-j[&,#<m);?IN9NC1@)&tI;Fmk_)^@CL93>if[Ce
VdQ<0`HpKC&^LiD,NEQdGi0A_1EQhL]Amjb'FVB3%UUsSB-=5#@Ti7GtuYcJS=qP<2u0PFI&h
=UhbS7\XSl-sB&:IV#u4;]Ai^c11<i@g)V98>=_=(/cX"LVZ55pfT)9Mc>n_"0>sP#?+PFoDE
_&]A/CTTGRe=\Tf6AmO_U#qH1lbYfB#*oQ#f1S#En%ILjk#oYX']AaI\i_gUYP7'L&\E@S#Dnk
$#Y3sL50"G,(JMH,CHl7Hi@6;<*/re-N6g"j_rsk[/T)('a?oX:`0%_FfASo5"*NjI\OD7&6
f``E!7p='E8f6Ue^CLR]A!SEE2RgRlj9j\W9Hb8O1m4DVG1tgQ5gYD(>ER*c8,MX`$W);f\eP
W'\Gl4:<7G.7*a9ios-kT1ABI".&Q*m^_3Er\^I\tI^VhJ>Al#Qk@gNF+FCC>##!.Pm`H-]A7
2lsPg(R$"203*@#fb)?=ID^iF4L$t@X9KY<.@AJoF0-nrp&#9D*R)Vo7jqcEYY]Apn?=91Z0d
UPM3CrU`+.t.ar(o+M+la,f>Gi)[,^tN,,I+=OC.^-.+;hIr^oNg-n9C\]Aki:Z'?N"B?14*&
46</AS/(ph62egL1*d[hrF2mk15ODALNs%\WLBQMbmL\<e05)i=16c<[jr%f*r$dqW,1e"a(
<?]A)oMGCk$Sk@ajQN$&>lO:f7!^2Ac,)I,Hun?9VI<PkrW<q%UtGgkN.W=UXCGpX"F;JVJ66
/'cr?&IWE&QS&W[Df5J9>iloq1!:]A-\(J&1U0PiM#k_FE>4Dm,+%61LpLnYj54+(pJ]AW4Kb[
s!Pam.aEnV'k0t-?C[i+F7@\BI0Y<kN8W[e,<*EfQCW/D]A,q0pfQejcRMqb%440WAH(0PC5#
TH]A6*o_iu4FREtJAcad3o7N\A4:li]AN]A?`Z9h%O1c\j1h9HjHpk>d(0@l$sg;.!p-.k-bT`N
hkg$tC30*!h9C]A:g]AKXf'OcBTMc>Ts0/LIYM-DZdhFiGQhu*'^E*'QuJA'D[V1Ulieu;B]Aj^
i=,=ZW-XL;[(7Vfc=kFUemF;25A\WiRbD0]AAaXT[>7/'9*O8:n$LEG5eD^UqlcHGVY++hWtT
s_V)X4]A!BbcCZ]AjN/E3H/eb03>Jsn_e*?KM=VQA7L?@n-F/.NROa]AO$GC%1"q$?4P+1uSi+W
j\bbPu117@d.ltkmI8`m:dRB\UQ.N4k:#2mF]A)3'!gk*ADILcEUE>o[VtWITKWq,<!k:GHM0
6X\&6N/P#Mh'$E,!l(k4k!Wb*dIp[O(*/3Kq?E"gd=+9=XGS*(bRhCi]A^"q=G0R8'p^ku%QS
Xj&RucQt:C8UCf=QVqSI1ks"``iRKDmEoG\4PbmM.5O0,6@3aKoSV7MF6sogN_:5"VPf.HmD
0-tEeLla8)Ji$]A4K[J&4k#@2oIY6+"s+$q7,tR-?\cq]ABgYZ#=o@M8Ym^PKd$LBE]AYQll]A`>
E2KBh<0pO25A$^B-95gB);XMD0QTcg+1)s_;q^en%99nu-%Bh]A[,,te3#J(;c'G;V1j'h2a!
lU"'[5)#Fp<`0FI^.FmWX[.5!(Qec(0@-%F^6Y/YY2O6ltp5!@5RN%@=!?7jIu$C*6UHJ*a3
Y8c^GOk2VbjuEmlgT$ph4Vc_LGH+C-cYr"cl:rk:?ACqrcV/CrfH;goT>RQD6<qg3r'M%lm?
-_VtD^/Oj"&G_Y8db_YAahf#FL`+K]Alt-6XY_1mL"H*QsNu(`\I3]AH/O>41,9-qG9phC8X,f
XJB)Du9hX0&b^i*L'_JfCL)oZ%>fCV/e0%*H=&)^#l%o%$:2hYW?^'8]Ac7*d.*OE:'Xe8X]A"
:9HIq(e;5DCF8sA'M3)XZo*4m\)8_j2qnj0+N3.M,NXXlm"O,#N%srC?\lZ$J[LLIQ/&i-IJ
liHi5GW___7eVm)m3qG`3F4iUr==Fd?_hHSa!L5+g9N#WZ,eG`]A&c:Hdd-0QF7fZlrG^L:CE
`+dnBS(Q\C>!W%IQAh9.lX/bR\3E.6a!dVhTBl]A"b"`-2JKIkHLW_MlRgPP+Q=PLS>F=#nN=
T5bc+aZ7#Co[lfqg1sBBa!X%KcI?*`pe&V.0F!D;PVV2Ye71=6nn-(W\;#4_'eVMSF?SLdmL
_/TYkusgmVL^H7GQuLdI^'%=q5(^lh5n_N;O;O`tZ\MDVnCq=<P>^_:cQ/mi$G#lPNMEI16%
J$-[3kh'4s2mG/[<T4UJ!+jqdrQ1p9I-3rEJL>RoXYF@Rr#rU7fGLHdpg;b8mfP1O%8Xi_o`
33$N^oi2DQ`/jn_^?s'Kp^1@8ddS7pn9mu+1nmgPG@HEZcDLYS+)41]A67?d9%$WQ_(I0`*F.
C<ZZba>;Tk?%3g-`3K!3r4Y$ol8-ZMME_>-_093e2PrUl)m4Z41@jRr'In,INY>o(YpoLb#!
L2)a>.,hS@/ZuL7mpo"n"7sI>O:d2s1--SBGA:HNUjsq\C_g)I,T.',f"j+pCg2*ZATREP7.
EEcf.0]A'fpo936,mo_Xm\:`QUr]Aim@bca8g_gi\hA#3Vb)V^,[S-OM)tkmeq0kfbi='PFC=]A
_p$)l4U8Hi/rCt2S+)<,H*o\Q`YSKP`qRait15))A-X*'Q'sn?<nX5N30B!.@RpKgD1g%ue-
2%h`6`PtnWONmDU=0fl?[1H3k]ATr[>T(Z>DO?N,eYT-l-^[-R%S)LXoRlu=>M]A#0@6+_IS<)
?e\>snob*Ag\X_n$AZcNK2m`XNShsM"q"`AZX``5ZI=^uZU%,D;aFZh2TJXLN1Nbaj+'a,70
7kc:Z%/]AC_!P>aV-Z"l7/]A>:Lc&d/=G,`6f"GoiQIjo*55Vd)tb!1&<(p.[(%)?524G$rE-h
j(#o+7Tdr&n#!@p*+"1>WIkIne]AaPm+e$1:'Bf4S\UN)o^jm[4h+Bk>[T8JthN\VM?hKmY45
=CmcjhO#<H95X1/&Zt=7.-<nYZVq,7RaKg\e:aR%QJ4G$E\KfR)-Q_o2!M#]AU;1H#BI9HSch
$j5aA\M2#'"Q0<CII@M=h/k"<2Y<\5^K?9\etqDT7(/>hmQS:*E(AjnmoVPhTS__6l/ID!$,
)<f3g5l5HZ_%9;[cd)41aei[ud>5D,!a'(b9^5m;;53.<"t:'PM=W4CSG5e'Vpj%j6-7qr8m
4<Y5u'>MC'AP<DB#QeWWD8JCf#1Km%F.(@sloMlPKf2YANgfR>b\TRaVY8io,sDbC(B\#n$X
O70,8/IXWLr\7%#H0,ln=;;'!5s-&1[]A+B(/)GGbDml-BgnK/(m3*YnQG3Oc8l&'[fp"HE&O
KDbe8Tak23O'uLrpBfqnYmsL(=#,&J/IX1)_hi"WfY\BXZ&$TWgWu'UYS&>$&MnU=.`]AdsT7
RnYS@1BcUPCtW,A]AdH?ljVcL@W3oh*pDR/XoWm@Fm^_T\&4BXls0a8D>QKU:8^tV/FK;?5MI
To)N3L<DI%]A.J8XTD.d#M]AA!@`ol9c)$?+gUTk'FNW<Q+Vd3A$:7(]A_'?o)fn./@rSm^]AcH+
4tuWmld=?FdY&VOE>W@L:SjanC69jlXdK'lld^#E[0MN&W;Q."aap+3.>U>l]A/B"eh)P[O2p
bFsc`SgaV;!c6Y)R\<)V<#U21)M;j)a"QNG9gAo]A<J2]A^oZioJ'$&5Ua<Vfid*?Ki@*-Y#b+
aN?Uj%*%&*O=Jp$jQ$Rt$d7Q"U)!;TtWH2Dp1+s0A`c4"g^j_P;"h2^,m30KkL^utl_#d"l@
/[0.M!Ncdr7k2q<*X0UeO+1@)&$Y+h9;SYp0Nn4rZLBq-O:`8s!=4j)t8hpnPU*8>Xi7<S0s
3Y$R7lIR)RYu\V$89^Rcm(c"'NQq?9bQ3Rlog#:ZBQ('Kd^d>>3Y0%/S%mj$W)YTY<AATtk-
U]AJr-P'?6GLUsN(KTSL<2[<,9@%4EBN#:3"C@+^hK-Q,9.qBrKNG=,7nB'%Fel]AF#_^[k6dR
-XQ+"l.TEf4Ae`C_3X)fVd+RbpFU]AooXcSETiG`bd1)-#_A*qVFeX_Xu#Z_=eOOf(/e"/$-o
ha0Zo3;jrrpI1Mtsc.q.hqQr%rkJI#VH[d4a?T7K,f:L-b@[JLRgi/9q[dP7%>1l]Amn]Ag[@A
`J,&(3'I(ULHD#"Sj^`5s.-]AD*8RbnaEa)nru-:"gr<83CVi<WMSN0r@=jmoWD8`dm80Z*9L
=M>tRij%Y"@_]A^4PJ\c0497X`sg18VLrYX^c;5E\4.&8pPib,/G,F.Qrm$BEF;9>^;pdMXq7
f6(TA[[B3%apZ]AP<jD3!F/jSa@pWWAM4"f1Bk)^sOQP+=M[6N/+uo6\I*;bmI)5@#,BQ./W*
n5Vi&$[u]Ah9ZG<A6cc9%`[.;XP1W;_ZLo2/)2uLJN\EiHqgPQP@LiCV=FGZqZqlE)T9<m+1+
"1K2>JK=/qbqR)"CI^>oFQfVT-Mp3@3a*k^Rqm;4U8EGZ"gBd$UhR,lP"[)SP.e:@+osFPNk
g7CN3ppQ3_=_)iik#iIB-JI8h6;WUS^M@$SUG\@\&d`!7mh)CjYOX7gGoK*E_:=ZX%C7rY$N
&"3fei<L"4qsn17(3I!jX^'<,^*b'NP^fbhLkA+o@JA")OZo'm5L)BmNQDl?M6C9>i%YDfT1
.J;91O7-!f]A1$l9DVdp`moTG'HD)I'+MtX(F8*5H1!n!C/X_P54Ve:O?>2g6rsQ3chTSi?a7
W\kBf8+RVjKc'TR>]A?/s)#eCE?nVW7"]Ak>HT\Ep%]AJ7>/ICsCfNH`4MD0LhSM&5g3)Ep\AI3
;#_':C^%1Jaef%>4$PdU_X`(T;OLo_EHCES.C&<TEp"hD+cY[gF,*WFF(@840_L&11nCTDj(
Kt:5W#og*2ZeH;/,7Y0(>J*^?uEq9)"/@[!l5E5^RB?O%nb]AoZrf<-Eo"DZ9;eH/\OXD_W^,
(8*iF&mIq[J\9t+is7.bk4EMcKGV<F#@2QU6<U8#AU5?u\E!.5oo7<1bf'6_*F#6BCN9n>U2
Kpf0\R6VH/3$$U7[@3%m<AqVdYA4^WYj(.gdUfPpO\>/FR*gaH)`,uc`aq*HAd*mU\*A/Kqg
b?Z9`"$SXmTsRg;A,P<sUG[+IjbpM#?(T$"uc3j[L!WRsEa[g<A3diD?k;/6l;S.qDlRB@(S
pD!GB[bnRs2Oak8dH0>D1Z]AQ3dY?h6;2;d$2K-0/S06O\mr35NdSHAL2Y>^=(?6TVMnWQ1gp
?q?9f:*3/7=k\YB6lC<,BNC]Aqfa'hK*[!F.fTM)Y+2tR(j+bq3rP]Alnc^=lNg5A]A'k"\"pT"
(I7DDa$W0DE)C0@Zj5>q4`cgZ@(+9&1Z_bY)hUI85Eke>pf'HX3K3;7T$YpFL%rHRmM?B7D!
gEtMUac=`'[.6j\o3PTK/,+r3gaCQ<prI4\'_D%!(Kt*q]A,bD+WddAL/_EA7F=MY=+;--Y=\
(PYA`o5X^'\6g!]AlF-\AI1UL[$$,\GFTZpg^)OR?^pXT]APGL$sTg9T^R`'g(micXRu#ji>QJ
NS#'(3^=^`114R@9i=fsrXI-EN7IcaGVYE=^4(*NL8,GjE/-pA3MF+.J:Mo7rg]AH,T#.djLJ
G,\Qg5iIjl8?lE'+NO`e^2F?[cYbKO!5l0"XP)4+n+ADeK=ZK=oIP8mSlfM=e%Hfpuq>*s)<
fcbHkAeZ0_K+m[o_m+Ec/s^R_A%X4t,`%iaCIeGaL`IdUn<^;.+Gk12Zep-p^>rRa,gCg>1^
SOJIX=mu?F`oD7ScA_\)[%;g.GjV:qi4UhVRCo60JOp.UC))'4Ph!<<T0u"nr*+?8PDNs4L=
4\4-jK_\Mg/fEa,Iu(?+>_^aZ/9C!lps3gj2?;58GCPkrXF]AlWfQt@=^T;j+FUp>OTbf:.4V
=2=^iFKGiL,;[2s\-^:9nQ8-[$+J<K19=gB`O`2Z0db[)CD=1Ca9$5"F1:nP:b6VbuTr=]A]Ao
Xn?f6?2jHKPHk[j4#8pp7pCmHha.ff<fcNUEO"&_5;Q2%"6Q^RIkkD$+=d&)m+F!am$=l=G9
00?(glCXIc&dX%,!1[+ud3&k,eH9eR+5CcP,tD<b_p;TkGmgaH@6<Z.eAqqfA4+f5P<>[9K(
X[-ML]A^Pspo^!kb"_fa45ddpEN*"OXnSOC5Q0.Jh"b0ceJ"Y)?rs>-[6Q*@gL^9CS*Q$_\qP
^%o#PYKJR)gZ&FQEn]A7Xl(XOSE_sQaGU<!h"<SJkq3*(@"h4J4iiY!.BTndb!dj@pER1/ujW
X^VM@Zg+T_0nZp.XT<.u:/_PuGLK2R]Aa>Y-#pnb">)+3h'cnV6lDH>]A;"*eNPN#dR+8:'"CC
Y>`RI$eq?IeOKAK>3O,j[a2Fnl0YgG;&gIk=no\CXEoC#PqrhB;Q$^3^rk3`%P8a"b\P+6"Y
R0+pd&*9jor:_J-+h[1]AI.qCZ1[<!?r;%<ks?omLeu>5`apE^b7SPN$1fg(OcWKGc%b>;lGg
HL<,7(9X#NFd$VV:Y%B8Gqn!G+"@HbKn>ai8b4M[?8g/@j/WU5'1OmZg<oje_M'6/CJ,<^-4
Z\fE2Z2ElJgK"@jI93+?Ef<6%'lkf0<:ueRnW*JgYRf.Le@^cg(70q19q>1?ai6i(XG@<N*Q
eg3_Ai:W:;FXk3=kCs9K1U\@#L^k]Ar7$-CF&,L_'+FqB"jD;C+'%-@[&SP.='/PLPN_VquR>
tAf31,Papig@jVVS[?TSl:ou*BCSG1i&]AI)%sMoN1(ZKo#c(5+ID<G8T2I3cSmaSI;?//pcW
4Yo@/:qb`!=t.G\o=DDrOHJc4`ZQDEBtR6cZAAQbU^0!l!+_.,ZD+JpZ-NT[g:`2GLF11g_]A
J5T,1a0=>\A<J,GB:O1^0IOB^+?3rmEi#;RI%[C^)l>AOG68WbK<!di4+i$Ro-b:XO0o8YHC
j_>@cB<N+Ys;U52F^]AeN.$C\F#*(>:k]AhXPH'J+&aB:6MCkM/rR8N/`i_oic_g%:qcn#DN/r
`jWQ"R_dV9Im?\E,mQ@?D8e;!2pC^'^5r'^W45#LhF^:GVe/g@P<tB>L#p]A%(7VUV;]AS9G)L
FO?Zk"bk(kM3T8D6u`To7s*h%tr)JW>IE4.UWg:I$4qJgQ=+t8UHEtYY>\:Q)#g8n:!>jHH4
e[)6>Pn1H/.X$pp$@rcY[!F:#2r4CB_TgHG%(f<_N1LB/Q;c>gBf-`"Fg%K54O+?eoj=/tTd
oSgP7LZmXqp"#62FB<mhoZ&M9\DC",SQnRP(rU%l9eZ%gFLMsHk.eLI%_i5Q!@.dUhP-nid<
I]A<;4FPpP8rL_#L<aK!g4_B`>HO?KB.$U&NZ':d?h\S9n8SG7r\Rr&4n2-o@_T!pmOSR<A86
j#%3@8lGqM4f#]AQP>_hji(?"c6RLgO[4*V/?)gXI>^^EC6cA)-ZgsXR::3^@b[p:t@IkT11J
^\A'[[Z?q.N&!5?MUXggY[1as4;>cLhiSmR=(FIdd+[QGQ%dFJBoPCN??(;gZd/$qL#mK5;`
MHja.*K9oEVuEe1;d)rMX*MB2/e$>WKeck.tBJd";4BEp^09MhP-Jk#huZWbB5<'YTqg[I=-
R4\IKlMgo?D@"29V1nZWg0HX!n,q]A@k74]A`W-h,c<#^?N+e+j.[FEEI$KTuaj'(]AEY>"3pO2
iBNBsS18]AWjs?l&Rb+Y?7'L%Cet0$UD33g3ugcmcE0pY*T,D+DSL:3QB^o9.m8X8:FO<i[GN
<hIVmZQlVtjI&ssjQ=B-J%j;B$Y+?i:&kA5Qka!PhNJj43/n9r_g<?G>d7=)La+Ws@&8@"n,
kBc^)inO4/6k-F1+cb"=<Oo$AdWSGY;bEc=+=R\8jPk_9F+CQrN)IgDlH;pUQE6a+i$O,'O`
JJNZ>H"UXehKUB$Dkl3aRgBT<A0+h!+"OYT"_Fb(7CWLI\JJ@6=g^GL?-/%K.nV-!<7d_pl]A
_GS!FJ-ct^,2'B'dG4gtFKNs"$9BsJ9TJ1@\und$82`+![&/,flI]Auu*.*n"J9*"NH^K[m;%
?O!^:2sBAPQ=Kr]A4D#Sm&@%o0Pf)@FfF&:IFLlNoI"fRb+UghmBFb.D7bLIm*A5d2Fpu`d97
!3f12cCL)n^$00g@l;u:K]AbW5*>-2uTUpcV)HsKu&#gCb&CLW1q6p/;RlrP_7;<jTh%l#uO_
;hj4M$r:O">E(0pSb-'M6skmp#A$[+m>7p\Wshhk3o#01SF`WXl'51rQ*0aA[W.:k#u^H?,I
UlWc7KI^'fJOk^FH.&jM?q.n-T83>K%"+'l5jR\:<KX,P8"&(6O6mouBQ:S)@EC6Ig3P55.:
*_P>5`PC%NQWq_:hmJ]A;?K]A$\4qZ&gm77OVO04EEa*q\kS8gc[S@b,[NLH=[UF$:ALSpc%B=
B!ldt%tl#%(AhA:?2h-Vc>CIV(]A\l2fEC)9&Z:@L<,aU?WXmH*%0CdU^2Z;n^!73,:]AjN4_>
RA?I8i=C09s>Z<j_DObc[1^4G:s3p'lCWL#\(SFc#/UTibiLplth.35/>=T?([dO*/G]A\O2h
eY9Dr"/gsZUOfL5Z1cAF2>#1(#/6sJ`=d!jZILGFGHZ=^Zbu/h1:7HLZ_qo3Y7Yj[A6I&X<V
XsH/%8T:s\6XSmH:H4?U$?n+*n*DQ.lQ.N?l(*>)e?G5<gE)t;TrN3MoTpoUVPinA@X-)Y7s
ZYi'IlPHMe<fnGCY5&(5Bo7?cUo+piWL.=[_t")3%.Gj+YB\Z-5=)MK"T;qe/@[.m&na%emY
;?+kh[DlH3%c>jmmP]A#D4t=#ieOQhX6,*K9RS^-?*lZkJJf@!PGN?,J4-0;`lu;UIs/Q<-H#
%.kpE'm/HdZ^^WF*NEH$4<6VpkTf)18KeNp`K(>$&fUCR._6\oF$E>!pLP!-GV7r(o^42(?l
2he(=_Q;L'O;cjs7MUL\^\*.Ga9(]A9#VIi%=b%W9l_tlrb/+;0iIIOi<@$>R\9'.j`]A(KnL8
9(fi!JM:\PB=36[hfWFjUMls'q_kD@a0S&,/XdAe;/;H:h*b)CF$T*n67Ri5k&PR?Pp3_8Ji
0l.JaAJ:S9/TY]AL'.TJaOKnPn<[pgPWEK)M4aQ%Bl?Gb"Fu,d_FPa#'BtpCmYkJ2U!!6$`[,
l-d&pt)3j4CLF2J.>_!2ZA7]A6&RJ3T6",8dU#X9qp4.Nks`R(>m7N^Nk(1:.ihD8?aHo,g#\
t3/:/q#Wg6"$#kBA3+"!g.s:J\ICJ-7;bGOUR4#h*m*qg$]ABOe:S\>uQ0s.>4/!4O+*BIW<C
3]A[:2]AR6`*E+jC:W89Z9&1JnWN-@\OoFRF(+:'tKIQkK2)7=<bRXI@XbBq5#2OF@FK&,a]AqS
qe8X*#rC$e"nn!k&AK/:3JHCh=Xl=U.'`TG*s"Z7OY22qH(iJegYs#c8^ReA#KRW1<-6WUQ;
QgnO94B&oXLNtuGXmk^-]A>hsr]ARoq\).G!neSk/HVfuN"ckG28n+T!7%g#>t6Z/blh`lEe_/
lWYLRih=-7(gX["fLfjE#$)nE+X2qX*1.7"'*NZ7p;W2Da#KM_\h+%tK0c'_hAc3pa/4o;G7
o3@VZ[r*8_bnTOldIW=EjK.6j<4NH!Eb&'L;!3W\H*.$5`9d&u)\C%"IAQQ'DhXS#0'aQj3C
i+A=1j\>a*Em4[`pKY2C:Z\a0qFRu82rFKQg:6s5%q=3]A/GjKpq2D)(l`!E3t>Q2=#VA!3VK
@5//%)]A5h:h1&-Q..4CVd_^aiZZ#\EVQYu_h?:mEZ4LqV85kmUUe9]A&[n+Md01E18f<!nt8Q
jjq-eIap>rI5WW4J0skU#:p-'nRQiIi7k:D\s.(JHYlfj"`g?>R9+_G(rVI6=u,oC\*r[cLE
LHC&a^h,d7R2W*U;fiW0K#,8(q/[`RUO9F:_4AdP_66/u@+1C^YeG_I;8?na,e%q+q`D/?VN
l&0J/-RL<YW_EuK0=SDIkgT@;/rm(YA`r?@bG_AY8#I\H]A!LgfXr/327VindE>9fX:ogPCJs
06R5%nOPVm@&p-6cqhrf-"DVf[7_%WCp-8qm!88OF0i+2*ZF?8[qr[1&_P/nI'j5GE",+G61
%/*l&CkfrNjLp9tBAhS.rj*Hbt8hDQY"Fq&Dfo\"`:R8,\OL=4W]AgLoe.hl2q7R*T3TCML9V
lu&=n[%scp)rUMa>DbG<)`5+Cj.5Y,28G/1-Rc5mq=c;^+#gp4KpWj@Mbk6Be%p8$51SqI=M
9f-$p!F1/^mII]Ac]A:E47flL8B.aR,m]A(_#\sHSZ@<Z'[*7Q(jjau'@C#=G2pNqL0"XpYQGnu
T(@-)S1u8pW]Ap-YnakGg?[7!TtG8ZlLS/>pfHcg0Sn*(\.&2l+JgHsOJ-@qi?gP??t6&%iO8
0:i]A,@L0UXW#fdW]Ak([a[jA(j]A/,=.#BFS]A:=\/afWSZ>'4\1cPnXJ6cUi8?U`&+%beQ+rKr
n=qLHB/;npHQo**;S[hNp"B3$co*b`>rMUs2iMqjP%\o#MD;Mj,n;u?"7Y$K&tl4euMN5c!F
7K<84c?jgAhi)h$/U9:Yq\=;VH4N"I/t/@L1\EB?P\Jmi9NFeY^J[6pg&?[NSP[Xbah(m08m
YufKYd@gg(HfS)8bY2&!U.H!I-FG@gb*]AR+ZH&e25s^n)iLX8J/ZHgq(??2i1N%<@QFcq%q`
Q&Q'1'H]AE\T^8$mO5i(iU3m)mmaCQr$c6+[qbdnbVo<Y?7QI(ZWILY&^$[,H.X+)ZY,md(*_
e2F[Gn/Wq;HLL-#,&"p&FAa`^058$dnYS(&;OlOEAj5?mFVC3&-(5?`jE$3>kpVQ?l/JLhD2
0XMWab^`hd`]A/Zj""10MMr>!ZXYhicX[g44;[n[!">Rn-h1U\tdU@$?mUZO4WqChhn+g_^k9
G2\c0CT'dI"Xel[U^hP_.2QE/L<6GA=/b;VM/`nbGjGFi?5kbAfd]A<$mqTlJF?FVf^;^J;L@
nLm>NdB[[qF^/lVVYQ5V?V&Y8]A)3$g;KDg<19DN.bcHMAA!eE<G:F-Jk'=6cZ7YIrQIjTkkW
Pp\Su0"8-ZE>>B_/fA^Jp6j*^[RLE4Tf1U'f&$+l027uiWh!Nf,HP<cnI8ha(kh'\U.8>b*a
c.ceE#X7WQTPe=9%[%4N9gmG`M@=E,h6`BqggV?AoM$B_=&6H"E'76\"_Mhb6Ig:jsR"=)h]A
qiJI]AY.rY9BMh,PVc!CXP!m>J78+f-pSO\Z)QZmIiu@aM&4W6#Q,KrMW`[7>LBnnW8P+:@YM
LAFa:U[R<=,rRYYFmPtL)E,lcoNTR;lcSO[b+3>L%)91JH&p23T*O@p0$kpNf[0CW4u4uAWV
.h([.Lo/+pCI#\C-BuLXAJ@!JrB2NEHKB&[39!j!6aNZBd68TsC=2V`<Q0(-*;+V9`>]A`&5n
"GqGAa*aW$0T.,ZU:aDc#`dK7(')M=I(&@sZFf#,=SL]Ab9.`qOD&SOV[[bX2&oJl7HNIV9;_
R-`mV1hBB&O?tF%B.&bCOh)rhI7.B>_'aY!Eg-OA.,+s:mT%3M*VD>J?YFI+U#*r$U]AF$SF^
I[SYM5;2nm&JTh\VDWo*d2hnA\hQ2II[DJb;&<QZu)#H.tu"rgI8:9CIsN-MkPZl,"$DbQ\-
)gh))Ff0iR_00'^iK=ecWNSt-Qo6MS3?;fF"c<JEpNKi'`jT]AQF&-.1Bt?&f)bZb/AY:\-MJ
\.9qKR3jMA=N)m5$,(%6?0""<iNTZdudNlma$$Hn:<RjGc.6q;D0&?JfR"PpBJfRQisZJ]A+A
iB#HPpIU'>/es<V]Ar3lXp<%F#nh<#Zcr\,qcX%I0\^mV$m=l/[HDL4^jc`!]A.QCU+S(0!=Y%
=;m5PKZfVZ#,8.h36;5YON/_#U7E@4L(mm9>6LP7>]As"\n:Kt#,c#ZOaC$Z*]Ac07k%BXKnj8
TAk8q6B2_TtV9^GOi(<LA73QWo(33a=&q_JkC9)5UV,EGX=-#Xj9^q!>]A'Xo*dH3$On/ta8p
jdW8+7fL[h:@4<SWft?c[B`Cc"U)<C3V&JIf:TA<DO!.nfCmO6i[pLV-H*Ng.e;Lg$C&GgAJ
Q6Yi^f7%@S(L5CR<edS'BR^kW(T-/e0a\08gitbD@X.DtWZgMc35jZQU;>GsUfXVrj4>(Z"M
cYGdObROgF`Q2fVtA5pF[T2^9[.\"7q@Q!M;5&_Y&4gD)'(5>gsD459u>*\F:0PYkiY$WICh
*otZ0UOQL0jZeDL/fpJ)g%$j3BkDnmY=VU)5hOVr/+kOO%W(=>[B-OdN.HK:Tbm#&4G.5m9R
4S3H#kA\7eJ9#0.7d8,jA@KPu"F*en1Qck!F^hLr!sH/f3c#NRIK]A;56?*ehND_:$,;71Wm8
&2QI4pMmn-/a0olmEs+;aP?b`I_E4b3,Q%-e&J:He6Vo3eDQjWq$YVrY$GZG28R#oG6mH$e0
h?$`^JHqP=XE(-QR!rX)qE[g[C5YgM!IHda2NTD/()#fj&kAlsHj0?SVnQbBTijT04@"FZN"
hLk@@eIC/Vb=G<JEIsK4h^G[h7M'Qn@Os8r=4dN:<oRSZhJoYp3,WpKgF%BkZZ]A7nG8+Y_jd
"pA>*L7_G,<M@V$r^&&D2-?d!TD2g..?S5BCbu4/Xb"SZ'7u/^@"X<Xm6`K2iUPm\=eWni>f
F651"uEoH"Y#-!$13"sNQ'bu4Lr$qdDi1E1eCP`aUf^0rD_V6IXlEODZ?H_(_t=6lAY\2#al
oUD\MThdJ>iE9.hAXhdfJquc)54`BbH->CO5?Smc@$*h6Xk]A=V*9/>0M^D[%9*t`-2qAY2>-
7X?i`OKk'u:Y7V5%m"a#q]ADXLQ9^`4XBQ(s:)A.uhGNEiY(V@Sg&;r0?q+`'M\GK;d11Q8NR
@0f)jdCA/!McDG2W&i5DoD%eifL[7t]Ap@KWVK&i.@eusp]ARN"u-D;3]Au'?4pjNdFWi.rR&:/
Qal>R7A,V/m`Eib+R\FmT?ZPW29%O<\26W%;_[%T"?DX)<lt#.,*?+:mJj2L=j9=0#kElW?c
$W_.FW#$uFu8?*QBgZheI43R9#<iZq+b"sM85Wu;u+N6pq;C,3?KW&?(X1'<!;YXt<$.:oF+
Nj';UmDfNZ8i!-(a$*,K-h3?AY!0T,HQ*;5QlNKIh)&kLs1PVHX'LBKd7RkS<joUnrbZPkZ*
PXo/QDed]A43WF^?Z"#;gqRIV;_+4c>9rF6=-r)c.g+mV6^KVS]AB+ij2["kU3fn\M:_T!2?-G
LMV.QEI=_uQ1=dM0=XHu%c-Mnes*3;Rmr)IhBJ_r&3GF<PH(OLT?__]A+#BG^)d9aCo+S&C=r
pnh!;VK>k:6k^Qo9*_@q"^Z%'^lSA^[LUX#Q&p[@Crc!,m*ph?W$`h(ssGo0GUWFA[DABl#o
:ZlCu$lqPJgBGOfP6q+g@9(DU]AbM!M_3&Y2P/'nSt_SUPi^Y.d&=>Q46EL()JkU/mo%31\pk
RLsp7=D%7oj=JUU".@CoCPeEpb.u!$(WBS($^-:GLT;pqn/X_'m)uL->ne+V8]AM*-@R'\?=l
TVIJ,HH<HEG/[R*95`=OTG)jBmq?;E1R'$soJndQY%E15j6<]A(_1afTiEnHS\,sdsoL^K!b)
V5*8ZnU%h]A-,$`^:DNG'=pLNZ@)YM@->Bq`/dF7u3Z4?]AJ[*0-0%:_1YC\H`8@5R\EGkBeLi
<r[l<nTRik0V3o;.*2P+STL0Nu"Pbl.5XHW]AS5(L5(9_@4)oUi/1h_Ve_#--KM(ma4mA6Zu:
#/mV1BZ97F,A5"h&N_1/o_ruO()W>L0Ll7AbK4nleZg19S1XR'KQ)jZ)&lE$):<`_HoPNTKk
E]AW_9[))Lnq)*U4qeD@I(WDLfE``-$!;)'3`l-ufe2A1i*[Y3S9)T6E;9X,&l=9<"#\Km3i(
6XI91jP&^.mC6qatfa:D9c^o7!0.7XiZ*`R=@4nNUC!FgmcX1jjFresPGSB0_FUhYtOp:jm=
A)a$$CYg-2%jDC(F*o3I$e2Aa#=/rF:49;&'``A(aNC0o$^?m.rf.lpdF4tgoRm,9/r26eTI
X0hFe,OT0OgaLBS1.]AB4/<:e5Ct0lXS+g\L','Ic?7@%NK/DCZ=<35I5&b7i8A7bK%b.QK:)
GDLmeWf?Fc?e8dbNdgRf/cnaCcuUh1gr'\;iC^-GdH8>b;?giRre@FEl4:iglP(*Uqc8"F#)
,0*sK8N(Wt=lpX%6i@ddZf2mH5C/jd30J'?IoHi3%OaO6p]AI_6OSM9gF2du48u!FicMBtF8R
mOI,kNW=hQ",H2!YjnKl[!p4YYC$G9:a[0$^qIT,bQa$sKQ*UqJeITdJ4qh!#Kip_.(Wn!d*
4JqJb/`k+jKWgebCV#G[6LK_Gd3C?cA&!tboat=_R9PoEkLQ$[F4#9bJ'%l`^7RUG07[1A.\
B>B,T18bOmAaTJ$?K,B;L"q9L]Ag'ul)DD3$RT.JhDYEjJ(R`?p[H3%GQR3kWP1T7':o'os7#
fo,@2%'VQcAI;PqS&$0md[a24Wln`%PiH3Zs_iLrA$cd)><XRKPY6ILE47q-Fn!$1?R==ihZ
-%OMn/G3`2]A6[8VQ/-b2VVcS*YC-Oh9daIDo$3<d%SXg/_HK.:_h\GNSl7j`)=l>>E!6WM@n
P8)L<5(P!;t?2<*:H6!\:aVY]AYmEOD\60ZJ:!lmJNmh"[dQ2SHm=e?mE?mnI-1BQS,f8Rk#P
WY^Ch-'&^B:LaW27V$,'=Ft(_ZD]A9RTi<B!N+o[a=@GZf?@#SAI7sW\l%Xu(C%ClMiUm<bNQ
GWKS>7RY'lIMrQC%1\OXI*82Is?\id8MS&,9o?3qj7?MIqAF-pT"sIVQc?sG8D--,slO6B@P
1V[=&FbfA0TR@$^55=-a\nAu'@sG8-F)r-dj*=SOce8S>g?cg+_X5?=e+[SV<`>0dk'39c,<
s4,9_0.LNWW>%@g;US:#_lAo"krPV'2'!=RK8$RG(t<7oAt_ooVR>buhhsKZ36@HL`TR.XTA
Om&:WB\/Zr9aqRWt)4%4:<e(#59qCIj;)Uo/1t#C8jk,-Ck3B<nm(#Z3!,^"[%`rf2Jhs7@g
PfF&6k;AlW$HH/,E)>i)*7)9e)Lr.O^C?,3&MKQ:>j`OHl]A?LeuKAYKMolI1D5ihJad4h#-&
4O46Hf%Gd#q\U5`D"(7FJO,R]A&<]A%bm*VU@3heC?pInrc>^-+[8sEO@1gWopB"hLe+)Ut7GF
^\nO!a,6j+CS`I(?Y'50=[NXGZqSJ_j_2Q]A@A^3@62_B.HZ%WY*B`C142X$pJFZFfiGe7t=R
oL)FlC,FJ8ZJ*iOod1B8?k\D'?_qYo*Q[XKL2G=(.q\8I(4i&tK-/aTLm`)a!-Q*?h/c4!#A
`YBf<2+kIth_j4tk%Y##d2]A6i'%SNmd1p>5n!u4Q`b>->#>^]A>@sT7(G,V`-Ib$@O\+s(j24
*F,A4K:I['3IoY7G3*K1=_qkC`(f?4UO&_JIk2j+'Zp<E=S">S]A<9m=h>,C_8^f#RJrT1bUE
s"L<Ud"j)\1J?d=c"&-n5C#W^n@f#-j,(&?FqgKajC<>#_6/4ikD6m<.o$Ag#qU[O$(Ku0fC
uI,o5gW<GRqp]A&d)^3D"[P#NTV7'H;b:+GetgiU1(]AKgjZ]AfhDIH+XcROOC\J^(L=WlC7Tc\
=><Wk`7+.ipljl:6[mGq5La'h0!1$H[,Mfc*p_53Z(Ip>;F$C\<!7nUV>(3Bi&=f&&e4B:ao
-)<l5ZI#]A<:Zdh1F]A""5lY;D#-1\aXhS=od`IRpD9KiLX]A%7a`KUb`%ZO"a>;Y2UPZIp_!t@
=0nDT+KV94">4BH/O?39##mL#?g>V6bJ6j(`)C`$B*JgD.OBg#KOb"Z5^C<3A;DJ4f69#Zr7
COEc(@'_sT'GS3J\g:YDgGf28Q95$bM70j`h,1Kr')jY5R-6\<jCEc7\U?3(sIo4Y(=2OASJ
TU/K#6]A5siSN'ec!G!_>Hc-aG=ulP+@^aUTq4`[R$Re@:R&_=SDF:j+-]AgQt0FMhV/W,jl=a
^Oa-"9j&XjpuN#mP]Ak=O]ARU)$%#OXZmKeT-ErdH._0?ugSj60,9&"me9I<%.n_CA,N2!Na,H
W4i8Fd^7h&KdV+5Uac77op5QulaR!!9`h,D?=##^MQD+YRS-kr-uh1m!cI!Tb[3V3&u)!.n%
[LOZ$AJM0q'>H000<f0Fe@8E4n8sJnp6!N6G_7Rp&\,[s8c;*&\9*)Si8jVT<P\i*`2ihH>;
J]A?K6YHZ&90tGn',j]AL^oml@jnPdR!YDVX(GZge)Y-P?n\;!]AB[$O/bHg1D``gdj/s:`)2)>
pi`scDkrZL]AP,.lOU4Pjj7ZMT2V@#WCtY#^]A^9RF1pHl,K9D8\&W\e6%rhSR6cIQ<&VIrP\A
U6os9`Or?[$mNQ"GN)HCdbiR5i^8?Ta.s@@d6LZ&M=s?<V/PJVrp1.hgckBH`o`3$N6BX@CW
8)q9+^B9<e:Dk$je&&5bro>G56BDJ-FCV==#,$<]ACY`_iBe(NID(4VmFte-fqI12sQ4]ALT(\
bcQX]A'5laW(8bP2MPU9+UOmN5Wd$IScFQgn.b="R-$'['qUMG&Z&7JLo]Aq%giA?-`u1CD[gh
hD5a=TRVO&[G8qN"Z]AT;mSd(emZj6;^.I$rH4@"'Mre"hhR'Zrk*qR7b$SGaXP7f)PdZ&g&-
K?L90k<*;q5~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="951" height="498"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report4"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="951" height="498"/>
<ResolutionScalingAttr percent="1.2"/>
<tabFitAttr index="3" tabNameIndex="3">
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
<TemplateID TemplateID="e29bbf75-fddf-4a29-a597-55e4f7c5d490"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="3f8e3f01-8bc1-4b8d-8665-09cd218a0685"/>
</TemplateIdAttMark>
</Form>
