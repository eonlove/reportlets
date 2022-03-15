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
<![CDATA[2971800,5676900,5638800,2743200,2743200,0,0,2743200,2743200,2705100,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,0,0,2743200,2743200,2743200,2743200,2743200,2743200,0,0,2743200,2743200,2743200,0,0,2743200,0,0,2743200]]></ColumnWidth>
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
<C c="5" r="0" cs="6" s="1">
<O>
<![CDATA[总毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" cs="3" s="0">
<O>
<![CDATA[店长毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" cs="4" s="1">
<O>
<![CDATA[终端]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="0" cs="5" s="1">
<O>
<![CDATA[荣耀手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="0" cs="6" s="0">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="0" cs="4" s="1">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="0" cs="3" s="0">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="0" cs="5" s="1">
<O>
<![CDATA[D+手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="0" cs="5" s="1">
<O>
<![CDATA[D+配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="0" cs="3" s="1">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="49" r="0" cs="3" s="1">
<O>
<![CDATA[回收毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="0" cs="5" s="1">
<O>
<![CDATA[PC平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="0" cs="5" s="1">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="64" r="0" cs="5" s="0">
<O>
<![CDATA[hi&nova9]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="0" cs="5" s="0">
<O>
<![CDATA[OV米中兴远航天翼一号]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="0" cs="3" s="0">
<O>
<![CDATA[新增天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="0" cs="3" s="0">
<O>
<![CDATA[新增宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="0" cs="3" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="0" cs="3" s="0">
<O>
<![CDATA[5G绑码]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="0" cs="3" s="0">
<O>
<![CDATA[幸福全家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="89" r="0" cs="5" s="0">
<O>
<![CDATA[超旗舰]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="94" r="0" cs="3" s="0">
<O>
<![CDATA[千兆宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="97" r="0" cs="5" s="1">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="102" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="104" r="0" cs="3" s="0">
<O>
<![CDATA[小赢家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="107" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="108" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="109" r="0" cs="3" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="112" r="0" cs="3" s="0">
<O>
<![CDATA[新增云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="115" r="0" cs="5" s="0">
<O>
<![CDATA[穿戴音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="120" r="0" cs="3" s="0">
<O>
<![CDATA[门锁]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="123" r="0" cs="3" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="126" r="0" cs="3" s="0">
<O>
<![CDATA[泛华为]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="129" r="0" cs="2" s="1">
<O>
<![CDATA[单机贡献]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="131" r="0" s="1">
<O>
<![CDATA[毛利环比]]></O>
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
<C c="7" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="1" s="1">
<O>
<![CDATA[激励]]></O>
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
<C c="14" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="2">
<O>
<![CDATA[考核]]></O>
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
<![CDATA[苹果单贡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="3">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="3">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="30" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="31" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="1" s="2">
<O>
<![CDATA[激励]]></O>
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
<C c="36" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="37" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="38" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="48" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="49" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="51" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="54" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="55" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="58" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="60" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="61" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="64" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="66" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="67" r="1" s="3">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="1" s="3">
<O>
<![CDATA[考核]]></O>
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
<C c="72" r="1" s="3">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="1" s="3">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="75" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="76" r="1" s="0">
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
<C c="80" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="81" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="82" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="84" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
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
<C c="89" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="90" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="91" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="92" r="1" s="3">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="93" r="1" s="3">
<O>
<![CDATA[考核]]></O>
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
<C c="97" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="99" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="100" r="1" s="2">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="101" r="1" s="2">
<O>
<![CDATA[考核]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="102" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="104" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="105" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="106" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="107" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="108" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="109" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="110" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="111" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="112" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="113" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="114" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="115" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="116" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="117" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="118" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="119" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="120" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="121" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="122" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="123" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="124" r="1" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="125" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="126" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="127" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="128" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="129" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="130" r="1" s="1">
<O>
<![CDATA[激励]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="131" r="1" s="1">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2" s="4">
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
<C c="1" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="th" columnName="自定义分类3"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="th" columnName="单位类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="th" columnName="显示分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="2" s="5">
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
<C c="6" r="2" s="4">
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
<C c="7" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=G3 + F3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="2" s="4">
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
<C c="9" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=H3 / I3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(and(B3 = "体验店", J3 >= 1, E3 = "A"), 500, if(and(B3 = "体验店", J3 >= 1, E3 = "B"), 300, if(and(B3 = "体验店", J3 >= 1, E3 = "C"), 200, 0)))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="店长毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=L3 / M3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="终端"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="终端台量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="16" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=O3 / P3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(and(Q3 >= 1, O3 >= 30, E3 = 'A'), 400, if(and(Q3 >= 1, O3 >= 30, E3 = 'B'), 300, if(and(Q3 >= 1, O3 >= 30, E3 = 'C'), 200, 0))) * 0.9]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="荣耀"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="19" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="荣耀手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="20" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=S3 / T3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(s3 >= 20, S3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=//if(or(T3 = 0, len(T3) = 0, D3 = "渠道"), 0, if(U3 < 1, (T3 - S3) * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="24" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="25" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=X3 / Y3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="2" s="6">
<O t="DSColumn">
<Attributes dsName="complete" columnName="苹果单贡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="27" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(Y3 = 0, len(Y3) = 0, Z3 >= 1), X3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(Y3 = 0, len(Y3) = 0, D3 = "渠道"), 0, if(Z3 < 1, (Y3 - X3) * 30 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="30" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="31" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AD3 / AE3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(and(b3="体验店",af3>=1),ad3*15*0.9,0)
]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="34" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="35" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AH3 / AI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="37" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="38" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AK3 / AL3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AL3 = 0, len(AL3) = 0, AM3 >= 1), AK3 * 50 * 0.9, 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="40" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AL3 = 0, len(AL3) = 0), 0, if(AM3 < 1, (AL3 - AK3) * 80 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="41" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="42" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="43" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AP3 / AQ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="44" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ3 = 0, len(AQ3) = 0, AR3 >= 1), AP3 * 20 * 0.9, 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(AQ3 = 0, len(AQ3) = 0), 0, if(AR3 < 1, (AQ3 - AP3) * 30 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="46" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="47" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="48" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AU3 / AV3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="49" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="50" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="51" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AX3 / AY3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="52" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="53" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="54" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BA3 + BB3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="55" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="PC平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="56" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BC3 / BD3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="57" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(BD3 = 0, len(BD3) = 0, BE3 >= 1), (BC3 - BD3) * 50 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="58" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(BD3 = 0, len(BD3) = 0, D3 = "渠道"), 0, if(BE3 < 1, (BD3 - BC3) * 30 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="60" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="61" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BH3 / BI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(BI3 = 0, len(BI3) = 0, BI3 >= 1), BH3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="63" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(BI3 = 0, len(BI3) = 0, D3 = "渠道"), 0, if(BJ3 < 1, (BI3 - BH3) * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="64" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="65" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="66" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BM3 / BN3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="67" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(BN3 = 0, len(BN3) = 0, BO3 >= 1), BM3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(BN3 = 0, len(BN3) = 0, D3 = "渠道"), 0, if(BO3 < 1, (BN3 - BM3) * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="69" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="ov米中远天1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="70" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="OV米中兴远航天翼一号"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="71" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BR3 / BS3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(D3 = "渠道", 0, if(or(BS3 = 0, len(BS3) = 0, BT3 >= 1), BR3 * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(BS3 = 0, len(BS3) = 0, D3 = "渠道"), 0, if(BT3 < 1, (BS3 - BR3) * 20 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="75" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="76" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BW3 / BX3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="78" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="79" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BZ3 / CA3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="81" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="82" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CC3 / CD3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="84" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="5G绑码"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="85" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AV3 / CG3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="87" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="幸福全家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="88" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CI3 / CJ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="89" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="90" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="91" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CL3 / CM3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="92" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(CM3 = 0, len(CM3) = 0, CN3 >= 1), CL3 * 100 * 0.9, 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="93" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(or(CM3 = 0, len(CM3) = 0), 0, if(CN3 < 1, (CM3 - CL3) * 50 * 0.9, 0))]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="94" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="95" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="96" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CQ3 / CR3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="97" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="98" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="99" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CT3 / CU3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="100" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(B3 = "体验店", if(or(CU3 = 0, len(CU3) = 0, CV3 >= 1), CT3 * 50 * 0.9, 0), 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="101" r="2" s="5">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(B3 = "体验店", if(S3 < 1, (CU3 - CT3) * 50 * 0.9, 0), 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="102" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="小赢家增利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="103" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="104" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CY3 + CZ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="105" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="小赢家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="106" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DA3 / DB3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="107" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="108" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="109" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DD3 + DE3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="110" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="111" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DF3 / DG3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="112" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="113" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="114" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DI3 / DJ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="115" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="穿戴"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="116" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="complete" columnName="音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="117" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DL3 + DM3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="118" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="穿戴音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="119" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DN3 / DO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="120" r="2" s="8">
<PrivilegeControl/>
<Expand/>
</C>
<C c="121" r="2" s="8">
<PrivilegeControl/>
<Expand/>
</C>
<C c="122" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="门锁"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="123" r="2" s="9">
<PrivilegeControl/>
<Expand/>
</C>
<C c="124" r="2" s="9">
<PrivilegeControl/>
<Expand/>
</C>
<C c="125" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="手机数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="126" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="泛华为"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="127" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="goal" columnName="华为手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="128" r="2" s="7">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=DW3 / DX3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="129" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="单机贡献"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="130" r="2" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(B3 = "体验店", if(DZ3 >= 1000, 300, if(DZ3 >= 900, 200, 0)), 0)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="131" r="2" s="5">
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
<FRFont name="微软雅黑" style="1" size="72"/>
<Background name="ColorBackground" color="-3342388"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-3342388"/>
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
<Style horizontal_alignment="0" imageLayout="1">
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
<![CDATA[m<j1Y;s1`9!%CoCTrf';1=W`R:(JJT.PhC5D7pupdN5EE8>8NV#=&OrRA8>2MiuWtQ!mTQ:l
>l&@t5gSC.*ds7E-T@#\4/A#pEh#p:"b^S^+g5oNPX'n+SF*#Kt&0I%K6eH_0-lmc;;6Yo@%
Po]AdV7$MD95IsM(_.+A;&$K^(<r,]Aq,+c29lKjo.AHN2gInk(5T)!2dUZH!O<""GPoaB$%Pq
J5XUOmj>j(AQVDPMP]AH7daD\mNZ&C9N`rn:sV;^]A52cRZLFY,$Xq-PdW'3'/"c9YkKNACIeH
L^]Ag59krMMm$h6U`&W&XY<8c3XHc$6UTK[ErCJmjN11,Qs04^?Sngm[[<KN%8JGSig#3Je=b
!"T%P<M"YQHn?b7=CGah/Th$P#=g+N.-IAfqR!,)Cs<1uWH-e^KUI:8Tc-:k^TcB-:#YL5F-
"ElrrD;AZqHM,2;Ja]AQ6r,_dK;64.)r`f7OAKa&3,1"PPP9I(hn4Y*,0c)2b!DUq,L*-A@/N
toN`CVDM:"7CJ_Y![a._K]A#$TO8DBbY(WkS&BhO2uH#SOUI3?osD)tB#6k(.+MZ1)MGlml7?
th')B-H(F%$0e5[HS_bAZ/S.Z4n$hcb;qYFm$ZCErEeb@=jnJIl?76psTV$lpCh;BX>,O5'`
fM!KaYiD4u:.8Ek1?p\O%$Cd/-!dY:*-<qXX_ha07@!6BW2GS602=gem?`R\Om/p*/*(_gNQ
_7NI"lOS4o5X,4X:3j2*PgR*_QluA8gpI3S:G"$i%GcIN'Ggm%56.W9`XoWfcEou1;r;=a0q
gNrLBQL.3UL!f0YVf!a/Q;f"%RZ)]AGOpi03OMGVjWIHBi"`_BZ32Z^.^OO=oSi59$0Nf<.i=
7jN6c+iu`/FN_VK-7Ki+@lbg&SZjC27!/!5tPF@tm[(5foN!E-W8o=WUlg%!QJ#>tL.[CUl$
S<C-_gss"C$Q>6I>6Ca+p\pj:EsfomebP5e_R-cNGfTqSfb(]A^R.C]AQs'klDY@Q/*r@@=*d)
C%Xti`^:(LkH'Rfa'nDQn#jbRt(WLH44cO:fMIQt%gAKUJ=":.b[.LZ#J[A*M!G^fQRL]A8?_
1/n8AG)u09f'f#caj7N%.O""f9&GsXX`ss*rfDGTDs]ASN&d`HYh0p'>?3kXSaid_Q!o*G86Z
;*a41Y*#3R@/;qUkkMRYk(u&18P#M'$WLoV4/1_;9:,e'cnXdn6*9Ze`GXeXuNf^C]AeOL^bA
=KrWLh0-SNI#S*e8q_k-"-foLaZFrbM;:.qjqaE`<!_rOaL=b2Ac9a8bQts6UDTU4uU#eT;c
B$J7b-V[DlDcSRm`!8(^O8<CoGTX/"'W(j/b$T4TO!BF_:5sZ('$Q/#2Vpcqf)0!5d!!'lgB
Omo-:Y]A!_LJQc`]A)GI'qFHGgbB`^%]A($U7RgJj_qlCar%(@<rZhqfG)srBCk=lTGr2V8Ll&a
f6B>&:Abkt!fa+#gQMi`s(qW0H80juTj%]Am(:\s6p.t*Y+Ofd>H1?DDrT'E\(M1U=-c=Qt`j
+C'nq_i+FFNH0O5@#Rotc"?"qIe!=GR84mVM7R1_m-T$b)hdg&!bXH#MMhI*e@30Vg\q@^.g
N\`5b^,onpT$Te"4FZ+p-q[\F;h?eo*G;!c'G.MnVLg]A1qcFq1%#hGGqK8k6+]AD*c*jPP+ZA
rR1>n_;$R+anB@1,;qC\:hRYg#J=_CWXouqX6fVYO9mGOL`YX_Vo_,HGA_dF8&I-Yr@c\G8/
5fSU9[S#R(#GAF]AZ8.#C?T1lM'`@2DRREn.DjZ..?._<&QGhb&IQDDW2`XW"fN67'DO=:E89
5!1tKNg$s+eFm&bRVp?q.&1?UA6&,pe4uc=)W!b,b&>5NX]A)?#;^)3")O2(&2;Q[eM8o,bE.
%<jBdG+:%b[pg>fO]ASXa2R8e+Bls6\b";28@8-\**KfU9/Anog/kD$gW_//F/P+Z(%C8HO&)
)(CWQt.D,f7G>BWH_fenBAQ'o&.OGi?n4Mi%>m-Th9WCntL-MMkC@39mK&70I*;L,Jj`+UK%
kc$opfXE*_SV(dLBbnoI8G#KC:<i_XOa8G_+$3/rOiR2D,DS6ILA!UY'M62SjY5?%!\RV./g
\HCWU*je?/qDSa"0BKc_K#8UD5]A[lXuZ$bO@*ij@g'H.*,L%QHcKXB<&r"Yb-$bX;jd#Z\i+
<gbM.JGm+t>6PIfABB:u<7na^qdA?KYXT#-\X$;6W*s"hW*2b6igUEV*SMSE=j7k'A*,Cta_
K'c&&H0"<6^sH6LOg(6+ORa5Ak@X/K]Ab(DPCtaU[0Fh\[RGGM)a'mT",?3-6I?);)%DmlrX.
02H!!+"f%>V51Qb.A6"[#m!+L(p$TW(=3T8PC/W/4n*NOTf#]A?e\I/(D=t2\3kWk@a7gJq=.
:I7sAQT'U0A!=o&MAoK$LZRMr$`N5T%W<)9j6.e#%*h`.TF+<<DuKHIl#'*jq/7cFb-rbd9@
/]A&[gO>\#ufH=WI`I:XqVT^MqY)R"iC;9rcND&"5!o;B#DJ!:?gsQ,J<'rCCT5%Pe4SDVBH^
gF%hd6W@o`/KS:4nPm,hm2'6@T($j%F=f.T[4R5L*'8rZ6o]AVSV7/nIXD5pn(9/-Mhf6WCHp
_Hg2#0Ro(tIpnXufV/\%0&i`"anR>Js1`qEM%a5%OIMf0n*s6tHit4Wrn':d-TcGhH'WGF'k
H\tJ+EA(3mO*tfR,hnJ1kVP$hKIk!&FERa8<V;\2UB34LpeBXAmV[QrWq;&(m#r2778Wr&E1
f(ki0c=QZgE445SU_XN7Z7ih=K&+E25_&fob[E4DVtSVZXPEtmQ%7WU+`0$';H&P6B$.J!I3
IE/YZj=1/qQ\%>O+cs4eGb5aE"hX50CC_j(Y'<RH%mPGZ'7V/fH/'_LO2+$pNR5V>J,T.nWt
@mNi<0.@#O`RrT9%8^oJ4-KJnoC";g3S#L#re)$*MgAa`6U:GYn+HEAADIB;Kspshh]A.3EV]A
cK3o,BrDJ2G4&7f%:t's0T>*q]AILT'E1O89q[US(^kqmFRot2.lc$R8WpO_W(@<X%UQJ5<"6
+VSX3^BE9BZG(!(1Sn#1Y5`rMDP\Xti<)^'>(:SBia*KDYF/=:-6r7^2iXq-LOp`(EpM'Id<
=>O8/JXaFHUGQ67RaoqeUU^5)BNu9Ag93K6s)l!+IV:MVb/mjBeM^7?Mm1`d\F<-n&(HV91%
c-9f:J-"MFl+%F:\9mP0t<C3sn0Mcl]AH*Z5=[E^/82)=F(%1NhP#TV@(qY%!t)h.'K1L)5b/
p%CD3/\ts/Dg1hs='.OO6&8=0@kI8nGc/VP<5%CD>PZ"Hg6Ds^#q-FkIk1Q\IU52_%DBU5qS
M+,GJGiLFd?U.\SFrp+adp:llk`h2K.$Q^F/BrmY^#Y`krZ"3XV!#d)]Aq&3dsZ03'8G^471j
)4=6&s^a^!8n7-a`mrfaq'f,aOQJ!/Vagu&qV+=Dtc372P&Eiel!TAR!42Sc$<Go>Zb?:'EY
j$"\EFuW1h_SOSB$G/%;<Bg4dqY)5jl1WOO-<r<X1VC?L=b$&_^:"CB_?s\<-BRNFX$.^;'1
d2:YZ&A_,"jFc8/Vle7WC\G.O$HqcAiU@G5Nk(>a[5FWKjUnh-dX&5AUjJd]ANAnL,CleIjZB
X3d;0?hGU$/h34M*^AHuE^t"a^VC'2EfWeF>+;e#EZlrQ+X'qW$P;L5.-J;j%/"VX#!7u7&j
\//ergj]AP]AaUA,6J=t_>rkcpbdI2.P:E/h74'X/]A\8fm-'U"hSr8n<SN.q(qu<;4L5t'Hs0t
`@__EPT$*[rQjau/3kVF32NA19nZ9U'@+J38oreW.@TUY!laaf^T=t$B9g=BlW=PMgVRFe/E
!S&b@c/qmEh,Wn*r^uuNOkEo(*ImFr9dM/X'UaKbO^gsENkQ=,4I,Ngm]A]A^bdECk)MhS2Fum
hR)4Zf^q[*IdAZVA4M!LKpm68)Cm]Atn\s2\9[UH0"/e'aGS!o=5-b.:XS6cRfk'qo<DB)E?$
K0gct-DM%H<A4H..AWF%W)k*aG)@biq<!0AqJ1"(*DM0C.b:c2<etMDL8oA&+rS''(G2n9:]A
FAB?[E^lVNbD!3O!@4ROCT3d)hXV?aP>5kFJRirMQN6]AfU(mCeeNRMC>kU2Uh?,8E&ZX0GEB
CG6e-;bQ#%4Lu;f"!LP%?)8q.?.A[2c`HN1+F!V@I3i0he@%1+HJXboDg$5)JN3tMWi:Aa(Y
T:NrC\a8kadKRdfXF1sOb>H'nMD:<E_"m%d0+HK;-"h\U,SHb4O]AOSBqRuL5auo]AR#$`Qo3b
FM9#W_.AYZepo^NfeJ;'lLJ$!\0s,<XV-bg=4"&FrYe^7t3(-`P+qcFV]A-Uha3(k&ks*lndB
Am6!VMJ9YJZ4R_#Y?+=0D7O7_RjKE^?&0(-bJ<4;Q4.RC<J.gL*aVPJJ"'ssrGWss^0YZfUC
)XCVJ'*9>#m$d<jL5K(q#W$^CEoJqCL7KPEBll7s4.lC;!pQH1$Kpn>uacrfCQ(kVZZ0iVS[
BfLHL?,oO@Reh;+!?%hcI_mqX?dqJZ=\P4I"\&Fb!iW<1EHi6%pT!ATpg"5,[iGG7CIoKV,)
;0qA)#)?-AgS#$.umeN*1"S@S#jf_\Y6ngmX0bL;u8)koUM&QH5:23pD\iU!c"`C?NY8/A6T
^O4(5)ML>)f7Tj]A^mRV='KQHI"4;q#Gj)D]AiV42ofhE0"ECS7ZOsD4KWiQL)LArm7%3D\ZQ#
R\e9IkNuA`f&D+Enp9Q)P'R+O(/!urj?Y^5Cf\HNDAc?rq+!@B>\Ba5B[IA8(F)#6H[I=+Cn
fu[fD8j?4R=WD-4!-E=+8#Y/"8f+l_2QO9XQ,-g(Du)l&1j'aRK(W-JcQ<ICY^&AXJ`/o"lr
7;q#`*jnInk)L:*)?>P!2V?&isI35t.33s2J$Ll&8kN,ja4T2Y)n&lq,O/hEQX@=/<`&l+JT
-mHKH*^B`XDH_BbAR%RToqR(a3/]A"&-2)F^$0./2a->s2a)=<KSA-_`\tjj86_&lHVaH+_::
/e3gl::rN2B^<;@2"khNW-b5mR)6d>!!Gr]Ata`k+IakZ=//P+N[5GU[go>ul2`A5(#(M\Y*-
hFJ5VbB#n_*m)P>IS6e\!3@O7&\4eeh_5%ia)IM37CU&]A1-XK=fQQ,abQpZ27co/NjW($i7E
1#7B\4`27-R=E*qI5%DX0'5UtAJSVf(6YR/j[e7PSpL1tM\nb/b`;rnCJ%lX=#oE*Z"@e4M2
,6a:=Er9mZe^9lE4.)tVio@#6GY4XSlF;^iqs+F6]A,b.>k<e`cIO`a]A(!`&nY?;'dPXmZ(Eh
)DY2St@Dc!3F(cd]AD"?_QsKOEWk2*bM]Ah`b(6@KLoEi)8Sj4ac^id66t6TmPoac\g8/G1_jt
$;"rpu$'rI&BECb?gMe;'(<9857Q*LZdSFgFtCWK5feTUHqqW5q=i9^s=DPQ^$H?'@1RqOI?
6bqAWb2kJ^TA+@-B6`.ik#ZnC8=LFJ#'jA*PkgqAg$PmQDe+\848K6><m%m)[-ksR-]A4gp?H
(o>78+.Cp4b4R=9'=.,5&*Ie4AM'P^sWj9QoOk)cr[a&[Ts<hP-fYdP<=)4`?SC-W_EPP@2j
rG27EPT4Aq3:hQehG'3J3,:,&YW1QIR*f/[CJ;Q>E02>V@k"SS^H_qtd)uDBgfeW^^ms=$&c
n9m3_f-::AMArjO`6'/<aG"Va6%Ur6q@;SBlNe<MTM,FU%Dqj!k%,!N[_-cY=t4:-""q+!'1
o<D8g=b?NP;Np29]ACgF=b9MuDC,gP4&HBopKPft[Nq6"gk-($:e)=P0`tX)Ub_2UH<FAN;\i
=]A%7U?-@="d4I!;ikjP4fgl7$o>9mYUbKEiaLo8mEi2[0%NPp3fUr<ZQESPZbLDlU582nm?Y
pm"/-Cth2\kcVS=JXPjB[KGQ5Y5c]A(&8G=[_+`'njN7H)S1!#C)YjqIT&rBLI(,b*,$rKnQa
u/'8?(&428K=K;jnd\7JBositO-]A2@e6OTY!#tU/54;D+bfak=sQkGUlGHn(H9Z*KQ#3XX;(
gG=;4nS-2g=EH>!S[$-2sS0HBlujC/<n%2oaCZi=HQt`Hi7CA;Eau&(1IC\Dn<-52naN2@BA
KYj+@aBO8BAIlPG29m,k$m.Qr9#n.dcAS:AW:K1<_b#3a-uF!hA^!>e,9;Y?7Qd.M)EdYH$+
;,qe<,T\8+Lh`_NZ>6?2DO+am+ieN'@6,]AIX7W;1$)J<]ASW=I:G:Pl[<)KiqI)jjdZ4?l4Ih
g4GEiC,f_0UBG-`9tF*dZ8r_d1-kfK]A19gLfM1jb]AK?m@.2Uq:duTZ>S34,bJS&kT_ToHS,<
'J)UnU^8UdjMSAOsh[n\'3CUCt.d6O):.!4;q_Pf#!NNh3PCg#W30dklTA%3OLSHabZd8H@U
OlfR74jm#2_;W/O+&]A$^8/2toPbXN<jCANN<H#AN1mtTU*L7ISk%50f)!L2Z,%YYgbT#G"hK
3'%i%&3f66h)Y2I`#,d<#`Y%k5LlIZ$PDu"'C"qV#omku9HeoD82P.5YEg+;Z)^aB!t3m8DX
q/JZZrGO]Air:d>LqGjQTh#/D]A5J_.eXO2^9JkkK9mV"8U&7FdZK)NG,**(%Ip7G@eDrPET=F
N)V<!ufroNXAbK(h9MDDFB,\^C-DRUF\ooc!Ad`Vqs(i;-VUe7'_YD<`0$A3&s'OYH1;X+A9
T\^k`(>m$qNaCUZcjDQEp/LJ'/RW,q>/MoP@IpnMkTFHYFmV',pCV^>O/P:/,os+kb\SaPho
6/Lnl/7hge`T=f2)njlPifjfm`9Ook[u"oR,ZGnM)(ah3H%UM<jTn#^2;5B9,kF`=Y\L9*q0
!XCK,k14BC4Ml<uIq;aSaoJtVm$Ig!NdL&H$Y=po''!4Is"qF%&\S:r,@@ZJf,+'ba*;lt[T
!.MCniV%LRT15%]ASZ/Vk4AZ3@k@*Ll]A+Mkr,<nZuFE\qe*F\7P9*6$@oSe;Vq[CFc"3%,30R
1>SKFa>WcQf-m$4k8Gg5/P]A1FG?A=K%#q*EWD,+/)32Bn)S]A\`1?si8j;@b?-Jan4g21p:Wq
uMf-r3IQ'%NrNpH2c^kg+Qp2\l78Q1T+%$H[O&85J_t#EU8$0k72+UCIdVoQ\q-+W[0dB"(l
>q;kHYma5-,@]AOg:"W"@,%+k_BJGS8,o,Rb^+U1/eX:j!qbBa6>A7PGC"S<l*nB<mC(>7jdu
nLngH4J'hIbcbgd)kC]Aq3bA1iV[X#d1O[!9:L2j=B7]ACjW0kK^:(K$:6jQI1oi8Af$LV^#C4
4+id?q]AQGdDf^sgl4S`Qo4Ed@c<:N`VcWUTX1Y'@q71m1=\$)ri3`D@AQ&m*@B$r<,`D^N/P
ke*-(G9Lo\(G?$E+nkJFr8hX?&>1'#A/p@LZ"5$h)m>9n.rCC@1*]Ar6E2ZH6L95kgFEN:goB
\Li.iF'dZM+I%,p6h6ABY#0Sf^-*$#l!KrUud!PR^%lU>8=Keb1-Nd4Gd]AO;H3M_nP8H*_W%
hJ$`FOI@P;f:?_5J+rU\0->Ud:J!+^E,;ZNIW-ZmW@/G7`'3u&%:^ARSfj"DDhkWh2d8mKnZ
13DMU;G+F?8nK>j%4b*Um2amD;-XeWgLf1[L._ce]AX6N>('`1X34-"<Hp1(k1BRdcjR]Ac7AA
PYET[N8:V_3koS)pF;+<UJ/t-gW&X*c"\!LXMdbS*p[nP;]Aiejk"!^1k[p+&h@/=MHRiK&<H
-?4QWq6eQK+^R/a/lH-=,#tX&/DC/3.O4bQ88Nc$=9+,h1b-M<5?'AYHX7ZQRlX8)q]A;Q;X1
M&Db\^Y[@W4mJ^%lW-&/98tg%r'cncs(OOk;f_[?83inN2oTnG"lV]A1^B!WANd5G+TB9:!j/
.aOgiREoo>F(#c,Q@U\s2SH)kAgmu22LQ-jJo'(PVQ&X`_97PH7[HmB089POA=u+$$YciEUQ
29Pah0=o#.LEp.VufMB4f&ML)CY-I"buYIjER^f):iPPa.^h+X*"$3X&)M-q:C-FsAkQ1(-X
`(f?nmm)MA<Y(^/5Loo%)`]AYGAg>cS)r9(^0]A4`8,s>u,g')2=Jk7E).inIp\6G&g;Wi.Il+
'``;[Fk8Np+Z%m%gLl8*)'6#sHUPo/,[><%hgY+1>FCa9ceFX_fAWP-d^G+`#_t<+"Tf$Le[
FL2l6IrQb6F*+B8-VuI^'BV0JFX=`%^&UWK=V$usLg"Le@7=lc?bf*4(2a-]A5q+Q=BE[_iaf
+P7rR*<@-5(A8^H_6o=noRN##6!I.K#*ZK+W:ed<"58h"u:V(TB-.h28D;pr8r!3iG%M<MpV
B,PI^gf+ZUaUU\f(kqcB2?WJt3e*:8ntKOA+!UBFmupW]A#M/l2@@PA,l(ot$Q[19\T/+A>,0
X8>q*:9a0YX*L(Kk7f:4M%-Jb;E^c+EUM/3:N,N'JU*o4(94#1RpC.Nloln82mlH:<fYuW)?
/X?f^t9%N:TmL7"?h"+L;<B$oX;$p:@RSo;9WmTA7oI*:FS9l0.Aq0.N#U\KA$XYsH'C7bd7
\c^>VcOkp!K0+7>[Cb5pY:0p)`-B$(QR`mW'[:!4cm,[HrOpq!]AWHMJrgBU8i>)*CAA1,?Cj
aCkGg,#UXL2YAFY/[5-gW,)*p\MhlmlUQ$:<,_"?5[P*7!Vq51LSWbocmY-SpP6&AKULCYIM
VtqM3!X;0JfrV-:6'p<bu[6k/0E:3Vc5i>GIIHH"<Te;LRmgjUsR$g#&MpnB%+;-!QA.;ZQ:
XDR9fM3=C7#K9h:kA<)4Z%b?^eRs^c<'8tr%f5]ATYYk;=4f2+8U>#0tAZ4"*WL=kVL"GO@:g
EUsNL_"K<";([VT.*tYV)MrG=bJ8l),4K5&.M:!^+n5n#:P2bHOL5eC$[6B<sL4"5`1o_iu\
Jo`?m=<ibA92"JiLna4$B#m74JfAr)an'GM%d&ffBa+b&6*Zk,>Yf\)jqn0nVSf?4cgX^%ZO
5^();4(TPj;mJiT8lugoaNr\Y$Kh3%P7`)i_>*VUOunFiOmi.V)6ol7'0s2nje'OZ/gZ5`'a
JQS"C%Z5*XRts0Y7-8IHT8d%j?"*5)oH8kfnW['09DilpiLfu7Omrlb4@USoOC!7a4:J;l2h
J:'I+0ZjpG`=#<6((D<tCZaC;0N9qZeZf'"Ks#@<8BC*hG^Nf)B)ICin0Zm#'C0KkYPsq&CS
t8A$]A6_a%GU4_(Kre*e`k1$!!Hh$>eafR-HSi!_=Uf]A-PNr8`5rf!&6DRC]An#<-A_/c.[0e'
srWS-SY#H)Blo(;i\+r2Eq_f4rK\l8t[5=6IG0Q06M<$KTI+RPn;`t5GF+Yb&k1k!JTtqMrd
-'!.\f-[Ic)6Tp*)RB6"FE:_+c9\&f^#1N:>&pp>Pk4^#1"-WToPQ]A25RibD!C,6FW<3`5k)
$r*30=pH6"X@Y6<-`W)b`bS4N@5O2q3,.eY523ANW!jsY9B',>L<%(qVFmLsuS):LMM:$0h%
cD,9Q)@C?.@YSO%BD6T%hL4CLq;_RQkq>$o"7;eW1R*+KZpY%@d-^JdG:36lChs0qr-'J7hi
%#5KRL.!L&EJ;dY)=/ZE%r<a,U\qmE=M3G"rNeBM-NZ@1Dk]AG,aH_EC$!*j!J"`p`[q@d1mG
od=_*+I1iq_f2sEoA[Wm#]ATXbjl3IDhp59kT<]Ar:)EiGIuB9aAnpqG\ri(Nr'!`;mK40kT2&
Yi?'6QS#6#BPYR+?h3]A[!K=P+tn?V,l@T3+9V'SN(UFck3-'n92#(J4R1]A">`G@]Aa)brp1)l
mXJ/hR;9*ECmF,]AV(.91-@C)W:;-UsP"jN`#&I1A/0-N&Z%[e5Z&<SucsF2S`jCk^bJP2hg,
[o67X!nChB_UH'"!J&YB4PqZ`db$)Qfg7G$X@a8__lTZVH5:F,!VJK**M0\,Y0<dSY3g40[S
$k:0[l0.$p^t6XN<_+Gb%g9'l;6P2b33BRkAtXKW,jCJJto'=h@g=;k$OYKh%\f_Z>]A>o8D4
PF\"iB8j+[,?'38BC"C_sB-,[lFr-=H,9c>;]AXkifbd+1FC6QJ/0*]A_bb^Lp.XmGa3g]A@F1W
sNh*a0N7-rf>g/X5/:8MY[<B[H?(<.15+hq\l3_Eg?Y%ooq>/B.FQPAQ;-k1#?fA]AV6k,MZM
7&nb(i+FFME/On&m)3<NWngAZnn_+3%FhEGq2iN]A/>D*VZn53.TK(a1kCMX7b:gqW#87V2%)
0^A':bP1?5%P8pm1MfQMki2f&32c-?B]A@VG]Ao^@=4(:%G-S54(XI(<r%B67i6Hk5(n]Ad9Y&O
'%R[0=hsj`cW.NS#!da,f;/]A2CbUj&ae7(Hr><4A,6eekc4J$UJYh2VS3BKEe/uN8q5HT[PE
_T&d,F(NqkhW/-DjUU!<DON/0AJ?m4ml*Nf=.,I*VMQsm)[CBV1?-71C%ufB-Ze<''I0+>G:
mLTE4sPAe1`4=[\+79cS(/ekOh#KR#*;Gg3J\KKC-c,1U.`#S0'sF>T.b#b]Au"%9$Nq-0>a)
B#c0DFIJ";]Aeg9W![o:Xl^>N0tnJ0+d<Qglk]AZmLCL?(-G7.HTZ=7M=6Cd=XSI1K1T\1Ddk%
U45a-C-(]A3Pc+WthC\3b2ma=*K,Y#72o;G;)fm?e\Wq(CIQ-O',JluO;5d/G>Q(d;6d]A6;XS
!fTd;%0qmqYf6.\cpVc!5=Yl@R-Lad]Ag9\Q1d`]A*_u4dd:[5qM`n:W<;l_I7fWPf=i1GI#hm
\hD0apVMuI<@W@d#3I<_KUETtD8eQ!MPXljcq6Cb%eE2a$h/X93\s?CX00L/*8cu`$BTmA=S
/]A_a]A?BZP!^u.5(q`0;9mA]A6NuPLX'S*UF3dtR3^!bmaEfZ&EkfYG5[CSTd6gH,c..,B)0F]A
c#BK.4As6b!L*)&FmUn;iN$-8.OM4B%b)X24YZ%=YbOpp6nKr8ccN&Wk!\)hB;p>['3K2JJ5
3A&_2,\t^:81*+-;*Sg+X"fSO/66nM9RC@=$'s!D<5#u<A9:b\+\J?:35b7[VW?A")*EhWfs
kl&+$KQL/htdf%\=4aVBt>t82_,PI^rJ\[;N%6<[Ae)1?bU(-S<3S@2ZSVgpRYNE9_HZ/+<<
o!L6,O<t&Y0c-d4T=j9Xd+c>C&AsIIMfj9=81+adKX17B8/A=[4V`/dc(?6"``i?(RA.eb![
ETSG#CsDZ1LJj<f<s2K':sZXc-?ZU9A8Gr/Co_?^#_]Ah^TfV@[VO?/HiEb<l;@R+G%W/AoVU
!SRiWcMgX%KuVj)LG6JLd.(q#AZP.rQjY97IU+5WaXf4Ot1@_1=VcAZ?_U*c$Fnrdp4"=N%M
SH4$33$4<^/_r3-I!ARMRt$`SF.M*;P]Afs4X`]A8hAV9k8VI3pAA6Z3BJRl>.$:,6EOS5c48#
%l7?V`TX;XD[3+_.0Ohsa&7,CL#S%e$TaO8:8"'h.%A2<,2pkU*lhX=)[CbAg;-50fW=?G7W
U2TOE07rb;Qm$"/e20#DunlM@8]AErA[67U1sp!Rr0?RCIs[H1PH(IV`hmAD#>7Klp(AH0\rp
R$=DWp/s$<4XtgF<m#M1"=j6N`SHrU-#a#1;$#(PdTt^?l/fZ)&C%;Tp]AsjG'?<-?4r`[>um
j%(E.VO2L(I$BZt1GN1s.qs.ikeBXgZ2<^`KJB^_k3kPL1,He+.*c+T;b%7i(Aq.2XgktBD?
HBk-%,RM1cSK/1l3Zh\:J0^T6o^$372:jjV[YlrM$;d<aV^13k/;P4l:@]A33>#&>M-iGn*\f
0o>ZpT_b7``=U68+_m+$2.NP=P7GP=7WF5BN$)r!99NqMK&DnG.O/Da@o!O[p^3Ig\6_Qh%O
J)SZ.b+E7<j1,9KAhX1B7RF[:rPri+QB%Uk$VSCEB)4OH`RHc/A]A9ZYh5%gmB`m>LYSASB+[
`@>CfN0CGQmgT8ZgY2abj'Sm6Sah7=d.eQ0+s!5.-9cQfhSNW2[.JnS\0FCMa`<`KWi2r__G
H4?`N<pe(*+Yg.;oR[+Q4(h_idOWo>:[q%7F6Jpc7QG08/nAA<;Zjf^blLke*e(-Xq-Y%h?j
UcA<A?b-]A3AL2Aq+4jsK`H$@jTcJ1^%F;jb&&0589+4:\ncE>m[5jllBK4N,Rc"qomui%LEH
r6:4/V]A9DQ?59mV"*l$"r`K%20A*50kNCc=hs>4[`jck214FhT_eTig.)$6eb-TSRqmO(6De
6$%&G0juc;ZPag@m2__9V[#GOk#K,_?;>%E9Tp7_0'-@f86af^q6dSJr>;_M!l=p46oIu^/W
tZ>e(Y)!Wn(pK`TOMKIiVpOKK(kA<6J?0%4P4Tt&=&Jg4:)U!C[]AXETf9`DQ<?8)j>tec"Ou
%&`-Rj/+8;PRU\*:^.u`=&j+t4h#Q)mOTHHc,ol!3'+rX7;&QHm@o@F"-^&ZYZjZID^C*F43
LKBi%FDl2&:k+Af*t())Z#%04]At?!e-.>&R`\)Ir=o5BuQ#6E#$_fG[^B>N$kZeJrbX)7,T!
$<aI'`6A*@a..c'ittm7e_<_Ik"[e^ND-AP?pndi0*^V*/(QY=9>a.DsZ_L`D90U)I<R4e5N
#L!Mg,R2UB'&M-4,1Ts44""j?5"Vt?#jYME`k-n\9Y\M3Pf]A]Af/%p-9]A87)"!jM4%u@tsq75
Hu&CXMU<=KS1pK/aA?3<4u')>U&mB(7X#S)5"oo&C>DS"&Da'2ODF/Kn\H[-\c&*C[m@'25%
h5[)Tl"<u+55XD/=+N,?:_eDk7*kIq8!f\0kDT6)[RWQYmqI;j-KRjG?#H5[P<`#Bq5-U+YG
\IZcsFfg`H*@Ji%Q5pndQPpO'12t&#5']AYJWX.0WW!f`b2e[^!.5>u+P\JUDTC&s"OF^(fpJ
\,bnhkc\jXTU:W_W41>oe2)HB#gPXchNXlJBntM++]AV3##C2V!-1%?fB.VcIECA.`AE1%NMn
Q(LMR5("Yqg.D^$R=.Xrr?M^'L%Bd14oo8nn,_KpLobo^0(qX(,h,2E_ATqi2h3jIUQNXThX
L-,faVL#I^J/H7UV_eZM2I2O!ItEU`beUWF7UD?@F1jVh>="n_XHJ-K(WSB/FKdjeCsc1&1Q
'BCQ]A4#lqc=j^jS^-<pJl@3LXEbVSqJ#*/rmB(i(K1>-QpkVFj9uQ-@K:g)X6_1#s@t<1,:8
qOd78NeB(DW;OddeW#u.2.V"b/UG@d)RicOeL*2)&*;Q2.hG@>@JWrT9*^tb%==-1h/&$gb+
W1JkP;/^!^9%`F>$*"3VH_'jH_qMeBS.'al:,GIVO0+?c3:Ee"%:9G(=YBC[XQ!l*-D+HSDG
c$bhe5;kn83H^<MZb2kSTf]At:L.FRpcFKY$$]A/9<R^hEmYLgVU([_nl+<a1#pY.UoMdppq*p
,O!dm%0;M!,kZ!I9%h45ghb"1Mruamr4`/ISF<f9cI/+.N,s63GIU-^*Dc/lt-_o(gIq?S>A
iSj]A&h*-3-a1IV45so"CLn%/nOYI!+hA9);T)=5?Le^)4C=;`T4KgHKY]Ao(YeX"ToiQb#iL"
AC[I?%:l`;7_-a7FhFma0q-7O=\\jf2:^WAbpbI27F'TPP&c9Iil%R3$.CX=6/,3J]A(O3Not
;UlWZHWhWr2Ca_(PZQ/+0H#e]AlID'Q"uXA!m*IeR`TiQ8>O"[KKOqc*5k&2#;(@QsbB=<o7R
e2Vk)J0!IXZ0hoTW;Xt/ld\CbL1`cqk(gfARTmQ;J("7HN5Vo"!*n%JbI%+L_>2_E6\TUcTY
38l5Q?@`MI,DD$qq>XXVo5B*ZdWZ/+'?<Z,17U7=gTeicro"9BW0[Oj;sMI)5bld2l'<R&E_
+NT=#im`WU\+N"IX^?b!u?\A^69.=K0WX6I'.Gs&TW2V[o@`QC-."haaDIWk7Fm2&"kI(^.i
>-K[2f\\6IY,K"dgNaX-('gospok-CUpHBb'J_SML$FNOI-EmrL3Q*nHQdnO9.r@ejU04gre
\N"'+.7m;2bFV`h012*b0.2dWU)K)`0s8X%'\bppd":*J^V"h!"C0\4F2GbeHMEYRIm\[6g\
VY=2uOPDJ+[IGD8\7asB(pd$!kV)-?b@EC_5WkOu2m4#C#Gt0_*_uMs0h%&3BC9J4qSNg7?H
8YD=4hYq^7^,]A=gO_]AU3bJ6b1r]A=#Tq4qK9sYVS_q!P@ZTE<%9_Z1P<4WQUcH'Sc5Tuu<O4a
hUpUR98h"U1UYS-$'!BY[q'$t2mY!QtUGHOKKRcEMm/'YenGq`C-a"iVH;o.(Y?d<R=%^DPj
6L/XR#6+<<"t4c1Ee#4i6+:0Q%!jt@!YH^&g\2Lfo%g+g]AepRF^oJP`Vh^g!<:)h'B=mGf((
q0$`T_A;ZgAKPF[aE8Ds!(QLB\6kcFM<2ef\NVcd;u/?(a]Ac,&`@igc`2#GN3tW</e))@m7?
7ojo:I:a,/UN#T)P&SN8Z&0."r;A1CiCEFtD]AX^hdZi-!`nt-k0"jeDZE.-YQNrd5YFSsoAT
hS54nr*OYd9N:E^pUheG4*!^/Q&1S(jl:._LI'ioRIj9lLY;[gD8[NO?=E[T0*"l(*=I3a\J
hH_&6olK^dB=28sKP6^tlEb4*P8aN"'O4iq_:=t\@aN&@PMaaZ77TONTXqOsg_o)jc3`Ss^H
V/\#5;CCTG9MiiuIn`":h\9+dRW/;_&@1_&.Y<+@$l%^:7fTk\s7Pc/%?#^cq`C=MU7#VY[^
1,%n,2K-@40Z?:B`jlLt&*K&a$DoZ;[cN?3`Ft46D7J-MNn_gg$0Cd>)V+,3B%Zd7NlT;'ST
SSLZk8p19RtREnku5rEDs4/T2h5/XNM*@u4_=5K@kV:CUcO17eI5^g:i?@^aBE;n2!pN43;n
148r$*iC"I-fmL\iA/lY1JAbR(.Dnl!H;O6LFmK3ZPC*27dg@+4C82c+J:<hoNH4ol]A-WU`d
p?%S)!5+t\'Z;9?7lBmHSs&5i&WaA7;a`sIM#R(%PIil-is:/;ZR:Hc?%7lN:aM_7$6B@,`?
"sTUj*Fs:]AaW4cI,6U'/%M#Rq`;]Ar"4D>KsQ]A$l3.\7gP.3agX7X3GqnrU.Nnc;#F3qB(,=L
N85r+f%66;:V@jAR,c%R8?#NqOOUjrceu/&R^VH^8uM9'U9j2>)R9,PBVpWbYZ5T%*)IP$L%
HKONJ-LD/CSA!A[E_%G_/7^Ao'_^b3Prbt@mrgcKWYB*J*+3qj*+tS3L)]AnKPo"TT3AZbU9o
D`isEtf)?8I,]AeD6#2?<R<Wo2BH/R`VZ;ZR6QquaCTL8hbTbLmJcV^J@+AU[/c25c5n]AY]AP<
asKKbSC:PT<"\<]A'4gXKA`WFeY*EMbLmnq/]AtHZ]A5uO6)1krmt4!rnKs@WmANMf]AiR!@]A=^^
N4@garV_48J'd;)7d1=al):K?j>e[7rXLNc_tp77_@]ALn`INl`iBBnHs15PH!*u*,3VMLnNK
+LHe6-ANN_8N5Ne;h1Zl8a]A_/snC;b#)3%m#EN:a/d!-?.G."cdEc++Hg'1uiH#V)s?&[]A;*
PO)]Ai<4**XOP#FEF?_>ib87=RNVU3/)pMY>gbXM%Q:]AI,6\lJ]AQ5!.R4p[,JY&2`dfIIrCrF
O4H-s!pm2cHh]AWjZ66]AMAtsH5"FAj`>J0:(\m[%qT'^J@LD:EE;lg6+l4Yg2CbRB73^&.DQG
LX4Tjco"CuR9J#IJ(6U5YsfJa'@Dl0`ZlImRt7>[dm9[msi;7PIkU1MSTUgt0!<94<S#r^8_
d6/,cGq8*AIFZa5]A#^@CcSG1Bbg^e]A;qluj1e0imXaZ3?j8_VJo0KoSYOS+tB.I[>%aW0c>[
R)EC6"kb\Ae95I)c(sk]A?5_fJ_qb+dnPjdQN1,elK!6Y"j*N^JA,;Li"s.I?q??>lXUi8,cR
GTVFaT^7RK!A4cOZ)EY,^ij?.ci]A+,(7rIK<(6uqf1*fYA)S$dF]AfhgKSgPQ!iDUPKNlf<nZ
Cc8a_4J(<HGS#)_c(d3Da+XkG*VUd0^PIR(B)&Vq2'$NZCM[ZQ*0rJ:h,p2MiBLn@2:M*ToI
"i*OL(;=a50tds*ngLHCUK5L\h=Ni%\;E:=/UoO'[<AipV9:eCZXU6'RuHhU+8R%CglOotkD
/s*Iuk24A$]Af\f<s+d6,35!XU6=o<ubXl"p'#>KACq-9o=qE!QECGm).L#:JgI]AdLIjO<tLa
=\>G;N8'aeO4cT0M84h9mEFWRg'"ijY:UmM%XpfSk"eZ(K@V56CiD-jX8qmlW[bHqN<;SZ<b
Wg6*=:e_u58+kIFmALuI,aV-o!0HSLF=\9)j-&"AeS:blil4D5;/C*ulBBj"GU;+D(9upB(R
/EY"-Ulb%ea[D(<#8=Kg$A-YUZdE<M9c=L;[G>]AJ,JN=<*f@IOWWB<1NSlEL!ZfuT;LTg*^8
/MlIC=YNk&k^2j1pWc]A?>S$)uf*%R04jRr+0S);#-SAZO<37m[Tg9FbMIT4dmVs#34G_U9U"
+)[_Mi6tb&RD;U9enj[PMs8LJOmdE#A@DaRQ%)aUh:B,^GQ3/_7NueDSS.O9)_t9Co)qWDFU
",u/MO+Op8d4.Q1M)d#on/C"s-a:0aAnUo/OKe,t$5/j0#"*@Zm4"i*/MF%GX(,2iaYkQBoH
*@dkJOD>0H:rN#J6[PK&1hC&!cHtM<h4N]A0?n<-:i`-c>>F]A)c89F9NF[a#Q2f`2T>V(MJaV
5eLK%=#f*cY$%NMbsBuB(XAFqZ-^%fA1fRnZp4PQ?UW,a<u_"2^;isX8'4gg%9,6_G"l^Zdr
+=aKcOR92[YLAue;?1-K.,@;3"lG:'=eUmt<,P&'t/%M2e=#1K2q/"!eGn.D8Bc's:]AHG3Er
WDg6sj!$T>T>g^kA!geTF/:+.Y]A7ss^H's-PBt7]A3""=C-@!hqr6F$R??K67JgUYF(b4p6N%
]Ahk_@"hi2Z#/BK,?Jt[?E%WjaBq1+G/#h-:REmK2KE=f8?j;=X[2?I#Hmu>@8LC@6-l<e7hq
dV`8)V1N)<MLP!K"oYpDF+J$-[I-qk$4q1C8lN^tc1.O>WS3%GHRq%4J'9BR"g#Y@m1,%g0k
7naWa^J@iH!Cuq0O(`'aKb,$0mL<g7niECq-&X)W!J=68^ZGrNcbP1SsrP;moY*W'+;S#_$6
L:H_EPWCtui5IdJ5Y\5j<$rF9R/$!A#/b:&SmLBc8YN_68`g`^$:,]A'CBV%1[$WtCU+>lj0.
%bcc/jAFtMUia!DH!^3^*@ctR3#]A#b^=5I58C_!fOFn^),f=L5,NQ=Ur\AfnH4%E4^B5h5em
ZR@cRQu56B[HHX!X1t82%oe6GZ!1Y+74bjFpt`7eQ3]A+R*,I"WIhJIKrl]AA6DWe&4/(aXH6U
cdbg8!]A;;a]A!RDu:U^e=6@E]AfIioZ@=i=fg^-c?!-S$L-A@m!6$5@+Sk;,7.l$UdM6'2]A?q1
3,"9hWqt_d-OWsU`p:f-t43b(kL\[p`$p<B#SrfY.?PW5!X4]A5KV40YS-SO+Ej?uR/]A*UN5T
7LGc9#L+QIf"Q.Gi.V5)>2SBd(&_GdDdmIN5p6:FC>>KOlY'Ih+cR[N\-KHe)e08\*3KQWr)
agF;;"cTY$fGs.3el>;0\C;lgl$>\JK,VF/_o]Ad9r+hmAbUE?u'CD!(Hka^nT]A&?A%aP[mUm
o;mfdi'nm)8Td(L2W[jrKA9,$BCEEY1q4c=`RnXilW31?M@;>YWB$^3RsJ_E1oKSe9o0+M_Z
KUt"A.@XO$J"ls.nTAsLCc]Aa]A#Mg0]A/6e*,PaC8,>RW$b)$u#^f?!n]AR;]AP>\bguuGb$uaMM
@')!>Eae(e'1ZU2jZS>W<hZNNf#YXJfK(nSaP4jPkqY;%,2HAV79:cjqX^JImt4`m>-t6PqG
C[%#fC`q'&4-pGe<^XDlN=[dX<S.;o"8D9Mr$[k1N07]A?p?O^ok\/$EHF9T/bD\"BMWB@eV/
I'#./]A5U`7URSl[r%aY2j5AY0C0ZQc(W6HXq,=F,_`-Ea4k"4#/*]AB,7n9#CXqbM(RK^QRUZ
!()T*?"3DO*HCUb:m(q&9ZdD>GCKrTa-#*rS;~
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
<![CDATA[m<f@J;tV(/5qK*T,Hoo[ALoX@GtZ5&@;Osn\m(t@QES(\8i-[h_$5k)@9Vkp=Jgq40F/*s@3
R?,`\u#,WLs>*#)mEYJ.9L8YW"OSg\IIMV:F[Hs&SmNs8S9)4tt[Cn+ZaOkPKY!n+3'EqqkO
FIJV(M:BCOcoUGl*j';YPQjNg,.OI<=ras8!D*7mc3rJ+ZIt'-AA=o"tRidoCG<7e-,O4ZDM
UXk>J]AE)^-bFT[h!0CKE-t*uT9^>[4f4bp1<NShl)IZXSuJ-al!j:F$`OjorFP[=061Bfm7\
E)O?_=!/,n<#?^cZnc$A0$mTdoqX1`pQ*2a*gNO=?<RcdmHneOq))1`>\B</,^i?`ZS6f@ea
>s=S`kt:9Af(.5r,W[gB5X[3ibmU*Fq<0nA`RGd,J9GdNg8i'H!o>4(Dj/*qfGcY+:^Q&W5@
!J\T1<6]A>ATuFgbcM]AqY[,S)Cp6g9%Vh+>T[63?a`5b<r\?Koe\WUWc)i(D\M*HX%D\pS=1J
Y+MX@%\s@V/pG1[FLT]A5@C3hq_]A:Z5:3]A`b2OEDs^7I%85UMFkk[9ao*g>T[#hD%C!bfXdq\
Op1n7LG,YTs1($>)[;=A-)MD%7:B&`f%05-iu<cBY`ipTNCAa!,-L&?G\Wi[C8%kH*"^c:Vl
Qg<g"oO+_4QpMEEg;%@H6"mQCBq%8US]A!tG?@<Te%"#jPaS9`Mh9Uob5+>;QQ!/fANi.o.k+
eE6LJ6Q]ADmJ!P*iJ$JBmEK+gd,)/<qFHVs<DS+FH+4qk/%JC%\QuJ;o:,o<+kCYb7d[4WeE(
nqkZ=9Z@LE(\NPHC+Lf^Mr#-JO:-"a&Tpcd[n'%82Hf+Q?8'%]A\<!Un<dD]AD1Ks]A65W]A'oJO
<eEu6?m^\W+Jk'4";AJ4.gf%D='AQZ8Gsu\5#4`SR^=`8bGVhFcnd)eQ8*E?uUh_SpKW7Y3X
"mVP[WeLKi1Ej3c"*57HXbqCK6\\)":gccip+ThgC0tlV8Uq*]AF<G;HT0P>pS1P'0=pMkL3I
pLQY_&-#MDFh>mVJ,F`"h!g&f_4A0sDfQeU@.`XAQg3&8moC3";ES72]A2*@8m)EkR!KELu_7
X>\hVaQ(E4eFn>Va2Xt8P\X?"MofhIB&f^@i)`PihM#8n<,_\B'Q"$`TJNb_YW9\FaD]AjT+X
A/"J/enV(YN;5E6m>?L!j%%AVWeKDcc,VB7M-VYL=`*EN.3SIPD?+49M82.+l9]AFqb98+70;
o[VVE@*Z_uOo4RjKkbIg5E(0#j[DBFPjjpK2n^!e^DDY8gFl"ITIsZh!Grb[73HH&lrN'gTj
:OgVH$>9+lt3'IYh5q>BY/nR5as(:,7p3Ql@E"BEqpi&FA]A7P27m\D6>I<0"elS3Ut?.hX6#
Urf?kW"!q/R#bn&T8U!O_`mp%W<?:+P7XkoM%H<O"2f<[4(/`,`F%3I^>m%%uhJ6i4^]Ard^H
9ENAPND/0n5Zku0XWf(5-Wr((cpr"3PWIt$d^,P6@3cXhAV*B?\hZC&RoXp*os"lS:#F+-^i
>D&!oiMck78=!\Q6K5lB<ML7\S#[HFckb"]AWl_d#Ntm%`H-r>2$#gakYpJfD;Uj2bSRRT9Cu
'+)"+W.%Ab-WI/J!.')3X']A\X0XDAi-$b^aKs%E*LK?;_YYOb5)M2m+YOb)dS=101RAW*[Ih
re5Q-1-/+!miWc;57JMP'u:uKIVY6o#h6D.)SIohU0*,3_gH:"(Ag3*<^#q+:f@Kh9>]ABQ8@
=lK'DjMq3a&"R8mrmQ0'G4)a>A$+C&YqjGs]AC7ar/Y[<ts*Kmr@FiWU_Ds0pn.+9T`BM8T"D
b%HkZ>Z,lnUlgE@$nkU"V'N[(&C0P'Yt]ANrbhuU/ph:_dM"H`rX1OAJ*1QZ!@"T]AGdo4,l_j
i!*Kll&P`n-kUEUcp5X@TC#YEcR5du[%Uh)`W\-pF0Gq+Mm:=p$@\]AgfsCGkuBY0fj+`alWL
7A(=RtbD+kpj=ML]AGG&_D]Aoh=(X3&Z,[Q-kQ'M/E0HkEenf65K^/Ym&MN'mJb9iinQa&-=mA
>b&l'`4hHEeBfHO2+j..OWWH1t(#8':=I#h)qN?6g'Q>?G^-L`'%0hrLr64PCp2Xg_UVQ0_r
siLFS,WkN!m4DkAL>Pa6T"m[dWXXiELp=m2=F%[]A:Z",i%jb;8dum?[nNr%Ir8FZf\T<i=j)
f3K5Nk[P?o:r/o"/CuuT6N/P!(q]ABH=@1\ZfrnW<1:8t?.'$)jR%?Iu1lIJ>H9@EplfE_^hs
dEX49@>/5?:D?e`^"^^c)F(m@\8XPOk;YWFTt_DOtX#ZgPA38F&3T+PEV,p@j%J9'c3=^>om
)8'+0j@gu_g4+6]AWDh?O9`*)A`mA";s6Z=PKcK;58?arg?UatWqEddNDXONVfLR^SN'&*-4U
dVQOYu=;0T3Jp<f)<0nf<uVD0e0#7Bt%O=7Urs?mc'\99:TP'njVdr&QX3-a^I&I*-qZ>"jJ
8=7lZ\0OtV#rilL3aorP.;PjRDM6CN,8!;'m4g6jqh$T0^;Oq$Q*0.&d?^p'pj8WHIa.hs:Z
DL41SgnNA$$b:98ERqD4P,DLSgiEo-iD8Bhme>/FdTA+^0ko#]A22Jn",Z%G1m*=q.ao'7mkE
L]ApW`K2`*b<!nVeBhZEeHRQLA@DFWieERoAKEFafMqYS2mdpPm^%lZUF^jbC&`22RY;u_>rT
_\l"TbS^+e[q529Js'F`S'oW,_VrcAu`%#0bT!MUe7.J)$f)8l:2PMUt^4`ZGlrq(Li,rn''
f<,)(s]A=Ze;1T%X@u8+gpZGJJ67#+o0XQDG"7>e1^3_R:0cu)VmP/[<jjig81i1aBt,%$"J4
u5*T1*^J-'T<PVY*.-e@VV_e-BI\+Zp#+W+lf6b8oNo=rHQT:tPf(*F,cYDom$F"K^p\6#N_
#cb\WlV0ZE\bG!]AoeQsjlL`>eJUo3^D:f4)O.#9X7NU^6if)Z=6:!mSE17=:I"eAs45'Bm@Z
ZAR=L>e*<k9HRC?s;BGN_c++ApX9n:EAX2@.m4^CCpcV$M![8f>bdr?%/Udbo(2_'1`V]Ah]Ah
lW!S(i:1a,g*,MGcqaU?3/bZ#f0"g4F0@VlrpRcN4&[us0mjL6(@LhF3$;fka:(0WfidLcnf
14&+hU9RWAV:e>^)1VRk_U(:o@f^QCiqjpW#SBuZE7s<Q6fQmZ9)S9e_td08jX([jbeDO)O[
L-CGIYh\kG5)'LWDPeZh$$*&h"h\F&X6Mq,e5auQ<W[&G&IXoroM4SrVWUF%Xf+j<6qAsT:W
4$<"[Bk8:Z4M>JDYVU9u%*:;B2WAq7mcbuLlJD:$,Jl_lP\tHdh8<NjA@iX"l`gn2b@VFc&r
OeFhH^FNm^YVg?l)ELg&4LC0.f7$p74hY(h&[]A<j/t@`UK_tX99$b%-bEQ5qqD"Q2:q$rDB8
qX._8NPhs!t4h"f$1(irC1+ZkeZUi:b2"amB;e#ju9GI(8J&H_J2A3CN_b5H1DV9P&3Ds,OM
$UhsIGH-pker1b.G>^%l*6.^oS5W]Ao02g2E_-BcaJTHki?-*]An%aoLIA[_`hC=XWKbL8?eB"
@",N;5o5-/hams?HGmZ44[IX`#;-%Y\(lInGq`/EGm\pYmY'>1flMe!\nPN>H65X9s?oNuIJ
ZrZDn)eR2/5T/TkWJN@V5m?c,\:B'Na;jbp>NQ82UMc6Rn/;0pqWaji:&24D3>lDZI90PPPH
(*bV37$.01?3VgmF@QE.bJpI'BWa;Hu_l]AAMWCa[p]A3/LEX>*9U8,5n;.fJ^6Cq3jL`D(^/'
,me0$s';6p7U/(06E/8G:i6,?_a&_[]AdpIr*R]AJ$;HJ=p0/u9mjXR?YdSrDsE$:[AF/?bh\m
K5JurNl'o;cG&HOh>!KW00t;@J\)s"YNWMS[!KV4uZ"!guAukF]Au`"q;(auFgFtGjLdn39D.
;DM;]A0GZJkP)<ejJ(//]A#8)qf+2?EuEcm<Fl<j]Amg;&Bd-M/bsc5-p<%5Z9cF\VhHVKFqY1"
nXGNlPc%joEFZEBiqjd!A)k9X;BeZWZVi'5G):T7kKO5tYE,5A`cg"u;rQAq[g"#Ph_:jB([
s>mHG0S5n"U;3X_qR<>CBujl(8Q6Kr,q<Q)ifbMWH3i#/?D-_Te$&2[f<pM4V?844%V]AQ.>#
>4`\\g@C*[-V*\3&ng[RKKQ3t@nY^Oip3j0km2b]A)FWEt_]AmcIY(g:U[Zs]A6s?I<44NnPeGi
U+-s<mCc$-bYn3"%0sf9QUN'^/m$UC1j`cs3N\kYNF#K4T_t<88uk-[EQ$X$IG*efa+A*(*q
QKV9<QeHP86jghQ_d<#GU.EWTViC)UiEep5Q63QPK-hIi!&\gjh2GC?Ss2#'B"@01t'kWUNN
UR:H6N+VafjNLAnGuANJcIJ^%dihUK$n^d.>=o_br\1[&@H.km0Bs_3W-b0[Kn+3"S-[&?,o
-`@RB9=O&M@4?$PM3ePm"l&Q23Jm*;eDR7hO>2lZ]A/K:2pQC3NUAG\):nV,]A>[\b=8T%$0B2
$"G<<\RCiQQ9%1&CA^hQdfI3X=gHeI2&3g!R$qZ07g+?/"Q8>Fc,8Wn2@^fJE)nN`=ib8JNC
?j,sB$F]AH/9=/G/6p'CP_o(5Jnp*P",W&]A*D;+FIi@iQqiG3Yf<+"67=bQKDY:CXFk/S&6K8
QecIh,-jg@+<+9UHHn8Xb42:sg&`X4!9Hn&Z>Ca'4aG*A:b)N$@7P@3+3bjrN>(Xrp.4,);B
l6jcOLm,7sMLCu9+Eg":/K-\3cU.Ap8"e+6OSiVs[%i%6XX._/V8FU>b#!*M^&>+J?\`eS.k
g*gpe`WoL2+!@Bu&pU,L'aK!?dO&4(lN%1t8[X+S+QQKAjIiN-gQ-e`#iQY.7,lm'lDJ_gO*
6fb5.sF>&93hP7TP2t[M0RC=V2-moi&or;#c1kM=8#=E4,QoS?"H`O9C?`.?if^>fKZ4cClj
pdi+'g[V'fcl.U`2&2"GKr*!$b$BLMnod5U"U!I+X>=Q1:c[Hc#(;U_r8H.5D:pL_0Pi3PI)
:_"jSVsLt^Mu%dB`"_hSQQ8l#Sdq(#nXH7:I(7\FO!iG'XJ9<=B`ag'&(/h8GZ@W3;7+0&#m
Ja'kOkk)M.7@`%&NlNdL3o4c^<pga\0m'#<B#J!qo_%>$1@[iX>$fO</nj8PoE1dDXXLeZ*(
haDgPiR6f%i:V#Y+i,^7d9\[d!tOdA'$K>6NR/WjUd/c.SPArdF&;Sg@oN7[:Rk]A$[:]AZdm8
O,_If#7jP-mRDXTGqfNScdUj^oWR#?L%$IG^fTVk/J(j1s:;E#P:e=G1`e!&.Kh0GuV3,^-/
'#lR8B353G\_mhcF3-]A2>M'_j/o"NNA$&'b+PC;Y2dW1'Aj(Er7uPqV=UV+o#g;;c8R[sq%Q
47C&_h*53dDM0_5)Go#6C4AFpgFACa6?=q.]AQ_ZB5n%o*cE^N.>\pWbeEq]Ah\srlm98`k?EV
*9XphV!om,2k8]AV>]A;mSCgD6i5T-!@3VRN1AbHVZlPE$lC3@"FdU/be?1XYKd\)JoTVuP=Ns
_Y4+C?K(_OFEblh[k@cn'^[;G*bH8aIB4`Pd(_WeR)ZbFa/g,)[adR.m=]A4t#+'K>ijILbWG
l`mtuaWII!D,ap7&7rM$P$0d?GqH?N.e.sE:Ae#KLZ:k03FiO/@f*jt.e?''^FMp5;f/hb]A!
D&6:GUSH(YIV:5n^n'5Of8cjORRF?.s#iue^/#u;SHAJZ<SIt.h8>VPC+Hr4Pqa)DWX$*+<"
t1.i%Z=pQ!D-r,e)tThKCQE8!h!,jll>p$[u.N\dqRYBgGCqRN,@KYj$(n9W_Xmq&ZYE3o9R
"(C8Fr`qLjP;,IFn@;),M>FaUD*o_R[KdP:",>"_0m8,&Rd>R=C*7*-YWi#@<_(kT:1D1J(8
N7sWcgJa$B/rtf9sQQZY1;Bm'nQdq<D[<(Ji,GLo2'lq3&/C=W?O)(fOFMGYtJ@/!BXUU=TV
_jRT2#3Q6A`K!6"b<0?*X=qK<MB:f+s1t>U=;X^*&lGlibbBg2n=[ntG<a0`C3AFgUqaV*0D
p#nq%4TS:1h30j_C^R$`I#B9bMqY%,1_'1(Mume]ADT=47>gCao5^nN3%c,5"CG_i&Xp$eW/X
7<K)f2k-DNe6.]AI8!bRLKNs.7892'Ccl#;!IcPqh5&#_#!J*2TnEfJQ]ACYk^ZdpZ2%s_8Y]Ae
h]A<jk3X_,X*eB)RKu0hH1WGh)8eHBso-1>am[F`H?LQ[ADiE8JK.:_.XZVo=H*Y6WZ:f1rb)
WOi0uZMDEkb$/4N'',bIej!"Eo9fN]A8]Aj3i'$RaOWWin@fC+K8X#"K[#g90AU\0LlK<o.9Ol
>8s17>D]Ap,aS,>.&Ek1H0O$>Er(4$!Mcdb!#h.k,HX:D"b7DA+5G]A\8u\u:lV3kU<C5cA'mm
*$n(:!da\.]Ac6UTD\kVN^n.N,@(K$1`ea#As1fk"2g,4SE")3fmHpBppMaaDU:$6nYZnSaTB
\S')UU[Q=^\t&g<jC<YOIA8[a\!Gt9Bpg,8V1c=?MXf\c&TZe9L2X]AXsm9>@=l#\P>Z*lg$@
a?pS5\0bRCI:R;f-\^X:FkP-rV-t`#^bi7=((I7X^ZU!?8Ckki)</epqt,KXFF-p"`K.QoQg
65a4JLd!p!q2]ARagnUQPE5Z(dSBZF_r^ueoHV8atnKA$*YLm0R&8-ghS%+g=^+cM@I8KFY)T
nF+a07fO&d#c6JFD[#+XM,7#Tgo,MX?3,U)X/YM0<eYS4!)^ujU-dgEVNl&'Dn&Y$jC=6.[6
9`&A5C'.Zj6kTc<5#7S#/3.]AN7@QKLMQq!"VEJRYMk*q@C1sl=tsC"$bl;JB.?[An&1Xc"<^
IV898t1)W:2TLkQbU*IkP4c;ZsI.$R-a&+?FBgIM<#H56^_D8HD.VM;&R\+9/qmO0O,Uh0'J
-#l3JA]A)2T?8F2kLQZ-inB&p6D:'Q(Fk6Bt_eY5<6BTV[h.]AFJ]AX*U,q%!C.mNR%@N*>%:G?
^QOE$Lh5,Jor?Yb1;j1Wk^&R,CTWT3+>rCU,U7(F@aE\4&_cl_gX7)Gl7'c.h0k%"R&?7Ym/
S2*$b[%>N*]A6jZS2%W[C,YZ%(fSASJGY@Lib#L9=_'0dX.qetPt&`QT&J5YB.kV\HOX<;1b0
TUQr)d6:L#0+*TM82UBG.&f4=>NBZ82EgsQ&]AaW!rbgpJ`c*VEaU>[,En4OFrTrq"Y$e:H;(
u]AbNk/q,[[>]A0A#C1k(>2\#PoZ'_8?Zde@d1@M?p/HEJD#/`$FK^R0&8Ca2Y#>(9%>C(u^T\
+^:'e.=lTF#$uoh[l_2T'oVo$eI7SDT'Q&D')Q8VM4f?&DX__\\N$G3JnQ?3C9hW>DmBpaSX
",TXKWS;A9a[.&s?16+G)ma<1<C"?pbo9j^N[G\\)3#rrACsA829XNidgp%DM[-1Y\TsO4Ru
ZMln1f;kP;7dF]A=0\[S!`',<9Ffp3,tZ2N`dN:i334Yjh9Hm3UDr0bN9W0\k!idh5:0=V%$h
\!UEWO.P-BlGse.<dNL=]AF;_)!mOiM0>NhNdpfKHUWp6*l/4uK#4]AS4>duW5TAm#?D>?)P\1
EbWfdru?VD-g7e_H,X@-Jmg*d6$T-`'dL$LrW*Sr`5p()=_UQQCiB#@l#[d+c[k4;"mU*d^^
8AY6pOsoZ:"Pu#ad8M)tJ>1"7Nod\ESuKuSF(+Rnc,*J/%$@6N`u5O=\1d*p/fIm=?549H4Q
eeH6ltZ\E$%-)M1#q,:D"GA$l*aH6f;Z%7[$cG68WM9V[_4Z\_*Nb1TD#r0!*_^4bJDG(#Rg
2-s0ncd:=ZQhsS6jS!9s!8:0Dg0@%*d.h&sg6Tep^/$pV0j)kr:3R5Cp.B1=Z#Yt1@=]Ab#):
B"F)97V^G6^B-R7(S0)&l&I2@`lmd;/4W50W`?@d,:D)K>"nG/<QW;FCUf:*1FmU'Ir5%XnE
$"Ulc%t-@idn]Af,E(#Fq"mcm)Ed.GR5%a<JrHW@Xa2-MsIVWgi\"j1:e*h!/tSPjUgaO*o#1
m$VT'o<]A3>qA*9@]Am!Ll"lda,5JKSQh5mVqh?r9[HU1QsXOP9pQ.D0uZIR0U+dGe'a"Xi%B(
9d8``B7]AR6@ir:hb_U_529L/Do+C+AloTK]A*^Yk^`JjV")1,#r`:1V=LM'F1>0RBh4F@5B?d
KqXSQ97O2cr*(<+mIM:EO+!').>t'oHU''"sPqV=5'N41%j4HAnUod[T95NqB.5"Bhqc^E=c
es3(]Au<hC7[D!'87IYKPU=,\/&_TrE7/Xu>W7B?,0dq+No:rMB=YfI7$NF![Gm6lR9o5e(b1
>Q?H>)dlnd+CU7,)@Udkm3;N%MW1)i^]AAcFa(lin:9/iOl<?b5Zn8'"]AS-Q(0]A9="CRmrb/^
eqH,?4*A*2=hKZ!aWK-[p\i<ll5Jct.<gC)Xn1XU,5Hpe]AYR'EMDm`eY0>dL@Map?@M$K4NQ
l=g8s%,+90u1e<LmnX/g9CmV\[qHl,:moOLU"$ZH.40bfuWedon):9o*JfZ^cY/il/bP%G#[
#1#]Ag_d%5Vf$+Q_ur.s"^g\"[LQ&H,5[PXqmEV_+YfjKNAJRI7"SsT"bV$mm1=2Sfo-<Q`B%
?t1u(EdbXULJ*6QVXF1@(#CF9+cif0$;^7fEZ#b>#T17@E9d*j2V3)Oi'4<>g.KT?H-S)nH+
:u;buK,s)Q/^)K-P<C"'NcFdMu)E1Ft1cfF2s4jFTM@MgR?:P[=)6=Y;8i[*'!*NLj)'(]ABm
T?07Mk+$DZ$ZELC2bji?]AniZgXU.3;o,B_Q`&`(_(,ee1$KdKtc92f'g'F3YMf?#?Ob:YUA;
G3Z5]Ai(HFF3(r1B4daFc=Q8m.o[GKftRTY>['-U7/.(kTgXB_>kKq3mT=q4?65r_WYj$\t`b
)Sin_7?WTdTYajA_,d/e^^LoQE@9b4K,*t78&%UjqC.S)n'0ndT\itZ9WQ!]AflI&j8=nrZu*
&J<=2;#]AnV/O3X[3h'9`PjK)n>Oq3Kt%``Q2@K_`WA2pH3JR1&DstZ=r9upM<b)h]AErB8=4,
Y:,dErd[=uj![hss/bK^D(K<.&Z&peKaAf8Q*2deC\$hhg1?(N#"&qAUC$ZC+Ck[PVaOZ#N2
j.E2s,niLm=okO8D2epOi]Aql`d=J$Dj(+"a,<XR_YLl]An:%nc<&sWf_?,^K*7\I2Wl9T)^A5
.'h<]ASW'1&RQ1;#0cCZBnFVOfm=5bN8\C<XL?[nWil`qnWMiI0/'IQfZ>i>:`4B2Q*1&jD[I
+(\"mPj5DJC+nA1SHTXs;7Qt;U6d_tf*D%W`;a.F$D!]AF\]AASFbm3'<OoL$Zmok<&#F3j6BQ
[Is$I>r!M)N[(GrTVm>]A"UI'7eL!Y`amrjKB-2Vg4t*]A>cn#l+a_q+lk8b(-i;EsZX:>Qfm$
(NE\6RKFa#%%aHnn<)nnrnmj&-6#ELdQmd)#,bCA0^]AAF<PZ/bEu*nOS,J^8Nugm>q!dImNW
)EOk$4o),Hkn*>lVL@*A>5%)@c)10I&R/6nX5G"oX2#?P+?mo^X&O?8KZ0[Qf,Z[,DrAK4<l
]AcjA>GLM]AToHZc?&hHOTqAo/\;0m)]A\F@P,;8a\=gt7U5H%XaA8u%%,MImB5:7sXK;>]A(KE9
<?*&8iU_Y[2*4S,9,(*gs$H]AG*T?NYP>2n6>$IoE?47':8c"a_nbmDJsa=PKcY=QqXAm7?jC
8E(ORh:gnZ6UA4+a9^No?PL9_I#se81]A)A[hVY.&sN'Adm45]AEoV[F5^2MWe7Cn7XhC4S='E
&kL?U2^pggGH)7Fd,RV1U//bUNZ,euF=A@<h)4M#PMN-%rPiEflpI0=Iq2R"7ZHe4U?9>+>s
BlMCkj*0%XgKDgD<TW0HM`sO<[2/.,`uHdf+0fD*(s]A.CYbN]A88*U0;+Z?Y+$68UL",uM?=#
B#l1tt:MOWXeFGGq\MhkEFpi]Aq#1#0"jH4eKmQ>:@c_Md_n!FB77><j)?%Qb#d7p8KNt1-`O
M(i?u5'Tgu0?mm:Z*dCu[1;LZ*\d^R#8_F_*GH9=O2/U\i\jD&T<\=[G.m4Ut@TrRtBUZdhW
]A-#&,d++$^`c'8'B,'7.I2LN-*@M;a_J0,0@etYJF8oGHn4!9d(_.f;l)3[+)]A5*U$PUFr_h
,:Xe*StFK;UN?I5Tb(8cBIRFV_^luHrt.B:dd\)-qCiGa5m9cZ_EKR'FuZp+o+q+2mF3=]AY^
FOhWN8Bic"-tq9`prnG>j*QIYV/;C5g)Ma!3&;u=PF'Kia1tRfGNA<k$]A+jqk9MMdHFg"Z^)
.;6e7-e5Qg+f"jW+43[W<N*#_SXA$m)IT\0BA,4?H5Gm=3+_qt'sEKEAM8gU\KoqS47aj[IZ
>4I4JQJ_'-fs8=s[?B-\BPF,k]A^Q@""HJ2E!Dto7!j]Ag"a+!DM/F.+'F$W=;UHstecnubPqd
,(nY2.#YCamEOL*o>cX2-sY<IlH*?Zk*aA24/bSf*Q)@I0pR6[+9lrXH!kF%Nd2.;jnteji@
#MJAJeJHq_qX7j>1C^$.kJd2#Y]A4*6dAFAeA`7NDe2((9rY%7/YcD`>"n5.--/;!X^r%::K9
j>2.9eAot\AJhn'VM<Rngsts4lilPm-h!oG6UN-=9EC.5jBhIi3DUEe`T)[(JrJtchn>K2c7
C1a4BtBC-Cp(JViXkCduZl'1X9N@,9GYt`$1%Ps'.4@Cup5dFrRuH-/jt:33`<m%aond?j3o
Nj]A\1@XtM*kY4^&5k$h:DF6p:gO2Fpf)Muuu=VVWdMP1`e8orurkcc6sTp@M.dsYYFGK'C=\
)&J-Ifrd`rlXdX$9Pq8r8ZmQ8?@,aX2QKZ95I2Dc>lF3;BF[&k`,f-Al@(u.0HdC-kqGU5bi
LS*ac_DP#2'F4:&lt,pPbZ_b?a[l[i/c6Z*!7n\o*fVd(eSdk!P*Fpk\/]A[o;Jkp\s\U?pG:
/eo:Df$@J>b@r#.'iPq(8P$RX+=NJRi#PT"?25^\B5]ApFChn1+I)@;7m9O1e32DX5h(K0-8O
>TVa[i,kcjC*MCa'IX-k7fW"5=6El8H-JqmS7G#lD@)jjA!Hb(,$3((+NFclddK'\^g(+O`u
Bo33CW$[N^]Ag\VZFQ*+GB/\rZNWN4/0=Z@/ihEtK;r>Rt+k7MsKhY$I7!Kd2\GLfRH"&GS/f
"#,<>nK^gF+=$-q'O8M5FWo\[!+I5mE]A:s[AhKS^<otVq/lG\dGIp2fV\>,r8a$\JpB_6Y%I
_<@8bDr)GsArHBJH."4QWl&)$ZAlT$(EB<sC"Dob9B=F[Wbr5=\g`oi^S)+f-?2mt*WQD7u"
IiO0o/!q]Aq2CnH$M!H^V5$$+lX;sOY`k;78!!#_S&2UcXkeNo?`nnKA33d\o;g8<n?QXX\F[
Q3JZ7%Q9[6<pgTJg.2K*tZ)++)286I`b+)ZL0f_KNm\1s%g?3g<sY?Y*XMf"Ci>jWifqh6!9
;j0W&4B92d85$4:RS8lkd9!5eV[uTjTBXCq7G)Q+40EuA)9f%s)c93k)9"3WoV35b)=c3_%>
j>\f*g'1Nck]AKKiijb9:P&WYreRd>KBii.\&[?'hQ$[!=+;<Rr0i"!;`-Qi0em=cqY3NRIlD
_[=8>Q1O$'_A1V<iaOBcjV!UX>E(m+1kY-#7u'80dM&bq)7'oQEq7":4hSBinIS,erDT2BR>
CECN*k3+dc5f-##.t8?d@?ZT-@uimDR*DYq$ijXZ^gu70c"*nb=;GJ)"6(R))d't!7G/D<5R
IeL;-3='27C84N5m(f*e=K$c@?P`UIp-H(Hk\uOmGX]Ar)Wq=I0dgAQ9R(rRpi>Zem(mBrA^J
*&HA[DhR/(h<]A>6o<"*Q.UYQ91UgZ#-Wm_"jleD*RV>?8<p`HVu`6mk;]Ak4pE<d95V<6&tup
ArE-i:LNHSHPqr8"Q%,fVlsU@]ATFC/G,BQbj&9lGkV'Fa3%6i\>pu:pLBZB&*WSho'c<Oa'f
0;pFktK#>Dp"';LAB_h@(=`kUOjHH4f^e'`';6Y:Y<+1<#I"3U8.C[8M4/4s]A)d1sKUDY;3Q
)o9A944adt$5'p]A5b!hNW$mW!@"Ie@.kQI"!$$OuK3t"i]A,s<(Qm/(..$'A$AT8C;lDOXmqO
7t^#L:4;XUb4@9]A^ZTXhJePXE[MN8<Fn-bkl`>3^PXiX8bKB?3Y3K"an4aJ*ReTJ$@Q)U[7)
W"f0GPIptn"$0[CTim#=+8p0R4&Y>L4b^/J&d=1+4%4L`"/-_B0dsiqBZ.O'!o_8,j7eU'1a
LYY51.PAqU]A"\-$0HcT$S_@"qO'4gQseS0SuZ/.D!+5dPL;0<)]AkP\G[_o$KdQRpU9J6m)/D
>hfcq%D.tt7r*&9FMqlPqZDa[>[f'#><,$'scC]AqF*bO"]AK_2QhIcM%V:oRtbmf[3d?@5r?+
`DYaZ"mkI>nVa=^&9\1d0b>acr&b%+"W36'2c,17\CG@LYgS'1_.t_DjaW%[mf@(6]A/5]AR[<
[8C[f;G*)]A7e*NY=F;#DBTT*.E-&kr8f:P3dA<4b.Z&aYPdVK]AH&c<MJ16*CjQS-;^domLCT
>\NlW@Z$nf]A$eJ%HYT)FY+<L:@G<^ONG`!Ah\P"T;#2a1fpu'!$,A*pa)qMOcJ+eV/SQl&h9
DqMITFk!uEGIZGBDam?TuGt<N3D5!lVk43W/bqdi4MAVP+HJ]AdU=n5c3+@IfAR>\]AmE>iDBA
;u52sMSl'S"<#L!(S/E^9+_i=c<X$4+)mbVV/bTDW$rpDZ%jo9*Cr%9tgl,0CA^XF=UAS.,K
R0gfYs.S6I;p*@`md/?(V=,?.A)$'#AU/s]A?X69$rP"SlS\&$_%C7BF^N@+LM%\hn5<jbn1E
bSL=ZdbkrR$]A*&,2h\Jb[b4fm:Fs2^7GTXdBb,'!Td2hQ'(\7g<S7&V#GJBq.I["`FHPgal>
2=;:(uMj3aZn4+5lX[_TY?GTu`[pqV"__AXaL8C"a-MYt=MkSlME(4X]Aj-g2!eR6]A+K075b<
&-B'ZmA[\0BBDVoPcrO*/qR-:7)/'QqBH5$iOSnqcaJVpULLBC%>:tPk7(=MJ!NOBYqPF,Z1
+6mk`f;2N4An@S*^>2Gc<A!c8&%A+q_;4fD$oB1UE,e+HZd`W5G(B.=BUJ6#-8Co1\s*,RLP
b;oEo5Hs]Ao_SdjHch4,+8E%1$aNsbi\nQ9Fi$>DhfiAS7_^rR;)_[9HljbYugY4epH]A4l:1*
09ao`]A.iiR(X78f$/<kuP!]A`$\cn7Ves4jS^%,#,&[?)<P0m3.gFDgc5$O:^9sYG:_?4<IZh
8^I@0:g!r',o'(9P,A)=i;U@1r>=4Nl`uBre/##\Wj3*mGN$.S/DD.YDZ[O6fMCn#NJG?]AY.
:/AXTrA[^(Ze$clLbD.rK$JRUmb'r(O+s6<nIAsM(u+NB/?pA/Q$AKD>DsM=,*RLEN-X,!`:
ro16.m:=R,ge?5i<Th)Gf`?^K)*eW1#@AL*m7;4a>5]Aop\`,N.Hg"FSl[!ktK!K;o>:`OH'e
4C8F)k.1)X+5Qaq;K[-%Pr0A_HfZbkYO),S`l9+Di(]AC@fFpT9?k($iPS^S'71G]A8<fr7i#Q
+o.hff`/`7k7Fi`cdLj_qbV[\1UQL(c`.[35/4Y\1H,?*bC)h=qHO2sn/rHsca0Kg\N8DpOH
?%oZm$d8?^J?;W:jq.9-@)eHh5"/<m.^HCGoqrBc&-/8>jhiuqm4!/7`[i%D3$Zg<=RC-<)4
P9[=d!]AE@qFGu&57_4a7kRl3D*urfR=*`e0_Kj%I(o(4=O+/Qk2SQP8QNTH9S41DS'I?9h_g
1+J*sshlr1/a\C[)=-4Xn(.-=t[JBA`f(%K?#;g2P(-WQ[n\J.>8/lR4<5;E/6;+(Xs%f=`R
,\<4mrl"S#W<s'bNTm$)%l(-(9dc4RHu1<[aYP\N^lMjB)XX'E<FZulHB7!HHar6_0^6&3SR
&!:0=W[=s.obLCnR5**iY?U+(>?VVL#)Yi&TcB@j#h-"`SQ(E(YE$UlR3qEe/+6#)/*QifH.
XRos"jH<WP0h$J;c!9jDV$"45-ET5<tZX=Zt7'lOgB%#=9'bF9^#P,1?o]A/`UD,6+Y[HLKe4
Qc?q4E>(q]ArrdqE"%fk]A5ijrWV;QrZp0"Ng[#U>YE/WJDQa8#?grE0o]AV-#]A&KUA<E19,V:_
]A,6ZQ%'*]A,tsj!)\LPVmakE^jB"4Ot=$JK?iZl-:Pb5/kdZ(_[o^J#=*-PP&&ek(_AB]ALT-p
o[o!!VgH+ABqPj2@:og)ohgeK/)o^9!2)WA]AU#AEqd+`-eRV).a:h[_jkV2)ds_!5LCuL8UR
po-Q,M[A$niYLB^uS;AT/F)7G%i1Bu)g:gmA[=5[)uc;<*2oDA$S!V5!3a,Cb\S.bU%%5Qnm
pYt<^:?JhtUWtXj9cc9F0=0cPui@<MrfX).a4S%`d"V^M/ArW+KaV)d2qm6n()H149&i^-V<
8X?rJ,MTl.*N<>IF]AXP[VNrV2@W,aPq*P"`H\Ug6QP>62Z1-VXq8Kr2po^d>'9pC3!O6q!?s
4Y#?3q\kS3<07OQ/+XcVeOF8E*P)h^U1^AGT1Eo+L$bEIVRO+_RdhM7C^-#kuoCtG*+[A1KU
QrI@IF'.S!4O2f>#EJ:#_InTiP!cWriIdY)%=1/gmPH5dgqP#1U^:MP(hX^Kk"]AdC/lC*;^h
.'3mee,PQB=C$Xp&oSCbSrH[&k8l>i,+bgS"9.LMcrqb_<k\h<X/c(d#9;9CN?D+qEGPSUfB
OhR+?j$g;/b7]AaM$nN\%Hrnn#)M84D=j=*tdM]AW/k[1GV!ORe`a/NZ66N&X$C,HSXb@oUear
)D&A$X]APH#u_CPgRu!>1Zd9,_X3[o]A#k14i8LERp"R"_N%m>]A`fSUJL=q.jA8E,9oh*I?`TB
,'J(TCgP^6#O(i`V$a/d(<jZ?Y+SK!O"N))>1!jD8akDX&FQ98ufoaD`40TcjR[&+k'"KBed
fjeK/#8F0Ab^N=J\*,Ct'sXgdq./&+i&W<:rjZgc=Y=-QM]Afo9psaa$5!TVc'nrudC6<#ubh
[g&qC0HALZ>JTBOS#e4E>#ij#/ojeT84pauHN-/0oU2Y>TH<(39CPK@+#8Ea/Jo`aXuM$LB7
(L/2C8m?V$5)t_Y<6aG'\MoD9<U&3!2Q8l\[pj]Aq`_Q<btpON%=:mEMnbYH3!2G,%Pq&uDZh
`)FkdLpchYQZ%N'Je<pRHb)Z&uIW^L0pjg`D:o()/>dHccs@tQ>#G@((W),0NBnB9.^'K6\m
<8\HE70e8>mZ?[io%25V?7(5@9EP^bcYIRV,Hm:)GYVLWA%fee`5,C;5)*Q"G5l@1ZAZ$qQ<
A<&I9$^,K@V414E%`H).KhCjUj^Z@h$`Yab)5h$YTX$8DM`D$R%l[3KML?]A"E9;X@*T$fo--
8K(m'k%7i6R;GIjd[g95-S#VefN1glcSg/*?utT/W+?HDC9.c(FnU~
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
