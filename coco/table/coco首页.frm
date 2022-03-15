<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="ds1" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="dur"/>
<O>
<![CDATA[2022-01-22]]></O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select * from coco_main_des1 where dur = '${dur}'
and 1=1  ${if(len(unit)==0,"and unit = 'all'","and unit='"+unit+"'")}
ORDER BY RQ,MD]]></Query>
</TableData>
<TableData name="ds2" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="dur"/>
<O>
<![CDATA[2022-01-10]]></O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select * from coco_main_des2 where dur = '${dur}'
and 1=1  ${if(len(unit)==0,"and unit = 'all'","and unit='"+unit+"'")}]]></Query>
</TableData>
<TableData name="widget_unit" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select department
from department_info]]></Query>
</TableData>
<TableData name="在售本月" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[盐市口店]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select count(*) as n
from
(
    select txm,pm
    from zl_kucun
    where drsj = (select max(drsj) from zl_kucun)
    and 1=1  ${if(len(unit)==0,"","and mdmc='"+unit+"'")}

    union

    select xbzm,xbzspmc
    from spls_to_xbz
    where trunc(jysj) >= (select trunc(max(jysj),'mm') from zl_spls)
    and 1=1  ${if(len(unit)==0,"","and md='"+unit+"'")}
) a]]></Query>
</TableData>
<TableData name="动销本月" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[盐市口店]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select count(distinct xbzm) as n
from spls_to_xbz
where trunc(jysj) >= (select trunc(max(jysj),'mm') from zl_spls)
and 1=1  ${if(len(unit)==0,"","and md='"+unit+"'")}]]></Query>
</TableData>
<TableData name="在售昨日" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select count(*) as n
from
(
    select txm,pm
    from zl_kucun
    where drsj = (select max(drsj) from zl_kucun)
    and 1=1  ${if(len(unit)==0,"","and mdmc='"+unit+"'")}

    union

    select xbzm,xbzspmc
    from spls_to_xbz
    where trunc(jysj) = (select trunc(max(jysj))-1 from zl_spls)
    and 1=1  ${if(len(unit)==0,"","and md='"+unit+"'")}
) a
]]></Query>
</TableData>
<TableData name="动销昨日" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[盐市口店]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select count(*) as n
from
(

    select distinct xbzm,xbzspmc
    from spls_to_xbz
    where trunc(jysj) = (select trunc(max(jysj))-1 from zl_spls)
    and 1=1  ${if(len(unit)==0,"","and md='"+unit+"'")}
) a
]]></Query>
</TableData>
<TableData name="dxl" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="dur"/>
<O>
<![CDATA[2022-01-10]]></O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select rq,count(*) n,
(count(*)/(sum(isn)+max(cnt)))*10 dxl

 from
 
 (
    select distinct rq,xbzm, xbzspmc,
           case when b.txm is null then 1 else 0 end as isn,
           b.cnt
    from spls_to_xbz a

    left join 
    (
            select distinct txm,
            count(distinct txm) over(partition by 1) cnt  
            from zl_kucun
            where drsj = (select max(drsj) from zl_kucun)
            and 1=1 ${if(len(unit)==0,"","and mdmc='"+unit+"'")}
    ) b on a.xbzm = b.txm

    where a.rq >= to_date('${dur}','YYYY-MM-DD')
    and 1=1 ${if(len(unit)==0,"","and md='"+unit+"'")}
)

group by rq
order by rq]]></Query>
</TableData>
<TableData name="ds3" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="dur"/>
<O>
<![CDATA[2022-01-10]]></O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="dim"/>
<O>
<![CDATA[jslr]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select * 
  from coco_main_des3
 where dur = '${dur}'
   and dim_type = '${dim}'
and 1=1 ${if(len(unit)==0,"and unit = 'all'","and unit='"+unit+"'")}]]></Query>
</TableData>
<TableData name="dim" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[显示值,,.,,实际值]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData>
<![CDATA[!@.["s5oTNl%b<+F)23JP^qk[Y3D[O$$gT,AI@OTWTLXd$#4NtEW~
]]></RowData>
</TableData>
<TableData name="ABC分析" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="dur"/>
<O>
<![CDATA[2021-12-29]]></O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select * from coco_main_desabc where dur = '${dur}'
and 1=1  ${if(len(unit)==0,"and unit = 'all'","and unit='"+unit+"'")}]]></Query>
</TableData>
<TableData name="kucun" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="dur"/>
<O>
<![CDATA[2022-01-10]]></O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select * from coco_main_deskucun where dur = '${dur}'
and 1=1  ${if(len(unit)==0,"and unit = 'all'","and unit='"+unit+"'")}
ORDER BY RQ]]></Query>
</TableData>
<TableData name="duration" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select distinct to_char(trunc(max(jysj))-6,'yyyy-mm-dd') as sjz,'近7日' as xsz
from zl_spls

union all

select to_char(trunc(max(jysj))-29,'yyyy-mm-dd') as rq,'近30日'
from zl_spls

union all

select to_char(trunc(max(jysj),'mm'),'yyyy-mm-dd') as rqby,'本月'
from zl_spls]]></Query>
</TableData>
</TableDataMap>
<ReportFitAttr fitStateInPC="2" fitFont="false"/>
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
<NorthAttr size="40"/>
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
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[*手动调用后台加工数据程序，时间大概5分钟，浏览器提示无响应请等待。]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="SimSun" style="0" size="72" foreground="-6737152"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="727" y="4" width="241" height="36"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var t=FR.remoteEvaluate("sql(\"oracle\",\"select pkg_coco_main.f_coco_main from dual\",1,1)");
if(t == "OK")
{
	alert('数据刷新成功!');
	}]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button0"/>
<LabelName name="时间段"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[手动刷新]]></Text>
</InnerWidget>
<BoundsAttr x="624" y="10" width="103" height="30"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.RadioGroup">
<Listener event="statechange">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[_g().parameterCommit()]]></Content>
</JavaScript>
</Listener>
<WidgetName name="dur"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<fontSize>
<![CDATA[13]]></fontSize>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="SJZ" viName="XSZ"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[duration]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[近7日]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="305" y="12" width="220" height="24"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labeldur"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[时间段：]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="80"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="237" y="7" width="68" height="24"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[门店：]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="80"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="7" y="7" width="50" height="24"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<Listener event="afterinit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var sql = 'call pkg_jskucun.p_jskucun_main()'
FR.remoteEvaluate('sql("oracle","'+sql+'",1,1)');]]></Content>
</JavaScript>
</Listener>
<Listener event="afteredit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[_g().parameterCommit()]]></Content>
</JavaScript>
</Listener>
<WidgetName name="unit"/>
<LabelName name="门店"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="DEPARTMENT" viName="DEPARTMENT"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[widget_unit]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="57" y="7" width="173" height="24"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="unit"/>
<Widget widgetName="button0"/>
<Widget widgetName="dur"/>
</MobileWidgetList>
<Display display="true"/>
<DelayDisplayContent delay="false"/>
<UseParamsTemplate use="false"/>
<Position position="0"/>
<Design_Width design_width="960"/>
<NameTagModified>
<TagModified tag="dur" modified="true"/>
<TagModified tag="textEditor0" modified="true"/>
<TagModified tag="unit" modified="true"/>
<TagModified tag="button0" modified="true"/>
</NameTagModified>
<WidgetNameTagMap>
<NameTag name="dur" tag="dur:"/>
<NameTag name="unit" tag="门店"/>
<NameTag name="button0" tag="时间段"/>
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
<border style="1" color="-6908266" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    库存成本\"]]></O>
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
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
<CellElementList>
<C c="0" r="0" cs="8" rs="14">
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
<Attr position="1" visible="true"/>
<FRFont name="微软雅黑" style="0" size="64" foreground="-8355712"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<VanChartCustomPlotAttr customStyle="stack_column_line"/>
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
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<NameJavaScriptGroup>
<NameJavaScript name="网络报表1">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters>
<Parameter>
<Attributes name="unit"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$unit]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="1000" height="700"/>
<ReportletName showPI="true">
<![CDATA[/coco/table/coco首页_库存下钻.cpt]]></ReportletName>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="0" stacked="true" percentStacked="false" stackID="堆积和坐标轴1"/>
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
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<Attr isCommon="true" markerType="RoundFilledMarker" radius="3.0" width="30.0" height="30.0"/>
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
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
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
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
</VanChartPlot>
</CustomPlotList>
</Plot>
<ChartDefinition>
<CustomDefinition>
<DefinitionMapList>
<DefinitionMap key="column">
<OneValueCDDefinition seriesName="MDMC" valueName="KUCUNDIM" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[kucun]]></Name>
</TableData>
<CategoryName value="RQ"/>
</OneValueCDDefinition>
</DefinitionMap>
<DefinitionMap key="line">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[kucun]]></Name>
</TableData>
<CategoryName value="RQ"/>
<ChartSummaryColumn name="KUCUNDIM" function="com.fr.data.util.function.SumFunction" customName="库存成本"/>
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
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[V#5LCdTQGPN-F18dq3/IQ+"1r;ebZf\8O/]AASJ,XAM-Mc@cWiL(bRM%QBeG7$]A80NTUED;La
Z;9VLg(ZM?r9tRNO&:+t>g]A=gI2eHTf^@q'TL"kBtRcc?6h(pU-O;*@D*H/XuHM>-hhcQBN\
FF^DCd/S31qrusA&PC@R#D\0Toc#;?4rqagkle1%t\Ao*6-5%V6+f9P1hEo*/^Y8^TFYX5<S
!(&8ad\p&[As&^TDmS^rr/iYjY1dW)sHkLEYP\+oAK,!#2+OU^pE"Ye5sQ^6?6Dn(c\SB^Q:
s5MTn4&X1J(B@f=>LeL_'BI-1ahY.Js/ioI64aZ2:G:WFF#`\cP`0E%@Nl`K>/)U+hD><D^+
H(FW"`@IPfnc>M@s0$-s69;bDI3.Rbc?^P[,QDZ[k><mqDpbk[AFiBJ^>+\Be5`[J7/ld+l#
;Sqr5t8(MfH?F584.#SQ%h7P!7A*]A(M\l]APo,?*a/G%$3A4Aj%.+JOp'JU"0Oqp['X@pNg>6
fP!H:Y&+B%8[\NH^/)U8tIb$K.@:SWtLmN08m4%t)+!0QM<SqH#anr4;`2M5sRnl3ehk/SPG
ae54<&7n7i+04)3.`).GaI"]A>gJ[@Ol*9b:ASndknCTcT3QVVXo#h>=m?7bHShSdD*Ju24Ft
l)2r3!M8@(OCA2CRjLOJb5BB=7Ndf#+h,oHU^H86e9?m!U(65$'m5O3`l%@rM:"o"d1EmtU:
caUpW^!2St'_S"W6*f2:lua<+6K6#9jF[Her:uQ@\bA$Z*3[;/.+5DRId`'KSVe!i,]AB,_c6
Kda',SQ04KQ'-pdoE\n,2?emO6u*^A6pM.u>2gQ$]Ar(<40K(A2CXLSUP3]AX5iTW&+R#*OH)c
Z;gsc@n)+4NkrN$cD^1i'h]A12K=RRKIE3rer=6F/-_f=R]An]A731M3A;dDr+i&U;'K''ur>A_
jV#'[h8PBrV*sc53`AX[AaW[bauQ+p+Ko>M@Eo9XtDU&j$'C`:u/UbZEe=?EB=rrq!jY3dEi
ot4JrWqXJs='K"dk*@,hVbf2U$k<'^AorVJVTkDhnqT2I!p89LiLn\iFB`tRR_s/POlfi.`.
DRed5FFho8'ADrhK2'FIhc6MA@1SpjL7Z1Yp5(]A9g7OJp7"iq/(CeSU3ZOtd+W(jD`/PN)8^
I<]AFP^54UU[O4,b==$b(0Z7l.[!"WZ(>)5+4.YaR^Y:o0*X!0'KVl/^1u\`Op&GEFoMYV/(M
NIqYnL09"+2%S.+S75%S"9']AMWrR5qoe50OG5KE]A$c&5X5;+rqKWBXpm<q@)E/GuKlo:=2id
6N_&$#(Hic"=jW@&>#'pNrA=XmekW$0M2VSsK#l\8@lXID*B8qTH/ec&OB!K'lB&fl-Ul`m_
6&`^]ArEO(ttWVNgG?At)"'rafo6ZH6H>%oL=W5O&"8fr<np\Z,CTU8CFeIkJc0O!<ZS5Q>hT
@J*DW'\m+5oLA'^S$5mKOTF3JIt)ks``.6>m,-BD8iHX@BdtKHf/s#I9\Vfjr:['&]A$&j-ic
"XoCd.SA`$,,HL;-UK?R@A[:\6I:aOXH20OD8(Q>A#Ns24$qlSST*4S/m_\Lnb:LWr3+8D[K
C.,S6@ZrTl)?7$@M6rbLKqr.>%;ERe^_#o9hEjLYq=;eQu<b7\HKW&0<=OgI&r.lLei8^)El
C8S[o'$[0j0SKsT(bO4Xg8[*`Pm9*jWU2'a1s?^^96:Nah5Beet*1+T3)q*7T.7INu)RfRjh
N"O-ocj!-NQ=C3!A`>!iZl-RuLYWd3S@e[9Dk3@WYrfX9`Yp)ROf(M7Q+2KhaRY[1$!O2/D`
ShGP%#lG-(Kg$sC4ZcHLk8,$"<\nk.NEr^I9&q!ScEZ"LG,r[&.>#rQ<O#;KJTTLL<N4pU#c
^'V_.e,*k:R,4@X?0c2)i.qh[[-fg:.A(dLl-e2"(!(oc;05T-7qSOK0)88ZF;/C(lHM+(?a
SOqMqW_NjsW3_:MF_2#mI<8#'fU]A1/Nk2jA/RoY&]Aq:>u`:$"KH/?<7t,U<d39rdOlp:5>'\
&Xe6Pe?aofso?imVC@f]AEcuI*O8cgG<<EpGD]A&Z5'-G<PkOI=3g=ZJY/aK;RX=e(=4tdD1Vh
eibZPm@g)oI0K3"62broB$@P.KZS/AfObfLoq:sk:Go-O("jc6iZMcFNRLEY.f13Sdoj05dm
.d+D&fK>U&qdXglgl00nDP0t]ABMrqD\jUBG-8fl!_rS#on,B;h+:-7o?h]A"?a=2hOH1XOdbn
E0'>ZVpFLh&L;ktpp_^ps8sD8+NHnMc1:D5u;3;1k4nYRMaU(0TC.#$9O[M?B/#ph]ALpKeHF
W;3:PmX[E)(h-hA*oN7M`R/,EES]At7'Z3WfOb;ht9:[C,\SQi:BF[(Ajb]A#n5="1>Td=3NMS
V#FZPVUPjWMFnnN%"h8R*fls^0XVSRE#Oq>-Z_U<@cndJki;6ZT+N$q8g@d3_!aRc8JM^oUJ
sJB=ho(^b]AXFG7)N>JQ=@1NJ\G]AXdJq`03=#`5=F2n+p^uCqS/V'pDDh$fX3\0ad</nQ2RlE
[H\nrBq.8e]A8)F1g'O]AKiA'>'#!SkRVe#38dd&]ABGTLfko01saAoiQg6HnM<r$bj^m:4B;4O
e#c.=)f!.[t@dq%pW/c*m`t\16`**[g2LqQ=XI]A*>t)InmCDG?s(P\=0&9V09akCZtfk1K&p
S^DbN,GFV^<GjqW7O/o4XkYE0\_-=#ZBq16FqbMn[Y!D:p=fW:<G<0,C<1]AS)*CB'.)k2go0
'"l0!eqXcSV#>_p!M7F!\fd4"OSF.ncQnhbGH+7-RIta1>g4PgJ/g\/Q`:F?73*fPm2*YHc,
@A_.=$Yr@h.\@_$5h6)O,NS7,_?QO7oe>BTd63n0FC9e!E<dqP^DhHZ$L5sNK0gDU[+k[A+#
XS?_>4M[Ni#3;S$/FB*;H\MJiqtdd%V:u;e>l=2e/&LU(SRah.\I?<n)G&1>[+.Eb\=pP7>]A
V5>N;MXq^Zb?s_0DAW*C.I,%@t4uf\al,T@H=MPB%B2=7D]Ae6&#His/uTHg=?c!kU8)'I!b9
gG-trs6WX92[WI#R+L0N9NGTd'.u#.6D7*KWG3Q[;@Uh%Ws,R.SZa;*$ZM#?Ij]AKQ`oF>o\L
,F<Z_,M4F$0D'YoEl%X$KW8sZDf%,9)6t;$pUrk\riN:5"4m__]A3:\me1.CU55kLMAE&]AnL5
=jqS=L^Oms7lc>#'EG,GZhM."'rrCcaQrFet/:a-^Sd/ns:Gom[_c_q&k`R>^?Vh'-Qg#Yk(
e@^RViqAE/1TLpTMGu*,2bu'!gj#fa6*"?B*3eY]AAMg;e7*1j\j)B;P79@MnfptgBS,,Ms(f
i*P*+.U;]AeDF_.T451Rs,AnI0/0H@du41^&.(b;:ZKk?14C1Q*Qm/N1bUjn0<I+s"=71"Yc?
'mL(&pFk$=1+IF1%NA&t+=Gp%.CJ/7.ZU9<^*[Pm9!8@]A(=n`h::Y(<5B=)143BjJR[Dh@E5
)$9ePpn3S4?@Go_,qF0bk1p1<0G!3$B8ZkM[oVYlCCZt-,'#a.j8)&5qnR`-&gY'?Ki@Bn)o
1Y2sbQ.JR3\Z,.DbZLBq'IP)P4Riu83*RO693\Ho",V4^7W1./2LofX%XrbWUpoI-pr?1Xi=
;,>M%[(Vnhgu^`X-K'<rJChQ^XNkj=^rA.D<7.k>(fT8QO>FFbrV&4p9FIob()FoMTR)#LgV
WN9M?Uhgb5Y.7=#kC-*I(K$e&no"_-0'TX\tBE*5OYa@<ViaWr7X(d%FK6kcPgWKtP(Rg#E9
RY]AY@$+6R-#mPo=dg*5R+-V-VC?8ET/ERGoO,XdCW[-O$h)EK5UMM.VI'Ha85T/M)WAK6]A1p
^\V"ZGTSs]AN\()&,S6&p+0E0n3:/"nO`P'2GP-?U&:,qS<M&-;)uQVNgu91&#2eC5"+Nc?hV
pk6.:,.]A%s1?L9r!kj=5#IHO=HN0jqZ2oNF7GFnu$tD>pB5GZt&%=0KuI$1^Xf1tn9-Y/*T8
62<0(T:?8V%TW@nJ,q'9s(?HkRYAJTO/L\7/HBoj,3=AmlThTOfpOA^h;M_pHO7PE=hLPBe3
R]AI3g0%2E]AjKG3\hhEP+*'Bn(0SE4koP"<(9"XCi6OcG*'U-Kl.S^"tcJl!dC`lWl%YZ]A[$K
(j3:@'HQ[.N[prY4:VeKrl)\I;6H\^(Ar/tb=8P>8N#;(>]A<D(4ci5N@0AL89d%Xbs,h*iR7
?(UPdl$c)#PS.Z"t"Bf'F*&co#Q[`--&CU]AiCe_8Sf`s6>O[nJ6Kq,A.R)<rC=2";o*fDDPc
t*eGUGcbZu`[+DU9A_NdO0gjI_:,8aW%C)LdN.6kN44dZ;Sl0SkW^<7=b,B!M/!`/QdEjT[o
dYVjuW8da__%A>&kD>IS$.6KZ=XSIA7"1R4[[Q(s?,XYn?2i*trtitGPsc;1!Y>aInA+u;_8
h`f?1R:=J0jTs:F4bZ@R(@Y9O3Gpeo_^u/1MQ\?h*j;Y9O=;B87tFTSZc7V2&tg^12i$hj-X
+Vi334<_\HKA2kHPp`"YCqD0qDcL1g6EjFc$U;5e2;W`:A2F&fa#setYe\_uoKk/?UHfnb;l
KaMKa.=qR7(1mO^c+Gr,te--#,V.X=8Sqr\g]A+$q]A6Y<E0JZDf)KlGdGku`;W<sa6rHY%=AD
QP:q@`]Ap+cYh@b]A2JWMR1cqa<IZH+VI?7[MmJ;c<<LX*\\cSPIt>T"YYE>FD7;LA[h'AiL/B
_d:^A3U:\D5sUbNM/UcV3$sV"l,a6UE[Y,5l@NeOC^ZoAnPP?j0LG>rW+An?888Zi@bW@\%A
JhYBY[O#Zp.DZgsM:1"V."C3iYJS241O1ck\=(:aeqdf*_p9iRgWfP'DdF-/:#\`_.!8Vgk:
8Jt9jAGULU5jga94)jqa.>=(Wr6nfZO"ImBG/,OrHFbF(I1e`g"ktIBpk*HH,V<nd`kB2?4Y
L3["<Pap<#>D8nMI8rFoF?l=A,-9.U)mlDalQ/g2T%s$@79g%8U&QWRt0<;Pg8l$RX'OdPqL
BC^q;*]A:@N72FKDKuQkF:2/L\4c#,OQX"?ttC=L`tl`'"qrkZ7'KT[ou.f,'t=l.Z>._HG,a
P^R+^4]A=QHbXQ`&+7(P``+7:Y^JG0>bl=.bg7[6VFLNMil2f?O@f)P<7l)_WGjtL+"V,2tVP
:>Z]A(?1X#X=g$G?#V%=WSfdI`K^CDkZU,jTfF`hJ.tKck6!aO.d0po]A67C4BXR6pIe;Q#qh!
pp;dM/s3LMb4bp!%eC2_d4ndZ0Zf['hqZN%tSYq\SZ9">h9q2!_r.;$:O/T;`V9W>#,DJB65
DfiTO&d5QnV-^0*O5eApR$k)N`8uu01U.oXR$?LKX!03'T_%u&DcZ6Xae!kA>rh]A8B.bbf4d
]ARp*$Ihf,7ObI4JbI8@P0m<&EJ)!ZanefF!U=*-n8aOkM_lNooZ)@KsUa.G,rij(@7E)O-+R
HgS&102_r"mJ29W&3=b[i*b_"TIUih_ClP%:R"R,nqBqg`5^@VZZGjZft.5`]A\b/08%'gBb6
r-3Od)8J:Y&Q@D\HAj2e[]A'c<7K$GX0F4)o'H*E7AP,aCKe"Dc'+;9aO?i6?OSF0tfa"*KIo
QGq6r`2+4DaW#5QB.M?CX7fW!t8+0t$@4A-'PZc9/eD=UhMKsQ4P<nN\=ZpI16jS2.WKrJte
bnH&VC0b*'qB)rF[MD<.CStQZ9_t)97'Yf$iB(Pec)5nlCN&R3_j#FFIVgU?W'jZ*5K/Y=sg
Qe%:OU.[pkF$3E\98UQ@fmingl;D=\p.]AJ7M$TW'O]AGCMp2F2D^USCuP#W*(:8)UoD8U>?QW
2Uaa60NYI:UW![?0:1fJ""Q(odGeVU:EM;>PK"mKbem2($'gT]AJE*Vh?)W.dW8<G3%copeM2
MaJZ_?/RjEA.X\k7ruL4Qb8]APF"06E<A@Y4fmDkmgt:N)%2un?gB3K!R$GN3s3M[MNPdEUMR
i/LqMDF#<p=JIn8]A/E[E[e8os4]AJFB&,(@o%./E%m;dbU`N"SnK-28KXlqK!_g6s%JPN&O5:
V6u751MK_aG#8o4mPJk`mCFP_P`[UKlfK1[S;5t_qh5d`*&^s&;X*e7qLMKO8KP8f?bDXXl%
6G!oSDoe;)>u(C<QK,+n$tX^K<2ErI&.mCrMMi=LYGnOg:IVU/I5b'me++m6JQ2Q9VKVg4k;
V1]AC(@"%.;SoZeN'Nj[2S[K+;.C&pqK48WN6aN\2'$'^)?8&8DacZ`6`qmYqZ1m,cQ9-r@iR
Q?a1.Ti"o#PZ$hBsqgShk-%P"g)9]AM4'Zhs,Itp#dDOFI%o`"$D1YHI[NI!T?T#6_&Wt6hBQ
hK#:GZ6-I\[5'so$c/"PLdEhk69epC?EX#Ap`$*G*,+.]A12pT]A+BFIKO+h]A`QSbMe@$5(F_M
Cj'$YQUHH!WHZ4(.F$#Bq&tk>%5SWX4oqHmk?2o8tcu=JuPA>7_%0']A*U-crM)*=)=_e/V<6
(!*LC?'^NW[E,<%RU:b(XP'Y#Wo2?dEF=FrPsg4P:LZ';tR@Sp)uh;A:=4dOR8b+7S9mj"Y3
hMLk63iri:+6K=V#u5`gj]AK!:Nu2?i>$j`:g"PhX*I`1YjWA:]A?G4p4OljW;*Z:WAC6V\X8I
EjtdqE*^2*qTB8U'd$]Al1%PR>LVgeSZZjId2s9QR`2<OL,*";%Tc0Cp5!RK-EqIdk#6iJL\7
qW68ug2]ASN8?58%m0RDPE7je_n"rAr1hiOn-N5fRucT).j;F(3++.r:?+\*I]A]A:dEpTbXom"
^e*;[AfsKr/l^Ve5igi,oEPQB>!Fl.I[[*W^R6QW[\Fgq%9*8ZQ-7-h>7]AI$)%_@1A@0F'd-
uXFb;64_@Sg^IM'VNe,;Og;Yo!'MfWZG3KHtf0tjBk0\dd\^UlG^FtK,P=Ia&Oiat)5]A]A>E@
MM6b4>Vb)Ca]A%CYa1<\U'YW`IR>a'E;BH5d^ZL]Adp(4sU:1/aKX+0)Qe,<Ou)AK[4\u*Z%Zb
Wo*h!+n2KKWPNm7++J["^&h1HXB?9o2Mj@SSo?)Y?P.1dp)_,n7Ff9/m_Lh@Zo$Zh!XUU+CQ
lQ@7s1N9HU;:BeX9aL[OQJF::i73<#hl1QNeq!%+cd=Vgu+FI_c&FVAu1H#K$jHmd=r+sJ&N
h;(9U(6^PDk>g?+Z/Y:/[dmtWIkNH`q:1)F/MVL_G!jAr?,gA^%Ck;\[*lor6]Agg)R#55@/M
(-&6b]AuVXq6=:7OBeZJ2cWX3X"gB@tU;gq\J2)V=.0"Po@666&87p2*JbZ>afZL+icef-D<E
FPA*#9RGUi7tDn&Q=jB+(t\XWFkB-9ZlOBVULo&0))Ri/6cUS<'nlFW^cgnPZbQRW"`tkW.'
JJu1MYRC8q,Ta3L<5A\gO8ijW,XC%P_8o,[bcOP1oT*1n_VMMp0j7[%Dq)V*Hp,\7cN*8=gT
Obfh^k(W3.T)EW_;Oca%;?Jt_"\NgjAND[iqE50e5p\4dQonqCLAD-3W=hhXOg:#ie#hV74Z
]AC8g=G_.3OC_8YYK209`'X0:Um0FF@GlH&N2V*U7c[!UMX(*_OPQEMAI=XZ<O!A.Y[l,lFS:
/UnmBLZe:*akA:'#k;YH0U'>3]AB`OqU5ZNI).*ONVlX<#Mqk.E/oNhj$\#^+3QI\]AUS3<fKC
FMs6LQ!l!gacY0?j$Jr),lC:ti,MQ0h>>\Y[_=M-)s'VKe9Q0P)"cJ\L`m$XK]A"!qb[H6]ASZ
h:=*?Jgi5N;%_]AR'qPnk$Vbo\6BC5"Cq1i.Okje/O"JUdqeS"Q"!).e;feL3Vt9Xo(0RO,el
6KA`3]AkE'"QUD9m%l$hoHl$9U>]AgVIn(K50[Bcrd.bFYGRRq$Z;N//k=pN@N0Pj\!_bAZ!",
MF^haC^E[fm_cL&=$Z!*CauWML>8HEoM_A-\iQaF:qJreB7L@h62%tB<C)k2o_)HDOP?t41G
jJcF#O&mWT6kCJdWM5o(qbK.B#!%M$KS]Al7>25L;Gjk!1/j+tFX=_)Y%^PpE-,JgpH*IED8,
S$KKU5sI84GP+:8q37E>?B,H3c3R'\nHUDbV7q4cq.66-L;('*K.O;OA3nAU/YSd1bY>^Z@]A
MtCD>^eU'sb'HO7::IA+-#;mga8cd'>atpa*Zp8UDme@%j">r`Dl9,Ke/n+%^:]A-)<(Ls2%!
d5uTh:!>-Y,a4^An.79_7*%hK'ZstK331'5FnC(Jg5Xe#P9MD&Oa3l@4lbbn$Mkk\;_*,W]A?
[%l?2]A>E_pT#4gG#5[28oX;7,b>b5#+;R6,!u*d:H&JC8E(1t_>Bjb!>@gL;kY=P6"C%V]AD]A
q**BLfthE!uQIuqIoAJh7q,;=5q\X<5=:!H=jV>%Ref0bV=euWQnHm!RH`Cuj=[\L]AA0dF?k
:sPaA,`eIHBpr)AE6DS&()iD"4H<#?a2DFD',8!JH+m"(_f/IiOOT>KPX6;7l6blndM'g0eO
HZ<qW\g3\>k10/F_,BA]Af?j,G7mqTML37.MS&8RSd_s,PDEs"l-P(O8dfg0(-fA8M7R4\V05
pTieGP>.nOHY1AIN"+ohOd6:3gMZTZ0lXS>uVZ!kj>-qk3(F_qoFJ$D>oB%Upp4"*4eJ//`V
!ohO^`t(-U5?R`C$!o/C5grRR@"0hY6p6'HE3Om?K)*]A_2(*1dH826,>[1KbEgdtX(A7<F!s
g9\oLMFK',qudVRhtSBoA_gJWGF5Pm?jKVMLI(;m/ad@?aS4n`mlFLW##36S\dk,,K'[/,!L
?_OQ]AXH;mc!tg-:J0X#n;WWomW67b4Y*ECs>VsPbA9'M_c^AdVqg%"uRVKe64\QZHme`f5hQ
4"mklLSV[TT!T$#mAcJ\1B&$0b]Ap?1:DUp9Ic]AlRJn16p,K8`8_GJBR<]AZV]A["%<4K1?^s58
9_3G3&k58g*9aTqs9JI>'?_%Wj-$>Utk-bFn!u`%p'g##ZM0//Hs8Qc=gP;f$QW@030-_Ak?
9AmH_r")V1(jo;J#sZA8#b)r]Ab1o]A"5jWJ).*&^/cD?'3g*h[lCOTAqTQmE?>mJ2bg<-/q2^
nmVlcZrdeJ?o8=POkV9tCS#1ZJTT#722K?-%Z;;"bQ@"T"UJuX?&Cs'dh=,C&@0?fs6=W6@#
:,HV7@48QrJ2bpMHuTp\>J#mNN+:L-Q&'WKL_Fgc%KUR^,=1[RG/&-EX(,JkZF\i^,`itib5
f!ZPWJSM5/"'$R*H*I=h9(,8S%\AJ;R%nC7fBeQut5ddfhu-h_@bC&r'V(4$cDlUpEsYiYB<
\Z`+TU)AHnI^++c?68%dNoQn,]A4dA#&+CFHlKU.\Q-8rmloE$go5O`J(Zg-!`N[+M=_O"_XL
D`c;,/CBr-9)pj=@(@j]Ambud>Bf3hG)G"U7[AZ*Q1&$<[?8Y=(@*R.$0A%P%iX<6[9.*$.h#
c>')%G4#\90)(mM&e%$;b+i#mWa*`E)b)`<-HN:(%A'KYTSfUJ;9Cb"Aa"mgFtWIuuqSo!i/
$UbNu:?:ndMH.s"q0?ci+=Pm0,p<[p_!j"9(lB&^q`^JU(\VOWO]APX-;_]A"rG2cciPb`&KIl
1h0<t:\$MRu<k<d]AFt_Tch$$5>o**CnWB%,e3WKdQKU(\K]A2'I9if'*R^>Lff:4c>K^o4+T-
$W#int9]AN?`hYK!g.#YM0FJN0Pl*4E"V3&G7DBkotDEs17#XCZWPGZVe]Ab:u?g@44`B6,&_6
)hP,HgK.U#/c[[jm1Os:&AZeFA7m_:/Mp3jp$^[(b=!.&EH>)o2Ue84+U;`D-lT!827,P:jC
7U'<Stj6tgg8WS5HYL;/eCHau5O?"K*mkc>G,%&'r3f_>O!!$YD;Fm;rW`.WIGeRgf=<^B@.
#lMeI$OPZ6bdY!3q/a@5.*N:n63ra&MApM`EdrRYmjJtK>aT=;]A@G6]A7+'74O5O%&/.651Bf
g^d-bog+Ss55[!UjXb]AZ$/-di6*YXR#"82df%jR<Y3MYIcRXE;Z38kjXds_\Xb.?!!";meX1
jI,9tnEab4Q/R_*po'DoT9B!oa5./;>*S/pRGEOZ6GnEDRA26pq4lrc+l_.O8nrhGi=dML$;
^4RMJfk"(-qRZIqmOaR3*21uq'*GM=1O@SbaZCGos@\RL]AD0T%ZofFEQFY7kG@pXTq=9qn0B
(u^A.q#kS,&30[HG<!R-FaK$NQOT`=iYjk;BQoY3Z_HP;<?5o#g0MCj%>(0YT$DY4`a/PmTe
XrJhuOM`fVO?4F!]A=jpOT/GPQ8V&9;7O!WB;VsRND'tNaQe/'<m(f]AZbjUAmBmpa7p9no!l?
3J&k(Z5ciZ^#$[I`>5c4H%U*gA7`%;tFtH_C^6cI><R't9Y&^I(RM]AtS>I8\XkuMY$'l>5na
3Y!&.rbI3W.hYEM<*iN%o;3_LV!?)G6O*4FAe05*LeE=3-YA7pfa'EeW$p$;5.;U]A_PgH^*\
:Rl`]AJ?E8?<+YFFRj6;E'7-@k<+VJVi*:S>:#c("<oZ8Js0aW+'c@baJAbS2PIe/ImCa&-37
cpf]AZmQU80`!2e]Au1cnUIk[pd.=QE+JCQl;O5Y:1M#1d;o*?HKiR7[3&j^gVONFtnAX&c1[g
J71I)H0:(BboT6<ep;ePg-lm<\?o#JqZmcWa@C)-X@9$)pUe'(THn:$l6[&[36BV,]AmV+?Yb
)$qVP:W1U\4>V.N1"eU5>`u\alWorlemt=*ra.Gl1?>AH.AC&H8&?F_sNCckb/A(ssn:GjZ2
S-cYd;JZm52:#FtZl#+n[$)`"3`'qj6R5V[]AJ)HUDG0bB%\[ogI"ZbW<Sk"t-.a<TP[t=G43
?oVi6tKBfeZFkf'X\WNS$mWg!8l>5*Wnl#(B9gSd0P8=rI?eLL"Dr.L%e@-ejnV)8pZp#HL$
j.kY1+dK\?_U]AQX*bjW/^3&cS;^XBOVY#&bV<cc#%e2JcSoYd0P6;\/S3lTnhfq8?U,/L1VD
^>[RA9FFtk(FL^JK$bXfQsrB67M0nJl+N%b(`QM[8-CTZQ0?tmOQD>DV4]A7p.aS*s#/%9@5\
AC0q/AO3KBsL<i_0$65kUW_lf+:,kSVDNr<d*6jf^2o;?sIbh*^hZI8sT(>fN%qT+"Q6X5D0
*hC5^9q^P'-;Eu)J,[bM_EG/>52)q=FmO`<0_=6L>jo=gV&>sf@jm7_UGRLL7gM;SPFPUZ``
L'n9Um%hS+&!S3lK9upqEd2f_eefD;0)?N9'Q'&??UC6"=+9mHL9.4OVKoZ;62XDWSW)g,7R
+,:6$N\g3W.B_i`>thqb]A!fP-_F$>,@-e`XqfXQoW?W7aF,A7+dshobBH(OaiT`g)f^j.N+q
RSjOZFiS%[dZpeQ(^gP#^*Qn%(9^cE4C:dMXq&Oq/=YSDan"hnUisT5Y:I_C\s352ITh.DoN
()^GPu[`#I7p;Pr+L-mRR)[]A@At'.8c!)`8aEs'i#L%pse*6=%BHBfrnX?ne6kK(M"'4AM,:
jY+41q$5DK[Nf&eFbQfQm<5JnI=+]An]Aep)"LhLZo<:C#&%C0iC1A;^,GlcbiZ^5TYC_"8kn.
_ji)Q!WZMYkjFUcn!-9.Z4cuB_\!g65(/We#D#U!UKZQGF(M'2U1P<H)W,"I-r_Sa?`$=TLO
ci(f&ZW8H[C$$1&Xg>*-l5#`YdS0dhW7-nuJjXm7-AW;6g^.YV5pYYXneF.,<7V"`LL8p'fl
SjD7JQV%C`8I6i!_'i"Q!n[#s(C<PBX%?;enHJoj9Dj%Gi)A+7*nZss+;!guMH<Hf)\1UdhE
gIg$9ouPoHCYTC/?C'AJ'malTOkS+B`#7i1@Z)-.KT18$MVX<J1?%)f@$8JH^Zi96i/.7f[T
\7>J[c4MPREVF?XcGhFZE^I/ZPE=\QKNEj/A'0Q[?!%P?8RT6#_-7=lg<=Nd4mZ?1=#E<sC;
+:#*+Rh(=SXbT4,]A^YPkks,ZL0WbZeq?SQ0a;"VDiLdV-.05d(@r@.U=hY&XJ>*eae]A,V9Y^
#mNX>K\8nla2=,dE:G]A>11-]Ad(?%G:f"CPc`98;W-lEG>hcphY,8XE7Q4X07gG7iR-L8E73,
oL-(HYfUZD&mSlD8_"W=mn`&Vr#tjRC\<6J7CG\o&=rco_`j9?B`H27`d:1i@B!2^_>LaPG9
&#h(7nq>gf!"jCU<W:'/Y*lbuqN'qS>5mr7;Ml*5$`7V<ft]AX@SRUbUO$C.?16%-st*TWKW-
SAdCbJABEHtfi&8T2ESM0A*Y;#\U7^egJklm**I5=Bp=cJDfmt'7]ATt9knq$D/,/@kDL(MWr
j\`SI`:C$j(sge?SD?hjk-]AMO*CZ<OrPhu.am1NeD;Bk,#]ACe\1cT%@%QSms(YA&o]A3<bm0.
Dl6DQ5MX)d>sVL[.C<3s\`%C.b)pdK)5\c[Xfgu*#6AIu[EC8VMp5U1kE[B3)I:GA-BonuN;
:lZY-Y\+d7(`4`%.>H?NfLGO*^ug=.lt^hS(poHn,5Onmg$,$u7j5`jktr1"IbLhqah"abHW
03<42K8"7j4)26G20flC@PdpUaC/Y:ZW)6;^rLh9KH"L?a,WNuV>cAGZ@r:CjROene201[,L
=:^\ZK0&)NBR:RSn#Et[UP;\ZfCs"NOX';u!#C+P;RQF#P?T$@(3#C\7VIR=tX=8Lp^Q]AH,B
?knfKN8Q;ZGS)UZ^Am4/X!Z>el8hpT[p4$8V1%3O<BI27*-=`1,1S8MW6d^L4aIQ"^>^R^tj
aeMP*&)rHg!Im*)!S?o7>DJChA#KCb\"5p,Dhfp(hSEKVEd4FHh^_gi:O[^DghnpF6H;J)K(
[m2e]Ah-t58^dm@d/i.<?*2?6VnB3,dju)F$h+IC9,GP#G-+7+EA71+18;/J\cEfeqim4A`,1
q/LSG*=df.u+8EGKd%qdHM]Ah'jVlX5.V`$La5?p*NO)]AS:r'Xs[?&GR'd?g(hT-jpV)d3gs*
YO(l_ia3L&!faBbA"Sfjlkn.66o4\5(&",Gp)tK?RGVi4*9tN%VJCW*D,KgRd6dOuHgnHAra
riD2$6ofl6OuXn\/2rQR6("YG![u^*1kMPE2iU4]ADb..AURomcm30o^Zmd@k_"87I/3oTh>'
O#[E76!A+(aaU(H3gOfJ(\*=<4!h-4nJ'"FR-`>RWZL*7r8>ZldA>ps4FK"!.*j:b:Sd7!-_
G!tbGh4R,q'Te_%s(Rr^LOmWp5*r8JK#RHm]A9Ba8\f7R@5g.!b0[@Ne_e*c.\b>JL-qC?N-H
92C\IgKm!ZbT^:b(P3DD7mo)='uC^+,+1XA>ZcXjhs5=Nr]AP.spsfG@h,(F%`-\)uU#NV0Z7
q;in%31S$mcpKCE]AMk>2ennd]Ac`8f9Ao3[j$ECSdjc(/pa)OTC5/9W,9D]ACOXSk3-=e*69ER
U[s=HO:O8`hi*a&G;*D\8,!NV\m)?oh=IPhE@j>e9D,.=;p_/X[S5?G=mg6P<V."IF1g:9Bb
YP]A(#o]A92i$g/]A03Agf)=ho;7$838U9!&5>>]A2,L2#gHZ;d1f;:gS&h<@8.hNB?0^'^F2#.E
^EAY-IunBtNfh''Q]A4-s"f%IoleC@@JcF[`kI4UR/njCkGp"HiOhIUZ.Lf.9o;>mm'#`ikqd
=G`$3)`WVo!nIhoRYg+G+r4Q*UFF<"W_'V#B*j&R&l5(7-3O7eoP:"Y_Rr[c*N1'f;[H5I>_
OF>lrpnYi>;]ArtcJlE7Tl/o6S3kjac/_:$//_D"#=0&$N976.F.<\bt@^l^F(<t@]AYs(Ed)4
n0/4d?kNR!KUQj[<2"^#mMG-C9b!-D2Ag\LNTN$"8j>m'ZVEA-TVFEREXV5Qp=k<09<)mXI8
>HR-OOHWZP5[YZob(M&<_;St,sjo^BGZk(RQSFA]AjGNl$,fr[eZ$TF^3W\-YW_e\U5RL]A_Eg
P@(p"g;<)E]AOQI>eNF<Qij@HUb0T+EB-XObf(7WcC:t`>DO(TPTkDi`o,F8#Yh).";,<sifG
S'jq%*rW35$Oa\L"3t0@-)@#L3!i\Rp2^)]AMKs37LG:&@"p'd'(6)I%O_JQ<3U7%\$62;m5g
YA'*1F*L_mo_KAdO]A0A@/nTr7F*J1i&8gQ9+YAV7@.@/+m*/qB<1VI2QY&.E?*UTru>hCGp*
;PXgfa+.kTiN_&,DnGoB<nJ+f5HP<S-!DI@TihN":`]AVmgQc4Zr;j3L[>8)K"Q]AJZm\V>+]A7
;h6qC=J2)@R;XX7?kC(0b"ielo7>,Ns:gfJ&s2M'6S#>J,ZJIbEO0Ia-_OJGU&&')=_g7B<c
/-E-B1Ye;"I]A=GQNbuX,Mhf6&/"Db+GX:?\4U_3WSYN\WIYk\QgO`Qg!/;Nr@H@UNc_LGX*K
Tg#A//$rl+S_m%>;b_bq?r+@#k]Af%HIPgXKlm5MfdJN/\ian/InCUNMXo))>g9Fd@qk_'Ark
WMSj_+Q_To$Qe,S%1=ic>0"KFhmI^BW-*pro9#"<&aCmY!gV"MtI<A.mG>M6oi-5`)[2g,nS
5\6Z"'LBKc:K&+ee.u#hOSGk<GX@s3&F66KFO7I:L6?bQsi>?X*V$;YJPWTJm6N6L8B:1d]A.
oZkC1p9p[+V"&3PK&^6Z7B$UjFEN'MM_GF<_&Wd:-;(XH[n/V7.!=Q&]Ah:FkP6Oj8gGpMP0!
Mm)$F^@+(0h3/s<h,C=pdg6I]AO<.;rSKJHDhFW.C'[[!=hdj:DljPr;-E[:PNVhrjg3XlHOq
;BT/G4&OPG\ug!_*$jmZrc'PgEL]AV7Aco^RM)`(rFr>]A\1o<[a;>[W`!6)+CH3do:;J)#";U
$Q7>OmoE*gql:)e2W+2<^cNuPFd3JloHa_k!"lFLJ4ErAV+T%;Kb^S\[UV*VZ-Qq%$"YF!B6
,qJ<o43fZqjs<FKq3ejs4rrd$m*f(_,dj&ZIZb2YbHC5/.!0Rem$IP/?-:(HQ>s@$UhV\O$5
E3DJtAofYH4ALK4`mdIF9Kch:iSoRhQNFXTVP%bkP#a#UR#&+H*nTVXB#5=pBs6h?hg?A6-,
U'J$Mp#s>l:5;bF,GH!m+WUM%j6B7`6>2D5i2=4#(bLLZ9)/_^N[)("#"[=qOj.6u(^_3OK>
HdF&0O$J]A8\:rNi>*\]A@rdJX.3p@'Qs0f"Garh#Y0^+#S!/PLt>U"Y`<hKD:D556mQ);?WnS
O)5U(2k*UEgC'DtKP"TlF?-d?lZ<0.$]ApIO2Oh%ruU:TIm%r%W,?hF$^E_f&1+>biTa-t^?E
(At2fX=mFh0grTi`Ir^J/GV?d14>&P^jc(\BZfmo=b)pQ9/)H]Asnk-6+:JNa5?QjOST'uj7+
R":AV"E0!%I=HrQU()*qd>BaE0Q,7G+6,-]AHfkt&;,bTY1Gjpq*`?-fIY.r09_]ALOUGe;HWn
51e>(&lns*dVOJhM<jo035aNcj</k]AbrQDSF*GDk*.EDL&e\1_Hp$YuRop7G7[A9H("`gj>,
PA9&D7H/mt0)BQ[6YaH;#USTdmWsX#%@IM_$;-UBLqW\V^UAbKZpdA+]AFj4Nf:Q[3+Tr7PrT
Fd;(l.O'90]A]A!((H/;@kZ3hupYTVGDV?ILi/;X9pD`T9Vss$Qm<Z"9(['brV(7[m1a*b7]A=K
tF*i/`[YS<i&;f>&,HJ+i4I0?O?_1VL5j?_67!j5d#erZat;M?Ha+_rqMfIFXTa3H]ALW2ZQh
2FGraYp*\g?Arf22J;K$`V;2l4+H8.IXlI)MAC\RO\<dHEbo(6Csiu)(8D3l"YU'SBWUj8JH
Sc`lD=?.!s$2,<*&:<BLS,o@F!B)`QitS`C$of%$$GRXS<&$BN&CIf-^CJ;siq"28#('t*,g
j)7>_tna_kD!8o;tC\,O,\a=*]Ac<E>Kn%d\nVu4F%K-8#-Y8pEnRgg?\Vo%DaSeQ=8<o`XG#
En[1A`aGbYSZ#QU'RJh7XlN,:;cmpDB6iaOEb#nXu@oXK%Wu/HAl+l3JW%mDp>4ui4UL8`26
el89?l>U"Wi?dP;]AcNmJMi4+IQq[XiRRCMDDID7hYV-lGEXpRW,QKDQSpVI]A=e,jroS)PSuU
<N)ToV..uSBXO$Qh*/+WcR;NI=p%ti80;C!8;P>=I1P#0J/1aNXE[W>H7mk5H!f)nb'Zr[u0
hcc(/PI0@Xi*#P&E_u@0_^OZ2V5BTDKZ'54>M_lXas^k<XgIfBSG-brb)I!m-KKH.f./B>m;
<YDPI7?"ZbrS<k/Hb:EVH6g1HFXMs*tDuHP]A]Af5kYjRP61Pm/4bTbmp^'cl'6\/3U/4Zl%C*
f3WW,V\Vti,o_blq/:'51Z585(/Q)ES.aOhgc?oRaC<5c@L.D2S>*Q.P"Y\sc&+oP_G9(<,-
@c)%So68$?GL$lGk^QD>]A]AS%9_t'Km%LB%]A(SR/h-!(^=bWGRr!u[:o3JTJT_p0An#3XAc_b
V<%jCU$i.)0q4[6P@KSf]AbF8"b/=n8iHl*6!&pfja>)<$c%NM&W9;P$[7'HLHcpp\)'pEn30
?nnBY?iVu'/;_aR@*p(lXkF(edCe0+OB*op[oL$f(Gfq(W/Yf%N:&UHf\V#POM-FNlVl87SP
q5\PlgH?L^;A"f^MW49Ie[56hb>SD@Bg>%LFZ=Zd,2'a`R,acfOb97J/=ticV.Jii3,.:VK)
^)7)"9;fq%SX8+]Aj2=]Arqpluf(L8kPc2&HqS9pXa/0$cgr*Nc:@JLf1OTDIZNpEt%#1<6[[1
>2\KYr:LJjh77#:P3n8,tG@c<A,X'6TD:<&=#]A-Q<XWg9.E3M6VFa!."D&1.n-5#KHPX.l.J
s#b#>cHO.k\f)#>lm$^AR7ARcPA9Q<.#D&na":=j,"Oq<lgh:6^.a8d#uq\1_Li/Ff=2V,X4
f-QU2T7ne^T(B#M.)kcUNIYa]A1o9@tI!$C)Wd/D^FgHl=NSK8^cXF1$oMY5\UC4,.^W^MJp/
'OL_Ia7d1epW'Snb,laO62Q6[Z/tKG*ChG>?aH-j-6]ARGm:Inp8SlMt)^S3CZCOAV0SB[PXf
6pO)X.$@3g_`P]A9_+"<ZDX`=gETQ"@]AGJC`R7"F/Mc[Q9MS]AlGfKBk@C_=VnK-H!VHX[Rl*b
,LI%]A#\rK12/*aC$p:fTDja&R.'663ge"gcT/3%rX_#S\ZtfnE),GbjW.Q=0oAZlm;95u-on
uf*25^E^88dL%["D=dGbs5`?e@V[^"!dK]A_(l;8J9]A^88XJd&>S8I%FT/=#,La(bl[2`BC)c
`B0gsX2t9H60,-*QM-dl<c?=nCjO3R\4iG9botuOZ[N2(;?*g+Lbn]A=Qbl2-arZahMAB'Jqf
[S*(Q*gfeJ;#Vfs_LM`4l%OTZu;NY?9Va[rqmm#'H:f,ktm^M<St+W2H]Ad+ZnE3D7SSB"*p!
a/F_icZ%W#r)9j6\?fd(`^hC`%DgT;;`4Lr^TI%5>J`dP]ABhY7_cPs"bT"Xi3rRUC"VlMItA
VKG.*+q4jAMp5iXe:9^l]Aj':1Cogr\&;Q^ep^@2XR`AA`K0B7OBf@c!phd^/N6u`BYO9d`UP
Ba/df`)e<($^\a`5pC$S?<f<!AuIMVbhLcbKM9)hi7dW1DIp95Q:W"g_m'ZD-drYieKH(Z+!
V&3Cg8[G@U]AGe.;D1.HVFrY\G.+V3->BARGGjS;d"k"G"'(.Mbme$m2s0(J=f/o#.]A]AcPt.d
K=qI&ecOrcSA6?m0o0W9_g&>rq.NGS9R^mc%2"AaZ3*-7YhJX3n7@gqu;NCu_\NR`"Ih'9=Y
'7[4;:'PZ7\JlB?,]A\9$6DDobq\jC[JY'YNKaa&G;'VgZ0Uh.lS-?`;TL7*8G?^q.REB8$k9
@G:JQBb<Jr$Z2?_3d%Lk$?6e3Fo;>?826HGT%s78WSMM9X/rKkJC50;oM(>:!-,:H('oRbVS
EH"qNJB]A;C+&2(3Qhf!Z&Vnm9^d4"*9-//`<6paU^if9NsgPTOC]AYm\adEa7mCImj/\fnXl;
[e3Rt=>IA'*hn=kqa!j`,"HIqdkq)l<'f#"I)ZCY1t_#"2>0SAoU1,V7*QNhi03uQO,&Q2N)
Qb[D,5X'1D<g&Stn/ZA_Fhp]A_qlYH!5ej'o2E7/i4-`>3VBm&t"9=BN`on6\ZXRj`'Ph/NHX
@n2!l4A:nG+$XB[H\QIDh!$-9j+8P\%-tQju[UUH):MP+YjS^JYgJ[$N$#i74R>;$n:Yi;qp
j.s>UghjNlV"X2Sg^g'2F%aeO^`=Kck->#Op2_GCW?ZH:G2/"eZnf6bSS`bZq#gG2AQ;^<c[
HtGejYgi$SjYmH+ppk=BFeL;_mhO?7L0B9ANn!"o"Zkls^1^Ytj=p]A$DK#G+9fr_h#[9??15
m0.F_+MQd5T$6S(`1)ZG1G@Mk=s%B%c2i!Ar,]A=h'2^q+g_tLp@UPr;U8b!F(t7AgLFP[iMq
)A48SOc9X&\:="F$rU:5R@kP?eVm48gqhX%V]A&7p^JZ%\?1-s#tEDJXW?;R[Ce+ka2Rn#khJ
/5D86jCC_=0_[%(BbkJ9pnHZuWZ&Csp#D`p_rTIR!4du)mF$W^MP%2_8mP6-u[^^cMYLVmT@
ut^H="En&6VlY#'NnFSOaGRgp1@3G4g_0\ZIaBVp)XU`kTGd4gf7'+BRk_fj?_nj/!G+O2#*
>*.ZGCD39>TeJMUn[acr(Jru$]A9^FJKIYCs't/O1c&[m[.L8I1=$_8__FG_H0R.'oV6<9glC
k@_\j([F3e`n(@!:'[bMe7t<V:%gE2^_#]Aj1V'?591%$*C-,/SpqS98rK?P@B*t.b*(,i0HN
+Ua?1pSilBe,9R]Ap=^-U."RL_3'r93n84=gE3cE'+(3AaVM%MV+A%akeU4Qa^"kftX^E5TQV
aHY0L)X:`9)0$j)AKIuV^M0*2K,Wq#f\YY')CfjuP^734nV'2WI-f-pr&.7%C7s'<-#4*f[$
*NXoUsH.H8Ba1qB(Sub0WJkga7.dr+DoJ3CLR]A]AV#/p]AY9Y5h$[(e0<6gr*`go1OYAOLNPBR
ukPbIm'J@\Yu`%&Ilhq"E#lG3O/Y*oIVSC'4#,8.:a0C5QNWQoko2mSMQesHep*q<SJ+sW$"
lt^m1N;"QkOth[^/J!`erPj?=TM24I1.GWCIH0XqgCZXARAPbT^I`05h*L^B=8m@573/g19E
SM,okU!bj"1H>2=M^uX>(t"4VWcYS69OioBB3kb:i\:bXtqI'k2Ok^"2hAq71j3]A?Ld2=f)D
ol;Z#=2u+$RA^-p8Vdt5GqnD=[%tY'sOKGF@7+WE=&!J*&^;tBcmaAo_0WCP%5$Q[;Il,SQ:
0I+EV&]A(`7[/*1MLA<Z>S-N!3!8cIY<G,e]A$_MM9soaMVFq#Zkff?BY6HVVe`Rp6]A*%s[C8?
Hr\NA=3Jj4e9*n']A:_?'CO@)G-K3;5Pc-GggU+?;$C"[[6V9am]AW,<lcU,?/ocYPHDo=q'pc
&<:)l00]Af-e:(,g@r?G^BII8Kqsel+IY]A#o.^\?B.OYY7+mZ6/"fNp*!)iNjY/K@_?@#0?9Y
;iiD]A)JpB?tBmW&MQr7bA]A']Ad>e5iPIH]AkMC,?MFf-?a>fG`q,!Psr"PY5X$mWGmZ`T'Hdb[
[nOnW$+Ukht5O?OX.*Zk"P.>`RbeR&V,j`7r>-ZR<>Vn?=Ppgm6!qT9s-Dq@R?T%Rt&hQ.,"
VW?NmZC'!C^M#I6ai*^k1q;R0q4E;C-J`'CT2#mJ'M*Jgp7JFa#lAWA03\_fs;(>JF#g.<P;
cYZ*:`6qo0W(.pVUO]A*?9IdO_-Onsg'M9i/V/\OUR>7+:Q0jNtGd?02dr@`78X:)R.1=\`E8
5Hit_?t0(8ATQFR^uu!K;D&TMBr-kY/h/Sim8h*$YXDlg#)08n=\o%^*+Z]A(k^ngJJ\;B$>c
I46^/$&qMNeZS<5'DEQWuS#hN9"AIE;rn)VD:EOlY+c"hWU0+gC?FA0ph7D65rUI-)GH/Tc.
o."+.&R1/U<Pd85\D-sV;80\,Fagu*ue465PB@Cn+Cb<Ms:3bjM'20:f<%ul.!GHcRX7^IaM
EMiF*p.eOXh,=Z&f&P&K-6R+7O[>36j%81V.+m%3,K<f&*aD6bj2J,1eT5-T6qA7^F`_tr%D
ca5Hc5&,Be33r4r,&"rL8f/UEuS/STYD*4SoHQCdkL)DRkI]A^ukZ]Ai0\U%7f8Hnq3pmRi>M&
7c";YGV/J$g#umK,I#eJ\7GPo)f']A**+\313FZHoG'2uP^NEJZURC^jBumj`V<RH#CD/)qp@
*jL4J1MUQ0)N,N$$\sq8^cZO#(djX8T5UA:K4tld'.#S2[H]AmMnW8XDAE)?<lGD4Q#%-VRCg
h#Ps]ABma5@hhPq![]A0(C)%=sF1/+84!a,"!5s*Vu(#-f!BX)E&5LSZ!HqL\bFY-!c]ADn2YAR
rt^?p1Lfs*TRNcMkL(9'4dE.^@eJh,BNRG5)#,-h<s:bq*Dc`2X:'Sai"Pt6;TmNTA/#eN#$
e^=%VEb`.@%Jo_hFZo+3G.!1RcZQ#!EM90qfZ29Zl!FOhd5;;H_;]A89VO^)+e2KP,2gpc^dr
6iLkS\U,BWc0tp=T"k$:]ArC,I)D'rO*_*B`&mJ/j)"W]A9KBcl=)o'LM]AM.GJ41^`Ue9?MX[p
H1i<JAuYhY<i10A7GR]AhP+Lp<;l+NG,Lk670anMa\GfK6/N;MWVOtOZfi@XOL`qU?0#]A,k@M
`DRnH-P+l-,N@QoT\E23:R6n$e`r(#hat5WTl@ObfDGq26I`HOcM5JiR`YbuD9RD2)54(5`q
V`Aa/_k7eV:jHN@9gL@/NlC[.B&+"?)7\S;StYiST3G?hLCASA;S&O;JX/4W>7OVZUS1&5tg
9-"6A"*7&?I`mgc,;h.HL"`*?mXJ#,5?NT)Z0G;^>([/G4BRufMbP$V]A?9&^>@%>qK7d7+bR
]A^Q3d4kJR5',<[);F-X6+C.l8!aHq/D,7\]APA)4HgeBr2+4,bBF9Hr>4V`$*.3jEO>A@N(Db
V+%T9gp:'WF-T;i2U3@:^4`dJYCUQ0En11[&A[/>jc^Q$osu52aJE1qjBZl92aS6"&H(#8gL
`3b/pg`U$-I'IJSZNWZb60.NEmo:HQSn(RWY[EAQKasEOBo==0sZ:;+Sk0)P6ba2Quj'^F9-
Eu\FV6&@N.3Pgjj03i`G:m1MHMP]Am$Lu.90W%"<L5YBCRf#)h>]A2ZR`#g2poXPU21LVlm7"`
qGWb0YoFkJ\ZFd]AKRm#e!!\iU?BYH!H0_mE+,hS7JnFiJe*mlp*Gk>D',_HuM;ke8r%[]A.DY
lYe!"5P+I\WT3Bo'76n;qde5aTCg%`&Uc.F`o^H+A;7H9XBAop2`]AK;5X_ZedW<fujDX(l3%
7^o9LRYn>.U3TeT$tT9A\GeD1+]AfI+RGrbO9qEo1N8V6(-ardRkE[dt**TI+p-U7#QLqeIR^
=!]AEI`XKh6nXG;VV@_HnCop#GSH`5YRh&^,Ws-546Eh'c)*%<>fbD+,pkc61_?*b'(?/ImUN
/%7TA*BAE)!2O`pg@c0>@>0.FA7\j5k;]A/cf%Xt<Q=MU-5WOei.=c'(,8akl]Aj6oZ?"dt!Io
iR,[j\&kL4bW<a\im]A%"s*3pHom$$l>V8MT@_l9K\\LDq[l?OaN%L3WB[g]AhC$4]AFb-F_3Q/
X"pIjBrTpg@dQX]Apn;#Alsk%['X7S>f>hQ)5N]AAu@c;ae(,DOrotBjaRM6T@jMq4]Aee5O-7E
^58l@e#")G]Ap5DnS63fJ65GJs>aSX&,Jp`Hb8g[tB-3HO"p)A:)<=X`p[`A+NBGcQ\.DQa@\
+$7G26=G+rgIjtP-7HDhlJ,8_\c_?QF=M;FU(o4HX8GQLWdcH^*9%2E6.(c53c+ksahB_R#5
<kr_rrnV_6hW:/GL>+S-SV0r[3%n\4pZCYOV2/EM^a@d^HSHjdI\aLpYS"'$m1ZChJ<+3,sJ
Y]A%O/O%4tD'Lp3$@u:&8*>V5D!kUb(J_NVF>ep7XJ(Fk]AK\UCXT=3I9q#mWG>rZ)oUCN,+o>
nt/,d)gk]A$=eV%V1cQM[o(oQ?mgM53p&Ff`?"VCGU[/GdH[R*hj,%b=N1##jEGjRPS/1#\RU
*KHbOe;;3C_biqDH3',$7.Cisp1!S#GiEWt_h]ARVuiPC'gGkEgf7PrIK4gs(gdiURJd&n>k*
f<ft+/<@gLP#D44r8-G%d=t)Fa6,\X'8hCC).E*tX+Mm#:T+m7,U]AFnt"r%c9":t]AF(IA6uU
.G=s#^%92<#T4r5R?h5_,W>To#al.n`0r@hW3O7p,W"3hu:p82qrA_&Yj/,94BV[LI2h\e?Z
7nQd;\k&pkAfN**WSZE@[?+^Yt1dU-LePB+HDn=EA5]AQL-Ue)d]AUKF*>@V:Y(W#YP7GK5bNt
DqF[@EWU/>=gM":;c`f2qeMWXp;TQH<aQN3Vka%3W:?&#VGL-5Ie&faIGPuQjOWMn^X_]ANZ,
u4NaZWcd7L5gC4gHmoo#m+26b@Tr_rYc;M$K"CG:DB_#K1W5)hPV/V.prjh#GK6NQS9PgQI2
?#PK*dB((WJ_*pc656"5>SrI^&rC,MaIJFu?Y/P\+j\Wh[r,trJ_WPnoQD#u3K*p9<<d8?p<
Up<n0NT]AI>))-FW=O2p\$Cp-=_q4S?u7H%)]A^B=`heX$j^U&ZZ?)_ON/LsSll^qE4\,mAQIs
\&8(:SYNl&LgU_`[#<uMUhko([%.OG*CT3lcqe@oZh-F4enYuHGe]A>#ek32;&A+knP=.*UQ$
n=:N<n=59eZc=Zg^8EJlM4T_UJ"`,_51?'N_"kho@XbI5nuD\C>"59_c-[07YdME[)rpY\>*
B1s-9Hs;%ItX2P'f"u`(puDa*B,$1.I[NH-K!c._h<Q\,(ht#.*al,106BOcrR(+2rXR8+jG
&>kqfDpZ_)UbpZrD4kW$Vk:+9jXGSpXm&VM=U0-6MHq]A>hq?B<I,`&%DNejYBk<ARE[3c09W
L,BG:<W&<O5S4s19OY0=6D-k;/%Heh)B$S0XoJlbC!bAHZE!XrBgOcouA$Go'=lVdOd![7f/
^%gn0".Hf"H8"/F[Y[JoO/V'f$6NXUBcZdkS+]AHc:_qf\HbVg(8.O12[["8gAK2<NPGAo6d0
D!iq/Z&,0@U8mYuFp@ue\%\BMb;?a)J[ToRbd''M16H2uk%=CtJJsZZL-PQI'STn8n'8NEe#
<\?[(GUY%aF3@8L?8Tr!?CGZ^KcbJX:'Ullh)>kNV'*5gsFk_CYo]A\0)dFXWkZO?.m.qS>i`
5rjqalnsKuB'EaBPL=4)<'iamhgpUHbSVJW(:Y?>,X*D*H<ehdA:EJ?OUM%;5VesYg^7/%.K
!lLV2/f8cOg9puI?uZ,]AU4=lhgjC&RVf;M\L'`d`GR:&[ar5:GJi'$n"J,,m5NXo0'?1Rq+K
L[6fWYff9n^5l0X"1P5OK3O%ScJ^@_=K790(6BM$-iH$7]AQ_glpOTG:%Y(9"b4Q\l[n<HN=E
,V/+hQSXVBg\.52<5g>#Ms<`4pMe&qrA3i-ZsuJ_j7%rnV:<nE>pf_%4dsU)!6N-`b(lOO3X
rfTAlG8@.NddmS]A%>%paM?IA(A?fYFbYc,@S5ccmS.Z-ae+L_FtE0VKAa(lm_Z%<nGNY4W-]A
5@r:`V?7E,a?&hc`"7i55kIIdF;)`X1g*:_bGElm;#NE^qQTZ:kqY#"e:$:%cc6^AL<P6'<i
e$Lb?Os%eJ=oO@f8]A5X*)Oqc;r,JY0%B.#'f)b''q9jm-YL)j+$4WgKXMiR\pp[gC\+8ak,S
^k*/iM8^\Jsh:5N'N?JLV"MX4SQlgUXsk,S`eaID[dGrhe]Af8aDr%B_Q%1sLpmW,6&B?rs)K
blc89ZRN\J@Zsd!1'4jKK2Ou^?L6Lb1Nrg;r;6>2HfBFGSYH^0$ArmCVAN+O?$,&\(:5F@=B
319R#-GriJ2@8k)#_=`fQ`]AopMh;SUS+4_Zsd9Wi?JUoA7c+7N\nt>MmHgl61A<>md)*L@$`
Fh]Al2AM81!LiPD=6(*C%6eD_]AT(HJS;RFX&/mt(AZn=lOlD.km37amR7,Vsb/(!P1!_/ks[=
NV*7jg_0%AJC9a_/8>m<Y*"udCp*UQ$`s5"]AZj^o.AA53ScCg(L00T[M(5FLSYt0GR06T1VD
V<Iq'A@N6^S4lIpHX2WH2i`1A0;X?pptUOsUG\s:'/hcT$c+!u$q-AB;?[e>.ED*<Q$gQ2Rm
:gD+p7;BJ;pFm!l:2Eng.(-A'Sp9j&#Jo/Gd1eN8ls(S_[N1'h.OS_H(EN#HN*d?(a*[F7c=
g\Ipe:hLYYCHcO@REWJMULlZh3$P3c1.t*m\*pVm)?&G)?*lYRV(Bd)=mA@SP11_^S/%csS3
0ZDQ6'0g&$g^/X^6BuB@()16Y.<6$Yr]AtI!+%=dt;-F'l#@,3g3^7t&@BJ>,XO6T#&`*4,h`
*$,A<XJ!H"5B[YThKS,MWt\n9$aX%LSc(7\N+oT7:)I>"n72's8":]A8KSEDB!ZFg0iM>@MpL
Wp"#&o3iR_D%@AcNU5IXkr+#9C7V"*RN@HAqjKBF>:bh'Je^1tI,rgR4!pT3T?_=KD82)['.
A?.kZ%VZeUK$8DSF8R/L9Z*l*)/.NS=$K]AUY2mgg^\TC$b'\l+('IGQ+p`>U3T$mPq5?$'LQ
hA^k:ULn5$%TbaULpK35hJRH=V59Frj`ZXWZ)$aH8d]AiE]A:3_/m7^U=cm93h8*'IH/G_2F">
\%<3Ed?FG@Me4aJr)&ZD61bgf9[pP^PDM,r2#omHpn0\a4"M1YIGn>t!*`hk]AFNWR/I'2>el
1i+"-gc@,ob08um>Wj"eFnLn?!3AKAt;pdV0_N8G`(a$lQ/12J,t*j5bf-L8/B'n,i[GS3t\
8]ALA1^co+/`PSjo!t<,sGg4)Qn3b.D()pFqq<cgF0NpYWbJ!1Z^(P\51%!l$sWip^4<fB[Ws
!Z@qZkhMqleMAo0?pIjMd4JHObF:T+GmkVF??`0:Cm69Im=>-('K/g)4qi0qB!8JT8o.hK?4
T#HchJf?#5,9#@/>\Sb;2Wo\%rH:S4OoloLZVf!*rRq'nW'h2G,P$'[_6n(.Fq%P*>]A8rHno
ud&c4l4E`k),E.(K$k0s(]Ak.TsTLA;iomWX_8`-MVfGhTkV#%7LBT"ODn)d`H\<5TJJ%#\\4
cYXA[ic*@,qSk.^;Bd?FUoJR_a!C]A`WC<TGZ5u*R$fH:q;J-F^M=Dq>bp%o*qCPl"O_Rc6'l
)si?b3^e`Sq0I1V#n)gMLZ!1blerIV^X2"j**"GO=V*I9QQD?aPUG\MBZj$sRg-tjCp2G;&`
@:FH_aWUWq]A7+]A\Xi5_nL^fe86=\o@;EnJ`lrmg!@!UV(b=P?k,;LWOmsfk'&<':KRD8p@9+
:qk-g#H>1`OQ]Ah*kTO1a*npCIj&eL/'f@&2>_eU8+).f*.1u25nab5uRe.83m!TCS(@PRG\D
@6;=B$q]Ata_`'99aRKt_(FIdqQ3:Zo-:nLFVHgiH.,4VCZDNe=&1>%BH32q"j@T\pZU)sHLa
P)Uh,n6/a_+'lbW]A[9l2'")G99EIqWmqCUgW5^f9?VlC$c%A;/U/S<3DLOs<*K]A'6k9M26mc
B/AN<9h^K*=Er=QUO?Ug'OE)MG=-a`0,L$Ud\jC!F.?4!Erf,>Vd4_]ATN&U1QC+Z`a.6RO.2
Z]A[+Rrckb"?o^`BTgtL-+KW@rkWpH7eWF^AW0!O):3/MG"4RH+d!EG?d8C)p><Q1[dQi?c!f
BL4HSlmdoUR1oXs-`!#;6+qM<7Q:s.\(RCbH>Ei8u2%$m"QL!6At0?F1r3jXIkK$5P*_@_It
V::i49=C]ASh7@;@2q&3X,pT[rXT*;S>?ja-mo\=-`7%1#f)oZ2OOa'qu0$60S"g\5\")W6g0
5/Om_uYkodcA[]Ai!BgH>Su?YG\;>36pW`)-j_lkDFF_jBGRTp;+q,[GI.hh%qogX3J!rakiN
u[%%[HdplT#fk++bR^QTm@b7Rbe[KAL?2G)n+gS,Z;"rKXZ<1b2<[X18..V2sCickK?6V^"%
CE5/3lmNQJQU*fcX@0G0bC76<5J2>8h13$FSRSr`WhRIrjaIdg7FK"ap`29tkI>K2oI4'/dS
d!*Cp\rH6#$:a=s/F_o821nV>R\9]A\@HD51&Kj/nb"bF/I1)#[RP##Mt4EC)9]ApdP:h)[eHN
/[aPti!2BnJ,GD`mL`dF/g3W+O[k7rjh+l+j_L=_8SDaMP/S%&RqV=UEG,%CFTrs+,VW;iN=
/hVS8OIBi(S$S[a@uLD4FJ1A(rUsT=h>C<WIM7g$1\5h+4/n7>K?2Rf)9jg^A~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="631" y="36" width="339" height="253"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    库存成本"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-6908266"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="339" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    库存成本"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-6908266"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="0" borderStyle="0"/>
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
<BoundsAttr x="631" y="298" width="342" height="289"/>
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
<border style="1" color="-4144960" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    ABC分析\"]]></O>
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
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
<HC F="0" T="0"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1409700,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3924300,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[一级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[销售额占比]]></O>
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
<![CDATA[利润占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[数量占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[销售额ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[利润ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[数量ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="YJFL"/>
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
<Attributes name="dur"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$dur]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$unit]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="yjfl"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="op"/>
<O>
<![CDATA[write]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="1000" height="700"/>
<ReportletName showPI="true">
<![CDATA[/coco/table/coco首页_abc下钻.cpt]]></ReportletName>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="YSJE_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="YSJE_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="JSLR_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="JSLR_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="SL_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="SL_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="YSJE_LV1_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="JSLR_LV1_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="ABC分析" columnName="SL_LV1_SORT"/>
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
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-2823681"/>
<Border>
<Top style="1" color="-1"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-1"/>
<Right style="1" color="-1"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-1"/>
<Right style="1" color="-1"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0#]]></Format>
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-1"/>
<Right style="1" color="-1"/>
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
<Left style="1" color="-1"/>
<Right style="1" color="-1"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-855310"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-1"/>
<Right style="1" color="-1"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<a1^;chPZdi#QqUNCeol\3PVCRnK\[=T!EjIL;?Fss5Q:0#)?XOW+L6)$WcXf\@4Mi`s"@K
Yb?ePaO<`#:?76;gN4<J4:9M$V3X";3FS&e;IB>g@U.Ct6!PV_`f#r8rDKrPReY3G7fgp0,5
Eeo.\(q;AY\.jmPBrR#WF`_CpDjZfpi2t!"aj2O7#H?_d?QhXoIs#b2S]A!#H9o,lj<X;Ed-E
[j'E?OYF+*r+LHa^0!Vb+,:1agm%l^HO9Bd]Ah\1A(q^RXB59'hl_jJp<'`Ajns.m_E*\L[qX
I.p`cP\m4it4n,N5B0*?eJRUl3lltmug;b'We'qFnXS/m>8OFk<;K27cT9j/\Wb<rm!B[s\.
@K7/Gl%38T`K7WFrQ8a8^urEt2fM3<q(^2ro7r`nk%q6=`(C6^M4\G"h!O^@&lN3)SgXYC0r
f?/<H$QN,R=sX96]A0#dTSZDP;@c[Iu5`/g7N/T%J^Hf'Qc%"rk-XfE@pM_^"g`QBfoM@cJZ1
[q)Q7pa4O]A'66jG6Wlf6rbTnjgY:Y@5]An%#>%p61d$F%,d:(Nr"7-kb*[p.VO)I92Fm&JVmK
ONDQ!m!^U\r5$A/J[DC?>&uR#sd=sA!\&^/$d_uW(;tfA"'r6e_(A^;"dlBUN1t@CKbiYf&5
"7)[6r7&d#6#Bh(E[I3$tSai^TNf+P1mH<3(Q0T$*=gO-(e]A/:b0bBd_9FbZ)S-S&l6&uJi2
0s&hd_Epap2UT,Z>giFGf#YEID)Ge%E/M.L5$"%.\h5k`_(Hn$c?>\g5c*sBHbd\sEeQX4Hg
L[M'!cCDejrt).*7M.L<L;es$Bc?62cX"g!EACDKt-NfdEDUeTm4`CapT@`MI;'jn@J\d$4%
2o['u99"$CP`Kem'hRtCQLS[M1fpP(:nA\h*SHS?HdWG5po(,qnV'V[\FjC)2I%I$F!H2hCh
Yh;71;%>F[8AH[!n5VV_-Ln$S&G2b[;D>%%$IA6_jt#mbfSp$b?TA1HCK"t1;'r9j0m38Nck
5Ads5FZ/ct%E'"pHe.4%hn6*,H01W\RjbUjmBDs@Z5>1dPO0+u>&^73Xd=-1C1Dja;MM.]A8.
B^+<P9'3Y%7/nIs&'PW+_WG^WnC>dI`B\GRJ]AYW?LpL,^>MA5(n&td;,Rs:9bWI``+Jh^FGu
V<PWPA"aj:8Pt:<ia;Ec+fhET.=2)6]A7)9\T`"q$>pCBA&_+[0P2LM?9@29n]Asnb+AdqVh^f
"`Q0#O:$I&kj9.e)I%^2kWhdAqJI=uE3j)PTWj-aL[b5F[$k;LoEKA^sB?i4+2QePH21mTlo
Bh`g.ZnZH3sj/G@Z.ZTAB%O=QiWB#^br[M(,iJdc-Y*@?B2kODfP!I[VR1DIMqP^fqI3&B_:
!f]AimGPs(M,72>j#1Kf7>5(9K7td/RbaaSA(`e<XaJA.8FT<XaIlr2&?JOacbZ<8P9R))7*>
Pj,oD]A@Olt!u77iccpkE2j2W^WMI_KG*Qe=,-KOkX9<=545rW.6cR[h*teS,DGE#>[chA<ZL
?IJlrAXf:(VVek/H:?6!Bg"6_`]A*`eKuDXeqS^[O?b=<VG=D-FYd^3u2*-Z)!r:X5:Lk(kHL
m8KO'I.P%]APP'42nKY5DNq:JA&VhBeNHeMOZVlYAIG57,ZMtZAG*8q16,Wq<\1N9/ioD-#k>
Am"c/`Y41[#38>]AN"FSXSCQ9]A2QQ2A5f$E'Rbq#`A>C%f3'+Q"7O@'99kOE'\A[kbef7Z@JR
rGiG#E*jKtErWs`]Alrac,L@Z)DMEu:(p46_=@aOhQ"N%OOrE4Gn5m#7-JoFikjK1;F6mFAk/
%KP,k%geo=22Kpn+Rg<hYXI_E))aM_#/uZIGXG.Rn.pu:rIl;H^kLG>7mfLU.28%QAk1Yq<U
`7l*S*j,f-pT$'_[r_C5G4i6t(^U=@CPP.<(LuB]AI`CpX!+L4uR4d\>GIr:p(![N\;/+gJ!'
2j%q:h@^V`J.N!<i0enH!kG[^B#JJ?Wn:O;!\\OiV4/R5+Ma:,ZEK3@+i$&3-TTRhc"W`HWa
Xjr&k[dG!rj%hO$_C+*#*E*@LtlIG-k=s`^*9SkNnFrlABD1thtn92hUgh2n=o,p/t;$GS3Z
nQfB/]AP7Rl+,anSA(`mZ[7!C;e`,oF'bDA(8Lkgl7JfMRk"^l:,r6WsJ0fnWF[:=8jJdbVkO
Y.22s/6FfNPhm(KIN?fK8RFuQ'gl1<,t-183D==LH@rLg2&m@[MB!#@LJGbor0AKR.9FH;b]A
S>g;CJRRg4LD3dQ+>]Al0ejm[qG8K?pRLB=D%ZUjae1h7Q6"oH>F/%Z'CiaD[LZm]Aj'VsC-Dm
O"mRX=i0^Pdl1Y#nia]AY_ea_6$q05p)>'_7,5&-92G+?#)p$',+2,1Pf@]A428oJBmUH^:>X"
sl'tKXOX<ST^3oCOAK79^l+So)W@Uj>1EY>W#BVC5e1?N4)*fC0USJi#DZ?b>ec%5JcA2d0@
5)l%,NNklhNZ[gUc(e1q1Ca#V(Rf2.-(VTN2Fi@Z+@?>ASFU54Nq/jMFPfe`]A;3Id^E.LQCu
Oq-2-TD+:WLrBj;AZ:Tn1*hqljpa2?cU'CQLn`e_-2Rh.H<#Xk<oB/Do39(,FcOO)D&1rs3[
f.-]AO_`[\ouE[qD8M08!Xl.i3Fg.J?S18XJX;?rPiBYV&!+;;sCQ.#+kC]A[qH^6qLO]AeoV[=
e]A6sPj7\.__a$="V&&]AVupMtZuEnMd_EQFu5lL!FD"#RdUX$gi@1?lQReBXfD7!,-Ba5,r'9
dEGP4bdMC6d?)Y3U`nD"U2dl!TsIDm%ei`q9O<^-dm^CBo#%U>bru@IADj6(42-9pZIO3Ohh
]AfVi<fW)VaQc\mOeXHQ#1FGie89rJVYC$XKP%%PcN3<pH_a>"t$6DIIUuRBm>A7I1I8m=Fsc
Qb#O:jkf7MBOZl22Ms*K)-85Cp!JSZl5E4oX";jT%!T$ARhG+!$F"UrW$do>]A\+n@<Vf+tn'
a,@/>@Uoh$!sT7eP?__#Z:^%DM#:!:#bO%LCS3Jqa3i,<YFo%aq:l-^#$G^up`R>g\I7MFl/
R5po5LA\&lf_<=,:acS9JLt^\B=!e-=!+_?8U.Efb8';d,U[IkgD[g::FRBuFSb7f&om_Mfj
=:$K'A$ha9:sD2Ba3&<HW5.AG`CG0S!B7Z.nK&-<?\]A4LJ1LO*1:$A0T*)6]An">arfM@.,ST
BgmHj9)?T)#t&f]A."D%.Co-aj+-LCfct?(s]Am;;^l3Q)#4`NH$]Aib\LL-`n8Lu&3+e+7q[WT
9nE<$4QGTE0?o;M5EaFM*dA@&Vpe]A.n.7u<'.>53^9SEnS3_L#QXKbg8h$Ia5LadW8u(^=]Ar
o[M6:%QC71@\n8-Ip=Tk>,9-2("(<k)ejrq3]A3po6N73L$!7.(iX1p>:b]Ac\O14Mau?'jVG#
4*%XkGZF_WD,7`>#Z,?#G*bEpObU^mDV,i&Y#'3dKV3cN_PV+q\jEl>X_0jKeD!K.MDuoaAj
.;HS'P*7Dep2SC?&c]A4E,NJ(k2u9ak>SV4SY%5CT'f%,he9,aFmei=k'h(d"nL^ul`<2,nW]A
!O!Ih3XMNModmHuMDhe9!u%aD'qJeuh`D3"(kS@)!:jlL$9;4$!sSE1Kl",@tTMJ?]A!EfW,\
RDU',>-"#"?=YqB;0!sH-Z87Mi;QkU.!fS20D(fji9$qi51>7q'Jp-FO3mgd?)c1h<L3V624
6_1*]A8AW*Vsn/jEJ'%K?8'<&kmJ#neB0NNflR@fbZ35I:;an[E($i/SkV;[H4ionl!;-_=]A!
*f:E=Mnr>YNZ6XOA]AliVm<Z_ZcFl`G%%UZt%(JhH-B-TPpW4SU)\/QLCA+lL8&!.j8iZBciQ
<LX^Eq"g"("UHbQYg(D7=<d6<)Zc[4HRdj(Ke[a0$SZYMWPMZD_gNK,WaP">Q&9_7;:Ic`Z&
'0dt+VTOI$Md]AN.Z)fE.8H3p?NPaR66j]Ajpc>j%5RE-[#*FC*qBXK-dr9AskhI$kuK8#/>57
JQk[Yeff&<hVo!nY%@iEKBm'<*)ga59Vt=`VNp%j8OFdo9Oo5ecdjeCj;]Ag/6&8NgD/0!78f
nQS*(W#5"oa5n>/+R3P4!W0T$Dk-2[+u$8LpJf.X]ARSPVYK5XQV;rkli^KrhUI':!W<N!EY#
!^T7t=$HY@uK:t\`FV"ZZNlb#UTl51lc!DI&5;g)tqtp8nP!Mm:_a'TH4sHlJ%)C%'fJ^VcD
O\j>j3o]AL(DXf7"pmXS7&X)sP[8D2Q6l+f'gCs@=7Iub^1K'Wjp;Sd'd`;T@2>KeB[OT:UD2
"e7;Cu6,kNC3>+QMqKSM/gG&&4=hrS%h0TW<h<tn4$g-#*RPB;i$s"JZuqO/JZ&W^^+.7un!
Ur021;!R9N<^@NP$5[&q.V9"!Pu.V8jhni8!iHMG4qM/m6jeQ;T;2Aj-VuR7dTb$;]A`o12p\
Th'Re?M.IMcbb=<Q;^0ILIC`t87f@OqRF-(=g'Dr3:iANA6JYP7cI9(X^Z,RAS(N3ug8"`#>
WXL`KYC"-+PG*8DVcg"J`qE!;nbcqfQ,.u2[JcAM"SZfK20g`MljLEgX42L1::@aDErM9"5E
oepFf/kZ+c[b?`N$CRaK*_aW#obNIf_[ZAC^<@_punq&*O]AB%"lY5pl6a62Q@l*,25SM@SGS
]AlMcXRmn$jf9r<#4Ac(6o,Ci>9/F3Oh\pOV0>cpAEhaKWr4.\L2J`.H?gY/)6T!'qY@nlQh2
rY<=I5,BVdC9=dG[5WATa8sFFXUH]A@8C8c%mtUoo_6^"e,-7UV#fu[g_Xa!#*1To+.b%ie!6
Z>/;mBMP:57Kt1:KAG@-P"X\A6&&?he"Y-.+X\$!T#5i7.F(hQV`"d<_aFNe[7H'IAk,d=*e
D9!IA]A'IARBaeE=VG/;b(*LkQ1DCrXfrAZ+-<3>-dbRX*3cZQ&8."P7J9&UoB^Y1+\ZY1!V-
(Ota5GBF(:$1ordWP?9;OI,sjZ?\2nh."^]A:`'(Bd]A[Z=I^]A#9[r53r3Q'k*M@ASdl_./au.
dPg9D70'L@(C=36?XW7q\-TLiS0N6Rf?b9r7&aY4_UYlh<+;7"nY)UMXMSeb0#I]A;$Ri2Rmi
m60P9O-0nIhFqLb$CeP-C<$qE:GKj@M<ok3+$c4f;;[5@!C(NC*V&beIkY9&mDKhA3AGS__s
/`NHYL:NS,N[:Y4EFgehsi?G!;JhjYqQEMJtN9^.8Q\:Ood_M"ME=f'@Lff<7aqk]A=lHFM2:
XShBG@Z;BX=3e:l#+k-jl0Y1,8ootV$rLR0I;U6VQW$/dCK91kK\Zd=^)8o>Qha]A(AA0#D>4
b_.@H?tG5"M*HHe)dR-Do[6dIC9MC@AJ9uh6^Uu+2c;g)1a@#rhAJ0W8CRN&q[Q77K8bQS^p
Y'ln*%ZSF'SMGb1rK!ASh$83gTC)X\FQ(HRo2ip>Y47lKI=Vh>cZpm)bkLgF]A5''k%n<IKN]A
3]A$n;/r#C,1%n;W4?qD3HCTmBd1a9H0Jl00X$m,Wg:=5OSo-7d>uI7$G#cupb24a&I-R2TV!
4R`Ld!n8g@2[MK0$-skd0.DfiZ4PP*Mh-7gYipe;\Z<-+H&TFrh,m1pJ4cgsTTj;1E/kk+o@
M0l!Fg-.9L!i=.XCn2K@[q#eW3+[t<XM4l[kC2#<,e9cQdXJg8jgO"P4^D/T4F--*G$R@&_a
W&<eWc"3YW6\>#>@n*!gm=t/UCC.81H,fF0O"SPRd3;gFHPLX+r&[5kkd+h)^XB"UApMkiCY
A>5uLunbkr5kb[t1bLX6B+BVuh>8/l5s=IP<<0iA1afC\I+W$a!nM9%m-eU>6-[2qR3R)%QB
PFuj_RYb>hp$V'#BjR]AJnkSpWd"5V^R(k5:-F7S@Im.KCH%P#:7)TgFp5qDg3/:BiLGW:1Z$
u1JAC*),gtGOHIhc3YO9Q)b:W,F8W3lCQOC7B>d.c2N0$Yhf_I%nT(S*i#'D^kocLB#WGHS=
;7WO?WiG7eG.b`X0[^5snJUVeR9B%+&Q!bQ!%u$7ci('f+BO=*S*<']AKO1eN&Al-tJn1<qdS
HG3g2!`IdGaNM@$'Ue&2h&rEXl"Ue^!\/k_i+.#EBmB:?I7=%37m]A;'h4UF\Rmm&gb'</-D3
OC+JM(_fR4O7W'n3-(sYC(>a`:Z\d@kGkW>`E`308+?)gZ&E^<%NmtrtY)lLHA1m&sF([TfI
Ae_Z0]A5\-n?Tdm"EkL)7M]A,(F@old[U&#5T^S[.[r31fWB%b-`68^<1j=YWg$?Y2a1//rX1G
omj(Q.RE8Jq-(8\qguirZ.t@Kel)rY/.KRDfMUW%KG#'N<'A)=@qIa@t>?KGI3B\94(X24@[
f>["L?<aUP;8,LYdDlCIA5[bV"a0\i:`uGhEaEa20(A.:a7c)E1DXog"7C58f<e?a;i\XlP[
kjiHp=)e[n7QR]A7$4Z1WSE#N%[]AhjbD;iGOk_URS<%j@NTu_rOQRX^6@t_$e:"@SRKB9l,!;
EPA/&VGhf^tC)NIi5S[rO(E!tL&WkAKh^H8#UWC#UHbqJV"p>6Kl`NGVW_%Fu7m*:BDS@T_R
Nb6aq@'!=(eTDQ%FlChFe).HL>;D^\Fg*O?&p."*-p&peZ\md]A6=;?#>Bg)(o*oCh\/C3V#h
[RL4BUS\,$#)."j7nA`Et!t5<TV.4QCR0@Y3]AkpV>q_CHQ?*XpLb5%=CaV,I!_o^i]A.H;#H!
-:cMdNh>,0)Ge+__"`,LdG%L7F]AOZQC$_??V`B`Q0)*:fj-7"22gVj+'qi83pROT7)>gOh9c
34AF;dOca/KjYpqL-phYZ*c>hL!F9.:Ppb7[CB9f]APoQ"Y!]A9hfN`5AbVX:8mm=_8YA2hkAG
BfB7,dJ'kZNDgdc,R5k!#+(/3]AA'f2?_4$V,:cIV@F0D=-\o\P9R(+&4;+;,AcoUF!+d(rk"
hS>(Z:EC-H?6TTR#T.rf1]AM1_#G?`Z0.,C"$8CXIgd5T=8j0-Iqso>XJ8M1l`O@lFAnd&X</
-3XIiu3UE.(&:Q?$:<r'>Ca'XNt0f#)=>-4C;Z;5tdf41:erZEKGh`3rhjP(4tT['8$fQ55]A
sB`bK0A;@2Or??(UWiUrgWim:-5QO=U:kMN9$RTF[bXoN[*X%dDV@[$W&ik,N(Ur@G*d>9T`
eQYZUtKC:JhsZErSI)`/`c/cEHRFj6iA<cUa7OD0BLeD0,!k8jp*4p3K8Skj^GtG+q2"6\Ac
!0=bN(.Dq;[I`+HFIGY43[WiRsmndgSMeYBr!(S$u'EUNtPXGc@On&E&^U'A=$Jd;0IbsFmT
F25D?]A7`9S.&H4/b[Z]ADW,(esiQn2f_\eYM/c*<0iQ%G$l\^oKr#C/*_uAYF>L[l!fU^HN2b
lT#;#V\ri?KjRgB=\E%i!$,l(b'37?BbRF^ul;HR#K/mVEt%Fij5!X=<D*/2?DFD3<BgfUj(
%_9ki2re-NljWDTo4H`o5`dOuB58lNI]A0jIA-4891\ZMKnJ#poX^-OM5Yeq]AJ$Q"i^,P7VUI
(JTLAdUu2MYj2k+t(i!,k\8:r+sM7&a[Tkp6C,O=*rqsHb^WcRW&qcd.pc#M2L/S$s,iIPHl
m+/57aXN(-g03tcA2bDF!>81dV-YR*G5OT=4"pVP8D*cP5^UDCo`3/_]Aa,8<D+8icXldJ'M[
Lb%X:3%p+)4dGW:#SUjLi\W$`F.^PN\)S=;9e-Hf_@_0_,>"nEYD=<'Fa^m9/>@X3=Xqk"R_
!(]A33YCEBZ6EcmbJE5`_XO4XAI]AnpV7M'JKqQ![@<82@MgcY\G\Q1E>6\6Qe',q$Ji`H7gQS
6O<"p!6:SP>d2-6Q384rpEb0lkdK:(f'*[\+-fHKPF/Ss)qbU.Kmt/S?Q#8\V^6+1t;`a!/&
4T'RFrZH/)`k8\V>lA4"e#RU^M(A06\k7K\Gi/a542t3FeGIB<N>;o^AAVT)kmTP6_e5>'EZ
3=+[X4;K)"Q\)Xp'1,$:PUcbt2r.-^N3pH(V8DN8<rd;O9Z,9;U/`n_>mpXDU?H/b,0P0*-l
6M%cYQ]AeJTlgilI_+7,RTX/[hlFSZb*om&^D[!(HF'&,/ceCSjJFCu;>cd'9r(Co4H$Mj?EA
NMHVr%N\/X^/'a+/OlosULm>oh1e/j)#PAXbi&i.Zt/LkL^kH`Bd=A3RKQC--`#P_"*kB1kO
DbM.;hqloQ`)^at3f%]A0T0'g8^5Q@Nq=;cpF\Ts--g@2Rug@FYgMu;`9^"/S%&=hAX;i<k/o
ZPG,!HBLja^&23mPi[`BZm+(^_(e?[I,Q-=s@[RTWQWq8R>@AM1D^25fYnlZ+9o7i>)m-'mk
C^$pSY^\n59/T==;-21Kl(aXS8s9rUHQ)#Yp*o2u0eM?CW(a3'-=<9RpcE,2sLCKtCBpN,q^
rrJq#r5BH1n?`!_E,e:No#$_)=r-IbZ"-7_l-u6CWi9TrL7Ij%cefrZ?$B1>R3gfV?qkK.)*
lor_>U?V8d&t;1)lpi#A"L]AdTr,S`R8.?R??A?fi7jlmJI.K\s^LVi#=YGi'1_Vd>^S4kBj4
+G:H?m&KB:+Aj*)On3p?YQP;8UBf9CtKF)rEFJRZlS%Lm>&RO_>UWP+?X!4iD;jUTts"nc`D
%.)Ufoof$hA=+;j_%%P-Wgr&<B/A:>V;62:B,m<*ni!_hhi'JNJ;Mm/Wnrjgf4Zu@kq+CkUV
fG^+5PI_(k]A:ICt'+P]Aa39eX[D5odc1X.WP5T:D#JXS<_Fd_/GkE0T$5I\WEN$+tW-<C.l"I
I;np^(-J[7IGJ1;nGj0pU/bX/B0SZ':ST0N.k?4;iNa)GARX_Q>0eaiet'r&rZ_\5(l;kE[R
;k3E>j17GB:H#Ta=mI:S>VK-aY-/*`F4/ah!X=lq8QX($MiP6P$KM^Q=E`qrn5uHt45hS`=O
7Sud1&5f1@[Ff>PJB&J!BE\JR'I8Z!1,J]A@nlE4Zb"]A6J)a0B_'.sb<L-U#j`H(=m$"'YRTd
98Jm?3G,\%5,cA:/c@PCb#uOOP;SAIE$^f?Ls61&gIj[&J&it.4Sd=D!)V+W^MH)J"Kbs\Sc
c_?p`r$,5&%Onpmn@bB.=H.fA4FIW]Af\?\:^GLhs_7L9h'AhF_>9DDq-.n*Dcb:mUNs"UEtT
b3]A?CROJ1Z9p@_D\9A68/efZC&Yd'f`CT[m/sZVQ6qY0iO[adq8#,g%`PWf4!Q-a[484)REf
i0,F8sO4mS.D@17[AB<=D4^(TfY[b<0!,h))q9g5_eG:;qeI,:/;U:n2ggNDh[9#;^'_(f'2
qMp!YPPoqhQO^TC8aGTn%H2Y%=)VZa5GL;J8(Rl4,p'97U?dtU8f9td-rRElnCo[#13h4$^D
nRN6c7`?)S)2<5PjXSD!Z5AS/,;SD('8YJ5IAqH-r_Cu6oo)`3`MmM3$2[%7+P$1<h';^1&@
f_5ogKG/ZpMer0@Q)YcXW*RZ16$(73dHX1;P@j`95tpe`/66c6a)EXV5S%"8gD.DkE"8n2'L
pYaS_>tHpi>f!s0iFGL[5:XU&rkAH'quZ$`#4iM&p>7ub(9?qnpgA"fBC"lk$=`or=Yi+<MO
h;nm25I8MA0_<7f,7%]A*o,E_h/7hb%5tEJ;q5,aFkfQ;pEk&Mb(5<R%k`gjuu'XOcrB1pe,U
%#f7IZ]A'5)Q*gqX!MSRkc_ia7<Q@&@-Xm#O890mhKGZ(Qo"%-W8:S\McE<NN"EsS-,m/BU_o
mdD0/"I:?e`k[#@7ko>;trG[$`EHN=0j!W`Xu^q%J^Vada[Tog&pVr<WAk=%i'4KnY"\@B(?
2nTAYh,bZ`<4L5nO;f$E==L\t&?MXBSM8j7gMYNN97BqPBre(D/(FSmLkU;IS.(VX3G[pJ>P
KaResH#GFGS!.N4#^ft(.sU_E*Y6!]ANm6(-=.Qb]A1a[Pb'8+$J3(H_Pj9-jTCU#OM,_s,ADX
S&I,>uGpdu)Kcf#Td[XGp#e-V5B7bJY-<^65V^jrLJ?NS*QCMF>k*=unBoi>pm-1^R#^J/lU
Lqr,ZR91dBQNS_KHcA`Z1'H$?]ABUITIFO,jRN%f9Gh1gs.B-JOT/5<N*`As$8<T:@_5Q6/D]A
K$1eK:^'"rt1#U322XIfB;4iDR3skc=t\=**(P=ra\3Gf<-QYD6ZjDnF1<3KG-p%DQcI"DYN
(5;rkl(\bG'SK4Y69/64Y%.5!FM<E7>&>dDWCk%]Ao=i&CZC^JX\6<T/VpW=!-ME?9"gJp6DU
H9t8`1hgCZ4B48hXAp[L*qX:J\+FJl7W:#W'rTfeQRe'\9D;uAN6quj[`RjSdNoG\nejJG[R
o-L;iNtjoNDR.%4B/k1-IS-+s&e";j>tA^)a,'n$;`gXo!;jjrU*P]ABmLlO)2'/KTF\B#sUt
.gN)uG$%+;_[530AC;.3,Y,uH3@l2YYnhRc*ZE#LPj5shk:I7eW5,X,Wht/Rf6u=9!s*2T=o
H@819&5;+\:;89.0AlgD!/Obn3<ff)fp-P@3p;5nFI_.(sP1cS(TPo?N)/M*E=ubm;[f;3Br
l\r-7M,Y3d85NGMJDg/u6tm$k,Ta63KtMm+M+1?1u8*Y5k"q%EoPb`B)[H$>McpD27;rR;Ff
d-r:A,iifbU,htR>093*%n;osW)s\k'f`"U$b"(L4EOpm@P)'\3*6RZn1?gDBQAQVr%3L4mf
d^n/`]AH'3-#O]AqV&IFp!uN<pT1-eWE8Ne9k#>K'@VU@q"ZRA:/&uZ2mT8sn'@%W%@;\]A-#pj
f,:'@DD;(\KgWiLY*uFeJb48P^Y5Qi,hYV3~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="310" y="36" width="321" height="253"/>
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
<![CDATA[="    ABC分析"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="321" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report3"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[ABC分析]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-4144960"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report3"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[ABC分析]]></O>
<FRFont name="微软雅黑" style="1" size="72"/>
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
<BoundsAttr x="310" y="298" width="321" height="289"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label7"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[销售占比]]></O>
</widgetValue>
<LabelAttr textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="298" width="60" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label6"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue/>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="193" y="298" width="117" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.RadioGroup">
<WidgetName name="dim"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<fontSize>
<![CDATA[13]]></fontSize>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="实际值" viName="显示值"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[dim]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[ysje]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="60" y="298" width="133" height="25"/>
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
<border style="1" color="-4144960" borderRadius="0" type="0" borderStyle="0"/>
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
<Plot class="com.fr.plugin.chart.multilayer.VanChartMultiPiePlot">
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
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.multilayer.style.AttrTooltipMultiLevelNameFormat">
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="0.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
<VanChartMultiPie isLight="true" isDrill="true"/>
</Plot>
<ChartDefinition>
<MultiPieValueDefinition>
<OneValueCDDefinition valueName="DIM" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds3]]></Name>
</TableData>
</OneValueCDDefinition>
<MultiPie>
<Attr levelCount="2" seriesName=""/>
<LevelColumnNameList>
<LevelColumnName levelName="YJFL"/>
<LevelColumnName levelName="RJFL"/>
</LevelColumnNameList>
</MultiPie>
</MultiPieValueDefinition>
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
<category class="com.fr.plugin.chart.multilayer.style.AttrTooltipMultiLevelNameFormat">
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
<BoundsAttr x="0" y="0" width="310" height="264"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-4144960" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
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
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.multilayer.VanChartMultiPiePlot">
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
<category class="com.fr.plugin.chart.multilayer.style.AttrTooltipMultiLevelNameFormat">
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
<PieAttr4VanChart roseType="normal" startAngle="0.0" endAngle="360.0" innerRadius="0.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
<VanChartMultiPie isLight="true" isDrill="true"/>
</Plot>
<ChartDefinition>
<MultiPieValueDefinition>
<OneValueCDDefinition valueName="DIM" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds4]]></Name>
</TableData>
</OneValueCDDefinition>
<MultiPie>
<Attr levelCount="2" seriesName=""/>
<LevelColumnNameList>
<LevelColumnName levelName="YJFL"/>
<LevelColumnName levelName="RJFL"/>
</LevelColumnNameList>
</MultiPie>
</MultiPieValueDefinition>
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
<category class="com.fr.plugin.chart.multilayer.style.AttrTooltipMultiLevelNameFormat">
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
<BoundsAttr x="0" y="323" width="310" height="264"/>
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
<border style="1" color="-4144960" borderRadius="0" type="0" borderStyle="0"/>
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
<![CDATA[720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2592000,3886200,3810000,2592000,2592000,2592000,2592000,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[动销率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="1">
<O>
<![CDATA[本月在售商品数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="1">
<O>
<![CDATA[本月动销商品数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="1">
<O>
<![CDATA[本月动销率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="0">
<O t="DSColumn">
<Attributes dsName="在售本月" columnName="N"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="0">
<O t="DSColumn">
<Attributes dsName="动销本月" columnName="N"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=C3 / B3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="1">
<O>
<![CDATA[昨日在售商品数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="1">
<O>
<![CDATA[昨日动销商品数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="3" s="1">
<O>
<![CDATA[昨日动销率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="0">
<O t="DSColumn">
<Attributes dsName="在售昨日" columnName="N"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="4" s="0">
<O t="DSColumn">
<Attributes dsName="动销昨日" columnName="N"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="4" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=C5 / B5]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="5" cs="7" rs="9">
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
<![CDATA[30日|动销率]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="112" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
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
<Attr isCommon="true" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.00]]></Format>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
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
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[dxl]]></Name>
</TableData>
<CategoryName value="RQ"/>
<ChartSummaryColumn name="DXL" function="com.fr.data.util.function.NoneFunction" customName="DXL"/>
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
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.0%]]></Format>
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m(@UGPLoL]AhJ+XnM)lb/$Ir/\R7%Ts8ud#E:dG,M<?N,M5`#V1J65Yt!hqG<&dB'Q,*NR/J,
h#B+G::,)+&kPO@1685Th4\]A#"*1dj&P@^ZXDD]AD%B`O,jfshn@WJHOZUng2"I.-]A]A?P\STa
#YJ0jJjftQc*P_Gc1%hTN(.BhR<r&*7XEU&8^:Ip+m,7ll@HlPcE7/?rWksaQ4Oi'P)#5Zn[
(ErJ9#!'"J5AlY\b'Fa\tun0T00[_k_#L3%ihf6G38nckfT`+^W3]A`HI8UMU9+5t_X,8f#n`
T%I`ZqcoEg/RW]A_HB"RJLHgZ]Ac"Hk:F&(nG><?h%7#EO"*=mnMO:%lR$5N+^`gILF*,N;?R7
N06oE[li7T1]AuEn5aCLIO#7`$;O_DQ2<%9Q^Mhmk]Aj#R?G87piM6EmsN^RZbN&$f85:HF54S
CZF_5.%@gE8.]A6M^M'a`"0q^'/EN@uq_-=uJ'7<3%9Zeb.,+XQ,S\s-e0\ib.;>p-/em.m&S
RcM.g*?pDTaNh!Eos&CpCn(hHsS,aW9M<2a!o[djbC9n\Jo5IYL;Z?[8B=6<k'lsH#%:\c6/
B<Tunfcq%R4NF_LY0:K9"qjtj.pZpHF\DuI7417@`hqSVol1<aKjjdGAej4(e+SSlW1DE;n#
he,pc3JPEtIW(cd<r?d!c,<Z:*KajfQ#B'&M<9T/nD"2.HZRm>NOMUP:4[kp;2:E8I>2p\H3
!cWPFL,lYA%=$OFCRO4YcXXDl)Gh=QFprQLYllJRI2f8YlCU-u(-9iBc0%2nOVOSj#&d/1<5
n=8)7nQM$JP`']A_#uK=iB?E%n;"QZL:B9n\5LNl:>*B-U*j#:9%B5;VYu!XC@KF):P:a3[W:
M)najDUT0=3EFNr&HU>9Ee!j-'55tADD*YsPklr/]AcI(dm]A9qs6d`4\Ae"(hgl]A0MpiXd\F;
lAa'6p.*Kj/46Aml1&f2ZA5r>E4u;Q;5Ef8)+)?J\!nmBm60;:TLf8>]AH9U]AQ6m7a1Y"6B$T
MJ-=P9Qek&Z$6dK:h$BA*WJ]A!URrHb$m!C^JobFqf9T0"'%O+l/QpCc(`9=to-\0C[_1)7QB
E<qK;a>5Ha*G[j)p;`VVlsM^nGAEF+odnMaQ:bS4duWVgb7Te*J%Y;rpr=[m3h)<lDLR"CkB
=`h3as=(=Rn&GW*0k4SU(*KPRFL=X,7bX.&g5%(Ie=.Z6EAJ_Ui:n$-251M6q;fC7^gIF2s,
\@a)E>dkt&ZX(>IsVlWZ2hune4-L8pES]A@04mU"'T&_YnmIo0sLk?ec'm,DMFRYH0H,a7$8f
B0]A.j*9".hG`N?a^;FFa)?-ee*H_kbT'QqZVC#;6o7)?!^CTg^TJ)oUE&aH$PejiIHf"=[<1
M6@_V2jP9&1*eI&kJqY(5\DH6[Wo]A:tG_<R9%4i/9nI0Jh2$F%1J5$Cr$?o9b>k*LQ>g1U?O
Nd+d;h3scE@H2:l@T9]AmrL9j+;9"Q9*Z`iZ`o$\S`2gXtqHC0rO=D;"IB,uT6lJ.`6#USpbn
q]A:1s-IY'8$Ab8D+=u1_A_C.M#6\Bm,E.TD4SK2nEJ^hYMKY9Rfh5Qb\]Aj%u29G<i>]Ac)Nk_
PLuPDg6,6c#fPFO6mFirA</*J8bdj"+_Y<cI/p^(dC!qrLU"k>J6QZK()t)Zl6A0h`#=RD@"
?6Vu8tL(saliqrAbm8Q%(8hjHXUCIQXJLE$&-)sXVUiU)ArXA/IHO7'P=*>7`'$_I2VAqcFi
BWKN\@CY^9RWcG.kCdMrp)-3BsTZQI_Zp1C2/nPS?TlD!jEd+_H5C"mM-E*_+gqULQ";nnga
[f<s&S^h<\GEQ7^6PFoV&>,uI8,#NO%8@=kV$p'.?OfX@<rBmdWi,`^DF<@jN'G'Yf94h<[o
g>FZ&t@B-nldR)\%p#0CAASW@XV($!UV3I3rqBKe,EG[mF8J@7QrYW#pW[ZdL1\os5tQ@-g]A
nVJ0[(Wj[j3Hr0m)![@Ren51I&o0GCXeUI\4m&\a-<IGk/j=^Q3RpB!MELk%VPeo.G1gIa2B
/5pqhM#3tAp\pKWmAHR6AIVQiKuqlVH-55QiquE=JWs?H`8>EB\801iR`tt=o?O9ZNp"!qJD
IDSQE8(')F!]A`Pj.)fB!^Z7e&l-;o=t@Za=_are<Xc5rnnd^LRa_WX17+V4"IsD(YLBP3H9K
0\bTE439u-em;^='CW+$m'JhV_5in#=$=h'@iG*J>IF-"04/5=C(e,;^H/8JO)Ki!r7u"65o
J[NoL=3p",n,rI87_I"B2YT\QD['n(dtQ,^:!ORRm_70aVdW'8[8;9K-@rDhsU@V1>'/?P#k
k,[.\J.:]A(L+^tC]A0#?6km'cm2?OpeU*VrsMk>pXDMk`;3IJ6t?BU6`DW<miV1Y*fBrTBkGW
1=g/1/Fp\0'uprk15HC-/(8lWa/tg;SZW?&Zs#l2FB7or;h4_j^RoBEtpR,M8FVlb74Qt,IT
:h;4bS6!Z[dqcn\cM;4&Cgdako_M1oQbAW2/@&,o!^`A+\8MucO5&cW4u1Wu'S1Li-u3a1m]A
m.o8^%AE6\K,[HAUV)f[BjsU=FEN-..u\QREG(TPb\,*L\4>*3UlK+"G42),PAul-R*QpWL4
g)(Mf[,93c7O3R5gt<=G$1fTcOpk?dIVkcDN!AEKb\Xk,%<;cgE($U-i_EYM@,\=\H$]Ar>[[
$G:n^,VunGOei\)Y`b;(_Dlqq4^4#Pj>-W(^R;Li,0s?)*oVk\oj:dJf/+904ilu84j+e/c)
hG+KgSL_5,CZXZ79il:o0"#L@:=LlM]ABCLW_ul4j;*;%S/?rohlXkKY.Oh%?V2Gb!s^>=>iL
2MKfp@IU,@\iN5N?S'(CSceHiH-.&(Q>@]A8pf&U<):O&q]A`$EL3!?><M["e+Wi6l#&MZY>>Y
?!kI2K*lpCaMa+j1B@Q?!Li$e\QO!fiIV'?Be4S#;/tTkq;$($%j-lc<P7=m="r3TX]A^S)`8
8F[IgiN(B,mXHm,4.HZ_S.s>')tR*skb8F:V/3B7r5$N34tU)GuJ'ni%jdZhJJSWT[D/5lbJ
C=dL.Feu&U\Fac6L>%-gE5iTk'="]A>%$su8[>u^`JOH&0G5q5'RH=M`to+e\D)JF_RBd]A5ol
Gn@_H.>Z1)h;mop2fN),C-H^[PiRtIbl(`b8e<p`DlO[r,#&!j5UL"-$"-nX!G7]AZ+KT0586
#7VqSsVI.fh-c:\R]AbY&pZ>Cn=_ne,!#qWfaV7Gh!6pN&E8VQZuM1j3ep_AZ:^.AZ[S5Y$;=
K4q5f0d'keZWd"Xm#UPY,X$*M*X>XlH5t8qN:Lqrg`ZuP"#>^!p-=7imf`'g;O#2Pqd9QX9^
J%FArc;')!l\!f&j_*9"^8WV2_?&="eE=QgJe`FXbsSc#EKTdF:['B/&bU-5+Wa<L]AU*A$P)
"4LO6A]A<d<3@6s43kW$Mf:[g@DdFIo7I+S2N1OX\>Sa#2/9bNIS.*<!;NLJ4[c83-IUE(C+E
<q(N14q`*IpL2o2l'2<S/-t7Y#M/pTF\6FGSOD-fu&0!F`LfPXeuP8opLXoWV^jT<uG3&I`c
3NL63A\afd;NdLU$(YK+,FK#Ll?$[RZhA\k,:rgdZ0a<q4$jQqWKYW40#,:"/=+`Z\ji!Th-
YG)6MfGKXfAVk]At+r?]AL299'1.P08E>.0?`[5O8t;-Com?B\n+849X.fku]A'rqg$Uh@q292t
6>qPRQ]ADK/!8m"QD@)g4);gY%[FpD0Fd'oZPZIe&T9>`mcT<K]Ab2+ftV52SFBT4Qk>P8[i_L
-jsHB(ITA4T6ZVDsl6/tar>X//ccNX+d*f8pVL39D9T@Ap,CGk=U[=q5&kB6u$'r6RqKAIpc
0XGVV#uENBus'R<7AmHd?cK@J>?aL/Y:BDLs@&g<n:,b%@Qe6<$ch(h5LZ!l`1Ks\X.N=p=p
`[IPrpdbsMfke^-G`LIgiTG1iV\P-Fo\A?)0[]A-"'i(*`=]Ad/aLnk19(H#*K0f7G3%)iJP=U
;_.c'dB[/\\"tAtOrfe6XsThIYC%?#JOH?("fSXX,rADlK'[4Y'<n3U^Db)4^g=<l`t\CTD"
j%;jFSPgb!bpWkf_[Z!WGjRUT8PUIK46`U&$3@EM<'Kim#7$DiTo2>#P-=ii._;!neW@JX3\
H%%o?_Dk2^WMo[ZUWB@YH$Oa<S"pG_dF:G5BO:'T6=har[fZIs_a89ao:/udfP$`AOP@^]A&R
U@[bOL<?iQYK:A[umt%e?2;B[[1puq5`bnbMMtc;p3'0q(BLne"0!cpmLAdL$cE%@Q['8RD!
HuSon(MO)nKropsnKB-U"MRQ>1Z5j9Fa6qkq5-L)Nj[^RQ^Ft,XLFLVu>,J:6IBIi;L$g:*t
ZGB0PB+COPr2(8FIK&'0<^4>AZ$E$b6h?u/Ff5@O@UbU0d7P/QTt605SK<B2CFQ`:hM4,/a@
D;$6dkX4<>(/$2HjLcPP7<mHdJ[;IE0TmC/Rcc=gj)S;oE`jkCtS7NPLjKp-IRtTtMjKKejU
`c+3%eN8N8[+6k+Qr;6E%Q=lp[ad:\4b9oA633*QQk!AM7P=QDpet"N@n0\F9WhG%r"8:m_*
d*Le6u!I#pleE(\:VLY#Z_LO/VpkV?sbHGa\sSbkTAJOTW,prr@t=Bqg,$3_tbh'T*EuU7Li
I\W@tKf=RW=PI2_33ig7o6M#6,8qhJ?[#99-ld?@S7$b9:i^)qID%qDAI`MndjcDICa9;mu8
\:Su*6"7>V[@qa8;V65:\nDS_qd3l19sb+a>iFU+bBiKtb?bU\bX%;"=S.?>Xr;Rl@Tp[dZR
XeX365?7<PYVPolMlqhc7QoPAtACo_nLC"+jg+*U_Ps6_]AOs-8]A)qhNr.5hF',pigQI7PH:K
rT<c:GJcYg6V.D4Sb$s4sFETJL]A@1!R,28^g(&(F>5-?Xl'3U8dD<d0g#Ztf//fME1)>T_Ia
^0ak_!uMakmC(0`1*Tnjp`RS>0m2lA.gF14XR)>C4ROK89pX%\hXA4!.:aDfiD`6Gd,`J9Ot
`uPS3(Jg80[hfcSA1@q^$,7uJ_MK^kE*8$tf=#U80_411p6%iblA[$p3I`VeTNfU9(.BVSMm
\]Al/'nHVqDg1'&GNt)Srj.a]Ac1AkunanEh['6VQX=kOk&aGNIE%qN#)?LEWp;H$W,/Du@.<M
bKP"FX!.@QcrQ_XqP&-8aFt*9'OEe(rrDdPM",+"VU\OF=1I&W\ii?-V=gp;Zru$9B:nDu#s
#SW<S!03*hF>HlJ-/Ld[VRumsAp[7f!)naL`>]AbD<anG^-7WH+Krj\InYL%+(kmt]AS$Qa&t\
G04Yh=SY0"`a0a7OGk2(ik&rj.$(b:C_3QRDusHG6IM_mecMR#6Jt]A+gO$PfF2,S'/qldk_I
^8&F]A92m>-Q<ck27PSi:7p)k74*m$Z[/NU3&N86.;Oojg,4:fG(#dTUOQ#S9PU7pTZT7rs![
2)P.iq)Hr5WSsO$I9qV!@QBj/pKL?Lms^[r[+YP(WCZ<"ORQcA1c*CW>3jUOY^r\;@q3hH=F
oPt&c54qjioOY\j",-Z<CC@%jq`BZ0<S;WQ!YXP,r1Da$q_o:>C>Yd-Wb`H1l/MV/]ArnQ^R[
)%LBsl=r3-kX`I1t,Y%_`]A;$;;`aeTT"tDR>YC"CGX0_7G0C,&;S[hHIDPjm4&?6$)b7$&V0
Cc0K(0cc5NF#>cJK=9+Vho>VYeps+ejgKh#9X``D*[5_cJbZbgM@%21PWSp4j_*6"Z]AJL%:2
a8%aXI3`Xo\!,-P6'[e\`oagq"'D6&D8#.Z!,NI3;o4p-E\UblgQCf;Z[LF;H&FF(m45Q1\,
41%B_+7#k+P*HsP+(RgJA0$9*o3t'b2pNCq+s*iEf#^c&0U'ZYoE@V(*&i#Y1u/FWgODHV%C
`tBHE<mH`VV3qMFR'^jj!g5.Qb>REYoIT?Mut(hu+?sLa8*;R6HM4'm)8qXpZ^.,J*QUIUGZ
o2u'JLgf%Xh.eRc0L*QiG4Au:><a#B!CLkf7Rd>O\ZusL'U-NT%fUudd%Ul^cOB]AgJ$5A4Q\
s>j6]AA%9N'd'KmMOk]A"FYea6d)V6EpGl>-<^Ya.<u8PTN%A7&&Z[aF;u>k+K4+QbU7nGJDXZ
'-2`Um;I;WTeYaEYg4uF\S$iUXI[kh<=^\,`h=M;MQ;_]Ai`RqnBI"5)^$g>egaO6F*7&m=Bu
c<d+!]A/OM?aZ7=AW*gdC,`NiC4S[ULf9c2f6\H`l&`8nsq`?/,MRZYkg[P'JAfSM<'RN/2pc
*)9BI)L[_"C[aX[fO_.LHP`OG3+rbPr\:'Q\"j@X`<gfN2'j)g!(*%R6p)GSoZYc(ZjqLe:`
dZ4TJe5)j83p:r&^e$Q6jr885!%ROj#Y=;3h>3lV@.(MsuBs;3oi++r`?rd(g=iuM?PN#Z$\
eW\D6W;9e\@7_']AP-Y>`2.#&:dJGNY-Pl=Y^a&gqh*T=<:<mTX(;6!']A]A']AHrrif)]A.C:7ug
g7f%QG$I-cR5$+`ls0V*X*ag\3Yo5iDRr??1F_K\N0=//M@TWMcX!j(oBeI08-58b,2nX)%N
)a_iPK+3b]A!\8pk\0B)R;Fl\+@hl3,p[31RWXaUoGDE*3C/ppmNuct!fDMX8>a2TaP1[?]A!G
mA/6$+2B`@l:SbH,FKg955U0a`F)Od>@N8\fc#nu.Re7Oka_d/4hV!9*aP8WU8-8%BYXagRW
e1n;;=LQ)3=7!3mEoSa-X*<+cjPj=<iR4q<`Q?S?udsZ2t`rGN*iZuP7>:o@9cdp-G3r4hJN
ir>.kq-)3%PMs>*<%a</D[nKh@A,$*815Vr]AB!e'>PEG]AXIj\M90A%PH6KJ*Nif$qn9"MqO*
eub',(M1*kg%lH:_Jc`<%UJ(o48:f<^u4&06j\jB#6qd-`G&fP/:.X2>6`,'6u0I"p$^Nc3Y
!RE1d$;HfkYpQ%se=n9'3CB(aO6(?X`Q6pTYCE,J):L)*LYb@]A0'i-=[$[:fM='Wr27t(%.s
T0b+)Scg5^O3UjOqF04<VJu!g5tnWuWT&Ai8D`Wt:\#<%f;E'usrRV^nWKXUN_WS^9qUlH"S
a%d!nS>6U^u[KbA2*jm!]A.?uYGP)9Xbg:FSI-T!Y,a'NOt84mu]AX?YUu1b<r.?V.e'@*KGDY
'jtMCH;I*[:i?,Wq\k_]A]Aok:R3;EY$*k>2QA7XK=&sVX*`bOMSQi6tB!W5XlTu_ME;H5LaOt
?.mLs,W]AVc\jcgT(41UE""/96Z@9MFpgr)&NqRfHnAlr%JYfl,'aBXtIB(K2=q!Wbs[)8QGm
/,TfM3&0.7C*s9NoA[jQ#M*D9/,^O\>,NjaG?X,5=De_"VreSRHOYF%>FKp"ORJTC(Y0?<mQ
$"!iS:3cB?p8,`^OLqp&kPfQ?q?H<^L;U>.ja@C*g,qK,63lR@4G)qn\[B,^pujY9Z</'=4]A
u3C'^oY8?>b63ikH9reKYY*i2S?s(2AMsqoWE_f`>ql-nHJ^4+,.\,E>OoUR9mrC/#=,QF4(
DHgGnOL&+ASG5MN%B^33oF&+_&rNT0'&VpG4/n)ELmS>oTG]A4rPh_P[*K;meoE9WLD<W.hPU
f8')]A2?"&>d'FN/[?9!urg*Oo$%CF'%,&a?H-+-rZXnMFK:0MXiA8ZR(F/RkXXKqmRkI">\d
g<EFgT^g%9p?Ra/mmg1P[&FM9a]A*;fNLpMI!BFjJ%*/BcYVYf,n\agkZ-@]AP_mM/M)s7u"W%
9Pr:7:U&9KQbDdX'c1^Hn7Y=g"8qg1s"n(sqPHb3eDJhaG1_pKOtYS^(GZ_N%TFF`/)DCb>^
prc@[f+EJhVpU6RaR-<c\rg5$tnOF,`7T0+DZrHh-!NJpY#)pSJ'phHP4Mp,_.OdrZ>?]AR:,
MR]A\.jnWm(NM82+bJoZA=_t<YC#RZ?#3p_<['2N?=KbRK##'"M<4R7,G9paA9R\[Rrfc%hN^
,'ag)HiW_&O<`V?SG;hnFS]AnQ*3,P="APiE=pN;e:G;TKshUKW.S:S?dc!=Ybi#Y3&hq-A47
6\L8bV?PFPYdEU`1P$P_"MZTI1%`S-<@]A;M]AL`>7lodQL7G(ZPhLlo-o.*RUXT<KlF&!,5kV
Kk%_GuVgP\d32MshoLGG'Oo<tco`21<S0_W$?Y->&NoYY@diL6%ij;<_)@-DJ2p-8YDi]At_.
f_f`IBN3NXBTk%C2(@O[FDm),\<g,NMEq_lY[_M%uih+tm1_gbT.Z,e/lO^EB/m(H?CXR!@l
fd@q4B.(s;?IkfWgpRqrcR\NdC(:,s&q$`UVu$e[<(TnMPfL]A5:Vl>HKpu.R6Q+$Vb#!KmdH
Y"IfB^<Y!W*1bhjk5:MK*ta0o]AI_8#t^K^m*>#D3^Pk44Zc=IY1nWD_r*oj8\KmY@-Wf/j=K
,@:$pq:EJLF-@<js,UM@:1;bF]AbAk'VgRmW\mN8/#6>WcMuJTu4Au-#gAVr`MOG!'a5m4"ot
T'rn8/B-5-CU>aJZ?_T)sWVVK9;uE>?cAXnY3Xnpf=2)O0MOVlHAd:La%S<HTO7p!<6:+r:-
<#p4*\FMck)+!iN=maL\kIF_NQ7lfu@c]Ab+["N1$FQSt2j4`C8=3_O(g'%B]A%l&$+Y_G:OS!
\Z$h"Xtde\.!h+$Y*RFHs)8'O:?Vjj9"dK6,katZ\WUISi"B\;J+*:Xq^EOHjTg4C$U4]AU@'
Bq8Uu]A"DD>'eX8k4b)HCgH=#lG37%eq2@7<No6&1n%-LI5b77ec(]A'UY#qNq?91C.S%of$9t
4m4H!3?9)Q_9l>tRT%`[]AX'?ccpg1k'77!%q??TIT4sKA$45[%W%Es*VGD?Kj1V/;81r&@Tp
>2,qVg1cDO<DJ3ki_Hg)gq*5Y'2`41@q9Rq\OK/^jU;s&;A$.81Q=Osdq*fGk5GL,2!?lmf?
F?cU&?U)tt08'#C/(3:*O%B'_1PXA!Neh%U6G73eOJJ2.gKo0VA)a*"[ju,C)n1o7:'qG9Y%
Q7-E3n!YbndOht5_X!-"KdlJ;N/fhI5a\[9\F;]A(d?)p2f25c)T:[SGr>f5JXn8Mg79tZ:5l
-u0(2uMnY$76dX?6M<X'lC=+q)?E+.3/,?C`&_C*Xe><V-"86PYc<HVB2W3_A`Z9:TF+\9aS
)]A3aZHSQ%hUMG%A:-Ng@";7tmoY0&5=jVV;aD5j6JDr..[n2^g><1IDj(+8ME-/S*n,LHR?r
)_RoWP^T4$6]ASH[)"bb!*<DZsHTgVM="YB#PQ6$BaRQ)'p8Nl4$`kE>@ha8g6**?gg-!iV)%
r3mBHK(tBn`%5S=u`29+`UY^CP;16X]AG`%fFkOZ?k^6^!HmVm.',Xb%RnH.g!]A+Q#p!GAlIs
#rDYSsuY2$M85'hrs8gI?gQpc,Y>De-FhZ>dX'[:=C1;roUbV+"Fn(6'l*QD2D,,[l#`H$jR
9e3K;"U96AGIn?@+U*&XBO[Xku.9[r[f^2[9sh!+R;AI0NMqI+Dk/jLD:A>c\bgBek\fK3iU
PtT[]Ae$JEm<s0p=Bd$QdHtjh,V_S2IXc[:YXb6Q&oDCN9=SRs'[Y7hTlqrt+oFtV"^u#o,,X
/\K\6^H&]AY,MoU\j3'DtU)GjsIU\qcfaol1]A/Tp#.@08rHUK3k'\fX@?AcE.Q<bECrEXGYV\
o"s&ntNE*RhgNcYs43,:Y5=",_p.!gq:P4"L<hICOk`\\Fd%9I&?RDQQK@Sg('2f[TlOes]A_
i-X62U&SK/:2%Cn8H^Fk*EjgpK/7p9%E,sl#]AO+Nth8nep+\'XG@k`Cp\>X.[?S0%^Z4jG@.
A<$W!?KoCh#sGZR6;,]ACAGaM:Ue_^so?5uFNbH=RQ41eSVo6<5T`3%h%^1iC-pO!4:ic)39$
mu0UnI<]ABj%EZf3(P$PcP0rI?AjVG4-J*<OeRfb1V9PS1e5VZ[,]A:c'dt>11%(<X<<37fuIu
u?@KO[c`=F>KK@,>so+%O@pj4d8i*6ac=WLkXRlT&hI>b&JecRS8!b:VtjIK9P:ILP&8d!s$
AH9:/t[*lX_eKf\B7MYN]Ag=OAjTEjW$rT=Q\)TClGaEhYQ(lR6B^Y?Z%!i46p]AI(Ts7f[s_^
"HYT%%K6UQo%,o?0n1R/'a_'^/[Sd(/+I7iOa7T\iW.ISIKD0nstiQ!M<(37IeX@Q*lM,50c
=iWHk"13g"k!IN@S_g7O=MpK3c>%b:,-X:_m@/6+n[*j1HkKLI@kn!m>2a?6k9_U1Z+:grIQ
l,X[4q?cPM5,DWHSOj(P21Ff+1`LuLeH@`i%HjL45@ToW:H*:Vn0Bs)kr+=Xb90_CqY;rq55
HLu..I485AQ0N>iIA9C4GcAZ#ie^miE0kY;F&9`D?dEE*;jh"cts>3B%)2Bbm&XG.R43Z2XJ
@V9cjEBBoJ0`(N>]A@Waq80$K=EkZlD'^_*ddK\<sKj>6aVgJpHjdemLLAP9Q@%F=2>.*%b7Q
q7#E0g`t"AYDpgp@fU6l]AVV09g1Gpmp%T%I)&B.X)L3nVen03*&7/)#"DM8oKD2f1/lEpBt$
MgWZV1#Um:3sc]ADGl,N']A,X,o3090\$Ro]A;-:[<Yo4OM[S3/O,JbfNed4#aWIeeGp>>(9k,;
m=mt<[?hG:L9GpuZIAonN1M>#3lJ.uSN%3Y'`Nm1g.NaP9KGp8_o%:5Ibr:&9OrhOR#pIW*]A
`k_:VU\8=:1#Ro_:$+$s68M@\nUHI`)pNh<+*ge#:I&%o7S(<.i+D'#1@(_IoBUeppq/4Zuo
PPX5#'&nHjZ9;t.>Vtqs"BPQ;&XO_]A(T<jNLb55iLK'6-FAm(dt7=aMdai%aMQc-h;Bn-u&I
=#bDGPBfR0UBR;6?ga.`r#E?UpI64F2]AmfR2>tfoZ4^+]AB6*.)-?'gXG"XiB/4&"Zn5llBf@
fj:9)sdce<#<$T7s_JB6^&BF[0^HP(;(Z'4L5c5O^S3!V7&h^P@;,%TT6=$^.Kf%r<jk*2EG
=ZT]AYQaON8L4,h+Su&P8R&G(bh/>;?ZuSl)!fVlOmcn:erJ(O./VRHLVmeb7AMbE"Xs2eG]A!
o(<)lQ)12XSqV"nE2Knl&&4B4g9"MZVnPT9itL0`IZ)C:G8qgLlDc&]AW2?g(qstj#O4>3:;_
;!S:pe+4).3[nRR@?C<FTi`3_qB$'_6acs5$JBP$([F*I'U.deGVGL.?^%G=Y9G=>1C]A0N+Y
r%.t(FBXb!SYc\ggtnMb)e6;cT;EoCga=]AVs*"fiAo%m`D$1@&C:X6&ii5$4tdp;5nbMCcUQ
TKC<i$T*!q+09^TFSU#4-VM,AC5PCkj$f$lt\lq\o&\;8mK8-ZV<a\?D:6eo*m=u\"sqAm*W
,n%l`2/OjdIH*Z4U/*LE]Af+*->7tRZ%RtJQ?W+h^l0W?!A(L8&&V(GX/O?CV9\_QFA9E3/*]A
*;gYP\rZC;#TL]AFf8'5V]Ah(&rAB-9XWih=[W=_m&AWir%PEtc]AOsGQaaXR<_,MdZSVYY/,Ma
p>n]AK,P_;e<KAr-(I<_`l(IY/pbnn!FOAOmn/%h@cQ[nCQ#F=p56B)r9%:,B7H^1T0,#8Vn[
>eSf"XoKKD_n@Z;D3/Qgd'*<TNW=h6-7;?^&<QZB.T.MfcGHg:[LdtT^Xc?3`q<m-0aB"E*o
4k.udJeH?aQ!)JoPi%,0]A2abS`S.,%?9VZr"HNMm`qg-Qkl<f5m>YJ4CWr_o1ob`[uhnGi`4
[rB$9D?HN'8ZUYY3=*2r/>%"h/1qp;/K6?b&D'N'`Uk*PI(u5":YP>fZ&rVIW/"I%kcLiXJ1
Np6![*;$?9HC*DX6d&cM+!Z#.i&-J@4]A+."+-AZ:+VZRO^!2!L%^KNLp_'m%1s_4m)0/P^3P
G":u;U.:E`6E;Sp5=Yk%?;,8gX/R!bY00^s2okf?@]AA8`%l3%T5[SAq_,M>!QX9&<N5VZCZ!
4iDP)@8R>V!h?PB5R"ClIlDNo1rR-AY]A(BSl-Z:g9gbNKX<]A9.!ZjgTpf1'.HrCb53RHu#Wj
2Z0,06d,+^_6&q@sd"Xk6j0sqP5YOK'b]AfF%JlR*cgm$*r.!`*o_/s(CJ)aGPoA64_P*&b(c
HL7;03J@>oWiAp+1@so<cuUUdOU>N=n=&V%0LR_5mnG(SjhS;O:b4Ht,,;HDl5X!"-m'Ba#2
N4k]A[5l[9e*0,C%TM:&&Z>O>j?98I.6/!,.Fjr<'31l`T<S[Dui*aiQE=M8hun`cpqiWFLO<
$[rbXTi`O2n8t15Cl?"cq$tn!$+0Y[n)?9'tYq^DMEHT*07,gk9I0Pk?8;4:oitl^qPKd7"C
>)",17AZ)S>$@C#54md7s,t:%NgCb%Ju"R(p?D952#,uCMgskpZ$V:@)?B:3H3KNAGkDkqB^
fS_ik8#)<qcma?muY2rW^V,*9jB<90fGiBrULrP*X_<:MuhN\X7"+W@%0gm-U8Hq**@Nikn/
@=KoMeOKf9O..%[JCWBdnTHZaR#C[4#j1X01_NC6_$>YLgObLr8;@UT0ONCoJk<gV*U5mgRh
K4WZh''%HjaSG\[#HYmTQpe3@&r1Eq.%dbqe-+)1B;dNq8;-+@E6p#U'<O.K2nYV%HeMH6QM
bdFig/mUZXaLA62=&7WBT9%m>7:G3U6o%/bV$BH;55;Z1\@Sa-qZPHKP'aR30j[[B?&Vm8s0
sk5nH^82X>4H>U-Ub")-pIF,>T%4>=\<C%#Fs96JO%q^I-bZknQYi%3g#dYPZJr$T*Nn/^kD
;WTk*=Ts#V;'6T?aZnhC69WFhOoc9PU<=(K-KI<r_p;Ymk8@R?RsWV<e;;Q_r5[+&[=P!/u_
kmnYOikms$;l6QLL.@GL:FO[NhBg^!hm@`0gZ3mo";U]Aqo)c/Bh'blRTSc6.9JqJHi!>FS:^
":%6n)G!:N.]Am9o=-OXFXb<l?`ao[kRbSX"_-1&',*_4R-!V:UHWHD($6D;Z-IYNaI3N9.6+
h'gA/2E7ri/"a@rWOF,j>q=EpNJtkK=b'iKrqppEX1:.Fqbs.D.KibPl*Psau,R9"*@3&cdH
SOE!W9T(R4>a'3n0Y0D?e0p6,Wk/]A!!Q!kC!AQQ3_<b8,BjVB'USHM"PZQ2&L(<#kcK[s<2]A
mGT4=tZE'K=FL)1,+c.dT%D8$uhXmK]AobH8b+a:9OZpX!0Hqc\n,heLfEG@P8,/l5'Zd;.BC
40S&Paomcf9[kM9X:;9%,j`&!iq_tHY)FNq^>XAij#D6=B5ORJgK;U%"Q^UKPE>i<=XUVISD
NkeLFId-H_(e4Gf0SN0jG#'KSlfdl@XE6.tkJ$oXqf2SWXVMHWr^u9&gIk?+^/T!&&(%")D\
@j>!S[nOu*<[!a"KHtrflM;_3)E\AIAm.4^,!,#IK75Pe_oH%h\FE5SSp$Bus$pOrd&QRld+
>0F@[rN5JFk8W*1Yk)J9mNW!-FGY@G\7:8q&8Yi(dqX`UeHfeTZf;L-bniPQh,&)laogo1FN
S<ja"Nr6f>;027.IPS-pUZZM7boA.2Yj+/Pmm:jXVqfBXrYk>2m6&0:5Lb(qHnK2%a]Ak\7Pc
I8QKVo24I,DehZ-0+H9@E9US)jZBbia\keXN.4qh=9oj=(MjIg>,<J[;cESc/i%.7mCaEF$S
e?DdWB0^/P]AW!JE#B%/#'>,>!Y('Q)dTTiU9CPTZ`6U:G<4*5XBqFU^?<"DJ%X[A,?7i!P"^
:6B.#C$TYR>i%eepFJtZ]A%2dk?#n?DJk4JM[jUid5P-WAMJ_u46qeuc0O:!*:JeJYl:6\p3N
Bh]AZ&KF>Qqd&ZpZ?E\9Sn6b>+MR#(=AdB,*+m5g$i7@aFD,ZAbKr^7!\<Yi0$89L<^m1sCo\
g^L4+^K/&e8NZ>C1=mmU(5&f1GIV:4mMUI@^hMk-&;CRh.,>GH@s&&<*b'P9Nb]A>6oG7&37-
a@.67f3VS^jHKpChV7t?To<(&AV:s(VZIo5BFH4#EGl-/J&&mH$TBI7jrFf#!poZ4V\PTEkL
<).G(F-HgC,+\57`WZ5>i-Dp:I4h3!\75>BW.+L>MJH"g"3YI$uF)el/HX*t:l5%<t_RYMGY
JV^R:/;4Qf)8o5=[7PIWi2[>F@K>f9?fY+SK=+Gsrk[QcKCPCZU`Km^4U><G3[3ouI)WRBjT
Q$TTKGHD0E\>eoQW6kC*\l"+c-3X,6EV#WF3D0&2e`ZMT@"Jpk]AW-R(p[g1*@:Z7n@BE+B-e
H5OmK+1Q'C*LR@Z%QP,dKmV+QZ,:YB98_FKPPNR'jH6c../PMoBX.;kr5'Rd`jZ.=KIj29M+
[6qX:b4Ws>n&A6LlLc#9!F>K3]AZ+M/2<W9H07o":)5[n6=/ebn1K"F\U=SHpW$o%#!/-)M(@
s':f6u:7%rtiq<\%kp\-^Xi&Q1p37[7<$fV)T9!X:gihRs=brE^N17k_qX0lg@4Rodn3]AZjh
U<,#M9Ec!$$P_JR0cKAbq!g_1uWJ/bKMp1bG1g5:a]Ah@!?_OBaiS26jC,aIJ*OiUIDkrfn0W
3-IQU/d>A"W*+5(_2fJb,;>&IZh&:gqpQh_91YJi<NDobf:HKa!DZ8@I5:oAp]A7JK<YntX=W
NrZVa>nc"aI38b(2F7\Xg0X[J,6ne?m4_n!o3dFgPt+lSI2KqK0e]APOa9V,("Or0!%ICRj+(
h*r1A0YOik1ODtga0u;Vhs"lHok-,X&3f_18K:%Jp(0h2Zr.T*,h$#4mOa]A(0j"*_>1!QK.3
r>@nP!C9INV*L5!6UF3B)DgV[kr`FfO_Dk2n8Q1NMiFr=8akT`q8$5o1JCL/nPNg;i.LT#tH
r$b&MsLC9NH$B&qk<(4_V&L&sK;]A[IOeX\A8T-#GfSA[r2oLm>/W@Yk4-mE<I\5:bkFR+]AOK
,]A9*%iDAdY+nKAqD_-;;iE%RR6b1!J.0n>l=Y3B*bFW062s&/@T2+G.UZaJiLYuAI#hYlY%6
QN9:$9&'Nc9CL*ZqjCTAZ(OC1flQNiDcb,/BtrJDQ!nH7dQF%h6DHc[6HJ!\\ng5A`<EpZpa
qY@60d^dlX,SR9BTne"*n\T]AnGAj%<ahKH<Kd28#.==k'BTiCln5Ub"$dkjb??@$cFfMS*!J
</+L;ocV(Vfqn_:*",VuuehFs+$.?iZJ6Ii=,KeouLpjZ,[WZ+W_92<m>,F,tg_Xlqpe[dkp
Qp(;)&#<1#a6dgISB'tKTcGNns2j0[e^XDTY-`._b,0UL4"EUIT5#"::L#b70JD61A<&uM_i
G[+LB]A>#AE>Q'u5FWV^ZS,K]AZ8f$G94R9`n04j]A9#@NcVUbgKVg]Ah4?II50!7,ZMADDQqMh&
@q*ZIlcjpu%P:iMP,/b(jE>E`q$>S:$Rg#,:Kr4Y"_NE8!uI$J;_jsp);mN!sdgaVO@5),3$
IXke:2DhGa:e"QPIs1prmQDD4Va`ic6O*[)c[4I-q0XaOrM7/UG.9;FXZ+o5-_<.?ZT/qm*X
C=&j[#%`-8"3R2*bc'"K(<!8gf\TMU9Ha<RkRO6kdlS71Kh'%,ZXSflU^jYorhYU%[203:HP
eC)GuAHY+mQ[P+FR$(.IFA+C%Bb;Y+CZ>29g_e<0eiR()1+WV9c*#4Y;kYjQ9g2p%RQ7.ldo
se0F?Q9q#FM=)e*NQ3:Fj"UA]AOd=rTIJoaS]A@eZ=N!MIMZJE/*;g'O_X8e]AVGAD=CCS?@"Y'
PhZ8r"F#"^>9X'$=YYF=E5@)BnEMS:G$H=!?i9uF__WHilfQpSfJetT6$4lm:gRA8m#)!P@.
[`0E@g[[>CQW0N-0e\"ZA\A_.H8hgo@'CJ":Bk8`U<X^%RG%l+4un6DVd-%\p^4^jT6n3Np`
!9p#P-)cq2W$8nA+#t%oR"bMEUZMH(#-745u]Ae`\l%3H'N:0jd^D3[DMPOjH3IP,d01Vfp"r
:\]At/SipnM9lP]A/K#,?>#FcD,8TR9OCnT<gg&C$]A&XA1=BM7?2f"XBBN@Ru2[]A"l]A_)h.1Li
WObX.tWaa_P+ZIloieZPauoZAKoubW9%[5oj3mkj\D6\a4IaO]A;E>M2DX#im9uBcp\gP_6J*
!`1N>29400M(Oc>(Ni=Gh1Su_Nl[$9)X?"bXeQCqDR39"(d6*Yksi>ONYjAncE@g3rkkXkGd
hbRdgi.-\!Dd?d^U=`r3RH>r&_:dZ=57HWm:ee2,;nWhVonF+,\MQ!+cjBeb=8tZ=9"AWJ,8
*PKF\EiGGt-W5$5,;Rg]Am"7/70[gHZ*)XV6EDrT(D1mI%ae#;L*pZhO6#R7EllS^SncUl*.X
irJ;O%3=:KOI>t`,XU1<cT`!Wr<C(:>VoAK0PcS'71]AW+aj2SRhUg1k7&^48ihNpa,\pN.o5
,.kpMa?'7ge]A!V67,E7h[DMGQGP=;ipDB%EkVYkp5W#(puSZ-\lI&S:]A_Z%EC+ZafWZ9#$'7
PAB_A@6)&fIc8Er=/nY7[BD5\qoIqlh,bs(SgJBFDqe3<B/Jgq8[XQ#U$^;a"*P5Y,?o";-C
Us?"mY:@&18_e>PdWW2rEQYo3,MQkoWXTuDm]A-73'\7h3N-CN7]A6;Vb5X681%rU`<7N>f3]Ab
gD+[/Y4sW^:6mOZ@sb,\.XmFij7b>oVpK]Alhf%`:uA/>a/``jItJdjn^-F>;CQ2[?MRO&]A4!
`R,7gY9u*G?Q>H*X2Y^ED?dpe3/1%6>-J_ailOV<N-i2k1.pS'n,CRZ=h8-W,PEqN)O*ET]AL
O3:1O$WAFdc0[;k(V"L?.AP+r<rd<5<R13N@d;l9f:1MfWO:<m;p>?M?G#E_7pN7hO>E6T6B
s(p9p-p_kf(^FS^O*Z-:DW&bM6>HMA>-!iUBZ4!i#:3Ce?d^C^E)FcKk$E7_8ck4o7*"T_Yj
Nm&`7&`??heM_Y0(+JB4k\DbLG\0e>1toqm$9Z:/27.8%,t[_mYT@r@PX1r:C;eT18+`C0TA
%0G%uATS;gO'6HoC9bFhJk5!0geR[[Ff-k&Ytnb%2!+?1#k8I^>:C#8qtZ&9C_G9cOO)35q%
cpAQdISQ+Fc?u!(f(^_6'Y<SU[lo^+b`[Q`[)AWFSU$N?=.?8DkM91aIg8puRkAAP-.tf7jU
$'<T5_OB:QUDN\b=UtNEE]A1e-g,&+"8rsE'(aYMgj',:?"<N0C]A.1uD2c<?W)]A8XaOH[C%)[
>bRm;ulU\p/;.G$?$)JBeKPW=G<K!PatD`[)Eqmt]AOo:GP>]AtHIb)asF90#RD>[6:t6nGXYU
Jk$>G[)P5.aJ##uC3>`MLChB;cgFp4(jX,O/0nm7YA.Ge(]Ah3&S(5mL?a7kcEU^HcY*BIUBq
`b;ZUZ:A?L$gb5Y]A=c2HGn0pL`:VLl/hhEJXIK-;LjsfC[D."Rj<0>hUcu-'Rf.2Oqk1W'<1
E@TLhWN#(![U+$W@rj%&lRleo:LAD60+F5YJl/@Ms-4`sEgR3n]AJG6IJ]A]AE_SDMDXLG42[6;
TIPg+,KVhngS=Ef@TMM#Nop6BRsYT=)I,,Ls#UWK(g0''^b[GYBYAS&*H5X'^o/k-p2$QT]AM
:g;\r?$h7JGZD)M<7$8/*7f0A;%@.QaEhPZ+80qJ4nWGkWgHTIb09B!dV#W'`?hd5U"i6luG
!is8#i1473M;;rmR;oF&G*mtTaBWk^?j#]AB`5E(i%dl[u$qm>-Y#!mP=*a)WY9)b?;q2?P+B
8,kEiVF*7n@@UJBE_s+,e8/P0.0L.__l6]ADRe4/c44ea,E0"H&S*jd:i+H)pJRkI'NJrbSST
O9*="B"rQ6SVp.+V^)!`'9ha*bZ>2'O/5m"l?Z1^<>UBEj2]A1]A&?RY]AdFl_f'SRN:ol28?O.
U8#K`@#^+>#BSNlV]AbSOk,VZae;g^CTHi2XHX.$f897!0&ER^oGM,ZCgCgO<[O_TGfrMc-%p
USH<6oUG*D;6Q"'q&b-Um6nX"P0&8mP^'FpQ\o`o"t+@Q*\*<H(_gL,e,-Se9j-:3k]A>HiCL
FNV\)??f=]Ab+9fZoI*6mAB@j8$_\dq*>XtR;]A@K33=<r#(N%m",^D7VL\N#s-D1OM@nse"f?
=VrL/\rE=/%BSmO=JPiQ,m99Zf_dSgMep]AW)abbXpi*GjR1XdX(o>m=[h)@cDI,N#Mo7!TD;
\$8nHXU#,5;clcTe/Fo97JlF/!.G)Q3QMo4Eo?P]AF0i/F0)9aL#b"CDt,=jK(AHnhfAgu]Afr
RoVGLGpRsH]AQ:LLhYKM4s^0?Vq>*/j*(3A7Z8q)r[15+lc<5BfI]AgrIG,Co[kWT*B616rR"(
Y&$qFY?*0P.E_YD0JSC;=_-.Hn;p9/drWbD64I-qbl#95@:Xc7`lb!CaToGKK:Sp50FJRBk,
N-=mW#$Fl=f`Q[/;25[J=Q>E]A,q(UX;Z,7/loZ,k+9Zp54*)42%*3??RM3ts!TDh%Yb^)li1
`X)8c#%Xo1]A>8@#%u=f(S#!.US]A)DKif$mG.)h$0q=d0).-4c*MTg^A\8OIY\s"iVX[A%*0S
*'.YY$7`"Z8K8>n6lib?`n9WdY:PlD2\4F*6;dM9.iA&-m:VV.U..r#X.N`V,RtmI"ZP*GT5
)('^_OOj,UBIu9VRfUL&TWQ/r<9@&76Dh+M,'!D+h`?f<K@DPc]A!/+2D;P;b9LWFG/`sZO0?
!>]Aljp&hANE1%`ZFe7O53jDa!Y^k<QBUWqqo^c]AURrUU'8uW;K[,=2a%:/Pebil-&Q47HtH,
c,(2D6t?jV[eBu);!JWrHY'V^[t-M.OV(RQQ.h53Z%.dB?"iZb?GIb.1[%!`3;6$]A1#;QgS]A
ZX]A6AYK?q1D<`G70L?_T)N_=(9+oJ]A9="oB]A[_2S1o<V3F7rL&O6'_\=;uq?&`@Z[.<]ADoM@
4#_lZ:^)2BeR!9R@bM@,V=-kUm2iYBM%N6f=Bs%)6dg?Z:>7\I'k1`'Q,E-d;kNkBd+as!"g
uI\3SWm09]A*Ea@I\Ttf_DBI\PF?5RH.DB*;>JC&*1l`Z`<eHk/M.V>Bbtp(iSK6:qQ8ERmjc
N951<I*/0G&M%q75\.+fL0nLgKUKqQDZ'[s62hI561f6S)%9t+ep*XBil_,DlJHE#9Zdt$8Q
;%cfX.uFH2&$TPZRUKURc.P(3NCr^&hC'=g!]AeOs/dU67;-<M8m#IEeR]AD**e"iE\@'pYi1-
NN(2PcQl_]AikG3nA_R>S3ccVZbF.:gBb@]A=;CESd43)E]AZDM8I9&H`4DO$Jg3-lk^%fr]A_8+
gFH?q?<O+U*nd0;_!R#YKCZX5ScdK(]ANP:]A&3[f\`*U,`qh;2qY'>OL21T8YFhnCCZUP+YOP
d>;XCjAnQSq2%X30AA3E;j9!aWDN>/G=W5=<7Nj72:4=DBAMUN8*#$>8DVjoPA5F4Oq[s;4\
Pr94ngB=JSCjA26(C6tp*bQb&0]A-:gHV`H;L?SLS;I%VHH-!uT6S+Lk`#kp6kY%%miK!^j.U
?MeHpZc`>qR3]A+A%A6&/YmUiDoBqfMMT_(->6j>[&U)D(8ino8>OhF;&A#VD1:6ViKU*AY]A4
tLrSSO]AdStB=tcV(4A?@)HjKS4T+:7gY=VfS\g"oIpS_1Rm15?Ub,P3?%TiVLW:1P^Yd.?&:
Vge!Gk>X)2i7h-US7:^$I).^tIq*)=Ze%"nfFZhfC:AgFuAYB[kTTJAW7hYcHpbL=AN28MFW
O/k7Bm]AQDb_19'OA8#ZD7/F0jG3<Q`pK&Fm5o$RknVS2J$cH.T7<:VbM=qI`g!,7;66SfT:'
2lmq,OITiT+Rej"ITb[2pN[,pTQZ$0]A;Tfk<N&X3)`F'+Q]AQ8RHT\Xt#uC]Acbo/fg/Jb?84]A
rA:eaQl,CW.O"\a"(hED_3l,NOsC#kh,Zb-eR\3EFsdfWkAs6rPqZ-iQ66/$d"HRO?=TOh5c
bh7WZ$DqC]Aoq,^g:@$<6B5$!qFXUcnLk>r_35c[_Xo<?P+]A0oFMG^^hb[mIlK]Am8WVR:=><9
#+XV"c/Wsu=hAV9/*1Ua@-;>SrgYU`Y3$b<10M>%a\*Dg"Zp*(/IU("XA8PQXU>VBibY.O;l
h>R's.S0N<8Ztt3TZZC5IZ@>)ZSip?Z#(W*tG)iZ5]A3\6MZFU:4\(t\j1=(O5H#EMB"dn*A%
s+>Xr<nK)IO&.BlBHlJO/5#$7i0OZu!N+G:ZV9Ogg]A+(#>(lg=J3))K^8iX<h=Aar+JP&p5a
Zj-#p\+Xc7LiHWO0^>*DMehgc(FOt<hNr=Thf<`BaCn`%@X?gq1Lun9p9GO]AmibcYRef0O6X
h:`Io>0a1#'4p2WKT]A"p,.3>tn2"BgN2]Am+I!;hjjR6$1-u`GJr(r;<9'KW?BhjYa>;eQ0o3
o.[',DHTB7;Q:p&^5gEHllgPFc-_>0!g&i4f;GmAoIXaaS++D>\$fnQq05?(d&q>lH&bhX>>
ZAUZ/XF&%hmGUE=k:"BZjXH*25=?t#3$<<(@Is\kha6XC%/G2;q>6lO(T\/X)(;tJL&f-VBr
kL6TIjRkopPQpVTRd8fQ)C^]A^thXVUnAf:(`_JP(R"*#oZ/R`J)]Aa[2s_Zb8/*kI>q@IC+VY
A+Q+Ff=;Y3"tP#lh:9MFg_Tg%Q>8ZDb>;usA0CMeE,HV^cm,X`cYZVq=d1IdHeu<5HLk]A*mi
Gr@hdc/"SB<fI%<??,;AGhoh>p\<Jt)/faD1>$!nB`j4OLF>/FcY.n7lUu.=@A[F%pX2#n/.
`+l0p<A-[m#ete++HG\D'n3TI$Zr*BQT7j/UZ(D[VR5o,oZXMlo7!4ibPC':lJB="[ZP=7HV
6._3N6XSH"+!c:"VI`.dht_#H9ZN*^a<e;GtA@1Tco8qo%kj1X'):5+q!'^>/nc'I2D+%M'D
"N0j7;ujPr#=Pg:&12g9IjGfn9#IiTrQ+h"2tXj9XO:]ABWo[+6\CCWi1]AgR#NeMh4]A#NXf`M
Z[UUHQX8SP%R_AY>GReVk*&K(Y=,Y#2EbUl<hlCqjX)&c5>*Yuob@A$FU`==&%b8;/#()U<X
VH4ABO!L)pjI!?_aJ:M!*bQ0]A4/"ET`99rN2<PW`j3:+73(>8!#XkY"]AoXeW!t"Inu%860@q
+dCdh/@LJoNkudraBbJXr5HiTL6a:1bo@nc4D;7u$%D;1sCDPH]A9K[O[c%K@d.iO>fl7nB2#
fS$Dc]A4=%3_cNY/IWRXXa\nZP#I#]A1Ga/raB<:l2U5dpW#K>*icJEPk&'t%UhDY;7,un9:0P
SXGr"*>2A4HYD[V-h,SP-=\Yg7UW:l#WF`dX2GuGFNF*:3/"^:T79<PfHjd,a8ZK2/X`d4f8
&:@+tSa4db[;@@'J=Q1_S+pjn>NU!8j>(;VHfXC9_!YI#H;s*sq+iQs#Y9<u@C9MIHZo"Q<u
0q,qbe)OS\SNj,HsD$&uXmb@^K<_g3mdJ4F2#(i#]ADNR14Y)X>@&!BT-P!P'&t^1*4o4G8c`
bipoThjSY<U<KdAp)JPJHaXj3booG,=a*FSQ3Gg*tS,VWsX]AdVii?'_g?l/&(q3VbS%7cca6
b^>7r?rjINQr%6pP$AEhT15Cj@L-5!M&UO>C5\]AF>hBLa#LHh9Sb<.P,S>a72T^q[/%roB)-
GrENfWDX&$#V!^-5AP(16ER^cIhgA+cik^VKfFT1]ASP5iL^[j2\WLKD*rmJ?cSh`nW?5V-)_
6FYW^)oZsA(U#[3W$\kR^?55uI<"DY/:-Jto2P49r-DD7Xl`U\Y@%4[*"8>t/\&tR=S,$^Jc
8+RF+q,dC,U>)[dk6LirEO>6a$8i,p`N"5:>uNkpJ%]A1OHOYVag-AflMr8ZZOguX[O!<o/<7
mVM4o-r9^(eJch!(*]Am!CSZ[FhQ9rD1KJ;DD1:B5P>ViL5?ekVAL3(r\^\sn4NW2J9SJO`MS
9K&:s5e/N17W]A"huB7Mrp*egJ*SI(s7>`i,Nue+mZIN@I'hN$]A1o2K(fR+.QiD<BB`5G5qfA
Y7odDZ;<Nl[n>rQ*p4+I4J#>&a[=+;0ArssOGiP.J;Im)6CUpB=3:@8[ZD#=*_q6Jc2,sGC"
ZME8Qb>+Q(i6<&CHY,_CZ=IbRlA37EDllisp)j-F=e@RN8/l_WnE%`-(K@_gc2W]ATs4p5U-f
ON'5pE*OU`lh#S:C$XOHsr]Ar`;0_)q3:OL)o#(1G_V2pp');7%D3Z5Xn2u.#i+H:m;hUg#Ae
M+@7Kp<Db1;DD%D>2QK3B'\6#0FG>_ub]ATc7\ep/'V3]ADl>"YPa>PT[k;XC6PGHHRkpDd+en
q3O0J*uRsGgGtFch!a*N<V3$VE1^I<?#aLeKueX*Cl\&KmdHLI$Z\lL023>o/FS,$96%Xm>o
6(2BEb@NQ*dNA'JWoX='msduXLb=CX'+KEh42?,aF"lm*B#K@rNBXp$nhPd;)ZFepfHim*%S
\i5'EE._lj_J1&F>O7&O$;;"&#>Jh^3j8piPO_mWgEL#Ee.b;-,soR]Ag<X[->P/`OVY'`'ik
7-SNaZW?&\(&4//i(ST`M%/)%0J7iNc*J>,]A3;DP1[VZ4g%ZemR_\)_lsqjt"`eWpD;k2)WT
0jK#:U^c(.AB'DO[7F:DEa`"7&A\ftBD`(B0?bj*1m><q",P(3IVmu<InZ;STY0t\XBR]ATcf
/r)2-_WNB*r^:^kE'E4'?c\RW7Fk]AVgE5J#L(BV4(X=NG!e\WDeO3(bN#[RR)K_Yg7\8Y?*1
d,_/4pd"Z<n-I_A+*Ho"!"F]AAAoVjJ:X^0->_Q[U]A.r^XBjf#eH(2bNLOah">"Qcls]Ac@.fp
H9A0C3V<X*:C4jLYU#m36I56\VU%/@X%2$Gn39S.?DR<&254L-pNHn6CT)TL]A2h"FT2"Hc(B
dqSMp/S6+$Xs*Whh@X0KAd<S7$,4EoMB'Rd:cpmQH+%"4-Fs%gH5X-KTJWhGQ/-I=KQICG!a
0(<92SoRF(u+m#[U&2^(/JQFDM$eXTMXRIM$7A@<ra2A)HE3nRJ4g%.uPSC1A?-$>93LhKTf
Ha@[SnlHc'e$<4<gom*bo5!=+Ie3'AK>U&FP$C6Q)L-b:Sk4OCOG#4nN>icNg,^lp>?c"KBb
`sYVAZ8@k%i1eOm<W$)9C(FLhp!=WVh(MRar?:iN;n@'#@n_jIh=>L5)2W`oA[K_u^@*70??
f06a=#T6V]ABe:9M((ebcP*[V2a&0$8ki<:e2+`(00W&mbhTNas-']AKi9stsagN]Af_9=dPiU)
IL:$o%qOfb?k)1#/M@ACqVr$d=.-8A.rT$^CN-IjRKe)Hgd$/QY3R^RGDUrstt-XW08r61f'
.>Cj>k-ZJ.&,KX$*Wa0b>#WIMfjEa/LkahGQL[Bm$cK&UdF^u$7k:p)iVr*qdQ;XcXh:38A1
!%c7/GpE".FY"P7:a@L,bpU/56r`>O7[d7j\pn(aEYA9[HMH;/'2Q,+8+Fobl-&p8u&qU@#^
D4Q/_@8Ns%i_IW/!i7!?\OmQA?ToAsO3k?^Cs[t?)em9%Q>@"]A)0o>E*j`"8oDM#_p76jJZM
+@csP5OP:(JU1!_dd'!57R?l9qU.sP@MP<$(M=:0!@RMPCl-@dV)*)J+X7ZaX.f^1.c#l1]A-
1`")LDnpFMH5['RM;]Af@LEl.mLI]Ao:MUZ&37aW'/O>tR=Ya/6\>GA_":Imj4HQQl\*/h1ZWd
mW(_&+Q_,L#=t\X&72RK\Q_C(/gViEU*..]Amp1-F<O9M&<"bJ*!Rr5^#\67g30-A7ls5%@_k
POAT)kkE+[8)hPYj(X9#u=>2W!Z3*Kr#DI6if9Hj;,.Y"9aol9B@%F:IJ2#Y/F"]AcRbMs/=L
tS/<:V;HZ;*OYR-j&_?mTE)<?VK^1C"_r&LoK!gGoC4t=Z!pAP!E=(0#]Aluo%UZ^KY.T_^A'
aFfMAjdp_\[Wf<t2,-(]AB"[&96R,P]AVK+*)+pe_Ee=o4E$>3V_8=d1t0"C=I;"[/Qi]AJA>a4
267^5:"M^F+t*aO`/o@IFdmUhr(^(^!d)Omc#6]Ao*6V/kUj=')-rs,<(e?&_s@7hZY@/0hIs
iI\6j\Ls#\8*jV%b$BZKDLgA)HT`eAH_+jW(VV)(g>ejgVc"#5MY08rr&0,r+r.k^$mLqrhY
n)a08.Otd84rdp@NWOr31,-nU5o!aWu1*ogkVSSb%#B5/g'ge>iPp5']AYHm#\'i$8d^*<_Ce
%YT=p'gjX.!"CkQ)0U=:uFaL;o3#hpNh\.&!i#s9tUam[1uiX1P_W\%'+F&G%pIQ8d"'k`R,
Q(5A_K>pWR8,iY~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="631" y="0" width="339" height="298"/>
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
<![CDATA[144000,723900,144000,1143000,144000,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[144000,2743200,144000,3429000,144000,3543300,144000,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[动销率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="3" s="0">
<O>
<![CDATA[本月在售商品数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="3" s="0">
<O>
<![CDATA[本月动销商品数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="3" s="0">
<O>
<![CDATA[本月动销率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="4" s="0">
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
<C c="1" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="6" s="0">
<O>
<![CDATA[昨日在售商品数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="6" s="0">
<O>
<![CDATA[昨日动销商品数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="6" s="0">
<O>
<![CDATA[昨日动销率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="7" s="0">
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
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m9G!C;cgD.&7;ErkZ$gLR+>GY#:.c4Xb)YA[+4D;M-$a2B@9tABE@3<,`j!E77s[o/="ipS@
4`\8q^/3+@(NDNJJ3(P,Jpi?A9"^#U/8SEpeeON(ugfq9:n$cIG/SRBX$k=_iNQgYZ1]ALYR#
\CM(gr3-3ND8[I:ObNnIA9q&qk1s)S2qGcOHh/9c7P:!-nJ+N>7hp*Ve;?VLGfpeKbLTe8_<
9?]A_?`;267IFAA2L"io\6Wp/42'n6l368Q1I']ABrXV/o,PJI$P1#YiCUb8.?6*A(cEua537>
"0[$ceZ$PA\o!h`I-7]AUC!fI#<ME&If*.cm\,A+A.!RmC/[K]AUSh7)0Ul[G\M>.<kQEC54t,
Tn=M]A/&@9rcG/#!G0EEL]ACU(siV[XWH/$Y7@]AX,*ZBtL^!]AWfbi"K$b+QFhRjn5P:l*Ghfd8
A,2PD/YS/[L9T.T;KPggkq@$tOod,,*LTZX[RnkLW-kL<t/LUHP>T9rtc<O09J"(nYKd/A7L
D%G+*SlRG,Jd^o57NNLk:e_2b3[L2,Sh"OOnj-anB2u3=?]AeTt_(;6S-DHmFL.=m/ZdimY5E
/bGI^;_(n1._nD&s0Ss*(_VFiM+^a6W^a]Aa8HQaf<0hXMY&0VFTLsN/nCiP82[Z<]AkK1^FQB
]Adeq.0>a"MqdfQ8SGgrKNJ3%+8&k6Q\q2d)d_'JLT5mXVSMPsgJFV@""<2q1(t#rXZ1/1ZC#
GP!s;lAql?'C0K)3e]Ai.@qpif(u%d_'75qn?$GWhifJ!B@=f(>\9L%ID!/3_>r63LAEjWbEZ
fTj\ME.paW\-j1aX1fd=I`\K0'aQ$1&='dJ+.,iRlh_-RF8D92%T5=`puLiLO+`[TUBd;cRX
_X2A$n*q@.gnC+Y_-'u(]AfVC.7dF3O>YDc2R6bI?>(k6a!f>mZ^^rW_3[iV,fo%Hh!8_2*5H
h\E7Ej2]A<f/X%Y6)RG6MY*0\2?FTKW:uF1^IKWgV<"GRs7/iQ+t`PjTC4OaX%.j3`P7:\;?l
/ck=T%I]A/l-aGL3obL(alU`KDO+dRCE?g5PIR4/-c"/j8]AAe%)YO*H+.@,QahKC>D(_-Gu]At
akMo"-[D5p]A$2+5)flb3h_7L-RWHG_]AhlF;$IDM=RCZ@1Ge<g/Ik'Ve<Gej?>r&8^IQXqKJ)
,>8qg&9qQ0.;F?J_=WQb\W+hrOkR+eV-3b-rQ-M)(2;5A=,X++)ESFK.O/k&7*YU6dl@?JBY
P[r@s?2&lik3o]A1CFJT_]AqV%k'ZqK]AB8X.Bj8!+<M>@D:"Q1t\Q$+/Wh6?OU#]Au9\kh6VZ/n
7G_Tokcsnf?(J2p6XD+NWhgO+9Ag<l;!e57d"Q5WC/SSFDjb:`uHn^3'[I]AV,l)IOqY&tN0r
b@L#bnV404<:1P@#UM(p2_`qKa8#,Jl\RopJC<D=B%P%WRB]A(Tnt%?qC?l,*e`I@[A%a7nW7
^35E>e9;FH-8(I@QX!^!1s:AtOh`-a-fY\ienSXHcDeL"<FJ+AqA6";%$n0>5_4oZF&-ZPjF
s4Te7QqU6/U2XI;#V2/^3ji2.a_X9U::::GMiDEBg_IXd<Ze]AlC^OW[>hh[]AENp-[-*275p_
s$iaZ78?mC\)&Jr--3s#:)2+`YHW4hj6JS26h`\csZXT9g:]A'HV"pj.F:E@&o^sB9S__DClJ
s$;0>eYR#=F:R0VT=fbm>D,\eJ%*MmN1:36MiJJ1;L-_J@g.W*+?=O0o'UD.?f`Ld#si(7I4
R3O&GgdTZg>/A#6;4b\W9WnO-P)F(LHPkfNJWQ7i%]AN5uuV!Hk_Cl(BtD]AIu]A[Rs_ku/hok3
#h\ac0-BB?j^!E_.;.+m:u:dhW[Gk(n>UMM=E$rg-ZQf!MJcHePTm'+<\PeQ'G?8m$q_dF@!
0/j]A19FEe.qe3V1(9,%?+Pe>2.YVU3C]AUl]A=a.5S[[U>?lQXQU>Imb+,S1V+f]AmGHbC_h!et
C;n?kMk03AdG`.b]A!r_Y:JeEZ'7'POZ"4eF02Ko\8b!79^H98iZZ9#S6F7Qt\cj%ks<3-q]An
pL#5Q4fp'MTh;:]AcOT,dj'h=SN4h<F-CniSb'oD"INEBgG"G.h3^FVZ`$0s(M.<QW6;RXN"/
IGnJqZj,<bmk6=H'Qh-sq"ZdQjIjRdOc&Bi]AF>YYQ63dTBga_b77$0nmV4^:0S8Dhe!.QUil
;FR2'8KhIZCAuM6Zum-n:"+Jf\cO!0F=#eREZa+Gj.B16S76HbAB?$o:ujE/(Aico/j.DTr\
,/W@o$JM4#<jiR<uBL01@VdUA[)h$f]A\"PkN*NFnZY`::[?+E4Xnp@D=.,_=;h=B<f,j`iJL
5$l;SHagp@.EZTlraJ&[Q""=H^(9W`b4'*:WCN"`ZGF!G(`kF#HH=XO!]A\g5k$/e=?m?E)bI
06c+emV(QlD]ANm%!I;Fd"ahMq*?\N"r>@W/pNW&%8hCF-u%kbTAP:<8'#k[oDY,&5g`'<;HD
TV)tf1e%NB(?<Pdhc*Pfh]AUGXr-37+('ZX<A;m;#[?`FYTjGsq,Rk<3^Eb<uhs.6SXfG";NV
@QnX$<taV@"!Pj*hHmOGfkjP67HYpAK&I)+P+>XBb&k^a)YqQ&[c<W`l7c_^aTQ?kM]ADG`7T
&Bs$/s\,-I[Gba"e:=J4%Eb^GGG)ACLebPh5f9oXs@@*tl'8]A%&9>m!1k7-<@ie2/6Rgs/Z@
t4U%0"olBW;6iYCW8bRknN<76-L0i5I6Xl-a-[$3a!CBYYas[7l.6-1JXm_9@Y%8F4".Y]A*>
_^jL4>H9.S'4oES4cPa5\ZRuWb^R(g'hJHM15'l6Af2&"`d:N1BD.^j755nSsNYC)8_N&/h9
3id:7tmRb%^B=Y6:r`'Nk9kklR8:8LlMCctu5BXqMC.a'4HfY>EHfU#-5Y;q)n:cK9&f)5GY
TSH"@>P)G*##X3_K,MoDaMn50dd.__[jH.p-UDXL09*%t,PK^S[17&Ke0hCI-t98ZlmIR788
6nj7?Vc@;+^sUaR;s"V8@[ebDh4Qa:dP*[rs&H0jKYb3i]A673t/\N',0k02d((F"W%VI4#@b
X-D+fn!:]A,%A6A`?:VgPhQrn*BQ;fSse/78V`[*)\DoaNLNgln(_3cLeCfu6WU?(5t*O3f:_
j?bZj3po>76l^UY[?MQ56o'ZnSV@J9c_l%:r7-rGj-g"dCKYc86<<;(RJ4>f:eb!m059Y^<5
9X;d.W0-RO#4?:p47_D3lVPB2;V>br^qaK>!O^U>hR)I30N`r%ujp1(G/B#HAeO"?S^[SMZp
>9('^Hf$oLg`<!t-9]A33Q5_C/Yo3AN4afB$/i.;%J@<'7XQW3nEEaYbS"kp*6aNq6p!K=)(!
I8gBCO?2B>!<2>uGQp$q*2%1</4BGn^5CaF/YR+]AI^l/r/0RcS3iR^*XF4/bL^N;W2(Z"c6D
2UpN#)HSIZh"BXj#D2t[!c%#_t:Bm:i?W.!e$C).)gpcBTDrOKVWiD$oBbK_3e)j#-ICU(,f
M>IW%G5Pk097T_O"@^[kP4Yh$2a=O]A+KQI+fgr"EfMg;SU8>Y2sKSjo>;Ph92Yl0C=JBK#16
>@bpRd5,'U#'En+)M7h(0gb7'ipcUdi`D[Q"*MM,P=FjH+]As/5q'54g"dZJa-rdZpW&RIn\o
aJR<`ic8K+%@\FQMBm2MO[*YnO:Qm-?9)G_iT]As^8^oeE'OFS21o)%NF*%&9jPfH\pQ+YI`I
ePnWJZfe19"rQ[dQRq2e-32q-RfGY9;g(RX8n$L?u25ptVsW#Vp1'X&WVT_lEHW;mlYsP0gi
i6oqRaW/pqlZR]ApkhYW@-#3fG+GgS]AD2F+,h[**TpWK+7G%FDht8pgr9Pm44Dn@456!f^KMq
AEf#Ec6)ZfCleFooM,B4.pb9D5T>^H."RK%lC6aXDYPB\oOXN=23E-O'g)3q]AP.!1Y4,>FQq
69YCI8b-49`\I/gkc#N:)7jVo!GDu$(]AF3%)moF4N)Lt\(JoS@;%/]ALVk?8/Z*)RbJ,MEco4
q,eI0R@(T6N%f-!K8H*a7pfk*Xn%?1oMX>$6GK%b?%F`V`am$FaJNW9/^p``@NZ:5,20;lm\
38i\B"Sl4t=-V!Vc+rqp4"o,H"57<Mga`qX;Q0q*@ql+F^=-A(DIro5<&QbJ-2]A"?hQ@nM^Q
$%P;onUkkhkfuhH(7[gp98hiFmbThL,W#q&O;2o%-/WP%C>DgqgkKk`MfFYA#XiS$:QHtsD,
bb:&Fua[@14E:7b,T'HB>KL9Q#l0W4B"Ij9O\+eP:KR\/PZ#t:e4u7j)=LU*a!rKhF:$e.V1
T_l't5AHa$ELd$n$od1'7(L4n)j@$ia#7X(=cA[.QR7iJcp[%C9)<?<9`d=E2lc'uMU="$1"
,8RDAd]A;p>BpZ1Vn7H/p+Zthf3CM4'<>s9[16,Eal#A\YMJbE[`gQ9AA<7/KIL8rej,(W"0W
%F;Uk)B=H&A92Ie,YW,AL4>1l#QoVqD/?n/"OmmKYmEQ,&*DioUgfd=6SD_Z3+HZ!52`raB,
h&:TZtP4DWD]A8*d8*HlM%4T>pW+]AKLm*EDb:AAskfN[%G+(AED@DQ'8qqRtt"7kb=u<J5elT
-sJ:YX?1VOck;GW<18AUSWJ)eKh!RF)GaYr)k:W(RHt8+hC."%d=]A,V>AEq.U,qtr7<-e$Lk
e72+qW=#/G'N7OhsSqhKJX9EnE.bh.2e[7MjQI-i7*p@rn:gD:.lh`SFPp.q&8Ps*2]A>'t>&
(\"\/7SkWH(1t\ETVWWlZ=n#=lmVpHZM3fB3+_W']ALniXs3c[9WXlf2"Z2'OCc1W+Y^eY.hI
X->H*h9MGdCgb0W6LJRE[`6lk^ufA.H'.G`(&nWM2Ck,8Vak87C4N;P9kA*&0D?`Naj1q`b0
eNiDr!'#/(:*9VCOLo$nh)U$e!Ok_pWbU/@N:]A76g>%:nM(c&Qej6jA4G`F^s3eQFa-$2%:G
]An+)JY+E!bq/;6DkKLIOl`P+a8p;$7>mN97j&IY;TW-:cA/I9nY"GS8">E/3Z.50$hK/ch+O
rlD.P:8e=N[IBK0FH="pBC+h]AUg^_e(`k4a`<qcQ*(6_s?;,cW6>U^K>^j&gE5K6_B?a9G76
AFO3#_)qH/)E?O1;)_3mQt#h7:2a&3B#A:CS?jb5#]Af@2F"V$%$\;LD`U'BO3Xqrh#bj4ipK
hUOd51?82)S"!e&5hugJh[*qj@el[rT()SohtaJ+&q6rVb\Ck!b,;VeDVmbZ7!iB7jpe%a0\
\AR&j5%>SC@hhSs<boC!>jf5T[)E7P+p$OD=)6o8pBn5EXWntD@qe9Id/Smh:%Sg.<6(J`uZ
*Y9h>)f^mi-O>5[rQ)BP]ACp3c4T>M/Wl^Pj(A-T_t6$4Dag:V``(;1c\pfJ6H@,YS.VZX<mE
^Mc^@g%HrE9j!\!?3JV41k.G_;rk3Hn]AKC+N,pCE7lFmBPpGUkdhQ&2+&AmZ7Dht;u2X:3CK
I,h=jPUcID3iis#;9SL<L.pm<2X'F'J,Yk$qf/H]A-3!afJ]A#./'A:2I7r(8`8*b24Af&^WbX
F5rVofIW(kj2W8%]A2%@@GhqUt8']A9MW]AC5$B7i1Zdk;.A*NPUJ?Z,+4]A\@H><5H(?6j>;@>F
:,7'YT[o9;sC?aC?JLeXcJ$46Fml9JE7,F`L/SYC:7qkCYbP4?dp"$9G"1Gc=HM*VMC^AJ)P
%"Ftf[MJhr;@hWnm<WD.eNbj^\4M_cFmDa181*la"]AcJ7%<Z3O'T>pU`ETA[,O<bS"uEAN?(
i-lO/&X/%$2_Sg8t4C>#l-^5&QBK:tH>A#4T.(9."Kf,TEB_t%W;dll'rk\E.BUeo")BFk's
L'Q1a7+KV?Z.-?a5CT?l+mS7h9/%r6bY1'IOP!fs2q0rfKuG>XYH`F"AMmArUE--UhH4'>5I
ihIr'6LRAAi'VfTs57[_QcZ4l&;J&d(fclcqT9Hi3YEfdO6smD./`9/%4$dq<bua&#=oNt#7
Fi1eot#Z^7PG`#$8;D!@bG(&nFiJN)A/>UfS@#TG3glV=&BBL[3/c*_._d`8'+sh^&^[-3-b
o2+@<Cc0p:tLOGS`:!J8eN)YFVbk'(UGRZZI2dI<T6\Rj'Nn[`P6sCZsBc?Q-g(k3J#k@c5V
%+ht;FZGie8-)e/a>on(&1^N8s"V/UQ8h;0kd_V'_J,M,XJN7MQ$,Q9=hlsm@"In@)R@riT`
KYrR!^uP_?0.K26%0hCB+j.3$OV_S&GFf.o:eG&)1fqsOnin!]Agndbl4t$o3M&0\<%(cBr#i
S:V?8E!5opQbu=\KfB.D\9PI8^BSHobA8#*u$FXW<eF4-W^$@:0;?J*Gf8#n!ng*XEQEJ`kY
Ig2(G82P#M/TqoB3pb3o,1XUefT/q5l0mnI$pf9Ca#!9IA0JJ]A+>4fCnW:fPCKr6VtdQGDXa
/_T[Os6mAb_n*B"B:8&d>Vf%PET1s8H*^Z+G`J#l8,EUV?Ad]Ai)R*YE-X`#j#Gbq@9N2-D"D
.VnQUj.`Ztm'bL/<[98hW[;fF$3=SDJseoD2L\RCRULEOSlcA,ag:"FkbT\XLkJ]A]AD5Ur:(6
Lq=BK_5J/Qf8*n;8GPm6Vs*F0@Cfo%Rj)Co!0Vk\J%A@m2iE#qn?NEqQSjpr`JpT/Won1.,*
%$3_VrhfQb[7Q3dL_Z>jonTgas?G,1AuEcRfUD5k;1foqQRIYg>:F7^m4>$Au_iHeVd^_e>O
-%u*-+6''k:'D4!&SQCYk@P:=LnhCUR`\ef]A"."q3+kZAN(7&qVl328B<ABAFYJtORa90aaN
/7/FO:2Z^r_dB"Y[c?m:B!^N]AqC5S`/]Aqj%j,Ki^'PE[,n);BT)5%_$$g1]ABHq?E_3o7>MZ$
8Q6K[IR_?l%/S.i2CQH5^K\aRHiB0LfK3jK)(hHpK5Iq^KZ;\FOd2_TUSX]AfJKCqK-s7^O>R
,uX^C_s;3GmN#<in&=29doY?GJ(tjtP4!:_cUDoUfScKT'qik08900YbkpfCF'C0V=q'fu\;
Re>a4$tC4"J/c'5?q+09O(pKT@q0s6_;Ms!hKtOgY,$eVN*``!<O5p@Vd(84IuSIk\X<#h;u
_JRuJK@C?$:XNJJln;E)r#UdPf]A*#2%o&H(>8iV!>bO'iXnj9().k+eN^nN>NGTZ"ZE:-9Qc
&o.tVg:qVl5%!TJo^?oh>]Am?Pu_ukO+u\8O#K[7.p`_N8&=b":ufSL;ORLtRR@9tHGs3j!";
K1o9G]Aaot_t"(002X_tW28Z-d=-D61+1QKcRHFP#aE]A^8>R"UkJ1CH'pl/BU!hRbN@l@HVA^
Y<NsEMR?mFEFrJo'j\./^4H0sh2"PiS-,Xq?oeOL<Zl@AC_rFH(lQ4_6j012V9Z9NTKQkV#?
e?kLLeFkPZ`WTcY4\aMs1"@E_4;D)t$/U#?lmFR?^8"#`#ZqqpDPnB_g\kh/D4@hG:U5r#$N
u0Z62gEh*P]A6<Zj8g(o=;/Tr"//TND8ml[/#</O)nSq8.3-L,G9gB=:r4MJ7f17H"ti6r%\1
tb,?&OR?Id9p*JTMdH\XUJNQSGDqBq_rJhfdWuH!L6g]A\JWWgg1O\C0&F[R074lYhc/L%l31
h7EV;LkgBrdE`g53\@R-KJR?r/VRaBSUMS[u"eo/T,/Ct,Y<qC>?eGR#TG\m?=rl8qs)kfH7
nSFpL+4CC^C&ptHqXb(PAM]A&N?7Z-kW"h\G_C7<.6iVsl3XbW9D.r3Bp!U`A(mP<S"ijipMh
.9HfLX!IM4X=)B^6Ne!]AuN.cQq[<&/Fo>h2L]A<OXHQ=!TH+`r\9Sc8*udUUg'`HP3VRG#r]Ab
-M!+Uj'^2H?R#1XuWHrk)3fZuM2.7DJ[#/>+B)+TE>m?G8`[a(YRG$r8.6)e9DTa\2UFt0,S
bsuq*?WN!Y57B9LD=WsI[cT]A`s*=08"QW(f/]AFI<,OU?OE2>P<RJn9=2nVlAk!p)X^EJTS_Y
@VJ5f"TgN@j5YgcZm/(Vh#RKVZ<g*gs`-KmLIatg\lqX$m#S&T[3Ga5t@>F8fg);aJT@A%Vq
g8#e1_T.9([hHu+CmB=gU@/Nh=4QjsL'<LL*l35)R!<+`%)(gjk]ACAJRXh>F$-&QZI_XJT6P
Tm\NjtdTO<7K6C;tRXlKR0hos19;/-3p0eiEGo[d9RbdcR&'(fn;\mF[oiYPdiCOL&r_p>b=
@O08J?S9!VA2:!#I:0)&IM`RKancs<c0-5j0[^5tQ7r.Gshd8U[E2(D*oiLTr]AE9$GOu>dl-
Z?kp4WkuoY-R"l[NfdB#Ym-,k*HuM!l)#EXWgQNp0h^RR!!4QCK`s(/TR,QH0LH1`(euMiHd
W4E2[t"YNlE(TTA`#VTMLr+h`)D>2fEc!_N00E,mP-O['S%(`iooPNB1K#GKkcLg1!KL$0%.
\iYmbJt\U]AGab9HUl:J\Q;*1e%G'a3&BGT7fLfmFdh:e,X^R$3?m5YT<QoWOXo:2:F>>"p_6
chBm*9KTfg-6.Thiai7C\krMa&?m(L@\LhS'+=E/XNFp\aGDDoB\e>hLjE\^V,f%R'MOFfto
Q7^ah`Sb7TcIli,,eldHdVsOjgHltBr>n=bC"I:bO`FP9WM&(as:"Eu5ciG\;BQp4Tm$k(bH
9mgZQ.-Z$r?J;Q_QJK1Nrf1Y$G\dVqm[EUNXe%lfP]A`b.n7&=YcCI#8(f]AJlmfdXf2'u)@"9
udT`q_l[aS'^/Z9>coL7ZB;MJg&h9h#Nm]AQ=*gUoco.GqIZ,4.)^).>FKOoAE9P%$6$,YD?.
jZiE!!XYrc6T+udH5K$P\e-WPW^s4%=-&g$?kF,+`dt62!T;aD9d!(+322Lch*q[039g);pr
&N%1)&B!c$L"[b%tO[AcAWNb[Cll+5FeX3'P2%Ll`V/Lb;pR*Z\Am=Ws%_]Af#)I=rX&@rJgC
Wn%+9`Im>qZo&;#tG)1dP8`:LE8G/1!%YOla@+SD)'.2e'Vk*1jTNfUj#t)oc.,L>h491-_T
u8"m!1*S9'`1lH!"WDe%h?Ht^Np=HLDmtU(>BJof[K%8HKs`.+sMbFWeL"cC;#mhVJUsbmGV
pko^+`W0h#-'M=9u+r)0`(/e$tM,3@[>k[$2d^M;4p'S(=fq(XphAV;b4b@;.^?Qt(JrFL$U
X54>Z1-AEA#C>ou(`V5HVi-F/Qj%jKjJ-(V7?\m?Eiqu:N?mlS+u2T=m\fOUH?/sVMACi,8r
<n_6`i3#41E?+@Yn$S<U5[e+-A/9n%COp$P+EI.j0QM>LTM?b5+u6D)?XO-XR.RGK/:A2sOf
<DIWiBcM.Dm)L.5pL8g)n6L4C08Q]Ab8U6R]A]A8^K1^A"=`2=Jj1#BQ]Af`GAgXTK;`R8-$#:[b
B63<PgU:ekFIMsVbY^p#)j&pY@91@\i[#`6+D2CWJ*DfBaBHDpf8DOMjmb1M4r=cFW_QSN2T
t*(k8gl99T]A.ZMIYlKa1IQUYf)&/eY"RD\,>3UDicb#/\?!U,;&O3U"%'lS,ooG^.e(;8e,>
[R.n04&>Lc`BO3dPEfq+*g%41hDAQZnG!A(7n4PrmR%mh@"h$;RgMNh_T>H^S.iW0^e.#X`@
Uid!IWlsfKB9bl-NPCG&2o>KC";8XF`RNCbeG<!p*:&Q#-kC"2lW=2Rad_S?K$'dN@(_%rkO
bAqPUP'mck!Q#kQY.Ii,@:"[7?BElfs;hZO:^!0[62HbZ5h9deFaPdBAP9*9H(&nplUDV,]As
3@DSd>cU9Po(K,oG",D23JJI2moDS#rn<Pg?^o9Q//U8_)p"X\u^0F9%1MrRU%e0Mha_h$r&
FYa*.fHXgT%NSDHFI16&2!7B^KUfc8%A'Y(Q$od9_dL3B.BV!>e'Knh-Nm8ISnOiMM;iK_:s
Phm7g$W>d1A&gJociOWb!us,3Eg<'>UksE'`_l<##p)Dtfl`U&&-t%_d9sJP&K=9#Z.N*N5G
qeEW!GeT7&%ZB`TYs!G)_mP.kXtUT!B,Uj.uj;hhJn_S:pfeo8U!+91,X"rZ;~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="631" y="0" width="342" height="298"/>
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
<border style="1" color="-4144960" borderRadius="0" type="0" borderStyle="0"/>
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
<![CDATA[720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2592000,2592000,2592000,2592000,2592000,2592000,2592000,2592000,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[时段分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="1">
<O>
<![CDATA[日均销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="ds2" columnName="XSE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.SummaryGrouper">
<FN>
<![CDATA[com.fr.data.util.function.SumFunction]]></FN>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" cs="8" rs="10">
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
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
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
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<HtmlLabel customText="function(){ return this.category+this.seriesName+this.value;}" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
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
<NameJavaScriptGroup>
<NameJavaScript name="网络报表1">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters>
<Parameter>
<Attributes name="yjfl"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$yjfl]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$unit]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="900" height="600"/>
<ReportletName showPI="true">
<![CDATA[/coco/table/coco首页_时段分析.frm]]></ReportletName>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
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
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="40.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="HHSHOW"/>
<ChartSummaryColumn name="XSE" function="com.fr.data.util.function.NoneFunction" customName="销售额"/>
<ChartSummaryColumn name="JSLR" function="com.fr.data.util.function.NoneFunction" customName="利润"/>
<ChartSummaryColumn name="DDH" function="com.fr.data.util.function.NoneFunction" customName="订单量"/>
<ChartSummaryColumn name="KDJ" function="com.fr.data.util.function.NoneFunction" customName="客单价"/>
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
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
<FRFont name="微软雅黑" style="0" size="80" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<f:D;chOnkOO+EVS?$`>-.iDa0p)EWHa7BQR$G8R&O+ANjXgD8M*Q/gscTQOQ?>Ae#'74==
mDQ,]A-JV/Rm3D:^P6GZr&!b&-N%[&Yb+Q8-gU;g\LREVc=l(N8O:)kB[&ISk"$gPJ,RSlWrt
*f02:1pZFBmN*jp.o`G^e0]ASuo^%dp!*r(HKJHpYLIdk+f/+3cKGn3$!^$;F1T7<]AIb,ijgG
`C!(qUd(Bs5HJ7Q5A.-&f/-d]A_0+neqXdLq;/(s5DrWKr5-&NjslrRqIVt`dD:UEs/Tlt0r&
DVi<K/@c.D6LF-$f]AE`;`0KioA.IlZs/SuYjp[*Zo>V:M;\]AoQ<:lVgOepd`%4f0^1HNF2Jt
n.^"r=-!J,AHMFYbT1V+O2Q-KEV?F`,B<F<CEn3olA9;+O'KYO$[PV,Fe(WQFD%Q(mMW%Kpo
&\%^Ji-T^,C"@"QSn@D"!sPCS>ec<cFTl=;/UnhgWV5-0^OeFj7i^rtJPuq'GS;_-u0*<kWO
$"Ras+P6-.)pn`D*'r?_/=1H"u,'.u`'-jkigDd@-9jFaCZlt]AA&6)"CP*N=bVpJp3Rr?A-,
J`Nl/^?3??mi+XkCOkX):s$(7BXOWk'63Y:jc"me*M.)=]A3e^%=uHYkM07L0h8b/Y0$R"[&G
]A/]AC/Cb\^Z$)kd<'l0:.Y8W;,ti$f)hAbh/F$GZ)KN0nrKs4bqa[AWOqnFZB)q^915Rl%W1u
6XoGk[JRR^-u6Gt;X0@WX]AoGBSsK89DOPE-PN*u_)NgrM[i_dZ38gC0),P:_UF5O&48>>>;s
uhTEkGGeC#8BTo)(kum2K7?S\E>.+6R:<(L6C!=*IX.</I6m)&=U\gbM^&^%juJXhYaNi8<1
'*e7S0,la1^n;^c!o,dprK0ZFfo"OdQVn:D#\]Aft7R)A\l_FF3lCUBVdb;Nr<lg5Yg:=8XaZ
FZtjJ9TIV=K?o\dtdEcJ/sE;k1`\]A9\?S(]ADUuq=dsDhI"(I/qSlQ'Q:jWoA3J[Yhs0FgH!g
")U-?b`FS+28[@RQ9A!rC-H#9/IjY@?YG(+s/&_S9;^5uQ[qf:`>IJ%I;+]As]Ah;R_nif)@Ln
lLCC-dj;egVfQmm5)dP6SBY/c-uWR?qmj^1pM-'3I-QAI\YQ`Ff_2<";0mU_cL"R!,a>rRT(
L\k@t*J":%RX6"^p&8]A"8HuUQ[WL[aZdIDOl)d-MXM-7d%*lg(o=fp",IalKp)/3QpeQ,J.m
[j^4;pGN]Au]AMDPn=pr.O8gl1okQfiY=q"ucAgeAZ<q>eqGd"'FqP$'lq[$9Ab"M,q1q?X'sH
$96-M*!hASt0pqgm,T+(Au;bL]A!*rK)4Wj1O1cY>qc5)1.Z*j1>847hp0Q>pfV;cGKYSqm.R
j._u,OK6Qb%^<:V=&@*D:!c\XNTM(A**$k`L$XuF.EWk5TDZM=;UciNifDpK)l<;%16HuVnJ
]AYnY$b'H2m-Be7o!tUN@qTkJUBr8B&`#oOc-BmSd&;'Keipg=Zh3+XZS#ma<Lu.#?Adl=8-a
=lbL^DMqTPr"c@@j:N@qXNioJ2rR_aK"%-aup.UJ=\tNX%ehB3SPqo$Qaf/GJ)o5*#u`2-3C
k%30sN&&n9Y?9;'l&6+$B[WCX\lYO))M9u\'*!,jnQ-JCZAWJN>K*qbK^U!R75`DUp`P-6!?
Oi\:QsZ3J49,PMII,WN9=6\V\A"U/2b`q!Ls&eB]A2*ZQ4O+W!4c9JU.XnVWfU<\n&XW]AnZpq
Ei>iNo]A]An1oW2Z$O5Kc\Lh&;Faf3rEmL7nRZ#/(_:ogS7IrlbfWj-9t)I0oMUJ3.6*\d44:0
[_'EJ,VGKBELiT\478o1.CTQ\/Rh&hC-WEs?,".''q"hE5tR@*2hW=RTn9+06/ro[aJ"i(T9
G*!"nJq&SuTd"k_)p-^R/S21dsqr;H\<gU:l65P;tPJ,@D\?q%,(OeQBEi.ru4*,F(]A"r<K%
3A#'=R)m7N'5[QLoM6J@=$WN>q3KpVid1(=*hdgJ,32TtaH7!%IU^/@n<9Y'?j7(Xo[(kt-M
OCY)@J+8Abq9=)hr7l:(D?PFNqKjTi5/qF<Ti<ib)DUc:r/K`3_sbR.WULr0nZ"oqjH8ZH::
OD_fR>8k)fIK7sVacm$5`)Q(C9?C'q.P<<ur%3EF%OcF1sa\tig;?+jl9;^$M2Dsn!WSg$]A-
A\AiFhgGY94dM#jdV)(DOEd+MX1tiX?$*/spYEB)cVb5%b`?7#"a^Dkc7re,^en>P6;Q@hhn
=MMr($?2]A_[)`IMXpAjh"6sa8RL+6gAVYZ\-FMaNnB,]AWIPG*IW9ol^N[n$$83BgfKRZK+F1
q.c[@U;$Pl(1R(K5@[WDsDt-dJ_itY<CV;@+Ip!M<YL+jR&sNo<aPN&72POoE.]A(PcOne##6
n<MV'g!>E"r>-t[6IV..skJAYqp"-Ak8%EK+!foHClW$5J=sKUFKkQO`P<+EOZXYnn7[)Apt
XT=1"g1C)2-nIgqhY*Qr@D+Z=WjrCX2p8J\\roJ:/E(TamQg7OPYN"A/\A`_-H*^0(+ekFOD
@GB/KBTQ$%@ucalN,<H*[Js\,fVd?O^]Ab3/+W&K7$PR((0(FQTXT3@5.Df8LL;H1W8-K%$#i
9VL1H<a\[Wr*P,-5U#TW4smF)+i)55Atk8\)n1_?O\A&t3OUC20Y7pcU*=E&a8P1+aJ>\!5X
<".I/>_^6qN_]ATQFOu%m#5u0P7-]AajE+\lGi"CI7(.YOB.dhC\$,((jA0\p@_XqA\CF:PJue
p=FN2pfkscY!3D#[79l8=.!=,F$T>X7R%W0!J6M]A]Ahf33WI@fd`!ZJGTNN%h[Q\Y^s9;aoK(
;CYK3O\beLRNratl5I%t>cmB-JiAQgJhE`d%k*&%>hWiD`8TfHH`q.:<!A]A7/&6_"2k+c]Aj1
N3po6j=rBVe#/#d\r]A2_Y[G+In4T[+Iq*E`*69RhM=/IC3))fN;U&>r@sCrchh!J9?l";hm^
R[*Y,dUGbjZYjWD6\&]A0k'V<P^>Jji0p40as]AIV8%Xn]A599ZU'O?DJkS0RaIgqSBDIRE!8A5
QBk>=AaR:nsmk=F!Rcqh<TI8<u:&M)m8e8s'A]AD4J1#_PSEeTH(pJ#`=\sURW!bjBC7ebI8b
otbSZKME"1qhq#rc"7!Fu87-<efTeo-TtrVicpe6]A&m*N%,P=igE5:nb=,8-ER%ao8>Z'B:q
]A=YrUF47X'sHg6!qIau\PV$2j4Hiq%<kh?X2^)j`e\T4&0ZQ!Ik>#Fl<)8EWQH%q&.J(G]A6D
nbM6=>i]A]A*&N6_$,?CoiKEEG!/TA^qE8Yrl)6q)!MF=YOLhdmOM:mS/7?dq5a$QJu*hV/a@^
7tR1JMN$N\+OYM`FCqJU'YA(S,"5eUDMA=.F``n98a?JJq4GHV4l.(bEL,-+B;WieFIOKim6
2\[(Iigg]Al$3#`$g1L*72A,,"pT91e6Md)X=Y>eto=[D-]Ap.-2,jIe+b]A84g^<n<BOM"0&>a
'bdbPRUTd'BWR=c79'[hGiFgTKhIjdm"d8cTH-_n?kPf?/iNF0`t5PKCG#U:ns[\r@4[rr?m
A36*k&ddj-"iUq]A@4KmA?J+i'F))$2'q;,WNVa06(IP?=0APpGo/3gR"!H>k514JQORH+U3[
rX(RMoj!PbjqtdJqAiOG[n(-(QoH.J-u^CYOl/eg2-$NP$*>1>W1i47l;,usRb<V=.!kT)/0
XgB!]AJS#iE3.GR5+*O6=##ulf?t6q_frh?uLHngC2^FEgs;0$VtA/O,@iDBJ'm?7!E5Pdl9t
uVr"n`'@#]A0/Xd)=C#R*;)kh[0@W-4D"[t>Le:"&mHD@f#A:iC'OM=AQmdQVuE$8$<Po-\b<
\+Qr$n"cILqXLe15id0?e5MLj80EF7#C[oQ7Z;f5*T.>(?eYR[+3F85#NTLdYW@+"g=Cf?c1
lP[?^60^+7pkbcc']AX^ZIDHh&8^rh0T*q0e&3YYabC8\Cp'K!-!(o\I*a_$!Jd1b=%uIf&8[
hif6Fhlr5X\S%jt$+^hNrr)92$X`ajm(?;F8dZ#3$1uYIVFdB\ks,:b9`q9]A_@pX?K87%0qV
G)[@%PAcd#D@fX]As7o=$,>#AYpf)2:a9*:NhYr_g`A[)VEu<]AUT7dU1qK)9p=rmG3)K2e.[j
BY@h`CVcl8q.W;jPb;=+V;:@bmMI#8+f2W1(cF:JDI.2KO:8lsELQKSL`,DnMlKg2`5`s]Ah9
pOt2V(?l`&0Y-<dHjlW+gW3HA=eDoMKg.^h53S0l%8ikE$Ze'gm$!TVkJ#`/:5`g'Cl@R=0d
HXkhAW6-7!'ughq41U2LoFgG%;0'9Y81.)m^*L/b/"X$k4Kju&9.^s,%[3]A!dH=U/Cd$^r(f
DQ1s>l^'S7"IURHCH9)m;J2Pj^buR:a,'40d'lBVpls9!m96[_WSe".jG>]Ar<s>"c=H]AQj1i
SFA^Z'g@(RiLQ`D="("%lrS595goQ!_r<_L4I\f`,r&g$o-@cPN(h1Bj,AakH-H'Z=ub5VoV
8JD9l(JpcVq-!j(N!WE^aACl?hfei?LDgZb[-,IC3#5$O4+\V3Xl?2cr%qI`91>6%,l+EImS
?Cb/gSI*BdSUD*dYZ5^ro7S0UYlkudZ%lPRhX>%I$nPUPer3B(%uMY4e3@^G.Jep"QXVgpDU
,rF:)i5/+-l:@SQ=uO\]ApqPK0.FX>I_6*f_k4W:jZt)?([=$hA]A"="+Cb#3;MTq%.\-`uR+V
oH5RahBjB;-ckJcM&RcY4G#]A/M-,TbR,5,^7:3m`f;s`tf_OYmIh#^/#7?lK[<`TZS3hsa@'
HiC(@$@:gFH%]A<Oe=&dq#;C;)Onqb!@/k5B39.mB\tncsd'G-!>E7JqgGu;:b$q%KdfS$(+b
P,RYO^MY\YIIFK=>TXoI@a$Pd]A[_aqq;0)ro,8gY$CYs!G%&O0-O>.Ee(fGe\XcUp?XF`7]AN
ljcY,;7M2k:I/rbD3NU270&RK^FC>Va$8tRQ*aEg^4HD=[-E%Ip%cQ:nPV1^9CdamCC5>+L4
l?YjtIq3T/Y5Q[I(CPSqdk[!oH&$+WOSVIGiei\L$;FL@4hgY%Jq2@qq*rY_=JgY:BYe[`Jq
FipruQRZJZ$iNj8P[M%s'Pp_)<$iI/J2(4?j;a%*%lM*<rNfBHR<n%2Z#Y0938;tO8O9m1G7
*1P*?j'1KG=pDG`DR='VG*lRRHBP?!`Y3R)eragJO9s:JPS"f$$pT)2DObR]AEnGA\"q7MJnQ
[q=11<_!QQ6VgXh]A-#ma3WQf]AfoG]A=XGDG.2hN(*<GG)C/::B9Y+HI<DHQ.+@r^L\men#>f5
^$<DW*`cX%+pHUmRP7_Ua9rl$$,TQRn4;]A,2+1N/7\O[^aXrblf63W4?;V;>p,jsM67RK>jr
>:U`h70HSA!rnGVESFLD,:WMK&V3_r=</_-mIX?SWn[hkb!MA*e+Bo.&#^#NU%*K+DKM,`bZ
#@5TV:+T6N4q8r7R[I&KKYJQ??'GIS$MCZX-/PKaS&dA3S7JD&PW%2041Ic&P3GID;7F'q<A
%VtV9lqLg/RV<5C+_dR8GLNb9mW1Db>Rk@LFllnu29P>+AGFfoG5]A9.3t#Ni?ic%'eJsSCpg
jeSQf"4+U+G]AqSn+0[O!,K?uB[VUeaeU_3eV6PH:ESSZ>^__'m<Z5V?d#SEAh)>gB,/1qsN@
$UGp7$tb#.N/+2UQX87g+]A*4)6.C?O)b6J,T_tC=T.CR`dRA4moI-Vkn<c<>"HJnSh&VpLYG
>u8*0%Z\"G?k"O:\PK'-%5%'?%ZCq'6a4YgEaCF)`ZMsp*@\75$*r[U!oA@CCi&>;2X&1jo!
]A_2N13<*$(XB*[&rM0FgWX-7l#$cL:0IAO]AKUu9.h+ad+.mf<s@6AS\4Hb/t-N.m.iK_htC&
1]AVBgoEVW\.k/W4W&%HSF(;2hFpLYaLf?TFnu^PXpVueaGX6]An?[Wnh:FDUSsn+c7]AuBXng(
oA_oG/_`^?k3$Z6hAJPCNf=O=>H.r"VGcpa"L"?7aJ\ZIKHT+1kIKeK4n22,jVB+1.X)*jJA
"lT=mth'9'`Q;W(W"oEX64-0KI;.8kMFQ</1Cb(B5"rRo%0n(,Xq^OBu5)L8_('^T%"+*9-Q
i['^(DH:Zg*QNraM_T/rO$)-B4B&l2B%YHTD\7'U>A:WTb8cA]AGA1c*M,;D`:b['2+-"s4qd
(2@kS5o2bFpb]A\pW*t0cI"3(;;t<pS:D9g/1#jTRZ]A4*)"GEfV2OCS@@BJ(DW[4cG`AF1l\o
W<dRB\C&_iTu.`AuE&#g+VNRR*']ALHVebCNWIa4f_j7ThiQ2Dj2-?TA>3Tbg_B;0Xi=tne;s
oeDMVfF8ht]A;Gjh@>H-/(6'2%3L5?fN5BBG6'bZ?JrA:T>D6e,*4Ms]A!EXs<bOaNkbePm_4S
=HOc"<N:\`_iE":6@j3&%uiQ%CV/b^XJ_o16=Ocr[7rsoR601?kXkCWIp!>r2=rGT"lTG[5F
6*R>C9-JKD*,(gBFl##q_I7U=+YrW:SFraC>sE<eam3U&&sd1sP_mJ4KYI$i()[u/i-jU[dG
(FSe'Q#^N5ZKqu=hHSHr%C3>(T'W6f=bD&9<D=6*/H.S#&@O*!M:+Z)IC>1Z`;p+pHlZDO@o
aI4'<VrJWPD$co056UjN(qZ/aFh&pTQ804Od8)`:GZKMd7)A:*@F@'6uECH00:nZ.M"[hee?
iLf(*d08fi+(_Zd0.B<snZE\#&CG/h@!lD6t:8n/@]A#g2M;%&P1MagtYNT;I:D@MKE(SA_WR
]An4@#lo!_Wn]ASJOF^*NQtt*,MEG8A%<Qf)_pA[lRg=r#&C]A6(>TH.>OX5i#X`3D@V[;#o+f!
XQZWCFPKU9g/\S`HM<p-+[4.=RY%Hi3hoMgd=\o/KcPMBi$=*j]Akf/VQ7#8rfT1_bFfb8Z!B
Z`+,/5+\9<=&kF3B/$\-.D0opTcF'&kQ/@[[?i).N">[i+K1_B.DY7HMM=FDk@BB7&uXMp$I
GEMJ1eE2n(]Adk[@e;<L;cZu?':(Q:p!=U;#++iF7sr^XXWh8fm%!^27c<&O.&.eE/PdBh3a<
4kfa0a2bl1,0!+"(2,O^:"r[RlfI(?r$N,=H1gMcMB+j\[:kVb4c;ec&T0Jjao;rrf+_-9-!
QEFF!s&f6/6J1<bha/4^a/LYKTgc9mV8G.O:S!j&R1>E=/r8UN,-'VGU"NK>6/LYJI'k9n!,
3C\!"bi'?^*0,:Yq3CeDb5$hC+]AZ.d?FfiYG_!eUV;0Vq/(h2/FHAFCFMs0W[I*Q`?Q!D9qr
8f`jgJG-7.;.^51_t/u%M3NfU'Jd\rB>uGXg?"ILk5&su,@d*.@/3;X?Ra\(M?(-jEF#J#Ye
jLe;^H,r>0O]A`hi3bHj4C]A#&qF"Z`"L*QZN:nRHuKOqR0_E#Xga!*3P\.bnW%IRAlnZTP#nJ
s6=+#2ia5Z]A2Kq[n=2mA1m1fZ2Z`=3ZZetVR\hlQR!BG"%&.(h\ZSX441.EsG$?-GbRSGabA
DGj`WH4@ELM#E`C,o.dbg<V-H`@7ZSQO*R/D7HMn>m:aLR`Ar<um;K:L.hGK+&Mhl<c"57+c
cYkk;KARl`kq3._a,)*o"j>j?3)USg\\U$@n?$M>kJ24;'WDEZX2l;m>%GEN$g&KJ0Yeton5
8`o92*+onFgK.f`a=r(H*GXIN,FH1hP;'X7*RIM>qUD%;!mHoVig=:X1Cd*[h[:3n!!&Le6(
O&anXr3%_=TjV"SBg#$Bg9)ggbM'>6V(]A3233En;3>IoT:PJ+L?n-5-)o;`'eH<icR3"CF^P
n/o]A\.mLMI+EqsZne-p!o+QMMdPs:04+7Q65JLsW]AaqBa@)8inVBr'9,TRHSkhRKlt9C>S.1
X`VM"1T;.^jdQFFJJgKioMha7g2N<\h[b@-G#dLcmc/d;T;"'HBQUmXl(ASm[tQnJkmP11CX
n8_'FSi;97GZ2Lq$^^b4gf*"%s\%jkt_BC!;4Ssj17qD;kCXI(,a.N2=jA46rbN6,%%7n4X$
kN8l(OZfJi)Z!0nh[63+TZ;t6J_)SA2NBkoi9RSCW!6(S]AFa8E2DAjAGa^M;l6;L<j53_C^b
ju/CH/bt)n(oP.3?R?E.imH,/r,q?[u#Xl[rE4JK&oYiD"*G8g7!h$)XcL'-$#lB"OGW0!1C
fY+ueA+[7n$;)1A>"&bn'JcW%]A?FWbTe4]APG`bA\sm$f8131qiU!%#$'8l8fL11d=H8jPdDk
P:1:\.3)U^_"ZA1Vb1]A`:t4\$/U<RN7M?l<Xe_&=P1a0-jAg4-Kuu*0/MZ=^Mo]AQLB392_-L
30UD%Z^8ka#?4KH]A6'>@R7Ak=I'9GY:e7495#MBmFMN,`B8f24k%ZQhr%/o)B]AYHN,!-1pQC
.&8G+7Vb*Dhd'JuH.2tJkSFe=%_&P6XGMh\#DA[$3AS*Y\j?hRA'\YHThc3pTpc$\KY;u]AaF
d^-ON`@Fp44QaFJ?5f2#)f(6%,A"HuGN`&.?pH-]A3VLVeOcb*.CWq&*^fe<-9:N%"S^2<;JS
/O,I&%"8cUTrqFH*,7,9Fs)t+ZlEZ7[D^*9XT<$"rN[OH)A19cWaDpug`MlDHQ@d]ADr[:2><
s]AVjSD&2$VnoWYUGbof9+<lI^UH;8.,C(B)*1`r=LS8Bd9("N"g\-\0u/[<0:M8\!AGB48`l
S?Q992Er>j&d!$@h.NG^P/Ss7(NLb^2d-Pg`qN.sf;+6lAm<D^,T?b+RAPlR0]ApR\?N>^Tbs
83T;jh\prDdNNldEKg-?$OG)$1*\^^jLj$Y"j8[i,6VOdlUdeJqVK@V$)=.QVFH'a,e&1b6q
-F&5k7h!!J/ruAM44od*SZ\bMs]AR#VC)bTTF/Y*fIdfqBuJ4de2`^rbp"XQ^`eS-P/F;,\Vs
pTfNX?O"t41OMMhGA+VT0%qC"-c-%kB)Q:7*4@NTai?KX7am_o*jSU#\eCar3OjFFLgA0&-i
Acd<R;XF)6_CTHl)8n&pm,WOokbFBZ\<\,;;diAVKV8ZNX+e+6<SJ=,*A0%R'o_6j-A%9$<4
u"6n&JsV!HA7FY=]A46td'%9fK%fb&X49h,^C=2[!aZ_3R8b;!:i58@()3UUd^fDuk<>Dru6Y
lT5mG6[^ARnn8)PAd18IIK\U#7.)L#)a55h!>;+`Vqe!NY7nt"J(JAIV>G?[dQLqWP2`OnTk
SQXSHaaV\2$HL6!:+'@/jY3r/dBQKUrn1\oKpR9t.(rlg#Vq+75P!B&q$DhBe<mdg4VT]A1#X
1I>,\Tr$ChBW2_H"'+WumN=V$l7p)90"ducrZQ5:cO#'rh7OjthHI-d?)CDZPT8%d;79KM[1
?1Q_e+RP'PgIg;'4eTZ=@1rN37/'RFaIHZM)$;)$<<$`*RHZY\Njd4p5Ynt!dY_VQ/A6KHsc
(TR%A^RWe%P&7-,XRmpRR&S'e8,;_U`sLn9D6_KfG!JKR@G<LIhM"t2YMo2><-FAVjTgm_P`
i'RG8FObL//nq?W%ZoZP_0DsZ[de#<=mmF@6nSiAUAp?F',5T,5QfsE/bsAi.,M-/nRa^n>X
1R(2mTY5dabe7[M)AE1?)$09VMV8h4ePQ@uNCKH/j6>W(7(q*pN4)[%M7n#[Dn3Tn.*s!g:$
G>=!ol;1.U:[,+O*_k;?cq$,5u'O?BW/b?7GU&]A_:b!<33H9AM%T#U7<<:$,^+Ic/[ViYfd>
bHA)(a'q.TWq_0AM.@KAo+V[[I/4U4/1mRO-HDiBc<`N"k+jW:*OMh11n9qo-KfTPX'3dSnj
JAqAhi_!343GrjZHT#*:/6.:T=tkp="@pM$;.P;og=>6NB>dP(*N+FI3XZm*OXI?4`l2H&5M
dg4BfBLV',p8^S`h^52[n^i9Ni?V;(auMGGdZdODep!*ko,VTf43u1&?R*FIP\G4Ojc[thhO
OuK5r[LgoN)os1Yot5-srbF*5!F^XI@(&Q+:.?/T1jhc.@:C_p#QL>,KkKe!4nZq1Vi,"3UK
`SU5/5+7=9&"><-]AB0D]A(DH%-;K9Meh&p.c6S(o?uOp@uaK]A]AsCqmL"T6u%RdFm[lkX,?/$K
E>67O_cB`od,-+M0M;<98JqJ%I]AC%*H>EG&?:9-*M1]Au"QIG/.k$:*^&i9lmWiH"q`p7c,o`
n=>?ReM+B_"=nu'[^SKECumq]A(HT-3N#diW_QgJt43!)2BhobX8bN%d^TD$(4q3V]A;0ETpVq
gE6'a@mD._V;m<AhYt"cB_mY.8V?EsPh&gtH&Ug5F`b#$kdj=RhlI+eYeilI1J+%:4\l[KH$
GFA&UHVKKC]AJ$kjp/tI99KJr(Z4*Fh<3>Fdc6H:n>dRFuP$$)!?22k@d.J%5:[9>uNZ]AFLY6
#F#mBqbkMR^B\i>o4BDeD**OIe8HKHLY#<PFJac)L?ElP6<O[$eiRG`-0(!&HPB\AJDZs--9
l4lFT>9pD/#D06&\(i.'s"qb:eQ[+FKRAQeac3,YOiciQWkhZ>7:rZZWJ[Q/OXh@rpB#i$Ff
//(o]A4ofMYSjA?WLS:f#mT\FD*J&G^@d%CBsj-R$l3iI[F3]A^CO9r^\XX,M^?;p%_s]A)>,(r
J:O'5F+A'lXk<O#bX[ICQ)hP7,E,:T&TOl#S9%hEA]AEGkkotSSY;NJmCFa<5R9^)B</V+9[U
;Kl0Qk#._1c!okAOB*Ru&fVWn)/#*l>$OVdTbFoadqZn(n/AaF]AG("I`mH7Y(kLe;>4X;uh,
26=+l.94*"b1DV@\@s`%CG^k3kMurOJ</Y$0;LtP[d5:Ff?;RKl)dllNV^f0_i@qQk1.1QJk
kVpJj7t@Fdaa,EF+/>qAg`<TR,$=="5bL7;*IWI-c2L;gjG=@F=p$bG-F.@E8%rI-[M3]A^6?
F78O"c4NEG;Fk3o,0fi3s7`i?sI>R!(:5hj(S+Z?MASf@'!;W:-Ra:5L*]A4qEj*SJ`ih*C0V
9lR@S"#US?@be'-d`A*A2UYqGRmjXjok`b-dRNSo(F+_JFu:6T11kLW9lCc5F`dOYONH0<lO
0D!a1^r>o#RI6afV0<gsEKSJ\"(UD+E"@J@?,a^g*;*q[e?tF68`Ae%"]A9kar1sPBH?ca&JY
9]AmWaC$9u_N>%:Bcq'iUkH&;\8+/mG0,;^rS5DeXG7<?S2OgA<QG'+.W7*aZJ9ih%brLFnEI
o&\mT%TiIh?nR^&A]AU'Wc4!bKm^bN(LCr"Z6eJX8-.W-^.,#c0q"Ih@JHp.kF&g"T8E*';k@
FWH'(Z?O$@P4H@O),m"Hh=2jZFq#B2UqG&P)Z$+,,Y>j]A\$eDRuWFjiY;k55:dpXnrbas;d!
2RKn_lKF*>pj;AN:WN?UPI$N9@Y>1[#4htGb-NrU^R=ag!Mj'f0"Rd?kgko78-,.b*iFFej^
u)_0qc3Z6bcgLmo`;VqgPC9\42)5e.k3kZ0o[d\n*Gl+AHIT\,4[59)ZEdF%J(f2$EFUpmNa
`-hQe]A;fo]Ac27s]Ai]AZ8H!:mnZCq_tjrQ*FB.XFf#liRj]AH-ILEu';1MK@a1Z9n]AJf<X?GE,a
A,5@#+ruL.F(OB);m\AEqp8L%WQX%;lMmYT?\Kp9P;Zg*h%KWNf6\$Uu2c!n<Pp4EpbTBF66
TY&)it3N9h)';@(c#7?RCb0f'9TH0Yj,B1&ug`$q_3?^:(aq$Og_pS-2Vb(lp"Hk3uBmLq*5
F/t;4FsLg/j!nJ'P:riS2O.X7Sn#%T51.u-OAtP&gQg(4R6D@-;i7Ri[^cm&bBZ39DLh]AASp
2YcOY6S`0,2_5fr25rT!1c)_j1sB)_<[>)^tBD^t`PnF%_rQ7^r%?bb0nok"Xej+C]AJ_SOkY
\geLed`DZqYL]AbQ:]ATJ39NJ(:_rYN(Fgp#REGO[DS1Ug"?P)fOLUn;Enrr=6,eX*(s`bmYrC
%g"29$%GnP[C7>K+'U*0&.$W[SPZl`DqmG(HT"0bYM:Mb?!2i="#egRG4O+8M#K;_R)+&V5Y
R:A:rggLii=S^k0-EJoPXfH"22%B3-Qa\]A":#4_D';R5cF2HC<8k9bC'h_b-;<6VWN6,5U&9
<o<[nm@#I2]Ae5j7ET"u!9cC?qd6+N]AS;bJ[J&uf$?"MmmGP$jJaCH.4/9.(^B5SB]A;<)\o4L
D^,UfR0`\dn?33IgtenbkfPmkPC0I1dACUY:I<n&=OVn^AO_d)aM*#9\sgp8tlO(Keaj$ACs
`=VIm8!C":2qHWuGV`BplQ)gfOG21!9)Qn(GnD<W/n98Ba$H(8@bIQNW7ubu-'GQE8>4"C?>
I`t>ToanKf$]Ac>G=@!C,&c*uG?\6A95#Ou34aee-gXUj.:o/V9+?;Og.Ts")hagBd$)rc)0E
j0l\qHkS-Fekd-dW6D5(-\P&(^G6OJ,*nc\h_pH,E>=;q(sI%qqI61R+q9)R_4A`H#HG@b[,
hrt&Q#K_Gq:m<ugk,.JQcd5"-HVRCHb:Isu>kk+;hNBBhTq/Fp`$d/&5k@9g]Ach3^cJ%7lpm
Sh0@kei3FqrKMjbC[\Tfe8a;;n1eM`e`bRmKuT=*qLp^[Y1Ls)^g2;ng1lIoDpZUZ,4@r&$.
nA_%qGTCjBKMdph>2A`M%)bc\`:;N'_PN7E$<XqS"$@YP`Cng*jV"cXR6_AC<6ZZ\g`("q]AI
5<;RFZ?D.e=@:j$+Gfhp\R0r-@Pi&'-&<iALd_PVjdKp2qh!uM^C=^WQ+'B@]A>aNO+iR%GKE
_.!DH,FIHNJ)7-HY8Qa-2'+bjtN8^3e6_D5YbH*$hdaTCQ'U[LY-hiu9(,-90s'J*h[4X\+d
O47DITCRQSlT>d1a^sh6)AR<rk[h,W_jCeLG9=;%I^jDJk>:T1^X;F/hs$CE':-iOl,hOZ%c
,[>ZL#Vgi17=GfJ@`c^q[*:mRMioO!OM?qlrH8&ZM%`r^=9ceRUS!2eJoB@@^)VFdOP)n,(t
QKKb+K:rAVjTlRcjA`sLTXL_BT[d^kbAcO.J8m$-ZRS04+3:MM*G\^D6DHWd-5;t.)J!ARl`
2,([Y-J#3M\@(qH\$2/5HC<.S[*=r=NsN8Yk<WfJJ,S42k0i;YEp^,4+W[C$e,g?grWps^UL
79jb]A-27P!Q"OT(9h5A:&=9#G+o+\.q<X>7*R<[tg7bdn\aMEju4c62B&rkIX2nWSFu(T1M&
ISMu5aXj'p,[B#$l<<GTB66G;FJX1qf\Yi"@B.i4k6m2Eg=;\1/Rh"fQqh'`992^(M*_=-"E
WPD@=M'?fJ8D[.gtqBLJ7mV<N"YB-n5`l;X%?YJ,Qa0n?5UOQoJKd;Mp,tN>\!]A+8*1GbO/_
c?Su8o.3GdOS[L3U]A%6QH%ok!A[6D%Ag;91;-k5&&6PKoi[Fl@,KdSLr2FGbc`UNnI0dL3Bk
lJogn@LmX,]Akt.r([:nfN0XfEBdD;YE8de@QkPG'Q+i8`KCPFluW9jeo#YCKpS4):D/06o\N
C2i4h5t$&:^!jlbp>jDA>)U,h%EH(M!L"=iV!l2;8<cKWZOn@1?LpL,kI7qP\UE&_#'@5e"?
]A#.V*;:+mE9O[AjW,fV%3^$a,SQW8fAE?U?Fe=>pa=#MIR_m[BdWh<@bO+akO1sCks,pmS\c
:.!U&4n@j$YqoBSG"2"5=]AlfSY<17YKBI`o)!Hbm]AgS%Ca3MQ&?A>XkXt0VtHs9d/T,dmrSF
m6(h>`23g@1!0uikjRE&C6EY<>k%7mcfWO0.3MY=sJ+/GdLK3:Uesa.m3M>UH6ZLOW4WF$jE
*Zk95=s8#\!@tg6Sh+:enR4)BaVUH+`Et>>TT16J##4s9sZK.JX6?8)\ZF[$%nD$s/bB>@Ag
b$nNT)1Ul\5UZp24a)?c32J&=)UrdiuW,.uli[.msTNTZgF.4P2We_'9ObNDgA.j;8f[WD&W
DQ9ENL3Le*qgYP4*^(DVm`@G$ZS_3Ma+OEiPR(5\5L@#WhPt_%q".d>^2XVNjVRIun@-rt?K
]AZ>p(mV1P+C9gjkK8RpngPa7OgJW7V8b\.?eE#]AMa]AJfhXH'-@VL@LaT>>Q0IFJ<l.A_E-h2
h]A=4W^j*iMc;($hcfJF7CorTdH53f:pW2W504'/Lbi^cpW.YGg8lE2SsA]AfkQntI6^h(%:@2
_>\NTga1YTIMk3mp'RMcfi*Xj%H\qgqiL-H":/(O"_rG+`/^D$g2<dL0\Y%r6Kd+BeQ&`)JY
ii]ARmH$hSI4-i$U/8d1;2$L(LE(#X-1hPM/KR>X>qRr\7=dXZ[!gA%;TS"=q2n"o+?/VbC@f
caYGOm=$66=-4mIhE>PZ@,fVKLL51Rdk)f]A#+M)n9ng18HRA^G:nu'`&:Z1gbAP)i;;?SFW(
t)j8=PM?oW)@uBHRmqnN+GLY6eW&^i]AVHF\FL["!d&>-t<XH1g"RWid>\nO!pb;OC!u-dpbO
gm>6q7De(&a5.^1##QJDCaJmU`O@d7["V%>Lf0^@<mQ`5?`pEJ]A5te`P5^!p@ZLoY=6/cacP
_\mYlSW&;1Er#2C_DeNMt\0QfT9XL'8m"U25pEV+W!GUcR^IDZ7+f!%AYgtBU0'k37CgC/1O
oWmurq<njY-\S]AQulq$uf!T7'ZVq`c%nqa;=C5d&mmdQ'I<nJVe"5)+=?g'*&fiGqf9`g,u,
FY+Sg@2=to'L_Z`L5[7H2604u+GWC67IWdEGPs$'4krb[+pq<L'B/k%&rrpfA2?I.#s!T@J<
bCC)o<=(k'!gWj^T^?[01/D%l'SPK80_(%[38$1j=ZV]A>3%YIcu4qhu2]AEU!JE9La;%og@'Q
ks#ni)Im7Op"9h:E1Wg.bT8jKlb;,J5FHi%!*#+]AO$=s(MNi;a\_7ia`i1h!\bSFiJZTFBc_
?fQc4NPji$[<aWqW+0!%tL:=rg<E=M&0KJli."~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="310" y="0" width="321" height="298"/>
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
<![CDATA[144000,723900,144000,723900,144000,723900,144000,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[144000,2743200,2743200,144000,2743200,144000,2743200,144000,2743200,144000,2743200,144000,2743200,144000,2743200,144000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[时段分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="1">
<O>
<![CDATA[销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="3" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="3" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="4" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="4" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="5" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="ds3" columnName="XSE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="5" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="5" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="7" cs="15" rs="17">
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
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
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
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
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
<![CDATA[ds3]]></Name>
</TableData>
<CategoryName value="HH"/>
<ChartSummaryColumn name="YSJE" function="com.fr.data.util.function.NoneFunction" customName="销售额"/>
<ChartSummaryColumn name="JSLR" function="com.fr.data.util.function.NoneFunction" customName="利润"/>
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
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
<FRFont name="微软雅黑" style="1" size="80"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[mCWa1;s1SQ9M>U;Uo.Oh&99lSbA!):[=Ao^>?e(17&uE*$E5F%!?r^taC$$e7HIVY<Y-HML^
>CD,9gYp7&gLuQlo>%+u0:WJIIX%jT"WN*$CX(n+N@-HbWL.qFbDgG?F06c[+/gpWeoolTD9
sc(8HS@:?kGS$0Q4Y]Au4C@573/"AA5;Pjq6\()B.&>Q*(gRpo0;22;p:Q>b5d1^SO+&f/F!(
D9X3<qt25"5@G]ADqha;?=,aR2<,@$Wedt9Dc2BKg++X*b?rQiEV5blH*1jqQ>7hbp+?bs[)t
W+i.8>;V',?F+K;HC%[SR=mI,+A)'.+^SGZd:ef1m+J*Ts5-i:6FqK2DU,'m7Jn4&IWe$G@G
Q<[;1C)==OGqDa[-`b'X@m?h7:VH:^RCW48!o_CnfDAUP)b>8,Y]A9iJ/LA*K,7@c3beDXW>3
!JCX%q)bUqH4r]A+F;>cZ0%kYfspF^4XtrmjH._39d'_?E0:HHfM#6-?Jl9GT%!'TBsXbq8Kl
)W=!Ck1;%/Paf6A"r9To)Z-J#f;cq)`;Z,SHMGF"_[WGcQq_8"!MR_l0T4O>\_j-IW4MS1GD
os-h]A/#b_#b0Ei4b(megiL;%k6ojd`4sKbqX#4dQ1n_HlpQVu;++^V[r=WEARu]A^/ICQ,G,X
8HY(;OP[_X6Nq8Ij,HAqGEBHXoH.qb3Xcre#1jK3/'cA1,h<o>U'2]A)6qiPTUSoNK$'r;Huq
HtV-3&CuTX6sgK!?!jc]A.b$'7Z?q$@q45+_B2Xk?@3MqQHf9RZea8]AG>Le0YRFA:.i.?E2GP
n]Ai1bR6Y^AC63RI=bAoJ0/[i;tJk%ipts]Ao+k1)(M3N]AC3._AM&pj',@t\Ptna'A?@nMfar?
)q8rB7CKI]AD$hmq2pWV$m00),=@4b2rm3.Is.Sgp[\>:1m\4+Vk(0F?%&NXVME9r\*T?hf@p
eNb"\*WI'eUqXuF&S3)F_XE1$8/h';R#dP"tud!U,i;UQ=`]Aa6[1]A96h3-kfmZ)9hD.M%)3O
7F`1DQpA_/%3">i&VPM]Ab$,?LPLFtj`B;:S\>Gm`HfYDV$e&TD*ACXJYu(p2=CgQF1s`oME@
JPBb.4X2KU<-J[BrFn2nH_&9PpcNXrEaG`KZR`2_N^RdU@l-lq=Q-&)kAkuN&)-WcJqe2H2.
`$%Jc:l7`6>34-;*UX$"Ds`=7!1_YZedofB_;RE&nN\j4umu?U'kM.f4h4-+u_'+A(E6p1\o
?U.[jKgm)1<M`4R?)pCpdq;>FN)4<QDkY-CiP)bH)6WNDNrqlN.P_Ws\e!>:.;7X#*>#mF'P
Tb=[Q]AZRFH67WqhoYa4mrm?Uj\4rf>iQ(lmd?XEckcYsTY;=@nD22b^8a[5]A+jG.e7?fa2f+
2.nUn.Q/5rj:n;h\57^_</*/9YL+4UL#0(i"T%abll$#p?9)$7P[>spW<iBn#NqK8?ad'`4l
^[oYE1Y#^jP?>QB=G!'m:DSRSCYH"m*I4_b+W%f'pBRC^A\4T"@dNQobRKj7c!pOSI8RPejW
HfH^'\E)r&isDomTk+qk#""$S:O>_T43f[aUA(9+?A.A`JE4FlcD0/rLM2W1,Gd?[qFapm/0
55#looNCqIu+0'$F7g6NkhMTi9kKpQfp\Q$?WF`g%6bC[E[po<GbM7N`Z^d'JU8"oq?Vs1o-
MsG+h^SH4-'1B8fE+6e5t4^HHV3)>ri?$[7DNSX<BIM3T*4ocmn="P<!>T1^pMr7htSXqnD>
TGnuaDHpG3R.Y:JA1qWR+GG-$,jPEZ#(>VJ173H079Amc3pd!IMtT+Lj'IfA?'g;ean/_iY[
o#R3F(b&XaReC/m\45#"fLK8GUs<'S4a<,oG4j^'d<7r_\%3&jlbK7/^U*S`$064I?W<&Kie
gWNR`,\"p2r[,G<teg,e0L/O>!Zp]AY*(L1m>*\m(FRk9(F4=:3([k'lnYspM(1.2,[O,Nd&s
]AZ5%4`S/Sir6EJu;Q>1D%^H$RT<me7UkZ]Ae`G1h=GG1&0b9+:6Khno%$3f!W;*S4*RG4ToA)
CX"T?N`4/+%o8SHb4V?s!Tg=r5CfQg(R[!c/4iKraceQ6g2JX%:AS2MVb[_)P0&4J=AOb`0j
;!hrBdj+5>[FINO\gkR@Q"`i:Jjp;_dC24ZFijNP%2T.\/"BKloWDsmY`G,,(EU-H&rruaaB
^^?$4*&a3t@C1I%IVJqmJogFXi:D@-SX@I2Nn\LBpsb_l_s_3aDp%7F`P7HX"SUTOb%iH1%P
"]AqRT76)/+L-g0Kq&Pg(i6.lT`*(LHc+6YkJkkgc>1Zjl,f^7EP,QnH)i213Tps`s5lkYir?
hIk]AnD(NnB@fLg*?:edOK%E$-pUN6c3',R+;s7eJ]Abj"b-qTWX/7!mW(a]Af9Z9uZ1g,GN?.a
t2GXU6##ddJ`-W/g(fUD\'k3h&77%$!cuJUes39Yg36kiIV;*ao86T=SGP8;nSPrAV2hN:q'
0X?d7lNT4`N/d3-D.7s+sIn^8[fqn8G;>`]A>X=4.]A)+OPp,hga0aa#NMSY[ut]ARoJHk=lpul
/h$uWGa9o.30['2m,ZF:EpPK!!8Mc,3]ALcm9_7/fqD=GX>hH-KIukGM=ao\5m%b:dX,q^UA'
f]A]A!A4X/B1uEd[B;:LId%Q*-O"d1GZI5-g:28@6=f`r:!)4$Gc"+e"Y2A=8&&ZI*bLln`k'l
D9@l2r`IB$k[<OB<hpf'aibrA$eY:Pp%.=t<>SPeag6(X&8UBkk(S&Kh3-9B%7L/DYm0ND0'
?am2AhS!"V/51MP]ATi?4PaaqGVJUH(=Q>[_46,)Nd?J2)=Nk?`eYq&dhZD:>1+31F$DG=W?#
DtQA\WBbG$"_(2.#\]Am$lp'VTg#(4@/[>rR"ZHacn!YGE-,D00gm\'`UPHd7FN/5-TPOTY47
b(DC<LVOX/@H4-6[$;q1^-.M9-lp&chE<7H!Id\I(Kl*McW/PtO)"TjX1BdXP2^Q7dIj'p%A
]A*41S8.Jb2P#;N<.V5p@P!j+!hf@Q1kkops6/#P@"#.7.+WOf-,uALsarQ2=HD@m/JMbS@CK
%/?<V?Vo\b3NSJGZ$>;98XRco7s4si$2d^et%k>pf.Q$27//]AI-FoQ:_f6,t%VV?M4$YEVjl
h>oBJ/U9K;`hJKYn1BgBS7dTcBbM\Dg)$-,J(Anr0+TW`kHuufWK\&117lpp'tZ8EXf^Rii4
>/@kucp%>mi/\6s7l1rll\,AJ'JGI-sWbBO5pEs5J?o;t8N\o7WEMsgubO=FD<QLq)#+S6uc
#i1?=7t5+>)E)@^?R@#-Y1pQK-u9'dP/<)4iH4=m$$J0:S=#KU9\kgaarpca[Vj*Kk6j%0`M
Q7/HbCr"/$jqRR[ogt^d,EFK#(AK=ZZdE1H1:]AXiEimPk3F(0KTr^g\@o_hDdKO?3BIZZIj^
GSJ+h&:__6ffj/KH#3d<_>WpG"@6I9>>&]Ah*9[)f^C"kG!g=1+aVcb`%E5R!`"r6$>*,qgRc
OniA]Ab$deX:*Z&Pu*?\eU>YH\]AEk2+?mTo0s;ZULHY*&=PNqdr4^h\-MErOq=N?oHctob)rs
FOo8XCa7;aXsnJ.OJ0.uHMLL;digubI1gYtEQWL^-/ZbC[eS!j13I.8Z7JQ!R_[\W@L"V:p_
CT>.td5Qo2pjmIY^C93WQ(7S@8k()hQr_O`!6qe-NeUrNXj5W#ONT;E9I0GTg?Od`"J3`*"c
A3+5/X[obElP]A?X-sQ'H,MF7MIAPj,bG`PkD*;]A)%npI9QNfD1d`KIdM0sco,1CG;#ddW/E/
&Y`B_Q;:_eeQ.j[h)4F+-W\F%9[*7S<f2YaSmA<UoLc<Bp0]AO=f/k`Op?F&C4WdeC"i710qn
Y+pcF?=4K2dE(Nf;+a]A=GGB6/a:q/n'$'b"C=.Kb*l<<W6]A&=7le2+%@SYeF8FW@Cq`L#^&V
D!!5g5kH)do;.p>)qU$s]A<nhl]A5$nRlV7;q:^9I<a^O$=u^;dnZKH`7,2:[BmKOOpuAfO1&%
N9/[`iZf+?SNqjLStp6sipqeRWFM49-+XXW+h+Q'`NrZQ1n/3)es'`279t\t+k=O-k,*q0cc
WZ:R;(-XK.gF>&-B^e-llU#X;TfqHh\,HeC8jXO/8!Bo2!(B:%g?UHigKqr]AtN)T'F5ga`$Z
`s8C-CYY[?>]A#Ko9,U]AtE9XCHPlEohcX#-4=drtn7l(aI2cN`aU7@'RHfhkAo/17=c]ABYimR
H%-B*?*5>4jp?"19X"B_<o#n`;nXo_o^4?+-;02kZ>3pNn82tm.`(P8"0m>D</ipQOuYJ[Ad
I9G:sqVpIFTP%_`s$QSVoK9E^7O3iqWIH=I-QLq9(L<B[=NaZOAHGVO7?jMWT3eQ.97aY(N5
%J\W4*Litl$Yjs/=gI0ZVp\B6_<lQH]AGHD@9@4]AldPsut[G2VgDrDJL2;1-u@nE!\?<%Umh!
QYfFm!9aLu,ZIKV&k4Q?=_@+&K9[%U+uFH>J!R958AIdalL)p5`PD)?@;)mCY\jaR:q8qcYn
s-e"[,RSsdTXUjQgpUlg.n)Al(hChP`"X6B*dl(;litMH7HJc^.bZCP1o^]A/pnPFp'?/;++@
;;8rrc*fXen2bamRE`uDZ"Sa?J<T)::2>/*,"g:K.Pg'Oo)PjfQ'&/n(SH@3nXSH2YKc.aHe
C$,'79/CXFOqA7fGZ(PCUO.iULu3X-!/EUDdh=.u$;Seh0/*23#F>;56DW4W*'T)(\HdXpI@
l=rS.]Aos46:nlu>/knD,i.#2\+JfsfHCY0cAd1VWRPJWAQ4&X'BT2'!A7E_>r.+o>DQhiPNE
:tgHM%2#0;Z4iq&Z/_FptOraum?_@XH/,X;+BpP-opf!T`YQeigOfMGFWS[bh%bm\hP-)r\k
tPA5g>)L7u:\6+<^=sk<2Bcd-NpNfTDq4/E9%b!cQQeO;Lc7<HVKgg>1r7YBmfp8MKH.!u]AC
IS8e!sP.68M6MZEO'=ToMe4qp%&Ed()N&lO#!VB1AZW!C\odbjUqY(i$PR0U5iBN@B[jZ[e'
#"P=BEX<=S0,!ZQEP1gVk,g\5cE;sa.^90OY5TpSbW*L%a'3>I9aefCk-"fnZYe=)<NMu0*i
;V>NtrQ6Fb+>:#qh,D6gU(Eq<or0Fh"8M`Aic10c2m%iC\no,R@app:3[ZBG_.C"M>@"LM&j
<_!I7#9`i=;mLdD!qEK"I6E&%OluY]A@j03uAurrs:4?*KBn;SDA`M'<1/@iVBk-M_1cXah#o
N_:#us(L(=XNOkn\W.MWV9XfSQfZ3':]AM,<0+UX7A7o5%^O8&0Rja8mk?.b95Hoa:Gf>/5e[
NuG9H9`P(=q2?ReBZ4!Hk`E?FehXb;s>l?9o7T^e!g2P--;4GMAmR2\'jV0Gj48k4Tc;NV<h
PA[bP^eklr%dZ;A"f/0m,L9oVtD\l;S??i:6Ij[6/j'pXMOnT'Ro]A%YK2M.'rY.cZ^igAWd'
*'W@HG";*#Pc0mA:@>ppciQA]AftSYM.*L@7KbgU7o(2H_//QN(N_5]A6<496BVm%bRd=5ALs3
=oX!I]A,rWL]A7'dHO^(..-#:jQ:;6bs&EaoNJD22FrMgjL\HKKKYL,M[[)/8IHTC(sN\Zo[<$
J474Z:I^'@'_0j?SGItTpQ'C[JnLJ<f_mB"J%o;%p/]A$TB;'QdC]A'51:`3Y531'JRfK\#JB>
1%VNR>8gLr!UiG"*9+%j\LNu64\EX%IMdUd<!1nkdI>uMX+^A?#[pAQW4]AfQB#-J.GVDmjBl
LTcWgKtrZ3Ee1m5>Ym,\'()FkI/P^nItp%+,>nM$lI#j;C!Mh[O[<c)%_n0M[DoITK)[uuju
<b?C_1'J@nh;+5XdF/Yljm?6n)-;esAtO!MEW)-^NOO,$\WSrBqdV>81B0I:3'&-G)5XmL3B
s1=YlJ\#H",:R)aNe:U2t??s6]A\s?Y:!G=aqcuVl?o=(1o;m,O[dR8+`<`!oDj^.%;!mofl/
M!fq)5dE:Sg;&EA]A_UG2b*G7YuGC*NBL`QE2P$UoiW:9P$[D,1GE@8."S:7N_o"Y89rAF9R_
YYQ)RDk[KdY52ZQWcLHm%WfgZ'!X@=j2P[>0X,?3eQt$C[D8$*V2^&*mc`oKWuD?n\S=_/de
]A9ImRY98NF6a>iopp6W^5(%rKg'@BV'nCrh(K&]A+JJ(HgFGcXi4l*XFQ><,li3/DHGH,cV!h
e7DK#P3!d5Z3[80`Wr8^\BC%!G:(dj''?5IoG*F_H/PU(]A%d/RN9+4Y'usMPp0ddj#CuO\)4
;U#SZs5a`O\''hd`.W1fpC.+)e)eq;mS!38-\gTXaM`=89stA>ft;oi2oNk+g<;YW7o>?EOd
s-ej1a4**8`Bi/f,M5^gA"drN?m>F>.FWm.tK,*U59;Ct(99?K;a?5"c[;f`a%1G7@oE:SMP
@qCM$0#\A-D?X=+s%!:Z=<I+.'*OYgeU.S(ZoIA*n$#YH*g2C]A@9Mf6!W97CNP]AOr^RI/;_[
C[O1s/Vqo!o?lP_QtC#d$K_8//!A_,ds#/63M*2eD@%H4L'M'-#$NlAFR2mDVL0mPWppHNNp
5H_#rG9C'5k;(I<(cQfb7`+sifOI.,Eo<idQKQ;-_*?ejV*ht6_MkeD)H%692Y8M0e%UFRbc
Umo>E-=Y<K",M*e`ajcgDc]A(J-T$"f\D`:J4h1>hPp9VDrn*X/)K"]Auj-U0O@rL5[S^NN4+#
]A#^TY9M'26P-t@'DE[t)r#te)kl&:/AVZA@L.@,9'!0A(pHV\!a<<9q!*q]A0OlO3GXCNa7">
I.fQ(YUYq1RAp!=s1N/'NMW%E.B&,cqfZ(DJ%U0:>TMu@q_Yp`h&)/0*qM&SN-+Ld#!46E?e
bupNE^Z5Aqo+eU$6NOBCA\"4'sTZ-MSRKV56@-VqiUf*6l_-YTRhdFh`KDNc$GcVgiG+q:i:
+G3*"5Q+GIVkfHG6X!hRPo7k+il1bd?oUR\r?KG`nJN8gs50jM-'!_25-\qfjJ)gGeL_e:oU
p:'B3<`J>nr:&\+YJ#DmEWPU]AG;_P.omlYXUh($]ANrJ+>aX!1TW3Q`;FHU;'i9J.s>(fmTZS
ld=(0I^E==7ELFFJ!IXa.*5siuGs@hbISikZ.ApQ'C.@n2_*stcFZ+CN2i8I,X=sgKo7.\VA
Rs@u4$e97D7ST0Ih%7$?Vflb]AAqUQK!#n^A6mNiKilop&aA#,Nbh:@9tlXBn2T9GM_VP6eU6
#51&/l,Pm^<RUJ.s8g-\B'Lf<1gMhtI2+@a75V_2TLBggecE[X07UX+H\f"]A*Wn::I73Pi?M
\i5Us&I@AZs+"R'qOB6L+99f]Apt^GSm3=%UE8T2:pC%R_A8]ACY?umCpVP+K]AJi[;]A0+G^2PE
0)>SEEfPT<96#]AV`+A[Y93#!<+5AGOEEFL3-]A[(]AO1B=CPdd[Xi,C-RLVGnVbc:EJGgN%7SF
OW(0o]AdW1K-c!mhZ4]A\^MIb8TEoQQJkAKr!mB);\?N.V+!\(/C=m?.eZ_<gu9kNG;=B#;KsF
2IQ+4\<CQ]A1p;RcN"0^!/6Qmdo9;&dbc(WODZUAAhkec#9FZ]A6[Q/Ko0Rc#@&A%Z=A'*%P!X
C:WGd.X)6>s\#(.X^,<-Ga\MnFeQH3beBI(+!n&mYL!Ud(mIW77g7,H^$qctni@LAuZ,_7p0
HXp&/bY4f^:L#&:@5M94bW.jt1Cmm"]A;nF/)$>\$)>7E[d7KS$B,5P87\@0@]AhK'cT56+YCi
c)t8f)ti:i*7dY$lGR-Gop4RmL2(_saE=o^/nA>7</hT,#O&)dKQGmDrpPNe[.C`lgH;EdfF
'XZO4,iR56mkKaA<qODY3LDeQ:*sbr_E9F/5.mQ;R2BlY@6Q&lI=RU"F]AJ>ud[Jb#T6W>(;I
*"X#?QBDVhZL^-m8uO"QFn5#ZhTc`J_nt)YNcEe>"<W)E(X@Ne'h8``UeP'3b!"-cAnYLL)5
]AWSdobdYG8RYC4o]A^Bc*L@K?^sYC+<iko&Y_.6GV=X)a^n[DsmFVPjoW)I8n[g+FAK*n#t2Y
g[boRZ.=-2Is6HY(XGb;g^f6u;1]AeQc0Coh04<j`(EEEN0A=Rd3J3%5<KpCQ*k`.1i7a42L4
SW]Af^V@QXDnGn=U;9L\Yq3`l10?,-:\FfUXKRJnSF\f!nL%X6d[*7lk\<lVjA5f=(O9<[?AF
Rf1p"[!7a^Fdk?7u=>A71`glR]A"7q67`ZZ0O7$TdKRu/JKI5^8ibA9us5F=82oBBu&#rY/]AX
OL._YEfc@FZj"!/1dC%Ck4UQc)QSf46Ld>'cgXHn0X=iFR=.`5f@C8nq2320+@n'm4,'?+A!
'Mg0tDTbI]AP[5hb?9$HUW8Zeeqlo8Waf$=QBZP`\"OQl3b9_ih<^cO4`C**hitl-&&7iA@<l
MYeBe<`B2&h`]AKdDC=>WP^;#P1*TR$-jF##27<14=DL&4\#1&IFa#!8BjQa(a>AXWR7p9PFB
;Q0L\e,o9Ob!&4HssY6ZMYap/5'C#esX.RP_]A_#^pqK8bj7?4^^92YP`Fq2M8a!j1jJOO6e,
FeaJV5=+W@YJK:<SEO`b5Zmb'gd-80_lWBaFe#X<57b0l.B9G'/+?_L/:JXZ+.*69i?jttE]A
\*h=.[tV_VOitFT/DVEhYUJoHPdp#.2]ASO%Zer*`2:85$LUHV;+9I,^2Zqs"dH,HO!phu@r$
i6-(P"SJQ*HqkgkI>P#nU\hhf^uGj)sq<l7'!qeuR#6ZRnRQc=+C9h2ZtW,_tijD_I1Cdr(I
pW\3Bd7mO&'F>)1g[%[>$oPc&.YHP()Q91.Zi9Bo_/=2L@"d>C>L;"^)nM$#m6\QDpuDlONn
Dt'("cLQi/-,\:=M9HBO?ln)ZTL/,83uF3"QORPl3C3*)%+Lml*Z,ego5&pmLt$>%oODehJF
Wr[P9)-X_d,cA?EG]A0$;c*u!r%:f[1=cG0Vl>d\b<^G<4V=0]AC1*^tO=9$F=`<)WK]A;lVg:c
oT18*=?5g]A#i;(O`QYl)&3K%Z!0(N88$\N7`kCeGL-b3&\%#Me1\hIerFb?^>;dC)/O[%^fS
Em</e2W!O('l=LOG/,UoNldX;SXkmcJd$)fdd>gqZG."gtYh"?sGJ?')]AGK:i/4aOXR2Yu,&
\"i>MI2ch.&o10k??0=,KpF0BKqoYjaL_kUjTDgM+#h.#YpAo#Y3(Cp0nOJF;NrG"P`asnbU
`\ZAP47T4Eu><aL%1k3U=>\Cb>Re[r(p,jM%RG_DcQBVAbiO^jJ)K!T]A"IKJ&4"Xf.:tl9e!
)r6b0I-#2YrL$A$'D[!(dMXZe;*k"skmp%V'?CW!s+>(:2+*X'gYB'9eKg6VTFtZt->JZH-E
NHlK)o`BDO%A;ZWT\2ElEq:Gk4,.V*UUV$P7Y44DHffD[;Z$\ihjRna(2FW'A5IgH6X5cmB+
Tt2OFp?#Ii`.dF\foZOfs9qk-d\DR^f%`11=f)\DPW-J#'uRW>,mUJ^q8c=XY%jr`A\MtYWo
6.K0i\2QL]AlLQSnR^YGNTZVp--6*Ea4oK.D\@Z3#18\s3GF9tN7!G2R6$!sU4I"H+1tuG'n?
5X,i"6]A\)uGTiH#Yk`)?:4WSMF"#[R<X&D"J=UC&>4;h-YOE$]AW?6?C<9cZm6IXkfQ@jA#kG
6cFBuZ7JC7q$"W-uLkM,(fVg?!rKGTDIWO`%Xn(I&kp0e-X&F^+'!Ds9`;?XSRp4WY?Omh91
Jg*NopW-24U4Nlj_Rb?\_?4PP`T2(!.WhC\m)]AIatg`J_Dj9%.E![@&dI>AA-9@)]A_3L>(b&
O.FhnV0%J[4maa+RVWW?[ZCD;$h^,?h,-f?0"A.0^,KI.R34^^bGf\+mL0h#El!#7:QqR(<E
@#80KmMV,cAG;]A'P2&bQeRjII]Ak8+C;=??"M:=j:<6]A$PDg9O$;_Z5=qGt""UDiKO*0fuKTJ
ZlT;$^q@f$L71M&SZGC-dKt@Lc8okZ7qB"V_#0@+D=HcA2;Vgf6%J;oR,Y,=3JM2o*(Qi.@.
hos3B2WOaQVD-(fY&I8J\S."SUnSI,S"U7f,!_KENA-P+tZj=i94(S4S`+O`=";C&hckR[KI
5:BXITU36U3T.W6f<1oq=U&e(nkV$6R^X0CH-7FA>*"O^6>Jk*4i(jW'&Is&h`t+\>X'03g]A
`u(W+,.q/(qHhmkcJL%Q[ff]A%H.MHAmi+$"W7j/K&Yo_<_OIS45dIW.$G=QFk>TEc8Er`5o,
*lh3elPg8=+gp95AB`<)6[>\YDn/Ri[Rk+)D(p)MJG9I1/GHT$#P+?4o&'j`5$kQr8"T$!>^
D2&[0k&M$aJI="$PmD@D9Y1`T[TV7O0G$0Kt'*DID9A3\-SNpc`LZc6X1T';!_cfXdnMq$X2
aTo.TkH'[glDEkn9=_P8[A"d9ipI7[kOZSTQ\/^$>V2FREHk>i[-6?pW\1Y^7\uOVkc+=+gh
p^)T!Wk_ZHod>V%#TS5Q?7j3Zs`g`\oe4$HB?fV%)e+q,8d3SH*--`_Ui`mZAr6e:s:UaS\m
_M%cg";b^,0a`Xm!A`Y>Z$3Oh?#Nk*;hReOj/q\rga(7i6>]AnFsE8[eg7EgIub$d$XDZ^H9j
l8GjLcY-Y_;e60fNZkWVh+erYppUYJ18c!FpL+<(s5:B^kW[a^<ka0[T*'/aCOWJZ;9108ri
Xj=^'#Pc:)^`[V)=".CiKJfRAi-glu8Og0-NGbX5]A7e)6a8]Ah9q>JYPIUg93M2E=e6@FbVob
+7ea;kYm>md->+G^?[6;OGdp!I[+uY$@<)HspGKtAE;a9/W@57;E.O:GV'WlP`JE#JMdgjQ_
$+$mquQU6WT,m%U2"Kl&%=Em-QJM=ra?./`'"IB$,X.t]At46gEn"b'"82'cg=Jc&)W9_Jd!M
'c)b^)8';&0/?gFbI$W7j[KIV-^0B?n9A$'/p2-^`"X@b2#[`u7THZ@)_oe!<m&^LTJ/)p9j
eIE(nWC9/p2(*E(?j!E"?%"K!*DH$2K&*<X=p,hOK;Vn:YA@t'q8jo.)p#h%FrH7NMZAkEHW
1?Or!2ECSn75WaZ<.I<q9q]AK4RoNO.P6)F\9L#?1AgKS2Y#A8Q.=36".&d\0>]Ar!&[-M>i.R
H``iEHN:RcY=Ul/1,=qChG+RT(p:p9>e3."Qf5;oDoKL#feC.eq%lti[56S>[?Xm@?hMPW^S
Ufj=;n\5r1LqW6QBVona_IA*<bpi<p#Qtm+?8hFW2Pk'$)`o]AIjT^8[:$tSdNtSM"7HR/K/^
:%h#OG0cf!W\e[O,$Fila[#n5rOJq=KM4b8H"aKdrrW"6EA'=XVk^rCI5D&,[W"nh/u0O!FK
dpB>UG@4PO+*L"'nhoAG=adY&a'c(SA!>':$Atn_L$=G\F#teOU7rj.V8Q@:(Y@nt\q;7uen
S%7\n2uQ7_P!K1V?gj+,#us"X4H6:m?R*G8VF.Peu]Ame_N1?MH9QW0'eed)57[ji`e2-TVt3
@cADA@MQYI;e5cjM7eI1?5LY[CkIBq:k%=QE=$co#,Ip.n7'qB[gj!j^Q\VrF#YI-]AK-pD=%
b&1""#Lu,b54YDX&mW=a%Jc8@c`>chNb;/BG!/H:f<VF+%<ZVrs+08q^;>+ph/N:(`fs>OK;
Vl3>gthdI0n!,^.h#kn#VEW3i@I`CiUtk,rR4'/5m$)!0a8d\V9,$ST#nPCZ/\:]Al'(QX4/-
iusc8[%sII4=?!gIaVh[4EWfY(]AUM>0rb^j$`ukoD2L9>Ue6ds"7K"S/q-4Nh,O-OX:WrhJ.
"tHTo*eaOFEG+L13L\S<8AL#DV8g'D2ofk_=rcL))[o(6^Q\aVF5.m$YrWY3&CUgZf=8:]A?j
j^j,e)<NZ82&@uJP/\SPOVnQi;Ts,jUZOnX-kO)5Yp%SC'SdBsblrp<dR_itnT4!WbgKI=6U
MO2m.MTm'P/i:GE[PJ/TrhW8nMCVi"#Ac=Z:$1?_>(J%KKr=IdtU+#WlQCW;%5,ZE3X[5CJ(
5]AUObP`]A#\"!.r56_kI(\qQe?TpR.bop=EOmargZ>08]A!)aCCGi[$RqKbYH*MBT(Eg>g;Er1
8=]AhX*Y's]A&ahnh^/@.5)4%BmJF%9p%KHN)OQ]A6%8(RqL2?Wt!Tbmb*NP@Qg'AN&O&B4/l8s
D4A`2^;<gBEtrQ8UA,6^TQIU5^,.>=SoZqZ);7h^S,;OIZTF./]A]ADA(Oi+k+P=m(222*>3a!
d]AbB#`j[f:Y&8,jkXWW>&agumc%S]AmHK`p4*jqV<k:6`-Td[3)`Ejd9"2":,;Pjn$H'sDMjH
eK;b+LZIY-8g+U#MLY\I?K8RG0t&ga'j(Q@K/urFXXn3%2`GN>r"89j]Ae$mI="e[8Tn"NHq-
.<'$&`727smsp.ZGP*7!Rs>8rMrDIihE+@Vk@A<;Yc]Ag^NpNBR=5B'd//!#(P.i?O_jjh.j-
&doM;a]ACua%*OQI_,UacdFO\M7\=pW*&7d>Eq[U3e]A>0"`*,FEPQJ9^ecVKX`E1"qH^ni<ks
-Q%\3bG!RR!(]A(&ThHX9esdQ#LKge<UrB10`X[$dcS#X:S-JZ(6JTOBGu%f&oLeq/\rRL+SW
#7)44.g%Qpm7:JeB(.eVe^=2"lejLX2KF?orBD:$=:?S2ZRD@?R'Vr'bL5Dgf4_T6Pcd1/1!
l>snOFY'16`%OD]Au%9nQ:]AmUk6n1RL"gZ@<-P=UVKB/?(V-1[Fa3t(\&o6lpX)8%$ak+EV:N
^ug`^mWoKgJC)pj4.\6;[)=W=ZhX$RVcQQr+J"8mV`dKsmiOGML.5_UX:3DuD"csmV4<dfkU
<3=Xp';9^QUiH'HCZTmf&'e<tNY"7sJ8+jFeB=i@h252\XG7ed;j&G4:oVL5PY/M`:CnA^B9
&,TbW")(5d:YG<s33eDjGr7o=NQXiUhhnVAlV4Sg&(^@dN-o/!j1%8"ZMOZ_Ee(O[iRe-U'U
HS#KDql1M'IRNfdtZg3D!H6-;k<U!XS&4-V]A/>k,\L?P6%;G]AKr8*t`pi07Q[p6L!=FmPVP\
ujcoenC^"KEqhY5i27,qqDX)/H,r&DIDF$#SM=)hTeX%pG>JS\WPmO0!%i\pHM;#+>p&XU!l
QZ(Og<\)Ur`X)Q3kbb?I8q%]A\nqb]Al^%j=eAa]A-\A..7Vp[@dLaS+h!!lr.J^m*V5HpcAFsY
Pp1o.c1%)OFO1ISk+FL,O9c@HL_*n6pH2G&!r7(3hTcVi2/)DT!WR3$/r&A2FGj'$_l8*ZWI
'M-[-=LL2Aj(G+[?jHo5</u5N5CK":<YAi;dh[klF&SPLk<hM^bs+KDB]A-"Z(n6r<(UfPVt`
s;BITVH2,M"n@'K(%W8ma\i(j,pmLJOo0`dR9rXJ6dAo)40dI;/dJnbscU/UX%uGj:&)1fgQ
l"`X#L4T%/b)\a0KX-!8u?!45(gA%S8]A,q6g"o]Ae!;qu>mWrK!>(:WdCEDiY`Xt`,FGZGYpd
>/IupI!r8pi_KT9N?a[hTaTsXM82Ak_^d0PJC3cpVRYr(InS`c&S2\JM+p/EtQd;su7MD`Ik
L-B<7XihX<S0,)ZMB9\&]A,-,B:@79%D*_[*mj:`@DC/9cJfMT'NV(!6#%O4NYph-[3tMtlbd
8p7%:ISO0\S7K\:FL_'^X;oYYS*HP<a\oHr-Xi*$ZOh1H^Cf,?4gE2>$GG3c.BK7$Tk<'/g"
]ADWj\=ec&ri'9b;%5n$SG2Bt>QoQa5T"C/GMmRnMh_T$Vto@-K_jC6N5S\3,okR0;qL>FDu_
\Xoh:n_Bh^R%-Y[+\u&Hu10I,nYQ2'L/fdLloJOD:7$p^rl*Y=-ENaCF?'%?\<a_9I<8r;rK
r+M<\/ce\=qp2u?6ulPhNt[N7?%\HY+Rj^oG3#.<t@.tmS<3mk"r=uh;u$l<GR#j]A![3iTRO
,U,X='j#18\(Z)p&Z>q7+FK+0/]AVTohQB]A4<k(f=+\>&XCu>E@NsU>OOG7u-Z.d6<-2VWWVl
42T)EQ(2\($MeB1o&7RaWrFr%5m`H>Ze-$igX#[bn]A2bMY\7"NRV=r-G8lIZdU<ic1<?jol+
74do`qj\l-+cZmXmV^[rcL&9StHRDjcP%[nZ.q?q)0R<VEHuX:qL4;`%(Z<u[TBDtL?B[at2
8W*Yfuj:QTK:(!r$uOQeTePNXuGu]AJ`IKqU&\H(NBKEee:pj,+n]AkLj0=(^fqNZMj[8$J2Nu
Vp8Qk*,dSN'?W]AC,/C;F@4BejlXW]AnPfp6E/O`=Y&flknoogqJO9U=?hWD?1ZXgh-?6",*=J
SHL*4/d8N.)E\o-I>O'k^.7D8aok:V#.k'dDO)RG#0jacbLcE_Y9_\!5]A5/2Lqkt2W2;?Sru
$A-"k\U3hXNX/:@>TRc[Vg9^5?iVo@ifS9A]A&9>?*801XkF@6XZX&oRrA06GS!^GK4jiTZe-
2g2i_57B`M')$)ASG'cX8n4>4&^7n-f'?15(e7r'_6lRoDZjL6V'tl5PI;V'tl5b'4CB/%Is
&n5">B3j=U&C@jNo2eEf@Lf^;;i'J=YI]AO7s+fQ5P&d%Mj7,VLu)bGLsP-LjY<QXTX7O)6p<
*eRD-^h43FX[dV5]ApE;'fo4>2&LNTB:+:&kX;!A8OhiBV2%AU[Jf0-kDAZ6k(*pb>3DK5`3"
PoC0i&YrUrK\]AqdJ45I1ot]ADK(4ngo:f5*4D//?<8;_%a#tXYc?02o@lW.b4FaEECM=6g:+V
\X$Lnp`5f<Et6R(1Zrh#f;)eB$AR5a*gm`;n;3>2N[,m_M.OjV0,,mS$Y"5Jd9%-Y<s4ci[-
<@fJ_(i6c_*gdRi=O0&sg(*:P\.hcTbeH?f`ThVtHcIE;l4'U@4j1@\=J4\6DUT)t=fu`X;J
I=G7_eY,/[>^bU7b`'3Lkb-t&nS4JO>tZiP!G6WGPE@-7c/HYm\75m_e"A*%:uC@V%Ydr.kB
Hi,.\JB0.Iq2A[`$edCJt2+_fDaRJ;S!'A2E6PNngL-t(XGV470@Rh$ZD*SA+J+f^.2fXQKf
g`?a"X-/rK>[M#ThQ2<Z",[=VcI,q_7G#g5!cRYQ#fb_u!CaSDK9c9UB7Dff:4T`rp^OqR4F
r3bFc_iCTIpug8Gru\S2P,@OWLYKq@qW(CgBI0kugq4Z.;cQd@]A]AK"lbZBh*Tp;6O-[]A]Ai!-
p3&!A.^3tDoIbgnrm`q/@2o;E2E^OLh,td%9^NXF4n;!%i:B,WdW5kIOXaG9b%)&PG&l>GeQ
5+h.>jVGF,2o0X3GpK'>V.,U$e:J1,pgUEj"2k\2g&31AMaG4%R#=l'-OeMWP<a[6\_X/@JT
!8Hg`c))5rW&79ulN(cgm"DX"OW6hqiMq6uNdfB%h"/a?G#p<k.$F&+-n+\WL=qNVBXGX6-@
8]AR4\W&c*QeaAn*>mjmX''oDbM#+=)LB5BLHM%Xc1)p79GF<7XaB7=i1N-P@cDN4akCe@S7<
H6CeB<A)SMj*3?=_j$.H.5CeQ4mSic[k/2tp%_BV:l(%r0t)/s^hP3P8\3YZo6NUGT?^2#ml
CoHfJ\fH6:DXtLf^e9\$2@@n76,XAZbHN26ND27:jm@SnZQS%9BB'SeMVhP0lM$_.DDdX<,+
:QOt+T&-+hE+?)WaIZOXhcW@*"?P%`QcfBfs21Dh:!TJXZO%t_h2)J%JeZ$5r*(:oZ*,$;EM
00K\kT%pU.M7dS"M46p+.]ARl9I)#K\]AT5B+G;j#'!;($ju#SbBFc2TJ[UXJ&_[H7)J\4ArWC
n-::hq)0:FXLHX5S.53%@'CApHnI2HkFlZm`u!>FH0n92a76q'h`pr93/`Qe?I+UY6A^$`NU
'"ioX<E3;(m0GdT`8&FY!*%h!"KECXjKM2'P+)+Ytd/R\_SA?%8ICI4D4t%!iD^Q'%bW\sME
T"9Qt>qohL&m?8u;JD[Rm(01"G[f&Q3/"/NaKmKEL@tAkP@.!>g`C+6@A_ph<f?e<j?'%tp"
t:m"b#$TaO[6ZkD3aNgZ)X!gTMa6@H)THCiH2p5&((3L8:-8Q,1idg^6KIpI]AG"uGEpj[f%l
cm1AVH,pBYZZ@Vf.U^#S+JQL@4&(/[`M(.j`nV!X:*NREi4.6KChfcaKh4RK8'%\J&KHar4;
>L_#`:We,!W.>]A%SMNls]ANG*uF6IJ<dn!r\kkj2ae;^lml[p%H/8_"SY3M\>G\8[U+bda;W_
;=(1bY(Ik<O5ml5"]A?OV`/Bf'(&PiXSJf53f<^aNkX&caTIm[5Lst%a.Bkp5U(Vh).kPm0Oa
hp6p)Gq&htC??^t!\F>P)8^nq.pQl@VmK+sqM>FOXq;LS3SPg_!?;?Y7IP6?,""Y1<e1=:Zb
POctkNqZCBdX0LKl,FIFMEubpHEENeB@6eA*tgPL60oBb3X#qrZ"@%T_]AtYT2@B/r\mSJAhl
Dh[lOE]A*Xk(^l-i@=.s]Am]A"S,[V.`&Mubm70AEEf4'op_su[MYF%k'8KL3c9qP6`p+=g67<+
7=B8VI&/7(q$Tb9=IH9N^=YN?[AJpFRCQLk:lO[hEe$D]A@=P2"*0+ms.gF^O8saIpGbCT^i'
Vq`5\RK&EUS@Cnf'\<N-BG-\6ksUXVBLfkU4_JM9GfH*83C0h_Jg"Lbg'3+88A%q>EDThP\8
j#-5>#gu#,neZ66H+]A8EfOoMgBNYq%4Ft<I^0<^E44[^]A>EdS>"^"Sr9f/eYLf78>N]Asi?*o
XiZNiP+jRdu9>H2.;qOG.37J3Vj;5QZUfW$f\]AtBp(+s=?L[E748b\22l>I0;5m>C)\16TXF
J3kF2Fjn)#huAL-)R_V>Ref=m^3[#Pi57C?(]A+7YVCJ*^7'R/*R0YBhCddPbIsl?-Vn^-XMU
,i9X4CV!"3`<#tqW6]A$8J)$C*YQ^A(o+,#m\WA`+p^f'(Hag:3.H0GnWYrf<,2PjZ@qIG+T/
1!%!3-)5W1.B@2eQ[2J0]AtcojA,-Rc0et`Lf*8rF8Rr5OhIWYF;-9?AD$]AU'Cce1A$98>+MC
#QYY^?`Rf<RFES*hJu,rt:X2-dEH->Cf8HAkE4:8+SKT)fG9Z(6RiSSF>Y@&c/Mp/Pd*AZ:l
)9m7<ddG27s\$*`ehHlm<7]AtA%T^820CEFk8j.!T8.lBdCV<7,8,Y%p^pX`O*IgF(#rDY-7^
/H#<j)UCD^gOA@bc`:>C+W1dON\..TD9%X`^gdD`-SpWNT:qCGdHT:e\?W"ad@r9[fd<%D1a
GJ?83XZ_rND%9>9]AeIL=mi,.$fSaYsZ$t3TqM;0k32b4b+SPMNe?5`iLF0a_-s=,M^SfZkn?
-X*FU#ikFAq:=`hbU4<j@q1S@Dr"\!ah7IihoJFMBjrl)?)c`/<^mGU#%C7?oc`gc)\obCil
VMn/`H&usY`@!^`K(jm9lXINkAf(p'<El>aX,JC'0:2ljtml$B0lCef0k?^rUN_CEG37)PP/
1*%LI:Bdc9(0n>[7;oG^Rs+1h6!,%*Fj0A`:D0(@53P9PP3rc)%Z2]A$p;,Jn5hqU!Z\cdYAW
P'(U:H"l1!6<a<H>NGdbBTJL?>VQ3_i^!.mpr\&:9[>[(08:0=0ZRE-uZRV+-$4\Vs\9nnR?
,*&Z[nMJ(HJWS-KCJM>/?'*C%C/)YCM(P(l^>"Us`0hP8MU#+mP*csm>I!P=!hK%hbu1AeW&
03>CZ/kn_S6YqAru6H\cN1qUobK<D0QNZ?Q$oSd&l,4#^6':"2/;K"OIaU:/!5Z(a,3fj+Of
seUXP8(Rnq$XW$L/J@W4f=L4h>ReSX@pV<?!SRXEiM5no^Gr<,CDajjtB\]A"H<T/0'p"[<]Aq
u7^[=&b#[bb/$*p_i$+5CO?i*%j.efI`Y=XG3r_XrqZ!C6k;6ltojJ_&8O/g&5pM.T>p)6t8
srW[<,.]AZl\/DJ8Dk&l"R-nl+fWF0OKF/UD0Op1(O9ddbOP6[p_cCQWhAPH!V6dNQ*OfR?,%
Z%Hp?1jUo0rqEJU5KG%`Nu*W6Wo.iZef69t^B^^oR`cuD?d)Br>2(\Xe%)>hX"7m=]An$"MY5
NC;WPuTYraTc"CdJWUld;+gh-RK_/I>f$>`4rU8YkK^pOKf,+9,Ptr/YWT3/OU0V-+FX4atB
tS[L+1c-KW"dgu8CF/=)sHIALRA5?.4_>c6D[e/hVcMU&/5^MLY/4\<5F]Apu&SCXW[r6i5;^
<J@,@/6!@>:`XRD.sZS%`giBn.eS,FS8p*[gEl#[/Y7hOpihLbaaiul#T*mQ`9%-AmB_;I-B
NKZ,Dm4Q$/+]AOaJ3*hUcX'2<#!+Q7/e#QkL\scHPdABPtS!D-N<nEN'QC9P]AYpr]ATV1KM.U]A
)U\="F,!^`?$:MhDg;:hL%ic3?`0>iOgW]A!(O0sbDF[LLXY?#r3.HmVb7Ya7a`fRP;[E%)Vi
l.i1hE,Zf$ZCi\#@Xe\G-$*WW1!r2,^9HR_s_8md'Bj2bGq&!2ULUE3:uqM_o!a.TD%<dV+7
\dnsmT_/Rbi:3O``^sjtj2/IdbQC[iqX;[I`<6skrBY'_Y@;P7(`:Efn9WcFXX5eZ^mpeg7k
"jPn@,OK7_82'oVe`KHH=;?;#eIF;&K1'6k9+4i/E6I3e"9Kml4[2)[7*]Ao13[5'5uOjV2ct
RAdi:'s&?a`GeIYG6VH4?E:']A%$0\rDp!]A&PQ4(P#m1RtPk0Vd<kE.`C61TtFPL4%e+j@r1>
XPaGA1%%Y4VNNal-`*7dqk"6/A`?0*!i:5u3%=4X.sO9DQaoJm.]At/rHi5Cn>]AVH:@PYVl/?
_[-8W`(XqEE$KC8qg`M-7(`*3Ahje=7ZL'UdDoY75j.(goG(r*-]Al_ODe!2o&os&QXArpWHi
S[/BdpW+FLl+^0%CUJ&n0a5]At'ilsL_!Leu@#;uJ[Kot:Hiop4DgtU2f!aij8ZV7P+Y8%U[+
ococ4^51-Ig5_f3@\)DK-)e._h%Z+f/7J$lP.;%TZ$Z3\YkQTWcZh*kA61T!:mUn[r]AP2e6k
XsB-XlnbW2o_4'A_P";'ZQ2g"3KkhdTGcQQ11qteN8.!CpW]A&e@^Al?.23V$]A"G/3g[cJFf5
qqRU1A@(RX_+@E5QpKEOPAfY1-3\U;XX@8!?c5kp2gML)S+IEnn'f>WS#;<iH6o4@rNOb"\H
4p#Ur@t,daO.q;P[6`_s_!BR]Auul;Do$q\smj;Uu'_dfqdSqTnW3Wj_D$X/O@Vh(o2YRh#)*
Ss+KUJJ6]AD2_lT<PgO256L6'85s//)Y?ikJ>`d]A"*"*h.oER"H%@Ykua6p[HV%Bh9;9*f76k
rNrBTIBAtk+%h@p21C!X3XNCZ@'[l^BDY$lFm*Vj:a3HCDPjCeR,NWlH5IG+9!>~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="310" y="0" width="321" height="298"/>
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
<border style="1" color="-4144960" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
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
<![CDATA[720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,720000,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2592000,2592000,2592000,2592000,2592000,2592000,2592000,2592000,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[全局看板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="1">
<O>
<![CDATA[销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="1">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="1">
<O>
<![CDATA[订单数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="1">
<O>
<![CDATA[销售量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="1">
<O>
<![CDATA[退款金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="1">
<O>
<![CDATA[优惠金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="1">
<O>
<![CDATA[客均单价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="YSJE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.SummaryGrouper">
<FN>
<![CDATA[com.fr.data.util.function.SumFunction]]></FN>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="JSLR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.SummaryGrouper">
<FN>
<![CDATA[com.fr.data.util.function.SumFunction]]></FN>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="DDH"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.SummaryGrouper">
<FN>
<![CDATA[com.fr.data.util.function.SumFunction]]></FN>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="SL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.SummaryGrouper">
<FN>
<![CDATA[com.fr.data.util.function.SumFunction]]></FN>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="TKJE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.SummaryGrouper">
<FN>
<![CDATA[com.fr.data.util.function.SumFunction]]></FN>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="YHJE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.SummaryGrouper">
<FN>
<![CDATA[com.fr.data.util.function.SumFunction]]></FN>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=B3 / D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="3" cs="8" rs="11" s="3">
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
<![CDATA[利润走势]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-8355712"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange minValue="=0"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList>
<VanChartAlert class="com.fr.plugin.chart.attr.axis.VanChartAlertValue">
<ChartAlertValue>
<Attr name="警戒线1" alertPosition="4" alertLineAlpha="1.0" alertContent="警戒" formula="=value(&quot;ds1&quot;,10,1)"/>
<AttrColor>
<Attr color="-65536"/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="3"/>
</AttrLineStyle>
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
</ChartAlertValue>
<O>
<![CDATA[平均利润]]></O>
</VanChartAlert>
</alertList>
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
<VanChartCustomPlotAttr customStyle="stack_column_line"/>
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
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange minValue="=0"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList>
<VanChartAlert class="com.fr.plugin.chart.attr.axis.VanChartAlertValue">
<ChartAlertValue>
<Attr name="警戒线1" alertPosition="4" alertLineAlpha="1.0" alertContent="警戒" formula="=value(&quot;ds1&quot;,10,1)"/>
<AttrColor>
<Attr color="-65536"/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="3"/>
</AttrLineStyle>
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
</ChartAlertValue>
<O>
<![CDATA[平均利润]]></O>
</VanChartAlert>
</alertList>
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
<Attr xAxisIndex="0" yAxisIndex="0" stacked="true" percentStacked="false" stackID="堆积和坐标轴1"/>
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
<Attr isCommon="true" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
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
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange minValue="=0"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList>
<VanChartAlert class="com.fr.plugin.chart.attr.axis.VanChartAlertValue">
<ChartAlertValue>
<Attr name="警戒线1" alertPosition="4" alertLineAlpha="1.0" alertContent="警戒" formula="=value(&quot;ds1&quot;,10,1)"/>
<AttrColor>
<Attr color="-65536"/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="3"/>
</AttrLineStyle>
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
</ChartAlertValue>
<O>
<![CDATA[平均利润]]></O>
</VanChartAlert>
</alertList>
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
</VanChartPlot>
</CustomPlotList>
</Plot>
<ChartDefinition>
<CustomDefinition>
<DefinitionMapList>
<DefinitionMap key="column">
<OneValueCDDefinition seriesName="MD" valueName="JSLR" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds1]]></Name>
</TableData>
<CategoryName value="RQ"/>
</OneValueCDDefinition>
</DefinitionMap>
<DefinitionMap key="line">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds1]]></Name>
</TableData>
<CategoryName value="RQ"/>
<ChartSummaryColumn name="JSLR" function="com.fr.data.util.function.SumFunction" customName="利润"/>
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
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
<FRFont name="微软雅黑" style="0" size="72" foreground="-8355712"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[[(CTgP%iZ0hUILmC=?dk`AD/:;b?CDbEV+[<b?6;.?OubDCER_<_f&cDBs+fTp]A+V/r3,6C5
PQVB"6t)\=b7+b+eg<RJVF[l[GGgo6]ABh+0OqIH!TTYm)Si[cL\V_CMgLgmEW*i<ijqmk4ES
8.oraGY#qqa@^V`mT=Ytn\.pN3*Bj#KZ#cV<S17!Ic`,?V'MJZQ";%qe;ZGI!IW/*WVVVH5-
clUo9lr#DkG54p^ZB"dR+g@NEOERLd6HKY>,eL6o&idj;EaU,j-)(hkIe?oJ,e_DG@o0tO$V
>[(ou(L'N(K(!Tr:\K*URhpR96N)_20H.Cj%7Ea3H+C5dqFh1c=J@G]A[)U;0!AH#2bXCa&)B
mX4>5ZUhld#ghuC>MNi4cSc.\U+QD6We0sIp$^l8f$Kfu0^C/D'*2R\Id6'&bDe@#KDlqkCc
9eCLc9\hQu8g5g:U]Ap5k[m;-K)f<^P3s60kQLMerTid7+aT[UiRBP54(48XpP<]Adb9IR?pY(
J9bZNu:0n0u")Fc<h#M-g5@PGlTC_)2`0l2PCEeDLf_5#m^7!a6q)'rKB*"0:BqH@.AKKNjf
-+0(eo&e.g!,R>rh@0=HmB?Z*bcgcmUg$iXnY4NV0HMkHH5WQdJ/Zqr@3C[)hpe9MP/KH@jE
h)\p@bJm.*W(lisZREPRi,/rP)*]A2&&laY@2N'S!:5XQ'^S1/hfiE;lBh"r7Y3!J4Z\Ma$;(
,E%UpaQ<ARk%u/2af:q6a/4Jnoc`NM`<\>9I'-?%gb+_cDIhi<5iphFYq]AY!@Y7g<AEL!V)*
!*ti/ri?NK:2%PO[R.p%kPNkahP(Af>NX^`S@:F5WWM:M_4CVZ@E7gjp-C6HRP=WIBqB0FMR
-I:fqHCP'Q0qQ2+6^]AlTGe6XE\o,eW7-$ref=)OFOCErU2)P8C@?8F7Hjtdc62k@s*#E/5GO
%)T?h\sW]AK1-_V1C`p6^Ks!PSo.O@JM(\ur%0Hg2TT)Zr64^>0naPXah)(!Gi@fi1C3:(#]Ao
u>K*3`O#SrFg.\lEiQ`X'0cSZW#c2u=)Jo&)_qMUAB=_!s%J6.X'F-bg'dH@U9I3m;.?j#oa
=KoVTFDUi@s&91"dh>kQ(q@9XS.T$u->L__Sf_O1Yb%91m:.R_eI)oWZhC8F0/>)[Y![)-oE
16(9H\3#l!KbT`_6R*5t:B<d'b/@j<<a%]AdXV:@"*%*aDaWI0Cr13"Ys0<7V,%S<Ci9Y_#N#
6ai5&cC;.5NIeB::)ilZN?ldF/%!d9nXO4enCWcTme5(U3W/L\e\b6PpcNKZXrH%>Kc'P]A3L
[)2Gk(p)<m0#@aEEGPuBm?mspoKgprm&VejTi^A;B[191gJF$);gMg.cno8\SgZPYbu.,9]A'
aAXVdu-hb6"eKU)NNOu%SrZ=LSX?uVnpaQKT$ga#SAAc$,B#OisMH59e$_>h#Qoesq:B0,Zn
i#8iNr6*EoIjhJsEc^4^JtZ?,%@p@(='2)@1\*f77U?W^Zo"1>h.2De7e4O]A!9)_IWdp/hrt
A8O'qhKDProU_V8p+B[kRe%+#qg=RV?"*Vb844pM9qq%%a:JSnP]A/<.Bg'2G%^QR!tNG1M>.
T\OYh2#9lW/Bb'=Zg=?[ii^aXrN[u5aL3a#+Ftqh7.dh]A9s!/g*fPYA^@H1rZm5iLk"WH]A$c
9<e&`q>Xpgkr)n%^J,oP"4)VR[gPUnS@5ur]AS5"f(97?,+e#+c+pI<f:8JK#%>2O;3B,/QkU
ETbXC1$J-498N,JL<QB;cAjRqfY0U-l+bj/1W]AM^/j%Vr>:)F4Xk+7,I_5[`$O!9==',fb!n
mXO:&$Ic>/gt6r[m%Vr?QAphf_`jrN7sZ9e1Z%Da,D\O&pdI?C(?3Tc0tQX7FY15Yn;iO%b=
sqg^+iakZ69d2H4:hI>!VR`,_$f'Z;1&'oD7hRA1Y;kr`(UoHS)6-n?--U#>30g#HmKJ-"8q
.SdVN@8./0U#k.N[/e,i1ErH=./1.Z?7fF3hhl\<L+,?2fZ47<>._G*HD^V4.1_ECO.6jj4m
ISBuCcL(EZ==bH?Q5[Wp!GNPHu0Noo`*_M8]A0JT,E:Q6qR[-K_0)@<SIQ3@dr-iN=XA;L&qh
n?LTUJ(PJ;T1jtUtg1kbbWa+MhV:8j?%bNL8KL/63p"<RL_Zn%uiXicU3<T1np@>=Cc6[/1L
O,XZZ-1!7Xj-X)Eq\+`+5IeSu[0J&Bl*3pS)_Don_2$b(eUZ:X2L@1+6?]AU)/ItQinXUbH-M
&F'Y&rV9\:0aMpc+[M(6Qb9h?*a(-:'Iq8Od$R`"HRsCtZRbY?b/\N(,tM:g.R)&1j+&)Q;b
mCK,_TY5tIK%h;?!]Ai`6)idTl.S&_@NjPS4)FXSQ.'SIHl-rXDYm_CB3UY/ZJk09*,dZb<7k
,OPFh3tU^-6r"(:bW+8UJRDmlh;[KjHqK?AOb-II?Q]A<d)WSrdYO4Uj.;H07MkaE4r"8<%2Z
WqVECH[=RadIq).m+A=D3LY"o\JYsi$F%2V^<enu5^j$CHmi1C+F?/XC^31M)Off)m"<;[F5
8"\6qZq7?klh?*QZZrRqHbq6iWRg2q9:R+1?[.K'%[#'DNA"KroTdbT@p-9Zhk%'kZ#`S>_7
qMD+mY0bo?!68*K_Q&-]AgWX4Pf=3Z/P.Hc754Y]Aj%)Q2`(XMILX`uShrrb4El'uf/^"=?FN)
cQs]A\?'hF8HeY^RYIV]A1s2*./5QJVc/9Hq/ZS2-+S$ihVd&19LPKrB&0N'L&.M>Q7q-).ltG
l#tD0\tXW2]AblD:dl""`2!gE<fs7ZXBS)2ZKKe]AbK*Cg>sFg=2[E3PWtku5/+gKdIr)a;Q;o
AD!ThP:m$3=.4)6l1E66prFW`dZQcsVK@"mPjq"Y%07G_jG`)a^Eck0TV<7MVNd>sP4$TDgA
%bhb\D5`r1O!F2,Kc+X"\`akRGI/1R%DGY>eX8rrq3]AHuBb5%lW%:5O8o-\2rW8s=C]AW^QTk
GKZ3PMmg3P3XbB8HGoIq',F!-d1\O?<hjeSD%<)':O+cALO4gf.?V=7ATC[5[/e_h/kJLq99
_18qMsV5J8a"hHU<`u+jua_!c`@.l3TnlppT:-(ML$54ZMj);O2FK(#mbu6FX_kYa]Ap]AjH\%
lj>MjI)Y<#7^9Y]A7M-#4Pd=9Vc-g+W11q`ohCiGD@Ttan9(qlbPH[-ns`E&1kWaE=$k=.#=F
UoN]Al&Xnj9jEMP;go)H,C_`#<c>-r$V!%%Ugrf\!*ND;iUR<3IPqpHa_/*pt-pae!H--Jbn1
I9$&YQo=Vb[Ssaje1q0Nc2tgd04#!:ZrJ;r[cdk;8X/>%o\h5XC7cB;(95\d3:OF+A+oR&C8
GfS#G4%C3ud=+`0I+!C+i_.0-QSe.LtX\%W2M2.9)lLbj"M=cdk<%`lXYpI\\Ua]A^FptOh8I
MnkSIDPd$]Ac;bF!lN/#!sIVg7>M(H\i\p.cNXB1=7KrE#Sj>pQpdnuYigA:?(T"NL)ANYt/A
!2un:IAjld;3=Or^V:u->g[L/(NtG&\cQAokdsV1]AERP#6RU<-Tj.(nWHJ';n9-h`tIJ]A0\3
VYV7?4?+Vo/H3hj$4IYINflc>E-T%OYRF$[Q3nj#0_B^sNi1ftpTj(SEFN78rbf3FTRO=lRO
ne0SM]A]A%Ro`;&KH5C^hjSP1uIVC*%#4BJ,HBXXI&^fP#KU0cJD,bm$-6&.Eu@M0_VT72I,SY
hpJmL.qJjPqkC0u;J`ic5;:AGhiUkIDJ)92-SjaZ&Fr3[a&jjFGhKP.CP*dp#^Bh&M"Yf)5I
cq?\:L$!$eObU)Fe)A5U$g`A;%mM\tSE$t5;ZG7PD`m(W$aYl)BQZ1/5oKJl3A^6VF?<VX=Z
(^p;iReTSF-bl-d8(o"K"c\b-mJS@`sUpt^:OC9%=0V:7NWgW'uspb\FHF(+mG2(R%Id3Z_F
oc`43FbS*oVek:GkXTquX:$[%Vq#*]AB2*>t9a"&;/ZK5C`-]At$G#AU#EAcc63dK0DACWFZ09
LuSa,&jB8H6gh-uIQV&rK;r1Q&&l%4:nn2n6Tt%=g95tmG;?8^Duu=H>A/Jo/a-H2KlhfE/_
gEdRF?WHcAV'G*R;\g08/$=)No:,;*Gh1:rC?Gg))S8gL$s=a[lB<)gl(qAR3;V#T8H^!R'e
de[ApZRR<1qLAj-%]A6PfSNi8^_LjX)5).p1K\#gV:_Dj3LR8c6>/NGZB7E=<l.0;+dY1#-'^
1"]A-ofAgdf1_l7k'4.ELcH[J+0]A(<J*M&1M#6*33almS]AVQJskOXFI.1qG9ns4olHM/3,9cr
Y#W!U<SLJ)MH[Ms@?_76:)CVJk[2JmZ\OTOVcGZkk-H74]AuO#;U!ZS'QJ6<!O>GD<^BA)j<N
DX?<<MIp#1_<f;G6ct9Cq,g\Y&6pMYs)")-9jPg#4eq]A3b1`rL*DkO9/ojt..*9U<2dWG!"n
ULFrr=hPB,pcE1ZA/MQK*I]A0CM"E_]AGoZ#Oq6d\?C3U[L74t*o6Zm=nL6C$,=T2,h;q*\k2a
gV&%T)XcE3^>JlI"cUEjT.\R+md?B,712n*UN5Sh1SI_hUP&Vu,#0N@*gT=p7Wdj?P9s=.3/
m:%8dnL_EVW!2!D3LTYVFhp"p`2]ArA#Qgq0CI0=\$bhN&`C$$<D)>Q.`2..pPud^kIM)E6c(
dJQCEcCh^_CoHH9B]ASY[*E'.uVAf.XCC6,F:F+ab'bH<BHjSIZD`Ke3CL%C^B9)3j^)1li3;
Tp1gHGP3-7/nKtD&>e1%Y83qAj,rctm`#PaiFp.7P2Z?(<VPeD=N=[/+8"'Na"GUU)8@Q#_B
/X%<Gf>HiI2HL,o0lKTK*%[:MY["/`d.LY2d1Zr6*^/\R6VBIj[-"SV/Vc/bQ-;3H8E363.J
RqrHObh/cXD?YT9=h-%@HYQYq\=0[h*CDqO$`AM0/8fd#T?>hl+/EuYHPmPP56I7cZ$cRh+?
Mo>b=J8.m8.*ta%Tkm=p)FZ$OIWquFiu-bA27]A>,ZCIC.ND`CF\(tLmdrgVp/#+7p"IKB]AHN
mV@rOR_jdpF@a7[*6:.qgNif]A2bdHa;rKe8r3./c,AG?eIA9MlnVg6tB]A]ATDKR4*FBXrGksY
ID[<]AXtb(pP1fJ>*iE)K.X(ZDTPBaDm=F`*T#$VPNh]AoW%1h[c"NC0QOe@le5^'YEhsSU(Q6
CAL\OgSiLP?N\<^?ff#U=%^<s>1&"kN7@Jb6#"^(^c@&kis=gI9RNY.c87I6.;qieN#NH*&C
PCA.#I\\^sIc`i<0oTF@-ko8Z'@JLMkQ'CKO6=!k3I`ImEmo'E:UbB%/%Tp-+*1[KED]A-qWk
Pst5pbiIT@59refnn]A84FM:#Jh<S(fRJ$_Xr4(_FQJRe/TP;&Dsb6*lh0i'g,AFmjeCR<?dX
.@\6@^_]AYHcRN]A<tZ_s9fX#Cn\J5;\uu1uWokK'>sg?/I3^QrCSS8Q<.teoorq/Q$q]AAnY;0
7>5,erP>]A53Hb-p1<+:kj5n/0WDf.OV.78epj@m!ljK-6+Zu31Z;D;'9K;T/'C>#<;qXC1gh
F=r_iIIYGnNXU?IXsL+BZ;_%.C&)dR_tk!0XML;A24cV$nd)%9\=4@F55nV5GkK;)RN<h>#V
(eVFpJaTFOlq$GIp'@ASd=6C,tg#X'3lZLIi$FU%kO173_(A,15+.AJe)$*cpPOil@`bs;QK
H2r^R/<oAoC?F"Ou3\LfGnSRAP`rjTUqCt$/ft@-&]AY=hL=j-c4kjkQ/?1#.gk,t46Do-UtN
.mrafXLfP[s>m=V6cKq:<Ca&cMl((1oVpiWi@kmQ@?7_,ktd#"/X6:m*eSWOT7HFj2n1#QlG
$[l4qpoV@3Rp@#SMhYe76-3$5P[q*7L#]APqIm56kBhl4PH-QlaZ<mSc?OG,E]Af0lZr3?q/O-
MZIrkJ<gjp_uX9-/T\9B)EK5lGAYgX7S_eM9GI?O`TWm?bffpRdMa5)-)MY5e%,15Y,@o5AQ
ro;<&#`N8kgX%Zhl$^'cEN^G`hm+hO-)EZW(?W4<%YL+hRDaqt`C<[&k9/Ok[-@!Kd*:pW:7
kA">2*7>YW&nK65<f'*+L?1+72K0W+n0URM.HfB`A*p\s"n;q%^j1i[mh]A-HD`@_aDUg*6iR
pcqjc!\9C$_d^VoD@I6[P2#n<5^H)8F,O8QE>]AB.fKb]AT88V4<]A/Tml4IOo>;k4^R#QkW^f'
Q(R>0WEB1e&7=,V;#aS/ZBpN8rDD.F<3VUP1Ek_,*oMFiE[[?V$5;<aAVNICA70s1`c%S%9n
MTiRd/2/>cN\9AJ"VnSuo;f1`>/ee(%er*I(#ET04+Z^>R&L-m*q'j.>YJ=mkFegAG<"qlgK
NE^3iC\0=]A0hR.W]AiGek[aA9`@OBZ)Uj+WohkuUZ7SM=S^V\2o]ATlk0H#F`#68O;N7I)gUQ&
a[N%8rd4e"3^fiI!&\-8dMj,T5sJMIOc)Ukp,)Jb!Qj",hCn\_JX=5RSekcf["-QgqTt:*gE
/D2[G+;@+7RbSmre,)N2'G^Aa]AQ&&Up\)f^/MBXagSaW+a[RQ[G'V60,!XK_TBHqF,6s8&:l
a%S!"*!P=Rd$(FAI/I2IX*ja6i&97j[4Y-t,=n@1_@ul++$<o&iYCa@`2^Us%C"A=YV(>*'$
!/k1%=u&eE'^Y6c-EOQLA0up:B"PRdK4(^8oBUCo[7SDZ!gk!-sT?D\=cV[!`^\;35DkqtW3
EnN056Y5(M#O>Z%aT5\c5X$!s"XKBj3IP*jGQ8NeCr=BO'1UpO'J4R8cR83`nH#KLM9YKko$
2m:)o;^g'2jk?9l<)uqXn;HgQVZI35Be-:B%T%nXCotP9p-upcOo%J5Ud3gmOS_G1hU*/l4P
>2b_HD^23F:GDBEoM\;p13iWd_KO@deo1t;_ILl*4:]A37/cZ3Rj9\m/+DSWaJM"l+sLdP*9r
feds0U(@Y;$*:u.bWe`@E@EJdr5-^uHRJ-]A<hBCDpShcOB&9s9[EKcR@nH_+RWa!8#RfnkJu
-dEm!!/i+ZWG%&*9G3mb`N[fl@[:aRG-s:@c:']A^qui-=:;3BG+Ui*3M\]A@KC$QTcOn<+aN;
Gk):KC*Z&["^+_mCQ4;P1#]A\0#l5E`bZ?3s[GidO8Y]A\li5uo3FFQ^@=-`R^O,6`2d0sgc.%
-0MD?&;oUW-lFdk&1e$/?)2>BG0Xl?lg=9jZg'FTG2K`:ttnsgt$N^[q7I-H#-T?B#lS6C0b
9Fa^!^SO9='3M7lu)%[I8rU4q@4VgAaCp?Y.rpGJ7_fh#_j[UI3%F=08R&CK(q2_W9S%R%#q
UZV!GalsMQF[KHZh]A[:"KpDd9QTK<45@Z;4rLt;s#2I_&Q#A1j!^(E2"e%G!M$</&]Ar.=qM[
ClqIQfAV%"Ke.!\G^l^4U9P-]AhjlX6i+mfDY^i'`SO#LWc#go\\?Is*pNcA7/9s`=MuDCuD8
RG280+3[[5D>Q.!OccA!,k7]A7nNBUSHD1^65&=*SBh".(AUd\L^ktg[?]AlGRUUVBAM?N5TFA
D!DJb826"N;@.&e;28^obWCUrh$%`gPH2S8*jURh\Y($2dHAkB`_hIjkk@1$[9O;j(dlZ8ql
rWdo2j7;Jn^`4"3?e,@fMt+IG`,r@E;Sa682\gmh'>b:s'OlQ<0fUS>Ii,#h+iC]AcQ`oh[@K
4MHe;VaPF6:t-.K)]AD:#iM:!Pj=R$\Qh@f<B,>.G(De^hfo(TW>cO^W:>JHbrJn#98CB:a(m
Y3D/_,d.S[mlaK\k7Vrm,3nj3@DDQmbF'#!*2tQ[h"gN3rOS;'eCQAfGQ`qgA^]A-uI^N.5U7
%B:SJ0a4!3jpG1oM*tB1L\9X;b7`-<B9oF==M@\S.^))+t.=9k,i44RAgJ*.;]A/D2V37/,3/
t9pK)3:R<M+l6!X<2]A!=CfTj3a(g^5"GL!Xp"m"OoU<8>Fm0i'5\>cFSnFOg_q$J(J*#[9/e
tOEP$C&EH-PGoi;b')\>eE<+tQXB/4A<<rNS\8]A=KH@b]AoZC468@$k2%-]A"L4"3k!nWS=:ao
n!rKb`@f9lks8U4j_=6DMqc.t9E&,m<=;K5X\8,[i=bSj?MEsqiQu@_Ek49J>eWs(hr8dk@a
0*P?46^rm&f^-l>$W<B%G')4*Kdl18mfQSQ!%b<fs,cIIF;iS%hU;*Wd.+fKhTl"5hHKG+d@
llu;ZQX!&Xi.)BC7G9?8KXsLmi+DeDDn_c;t;MX?>#iBn/p0dMJY$p43<^F4uglmT,i\e"r2
demLWW(heSTZ1,n2ASb[^f7RR.\7Yaf^qn\<af+\!k'e$r`M(CDA2X-pMrpn\A)d423hB*P-
3c@iQ&#6QP'R`7e_jbH6p,e#<#5SGVaaX1pc<P;/9(,'Rm<JkGe(^V*s?MEA?EQIgWRRC_>7
VI>=!+.73FN\25^O_Vd1lJMPH-bhl_9^bV?Z>2I#D%o$'"p-eFr=>Q=&T`cdWMq]AI\EN@-Zi
V%AHp:\3"m)#X@k,5)!F-[*_]A3Y1_na*9FfGN`dK5Ddrmc9%;qJX&fJckMqBboaj1scF<;5)
A2jp..k0B:O(Pf)XQk0/8.YD-3(GC6CDPC4H%`?'8T%@g,Sc2N!<.5KX?[s,jH!5@4ao;D=A
+@DEGssXUC/ca<Xo7/$FJI'5FQjS&Ugn>+-rtgH:_%rL'MFiIl;IAd@laPR\c1<a0i`V5mo!
=W)D>0.cJ4b61Jb-^^E@h.qQ<!.@FaHVPc`p(86A.&eUZbuRTW<i@]AGl(=#C]AF1i5/-Qkn<K
*Ef6)04d9l.DB9D%bKV/?'?63j]A_G=j+VjLN"b*ni.8C]A<@hDgI-5iZk&cW&E:VPagN:`tn%
o,N.QcsqiA4[XqUU/)j5C=1YrE+n\kZC_7%Yb$CfMCn%OtbSZJr+qh$FjQm8&1sEQbOu>4Ob
d@gPE+fMF+jal'!VP"O-X"_L3B72X,YWT7um[T\V^fm(/joh:-c6Ck,mj#/VM%Q>!9K;\TE3
4,&J7]AX=U5mC@I=$)+#>+"7;3C@YjiXfl=l69K>TnkcJ0%eV]Ao)>XU^Ys^$[Z_U!;@$Na?K`
VQ>2o2m2WS/N#e*I=8D4+F>UF,3R@k;aTI>noD=H>!Z]A'Jo`h4I%Va%G>'2R21!n,3TB`H`n
Z[Kr)L@G9E>\Pn(&i"WCG*3og=^W.((;8Bg4tf)00M103LDEm)&fOAG*>M4*oiK<rX.]A>5do
NGaX(m@1Asojho)k0g5.62;:I%O*GN,=uY7,'+VKeo6K+j*g2u@<,o(`PNp#;Tk44IBuo:u6
un3t?Dn0KG#G]ADNA<&u?ggBojikcr2I1sJgCYPtYFm]AjiSB_LE@4E7$COo.Ca1UN*V+^6ik[
VVW(kYk;BZ2t?(DOTd"]ATPjQL3:2`T+@f9PG45?63?QqY;EXP)2nFsp!:sp21g[`6f$f/*HC
"6o*@*=-*c:$C)u/Mf@O?lKT"t?T=AO3!k+6%`5;l2TLRfg&EGQkjS">VQC*"X%%mg(p6#_*
RurnW75B/SMWAVl%Kf=snJhcKBl4XKh)Sj--;9f9\l^^J4\YZ"/o=D]A(-I%[k,MW.0)i-&Th
+m.:Rq_LHjL^dDKa[(:O&Q]A9:m@ac6D/1XcbsN&hjjah,(/2pUX_tjc"1HVCr'IT*ub^UMu[
fa#QTInD]Af><NN0'70:[2o.hGG-rHbmV0;0$YNm&QYl(O6C@hOUl4W"rjYJ6h,0eZ:Aa)DC*
iQ@?4AP(m6]A2Ni-YMb:D^T&=Q%ib3d_4EWgma=(EkNB&<]A<61F[."J(5*T7F(oGTiriE@=)k
+R"a31ug(EMLh7=<+%KnZ_qJLq$H&;u..GtP_Fn'%?f5,5C",ggFJMPSc))uFA\USNY;\M^;
T060@hq><+QI8Od'[XGXEUa.SHUdfHY=SpYL'[rE6Rjm;R!0g@fX#,u;)!A]AG^?%68+<sE_c
c28,`@p*oI=EA,H6mR2Wr-'0SWP?pTV]ADEYoHMn2L^Gpmm(]AI)oEN;3J@<,T_qsBoDqB9Z+C
tiu%.U[<NhqP/5Xb-Hl&[pkC:jCd__P5BPkC97R7$W8D@#Rl$nA&S&qaG"-.DIS^6[08sOS4
SRNI[NSA/EAJr(_]A<Y<TH,^8L);9D%NR;=36R<GOM&.Yg#)Q:!3qrNhACUZooAc-?L-9Si&#
PkW9!b-DVZ6"D6C&MW7DY:;Aa$&=99E,5]ADAM^A!8moi*i>I6q\lq1auonC_\lgkdP!%E888
X5J=AC9&EP%eV<]AG9.2s!Ud5k6d\ifWQ6Ump)+RbVi]AkqF.u0fdY73BBB*Xj"=43\44(^rVg
MeCn8@/AUJ>4FJski:3H%cfb@j]AR5$0mhC1obkPf*.sUos#G=T,I2g(r`-&_l9tR_h(DDT.5
B="U2g,Wt<%/(c,EU?>>M\r;THqf5FLI3rsdJa9Lch%I;h0KqN^<#R\(oc#5,Nl^G>Mof<km
O?S#O5^m-^s5,$mb<i10m4!d>.ln;U&DirlJsG5fNIKch?#&[;41jY-0C:=.NKVnK_E'u'BS
1C?Z.kn(bKMGn9iIUYE$_P3CUm@(\3*q%.(`R[P)c3!<d5ojn>aT8X,Ffafm6Z0<sn\XRZBU
+(&Ok(+6YkqFpF^;Z`8oJ^e=k.')3+<!^`fG,9(4,NnP@@\;Tg>Eq.Ygnpu!/8&/Q$`)o#H&
mt(-'MqbR#dfD3jsV1%'J#,mujQd>XJSpT#[^4o[5,crFX.?1`Gb!otjB6cNF&`b@j<m3fG-
fG*;KWL'JA!m:2%h0,1_Fg>)%CZ!49I$!rKMlJJC2p?AhAj)V^e_b*0Zl'4^(07/(i0jgMOr
D?Qf?SXZX?G2'om>TDi/[Tem'h9a[Mj`Q[rW\6#T]A+H`F,/M=>%E>OcpX<s"FE+$OuePFB^s
77;[IK3frpijpol<9[LIVD[eVD4:d+W-C0<s0p@#]A`)ppE@cYZoGSWC0)l8H1%!gk5m#/0M"
>O%m&XqT4$A]A6A/3:F!<Um4E!XNlG6cXHL9o)n.<j!e,,;>fV;:\>T!DWKO5+ZU3(Hdn)%(W
9b*5uG\*:%6/$bY%Q&c]ADqUPt>o_GTR*N&4aYiOh*OLc1@^Y:kYMs)SVO`*;8G&V*$;G]AAV=
7Np')Cb#3($fHA+V7Yku>5)^kdW8KrHC;5MV/AnuTiSYrl4*BA3"n-a@S@n@rDePkn#.,olT
479LK:&#QE9;M\)%a=/q6`#H*4N#7BWlJQP&KbQdHDD&YrI2_O,+<<\dW9R)e%6e.W:]AEBsk
I(K.hhKX&NM"F</*Q1\(;TD^_j6c5FBC!AW:h`5+L>q96k:\ad?AW:K.5pc\VZ:&osuIrp.F
IMB8$KHT&,l*P$_3@"/;=&1d9=OdkB/C-1:=+`3T*>JQ><u_#^Fm?+4<qm-qIj:?f97Bs!0n
\:88RPK,&M8_8iCTEUO')su_Kc`K=cA(c?<-jC/R>H`a#_9#Oj(:K*3h9K;LQ7HMZJ:0rmT7
Q3d'6B-W*@m8se%-eGWIGj$]AWh!k6g9<l%cV[X,C+3?%cg"dcoTOkr03"e3h7!ZpT6\(I&ep
j/OGHQM@AqGiO5SA_^]A/4E>0]A0<$$OSQdpZYf1969k01):q0Ph:Ij/dQR(NO06pl;XQU%h^K
3h-@"NlnAq]A#O>kt,rjb"re17k;IGi)5"^fS5+_i+SPpQg_oe5$0+D_,&$4L!N50P\#/GqE<
aJ2Mg5B5/.\jhn9381"tQg@Dqh$NQDI,hjpe<.9^@"Kj<Q4o9Q1^LK#BB,^FTtLeZm2h#hiV
*o_cnfFqZ:nA\C;c<o!#2C!Gg_VBh(-@OgFBIh3p?UV%f8kOoJe$f!L(ijP"0qtKR3O1TSN\
5;fGuk8mMed.\OSRV]A']A\4KuLbWA@9V[[1"\-gJE$`^t6)>.mm'CZSqIeo4b@:=B7]A"P3395
MRQ,Q^&l*X6L'$bH6Tl;srRD47rjtjt6irqTXN`SW/#LH=N*VBXkVk,JP0aIF(J@$Jpnh0Nu
VA@M:f`k>#$XIiqUR6=MleTQR3=bUh3\)U@K9KbctnSZrEM%5E+e;#cNnQdXTCa'mOr?Q!ZU
,&>PnF_0,H@:Z>pS:Pdq<4*#CaoOk&D:kKLgp2"hqoL7;F\n#:D9Wua]A4q+d@d5YacDpgAq/
V0,87BNST1"'F1/pjs8P6nqB<3qDJcT)THW3.:IUS?mWPF-0YM!&NiK5\R#W=`Z".16+J[,N
O.B&5BC*guZq60[;=-e`Mk6oRr[c!!N@)Uaq*n2j]A.*@@^^WGI.2HOZ>QFp0/^Rq_AH<nnRY
VOulYUYJE:ac_A$P@43-dPC=H.K(N"8V2jqr:1`15P8!h_6U.g"Mc^^$d^7iN#O569YBg1Vj
.MlKF'mrW;rfh\I8)k/qAuTflkkPDI\UTU`218MR/bld-M7_km"^F#_>0MED$e*nsVn9<iq+
O?2as2pqX[edksnm#5L*7o2d&Lb\&:oH\#6'M@_0p.lEgCRf8bMdC/rdM"_sE5F-SH]At&=3q
bq;*2$(3,2@h.YO?:YdZ#_GGF$r#WOe"8d(L[a[6r/?5deLhd?<p]ANSol[,!4RbX=LLc'(,e
F.Y>HG9N!HJDtPH]A-ALI5%E%>PTnVA(#a;^H$BRWrHQ=620PNN$V)0HoS_]A&#eBY(Ta!+_Fi
0.ALE]A8)Xm.6c+2f0LaZ*'t]Ao&L7YN;,mK(X7g&fZ0^;*4:,bO5QXo7)\$%Qifc>4NCY<0W[
>r@$U.u&uEa%oU;Sc%;JqXh5GN@V+RJkA^L-G;;s`)j\Nm`e,j7]AakZ1<K9=jgq=8c=49aca
9arU+C$co"A4>Z=XuhFuoNcjM4EAW8jg=MT1R"GOiqQd_D"7s816F&E!f-D@f')smql1aLZ(
>#0*Bk2`+1mK782XrQ*_3C%XB1Kq]A>[U-99YSY1A"e<`bB>F[l/lp2HQj-.%-]AtJ"L<r[$q*
3FkF\g;-SP<csOEB;`\qr1%.AeA\e4KZbsf[pZr[7`NL776+#V(+lUcUTj>F1!5!@\'-k0'0
fLHsS-"c!Y$q%,FH=e)!H1N<)U5iLJL*Nqc<hP=6NO/3]A8HLQ'<QZ'UIn+3(=`^t^L$RP;!e
Rq:9.#BP=r"PiUXrOANdb^dY!1!Q%IojTf50T`Xb2,*4t">#(H$,,O8aH`3E@d>HLi81\!iI
T3F)t0XQ"j4u0lV[k.lt1$([_MC:BdZdqf0g$eo=D=6(7i%VTbn?j.@eC80dM4YM6.()`@'7
A.^ra;Noho=3X9`kS,]A$9ZrL8\3@<m@do+_mX7nJP/$HZi%JQ8(SI)d/b9T]A!Aaft;eU:$@.
t>/-`*QE&eJI(1n8-\H4X15rGW7EKrF<T:TU'?^K8)ATMQn9Y2tLWaFTRAgK92%%u'CJubpX
gWnajrAP?7]AY'Ca=oaUE-&Y!Y(cH-Aj,6u"G46Uq+DfDpK?J[btZ7)Cl%2n[^(r%($:0N!rH
=_6alVK6>oaAHZ22"S<PJOrP5f=SDR>k3UUiRJD)-\-0YDkZC,V8k3n1`3cV%C=k!i5M`),:
$s>4>1!?JDY46$O\=o+e#Z\IB<Bg@Tr,B/4BRe\gJoR^Y,&E&R20\?O[KQ/PbhQG9=LJGNKD
7@uVe_a)gugcR.s@=s=QsgU',Mg.NN^!;B>`ngWh;Kdlf3a7/2El4e)u390Q@QhiPJM4U"(O
A.$.b(EKu0[.q82B;LY4e(q#`#&a1+H<-,K#ID\XOb*tWiX^@F(^4ollnN^VO'RdEYAN''+R
%IoTA/#6fliWCpeYmV2!NXd&#?&[qk;X2P;odnadAP$6E(X9>C7L753P-U%eK)uK6U7\(E`O
QV\n^&FET9"6'>u^-H&fQkJ)/S$+\LYjptH8+%2OZ*!E.\1>',a=A'OYsHgpj6dWJ;[_L,<i
nIV^pACZ'`16fh@<p1LQE#05]AV(0*u=?^epKX;hK-`bS43I2C2R0B^[;!*(s58AW.AH<m(p0
J="NeJ0UQNO#]A/Kh3&XVNdo2^cgl(qQRni-iFm;5rfK>`5lHmbe>IT6^tgd]A-<#?bOEs;tN_
Z@*:X2Vkc\S]A;SUu1X?7;<_mRo;QGeR=2KTDh0^,,3E?Z.i=Z]A5LI5+=C4Ftu=u&HPLKqi;,
N9E]A.EBQ5"@\)-M0np[J?5emZJs1:80&-!\BdK$7sF:0XCM:`RHD2pjb0@Kc#!egQHK&P<e`
06N-""5BY7fr@UkGF#9fUt-VnW)#)[^BJ`b:3Sb]A/?C1:f<7_`!VT%4oC@11S1PS!QIUZe&D
0Tej,#:t8LZ0Inb[A,*9A42lTEfU2F%EKk[I<o:4Zl2>]A@9f!jR)9]AEPgS]A0M&(ql=]A.!%kU
)Q&F<n:2_:)\@h^oOkkgmoD?%";#9Bf,M2d]AmtFtFcG?,iLb'!("-^U4jWVWLEl9(3!QddsE
Ek1JN?>_+?h+dP2iP3XG:FUi%[Y"".G4^6M5,J4HSdiL^nWC>&?S2Cn?=FLk4@K")g+m7s,f
^;Zqbg\]A\]As>#WfFs^./tXj(k;Js$SK;i^k`8Z(mY)o$8$u-8/Ng9br"IMYWO#akQI9sl:g!
N7CbfWG^*\Z'D&#+R.cF,hXH%?H\2s8DGeOI"3.P:N"qs^!Etn]AuEj'`CP6d'B@HZ)<&U^'T
:O-tWZAo+g?emat)A^9eZ7Re8=!h:eDEPj/>+H%SJIZhhG]AF"8g>!Fp^Kr/:S6t.haMo_Ob-
ga)2XEI7X'QVi1ME-^T34GbOj+HfVD1;Xb+Ma-:\T4/e[?a<fW&fOqqcFM9_aqiafBl2JG"U
23$JehhUiAR*<6W$:A1:PHXK$;_AQO4M(tV8b+c&D`nMIhebRSF`l*=>om5dt/T)0oRgrhk8
N9COmeS(&hjnaHVD<D5qTCUR:9LS*5eJ1@=)u`/KB7Xef"950eh.!#)ce"f7Y`qD-OqSK`Y6
s6@6<ito_%sac==EG7[g*(V_IM>/@l]Ao#IqAZ?G;(uS4GqhFM9/Jk).culI)DmV,t*QPa*1V
fNgOTV7b.*_4nYBeKe]A$O.Y?A5SbeKqD&=>@oK>3$]A3o$7P[[l!Q*`!ZVTYj:]AtnVaCC.[I.
tc?2Ym8H82Fg`?F-ScltX#B^[6\)lAJ2=(l+Ijg_L@!>iKMO2?*m8<M"F/0Rn&\cqRQ=D)"P
B$rL]AfhIdXYOtU\0Sh%$[I1/f#jA$0k5Qi>/8"kmEhG.?5H=Cu7%"*4t?YZLWWh?C,JiC+DX
(OoI0(+54&=4!uiVNJ>p'3b!"BoBdTQ2_O3a6M]AgEE"T)2@l0#OL,<")!)`lY4#R3VCi`mB"
YKMae-a5*rc;@U1[]AMnu_%@ga^&=a<`1=cl]A]A4B\jOiYt*!.L'<1;jj,KeE3UIAM]Ac!"7*CN
gK4L7(#m'4eqkL&Eu\ZXb?`)k3\R<;VEaKtB$.8m43$3<Eu#m1Wtoi/KK3g-X1&O_8ug-JZ6
l6I0pBTl;Vn2hp5B/>/M"-keL`n(Re>m3B=a&B.`k"Y9)rTs3e/?'>L)=U=Jj*65BYPt9@/A
/(>Z!?7R$!`8s'/^]A`I9NS1JB4'W"S2(&6+@$*kC'4Pj=;\mZkUAhc:3Qk%Ud_oe$;44k)sr
+_h_,SMhf9[(WD9K"$+8RT(^hod-'hkEXB8_tU`RltD+Ig9l^3iGR'g8!Yg5.&cdXYLk:NkH
,W]AI^EFhQaK72PT(TlqnL,N%oYndoVCa3R1C^Z@tZT)`BCfEU637+AB"aj@K@7(b+o4YK"DG
]Aoc%bGTpmS3Hr0@b/Al8&Nm[I;>g2Wf#i^9ff?m10H9;k,H0D''B<0P)$Q?R\oinaX-A;i6^
dPKW;2&kd0M:JW0,Lh50GD/>#=<A]AC.i[8d.PVe0NP:InCB>H6q=MY!`Y<M3N`)5iuab8L\j
_6T*h2kd4r).9"/CJ,F?j"P?9*s'\Tcpp$i8s!Y3@9r@`ET3mKh=(g=sHp85e*(o&#Fd2.K6
.:M'WW`i-Nl)pJiG+KLA/?M2+addXLB:\H>OOR><E-DH9Eo4BBZYHj9`r@9JouWEe,B*AF+W
DGDb>o39./k:/2OfT+=0X"/^(9Veur(^bTuk)QaAXcm`m(;NtQF_`[P"C?q2D^?)AAtpdSFC
N#-L-pRF#UYFB:f=m7ggKsE8Ta+#Z2$MWMSO72>"\B9>-_ISH[#XsZ\#r/%i$/b,bj++I[>?
;='gt$+LL[EcH(QLrL1U*=TZIfJB>?EZTEKq2\F:NFf?[_A)A+>\5S5Gk#DHW/b<gF$"G:!f
2di*O5kFY63-XM\R,LCj=57/TLK659b4Jmn<R4"W+AR&[2V&B*klqJt\\[-QG]AL>eJOM*RUL
KZL+=8=i@%p+Oa&>KC\j8$u6:31h)V`q.da564Do2t>sS:5Qmm!=Y9F$?/[^lZmiM]AIVmVL*
'DFf1b:,2]AEa[9Y8`hg?`k68.-(SP-o(i"*+[@4d&mip<SJn"ZC6TWkV$K;)_S'*=cpJ40I-
eN1/n?X<mnMma3IEog.bKIK2gfu;oa/aoGROPHqd2]Aa+Y2U15N2YdNOqKur3+=>E7WgpR"6d
lkR`oRkd1S3%2/g)t0,P^_Zirf)Fg5A91=9Dq'k5fXK_io_:3aE,b`t`W:W:"j<CsZf2ak+l
4<F[0L2S=[h0QX5P?PQ=C<6=X'*mYr\(m3P/Ad@C+=6(2IQ:3IW3Tg7oUa!YW1g!Oi<8';,,
5#AkaoM\5>ds\bL$s06[U>LJV4\f<H2U]AMEeZdCHHlEJX9A?gR0QZkNbHe)go^^c)&\4:DD/
Ns,'M0F)!VO_A)$=V5'!g^kBp]A;gVq:MB/XFJXMr@7@mR%^H;1)6T<n,\s5[lqfQ(RioT;0%
g&:;-A,>%e@-bUA*5K^Z,W<fTYqX]AlDr&N0eE7!O5I,SuA.FE<o88;!gf2Xs]A0#kRkL9?llE
bWGI+bd#d?\'=$\T)R@Eu!/14jMk-AdT#eAm1A']AO<2o%t<qK'[JS^Ft4^r:MSED/S%7'NI]A
Q)UF&\Ico=.7%AP*g4'a'IdF?Y0ZjgZoMbHn:MGG4[8.aE%:is]An#!h=$U6c425K=?\Sa?ph
DF;(GZ)ZgSI_b/Y2`,M^p67`5C@m2UEht3j;37:U9?U8=5S?#p!4DO5M_nUnU\s%.ebm6]Apr
lu55<$9p+WC4S<I"j##Z]Ap\nt>pmZs!0;]A3T$)BV!@<f8-`<QFIGQ$#bPkIOu.c?2Rpg#rEL
ZO9*LEVWdL9WucU_XF_=MID2TTXiB=F9LXJDpC6*hT/0PAV0%eZ=7?L;'1+-0$u3>`"*KhO=
`;j%PaU1T\Fjga\Vo5Ha$rMiQc9bM/4Hb:ZI(qhg/!T(G@\S0r=MF.mO.2KeX)n)S22<lYnI
;#D*kBNFgsq>,KoW:5c73S5<T2`eB\c<_p<p]A]AZKlY!9VD'?Flb?5oh4?b[4gU%Vp1KO*ZP2
XjY6pmTnAeY6<;5_VtW)I:CSjA"Zi(o/-2*2&40W_s02-Dn50p"$_W<kAF,hk"WEX.2I+>jQ
B+?Y9sVX.!"_FTL`ha8P3_CdC%R\C+);,H<._GP1gem,8cdi>m+hIZh6^f*-k@l*lqI%Y$f,
-lPtg340bQXZ'Q(OsDWindI=NQ=3Ch4jgPB*ncDL-+'\m7I@\rp22Fp15m51]AC:20(4*?2^R
JA7<@Vfb?@/K>:#qdNXaUU%m.5@FiP"4u,Nb,4p),\cRgA#SFL7T9L_--o6DuIdoLfE?rmEm
r5A"hLP"Mnqp\a.^bhkB`VS*W2OCB,2W)!5:Mn-<CipULHV/RgN<H!&!kmb)ZcU9,UpC?t":
I$A8c:m!b'6hp=2]A?@_SnQ8ON@1UCS@o4mU@FqpF.-eTMU_WelS[]A=KNaSAoACt8XUD\^>6^
\c$[@.J[]A>/8ied4p2dBX>P^ae',5;]A!;tDHA?#V1@_>Y[o/bVur;#BbDE5jj6d01Q2//2;h
7AHt&M=U.7OZY0^*^?fYWLV@V9Bls;4<40/Ia'@i_/TCLHMEN51lH<O=s'Cr4Ud_pjnTNcB^
hTZm7iZX^$ba9\QZUc^pXU,7G1boSb9E#]AWonm?B]A]A^qQ$rRP?;K4:GQq]AK^_1/UH=e1aEkE
n8QF9q<>$jdD5pWVa;ja7P:#J#=R\ZSZ<O"//]Ak3-afc,KN",["Jo*>@pH%C<.T`FNdjeDdC
?cYpF!(2)U5pdMECG1VfWZX.h&dLsZL9oQjQZ-ilZ+-CgRT,BLlAMes&_#33Sd:n$Ll36PQ?
_\"Ga=>-"#^ec:]Ab_YNBdc?!/FSV,b/gCG7W?@fBG,B[O]AO.i6#Kch;'OY68WPgiO!P6o0Xq
*J[IbRJdhXRCls6,l2M]AL!.1$N]AKW+6J:f5W)=nSo.3X;]A=*jfOiVH<B*B\5R;)OX3dDS"Tp
`]AZREs%u`GaO^]AK_q<^Rq:8HI\FE$j$1m[%f"R7cbDq0q6V)HaRHtm3Y^-740>J=2lrg"W8(
j;_3IDAGc2L/q+&Qd]AUXi;J;>loUEG"_&'!<'=":^iH6nk[hd1l(U>FpnCa=i8I\H#;QDa'C
c'd)YGf1iS:C&]AGi<TGX>&bENmakCE@pQ4_"d)i5WZS+&lA[TO3K!>"B+%*BA^a=q6fqW6_?
ch1$TM[7G"6Ub&<1B8)/rn$^6;dg>\pLWN"SLmV-BP4crOP:\!GimJ[d%rO+`u1ATTon>'IN
f]AToJX2\ILQGrV!!'0:;MmARoJN"cbAt*EcAGV91T4o=eV6LbWE?0ld:--Z)7tf#)]AONL8M_
'"U7_aL1[!,1+6#FTZ?XHqYJd=dG03!dpSiS=(#S-KJ8@WfK8_khp2LpEXig@RC3ca>1$PZY
XASY1j[EkM0iB(]ANDFdZ(X"C(N(CH?^B4%dmUEY%_i"s^*-%)cY)W`j-1e!l;3VVqt7,0RaB
>0-[,KC,VT:2ulB(![B]Aem>\44HUu$O?TB)df`3++I)djDheq10#Z5n'*:5qW#TF<$Q.YUQE
eTJ%Ei\p0&SD%]A.M,k`eBt(fnGcVp;8X'l[e+1Rn-X:/_QQJ39E/=X4Nl`hJOebEVKf>Ud`F
4c!S;gEAEpYNus>.%G]A#)(ZDL9JK_d[71Bs"s5&!+X3$>4lK3D0Z_6[+R2(,DrlV=VMQ9AYn
JDnLAB)\-d5-oTknrb'0K(u?UPpFn:4DL=?3sn:U8'F&UiqO30WBKG52.gA@>nXD"<6"m:o:
Gr=D&WAZQ6:8snD%"4#II^)Q6.'3MlUge1:bnFfInf^\$YSDkT0GDQrbfNgo7-<4rQ2h?837
Ik_FT<nJ+n=`2+JZpca#[.:<[aF'_ldX-H(A/"`!WC+U#;MX(f5=<A;t2B\8CkUf#^iESGiI
s`Uh@6mo=FC=kO@m*leBPRe-[dUcC[7&b]AcJ/<3"^hF8k[hTg8))0Y:#4S=`Y&2M!)?I>jZC
^uAN&2m3>QasN%>:Vs,`nN1]AQ:XH'Hkl+$8oqW3HEXF`7g"M?8kKJ"M1p@(?YZZ.lpEg,KV1
:`=C6Up5St487iE#LW=%^)DZd?XugeBcRCFJHs.Ki2.=u87P1I),B67-#09PZMCD',fW8RGO
-#V6@lQLAaC&9DL,ipJKM,m_u,*>?7.kOk!?1B`1?QsC.V?4c]A&*(hEE@:lc).3,ME_i87p)
%[^>VQ_KD(#g?qoe,5-/?nH\3KgaEiMhoY`VuoLq\(q[luR?fgVu]AT]A08'F/1I'=9[%kGS@4
h'PcmQa.K^MT1n*'/5L$gc:+JdG@Uj?.lrkYX18sgkJ_sLaF`Y@?*9JRFN*6UQ0mk9-plI8]A
P!AcMfC^QL`:oW;#MEODYM[56`>J'6.j#P6ZMieId':KjSq`2#8O$jl8foK=X]AX'a1[,U6\3
pXkgD:LBZOClRGq]A]AS2Pk5bR8C]AAM%d>ZA.u5)pcABf-U1?]ASo"HR_+qYOI:5K,I@(._:<g*
I@+?t@:(^LX03rTiWDneXT"K4^7u8g;Hl1+9.Os:6T4q$ck,Wr+/8DQM-VlN9mdN3[!rH.T9
)'p.GiJ$g5)t_i+6pGfOjdL*6q(,652a;X[<Q-fh*cYk2s;lLS<t:'.VWEnG;Dc>OjuBfl[V
+DhTX/?WdTD"o@`WX_:!H'QDe.,=rPHZ#&*pn4[RH2W-`hib$c0Y=d9MFW?D.'<t/n72_P1(
=i+>qUTZs7H"0o-+[,PKR<3Jb7>%s]A$;@2co9=/X<Ttf+:(ej@R#^]A.QldT0!q&";p0e^1AC
)Vd[V)+LD+\S\R/9eCdHGYTJc1u2KcmNunA+,V^j]Aft_1TY3,Wi8')u8$>3ou>K_Po`=0FPh
$c<$:(Ic"m^*XH8K;3`n,\tJS2@#3ls8+L$WXQjTJ]AVc-$hB&jk0mH&ueY+piS$cpngV65,W
N\SD3u;o,>Dk"hS[F]A70(AuuJgct05u1_KgIF8]A[oqoQ0Rn@5;(M4!&RJddO^<acn9._/1Qb
>7a6@)BOR>_"2(H<@VErJ^W5Jm3K2IAbL?+^\>n+u-CUM$UqN`ZS!uj;,d:/1kUf&?sS4mYk
]AQ0IO:I#$N_rfYuDl9XS5O7%m)be<<Y/!D*GUK.;/i_lW8jui/h7<BH/iIiggG6\q2S-m^G<
!]A@\>2Ueh4JGJdd3s#Pb[H-)m4F(o!18B0`i32_sLhu9gBUrZDC$=LGNL";1F5'^TV1697q9
2KBK=*9pdS`2"k(_bq&%sc"p3IoN0"kS4pJXo=#i"DQ*&30P+P6-d64'l/((l".kLpK>/AA@
$>MCrEaN3aUonlgi$[icPM>qqPR!RcrKBp%8poc&kpF@W,VnYnQafB:J/@MU:NEII.AQ,mo@
rn]AS6kZ+#5sRHYpf(erPqb,EZoICd\5c#uVc>A@XrRgL\YpqLGl`EXACP@9Ehrm_-$u3/^rR
UT@8<fh;BSYsGj/UGqSggZ&3`:5b%)-+V5`Z!Eum3qJaKGX0B->`35ON2nQq8h=%Q67TH,.7
C\HG<Y&bHW_eA##En+@9Mt/ksJGDmM4\BD21#XGIqC8\&SuD_-3)K\OZ=7M0-$<-3A+gelfa
sN6X%rW`l>d!9`7E:#)DeVe-fC+<T/2R.;V,bje@[apZqN#gK;_('bS9($om"2.,$2U]Ashc$
F16Q@8K?Te1S4bcKUuT(W"JnKqb0:+PPXi<H[8$Ckj0V9MmlSgKhOq`fT/Rdu/P)>:qcFo!]A
\olp\p6&J%=Oom6laYA`nK@ir:)X0YBqE,;QH%c%9Y<BAiR%T\rRI/RsZm*]A\VXP)Vf5N':0
_6Q*@n?kc#;:hpS=-B7Kc_7CUP%u$sCd2>"?nB*Bq5[.)r</F*Gr$hH/sP4SCVbM6B%:!Fc!
ASV/-]AZ>D&,h54LDL+?1g&!`rq[_MjjKbM3XMsN@BSqq^O8Sl"k78H)R:Q:mQ#g1`pEfq>8p
1JT&7@lbO6mrq\nBq!q>Lhd6_=F#'*`X"h9I%\:b&Bj(9D2DJ.AlT8H4lu"k,q3@MWgpep''
S%Pqa;Zd\.2d.?8.Q\'=A7Gs!+c<+##Q>ARuD!S:t$(B"J>0^mhe+Oo#&^ap1oL>G_Z.@WT3
=t;c9;-_O;RVAejL%RS_Mlk-XIEHM#D*k'X=#*c%^]A5P1;,<F_.g2La:ns2kU5/MQ/.SQjr]A
#E+,=:QYeSOBhd.=*>&)'`OI,&:A\a0,nBiE1#sfW]A2Q_<n*sd:(dHQ?CUe70:o[m:;/l)ZI
,_-lQ"'nS")9*J9d\rgDj+/;HE-9pD*&sM#)W#[V.lGR<\53%e,R?gteJ9QPTD5%SoL*?]Ad\
E]AcYT[+C';SF3g4YH\Z@@-a8*06,G6Q_M.NX'1Mik1TSO$4^Kt6$-IJ>Ma_,\J&Ak^bpIakO
68]A@8r[aL:AU0"r9ZAs#_2jRf?X'02-FheY1\S+An]Af-=mD=/S"Scf=;Wg0&mP9=TS6]ApAd`
%/P0t3-f2=it'pWpF5:/b+'L;b2.Om1jBF-2"]AYPMjBIm<@'F&>H?t3]AYmhgI>f)*+;Eq=`D
]A^Hs>K<t/3c[!7NpRLi6F832s7msata_nsYY1<)A+mV/#76MN$H:6:VOp<PdXj,HH`gkd0^<
X'+?&eZIm38Z=0lQ@Eg60u9=^b\egVl+9eQ(0uOMLYrU)ST]Am1[2%\bW;I\f`p.eO2R&@!S)
_B^eo5P>Ihb1*9.&FhMuS-p^Ig?EXp&Bo1qCg-GYS[e0QnD)YOuS[6$5Zi>I0b"nALQf'"S)
U?V&2:"dXV:JpDRh@I!q<k800hnDmPXu!>l&m[Loe;Tb\mrNXDl`*iaG=,KEMIpOR;K-DaGH
W03[7OOgfg(.q#sK*=@.hn1c&2$T)$t7SGgT150%tRMTf<?oW3pVp"`X^D;,<n6faMZgUBUj
dR?UhVmE<]AB$S1l:P>3gpc*"CcC@U5Yr%JuBmdVUb?-63>&D9j1[U$;>[@-aQafZCjjWeuDX
l$:1tVj[EFK5UE]A2,N*]A?)%5OB6"Wo151"_)`<dRM)aqOtp@^>rVX]A-Bp/b&VtC+#rO0Vm0#
m.="X&?`[3QP?q%U)3BfP`TEL=CH7`OFli3f_rcD'G'KZpBGn3b]A?J6E8We6_Qs*dA:2=5YK
0osSmsRs57p]A=e6KPLsQ64p<dr"BG'/,?DE[O`g!>0Y,7k=FS@Sb%L/R\^Si450B]AaG4YOq!
lXX,DqW[knigk6H3.9>dCg#b9uW>;_gPCku2X*4mSlM8C>Om-pT'X&55?)a3)Bc'<IDCB"3#
=^:?j4J1+4A9Dm(G`ZA(W1WI*DQS0HaSsU$WRKb]A!ju>sRoF_"NPj$f$Z8o6ZDPB#rtb!738
LUN/R!Hl>U\5JMS%\*`u2;dp(E/Y5ha[[^0h4qI6$M?9,+_`g5EbrJqFP6>]A[bBO`R]A9X^3N
-a&1o(l_GXL5KiTQ9'87j]AJAO6iSm/dEl?l='?*h74ttHbFQnTBekp:0BD(JbS58\Sj')0,?
!R2<A1oUVpF&f0DYEkNTlf1^#H`V+N:))P-p\2L*6jYGPQ0jfd$Rmi)Uo&LSU'.Q1bL>Njn?
p<d[hPJ"T)6loUV^ks)Rb'TOW5N&5E\s_g<q+dcAMj&!(UbW*M^N:)3/GFKK[^(!JaSDuOp2
<>;$HfVu4:^$Q*?X]AZa6iHF:K"dlsM9b^*?@8%6mTj>V4)g;=p(Da?P8RFR6?rV';Ap`Vu@2
<foFW3<f691L7]AijW=7k*s^NpID<-1."@<2]Amr/Q$`RKtc6=;J>G:s0);aNak!rqnHU3W<tP
\9"%2$Jt..'hQ-&(cE.Ih<)De1H;mji6$SPoq1]AeeaE?5Vr0XVfAVu7R:nVTB!)p0:L]AK.cC
V[K'G(u=f&%M`X=0hLWjY!JY3/hkZ7Q&\AE!=-Qq::efq@L+hWI*:K1ai9E"[aoM7e^!!a@o
RM,'p^qK9kRQ]AYPNHnemtK.B)`*4Y5EKK[@uHj3L0f+!r:2Vt7*eSfWHor0`=HfDhMAgn/OH
*a4-H"h^bR!QAiR`S^[T5,e#,_O<i@`U2VMCp6r-LfYXM%[?dd7uK,[3q\,'[ba/#(^U&aN5
UK5XLs-QW-D`&*"u_rJDDP'^O[:9N4ZQ?'^!VdpGY9`S$4:+Z%j3sJt`2g12d"nP7`CALf`:
5*tdoh(Yk((?Ho1U!+j:hLa=)OI:t<u8U\ONpAr=9,!<6-r"4X_YcI390]A9_8q&/kDD)B>+R
dengUYt$iZ=lgEV(4'*FT;58A5^m`54YpWPPm!M:s`pUSr.lW&nL4?L(`9^fDGk*.YM[Z]AJ_
DpZOnMN#tYLtOD*"*YrotQ+6;9SUY;HXHW'19';-=H:sqs'GGDDPM./Gg[(SsD\k7J_i3K!Y
\L8.LrX4jcY2dYZ@$se?6WM/F&cAZK(9_e=q!$W*72`@2Y=mIrqJQj5a1<#`4_fN?q6["^:I
Z(H9'O=>rQa$@f<9Qk)VI0bL#-F%G<<@o-$Z0\(rFIVO2TQ,f570i0LsBk[+TL![3OtG57`1
Lk[fc5kI)1"bqa'gOWYN/S$JT145fTpAO@(OF-,V\&7n1g[lXR_1l-XR!W54q76=iP8QMuc4
lT[6jTT4Pj7R7#25DQA%VjK4RWT#8?)m4F*pjD+,I4[3VUB+q(_'&?j7""2G<9+c)p(KdEoJ
m3,F;t#n$%X]AMjK<A7kSQecgf0Pq.6S4Oc7+di;GC3WYA/\[-TeQ/^i?1GGJj(M$c#EBqK`_
buht7XcuqpMu3-M52nC^q/&ftA%']AiXZ_9C5L<-k,]AdfMNs:b]A<D_.k#>2i7b$ITDEYd%F3n
Fd@du9^6baf>PI,GU+*/$OI.=sHXnUJD>mksa%bg6JVHF/\;rmVCC,_EEcVqJfuE;"OS,B_C
\H]AeWcJZ'^A'U.Bh9@JJ,g$p?BXB!CWqiRaD-4BXP'G@>/DhsonR<tOMgmMpb#(igMODB_@P
TXrC]A1`"B5V0&3TA8T9@]Af1Q&r_=OFWaCirT[M9d$+&Jl-U0cGd&Vjo-1$&%^e$f+M&`dgK6
*)BP&H[\U5s:X6@f*8%W$K20C+l9bDgLG*%0-C#t+4@Ggc&&5ff;_[LW+%j[leW8P7b1g5Qg
%"&Os4uS5G`kul%Yl;k_arS_#*,_l2m'tg1!u'%LJI,Y^2jQgAZ`u)#(bXT\+&&,<Zgfruq$
u]AuE.L:Kht0m%+*Xq#[)4R:6/4Etbm"bn'CC&8ZqV__f^4L=<s<qK)UZpe%e/^plU;hcl&RZ
[kss1a$0V#Tc:sVA7gkLPY?5p0hI&PbF/iJDcKUh,/tdj7r=![/bXm6]AM#5DNSLNfJ)Sp4o`
ChYn*0C&L*Lp-]AaT[46*\=/\[2"733ru97!NHg60Xh%1S7`f%WhN^u=?o-6Lk_Y[-5&#IK"[
`#0?PaF%<oQ1G^To+G[ZVqp=lTD>b73AT4gL0G<\hWOi]AbHR2d2igWC*u:r+Am[O@RN<9la\
c.oZ")Hj#!!D)k13BU_/5iTLq".H+S*"3%BMt,F,&W9_U^8]A?6I>d-*X$?7OKLR(hf&`@m8J
\ii*t/Z>nqL9R--&I_]Aks,TXKAnHEZ#`c%2N*V77!%:Kr45O>+V-6hNS$J^SCVe?GP*D+i\h
nV%Wp@;7EgYpAGg=buj^BUK;4*MTG4")3,D+[a/pXnaU(]Aj'da8-X`>?odG#AP+qr=PmjAZ/
3&,O\rpi<c9Oc2S:[Y7KqT3AB]AH@p/cLqIO\Nt[/jQcm_lT(O\gEs!"$&$%c08X!V)%Amm1K
&^7[,u"/4:iAm/Y*RCc7n#D2Up>T<V^g-jJh*LTD76U+:R^@HX!q*>J"&\6c4/"KZW+]AE?&\
1j/L61%5+_iOTZV$.R!"-GX/B^qm<E$DCl.-/\/.e@nH8K<H^srOH2g<lGNd316W2?1J:;Z6
ggZG]A$ti'[Z>L.>r%e5VlhPkFMoK3%F'NN[hci!/1Hm/rOHY'>a=5&PU5$$"hk6/L]A3;M+R.
T_@mg73+L0K27=mt,I=L*Eirt<!C).9_?,VPrc$J=!<~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="310" height="298"/>
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
<![CDATA[144000,723900,144000,723900,144000,723900,144000,144000,144000,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[144000,2743200,144000,2743200,144000,2743200,144000,2743200,144000,2743200,144000,2743200,144000,2743200,144000,2743200]]></ColumnWidth>
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
<C c="13" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="1">
<O>
<![CDATA[全局看板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="2" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="3" s="0">
<O>
<![CDATA[销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="3" s="0">
<O>
<![CDATA[毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="3" s="0">
<O>
<![CDATA[订单数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="3" s="0">
<O>
<![CDATA[销售量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="3" s="0">
<O>
<![CDATA[退款金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="3" s="0">
<O>
<![CDATA[优惠金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="3" s="0">
<O>
<![CDATA[客均单价]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="4" s="0">
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
<C c="3" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="YSJE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="5" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="JSLR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="5" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="DDSL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="5" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="SL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="5" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="TKJE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="5" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="YHJE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="5" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="KDJ"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="6" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="7" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="8" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="9" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="9" cs="15" rs="16" s="0">
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
<![CDATA[利润走势]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="80" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
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
<Attr position="8" visible="false"/>
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
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
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
<VanChartCustomPlotAttr customStyle="stack_column_line"/>
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
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
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
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
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
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
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
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="0" stacked="true" percentStacked="false" stackID="堆积和坐标轴1"/>
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
<Attr isCommon="true" markerType="RoundFilledMarker" radius="3.0" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
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
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
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
<newLineColor mainGridColor="-3881788" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
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
</VanChartPlot>
</CustomPlotList>
</Plot>
<ChartDefinition>
<CustomDefinition>
<DefinitionMapList>
<DefinitionMap key="column">
<OneValueCDDefinition seriesName="MD" valueName="JSLR" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="RQ"/>
</OneValueCDDefinition>
</DefinitionMap>
<DefinitionMap key="line">
<OneValueCDDefinition valueName="JSLR" function="com.fr.data.util.function.SumFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="RQ"/>
</OneValueCDDefinition>
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
<C c="0" r="10" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="11" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="12" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="13" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="14" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="15" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="16" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="17" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="18" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="19" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="20" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="21" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="22" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="23" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="24" s="0">
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
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
<FRFont name="微软雅黑" style="1" size="96"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[]AY&GnP?G@QN&VCsLcA"('X/!D6BdE8fFS4_PCsuGK(KQ$N<ffgLe)HAdK9eU8dIidJHV2MHB
Ai9"pfl#p_%sdT'%MJk'ZWChgbPmmlPm"^%PX]A\urGb%+3L"AH?fP)&O2mDHsrV_nba\RXp%
[e,Fd&IsD#"5qt(C2W)#j8ah,f9N$rO&]Ahj&C51&lED'sE:&ch;LeA0lLJmp=(B<tr)WEa_f
9Nfa#o`^X]A=XZ4mHl>]A3..*4nN,^t)^g,&ZcL5;fAD(Es"oJCVO)H"7^OW3&%B#Sa]Ak$1YT(
u"%;AbP.*\RS$K$f6QO7$ar0?+;*q&G.-Q8<Q`-f9UZ^@!bos8/k"&WER0A4[dW<qI[bdD`b
gBT#`n;!&Hn+BpTYhOZM_Ob&8Kh,Vmoh.S7?^T)%D`mA.<XmtunWR/Tr9]A,t!;ZgP^m-foOq
s")!bb(#_@lR<lsJ*=occ%c34SZ-\(Rc;59$u4XHjM]AcX&'onNR5PIqT+"Cjmsb]An$jOs#U5
IPW'[4k+b7PG5a-N9!'_YY'(R?d'aK6k&D94TD3nL=pbm-TZm+0ZE:`1ZU<R(goNinWHSlEn
*F6&<\b>RGNj\>ThH6A+6Mc9kLl8[3Z-u#ATO5qQFle-W$gn-9.soK`]A2O_&h0T279B(RV`k
0HHg2L?L0p_nS#QDT-^D0p829.HXOGBg&D6oB<t3rOgp=ueApiV*-o9*k%8gQU"`$kU0fI/,
NA9^>oB_*kNk5PbaYUl8'DK-CPn"&FWkRBNm^MIk2'7*Ka_WQ)pQi&G.9B=!rmX<jesm]APV,
s5Xa64R#?6#$PYaupYfkRrLgR70eYg14mi4U609?5<tiS=@5oP5\`Z4BuN[?1Ump.KNmdWZ+
gVm-7W;k4'a<P<\/N:"W>P/gp#!g+_IARj!5R[q?)N$+']AN%r+$22Dj?/=O4_iIh`N.33,IR
*r22l!CCR8`q`;H%F&ja)1+MbXgLUBBM]AdgD8EHA(:+UCLV*`"ONhpj"J?^0'J(IFf?DInh&
n[gfMW&?#s0dr\tOZ_QZ%$0.k?Jg!kUVF`6/Ah0[*o&VQGX'JI4cZ-Hq33RO@o(EaLBY>*cl
-9eau:YH#W6,33]A$kjH8+*3OkGi&?+6\XQJ,^0[Z\'gDs<f!B`4m14TD%D9paSW\j=ICF%DU
>6Of\/2q_9V"O4qDr^3]ABCRq&pUR!&99ac*j"%=pA.#nE7.Y#0orA>]AgF4j=9X^T@faJeM#u
3hOTf)V]AMGk>eP^YlN[ba]A)$m5QS`:6UE>-2*)`,0CK`=p@>u;&-:Oe4Si9/jYS&H5H1j_%l
TjgCF[c7"g'hg,?,_^r,7d^h,s.&%`o;7eZr)TmY1t!t*K<9)#4bD%]AgqfEk>i<G3oa$s(FR
\-.$N>!p.I,8j0J7`B+oMMIEG=[I*(Wn)V5`0>jpAth=m-2(qG89?[T`%/7$/M'q5,%-B/id
`gs_7BIW+Ab5hA<R;j(`SA_fPjX!QIS>>9G;i_Dorq8il6937qYO$soi?`gWlEGR7b&J8?,0
S:em<0S5$!W=\rE]A*n3OA,sU5iLi^>pS!c[O4g0RtmuZ+FQ0<R?TkEgSbmO>HBK']A/-&hfGB
8)qttdII8mBSQulAB^U@bb2taKfp?H0S.9[Dm<o:hbe:Bus!RZj5E&o7N#t+-pAWf7Cs]At)]A
W+V5"<G(-LuR5L8KX=3-S5XR[3R0;i_k'Khb3NoHpQNS$r-WiIg';abuH?_r,2U/43Id_D<1
Y9i"<un<sDKWjjXu7Cs[0IT);B:.K%Cp\>Mb/bqUl`'M>be>;KfPO3@DG@F'55Xli]Ald#!q@
IuXJ8OdM/e&"/P#L\]AO>6#USiU:$#80*78eP2S"c/FDYb.kBrGH:\=Ge-''K8-/AAE6YU]A@[
["6eo(c@nFg63ptI"er`>`>5%n7(JDjPqkoYSWQ\K??a-WtdNngtmB"-Y&:Ar\<Yd`:M#rc:
ML*714_#+/r:?Vcc:P/X"R\ODV3-.Ap?A9b"n1^J#nhIh[N>kFp'nlRGIhG5;;$ckj_+-@Y1
'#OgB:H5I`E=1T`m<J=9J8u30lb3a/QfEV@WnA_)E>:(6hgN--"eubCd%Fr<VjhYgJKJMO`!
`5#I$CCe/0,>,r#l"7BFFMR=+]A%mlccUpeNh>/$(R0"I1Bk0#0VSe<%BN63@l'UEh<SFosbB
CpcQ[KdpI]AUWD;A(n?3//BEl;@Ain:rq9nDps$0Nc1.K<".3_/#L756.N!]A:5$odGN)WHUMt
.8R+O59/mQZaXS=K.VOAi*G[<@ubCi.Ba(:5cCS;HnigjKV3[U+bF[T3/X"(M6kg]A?>?A]A>t
D&!_kfVhE*@L`Sm[OR#+"8Bo]Am0:R[3@mT<CN>P(aGY\NZH?)T9pGpA0"7WR76.^O<)/hBBW
[#p_i*!Q=+7EXs,u[o:h+:&H:"\/m#^n^;UORR\]A.Kn"VbUN"*Q-dkVO.Mc;j<]AL!!_2/^<M
5erLOa8bYaP]A\h2:Ts2MK;CrbKgq5`bm1f!PTM^1-Thu=4Rn=C$aDi6eQMXPCGol"gLoo`uV
n'oao_;FVHp@qYQYQCQ&r1.D4d]AW_3c8,Dp*n\gmpPKE+Y\%NPK+"ph7AS_+=Y7e=>4.]AAh4
`/'q+a>c"sTDi!r9&D2*np%?l/]AoA?K!^L2dLV':1$=A#b7OIDiWmYiUF0j"%7':Wik+H#n_
Y=dZ+)R[@>a<)hsN<6/>6,JHh`Ru_<a$#JC1-^?gSL_h,\Q=qI:5<"+QOZI`uds1#%:_U9GP
(&p-n(.%>*qQR;_MU2:)>2,LLs;>ZWB65?H1tb5f1gh<P&]AAl*3mBj.t3,f,i?.eBimMEB!'
^d&[5m<dP1p<fQsII?(C90e`.USc/W92H36pQiQ3$1d>;nM&0/PFq`FG[G8@JBDEd;.`=46+
BR`nm=Z[UiZ4c>9A[5\E);@(H.ee?DIf`#Zhq*EJ"fnn$A-Io2Dej0f44Wdk)]Au5R$.t\T9#
tJ)8<\go>_Tu'QO\lS'i1jA]AN@.NHE_@>E#E)hH+J"U(n$B`GLj'sOJ933lIH$38D0obqa?`
i6#&1j9ksqlI0*Gh;0-:3\m;XLrFUop78cI#IH'UJHQi6/I?a,%GY3$!:Lp)GoS,Cr'3'oo@
f2EjK$;Zqp]A8*]A=821gK%(`f/@H`TrOFh$aT;'6)b"ZZf`oI!`&S)3Z`;*aOD-oZM@fVm%4;
/BR<eC'UgLMUX6me)hX.?$c)U+-%:/O!nL+&,OfB_oL1bdiKT0K^(W[D_h(AAPDu3&3b+*`M
":@Z]Agh`Dm+QpAP:VXjlS)fW(I!T)Lp[s."MEt/U8Vgo&Y0TS@mJufCBG)M(H%Up"gF.#OL(
aIHm>6gs[e6MHO0<Ph0#/BN8T]ANe^MBDpT*Y9:mpJd"?J@2?^.A<M&ADbLo<(BL[Zo@-o.J9
:G/q%O1dTZ98`7X(puaSrh[HQshWNrD%W/n`r+3Ch3"Xt#;<(/mrM1V!:AkhN!15"`jWNT^2
U$d1K;S?7C2k3rEL2TN=/*DKOLFCP%[7o8l>]Aal_Hr[cBp*0)B1_a??E:BK'ZGs-GOOE#&]AQ
B%OP[kiA,K6?3bBNaTHQtE%UilQ<UW;HE7uGc3D(esfpatdN"8o]A!Z9jWD8Xi4p4Ft"dB*"q
58;0W!*IEH)\s0k`cclQn]Ams4gGo"&\\$Uo'g3NMh&f&/17W-oq(1H?IS3%F@*#/rgn)L.rb
1.%e\AL1%040iET1O7kFGg!r!r2_\;#fCFFbf:cYXbV2D/2Uc8`bK#^gb`Z7f5]AFBIYeWTcb
ClX_Rn;6.Q%J)kng]A>eAQDU5D7fp<Kr"/e_;$N!N(,^p,K+N1\@<k#AZm23g"D^A")XU3Lq$
5_LgOUc30G-6ZoF2^?8IHM,_Ndhif+'Lk*`7H"=f5sQX'(/l=pjc@a-us2.NTJsk1#1FR?tn
"r2X'q((GnU3>G(ptn.Cqu*8s#@GpUEThW&:U&%naN^YKNY*s<YjJ0-*>g,:Nkpm.'@n:PtW
P=,);?\`+OF0'WYI/[4snDTJi+D?p\^Lj1j"P67ZMr0j6Z'6Fm?>2usn_SlQ<]A8jaG=uno.W
$nTF7V!(\WB8-5$W(>8[.7h&e.b-TpT?o3p'_3RT:'k?!-?qPJep/a_8`LolirYI5VZVP.PW
L>QCn'B`WulCbGI#'k@4o<.]A%8-'iq$]AotYpo\n>S;A99_4SqD^DgC**#U\,I-8HgRVX)6Tr
]AD/1)Rl)K<o0=PR8R[eiL6(k"[nC$c7r13XhW@*-XI`s8Yuj*!:UoOV%8Q0/9c/g-cj?j8*`
p@[g!snVeCjo.,s?j+jk/-9a)ufP']AL[+oH;gFicRID3Q!K.9=8i>ap6I6*q3mHgo<@FT,.2
,l7*'=]Ag;S\?\AW#]AFlhFjh,(]ACp.jQ8fVD@\"O#)BV=91F'(WlZPRII%h)Ap6Hhhg8r.j-K
=(s+6L%c"fAoL@;D$7>aQ\$.@D!dMJlhp(mN+LFH&FYI7;=nB-^qKEktP,o<]A>c$+\Vb/_%1
.[1kM9]A\7EPj`<\^DgT_Bjf;`m,C2..EUpTu)0:7g;k\pfP)_iK:DGSGr)TcWbfuHIW9O)m1
f[Ah*adaac7j"aZB[=[emXSfm!YeX3js"a1&[(BUnQIECXPuROrsubR/MWiSTO7.:+.2aR$c
g4?Z#ia(IfL"-U-SCS==3N!YYD>A"Bs.cs-@bf%Bn<Im\'C!V<4-g.:U*qQPP:#$lgMZu!<2
f]Ak-HKa#^RHnI'sM61YF`jZGVAscl&&OWsCHl?<!mEXp8BJhsTZM\/_pS@Qh$M[1*>oQ2,hE
iQnSej7!ffIN-6]A9YO(*G+OlYCGDg]Am9;qb1JC0;dDR9`6H%-AnLR`p"fsK@h:hZJ7A)O&l:
/d@/Yi7l<lim4EYja$A$e*7445@JK.Y2NQ:.(,)<Ip,IU:\C8I8nPZi.ib[^Hlg"c%^-A)jQ
SNFa_I&ZGR+)j%D%m_h6'!Ia';N&gR:AJ6IMt#O>Z"14&&M2=q9D@%1Z:$*2WgO\(K1sk3J"
F@C!0Er5\.]A`>p)%i>saWeF0\V6V]A#$1i&4UKblO/d$.a3YoF%CaPJFG=1$c7JE"b<k\t$7F
EV>)7Vs5[S2=3QLB!fdJ<(#Cq]Aao,S+AN`ChT.5:jTnLidJ5T#^Z7glg'>Hm69mT-!`uPe1T
Z31`[lSkU':^Z</%pen"b)=6t*-u@uUt0fRY@mGEtc>I5Nl(/3iQRoPEeQmfU0pjBVq'BT&*
U`to5_]AWN#2Z3s<Gb^,kgmsePomPGn0_,C<arMSq4N^41F9JW#UrJroUD2K7u06N]A`qS^:$.
&52e3<!cWds2pMo56$jRA#Srjg@**GjYu[V@1QUEVXs$ie4aI:ACG"o#G.948>SpFk1sSESC
Jc5_.OSO8U,,KOk*hq2]A2]A-b3aQTL/'K-A92oMu%*&p&$`aV.'LlNi1dKPa%Gsd.f:C%[ETj
\<a6&iU@/$ir]A;-Y2't)5H#8cTD#4CebAK\%2<u1/pd_W>gs[6;^*]A,<II?OqFXX<6Aq.,hn
m.@7Z-$`\A'47c8$$b1m(-[2OLrZV:8Y>bAL$[3BODt?9HX-:eXd2m.nKd(!A9UW43P?HUf$
prf$/[CWZq3<9##QP<Xg"n(f>WnTk[a\Md>VP+4_8'_j>6fh#VSWIED4P=\ZJ0B\)RNBlAok
C4&+5brWI3rloiHN0(sj`;L&7f0nkK.ZBs0)ieIMJHOK-Z(1;R8,nB!407rOi#>s6fXl=?5J
NgY"bN18(.Ni`P89N$aK8B^U;i*oXOPmFlM9>ZA`k7K@s3liO7L8'7coHpY^TONqh>$JRD`"
q>MrhhS"DA)aq0!@PYFld.Mb;!]AZlVFo&@u_e>1,-@NRM^$EiJJ&)oe5#mKIb[m*#aD&,q$J
_PI)?[ikpJKB$ffB)KTINO"Y9W[be6EL*D05Fdm;\LK99.dhgXEq]A&UR>X9@L5QVi!!7CY<d
S)nB\%\):do"'NFB$<q_$jHK!?NTZ.(BDPrO*=r\rBY4Hmlm^lY1ZZdf=PjOSG@p4JQk3I7C
F<'5chmmW?KYUS27Q<>DUD1k^SNIXamdF:T-!_XAAMA_:1Qg!>h&/b'4,f6X-V,)%K!!JlKB
PR[/Bn*F*M3O5FX$O?T<)q:/1D<>rekbeafM.03SdEha^45:a+e,'U+rBDND);k-ePllfsI^
N4KuP\%&h$=?a57/CN?E5",jr%3;O;msL!*ZrKR'[<c0=SF_7!,e?rN1Y=@!nL5&\S]A`L+>;
POh'f(dmnb#$r#>k4GUp)'g9b1)G^'b,cB\FSOfOg<hPCfqTe_CYj]A<Mf3ESoq1L$"]AdH$!+
ZAROMDWr+C_@Fpdo8#UWs[6D=T_i>0*_Z;n26$#9Yn_`N:_Hstjp7Vd8k*.pI@2_OZ"I`i*-
b7!)D?I3Pq"2N&eDCE_9]ANUK[sC"3EW3:Ql]An;/`a>+Xk'f*:XlZ@Rj`PipI!f0+&7bONV7u
tVUke@Iqfgd^Nr/iSgZ&[rjhE0'1u]AEHg[[>=q6ZUjh+l8qV!VRmqr?QLA^E>eIZDL'aH-=?
IK8btesTf:"RQMJol%GW*"L\dMbgBt'9J0[8""kn;DHgso^S^pbsf?R)8?8?*s.:%/iiap*W
'+HNhFM$(ICJphqn.@b8\2HmL<Z:VEM#pofnm.Giq`'Y3htM[:">pO#m"'>,Hf3;Vb.Fq[91
74n]AaT^3I:``RZ"k"spU'o:j5(f"AcMasm32/",oTlq,57*pC,8baFQ6bc"7*buL6A#,R?`O
7D^Q%*D15N!p8DH7#WJmt4^\2[95iIE<3ke<UKVlQ$dBqHX;,15P=db4mitD<fJk''4Mel<F
K!1Vnr<O_^B(@b"sVnRVWI%'f(D:>ZUJjO#\1K3!!dU7adLf!<u;F=pd]AE:-)C%l^u-,R'6R
s,D7%AF.-CIO"7A@-,Yb?Q#=n+B^2!^A\UB<(c.;iBl;4%'cnGHQgk=!,kSq)1ZVEWFiE8Q`
URK0FJA]AZ53`>/J8W<Mp5_fUpNo%`XE9,[CaHCK5COV#WM&Fo%aRp[d3A5_!jQ>e2,Zpe\M.
Q&:c$PCV"6gZt;p'K3')*VoL<]A`aZHl(.XO^[u:d569P^BXp7JP[8a%VU\o%=Y6es6.RGGOh
[:&FRN_F./8p\U'2nbZ6V]AEnW;RtQZ[%KhfZX#?kO3?!_4=op<!t90eXXiuNUR"`(.$4;)VN
fsRBBD#NqX`Wp,Q)DUTj(8I!U,l5(3Hp7@oe9SQFYp/%7INnZdW_4>bFFf1a1%?HtS9c*B(.
G`O0ID`7C*<J4'%6pBfoB#)2I%fA&k,2ZC5kN">/.F<ZIn$!Bkjjs:8Bo(N1>(?]A;;WNZUJm
EVgLVd*HdA+/T7,BK9D$Mb.=mqN/"k<d(qB`+-?*gnse@P0HGE95BGN?9"(0Fa@G![$_4)#:
mM$AL.]A#k;r9cj9[bN/fE%'T;Hfn!7/_!<oiD,Fh@07bbBQbu3hD7/'MTHGpD<`cf/Ts$--E
g%+>;RNZGG_mHT%pYha'Ggp\8.4-7H1Wu!VZhsYeU25=T\oK8jur(Y4"b#):FIh4LVtr+.ts
I#'Zp/^"<o(C!6=N+W2E`%7!@WFmB_B9ZqV"W&uDlco+PVTZ?*+Fp$;2nT<M_1S2ZRM2@^pR
e(9iC_:h[o'D_s^hkC\k9/BQ^mm@F;0Z;cGT>3k;6TV=NO-_6]AJD83;]ABk3K,n)I(%2P`<+&
n!0'V6hFroI3SGE7+;e>SDNg"-$+?b^2bThr&-I]AKpaI@ML9G<*T8D=%SNofr9#?SDE:dpQ;
UK2N6^,""\G-eBGaLuhQrNdWkM"j3qOc8"'TG`pNW8d>Sq4aH;cjOX6R.\.<s#`@?ZFRUkDP
ae-]A^:$#XW$<RLgQJAJ:YJIF@F@Z$XhXUu^)=#m5i2US"t)6<DX;V!ARF[4nD;7njk!'$BV:
R^bBMCo&^*>'.<4F*eg'&X$=L(-c\nPH)jH&1A[$6J8Ck.feqQTl2ePdus)E%.<Qcdf["Na+
8"83tbjRW3lR<fmPhr7O@LPR2;lg(7(bQiK+X3U$/UYIc9mk#@CF@+S(@O#6i"TD_jlROq2X
'qRSLD\DNbL0]ArP%/4=C*TO(6eTS(Ru$G0/dG;^0iRaT$oS(6lZ/AY0f[O1Z3W+P>2(WmOZ@
?2J!<SLVg*^6g<"VXEPEpC8\fA7B5t]A_0OA1.^,TpEh)ZTdXqC6-RlE7GPaQS!6dte_<<6bi
MoieL=#eer+P47'BCiq/JkI)!]AJ7I$I-1\_(9uG^A76?bXn^-%j#89nH"=IU2<Chkn3I@E51
JkA*r)+rr\)DIK->c06Yhc#&pf#24KMC<rW.9I'7_Ukh8P+4)NZ4G:f.SmE%$=AD+S7-UNt*
.NSH1f=i-IZ.nueY#`/*8!6$hSEaoe/`GLei*128p+eZsGAX4abRu?uV<*ODXHRG/f?Z,qD>
Eh/-p\a[^$6%ULSe*:]A]A6BB?DaO8@G5h,L`CEX^PW$@NU.E`.\+l(bPPujU\5)QM=1W8Th!@
G[U4fMLM=RcH$6O\$6na94\-Gh7AC%5YFrKr._dL.mdqJN^8>b^pAKB;J$DNih06h4le'AXr
;c?RQe`GH2iqh.>r<5FL0_t%<TNRtr,[Yl(&WgsrPDoXd,4'ki$?O51^G,>7BWp`gU4'n'"b
$CgH1QtJoc?RbEK/[a!]ALq<hfqp3qjn+3Vg0!ab9ED&`(<J?&Ur>-9IBep^mA,aBGb=V?NW)
hUUEPOj/pJNm76]Ab!r#L;I%C76A#6n(6%InSn`r!ba,*\]A]AgHh=d,!]AX6Je-1>omSFl*a=6-
A0@D1dEXs0^B6B@^Wo(LUcGX8_J]A[$#(Kl%R%Mbbc<RXQQ_E^Eh^e?>b?k#M1,31c+WpOjlZ
Yor>3YXS_cC=69`4;/-dkkOFu.idqNhs2NT*'oY%)J*m0LcDKean=F)%IRFfElk0_cMMX]A?V
V'"H[Iu\8jc\NB@_*1]Aj(7TN7`&GHbr2J'Xr;^8S[p8#:1a9i)[IrM+Y*GBBF=W0(10t@IVp
jR=kV,U,K3EX8q'Vi(L8/Oa,s83@u=QqK\5FM'V87%r^XR@1nJO"l8)>N:^ZdSWj#?'r,_pq
A!;Zb=_L!:-8kEge14<qbl;@Q$:M1a,W<><Q8E8^Msq]A6)NZmhX(!ZQ\[Ej@G3e5iF5fR#)f
Xnk*\L%rlP\GNr0<LKjb"o`^+Q3=*<RKMISY1-7*nk2;k`=3oS$jHAVR&'EC-S:"soW+%J[/
p]AQhUL>>6gtI'HIKKU;sANb.s`RccD?A.3%n=oWrTO#3u4=/I>*`_53)4\6PS3=2D.e"7P#;
W8+@8K?P>9BOFfWN?O&(Sn\HLdR%&9DFf9%@V<`'9AtiL]A1,s5LZX2&Gl>#o=24cFaU2]A(a`
+r6e$2@)mrhR2oFFs06<Te'.1GI[[U`[Gsitj3VZb(--m$5]A5bGeGR`[eB8*SN_AB#(`cg(4
`%Ck(S.SC05[-$m5Fj\4m$PQs!,H9LdQ6n)ZM55`l8K_':iWbFiXV?0TXFUiX:tQib!%tQ3t
2eMMKZL%m-j")1!Q3Vit1c!J6lN3)90(e6aj1hOYrGYl>7c^#6"IPZ8R91q9>o_MJ7b1Y+S4
KBr+n9CjT(gc4K=%\VP\,8M00aq_sb3jrlldd0P5YWfE.*+D0\G&<h?=E<TejmD,5QeI>bH.
2\E5D4YWd^BmKsZ]AY'&EgQS)Z`BR5G%;RbQ?,*((YtM;J<c`Dg;A%%`-!@Dp:i:4S%r^D3a#
GU8]AJK_QqJbW4=u8&Q'RKLb3:_#$!#5BB+VZeXR=Rjj(F),*9q)<6+<?/$=qH+h?G0V=a:Nb
hB1`+9FHJ$@<>=B&93)D,$KW3:om9"c/;=#4ID8J<D*0s:>QnuG=a<#GMPLUm9S_YJn$Y//d
1VUj:ncl?o528HH,5YF0pb7BM3CA=`F*ikcJ'uBK13k8%kZmLQ<=@S=KNAR:q)L-,oXCCb"3
b_sH0kA,+bkQDhu.SVf2+C&8fbf?2lIQ'MehL+c-,/^CuTfg^\/2HW6U6lOjRLG@ublP`U)n
4rKZU]AHE\,@cbbN1k\Skt/O07Q]Af#GE>&ch(6,r5Fo-q`h+<\=Gc^t'R!5a$mSAFGCH19g":
$[8[JVA%dl+9S,;[1a!bm`6=A!_1u^uC]Ace/dg=:7RSuj9>TYb2u_YJ1t:.b:e3u*6RchE-1
)%^)oTpoTq95?g0!4ljc;V;j2D"%LIqY&S_7/Z\VOu>?<`pugP)oCZ'h1QYL/_<bm_M=$KE%
.lM9%+TFp833s^$Es!k-07a1fm`KTOUV:/P$PhMlsaM<Qb#fX6p%4V^V0kCh\>oChP8M*#.P
)p7`"]A+c&>\4bW*HChOLi=sC`@9)&@N7/B6d4T49rGm>";G\5L$_6#h`dLKkoMhE:W']AB5/S
.jcm9nhGIdg<Y"n)#EmaHGJ=0fRpWI,[`.Wa8N/Nk[S1PJ_2q9"YbPSDP5Y7tX%a0GW02=!N
R#1X#Q1EA?M(c^X6\.l6;FL'i=J]AB%VT#`3(u."et]Ae'E.s8fU&CIh0pc':N*I(`kM^R_K*<
FVc.XJT'tnb-_"jqR^+/]AN6A)9_c^d47GjT">uTYZ<c=deip^,jl?3U/YT1X7M^)N2Sibbr:
GMuN3n#VZAGrbQWO<'_]AeaKQ!;2/HPmk3%!lC:S=3u92B`(W(hc;';WZjJb>BuE8r1S^QHeY
5\tq6m1d@S2n%D(rlBlbV/fu#H\5dN/*eS4G0AYb9MXjSNMS&V(jadI(_-&e.hpG?&TX-(K2
s9n)4J9ru<<lSKB+3'rGP$Di;lX_*bAO^\\]AuOcmmDWHTXb(aT3BsFK]A1cfF!\ZgDl%#.,("
+r`26&GOG7GKreTQ1_O5r]A>_<?4AV4jq[RXc:Q$TWZ9^>t>Q.;&<qt#N:hB*Yg)4hjgqh(I-
_fK7TZ7VeFIW,+:/+7sWgA@B8V'l<LoVfF:k$,*k3+:%QbHl-OML/XBk\95D0C8$hA,,qbQl
p&,'3`JtZ\pefO1,YinuS41q?.m?l3<KL]AQ$1SoG+h[D$TJsbM(hV'hshW.!'gr>.uS87P;E
)P;JWbnr?b!S]ALbk6HB`\+uI2YZ:Pg\X't=&EWBSd,KTk20AJuajh>J]A5jQRn$S8G%(t"1Em
&e:AJ7$tf/R5KAEN"@9l]AQ*BMF.fa\''2cR4.4<^[+hSoW2btbuJ[8l1AkEkU-0[j2_^;q`n
.31YnW!B,EkO'Sj;e-fg[,=-W[(F020qLSjK@(f8qg$I`9;1FLJ/X!,K`KhKqP*Y*S2>6M9(
dhEoq+\bqfpo1hndlsPu;$)ANEqk=44';q81rJ*GT*eVt[thM"]AOjJXPG_G<9PibXan>mVC\
QR7Db(XqqthuoJ9%1:)"a&7,"Vm!bMFgk@jb"mlu(&VbAp_RfVI;F.4?br7%(3[Po=HuH>'d
f,#f-?Z9P9bV828Q2UOS5Jt`]Ag&f+QWZ(;EH;jNa$!#BFFd<IWn<0>MUI]AZj15N='<[c^*=J
jgN^F1)UcnoDEJo$*[Ee)S-qSGI40DVMl^<n*t8-a6d6E@*IXQFM$FP%/[k(8BgF0PN@k8+6
M(^%F25a,i;W-(+fK0R'i!a#aq\VAFIa(Un3Ji'Uq1DGIo&C3,O)WX0AId%9-K\\D`ESpioN
=P%%`mPTgm/C!srQ)'.B?aGW"=6&o*2'BXhJnCtW6Kll"8u[m%/ODTec2KD9kUN4i:/5'+X#
XV<<ESd6!i/Ug*)&-%0PE:AknsfL:3-@_J+:J;o$W,;8S%DGk&"`t-hEGa\X_N/0:/IJ"jn^
[9gZ41_7F,uBou\'?'*GQW'N28XbFYW]AfkU#7\t%S:.5b8X?b9L\TXOr,@.P8]AZo8-G!0P&^
l\S"-h,iT/lAq3Fpr@O_M6]A+$m=/_<d>MDfG_!#6)kWI)j$m8g793MJNL`'SbIp"6^'d;gjh
F<B]A2r[mgPa<,,:,hC\$-!,R*sn143u><fPq\L1fqcBsFH4BHM5?&-TK9'!e*?OOiK.HD7Ln
lS/(Wj)*o5C<,)#jn>+aLX#OLRHp3g%daP<OhKXf5gf\og0$*Pg>oub5,[c4W<$9p/tUacd?
c7%(q5'RbJ*t%q&/POSukZ21'F@WhH2,rn5M*B<]Ab?1hgi!]AfDDt=5\G*p:]AGCM=EWE3GtdQ
aG#fSNnqBtB*3DFp0]Ak&u9s3s!X#)Y]AW5Ah!B^O*nb0I1KUcMP$"=cK4jq'ob]Acc%!]A!n5eN
U/8MX*JKU!s="!4=oC2'<"^e@[!Fc6Q!0S]A8J&*ifr82aekAa5/"g*KU<,oo5>6u0n!'BYbm
X"R#CXh?ib!@X:MF3Q\E0GrDY<2>9Q$8<T+%TMK&Nk:+H%0*I^@Q[%7@<rAi&XI%r3-XHa3d
hFRC\LlDft?C]AQ;4)Jlab!.j;[B/n21FPO)bIqRr,u$(X$rf<BN:Ra)q?a%6HqSPNnZYF-&I
jC^=&Dm1%KFndk%<8F@-.Ad]AHh,!IN\1^Oai\,m(KZlP%,68G'c23mb(YP#-G+r'd(%P'fXp
td#;1BZm&:3W/Zbb@ftmbbF5MEH#^2cT(2C/Flr^;mKhZ9YZ%md;<O/4ln_cTH3u'm20;ci,
\p3H=bh]A[j7(is]A,XWWL#^Y3i"UY&E`O6r0*D(ga;Or!T<jrunXlS%8B!mf)0f:&@j$a0:7D
0FV+mOXAYM`unL,RQc=*@<3?5`eU7VW4N"3AQ@;Umf>u/qB%cGgNI*P*6kG0Kr1sYd'PaBS<
(O?3jhB6a=%4\d/oG[@h0j\D<BfU"ten7VCe%Gqb*+A-<3N(Che(AVm$D/Bi[*I58Hpgn<L5
WB&km=<Q^uWmN*PO.IB8$2--Z77AnM=2]Adi9X4g<A[fB+F-sUesS?dqB8,>FnchI%RkqnPsB
NE)1/9mC<.M'"Pah:3*J1ErpLs;V\_L&p=^YHIUD8eh"bNGi78/!n"q>'^-c2OOnBVCVs+$2
0AJfc`)SRA3NEX_,+%7!iS,7)\o=.85s`JKr!eq7`2s%%86IZkI6CMJ-Wc+KZEa)6jm(_lqe
NPb5DI!C#//l>,RIGh)o,&>]A5+VGWR_bBe=p[pGD*PMAYt1Xo%*4Q!e7.1$9Ga^D#_k"IV-'
C&]APSHU!RVaJ]A3Y.iCWQK;I9e:e2RZ)f@B9&J5*WAV]ACrPVeomhh?."AG[l+!8)m5l.L=kG%
eC4SGpYmS>k&:BSb`]A:;[tC`nF4!f4nOVp?f<NcZ<X,ZWFufS[ER<Hrc<-U,:s?SX>XE`Wr+
Ob7d.iTEk6:T=f7J.*P(UF2"cDY'/)7*?PX^?W_t$QhAK\FNm4R9F#0K2Br;[+s`7'1U(-cZ
/'KK:T\I$1IsFZCHMr"ns@sBS&bu#NW[kV<K/%$,/<Oue=?i.Vj2eRhIk%4_M=tsnt2GJZqW
'k\W7q_M[JDqfoI":_h@>a#"(1Up-YI0nGQVcJmTK7BeJ_1='^9tKQfDS9Nt:d?=J^$9=b,^
Y0`q=ermVnr(LQs")5A%KTD'7aGhT$,:rfY%-=]A46CLA79A]AKjYY-epO[Kf:B9ACfN9Yus)@
$mem=)O/>g&^8aOAgl;F![bW*oOS_3/Fb`3a.pPq&4IJ50\3-)E9(<X[_0kSl<&1JrH3D<qX
)Fe?[6OMTC>VLO[`._IK_d@&6necKMnh0*'JZq2sUK%C6VmB!>a]AFi"`ik-J]AZI*/GZ:GQ%*
D*!Uf<#F6i^bN)!%W78o/%;.7F8o/6XKa9K)LHOI4DS-`i2B!%S4%O6KnBT\,LS8DPgQ96*Q
ggc$N"1`CUF!&\;&l>l8t*)j*(<e)pVlAu/YrH(non?=1LhPU^aq/%CL>GMXHC5Wp+QC+R9[
`CJU,T/!rsTh2)@\]A48rbe_o]ATfbR5))sA]A_>1"sA48:!Yp#IT'Aa[q[Q7>#Yupgr&f4PVSZ
0EgMM;S1RF0ru:S)F<XXMAiESEm#)iZ[l6/R9Fa;>VpB%b8pcl')>!Asc,\NdThkR0KV+:)b
PA[RJL7ds)@VNo7)W0/@m77&jCg0SrW6a.`6[QYorIYHB,q*Ng5S%QhYOk!k]A'['1;9$9#SV
hT(BmP)C^-aI2NRQ-tbH2biH0Bjtg#_ZIq@g=C%iJ>eD.#<*/6OTBt;^g6:(ARXZq:EeXh&K
moP_VBj*O>Bs-QFhpLkufDGMZD2TjpmJ!JH!Vf7hn$0qOUL%N95$-%Jr/<RXEU,!&Am3HfHd
]Aapcc-\!654A?A'K42qqh"-2GMp49@`0ZR!C"@J;VoOM<N,sl?ii%EZnM8QGbQ&YIVPc)hd@
6L-Ye[9mIccJ3e#'jMGJM2(:GtR'nr27!^EaU6!(*k=/L5Fsrt+3j/A[QP1k>3jML?.r0a1X
,!@Yj+SaPIA`t1/HM.TEDe;;[7$LuuL%bn0SS7.8pEX*J[a*De6Q.B9aMg%K*S+4,;[1##+R
3:f,Y7ek6Bi&b-A9)j:fq+P">C(R?H#P[#;bZ>ErBSgmPtqrsmTtBh>SQRj9M&(CCW`&>V&<
.pG;D0Z=&NAPigFS>H<s_D7ZA_lro+A%e)S_8rVElfbiE)N_Y`gpRPE9'=&%6;bn7pQ>6O0B
<Fl0?j80t):9?,cf=u>P!!5oZ3-Xfai;HLgns<b@Zb/#Ip1]Aj*j4=jcElAm]Am;?)^GTIpo7?
'/]AaWP3.^.+<,@4U38mfuOBF-0/_^:r35nK,OQnc0JiY31'`f*4-'E9_N`_<aKf1mZ@=/(Ac
-cmsCr>O#`oLsuCi7'Tc`TVs/.6$=HE%JlJ+)P09P;]AZpGNB4,eX5%B!C65I&RPQ"8;]AVtc3
olJ!1^*^EBfN0L^:SI/+K#`#FoViI@lIT8<i2<G$E(=9*`f[<l&E>,\\-D1%qY\\--H*Iibu
r.X&u76m!^[sggqh5i')3Fq/Yitd4)`pcqWt'`*T;W.iCB$(irq5Kq5>%QN5s/FsVq9E"R6e
&q<8#:CEW,a<"u1Q8kdUV)3N_ksF+%/c23IWi'S/$@ZQ"&GigOLkPQ*I/ou=HronKr$Gf]A(4
,hIcs3>-&Sg[iIb%L=S"5.=8,BOOZ3p^?"W#@M@g;iLM4'B[@TkB;ZS0PX9Gn&kYII8!JP=X
s&a/=XRY&P-7@bCQPlsdmeC,V,Fha&bqROXV>0^\Xlm+hc*XOZLi!gf^`F)n.mR*!cA,/mJE
/=Q/ro$'Da>aPqig*FP?O4mr5it=.*8Jg//_p/_7F4.h5&t+EQWd'AlD=>+@1fg==E@=QlD^
+\RN4_dcOGOSlA5DX%epb<Sk+go(IX.dA.6U;A4a&o<&BR8WGt22*@;>.T9R?P<jRLWS-]AY(
3.3lBdmL-]AA8L)\Dr!<0/Gh%)Xk@1ILV!@gfV)I.@&u1G-oa3Qfad5mm&Fu;Ql'a::TGC!3q
Rk5lQ0;i3-LPL_!Hb(oi0"AgN8mZda3OI/Ffk*2>B!3I4E6DH-4A>/?\1qkL1AK"kCo-'il_
,WCmH`UQ6Rq<9!Rp=UondMheF>Zs7;W!>u>0;mAdT",DE=#B(T8l_\-aGTjZ?Xn]A35TZ3rYZ
oGRRO>`Tmg_\>OcU2smB4R3KPQj08#-bBD\R.<'YruR/Zi1Hn79?J9f($qKhW>E5R`=Lm*Gl
'&mq/A":O%A#LPhKJ7Za0%%mq`h+N)$.ZikCNhX9$ma]AQo<3?*lV.XUMFFT>ro:W0'AUVaM1
"^`M<0`3[m^PjnfiQe@GecE`$BiM#JMVbCV&jZn(O'I5Tor0kC5T@kHc:,2-C00N:ht89ALQ
64)=#u.l&'.`8"qX#V9p&L`J$W`NZkZcT'uphV"Xj9%Aa-SKF558d\Z`^3.b6.,bu]A>fQ<2+
,Rci1B@<UTZ6sUXf`j=<tr]AUrVO&;M^YScLSPD]A=f9>ncLnn:(eBPhb*@k\rrnQ;^:!ofR7d
EEaf?9;]AfldMu9K\'@<OP#t'+63::c-)'pBf9Sta#bSI'lHkRHm<)Wfq=n+5@mdtK@*phi=p
"o5$ForW+1USM0q['e<R#qUXZ;scWLXI$K:*n:i?L6Vp2[pSn_V"lYdB=[]A\QRKhgH)HPJAM
!k7LD-mZ1<-E^eJr6POXUeJBS",hC$)abX$htTt,bY-qn)Wn\/DH=Z@,dg1m:gXX.pT7#=cl
@QI>2bHbGinE#+;CV6;_bu4BoI!Uc0ebB$`\p;^.PMf[jY:15.RK*Tag<:BPM6aaHPjpc\'$
.*bM,Lo[RGF;oCNAlZ"d6@Z_OEfUd6PjO*4)lZSi69m]Ab:D#[Je8#(t/)o?khF_]A0L1r4@D&
E@<Xk1e]AHe8p[?#.u_41qo*.TqXrB0O=\L7=F"p*@oji'&?3]Af*AmO4ia=2!Bnu!-,Y\[kC3
oVP+(RfG#P00nHf)?Sgk$EK\qbs4aT[fm"-s=8*IY2/!2HQ\jFg:")_XP5F9n\Il4#8Gc7uH
U!?ML3jC;P12a]AON4]A+gocdYA-^?=I%'K<fb"jD+X>;_l3,J5pqYJf6-&%:^-5]A9DFq3eeh<
Zl#kq2G,3od>sU*]AnE/N$Ue]A2,n]AcW)5u-4Kd/6!s\DjKR<D2)Y;72')#I5F-Hq!+$03M=Ao
DnZa.@;7I&Lp=@(p;NHoIh4jlAS;q'+T\2tE#BW;d2:OsUS5s<DqX,G`2"HB:I?0/UT9:K-6
qX=EQ@.8&Gth0_CNo_`\@*+\GAHBgf!/E^$@/fc`BU\]AhjQMqlDS\1T,#WiELt8B0-BV^KO>
4]A/@YI06ZM.pgZ)k@2cai>cZ1E1mCBmbfr=(9:ANFp4U'*Il^J1[c5I8oBsC(lip,m1$@.Z>
lki3Roe&c(JM//S+S6/WB3#kp[lHJ740M5-Fle>7[>]AJNT?0*ZRhk5FN%d7%Jeeg3/N5H5>q
QP?@JUJ/4D:Z9kLsmlDlMB1A#lK*SYB%b@[5Ekli%J13b.D^2pp';Rf1&YL\0k6&u@*1@?Kc
gFs2-#epkiK_:unt?"_()eh[XAQX7.W2Y"l!bsV?5o_8cD5g;/D/Tpt"67"/Sg]AJAIWt1YNj
Ei`J*C6r9:W:lJd5/GPj#>$7TB@nQqg=#TEE;f.c9]ANTIUO(:Y$r[A>`G*Hp3kQb]A@3t+Sga
jV3'9"0`Su8J%sg%H[05T-h=l0WR5+P?^;o>VrsA%6PjtR]A]Ak=`>7U(P*f4u.h\gOtOV;LUQ
+YIrmOhFp1o&5:M;'PB`#C*ljDm/2S\#%pdW@Htn<u2#5e$Rh2'Vn?8o01RM>AQ#f^1.aoH?
[s89c#!&G59ap\f*C':BQd(pai$RKtH=@lpOcH>Mhm`D@+J"O4;*ZQt5+k'okfXe`Y7=i.aH
UFu\R>m2dG3EA%-+Z]AOgZX,=/:S"@3FfaDs5nBT@$/p*-(Y'fZ`P]Ao.gnFPc2Pt,/Jb,O!X9
s5:icRhp,5thUn9<nr*XU"2Q\/gld83Y="'iV),+%.JGn>E'#%+^0llRMOS&#98\(!O]A*<@o
p+OGY1*k'IQ)8theuerh%4o6WO-->a\dQhHr:g2(ehZALOl6hck8[,X0R8fma#;RBZ`Eb=U(
Q"Dr/I/:8r4iJil'e3c)7#@X*T-hN[0S:'U`+OdUh8/"Y![^:F>Rr/Z[TX(o<SXh"1&,!+ZB
uQIQm6Yi_63Q]A_8f*@M8s<K=?V_MRHG7PZkA37h(.k3J$#%s/&eQ[E_o7h,>!s>aM(`B(nJL
_m>dO5E%J-P16kEqA%Z`aj^a(@o8l;0AeOU)B&!B3R$X2(9WA4e7$$Oh#0dU!`oNQ'p%qABV
_)rX%?-\(M>+-:lG+*p-8'!P0*2\M<@:*fG>kQKPI,Kr=h8,I7-<W=V]A47T>q!Q9lY3]A*pM^
B(f#Xmm.3@'D'lueIjI`u\XNVCp7a^j\/\NO9B!H*N1)MXlb4A;(#-uRkP@X*d@6(9l^E?.@
U?H!]AE;-#\^Kho(TT#Tl;j0t*:Ro"FJnbIdQosE#3+\^/;K+UsNCdI(\a0<mp7*t-H#p@ZdZ
0\m+5B,Ae!;-90ZY%'';OgZ$dfNW:5c:+AWp\#7r7/IMK6Tk2"UBp;oQa15kd!m$np#<GD=8
lPJ+',PIsl!=d+H#<p;R-7(4r;%QZ/Q%s2I2]ABr8>Q:L`XP=)1.dEA,sN^@pf9BS499ihn6-
@R>3CqHC"'7cZ@Yl(Q!Q_O\"c?mL8k>#W.p::tM>5IF3&8mDIZ*Yo%HT'e5*?\hl?!AF,rDr
pXUc8JRTAD+"0*%_@d-'MN<_>B`%._%qZoiW>fX3Y+rO;<WmJ[,XDmtV6m`!1.?AgF`6/W,>
'2n-',u3$)BE]AgBD*<Psp1D[$(73!'RrU_EXm_W3WqCsW(RKU+>!$W5\"-r.0]A2hFZq9V7l)
f$6'M)7t.Q1/>W>XNW:1np\,*S\1O\4GYSBS/E?cZ;8<?"ii^O0im]A?^sMDB=B"_La8eGIti
en&q3?Nu2q1)4Oi<^D"Q;dn.4imNB6Cp.Nu#77T?/-'Q,Bp5:6mn&)CEHZ(orLo&gMQq5cO8
mdWNakQKC2j/du/pm?TQsBAI?(3=^8Wgk,5"Y=P:k..QeCm7:]ALe-ZKVI8\Au&[00P8_$>ke
(>4W&NaV?)Cch1n'7M*Chm[G'!VhaZ6YF[up(F*b:U!1G@YSXLemGhr&'iVD.;dLR5Q-QC3b
T=Zf9B-bH:lWGc5@AURf]Ae36")p,d&iSp?[#^SRBkH7XO_;*e<(rmBRG\hLJV#6gGG=6(`4%
L/=L!PZ.:7H\)DSKPIT,B$FPDs9TmV0ec2nBTklM2PZQYcV7glK6=n#a((6&k=1iEb9B7#8F
i4e35BEX`Gi9'oe;>gH7u<UTqOVE+Ot/!0'dR0UDV01?R.Cb_@W@F4"lRr>b[O#V!#e?k.$&
)'n5)WVt,H4mU64_IRaVteKu.c+_O*V*R>_]A^R9>msYsNb5*kn2Si,gZhRI"Ar1qB5a*`cRr
ok*iVIS.1(J9[Lj1V#RRY=S6@6E^sD0o(k#_4V`D*V.H>M_*7ai&+s-eI[X/tLH._e86&%gq
e\+6m\(7)B[W#GYY/n)aID=)6\iX3LJcVIuHCAe@Og?'W\&YUr-?VIg"MXG_Q71U.]A3Gm)k?
;T@Hj9^_02"5Q*cGq(K5(YXG%jbpC)_APkt;*"s/X6`U=P^%fXd8DX#hB(e'S8JX$;VUHDl5
@J*Ofkp4-1bmE8EVpu^hkZ(`f2*YLPV]A2UNAh2M&F5>^!Gk//YB>?L(9T3c15$D?B;(TjY=g
k0t%R'6@Dl_lTg%ZAb9VTfG''6*"qZ!B5^&u=:JX%c<78plg=RI5#!/V)j:?DIm966_Kc&`(
PDQ(9F8>V;i+'`FrA[4)&!nf3]A-D5&gH7n"sN/iL-(45]A1kpKP?-qh^TcLjDJOXXc&=R]A]A<h
#$AIP/^E\MB,*S:YbFlWBW%b/*n3H*i``+Ol;brnPAb`EL&131P-?u*7.o5`=OjQ7r7@KI-W
+ucdNLnI[-Us>pWR.JB[4nopn6U8Em8_=m\L.'aP$Q&@>S5UaD0Yb';T[pf+U*+_=pc%]AJ^S
__-O1&rDH<EW7rXhQ^VrB]A<2ksSXlL4!l/ukn^H*U0Q#J;fr;Xs"YV%oKGR=ub:>=TDUmkRc
:U4i"Kl47a"N=6'^eBQ?;Y;Rc`ep7T<[7=.RR@rl\2f!D8DAm>*B@Gf(+4c6)\Ih6-Gqt68K
@c]A#o6ZIm>Cqg*C_Y/$leB[P[MpliT_=O_:r3B.ls%Zj[#JeSr+9Y`SVIPmcL'M'^]AfH[]Ai$
6*.i2_-MB1_>*?i\QS5LqHZ;X#&7OQPs'?_R^%3reHtD<dY=[4)#GuKUCgU5FhE$Urs^]A@.:
#SFBa=B$0hQO7lS\"M=%rR?;g5MUJ\kjF\!n!oXdclEQ"*EBo_tr_JUT%RaVCn40.i!g>jXc
3$k(\E;4tPtPI<%=n\>ddRC);0JW<1ba?la3d@B]AYqaV+sOnT6??_0R@ZI)Q[$+EVnNnA(sn
1XT>mTmLt=je\X^6lM,?Skt'SYA1="-K!%q8Gd3*^@?-Gfd;EZNOdoqfQUK38[\#K]A2a1HT^
N*TmB0>bhB,>pr$pnk2]Ae<(tNS4Fp4KW_=9ud?^h`VLi/*,&\FIh@BZ)<A@C@XPFUH.<DK]A8
frg,,Y3`R)C$[`7+r@B:RFhQ(MikEbXd,Wn#3:O'NK)5l9<=u7n\I'(lc]ARh_f'W+7qsaj7r
8usPbn$"."8r"ilUH4flDS?O-"E*1k@,oG@!W.K"STVDTFImC%l>^Oq?&/=tkBT(X+1RMqR8
UB]A;ek!Jn%oeNe\GFhg+jaI<%:f$>#DK=qiAhI(_@EZ!T7SM6r%i8*"HDY7&KmM`TF@na!WM
X&;RH)"[\-R3YCCO1NSr`k??H#liKbo'kMFlYN/Cl$5p]ATDPh-S_uBARYS=`MU#U4O)(`l1E
0TpQ)iGlcfJ:F#i\`4dYKl?"n[@e^tJG[^dLgf,sBq4DdH_Z;q$]AB?a?[q&An)Z`F%j:gKPX
IXUs"%$F]A$0-%0oXr=KC.*hkW`psG1j(7m8FI3i5RI=WNo_<.2<HgKb%JlrM<4aUk>#9,)/a
Q_]A!'log3'sr\-Gm,qrdsd\esAjT@TW_F)uOS"9r_9O\\<ZLC*N;JW5M11MmI';D/!TAF\$;
bd*O7[ZZ6bj@Q:_MFF>[cDJSWL't(S_1;5j4BBR[=*)MlYrQU33fI<_<)Ap$HZb9jbhDmk=S
*;QNeE7A<G3.&\.98K^$,\`.BV[Y#Y*r4KcUq5nqi[TE358V;N>F*!mR_-#gb'U?\3qC;oA7
"_)WSS8]A=CB&QE7*tA]A5I>5;#:n6?SGsX-*+h,MUt*1d#^PkY%Wu<b]AD8pAF7nYEGZYSV5D<
ZIgQG;`e//PS9mUVOa4Kom,/0cSnTRd:-(1':L-Be8&<]Ag?9o`AC,2hF`Q`/I$[@$6B[\Ia[
L,rYgM9%;jr]A9H?r/qZKbGriaPm-!K>@kP;VXSE#e)t]A2lc7LDXZj.KalEg2h,r*IP0\>2dn
@<*@tW"&l$C'.s`VOD^*FgF2g`NfCke4n\LGcQCriO$\2n3ZtnR=Bjd#I8TVWc4!?uE^6Vr]A
DQS\<qkF,L^]A):,9eKR?`qXgqgY<8PU?]AQD68lp8Q_A%P9%:<$(!N,o:ekcPVn4CDT23eHJu
b$O5nb6<KbUUk=;8RjhnB`qJZVYH/gHe1_MeH9C8MQ\o+"[.7_"<X\ZXZ,s$CSD\[Ou`tiaM
=RM3;hjP?EV_bkia:uM8^QQ%3)kQKR\J-L:N;RkXh2N(?^L#NV,8(Y(7N8QZgO1Ki+Ap9VCA
Cn<X0J-NXZ3qbUK2(%imj<RV47E9h"KJL#892rN1=8?-f@N*=<#_k8JcDOPWH(07#L$C*nt&
$Ca'IjCn*&]A@=Kf$auDsZ]AsWcKmJk9cKpV&S]AjL_o0-O]ADqQ1fdihfu&gKm2do"?7dLgmH<K
CEH*IO-*taiU9FI`(h*l"bcV+7lIGX"JVQ=G\gV2e=VN5K:AJ(1GnDT+AM8%9pCXD.%\R=t\
UJ,KrEf!`q(H&g)bsZSTS1[L8FMOtII?iEF-bE`'i+El7i$#6:jf3A.%74@UsRLY\spX_JQM
Y[<?'g3_r!C!1&I&4<oCS[7s:hFj_CA4&nok)qZRY`SiE220q(_0dO_/hLn4+ilq?;rGiNlM
0GJ'GI5j_Y(-Wcak&hq!j$#E*Q40i.>J?9u@dqpaNj'gao$qbY1JHlQ@dFa;aE.@YEWXhGl(
:1"s.KG'%hK-*Sk;3k!\gIo,e3Bi$)bJ%0%8-P[ZV9>7"=N3jG5)=PSeO(Xcms%-;MgLX&r+
Z-^]A+\[S*ahD*1+V<+-7E&]A!5Vs0gEb)m?IEATV8+W8?P.YYM;To=o[WnVOihQ8L:"oe^W=*
J`qKZ_M+A<7O@_D]A+KANY?CIZe0E/RT'JK>i@4T1-4PjL!nnlXbQJU=q8q54S5b[;+YjSeRH
?<mOSj9Rss<Cd+<p?Yr;E<f1UjuO*H!,m8$Qi?ED8';7U$R+p95^Ic$P^YMjEPl@2U$-]A[Xe
SBtiBt.YU$N!U@sj>ldi#.ekj7*iW>!BOXZVfj5bs"k&[GKp-O[%<6.R??B0FGoUIV0_nj_S
uc6']A;<<SX;p"qX7l/B';84UYUk`g-0o',]Ae:`(QcCsYX70^L<Q[_-$7%^)bG;(1CJH;A,^C
I=n&c^@Hd.TP]Ag3j\]A`b&;J47AoN*)%5k;<hDi]Aft5RP7gL>Pm$_G&1c`@<?G"JTQcTc+Kec
Eh)mP[IG3jWtpqfi9Xh'sm=11.c*EAGj;mPFDTQ-:*mU1P8s4>P_5W*h(D*r#+X,sbnWJk\2
03Z=o&J5o/QE%>Be-R<t:_]A-"6)Hn6'"CoOeLJ%+6pZW.&M\ie(oEAt76kDi!XW?LOYMM7$l
R.]Arbo0-dl$#d?$G,:rbL)*7<in!g&(.7m-!'b`#BLko=b:bq,CH'eS48:n!(_o$ikXII2,0
li".msh`Da?s.aM1m`7V.!1Dh)3..]Ae1lR]A%'.-qEh2FLlaC_pXO3)3NRKsJtVR$REUN>%@=
*rW3Moo262K\Q;htHO,I8<thJ^j*'Jd&)!o/:%_=R_X<>!i,50CRNM"52S?9Sm`-gZ5Mi'6P
`N7ib6I8[GP.R]Ac1:hemdfp"Dp#Jt>,0!qP5)[3cC)+<0j78`=rt*FguL![B^43kE@R.1[Hc
>OA]Ah@%KFUY"!m7qYm;SQIR&EOa/X1S>lCBNct9!V(V2`0&c/651GBEqL\fR^P<Z8+Y/C.p3
u=D_',NJk_ep;/*Fj)3W0c'p%NaU7$\WQdXiGMX'M=B3e8q*ft"DYDOGf`p%#R=LICT8!3p3
<Md"Y@4lLS"9-1=OHQFZ7ih;_!3g]A3;2>`EK@Sb%2_:L5l(DZ;-@#A!V3:Jgd5<o17OKsVIX
'@bBc4o#]A!]A`+eYV*_IYPkh:<\!<,<.;9$FjR;)UB*\AA0Xk`H-c-ko4SI=[^g(Ujbl=M#,]A
QD1=)d-[1p)n1=M<KlF<.S#_l_*S!nAmGZ.+[=%?c_DE>43H#a\mr_P0Qh7d'>#FNHKKjF\R
Xnh`^B7*Vg*Xu[%li-EdcgDNI\!t*AjT0P`hlb2ZTX*KUAaK9YIJ>aV='biQ/R-25iPb7=$#
1!9\2+WlWGO:BDX4S5Z=s9n/S]Aaf.9ba.n.V.s^r:4K\(qHWEb&o6ZEbcm*f#X>5';$Z<\6M
bceY`k-mcnl&5\5@Fc8amIm,nqT/Jd;mhG[cioRJViMuiSj^jeX9r%@PmLCaK>gEMsXkB^7-
tJZk\&:+?D(.t+\eoVA/3E4"1i28*<UH/GjQkVGnU`bp>]A+k;$u%*cEO1uL,/,f%knX2MQN0
l!:(gJ[>,C?6D1>ePi-Rd0dMs]AmS+PG[>NpCU4C2%_INPueX7u@igml@Ej?$W(*L]AlFWTHP,
^>A1@ZdFru^i,.l,;2'HA(>Vb:1<;\6qpnrXE&Ndkdm0cgD*F$5R':u)pd$R.^OlE"KUGVo,
;1$QWSOngpEsQLN?1,(GMUIPN3ZV]AF^`FK9&0_XE$D")q/%m?>Dt8$]A54Ze?bJS_j:ufB>#:
.i(=Isa2ccANg-t&L-&FbO/0`RIU#_dIH'LJkCKBA\_ip,&<EmF]AaOK0-u[m/6IfGQY./&L?
38U2=nLt,=MF?'kKeM3E!6)SWhO^.NLjqr>ZCLDQ5?\5>^rN:\nD#6D7Km,pVRNNEP=%"j=Q
BiE"D#F94oVg#faNYP(8hB88G"ge(ZAkG',p=kc3>YHgL@AS@qVR0=9`)4Y[l25jDLlg(7$;
V:FVVU)5fmq`:BA;hlQO^0s'4S!O?HZBHndd+=RfG-=I:s);O!.N:U\=4P%rce)0&3/,s@B:
R^Eq)Us1`R/!:*#&d4$Sg"V_m5R(92kGS>B1Ran=?$3p[9B:m!2No3Bq:Ri'cl5^RL"ec(+Y
0@b4[1<%2\/lpM!GhA?roMsCg%PeTpF*:4cHkLJo,.Z:E<\`Kn@fkjeNU:R@8`:OL4jDI6<o
"+&.=?.T6c0N[PFtVs8T[;+Sh%9KdqGlWDZI?"OphPsm5#D+ur+WFe_D>'bbL%s8jD*=7<29
D8)T'ho;RGm@)9EORSE#1n+i%.-i,:s99o8@el)!LN!`+43s22Qh'&VT:Z>Xm%MGfP="\rh=
Eq.tVB8$b[<^Z]AXbP//gZaF74hsQP2Jfa)kp-#>+kk3,VG]AJjSoNQQ?MX*n7RtnJDs5r,J^Y
JeZ[VZ&An'qRXT:U"Dr*]AI\^'js6FSE`e`N5R-]A;>\YRgDY"KbG-$,anpf!8Ln#3<dL85;hC
-.*#PKJVY@8H%@[teJU5O*6JFg$H.5_Q$ND^1c9*q]Afeh&O:e%K69\+C6s4_P'2852H4^gqa
+R+h`ceIBKh"C#4_bVnfLOgId>G'Mg3&;#B'YN&Wr84e4!7Za(md;,4PYWT]AhS_DlY?8dN0$
*Z:VMsrr$:qNoSm&S>4kF='c4\_F<!o7+Xsu.`RHAE$WT,84B\Oi]A,.BN!X7_(a)uFpDKfn@
MnkthRM+jg8KgBM"nofaYC-E0<aOjLA=8I&k+FfE,i>!L%4!JJ`@%u<?Qc^^9#ZTF0V*2m]Ac
EtlI>ouE$`rE$pH&,oH'Y'i.AZm&QhR-bZ6!p%N)Nq[lE[`g&3L\cYA&O+63uk:4+Kq_94fu
6'7$^Y\(tM/BL'u0<.<H7L3jbsr(A-I[KK$C@V5#d(UKKdYUa\D`k([7A=5B8\PB+@b.ghFF
3IhQpeHl^Pd(bXm8=akm'KN:i(pPAf"hq7RZ2t(<XTLi!n'1g/nN(BR=m;*7U_-k3/l3%=FH
]A3_e?M-EX9lLAt%;QDB`q)5I"h;FGhN]AIF@LhNV::a]A%caj=BVYeYTk.Q!UtnX&%]Af_!OgKq
?A9orl7`ioYcYDLpO2Ye=U[?dFHib?o\EDW*=QhPQ2:):]Ap>%PDJ0>LNl);5n$sK7Lm?Qgri
MdA.e=_!Y>Zn_Rc27JJ8LoiE+"em.o:'ML6lsp-$_YBKV3d&8k:7LOq(H6$/T\e^0;EVbS5X
=\J0$?=gmu1grY5ne/_oi'd,^]A7M@Bo3)q,qOD=Adf/&CH;ej]A@c;0]A@_"rlLYi;KBBt]A#/$
K8/_a+l/5Z.&8q*;Z<TA73ud3lG#^NK0ed:d.i>gV\OM44h'4R/+#(bp%l7VG8aPo'msf[0"
ke)B*DV*!FkWHJ$?qA)D-SRJ$,IPf&eEKS,2gP%Yo>i08AqeYrZfOVt*OU2JSeV69DS^m#<J
+e?2_c@`=BC*&57%Nnat]A`A>ZZ=#7[;;sab_Lb*?"!TcUN]AG9+#^#VgerHEmUqqo=S._^6L0
r8/(@7&F4S,hb3.6pk]A.\e08]AeM.+-7fq9k+lOI(B_^L3aC\Y_pO?rY[(tn9nfl`#?g,R@5M
&KmWTn]A4$ZHWDRMOfHObi6C<6hZ_aRqN3o:]Aj4FaEdfXn!Nt[CU9u#)aEf&"t\O&osQ%&QV2
Uh7%Tntp;7*6)sm%H!LS>*_.h`7_`+p8tP==&>KV7s12M-kD+X0<!sbD"V-gq`$tX]Asir%mL
$u^#TB=<38F,,e*`Tb2O;!#M,O.Kr"Au>83$\q^e8=s3kc0`k&n1du?AZclb`KWn\C*9?F;]A
Ll3htio_AS&]A9b;M$-\V,)R:DB_B&VH)e;nU";ln1tI1H,eK',)oZrcj(IQ>./;Es_P:X,Ql
3e9ZT(/g8^9gs\K)%sZ4;rQmV"O&3srUeq&=Yl6G?V@c"MAZkhB3_Q9kED'$V&Q*gc5(qdOH
JN.cU03'X*4idR8QmrUHf\B!^3]ACO9M:f7!TV("Ff2fkga\^XX7YWTC8=X;Z:+(+Cg9fP=SJ
ZG#a218SPV@kko"N`A2Z5C:sDen!g98GSGrTO%DF!bF@J9gD$0Y>[r?GnqFS9^uNF\Hi2e>V
'fd7mP\`<oD/K[H\bWc9pEF7NqL:pG[X+tfCYJIm%`.opo3$65n5?[0kI1IWl-p';oGdsS`4
LV-i'ZIK>"(DssJbt^,XD^k9VIP]AT94gkp&XM'n;#u>gNC#:h&>?M2h\rA]Ap3Cl2*0g;TinN
na6\DoqdV"/c!5_/\DJQIe&B[^`g/@W-)lA&2ofj1EO1i#nY4X\k#T$GYO0]AK9D-SNbm5I_O
Fj;1#GbtJII6H[hkW.%dVQcs1b>[1MR;4L?Sa!]A'u:j8&Jc\"U?@Z"i/;bn3;7pA2jp>DRgm
WM1LF>Z4^/]A.IF$jJ-K*1Ho<G<0$!Fp7=$]AY;[sVW#-fJE=JaX(2M$7]A;t[$qGuab/jlYNKA
kimqW/ec^U",X)C?uNmYsjT^fI)hL8psqU&q%odD_*.cl.9=$2^IK6?=i--p"*'(J)'EKOKf
X:V\F/C/t)DF@+%D3!,&H]A]A2e.U_MYN5AH!Q=K`dAGDOjO!1dN+R2T_4mH-NZg!^<e;2'(DG
i>-gcm"b/(pH`2X4M]A>0teL6HIN8YP,k(mF0fG#!#r4jKRI$#=6"^9P,LV!VqS?Z:@U5_\6B
h'3#-9=5`5;IJi4j%Rd=(n2$C011::R:YTYk)JTGYlD1ZqE4i1conbA>S\dP[^m*B[o-b$&_
Ad./;]A#;bXjh$j=E0%1\6Kkl.pnLOMd-OG:Nl"Y,2%CBkS@'(\BnnFaC$APd&nNQR0o/(I/P
8Ip;A7Uqs,:?EuZ<]AW44.plc,HQ1*IIQK]AbLcP7A>U\ijdec*cEG<st6R(*tlpD3mb'0)tuD
(=329[$:\.+71nW^Mc"B1Kb.`TOG\OcC>jI6h:Q77>[B\;(FaPkJ=A?"cK)/ZdjiN\Ee$Rj:
"LR!d9]AmUS*9N2S[E;6Vap&a0>-ub5N!pi1k>O'mLY37ZB<hGmA'6^6/%X=oo@Yg`+t'Q_"5
UGB0\kJ$_=Z]A<Z(VM1<q?diJW(&=M)s`C>!YV\VsqQ(I&l.@Pl+3A7[h?!;<2k0QA+hn!5_e
cgB]AGXH!g(Dcj:EhgitN]A6cr(_q??DH:r7?NO)GZeFF*K'qk94_,*!km-I0K4-K)4WpDGkGc
%$p/$K_`mHlW>/['3aA)M5#+?e<OYRsCE`>VB^[\Dm)sae^>d]A!BG$i69;_c@Oi9WJqlo+8q
kt=jL'4ZFuFWI>oPcaWGCrK/8[mt9WDY1Z<^Km%X`tH7,aQ@/'E7C^hj:#m;r&tOlPkB2%82
U@EoY5MZ.oM)AGM-H&5p0u64=E9PmN0[gO1;o7&c86AR5n"g`gk7#map.EdOjrG4DrAc\!9i
<4t3+)<hK3mA>&Xk&*j,]AmUT>@XLMCoZ%fUXD.$hRL%p:E`5@419k@s[Z/YY<A)e>Qck):LP
5J6+Q@a7uZJPoo:(EJHFS^8*WHB76IsRY>+e+$sYUillF$g`VR?O)m`38QC<W087h0HP7H`b
Z_D)m(u?IF(DMU.*Y:lj6VH)dLr@\WI<./dBfm/raC`;kLh*Dl$YY!+(ZAYeR9cJ`<e!,1P-
o26<L]AiJPXE+,D.m[;0rB/S#7+lHs^k3S,F-W/EXSKl<R5]A#8e37AdtC?.stShKh7B/%BFm[
E;8<.tL0\LD^=!CDj)=OM$0#oATJ?ck3(9uqsaE+*s$/4/Ttr20KPa:Nc.4^.T>T)9\P*BRE
t+A!nREV6<d#D'm,;7J6&QTZK;-TG/\XepoE!#3@G;(jO_a\X%.,sI4KI`UGrlt_Bm;"#9C9
#4U:nRTp/Y.fBtP)5U[U$-TW,FgL5X'U:5qI<9,&F?9PS:a*lMHY1"RkrV20-N*Y`.gTHc.Z
+_/gK<m9$&c!cII8S8NHJqK9)5>J,sjHpkstD5-CPIMV`cpc0.mcl@:78WVFc_!j^MG#Ji;i
igCOO5o3?S<(53bX^Ma/\lA`,^JO(*(Lg*CIk#>R3-lW.#DD2Jlm,gRej3Ct]ALp%>I5;/Sm;
WJt%;!EE+KZ`SPs83;8lY'U7jXN>mm9VuHbt.@6W#L+0Y"A,lRYDeASi6G>`)`0-@2qc#0dm
kV*Ukm<M>1',;IdOCSO7/c:$cE:-MBK?1hi>6DeXEHiV"taGYJ/\T@FQ7Nl]A(,QKo#o7s"Bb
J/gW&E8u]An+E0:qF%u*<dcr%NpItAUKYQuAODQB=OZo7#PS7.P0AY^Gq16a[DbXT/^.N/qoO
H!?Qt4.kZi)dhXV*)0@lMjoaG>jY>;[?<&A4Eh3l\ZkekO*llr$%\:'07d#;S+@%9Wsb$VH(
Jf-MDZ420HBc'.#]AjODNA<1oN'mpH+1Ys6Z76b#2fkr(Jlg#4A)bhRLi[3BK11V3g2!bLF]AP
FQn.@;OSQR9kp3^92JM*UEH:ODTi0FC,3iO3%u*maXr?]AC_&-h.'76)uM2?XfLt8Q#Zn[^d0
<io0A=mMBtmC&-N#EDsRO5>m0e;*kD]AhC.6f&/@%RgKmi.osQu0^gY+[n/aa)]Ap2Un$;0=Y]A
!K@_k\p%</#[t:iTO2R]Ao.#rYrkutq@[,Yn.,(ior:t^N_a+>Q.MCF@#_;q!o6_:_oE0,6W;
=\3h!Us_0VFWVWQC7`:]A6)1*RnD.?Yn"9-_h_]Ac]AenPKXYiT@njTZRS`HJpIa\9ulO5e.Q3e
rDbQR-\st0fA2oio?AE=V0VIXfrBmnNpss.D!YE(QDm3*cLM#6(KI#h(b%Cn4+HBi$n/PLKk
s4s.d75uc0QgkodilJ2(uXT]A!n;^ja;iJRZPEH>K]A'dI:0I_SF/8tmGlH4-\@Sr,IC"'FZse
k&_6!*J5;,LoRk5&V44fs[lq,QdlNkf'S<"9K4RKC,=Q^&EmH4sJd1<e0bA+<XF-5\At'?h>
I&!H0XiMDVNRKA2j6NP,RBuspMZ'e;^m;Br5"'RiKg[\<&N6U;>dA/4'L[<5#,BjViir"bGW
/pJ\@L_>_hoGqE#@uh1Q1dGh[sIP=EWUQ\k-91@s&#YM^P>gPn$5,Fp+\TYZX>a>H,-8W;9V
ej.0gmrF&ZP=0q?kZ^oom=Qk]AD.lj*H?+$u/^=FV_*bDBNn$Hb`tX-,'%a_a@kMnQFF*>4$>
"6V?+/5TkiB7jI+.HmAu-dSb_Op,BNCFNC[KElSP*&m/[9SY&)f:U`L!N4_SdITo+&<T#cK-
.e*.i#b>BBX`<[A"!SXYgS#K8PNn?rfZNt*!L^O_n=j\glmF]AP,6mF@j\:`U?<K`L4/`6[P=
e55T>?W-o3S+7PU6l@im]ACaR\b)99j3HQ[Ai"WP/An45cD+XQSqGL8_R8ZRb7D<%nVoOa>c"
I)B*6A]A%rsI2#9joh8@TJ*/edGVW`pK57.%-30f@k)\XdJ-lUDG)_X9:42-oY@Se+t/?bCZ`
T#F0YCf+T6R=f=58),u'ADeTqXNDUA=DCV"m4]A0%bH?u_p\l-3]A8auDfm(#.-^(h[rp\q$JJ
r1ckFWp/,O()Bqm1+UV*CZZ,.[N',f>-Mjp<J:)7+`/1R[t<^+aE=rg4$Ud8_H`@$A*'$u(:
FMEf^+_q`URbi(l\gPYgeN4GbLUGuu67<.V0dtGIXr\a[2PNmKhRQ1!RO1ll4P$PTIHYAPM'
r_u@pL59;"<=.<=%$gMn0![C@TC#*N#*=m?tN(1%pL"Xq+%;E)H,,V%/JQ"hEE%gF\jak?Mg
F8Q3_/Y[uhAP!Y[)4\@$@K:QA"d<Y.`>(=i[Bc)fEIOmo0:?%*3f;NY%R?X"3*,\,O,Jt+s<
l-ICs=(MBo3Hk,pRLM-O7(V..5Jr%@V'ViU2Gh[lP3`:r9b"!jJ>oN]A*4H3lU^>G)D:HO;[k
Q8\3.gYX#/ERhB!P6J)24^uqKj<A(c+KN9ZRLQQ3(blmT-4O:9SnMAAiof>&!<9ca_E+$%<^
K93,,c75IL_ngtC3-DiDQ)*%[uXr?nuL6$jKnq7^1GFPf<4p-g2EjLr64]AP4ATEJ1NYOb]A[5
(!&,9R:(IIDBAfq(kTH[N"9>5EN>--6<dP+GDYCh/#E$js>\b8C#ZG"'Ne@qU/f`KGhL-6:e
\ES\)?g,DQB/<aSm':M6?RCEn(c0,dJ`3I.a%Sg?\<hGu8ME#2IdaA[H6]A_EDegpTUtQ8oUL
[1Yq12$-T3'X&mCT0Th_;HZ<!Qj4pbHhkn<\GjNl+?aWtk-VU<Rh_H'9:t+cL'NW/<<q1)m<
tQ!V>0<(Lri'<8__c*TIAE+Pi=Nap)!)boXaMSd*SQh\m!-QMl970A2]A(_/I,H3+cjoX&n?L
cGN>]A&[:<,:Yo[G_.LJ>4)EXZ.Eg<[,d=Uk*mA"tNGDqA?>Qh0f/5UXZ"!TGeF.-Q;T%hb#V
)sd;1A4l$ReC9$Vq;j*%,EA1i<?.!C[U&?r.tPrViMVJICg/5"/@^d/k!q>i@O%mB[+XA>W#
^jCR_BtFCnT\`EWX4=0`$=2*00eXUA9".S>2g/b-IG@!Z]A?(L9$u84t2mY,Xue7.6?@'%r[b
iF@%f\pM'N60aEm(d6buDcIkMVGh>k@_A/,MK+fmHY8p?M0kSi=k`%:>M?PgV:XA'D6K+NE4
'Qa=^XNa3P1VigE$BJO+c,FOG)EN<qR^dTN-jka9EM7P72fjZA)*%d?31LhYpf'j,EknpQ*g
31p&QsE<QAMJ/t9MjPnV#j1Ota_pm.>]A=0iQ@A]A9bee7nCI>m2b3tdNqJXYl1[3?i+m;I[+i
]A,!Idq9&b>RN%7Df%C%4ZZ5Y\^d#Lo`<3>ZY5N6`]Ai17ZpbPlQ(B?P8Rk?U\4>i8VhD+4F$$
JXU.-H!7'pMX'KQo.AVW6eY\`JoC!j7i*nl0tJ?=_-TXbp*#q63=VecWb!)kf4%[0:-N#7,f
q#O%%#()tBa9iT$il,LS@F==>FB(BgR/(2\?es3@k?g#adp.gr:,d%V_&aShWqM3W-,_kYP\
NADX6j<?eUOo%.bZm*\Aeg?L;lKETrj!T%C$PLk+hFs:V2Zj02*:L9Kh;7rfm3dFr+9R4K9'
ups!#.,`%L5Xs`bTkU"2kmQnELc`]Aq=OdM@u`D2#`l0+Zc#f9ZGT5.=iq3Yl=IO@(NM5BYJ*
V]AmKg4nQ:M.X`/KC$GaBtc=%fa9kJ*:5ppXNNckn.Z%@?eXjnA@1j%YBM$DnOh'[cSn=#;ib
*N$qs6B_nbCFK&&9d`J(-'Y3#F/=D>\HN;S+.g-0HZURqpDR*E^/2MEfk%^McieS[u=L9Fs\
Y@NV8"Z9f'6kb<d-cRlS@C%k!Df(D636TVnBJU-O^sdNuN[.Q,VJgG*9GWG6W2.@)Eg[GX;:
A_`1X#imL\e8*K'>uhj-;R,-KIMK-mrN>>'"6s*Mb$E#:%GAWWRlWB<,&jMpPtX8MGjf9pUu
\^5RgGdGrXs#!>L-i%,p:RD!<0jJo4GrDb?rEg""C6]A:INfS&A!dB.tu5['2=@r2ss'Y]A!UZ
T3P)p7Bmr0<(L5o3J2.9n+H6F#8T_RMCmEJVl;_MZEN@2IQo4[cfj)S6.B.m^!>Ie[KDP-Po
*nHJF=eCfe"HFtmmEV)WnVVRi3-D;XS/g)*#f(^jkVEP5N1$]ABI7Tos.*pI6[J>SEO@*\\e7
5hk4ViJ1ibs'fn2-Q7'm=-]A`lpSk7HX]AE%)r2)*fo#=Q3aLBSh8_?j)g28-LR@o@V,1J&LTJ
gkp5S4($@_S",Q;LcD`A##?G6et,%$sb?7$s72"Qh5cq5c=pk::lPoelW]A+T+1)>t[Q0MDXo
0742s.*(%HR6cPfRiF^f9$Jd.b%l-mn59/L3:25V(b2'8WM$pR=SrhV7qFag_Ln?+h[;&%9R
rYlm0K[W3^>!c)*t#df6*)ZW4X<94kSji3'Zo0=/RLoN%Mhp?g)R9<hBu9\#Plk#L`)7OYIb
M77O/=F%rD9$aB9I#"]A%Ks@NodO?2dL)`T[pE)DA=L'B`$ICQLI)ZE&BhGq`<rO;T9]Ags*Xj
/263KP'e+n!NHV<2Xr(f2VG!;Zst]A_CBA-.B4+)5m0%/jTSNkLQH^lO-Z,d[(%-(^UI0?9a#
@bbf!F/:'l!dn\dYX*;T3L7D?n`GVHY531ll36JW0@S1j"61d<,,Md$\d'A?dSR<0P!HfVt*
8o&+)2is%`%RPi/-T*I;JWdbl(8\$TW&IGqM-d?.;0&le`-0&-7d!1tLUZTqIRuas]A,OIg;E
e,GOTcO/*_.(u='I3Op)j*?V('jrB!l,tdQPZb[c`LBcm%@(TOq5nbR6pF4@Sktbf4I7+Uo,
5Q[>YN3XmBVN+N9!bfF1+p;dmnpK"?a!r?m$2ZB\&jr-m\Eq>B)iZE2TeAB2ed#[m.T*nmV=
0!LaL)Ald$TU<pEW^3uBkQKr[Mb5l175D8@b?Jli!2"5_1Z+A7=113BYhYV4ZG`#'FdBW94b
q-CH.Qn>Pm2U"GI<R'$hN;J9`O3?T_(2Z2=mF/,]A@W<#oFc\J5aQO15=Nak4-QHC=sK*5fIE
#09(f%*E;f$#F%>+5rO*fS.5s>Ll4$A)<k0f`7_>VOe/BG1hI\VHIr,mMo2%kU=9#_8W\6.K
-%ig-e`WLR`Bja+g_Au=J#VX^XYXMQZgM<XFdu>>XI4Gr#b1OQFE)k()s5i*:?nm*ik.&`5I
KJ)j=aek&Fe5J#ijAbrEsJn<b6+W'St-q%^VG@'nnb8B;fa9)ec]AW-IU)l@*%"6ooLkVZE$,
,Kt7M_.tOK)AD[(O1ar(`E[[-l$eAj)?.lfrWjXRr0BJ914G4A#I9\MYX%3B>POnMY,6YObg
a-fbblhRW/3c;5$""#]AAKu_JCjH'%q0-?KTEJfMA:QF<'fh?ZA;IX%SU>HiQ61O.RC<cYn(L
V+'Cf&YIXpB5[i,(\1bjTS-.\7k_f6@9ZS[O1UhI]A*q[U.>Ql0UT]AT1)-?YmW>[l.;W5<r-W
%-9Q)pQkrXqmr$#*TaKHrRfu!FpM[Ph08."\e"9Y]AMg@%ts/JZP!)OrZR#q\cJn%p8>KN:;3
JZJR=uLCDu%\1L"rghIM;06SDRUioF2X*_[!dHs)DjD.(D&q@?AHH;g-$3KVJI:[qo"l:ILk
E()&@*b>i"#3J%XX!#Y_]A*GFF[HeKM$i/$1&hGGdmQ9_U7]Al71o4G@Unk^bST_6.0D9t8SE[
X,1G:ChcVV3T$?S<ph(ZKcUaqkKM#p%+QW,FWL5<7`"<i.NQ*Q"Y0qWCFT@Rj(5!=lV4&\mT
]A-Y`'I-<PHqLcN,J6REj,,&u"XR[\?:j$!+_\?rSu$/I$&F@Ni!%m/QeBE]A@I_u:'r"j9PoR
j@u2%G[RMAP2JTBU`:7Hg7LO**"B"JP:=IF:KoWk![^_3_->(>3/kqa]A758,c)pM574o-J5g
[g($f8*WNO?cIrlQ8Sd[?sJo(PoY`A;.Z^9mMU!;j7)dDTGAAf.iG$Th#*fMJQSO'Y#K@^(6
U6h%&fai\ZZk'oqjW$mK_[,^p[*j0unHT8dDBApE"oS"#T;j:2b\c@9^lIoH+8T;Df^o9/2U
p99NN0Q.SMPFE$B@P&"Pl!0!J2r=90SsWdGDRgPIEpKZo_8T\u7i8R_1BNOq,>LA'R[-U/JO
lH*7[tFo-i!/fSC=iKVOs]A.JO">(EAMNe$Obs8@n4*g0.B@(27Rkth!?b7U(5V&&NhNA6,sm
G;_LEasjckTE`HqA3GP&,GMmAc23?:U3'@OQ2$boO6j2njursU_3G.K<a4!CmScP,T8F0.))
6>Bn,E_&C>o1O4(EEoW_KJjc=827<5e/SR5T\A@u!&%Kbb9X9:8WCL&oSdS9.+'R>;q"-o@b
W*DN%>jDL]AZ&=;7p1qlm1!T+2"!P$,M4+)4K=1Ja1#msX_<"_,V7gWSq]Ap<48&#qp3aZoc4N
J"@j[j\9j$XVU3>h-(ma=+H3"M;?2htdQ>35;0SPeuE/.q)G_0hk<-=l/L[Uf]ACdCG??2>6$
HJjgW]Ac7C+8T0HXG>rNHe,N_&:PL(]Au!+fW?ePg[&pJF1=(6n+-CBar()$c2:.ElMs#FV/X6
b$NfSSIBO&5CJaHYUAaZWHn6Bah4LR0F(&#!;%'9E?GZbmp9d"Wp`06OtbE2,2EW=WYLU2p<
lWYX\g`a*nP3<)lkE#iA7>1XQJKC3i't=Va!j.Tk4[PmSdrQ:"-_ASM)(<o,>`Z?5:1k(($C
p=R!F"[#gipcLGA6N2ugAr<2$8ZX;u;Y6#nrRS!aD'Z+429T(<[WV(78hRgm*R)4mA%dNq$o
Zm2#W%<g4NejbbkPLu>VK*"LQ>AK^9t+2lHeJ(F`s[7ZMk7\lf4=n$:[1HX,^f_mdCU1<QOW
l]Ar.Oj2_Q2Jfd=ua6\g8IP1%SX-D6%EI.\=#kb:Q7?V$#04\KZLY5P,Qfl(Sh+8Qa1IXq/Yg
.>)U'ik?IPrYh%p/:`lMO4Y#WjKKW.'p2gFL9[r@E$C\^BeEP8E4P+_F_m!kEHN]A>FOqo0ZL
Zi#B:e\FSAF!iieM``9-NAOWm;52a/B,qfisQ(umF,h4nGYk)ZHMQWVHE;UMGr5]A"$)Ol?61
1.d<uam?bD,nM`#U,E3eJr@eGs7']AqM).)d##$!(_+Uoekm+1.8[!0nT@t$/_a^H]Ak=>:^K*
[X;>Et,V#;S#s=Rjk_1ZEV13o_5#=;+nlSLeR)2^W$/+h!S#"Kfn&!&K=!fRV`!]Ae`9TAV]Am
BU-LfW974#gqEZ7E3ITc1<DTTVn<q#LE$YQ9U5B3)m)35@S)Tk^Y3Err_FRn7VGb1o5lkZRO
0*+)j+%33<j3j>g!EjB4/kU-O("O4D1%3j9`m_S<<i]A)E![2n/&ncg8",Q!R/0,5dLI4n,\\
=4E(_&n;=ccO1-=g2-:>C4@o(OV&V;.h[oZi2/`$BQ\n<gAQ$_<iYt?m;`D#Q00m#/Xb5E\;
2dd\s^WG`)XL6g*1>&S>I[!g6GJP09NI_*AhGmVTE?;B!q^+_N=jJiWIJk]A)Bfa#.D?=i1"A
U*cN0O+H2ZFi/6Ia?;M'h(FB17E\5A)p`mdRPJjb$.MoLSeC,Ht2$Z4lQ[TC8enAR<O<E%3h
X":CJH3rr&:0XL@tGDtcaRs@b^/1<j/_[)1lJIPgQ#-)1C=:*edb&=qa,^m1fRq@H5W;hX[4
+U4e9N9DTq41JDo29kgZ[KG$@u`Aq]AT=4l96U06j+IOC[0%#bJs^(`P'Q;;Q8*$lV68/;7E<
RG?dIP4SfVZ^DEVlqT,T=NI<'&O^s@Xe+PWll%q7m!e"4*nI]ASTfj9dpUdrbO1AEr<">,b#,
&uH26#Oe20>?J[Wm-a:jnk2)EU53rBjR.Nf5eE`.A2WL4AEH#L\PKZ5F2Jta?T8b`4O$<@C`
,1cIdWDp/oJb<cRt(a<i:'=="C_M>Q;/pl@nE[nmR967gcjpQa;o:f)TY\3_KE_>KGtB!-Wb
il"B&;3p$Z)(DN-S,sh/eS7"EfJtX'5Z:7sA'dg'bIlDXK8-\@GJH1+S[hJ\C<$]Amh5hO9u<
)UdsZT'aUZDXe=V@De'Mr#J-D:OBt5N9AX+)mR0)kMi"n@NEA'BTo99Mfi'iSEOPbA;L5nK7
'Yl9=#4fp-Z?n/Pr+Et1MuiEN:nGg(OQr?9W)!N<SDd%nL3)0u16d<C\/nZ&fBB>UaVfQlEk
m"6@M,l`/Yh(eV+Y0+l8&KJa-]AH5lV%n:K<8$W\O9'0cWPR-$89%^bJj'nr#f1b/5e#cY#6"
,$BE2g$8R(eM)aD'aq1/2!U8`crXoB"2a9M-i=VO9IXq&Oc%noL7#723(ZG`79L!cV+Qq1.$
rVmR3CQ1mcp]ArQ#0,V8?;;ZZCR"b\J1>!H-=AA8r=fEYDX]AO[-OnMRc\n5Wp'X4&>p("d^B+
/-u`A_nN-]AmnH'>]AGa2Yj$>2.6?]AZKGp.'W,Sb4Tki56:cgbr_e&TI,p)JD`i8`9>AY&Bg/l
ktS!J8uXH\ZfAN/i9eNg6[gI!!8VNc2q.'dthW0rRVO.bW\a;`<,qY"a@Em.0V"HOOH2$(,$
F@^hE07SGgrm2caDPVS+CD?*C!>Q?Q)R&l:8F*X2;V0t":>hW]A`"i#pPhKqK9%t#_\p%N8qQ
O"ETr_%?F2C4XI*`O:9jaXc#Ofiq3O'9t?_6Z2&V'pCM/ANp;Aj4p^+r6=dT(3.G1a_Am10r
6Ue;Mc>7jqerdgQLD1TIXZ7H/:6EmLb9d+>:'8YH\:f605oqT7(J@XReNmY@Z/H+_mHAFY(i
elJ;`f,T6LR3MJ&+dCIeD(B.#X06F6`T]A<m0*C#8;\2;&,m^"XdSN^i7r!n5.(7`b8A'!ZPF
u!)m?jBBJ_qNh<@M[p;oI_Er31LQSt-q4m&l#9&J^NXaV&=8W)^\b^NYB3L"llXi;_^#'(3B
^u?Hm"PQK9jmFMfX'eYBq]A?bm]A-jEe2qQ[[U+;SRbFJ/2iffq?"Ghph0*cIa1$3;"^;`7"Jm
j5r)nhe%qhWF[U,bpiO*=[Xh/-%1cOcb%GG=sk<#/4K_j0H(&i%B/`WFaH*Z@t5N:R(n-MZn
u4te=G-TasCp(Kpr@8\QYf1HR%!'5VEaZ6LrEiW)X/?,l"fE]ABX$&t%t0-mYW:93Se=9e-3W
cF8i$W)e5r]A''Wi!AE9@n,3sDneb(E_/4iQ8fCJ';'Y,jNi=]AXlIp\o9&bD6$p-B&X3,A#\h
j@^Qo\p5<+&!&o@erW<4m(dbrOIdS3J`I.[V4Mp.cJb#<kgnFF6(fs6(udSI<B4$!'u4R/DU
K&l&A@t4J5'V8I3HJ?!2'oAH5c^%:Eo7T)1L5C@_pD9^?O]ABA=NRlj1bPDD;2UrUt<HlTP4s
-*e;Qr1?q3e=:\"3DlGlA('l^M3s:YT.6ENAoeir,@ln"s-E0A$e;oEntmY>3k`_dmAID^1g
;fBq$(Zj_<V)?2jZJq'RfJ#'935H$oTBDWbBX9t[!LjNR\B%-e(!s]A0:VC97`q<J:./;$''"
6h&b%S&N=`"6i/$`P5(rp7&e-Pe_uou&sqb5cB'1#h\d"a[O<:KC7<I)C99(9F]A$V>/.6T?/
3ps6>P'I=6O6C`/BorO:4ff:$^Eio99U_(I`4:I[`:hAPYi&Nhf/\E(XH2=lZIc\)98"Ofi9
d3=aPFocmT,PNSZL]A_4r(&GnN$F+q98:LrTUinBa`IAu+F1W@a)S]A'c9'I"*>7LJ0l@[^c/5
!<V3$P)24o,g._ca29hI`0kBa$1u?b3WD[EjHkmTR(9Zbd(BL+r/**q-qY&XR'j1VaXeq0F^
lL!fY,64lAE&0oSs39?VnT%DITVgJHOEDajEG?u@'+<!HCca3W&Y)\]AbXHU2g25^rUqOe2g,
0!j`Yr2;OK/W@AaZMQ-N.U$%adISEEd#RKa`J%5He+js%(-$Em8uGY:i*o.Q%.j6rV)1Un(t
`OP>tf>:4j=`5DO4+$CqSuoZ4N%/H1t>s05_2Dg"#t_2r&>BN`^Djge![>]A!<!(foR4n5;`a
cHgf"oJVpb^7K[l0;s76_e4a2lch?q]AtsUSrP'%t;!icf7q5@=Q1bNqj+e&CM)=\EicEBoZ@
D2k)WlCl=lRG-LM0h>i1FMo3hV/?L0,7@0@gWFp:iAe%C85JR9EHb5n1jj()p5t0=[hM*Bg\
G7VjcW?l6i;oS<8XOJ6MU\HuDQ!+(5fUsPJ\^R]A)cj!gOQfibdhla#na+/\leMI6k-E%i`gT
EN?e;(W5-DU'VE(B0#<nJ<t?hnLucs"+"JbA39t+FWn^LE<t!<-fE]ASI^ap)6X!#=jg3#dcJ
&XI_H-!@Fh*E<aGO5H0NbSf3@D9f@bYi"ZQ%P\9Z;[;N`85K"4\EA/QeKfQJ>GX>7jks)nJ6
HS^TRCs3,l"$KQ7rtK_!&,uH8nDA-^+5^UJ1,.pYKO_`hC+I3GW::)\rRI./L.UaI_XB_jSG
;r'cb9.@e^.52pKZn,o._m=2+TrJi"N&[;`EbtoB?IaIF[oWYp0H5lJG;W:/Qf5^#Dfmi/V>
2gBU&CRdEa"f5[:3>5g%)g9<(!qu'41>lti1APhn\A;(m:aqO%.Co[)J1Op%+Q]A>GK3uI[Mf
3<FM41J9:g2C)nHCL#n#5>A22"$]AL`++O1I@RmD?))/W2'O8,a=u6%CatV"rH0[]AY7*L'PP:
oqV:DU>B>K'lG>K&W>7]A8[dkCW#Z5LQ]AhcT()n)*Ts"QTMiO<eVPoS$uWX^?l8K;&=.rp*KX
Yh.VNDZbafoul8@@':XhXNZ//U`:A>hTr3R&ml.dQTQH/@j'mVPgj9^rl9<`gGr'19#``uch
$4L6%#sO_LN++m&P+NjKr>ir1i.HQ2MiuBR[WOf"B+ekNdiibj-QC+fIpr2FqA]AND\Nsh`_U
K4dKpr!^(f#<8Plf"_=G18ltoX*Vt^<`U_oHU&X*TCh,9Um%QHB)Z!go`%f@0hsTQM_/aWs6
[PAUcJMB"G8f&!T/c\RJU2NgG\-_5i^SP+JloEg2*]A'AK(@RH8&TFC1sifsU?r%j"\L_L%('
KT_&D7@k^PJJ^V9tLs%bL;NFJkhXp,8a8FmeZGr:"e#"<]A_mZsDs]Ai"&*S($8/bBj-^mdBq8
!Xf**$3COk[i<i=^Yj^eG.J0XH\4W/eCF_<YBkUT&e(dt<PJKKHi=7WK:!ArE^gM4oo=a_Y%
GZ3Gihl@3o1tiaITfdi8`]AMiL?`-rW[Bk!sJ.iEWJ2T:m#N12/$.G'kstr'L$;'-hKKK-WIT
p!,Jedrl9ioEuC*9X.]Au>8,MbHHt0!8_6DD<Xn-C]A*=QY4R_fMLJDTr/IRrB7VV:4i^%3'7s
3#\-,Hcc+&COdcGjrK!ci9'.T@d[hJjFf,4mc+_$p0fH?4>-\&ikmEG8f6>bpK/s%(kGq59I
%+4+'7So(jW9s";@[rIL^[p)/2Nk^TT$T:-,aSm;25`FECGN<W;R06T["`*7u1q\O"ZNOV/f
0:+^ao7-S7"qV5+4EYB0Ot@1X!U%-pqgX@8Gr:qt#I/`>$")>.+u^Y(e1[iq1/P-cn03]AOLZ
6j\Gh[?)R34$V#&ssXNO+<?^;jf3lm,p/mOSL540#ThY/B<mLeJifnb,K@YBq+[K9b_Dg[Q_
um0Qikd_9_dEATVO@KRqYI'8$/rGNbpRu:%(W>:ZE7/DuG"8ak><7%EE[:;EU*[7e02fdq\^
#8,4qqiH?3cb0<_Cs_+SFuJRdDR[:i0`I"5L!C\Lk,fCs'r+paXlXnpFpPGnGStl>E:RI82d
%<L9I4W86dro9YYu?_`pq=NAWlT0-P"nNar&Y6@N1opqbFon?EmN#smirp:muKZju]AQlYKl7
LHPR^1&!Z8:,Ou.5c?'R=`a$XYa4=@$q(ckQ0[&P^#dQBApZ@Gq-QX_^<q@r*G3q6_f"#(F@
n@-)j8.k7*[rN0#a`VDfI1XYOTo"B^#Y>iF`P?M#,`)G3bUFTJ7;lAVad]AV%95qGdH#!6=df
cqCN0dE>[;p<JRss4P?3T5fKSZ-Qi9X*e=VH`c%!m))-Km>Fa3pV:Juf>XLlDHsghMXKAf,\
*+%rdYuM'9;n+?,ROHM\/\&%IJ>jm=-qXtr=:YB4@M.k4\Ys!*f0&VVt+/X1M<E,hbd/+@%H
34@)2IS@-Z<6+p2#iF"#Hf^&qoZDY?]A'lRFf^`ptf/\+CM4d.KF:OBbe6?Yd\p-EIW#FDbNS
f'%QQa<bmPnB\Pf?=0%H(&[h+#6~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="310" height="298"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="report1"/>
<Widget widgetName="report2"/>
<Widget widgetName="label7"/>
<Widget widgetName="dim"/>
<Widget widgetName="label6"/>
<Widget widgetName="report3"/>
<Widget widgetName="report4"/>
<Widget widgetName="chart0"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="973" height="587"/>
<ResolutionScalingAttr percent="1.0"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="JAA"/>
<PreviewType PreviewType="0"/>
<TemplateID TemplateID="eaf0c8cf-f05b-4d34-8492-5481bd532ed0"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="be6d89ea-f116-45de-bf36-c6aaf2105299"/>
</TemplateIdAttMark>
</Form>
