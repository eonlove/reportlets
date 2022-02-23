<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="th" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select 自定义分类2,自定义分类3,单位,显示分类,单位类型
from 新单位信息
where 营业状态 = '营业'
and 部门 != '电渠部'
order by 自定义分类2,自定义分类3,单位]]></Query>
</TableData>
<TableData name="complete" class="com.fr.data.impl.DBTableData">
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
<![CDATA[call unit_achivement('${start}','${end}','合并')]]></Query>
</TableData>
<TableData name="goal" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
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
<![CDATA[call 单位任务('${start}','合并')]]></Query>
</TableData>
<TableData name="tab2th" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
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
<![CDATA[SELECT name_in_company,department_trans,t1.自定义分类3,position_trans,entry_date,t1.单位类型
FROM selectroster_tmp t
left join 新单位信息 t1 on t.department_trans= t1.单位
WHERE `month` = DATE_FORMAT('${start}','%Y-%m')
AND (department LIKE '01%' OR department LIKE '02%')
AND LENGTH(department)>3
AND position_trans NOT IN('分局长助理','录入专员','投诉专员','装维主管','专职库管','区域经理','区域主管')]]></Query>
</TableData>
<TableData name="personal" class="com.fr.data.impl.DBTableData">
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
<![CDATA[call unit_achivement('${start}','${end}','到员')]]></Query>
</TableData>
<TableData name="personal_task" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="start"/>
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
<![CDATA[select *
from 人员任务
where 月份 = date_format('${start}','%Y-%m')]]></Query>
</TableData>
<TableData name="xiaomi" class="com.fr.data.impl.DBTableData">
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
<![CDATA[
SELECT 单位,SUM(毛利)/DAY(LAST_DAY('${start}'))*DATEDIFF('${end}','${start}') AS 毛利,SUM(终端)/DAY(LAST_DAY('${start}'))*DATEDIFF('${end}','${start}') AS 终端
FROM 春促报表_小米数据录入
WHERE 月份 BETWEEN DATE_FORMAT('${start}','%Y-%m') AND DATE_FORMAT('${end}','%Y-%m')
GROUP BY 单位
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
<NorthAttr size="46"/>
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
<BoundsAttr x="278" y="4" width="80" height="42"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.parameter.FormSubmitButton">
<WidgetName name="Search"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[查询]]></Text>
<Hotkeys>
<![CDATA[enter]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="189" y="4" width="80" height="42"/>
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
<BoundsAttr x="80" y="25" width="101" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelend"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[统计结束]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="25" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.DateEditor">
<WidgetName name="start"/>
<LabelName name="start:"/>
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
<BoundsAttr x="80" y="4" width="101" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelstart"/>
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
<BoundsAttr x="0" y="4" width="80" height="21"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="start"/>
<Widget widgetName="Search"/>
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
<NameTag name="start" tag="start:"/>
<NameTag name="end" tag="end:"/>
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
<WidgetName name="103fc387-750e-4bc3-bbf3-03effa07ab3d"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[到店]]></Text>
<initial>
<Background name="ColorBackground" color="-657931"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
<isCustomType isCustomType="true"/>
<SwitchTagAttr layoutName="cardlayout0"/>
</Widget>
<Widget class="com.fr.form.ui.CardSwitchButton">
<WidgetName name="4bfafcaf-746d-41dd-a1c8-b58b5c4ef056"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[到员]]></Text>
<initial>
<Background name="ColorBackground" color="-657931"/>
</initial>
<click>
<Background name="ColorBackground" color="-2823681"/>
</click>
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
<HR F="0" T="1"/>
<FR/>
<HC F="0" T="4"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2971800,5676900,5638800,2743200,2743200,0,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,0,0,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,0,0,2743200,0,0,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[负责人]]></O>
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
<![CDATA[单位类型]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="2" s="0">
<O>
<![CDATA[单位等级]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" cs="5" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" cs="3" s="0">
<O>
<![CDATA[店长毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="0" cs="4" s="0">
<O>
<![CDATA[台量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" cs="5" s="0">
<O>
<![CDATA[荣耀手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="0" cs="6" s="1">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="0" cs="3" s="0">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="0" cs="3" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="0" cs="5" s="0">
<O>
<![CDATA[D+手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="0" cs="5" s="0">
<O>
<![CDATA[D+配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="0" cs="3" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="0" cs="3" s="0">
<O>
<![CDATA[回收毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="0" cs="5" s="0">
<O>
<![CDATA[PC平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="0" cs="3" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="0" cs="5" s="1">
<O>
<![CDATA[hi&nova9]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="0" cs="5" s="1">
<O>
<![CDATA[OV米中兴远航天翼一号]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="70" r="0" cs="3" s="0">
<O>
<![CDATA[新增天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="0" cs="3" s="0">
<O>
<![CDATA[新增宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="76" r="0" cs="3" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="0" cs="3" s="0">
<O>
<![CDATA[5G绑码]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="0" cs="3" s="0">
<O>
<![CDATA[幸福全家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="0" cs="5" s="0">
<O>
<![CDATA[超旗舰]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="90" r="0" cs="3" s="0">
<O>
<![CDATA[千兆宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="93" r="0" cs="5" s="1">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="99" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="100" r="0" cs="3" s="1">
<O>
<![CDATA[小赢家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="104" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="105" r="0" cs="3" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="108" r="0" cs="3" s="0">
<O>
<![CDATA[新增云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="111" r="0" cs="5" s="1">
<O>
<![CDATA[穿戴音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="116" r="0" cs="3" s="0">
<O>
<![CDATA[门锁]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="119" r="0" cs="3" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="2">
<O>
<![CDATA[小米]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="0">
<O>
<![CDATA[苹果单贡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="1" s="0">
<O>
<![CDATA[任务]]></O>
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
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="55" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="58" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="61" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="64" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="67" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="70" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="71" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="75" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="76" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="78" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="81" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="87" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="88" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="89" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="90" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="91" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="92" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="93" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="94" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="95" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="96" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="97" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="99" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="100" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="101" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="102" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="104" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="105" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="106" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="107" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="108" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="109" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="110" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="111" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="112" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="113" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="114" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="115" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="116" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="117" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="118" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="119" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="120" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="121" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="th" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="th" columnName="自定义分类3"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="th" columnName="显示分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="xiaomi" columnName="毛利"/>
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
<C c="6" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="全利润"/>
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
<C c="7" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3 + F3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="总毛任务"/>
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
<C c="9" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H3 / I3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K3 / L3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="台量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="智能机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=N3 / O3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(and(P3 >= 1, N3 >= 40, E3 = 'A'), 500, if(and(P3 >= 1, N3 >= 40, E3 = 'B'), 300, if(and(P3 >= 1, N3 >= 40, E3 = 'C'), 200, 0))) * 0.9]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="荣耀"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="18" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="荣耀手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=R3 / S3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(S3 = 0, len(S3) = 0, T3 >= 1), R3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(S3 = 0, len(S3) = 0, D3 = "渠道"), 0, if(T3 < 1, (S3 - R3) * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="23" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="24" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=W3 / X3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="苹果单贡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="26" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(X3 = 0, len(X3) = 0, Y3 >= 1), W3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(X3 = 0, len(X3) = 0, D3 = "渠道"), 0, if(Y3 < 1, (X3 - W3) * 30 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="29" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="30" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AC3 / AD3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="32" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="33" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF3 / AG3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="35" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="36" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AI3 / AJ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AJ3 = 0, len(AJ3) = 0, AK3 >= 1), AI3 * 10 * 0.9, 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AJ3 = 0, len(AJ3) = 0), 0, if(AK3 < 1, (AJ3 - AI3) * 60 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="40" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="41" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AN3 / AO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AO3 = 0, len(AO3) = 0, AP3 >= 1), AN3 * 10 * 0.9, 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AO3 = 0, len(AO3) = 0), 0, if(AP3 < 1, (AO3 - AN3) * 45 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="45" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="46" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AS3 / AT3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="48" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="49" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AV3 / AW3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="51" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="52" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AY3 + AZ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="PC平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="54" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA3 / BB3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="55" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(BB3 = 0, len(BB3) = 0, BC3 >= 1), (BA3 - BB3) * 50 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(BB3 = 0, len(BB3) = 0, D3 = "渠道"), 0, if(BC3 < 1, (BB3 - BA3) * 30 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="58" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="59" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BF3 / BG3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="61" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="62" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BI3 / BJ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(BJ3 = 0, len(BJ3) = 0, BK3 >= 1), BI3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="64" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(BJ3 = 0, len(BJ3) = 0, D3 = "渠道"), 0, if(BK3 < 1, (BJ3 - BI3) * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="ov米中远天1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="66" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="OV米中兴远航天翼一号"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="67" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BN3 / BO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(BO3 = 0, len(BO3) = 0, BP3 >= 1), BN3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(BO3 = 0, len(BO3) = 0, D3 = "渠道"), 0, if(BP3 < 1, (BO3 - BN3) * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="70" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="71" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="72" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BS3 / BT3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="74" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="75" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BV3 / BW3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="76" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="77" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="78" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BY3 / BZ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="80" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="5G绑码"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="81" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT3 / CC3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="83" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="幸福全家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="84" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CE3 / CF3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="86" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="87" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CH3 / CI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="88" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(CI3 = 0, len(CI3) = 0, CJ3 >= 1), CH3 * 100 * 0.9, 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="89" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(CI3 = 0, len(CI3) = 0), 0, if(CJ3 < 1, (CI3 - CH3) * 50 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="90" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="91" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="92" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CM3 / CN3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="93" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="94" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="95" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CP3 / CQ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="96" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(b3="体验店",if(or(cq3=0,len(cq3)=0,cr3>=1),cp3*50*0.9,0),0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="97" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(b3="体验店",if(r3<1,(cq3-cp3)*50*0.9,0),0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="小赢家增利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="99" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="100" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CU3 + CV3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="101" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="小赢家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="102" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CW3 / CX3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="104" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="105" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CZ3 + DA3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="106" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="107" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DB3 / DC3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="108" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="109" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="110" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DE3 / DF3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="111" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="穿戴"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="112" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="complete" columnName="音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="113" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DH3 + DI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="114" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="穿戴音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="115" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DJ3 / DK3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="116" r="2" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="117" r="2" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="118" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="门锁"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="119" r="2" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="120" r="2" s="6">
<PrivilegeControl/>
<Expand/>
</C>
<C c="121" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="手机数量"/>
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
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
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
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
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
<![CDATA[m<a1^;chQL6*.'9P"qS!>(Pls8ir&BM`1bO=urK#0BnEo)(Q>(>#>kC",)c+"LXN"<hn*#+=
('ie/PB]AE_W:&7c\TAW8X$F6qAGe"6=Jn:<kl7K=u`_2X*$+ht28EooGIfSF!r_>46pl]A@Pi
lou;mQ`uf[%0`V1pJ,QcVrXJp<ZN4IX`CIt2T.F6B<rkRtiq6AZqF>.k8L)u:Zp2=8J+94Pc
b=dopVcR5^K4\R?Rfp<LjqO/;g_I-]A;K#G"MEAkf0"J1qccqLT@nNGHalJ0qNu9^^,>fZpKq
79DisPGH\9U.81.qCHZT.c<Ps1VnLnXT9qa=]AS$cc97#]AKKNH5JmaTNs/KB!L18SgTXO+%;8
5r[R'/Qfl`E0oO^M!f$I#Q#'MVE;p`>Yf=]Ao!cgk?gO-80T\>ni0/DBNLNJn;[(:!M7M"jd+
00gaZg-Cl$h;Ip\IW8bDP,h^:,s*e@%jh[BO(/mJZ/P:F5WN651X$iZgV%NRNID:KN<4?C-m
<RQj;(;.q$&p>DqJ:fdbS")KYB#$sEg]AWbhp?LX9[$oi`eNo2)(!l5+;Xkud\UARHE81KnIE
H60ar"8e<6OQ>i*1jd2p>5>lh7;hbOU8RH@eBR'U;QU9["A)U"&,R[c43gqOW^6&G$NLO^4e
97`.fcY(2pjQWL10BEe1d@=jbQu&ttqGD]A-o5hdXHr_`RLaLa:%`\Dqp;,N61i*1SOLlbl[R
N*;GpD+bHN%'Cu-!U)=`iLu()pVR=u13ReAJbCF6jg3*FoV)B>0i82%ei"Mg>RW0oWtu/)YH
^>/^_LX+Fbu9m4gSsA.A&AXr:u/&]ApWs>Hkf/GRH5nt7'BkqZ@j\1d[GRPY9\qY_Oad#WNbh
$U_*,L>"Mkm'S%$+.5:;_a)`$6)9Rl-1Lc^M9P<k#Ji2\UG3pmCE_-WuX#$\f@#HjK[Jl`0?
/Vf<"h0`iFFiNGO<`->g=k^UEL":s5fD^!-8+2a(3)MSlr/=^G5b+f'6(0R7\-JhqZ@bQXNp
7&Ne!-qM<Up/VdK0qK'6eT%\lE9D3FID"Y]A#LQ>N4CN2^7YLIg_q,@N>d,n4HOU[M79S<$!%
<M.UaOcg64Z;)J3/ad:G7bN5^%`V8WRp:LYIda?-5G:KR^lrCgIcakIMcRR3;/)L2\.W(J_'
Ij6%6;kX1LI\NNm7cu2f<q3_BYotGGG:SgnQu`43LC5q\2B&J:A-I.m[=L*ZrqcW.L9p0B_7
#hdU_!\"?u:Be9c!$3Xo+B*A:Yh%`Mp;^21G_gMt!?<t,@mugt'Nna+plM@^4>=dX]ARf(p0a
T!$er0,e\M#sO&\nA1P5?3mapk6QmbEQ3md7[aW$$ICj.%s'F:9n]A`ReN8k;'IAja@33$bI6
&%Gp9iVh0GVVacbs#XM)7)k-BQ"ZcsT@9;P[2=i#?%oY]A9+[7P^".n?M0&`IM=V,SH$lD.[=
A`S;^FnHLE(;nE`IHjltqLCn8;oq'W+'B#ZIhQ;S=SoXI<fdY(kn<uEFEHjnh.nidDK;0$[h
r<UXb=\FE>T;095+U<%!c6oCqYE[b:4`q+q/$<3!Qbp]Ar5M':1Z!AW-,tVk<;0rGeNI-'ORP
5e?MXF\3#;tbOkd#,o%leQ(J'Jk=oubb,Z)qgM]AYa+sF*-\_P2Alg#p+U/e)BJf25?e%ugD+
6T]As;)MiXSMMd\$M7_E"g[OdH#C;k'-\9u/m_\,mIdamj@!eiCqoOK;4U#;U[alY]AhcsS4>Z
F3o]A=qOMBB(>R]A2Omp%F9@)fM<Z\nWjR?Ie8I_OYhETU*l7p4n#e20/ZA7p+>.gGIA/.uQ(g
0cNgEE8QrC`m]AKImu>as1bF1T?=Wr-N]AkDYc!Xp7Gf>uZhi0?-q%KJ=Q"?@I*Z^ROIZtpX)B
>B^W&2#C"RGum[#e5/(&=V@gT3N%hrB$f08"XT6_d%=rAqY.M?8P#md?:?Sj-1$J*6\8]A<-?
P"_L!R?45f2AgQl.&iSoL#K(E.0aUhCdR+?H(O*=7&4'e6N!p1O-$V'fNi5ud/[D@'G:G#i\
VE/oTMe@c]A(<4\&2Es_*6`Y7<FL0<FCJ[76s:s[f9Rhf9=\'@NA`/QFf-pajMGfu/Bdg,ef;
-PZE;]ANpE^4i0GBpfmoNC+N\K@U0V"]At=ITo23Yf>lRQ4<sl8*iBBa>.dH/F!$-n0q?/Z.sT
L\jM,Q]A#-Q^&0*qjoS7d=fEqhnWd#$'Fi(?f$ad_Cd2fld*dFB2BrXO64N6^M2GW0Xeb\5Ks
(1+.=3l]AC8RM3&Xltg8XJ2Qs$IQl$>MK@"+dkgnSMGO<Om+2`*QPAePsu)Cjq,r/lj>U>YD1
2>h#m@pm`0"M`oG,8FJ#Qio_@:^A=C./6lkl]A75G.,g0J!%;g#Ps*-Kddi$d)l)-kW!4Htq`
#[ah;DtCD4t`-W6YV%rYGis]A,Yg^JpT#U=;U&>)(o9/a86,Y[pl^BZ]Aj`BO>Bq<80(-Vc=51
njf$i1[Tm`7Nik^]AX+O*&jbtqdng/HOA[6i_hK^1bI+BG3ub/BZiIZS`PiDuc_fYI"^cHnBW
"(t\!fMf5eekYt`F\KokXBAV8A9Kt5BpoYp);NLlS8srsmjCDeP-78<&<>DL#c!h2p_?j,>?
W3O!aL?G0(rcLAGR+?CQD)eX&u%N3eTJ9):jgO`g%p`:1;\hrN3_PWk,j(bT@^dn!!I9%FqY
BPd8;>PT[bB@"-7B0sT5CQ]A8t>,]A^`*1QOuJPk,at1rpaS4,Rmg6"e&42E>WXpVCnGj>ujo"
/q?5^1+uLNGfIc,k8IZ&UrECFT`FY=>%<Q#&Ws<9e\e]A#4fh\M,0R+56,LB,]A!FYhNPV/hYM
WQ<`:X,[<[Cl52NEm,gaEm'lH0mZ/8h;V>aI#?HTk))_8g5Z.8;VJZ/%aBV/EA;p7`K4.*4I
OEk5K@oN6^6/Q."?;f1lMKN9P9\FX8[ofXOXpa'SUj+t]A5PY\qplY0$d17c!/M7ifGM30[pr
SVtSgi6&3]AP!qpmp_"MY2:D#32esKpEn=h_hC$-ScSV>'m.u@6%._?8bpA8+,*mLCqKSF`ZQ
-oL2to=adEWXs_!*.jHC(l+-M(!`j"5q\O(bT&'.A^;G#TUo)=\q1\`>h"tN/AqEOHrsj-_O
'E,#CcF,+H#bR'#A\V]ANtMGS8!D;X6esCneXEP<@"(3W&'<ZYS?0e`Ui-U0b,F!i!L)itNuh
UJO`>GATo/'c)uS6309f74kI%i9"4&Uq%W(/E)H+C#ltUR61Jggpi,\`_\Qeueo_q7b(;@Sl
`+H)@3`ZVR=6F/fMi*X=*pjZ[.*%[H^GnGfTVY4r1;@)cWdq$C&!uhTnUqM,@ANoG/SD%o_H
u`9L*abPL":7!Vcp1>1FZ"01d*Ea!cpb]AqHFUI90Y[S4Q+,\8C@59,r1pt:S'G"hW8ii!&iW
tI_@@fYTZHZ]A7)X.@0Vbd96Klng7A6HH(^]Ata+fsRD5OR.<0Yq)/![UJ*Ci`K&!ZS/1'J-8-
2$%j#^<)o<ubGh^6EqC<-o%!,`E@BXZKoR%=`B#P+KSNi4U.ldce02_iGe%,*u0__=M^@m5a
AdnU&#F3u:2uB(d+FVc;s"O/EF_3kpoJjqiJ6hH[m7F,lW$pERIK%O5+*s%k]AQ`ZR;g/A5t:
WN?%4M_RW,1kCX9JIP#Ih??ph.D#u7m=1m!QCG!jLTIpP<qt)DFbe/A=(q$e'hG"Ed_RrqQB
ZQpCpo)l+=LSeju>5F+J5>A(Z<>4TF=1hpT$GOa5Zf1\JIIuP;:.iii$7>EeQN*h0mCXck8b
1E+bQB^[!H&lD*G1rL59g(ZWRGL<sLlTOoS/f%3]A9dRa^I8IC3?&Th-q)mJk1g$I/r1nf1s6
tJs\e$--%^2HE4hB"JBUV@h40pb+l26\EL/uec<H;1fQ)&.O=SE$^DQ3)5)1[oK6G"YjHR0V
@.o;;i6AW>>=:nilSCW,%5H^3E)FLsj_Gd[ODfI&7N_Ibrcor8`a_:h_TZZE>e:9VQ1rD.6K
7tsV]A%*_g)R5fP'?=f6JJG8ltr+Z9t_]A%r\l5``^FC!If6E1h`''6\-G3b!2n`h:39W6(R(3
O%[\d8QY3Ah\*>Ng70!l%e0N^N?l]ATFY*.CtfVq%L[?5XC,Hkg339[sY*mJ+UVNB<6.>A[0R
,+u5p[k6NHp.#aMl).%3kG`7PDAM2+%_enKr,58YCP.A6uf4[L(.1r6')Dk6Ek0BjuA$<-l\
dVGZ?Ni+KI1N9!&W+GjW'%1'19p^aCd9`9RdpeY4$O*UrGl5_UaBnBSZEm+L/D5Ec]ACsZJFg
X'K.asdNW<3LJJ3:0(\#c:?\nFaE7EfYg%81SW>'g9F;q]ACcu<'CK(%tbP44EXj>1r"c/YJ3
<l"R+Y<$-H3L=TMB>/P6'19dI=a=M]A=p<c21AH5#j4795N1<j]A.<G>$CUj'cV7tGHegXJDIM
lVNdSGRoUN;[gEsLL<nQQ6q6p`?O0WK#HGMWHGZBa\\C\OBGWWLu$D^n]A5*O4^"(e\/9QZmi
`='b$d:DW#^O3tXTAO;KJ9Aa"AVE7WM=0mX03NMfV^MLGsHsb>4<=t1.*R%kWObYe6OWL/#r
$c$1Ja9=@'0^-JQ*$Ui3:Pd$d_0.`<;S\%U\k,N7m\6]A:WW)3F.JiFVn6bMBgP6>Q<N71Y?M
)0=c&<`%*nPBB,.]Ag*4rE;knI.t[bcJjig:D\f:Y%Rq"1+JGgn9?lPd?N>0ST2AcXb6n,6hG
_&b>cOO"2E#_Eq8+^4Oah*O44rsU-'X_(oM\k?Si><PR0*O<qqoht'tAN*IH..@!h`G`q2-$
PP@U[&f/8CYN9\<g8'-$3s\S3LFMP;!J7k9aql2tT=J'Gs0hA3Ml&$V>g#s,BqC7h+%#Ct$c
!!3(?hHZ)LknMaP4VJcUDU!3L$H[dD?I>s^ne\02BG5/"^@dm:YJk=)YTDhlA8sVQK=l[,S"
a@HsphMFc3R*rcUk0gO$I<s3-+q"0M,cUUSW9]A0/*-$`Ul7^[(%P8_`C;VFeg'obq\HO:KR9
u5W7uCUju=sE^Q\h;Y=KugN,9qaqB6q"9uuRLa1-*<lE7a!O6fuCeOt[Vg)dKo+At3FNjZjF
:XH8WARFpEUe_.Ejm+]A`)K8SlPd]A]A9PXHNE#u1H4m&NOeXo</tqNVImfW>)YhWu([LC;9UOH
EW4=hq]AYQf(Zm1sCktr0^ggj*+G+2t*i)aHgV[i=8'NR,&[%>2c>OKTK(ZCgKsfhe<I8^L=m
=_2Mrj8i8F8=O`q3KD?Qp8am1OT*r"f\u'si6Mc#MN0FcZPOE56Abc/YKbP8t_otS@;,Ap<g
?GL'G2-.T?QiZL]AteHl:YGnBpu-IuF:ZdB8OPECkgSV13gs5XD;&PX<djfCK#SmW4Q'F\\$.
/E5FY^uIMs2orAc/!#9Wp1n/g;)ned4\jGF(gl8HSh4g31q;/8Co_d<O<=XT!lH5[t(J@2!O
2B$mH=h9Dd+3Hf')K1POA%/n4&a,r9WPJ?.^%6>Q6\ADDeOtf(cM-3^:>HUF>l]A25qKq$Ia:
bjRWVDZ->l`0fKP&&DqnT"k1+&Q@F6UVqVRh*9CN6kB-#Agel']A-VV>j*;-?Z!BPYuPE[H\"
cWs$Y^JRW1]A[Umjq@Uep@W,<3N1Hu_RCq9"E'?^,T.P$WO(Ur_0&j3LipRJ4>/P1Pf1WXtp9
\`POAf\Wa"flrSUV.=f+Rbn;/%MId*P"1'go3Q-i`ghqO9fIF9EE)NZ`Ls]AFR[)=;s/6ugT!
KGA!-Y#f328B0]A;5L(S85=Il_E)%GTE@EQUn[CWVL2d]AbC"0\&Q0]AnnRl:g]A#@E`0aYk-IDo
OO,X,&p2pj<n?F72>hU[X`[]AKGVe/FS26JsH>F^"W-<-c;[i$LQo?;]A>Csk^32NCU:@,,:+g
=_OU$V@pA)\G<M"`#nmChQfelDrOF6<>``o6^%)@Tg<iq(f(od*`Jr]A6PI-(U9(+:it)'E,.
0H[)uL8,GP.*9]A2HOY+@-%A1dIkuP5;m?q]AM>STX_9R3^=)Q6[A33Luaf9SYh+JVaS<$K?7!
tj9h@*_`[;s*.#9>=BgD(eOSeCSDB0p7b5pd\JaWWLjr[Cg%Bn=rFsDR:k7AX<+BP^GW\T8f
8D"W:6M=`7_\h9,.cn<$!;DtjM49Bfgr.F$E.oi4S]A+<;gif4[8_0j:lk%o(6[^@dnt[3J7P
+^[/_6]AR++qqi-Z?h2s<Zo.+*A`p8UX&,pSJ[tXg=u0gX+nPYbU`\KEorSu+f^A'EZ]A:UqW;
1)dMR*Q'9s4(+HHgbE!OgBQdbb\\C;f:fmI)!RC]A1OBcJC\)=tu=7k\T-WY[o1NrH(O9HH6^
PZuMG\>!S:-T$krNEq=[:9;jgF'ZBf]A8@)?GeN\?+B8IG-5UmAfgV^/#Da1OI'1Y,B>4[tL&
T+>>'%s%no$p,7\*989LIl'eSTdJT1FIt"E3GSo$L.7]Ah*9*0gL&;UEJ*p,rAZi!i%;W%U^J
kA&jbYN@u64"B.Orr;%Vem2kDeX*@=0kW%N74=054_oIlpopb(lI"k$o#>_s[(X`N%lEs'TD
NFiheggZ"bB_nDU&eNhV,S=a!=GP7CCC9mV'W&V#,U":b8UI\>4DC2d'&kp*q@tR:&nX(#bE
p$67?"UP7YfZdPUUJ.Q51J&?5Dh.nY_7T*Gs,t+\BQ!U,=:B<VdnbOTa71#fH>VIU>KK.c#o
dc"+gB:b$]A?_KU#f.8>k9#XqX"?3KD>hjAYF#HSs66AF!3`\X`S)8'nj[qZQ@-6Q,b9hak-R
,"AlU8Wlg3LH9((L[S45>=^$W"Ig2^b\\[1p,Y*M,1m$6uOZ2N<lXb*e(NA)'SPmA&^U4$FC
U59"G@mi(m8q&W:e-Mlm&g%d8O86Ahk7N[+213G@*C'kANB!rLqsA`-N*J$YTLa-"`(a+bbi
=?GY+/X+Y;Q[9(52&W5\U*u-TJV6In&Y^;X'-$<HP(^pn34*2B9qtQCq2,0Y9BCpa$kmf;$2
82W5*.5YB>q17/DrYe;Pnii''(g<7sQqY[a)_pW;\aDLLb#DC_j*Ug".28\;7pSTtk5^]A+R@
j$<Co;ZjeiP2X+U$s7@`'r,j<BE0$)rJ+Go4JQoAX?)T7X)WBH>1eJLo'+*:hSHI6$g7rfK>
i%Hj!d:%cM*s.7gI4uUEXjR^cEak6h-:"]A8rDXu)Vh=Mh)L^b#[ENii<g)BKjC3:=aJb;K#%
%f?n<f]ANWk9:,6DO6ld%[UCnU*2;brGe9DG(2D1*LAC[t?iMCQD^c+D)LT[t:@fS7HE6SVY$
6tfe6%S28).pEO@(1[i$3+YMTil^q]AO-3.q/?P0%Y\+"@#HnOJG?;--MqCACO$Ur85&&W_Z8
L,4\6Q=<`m_!jiVd9d$5<6&U%;AtL)aX9+g%&s1&tBV&pK]A(\jP@MP%kaL_!=C'WB&IE5?t;
*0r,RSr3A*[':61#3-:ga<rhP$%1;q;L/BD,dkFXi_t]AR_nO-]AnYMh<ZRU<uB7cnc8(UV^*o
+<3LUXm9PqB7oT2KW/b#X`<<hY'_$XNp7_7=,a1%G19*FBLOC5Fq;(=>#<L_B-%P_tW)5^q.
^`2X=#fb:/[CLhm)Xf/"cH1a#2UZ]A)tpN@,\0I;'<gJ?*E^E4\P9\-[m)ZFh)EpqOZN3PB2J
(6`ZV<3VF+@W@0[Bl8de0?`;G(r<fs$)cZ!B^Sih'[g$^OR@AI&*7d>&DJ<U_bDTYAUBBU6(
^)h9j?p1Qc?=+\LQYV1VnmEQF9G2=^N-aOD[U8QVM3*(OQ7,6tF?_2/4T([AbqaS@aV8mZs)
%AMu3TjO]Ack!i3GSa!mVjniLNIq]AeF@D]AK8>bR4e5n[*&V(l0l$^K,?"=[fH6"#%jAX04gR3
/I4a6q=I%H'?d';gfjt;_::6?$t5]A@9nl)bTCUX=mE+UCPQd;MY&8EG4hPheQ[t"pjPDX8.O
,4kHG2_Aaik#_h@&$jd$tJ(kGWf5(O;?Vj)\4L+cbHnbVi-9MH=Jj_]A:r!R>H>cK*d/emfrZ
D]A9FTZklO&m@fPsZB[PA*HI[BbbQ+(,B$Z$k]AtJ']AbV'[l`[2Q?3q@tR!.q#UQEg`N`42Uh?
??l2cp*a6tlG$i7iaa]AXTE#<,k'e771@`iJQT?&]Ag0+DO4dW%#$FS,gPWM8@bWZ9PA^NaV&P
MM)?Wt'o]A%e7s\K^0*q:1V/AhFKOr'2',l/RG!f`*P7.O[HXfCt=M@E/IVu<LP3Bf,[T(GZ?
5/RqJp'j1aDerFbS[IF#%"sE4Zj9P6%gIG2Eabehlgfj*45Os2!]ANJ]ALQF"LOgXc`%!TMMtn
#Z[Lg2a?=JUA[Xb3.\`ul5AEfe4l96X(#Fa9a-lG?MfA7F9/`ZHO\pY$!%SL+uc.L;;e..S/
?&B]A7Rj?nn2TOO-;p\[0\LsU^!M'qQDmKbGS_Idq(-/dAY/51B5.+!8`WK#f(1C!?;h@XDEt
gYWeWHeIT;_4eU[P248qgMf\cO\*B4Sgjs.Vt>l*.BDE:7cA@N^TDlRdmh_cc,gm@]A&P6cW5
5o2-CCp,iKZmA-#Mm(fiT[5orD0r(`,ed^/oaDr?/pB1f.K?..Ip]AA2&md!4fSH<PLT<,\V-
T('IP#@^(i>Ci**a;'3(%PH#a!$W]Apml;f?&]Ao"l]APJ`abinQr58o\-\J,0nfeIR0m3hP,XE
#[[IFl>D$c-&MJ@p-XhNklK"oc^+u/UkHCN">Vc0c1N`-sn[G^8arM@,Yq9KQtd9hcM>\j1$
;B.)8U<m6KC[4c]AK4'?bB^JiogXXh9Z2g_",*h0Pm!alh_?G^fc#2E15?pdkX'/XUP"EM1'8
n_Fk7>bVir/D;Y.BHWWAOc6f>/=Mnc*)E#.i3STT/%82S3n=1F-2?*I>g?Q=!;@m\ea8cik;
.i_\eAI@)Q/)VdGJc=fd%?`KZ=^E3d$oJMVt8K!<TWnaoSZpXA:*)5`&h8)cBMD*nVSo;\K,
W(fcVP(MJZFCD[2<[Kb.8<sHZRE[*#F?A_q5@%Wh1u\5Ri.(#.VU:cMP3#nXF`2D4Dqq\k*k
6(V^$^<Ln`Vs]AIc0`*DCCim_lc443q?0?W9f27alCDN5^No2%I,I[lTM-l=sMG,fq!Li7,cC
4+k)UDHahfQp[<('(f_+E4]AmnpWR=%Vrrm/b$`f9<d4P%0Z?KJ?ggG&Z65r<9`s`4F;@rDF8
bJ=LWfT1Y`LH0g"j*'I_9938gI>Dq%+U2dB$Q36LVsk"#_)-lr\Q_,ItW'Pa]AB)!Tc\bPHAo
!(V-[[e":b]A.$;rf%it>oOB:F`D>muBFM9qu8,si-&a;l!?H-S-QCe1B0fP<,O2&$/5@OQUJ
g;8-8ROmC37WBF*%OcO&aa7DAI80Z,;R/VI?eYAA2"nS^fT`84/CSrhC<6E[KJX\Q]A9fF/4\
h,$V]A^t*DQM!Tu-Fb`7B;+Ok/.n+O-38E.tMQdt<iG;WdNt2<G4KlbWf[\KQNdX=?uL0%r:*
\a'M6c'+^XdI`3J;`.]A`6>UO:Q#=^b[3N:Dp(*/&edD_-C"G\#0,U*0OS252"n6#Yo-'nn]A-
Ab"mW#XE@?uMXC`.]APfmQB"X'@>R<NfefKG1bFUhdQ?P_r<r6X3c=b+-[qWbVOo0Cm!LH`g9
.X"Z95G\Z8<D*jl.4N>;Z&I[[l]A$-ksq]AJJ?M/c,MN1b?Sf+NVm,2AKAGB[p<l&0YHI_4%i7
^d?BAY10Zi'S\@OOb!e)pJ@D,p$W8fp0?'j8iu4]AnHe@K8rM;T`Q.p:5s3?cE^I,T6VnVqmj
<R)qo^Z19Sa?V<_W<G\f`LY"YEd66p3#Xbp>1qpJ,YX3=+)[>)[<6*Me)D7jPFfX2o=Hu#9d
,:U\*aQEk[k!$>F?Atii[g&q;<i_3NBdc(i&jdM3FlKR3V,BIo)Tor;M2>h\p_q;`VLim[@t
__,,85u6=:H:VlOIZ4E]ARlg0/]A##=YC_0b$YbM[S.AgpBT81gM`P&:"M[?GY8;F'NC?jAJT<
q&b/8qA)d^1mQ,2q]A:N)df&m;iS]ADI[7KOeJE"3Us,K^@K!hZ<c_6_3+D_#[YF0R)WAom<Nn
1Jg%Zn+k:KFf4/"]A?5F[q#R'/L/k,8fu>7i*DI"n]AinX]A[R[.lp%p28,J7gf\*sN\8e0#'<Q
h2J)?2nq/I6h(Jj&tn&@&lN1S]Aa3]A^'\Jc!>UM@:/cbdmA3p$%WEouII3hGNT]Ahr<<W[6ERP
6.6>B)&QOO;kD.qrt(T!R2)JY$@OC1M(%b8^o&-3^geAYHEBi:B.b>"E3oOK.[ZI#m5_i)TD
uL*WCb^tETo0og=p'O_lo]A?,71OBaYc@C\l2X2=ODuaWT#52!SMgA'?;K=eTh5MPo(#"(,^5
r)Qlr9`]AHs^>R4G``b4s=r>9/A)QM@p@#UZp]A?]A85/"nY&r`79toWAL'GrWhII?$<0[F02YU
_Cp)+rN@slqj@gI;:3shLL?Jh47?Xj+jtJ8AmRcm1lp1Ym%-o%W\lWL^Y:YHK7WJNeQI\q$o
9&>9A&'EhJuCp@c6nGbb"=7dEV!R?"2Q\bBW\)):L3&=1&".ufYTIIl;84VlLR"R2;*as#E\
MNUY00<DF1p.F.S[goCOGd1C)s8&&-G8b[r(SMnBI8RsHs5WrPiHUH%nPO"eo&A`jN?E:\q)
SJhpcW/qVjAXjkd\)51\aNTW&mOeeZV!e-6t&Y9/QKo^i2C`1-3]A\L&V%R)HOU)4:Wr5q/Tm
lQ=LcQL%dp-EuH2h)FZJ?V[TK7E$?02pN0ZmKfO^Gj3RsSL[CYEn8/`=WEBf\K2(#R8!gVU6
p/7c?dD:[$37PPVa?3oau,E/_=SDC@$f!ld22i1"1-AG<_ZEqj2g43J5)ocOe@L?Bhr]A987i
id_U'rOFQf`!Xf0Li/!T;XK2Ait73t_43r>LX_(eWo<3m$j#YtP=]Ank.?Ya6lar$tcJq6"C^
1e(S.6db)8AhnL^:*?pJX0i8NL,mtg8>gI+UC\r%f@Vt5$_:ur[?4.^o%c4B4ee"3!Tp9&.C
JRhJaB=9<XTDnfn7kW2L_1Of/%/\_JDi?V3ZsH-.(2h1uLLqKOHQJS5T?q>!92b37@21kLnN
T/LjCBO)aB%dTM`M_ZQsk<f=C0i\q*JG`OH;DfPcP?6<\<8i@A`0B*<8=FRW<rD?6='Pd:Y)
SWGLSK8FpJd<sB@)P72s%Z,OW+mlF<N5MW-)^8@IgH*?80k"gpJJ?'c7F-5^85+<#S3@3K)V
;#r9%b2U(X3TIIh0)`PYK#!?:7jP6sX*PeJJ/SeASu\h0"PTnrG]A0`Zr7c:dS6dnWH]Af+g+q
9L8#bgr*]A,oW@3g"JJ]As3cKXl%"7u?d&f-6',-7JcIpqeW7:tS8%J.6)Lp@9C!#WC1Z0EN46
-#_%A%SKPbM`Z`HNbnM957,(VbbulFh-`PG@/M=[Qot1%c`IrRlKoq:DjX#VRtj5na/V<NrV
J*-jqCJ9g(!AcQcsFKE[YH>Pj6<#tE>K6EMZd2ggcRI)KB"Oi"&Hp9B;:]A?,?:/RPh[Jg%l4
DR.`IjA5i31>%2n1@/p_*6D:\Z-`9F9*qp%&D#ppU81K/fp-65sEP*L:9Ca91R-YD4tIW8.1
@>pt)E3JLR4>e'Roh;A[W^3\)HeTu&Fp(NjN>*RjIi\!7qG[ZpEnfJ^>'K*Co/P2jd(.]A&3k
NN0;g7ISGgDh$p\?U"4WRIo*"X3+J7ITQ*r5<O0Cl/g=Y*rX\LAUO90C$!*hgetH5ci\*/m[
Ih:ruB^7Ie6+Wj2\$gC3tE[3Te)9]ANhc3#]AsqU^0Vj=HaKX<@1mbT`ho>FO`)spjMqKEm?j`
h0*o2`=3$/I)kk#XQ7WfAYOCp(?%K#)gf+'u/VTWAEli:MO*a8m7a6,?A%gOM;k<;ql#3GX0
i*WW0Ce*D#cP?5rm]A**r0N!O-ueqHRH9.FW>e(u#'ZA%@\<H<-_F^Po$9An!q>(oD1@$l)>l
P#fX(e&b08(7TJ+qQU\m!qnL\%nrG(p&s*0h*PBkhshmp%jo+)o/.Erd?%fr[S4?epmk?H`h
ik_61SddF9qSPKT\VH/AM0JHH2L;XYo02lRohkgOJGJISE`:;Uq;7:g$cl<2^ICj,\"(P@5X
]AiV?bCJ``Vq`eH.^tj-)&j'7\9XIj^'!5*>Fr42^YK::dJn90WP/J4X7RNX9nMe[<IpCncq!
\%h&$8s!NG_kE1i>r!'_3[H/[\7NkiSM!YXCDaM6?+H>Oj7!p,ZXrBD_IaQa&&$Z@sqI6d#X
;h.s+cZT$Nd0<1%l]A--'[WtH#k53IDU&0!+kA%)RIY+sOdG0sI#E&dE`1Q%]AHAHK3'Vsjkmp
/s59,@9`[pc!Z2lSP`*7c`Z6-ql6\-:g`GXG_o[Ktf)fu!OElU5n_dj%RHGd.o`IFZ/fSZAZ
^DmT0alSIfn>WOl/[)hP--m='(R,48m(2G]ALXO2*h:1f%i078\=k+N0aWq.1Eh@c8j2:RWXn
F-Wn1"e%,\obc%eqITr@_#Ph`7SELP_!"NI=tel"cU&o\BiU,4,75XWt4@(D6MNGr4Bh7hG8
&)nO8q7]ArLJ/j3h23;eE5nTDQM6s=Z31*u%;8b%7IqIlDrjK]Ak6lTXIeeKh+0TT1)uFX2BX!
pQa[5A5QmpVF&U-plBPJ)H:Bdo:J(`DJYS-$Yo?Wl(UVEs:UtOi#sY[q%=ICn:9TiHlfj3#\
S^OS?Z'@[cA")$uK15O)DN\L%rpG<3n`rEtl1%=9k'd(]A4:?[up&iF$qlVcAL5-Pi%-Oe?"<
ac/M>NldV@h"Xajmdm!XWa-:V]ACr-EN`6K_k]A4,Ud1<oo:uA/X10oqM;*+Q]A@EDk$'@_6`%9
b)&IQ*T&8,6=eqc`6NfDMR-Bg:Po1;,4CmQKADrP-RR?_T;G=Eg(.>NDV_jaLmf]AYQK?lWZf
b(VMs.X0(gCG<%i-$ra+"-c[0_Eg]A)G*=jM^*bq8)mZA8UOrPrTFR'n1GJ,dYh"Ol"m^t*K0
RU6IJh7EW)/r$YQf^m7jj:@Rli@FPXVSH*>)V%sT$#!&RHsM5c<N#bXE4Jt_HKO<[g[+<*%=
JO;NYY7D!t(t6E>6iCdqA1LpG.5C=(_:D(XPkGn8G!H8qAgQ4fhg#)\2_4UJl(Yl,9eP7$W%
6kPF)HguN%d,H$0mL%/fpP,>l.?Smn[l;tDNqQPs4h9sR]ANR;sgc-:QTR(?]A]A&p0=nH3PTW[
(B-F,e`=q5l@Hfb2X#k`8n;Jknp^hNB71]A/B0mgU+.POR0AZLJ=:.M(JCG6pQT>1AUu<L1ek
L5U6A\B!8+=8-!%0H6I/E8SZRsJY#b4\Ik!qm&@nT_X-D+r@R^A]AW!j=%\YDdD!3!RMI4/,i
KD#8De^sQ_Un:Q([AC$j^f6R6[O^K_#_R9*ZR8.%TM-R6!h(Bb8J<6Gg%Yi2smKO*T`Y5q^p
@tquoQNLk\s5oq#raUHa&`h=fQgM02TFArH%fhR$B6*>j7rM[kfgCqeAMIB"MS$G%VJOYhFG
5>Kq-C<tBjI2(lGSq)hBN/K^WKjoPRU\#Z-dDtpA?gDF-QfZ_V[[Yg)qa8L7DgIp&eeYPEo`
0`#?6nB'W$T(s.aW\ip+Lfr&SeDm%R=))lFii^@U5+r?2*(sg<[0s+DQ(-?lX/O8`LP1:UXL
*!eq(gHI,ml2\_GB&'-kIqO4Z1FVi/O-RCflf+GZcQM>`"YSdY1Op>Y1H5NH2\OF-h2n]A)ra
."sr88G6?jCLgZEnDbaUuutc;5X8Eb.5MPF59XVWgHc7<M;D]AOZ2$0<Yd=a/_Bu,b@(T=\?L
"@/TC1MG.=$LSS_2g#i(1V/rq@#-n<D^0,OIS28Dfka^*#[0&u&jMua0Jrd\UYVth#@eQEdq
8=Slf!r%+B\A,)mgKrC%?F3G2qmR44k??1009:NKD/?D5k@htHPS.:sn4dg<p3H&i!<s9k(?
-W[-5>:Z*8cX"\7);Ms*W;K*J%OC20Fhcant]AJhWV8)ACZ-biO+LPZqI,1*,cR1+YmF&)\N'
V-c32eJRfAYWOQ1Vm]A,Lle2M`,"+QJBkteN(NQ>FWNP+2OU8LDR.iEpCY?dJOna,0$=oDUKH
(YKHjc,rB_$r&hpQ)g(RV)=D+lWT<")@F9DqCSg^'<,0;-p]AO.Y*bX.ftG]Aa/P41Sm(:"Mja
?"13L@uBgSAoTiDfh\UujMC_6GOS_hY<fQRir.^&_n=oRSfc@[p6mLF`rkuA63`]A)l49h0jS
5[)fihJF6$?gHIAQXZCHjl5e\+su.8;45+JO,C@)+9)Hb/B&BLVa:28)?a$anT6aR29A\os*
Gq:KKRQ#mAm8Ds-p,V\8u*@T9J*2l]A5pgqR=5:#5iPZA''EtG:_7OLs1TlXgiUD6n(<c(14<
DKf\bu-]A+Qp,FA+2T7?X,!tjGJ4Zhn'+O+8MX@:ljF_f13UW!%nQ^']AuX6ofP9errTp:fLpo
`RY&)lu0jq:Qg]A%F8f"X^AX*h"SM5U!b#[(V5(i"`GRa7`_\p)]A)iX,ObL1HQ9E6]A/j4JMUr
-q?=m[lH'(.HRL*MapFp<jc6pkM%*X`i>'.FEpUR0i"+$ZCN`*MZ!@qS$/&K1p&H96tB_0<Z
K[6O(D#WpHa7hqceWgHRp"(:XB*^KsnUKo=9HGq*mfgPZoS)Y/cj)30:EPmNd"=!hJN:dM)o
a@U<I_2uU%.oOGJCoW/fnHLJH4dC=H6V(O4/hJqJd3B%L4Z4'88.H^/;uBJlA_5)Ca[H+m)c
#r@&e\:R1UlU3gU50oi_lgd4Of\M-l>rdOL939H9KW"NB>%"jPRW^MJpq$=`E#n%&qPa;5l,
jtQ0HInnAhR3W+P1[(Cm%eZ/rGg:.MAH=WU1nO+,(a:2lC>5bn412@3-*pV*!sBQZ(@Xb3]At
r"a"\M(KUe%03T2bVCqMrAj+V/<1bR#D(7kOKK=2$-o)e1s!C^"c_lW<PRFa3f8JdEYgBOQC
YB^>G`*"\^@Tsrr&1M]AE7#0sQ81&HC[1RrUTSK)h3kL7!l?Sn,N]A`sX#<q4]AM7WD/$UP6L`;
*CgSS*=CpqW'+4_UM;[D3/a/RiQGNH!]ASVmJUGgT;qB(nS!m&:;R!O6G>25`jL[=0,GJ8CI9
s"s1qpfUhaIWEP"ZiNAUPe'9&-0UE]AGa"bII0+6eYnfioRSi>4R8/M7S0MNanO]A)(kah<!$b
bt@g\]Alq_aW96E=:XedZFgN/&dh-s+Em7JgePi0r$Mit,<@sM8Id>a1h+hV*uXVX.Lg/%LbQ
Df$o:%DXH90f+@Tcm`C5.G7")JT3nfLf$[6u3Sa;&9IlX(=Y)s%dnmOQWZYt@qLrue"s!@;"
$rmMZZM4'OaJ7jK7aD\OC*_>rLi0]A*nX@sV2iekK*;%0^5)/$0=ZCq+orqBRLKS\)A?Z;_N[
/`.H!\<'#t_n^'L,YnTuJ\!o9r<NkL)*h\F]A,cQ++D!,p*"t`1rrL&TlRO`Ib?ANX'TO(l\s
+</bt-9>%*MmXSi;<#CGKo!5`>ai`f=Di+*fQq5?#27C>&V=7ki-O?6<fguW#4o41L\VE.p`
at_$"l%6,+Mp"q[0i$'a4hfN$mg!_QO%g4%-%#!0BeUM@F1h-P3K/,R=;Dq)WA5*<f$ll`b:
e;dFQ88?\[u:X>)J+?BK&6H#P3V,l3]A!_S^IE+0)""0k3At:D!EqU2L%_#oCFmb3JRG[>6[m
e6>j$=l'ld\&>"PP[\e,_eCuk-_heNkQ#El491g>ML-b?1uArQL>.89XuC7a-Yj#uU:7Rk(f
0>s.B5e^3h`tJ2d6(r'IdOrjXj]A\R9hm=rd4Ss.paZQH/82o#6~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="510"/>
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
<![CDATA[1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,0,0,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[负责人]]></O>
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
<C c="3" r="0" cs="3" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" cs="3" s="0">
<O>
<![CDATA[店长毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="3" s="0">
<O>
<![CDATA[智能机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" cs="3" s="0">
<O>
<![CDATA[荣耀手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="0" cs="3" s="0">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="0" cs="3" s="0">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="0" cs="3" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="0" cs="3" s="0">
<O>
<![CDATA[D+手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="0" cs="3" s="0">
<O>
<![CDATA[D+配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="0" cs="3" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="0" cs="3" s="0">
<O>
<![CDATA[回收毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="0" cs="3" s="0">
<O>
<![CDATA[PC平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="0" cs="3" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="0" cs="3" s="0">
<O>
<![CDATA[hi&nova9]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="0" cs="3" s="0">
<O>
<![CDATA[OV米中兴远航天翼一号]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="0" cs="3" s="0">
<O>
<![CDATA[新增天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="0" cs="3" s="0">
<O>
<![CDATA[新增宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="0" cs="3" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="0" cs="3" s="0">
<O>
<![CDATA[5G绑码]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="0" cs="3" s="0">
<O>
<![CDATA[幸福全家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="0" cs="3" s="0">
<O>
<![CDATA[华为FD]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="0" cs="3" s="0">
<O>
<![CDATA[千兆宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="71" r="0" cs="3" s="0">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="75" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="76" r="0" cs="3" s="0">
<O>
<![CDATA[小赢家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="81" r="0" cs="3" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="0" cs="3" s="0">
<O>
<![CDATA[新增云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="0">
<O>
<![CDATA[任务]]></O>
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
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="1" s="0">
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
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="1" s="0">
<O>
<![CDATA[任务]]></O>
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
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="55" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="58" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="61" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="64" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="67" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="70" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="71" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="75" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="76" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="78" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="81" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="自定义分类2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="自定义分类3"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="全利润"/>
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
<C c="4" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="总毛任务"/>
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
<C c="5" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=D3 / E3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3 / H3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="手机数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="智能机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J3 / K3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="荣耀"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="荣耀手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=M3 / N3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="16" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="17" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=P3 / Q3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="20" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=S3 / T3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="22" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="贴膜卡"/>
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
<![CDATA[=V3 / W3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="26" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Y3 / Z3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="28" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="29" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AB3 / AC3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="32" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AE3 / AF3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="34" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="35" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AH3 / AI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="37" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="38" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=ak3+al3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="PC平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="40" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AM3 / AN3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="42" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="43" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AP3 / AQ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="45" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="46" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AS3 / AT3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="ov米中远天1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="48" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="OV米中兴远航天翼一号"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="49" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AV3 / AW3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="51" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="52" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AY3 / AZ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="54" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="55" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BB3 / BC3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="57" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="58" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BE3 / BF3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="60" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="5G绑码"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="61" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AF3 / BI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="63" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="幸福全家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="64" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BK3 / BL3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="66" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="67" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BN3 / BO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="69" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="70" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BQ3 / BR3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="71" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="72" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="73" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BT3 / BU3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="小赢家增利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="75" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="76" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BW3 + BX3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="小赢家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="78" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BY3 / BZ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="80" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="81" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CB3 + CC3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="83" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CD3 / CE3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="complete" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="85" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="goal" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="86" r="2" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CG3 / CH3]]></Attributes>
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
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<iVM;eOg6O;>i5TVH@$=ji=1VJd2=OW>(GiUfR7QF:ZrZm\3B6jO>H)m.RmX,p@DV@XkDWD
Y2W+[?Ht7&gkKOFS`f9-OQG&4-ZUfCM5Z:-37NofE*,&'Y?l%d0AF\X24P]A9amiqT[hXh0uu
p[h&h`m>X?Dp(df%6kKR-ioAq+JA:p)9CKJY+Bc*j]A_:pNq;q2lG0(,u'f3.UN>iA'?'@M'Q
c4a8J&ZiYF(c)-?CHA=kAt2H,o;0Bmb-t'&otlN)K5#"5Mc1lRr``0e9r]A0&DrM)kn".`$n(
3Sk2mG@pZm1r0E"(=X-OnY03*%p$8-Jgohuo.)#ci=hQStZ*Ei7;AL@)Q$+`YS=h*YlAtn+R
K>m]A(Q60N,:-<co`uBcr*//]A-]A2u\[r4HHXs7G=A/_X(rjid3(ruZ0E<I7.:3]A*LfUtG6&GH
8<%4NK'6I+kuXoI+V2B&:skm#Hp.h#C++>D*ASDBOom?MUt1I7lLsEo`4IfVL.B=_.+;1r<F
`K(2k*R-[Qmj6=`<6>N)7Om'LOk_4BKcZiZ\GB]Ap%$JX9kPam^,;E`Z^b-7`2k\4/cNWYo8[
CIj)\^ZnK=A`Vg-\AM#@=X*EE)3JKk/IZ9p]AO4:<lGr-n-"EK$5U7\mn3[oi*=<VBuUNeYS;
&A,KF2(:m;'S#]A;"rQsmX.IF2FViCa?`_%hT\)FDTj9#_73\V9>Uq9Cdp8E[A/B2HWRqepOB
")]A<DD2qVWKH)s!4GU*JJ2'Q@Xk8%rK!)K0]A`,D0_(ceBkJI.L27I*AD&kkoE3I#F8;AIaGN
^?o2o,+b"1)&=5Nt4JcFreC:GgB%N&.&uD(=0nJ<ZkCOW:FYJ'O%^%BgETSZ@,iTMtR'^c70
odJ/pnF90@j-0)j*#&/NZp[OM&F"k==XPBU\/uX8D*^.4!O-8Zf/<KardF;[a_M%2K"eZQJ>
R*Dh#t[J?OECuEQ28KbRLrL[n31H3q@8p_9-\q;`ulO670`[LNs#V*@<gFQ``N&P'V)3[S=O
'STPQB#)+]A)d2C+fE`GRp0!SOTTVqA4er*&S"=*\a%1+IPsl*eA)*<*fcdgP+-/AOJNSRkBW
0j^fmBEX:u0#\\J-]Ap&#oC:UBjCrm#W5H6jAt*Co`ja0p4&@964Z#821\:HZK"`Xl3?:'V>l
/d"MkE,l@=03]Ah;%,]A3@3=l*$#<^i%8hna4%CihrBueOUb"`Ct+Lh-CBA'=r3L]A_I&+Hn2jc
gUXLLLJEH</r<(1G[<?F&L`p?_2D#!Wc3d*#7bBWghR:q^'Z0]A3d69tMY)jgL[_]AZq3@[Sc5
.G#*YUSV1Dh,%^^,T;j4kcCsdt?3CJA27i=)ZIVCW/M%E0eE;S,DRRKg2a;i.4.WWTaZ`;L0
#VA`Fhu:S#r=Y+HnV_\E.&2e:\t$Fn[?foXC$#Ns<M[WS*N=V/S[%Y3ju9*d5e$lHupA-,I,
ZVI1JTaW1Fnm+<$AdgZ<eVB7/,nh]A*>b7cUV;06<#,;rgl$s1.">lIu\_.nF54"[HEk+fu`-
3Su'@aUAqKT0FW@PL^TX67._0!P`I!Puo=W2t+ZsJb2"XP<'9et,tHEdTjj[n6!*U6)pGu"F
decV"s493W.NPmSc2MLE*:$Ql'>1l(jR5Q1`\39$/s!?m^Mu;fejm'8Jqj^AiB7TGe'mnu42
r!b1oM<b+X#o6/h(+rOV%DVfdIEjLf+h@$LlOm23,(?TR[P/)75ZBmCZ!]AS.\-6&GTr=&q50
eGpo;_@35Sa1>H/9]AIY/Ks.>dG(1H0@.b!RE^`JpHrdSYbH5!O1",Nhs=+b#(K9T]AnU+i8[=
&mb\YX_Z=M*<6)->EuY$TO?CHI]AP$VYbX4:HUSI%^&n8[G2,*;YW)^+L8ah;(CMeNQ*6ecX\
!sbPGi"HrnIkJV30n)SD!HuBWpWPnYlS_;WLlTccrqiY0U\Q2KF0i"C;h!TlF?RgLd7Wi:QV
jf$Z@+pQ>[nl`k%ME*6WbY8UNh1R7(t7ldKP(Pl6FRMJe3/$K*18G@Gh[qH8E(lRW;H**jQ<
Mbe3H:Gf.(G=m*#XAgoM]AnkPqgsa=U[]A-%n\/u0HV<C3DC?dt\7]A_2S7Hknfs=G6.LU$7C(B
P:?p0X4l/H&<?#)M]A]AamE38FQs&"M@3!LK'Wba&%O/Q,.Lsd>[S&LK?+oduHPkMhFkrdUq$M
=jQ7Vm1bDQ[LOasMefJS64/:"rE+)#khSLCo.se>]AFZUs#rhaN`A(]ANd;<,uL$+eiZeD(d4"
gK>Z)r)]AdB5;tS(E"0FIp:FiXjP3M(A/FIA1DL'3A-(6M@^W9)<]AQ@^*<h2&=>U7Fq:?i^H"
9r<jjR+p4@T8qh6ijd?q9'*udqfNJRO_rr_ib$j$rUKS5;p@*cIs.TXX\_''Vl!$Z=%Z.Xc9
SJdSm^dDJ1kVS;\.mZL4#9[>""IltDY@!D(f65u@Z,4cADIgYE9<6a=m2/sM%=<(QnJ>!aDM
WtkdPd1<=Aaf>\cHe,"Caq!F@LZ<B?ZXX0>aaOK4UQMbOYj+jl`iB\">Udh)"(CU31X=ro9D
H0.SC&K?.R_ms6a0p=iaLCOW7@#T)*9YminF<*Qh-In=BI6jrO6u')!SSpMGc[bBX"p;AS<M
5<#=;S&gC5&P*=0Si0^XOaE4*B_!PmH(e5c&mW61+@Kq^I,/fk(mur,/s(Gnu'QH/X)u;=V(
<TbM39Ibr;n4+:L_Dfo'6gKctn#q%`4R'[Z"D+;]AijgQ\?.*aY_2qlA=HqD<SD+pj>Nb^jBR
HrA0+%&U^LS+0A#P>E$O2`:R_1-Os%WoJnP26Bt0,7X1!^&O)f]A7Dm<RA1\Iq$q.`Qq]AFEG)
Am'oG)^nDVUa/lPnfX0?YXE06NrKuS_9b[oW4,6CUX^SWLh/BWV2PmAeb)Y1$6c3N`?U(%a[
Vr((lSF"&(.]A__iE7;?niX(u@c,E&\/t[TRp]AdJU'i`9O0s8\C\[5Hmha)53gm[e$a'[a+f'
]A,J`UHj;fPaIZob(%%,sW_Fn)TO<l#lW.WTNXES!5+?4U]APq;Mdtll0%a!VM/[#5\%ncOV!5
c+s/C)]AR!3MqFJY*<gf%P9cL\T&h'br7,0LpY^1E(^VILNeT[6"J`PDj<eM,lh?6HW\Gl&QM
.NiW>?uA*2<R!OVnf*!1JZ8(:[mo,WQA:$NiO.+2'DJfY!GOiZ0X1;H#X!_R<ZTFJ*agA>ST
a+/LQm1A(`]A_E[M;2cJcJo@(R]AQ<1]AtIAHF*@nb+%%!u7mAm4!9,?nfN!!U9Y'NRU71\153O
,0$s%[SO.1(RO,^f<p7Qp]A$hN4q^3i,O-#9:_-NY^S=JW_S:5.<Y)TM=_AOqMBo1CJuYO5oX
QIkk$DAu?30tJ:^=n3\[7D&\<-BBa[XS/d`f:QPY5?RShF\S2;4^K0`L0_H3Bh_*or<6jX,)
r;9guK;$DQ9Aa7?*I!?[p'oCk;>)eM?Mg=q*[2#tcG%FFF>8<I*Qcb\IOM,-UG`l_(8I85T<
F9Qho%"VHaT&=SI3Q0L0CtACmI/;WoW#]AW%Q`BjB(:#uf<5([f[td@dIn1')/EsN;EABeZ+T
+V[.,.T`?c3IEp;C`:[utoVkGQ0S,Xu9\BC?V7ReLRpf(l)B>eo9OW2S[k$D4K1AiI8"74S]A
UmlP&@8uC_W2;]A^h6UHY:iLEMp#BiWB8t7.9\WM#IU&$s+;CF:MO';7?Xd4O&_J`8>pQ5?5X
)Ko^$88sIs648,&p%emXEP(YEraoS7`*6l/o*39Q?7^ToLq<G#jfs[\n<KCYA<-UJnl_*Ki]A
=D<*b>aLc\rXX)h=b#3-n6t,d,H[:WDl'iucl;iCSZ-l329^K!Np#r<U?fR[A$"p_iX\/\EI
";U2XH.O)m`sqQFQoS*CC_k+m+u^CFiHMb5_Vfj-@)cP:?6W)dD-s\U6SIuWi`k6X17]A3&Z:
M!!pBQnF>L?;3$5Y1M>GMnGXXF-T[A,hW.En8KP11_4fVDY;*<jT)Fc^KptIWA%Hm+I\BP$9
GjgHrMVJob*kgkDl`0qGs4k')jLY$;c=o7^IoZ9l#>p(qiJih3U698$%CfL4E=\Nb\:rI5$E
lYpF&)RtJnDhn,V\\Ni_$c+Y0^WoB>=6N+7h-K*a$KinVUA%9ShCd5:.1p;c6JNR2=D=<*X5
ZGrrZ]AJ7391<NO^*Eh6.X<O)_uk*fCQl60?i9?,]A8=sSc\oC[eb<,?E"J[Xa:#Gpo*bhpQRJ
PZq<ma?%>_ib>>3k'K&`Uh?-g;1X-V<;<mio&E):<X2K]A2tgOD=aOo2QA$ZhiV?XiT9ZG3lJ
VFN2MnYdf^Q7DZ>Kp'sn/mP6QW0e,!"4qKEi4Mgn9's!Z%\jmF4.$+:Mcr_=J,9<ENDUYNf^
6F;Dee#[FcY1!$HhV64g-oH^5@@bXZc+R&lhiP8"@He5">@5D)?n'dM40?c(NdV?p+t;T\o#
mbL80:skT=q-L"tlnh4Ph,H/E=VtGmDS!1Jm8Aa$K[10@><2a]A+I@:P*!kU"k!BYWfH%f=W3
a\SaW@8GJ&j-B*3HQDo`4ls0%(Wq.r4'Q)#'Ao("]A.ff*sepG7&0oH4N[ojrgFRI!8NLZmL$
I!^$F.=2OLK^cCB,+`qn^\shXm`rlnD23K'(/>^c)67>:g:ei1gi92F)B*8>!gGpO8oXC")_
%-^W7nM[NqT-&4HBA7SZ<GH]AG[lR-pJVFRB,)3cZ$r)%_cpU]AhTB$3!hqo,Nha]Ab_k11%mmF
,jQVJ=`\=(QbiH%.N=XJ_RYf$!^&?2TIM)^^6t@jZ)A4H!Me=al;M'lQigmGB%t&/faJBJjV
QgD;Bl@GPMWD8#YD=$kHnsM]Ahd)kb/j.Z50jVbLjgZ0F%P5:5N6aocNUo62@Au=bUAFR*%_`
`hN(ql\<3&Is,F=>%L5J-QBK"7qYf??UBGc(51$+Yj"[7GP2[QGf<6%1RHi_&`ElaS_&Mm_0
QTX3!9-p(FpcT`Sif4%g9f=r%_l(_CZpuB$a'Kn0on9<m2@dTK6o5E8sr[C%mN0k2$?1p4J?
P7kAF;=kYDPAVLqUC'LL;+BZNjU#Tb[V@ES<fp9qrFN%*%dj3D?l?:V/R+ji$g+@/_2V.kX<
.<=M[1`V6!eE.Zo@R78*f3pj9Y^kA^,hXZg,+;QSQ:-,5%hYiD=3CYH"!MZKYdH+d1jUrk`K
-A9i[_a:7O-WR2[Oih[fY3L7nene-sM,%ebFKt"]Al#$CusT`9jmpt(Ko4V8Y2*WUat)LHqi1
T/mA8`]A<=\nH_9&eeLlI>J[buIUQ/o'1kDJXI!6SoYC4t\3k2*r<YVk@f!A?&m]AP*3=jVFp.
0<ZR*agP#T2k#F)Xf,FPZiJ?l0nn6C_U)-gcHPH$kn[qX+d,=p&bL"SVEVM.X;BU`8Fm^Jor
sMHZap.T^e?,T<jK:QEcocdH2/+)&O3mIt/t8T#\[>ajmT[Q[;U3&EV$Jc$@r7HLuQq4J00t
fl$'jO2Wh^[ZX\>#(/shJ[X%Z%l&mbYG2>SEHrRX\NH8T4J@da$L0PqbfG/H<6=0IPt[\Eq2
c&3aG)7`QKq)#gK_5RQcp&jHd19rZ+qiSq8EO@0@!T)'Vdf,Gmi4(R+r4((Aa`<I*-RDef[O
NP19?9F:qSM`8pF(,YTW#+'^-hEsFu-\R^!Yac)B>:p!h._eFnsht6L]A['?bU$Bor[ajp;UD
Pd>o;hI:4+ZY-=9$tB+0)_,-7LH-QFs]ABmk!LYUB.BpbHc(8FI+-k8rY#A]AqDL?Ja<Z\N?mq
HNTT^JYL(!`R7X;$"ZAl(]A"E-7@G5nJ`R)nAJRbo1f&8I8;H^3Gn*b([E^0_=RT$p)n5[dK+
WEFLX1<Zscq&(QNg*E'E$*NkC#HH6O(J(!9%sFAlD,Wt7'C+I@#@YgEW.)=Zp4]A+VKp^'s'&
I_4.iPL_fjH%D6VY3=MP-TD3<Q`>8\j]AZ+SKgbPh7^oeECVN-j%jS1!AT$F=N.so%V[C1"?;
+C-f_28G,WdgV+7^%Ic['2M]A\>R,jsG\RR4f:h&MF[[p<)-9S/chN#'28VX)ZP8Z,[=7P!TP
4k3m<^Q9K&fR%J8hP#s0T#BG#M3-j:`*d!k"Xqpp!F9oHGYN,0G(R$Jsaf`4AXgT:p:8b.o3
%E-0dc&4fGZIQ1Vk<qGA>Z#ScQ*df-i!H)<-qKL.#Ip+T$=kTS]A4=5>e:BJ(QX44T=<dPKHM
AlTa$36mg>>&kB7jNS<\IRG6Q6I!Yo:/aZPD#,PQ`7[L>9L0I-^`^S2YJIu;NH<XF\HVTiao
_ZV`*+L0SCD^X:+c\YXP>j_+!&2Y&1nRYG`AGjSG@&>O3G+eZt]Ag@#Jb$![Hu$V-Z"M$'+q.
8As6s\+AuS2B/<f]A!@.gh@mgf"^FtkV<Gj4U]A4sN[?YJIVi-f]AAXi[pU:?K-6.$J/lbg)deO
O*HM_BX#OWRI^D'f$4'`Hm=_iON%:Q+N45\f2%VWj\>e&5W+\V16`\(lJ*("P$0<_6H8*lSj
,L$/eZD;/fW&!t%mN3j.&-LV\9J^n#mlEn-YPOqcP+">4r[2L\D!d*lS]AGFkEFoO@<uRSd@?
i!C"uQ`$*YVGZ@+69WMt\uO'jg#B:nN&Y+O#@Buf$\d&/]AU=M:YpP6(mL8^spT5(YUH_KYni
rHb)qNp-RG&?)\O,R'l9',eKJ-"g9,+`\23tHX8T]Atcs'$"u8]AcWbN"c`=%J6muWM-QOOZU.
<U*/':"Z;!#Gi/C1>5,&mi>2N$H;42^oDCe(e74Wod$)6a:7]ASrP=j[J=oIO_:=_=To1X$k"
fp\IO"q7Q(#eNfVk>>LLl^)F0<gfk#/r4n6gC.f8nb<UVnq_6dcP_.\E`=NL0]A4:hRJKGh)p
K^1T/"m/c1*\N!tM<@`.3TleMhsa5s12j%%"jO<ZhWiQc.`Tf_nk##P)9`Lj#PrLOgQ1"5E*
3L0"S)M*:0qOm"jog5XtncBFUZVIZ,@XG*YE6c.&hiu(mFQ?W=h]AXep/V?l`R:;8HCG3e.Ng
S]Aol;*J1KOdJR_.(j#N?h[7cPfRg]ATG5REQ>^s+E&4,m>em6iR?h$M1E)2dmkP>`0F[4(;[E
i$&*1*W2<TV*9:Z3du8H#SZY\j%&bFHQjQ?:NNi_?"5_N@`DK'HF>SPF&]A$M]AZW\e'5i*q1S
^rGO1u4bODXO-YoU&>0$&)$"80R5/CX^<MgnKCkTd7i&<,bBbc1GF8dhn0\@<nSg+en!*DXA
21LM?=#QX;rBgZ#U#B%2)HOCSh,(;g8a:YY)KD)[TEq0<T;"jSEq]Au*Oc<(FFda$fFbkm5=O
S0B&&K*'to_X>N/R=Rn(P1caJoT7/JE,/qM-\MC(R-g-GVg157Sm9n=]A)\ab!p-Bkj?QO41X
,.5S3WP"9"L\GC?]AgS+4=aD^?h!^Ic5nDpa7Z(RWBQq1i/B!jiN;Y_>.X$Jc`C<YN/A7"YRT
?,jOHZ9B=-g>`k>r`":d!1&9ahOP._&ai;"&*Kaf_0p2m^pf/NVk1/jF^ugt7;#8,qP>PL$k
t!Q)qq2o>e2MU5n>:_'ioH0Jear,WcIC8gL"g7F+X*t<NKP/B?FY%N7;;np0D"$3kOhE:lf$
!boDFPh2M$JeR#to[k)W'7?NrpMPapS9kF)phPBn`qWWB1Ve<#J"qEVqXm^@qoJtf]ACZ5G8i
0&s:N&V7ftCPXlu5LpM4+1N4!S/DEVi^M'"?rn9S?u'[/LZ"is9L<0fo@Lf\h:>UpF+q0*qZ
XOC=*h?%BP:jl^Dtl0=sXIe^q3WgT)>lE<E$ejN#&Q;a7iX34,mgVeSV)V&hA9bW7c@KA-s@
jDFJb(fM9]ABd-S:c*]Ap0R@pUi/aCga*[`tEO">]A0VbUE[HP%hNqQAn6=!Q$:Y?ZGXc)<7Cem
Zr[[rnZZF9PYkarY5_VSi=6*'CPVG`?_*"E<Urt'ER&Qn]A:(0BCSN(1fRB'0))G>i,pog)E\
Wk@jS8^;8QV?j;DO4Z_^d<e3C(g7^.8;Y$>7d6*<u,5+DK,514P7]A[LD+*>7Y_ZO9Y,;+NZ&
<QXB6Z<Y#u7`h^m,:6?Y:h\SpOkITnb*cL?<T1L-KBRU"K!ojb[T)r,cQs]A8N]A15FK*"V@!,
O9Jh5R!B9B?eh(h1qO0AN^%d*K/"f@Q\s&^1KGg+boBbH,>D6g.j'b`Y#i9&N&ZLiQN+H[A2
B;'LEL?Fj1[ptl;Gpb7f/r=I(E#K/\[+UWn7DX!E"^`D6=bs)/iRBhMA<n[qDVTLi<?2DSeB
R0P*O31bTLaP(%nPpVML.:H"dA+F4-Z&+9>1MMU8_BU''\9CLri44*iRq`Z^A;"h4qi*<Iq*
?CH%>A2d%cq>RU860oM^MCKmFsDN!tcdRUEW1IA[pt`,kP'P>+/=jgq-k\Yh)qK18RhE7FNA
>Et.p]A(f3g:cQmd4!FQGj3S>fp7VHb'Tc#B3I/&,CcL)E8mqr(6aEDJ:%J23o&K#>')!F"\N
U61Os/:fUZFZ1;YVMUXah?a`jUL_)p%bbZ9Oh(.]AW!aW!m4p&`r:TEh-r1."'&C/;Lsj[loj
+]A/Dtq+K@?k-;(/4iM.tqe@bSJ=mZ]AbON'G88HI[_mZU2^2t&S`+'2\-4+2=p@kP\(R>0<`?
Y1[U&g4Vm74ej=Kp0OI]A!5P/#Pbo/IQpVQ5*RckC(Yh_&s`rL,MKJ09rFZY0bqVRXCg?LrqX
Xj=4pp,HQI_!\e<TLZZ(@m3M\d/h<A`iO_80IPo$#'j6%B+Io;Ac6URdMn6VjAOJ7K.K2%aR
SE@^AgR4+/Z>BV0#D!_elBmDYndJ<eEYmb"C8X)RF@u#93]A,o-g\$)9Pb]AHE5,<!Ql.U,8+X
\^k820M5"o,sUbl%gh/^nCOfZ_$G)<`J,qd#^,'+\:Y)3#;WQX9>Wa=4=0KSC8CX>5AYJf9p
W$WH;sj)0-(U8O31NiM[4`6HX)I3a<Uaf+="L*frl6[;Y)n'31WMPeZmGV/]A$orX8j83Rt&g
R+jC@Vqo1;3Gct5B#.EZB'FGEVdCKG-Y_>Uec+8CER8E-84YZ>4rXY'CZ$2cd$q^-8fAlR@9
bjU;6M.Q#/SC&a!Fj2huDlkZf'pl^K:MFg$iIMdITb;2:CL_mLXV@N`49Hh`YG8&MSarG6s2
go[Zq";*;F[!$^u'TDrW3nk4"s(mHW._OC6:"i5T1kr\cJ"4GGq(`n`Ln!?62TVttVspj5b!
3#+IY-^S*JIkCN-]AbY#dC#qc3NQj5fun-&>_4dCF+)qm^.t+:tj*5C>St0U%jZd-)G@tL<d.
P\#Qhnmj)BWMQWe$m22uq`idsX4%Y+k@ErS.lXuc)pEI[?GMaslpp0gkKe)mtIYfjpVIOg-[
(5ms_WB=PKX9B;mf"M234G.`:\M'X^IZV:MCS0m"G9"PgqTncZJ2Y9js3S%+Dp=^&>/$%ZP5
644:OeeIe1:Q9c#]ABc+6tTrt<i5C0=NKF_,((7i]Ac/4nKJl9k0DLVpu".FQq]A9^lAJDlD;R3
hWtkjL*(AMX_ALTfDLmJq3@u]A.iF;TE;i`hhd2OEcXY#8`$]A]Ahc)HoVgOtmkj@'hqG"n=&X\
ZA;UJoFNN'bX`081r)\lQ$e5>K,lY)Ue$g8&Qj"H?N]A1"JG<^t]A..Fn<%U"6pL9Ro;F!_pfS
eg+%%jlq\K?kZLL7LT.0"pIec0>@`ftF,<ff/_jq[1P6b2S0en;jdn4qYZD8i,OrK?9[7q.r
6^HSe&'@kit=p\<3G/Zg?Wbcbud<-+1nloVU#daq#Ce,;8'!qaO@A^bVr9&Ea+Ki4CtM3oW:
E[(RqR&)($1Rcr.s2Run%rDLq3[q(OG>^mPs?2h6m=^D"L6LH?+COan1NSWX;IZCV^7dqsd@
<ml[n`gqrONaSoN\?sf=)i!h0Q!uM+mfhtmf+0&AEa*Qt(K]A'bKLg=miPBW993#r/Kdl*$Ba
93T1/VfRF]Alb*o2KmP!Oi?;&;BT$QJs[.MNB?l,9poll7R!1D`MDhWsI2s37oQc2*1,$02AJ
?d'PF'inRs9e+.\nQN!SgAS$5l('?,<iUO^YJBM#(+X1\>p*h6Cb$]AFn^':'iSmag7bUJ@=<
%p*62Iemns"L?2dsUBg:]A/MO$\OSg.EpS9:.;8/SZ\dim=-/iiaDk.BbPP6b_-?0ohsU=hSr
cE26SeuBiGhGjeD`*Q(bqEBpasoO=nA^V[O$ZmiB4RIKZd;S?l>jF`<htVgPsEUATZ^NOZ1/
'FTS=bLsth`=W7&%m&?8o?8I.`#T*OfEg%F4c:]A#Ln6<e?eWqb</3@N<GL#$L41+LYpZ?g?2
6]AoCo<XfeYf"'=qt'^hK7!>dBt\34tem-JQ+l(.1D2!+X*on4=:\X2g]AgKd^-VqgS42P0:^3
t18U0n%L+TE58u=mR=;h]A1kS4(*.X1r9a*l?:^_2d.u`/^PG$1$k%h@lq@C_j-pC-Tc<ED4K
5X<7M,XPe7mu4D-;1D'Gq^9KAX\6RBT?)jDgS[^1>KPI7[uAFU[B)0kmo!9aQF"<SW03GciT
)"lo&\q,)Ci>HCR\1GCjUiEoHWk7$,dBRgXA*bHkT'lZjF:C?`%n!.%a&R9=Gl$9"3&l8'Y]A
KQ&K67a/=[bhd#&'N$\;5KBN8+<.\u.SP'"lt*N;Q=*A@#j-2GPgh6Lk`W;%k]AXBqXL0f?P=
3MK=+#-6*tm*M><L^t2YO<NI<A@nUKbk(jDa0%KdE`g`dTWi<$>rVDIBr9'sBlB:-*g:B4Cq
.39c*YYIk(.V$/\KXe2R>H!NpG.9+OS7p&rr8s_O(V,+M0<5DU\)Bb[,K`#l),Ap@"ZJ!"N>
O6/A7MQu@1AVV7O`Q[.XX[m]A2T2Xre:scRk-)!aTeb="i?lsFN%7cq/h6u6"G!cUU0R[MX]A@
F._BZDNJt59W9h5QE4.]AJEri8pE=A``^VrkE+V_s,?Alo?K7nd)A"=^f"-4gfOOGp3qb0!EW
JHDS^Q1nPjJT$N0*uiNQBq0?C"ldtn@eIagkrUN1`jcWio)4O3HhD;"THBAS'_Mo8hX%6mMO
s5uh\dFHd%-[:iXH./R!dYC@6hR-N/qtT\Q`KAmfLS7dB^2ILE[um1%OhqhX6&#4'mqK'jPI
kNJ'g`HLi"L402]A:G>_bRTO*X&nMu0+c^9^a^nOGo2]AdtiCWPOB2K:(n;Z7tH&/%kQmZ*6HT
(uaIMo(%<#?l&2BBfHZP=j6aVt8:4<D0lgG,Fm7##&SSb_m@#.%pOlk(Pkm/0XTb@W1@:m/0
keV:AT)&P&NCABK6IWAJ*]AH4K\)q22-b$gkP\hU*1h4RId%3Ac'%nWPDto?q\FYZ\7Z5A]AB0
i/$qp6i:YO<<-]AF\WqoMI0;kC)_tGXPco,lJ*):kHH0(B?3Q(S%9K.94\%eIP.ffkkk3TNl@
:h@qf^-"3)4\1'XHdk%]ALVJV@6)Nno`mEit]A:?X8qirWs36^OUN7`1$e%?GOF@FR4r,X,NG?
`cX971W/UhBg:DfDTG_oZIEO[D)>6+j7/IJ8%2T&-DjKJmZY@)*QR:c2"5a^]AmZ<BRXtO*L"
C/=2[q&=Wcu9ALc6C_P\c/=p_u@#ojab^RnEX3,8;Pf*Ut!&5F?=O:a-#%3p$U`IX&2-^1m-
C<5;2'I8-`/$L)g-K?cM:qK#Q[JitKB>.F)YVs7Fas?$_?P0)`K`ZL!X=+`1c!WmZC'nILtS
3DcpC^jdlgK1jT#CbH]A)08Zou`OM5e<J5KW"N`R!36uOb73(#!/10!W*aH)1oq/ZJjA_T^S#
HhiXJ=#CbCaBMZ"iG]A++&q-HX<s1'/aib@Wdt3VHl!/7<"!VSVA;!@?2'1aF?:a/cVY7/@[,
$58k!g2F-aRKcI%@f@@,R'0D_):ljlEf'JhUW!tq)F7sDo]A+e@(mQ<kD$bnZ0h?]And@F+Yqe
ILU_He^W`bcWKXVS;H?_#'Jb)A+M*]AcSU[)()+>+?k@kiRZnJ\#l\iK`@DOs7kh3"&f0eAJs
fs,Q%=qqaSL.<pJDGS>oci0$VRWLls";*NdsJ$HZU7Cph#Y85\B(i&H'1`!gNE"S/Oi4m.S]A
0XL*bX:rUKb&#[/9J0QE@Bo]Aign3&h[(?AXWLteh./HF<gm6+)qRJ'A;592;n!qsL5gar+Oa
Ss:l_>JG4-Aopdl/jlHW8-YCnY;Ps+PS:Q$P-:A(M9E1XQLnX,H]AOq`58hciE14n+Hk0L]A=H
`_'91#82]AjB^,n7>+JW?L>l&<("@:Q$7npp).u3La/9o2cRLa*Wg!-^9Xuolq00$fifY#]A=L
A0U$=m>$R36=&^K$8N=O1FumA*WVl"dhCVAq/4ISO8S)E,%R50:m@BJ>@lA8V==S\>i']A238
mp7h7V]A2@1F)I/pb0d<:q3Sq$Biet95E9\U6PN\u3oau&fq__DBRaCFsJ*RSK`)>p#`ZMg[X
X=b!1bS9ub3DqQj<crV(n^SdBZP;FJ';(<kjTQIiXnc4WKc\J6Q:jI$QX,-c,[DqB0]AdX!bW
"n1+iBn%%K@VNYnusIN\6))R,Jd.q6%jb9WL'5"CHMS4K^HY/#n>;gZOC66@\M-J3qR4f"T9
032t23)\u:%F8iQRGq<A=edeQd+6"l9//Zjoa:[+.ZJj%0(/u12TK!S>77'HdD.lF&/B'C0Y
R/Vi6e[R!OWm9u'I%h>FPB[(2(h?5nUhfQs135>.smRj`DAUeYrLH==M`%jqWjC8Z(RSY$)r
FK'XZ!%l75@bR_ar,L:)27(3ntsl)04NP=%U/+fm'R@<N+LW7;D\Q;2>cf,$MXaqQ>X[H,^$
(5WfN^8mTQ9(K66oJ-jc/FAh)HiKuph2?J6&cLBcd,?f*cT/*Rh"nZ!7<QO&h*0q((I;nCV5
ZoBYkU/[ILb]Ag:>;V[;95]A4goZJ#kX6d#(j>0,fg#*70%/90C,U>(71M#PnNU!Zi&nR(JP<B
E$0.^dM=L*Jj5lJ$A\=dK(;D!c*kN6.S7"l-&mg8j:7NPai=0S*3:)jY'+^+$;XE!@?I;*/6
PefK6k_?]AMj?BiU"bs'[_MffU@MFEMHl_t9#3W,9]A3??XOL?"0uqTbbqaaf$AYTa]A0;Z]AY%<
Fg$cuQ`k8!CQe;gaDgt6E,&Af3p1JC:P"gEBu421Dh<"[@+/s#9N,_ta]A7?/7tf)NT#Z6R<2
k$@hEk8KqYe&Eku4"MB)X<T+/(ua;[RlpM.[RjosU\:CeBt(+p@+*E^mUmW7E3B1HJ>9XuXX
>b0f)P&\kOFOU-;N*R1'8P/-pR'TP)Q5XZ\msk9'u2K>EubBT#:JsW:ogpJb.J]AK#7]AV`"g+
L(5Q=,SK_6MV7mG^>e]AbMrn$U#4N?`8h.&Z'T#u7^0&H1@Rgdb=XU^g:dt?f%DX.XFG09&mI
-Q<UnVs\s#V^kD:tr?rVo'CuVF-Be_$@JTRFD*GBANPs2iZ5"2DU>ir5`4D%KsC^dmK(FG:u
<^;bMc#IFMfhhr`XrgIucYTjZ[F1CV/4dltAiWbummN6$3B5+GJ2jikh%*7U;1DH57A*U4g+
98t9HodaB5(<j(u5Fijm-f&s!1d>fB/gS2sKKl%^j7#`S*+Zs4?B&IP-@&OIip;-MVd+="XC
Yf85?P.>[RlIE/>:''G$1iDU'@[L@IHGFdVn_8[lA4(0dF^_TkV95=$I1:a$5sh0NjSpZGUa
BDP-J6.SQmd4S*XH9^!YY/`"i4=6u"GOOt5N-6jba;9Qc]AH(Qnk&.71q\(*PUh_1cr=$s@.m
BCKJL'udc4\0rO\F3c':OKRd'T8g8;<8Y73f-EMHmjcTST5LA3\Q8IM1bS^9kLLI-J6SZN/1
;5E'_$uVU>D0+Ke=%>i?D,rPWRc_/\kGV(iuA[L>m`0YP?^l.)3G("U_1KB35d7-sNqNH;;l
H+MWVGdF_rhs_^OHQcrJIZPrUG4\2QXtu5hIBc:s^DC`&jrR7)ZWA+!\_dn6W=)TpZQ3+S14
,d]A:teS=-]Ab)&n1d_BXQm-E?4kL4bml2Bl*DM-G/-%-n1G'V"7@/-l_A=SmG+>q/Vu/ch\gh
A?$dO<#$:>k=gAWjHSk[u"Hj3_'_+h&G-D=UB@ZFKQ'2bRTfq@;plubP^is^elN&)S2U(5Cc
S,Ac:=WWsP50AkCVM(j("kM"6bms*9$L"h2LN_D$PSHWYe:FFDY="udIjVi]AXSK+AD!U&7h3
0&Y#WnHNddS9P=2+]Aqrd</M^`0Q7*]A!:p"`AGj)"AL8(e\'02"Pi[3'V"AO0rGDU$D<N-ECS
hQ@kI!Uk(\Y22UhT@eLJ.<3MXZ(1\g%cE.BRT8cUgb\ZT!d&m-id_,E5@tP&8JP8TAr9OZ2a
!s1,+X0`5WpTg$R"CS;B1kc(`J+!"d'0.MfG=]A$h?m4[:a'GbdkK_L.D_rn/NsfDu#IXksa/
_]A8q*iMo;a.[J--7hk$j)S0q!OJZ`!>47tn/5_4Vk/`UWA8Y5WpYQW?YI0cUHdA5N;cX097E
KDGHB9XloWUA$ip-^?*7T]AEt(+^`:,;1<t6]AugfS2(<WNYf;#UM2XH6Vq@1PX0`L!?oRN2YD
-N,(Ut&"dr7Uk5nln4<O#r1ac[$5TBn8p1D-J+#.7f.L(--AtJ?NJlCnET+Oi7MI1IVk\0i>
8<,W)^OWfD3O#Smp.<rY5Re.i.)@u#0aP`oksb8gZQdAp*4`D=7OqRqdpa,r`\fQ="^o&.oA
@X@A=Th$Z9q/1YH\#0K4=^t40=18-O]Ao_?ElZ_q[\=PIc;0gI?(b.FIELf;2U<ur=@;q0WO.
>`1]A[PR93Ye.b`0?*fpUUghJeJqA**-j:cruN_oGr[A.=T6[EcZlQB9uU214L*E`KR\(oFEo
fm'?@QN-eI)EJWVgkI0"kE))V6ia'<0.B1=a26"-7Er&V,)VEH;;_(a;NbJdu`_:%UeGBSXY
4ER!)3qW$TffI_5'h-_i9Z%9gBC?aobJEU;;3j`*+.![>(m@2aSaVRiX*b8Ae.%thK<?2s3"
k.@U=k"<hW`1?`[,oUYZ3iXpoPI(%meTbk\JbK_Ul,F]A+o]An@(s"[;b<uW/(X(Jn-UR<YCX%
!9+-k'"'g2>nlXYP;lTbjt^mAXtZY,l*Z*-/>r%[*T:L^%IK&rgk[n9:Z&%(P/kAjh`096Af
BPLYsP+*2X8EI@p\3,\Wcl!k:oo>^+.?YaoJcj0R]A~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="510"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="960" height="510"/>
<ResolutionScalingAttr percent="1.2"/>
<tabFitAttr index="0" tabNameIndex="0">
<initial>
<Background name="ColorBackground" color="-657931"/>
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
<HC F="0" T="5"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,4724400,4343400,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,0,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,0,0,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,3048000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[姓名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="2" s="0">
<O>
<![CDATA[岗位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" rs="2" s="0">
<O>
<![CDATA[入职日期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" rs="2" s="0">
<O>
<![CDATA[分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" rs="2" s="0">
<O>
<![CDATA[单位类型]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" cs="3" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" cs="3" s="0">
<O>
<![CDATA[店长毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" cs="8" s="0">
<O>
<![CDATA[台量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="0" cs="3" s="0">
<O>
<![CDATA[荣耀手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="0" cs="3" s="0">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="0" cs="3" s="0">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="0" cs="3" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="0" cs="3" s="0">
<O>
<![CDATA[D+手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="0" cs="3" s="0">
<O>
<![CDATA[D+配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="0" cs="3" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="0" cs="3" s="0">
<O>
<![CDATA[回收毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="0" cs="3" s="0">
<O>
<![CDATA[PC平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="0" cs="3" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="0" cs="3" s="0">
<O>
<![CDATA[hi&nova9]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="0" cs="3" s="0">
<O>
<![CDATA[OV米中兴远航天翼一号]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="0" cs="3" s="0">
<O>
<![CDATA[新增天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="0" cs="3" s="0">
<O>
<![CDATA[新增宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="0" cs="3" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="0" cs="3" s="0">
<O>
<![CDATA[5G绑码]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="0" cs="3" s="0">
<O>
<![CDATA[幸福全家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="75" r="0" cs="3" s="0">
<O>
<![CDATA[超旗舰]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="78" r="0" cs="3" s="0">
<O>
<![CDATA[千兆宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="81" r="0" cs="3" s="0">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="0" cs="3" s="0">
<O>
<![CDATA[小赢家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="89" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="90" r="0" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="91" r="0" cs="3" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="94" r="0" cs="3" s="0">
<O>
<![CDATA[新增云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="97" r="0" cs="4" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="101" r="0" cs="3" s="2">
<O>
<![CDATA[门锁]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="3">
<O>
<![CDATA[单位完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="3">
<O>
<![CDATA[单位任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="3">
<O>
<![CDATA[单位完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="4">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
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
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="1" s="1">
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
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="55" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="58" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="61" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="64" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="67" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="70" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="71" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="75" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="76" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="78" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="81" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="87" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="88" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="89" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="90" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="91" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="92" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="93" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="94" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="95" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="96" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="97" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="99" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="100" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="101" r="1" s="2">
<O>
<![CDATA[个人完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="102" r="1" s="2">
<O>
<![CDATA[所在单位完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="tab2th" columnName="name_in_company"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="tab2th" columnName="position_trans"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="tab2th" columnName="entry_date"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="tab2th" columnName="department_trans"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="tab2th" columnName="自定义分类3"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="tab2th" columnName="单位类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="全利润"/>
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
<Expand dir="0"/>
</C>
<C c="7" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="总毛利"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[姓名]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3 / H3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=J3 / K3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="台量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=M3 / N3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="台量"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="2"/>
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
<C c="16" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="智能机"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="2"/>
</Compare>
</Condition>
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
<![CDATA[=if(or(Q3 = 0, len(Q3) = 0), 999, P3 / Q3)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(F3 = "渠道", if(M3 >= 4, M3 * 12, 0), 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(R3 >= 1, 0, if(and(F3 = "渠道", datedif(C3, $end, "D") >= 90, M3 < 4), if(M3 > 0, (4 - M3) * 8, 4 * 20), 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="荣耀"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="荣耀手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="22" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=U3 / V3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="24" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=X3 / Y3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="27" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="28" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AA3 / AB3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="30" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AD3 / AE3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="33" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="34" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AG3 / AH3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="36" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="37" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AJ3 / AK3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="39" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="40" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AM3 / AN3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="42" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="回收毛利"/>
<Complex/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="43" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AP3 / AQ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="2" s="5">
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="47" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="48" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AU3 + AV3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="49" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="PC平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="50" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AW3 / AX3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="52" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="53" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AZ3 / BA3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="55" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="56" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BC3 / BD3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="ov米中远天1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="58" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="OV米中兴远航天翼一号"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="59" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BF3 / BG3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="61" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="62" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BI3 / BJ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="64" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="65" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BL3 / BM3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="67" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="68" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BO3 / BP3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="70" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="5G绑码"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="71" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BR3 / BS3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="73" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="幸福全家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="74" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BU3 / BV3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="75" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="76" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="77" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BX3 / BY3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="78" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="79" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="80" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CA3 / CB3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="81" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="82" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="83" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CD3 / CE3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="小赢家增利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="85" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="86" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CG3 + CH3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="87" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="小赢家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="88" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CI3 / CJ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="89" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="90" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="91" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CL3 + CM3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="92" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="93" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CN3 / CO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="94" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="95" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="96" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CQ3 / CR3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="97" r="2" s="7">
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="2" s="7">
<PrivilegeControl/>
<Expand/>
</C>
<C c="99" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="personal" columnName="手机数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="100" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(and(F3 = "厅店", cv = 0, len(cv) = 0), if(B3 = "店长", 30, 50), 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="101" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="personal" columnName="门锁"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="102" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="门锁"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[单位]]></CNAME>
<Compare op="0">
<ColumnRow column="3" row="2"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="103" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(and(f3="渠道",b3="班长",cy3>=4),100,if(cx3>=4,100,0))]]></Attributes>
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
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="1" size="72"/>
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
<Background name="NullBackground"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657931"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="NullBackground"/>
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
<![CDATA[m<f@J;t^.i6*+e^Q</"%ZE9iVs5#"g72Xc-;^tEq/$B7QTq$ik@DI+K)eMZIKkX\g#fEU<f4
6?A'*apq3g>C/;$W'ILkBOu[K1_a4+$`EYfD+NE*nq*p\XttqVif2kO<opI,:LikPbCO^%h5
Z[?36dR.gR\!&Ir,q5$"N?tq:o9W=V,5P!+j9fb97,_,@,9/!rCEHG#GAb7<[Q."?:pFR;Bi
&*Xd`Lu+4;4FKNX=!<srV:54r83N(*VY'U`Xi+E>Md#@T=:H->]Ai"BJ)Tr4lf4__M]AXrnqWA
Lrfd:c`bk^(MgKR?IS,$mN`PT);k4-B-G=K?ROQ0kfQ0HK%PY5K)]A^0Er7*mu]A=lOI+,[O^Z
]Apk"8fL[.,^2V]A<2I0*Cc6_Pe^;\8;+^b)gS7ZW%FuXZ`F'W:j+(*t+(aai9n*,"HO(MSYQ>
ujr=$6Tl`eUG;s(UZs+;Ac()Ke!_%?4r)8&52`fsCNk4D8#0-S%:$.*,Mr6Q2WF:JPP!Kl#a
`!dI;?!Oa"N"W<D9cBp[H&Su=*=I0(C&_L>\2I'aET,Z/_Y9m^&pAW;OMd4s@b*LeCF-3_Z[
4?bA^tPcPSV$DB7.QYR<WMU&fB*?[l/N#TX3X1cei)SpWS`1);ORCES^MY0EfNZJZXjnsbh8
[T<^t(h-bT'3.cS7s:a)=7g(9cP[a+POSNfg<-.*n-[-W;]Ak;4kUXk!\@s!H(eFPsHM-b)d:
BA'p=?sCT]A/I-<Ak4Jc0.[A8%,Q6riAQ?-P]AU#H33Kes9`il,F#J\BQl.Y*Xe+^iJX2Mg(b3
X#jnJ5=JI1N/*D=/:p-i'fE!*Q#H:7I;10'd,Q(9)J9YBM\ejuFBnoM&ZN@Zf8d9"P$"il]A(
>?fn_s,.;Dipa!:rEr+C@5^UcK`N.O95u*GZd9tZoE^<dP8!L;jF&0p+b78(E?_pgV%^aPFe
$]A]A!&W$1a!5_EQVSR8g:Yq_9jRG]AtAC#=JH-)BfdFKW%C3WJ._:u_P.XfE0ll[9$_@N,/%m*
g>@%$95GN6A/8l5NP\f(<FFl0Qc"WlOPZ0c?,dP`X(!5Pq\13O>X>?<&3/6>FAjA5-=<6M`3
YLWrnadi`^IkW7sHr3QP/,s>p]A0_<IUqFd,&MSfD73XS`6)qaeYP^C-@6g.u>.=0t;RT;%e2
!V,,=`XI_6Ol&`oW-F)mp&4Mr.2i-S+q2%!.KO?7)isA=eb5=#UBXFsk[_lg3X^c7fU[kOgX
W[653$-?&&Er,c=\fAlF7KY4ahO<PidP6?Zc?(4Y.a6OuF<I0`0\Fr5:"]AI8&a+`i/9N?)n@
.9YD5Z=(e>KlBKi4)$GKHh.4HH!D]A,76?<J5Q+CmjW'jFd-BYQuW*3ful+N#:`^L)s4"n_".
?XD>)59:1YDunQWMS6GbH[3e*?H=Ct3l%%O'q`mOskSOmN"`tjg('Q2rO7S&XP1cQ*XqNo2M
'[I'.2E<gB/@earSYVu]A8?ZFXCC7gpa0iAG64b[e08/f*l.6&IM7(@sGZ/,ApI9H^!rM?AW@
QgAn36a>Hm;'NH#IT_l>n#B*qW.]AT3.sQSU]Amm<fSuWf/HCq%22r<I^RTM_Kh$U-&(q*Kf+.
DkH*.egHQbMH%h@qFJMZgnPDP9Gp'ise0WlHc$dZ_VC_h!.c^Q*9>S*mrA<uiVuhb7i]A*5d"
VK%Tq6"KOJuJB'&oYpk_WPM"+?SpJC<YNuUU&1i`o/nc;3oPn<Hr@m#.2@@%)t!RNY#HmV_4
De@XFkt<i&dD;7eaB9.1Ssqn6\Kl>jU_=f;!BU*;QlZNM/:\g-B,Vb9D2W`X3UU,mARl1ua5
`D(QjAGndRWbk5V.1Z*PBI<7YFc15#%1j0Ri<k[CM]Ae$-<1sBf)4J,UNhukYCZ.e_V3V2*32
`?73-BA+KDS%@'rJX,j/gBJ4Cto<F.UH.+NrU[Mp#C$G_%`PW$;Bs2I=Uq/JHM?[I[=kBj-*
hmpB6h!jK5;,hG#3WXo`d9cWs+nk.c&8_u'CpVRF7Q1(GRP!5mB]AY@J*-Z;V!+6)J7LWAX?'
$dD/B[;O)anm93]ACi>%.DT.bX#eq!DigUA$96%.D4C5:%*u,t7)1*]Ah\Pui9b*I]AF`I>'rCc
<pJ%^t%eGBI/"^_p,h)W4I[GY#0PJMZhjN%]A;Dn&-A?fQIhnJjGG.K!6Tc<L`@qg!Frb<G#;
K=9ZT0I&A'a(DEo<7Qij-&9`BD-;mE&X\aEm91B+2']AIjLl'R\qFaA_F?KuO-4I';*RNN)&m
l^iKR5:1Xop?i$6huVD%G!laXTg@a":0W9"ZH,@bQq0'ePZ6rTn/.#Cb)ukd,c=[n1FNLGO?
]A'Ng<L^&Fl+cFOt<3N!94b3pM6C*!1)UBWN@1@!T%8)id&FW'b19^`AKm3<%cHbiCHl#D-W>
8J%!,@mCS`Dr'D%.BD4S7l*bi>0>U?j%1VlKcghjr]A65Hl9M6nCl%*k.LKT0HSV1c/t9RIob
%55S+V>LIbB`j_6NG@^p3iI,<bor=4Z6j/!9]A?=K#>"\m7!8:=5r8G(+iX[k/)"@6=9SsXi9
f`%]AjWA,8QS:0UBJtM^$o&J;.A./?>VfV+c%)IP%B#UF@@-&_,P%)7/%-flPAG@=k=R7VWI8
PfnT(t`]ADCeN)a)+HseCC#]A"H5'016AN(J:p`O*?G3h6'c1(\ERI2hMVM0iZ&h=0jl_QH<hM
^R]A8CAQ&'Cfet\ZL9-CH7koSoNaV;lte0!*Q%;H2RpQ:U%A&DR^r7l$YT6@9Gd&Rl1S2N?_r
H>'cRFNKV>UOl&@P_3F%;leG3V0j"S.K2^Fepc2B&+k:2V'h9*>t1QRY0=1ac,1$L6!'P#P<
N+H8OL(2)H=gard\0f?sZ"WMV/$oaXLO"-1ij)i'dlPnZal'%nG?'G+Q]A[l#Ldiq`5HQMGZN
@1htoE)oGonl4-/C?gAqS-osq"F>i1%uH\iAMX/FXKIPsA!ofAd6=#,.4<#5^6BefbY7"HNm
+nX4@e0SBh8fgEpQIWnZ'(50SUggL3Qq/^mL0*MV$oc:sV^LKV2$.BNL55Hr70'=NL9<$"uH
No*\]AM]A)q3e]AXU\a4d-m9n$#J9"_m^n[FZG)AI8bU2YtN3XIus2&!.&'C3g!XXk.^dZF\!tO
K+q01muuAIWk(ckHJ/8cP=JIQp:rN-@tipC8:0XUr$Y+&5,u:^(G=p93K&Wc!^N(;+_%o98e
%a3M*3V#18b`_tPU5REgB_G5Saq;R7Rfe_%rGGKioeV2Y\G93r;O:2DgeL25k!EY5]AfrV:3?
[BE"Y:MkHhW[6s+aI9BU1SH"qqf9PSBqW^d220RO<q;W1_abEh,qTVl%!s.QK*UNCpRW&eX6
C\/S!T4/U.*r(_jY<-5&K5PFR#*[`W]ANaVe$b=E8A,g4A0Hl,_@/IAs%mH6EjfSSqSR;4"q9
<1#XA^L<,r9h_dNu[,%=".kkB(O)'Q1$/21gBs.oj1:OV4=AEPQi*p"hA5/=Z$FoUp$t;Wee
GW#s^YgEnD=,eDf<hF6<d4k>2B9#*QUg4Bpm?SU1toKVAN:#uYMJQ+#;+N?1fGiUiqC3LG<)
B!WbIs)mg@@9HoYi+3huEND(tUUj,lTTEDuWH6mCD70?Esfi>H'N6He7oDq=a5_f=Rtlue>6
=cVSRLL-'-St`u3cs5$LIFUngQelGPAcV;e>B8uUpf;-Vp_5m(?oCEC?>7-W,QpWVZJWqok$
cl.H1Ri%Nf8+5+[Jo9[")IJn@9BFc=b\!(Vd97l)P8Z&TJF,-'<Ge.0k]A)4jUDb2uLD+iRdn
q`1H.pr)d.P^[ru*"!;a_qE-ptqUS2-L=)Z>_]An$[l@#Nh-25e@)q;;N8QVcu^GC)X/rXK_7
-k&cprV9334#G?KMiNtq%*s7'[)H!DP3@QgQXMDPc&\<WqOJBASb_F'M8MC?s>gu:8g*WTu2
Mc+&WfWfF6tPiI6gUe3CKSi1EkPhHN8hPY_MTGh?EVGu31$[<3!nY'lc#l*t,eT@5BNG<Deh
daSQ4ZK5&>UaWabe_FXF*n+?R<bG*2]An4F-'C:A)&,]A_@Z.K0BNIa2L&Ko]A7M"o`j]A^?iW%B
c32m;4^l]Aq@%N0,;j*jj_NDoX&Fr6tI]APO,5&nR@IE@=`#q&-*DGF&\rbcHVWs/r`J7S#1<b
uJ^9K-9c`-E8.^;ZJF-Mf/n`)T27AM!a+K"h4DUFHi-L@h<'',aA(9*i!`2!a?oYl%c(7d9\
@]A\LpUJ0,8g=C,=8cS=S)Z^&QheQ/G^5kOePRpa!,N>UN]AJ52Qh,nMmcel`]AB\)Ig5qtf>*G
T66mb_o_=sa<SZ6[['$Bt;);5.W;6OV8R%(U<h2YFIk3_9=Br0sX-kV0]AeK(#m1Ajdq[Nd8l
=?OfG;%PgVa")$2k1V8bP,,^cL':\9g(r;=#^m?B`euKi<LE7P:dP.Io$L3NYJ-'n$ucAOF3
OPscC%A94/9)S3CcLm*gfg`>Es>R_7>Z=gGL?&3%aiZD8n'+VuPj@CpMa,hu#;X+u5VNPB+N
83F@=uN?9%^,n-=h'gA/]AF3Nd4ad+-J+\\9r5_leNAeqd!@J`(2Df"^kSS`I1@ON;NBWWp)d
g@CXKBpP7D&se^E;dP]AmXPY4@=@n(S6EU9c4-uC@,2ad;o;n6]AtWF,(2^pIeo\FAC@%5S]Au=
";hGK]A@\->=&E0`g6X]A6YY'oEXcVuEO8T;A*#M/.nA&`p:@F!U$lrZ2XRH=c.n<e.u^H96ec
dA7KN#*)W0%l7<m-sC[lq"a*XCCC_B[Bm[H2OuXq$.aq$2l6fdGrp=X>oZb@r@tlp:+.fWeQ
.h4j(=JK;'>HY_6H+cUP+99-^"oQGi&*&ndoPKQi#;Fm=V%X>UTPS=R-Kh:gR1eOMlTG.d-n
+3&3\YHVM"HTm.9Y01u>(*U1%<.EI0W#o&4$&rEcd.FWSN9PJRhb+JTg)2Sf/Iu5M:G0cCD.
7Lo4!gjg+h]Ab8)","t@[RtU5BGQZ.>3iRS/bmIIjCV#cSYLQ$159_,7KVIX9ug>WC2-bQ&J8
9eb"iJ$Ga6B\f=2$6UDd17jg>?unQ?a)-:'*8p[p,mU<@VrAJqBo7C\DXp-m#5</KYRFFHB]A
iFT5UR?Zr_lO*aDkGIj*(QFXeQFP4sbHjd^aBlgL4$g1=KV4r_V$G,Kno%[gNpF34I'T3d1E
rT@5)Q\:]AYYO\a1u=jZN\tFQ<E*kBRf\+QZO>C7NjoIOn2!gr&OM:P.7%db00J^:GO&2U!W$
9P0>KSln?qo6k1MpJZp4N0XeCTbc?3`'7!Pnm\O9a%S7@h2OGIk_L)9h)/GMeeMB!!JsiM_1
'WlY\s;d/N`HD(!KP(@l/5[D7>)=9`Fc[#2=DJpJpGE?Kn^pYPpSZiEWZmeTqGP4r!Zb[9Nt
a46HebE"e):ldq'/oF)CBB%@Eg90.q(HLA%`Qb4V&RA_CSM.L/P5SsL))@]AVN"\ge=,MX-3)
j[$u7L>;pG?9h;3K\Z&q^81oIQ[=t5@Y^<q)!nRr*"N1k0'Z:f,_:pZr"XrS$f_]A#R5r&dQ[
-);:s%s-,Ug"N1`C]AaO+?Q&S:M19?8G("1fhO%N;eX:FS4>h$ID5W7)T=AIJHf&$JKXlhEX!
^\3iiN6RJi]AL#6esra&.MW+%,]A<%-<<]A")WL#us(q=c)pEn*TKMX3J3?ot1G#g9"L"I:t<&&
8uJU^eGJ";9B(8828MhFp7#7U01k#3DO.k-DneVDTaZX-ah95bnEtcN-ZQe$&sATif)3_pIG
"i0o*dsFU/,%1S&hl_a'=Pa9.-!1HnQ1Xki94HJOmQ&PXblAG;uX^_5pIKgIq'n@uCsG=k!L
IVK&-pT<T858b:[]AG(;#,Ip$$V.HU=O@K]AdN?Wg,-7$U]A`4d-iFPk;u+KpO[k&Te%M/)5J=$
-PNlm=@jO&-H>E98(b;XfM$jOgrEWcGqt!5P@oGa+N`B3fr",/Go:N<kiZ92g[6,"VP*]AC%K
;(Pm^WO5Ua36br6@dC?I1;._1er.nnM-KY$EVoE$iUVkIt=UgPBOtYeWKa"9Q5MDMMfBo=o+
t"UJZq&95H8RZ%Qg,XBota/9>QK_3S+A+.Ll(&7/OUf'E`0k#7/?-$3UWK1%:"`gUZ2WiMr,
h48Su$O;E3i6k=I)W4"O<tfdB.0[[dJ^:W$Sp7ScA=iAdQlk8Q"9d`CjM;9_en8HI54&?8il
ae+aH)H-r#HT<)6EJV`=l'Q!SH:e4VW2AcPg0*#aY3$E8.1'FF_/PE4dER]AK.?)GMLc[gORq
!PWhpdd7EB%X4&)Y(W$qT0E&BF-^OR7A"mnhO4LfX9`1t=Ef_*ei7Nd?o@l(a"-ece1,6U'B
\<-^8l3%^I0[p/S#)do#aUGT6Y*,C"'@9b!SMD*A`o5e!=VFDkdD;oQaPp)A.aC<gi6DSe]AY
Ji<V,qAb_0fFAb<D__4:+=Kj;HMWjAsMB@NQfdtP*KX.L]AbD,'Tl'eaH,`TNO-\k#<`ZH5.Q
'+ThMltI&DJW8cM[8`HCKMBI^R'(?Ug"H!$4j!5Kt?7YgU+rC_9<3\6t%D@"M0XWh99klBh2
D[bm`/1(%&Q`]AdG-fr3bdYGd.@gbsn\a^VA,eY*FB+&Jgiq#j!:Ecc[X&bka]ATs"+B$[9@He
DHdcl%jEXB7AApm%sUGDL8pFXLS!E>V?s3EH9'.:I2;]A@E>4XDS;!%1U/iEOFXhs2JHMhuZE
WfMs``gY+_p8%X`Nn#kruJi=jXa;!To]A^<j5h.k<H_AL.T(#;DqMR<d(ilfUqfdhGh*eNphC
rm>Cj.]AG3&+Y!G4Gum&[5[&_6LN;4CqmrZr547BKp'c&IZ2KOduZ"b3BEVsE@^iP<bY#QO5h
GtI!h%>i'JD9T-eR'4rT$@Q4:rlOA/;ll*t/[<lH#G<a(4e82n79KrYYjB27n7/X?P4T_%Uk
C6N1aMCpFJM&5q(`!3(/Z@fO?lmq>mep%mT05.HWpK[Jol4^:m,?q[`i)(\I]AS#i"1jfW5B.
s@%qNgrY'TPBGN+Cu!9/;@fJ>pgl=+r@-M\<9"-97@H'cA3256&HoVg!aD:_mt%WQqUuiX@W
q+4be1g!eq7b,#t)4Cessn4:]A`jkC!A[*%_Aml"O2"BnR<r6RW8RncHGKLXO@HXfY(/;SslS
ZWr(K<JHsDWs?8M1>amZNNI4OL<rl[`RktW]AHD6b;Me.:A:AgQ-p-+gD6\q>k3Q83mX#!)Wu
JP.8q6+'LKk[aS?V)bHb?\.MdYC='i0IT".Z?gfqiHN`sF>\uf4FSrq<4)q"PL[ZD+9lj#So
B8L(7,(ik]Am4q01`ObW;KD[ts[!qE5_ON+\iR-@ra;2OUmDGiKNjK@_Np4i4R[t&Xj#]A#Ea_
%059uT,#rVH,_9SXMVBs9>8EVTcK+:EYa6pjq&QU>#0OS6/`@e7eL&[e9;i%$(4DG!UsO=d@
.eXMM475Cp.S!`<kn:kf\g",ZbJRaSk;:cGB6PE'#.WHh`XZ[5b96&?p`R2&u(`I3d2]A2hr*
$*lbNQRpm8%lL&gD>Ht%0C\fr9fFC?lLZK*F)_c7K,!t;"]AXuf:ZO53b$AH`Vt"k=W`BOfFo
[jY9JQ%R87.VMD#5;\sPS.LPQ20m%I0^Ri0NDqNoK%pFYK*VJLlrOL+_6h7,n;BTRAkFQ,=^
4`dY$8Wg<3CCM:4\2djRZcgESfP3IjhR/4-h7L=hgFLdc`!o:`g2:6]A4+$9>g.rF':Ti3e,M
O(2BcI!<!bule\Y[DD?6756YoXc]A!NSZKf_KEe7l!#\l8Zf0NA1Lh&f/oi3n.n/Fkpq;X"t;
?cS>M0C&m"ni@Q3_d.=\XS='c]AKB)Q&Zu7]A]A7fQ8RP/fRLjK'2T&-#8QM9R(2e=H>t:DIl>b
80":&AB>Q_$.F*<I*5%48rW<jU'D1BH^o8%j*hPo-0K+(E)UMPkWNQjj4K5bZXP=%u%CgJp1
r4VZ`Wr8$Z/T+1KNf-##6t.[fjAR.tjE5Tl9Q-*0Y&3tF_r`fdD!%aA]Aq+hL;a9;Z.eOPs5o
id-f6\:G#"nB!U0@J969Q@g=:bt?@$GDkuj$,e4$UIQ);Al)*BF80WY#jX4*XXO_]An$D/ajQ
._Oj#0CK.\,ChV!?0/Z+i@HYflp[aOZA/@,W:4U"'E8e`%^.bOshSC`^Xa4h]A)k4_OY6TTue
heoTgA]AA=*;mabff\#MOuU\nNm0MELK"p">Q\ap[KpG5>1*&-IKU*6,<nFY6fOWiREKNPgU]A
#Y`G-?FN4P*"euCq1k_Q@D6td-569P2sRK=X+mB=J/H.Q=bW^Mq8tIe96(lj1R5O$/a[tTR)
)_F>SVO?`m^-Bdh/a5tZ*e5euB.g#\cFlXb`ahd>^IhuFsb/5E8[%WK/A,W@["jl6JV,gBtH
00gg?'2[l;_7s1:,tR;`$I6g]Ao0YUp-,b`I0"o9Sf9-m7cbFP>pan.?Rca]A`^ON4#F?gWFjs
d(5mA%?RbIBgifH'PtMXAV7IP,<;c#StW$%G\#B8,'#r0)/!]AiI;kK.Y=dNTaUb6l`Y5J>#6
14Il#Jbs1ETn;=qR(.u0hCumPb_A%bSZFJ@<g8V+B=1tcjAI=.CT.e8F[F\i?qn)IB%rdZ&#
1$%ACbRdjMSGdUHbF1(dkJ"3/@f*to,fQ-l1"*4lcRE1qK(Yt`P]A#Xl[7R]A+\NCl$8[0><U#
5m0rI)PgeN:7:6p':[Y%e"pB7nOU#rCF:P/i=T3HP8N"t6[Gbb3p*ouu)H6Z(TW30pc:ZlQ%
*UZQr.7XMocde<Adb9AV)+]A1@S#=oHRrUJIOf_Z+YAIQG/hf]AB6o=KhgofGm>!B=W=&0g;2%
iMfX<C=^S>(bs!;G3t;XtNM#IWBdZO;$t[;UZ?GotN\HDmu/epC@%F_I!I/jX;`AGJP[7BJI
I(nggZO`@%CiF^$jCpJNaMl,R3_)]A3)#>\XSh'eJ<p)7/hZ7OkDec5=k=kWigI([*9$*gR^O
p?3C^lAt8k3E8dE:&"teP5)K/3eC[hRD"BYAO2oVc`JQ=!3k]AWTSX%YN0]Aj\"AeJrUf/shDR
)WkB_SC;jm:]AGPEtgYML1Dir,APf7;+I@(#`k!NPn$ds+UPHpCtU*3M#$1-BsoH@\;*e"@Cr
L;2>+Y`e1VASV%([GN($"CV@RPho8=fW71@C>jJtL/g7JN"?m`c>mn6$Y0u+.Ed$$"3ZJ70+
oQ7g[J3XO3=K3eX=sn5MMMfEg9cmTaA4IZ-(oqbPm&M4hO[*2Fl3j6@FP4^38R'ASbUN\Nm-
'Vjg.?;Tr0&bt\\lYjH4`0^F<S`-6j-`[G,s:'H)+$HrA.&`ZXt?[4PC-W"N[BlS7A/*HV;C
8B)b_.n2i]AV%Al:serHb&h`)b(AL%H12'F]A/l;3cXhQ'ERLRk%2mL4CM%uc26T:1,dnW#U,B
&mfTg8rP$BTXQ)AjH=,e())her\<I76KURG6)EM?#8MG8%9l)L.t-H#TB&*8`c[l1olpUL`d
aF/)c+P9E6]A^1$6VjO5,0:ac]A9KPD%"i+$9=KFQG9sKD7D70!4!W=m.iNqn)e\&HH,@Iq*e$
!RD$'jA923;?T&"l.#pqR;,%=_V&K8C.)q$@7'9;3XOW,18@63!BNca!ogdPN>0+pgO)Lc>W
=3dA@6)6adJUV0:-\2pjZCkN=AVX5?u%q:n:ee'=dD68`^V)m%VTY,PaGoYLlUE<kH&g&;VF
BqW&rWTTXPWErbP'uh'$)pqo3\Df*WQU>P&:<4:Ujkqj'IoRTe>Df(DGTCpaVotSCtM,ofMS
X?%Tq8D?f45aCT!uW>8$AF)$KSgNd/DVMcQ7e;8PtNIj^%oAV0VY!YG^,H<dkE8tp#fOlpD$
3o2s^&t3"66q"F+)t,O:EJj)U\t!nbKrgm<Olu['BgALeM-rJ+%e99UGOT'0a1;f`?`Ao."'
pfV+):Qn6e4^ggs+>'iS*#&ig;:"L_,bTJ9Smp2b/e@6tCLdAtNZF^(:$2,I+ji.E=K?Zh#$
8WBpeVb)WNBVOe6*%99_tg>\$;m7r,e8_!j!h5COIqYZ0ieJU7B9(S$_PLFn>TfERKS'H:6X
#\QM0B(KcjjpC"mCFOTj)"&KD$eH%SnX9Yd;2%uR`kr@]AOr9b95=A%jH5%X0cn5]AX"&'I,)J
^JZUe7'0+8R-e(N'>p)La`_E(c8<["KplQkmB3o#ro\Gi`)"*nX</9[HrC4sMho@i@Jm\be;
<d&h*$G"&d*t1_'<>,%S(7ELnK=^dr*0REdOOWZje7D9tP\Qgl`lRkj^:n$9oD4Hb^@Ss?>O
sO?]AI+T:%i"MhPUc24Z\0AtI@80X+^:;&m?XgOEl^I,M'GWEiN@bINjImCU^)OH5!9M"hpH1
WGgH:O]As(^N=B7.=j>2sj'm[K$mpd3>3plaYgt&LB0HdIc@D/B$&t:ngLaU;dAbRSr%ubqb!
QI,u!1)/2rf,+WhOoEnY)rBhckca>C^50T+uK]AQC`$r$'9LMlVY<m,7#6Y%LhPia>O[0Fa)`
fs/$Ua.C9A^bIRDMt:n]AA:A=G)]AUk:BN;7mgnG=r<<(%AeeAjKk!;XX,h#9\k\-]A/u8?JioK
5$'qPE&10B_d847F@ocJIqcX7n,Xkf$9F`qT388-IPUUi/fdiu1h]A)HBFr5^NUIP.\%hV0YO
fckBX_l'<@6@]AJ^eo\@e;)UB?[%inNU>^qVuutTQ8c]AbGl%B^u1X<>\iMX!q1Rpp/:VP?oHT
mnXF=mm/b#/093`A5AMWVZ?Q6/RWU\MpQ8r!YA4Lu[mVe:/Gr`>ps7i''^IYuIs&Z]A=G`%:V
>RUi1>Ol&%^Zo`Yua-_EoUJ&G(EK^RqlE`:/"%eL5O5m>r2";=5nd!!n-#DJgLuG$l2Z2QCc
X%7/@`Y=7)T2#an+0_dih^1F%#>M+;h2QV7/RX.m3=oLWM7*Lk5qNEA#5l2(@.3CR*qSBh@R
QV>&iR$1eTdeW8DNdJ^ZFHq<l*4I&\3WAS=*5jrkrQVb%H!4V1bWEf3N&8=21c1Frn:'-X'*
kT>nJVX6L"pAKllcD4`caqqhc&9,6"km'U*XqX(m*k3)ZUT8UY^XemA@=KkBR.C+_0`&jXu#
PY3ktEPl+*8i48g-[2fpimq7;"Kb41/(eXE1_>kb:hBAof*r>#[!;`:YT$4TH-G`b-_0n.Og
3[LW+V[oB3mN*N&_4h#=l/JRT:]A?36NuMkm*e]A"5D2GQ36L<GTPW-QE+8rG>_l]A(cg4C&TBJ
BVOK&,HADG%sI,#7I1sPHan1"3,'*gMq'Estqo\*Rof09>SjkYCVL5(GWcnEf3(?nXrm@6uq
Cd-!)fg+hf*ndVV:CGUd;@!3J#_+,).gZ4Nd67's1W[`r:0qYujL+QVLWQLUKcW3A(6q/Up#
d-dkLJeeje4S0KQ]AtbUkep]A2;m=)l`ZqVcltEGr_H'&;4!n;MT08[onJ*[rM%!4l'e#RnG-E
AmsD:L"9K`I2]AK0"?1X97O3&1"7A/Ho$'=P)rYg:<`^ugJA"615dK'+`o^!CAH3*u)8QNM'r
1m=[QLnS'pUO.8Ei]ADed-T*7PK#=H5gKt8;I`Wt-kH@5+!5'OL8U^oq5u3c-)"Im]A8!4TSBG
u@#TV+up%D$g[1B%Pr"cM2n[RqQ:V@K#K)nLIGPRTn^&#LieKb6^An=-<Hq7=niZ\uTHf:QS
r%m?W6sSeepiX2]AFSR3'deE4..pe<oM3B@S'gNPh+,Runs8*/f@8''#A5%MLdikkSDNYV]AhL
/1Wr>AL,4!qp/7H'huVLZctD@Gh?[6dL8;mT9t96DC>J^ei+?*f0MNUC&.!1l2cq#M5R'HkU
`V#(kVR/@2dA"8m>foZ))]A_J[QW1tM^#CGWSiK*2rnoV\D]A-"B%Qn$FS3$6.a_#Q`Ck^T7qd
4q,8aM0PbcbUI'`Wn4_R3^p[LAa.nLJ`VG!;cJXd_C(a%j>s2asklf\<&)2JAF;O:8.Y^9==
(B-6dW5Wt%S<rST%>1E7b'GodceW5C=`:,)[+'9)(Y'+Ag#M+K+.9R#HN#"cKUGfod[TKqh+
,JB%nE2s.R?%[TH/I.,T3"#FHTTY8jd)cP"l=*WH/(.O:cOdWP)"&HQrO8^WO6*Di:F=&ld`
sZAkNPF!n=S6Z5;m`UX!icl\g;/-/3rm?<kgRU%WiRKAnOuODsYR`_?,q+S&.$F0B/Qlphs>
h&p=a190>:-MmVM7G'H*/XaFq?2rU9(NQilm]AI%tDohI0e\GgmA8lT>551&7VW><0sWQUek$
$,c1!laBJ1+RINP;TId=Y;#cSo=D-q?H?RahW#>T7DdVPt`IZ*lDStn_WakG:pQ?E@24j,9o
lKm"i,j]AjjO1CZR^8rVpY-qkW3F%>LY)OW/#1m\_FHUgq'Ik"[]Am`mjZ?\-a@;GYbUC^M66a
qoMp5`*tGZ[ifbKTh,_IX<[7$<"kp;U:*Sf67N*11kboT;XYQpoQ1uaAlJ)dc;W%_ZFP>9mE
[gg+8_-rR++:1(p/nK/cMS$Gnc_Prqd^#+#I^e&Ie=jc$lXa4L6-;'NSZS,>X/dKQ"I7qM@Z
*.Sdnem)GfLHu9?beT?KRO36l6<$6#&]Ap"OBj!<]A@n]Au4m#$j+VW!<MY\D1h(`c>EEFA0Dn&
nrsOpSk!&FHFEFXP/&tVoGF&d>2uk.T(uX'aMb;MiR?jC^-WMo$EA?8IUl<b4I/BTTB*0o71
q#RTJUW$abmN[dni>LqGj1=5b+D\=Deeg$q.Ya--WI:PigW.Mkd[mpp5XjfKI#Q4V#iM5g[g
]At)B&TQPZ:!@[239Yfu,L1o:/)]AmMjQM!$E),<q+BqBjG90k*B>W.%'Ku;jPb[rI6#V/AK9P
"eJ+X$(W+q(V-q.#U481t89*M.[_erI2N0mqEis/+ZA`=]A`A#UQZDHs:(&#\/A6n$U8LD+u)
%!;bmX*<gWKq)3#%ZgITKcR),,cM<fIgX$]ApefL4S^B`n.NV0oJo;e_f5+F]AGIaTf>e;5nq8
)B!/cHit\n*>2oo:^;K`T)5=7=AWCI8G<t<82J:_.uo<C%/l=<X!RPp[7<U0JPpQ[UR4kfH9
DTSMcgR@%Jrc'ecc>9aFF'YTj*FbrO*U2(5qOIuLAB3?3[k'P!pa_L_kfa-fMZf!+fse-!:e
VHO\^Q/&<@\/C8T[pX9^p^ooQld4I(4J>8tW\)8a'i2.YUcZ[h`_II/DmGt_HL[SCr"EWdbk
=4_)-ZAiXlVabX_$ARA7L%lA\KnkTbQ!B&@6hU0YJ;$JHmA`b5Ft:k3SdT[r7j3nAZ,@R[Fa
M5.Vdp5U#p!'$t,boCmU(Wr!HiQQEp?WB.VBS*910e?9^5(DlorWAc>2m_%Zoje$*eNATg`W
963tAHB>?]A,["Vs85B7#@^40VIComap(Y]AN)E='4hgeh9#^"(Qj_?S?N'f4J%.Vfrg1ME%")
O;X0]A)N*ibMHrb'd5["8+<c:UKs]An5T4@a4ZfK5p%aKDu^mgb6^Wh0Dj<h!qSk0>7UcejNHd
Vp+'fq/)*J-X4%ThblT%Vmdr;A3PhZ;ET7E0Y]A^&g2+RTb%H(Yqlsl(Xf%fj="'0cJ5nk9*V
kpJR?C;bIp:EbI6Zt'CBn!f3V\q16*BMH;iJ]AhOp_Hn.MHE(8iLa[Q46g:JsEga>g+=92u[0
jgOn:ILZ\]AG5ni.^&0&H<W[86ElpJ8*3;nfrU%Ehei#S^>'R9?(KJC[<o$d=^%*Cg@-N7BZQ
i6hN1-)8T020#")'T>bT:9fK8,VIuR4n_90r7\%NLg%W3W[:%VXI*F(]Ak/V#XnatEn8=Y@d]A
_<.2<Onc"Qk4&TbXoPs,YLURmBu?RF^B4KL%s<eLgjY`TZN.W=<NLA^-P0Eb&uN#IAYI,,ur
3B2!mYuEur(M,$IIbUaWNRUF[J9lDTR,+8!gRV39bP_0/9'-._LF1mP7PGr$4)s@<JTkIkYd
Cc&j[XN'Vj6QMEYfNM8`<^(@**7[o=Oh6Z[phPlNmS+Vn^+YN,\rZg:Q<+@J.S5+D\(dPjrF
Ql(u$N1iQR#&*n,Sgm9B3UDmF5IX:P&WT:5_5dj#Gq!03lR#Mk#<,0#9U`-^P8df>7"ujTHH
!'bj<\pAsc&0;1]AH/iVFO<YJ/s.i6pAa))mn7Y45Yfq:aXPJHgN:JA"CVIp+j[c0,fe*DTV=
sbU`.Q`F?Kmtki`T*"_FP5Y.9`Qd,Ib4D#3![\5?kH35c:#HK]AjVLU+kbI'ePLSZ&P>$M6G9
8c;<7E^0N_-m/g"5k!Gn85$RPL,\GfDMk(ZiB%GQd\P\pa^rLhV'B7+SNE:lNZ&cT8d4(RN0
'$LFi7ZD*\_q[[k`H`2=Z]As.Jh:&1BJTeXsd$;DDc^hSZYZkC82RYc!?O"Z=VXT01_R<HYJW
^"iPi$h`ts5#_'e)k8Mk<.E/ipb#dG.NfYUV)RtW'1D,nF-'Cq2DjPuAn-5YQ%:U.oS+Zf(\
^T)hN<k]Ac63O4?pXl\"R6"KZ!)7oR^I,r(mdC*nG=HZ`J96aI^6)j/`Ki37IP8`o!sTp;q]A+
p\[b]ARA*"%>*p`4!SD\D,WN_[56Ui<h3G7`;=_4fuj">0a"Hg?:2<Mdl,S)Ti0IR-fdLofIr
X>7E>&#%)M7*V/QTG6,9;UKl>DCiD+9HL2-^$r)RBrTRG6im)7-<uW13sl`tb2"@GTbe8<\:
mY*)Gk'C9EM+/P3\Qg0o9gf)).#"XFOP6]A'_dOZ]A-Nilp/Oe?@r9VT_79cPbE.m.;pL^%6Hm
=_*^3]A`2gE3V^L8`B7J>ALRI`US?$f.8,sPM+X2q9eH752CAb:ETB139&4b)2M*frnJCGhZ"
T^Ml<Jr1Y0f73TEhV-7GS9O\AmF?Y+SpkFl9A7[n""Ls0n-"SS@C^4a`W`lD%-]A2J$5qWqbm
6JRm6hc~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="510"/>
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
<![CDATA[1008000,1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,0,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,0,0,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" rs="2" s="0">
<O>
<![CDATA[姓名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" rs="2" s="0">
<O>
<![CDATA[单位]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" cs="3" s="0">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" cs="3" s="0">
<O>
<![CDATA[店长毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" cs="3" s="0">
<O>
<![CDATA[智能机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" cs="3" s="0">
<O>
<![CDATA[荣耀手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" cs="3" s="0">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="0" cs="3" s="0">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="0" cs="3" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="0" cs="3" s="0">
<O>
<![CDATA[D+手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="0" cs="3" s="0">
<O>
<![CDATA[D+配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="0" cs="3" s="0">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="0" cs="3" s="0">
<O>
<![CDATA[回收毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="0" cs="3" s="0">
<O>
<![CDATA[PC平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="0" cs="3" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="0" cs="3" s="0">
<O>
<![CDATA[hi&nova9]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="0" cs="3" s="0">
<O>
<![CDATA[OV米中兴远航天翼一号]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="0" cs="3" s="0">
<O>
<![CDATA[新增天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="0" cs="3" s="0">
<O>
<![CDATA[新增宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="0" cs="3" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="0" cs="3" s="0">
<O>
<![CDATA[5G绑码]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="0" cs="3" s="0">
<O>
<![CDATA[幸福全家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="0" cs="3" s="0">
<O>
<![CDATA[华为FD]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="0" cs="3" s="0">
<O>
<![CDATA[千兆宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="0" cs="3" s="0">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="0" cs="3" s="0">
<O>
<![CDATA[小赢家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="0" cs="3" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="0" cs="3" s="0">
<O>
<![CDATA[新增云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="1" s="0">
<O>
<![CDATA[任务]]></O>
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
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
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
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="55" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="58" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="61" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="64" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="67" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="70" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="71" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="78" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="87" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="tab2th" columnName="name_in_company"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="tab2th" columnName="department_trans"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="全利润"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="总毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=C3 / D3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=F3 / G3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="手机数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=I3 / J3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="荣耀"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="荣耀手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=L3 / M3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="16" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=O3 / P3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="18" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=R3 / S3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="22" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=U3 / V3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="24" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=X3 / Y3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="27" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="28" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AA3 / AB3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="30" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AD3 / AE3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="33" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="回收毛利"/>
<Complex/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="34" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AG3 / AH3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="2" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="38" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="39" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AL3 + AM3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="PC平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="41" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AN3 / AO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="43" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="44" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AQ3 / AR3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="46" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="47" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AT3 / AU3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="ov米中远天1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="49" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="OV米中兴远航天翼一号"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="50" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AW3 / AX3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="52" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="53" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AZ3 / BA3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="55" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="56" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BC3 / BD3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="58" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="59" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BF3 / BG3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="61" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="5G绑码"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="62" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BI3 / BJ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="64" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="幸福全家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="65" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BL3 / BM3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="67" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="68" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BO3 / BP3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="70" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="71" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BR3 / BS3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="73" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="74" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BU3 / BV3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="75" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="小赢家增利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="76" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="77" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BX3 + BY3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="78" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="小赢家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="79" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BZ3 / CA3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="81" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="82" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CC3 + CD3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="84" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=ce3/cf3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="86" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="personal_task" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="87" r="2" s="1">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=ch3/ci3]]></Attributes>
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
<![CDATA[m<a1b;ch[j!i>*NKsl/4<%rG7bNG*_PmTi#8OoiA:gmNh<Bu?U2(/MmJ8iU6H_XUF/$4Um2G
,L-.M8F`#UETT;1WNt0gH!V,M>=Q![Jr`jQp8mF'>pI4+<dpS6tjmYd=%0moo%*f(2)o]A/KQ
c'si)/J'J!H'FH^1h*4rTKgIq&KL34s4R6_VRoqE5SV'8*jfVhdg=pmQj-$@"D5.h'UP?2":
G-^pQ@'SuI,UU;bn[A-bu/qtR/N]AfSZnlZI5iqR_*:G1QLEA,89/"K[2OI-hI#/ik39i76Y*
'u]Ad<X6hR>!rhN35fR?HBnH_mVM,VD4$jBIn.A$0[f?GK=)D$jbhqu0_$:+AdadFK9+[hp+X
83#-R0gnc^8&;s![nYT.LXs%WM@9O]A#%)dIiJmF>19J9<\t&24,gp[B)l[</\`.BWfA/'<%(
/Ck!2hq%HJp*[%4Kq(fY7tfXk3O.3h$U/ZK[0g?"T$qrMDO4FO.+(dFN_0?2`Lcj`K2g3I=u
t&jnq1%U"Ven9,BmMTh-<N^kNU($;$8T#9o:Gc.r0i!)c[D;CZEWD)UYdY4TL`47iRqhke9e
9-oP_J'L^EP8''mMED3a?=RA+OK.;T.XsAP467;,glLo$N`C]AW[7$oAm\Bh_5MZF-3=ESXr(
DBB`(T7hgK:7-Sp$&qRG8\=%K7CgV,N2hE5Y_F%EWW4BhqJiX9:U/_UhC#\fk<Wl_b;>.61h
gUAC+YirMS+ZeHqOGU^@74O.1mBB%_FDfiij2.RMrrg!Jq8`hgFmYNM4?N3QG^IJIS2UIPct
P?@g^puS7+Rt'+^cW[CR-NQs"]A]A:pYPHBn7>$R-V9Q./dYj75iiP33WYLa-hm%J/1PO'm?48
Fd?B!.mY(!"c&=]AdT+c\USkIgB["'?/fJ0]AbmVo.0f?Q5]A?#m]A*rPBBJ8NV@3G]Ap_`i$Y9`l
qJ&G\Y$k6le()*H^oA)$17Q>VZ>Eh1*7=7M*';f4RG\^KblFX+BB0-%mR5cO#u.g4>f(B0]A!
MHPtIO^'e`-?<aE.Y%#t*G$abUW="Z4dcO[[N]A$mG:bKf9R^lm"+WDo4#k&Z&h9m">eA&,42
V)Y/^'Gl16M.%'tRWOh5mlYKsh5/XT1Wi^r/G(4Ng.,O_m?bhQenohlW5+tq/mMD<f!/9Y9B
%;]A[?5V:7;LpYgj4l^`Tj<@fll='N(6V:6,Nig/p)iH%h'l/D>H<)s*W0&d^l+8WP0+fbW0\
4b-N)WjMIs)%0&aIV`DEI<o6'U'&9?^WVB6:5%s\,*;:I/h_SHbf:%.6HO^IOSYY*+J4-Y00
9@tuGXVd@NsUHtEWqn=R3@@Ei.n'GhG?0cHUDBPVpBTPh_6c\698[rL4-VNYm93lm<5e'%]AJ
$((l:hVJ;7c\N+$e+2^,-^Fnfm;$!r7oWCujr,2P&WKoWm%fH!<hMHQ4'Ic(jBKf@UdE$5"u
P#;Hod"UZuk8k&VCqY"!a5,^XQ?q%3Ko!0Gi^0-C%UT7c;s?(.6-]A+`C`.A%Lh%h%g)FHeOa
u,+B>I01S(;HZh8rk0'?bRKBCZO3UfR^IT3MB(+!&%,2"`2j?e%gY-$O2)aeRt@\drOt%0Dk
1q,!R=.-I%=q2XU04K:r,_:\8`Ws_(*.cA,ibND)Hn\_-'dO9$##X")^*@i2"q!h3T@6i3MG
V'D)V#FnH1QUOm2k`:k2%@X6=Ygmo6dIC@3KpR%(dD:W[7tMgklgWM0dpF3A,14]AT?*sH;qn
4J[tjON]A6*GZ;N&rFZM)4OYZ,Hd:DLmYdm&UYAGNU__RCI5?MrZ!s$DGVPl@P=.Ub#bI:e28
X+bl>>XtS[--(o0h/R]AP(bTpF'25/O57Jd,S-Pna)teRsh9_!C$XQabZqWCAm8j%+%":oMU,
geB2b$u^=W"_&Q3GBV"m'0[[RQ`>UpA+@JZ7,*`7trm6ilC&o-S-50t?H4:7j>=^p=og)E%1
/6aN+SR\hYl:KQFSps`88+^J4Tn`.IH.b7AjnD)u59MlJk-mg"c)H:0%9UGi-?-$.K\!i"/n
t`E^7bN8!9!rLpC36b1^i$B(3%!'IMMZ_]ANej$+LHprc+n[hrOphH1AK9>M4&=j\j$JK_0>]A
,^b[Q+e6`=NSi\i4Op.M?/TY.FL?\U7s)G)N:_Wb@/F"4Ms=PGpujND'R5W)Q@o,!hD5;cC(
_Dq?/#2,b@m$L\IT(6+oY_r5-FLnc/q`uJ+.,NMh]AUAsVh6D?;&Qa0dI$1GM7;E8n9,[1J"p
2o,$-<$KM;Z0k:9/6;0%I%fbZ4_$fJ?E>As7LtDc!I5M]Au[^M;?$I'\$8^'$R]AJA1f*8n3D-
%/lR:3bY7(&]AQ_t6e.@C5Rb:B.d)OmHc-="8N5+,0leWr^fn>OL)CFJ?n+`+RGlJVb?-H-[Q
Y6$)l#WTtcg]A$PRS`sPATa,2mFGMsh[-jfh6;oh.$XOt."k`X%Og#n_IG+<k3Ppd^2kB,nkN
5MnaZmQA_P7l8DFGK$E@)uV"&Sb=R)t^JON-uIn7P3]Aq-4]A?`_g]A0"Ihn_,5A'=m.X3)<Hk9
i!!HaNBJ/d71fTG?>fr^:"*@Kg/Lk\HP]Aa5jXbWm2@lg04Be2B=kX4B9U7igPN9lf*hO+n1B
Y)ATBp<2i?m`<RQFAt*t8]ALASW*!ak-W>Ck>XZ%_0np@%*nXY!.lu+pZNMd+N$O#XWX60'>:
.EYSE+%Yn-&oq"%g$Y<@!861"k$Un*ZH2eTcFtf8Y:Tk?A\^9\b$IPa*^Oc0b&8nAY"Bb5kp
fGaK52q53ns(Ab.[jXOE0.)%_]A=V[Ru!.CRabL</C!4AN>GI4@/c+SW\SLAM%a#WLG\6=XdZ
7M]AOtHFn@Ui[3MVO]Aq:73>m/4&M9SrTqmZI[@*,-C&d3\XjRgi$1<:^GG8Y/nRF/%9O)P9Ku
^#/!@8;UqIB9i9h=^>`Nj`XIr^sfDG+Srp)"ErMm:'HlNi)(Ku1f[bONU`shLWO[1VlJu2bp
$C=jjS1(Q!THhWm/5c'>!/.pQ`!2q$c"VjuOnM$NgsOHqrlA3hU5ciej.2W$bhJU5Eq"3N?k
EL(lPSFn6e0Ss"-3V"1SnoB6dc?)F+#']A:lYU\i4lc+:&u:)%RQSf#Pf;PtgfS(X`bfV?8V4
*hiK*g?VbWT/r\#.78?i'9apB9f<7\_a8umYndIE1q0Y:nKP"7:,.d1$9BSSZCIt%;qk@Jd!
GXHK)uTf&Qntg.#9)">BI,D,ET_",0A<SkbUa?.n^V:]ATN6b5n-0G#Q-%O-%1S9;<=>ERG^G
Y:=e))ClM5CNdA4cMn7d(-Bs=CJ]AOjW=.%<3AIf(b*_@M:c^CrG9gF;W1tfO.?:=c-]Aa4e?#
irk?['-2<X^%8%hf9G8BZYEZ=,VC19ksP/"!FXn/"aT*3PJTXXKZD5Om]AgjI5VkN^eCbP]A>*
:@$7NH(s#Y)2mV9nS]AlM<0B`ZFeS:V-fXcZq"rYbYN.9H6J^P0WqYjAp9>&DbD9:B\9@8.'(
/qB6/X0K#6B3[\?rj&Bn0(J+4,7TX8SkTai(Yosb(eZ1&h5P1jVOa[2(RX!HDf(/]AQ.kVcok
Yd1$4jKcdL#ZSemKb1FtRi2AcY,P/$N3"9Xe_pNG0k%782.!b8QbF-_.hMdBen?d4QG;>;e!
#BJ'3DOA?/aH9?OLF>cOI/?Yp?dH5k<&8>+K2_mN8OQ6D%jo:3*1[`=jVcZ7;oRjaC+a[_2k
gWr'Vi4/BKu?C(+M&Nd+KY`3@-M`Uf7(QGp";,m5hpto'TRQo2\#`CNm@a7AO(WkJ$=JqYVs
d6`U9H#,>.3luBr,KZhGmls"u9)IpK?JJDHrY'tprGI`OmlhYE`bLL]AM2)D'Bqr3)0h<tU=0
)C0Jp+$.4*5-K*jW=0!j4q-]AA,XSF`sVdj]Ac[.LHk07<p1nuhk3Q<WeGG5D;@aVX"[<Y.@.>
Sn=VCVgVVoEehNB$A2!/TlR[dPfak^u]AIgJR?eca9Vgh_.*d@>VP+8N49]Ano"<m4jE`%jncq
rb#m$M&+?BDaLPW`q\K!d/EiuQL8XFLl?(c%?Z^/#0<PKGHaM-R(kL^"9%lA"O92[g,TN!LX
l4"k]Ad?J1%LB;W>b6ej_)]A(.*X?Pc1nblP!rb/;nO>#]A%(ra>?O/dJpI#@I6g]AS`R8>Lrg\A
OnY<hHMsT<N]ArLmGq^3TS?I,Q#Rd!i-,Tf70H!Ljb5Gsk%VhR+H5B>*e1`pi(WnZ*<kN+\OX
C?/E6WFsg2G=sKcu:!Z^JoZ-<OM,?ZimMe1!(cu@&lF@9!cooB!ZWY%ZdsKReYBCNqJZYKi.
WJ&bk*k58Ai-ne"K]A2V*-&1po,@H(e"e\\9sC<DD"r_S;.Y@6J?n>WPg^oW__J&oR5,r>I&U
R*hGYiIELC%i33ZddX;-FiGUP6e1KXZ64'dD]Aqd9;(lqTC1fsEKn$g+5B$FoL9FB4aq+8T%%
Bdl9L1*Xg"lj6E9rTKJ'4nec;0YDR1p<N)V8fu-IdA@C`NHuX+-5M5O.)C&In1%qQu@0X<h?
\VbO5h@_E[0:&0QE9(GOPnQhj:9_Ck;X[PMo;`km\IV*Isa),>aO]A"01.'=JX44<!*5RO)rT
-gI&r"Vm^1tGo&Z+T<q=uqX%UHmQ]AqJ;a+Js3]AoV=@hc<^"4?i[R^a[h%><YE[b=bPdEd77l
`FrSmlV6sg<@\!(Hkh5AE%((?\`/V_u=nR%.Q>80.`S1#*M?*]A2P^O=q*`Ub,Y]Ar<MdZ_<8a
_'`L3^[@95iK8/GUW:r-%s"ZYILjj9-$eajW\qBGB>p5oNFA$e@d?3lGjJ7_/naI#Z$D-K1#
T1D;EeX>o5C`JV?XIpLHa8LLuCp:_6a]AKmS'h?N/(fQ9s$/>[GhIfpqj.+FW7>aEl^t:'iac
EknGaP?'G^9S1<4*)Gj<ae[;p\mq+=sh8e'toSR*lX<AE"c(PML@r,2"q\26B2R!dD.!HAi_
9u_<O!.1H]Apk,o,]AF7AXXf6S:.uD'I:*MV%S*#5r^,$+oNEF[?IJ\<-,%8!:'o)agd_^lAVA
XGmiWRH1MV`oV>T0DrG@5C?pL,64'"\`gFQD=Y[F0.i\4At=l$s`d>pU2qtL6Irf8lPTD?c>
_pkXSQ11M[%BR*.T0E%sT34:RD`sCWK#=Y2Vf5[TSkms>m'd#;*,RY.Jb#lG"%Zd'Dr*RIKG
.khG\2=55RM>0SS(C[U."Ut6M('V-h@!^[d!`aic;YF3Bi=?aEQEDH:mbl8\r<\4bV.;#i#W
\hAh8K+aA:i,aHSN1uu+S:N^)]ApoRCn[8A"`c[kA8FG;pR?VO?-Bm^,KPBquG4I9osfOX\t(
Q'1]AD]Arqp*1gOt0q&Ng."!#[6t?mt]AIHq`PJq,tAK(?[L*rX1b8LtndQ@cre`/DcIcL_?ih"
isiHIEc1@p.g#:(=%S/XIrNlX-loQtkSFdehIBhGDDlKBnRJ^7icO($gJ@GJ=2S&_Jn3L0kK
r*?d5mgk5JiQSJjF_%6]AS]A5;H))d$mGs0&-NV.2Z]AabW3VNRKLJ.-fr&#j*0]A!RIPqDPR\^<
E`ki%16V3pHSHIGr-<a\:Pa]AU0R8a&ES/VDcc1$Jo2GM'uql>8QY'O$g^g6`kujdnfj`BoX-
,_U6b\[7]A:Pj7`/RbPm41SpV6J\R2RYlB[7`Ue#Eh4s5K8#E,]A*n4(,!LMCnUI;5K=oF(Fls
);?F"*TXgTjnSki/JMS*cF<g=1c]A&<*B6KkC**`m>ZbideoO[PcLm_HaEnSM[D%<*kVOGcWF
:c]A";k&n0"j!d^1:>IT1`1To?uh4K,(l;0XC`Y\Oa*%m:->Upo8r4Is$U':Mm]A_!ZOKdQtF`
5cM=bNLS$dIk7:A:Nt1]A##l@!Yi'0,#rd!D6?.mqUOM1,+7"$0i]As\STMFD?NoJ]AJTA'(sUu
t%Q6QR\cI`B<d@c%[OW2@4P.;@)9"$ZoIGpRY7I:3ho)ZbmU'^#^c`&9&[oc/8\Y$0<G^]A/&
_78oaIR07chjN>u@:4$*E@o-dTdHO?j"Qu636E-[r>_+t.gPi&]A:G,Sg9ZB17"cbNGEpY'oq
sY`jRV.L/Ncn]A^3G6gj-+[Nk@]A&YRki2#(nI^5O(J!GqVAq^*_6MmXT'rW,W0@)^\i+4cVAi
Tt_23VU'1t/G_aU!;;S-X07QFb5U"de4kUZ^$haGphaG;Bol]AEajA=Pb;c8IDNO_,jXDc+uK
E`^FZ*+mifa\sYLe7uPVc$BTuV$f`,n?qg)ZS/")@&;,Fna\`s1R@JIr/*1JcYhLI88>TEks
QA;i?mlDk(_3gJD&GW6844u:=\6r#3B6J:!8cikMT*5k;R7VLW>GnJic2bq1sbk@A48u+C/+
t]ApL[k*@'s7=q),h-u?-b]APR3_a.*LVmBKbrGT=,j^^TbWm(9JQQ`d!Y6Qt@B_:D#8j,S[`d
\XEqA;)`A-30lqpS@r&X18BIOI/\!(4g+l>2r4a'?,?p*_6:_C)f-ii=3tD_Zqe%9&*?V,2"
MaUF[KPCcq2ZnK9l4(H`@>%Q7;_$2EW"Ngfnr1VSQ\cWE`%P]ASh>-]A_/4KbpaD>p)q1jCI;2
Q"kEOhJ?.W6/-9KJZ`RrGkZ/*hU_U-Dp+D3>P%`VQ:U8e</+[%*OLPWngt;)K3C#FMr$!iaN
VA$rGjG^2!S(iT?IG)10BC2eT?_d7Pn><EJ(`iTHeiA>YS:j]AcdXP)g]Ac>i=he-J*2!]AJC;j
#di.&qOr9RV+kqW"^Z/Rmkem&V3)lr$IsU$.qFL/)<b$KFe\Vbom=Ose8oaa\p/@1/.<YFoV
0omI\HR=#i[ql?m_dVW@^%-5cPu7;KaaeOE@GD&78'=i@YQ0/>Pa%1a;nT\'T*6%;_$+1fAm
3A$N7LOiCno0f.&>3U0u,Im/!"Q?oH7#9:2e]AO[Y:e9[@MH[-)'5Vf/nSi^"h%%M]AqJ@1;Bu
@BW:iq/$9Tm9*dO=j:O4Ne&6tHa9Uka;M-'o5N0u#["$/DtLJI>T,E00<2MIXhEOA>2_\<U9
9N"-2rniF!EsYM%g2fVJs6+Z[e<<**,2W3B)LB3N9;kXJC5qICdc@Pi4Ki=_>o,mtROIMdh%
ePg#7`;6-[f^tHOdWjQ9qBp"3f]AqJXKS'/-H1\feC-F"+iMuodDJG2PHh/Pc<Bm5f$\TX[<d
FjlZE-d\]A,h2\7CUo;'W"&75?bE/U@DRd^*oa2tm?[^[4spYF=oY7/l2!@#;C!K&HKrYu<(5
*WpLIR5djO$GL5)Uiri0mV*Ef$E++;OTdjr"7RrXL2ijJdA'jd//naL++NJB:FjI&>JJqI^F
0/,B-Zjak`'o]A%&VffiKFd<Aiq5]AsS%bX13U*&8%;u.(U0:/L/X@ZeXCnLl@n1tmuJN>c(-A
tLHGVA>;o;!f<U=.%=3O`$p<]A-WJNU;jBg;0GINBVj;T_!D]ALu^&qjumif9#l2)?`dBVDGpg
?>Gai;&b=9MN/ta?'oD:/-ncJsmq#(%nR$ZN\^AnZ>\![ZQ_!Z8"dNE7/16&o"i+Qjjf:K@.
SUE\!3h$F2_KooL/c&&Zp^+!HQI@9CudEt[t7N$/8TFH<>G4]AP3RtI,4.hIph/^IqDTC-h@-
55_f-Q3<>;X1!DE$9Wc0p""'DcQhgg2k]AG"RASJpKXAi)6UqDKCh:bGnrd1ge(1;tBucCFc@
4=#nXg9Z-XO.AW'mP+Y=i&dU\(cJQac^QD#>Id^QO3AJ#oO)IWc]A7Ucg4q)0o%rZ_]Af&hN<)
m7=pAgN]Aj6>OHXD1W3arGN3C'GP0Pf4"<nQ0tQI1\i7G#;846]ABeZp/BOe7dV4;b^c7bqB"K
F$-=P[%k19#5/dD4:cK?<Q#Xb@c)r;!*T?_`f:b`C6eF@F-WaHsELTW]A)X^<2CCDp08[^_[?
V1$kIYPV5!RIY6H5$lN`GP+iOAffbp5ft1#crQEZqt7[LK,+U!DC!/($7qh7*LDVEbne/2kP
Ahbt"oSRoLe1^HDn@*?<F#C@)i\G_\;me?P19TQo+s3nU3>T7#)YQj7]A%,,$3LG,4&Xr;6Vs
?e6=(3IqMQcB:&Lj)[@HK8QP'mr]A;q6DpY5#rdH9?>-KY[i]A+qc=+e\!?&J)E,BJ>Y<YjTeN
;eWXT"4*_5;g!ht+DJ[fs*acf0Q^W&TEGH>^(]A*dKWu:M;>qH9H#O[V7$fW/2I?/cHFQ\FI>
_eJT7b$1W-gM1q=`>DtjP'T>JoZmrIfXQl?a9m4/FY*)5Z<!]AG4RlOWLi=O#eGm6]AK:`GV^V
$-tp5EShEE%NFaI0D/16'9=;_q_6r-2%M92+6(hs8JuaSk@V-OLU5XX'7Hb@Oep8K-JG,`($
EL2l0=)&f_8?!2NJG?Pna]ALi!2<cPRC\pYQL+d&K;.?Lo1b[uPl%!S)A/'U@Fuf#bDE4SM9s
7ppTr$cf*:,Z=qO,@eJ'8tHVp/JWO3?^gCJW>hd-Q`SB9o_$8,YocgJ/'(cVDIEK2QQ>8p0)
+$(L-k1A'iO@MKSd3W-K]AH7As6,2i1fDnA>XmN"+blrfkmNU?qJo5-0B`KC\6Mb1#p;6;5F%
\dlmD;6Qo.m/`GNpBLcC*?IQpMS<r_&psqsn-<tZf`b8X_rrL[ELGD*9;BIAAn9>$b@OmYQG
g!@uj5DtRmP.c=b(_0hChYFA7\qSa3N#V+PTCPu,+gH%A8:j0.<@*N/#tUr#%[Vb)s7bMitI
ZNI(b+5n<5$@e$s>?^f&5m(CSbcP8*@QF[UfBU-I2++uo`<M/'k(?_"_kL-gCao$Y>kfN%T0
(acg+:i(hZFT!tXGrqX$Mn'f(%UYQK2qW"EIc/as:lf+7>8_XOI&TL-6"NudH(YUMg_iQ("U
/!"T8N`BFSs.*)Tp>,PM/,Q4S]AtW^4'$MmA*k)KlU=_6EF%?ct`Z)Q@2$'.!m\d;NQ;-'eqQ
.?1b2W2fbuOOWHE&GF3\\0&8EJ='cn/cE&Z\)logio$qJ-*QgPt0F!NJ>0Of9$o58_;i;<6`
d4^JD\HG-nLLRk/tK5/DK;mH_u$0#47A&N8H%"h4aQo^h=.Y1L'7oo^aR?7J@/>pURs6c,1h
HK'R8C^8^itfUZrSqe2j[`!.&9,LagS[,[,%GEqDu`#3P/K;B2%kaDla7$uT&2Z[;t@LGKd*
F`nb>(%CaMc03/Tpd_GU@uF>7^bCW;rnr"O=q)u7RTo*/>GPOi)1HF0rc4jRs"%J,?-Hh2"a
dHk*]A<bh&)=arUu.u?-]AL`4N>>Um-_(U+<jbFZ5D,9$eS5G2D[r-?>&>aIppYrUS8ZC,<RPC
eRN$#"8gX3WPhQf4Z8!5Fd(VNlH7+l!5%i4q<4r7K:9jIJYDtYMFY'\U`8l@SMP;(#hC\lIg
#gs;PrMd9IQ7<A?^%F8'o(8;:5Kn_X@WRaZ_1S_S%s>8P;B-F)6V-Q^Y(3i#R!jh'J?4?120
`7H!200l[earV?>MgPC!:tBjTp?^?`i_PkkP$m_eFB>F1Kk1R6mBM5E/EW20HI1?NXGm,_TQ
R6;s/8T!3/mhG@Ph^=&@eTJM*Q+JN6@5hILh=Fd$c$3C9#ia9,b.Q,GLTFFchC;GV:05EYP#
U<Lq8V&<&Do/_)lt"N_XS6flH#nTpF_ld.)>>>j\>HP:!F@Ik%=q?.TCtqiFS]Am.Uu1\j31K
DMXY&uWMK*ge6omNc)@0Qjd%F*Qt&<QTJ"Hh#B,6C;$6)WlN(6I[k6F).ce+"%*(;N)riN?I
U,i9bYN4a$nBMM6@P#kn]AB7-3,K:2/LF22BrY-N*Zqmp39EDeb`W0VoaZii2MDmWgH8V&f>I
YVo<&!L5rI$ufG/7^5,6+]A`O@:'\m)XXE6PLYp7?Yp36O]Ap/o%u?Z=t/0L(*gPFA3.gbW@a;
Y_+^m13/p-OAoV)iMMA3]ApQH)IZ"PK5J]A4(b(iE#qDST88<]Al'frEi=C^Fh_3a4V+Nm9No[k
d3=qs5[cYDG9>2ngIP#WW9OeFgi:B"?$.7"3&^NRd/u<a<9C@:#HFgj2/%.Oo3)I4g7?2bY"
Qr]AXfAoHe,:[s\RZIR%55'9i&L37feD$*3lHAuQ3#ZD8l83iQsgAQ:-Z]Am85q\CEQdTXrKgn
2BN@Ej!$gE&53DoYh+@V]AhRW=6keq.,Pb/mh3?1#nJTA_2F4t@fW`IlV?+t4tc/m*&V8*,A*
*+6/><he$CbM2&3mhG(AsI:oH<.@VT3#s/c%:b?Au;`Qku$7R0iI!bZ^o6?W,cmA6Yc07]A)4
9@\aA^*M/SPU$t;a>'gELVk#P>8J4*FluWN.u=^N/lfN:P(1$iEHtAL^/[Y\\rPi4lNHRLTW
5sUKFNtZ141Mg_0H\\SnS#c=F_Lh7X43VaZl";6DTrQ;riuX\=d_j`:;j(n$sHje!s\[$c3G
q$/Y0MM-f,,1A4i$:)"LEG9]A,r7tQ1$?Bjm<%&9<"]Ag3\sibtC\UI#t/GE1T:=a8?9I?1[#D
8&FHZ;2kD,D+^QX5cd[K4E_6Yh'*<r9HRDi3eS!V!0c7cJ-68d21fg/qg7U\0$WJm\`[#X!*
uiqc+o#Y,eWJX%e$,feo[tZ`Z5qThDQA.9%D!*@`[F5M%n$T7,h+6)`]AWja5R7SaM;S7NlR8
j)2TOD(#9[H$02l+lmJ9S[V\.T]A4;3P9I\nKL3t?kDMmV-3Y1lj(r?LRjQIW#s%B<%[&5bdV
H0lRs#=tM6ND>\3tZ<qK(2E6U.735XiZmqGjH!,5HH>:7cJt\JX5X&Ur*ueJtJGh@:i/7`iO
1;]AaO$?Kb!L5$$DmWCV2oqEa->8RDUo"f7?6;Z8r;rthVT,WHA'RGEZ2)/r<tfONBlmb?(Z3
9o(k]A^PJ634:%Y<,h1f8"Pc,eA"b^ra/>]A3-n5g?%MIs(SV`'r%85ZSoOZeLjA=23;]AG+)*W
iLOG!SHB"em7N]AhE,Jj]A+)Y7J;"%qp81%AUAA4k\<tLmmqVciNP(p@SMuiP\5^/%j#AXT6KW
DLAhZod!hR2&X^;KqXU7*?oLWf"30"W.)MA9Cb]A9OqM`>MY2&2Dal/hVL6W+*]A9B(JG9K/X-
JelU!l5Mlo;H;q_\(>:Z6e82>q5Qk@i6[l-m(;Ua=K9eteJChaif7K-+&`1&Kg`_:L\L!`kU
P->+4u*]Afusgpf4gjY*"tWH?WGC!iLjN-h"`?9%BsZ_"7iq=am5M7/1<$e(a#IYrN$NLJ)gG
t&QGZt&5+ng0;l@!)(AciU*V/cfei75=2@hgfM`crDhb?%qGbeh/r>`WbO$#8VPf%6PmZRd'
f^Zd$P9<nBq!G#S7Y,6IfNUkESte)]AXqIh['t6t'^2%eU#!^F1eqNWpb"h3]AGJ/HHgWK8B&a
X[\jO25`I<kcME9A)s^]AN5.$DM![Yi@^<]AiGfk]A0SXI?Q8eBtD5\At'gR;A;IG&RTn&Z2TV&
pki)L;q9mZT8d`6h8E@5tX+cMIX47uc-uT(%bbdd:gu#cE$n5&p;Q*JdIK:#@`IQsX=QV]Au6
mgV#*WO%08f[iR2KTt0K[6!3:Fpgnm9;l3#P0M66ka=,/':=CuT(!_(MXF;6*T2b\@*l@j3!
tf"8]A&hMN/'%/U(_hjl&!\`Fd_,m.*Nl08F-1h^`,iW[1(rm%o'7>SSY^>)7#]AUC<%G!+#)c
W<F*dI*E&So!?cFZa."c4I07-06*PrTBQTCU@M=_bXp><G6FTt@B9t`<0B((e7a:@Lqmb-Lq
.'V9tVIu5j`M_3/V5=/c@:nt!JN&UIR)e+T,=%&ro,]APAp+DL8gF.37aumna*Z6_s:t9.e&j
28O(%d46jW2]A*q[?qe2BPN]AH1d69R3uu6du8n-DZ4dB^rnd#Mr`7j:W(sY1(-\UpEC[@Qp#4
CW.)]A'c$gbT),6t!nr2Uf7M=ce(bXP%9b9JE)9jS=a=lBrh\1Qu27tS2DFe"&8Z/+qPLeCCp
)3bljZgb"bsC\0('m^I]Ad0Q?S^[Gno<nkb.E$$lft#UB+WNG3<s_m*LgfAcO-o$)\r;"p$oU
=aKbe/*g/?/lP@Z0ejnF*hTDXh[r4eH(<70J3\TO`3esQmn&,eDX00tKS$P?^b5m7(%$<l5\
Sb+3b3IP\;,\'XKmQXHcSlARlQ1:iV1ek[j3@pAiLS8%/)Y)p\4pibLiI*B)/p-g3[`aJ\R'
H-):TFXr12O[TML_A-Lh3,G>6Kb[1pC;&ba=rLF,GX\"7";ili/qKHkPgX1[3*R3X]As348dN
l^*`4r%0"Q4Q@Ae-gq0Eo$X?.>OV7VI%q-WRj8:P0]At!<;,dHQoGOISQBgO[=Q(9kh\l@^%:
,;B+CDh]AUrC7%h$+0RkU@m14C$Pc)B%jS`c+V_A;m2'B:.*=+>uII,bV#[oVQ=b`*,cL]AZh]A
&jb,o2r[du=g"NJLs=c>>E.C(2sY!gd[^D<=;BosA78?\XRqi.#QDC[WlWC3OIkrWj&4Mc-;
'G5;?@Af(K3mr.QYj*u1M(a9QrNCI&c%/JP,;UQ6k6DPJ@Tlfk=OcmbE&Z_>?i=sqo:*./*3
V[5PAcbeO^8(khHs)JMZuk=Wt7j5g1@(h?&>LFf7E,n))l)a[NK)rl$H#(o*<Xqc?WF%Y,9_
BZo;FR+//W4UJMH`'b.oI>:-@$G,=9-Ig3j)nG98^p1OBc]ADod$c`^QEHSp`t)0BJNqooM'K
0:fe56C)[W.Ls<GB_KJ&s_U4NCIn^KBV[WB<i(pfpoE^Cu($;2'ODpWYle:XoW4bQZbf>3?c
O;("qqDi*.'H?-bPP=[)+dIp++$)s1\c8YE]AC28l$k#%a_@iK(<7SqK_6o:DJ\9ldOqKH8ru
)DdbZIO>@ch)+#`:a__T)rk8Rl"noPFGc8]AB"^D"n]AV)t-pPOY.g_$;WT(M`^>nkBDFLI>.q
AleT"*5AmdYae@lH\QAbrUeIj:@tpCR%`&P..oW*`/WZZY2&B5<:mpJBSQSDIiMXC6a177mB
I__Il^>"V(`':nf-Cr27up*2jB!DoVq?1Q%PZYtR:"2(^Zg\*cQc19Q&.A.^ucSo+@14?!$Z
NLjYh&\mc-3SlF]ACjAriO%'NMoQO2,'=e^dX>b,Kku6"eSRG/^/O`HK4%[L>c&rF$#=9If1$
l&e`uO<4k'50,7qd]ARCLO]A;!)(/M#%jE_D%<&nPfE0aX9B;C_4M2pL`%L3-Dg@5VkSjL?sW+
&\OdIN?/rnBR5b$]ASeA9S$h1o?U9r1$NLqT+dE<$[<8M6LjTOc-,XK*,Ot[Gl>;8JJf\pG@9
R"RH9>fXG[(Z1%h@T=)c[s2421ScGKtWBh#*Po#g#2&$*ogY$D\ggX_^]A#9!AGr1Em!IUa:1
LOm9C0BiO0#gl'*G=Y(S7$*8'9_R5n!UrcKfq#?1q>qj'[-E]AUc[-maPNQ4.77/Vd7,Ib$8W
:^6VLFU%8-nG7GfA)-lhVX56aJ>hi&;[^!<CqP)I^Cg=q_9B1GSX=lO]A.CN-J,D"kOB@b*P\
]A'9ZW;lp8bSG#r'-,KnU'gU/[<j$IWYtE::8X+]A/3&%Vmhr<CS%l'n+Da]A;:YRhiuP1QVh2M
?6Unqi#$YMU\&nPPhlB?Ln%oPdjsiD/!+.Npiirh%KE*-Ys#5m$Jml.o_GHf)0hQLlEgQ,GF
96HOg$s)KV`XVMa\&lXHfXM9E5UuIE;=$\2tK]A$TUA!\V*t)p.=6R+LXIFl2qVU`mcBsC!o-
JfS5oq_c)aCh=QAk$KW#V%@]AAo08=lK&Vn@)^8VRXI-e_E&t*14)FS,Cn5`YaRI3=r*_g:WF
eD[a4*>*[Wb5flS1a,t-9>NcWnL'6jQ)<g2;DQ$^]Aa8$14>.DaN#WiR9#=h!$oPn'8SYi@27
kpKX2<tT3\+:s3kV9SjU>dFg&ieY5eBbp\ks~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="510"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report1"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="960" height="510"/>
<ResolutionScalingAttr percent="1.2"/>
<tabFitAttr index="1" tabNameIndex="1">
<initial>
<Background name="ColorBackground" color="-657931"/>
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
<TemplateID TemplateID="4381b1fe-5e96-40b9-9006-c8a365c962c9"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="e4c8bd94-009e-4a57-ae0a-304feb0e1be6"/>
</TemplateIdAttMark>
</Form>
