<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="sum" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="date"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="dif"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="DATE"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="fl1"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="cklx"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="fl3"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="fl2"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="fl4"/>
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
<![CDATA[SELECT 公司,COUNT(*) AS 库存数量
FROM
(
	SELECT t.日期,t.串号1,t.串号2,t.仓库类型,t.商品全称,t.当前仓库,t.最近入库日期,t.批次入库日期,t.公司,t.原始入库日期,
	DATEDIFF(t.最近入库日期,'${date}') AS 自定义库龄

	FROM 库存串号明细 t
	LEFT JOIN by_sorts t1 ON t.商品全称=  t1.商品全称
	WHERE 日期 = (SELECT MAX(日期) FROM 库存串号明细)
	AND 1=1 ${IF(len(fl1)=0,"","and 一级分类名称 = '"+fl1+"'")}
	AND 1=1 ${IF(len(fl2)=0,"","and 二级分类名称 = '"+fl2+"'")}
	AND 1=1 ${IF(len(fl3)=0,"","and 三级分类名称 = '"+fl3+"'")}
	AND 1=1 ${IF(len(fl4)=0,"","and 四级分类名称 = '"+fl4+"'")}
	AND 1=1 ${IF(len(cklx)=0,"","and 仓库类型 = '"+cklx+"'")}
	AND 1=1 ${IF(len(dif)=0,"","and DATEDIFF(t.最近入库日期,'"+DATE+"')>='"+dif+"'")}
) a
GROUP BY 公司
order by 库存数量 desc]]></Query>
</TableData>
<TableData name="cklx" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select distinct 仓库类型
from 库存串号明细
where 日期 = (select max(日期) from 库存串号明细)]]></Query>
</TableData>
<TableData name="fl1" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[JDBC2]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select distinct 一级分类名称
from by_sorts
where 是否启用 = '是']]></Query>
</TableData>
<TableData name="fl2" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="fl1"/>
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
<![CDATA[select distinct 二级分类名称
from by_sorts
where 是否启用 = '是'
and 一级分类名称 = '${fl1}']]></Query>
</TableData>
<TableData name="fl3" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="fl2"/>
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
<![CDATA[select distinct 三级分类名称
from by_sorts
where 是否启用 = '是'
and 二级分类名称 = '${fl2}']]></Query>
</TableData>
<TableData name="fl4" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="fl3"/>
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
<![CDATA[select distinct 四级分类名称
from by_sorts
where 是否启用 = '是'
and 三级分类名称 = '${fl3}']]></Query>
</TableData>
<TableData name="main" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="date"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="dif"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="fl1"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="cklx"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="fl3"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="fl2"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="fl4"/>
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
<![CDATA[SELECT t.日期,t.串号1,t.串号2,t.仓库类型,t.商品全称,t.当前仓库,t.最近入库日期,t.批次入库日期,t.公司,t.原始入库日期,
DATEDIFF(t.最近入库日期,'${date}') AS 自定义库龄

FROM 库存串号明细 t
LEFT JOIN by_sorts t1 ON t.商品全称=  t1.商品全称
WHERE 日期 = (SELECT MAX(日期) FROM 库存串号明细)
and 1=1 ${if(len(fl1)=0,"","and 一级分类名称 = '"+fl1+"'")}
and 1=1 ${if(len(fl2)=0,"","and 二级分类名称 = '"+fl2+"'")}
and 1=1 ${if(len(fl3)=0,"","and 三级分类名称 = '"+fl3+"'")}
and 1=1 ${if(len(fl4)=0,"","and 四级分类名称 = '"+fl4+"'")}
and 1=1 ${if(len(cklx)=0,"","and 仓库类型 = '"+cklx+"'")}
and 1=1 ${if(len(dif)=0,"","and DATEDIFF(t.最近入库日期,'"+date+"')>='"+dif+"'")}]]></Query>
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
<Parameters>
<Parameter>
<Attributes name="si"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=sessionID]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[url='${servelet}?formlet=产品类报表/自定义库龄查询.frm&op=export&format=excel&sessionID='+si;
window.location = (FR.cjkEncode(url));]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[导出excel]]></Text>
</InnerWidget>
<BoundsAttr x="802" y="4" width="80" height="42"/>
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
<BoundsAttr x="712" y="4" width="80" height="42"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="fl4"/>
<LabelName name="fl4:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="四级分类名称" viName="四级分类名称"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[fl4]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="600" y="25" width="101" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelfl4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[分类4]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="520" y="25" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="fl2"/>
<LabelName name="fl2:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="二级分类名称" viName="二级分类名称"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[fl2]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="420" y="25" width="100" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelfl2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[分类2]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="340" y="25" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="fl3"/>
<LabelName name="fl3:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="三级分类名称" viName="三级分类名称"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[fl3]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="600" y="4" width="101" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelfl3"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[分类3]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="520" y="4" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="cklx"/>
<LabelName name="cklx:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="仓库类型" viName="仓库类型"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[cklx]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[货仓]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="80" y="25" width="101" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelcklx"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[仓库类型]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="25" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="fl1"/>
<LabelName name="fl1:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="一级分类名称" viName="一级分类名称"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[fl1]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="420" y="4" width="100" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelfl1"/>
<LabelName name="cklx:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[分类1]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="340" y="4" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.DateEditor">
<WidgetName name="DATE"/>
<LabelName name="DATE:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<DateAttr/>
<widgetValue>
<O t="Date">
<![CDATA[1633017600000]]></O>
</widgetValue>
</InnerWidget>
<BoundsAttr x="80" y="4" width="101" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="LabelDATE"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[标杆日期]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="4" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.NumberEditor">
<WidgetName name="dif"/>
<LabelName name="dif:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<NumberAttr>
<widgetValue/>
</NumberAttr>
</InnerWidget>
<BoundsAttr x="261" y="4" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labeldif"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[自定义库龄>]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="181" y="4" width="80" height="21"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="DATE"/>
<Widget widgetName="dif"/>
<Widget widgetName="fl1"/>
<Widget widgetName="fl3"/>
<Widget widgetName="Search"/>
<Widget widgetName="button0"/>
<Widget widgetName="cklx"/>
<Widget widgetName="fl2"/>
<Widget widgetName="fl4"/>
</MobileWidgetList>
<Display display="true"/>
<DelayDisplayContent delay="true"/>
<UseParamsTemplate use="true"/>
<Position position="0"/>
<Design_Width design_width="960"/>
<NameTagModified>
<TagModified tag="dif" modified="true"/>
<TagModified tag="DATE" modified="true"/>
<TagModified tag="fl1" modified="true"/>
<TagModified tag="cklx" modified="true"/>
<TagModified tag="fl3" modified="true"/>
<TagModified tag="fl2" modified="true"/>
<TagModified tag="fl4" modified="true"/>
</NameTagModified>
<WidgetNameTagMap>
<NameTag name="dif" tag="dif:"/>
<NameTag name="DATE" tag="DATE:"/>
<NameTag name="fl1" tag="fl1:"/>
<NameTag name="cklx" tag="cklx:"/>
<NameTag name="fl3" tag="fl3:"/>
<NameTag name="fl2" tag="fl2:"/>
<NameTag name="fl4" tag="fl4:"/>
</WidgetNameTagMap>
</North>
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
<HR F="0" T="0"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[864000,864000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4381500,3924300,3505200,6019800,4076700,3048000,3009900,2743200,3086100,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[串号1]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[串号2]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[仓库类型]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[商品全称]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[当前仓库]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[最近入库日期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[批次入库日期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[公司]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[原始入库日期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[自定义库龄]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="串号1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="串号2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="仓库类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="商品全称"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="当前仓库"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="最近入库日期"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="批次入库日期"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="公司"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="原始入库日期"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="自定义库龄"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657929"/>
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
<![CDATA[m<i\O;eOZ>7&*[XktET9<CpD1XWl-/?j;2#elJjXe5A^ILohXrPUHQ!84]As[V%kjV/VlY9V+
MIK<5\bsCog'Y5U%<T$qW\o+bguXq4'B)SaZO6R:c2qTAN=lkRW+jHU%CQf"LKohs4F3?[WV
%\R=8EoA&-V(4<X^rK#diB!o1[5rS[MNq72/NiapRF5&&@nGRPqafCX6=XUrtjLdM']AZ_b7g
KhAhbppY-W^"bB^>d,:]A@HE&ZY(:\PBo?FF4tP@a!F9Cmu8(F0C5f(>ksPcWr)RX<qarqIFg
1$O#hL^X+#N&2PuXaBD]AmXmoQb#2SHP#;[-@/Vfu^-.OuA`508DffPaH.HeIePSa"hNO[D:*
lB5"LN!/p4AF4><)`h=g270&NEtUM>frl`4khN.3`+p*TnR]A0dgC'd!;d#h:giaH&gCGb$q]A
p=(k$h'u;Y#2u)D:h4EPoG4Gr0Ue\\ba3I\tCaD@(SPDn#V4JJo$$"1$g4NN(rf/@rF[@_VH
?[MSeL^$5;B<d)-)Hj(`O&ePgQL(8Z!%Zi77BRgSQ_^(XM^#)pji0$0a7jUMoKat`C@CP$u)
hS7ICA[`DWR^nsU5>0sNfQnd;eBnQr.<^P^q7Sum^3FVpY/r1_;]Alq-sud(&loou1lS#Y>&*
?`FCt$QQ&Rumd&r<\1a-j/986NW.:9GX+kP1(mnUq?W2G_>Hu<p&8j\EWhj4"*VlFGV"3p,T
<a;C8m9h1jGJ<?adRe%SV^+8SR((u9`q\W;]A?1r7X6-QfldK%:Rq%=hojPO]A,G<:7jsU[r_T
SZ,@LRoMf-jugH$i.g&OH#&XO+'mPnFe1CGakDUC@12H8hXdnaGp;S<,At(EQADkMJ0Hiep2
7\F-_G30iT$@F]A5>UA=sZRWIpOG#8(QU(EIK-g\ZNc;m=(4rUD)1,tOS'dTh@kWHUBIAaW4N
sVgq9T,%tnpTC(VfU3Wh3H!e^II<CMC*VHGc^<ib#"2njXKrA4Q:Z3j`E@m#Pr4U9gru"20=
q!S&V0b?5GW&0t1k\U2^6=+m9EtSe>A'Ri9=%JW8dU2s)Kuqu59YWb>+g:M]A]AWTe6l+0on^%
B@g_'nEpM`X*4!XMH?Y;Q;4@NAGfr\e^.pP?mE;>'%uk).?49Dcj-g2[0YV'Z5>XD(Tf_]A1&
QT.H>IBNmJ:[*ptOAMi$C;'fa('XEZ+=]AhNm4`_?k*oFmZaIc_XD7ebQ]A)O_N2#cRKem)rfD
GKpBi[97/Wo5MbE&Kq0N^CA5-G7b\Gk'p!YgR(M0m\5cYOL9CfjSt\tU/hu0ZKo<W7aH_:0!
<h<ZoBtZ-3.Dq08Sd85)RS4,26;%cEDmfE/s%Zt,P^AsC)5k/GpTY"E=o=<f^*25e"m$#(sI
cpgs5"PB<Gj,+8Da5r?SU!`,Sj)P$IPEUH6mc.@PK0J$&+3+kC'Q42Nf$J/7b3El00I+Ys0s
g"W=fi8"3g$D_0`9!OlU0`]A$p6+USmgLo`#Pp/TKoJ/MQ'F9fEF]A8bl5A4ciMe*=t(#_CkFo
;gI,:_)IBh!ulEP/a_X30)f6q,"Hm';'r/)/H1PCTY`nL7;=,rTNEc4XU;O96AGVTOd['XYo
cFQomNh.b;-'2$bW$#hE**cIdk!''SPkY_Gr6U6[M=DuTu89tT%a$G`"BK@(D@B`PaGh=LFY
pS3W5bc.>k9\h"pP7^O.YX!i(f=q3Lb(=d+L^*&_uaCn[%>IZJ?T81e<t\M%Y;,!JauU/<a0
SL,Y3^:.e^;9OtBSjnVMa"#Y3Pu3GC^hZmrBROq@T>>\#rD4mU+J$QS`eFRJ?Qq*HVcZX0%O
QWPUiq_F3o-=m'GFpb3mPd<WLUtSfs'NuF]AbV38\;VW).p/Gbbf_Zrk`?ms5ai"tqb8c20;<
-daibjoBj9E/&]A';V-R^NAQ+!GaIe[bNp!@lJhZ2pO"Ro4%V6@Ymf]A;`SqROSlqWqjdCJHW3
b%O6eb0c3XT2q3'liV_o`Osh#&&=Z3X?mTU.iW3:MRqC*>q_=5G\uj&[;AAE,UXAWq/tusU]A
o4QeMrIeQ*7,TG$jVn=+tkA=dRYQ"`m?Ys2COVk+gUi^\*KtNPP`%'`?3RJN^-p;9PMlK=A=
04_5fAQpm628"d0QHjD%nj%VdPOr$VP!As?U_(REt"m7tfh:Hsg&QiaM7bY23lP))heXPF`<
`j&hi\n.bdbtu\H8S32'=PZHeQ=_U*bACj[poGk?E9olhC0B7f$p=o3^LX=5H\qO]AiQ/$U>C
_.)n94Q>JS"A*J4%ENYs,7c'p3HgGFL2?'h=V+>##k^=2i;]A6oUXN,G#BY':;*,6s;"(,ZcX
!pDpdDBW,<d8WnJR@ME#>,&K[DgDia.1KIdY$O@*R<l1!u/=K\8W%-NDMsp1E,]A30!g!e^Y$
9W;FYr0"SAMa]AEMt&kWqU.ZW4=SE?.ITe`*jn]AgMTQP,kP1dEXZ<etM;'@E]Ac6@qO?=#V+B5
75:[WL@#_1YAU(L1Vk;?'n*#cM1E1"_;JbN#u8.UtS.o^(=78b94"`n`)#.Af?TY^e!)^$mf
XV+-Ihnd6pI#5epp(:"AUEsV0?[2IXi_bP>)qdhrY_9NoBi-8VZ.I@Z<ET/]A/^GS13?G0WrB
a1Cje93YBLK1,X?bJ:&V$[ZAmg2Rjt\!5g1\7>mS@pp1cl3,g'p0Uk7-ap1=(cc(lq@W6[+^
rg8[#4j8<hRrClu,+pPusf6[WR*^:9a8cA4EDCrcO6LYeN4Q<hS.l@u1('^YB??bl`ja([IB
p,OX`f2=V'<*S-AaG6Tg]An2Zh@0^;OOQpdg7<86H6@AQ/K(+S._N[`T9,E^=>rkeC?Z<eV9>
SS,NZBSBP'.0A8BUki]ASM=b_/'R5e'MpVp4ua7u0hS'Om.i>%*t),1bfp<E`_#)@ILMp_ECN
%[h^6/bjEaMP10L/45E9#K#a3&*+WMYK76>P?kC0CU[g]AXk+6J9ZbP9d%5kbC_,+8*mV]AH%S
V\`b2pV4]APiQbf5f["Q2<^DR:#XX?`g=U/auTu=&hg=DPqq&QG@5EmE/9ICS*T61D.*-+mLA
:p<NF9^Unp1N*P%F=E#4bAD4>:9IpZ\Y+m>M3unES!QdhM0h%l"]AjK4I#j\HI@5W,Rhe1gkh
(H/GbPg2B]AV"PP`3lq9LDC+b`RD)-1IOoN&ARXX*KW`IfiC:G"T%Mr1D<%^$Lr%%3m8c2c^T
Uc<dPK2s43J0ST)<`Y1N@=&K1nLIrP#Qh99Vf&1m.YAf3_j&ZCf`l%jXE1$'@J=>IEs%[K!`
Pp2csqXgjt;I,t<,9q@InfLRjb%Ws)%lh&<`3^F8Id1c"Kp@<M=,V#.bQ9CTH09=pd;[`s/k
!_ZOeFE^rFHsk`j^hj>Y+$&K^=Cbo8/_=?6erK/WJsjRs6cg[:6dNFglO"4>Lh/(YYBB#Oub
-g*cEV:qO.(`0%UNP*LM.0mfZBn9tM'<sNqbao*TlN/UklRUp>GX:qpQ[Rq';^G;TH>:,FGV
l*<<%92?Bg#i4Ubn-p9;\'FCY55Ce=i#@beRWm4eWL>79C;\@5b;Z=EdBchYIb)9C1M/0YQ]A
'_</Y#;-Hj[lD%p<5]At3802\^!r5jAq]A/Ckkn:6j<1dtf'6B(8F$\Ofe.J3lNG%sq<>9GHio
9N3/DkASuHR*'+'bp[?/TDX3JQjl-%69ND]Aa:k*"dCQb$@YHVt9/Emu&gh\!EigC&>?#aGF@
h3BV+`T_'nII1&jsoag"ukEl6Z=!QAVrX$W!T:[V."Oc3LZJ"u3@Z4uCUUj2R[JMoic&h%HU
?(AqSqKm#*DIMUG3=#L(_n+niEb*JLH0V\:UhErS:V`TnSjK2A!#edu#c.QmmSlC)-Afhmu<
4(4.JC@8\[^J!/@-kf"[`9EY[5Q!JiO-n*68?G6"gJQ+bdFiLB)#boD>msm(_af58X1?Oc(V
ZQ0ONI5.l^arZkNg(S!8(k?/8lO/JJF]AH;dd5Nji3+o++9#I3Y:Z)RF01l:44@ATA:rN+f2`
M??@Tn'EHlPK3I0cS9U>3&uam+cPcRfk<84+K!uI9lh[cf\TAl@3^^H[5bDk9u'[TEo"9edr
7AR@TBaAoh9NF=iq@FKHt+Yc>l[uZh%L?8rR*4djn!<j@d*.KM'p`9EXBemMV_2k0cM249fQ
-=V/gh_ECgC0ZU-SNJFmcii^lV\)oTY.DpLs]Ahi3,k3`]A2Xd1dX_m=2!dlOJ+QK2g<E*@NVk
=dc25mqb9dH[B^=&55BOntXD@Z?feh`/K6<`h'_o_:)BV&TCNLS^Y@p"@Q9pAuOHL*dmAD-i
7"nQms(GTI30q-&P@;Du@5EYB)#:T)m'\a@So32<oFoVS<#%GW$oSCd)M7eoSBEbTAb*BPP?
MgA=`JFY9[IRh-2;WUR<[-O]A@(L1uq6o/G/nPKVQa08LVc7k(48,Hio]AAO-IP7^re*(r7qm:
"/LM&9p4<(pg=1h9.U;-i.?<(;jS>F?_@8#C/MmBf",$+Wc*DCkJhiPcH=NX.FH9]A'L_k&UR
GdH`?I?!<`%$qm#4.p-5A0,:do!Fe!UrhN+%Ho'7GNM.,q:+]Amk59$+&hoB#+M:/HG(H/&!q
FGV*2\fe#Isd8PMDGKs8`3gj**%=B4T>]ANgAfGfL8\LLA3uT[A0%lQ3`QD&?5m/=g:9MI;sZ
Z`FC>kf9Ba.W'-lIN(H1fmB^*kFP?BMD-<YBSSY*lHE.2Ss]A:J:B;T09U6]AX^iJK<t3pf?W:
2e3N?!i0-#AXtHTGG?4q;0kf\qq$A_ob^l0h%gCVc(iusrCX]AQOlH_R9<lS-WYg8"*Wu0qOV
m=2&kCTM,8u>s%+qD(]AT$?jl/4WC:@%3`MtF;RfO!B@3mY8435&65IjhE6o[L6)08OSS&?SC
1:`52t^lH^,n3\&3iEVNH7PmZs@hRo"0.I&\jr&1LM+d9Zr5mlY)i!$<ZpZ>r.'uOp\/UGcA
,Jn9^V@p%\l-K\C4$:M1V?i*;Q\kWN#p"kpj;p@X^;P;o`2WG%JV1\\VA'Z<FN383R]A>CO#K
;3FMKZamZ`$lNO.DnF!o\jbdWi1;/%T4CP9nHSE9\HeRJ/[&'n7tLbF`g0d?)e]A(F4-[!k64
IOLr,9cUB(T\SfL;+@G"+'KX2M`K=GN[.@=JE0%mHG>Ije%;6hU[$"M<DuY*\i\#\`$qLs\^
Iqq7h5!6JD#Ide;.U>OsrS'*k'fjiUFZKp`=ADbB,s0)Eh1u)nD"leRB*=.#'IMf$Tqi\=m2
9Yk,>m@Rg%R2juE7hP<V=jf!F^kKg0qBTWl3*_p<LoNXi(`%FUc6SGdNW#l/Mf&cGC_DdV>!
_&E^)-]AM=@.inaQu<J.O>b'1B50EKMFI@I1fD4(>TUJB@CH?-6A&t;aLSh]AaZ=$hKTBC\f+D
Cbg"TuQW.71R+/X!M5E/;,)MoV]A%pL)1M:\$4`U1>t$*8Q58DigL5Dsie;7?64Vfq]A%cC3=A
F43b]A7J,RLbQb^I-orM.5kSY/B/Au)bNoAK"6JrB-;7:k_&jfQDtQYSj^mYJ%.*hSA`\0n.s
\R)8@FT[C*jsZ&8Upi;q"Qs46tFRM"<[)S$J[eAOF86mYC8!&b01G_>:%6:[DL['34X'3bA,
)pIq`!Eh8.u."g?K'a]AJ/q3KfPWm[h9?^uQu>s=F`#Q7E2"k*pjd3j"(SCCfF0ZfP-7u(L?%
p\sK3f8L_gmA__Hb`"6]A%tDBAFfXLkC.jJEF?SBMlU6b"ftoaZ<A*%RFL=+bhI;Y/#/9Y=<Y
,O([g"JDJ7"Wd^"=H<J3oadhtjX]A%9[A^YF@g3_WGc<G89NdU`\YBfQr]ALnS^>QVk#t=ipG-
9(h/3Z7oYuTY-6S:kn\pREO#+VDdg`etP6cF6[H]A#m8P%m#*(2j.ekIY=_8+n_X\/.SJo1'a
=La7l"82?8?=OD5MM`TUi$d3d;-dc/K1#.]Ab]AiRBE+n%ZmpKQ`#9h<7UgCj:)qoESJUeG5BZ
i*c(!W9>m4_gNH?,60:<cT[(#NpeK]A4IV9$FNuC7Gp"I,%i!nZuH]A8:`(eU+W9qhm71#jSAG
k'PG`YVNE@[9F*+0MK+04Ind)Ts,sXEQIuXsiGb*mRVW<[`&;\?R:kbgT2mLW@bmgY??BFRj
mF;"]AfmpgJ4U*T1omncG(p:M[9DdM4f1\96*)rq9hMNuF\jZLWF>p'aG,*2g>fR%LCfdgVF4
eOb(hJ$?"#,Ku@q3Y^CGQ-H%POJN@]A@7Cnfk<sR]Ag-FQ-c%]A:Wb=l!`$7DSG:Jr;n]Ae!/]A^3
`^>_GGD:8);;p`+Oi^CL7qnm"_8Aq40:KP,+VGU/Dtf@GVB5d7@'9i)0>m36/eY&(,MRN6J@
705G+.`EUMAC7CrtKUn:JIIB\&&!6P\1-%-7pfZ:'B'QhS^?B[`ia0pimqMjI('PcYJ-Y[5X
^'$ZAj+3`N461&Z9I#W.JuHFT/Xe=XBLWsBQ1PLA]A90g8[L8bW$InqPri)[`.@LXna-\K9Ek
H3hs_HTIJe8PFCt3F5&o6-!HlB:2b8uV45_MDht';&5tsn1.AP^7,j-)@+EpHhA"Ac_XNt`]A
n?KdVKf#t4.DG^RI;To]ADSLP(+0A:@)_#q5PkHWHMsDg+N^;ERq<?A'HoL+D.rcECjOVP!&s
Q+,mr6n`qiBotr\,N4S5Z/*A<[TkXu*Go$`Rp#]A@)tS,=L=@l"HkW4D$3K,RT&j`YXL=EFFN
e.Z]A[=X7MuRHaig9&KSKt*Z.L=iUD$gE;6;^rcWW.o46Nc4LR#5FHnIBMtL]A\?i(Qt'dd6D"
!J(If_N(D`f9l*lYd0NKmmmq`=M$XHM';;O)\q<4EJBd+tA8"\UP67g=.bn`pHrLXg7g<?f:
"D\/>CXV^NOR?c!M2%pEb2!7B7b&Q3?:%uT[(bn<2TH'#V;hZpp:SX=9"h=YP6%duHW?!n<D
W4=-$61X@R/!79h"6Fu]ABOF'(K,+0S,7Mn*XKC[r&;N1"3$JXo_NXb:G`3sB:i!dJ3j>]AuN4
)0Zf!;mmpk!D9@kds%cQ[J)2Yh>:b6jCBLd0n<miknIj>H\M8GsA79>-]A[On`M8j#:n6=%%>
4DTnu>!"II$Tp_i)\K%gf_6GpW!"8h\^\%gm5Vg$"/!B%l'HU!0ikp\hbOuAX]AnoF$ER`kM_
Q8u66dFTjGKLj5(=\.1+G[(=+%kIlb\3dg'gb_<B&1]A=qCn<A9F@#TGSJ'R\8]AkPTl@skR9>
[]AHR#_ja4>1O4f%0!nYet"qJu#^HM$C3.<Sb,4(WNW;&f?tM"hVn'lY]APR.P/uMoW3JVP40"
=o78J!0/GTrrmF\"89SQjY;mf;(AHaqVY)<0LiZ]A/ln2gaf/l.:FC-R:!gP:[(>6X*8K#$`?
\'jV3OB:NETLSYb?30D:9d-Ikhi;QOVU^q;jnHYT;[jP@_cRGS1RE?FGh*bpG8pB#r=^bgi0
XRJ=3>+kJi'LdePk)=(,X;u/&'cF-[cQjF#9(Zc7`0a-.pf./ePMO.M#,"KB@`Z#Tha`\pe8
!d4ZB3F9^4eHCp/$]AOtaqbcJKnR41-J=m'5S`@RRS=:'7p&R:T"NaGEI&dC(:+N\I:4^[s'\
lQnEQ7p+i\l^kirrC;U3O`p\Nmp(M!3'Om,B(HtQn9(E+.2rS-OUXWOT*?p%>dXYpp0*IBcM
e2H(W@S*ue3;p*0Qqt6D\8d_ne"_LJVp6PhZqT[?)22bm;5Ido4aWI`@nO;#dB14CnEfA(/>
#?+X9i3Z=B$n9?(O,-`#msuH-LSmSnQ`pGLrGF:B\]Ac_jUr_"=Co0Ag?'5)+IHOo2P<8ptM.
K7g(n;F/Ot83@af]A=oGT^k,0_%aOS9;V!R6ahRM:57HibZZ[>IJ%)3,""9)?!'-En;2'HgX`
T*Q>/T8rhecfN2=4Q1u-%GGcOup;A]AR&[F3`W7fIHh;P*A+3:o5sJ39r^bjTl.]ACG,^'3Mo;
qX[#7Bh?.=<V`OIjHmYRtCp4-Mq2TQ)SYV#\8jc&atj%43s\8?V(PDpNi#al3?-<@TZko\=n
S'-<k4oK(p%)(dJSS<!.@A7"q[9!d,1]AEO2qP@$73c%@dpkgb(GF21QFZ7b)mXr\=PfF92>f
4!\V%5<'%u_kZK*b,N%]A2P+Q]ApuA/9N.!ASU,tS_.1i3Ar9sca+>T5<$K4naIapqj88_X!53
l<h?1$7WTZP8&Ot1>u&/e_<:u]AYVl)?]AX#do2:7["$S8RU93?t)moWN:&OBB&*ZLe:hIMU-@
^p$Xb7r1k;(79]ANeN0Z^-;P&2)s?KaZ&[/=EtBl0*&,Cb"?Q:7Z!.d$t!9^s,K-M"XD+\;sK
pcONeq?gaID5B>ks`RXT#%#,44+r_7/!I%Q)/9,BTJl,>nmnE1Yb_PHle[&WAnnX%C)>OV+U
5^$h6:qI^\iLo1ZFkrZa9rF2t#nJ,Mf#;\2Op`#knX_s)I8KX3AO,Z@^XKHE8*BcYIF:?rbj
I,oqV5o?=]AGFS3'S`K<W*ZqlVDX7Jk<L-iq;s`pUb\=p8/m.!/nMdVU'U]Aebnu>h7?_#DJ(,
5Ko>=@Y.NZUBdKpj'`U#%SVh=[hUPPbq1!GXfUu/?7Ag"AWtW8DUoL,$pU+%fAXZE2QT645G
O'87K?j><LdR6.*>`"Yl&/$1dq26.QaRqc6%obre%$Z1rR'=a'G++q?F`8`+'1KBaF;H[%Bj
'(V9]A]A^[u.ggqP?D9hJ`o1j4uTfA>4Pm[Ho=B\&Q9A-57X+?$t;5"-$kh1oO:#k8LU69gO:+
BnM?(&4+XQ3lM!m0<L6>_'oD"gu976cT:fLM)`N;4khic252#_\Ke+`ckj/3rHcfoY;PCQB7
BI+)f'p"ZI-r)nik-QV=PW#DPS,9_9HeL)DNjP;saekaZ!cSD6=Y^afG>;T+_DW@<ad=6X/J
Qi]A?@+6tq5/ilKQ1q60bDlQQ`>Dd'$HMPEGZ9Tdr0fYdDk=+uOn/2McqM2ll5T*cU6l]Ai$,8
/ntR"TS[7;9R"_62RaaI%FKC'D+e86f6PPh9eSF,OIYcch.V]A5G=-u8M/2\#:PBZ0(;3k<)u
[e=W9$lmV0MY^FgLP+rQ!^XGb=c_Z*]A'8U4%mgrdMlH2ibk(p@`#;g@W]A4Q[%i25[hM#<*9i
[IWr+=.Dd#m%6Ib9p5C5-V=?]As,:>Lp;%&hR,3\BeLAdBhD.3Kp9+M\I.+d*[-\)ts!)]AkKL
/e(Z]A;Fe4kjh)4VmFPJ*I=OJ,ACmi>Ulh2H.Jq?d.aOY7Y5/@qd?lAO3W&8cs_+UWRS:d'!:
_`tO?@8;r,)5,FEKb.9Z3\KUGj2>-%<UWL:G=aRQK)0\cgPqhri?fk%S,3[\m65AnfB*.uO1
1`GL6F!_GQ';g6nTh?SPlS[PETb0*No_D&Ju$$ELV^oFLhlk?/_GQk2/,8?!hdt:aQU%m9$G
;)Pb7BC6beC#o:JF(C(tFLXaN.a[0hEr(T9/#)Mmb5TC9J66RDQR[=LYrGd(P]A/JStUmE=Z@
!A0gDVfELa]A1fh^(m"l<BYLJ8D_Ve0IN\>S[:km_Q5BN`2?>(J=7X&&=;UbR,?g:hmATAm(8
#k%1&b.7Tfa2(0#9+*r#$<kI3Rs+&((VBH"B6FD83c-8V%W#e24X5b(a%@(oG=B+Pu^6Z.JB
SJ@fo`U:8#?_AKS/YrU/-+J?/tiLuELol44RScT]A!p'&"j:6o=)-^\nI\a=LpnlQP+D4Qnf5
[7oTpW0lO_eP87@=<2Y=Arapmj:4-@aCQ4_RX&Nmga?M$t<gJ5B'dA"?i$KHE%8CQdNa4c-0
re5I8Hn2'%U(&"E[Ke.G$,g%gr!&on+.!X')Gk:l,[,0S21&4>6fBI&as!!t^X8RJmf=nYjT
.`c^R"2\VnNocrLouW_QR-]A]A*d1,P.n"G<4-O#1-Ft%-h'K"p0(Jj(/7O2M5+gEO`+@(Ge6E
I>iJ&>T:UA_1BD7W!bkUd=q"PLPL>3q,j]ALE#S4(%p7@Ma!&MHZ@;_FI2\aiSV%kG]A`a]A#Xn
FfteoZg#Q5fA1bt]A,<l9.XG[6;dH>cH-k"7KZpLi:%cL@Hb.D&%iDt=LCQ;85f/8S'OAsi4B
7k!P5$=Ql"D%je.JJ,@q/r>mE1G<tOGSjU61'Z8InLZ<6(\TuBA&A7b^]A`\4ZIZab>Z&E=.O
`"L>$c&48&3-cj(+4c;b7kohds4PgWhoGC-'bnhmpu/c:WE-p?mP`1kmP]A_P<9;9D,gcZ.k;
Ip:EpXtjE-hs\[&/!7B9bJ=mM5+usATb-JQ9!p"Vf:,slT;pI(Pm`(!OT)>(6CeBsSt`rC)=
/P6nCao+<:Xs*YbTLL!HLgQ!HM,.>Sr/?JI%mIQ$8k7@?OKDKXj'TOa,K!:%CB^a*Nf!4oOP
0>.2t/2jhj9!R*krXESn3Q0q]A>@J1%ifb[r0?$t/<*]A:\(3MlX<9Gnjs4>dZeVjRPfbcM&ZB
W6K4FlQEVVJ^J?e#^hA2c?r>0JOG_igk?i\.uPpY3ZtmZcG45=1iCc*95P9f*H<.X&]Ae]AR&_
Sa-t&Cs'tZYShKK&*pd:rBY"DGf9(mfUPUClU!&^]A:,,8`uT_ZnjN%G,4h.?W`ET]A\p;OtRO
:N+^GgZ`(bPi^0Wrh'ID]ABtlG8<SB+Qm?khF%&27=F6'JI.>h7]AD,dp;s^3@B'5MQ,D-k*ho
l:P'O!O5q,DIln0k(a1902FC]A[j>bfpTni^T#]A-\UC$*s]AJG(neFG%5VCRFll3H"YpM10^"2
=hu/V[V#4J[d^796LUmT)B<*-3qFFQZ+i)6MhW)dEeutT$dnOXeJi3Q]AoA,Z1/JO#cjX$I,%
NaGo"*NF,EPeU'ij$0.\_qaIqTkM*aXP?8YRI'I(P26Z6);po7No>7;\.Jc;o[hqdS1/n9jK
,K*`rV44,.mV=i9Au:l\+`m?>dn8R-icIe24`4pre6g7S"T]A1!a.UeHl,"4]A\".qq556i_/`
Jh49/Y[7ao^/\c'7)j^O#+]AMM1IO/Mlk$@_f_)C?'>iPkR\h.Lr-T7hA4Dn>m9d9r3QM'd3(
EG=*&Bl-gDpt^J*h@)i$5Xr&*,4$d@?X0iEF\YP$WCgm/>:25>aOI-L+_#g/pAgL1!%F13i9
L4X(`K["-7B1@##(q&CCLgdbg^Ci)CL8V'kpa\2lE:41UrqP4>^GLh,>=J,a$gNB]AYgogfqi
BAkn.AdB2CClC2?Fj$,AUquP>p1gseK>l?hiV"XjVTUiP*.=u,P6<MSUMC3M#uojG?pj1;2U
3j7!Eu;=EuC[G(";Y@!:6[(u:24lWWl.)\!Xg3a!i!m0>D$q5hP&pb2QC,)O'i&Hra8Gs/l)
dKYE@^ugKjLNaV.7=?3;VlKEN2/lsVYeYeoJHOJ/[.@[u2p/+aX'H;KqXY\ZGCpk!'bG['Fg
+!80#dNoY>%O,0*<@?HMd;"]A)Rba\MsoLpF'3-/aD))2O8m7)2IBl;`04i[%tggq<,X+@c";
<DqF1P"T~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="800" height="311"/>
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
<HR F="0" T="0"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[864000,864000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4381500,3924300,3505200,6019800,4076700,3048000,3009900,2743200,3086100,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[串号1]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[串号2]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[仓库类型]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[商品全称]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[当前仓库]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[最近入库日期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[批次入库日期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[公司]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[原始入库日期]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[自定义库龄]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="串号1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="串号2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="仓库类型"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="商品全称"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="当前仓库"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="最近入库日期"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="批次入库日期"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="公司"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="原始入库日期"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="main" columnName="自定义库龄"/>
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
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="ColorBackground" color="-657929"/>
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
<![CDATA[m<i\O;eOZ>7&*[XktET9<CpD1XWl-/?j;2#elJjXe5A^ILohXrPUHQ!84]As[V%kjV/VlY9V+
MIK<5\bsCog'Y5U%<T$qW\o+bguXq4'B)SaZO6R:c2qTAN=lkRW+jHU%CQf"LKohs4F3?[WV
%\R=8EoA&-V(4<X^rK#diB!o1[5rS[MNq72/NiapRF5&&@nGRPqafCX6=XUrtjLdM']AZ_b7g
KhAhbppY-W^"bB^>d,:]A@HE&ZY(:\PBo?FF4tP@a!F9Cmu8(F0C5f(>ksPcWr)RX<qarqIFg
1$O#hL^X+#N&2PuXaBD]AmXmoQb#2SHP#;[-@/Vfu^-.OuA`508DffPaH.HeIePSa"hNO[D:*
lB5"LN!/p4AF4><)`h=g270&NEtUM>frl`4khN.3`+p*TnR]A0dgC'd!;d#h:giaH&gCGb$q]A
p=(k$h'u;Y#2u)D:h4EPoG4Gr0Ue\\ba3I\tCaD@(SPDn#V4JJo$$"1$g4NN(rf/@rF[@_VH
?[MSeL^$5;B<d)-)Hj(`O&ePgQL(8Z!%Zi77BRgSQ_^(XM^#)pji0$0a7jUMoKat`C@CP$u)
hS7ICA[`DWR^nsU5>0sNfQnd;eBnQr.<^P^q7Sum^3FVpY/r1_;]Alq-sud(&loou1lS#Y>&*
?`FCt$QQ&Rumd&r<\1a-j/986NW.:9GX+kP1(mnUq?W2G_>Hu<p&8j\EWhj4"*VlFGV"3p,T
<a;C8m9h1jGJ<?adRe%SV^+8SR((u9`q\W;]A?1r7X6-QfldK%:Rq%=hojPO]A,G<:7jsU[r_T
SZ,@LRoMf-jugH$i.g&OH#&XO+'mPnFe1CGakDUC@12H8hXdnaGp;S<,At(EQADkMJ0Hiep2
7\F-_G30iT$@F]A5>UA=sZRWIpOG#8(QU(EIK-g\ZNc;m=(4rUD)1,tOS'dTh@kWHUBIAaW4N
sVgq9T,%tnpTC(VfU3Wh3H!e^II<CMC*VHGc^<ib#"2njXKrA4Q:Z3j`E@m#Pr4U9gru"20=
q!S&V0b?5GW&0t1k\U2^6=+m9EtSe>A'Ri9=%JW8dU2s)Kuqu59YWb>+g:M]A]AWTe6l+0on^%
B@g_'nEpM`X*4!XMH?Y;Q;4@NAGfr\e^.pP?mE;>'%uk).?49Dcj-g2[0YV'Z5>XD(Tf_]A1&
QT.H>IBNmJ:[*ptOAMi$C;'fa('XEZ+=]AhNm4`_?k*oFmZaIc_XD7ebQ]A)O_N2#cRKem)rfD
GKpBi[97/Wo5MbE&Kq0N^CA5-G7b\Gk'p!YgR(M0m\5cYOL9CfjSt\tU/hu0ZKo<W7aH_:0!
<h<ZoBtZ-3.Dq08Sd85)RS4,26;%cEDmfE/s%Zt,P^AsC)5k/GpTY"E=o=<f^*25e"m$#(sI
cpgs5"PB<Gj,+8Da5r?SU!`,Sj)P$IPEUH6mc.@PK0J$&+3+kC'Q42Nf$J/7b3El00I+Ys0s
g"W=fi8"3g$D_0`9!OlU0`]A$p6+USmgLo`#Pp/TKoJ/MQ'F9fEF]A8bl5A4ciMe*=t(#_CkFo
;gI,:_)IBh!ulEP/a_X30)f6q,"Hm';'r/)/H1PCTY`nL7;=,rTNEc4XU;O96AGVTOd['XYo
cFQomNh.b;-'2$bW$#hE**cIdk!''SPkY_Gr6U6[M=DuTu89tT%a$G`"BK@(D@B`PaGh=LFY
pS3W5bc.>k9\h"pP7^O.YX!i(f=q3Lb(=d+L^*&_uaCn[%>IZJ?T81e<t\M%Y;,!JauU/<a0
SL,Y3^:.e^;9OtBSjnVMa"#Y3Pu3GC^hZmrBROq@T>>\#rD4mU+J$QS`eFRJ?Qq*HVcZX0%O
QWPUiq_F3o-=m'GFpb3mPd<WLUtSfs'NuF]AbV38\;VW).p/Gbbf_Zrk`?ms5ai"tqb8c20;<
-daibjoBj9E/&]A';V-R^NAQ+!GaIe[bNp!@lJhZ2pO"Ro4%V6@Ymf]A;`SqROSlqWqjdCJHW3
b%O6eb0c3XT2q3'liV_o`Osh#&&=Z3X?mTU.iW3:MRqC*>q_=5G\uj&[;AAE,UXAWq/tusU]A
o4QeMrIeQ*7,TG$jVn=+tkA=dRYQ"`m?Ys2COVk+gUi^\*KtNPP`%'`?3RJN^-p;9PMlK=A=
04_5fAQpm628"d0QHjD%nj%VdPOr$VP!As?U_(REt"m7tfh:Hsg&QiaM7bY23lP))heXPF`<
`j&hi\n.bdbtu\H8S32'=PZHeQ=_U*bACj[poGk?E9olhC0B7f$p=o3^LX=5H\qO]AiQ/$U>C
_.)n94Q>JS"A*J4%ENYs,7c'p3HgGFL2?'h=V+>##k^=2i;]A6oUXN,G#BY':;*,6s;"(,ZcX
!pDpdDBW,<d8WnJR@ME#>,&K[DgDia.1KIdY$O@*R<l1!u/=K\8W%-NDMsp1E,]A30!g!e^Y$
9W;FYr0"SAMa]AEMt&kWqU.ZW4=SE?.ITe`*jn]AgMTQP,kP1dEXZ<etM;'@E]Ac6@qO?=#V+B5
75:[WL@#_1YAU(L1Vk;?'n*#cM1E1"_;JbN#u8.UtS.o^(=78b94"`n`)#.Af?TY^e!)^$mf
XV+-Ihnd6pI#5epp(:"AUEsV0?[2IXi_bP>)qdhrY_9NoBi-8VZ.I@Z<ET/]A/^GS13?G0WrB
a1Cje93YBLK1,X?bJ:&V$[ZAmg2Rjt\!5g1\7>mS@pp1cl3,g'p0Uk7-ap1=(cc(lq@W6[+^
rg8[#4j8<hRrClu,+pPusf6[WR*^:9a8cA4EDCrcO6LYeN4Q<hS.l@u1('^YB??bl`ja([IB
p,OX`f2=V'<*S-AaG6Tg]An2Zh@0^;OOQpdg7<86H6@AQ/K(+S._N[`T9,E^=>rkeC?Z<eV9>
SS,NZBSBP'.0A8BUki]ASM=b_/'R5e'MpVp4ua7u0hS'Om.i>%*t),1bfp<E`_#)@ILMp_ECN
%[h^6/bjEaMP10L/45E9#K#a3&*+WMYK76>P?kC0CU[g]AXk+6J9ZbP9d%5kbC_,+8*mV]AH%S
V\`b2pV4]APiQbf5f["Q2<^DR:#XX?`g=U/auTu=&hg=DPqq&QG@5EmE/9ICS*T61D.*-+mLA
:p<NF9^Unp1N*P%F=E#4bAD4>:9IpZ\Y+m>M3unES!QdhM0h%l"]AjK4I#j\HI@5W,Rhe1gkh
(H/GbPg2B]AV"PP`3lq9LDC+b`RD)-1IOoN&ARXX*KW`IfiC:G"T%Mr1D<%^$Lr%%3m8c2c^T
Uc<dPK2s43J0ST)<`Y1N@=&K1nLIrP#Qh99Vf&1m.YAf3_j&ZCf`l%jXE1$'@J=>IEs%[K!`
Pp2csqXgjt;I,t<,9q@InfLRjb%Ws)%lh&<`3^F8Id1c"Kp@<M=,V#.bQ9CTH09=pd;[`s/k
!_ZOeFE^rFHsk`j^hj>Y+$&K^=Cbo8/_=?6erK/WJsjRs6cg[:6dNFglO"4>Lh/(YYBB#Oub
-g*cEV:qO.(`0%UNP*LM.0mfZBn9tM'<sNqbao*TlN/UklRUp>GX:qpQ[Rq';^G;TH>:,FGV
l*<<%92?Bg#i4Ubn-p9;\'FCY55Ce=i#@beRWm4eWL>79C;\@5b;Z=EdBchYIb)9C1M/0YQ]A
'_</Y#;-Hj[lD%p<5]At3802\^!r5jAq]A/Ckkn:6j<1dtf'6B(8F$\Ofe.J3lNG%sq<>9GHio
9N3/DkASuHR*'+'bp[?/TDX3JQjl-%69ND]Aa:k*"dCQb$@YHVt9/Emu&gh\!EigC&>?#aGF@
h3BV+`T_'nII1&jsoag"ukEl6Z=!QAVrX$W!T:[V."Oc3LZJ"u3@Z4uCUUj2R[JMoic&h%HU
?(AqSqKm#*DIMUG3=#L(_n+niEb*JLH0V\:UhErS:V`TnSjK2A!#edu#c.QmmSlC)-Afhmu<
4(4.JC@8\[^J!/@-kf"[`9EY[5Q!JiO-n*68?G6"gJQ+bdFiLB)#boD>msm(_af58X1?Oc(V
ZQ0ONI5.l^arZkNg(S!8(k?/8lO/JJF]AH;dd5Nji3+o++9#I3Y:Z)RF01l:44@ATA:rN+f2`
M??@Tn'EHlPK3I0cS9U>3&uam+cPcRfk<84+K!uI9lh[cf\TAl@3^^H[5bDk9u'[TEo"9edr
7AR@TBaAoh9NF=iq@FKHt+Yc>l[uZh%L?8rR*4djn!<j@d*.KM'p`9EXBemMV_2k0cM249fQ
-=V/gh_ECgC0ZU-SNJFmcii^lV\)oTY.DpLs]Ahi3,k3`]A2Xd1dX_m=2!dlOJ+QK2g<E*@NVk
=dc25mqb9dH[B^=&55BOntXD@Z?feh`/K6<`h'_o_:)BV&TCNLS^Y@p"@Q9pAuOHL*dmAD-i
7"nQms(GTI30q-&P@;Du@5EYB)#:T)m'\a@So32<oFoVS<#%GW$oSCd)M7eoSBEbTAb*BPP?
MgA=`JFY9[IRh-2;WUR<[-O]A@(L1uq6o/G/nPKVQa08LVc7k(48,Hio]AAO-IP7^re*(r7qm:
"/LM&9p4<(pg=1h9.U;-i.?<(;jS>F?_@8#C/MmBf",$+Wc*DCkJhiPcH=NX.FH9]A'L_k&UR
GdH`?I?!<`%$qm#4.p-5A0,:do!Fe!UrhN+%Ho'7GNM.,q:+]Amk59$+&hoB#+M:/HG(H/&!q
FGV*2\fe#Isd8PMDGKs8`3gj**%=B4T>]ANgAfGfL8\LLA3uT[A0%lQ3`QD&?5m/=g:9MI;sZ
Z`FC>kf9Ba.W'-lIN(H1fmB^*kFP?BMD-<YBSSY*lHE.2Ss]A:J:B;T09U6]AX^iJK<t3pf?W:
2e3N?!i0-#AXtHTGG?4q;0kf\qq$A_ob^l0h%gCVc(iusrCX]AQOlH_R9<lS-WYg8"*Wu0qOV
m=2&kCTM,8u>s%+qD(]AT$?jl/4WC:@%3`MtF;RfO!B@3mY8435&65IjhE6o[L6)08OSS&?SC
1:`52t^lH^,n3\&3iEVNH7PmZs@hRo"0.I&\jr&1LM+d9Zr5mlY)i!$<ZpZ>r.'uOp\/UGcA
,Jn9^V@p%\l-K\C4$:M1V?i*;Q\kWN#p"kpj;p@X^;P;o`2WG%JV1\\VA'Z<FN383R]A>CO#K
;3FMKZamZ`$lNO.DnF!o\jbdWi1;/%T4CP9nHSE9\HeRJ/[&'n7tLbF`g0d?)e]A(F4-[!k64
IOLr,9cUB(T\SfL;+@G"+'KX2M`K=GN[.@=JE0%mHG>Ije%;6hU[$"M<DuY*\i\#\`$qLs\^
Iqq7h5!6JD#Ide;.U>OsrS'*k'fjiUFZKp`=ADbB,s0)Eh1u)nD"leRB*=.#'IMf$Tqi\=m2
9Yk,>m@Rg%R2juE7hP<V=jf!F^kKg0qBTWl3*_p<LoNXi(`%FUc6SGdNW#l/Mf&cGC_DdV>!
_&E^)-]AM=@.inaQu<J.O>b'1B50EKMFI@I1fD4(>TUJB@CH?-6A&t;aLSh]AaZ=$hKTBC\f+D
Cbg"TuQW.71R+/X!M5E/;,)MoV]A%pL)1M:\$4`U1>t$*8Q58DigL5Dsie;7?64Vfq]A%cC3=A
F43b]A7J,RLbQb^I-orM.5kSY/B/Au)bNoAK"6JrB-;7:k_&jfQDtQYSj^mYJ%.*hSA`\0n.s
\R)8@FT[C*jsZ&8Upi;q"Qs46tFRM"<[)S$J[eAOF86mYC8!&b01G_>:%6:[DL['34X'3bA,
)pIq`!Eh8.u."g?K'a]AJ/q3KfPWm[h9?^uQu>s=F`#Q7E2"k*pjd3j"(SCCfF0ZfP-7u(L?%
p\sK3f8L_gmA__Hb`"6]A%tDBAFfXLkC.jJEF?SBMlU6b"ftoaZ<A*%RFL=+bhI;Y/#/9Y=<Y
,O([g"JDJ7"Wd^"=H<J3oadhtjX]A%9[A^YF@g3_WGc<G89NdU`\YBfQr]ALnS^>QVk#t=ipG-
9(h/3Z7oYuTY-6S:kn\pREO#+VDdg`etP6cF6[H]A#m8P%m#*(2j.ekIY=_8+n_X\/.SJo1'a
=La7l"82?8?=OD5MM`TUi$d3d;-dc/K1#.]Ab]AiRBE+n%ZmpKQ`#9h<7UgCj:)qoESJUeG5BZ
i*c(!W9>m4_gNH?,60:<cT[(#NpeK]A4IV9$FNuC7Gp"I,%i!nZuH]A8:`(eU+W9qhm71#jSAG
k'PG`YVNE@[9F*+0MK+04Ind)Ts,sXEQIuXsiGb*mRVW<[`&;\?R:kbgT2mLW@bmgY??BFRj
mF;"]AfmpgJ4U*T1omncG(p:M[9DdM4f1\96*)rq9hMNuF\jZLWF>p'aG,*2g>fR%LCfdgVF4
eOb(hJ$?"#,Ku@q3Y^CGQ-H%POJN@]A@7Cnfk<sR]Ag-FQ-c%]A:Wb=l!`$7DSG:Jr;n]Ae!/]A^3
`^>_GGD:8);;p`+Oi^CL7qnm"_8Aq40:KP,+VGU/Dtf@GVB5d7@'9i)0>m36/eY&(,MRN6J@
705G+.`EUMAC7CrtKUn:JIIB\&&!6P\1-%-7pfZ:'B'QhS^?B[`ia0pimqMjI('PcYJ-Y[5X
^'$ZAj+3`N461&Z9I#W.JuHFT/Xe=XBLWsBQ1PLA]A90g8[L8bW$InqPri)[`.@LXna-\K9Ek
H3hs_HTIJe8PFCt3F5&o6-!HlB:2b8uV45_MDht';&5tsn1.AP^7,j-)@+EpHhA"Ac_XNt`]A
n?KdVKf#t4.DG^RI;To]ADSLP(+0A:@)_#q5PkHWHMsDg+N^;ERq<?A'HoL+D.rcECjOVP!&s
Q+,mr6n`qiBotr\,N4S5Z/*A<[TkXu*Go$`Rp#]A@)tS,=L=@l"HkW4D$3K,RT&j`YXL=EFFN
e.Z]A[=X7MuRHaig9&KSKt*Z.L=iUD$gE;6;^rcWW.o46Nc4LR#5FHnIBMtL]A\?i(Qt'dd6D"
!J(If_N(D`f9l*lYd0NKmmmq`=M$XHM';;O)\q<4EJBd+tA8"\UP67g=.bn`pHrLXg7g<?f:
"D\/>CXV^NOR?c!M2%pEb2!7B7b&Q3?:%uT[(bn<2TH'#V;hZpp:SX=9"h=YP6%duHW?!n<D
W4=-$61X@R/!79h"6Fu]ABOF'(K,+0S,7Mn*XKC[r&;N1"3$JXo_NXb:G`3sB:i!dJ3j>]AuN4
)0Zf!;mmpk!D9@kds%cQ[J)2Yh>:b6jCBLd0n<miknIj>H\M8GsA79>-]A[On`M8j#:n6=%%>
4DTnu>!"II$Tp_i)\K%gf_6GpW!"8h\^\%gm5Vg$"/!B%l'HU!0ikp\hbOuAX]AnoF$ER`kM_
Q8u66dFTjGKLj5(=\.1+G[(=+%kIlb\3dg'gb_<B&1]A=qCn<A9F@#TGSJ'R\8]AkPTl@skR9>
[]AHR#_ja4>1O4f%0!nYet"qJu#^HM$C3.<Sb,4(WNW;&f?tM"hVn'lY]APR.P/uMoW3JVP40"
=o78J!0/GTrrmF\"89SQjY;mf;(AHaqVY)<0LiZ]A/ln2gaf/l.:FC-R:!gP:[(>6X*8K#$`?
\'jV3OB:NETLSYb?30D:9d-Ikhi;QOVU^q;jnHYT;[jP@_cRGS1RE?FGh*bpG8pB#r=^bgi0
XRJ=3>+kJi'LdePk)=(,X;u/&'cF-[cQjF#9(Zc7`0a-.pf./ePMO.M#,"KB@`Z#Tha`\pe8
!d4ZB3F9^4eHCp/$]AOtaqbcJKnR41-J=m'5S`@RRS=:'7p&R:T"NaGEI&dC(:+N\I:4^[s'\
lQnEQ7p+i\l^kirrC;U3O`p\Nmp(M!3'Om,B(HtQn9(E+.2rS-OUXWOT*?p%>dXYpp0*IBcM
e2H(W@S*ue3;p*0Qqt6D\8d_ne"_LJVp6PhZqT[?)22bm;5Ido4aWI`@nO;#dB14CnEfA(/>
#?+X9i3Z=B$n9?(O,-`#msuH-LSmSnQ`pGLrGF:B\]Ac_jUr_"=Co0Ag?'5)+IHOo2P<8ptM.
K7g(n;F/Ot83@af]A=oGT^k,0_%aOS9;V!R6ahRM:57HibZZ[>IJ%)3,""9)?!'-En;2'HgX`
T*Q>/T8rhecfN2=4Q1u-%GGcOup;A]AR&[F3`W7fIHh;P*A+3:o5sJ39r^bjTl.]ACG,^'3Mo;
qX[#7Bh?.=<V`OIjHmYRtCp4-Mq2TQ)SYV#\8jc&atj%43s\8?V(PDpNi#al3?-<@TZko\=n
S'-<k4oK(p%)(dJSS<!.@A7"q[9!d,1]AEO2qP@$73c%@dpkgb(GF21QFZ7b)mXr\=PfF92>f
4!\V%5<'%u_kZK*b,N%]A2P+Q]ApuA/9N.!ASU,tS_.1i3Ar9sca+>T5<$K4naIapqj88_X!53
l<h?1$7WTZP8&Ot1>u&/e_<:u]AYVl)?]AX#do2:7["$S8RU93?t)moWN:&OBB&*ZLe:hIMU-@
^p$Xb7r1k;(79]ANeN0Z^-;P&2)s?KaZ&[/=EtBl0*&,Cb"?Q:7Z!.d$t!9^s,K-M"XD+\;sK
pcONeq?gaID5B>ks`RXT#%#,44+r_7/!I%Q)/9,BTJl,>nmnE1Yb_PHle[&WAnnX%C)>OV+U
5^$h6:qI^\iLo1ZFkrZa9rF2t#nJ,Mf#;\2Op`#knX_s)I8KX3AO,Z@^XKHE8*BcYIF:?rbj
I,oqV5o?=]AGFS3'S`K<W*ZqlVDX7Jk<L-iq;s`pUb\=p8/m.!/nMdVU'U]Aebnu>h7?_#DJ(,
5Ko>=@Y.NZUBdKpj'`U#%SVh=[hUPPbq1!GXfUu/?7Ag"AWtW8DUoL,$pU+%fAXZE2QT645G
O'87K?j><LdR6.*>`"Yl&/$1dq26.QaRqc6%obre%$Z1rR'=a'G++q?F`8`+'1KBaF;H[%Bj
'(V9]A]A^[u.ggqP?D9hJ`o1j4uTfA>4Pm[Ho=B\&Q9A-57X+?$t;5"-$kh1oO:#k8LU69gO:+
BnM?(&4+XQ3lM!m0<L6>_'oD"gu976cT:fLM)`N;4khic252#_\Ke+`ckj/3rHcfoY;PCQB7
BI+)f'p"ZI-r)nik-QV=PW#DPS,9_9HeL)DNjP;saekaZ!cSD6=Y^afG>;T+_DW@<ad=6X/J
Qi]A?@+6tq5/ilKQ1q60bDlQQ`>Dd'$HMPEGZ9Tdr0fYdDk=+uOn/2McqM2ll5T*cU6l]Ai$,8
/ntR"TS[7;9R"_62RaaI%FKC'D+e86f6PPh9eSF,OIYcch.V]A5G=-u8M/2\#:PBZ0(;3k<)u
[e=W9$lmV0MY^FgLP+rQ!^XGb=c_Z*]A'8U4%mgrdMlH2ibk(p@`#;g@W]A4Q[%i25[hM#<*9i
[IWr+=.Dd#m%6Ib9p5C5-V=?]As,:>Lp;%&hR,3\BeLAdBhD.3Kp9+M\I.+d*[-\)ts!)]AkKL
/e(Z]A;Fe4kjh)4VmFPJ*I=OJ,ACmi>Ulh2H.Jq?d.aOY7Y5/@qd?lAO3W&8cs_+UWRS:d'!:
_`tO?@8;r,)5,FEKb.9Z3\KUGj2>-%<UWL:G=aRQK)0\cgPqhri?fk%S,3[\m65AnfB*.uO1
1`GL6F!_GQ';g6nTh?SPlS[PETb0*No_D&Ju$$ELV^oFLhlk?/_GQk2/,8?!hdt:aQU%m9$G
;)Pb7BC6beC#o:JF(C(tFLXaN.a[0hEr(T9/#)Mmb5TC9J66RDQR[=LYrGd(P]A/JStUmE=Z@
!A0gDVfELa]A1fh^(m"l<BYLJ8D_Ve0IN\>S[:km_Q5BN`2?>(J=7X&&=;UbR,?g:hmATAm(8
#k%1&b.7Tfa2(0#9+*r#$<kI3Rs+&((VBH"B6FD83c-8V%W#e24X5b(a%@(oG=B+Pu^6Z.JB
SJ@fo`U:8#?_AKS/YrU/-+J?/tiLuELol44RScT]A!p'&"j:6o=)-^\nI\a=LpnlQP+D4Qnf5
[7oTpW0lO_eP87@=<2Y=Arapmj:4-@aCQ4_RX&Nmga?M$t<gJ5B'dA"?i$KHE%8CQdNa4c-0
re5I8Hn2'%U(&"E[Ke.G$,g%gr!&on+.!X')Gk:l,[,0S21&4>6fBI&as!!t^X8RJmf=nYjT
.`c^R"2\VnNocrLouW_QR-]A]A*d1,P.n"G<4-O#1-Ft%-h'K"p0(Jj(/7O2M5+gEO`+@(Ge6E
I>iJ&>T:UA_1BD7W!bkUd=q"PLPL>3q,j]ALE#S4(%p7@Ma!&MHZ@;_FI2\aiSV%kG]A`a]A#Xn
FfteoZg#Q5fA1bt]A,<l9.XG[6;dH>cH-k"7KZpLi:%cL@Hb.D&%iDt=LCQ;85f/8S'OAsi4B
7k!P5$=Ql"D%je.JJ,@q/r>mE1G<tOGSjU61'Z8InLZ<6(\TuBA&A7b^]A`\4ZIZab>Z&E=.O
`"L>$c&48&3-cj(+4c;b7kohds4PgWhoGC-'bnhmpu/c:WE-p?mP`1kmP]A_P<9;9D,gcZ.k;
Ip:EpXtjE-hs\[&/!7B9bJ=mM5+usATb-JQ9!p"Vf:,slT;pI(Pm`(!OT)>(6CeBsSt`rC)=
/P6nCao+<:Xs*YbTLL!HLgQ!HM,.>Sr/?JI%mIQ$8k7@?OKDKXj'TOa,K!:%CB^a*Nf!4oOP
0>.2t/2jhj9!R*krXESn3Q0q]A>@J1%ifb[r0?$t/<*]A:\(3MlX<9Gnjs4>dZeVjRPfbcM&ZB
W6K4FlQEVVJ^J?e#^hA2c?r>0JOG_igk?i\.uPpY3ZtmZcG45=1iCc*95P9f*H<.X&]Ae]AR&_
Sa-t&Cs'tZYShKK&*pd:rBY"DGf9(mfUPUClU!&^]A:,,8`uT_ZnjN%G,4h.?W`ET]A\p;OtRO
:N+^GgZ`(bPi^0Wrh'ID]ABtlG8<SB+Qm?khF%&27=F6'JI.>h7]AD,dp;s^3@B'5MQ,D-k*ho
l:P'O!O5q,DIln0k(a1902FC]A[j>bfpTni^T#]A-\UC$*s]AJG(neFG%5VCRFll3H"YpM10^"2
=hu/V[V#4J[d^796LUmT)B<*-3qFFQZ+i)6MhW)dEeutT$dnOXeJi3Q]AoA,Z1/JO#cjX$I,%
NaGo"*NF,EPeU'ij$0.\_qaIqTkM*aXP?8YRI'I(P26Z6);po7No>7;\.Jc;o[hqdS1/n9jK
,K*`rV44,.mV=i9Au:l\+`m?>dn8R-icIe24`4pre6g7S"T]A1!a.UeHl,"4]A\".qq556i_/`
Jh49/Y[7ao^/\c'7)j^O#+]AMM1IO/Mlk$@_f_)C?'>iPkR\h.Lr-T7hA4Dn>m9d9r3QM'd3(
EG=*&Bl-gDpt^J*h@)i$5Xr&*,4$d@?X0iEF\YP$WCgm/>:25>aOI-L+_#g/pAgL1!%F13i9
L4X(`K["-7B1@##(q&CCLgdbg^Ci)CL8V'kpa\2lE:41UrqP4>^GLh,>=J,a$gNB]AYgogfqi
BAkn.AdB2CClC2?Fj$,AUquP>p1gseK>l?hiV"XjVTUiP*.=u,P6<MSUMC3M#uojG?pj1;2U
3j7!Eu;=EuC[G(";Y@!:6[(u:24lWWl.)\!Xg3a!i!m0>D$q5hP&pb2QC,)O'i&Hra8Gs/l)
dKYE@^ugKjLNaV.7=?3;VlKEN2/lsVYeYeoJHOJ/[.@[u2p/+aX'H;KqXY\ZGCpk!'bG['Fg
+!80#dNoY>%O,0*<@?HMd;"]A)Rba\MsoLpF'3-/aD))2O8m7)2IBl;`04i[%tggq<,X+@c";
<DqF1P"T~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="139" width="800" height="311"/>
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
<HR F="0" T="0"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[792000,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4229100,3352800,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[公司]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[库存]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="sum" columnName="公司"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="sum" columnName="库存数量"/>
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
<WorkSheetAttr direction="0" indexsToCopy="1" start="1" oppoStart="0" end="1" oppoEnd="1" maxRowOrColumn="12"/>
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
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m9=j@;eN[*+h"@rRp>XCC24s*[?Rpr1[S9jP!rTAg/Kl1'rr`KWM2fs`F7#gNhod-;(HWS#p
"q/9+`XElEDP"l4FV[UaUmB_'fjtP*go=-TUohgH.!WO5HdDBBJs#pnrmcH^EoDT(i,&nFrt
b4?_r>8Iu"f^%/;%mm.L^#sj#Y5P6;q5Pe1=*.adEM(=oFGsD,S5f_K]A+-I9.\l*1'U)0<IK
%gd\=#0M=7[>$aRN=.--fk'0OMpSUorW_6E$G-9@Rt%VjS6,)ID'gQ-@8STVOh!lGO5N2kcp
MQHT:I?XQEl/`@%@V?l&$mTrS+ebR/Pq3p5SeN1mA'B!7Agjf&UrC?lA]AI,RZj^iMgtXJhDX
Lc/-AFW,lYr^uu&5Q(uIJ-9O4acm+\j+iV#-0p:$OELP*I,2p'1Y3:`;O&C+$K^TjiSTGC_3
-(@BQ*PC0(@m[;TUQ4R#LgrrlO/\^."2Y*2J=Abbog3BhSgZ]Ar%Cm,frFfCMF:F/q'dl+R"c
6V7\O_0IF-=-&S1#h%A4R=XpIfaOtk,B"#n1'@e!^1ZiaYatt:=i^NCGeI:fC7P?#j[#aX[h
26MITkr#3gG)iufmo636[KpB<>4Yl`gj(k2V5sqCcG@(2&k/T]Am"9eo`WlHOsu?r&"CEAFWR
)hANZ?)iO!gURGFp`2A*W;27D!H^,T2c5EAnFIF%WNN:J=*=;;L_.6#pU:ntL(dH]Ajp25-Y3
V_Ci3A9dPgQ5sA:n<15hh3Y9$r,%UdcR8q)mB6dObJ1enRuQg4k[pc/kCBup.-uEI13*MsK]A
jQK,`;JKRtRm/:28!]Af?Ftdqa)*M2r^4Y4#9-)OO0<t'D`m@*BpjGFf=]Ai1G5\kQ5@GE[G&)
!3;VO#Wa_!gm6)o,@RAbej^AA,[^\I"V#i!;\r.[b'PfSB'!7HrREt=TDsY"MFR:X*B;Dd2d
elpC=cnuC))eo@c00k]ADjo-COJ7#$1507ZWZ>MWAm1!9X*c<[S`fU><h*-4KcTkafgU'dklE
]AG]AOgtN@7/#ZF6[Sn::%ACZh_T<"Y7H9'>1@AD""^!%C.0R82iK2^4IT71W(2.`7Fl4N8!-M
'sTifRQ"bueHH@Q"u."H:]AKQ)@B"MV1[DT3F*"IcYPkaD>o+[kl4G8[kkl![!d-"/^1f#c?,
]AlX6lpgMlA=QW^\.M[q%fL\F?)?j_0f\n;mJS!H/d;T_kt!#>H/hPqBB]A)A#W(Y*f=MB7df5
</0g9b8Ic7LR<M`9&ssXi#c90pQH*DlM!\biiBKjM&hWbbY"OOcMS36=0^Pl<GWPKp;b0N&S
Rl)mfFfQ%NRjl,/cqbFGRA"0]AiX3P19G_F70q2%0c,\,5hO_bl?G#%erFk"`"l"4.gOXO9_p
<F6OG?Vc4cd50lhAc9MTn,IVTSt8Z*$Gcu(oE_9@Dh1goN77k_^(3^jt86]A8?clNlkZ^[8q`
bEDL'@gTR.Y2=:gP=[)^4IE:<GC$l58(,s=&g6_0Gp9[b/:-53_^]AD@R)kO^-,j(8k5EL.l@
M_4&=^!pQKAN!)4bX+]A9cP-lM`7u6in("Vc4mIY(!,0G/)l6H0aE3'A$^ld&YK/W88r`iq]A<
bD(_W7M2n$72>k\,K#mi?\m-!3X"+?GN^?B(mNo@i3:q3kR0bJ3!W=sRWGeFJqGp$DT'HU+P
"^U&ba<Uu[N"p-U;Zj_s,Y74=8I&Y2NKKe"*:6=HA*=67-J)N47.1W35oF@o;24^IOeft'rA
J]A?-.T(?EYO</hpg=[;heaNCK%)O*V#ukoBhs*7m4[8HG[?Z>M>MWR&ctq221Wf3Y5@WtO_W
)^_#*N:,i<3tXh52hm<NY):rM`LJ2En`P%A]Aug5Ie?X@"*Hjtb]A[IcZF>n-eU.c>rP9PX6<<
GrOrs;aLDm-U0[boe7MqN_WY4<)4>>uL>>1b#*#O/tX1D"GpcpFZ>)eo4:2F/%(J)W*,W?UW
>doNjHOWf/Rb/iuC5(I8R:N3]AbQ-I$^;r::9=tAX26K/5gCn'ZMF+gQp&!@>OB'&an8:Kgn=
k>06bP,DcZjU%s@_3I2*6,3MKJsr&L3f#[M"@mAM3iVs:sKZ-ckS--^l>*UW\V[kaZ>_q3:U
2,C&P[*f#.\%_opkmJHpoPl_DN@`!!ucQY]A<h_ABA:G'`7Z\")odQn,[19ns6)H>%lrL9J*/
,+6ZlmSqtq2c5hoH3E'A4H8o)ld$/I#1"s@gOEEj!SJ.1W\:)C/.[R0KA5/tD?+Jaf%+8/\@
^"_qP5YGWYXJj\^a/#\[tRaYYj<<05cke4^DZkfN"\BdL$t\?j/%3U:9g$C=K-LC(mM2e*BI
I5fFq(N-m7:[TIuV^&L8S\c@bc;qKDX7EJ58M"&?[kjiXA..B.*_f3l\F<KEuWKi<B/USfeb
@6n!l-ak:+gG>!(L-N)&F6Ar8lq&]Ak7C`<#[A@Q_?u,H>;X:t*LUlQHIj2?>jPLb-CHYsS0`
$^Q"]AVi3/&oYAog(I0@rtbOGOljZ-s3E^d\pY%iQ!>c+EZF\>;mK,19R'kT+M03jS\KJV")2
D"aQ#.R.?.gqY9VglU8%"4P_%ijJpm8pZAedop@d3HeKh^PBQP9[f\q@l!H?gKI;%*b5d,7Q
8B8Kn&W9eO^K!mYoA:1=VM`n=!p8H*U!]AO0)"@/Z>7nQg.04P%OB2giRTX4-NJ>;CX(Q8/o'
qG/Kb<)9#KgP^/?O"c)b/8#5EOEN6/0]A:7gBClGdgkYh^8HR_o%>5^27C#mBOFS$TLneb)Ze
gI.l7u&)@n+bnb\*sB(]A]ABDIVH_Ra;X6k*C:j/)FLFm5)g.@ORI,Jqk-(RB^,\j;j\Pn5[2P
n5\=>slb:'jRRI9p""U/L@^ZWl\)oWiaak15T(m:SY1=Og*.$R(d4)%7s0Ph[`bVg2W]AKPij
[!5$8OJXR@M$bZB,$IBqp.U0_^;HE50tf'IW;pgO,uFDA6:?o;E:Z1&%B8VupcR<AC>V/mh1
f)X57hO6HbL>[8nHk[[HTNQgcBLKPZD'urQ_Ymb4^66mW+2_DFJ2Pc,=-*WQ"\D]ADYQ>Po%S
cZZX^460\"hh9LYd92U9;SlQIDB<+I$#?\k$Cc_F_\+s#CR9stOLZo/dEM?t/aJfue"*?t2A
JdqZG,>DY]A7_/FTjiU(RjSdm7VbMYQK%lbQ%g(D6]AmR=.E[ZK[$oUAV2F#1oa:6INklh]A+$6
GpeQ`[&6Jj,Q9RY1mNPd_M-qg:l_Fj2I8dUPf<FpTXT"b0H2[d=X>lKGWWs#4k;:Dl2Y4KET
HF^oi([MQ"Zqd^aU$J,F5!RXVQaNmH8.]A4>;>YWBPKnL9_E=Ns"TL;-;na`u$H*$5q4>p$C$
.&G2\f]A'gY8]A9Z?Dmae4lDb<d3daq8j3E5]As\/Z/47^N'[]Ah*[KMQGoU6@Mt$d+0"sV;E?I<
.pkAC[;j"Y8LXLJ34.<*eM.&d9m>fZGs4rhIj8"\9b@oOYH*$KU*d,(Wed;,PLu4'[3a@fhF
e^0B6??Hr;3uf(>96\Y)5ReloC8Fekf$?.5>3Q7`XM$tA^T(7;!GC(D2,J2,a04Q]AX;700P@
3<]A()8ISG]Am*2Xk;RZWlr8R8<\HRJtk*l4KK1LOR'=G!km,G=8r6q=l#Z/$,AKo:R%HlEVDg
`%n&S=AlE\[:$NBe(c=9d.`Fm\8-:a"Dk(Wg@eZ>I?T'2i=,"oVk*pJaBGkQIn8p&?t8_=^t
sWS!UbK<4F@2(TPMZ\$?nO9b7OX:OTq0bH(tY:(@_g9<A>pt<R/FOkp5f;]A86p+g9W#Xq<tI
NSg`j5$aH\iG'",5V9K^FhV8?m3+F`SL*/6,T4Dt\`h/Nt;kLTp5X[36J_!M:#f<c@[Fa@Y1
Alumph$L=4VX%<LTkbG*I*DgiR`YCHu/'?PO*c_j4,5.?s$G@^r;bo?,;]As+9&h`$&g)Nq4N
m^p"]A55PfGler!3e4IVp4A#%["QBn$"p&hODDFD[Vad^UCnHqXSig4U!7V#>o$r',>:a6.\B
4W*K>a'295@6Kpn\(N[j<\SJ\nGPK"TEK1q/llok=Y*hu!fE$Q5Ccsq]AIu3EP8qHCnS=2QCm
(*3kP:BOG2QqpWP_Z0^J!\$oa(='^Y4*/5Ol4<E;c2l_'T8a_W*04UHp^_]AdChk?M6=*J0Up
[?jIg)?g=W5@YQ:Hc7['Q=63!JBh6%,0kJSl:+YKhBm>'Mq\sT+<EpmWHu4'39PO?sg)n%>9
D6!f!q&',S]AN(I=S=7HFWa/UV<D[*9Y8/mE*2>-lrdbUcA^\ie&USU^0a#G1IVl4e^jmiRX4
5XYo_X01/q\4P(.m"l%f"^WFT0C0GDSd"G+Wth>L=K=Q-NZQ@NZ4qa'7!X"ZXo'S@F30^V*6
KCMAid0csM"5C'.nf/LUYhJYfi1T`4=:gjclPL8p+>"_7a0F^9+44C9^]AXB.T.KCaPR81Nf4
;mtSHPg!$j'Gt\]A_GI'7cs^I97+?s3pc.g,urrQ$:4aEYUb<0F?SFTZo\bI,/lTWicm\T/re
rmJ+Nf=5-Y.H?o_gSEFh-"@+tlI,u=r7kmce(%3]A@;rp"Cb)*0da?,PsB\\j;%Koq\1>u:NU
HlV3%Y)?L[#DH*Y^7$X[kE[R]AUr%Q#"J)]Aip5_DSqRNOk8?+Q1pakc,\R1pFGaEi8H1''deA
W6h75eD5"dYN1UXPSX*7[4Q%4R;N[$do#-3[Jp9Ii#4RLKmcD4VdT,@k:>X0u'H&V$>*P%:T
q.:s7RZ=o4ZW-7A24,cM>=;lF6:6<`EO)hUH/P8qOX')eCk-[@((&N<XKDQZGZ>SZ&<n;QmL
+:_@^nZ+d4"DXZfIZK?j\:R@=oML%7GspL9-Tjit#]AlG[bK.)fW%>;c(0-S2;<QF#8T/ksAQ
FO>8En*tqTNOGi.nnE6O-lk>)T=fR'NM4os#ABHJ-Oo>,]A#gBgqQie:-?\=*IPRG%,goU[4$
/Z1[)/qZNkiG:':^LJ#AY);P4g#AdBS;B%fs$uQAc-?YY*_GsDN.Nh?QMW^kbQF"H@n3Yb3B
;9JPuD:,5W:6peC[RBmdYr85q=P9;I?Ai-uW.UG8V*_(\p+(ijrG-mTstFIq\5!+WlOE.J&,
D/:[[cG=gSFM=toP-p-i^cHUC55\'qLMh"dZTs2JH.N&(BOKjRlPs:D0JEt;s#N<<Z5f<rmX
/k5:dlL@&o"6\bWeHadi^Ah\9Tj&_XTJuR\h2tp%E1]AlLFm,*#t#GM/YOF#=7U[S>,&HLoV.
0*,@`P511&IWHT.MZkRmg[i=<PRBY$/n39-^i<*([4TS+Wgh@Z5iMdR-EeU'C/a\d0-.U!8F
QW5=Y33gB!A>G`m8\WU,oeI(]A+sJ20F*2Vp&opIk(568m#ZR/YIt]A99rUa&\rVRGTUigC(2+
*WZI-&eP2i964;uBTbc?WETH%gdJ(aH+[_VZ4is;F!#7F9u.m6g^g`Z[X%\9TeWFNVW/8MC8
,oa#?!ZOETT-7'RK*gVVLc?jHD]A(,N0$3?Cn`W=IgJI9^5l?6:U>mjO)XKHnCdRp>a.p/+J`
9!3ZC=8_#fuT&LE]AjgL%1764l@sCa$p8!qK%2nP,\$>7HPo.B*(WfZBFMCMocQ:7WNfUWRVB
RQr]A$fM5>Q&#Y=dDG#L69;KC_/,#J#ti`Qp.+[lf)'J:o(=#Btq6\]AmgFEA#q<7>H",^h2$K
9W$:9UkV'piFpsE\b>*9><3hc07F8IOhi2GM4huPB4(bWp_*T-B+@Q'acD[_MQhH+P!tsW3j
:+Ck-lJJ+<9M"C7tq4clQB\B^cRiR;:cIl$5;3PQN]AG&WhL)pJ3BrtlTXXBZ;NpjQ3G@%`Pk
\Ng1JWD)2"Q7.@sgsPL8#Xn'jhIJu.\8\VqO5?8BLkVU<)P?K]A)8b:OEMB5mfI6^?j3oZZ%f
.e@!.n*:0cA\I+P2ZUOM@]AF$sDqt"Fk1d(p$;g>YujNghX^H`@.Mo,8Wm7:Rj9LE$2@%`Zr9
6OYZ#KHAZl(B`0+k93Ef6ViB,>ZbcVLM3\ULFYA+rrlfXU"fA*I^aZ[.o[.'acs$W"qkLM4d
j/$=!W8/eX1I($K8);HW+=AkJ7NBsC62uD!"_`o=:O&QWdTp$U)`Y9Msq%$^^"tBnX1t`LkF
Qe?+Vn,?i1HF1D9Q.'*(@o@QBDNk]AT0S[f^&5ms>E'#c=MM*tlh/8a-.R[\:KD67bfb,AH#h
@.^?HV;ufBc#$jDb#^c]AicL9\'^ubf42aps=LT)cC]A:Pe38M&KcX2!E*$kN7+JJW%iOu$(fL
P\u2ir0*Hod`YB)6m'i`5mghAIt!#LRiNkKQ68c</1P?3Xj<<\@Uio_]AX?qu-g~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="800" height="139"/>
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
<HR F="0" T="0"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[792000,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[4229100,3352800,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[公司]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[库存]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="sum" columnName="公司"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="sum" columnName="库存数量"/>
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
<WorkSheetAttr direction="0" indexsToCopy="1" start="1" oppoStart="0" end="1" oppoEnd="1" maxRowOrColumn="12"/>
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
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m9=j@;eN[*+h"@rRp>XCC24s*[?Rpr1[S9jP!rTAg/Kl1'rr`KWM2fs`F7#gNhod-;(HWS#p
"q/9+`XElEDP"l4FV[UaUmB_'fjtP*go=-TUohgH.!WO5HdDBBJs#pnrmcH^EoDT(i,&nFrt
b4?_r>8Iu"f^%/;%mm.L^#sj#Y5P6;q5Pe1=*.adEM(=oFGsD,S5f_K]A+-I9.\l*1'U)0<IK
%gd\=#0M=7[>$aRN=.--fk'0OMpSUorW_6E$G-9@Rt%VjS6,)ID'gQ-@8STVOh!lGO5N2kcp
MQHT:I?XQEl/`@%@V?l&$mTrS+ebR/Pq3p5SeN1mA'B!7Agjf&UrC?lA]AI,RZj^iMgtXJhDX
Lc/-AFW,lYr^uu&5Q(uIJ-9O4acm+\j+iV#-0p:$OELP*I,2p'1Y3:`;O&C+$K^TjiSTGC_3
-(@BQ*PC0(@m[;TUQ4R#LgrrlO/\^."2Y*2J=Abbog3BhSgZ]Ar%Cm,frFfCMF:F/q'dl+R"c
6V7\O_0IF-=-&S1#h%A4R=XpIfaOtk,B"#n1'@e!^1ZiaYatt:=i^NCGeI:fC7P?#j[#aX[h
26MITkr#3gG)iufmo636[KpB<>4Yl`gj(k2V5sqCcG@(2&k/T]Am"9eo`WlHOsu?r&"CEAFWR
)hANZ?)iO!gURGFp`2A*W;27D!H^,T2c5EAnFIF%WNN:J=*=;;L_.6#pU:ntL(dH]Ajp25-Y3
V_Ci3A9dPgQ5sA:n<15hh3Y9$r,%UdcR8q)mB6dObJ1enRuQg4k[pc/kCBup.-uEI13*MsK]A
jQK,`;JKRtRm/:28!]Af?Ftdqa)*M2r^4Y4#9-)OO0<t'D`m@*BpjGFf=]Ai1G5\kQ5@GE[G&)
!3;VO#Wa_!gm6)o,@RAbej^AA,[^\I"V#i!;\r.[b'PfSB'!7HrREt=TDsY"MFR:X*B;Dd2d
elpC=cnuC))eo@c00k]ADjo-COJ7#$1507ZWZ>MWAm1!9X*c<[S`fU><h*-4KcTkafgU'dklE
]AG]AOgtN@7/#ZF6[Sn::%ACZh_T<"Y7H9'>1@AD""^!%C.0R82iK2^4IT71W(2.`7Fl4N8!-M
'sTifRQ"bueHH@Q"u."H:]AKQ)@B"MV1[DT3F*"IcYPkaD>o+[kl4G8[kkl![!d-"/^1f#c?,
]AlX6lpgMlA=QW^\.M[q%fL\F?)?j_0f\n;mJS!H/d;T_kt!#>H/hPqBB]A)A#W(Y*f=MB7df5
</0g9b8Ic7LR<M`9&ssXi#c90pQH*DlM!\biiBKjM&hWbbY"OOcMS36=0^Pl<GWPKp;b0N&S
Rl)mfFfQ%NRjl,/cqbFGRA"0]AiX3P19G_F70q2%0c,\,5hO_bl?G#%erFk"`"l"4.gOXO9_p
<F6OG?Vc4cd50lhAc9MTn,IVTSt8Z*$Gcu(oE_9@Dh1goN77k_^(3^jt86]A8?clNlkZ^[8q`
bEDL'@gTR.Y2=:gP=[)^4IE:<GC$l58(,s=&g6_0Gp9[b/:-53_^]AD@R)kO^-,j(8k5EL.l@
M_4&=^!pQKAN!)4bX+]A9cP-lM`7u6in("Vc4mIY(!,0G/)l6H0aE3'A$^ld&YK/W88r`iq]A<
bD(_W7M2n$72>k\,K#mi?\m-!3X"+?GN^?B(mNo@i3:q3kR0bJ3!W=sRWGeFJqGp$DT'HU+P
"^U&ba<Uu[N"p-U;Zj_s,Y74=8I&Y2NKKe"*:6=HA*=67-J)N47.1W35oF@o;24^IOeft'rA
J]A?-.T(?EYO</hpg=[;heaNCK%)O*V#ukoBhs*7m4[8HG[?Z>M>MWR&ctq221Wf3Y5@WtO_W
)^_#*N:,i<3tXh52hm<NY):rM`LJ2En`P%A]Aug5Ie?X@"*Hjtb]A[IcZF>n-eU.c>rP9PX6<<
GrOrs;aLDm-U0[boe7MqN_WY4<)4>>uL>>1b#*#O/tX1D"GpcpFZ>)eo4:2F/%(J)W*,W?UW
>doNjHOWf/Rb/iuC5(I8R:N3]AbQ-I$^;r::9=tAX26K/5gCn'ZMF+gQp&!@>OB'&an8:Kgn=
k>06bP,DcZjU%s@_3I2*6,3MKJsr&L3f#[M"@mAM3iVs:sKZ-ckS--^l>*UW\V[kaZ>_q3:U
2,C&P[*f#.\%_opkmJHpoPl_DN@`!!ucQY]A<h_ABA:G'`7Z\")odQn,[19ns6)H>%lrL9J*/
,+6ZlmSqtq2c5hoH3E'A4H8o)ld$/I#1"s@gOEEj!SJ.1W\:)C/.[R0KA5/tD?+Jaf%+8/\@
^"_qP5YGWYXJj\^a/#\[tRaYYj<<05cke4^DZkfN"\BdL$t\?j/%3U:9g$C=K-LC(mM2e*BI
I5fFq(N-m7:[TIuV^&L8S\c@bc;qKDX7EJ58M"&?[kjiXA..B.*_f3l\F<KEuWKi<B/USfeb
@6n!l-ak:+gG>!(L-N)&F6Ar8lq&]Ak7C`<#[A@Q_?u,H>;X:t*LUlQHIj2?>jPLb-CHYsS0`
$^Q"]AVi3/&oYAog(I0@rtbOGOljZ-s3E^d\pY%iQ!>c+EZF\>;mK,19R'kT+M03jS\KJV")2
D"aQ#.R.?.gqY9VglU8%"4P_%ijJpm8pZAedop@d3HeKh^PBQP9[f\q@l!H?gKI;%*b5d,7Q
8B8Kn&W9eO^K!mYoA:1=VM`n=!p8H*U!]AO0)"@/Z>7nQg.04P%OB2giRTX4-NJ>;CX(Q8/o'
qG/Kb<)9#KgP^/?O"c)b/8#5EOEN6/0]A:7gBClGdgkYh^8HR_o%>5^27C#mBOFS$TLneb)Ze
gI.l7u&)@n+bnb\*sB(]A]ABDIVH_Ra;X6k*C:j/)FLFm5)g.@ORI,Jqk-(RB^,\j;j\Pn5[2P
n5\=>slb:'jRRI9p""U/L@^ZWl\)oWiaak15T(m:SY1=Og*.$R(d4)%7s0Ph[`bVg2W]AKPij
[!5$8OJXR@M$bZB,$IBqp.U0_^;HE50tf'IW;pgO,uFDA6:?o;E:Z1&%B8VupcR<AC>V/mh1
f)X57hO6HbL>[8nHk[[HTNQgcBLKPZD'urQ_Ymb4^66mW+2_DFJ2Pc,=-*WQ"\D]ADYQ>Po%S
cZZX^460\"hh9LYd92U9;SlQIDB<+I$#?\k$Cc_F_\+s#CR9stOLZo/dEM?t/aJfue"*?t2A
JdqZG,>DY]A7_/FTjiU(RjSdm7VbMYQK%lbQ%g(D6]AmR=.E[ZK[$oUAV2F#1oa:6INklh]A+$6
GpeQ`[&6Jj,Q9RY1mNPd_M-qg:l_Fj2I8dUPf<FpTXT"b0H2[d=X>lKGWWs#4k;:Dl2Y4KET
HF^oi([MQ"Zqd^aU$J,F5!RXVQaNmH8.]A4>;>YWBPKnL9_E=Ns"TL;-;na`u$H*$5q4>p$C$
.&G2\f]A'gY8]A9Z?Dmae4lDb<d3daq8j3E5]As\/Z/47^N'[]Ah*[KMQGoU6@Mt$d+0"sV;E?I<
.pkAC[;j"Y8LXLJ34.<*eM.&d9m>fZGs4rhIj8"\9b@oOYH*$KU*d,(Wed;,PLu4'[3a@fhF
e^0B6??Hr;3uf(>96\Y)5ReloC8Fekf$?.5>3Q7`XM$tA^T(7;!GC(D2,J2,a04Q]AX;700P@
3<]A()8ISG]Am*2Xk;RZWlr8R8<\HRJtk*l4KK1LOR'=G!km,G=8r6q=l#Z/$,AKo:R%HlEVDg
`%n&S=AlE\[:$NBe(c=9d.`Fm\8-:a"Dk(Wg@eZ>I?T'2i=,"oVk*pJaBGkQIn8p&?t8_=^t
sWS!UbK<4F@2(TPMZ\$?nO9b7OX:OTq0bH(tY:(@_g9<A>pt<R/FOkp5f;]A86p+g9W#Xq<tI
NSg`j5$aH\iG'",5V9K^FhV8?m3+F`SL*/6,T4Dt\`h/Nt;kLTp5X[36J_!M:#f<c@[Fa@Y1
Alumph$L=4VX%<LTkbG*I*DgiR`YCHu/'?PO*c_j4,5.?s$G@^r;bo?,;]As+9&h`$&g)Nq4N
m^p"]A55PfGler!3e4IVp4A#%["QBn$"p&hODDFD[Vad^UCnHqXSig4U!7V#>o$r',>:a6.\B
4W*K>a'295@6Kpn\(N[j<\SJ\nGPK"TEK1q/llok=Y*hu!fE$Q5Ccsq]AIu3EP8qHCnS=2QCm
(*3kP:BOG2QqpWP_Z0^J!\$oa(='^Y4*/5Ol4<E;c2l_'T8a_W*04UHp^_]AdChk?M6=*J0Up
[?jIg)?g=W5@YQ:Hc7['Q=63!JBh6%,0kJSl:+YKhBm>'Mq\sT+<EpmWHu4'39PO?sg)n%>9
D6!f!q&',S]AN(I=S=7HFWa/UV<D[*9Y8/mE*2>-lrdbUcA^\ie&USU^0a#G1IVl4e^jmiRX4
5XYo_X01/q\4P(.m"l%f"^WFT0C0GDSd"G+Wth>L=K=Q-NZQ@NZ4qa'7!X"ZXo'S@F30^V*6
KCMAid0csM"5C'.nf/LUYhJYfi1T`4=:gjclPL8p+>"_7a0F^9+44C9^]AXB.T.KCaPR81Nf4
;mtSHPg!$j'Gt\]A_GI'7cs^I97+?s3pc.g,urrQ$:4aEYUb<0F?SFTZo\bI,/lTWicm\T/re
rmJ+Nf=5-Y.H?o_gSEFh-"@+tlI,u=r7kmce(%3]A@;rp"Cb)*0da?,PsB\\j;%Koq\1>u:NU
HlV3%Y)?L[#DH*Y^7$X[kE[R]AUr%Q#"J)]Aip5_DSqRNOk8?+Q1pakc,\R1pFGaEi8H1''deA
W6h75eD5"dYN1UXPSX*7[4Q%4R;N[$do#-3[Jp9Ii#4RLKmcD4VdT,@k:>X0u'H&V$>*P%:T
q.:s7RZ=o4ZW-7A24,cM>=;lF6:6<`EO)hUH/P8qOX')eCk-[@((&N<XKDQZGZ>SZ&<n;QmL
+:_@^nZ+d4"DXZfIZK?j\:R@=oML%7GspL9-Tjit#]AlG[bK.)fW%>;c(0-S2;<QF#8T/ksAQ
FO>8En*tqTNOGi.nnE6O-lk>)T=fR'NM4os#ABHJ-Oo>,]A#gBgqQie:-?\=*IPRG%,goU[4$
/Z1[)/qZNkiG:':^LJ#AY);P4g#AdBS;B%fs$uQAc-?YY*_GsDN.Nh?QMW^kbQF"H@n3Yb3B
;9JPuD:,5W:6peC[RBmdYr85q=P9;I?Ai-uW.UG8V*_(\p+(ijrG-mTstFIq\5!+WlOE.J&,
D/:[[cG=gSFM=toP-p-i^cHUC55\'qLMh"dZTs2JH.N&(BOKjRlPs:D0JEt;s#N<<Z5f<rmX
/k5:dlL@&o"6\bWeHadi^Ah\9Tj&_XTJuR\h2tp%E1]AlLFm,*#t#GM/YOF#=7U[S>,&HLoV.
0*,@`P511&IWHT.MZkRmg[i=<PRBY$/n39-^i<*([4TS+Wgh@Z5iMdR-EeU'C/a\d0-.U!8F
QW5=Y33gB!A>G`m8\WU,oeI(]A+sJ20F*2Vp&opIk(568m#ZR/YIt]A99rUa&\rVRGTUigC(2+
*WZI-&eP2i964;uBTbc?WETH%gdJ(aH+[_VZ4is;F!#7F9u.m6g^g`Z[X%\9TeWFNVW/8MC8
,oa#?!ZOETT-7'RK*gVVLc?jHD]A(,N0$3?Cn`W=IgJI9^5l?6:U>mjO)XKHnCdRp>a.p/+J`
9!3ZC=8_#fuT&LE]AjgL%1764l@sCa$p8!qK%2nP,\$>7HPo.B*(WfZBFMCMocQ:7WNfUWRVB
RQr]A$fM5>Q&#Y=dDG#L69;KC_/,#J#ti`Qp.+[lf)'J:o(=#Btq6\]AmgFEA#q<7>H",^h2$K
9W$:9UkV'piFpsE\b>*9><3hc07F8IOhi2GM4huPB4(bWp_*T-B+@Q'acD[_MQhH+P!tsW3j
:+Ck-lJJ+<9M"C7tq4clQB\B^cRiR;:cIl$5;3PQN]AG&WhL)pJ3BrtlTXXBZ;NpjQ3G@%`Pk
\Ng1JWD)2"Q7.@sgsPL8#Xn'jhIJu.\8\VqO5?8BLkVU<)P?K]A)8b:OEMB5mfI6^?j3oZZ%f
.e@!.n*:0cA\I+P2ZUOM@]AF$sDqt"Fk1d(p$;g>YujNghX^H`@.Mo,8Wm7:Rj9LE$2@%`Zr9
6OYZ#KHAZl(B`0+k93Ef6ViB,>ZbcVLM3\ULFYA+rrlfXU"fA*I^aZ[.o[.'acs$W"qkLM4d
j/$=!W8/eX1I($K8);HW+=AkJ7NBsC62uD!"_`o=:O&QWdTp$U)`Y9Msq%$^^"tBnX1t`LkF
Qe?+Vn,?i1HF1D9Q.'*(@o@QBDNk]AT0S[f^&5ms>E'#c=MM*tlh/8a-.R[\:KD67bfb,AH#h
@.^?HV;ufBc#$jDb#^c]AicL9\'^ubf42aps=LT)cC]A:Pe38M&KcX2!E*$kN7+JJW%iOu$(fL
P\u2ir0*Hod`YB)6m'i`5mghAIt!#LRiNkKQ68c</1P?3Xj<<\@Uio_]AX?qu-g~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="800" height="139"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="report1"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="800" height="450"/>
<ResolutionScalingAttr percent="1.2"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="JAA"/>
<PreviewType PreviewType="0"/>
<TemplateID TemplateID="7b912df1-7fc1-4274-98db-6a6f88e1dd9e"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="b3b15f4d-4968-430b-aaba-a811121f1447"/>
</TemplateIdAttMark>
</Form>
