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
<![CDATA[2971800,5676900,5638800,2743200,2743200,0,0,0,0,0,0,0,0,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2743200,2743200,2743200,0,0,0,2743200,2743200,2743200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2743200,0,2743200,2743200,2743200,0,2743200]]></ColumnWidth>
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
<C c="13" r="0" cs="3" s="1">
<O>
<![CDATA[终端]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="0" cs="3" s="1">
<O>
<![CDATA[荣耀手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="0" cs="4" s="1">
<O>
<![CDATA[苹果]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="0" cs="3" s="1">
<O>
<![CDATA[增值]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="0" cs="3" s="1">
<O>
<![CDATA[贴膜卡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="29" r="0" cs="3" s="1">
<O>
<![CDATA[D+手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="32" r="0" cs="4" s="1">
<O>
<![CDATA[D+配件]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="36" r="0" cs="3" s="1">
<O>
<![CDATA[回收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="0" cs="3" s="0">
<O>
<![CDATA[回收毛利]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="0" cs="5" s="0">
<O>
<![CDATA[PC平板]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="0" cs="3" s="0">
<O>
<![CDATA[合作机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="0" cs="3" s="0">
<O>
<![CDATA[hi&nova9]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="0" cs="3" s="0">
<O>
<![CDATA[OV米中兴远航天翼一号]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="0" cs="3" s="0">
<O>
<![CDATA[新增天翼]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="0" cs="3" s="0">
<O>
<![CDATA[新增宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="0" cs="3" s="0">
<O>
<![CDATA[新合约]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="0" cs="3" s="0">
<O>
<![CDATA[5G绑码]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="0" cs="3" s="0">
<O>
<![CDATA[幸福全家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="71" r="0" cs="3" s="1">
<O>
<![CDATA[超旗舰]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="0" cs="3" s="0">
<O>
<![CDATA[千兆宽带]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="0" cs="3" s="1">
<O>
<![CDATA[智慧屏]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="0" cs="5" s="0">
<O>
<![CDATA[小赢家]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="87" r="0" cs="3" s="0">
<O>
<![CDATA[FTTR]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="90" r="0" cs="3" s="0">
<O>
<![CDATA[新增云宽通]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="93" r="0" cs="5" s="0">
<O>
<![CDATA[穿戴音频]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="0" s="1">
<O>
<![CDATA[门锁]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="99" r="0" s="0">
<O>
<![CDATA[手机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="100" r="0" cs="3" s="1">
<O>
<![CDATA[泛华为]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="0" s="0">
<O>
<![CDATA[单机贡献]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="104" r="0" s="1">
<O>
<![CDATA[毛利同比]]></O>
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
<C c="13" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="17" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="18" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="20" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="21" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="1" s="1">
<O>
<![CDATA[苹果单贡]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="23" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="24" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="25" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="26" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="27" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="28" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
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
<C c="32" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="33" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="34" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="35" r="1" s="1">
<O>
<![CDATA[达标D配件]]></O>
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
<PrivilegeControl/>
<Expand/>
</C>
<C c="43" r="1" s="0">
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
<C c="71" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="72" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="73" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
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
<C c="77" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="78" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="79" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="81" r="1" s="0">
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
<PrivilegeControl/>
<Expand/>
</C>
<C c="86" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="87" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="88" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="89" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
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
<C c="93" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="94" r="1" s="2">
<PrivilegeControl/>
<Expand/>
</C>
<C c="95" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="96" r="1" s="0">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="97" r="1" s="0">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="99" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="100" r="1" s="1">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="101" r="1" s="1">
<O>
<![CDATA[任务]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="102" r="1" s="1">
<O>
<![CDATA[完成率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="1" s="0">
<O>
<![CDATA[完成]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="104" r="1" s="1">
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
<C c="5" r="2" s="4">
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
<C c="7" r="2" s="5">
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
<C c="9" r="2" s="6">
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
<C c="12" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=K3 / L3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="终端"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="终端台量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="15" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=N3 / O3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="16" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="荣耀"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="17" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="荣耀手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="18" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=Q3 / R3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="19" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="20" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="苹果"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="21" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=T3 / U3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="22" r="2" s="5">
<O t="DSColumn">
<Attributes dsName="complete" columnName="苹果单贡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="23" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="增值"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="24" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="增值"/>
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
<C c="26" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="贴膜卡"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="27" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="贴膜卡"/>
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
<C c="29" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="D手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="30" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="D手机"/>
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
<C c="32" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="33" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="D配件"/>
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
<C c="35" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="达标D配件"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="36" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="37" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="回收"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="38" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AK3 / AL3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="39" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="40" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="回收毛利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="41" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AN3 / AO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="42" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="PC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="43" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="44" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AQ3 + AR3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="45" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="PC平板"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="46" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AS3 / AT3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="47" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="48" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="合作机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="49" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AV3 / AW3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="50" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="51" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="hi&amp;nova9"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="52" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AY3 / AZ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="53" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="ov米中远天1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="54" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="OV米中兴远航天翼一号"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="55" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BB3 / BC3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="56" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="57" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="天翼"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="58" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BE3 / BF3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="59" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新装宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="60" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="61" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BH3 / BI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="62" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="63" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="64" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BK3 / BL3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="65" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="5G绑码新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="66" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="5G绑码"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="67" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=AL3 / BO3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="68" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="幸福全家总量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="69" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="幸福全家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="70" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BQ3 / BR3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="71" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="72" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="华为FD"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="73" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BT3 / BU3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="74" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="75" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="千兆宽带"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="76" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BW3 / BX3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="77" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="78" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="智慧屏"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="79" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=BZ3 / CA3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="80" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="小赢家增利"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="81" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="小赢家增利新合约"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="82" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CC3 + CD3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="83" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="小赢家"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="84" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CE3 / CF3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="85" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="新装FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="86" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="存量FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="87" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CH3 + CI3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="88" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="FTTR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="89" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CJ3 / CK3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="90" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="91" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="云宽通"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="92" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CM3 / CN3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="93" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="穿戴"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="94" r="2" s="4">
<O t="DSColumn">
<Attributes dsName="complete" columnName="音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="95" r="2" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CP3 + CQ3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="96" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="穿戴音频"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="97" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CR3 / CS3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="98" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="门锁"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="99" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="手机数量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="100" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="泛华为"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="101" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="goal" columnName="华为手机"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="102" r="2" s="6">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=CW3 / CX3]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="103" r="2" s="3">
<O t="DSColumn">
<Attributes dsName="complete" columnName="单机贡献"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="104" r="2" s="4">
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
<Background name="ColorBackground" color="-3810576"/>
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
<![CDATA[m<a1b;chQD6/&22gG#b#604897\*:YWC?6:@$rHd:mfhBhLO6V7?)g/+G>gZC8YdH&6h4bj`
7$FU9tUG!?i`9U135)U7_NR&g<>>6?7V3F-<'^?tZ!)X3(7Q[bp_<qFC0*-[Y6gp9U?uT!]A(
Nr[fl(Ol%_h%0-BhXFB9WY5uFe`;hTqq8!<?rs@M_('=QMGkI\1]Aj=Mq,pVfJg/1s.iHXU`B
,A;=bo(3ooB)XjT1N7.rgO]A;(lduJqY84dD&7@=Rhi\cAauLRDoFA9HKoFbg=KEZ(+4?"hlc
hQn,`2!Gkpn8;,=m(\6SM;P]Ao<O<[Cp;,Dr3;c$K1s\RSg2e=s*X4$(c+M>jgKabFrm`Wqea
j[8Q.o[J_`[q7Kf\4!qUR&[VW3nPk7?%(oN.?'R8JV4q<7e<>0:\1l5K26S9*r8AFBV\Q4V/
=RV`V\QLqUQ7W3u]A"=[U1G"^N?mHlbKI$DjE,]AWD>9N:(k`QIS4TB_^,M2HL:I0Gr0>\EI:k
uiRFbE,L!4)(A$'d8?tD=@.^R6m+qZN=FBY^_j;fi\*4Dk!/n1U-7QkJ'mgtlQK79#bg;;p*
A]AffWkYTC*=kijpP#t)N"NsuSR;<i]A8*_bp)U;I_DoPe[^Cl>7>+(DW$W9GW2aUu-`1u/CV^
Kmd@).p?i5sM^tFQJ#pcGMN>VbWktbm%L1R=#Ul\KXJF*-Gl>'Z]AR0a$Sc6f5\?'"'j3kkE2
oD-=rJNBs=iF\$3foVX:%Lfa,3G,riI4Z[Nf6pWgfa_V^XhYW[)9g<qB\BtRJ5?EG98sN5`G
C.:ebEZVg]A8b%"#P?15QDO3';HftX\q77C<UBn^Q)-XKZ"5SN]AOgjIoRXi8HFZL3p/6fQ:'+
O-N;"VkW';kpWra=Eo$_1$>ssC(2Wlf9AEAPeYDJf71CNZGf%!ZgDX(Ae-2g)FL5;@i]AFIoq
UhKTEaN9@+\@!mL$N$qASsB3iM?Rj>(JVRU?0&^WP6=bNM9;p`t/'JkKG)hHHn9Nm.s$k2Zj
*gHNHZ8Oq'nu=%;1YeP&;Pi<Nddm!OIn<Yao4p/a\gk#NrE<Ad,5edW:Ck!as7ZbeKq+[p/X
Io1]AKf?/5*e:6hD(fk"elKfnpPV.07:/+V6idQrH`L0_j(uQp/1f>NIDnJ@+QXn-+F?\Kb_[
rR.O/VbuVlgs7_Rnqt\:m8!!(1$4r]ApGWl3o[a=oCqUbgJ]AP!3#No]A/04AP[F.np3A"7LUiq
#GneVqP8CnKj<_2bl=KfuWf=U:kn%%D(+^9s_egL^,oG5LHl)2,C`p2+7LlIWiJX%l=:?ged
kNsS>X2O4!CREu"Snf[p,/'N:I8[Vm-9d-NJ!Xk6Sg*V`uM=eR63X2^;bF.?]A:WBM(a6A/:=
BsJ&.bnYmQ(Xc0q+#heVm_E;EOuU#YHdnBImg0q^SD+%YY."j3Z1CM&,Ti#Bn:4mruZr8?Ve
h]Aq\.Vq?-IqU9)J-g*:Pjpt5CNmWqaEARH+K^lSkVMHNis3l!m$2p?`G3NM'K$W$&^,q8sq-
GC>jJ:.mWDOuX@f2VgqrFoG'%&dK!di2=ooW%UTN4_^?]AI5^>RU4[Y-Y=R>ZhHbE]A`XDNo-n
hflr.X)5X6BEun?>8-eYNQO,p7[(JAKnT",u76!KbRbP?)RXlJR>$YlG<M;3/#HT"eIL1uFM
+dHU"OSG!i^)sBY\r"P).MLH">&6heiJolNN4H1(Fof/4*3WfY5:gYP.ePcq_Db3X(1L24Fq
4ZR]AZu&Ee'FM0;g9WgYV!l^%cCkEPc[I\G2]A>c92gO*`<'+]Au2#fd7]AO"ClHKNo!L^Q"gf0#
hTs.0ZmKb[)$4k`R<Qo^fZC*5*-@X2M41ct)jTC^2Q]AR:m`oDsU'e5pLF?O6'mr<5nd![]Ak(
bK<bM6\JGc!3.l2WP3B4/?QMUE7($ROmbe:*SO<c^1'1AC[i#pq(5?;qpodrl`gP\RgnO`4]A
JjS+(UNl&RU_lK?*XkgEYVQKMbJ)HH>mrP3!)Qe7Vm?l?$U8eLrO:^s$n,LETW"W%5Q\tWXn
!AQ_NVa7/D)DM[O[bj'/)1r73%O?5id05+r^UpjmJ-W1#^OPQ99iZ%ACZcFj'>S\;6eugR.`
/#XgVQZg1/n,+$2Y#A>"ca9$!`7RC-l.XFfMPl9NDc*aK;0g;eIo"4b?R7^uW=]AAY<bSka34
RlX(A/"A4ILU$F_7Mr`C3Pd(ICoF(!.*m"kjCY[A3"*l0g8,'L:9GhJi')j']AG$ho-aBV9I"
t8uAQHFSK+-eE0Xm1VZ9DrmTcbK,_6BL2@H$\&a`@+.4Fs_7JW)+2fRDUH+At(fY2JCnZ^PQ
=6-di0glUuMS9T;JCmoe%CYW/@%e=lGe=VnfDE8aO=Plm_!&B@+#`KYBVG:&r2*J^A]A#E3V3
`17lg7gJfMoc0^]A2N5h'H2iI]AYq+gg$tce-t%j69I9N1/4K5[n@.73#al4,WhW4lLtCC%"9B
)MM5Hf6"T*R3p4&+Y=q)2JYB-Eg8=&N7-1!$f'D2iTrq[0Ubf1MC4_ir<UCX.>MD_hmi?Y$d
G,t>$``DXb*R/1sdE7geLh1r.$H,DA'*7t25)N+"%*LtrN?C9W>UAeDBn7)>P3Z=`P!63r01
S+^-)P1.gKC^`'J&9uF/kesE'u-HPrPn"rQ4bl(C68oTr2X:j31mYP!83aV=Y[-VuNG5'RHN
JX,X!"mqM('AUln)AF5I.OPE?rniG8\#_fP1O3."M`5O'7*CpD<lF@a"\/)b.KoQ==++=8->
L',^@3qc6lgMah7^jQ>\&0qZS,.dsomn2q'#h/N/U!V:`&]A.uGTX1m^HNQuR7pX'lG6=/<f_
N%F-+^d5f1d?LkUPcWS0MrH0/DWJM0CmKb>pI%[3HDOi$)DRRU4$h3\(2brVKV:opVEolouR
YdHO";a']A<)Hucc!`>S<qOD7_NOC9p*2[]AZK:LH72qjt36@&Fo7?HGk?;6IC6=1nrfhhX(F<
H<dl+AQX$IH_!$#K%o$Yc.L.KE&YBP-me"b)4E]AeQD<lUS>OC2ae;>h#A?XWcN0rG3H/OZ7p
;<3U*#piGN3GAcbA`G3Be,n,88VM&WVs-H-'F&?0?W(!Ki.Ft8*8Wj;H)?X'qeK<%`koF>O\
sAs3ms0Zc>+7Zi=6,E6k)2U'YdMT]AX1C,.ckZQ)?EcR/ICIl7[jih?)ac$!re8WqXk$nt>ss
VYXN;Rb1;O(PNff0Y4S.u=?.#L`p!cj_C]ARo3g7lOP'+0Q;$na0`O.;CuO\'dJRCl8BY2U8<
F>nB%6Ti,2H$XtJ,NTmd9-pqkl9%jaa7Cp=@eK(YHcIW+%;gBtbNbnI20r^(4@;p)T#2Q**1
$EV?9`J)XeI2d$Q\]A3O^8npO)?[8>U-P8K/.PqJrAG)1o(@5d24`aFuPMdR;s)R6OPhA5f/9
\<^?82>^:^`e4Y0KWY919\iU_cmT,Z1e_S+M>EP[b=beL@a]AWCD<muk4@!cMX_)u,e/YK(q%
_F8Xj>#-)U-&fCJtCmkXqWp/lJhY^l$u@QMABtS`9QkU4WNo/Ib$!24lI-L$H$2=lC`?\8/e
Y)cch?--re%)r%Or#7-uUV2o%ZrT$MFX.C#><8h7S\`QEnaD0j&4qGq@#F%\\*/*sAXgpa8t
[HAt*OjJ'_OCM0d!PL./!\hhR=?mSJD^r!C(R"=AB',f1WfdZEjcSkIm1^NrW[Rb]ApSW\p#>
r,3,Cq">rO[HC;ou/iL(sB:kjK1qH=r6f*\]AEUqApP"K)\n@MV.;BB"Rol[dbALkU;[L)G#D
pL.b0['d-Y^M_cQ"58h.c`E]Ap.\CIEegC-s`C(r^iLtW^L7urZQ6W$o+Uf^E)l,dsI"e&qb;
NEc<X'j-eq7<qDQPLd,no`R+N`#aC+)3_>\ZuYg)EPgk+`C"O(Qg1[)fC\O74UWh;q-[mZ"C
j(,1RP`5pB@qRq#\*EHM:6<.e*+!?uH;]A"Ur:EK,nJ#BYR-[QLs/,]ARQE$Yi/RK\eR%YQqXj
D(I&G7W2ZKeekJ&[#<[jg1J"#>s]Al./<2`'8,Kf,HYCRIWW%qC@?OW`W3,)DK\H=oclu@144
@"]A>D@dOb-*%-L-s$Q5PP-a>Vq8V[%[q*?XFGM8YM_HS%Kp@LM.h-\+qF><:oUg.rDj"(87i
Mm^FCIY)^%C%l\Ur0`H>AaX/Z\?bi%tQ9tWoah?pr1kE'ioOUS!o"<e/q\+XT%@"bZE/O_/8
D=#4CIjLS\./hPl3gU_#(bTT%LiaihO$@6No4<Y8(S?R&Ei[omemC[`P"&"a:%8F$'Fa\J">
),2>BH6LTE=7Y@aJ"W+o..5pgnTm>]AH78j[GR+TLdpeh_m/+ig7Phq6UZ]A0?(a1iN3oh>-C,
L[7%i`PHoMEI5d8>"CMir+,ZpWGk+/1lYZRA6V'#?P,c[h;3^A*9>t;TE-rB$Tf.TQbb"Qc3
FPb+,jG-8a'ZdL^:0NlRNQ/=,BAsrc.Mu0I_7`"FYBI\/:t*q"e&C_>/qh#K4dWcQKT>R_h8
-160GV]AnP]A]AF2Q4!2VG<,N5_TQfJkoH]Ag[518O%6heYj6CE\?k<P%tjck:oR-8Ac32;*n\R+
?n(%6XS:FM-RL7dF'ucH3?VpeeJqu_#!PE9"WM<`'g1_a97GhEI[-[3h0s:-X<87I%c'`$Q.
/#aY16H"r"7.8PpI7#B$'R'sIoRl$RD1LWC!?"P"_WPIFrZ,B=5O^>2J1josM6fIU04)Y)5(
[R_$ahqsr]Ae+@uOOg]A2IV1f,ITsi[u36E%"=4C1)6_[,ahn)Y6B1c2/OcDE!O$5O%]AN)T/dt
V)@#-hclZ;?O!"bBq'Ni)R;O`OUpA9AY'aksg@HG"K=S-BG-/r>W&%*Qj,G)/"CCG1"lC:S8
^]A]A_0A%d6'iQ9#$]AYJ&aO'CEmMcmKnh3jrjeG_mk[n*Pjkh`$bIU*m1oY=RWjn6&Zp/X.*dQ
Ei3E8[-n$bs<B3Cb"GfYC=YU[>L=Mkun:jh3<*^/(biuPiPGn_Y7&gNgW!&`fgNu`@s=RMC'
-%^H`>-_!24=0N@:0*c4g7WPl12d.uN^b%`0qUqb4bO<uU^rNV6ZHKZ*n[GJ1`H)Vqim\bTD
l-V+*!oXFelh<d:TOb'`+X30(2G>3Ig[]AZXM9b3EUl%)>>qgSAB&]A'#aDL^W=eBNGBRK*<+*
m+=)&YG!AmN!$`YgUM]AZ,diRY$If+jnH\k:q=2D@j6"-(RY=\aW9.o(P$Mo3!"cH`Gs7TfNm
DUqYlHWP1Teq+mfoS(#YA`HZ/n191NB#r>dYI=h/QgLhi=jCQ58LMm\nR)W1u>c+'3Ng<2Od
95jeW]A'gl%+`?W=k-n`FX1.@/!qdc*E2-BK,.rngCW"lN))-A2l2kn(O_$+k,Q:Q"a/4j>^b
JU@I%jIq7.SoQTZq@E2H/o2XJ-nL'o)C7Q3U_0UjD#UV8qQQ^Uc??X:iG=%ffmBU`*qgLs\/
9@2]AhDi6;DYR#Q-!&2H2c[P5Cp@du'OGf!>C]A/DtrMjp&Xn_T,"oD?6i(f.sr9kA]A5Y[OM4.
st+Z['!k<2ea^)dhP@eA8GX!u!l$.5R#rX]A)M?4Oe+R<e=(.S;!"!A7i.+E]A.+%J&6=k#bCD
4+WXIDX_25tb@IP:Q?K"QPR4?R`l9C9m,iD]AePKmpID(?/;q_To1"f5d]AsPn?Fk"9>nGtlTe
_1:%g(l[75O'9Mb-Ds,!K+6;oabZW93g'lFF&i,Y;"moW]A`koc<27WUga4\2RD"]A:7KJo'eJ
tH#q\4IU8G98o#^gmOTVH%jEb.7XF;\soZ(/&)iPcSmd5`F3;C-u[]ACOp#L98s'ELk=2flK$
agUB0cZZ/"U<o32p`N0K[J5'Z3/k'lK=02edo_p]Ag7;M=<6GdT`IPldVf@hWLu#*Y)>"L9bd
r,W,,R@GLNue+5Z4cP1?AsF&+:\NptOaAge0!3*TM$OgJ`&Ci&E)V]AU;g?D;>k7_iLCU1<'A
P*2q:C-*`QY[p<&+qK,7%"N.OMBc5Y\;5,3i?*-[l4^n5,N7I4?P!WCY5b<uo5s3P\K"0t>k
bM`E:ReOTYeW'4IOJ=_/Q#Aoi*_f>N(+#S@M\r[`d2;L=Rg,<O'%P:GEOu]A(s$=*l["a3!Um
4(b0uMO=i[_1K;aD<jOi(eV7]AK`8.b`TR#@i:HaHsrol+Kf5biBNfggmAME_`+m?.Io!WAWH
Qk,Rq]AKb\4re-`1!E03u/UKYdc0RBK/>DKmM]A>4=P/7-VNh#RVfcJo>42tuInX,;k)C_%!<'
.8hs#`IrX(S`%a`-:GHCcCCDg#TW@O5S\eoV*405(2RiA$(j7TeR1qAF)U&"$oSXq=l<(PP^
ilssQ*?b]A;0r\pij'3tWgEOlTo[>YtgF@r::53MRc$KJX"b$Qkf),kU*NnYd70Jh1F^=i?-"
\4?BP,1"AR40077$[TC4@V`>+kfk'`2J8\d)4C;r7aB\"FX$(dem9E_k58t)7.mrSN!laVaO
F"C!pa-Q4'(2*2]A]A]A\:4Wb_0bBgOrD\XgaS7"+Befhi(*i7iIr/f%9=+b!"7Q=r$D\[a7&JU
qU?]Ae:R%:2qEH54]AUcB?.P9$Zf`Z.KO0Pfp(0ZKRS:u:T$`?M]AL\idiXhmuA<L?Hd#(PB+^U
Ku77-+-(aUcTne!7u8&A1i:Qp>]AX-G$4k;1gBpXR(k9P#nb]An/gCK)5-5Vr,of?o8tZ*7aeK
#Z&Cgd'6i;t=2Y!G@fZZ:iZM<UEUbLgX7VE]A,t@?!/BVqQUC+PkfunOe':!1u&*rNSZhO9%F
VOW`i)nWlIkcdP_]A^h5OAJ/-_'Z(>]AP]A!_=$)tqR!girVG2m0cK3jQZMKcH>,nhD?Ea'pCDa
AG1nU-C-,oo]AA`ulfSXS:8q5a$."]Ab]AZ2?+8\EhW5"qQ2W6LEc('WpYnbV>iDQheC+'K:6q\
):e*\*VQ!kY#]ANJm'[c(Yj@WZ?-TJ^C+Ht;e'lk`e?"bpprbSf,W:%eghC-;4A<t4oEcE=^J
(@W6]AaLlNWo)<=p/57ZX%=%g2`erW\FG,GKdo*qa#WKgIP*_oJ*8R`2j:1EI,0>%>X($UPDe
<1+WUD$\IoKqNLA[K?00ZmUdGt2TO\^Y]AMo>!nnK^V!b!\`fPWKFD.YV%i1mOZUtRg*EJ(b5
0Q?`Yg?-MJ3!D%EJ:LCV(m?er"9ki0]Agp9T2915CD9N,,0e7C[Q=(5CAn7#'ZU-Oi[Y)$>.0
-gOL$K$1HtdhM\OGN[G&i:6kS?4OYbte\KOk;.d(V6pK)G5p#d^=1Fl^uH9<F:<%W;tKNpo;
@$"2XQpTrXn*HR!81cW02QH(1H.('7:jEG[<*e81+_#IocMBI]A?./YA?im.P'ga+&!;Tf#-"
Y888Sl@M3gm<#KgZos)oo7P4d4BABreQ`?]Aet@:I?aWW_9n_$77Oai1*V+.?T#FUmkI'O0=e
BXs+Z,Ii*#kniGmZckQ0-<\"?Pb#)BSGg)4PSZDC;W1,F.O_<U#6+HFZi<`XQ'FClo>quuic
B'7dETl&V;m564$<btu[1g4_8FE9TB33jnjb/:4k6;N>@0?H1_\=q$IIN2Tl6ETn.#qgE&XU
$S)p"QmdV*7[JgWN/f;C26#MINn$u/mVBIo?H9tjHS2EZ?g(<Q,&1'<"VF4r1.)`$T5;Na))
gC18mHe(95SkO%/J))_NA9Q:Z/&"K[C=bI?f<SJ2Lgu>\5q&TG"]AL?@Q)g&L'E8F=6R'pa:Y
62j,t6nrG'L_h_@Hc)KF=gQIgi,]A9![&bLcX`i$dA@[gg:6X6j]AY5RN`[;LAS"MTkd5dbTH)
rab<4fYW6D"rjt5GQj'?2.pN:M5a8\pb`4A8YRn[504^qa%JZ=KD,B_Vr.)SjHKpdRimcmIl
i<)4B-PQEj)N/4V/mrDk#]A%>P1V^`c7`RRoim_'ASnVe=5`O''I,4dTBW[D!*C`RWDbPS=`#
69Ko[<L#FH*QF6X3/efJmB0bHS0""%4nXuVM=b642e:F>]A!K-9+ADBS]A9rb]A^tq/LYOUg"]A.
]A[X?-Z=?qub^$B*q?++hf)D_+$cngH?29q61Ydr(9Hi7h9[Re,[jTn\Ls;KVB:-B@LMJ/q>C
3df_6K_OE$3eDTXP3[Y+s0*(YYUN,&O:t;@f`bg!:!=7Dc?dIYI*k+8V/`j]Ag;`%f'oSd>R-
OKPcK?3apEso;Km#e7X'XYF^8paPBs.]AHioR$u<US7pQ[c-'DGiS!@RJbugotHU("+EI:W"H
qa&qp+j(P[_KOfHiR?+i@Q!KVrU7e[38EC.?ANac!;N&+,.@8lrrn7GOLetZfJGno3bKpQ@0
qR6LY>bD$(YSgI4YH219eXnS".L]A`P[!bBYOCGcBjSif?3,F+fLL.l1!03b`+t^Ol)UA,BY@
q516jU7&l+:u2V5qTCVmYI$BiJZcD5c6Xr(\SE-ken*8&"i$=;=^C4/I8Ia\FYlu_M$Ffm"B
mW(88U]AqL=qaO'\7P:=0j&]Aa]A5`>lRMn/=b"]AeEW'+`A:hX8G:;GQLD23'd7KM-@kUoAjTgr
;'#]AS/;>1gZo&m##=_hb-8Gpf6U:iG90gFAQORXea&hnCHZ2('tAH;UbQadi2=;Mnea,r0UB
/<*G$d2Jlk48dYfM%&%ZT:;4c(B-'&+qALE:_Tbk7`"PLT6'jVQFllM,kk@+mt:'(Bj8uV*R
5s9S7,rd\l6aY:).c1'S1S\hGOhX]A@=UmI^A*\1soH@_f6kBLYt9qP$<LKEb+BZFm7Dmmh_[
+MX.I8mpmE&@sW:Ft\\]A5dT)VQC^a6r[IP!a`4Q`R.gb)]A<3#8"iIY[&iSW-?6Y3bM3a'efh
\,X0"THP/r*l<XpmMr0A-7T)T*CAH+KRhK3#$=p<<cE#/TT(JuD'B,DAfVlpK<Ci#66'!7O[
P:%bP7VLi"'BLKS-^7blR(bj1;?KWM),b781WdeT7E*)e/g_bDG=+++_-DiM["Z;S]AVoH?GL
GW"f+gl[iYVO":FocnKa@dGb1=?SI2s<feShUUJQ:D$o7S8-A24,U4Y&hb\;Bj4RDd2E-gG,
@Hf-J-F=!XEc@>g>Cn"Yss_2ROU`i'[j6rkGIZ9&gfl-P&MXps(8134tC[C:`N!UQ6;8cqUN
)_Hg%fVnd2St);dIk/KED5"!Lc\00kR:.jM_:K2'*KBk`QHGE4@mP,V/oZ_V)`qE00-s$ZD`
'LM1OmT:$IBbIlSI3\3fBg"C,.cm,R;5uS#q*s4R&#PkeaTZZ:,A(nO'?'@sO'2IA<?tM2U4
\qcp*5#n@?gb_K8HYV8%l/9"C<5,anod4U`R>]A`$K@2)!S;`9\<,uT^BGWZ>J36CllcT/:%[
B`)QgD"4B%!7#CfKo]AJmE?^1,""W@*5b5FG/31(Y@s=W[l/4=j"X]A;g#Q)eCHEN?NXSZFO$R
d>U=^c=Q)1<>koW@FHAO<1%c7SbE-"*tb^)OD!R@%r>uQ[<%Dm0afn-"+K<`dYmo,bAJ+2H]A
fBTd4(uP[bU,e7%g<N?-o+iGR<[;'9*1q1BM`:J=*E6<pVA-2ZCNM`koqp9$)e_e#T/0Bsna
T568>Iq4]Ahue6b<IH_k*L]A2?a86)Kp?i8:*b'@a>LpFg0&YdTs`Y$8gO']A8-S!W+;^jNppft
k@]AZ^ppCV3_/s!jF>C?iPg"#<o./]A1u[/%kH?qH6':[)%6dO\K[EPA8<+WPJfdeY:6k\)hNK
O8Kupu5->2^7G!auH=__?O[YB+4b'5__oQLPnUn")qJ71Y(Xm86RdFHAXZV.U;Ke%luMFqc%
SXh+GWoWmleQ7,[R6\eF/LWYgEnDGB+N(SYC)`UjBed=8WZn2;0lQDGH5T9NM?C:Q=0S>-oO
VllG$[*a\'^RHUaCODhbV),_uFQlkKNf["X%X@YM<o\=k+)g0g\AV.ia,7aGA]AWnT*OM'Lrf
bN1DUph:Arc/[X03o$.]A><2X@k`E9;78/G#?YGd>m.F.HG%5$(k\5N*B\J>V'@:p:XPs6uI5
EXO%@q&*sf`=PAErQcWcL&AT-@ZSs<tLA<Nm"e:ud'T;!/"RGHUEINl3)>4f!g28RFkOl2E9
klY'g3Q$lD+g;54:GrT2X?IE1=cP:F*WUM4Q0PQm"6?aG.b]A3Uqc'ISX,-qGG'uYlC/6U@Wg
erG4)E<p.!d-k'EZ<XGpeShBf.\b/G2%Rs=O3K74c9H7:..;?Z&%O,5SEMQLZ4mTq*H^k,eL
S95`^$"r94,s(C/@M":&A4ZCS2.amsbG$s`7&mrGfI1@_6R0/PUT\,BZ*L3;'8B@d7(6`30%
NeLqd,7'%mHjuq6=jC@`.h.YNROk/->a#d*]Ae$'2C6]AqSN!l0QEohH$HtCWY+C0JVs1(#i6?
Zl!4M+;79*0'f2R8q25?smaf,&hg+3Hi7Vl2>S-S*-CZoP[*_'[BMqJ%`+C$>QAhMmkBkpf-
oQM+e:&jSkk"2!<MgWlW7<B>AA5SXs%&&Z-c4<!(YlcQk2@4a%,6pT<9YG8NT=ql<m93T]AHk
"X"2_do%(f)'[b+*`YEep2<)*K=7hZr-:EL)1%.)5X<NcM*nh_<Ck2^;Ii#(K^E>nTgj&o_/
Z%>to4,AepbPKXP0B;$%ngj6FlR)lNWqmZRYrGR6E6p3X3nr]AS?;6"t1=<Os^m=26cjc:+`4
i#\A%r=ZOFks'r(t:]AY55dR\%_:CcEN8J)UA"AF5%L"%FcV*;VGi@%\0e@1rVbr=(WH*@Cs'
_e-UQ1@:mUspp=s&0-m3E<)5KsZWjoS##S\<D-H9X[uc,,=ZrJW;R75V;]APedN2e,L$%AB57
W.j9dB%T/JnF[c61^UZ(8Ma/+<JF"`_D<Mn7&oL5H&t"8Nni>$%pJohYbk#PNc1*eu.89)L@
P7E[A'uR[J$]AF%u@G?"8O5(KZFjh;8it9YP,;B$fgq]AGS8Ndmpl8V(T,N33RoQ,5]Ah7jVst#
ab&VU*X0MCbUOd8SgT)_&^"'0T4M:JjZ'i[cGAT+W:eifP82tI,YBNQ6<_]At<,YJQO)FJ>#u
to`TZds!^"A#24F9Yqe-5:`))BfV2`X8qp;s8G*elhCpUm1<Amjombb8h;_tmInMpXl`H?$U
Ln1!m1g(ni,T.c#M]AYP7]ABP<,+Is!poNj)S+d2hU2RG*I"LT^5Oh3g=eo%/,!^P$._&>d(BQ
YqB;2,g.nVA!3iBDVcoa^loUC>S5l*=jpZe;4?EpSTE7:Ci&nedM,DU+[dafo@NLn"/!mP5]A
QWa<V4@XjE5CJo-JS`]A&5b,"Khppp,[uS.$Ek^efD)eJ+]A\jER!B?sgXQJi?SHV.hH,GmfJ5
FZFWP;MOM<+>54+/*iXd)dZ5B-O(a1BZR2Qf8t^^a?f6^F`9^=ZuN*[/!5qYm!(nYi\I^^aj
i[T-S)9af*!+R#:#UeE,_(bdgP:)Q_rmj/63_/[dCBsOcX5:$opZ4ELYRZ%pF_a&kLt#<gZt
7a^+SL58*c+R0(Yu!p*QgN?P!I\[?6<:u_N'`OEe`+gJT\;\eX>OD=6`<;W&*dq9]AY%3q%\B
h5Y8;M`'>Y(K)S6;7$B.hRJKYBeL/fG:@j8Q0<s"P@cpPY(-Tm>`Xf0o:UfE\KgKOBFZHj-P
I_;Fu\p[=]AT23'NaH+uCorV(<*LD;2@fj"&:%8m%,s_=XSD6'k#W&>_f-hZmfK:(WFQA)D,p
etY:R8fID4'qSLB=_tfh?3:o:qC['%Ye,;GRXYX4i,LE*C<o(t/f_*6,/$c;?q%`J0Y?F`kb
0@ZgGNa;6g#_5?/"Uk:gp3cou1=-6>hZ1$+'l[f5A\te@gJ,j[.pmd*[/G<R<:h.SNS]A'16>
Mmj5)jBop_-68shI5)F!C/=>hK9.!$*5-pSq;EhhIbbRBLO_e%4-BXgb*#tOf*Pu@@FZ-eRP
W-.-1&1M=9VTp-CnS=D:uEtq0Iu/A6E=5t,;0?5gl???f7*,na5uCJM,M=9ene54\lM[ihpn
VH<p5`pT$&<=iOrA9(SV6cmB"BsWULsH6HlE"UNS[=iK(BNB:c:"b1-k0k;(Xi-DZ_H(AoQ`
fQ0g4aODZID90_!&FJWHq32OOV/6m#ed4RTYSUpVgTGnjf4n(dO4Y[=K8]A&4p+*hjD.%<5`/
+[Ba5>(*i0:gabN)N7aDKm,rK%n2"H:b[)LMI6`43YrK"=i.+B'FoX?XKD)m!CJ6&LV(6qo;
(SNtkUj\=i=$Y:&`)$#$35KkfW`Dn@*D06U8Zm"fdq[g'/NDE5ZUH,u%r!XRtbq]AudgSQ'qH
%Q^'"#L5<:ujgArkB&LeC=>+l[UF&1jCKW-`]A[i2mh9jn3b+?Tj`(K+:oc6,_13-1gON[N\)
,bn"X3N>[h%Ws6!)(f/Xt\m47d_J0C89*!\e^[eJEfI1nHTgMCgSg^F>gd:mGT^:0R#G')Y/
VMhYPq#DL"cM@puaSt[$05`P$'PH=:g#Wo:3YQme>JJ)!P'S0>&?/9H?=/26D$!uf(JC!@je
!?siRnXnK>uSc1OlFf=W]A_j,.S>1TSL,dk>RmEp8u,j.#QhZ6IGO#J@>3[g115&#?r5e7WMW
.F:i9dbDU;"V[dnCo]AQcFFUFJ<(&c3dFkE1Clb7fQ4A8ufI[S\e2pl9nn_L#+V7C$j`20%#+
8o\ah=lBfh/d?h8mqN<s'rM1]A`l^*T;..9IO>>lH1Q.+%p!!EL=XWZk]A5-=U+ZGqI/F4":\6
4rAcjPJc2;llh1fj)+j;$ED<O.B1'/R;Xu(''3dd@d`SHM=X6UsC*"otfc>g0-^A.YBV:VUd
Is/'a#:k1i<$>:XqC4LPYY`,TGE3G_,`s#1K=NQ&E>+Hi+tuue[eB(.P#pEA?#flsG@=3'4X
J,;c>%,S>kRe'V#L[n1[\@QYB2m3Zd+c&TCH`k*ZpOqQdOR1s7i3";=$Z8UKmFaKp)`E*4tk
bTeH*)q-gUfh0;3(BUNmZEAq8/53h-SIe6MshU&G2(UlUO[^f\!Voo+rU'0fProW@`rle0&+
iX"m2dta?k1'1D]A:\56r-s_YepP!^6o_FGYAUYKK"uD#Qn,/CVb@%IHV`rK^D-V;RJ^4:Ai2
2!/1_3/5JA7]A/AqW:p$BLUck9.PpZf&?3heOGcNBga-@j;$`<(X<m[D,57=q#X=O3Led(@<E
k9fih:Ib9d4AUZ>Nr(?hrkDn0l7L4GWXYORpBCbF+I("m+SX"a<98ZW4mY*^Z7!LGXmYi^fm
@1M&'*']A.6RpMrCq#'bQ"Cpb@FaglD2p9=m=(Y(XR1eke@=cHRl;iF5>PhFRM",l)H@&as#@
3cb%6[-/kA@RdmOP6.,Y&E9_le%i?d@`,3F:F=YnVo+6qS[AUS,^%KUe5G-&iP69u/YF_=,A
Yl<+p!5_TaOF%i4=S!'I_c.XQ$qs6:S]Aut!=GrBVl+j[ZS13f0CDPT?X*guk0F@mI8_2VLH!
<Gnis]AENkQmHBXNhAJsfF</aV2.DS).')=@A1D>ucWeit'dCSfbuoW5%$n:s+G2#Z6"m=)I1
SQ4Y-_.=n\b?eXGr/5A?atU?rn]AW1AX2,h'VW[^MrMi261<.$g7r`kGBt1Lg6WCncMlfidK6
cHG\<H%]AP1<mR<)2n[GtEikK,,b_N<arueX$[TGi69-FfU6,/kK)<eRs>N>8-@=*VQ/1_geZ
Q>XSUS9/XqZ%m("Wr*LFh3V@)FQ=fSYQTPT)U@M+k%jnUEI]A(jsl_/bJ";rk;==KLAjE>kc)
MUi@'&j?rZP3KF#k6p8*8sn:L_Z``mZr&_%gc5P;tXpApCl]A?1n[^F`e.HW##<)u*nn62q7Z
H@eT%N1_o%,oPD`o9*"Gd&0R<$rnqmcp"-%YB>G,nSZ)RKNR2QSeR&<f9'_f2.]AlYe5cW]AQ6
`BS#&]A(8?XC&0KjC\'7@feYQ%6.i6/_g=M-b^j?a1gDkhVba<[4dG.%\!f@hgTdl)%>R1PEf
'5I/8&c+9J=>rZP<IN,^HEg_M8?N[^N&tF(PH%Il^EfDC!7'^G3D!C\@WtX"W!W.VbsSeFu?
=#4p,;2<WDas+;8C`"a?g61.j\L#^9c(kuH+:rVt#N=DHZiF*FJ%%d2?cTCm,Voc>aF.qN]As
5L-L?b\\EpY0]A"fVU52qo*a/*fu9j"D#DKXsGof&GAe2dH:aKQQ'dU*7$PUha0T(C*T^pis<
Q#\7kkl#EF1`4>5UJ,eDftE6d?(83Iqh4Oa$=P7sGNXXX)]AIK+fEfC$H$f,V'G;l_k)ZN:r&
<C(i\o'9eu2?*bEiLro^0Nf1MBFXr$ql>NEI^'B.F1Ut9LRR%%2;3NY=31@4O>FZ0Z1qaTQZ
njt&U>A3*!![l!0+V)hU<LaF^2#ii/'%r6!f$73+2P^>5U=T71f?#))nGi8InPDZD?=P!OMc
K35acF6TPbZ'GB3O`!J\M0Z`"ti&Rk-OW#Q<[)8Yf"uMs(Sjjl+Y/a;VH+`cJgqQMQUj*&u7
.^%aG$T@D$bo$uVh3p`bsa.r16#:5mQoqm>4,%Me0[2X`-]AsYrhdZ>'qAqJ0BD)>MX^_uE$3
TbbB/!fK>uV*W>t-ISo\m&_A^E^[i6e\J;]A[NC=O@YDrLp2)E4kqog7[d_X91OiloWj^iTks
OQM+2VID.f&oS7@?mb%_O-]An5!s"l4ApSpX+C'0KPgf$\naU_?.P(^?Dn0cRN>8ET9;NkDDb
WI;p;C:D^ii2]AF4aE":nOkZq6^V.kn7oXDT8d#0!ifuGf#Gf6"LCYBMp&K`WXe?$D<:qRp!$
cIDh,Qo*[$Pr*@43W!Pu.ci,@ZiCPiMd349F"F?MN@YD7O,_S;*?7)Cl^R!neE]AI0]AH.Tuk1
-LU%,:5d8Yt!4=fI?Po2nug[/eISYQd:l@H&4Jk]A@ATEkXVpuZ"c5LJOtDX##l+&H+NY<2a&
J4>4F*QIpsBQ8Sh2Of0REgNQe_g>#BhI)Zih(f1UW;g-SIe]A:H>E]AXnZb0?=%ALk!gIRM8Y@
b]AcJ=7!5e:GG`Xb,kbtGh;IL<]A3-$#JNLOd$$<iViJPMFInfrQ!&"C4D^ad`%mRk:i0>,UVB
.s@#J=Y^%+@%`B`SI:pTOV6n#fG,^ss.MEG7[3H01R8F_gDam*2q7*-n,s=_RH[mj9ZhN4Se
>41O7)*ROCJmqtT$SGDgF#.WOLf@j9t,d+Z+;7o]Akm*\Lg@(#RIgM\_a'G790KHA(2Q_Eb:(
C[&*,V%1VDe7dNR7_#LaH_7RQ:9SGP>Ec#r$lssl]A\sKUf*Y&F'rV^!EX>!2[qjm+/NdAbP8
W&l^ndZYmGUa'/d+s,jiPA9`O+uY*JFrs(M'90r#fhbe*Jkc1WkF9m@PDWbpaPW5.@:GM2KW
\?_=C`eYI^))LA>%"^WE'H`V]AgfAXg7k)lU&[?[ado!7qk<P'Sq\X=E$8D=gIu]ASjBr'"SE_
ZWcj2/MMHtMW(P(^Can%UkmJndlU@9[3]A4?YV.<]AX!W39o)JDnX,B(8hmSU[E1B^hDa@1&FD
k&mO;-`P]AT%&&.MV"ucGQ/rnn#e\i6X`680I0DVm-7-gN=SpZu:;kN;GEh^+la>_*VdPp[OH
qGT!C@9n[!KQ"oLX[lepiKj2OQ5lCDKpqb=9Vr#EKasX`U3[J]AeL:"L9l11@D)oWTba6/'b8
t<L-`7eCI_Xpa)5!,MbkBaQU'eaJ[6HSc)EL[0E^'/_hFXdDR!CQP<IEBOuCY[i./Y'PJb\d
1^m[n&ArLo;MW-4BZl$Z6K4QPL"2qXX<'*s2N.@p*aFAhX*IhMmR).neEQs/rI]A>t0N?0UI.
*>K;OH8*B/B<=((!#5=f.E_$="nr3MYO'ZZi9KljKN,#_@@_dN1OZ0q1Y(jLoTsr;ABB.TUW
\Z'I-X_*dIF2?q)LQkkMLL_'G;DRN(D$>8N]ACo9B4eX+=^eMPX*'6J"h1!=#lLHO.33u,cU6
>ke#)#0ZUB:!sdG:0u44a23hJ*-1P5]AFV5=9=hS93Nn2]Aq'0#lU4$'puaGXf)g?GSmlsecoF
H"UcUg4J;$&Ab0BHaTsOWE:A[uiB28Trpa6>R#iatYIHp7E!'3uQ$AaCNh%2ACW+!Nu/,u_G
qlk)"5qUs\65\X*<%ZAS!Ddf364J8"St*Q^@oO8kR1-O(./J:ohq2+FnGafiglnX<=-W)*;L
L+<nm$QHo8L^9copL%\eYM:7:S5;(f4HXkDmTq1cJ%VL654a9nYTYZK<*;kWE*ES_-*[AIA(
BiY_+>.n!9CZ*7<(Lj@`BeP07T8b,-`5N?`PUo#X&?j+=/HW*I9B"RdjP0c<.Scs054*gHQd
q0+:Z>ttZR$4CT:X,Eq_1UTgP6(\/._o^YP)><3]A4o\I6$j-%7Sl[V]A7>GYA9[8m_C]A@lIO2
FpNnA6bJINZ(-K@T#dlE%Th0;?c]AOun7#^GfqqZ?oqli"*"]A#[St]AVdAb@=LtWRH/'?@lR'N
-F3e[-Tq#654&0DpqNWp9NjAS9)JDmrd5UdWuttGCC%D?e`?fSI@-TgOsFFPo2'3`#[UKGc?
E@i!fJFeU_;jYUYWF2EoLjQ5u33hG/Hso<U!A9YT6BTT)(74NoZ2RRc7V64$5nt_2*]A[IT6o
n7.gP#8FuED2;(5<hAt5,C)XX:[Kd&9DR-8BG7Q-:I8&ZRU5h[nU[B"HJ<o^U^j\%hos353B
6oaiHV_qpq!md!SI!$!idU%;Jr`3';h37/^HqBl@+896e!p&0&#l7A4f2qX#X+,8$lH[o!Uc
j0e+)US'_h8!1DVHTHb3*>U(RRCpD`:UiHn27nGcN\G*$Ml#P#AAmTU!*IocRqn^$k]AD0bmU
!<~
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
