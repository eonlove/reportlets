<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="9.0.0">
<TableDataMap>
<TableData name="30xl" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select to_char(jysj,'YYYY-MM-DD') as ymd,yjfl,
sum(xbzsl) as sl
from spls_to_xbz
where jysj>=(select max(jysj) from spls_to_xbz)-30
group by to_char(jysj,'YYYY-MM-DD'),yjfl
order by to_char(jysj,'YYYY-MM-DD')]]></Query>
</TableData>
<TableData name="kucun_lv1" class="com.fr.data.impl.DBTableData">
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
<![CDATA[select b.yjfl,sum(kcsl) as kcsl,sum(cbze) as cbze
from zl_kucun a
left join dim_goods b on a.txm = b.xbzm
where drsj = (select max(drsj) from zl_kucun)
and 1=1 ${if(len(unit)==0,"","and mdmc = '"+unit+"'")}
group by b.yjfl]]></Query>
</TableData>
<TableData name="kucun_lv2" class="com.fr.data.impl.DBTableData">
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
<![CDATA[select b.yjfl,b.rjfl,sum(kcsl) as kcsl,sum(cbze) as cbze
from zl_kucun a
left join dim_goods b on a.txm = b.xbzm
where drsj = (select max(drsj) from zl_kucun)
and 1=1 ${if(len(unit)==0,"","and mdmc = '"+unit+"'")}
group by b.yjfl,b.rjfl]]></Query>
</TableData>
<TableData name="kucun_lv3" class="com.fr.data.impl.DBTableData">
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
<![CDATA[select b.yjfl,b.rjfl,b.pm,sum(kcsl) as kcsl,sum(cbze) as cbze
from zl_kucun a
left join dim_goods b on a.txm = b.xbzm
where drsj = (select max(drsj) from zl_kucun)
and 1=1 ${if(len(unit)==0,"","and mdmc = '"+unit+"'")}
group by b.yjfl,b.rjfl,b.pm]]></Query>
</TableData>
<TableData name="lv1" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="start"/>
<O>
<![CDATA[2021-10-01]]></O>
</Parameter>
<Parameter>
<Attributes name="end"/>
<O>
<![CDATA[2021-10-01]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[
select b.*,

case when ysjecounter=1 and ysje_lv1_lj>=0.5 then 'A'
  when ysje_lv1_lj>=0.9 then 'C'
  when ysje_lv1_lj>=0.5 then 'B'
  else 'A'
  end as ysje_lv1_sort,

case when slcounter=1 and sl_lv1_lj>=0.5 then 'A'
  when sl_lv1_lj>=0.9 then 'C'
  when sl_lv1_lj>=0.5 then 'B'
  else 'A'
  end as sl_lv1_sort,

case when jslrcounter=1 and jslr_lv1_lj>=0.5 then 'A'
  when jslr_lv1_lj>=0.9 then 'C'
  when jslr_lv1_lj>=0.5 then 'B'
  else 'A'
  end as jslr_lv1_sort
  
from
(
    select a.*,
    
    case when ysje_total=0 then 0 else ysje_lv1/ysje_total end as ysje_lv1_zb,
    case when sl_total=0 then 0 else sl_lv1/sl_total end as sl_lv1_zb,
    case when jslr_total=0 then 0 else jslr_lv1/jslr_total end as jslr_lv1_zb,

    sum(case when ysje_total=0 then 0 else ysje_lv1/ysje_total end) over(order by case when ysje_total=0 then 0 else ysje_lv1/ysje_total end desc rows between unbounded preceding and current row) as ysje_lv1_lj,
    sum(case when sl_total=0 then 0 else sl_lv1/sl_total end) over(order by case when sl_total=0 then 0 else sl_lv1/sl_total end desc rows between unbounded preceding and current row) as sl_lv1_lj,
    sum(case when jslr_total=0 then 0 else jslr_lv1/jslr_total end) over(order by case when jslr_total=0 then 0 else jslr_lv1/jslr_total end desc rows between unbounded preceding and current row) as jslr_lv1_lj,
    
    sum(1) over(order by case when ysje_total=0 then 0 else ysje_lv1/ysje_total end desc rows between unbounded preceding and current row) as ysjecounter,
    sum(1) over(order by case when sl_total=0 then 0 else sl_lv1/sl_total end desc rows between unbounded preceding and current row) as slcounter,
    sum(1) over(order by case when jslr_total=0 then 0 else jslr_lv1/jslr_total end desc rows between unbounded preceding and current row) as jslrcounter

    from
    (
          select t.yjfl,
          
          sum(case when ysje is null then 0 else ysje end) as ysje_lv1,
          sum(case when sl is null then 0 else sl end) as sl_lv1,
          sum(case when jslr is null then 0 else jslr end) as jslr_lv1,
          
          sum(sum(case when ysje is null then 0 else ysje end)) over() as ysje_total,
          sum(sum(case when sl is null then 0 else sl end)) over() as sl_total,
          sum(sum(case when jslr is null then 0 else jslr end)) over() as jslr_total
          
          from
          
          (
              select yjfl,rjfl,xbzm as sptm,dzxmc as xbzspmc
              from dim_goods
              where zsbzzl = '小包装'
          ) t      
          left join (select * from spls_lrhy where rq between to_date('${start}','YYYY-MM-DD') and to_date('${end}','YYYY-MM-DD')
          and 1=1 ${if(len(unit)==0,"","and md = '"+unit+"'")}
          ) t1 on t.sptm = t1.sptm  
          where  t.yjfl is not null
          and t.yjfl != '未分类'
          group by t.yjfl
    ) a
) b]]></Query>
</TableData>
<TableData name="lv2" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="a"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
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
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select b.*,

case when ysjecounter=1 and ysje_lv2_lj>=0.5 then 'A'
  when ysje_lv2_lj>=0.9 then 'C'
  when ysje_lv2_lj>=0.5 then 'B'
  else 'A'
  end as ysje_lv2_sort,

case when slcounter=1 and sl_lv2_lj>=0.5 then 'A'
  when sl_lv2_lj>=0.9 then 'C'
  when sl_lv2_lj>=0.5 then 'B'
  else 'A'
  end as sl_lv2_sort,

case when jslrcounter=1 and jslr_lv2_lj>=0.5 then 'A'
  when jslr_lv2_lj>=0.9 then 'C'
  when jslr_lv2_lj>=0.5 then 'B'
  else 'A'
  end as jslr_lv2_sort
  
from
(
    select a.*,
    
    case when ysje_lv1=0 then 0 else ysje_lv2/ysje_lv1 end as ysje_lv2_zb,
    case when sl_lv1=0 then 0 else sl_lv2/sl_lv1 end as sl_lv2_zb,
    case when jslr_lv1=0 then 0 else jslr_lv2/jslr_lv1 end as jslr_lv2_zb,

    sum(case when ysje_lv1=0 then 0 else ysje_lv2/ysje_lv1 end) over(partition by yjfl order by case when ysje_lv1=0 then 0 else ysje_lv2/ysje_lv1 end desc rows between unbounded preceding and current row) as ysje_lv2_lj,
    sum(case when sl_lv1=0 then 0 else sl_lv2/sl_lv1 end) over(partition by yjfl order by case when sl_lv1=0 then 0 else sl_lv2/sl_lv1 end desc rows between unbounded preceding and current row) as sl_lv2_lj,
    sum(case when jslr_lv1=0 then 0 else jslr_lv2/jslr_lv1 end) over(partition by yjfl order by case when jslr_lv1=0 then 0 else jslr_lv2/jslr_lv1 end desc rows between unbounded preceding and current row) as jslr_lv2_lj,
    
    sum(1) over(partition by yjfl order by case when ysje_lv1=0 then 0 else ysje_lv2/ysje_lv1 end desc rows between unbounded preceding and current row) as ysjecounter,
    sum(1) over(partition by yjfl order by case when sl_lv1=0 then 0 else sl_lv2/sl_lv1 end desc rows between unbounded preceding and current row) as slcounter,
    sum(1) over(partition by yjfl order by case when jslr_lv1=0 then 0 else jslr_lv2/jslr_lv1 end desc rows between unbounded preceding and current row) as jslrcounter
   
    from
    (
          select t.yjfl,t.rjfl,

          sum(case when ysje is null then 0 else ysje end) as ysje_lv2,
          sum(case when sl is null then 0 else sl end) as sl_lv2,
          sum(case when jslr is null then 0 else jslr end) as jslr_lv2,
          
          sum(sum(case when ysje is null then 0 else ysje end)) over(partition by t.yjfl) as ysje_lv1,
          sum(sum(case when sl is null then 0 else sl end)) over(partition by t.yjfl) as sl_lv1,
          sum(sum(case when jslr is null then 0 else jslr end)) over(partition by t.yjfl) as jslr_lv1
          
          from     
          (
              select yjfl,rjfl,xbzm as sptm,dzxmc as xbzspmc
              from dim_goods
              where zsbzzl = '小包装'
          ) t      
          left join (select * from spls_lrhy where rq between between to_date('${start}','YYYY-MM-DD') and to_date('${end}','YYYY-MM-DD')
          and 1=1 ${if(len(unit)==0,"","and md = '"+unit+"'")}
          ) t1 on t.sptm = t1.sptm
          where t.yjfl is not null
          and t.yjfl != '未分类'
          group by t.yjfl,t.rjfl
    ) a
) b

where b.yjfl = '${a}']]></Query>
</TableData>
<TableData name="lv3" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="a"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="unit"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="b"/>
<O>
<![CDATA[]]></O>
</Parameter>
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
<![CDATA[oracle]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select b.*,
case when ysje_sku_lj>=0.9 then 'C'
  when ysje_sku_lj>=0.5 then 'B'
  else 'A'
  end as ysje_sort,

case when sl_sku_lj>=0.9 then 'C'
  when sl_sku_lj>=0.5 then 'B'
  else 'A'
  end as sl_sort,

case when jslr_sku_lj>=0.9 then 'C'
  when jslr_sku_lj>=0.5 then 'B'
  else 'A'
  end as jslr_sort
  
from
(
    select a.*,
    
    case when ysje_lv2 =0 then 0 else ysje/ysje_lv2 end as ysje_sku_zb,
    case when sl_lv2 =0 then 0 else sl/sl_lv2 end as sl_sku_zb,
    case when jslr_lv2 =0 then 0 else jslr/jslr_lv2 end as jslr_sku_zb,

    sum(case when ysje_lv2 =0 then 0 else ysje/ysje_lv2 end) over(partition by yjfl,rjfl order by case when ysje_lv2 =0 then 0 else ysje/ysje_lv2 end desc rows between unbounded preceding and current row) as ysje_sku_lj,
    sum(case when sl_lv2 =0 then 0 else sl/sl_lv2 end) over(partition by yjfl,rjfl order by case when sl_lv2 =0 then 0 else sl/sl_lv2 end desc rows between unbounded preceding and current row) as sl_sku_lj,
    sum(case when jslr_lv2 =0 then 0 else jslr/jslr_lv2 end) over(partition by yjfl,rjfl order by case when jslr_lv2 =0 then 0 else jslr/jslr_lv2 end desc rows between unbounded preceding and current row) as jslr_sku_lj

    from
    (
            select t.yjfl,t.rjfl,t.sptm,t.xbzspmc,
            
            sum(case when ysje is null then 0 else ysje end) as ysje,
            sum(case when sl is null then 0 else sl end) as sl,
            sum(case when jslr is null then 0 else jslr end) as jslr,
            
            sum(sum(case when ysje is null then 0 else ysje end)) over(partition  by t.yjfl,t.rjfl) as ysje_lv2,
            sum(sum(case when sl is null then 0 else sl end)) over(partition  by t.yjfl,t.rjfl)as sl_lv2,
            sum(sum(case when jslr is null then 0 else jslr end)) over(partition  by t.yjfl,t.rjfl)as jslr_lv2
            
            from     
            (
                select yjfl,rjfl,xbzm as sptm,dzxmc as xbzspmc
                from dim_goods
                where zsbzzl = '小包装'
            ) t      
            left join (select * from spls_lrhy where rq between to_date('${start}','YYYY-MM-DD') and to_date('${end}','YYYY-MM-DD')
            and 1=1 ${if(len(unit)==0,"","and md = '"+unit+"'")}
            ) t1 on t.sptm = t1.sptm
            where t.yjfl is not null and t.yjfl != '未分类'
            group by t.yjfl,t.rjfl,t.sptm,t.xbzspmc
    ) a
) b

where yjfl = '${a}'
and rjfl = '${b}']]></Query>
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
<NorthAttr size="62"/>
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
<BoundsAttr x="81" y="35" width="94" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelend"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[end:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="1" y="35" width="80" height="25"/>
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
<BoundsAttr x="81" y="4" width="94" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Labelstart"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[start:]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="1" y="4" width="80" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="unit"/>
<LabelName name="单位"/>
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
<BoundsAttr x="255" y="4" width="110" height="25"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.parameter.FormSubmitButton">
<WidgetName name="formSubmit0"/>
<LabelName name="单位"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[查询]]></Text>
<Hotkeys>
<![CDATA[enter]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="376" y="4" width="80" height="56"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label0"/>
<LabelName name="start:"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[单位]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="微软雅黑" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="175" y="4" width="80" height="25"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="start"/>
<Widget widgetName="unit"/>
<Widget widgetName="formSubmit0"/>
<Widget widgetName="end"/>
</MobileWidgetList>
<Display display="true"/>
<DelayDisplayContent delay="false"/>
<UseParamsTemplate use="false"/>
<Position position="0"/>
<Design_Width design_width="960"/>
<NameTagModified>
<TagModified tag="formSubmit0" modified="true"/>
<TagModified tag="unit" modified="true"/>
<TagModified tag="start" modified="true"/>
<TagModified tag="end" modified="true"/>
</NameTagModified>
<WidgetNameTagMap>
<NameTag name="formSubmit0" tag="单位"/>
<NameTag name="unit" tag="单位"/>
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
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report2_c"/>
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
<WidgetName name="report2_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-8355712" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    品名明细 (上级类目：\"+$b+\")\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
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
<HC F="0" T="2"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[0,0,5829300,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[一级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[二级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[品名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[利润]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[销售额占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[数量占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[利润占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[应收金额ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" s="0">
<O>
<![CDATA[数量ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" s="0">
<O>
<![CDATA[利润ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" s="0">
<O>
<![CDATA[库存数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="0" s="0">
<O>
<![CDATA[库存金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" s="1">
<O>
<![CDATA[DOS(天)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="0" s="0">
<O>
<![CDATA[库存状态]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="YJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="RJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="XBZSPMC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="YSJE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="SL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="JSLR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="YSJE_SKU_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="SL_SKU_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="JSLR_SKU_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="YSJE_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="SL_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="JSLR_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="kucun_lv3" columnName="KCSL"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[YJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="1"/>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[RJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="1"/>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[PM]]></CNAME>
<Compare op="0">
<ColumnRow column="2" row="1"/>
</Compare>
</Condition>
</JoinCondition>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="kucun_lv3" columnName="CBZE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="1" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=m2/(e2/30)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(o2 > 28, "滞销", if(o2 < 21, "缺货", "正常"))]]></Attributes>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<![CDATA[#0%]]></Format>
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
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<]A4?;ch]AHM4$\GJ_4!."X/&$*,GKU/]AoprZqfq/XJ@FJZs9=oN>=3Wj:XclXK=Hl--f=]A'h
N)@VCb,&O9h";8i<FN!Drn$&hlY(8I-I_pRLgsChqf$k0*!-a#.0&dZl-%PKghSqq9<m4RYK
5p%?82rj.5h!s%9ZlC\+K-33t@(]A\0U4miD:\K8KLCB,d@^A=`Dh^UU^+,\gBd6I-jY"h/uH
IKJi-eGfo[,oX2AEcTsSm>I-IY%-L^HG(B[(T=dqXM4`&[0Iu#1HKY>1/JRSuKDOlCA`)1hu
_(qk[KFUm/oWB3o`O+>\-0*-&<M'C"#<Q@[*H"5;4?]AIUsHMIIo_Ei:ne\;8:\c4,hn5Nu$2
0$%&-*SAB9?BEZ\YJi8u6;.&'=GEYZF[K),:<1"aD:2LQ?0'%R&pgJ0_&M9]A[l0U^kpEafn]A
]AZ"nN6Vj(\0YI]AQs+"c0aJmFl.\(c*h_tja!.J3e`R%b3ae(AW2;ME=9!f\O7P=_fn<R)P\3
L*]APbZUMJZCk5D6]A&:&&,CDo/uaR1GSY_&G8&#Z!S:).u/I$`=2XIThsh(3YZ>W$m-nGHDtd
_AsBebEU#3p5@_[nm*`$<467%:L:b\l,K]A'huBk!4j`j^4b>i[@`P=D":%2T@_`#OVbe/"rU
l,`"'=5qic9b)Q?8*'5u"7W`JK)0G;R:4Uc-)`"72:NkR$qLbDnLm3RO_.pN$e"5gOV!X!2j
\Q2LsD[@X$)?dFsaKa8,_qD7(A;L`U'RCim"'.+rAnK6+e&Uc6(HIWMm!9/U[(>(ihduRNQ<
mHU+#a^Jf0RDP3^b9IBbeGflkIf(1h]A]A?hF5_;r6E_B]A]AQ'L*\+a!+V2!'\WfGpT%+2nqicU
L^"PO++6biO^eUWFg.)Y!%*u?lljRM87Zr)>PY;M'YIK=mcR@/15CtqRlDf#APe0;6(pm<a3
I6F6YNX3"Qn+-AG1*GOon%G=*&n3-]A.XHM&tJ-raV9!%R`=bl>8PmOkfW88//L_bXQ,.(P3@
4l;6X'ie)%]A%hZS71%G)p?/HCNGP1!VS9rE%YE"\`t#M$5Q@D2IDDm_AY@Lfc\Q*n3F-EknV
l'pqLlK#.qa41WZ$[?t)>t]A%W\))KK%_P,XL5kJU79@o?r]AOY!'G7/Y5AQ[6St-&j27,>;8L
CV#H#,4gFo76gY7:Dd2t=YX$hoa0`-OcXHin%NnCdtHS"4F374DN(^lp;Y?SFJ7!\g8dKC3%
snVefDMT=Qt'/S>2<<'h)G3ZOUc?,ie)pYZDFAmG\]ACdIpT*.p=5S>a,Y;gOa+/4-u^%DOOe
d_F#OIB6_IO^eh5?KL/OZfb8kqq#U\N!<oaN6;/VSIWJUbF,X(\P2A?$n[`KW^7&\1cOr(JF
80kr"m>E',S.c6;'dNPT^+Q;ar;=O%,^J8U:mf*YCR>b;.e:.]A2%qBXE@MdhDHoK@oCm4'L9
k+6ea*i?Q)=9Cc/m/HqRGj(u0(l#GDk4Hd$Iln\H[LHbT!O-k&o)$Io`t7sV-uTqcX7`i>(o
BF7cVE]AOMsgTJA`.NpSbPm>*-.4Hd'S>2\X1($rn9Rm8:@s:1LZmA00@LP1O2;oHQmJnmjt`
!59A3nG.bl$bINM8@pg$]Ai-?/cS%/!N5C7\h%l]Aff<dp@%!b5k<H_'fl:Z62;/15VW^JJKE$
+rX3pAOcNZ)q9MnpkXR83j=tg90aE-\`!'/BHPJ@VIf"(!*VNAjLO)J93@b[&GJe[g+R+>O=
m)ensCdi-`c&m!1.h2W*7/o[ZRM_<!-0j44%]AN=sS?Yo%B):;ETY#ah\p"Kae]ADHqUi=Xj^>
fc4b(CQRS#6@$CoQUBuZFgA@P5lcP/ijW.932rl-@/B7^#@.Lo>I&g.p5:nbT#C!9Ts]AAsVH
@1;i@Tf:=MVJQMam"M@7_47*in#`;u)?B_Ikr7-8hrtekdYo7%Ltndn5:`TStkVAPd%I);k/
@AD)JZkGK>UK`^e9f-R2NNDGoWT@I3.3W/d!'iba!N?Da^1K;:u:l`OZhJ$T.5*Eso&bE31N
UsD_Kn^mmFA>@uiEN4g93"==LsZK"D,WKj8g9Pt/u$_!n@?H_"FWZ[`#lhFPfA$(N,lJt2I^
eo8gpCZfrXt!b/e(__b#g\(:N/)01`D?H9fO,N6s"_?W5C2(i?[-q04,"n.`$M.g@O=)`cQ2
7,NZ:?/rFD@Jj&$hK_i["Ks6&@EDqD.flP6bE?ZDlF!on1RI98%<\lIA4\>FXa=UnlhljY,L
&i%#ub"'kP7GC:Qo3gUC;W<`n0gVUc3BN.A%WsW`d@M)VWh>#kTb[>6)BL]A_n*`i?n66?('j
JR.h7sFiX;\ctE,9G/[iD(k'UaY0oC<1`6$cRf`Pi>fnA*Y4.9'5qq4715qQ+V[t3OgeJBNe
oZGRl4;8m6lme<q$jon.fN=XasidT\G*.sbY\bM18E$IWE*FSM?op&ONYBuO*OKm#?\-$^O6
>m),Ah/49Y079jZ5G=s;I)dHnT=*6/MrhXF7/<+3&]A6K#oC`dAZ(.li:D.t=J$B1Kc^lW?V4
6aD^rZSAb?KH4V2X),1KmUWf-ClPQn'2&`MAA'neKoMG7^/`,[`2,t/CFGDfM(4KNHBRoi7C
t4r^qk%\a0`!=7=\)"_pTO?@Un19O\"nK]Ail4)1,oUq*'[U,UlTf?,=HY`IuEUW5>Z$Z1%AA
_&Noi_foXHVII=N^Y)US`KI\>0Ll.A:-T"9QhQEp<XD!h5X,#s5Cc)Q/@pbqaX*#Bs^-]AC&`
'f/%RW^mPNZL.!Z#'jL"1[TRXZ\6@DAI(4\2RUkJM2WX,-GaqP9uPBLFgW`CS($$i(I,0(eT
)EoRM!*0mo;-H"BT-*\G)H?kV0qYt9/Jm;^,!*DQH@7_^C]ASs"p.W'g,W!op)^)RCn(N_j4U
=h]AB-]A(kL#K00XIi]AQ,k.U?t9mb0&jqbBQG#nS1n3as4[gd-CI9p/Y<<-@t7KSf5BCblH06u
O!\UU:TW4Q79)R;D0\/Xrf0g1/uaJr\%FcfqP#;!e]AkQ5E(hcIJ^@V4jlIbAY>XrGBU8eBhD
^e(uD[VBioU_l>c1jI:18EjW@#c.+Cp9l.'b0&aS5:62<DLE\3EQJ5cc.0Z*D;V%/\Ts-h<?
f_iBR1WMu*i0K!<gm8oBn<;I/[9J_j1Tsu6,?F]A7)ima6g7dMG1iao?ZeurHen(]A77i8VfOf
P)FdR^Z/QVNo.s-ZL`5^`#XJ-qmK4n-k&F33QFnWZU@Sai9g."E'T[%S/a6,Ck6(:0`oLTUK
VV$']AmkE+b,T6U6f^qf71%Lh143SZ.Y&b"IX[[DXok07gf[u(Or(5Gm"/e_jKgIQ```uN+;3
6d.[Z%Ll"=\VF76pCr`,PQJZY!VA5ima*:pLLS!GE+SqKp_5FVs8_Y.Jq:?_t^93G9E@>-&h
d'!!k397K0*(\HN4'DZaL<:*/oRSJ.`EKc*gMfH@AU#`;VBL(2K`@sNkR0A.C`^b_Y`SJF.U
Lh4')Hsk825t']A=,,c'6-+o/O5;j9;_t</Q:7li#Tn4+/eirYh3O?W/[cC=cgB[,BVb\$[8P
$NqOH7u7=aV::F97)$V;f5"!l=[#ZSU]AG`5CcUCaC[FC=f[*Hgos,rAj=:_Io5P?nmb]A#:Y9
inI&+XSG+P.(r%&f.6+S?89!/;8#?@5B*sb`IMjU8?e,>A:X38C"gZ@9+5i.`"P8fol_e?O^
A[o>To*9/@+Se._FIpTqi^Uc>%d\gq[/A^*qals$#Bq>EQbJ5K\)XHp3b-CUXYgE-3B/6(V9
U\rVbeR;A2OJ_$W%$"TS@8l\R:[)1s=P4OmJ1%Fidhf<2Fh/Xf*hC*W3."Z7u[rCSOVnbm8\
;/0nFlD#oFGUuoCj!#Xp*Ri9J2/'XfeBi+=M1L#id+o2M161Ce0/$@31sL2m"c%ir!@ut)s]A
N2i0,8p@c1e_;Xg+=_cAm6Z;/%!cR.sU2e2Y\F.e1O&P.79#B2M0Z!+2tcb3&ZS+QurX23#6
M5aNfGAM'uqkAX.cO$W5&k.4.<rCa;iY+\iqRM0*:`8$#(gSUi&P@^E9'>YPD%YKAcH-dB2p
F:QVdeR<*]Ara"`bmFb^Ek9i_R,VXGrU@t\#Qq^Y%km3ap=2->mk72@k\41:6(eAn!\=,mUdM
_`eZ:h`faBZ0"(A^,e0TO,7>.:CffE3R^b1.0lTA6NoT5m/'9GX.nPqb*allOTZNHRQ``;<K
fgf]ARE/#[O"JTd4Em7oM*FI&_RGP$a5X.23h*ZWROjV-3t^mReCY9Xk7-*ZF&e>j(b0krYm`
f@,AZ+6f`cNI5d'lQ^XVkCaL^'`bi!G;p!Y"Rk-31pr08;17XdW!G7CatXZ5k;5]AT+E4s.qi
Nu^o/Q*dmnT8=E1@<G5k-fMp\#?q4G<@WBP#JMY]AS_+u3F"SjBJXrrFmXA:T`,%>qe)42r9*
VPnMgM%;L4C#O;8:9&8T0cJ.$c6<<J2$b4g((]A5*EgT^p_?npU,;O9o;]A]Al-:-JML02aXB7T
tWIGB.G%AD=H.7+F>npsk2Y3170r7Pa+]AW\ugrR";\eso#)d$<NmWqTrPBP"<*kr\m@RKLD+
lY`kY>lr08+Y52UUioQj.t,hj"#6#-[mFN5J^sr(NS!cA0@[Wl,iER-`>@WZ2k$f)8ERa67`
S]A.o#tt;Za"%6P0qtW'oBdm7C(<Q=E$EZ=J,c,H>OL-$]A90cd4kJfDTE4`EYk[TH4'r#"_AX
*Q1s;>]A7Z&#AL\6?OCtMMV2tpM3RH=;4bhh^KG<r)gZ#`'%QQQG[H&fE?U?2//LJr@0^s\[T
+%uTRYVPIIBV:`]ALe<`]Ap^hCSu'(r%SQM%GpW'+JcMcm-gu2eR+kGiP4cW9PE(cM:YMDMWUH
W&fU=YN:l2J$%gIt^7si*Ut,WgKApCe+E;qUCGjODFR0?i/N.B?G?(o_i*cOP@!W0jqZnnZr
&,3r["0rl3!oq&*p?2``9j/'.:!.I^gOl[Rf8\'?\*P#0VN9q*&ng"?lN>2q!6.]A-WQTsY>E
bja6TIC3%D&%)5Icp#a5fbI'Z8n9pn@_b.FZn1uT`(\:RAkV7(Q'XdV)*q,M_V/k`>QPF0)^
0Kd_%:mR2q<7Vbq$r43)X`k]AQ4OuOk-Z%Bb#4(5bX>/2CksZYK3Ac0?0%^)29=]A'?`HV/Y[F
;/RT!>`cN,/@S8:(kr[2AL]Ar]A\1O%\ja)/<jXsI1poPo(%%<A?(,qjW'<\M=c7\`FJ&s4^a3
B=K8I.f(S@:FGd;ec'-cD,(1)O#sA>Z:uCjI"nlaQ1Q;$ThdU*O?OdZ*I[*<B/R;/=G=;A;F
SCPY,"Xn:m[t+)XiqTph\OP/Q"NVA\*C-LjA7\,YPCqM`qPXsr<e)pn8\L^ES:J.Sij%.bI>
5L6tT$*h*B7IjiF#7QaBIC)AlQED(sQ:jt/JLs8,7bSia"3"tV55dsV=Ro.-E'[UR+2MIR+4
")LPsW)8G-51HhTB@QkBZMb/qmN\X%I%<-:6H!L-,cjD4djc:o(`gB[N%Jf>(2PN%p?CF?r#
=IGIqa,,DiHX<DDqC*[!VeaJm0.!2=-&.NV7!QAD_/olli!,J$7rdkOn[WcMA!qq*6NlT(TF
fhfV"j`Z"i.75$\sAp<$[g+O8^>[i.^h?0'SmV3N.1b+[_4$Pg^V25#Rqu8gXFYru'1=j"*l
*r=k]AKhVG';2oR=td2n2g(Lg,]A9N_[gGlm`Tc?2E-aFT_=`4ZJGrN]A?Y3idNb.DVDcS;ci@]A
)lKm]AaG`1"Y4mFu]ApMd=B?l`tcYXbf:8L,?MG-4(tpj$,O'5OB9$qj\>M5WT/romWQ466#0'
OAddRPD"Nca@Te2)S%N[>iF&.A2'qU.cFKWUan+9_Lp"nkt[&Ya"s`EkhB7da$U>'r2*Y85=
%=Bs46=<VV[GO1O$[Ke`OgP\)Yi#mElA-K_m;T/d*k.TXngFcnE_q(Vo9]A$XbD]Amr_5LT@2?
bpB#gs=/1e5,,eYFiH9SchhK[s%8?l-%EaPFhW\:!Xt5JZk3h*E%4q>X4j/]AbDX:2Y]A`&gF3
0p6Ws0T3[nF)s91mZ!Pc)kLC&ER+7%2u.GVk`r$f/LMS3ga,'V#1C?c&b/ej;mDM\4^YA7O<
lrpY+LjbJH25SsM8((SDS<(Pr[A7n*LIqBQn?QkofpC"bk>"J"O%+iV%;&48@W=SESLE/i[G
<i(jl/`tlA-OL2>SE@VB[@'rmX^W[Z/[\12kpslqK)nf[9r9Ea%/TO?`d^A\dkt<O#CZncOi
<7Kq*7)V)XVm<+9f,"=fiPt59'+fYcfReFYud1X[&qS]AJE88Uq.G]A;Z-0!FChk"jL.q;[TKB
!VqOlE`Mr&giU=!4i"ZmjC$hsZ#E#h8pA4'p"7GAX=n/+#1$&8B=oA1g#[CJpDs&Q,%Z/=kV
B+:95bg'k=c2$UWi.rqo/``<1u4?IX15gU>S[adpYQ$d1_*+=\%3p8Cc+1m6a\,G]Aa51IaEC
2t67T*l_d@XS`7g%'PA6gs)KDr5Ah*>Z&>3K@MX"T"!\Gdr03LVM9A%P(@!n6@8(-4q&_UGb
X"`>.<17^$\`)5Z<&V8ehYe&EOKa2#\Mgp>Bci')Haiu@gdtt(5U%`-]ApCi:R6fQM+*kjRJ^
[.)AsjTH*!ktU]A#a.Fjinf\!tf='/_7=?<tCTBoV=g\dW"G?=PIGc0WsIrPL$O<ZSg\`HHar
0f7J[`!@:2=7=bR2g'il!92q6D,o9/j<`]A=JTb^=MCfrM8T]A%JUTb?HccB:X$@%l0;+pi#ql
im8qBpEjg_:2\=59S'f.OsMB4Y7?d(GBRA-oc5Dq"\h?=c2A+;&(,(-eNi_//2A-2o.:Z=*;
4pm;[,bIqH2QYD'e6\61;*q'84CFaNMXRS^d5h(u2^*k*\+6/b"%Fmj+=OHRBd/EXDmf<jB/
+b!=sB@"BGaSIQ86J4eL.>;Ec0!4*5>1lB?%I;>MJ"R.X1PMC#BN/'^lEC)UYr/+:7@8Y[d,
#CMcTBe6h)!m/,1-nC)C(-)Va_%1P6"II:BJj?Uns;olhd-THS[_jCbq\mF/]A?+_huBm2.1p
IK2m"V.VdNI?WE#SeUc\bXWXWZ5lSdd+HHL2a=bcoh-Ybn!8_n44^2E]A\`4k1J?D<i+\k^C0
g@<I)Ma<^KgRNQZDZ5P:F+4a$-%1DUa3R54(@6WOU[:5$PN"FKOC,5DBtjWR>UkiOGC-+Kp%
D!A&L-\@N#G/TIY@oj5cAK_1[V`HX+&ge/sc\geeGX<s-`+B9@O,fFmlo>kSE#NVVl8"%CM_
nImGK;UtQ!V6-WMDQ2&f.gKOO-^CP]A^#=+_:=Atr+-4b`p/qF.1MZ:2N@3@0W):,h///?j-U
E`A1#D'V;W3lm/7.?!_F/]A(!U;j>YVk>*$.`l7E91hJ]A8OZ<:Jr1K.f"HL'6:KYMT+Jsm,\&
TkH9.;n6m)E/kqU=<!:"I,^%oj2H`C_Uou:,/@;'(mZPWNcc^:1\+CSVm,ocL#]A4q[-Kgt]Ab
G,T^9,6rSLM0LbZY(ac8s*5.(>"762tiW96%6):NX`o%EWKRq>s%OMd)O\gLW-W\C0u(1J1e
6\_#a''4mt2rA7/F8Du6%oNI'@DQAs<?'8$Xja)<TMdO,jWOG9o*U/EC3:%ZW_bSZYHW(eam
#1Y@0qTmZ@jaR(SYjYt1-2<(pL6_`4&>17.Sj8dh\'f0eBO^<KatZKmo@2Z2h;aj>Z0j9MS_
.3\fa#l*]A'&uR'$J]AToLm6>3p)lIjiqPMHZAI8O<837NH1$<\@>r!Eb`86F[Ga&a[377XZCg
)Ppls,8A\CH"&p31r@@-Cg>r'hT69oBg!5_DR=OHfWI/P4>0AFb!PoXqAI5"$5*sC**42WsV
V7eqTC?T,r:n>)?_Lg#O&L`Z09N80nFra3C5%U^8QWEb#*WD*%^9lXE+E,C?,+OHo\lo-k,5
/\!%u9$6\4XVW#r>PWhLda#'gPa:AB4P,;tDJfPMqKMT(.bbBMi$?o-p6o"KdD7oHmF'+UqB
)u5dsck#L8'o)2pb<P28-k_rq/=0"]A#7Cod7p5tn2tbqfLcm3-7YF4Z\QM?n6QCk;1r_CK^a
:R5Qpm:UWk^*"_dE87@l!hK-[-Z2BmSQ$/1=tTo5Z/,,3<?7V+o9!hkL6%OWSd*6QVGQT9"'
Tn&F3gFo)@eb15VoSG'#%4\=4Al?@.*PDcZCWq1/F36rnFkUo=_5(1MdM8P]A_eiC5([T^Y=a
>m*D5h0)%Y"Ug4Zr3l;mao]AI?/:s553mO=?b2P@;2Jk^q&`TnHVU<HqGlu?\-t\H=B0G=r"-
64'6sEBgU$!rf#'8Y.4)+NW[+r@m@+.`G\PnF!pJN!:4X=N<RJI6B$[-hDD8Oj@g[ilatq-(
^8B$#()Q3i^$bIfm)Z\KlK8ejVbVou]ArNd[H8[:D,A^o\*4e=H1QP_X\6`2%Tu%B0Fl;AUfm
Pd9O(HK:,YA]Aj"?]A``0qi#L@dZWUf=HUFQ^khV,.tb(*)M$E^IR@/qk3S[1oaD&e[>"'->S<
(*PbDjq1^nOclQ2(2#KPfA24d6Q`e4o_PcH4%O[>^[sOQ$CC'5jQW9\0"YY8aYeI%;YCU%bR
dV0S;G3bV^0#]AC1NaGZUrk8Q?4^-o3/;K:GA`%kFWCs$haEK&_;RF5L9Y@bM(!@9YpVnXAqc
@+F@j1A?s24U$2p+fH<afAfY=,-M0!VeE@C8kR7u5>3Da!:K,`0P/daT8=juAdlP+PMYkX_>
J<CmQ>GW1kF6hp[5mXEe!1'K?M:L"ma+V$U')4SKrN.uX8iO&0>e$_G.`!B!?WRD%8u%2^0t
,4k%2jt'l;V4=dtp"AQ@?5p$SP/==(7u7?(?fppT'Oi<ngEeS4*,9@\c%$:(&Z[nR_>t71(^
)^_:"LI4EF3kg$%ZXS)DEq7su#87F*QFh1>A!C"PiLlD&NG?-2o"St0Qin-<*Tn0Y]AB6Eaa:
k7LZJ"kqo/=>(/V,RZs/X(I;OZr^ES<fAu8E,7,"?C'1P;_mB-IEP8$u$V-K1XL,RL3iN<V[
U*SZKPl/!Cq@&]AU/m';.+sR5lmZ-F^5$Ue"r]A%Rt*\F-%>j7c>6/k%`.G[8*KVB[euf+EXGs
81^&2TdsE7ILWNF!))+`8.lDg9kt8iV8N`kV=P'tM,Lu`C6hYU"XP]ACLLa,c^rr>3]ABahXJs
1M]Aq%]Ags^/Gf.ERgI#*HaapaO$?ok1J?LnG+Yk;qI!S_5P<g/cVK$o[nplmU*tE+$k$pZJlt
L,.6uH.q'`-^L;>s5lA-gO:2Q*Hn%d'*qIfGk&&4^I2HLk642V'r5jdX\Zp;@@fH_Dog`r[<
t$liLL2mnk:spcF=$IoD=_Zp\K+aUnZ>E!?S\EJL<fQ>Y`5(HmJ+MVEfgC7j8LkrJBrF.7!q
53s1KA4P\e-UX+",ap!8AKN'N`H`aQ6Js#[E9Xus>qVm>%Q!oRVb`AYr4RE>Ne(/t"pB7'td
0[G:2r4*q.$+.J:Kn;\A-6#?YjZ8hiSO1kDo@tE%<lP77$?ig<fbc;9GIK'+KAhBJ6doC"%U
T'[@ef8j]Aq79Z!db'l>FXN>YuM_:i5s.No@WL_$:4#*Q1!f0C#81pU<ARP:.5dgI1i:PpErR
X,9PhFG5m"bEJD+onErD>T(@+**ssl;cfgBoL:CIi2'"D"1t@/,G(:A6#II0HALj>oO+HrPI
@$dgUT`XC#bU+P[1,bpcu=bVBs3s2&-acos)`1dp&kZc<lPntRaqo`]AWA+C,We[/)a_`"m[9
=\^s2^]A_N5IsnahI7rUJ,!X`?`J6PYQn,&o`9a?!_6hWdgJ's!]AtdGYYfaU/&8Xp^37Q9;o>
^(1IG@gMY^WcI7[i>8mbp]A_V0WhV*P?(#slJKbj^@BkP8Tp;==9CTfoS7f$b/&\HV[ibdQMd
A$Y"SStVJY6iC)E56a_0+b1rokX@&O<%J3ajCCIutPDK&kq3AU1qopnFaDqP(L4GNMgi^In1
*_b#5MMp)BN)!6SCgT^U@doYppldo.qrj_g]ANM)jI=ISW6AaP-IZ79PN4b[YlY)n9N<BB/UZ
sB%P-F1'N*<)Kl'utpDR]AC([lj,m:73='OE)*M]ALVB)!UnhC9o513HGf(Gd]A6+*D$O,Mnm3N
(>?SBJP]AI%\JcIbAL-]A#=L-UUon[Ol-6(.%<&_/!Mbk1]AY2_-?l!jI,/%k6kNO@SuWkOO/e0
.^Lcd:6VN[SdLalb&19R*34f7T'?';SEJ0=Gk#qkV/p,YIH-<,:%PdLo2@04kLm'<J@L0:D;
4SjI\gTYO0s,q:=S$6=Z-Ir=>H+nUT)bq^>SqbK(q3II.(n`TlkI?c"*4%6QhM'#@EaZX"9X
U;WIX=-+X:*M?BNBU.F9$<*/+d>q_D;MRp$k]AVWG<HHE"D_^ML6LGBoa3[<rL6LQB"3(-f@X
(VaN:T*7OMG">`r!H%^pAoHVhS-8kmdB=%A^!Y>d,W5hJ(-6ZF:5AH'Ig^/E3AQn[guAOK(j
\5!&\F^R`A?1XUSKp8O(+sg^^l`>XQ=Q/8oH)`Qlfa'FakXr:00DO)JZE@i+9EU<#b7_qNUZ
E+(C6U_n3Q1>+]A$m*[9BI$,""??V&#YNmE#oWASmeJCaPSsLMu5OXP\;'VH>J69rK:Bp=]Ae3
gmZDM0mLZcOQ_pi,7,/PY(+$9L7k.Y(C&?rlsLn)\krp^C?gY!=YGIN;V+lamXUTY)B42juB
s8,:-3CO^YCrj0Vta7,Z"FJo,ahtn\sO3GcYd[)ICHOUBr5M9iP;6[V@Wd9.fg4N)Y_2;a8&
d%:JR3L]A`O8i$:Rec07m0b!#\Gofuq`-&_N^"X5A[c&7;5+0-IK%no*,k4&oUOp%^^-fM4MY
LE\77K,e$$87fNY-^T8b:&"0^I*bo:J-NZW2NM(idi1+L1'ZI41XYTQ73=0Ebk")41Dk+$5e
n*RFV]A9`W?$>4;5I#f2\q[?>2d(a17+YqnL^bRo1\KgKIK^d:RFu9m_,!gW?&U!mf'$f*mJO
Z7loQRqNL"\o-$tK&MDfI'JYfYiM0f>o5e%Kc\30bQ[J!^38p"N7A@8b%S9cDHn.eom5^i$J
1V=WZ+qiG5j'*Q86E()5H9aK]Ap/3$4\[Q!W!]A`'RFpMT_[M=*TA#3qQV8-q;!2)$n3L%QDR=
J&1+aTr4C3cHL]Af#uQaHk=T[h$mF`d>-_p0&JH7$:A"n6fs2SF_:f+-A89n%s?Z_I'QXi5[c
rEo\1@]A'Ab_:[g5RBh*lIgDWNHq5_Z$0E`_GC#Oge@KiWK1&,8]A^4VY/FF[k__E,q"UGj0Sm
Jct,;iPCiY62)PeMYA!*5Z^uRXA1#Y#P6o,`(_8*JGc9MSc0-J0-6?RIW31%3Btcq]Aq46r^M
4fW3_>*T'/17s\.8$s#HjtRGP1O"1(SObR67)GUkCnE\sNjkB95U;>rWAB6(d6TVe$u"f`,'
K7on[-3<h3X1\oT:7\nD[2<PNMg7@,_1V]AVY8;N(BNo>'O!Bos?VNjEom(V=/C&=1,5]A=n(9
;7E,K\jThaAX7df>s,^>HCCe'GtnV(,V<<?[,UBfo2R2Ojs>ZS+UFN47%k:1"qcfp3+0L\J6
Rl5MR:/N3EUbU&4]AYgol/Np=c!8H[jR37NtfHhFqq.R`8?2Rlcc%eFl:Cmnq=PMhbt9SG2Bk
25Dc]A7@#*oekdLV"ZPfM;Pl@e>T%u&TojUE'<%is2!J#Z+T[N%<F4Fk(',&UkJt^dBu5YB%W
sQc6ti*r1h^olUd$SR:W#Jg#'A]A!"dQ\VZNc7rUG0Zsa$(3.Iu)mKN%%O#bt4&,i_6+j_j,t
/pmDb&T=<Ul)fG(h7#he9**5\^H2?ig]A^Vn/S:AB.B8N5Z:QV$2chu+bGJ_%V?4[Z$kl;44H
UD1N+gB:qnk%3spBl.eA^:Q+L2*;Chg64P7cIPk!/l3-1Q#VcQGk#HiJ6b"6:&4d+I/c9TDb
`Q4QfmCr`)#jUk:qHkE%-cCYpj7-n;S$$Te6E&eXS\p\Ap57Y6BC1\X!HYn?>A14^DP!o_[S
bQsD&^(O"els(!G+&YFejbAiZ*^CY1+W&R1Yq0kJIR:O9rL`04j11=M^L&kJOLSU-BLfMB@)
[s%"_;glppE!7<aeGdXC'nK]A,$Sn$PBcm%Ci`dMuEhIUpl/9arhndH3JWB7#/8<Jl'M<I%$!
D5F;H6k>6*m3S!haoVbKFY36qD$1&'K%LlEqgNsV8ab]A(j]AONZW'Of0BB-W;O*-L<I]Ad+I_F
Y/(;QR&PrkI:)bCE^BD<&)%iZnq.*UV-N/nhNWk3h@qPSO+[@/:Uj$a7]A[7_lA%rOlC4`YWq
Z8NBnQR-%USGX]A$n/o"YN)=bDtakh/_j*p'Op($kml.b<`#R,Wqc'Em!`a]AB:N7E-LY#LK%f
OH;N0-!`ef;LR_s'0(Fl/lFf0,HoNf*f7gjTLY;qJ"cTIj<F8K-.+/WG_N;;&',9\qtqsKT1
+)%&@V6.Fq;L,'6u1MM]AT>a$5XgERQqL3BAmFO*8:rV".$e&qr0FMnSG)jHV/(#U_4ch&_qa
%rP8jNT`/XN6)L6Sflr-b=7s5?'Cet0rQJIPa;hPOWbLl.lZKCkC+_Nf!XHR-jVp4-(8IE:J
nU535m_SYJQT-[#ZT;Q'B7)hd]Ao]A8\b/hbIL$YBL?`MjD/F4&@n8ncY?ZFKZaYjr`,C)iIL&
V7mgPX7Qp%(U`@FHmBBG5qb)d`F(V!g7L-58cYtnGrOGMD&0<hYEXoWN=?)"4$j\`G_+i(eX
qtIhY'LF'Cqs^"PeXmCA%)cA\Bg=cDW^,VrD,<RARSY1X_n1gtgsbL`4,$#Hh>N]Am^t0<-Bt
;="EnoT:0Ndc1=t-+(;;TLn"]ApF3=/m=TOn3LS,fHG?f*?/[oqsb6+UBmMrEEXq.t>((h`^G
YftHk!l<,gL22QS.:i=kYh4J6/rEa(WV2^i;<_CmhC9NcOq"/p"]AekZRO/B/AN#k.O20k*:n
pXF'cYqs.i@e<j7@eQ=jZb;rmf'*/4N]A`1>A")qQ7h`6KLa'?r9V$;RjU:;U>_SQ#lt?$5'^
9qli5!KCFh=*dom]A^*]ANq^a!WKa)6r!'3.%;Qn#_D>`HP\.&cpJD^=r6ES?`(j>;u0;ndWh]A
:',NJfs@%!9='*`SbiF,3/.r73(<hU_o"sidI_dRJ8%t11dZPWn#s5Z5NBYHp\r$!EIlk(0@
>^_Ek!9MT65:kp\JH[KuMHFs3c4Z?kV*i[AMX.Y>C'4#lE8UCl[,Z+`lH?=\A6XHT;')P/>\
HGF*0/V*<:ijpb[O/XqU'Wd1Tkmg$aH=klH!HssCbn?NAFmXWIE7e@[:LR3kFJ@CLj;nsUT1
L>BJ.sVmXqS=BF5as6%\'$3MB[m"Uf'aafs+T?i6[_]A#'$d"S/P+j,+3Knl2G<7D8.ZbYNh:
8Pbt]A4kk5F6mDjt9+BohePbhU1PanKtOcX_4IM/N4Wq7I6NXIboq7nJ4,S)c*nf+<H\_c)-@
VnJ'LRLaY5ND#/BFp2L^Til*j,3/k_STR;T5r_@FFlV06,RFS4R",/8I3a:*\7GGq=5&e2%X
C^(C>ci3A/\:#$RLlPTJ`@)juojpjQ3gJ]AYKNZcr#MbW`.(p#aCHXkhF(oHd&V4jpZ/-^CM!
=+*^Bj"1n4L+FAKA-$1MAJjc2/EQ(V@%D(o>)2q'5eHf+?DnQakiG[jDKQHrCBne"s#ZP93h
=8urpQP3VU;;Fa^KRufX9T!KLU)3fD`(!pD.j>dgbg<I0dLm_-6I3B9R$Vi$0.o<c4_m_m6h
M@A6o[Pl:(b\Y6IJH.PDCJK@1[,D3r?M^hU;?Xd.sl58+QmGAuOcO4?V_AC('K)NLf#4nB6H
gI#6W*-Y>4qc#>B,sre#=prTR:#^jkTI:MJ[IW4u'Wa7scr^:+Ekb*#b!lq`7+*WIKf'9dm9
Ac0SJ3!AXN*Mh?1FL%i[?A4h[mGU+>!irb'UK:lAhA$;pu'm.u*QANs,544.,fD2'<1jq;**
h45B?3i#6r9,<AP0LljfRA(_WbD`2pL*C-<66TFFoK>!e8#>6PDVg!G%`9A!1JqC5uhI&uC\
WS"ZOT2ZmTc*G*QOn2>+I[nu8\jK:Q]ATY$Gq/X4h*l6*A1jD9p5K$Mn?VTi$`gmd?)>\46^m
@FQB)m$\WOOQ3]AOa4LS-+=Whp+LM4#tM>dO.oq]A%QPS>1Pm=.;bneh[J3$?457ANYeRg&C,<
^6!=GZ;<OHZ0S>UZ>[G<7SL\kL2[bt*T;ug-j3L41EFSOGGDOSOPLB0KZu4Q41E%<S2K8fbL
.D&P6h+ANB(7\Sk"+qf;nXXLa(C_NMu")`HOh=D=QmB+0_?@\BCqtC0'%5-<%V-e9N%U/1^a
_Zi*Z]AgH$['*>rYb6(3ppE+./\T!nc=ZHW3:7WZ;p!?lUI[Q]Alt$&-uDp[ah*I4L"C8CV<V=
",LAQ&"(b9T1'Idhi!TmgD6RaF-I#s(T'NiT[Mg[T(1;T<P*m@PRI$Bf`'E0)7h%+HGDcZhk
pX'BTsdN!Qh%+XTLj"=4>"JE;'&-Tn;jhD@c3ST7mSP#1d@Dfn_c@=6f'&Ina&C!cR3B[AK9
R5WcJJ]A!2GL$>tVRUcPSERUmZjt3-Obu$d3Bn<a?=#Lk^R^^02Xk7adQ%e(1Jdql1JNiC]Am$
bCMMeM]A8ZQUI&B77,KNQjmM!<2TTbDC_KH"kHKrso~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="960" height="234"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report2_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    品名明细 (上级类目："+$b+")"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-8355712"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="品名明细, 上级类目："+$b]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-8355712"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-8355712" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"品名明细, 上级类目：\"+$b]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
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
<HC F="0" T="2"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[0,0,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2736000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[一级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[二级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[品名]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[利润]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[销售额占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[数量占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[利润占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[应收金额ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" s="0">
<O>
<![CDATA[数量ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" s="0">
<O>
<![CDATA[利润ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" s="0">
<O>
<![CDATA[库存数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="0" s="0">
<O>
<![CDATA[库存金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" s="1">
<O>
<![CDATA[DOS(天)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="0" s="0">
<O>
<![CDATA[库存状态]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="YJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="RJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="XBZSPMC"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="YSJE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="SL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="JSLR"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="YSJE_SKU_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="SL_SKU_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="JSLR_SKU_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="YSJE_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="SL_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv3" columnName="JSLR_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="kucun_lv3" columnName="KCSL"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[YJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="1"/>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[RJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="1"/>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[PM]]></CNAME>
<Compare op="0">
<ColumnRow column="2" row="1"/>
</Compare>
</Condition>
</JoinCondition>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="kucun_lv3" columnName="CBZE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="14" r="1" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=m2/(d2/30)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="15" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(o2 > 28, "滞销", if(o2 < 21, "缺货", "正常"))]]></Attributes>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<![CDATA[#0%]]></Format>
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
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<j7_;cgR0:/f8J"kp4[Wa'#2VoNd\TbU#!#sF<V(+&?%Q!,G1WSdr9(iCKua.p"A8Oo\QEn
Rh.VFWQg8E>p:8i9e*%0[.OP)']An+G:;H^]A/oQS9jNq[a39>3p1e4j$/+&fD=(-hXCF"mop_
qH96,Kn%;*\!!)LopZ<Rs#QRZ+!T8h#^[gpmj@7dKhZ?'j'C5YeqO\,<-Y8k%JNF*3ljUUB5
[>!%A\e\Ic``#E2o@7s\%H4T@@oY,^M[q831INCjgd7[7dGtN]Aj&F:[3!Ik6[b_BIr5/L4hA
V8`[c#_S349CQ*U,1;ck$q1.eVhBnmQ7(XEQ&lOIgAO(W%&V&/&?`D?nO"og"#Y$@e>\]Ao#=
FpIM:62`faHY("ZK,4_,\(fk_\.ns;VNsog5a0:q1ppG_WAU3NNAIa=6\T<P[YRMTDPXtu^W
a4s8!d$$)*cdaFdRKO>rVR`TgSf%hmOd,,qQXma<R)igl@6cp\->9:L/hq\f#"-OSLj&"`cW
%Y-mlq"at'P*bir.*V.2/[-E.F_D-.tgI?4ac$A=l^'HD\Q:GfSb#sbY?C3^YE[1#:$HdlN^
>>6"q1BBBT,2LnOZSBk1MQ]ATTsP2)L'nn\mW=sFW,/aq6iB?lB@'BPFu$XDVf]A0!<-P>51U0
'kFLuF-Bq0<DQZ;UQ-m[M#QpdF(Ou'FMd9m`OgJV*jfB]A6+<d0[J(Zt=BTSE4*QK_,lim,1q
BU`ZkK;X'PFAiPt/+*N)U*m6/4,jB#L5;_jfO7uPm)a:;qj\pb*_P7)MR!1h77m"ng7frOD/
en-@jqhV/?-$Mo/iT>h8(0k#^qX2PBLq6+%8,b?d&N12JLmn3MA:I%u\djj[Ie0!P(ngCI$@
Q#=N]A-4=@0nC`9@to8/6:HrP;Z1g5%O9]A/Mn@cfqk%Qh8b-@b+Q#D</eKcU:&:/:LnE26<$V
V`!3=u=\=o/;\^D4,AcGUB7[#CH(.0kEqd'LcT'om%Z;]Aq4P[kg!#NB6V0b[fcum_jg-ZnNQ
K>QHAFt+aCRQrRQr:CacE/n8q/+_mH1&!0"g]AnO"pTT&j`7[g*E1n#Yn!HCUK0j9g3h2a_tE
Ao1i1BEt[d[GoUh1?H4j"O*3P[`P)O5nPL,^Iml0U<*#(Q^3/AM_nKj+M6^slK?Mo*=]AjK.Q
u(`dNOW6:(jMYY1_Nt6dIuMl;ksNaW1(h+tYVg@!p_Z-q<r1qRo><JPbH&O%g^$_I+T6$U*O
RB5l_#km$g`9?'asqg]A\qkg/6D4khEnhVF-!Y]Am%:XXq,t'ehHnp&]AtpARD(9Y;\;#0f<E9A
.38J/<8Rn>C(!8(q3?%3D&JS[:#F.E8o$4!&pRh2.45,)Gd`^l!6(7i6X%CWgt/\C:$9FE79
Q/%1Q2-"4B?#@6![`dm_`f]A&YWm??>AWFVBQ(6e1.&AEVTc$)m!.N:]A#^-gPK.&"6^76`%<A
FYe\gZ3?6p/<a&X<hLN5hfN>mP95a]Al)=t0IV`9dm;Im\YrI)&VFb!)<d^K%)hmn:o@`\mru
rqd(,"liOk@P+UE[8ilW1=J>Ol$lkGd]A3`O>I^D=d*E9u)R#0sAscUjYHkO@tYS"bS*t:g")
jbZ4B%:8[^L`\"an-?7f5h_,,<T"k:Ad5Xb\h.I!2^^!,Bks(a`)SHtnebnePjUY_=#'.rmX
1Ep^]A%9*/bj=AFEPee0rI1H`.MdS]A0cr'KFACb6>(ogiBd8J)Sf_J8@Se4i=`,`pObFl[8N#
R5LGJDoY-nmD#fp>0R'k!+2-bO+=U)b[7f1i5IBB9W0Xo528nJC$#Fl8_G@0N`IMrt<3MP,7
FedhDm"RWb>?3fb,Vd49UP3pddKNkX<2$]Aalo#]A>MNF*3i_(d\:j)jDB@^jbXY*1]A`>(OiX]A
Iku`UO:/Hng+M\(e"u?OpeAO$m80;?$1TF$EbA%P.jR&q4qk32:"OJHXL4mH`c6$?fSL!>P`
L4<<V"=6Q::G7]Ah=$o(K2-7ee2o7L=<#jXDHW>7.-Va?&jG$RBV+:GeoB)=>W4K%+V[e5<go
Y_VL"'U-7]AbM`l%F@^\"-1GUST'9\*!>.gj)E4b:-gC%rYj'Z^4^"`RW@sk?T$D,]A0lubU`J
hFiIt_XZ^;PqLs*CF4T?r;pGU(lCZ=s2h<%RMgVE(1c]AfH;pU/7BKmqAsS2&MC"'F%^J$ilc
<b:6p!Zmog?9M:]AAmBE%N70;*i^nS(Iih.731<_4TFOdiMO$&mhJV&0&i242F?&(/<_K%=('
W@_=',e6?s(J?PC9'4k!>k*e^0PccM>/E+(f8p*n"l2\%p;3Am:2Z'a_>EX>8$tT1sZ^.]AHR
e,\dr74;KI4EYP>'qG^DiCco.m]AF&?K^_4q[>jK^2e-,H=0.@WrdA<VlDJ*",?PT0:S[F&Qo
X8&"6`L+@2V>W;/NE4h7#o;$fpmX)>RmcYXFm8gebO>.HD0a!?7AN\me"7*3rU=o3;"K8/JL
oBac+UNg:83$)0;!p.;0;"*5bpHp_ZG?ILKVr`>Cc#)i:>rX<6@CF;`q"`'OuX\Y[ogm's#m
;/B<)6A\Nf4[`fnOn99+ek3aO'gmC"H9H3<6-NB$n>_r+4BBNc"Gnub?nZn.^"^YO?Zr6MU)
ehqp3#$$cItO0;2fY3"C($[C:bfJLSZbT2J,N*ZHcV)!4N1M-<NH*jFckegD+9F?o-i_9Aok
uUtoKbc&!)G')^B*X,\MHN$\]A,a_;4YjI21c7%mX0PE(LEeeq/ZRI?rbD:RCq7QWT^>9_iSF
\V<aC%u62`*HHX,ONWZb\0%3RD9Y+R!RM"QjI?JJ+Qc8Ob2W)@iS\^g0jG29RO/jH.RS?0Z.
lE@qmB0&(@)V9f#8d5uZP2T6#`X\-bd1?s"gXlaqa:=bH9A4<B!g5oJ\O0!BFXQ!!8'W("T`
IjT&Lkn\(;=YPqDK)MKDF9'Yb=J"rq>Y\5Ml>^87YN5ioeN,[Ved1Dq\=d(.>C"f'-.j&l:K
Q;5YL52^hdk_A(U_3SMP)2g2hs7;]AlDAP,2<#F/nngs?Rj*=*8H@BicgrE_h![)JO#a&]AX6*
YYr#:a$>!*c1"KfHFu-(pVCuA4;k!NQ*S:Q_5tT(i6VFR6iUNdX&nb*SSamZ\o*(<:_V/QeE
<GXY0#6%fTV)V0?5#<,>.9(2[Y;'eO;FdPGp9lgn403@er_^Oa;Iam[>t.k]A+QO?cN]AC[H2p
;X%9PW8U?gf@5L\sI+\?T(/VTBX8b.#*75H+T(073Oh/WX*N:o@Km1RQc.r6^DmFHODSVA-\
OY9;S)+4@BOXokXe8?C1/Mp?C7%@ZIW;W2rE*_j[q`8e\D4G43:T6?o=j>`S.fqJk@9o40/G
__N4f-8Dboh5LPuS0jADG]A$Cl*"1'`on[S3mMp?(7=O:O`B:/R&CK%;4]A^!S&(&K$,:'Xg%4
uh_0UE5V&6&H0=)<CW#d`m))KoI\!gMSX(2&FX!rtfZah7<J:8cVl2c&26U'dK5Xjs3;laH-
kVFTp,XK>bQ\Z#6#A9THcl8#!d4Pp]AN$fVmum7)B(jom_aKeda9c^;I-51+PtoLaG]Aiq`8A)
AJ'"rs2^:Ir<mP$p@=ZFZpmQ4cj[uR,r0(j.]A`0N3j.ocM#r'Y92PJup8,'(8.;4g*4^^rbH
4gENJheE.H8VmV5/_-;0lK(()o*]Anj>7M#d0V#OQL#tFr]A-_#^XD`Q^UJ10i:Pf%#-Sd&lMi
E'PfMriZr?tC[oYZZHV8@9.Z0@fj<hkfAN+iTDenI59E^UWET<>u'X%jbYdA+;I]AH^#]A?,Bs
c%UV=VI+gauUj1^m<1r+Oqkp!-Ts8_bUFU.I8\teg=6L^%I[<9mhl2gJj#osF0%DFZIDZE.b
RIj#<O/i)GD%]A`caHd+1gP%_O[.d%DNpKH[o?+.n5/!R/DM`pT94"\X'RW2b/o_2Q^Z3fAL(
M$!V@UVqlmtJgs76_`a9As>s-?o(m=knn,>^^FsY2$jfhA,>UH_FBKi=^>u>[^k.LIAP/VQ@
c3u<SY\c-p1Fbgi!'dUT@sA-VPOQh`oYd^T1*t(/ZQ*R+1+p0CGga8`>1!nL(jeG-k;8=rXO
Ys?l=W:"Tj\i0E$)IP>Z,6'2r;=6%kuH[cLj\U?eBDU%H+:+TP._P@=21+/%eh]A_^u5HI$gU
UPLXb'?;u@hN2[\Wni2Vh/e)[h/=cY<YU$K6*aOIm%2^&%<,6j0-#Z6h5+Ooh\YU"PMk7Z4)
pT3SUl)du#Y]AZpG"YKi0h+qD-Q8%%e,j\?UsU!m0F0o922URj>?gK\nWgc0n+5:kF=ZWH:em
Tq`)7;N*S4*?2_o8u<(HS]Ar%<bk]AKlP"\Z,):gXeDY^fuo_pA"Om]A[3:@(`-PqGtk:]A1l73$
Gm@SEA5++q:56(gj$m%3jN*k%8!6qHp5=.3@$:[Vq81K^5IS5?*i4.Jn8`?m>=3/.5;T2+pP
.(LJ>]A^B#AJ]AsgY*M0QH%&$7'\/a-_BZ(a5i-WC&NL7\nGso[_V(n=<LLDV&4b(IMmYY1>$7
tBOR3mX=2KY]A(>VX1CC5eL@RoqDR>rpA]A`(sg>Wmno_<EaoL\08*1!uC-X(.)k"ko@8!*GE;
;sqMMn`d_e^78;]A%Yi=9`^#*L,eJUC'.pVGK-%,XN<QJmo,-[MLER#W#"!/g_SLl-TFRR`J0
dV._"9aLVHlHV$J'KPf!>t&7rAb^5)]AS5BF&Z5[r.lYU%n\pl=X*=qF?Uoj*scq'SUr@"Z^L
N6nlnqAegogpn#&Q)(NJFmD<!-Xj^K9?#QbQ0tj5LN*Wf=R*p"PGQd]A-8\`aYdN^PaWQ%)l1
]AsBN+jR-]A0f`VWS^]A^VAKp`rseK4F@jO#b$hbp;:l2(EAG\.;eNh_CQY:Wj'=fGlj#,h%rUV
(\:Mf.hS=s\RYU]AqS,[61-W>.:G3eS=R"R0pk!Q84bh*;dn@Yp6!IEhBq1BM*Qh-[E12+2ne
CPlU)DO=VT?!F=2h8hUT)c^?Ja$Ho0QSLXiftirFZYoS>NJ)j/A]A1$DL>iRB^]A'?IMQ:@GMC
sV'jlpr`"rYRETmi_A`lo@8:R)r:NRih'S'rPNfW$o)7daFg%Gc]A:["<3lhn^[235uP%<L6@
YPN3<C@c9Q]A.ha]AIZ/cln@6[*ek$%E'rZG?0m^9PPgD0?_E2;KAJJjBPO6O5G4!ITc(;7>#U
j_?W7120:CUG=D$6Bh>)'9BHU[i2eoAF:(]A>pS2Pt-@Dn:'BQ^OKUa/uTf%=^:#b&6bu%Pl:
P/&p.L.>RJa[I$kL:0Ei5[5bnD=CU-2q%^0n]A+Qh6'`Bo9(*nUfH0SmZ=?^^3%qS9]ASd0ifl
U@\A>F5j'*PUme:#c*d$2CP/j!eTS25cj==Z_%Y$_;1)aidf>_JIa[W*``#V0ho&41<\3lR-
e8j1G6f_Q5!3iX!Oj$X&Gf90;m/E@s0jomP!4du$BD-cr1(M&Rc"U2r:q6),FF`RaVDp$I@T
P3gb39j!#/'tK+E"M']ADII7:u\40pg'E//4V#1Gg<Gt:A['ANj6YN%'Z/R;*,mY9s#1f5UQG
1?2M<3]A\=6=m!DE]A]AEkU7_kjePufAicj8&%';JTa9h$FB(rtOe!d;mM7qFQ5fQ6$h-ib-@2N
0kClq-)t9\cq!V/^pH;Q.q?5?>]A']AIul_flOFl_&UmjYIX/PqpV!O9Lphjg>rp<uU-H$qEH+
3I;aVetu`0-i;PC\8\KGg\=E+i1esaBIN(R^2A^\]AHDgb\1A.WAm\B#l>.%o%eL>IF^[IcV)
ZY8Eeh8e?AIE'MbJZQoM"tSg5NVdh4rGm[iIp:`W33c30=8RF1b.1F\pdat-s-"`VlYM,u_j
rpASS>SOR>4Z1PM%^!U[@<]Ao9f=P2[3;b.>@gkNcg"Q,B/s!o*6LX`p:GlfVCVa<.FFT1Nip
Jbh==j($/RbW/@eLD+pf6E(6Qqrp5$=r`S5UE3cVZ=QF@OUUXq"V\k4%u5-GBBKV,"/`eLTE
9EaD>8bc665#C8e%^ReiCID_k.b:>`u3=ZYCiF^4n@5[8JB'H`#\,e6!%]AJt,2C2nm[@WTA/
d-c[dFT9s/30!=EP)3P?SG_$a4AQ(Ll]A;O#V*gUd]A[W;-$5H)(D@fYl<!Yn!+2`#>U_EMQ.f
!&BqO$-`Nnf>_?,WRr)OsLid"HgUtq8Pd`1N(;^K>'JMkMe&qlL#,"KBGAsu7!W(sVO@4$fq
QI7"tiKloc75%q`(]A#L[MEq%#]AG@Srg;ouX:u0Z*j]AV-4;EC4.rXFnsoIU3OR(cQ,IT7@M:l
-:[X7unmB+4fo_g9X;0*hn6%)Iu.0BidW&^<ADN"LVN[b*WfPT$Prc\Z(`@CHB]ADD(F.S(r7
WjttU+F820o%)=R$]ABicVPL5T,qM71r.#K7eY;_pTgK`JJ'D]A"/Qgk6Y-A>Bl@,gNhji=Ire
"Ii7dckQ7rT8Oqj'1&9.-VRienUr882(Tp*;:C\/pU/^37/u_N8.*L(k()bkc-mA]ANKY:l$)
-_\RG3`FdFNaHgsVBk@Pm#%\D]AgnMjWKEM/lC\6a0Zi-?I<k1/ghH7$4<!Ikn$cO,qMLU'+K
3Hl.3JEWNZ/A&5UfWR"?cu8Ab:(*$`T!PWlO"A,.c>[Wi)p#TV@=+JlS6s+br2IPLjg!*O('
+K]ACJ(X.RFOl<iM@)<*#Q6sW'nIZ*d^*LXLTo-Ll_Ys8,g/#UJt(F'tUArcND[o/D,?D=^@_
i'*HjGl]AdRj11e[4Yp^!HVrn9e=n'E:/05XK^kBi`pGf7NZ#;CfcLi*$L@VKu[K20S:j)q$0
&Hr5i00!)b^)!P+4^/<';^?j40raX_Sj.Nd!'Rs$_*EUOcQda!P53qZUfG>2haVB6Wsp0A.n
6GU]A<H:gU3Q?QPm9<[;ieS=GFmS*bpYf9tB1Ta0/P$)D?,H51_EV3Xs*%<W/E4-]AcNU.f3Y0
p8]AVG2h`EkongoXe**iLE,80XX29iO148(IHh9G\IZ5!SDf;`TAgREl=QGSE'[k]Ato"d2nZ=
#fDQ-/YBi4i_AUY'KC=8ZB\k4b[D%VI^[XPlS6a</Ti=n#,/?g[!lI.p'MSfJUJ>)*!2q'""
h?(6RV]A!JR<is#3X@?tqse2`<c$QQ3VHhu-JEF]Af#2WY-pVYpN&og_dP:/Vo6qD_)b-MkJ1_
YZd(lu#e%_'u&\.'fuePjY`=.&;VT]A,#fN?Qo@rE6k,nNOO&j-YK2`2D;GX`&B=Ni\l1<2:l
*A8.$.d>]ALRs'$"g3_mOlAp;Y9%hpCulm=&kMIbXr]A[%&HHFrX?YY't=O/hdFSPb1&qk`0bj
.00R9e9'A-P[;7=B=0_B$gj]A$@1&l&]AmfNU`p)/4AUL#FJ&;r>!WHnDH/[5Ag-<<#k@jYQ9%
F!paP/4W[4b'V$/F*=/J7M%/EY=57(SjLT2YYF'g)"-%rZ[n?'QPn0+aK6B[*Q3Er6lP),GW
:.C+N[=@6TpY7/a%2E[eAh'Vem6IZomA:@N?_>8lHS`_L*h4JtoCH"G(rph#1C$/:\\IDtF-
gG5'j\Zdp,5Mb.HDWo6!XuUldrs6_<jE\<Wfiumr-%ELGHGpAglg?8Q\VeVr7U,P"Urjh/.[
UTlt7ip\I\8"dt)GJc'G21!rU]A_\ueD/oT2)_'8L0E_&Pd,d@.A*$fdM&C3fElF2U25mU]AhU
<K`&d-5/']AgI=iX,X;;U%QS-/J/$0Dn*;Z/[%%uSAW$iW:NuE<kKm4^K"(n96RsS$#DA$9s(
`3$bjrX8*.te"8>5I]A+9PU1ZL?83;;Dg^W$d)@Z-MULCJU5.DDt)I`$@AHg.Scl1H`\#4N:/
Jh'*UpnN3X]A`nr7(O1OP8eiJn%^Uk)7FLmU!4J+bm^HBVe]Ap`T@\`=c7q^ESeM*makT[mlSP
?L=jnhVKea5Sb8kmV[a'L*.j76@Re:u/h^DXYrXU>"TVje2!Gl\[^jr#SH3Y;>Y#6oki')kC
>)aR]AD1CH*^:J>HD58ibP5;9Z:YoPG5@DT/63m9S9-h(n`)"'i-4gq4e>8[*TR?Dd/UEkGK/
.r@(3YeX[a+tF)7SfnO)]A&`!>d:A,naQ]AK0n;#q!8[Rg,iF>qY1eqUPl%0=M91'R<5(YD\3<
G&l4XhWK2'DbdX+hP4G0:e,NRDp)V\=-Cg5RD`<$0GLgd7[NG1'4U>A75_:9+[me_S2F5*2h
5L7LNuJHe=FC2`SB&o$uursa>ASBTO.A1g$W3TU)&c"fhhe#!treHMu2&hH$n)4)&iW9Hq#O
SXU_"ZYpHG@iT_7[bDCr=nPNeuS%dZSG:37b"*2SXs2u\abTfCclQd*sBZN4#VA9?N[&L0pO
qHU?=NEL=M4A6+CU"G)oEX?R'Z6)G@eIQ2tOh$94WBaLJ%1bF5#E_X'l7cV!)+P&[iPcUqbF
V.V*1)to]AF`6^CgjO1enj<ZIGer)@&,\Oh]A%Mn)?I+_F5lJDcm"U.0lj-4lSAo$`KaZGgKko
t1#Cro[L\;p/aML<T"7N(;c0W:)L-AK+_a>j'78LI[+PHCMe`*U^HbXr8j.%i%p#RKEPcPls
SqAM9PW-W09["c8Q*djW>3+kD;mr[X8;I?m1@chu/F5>cFW#G0NU/8@u:6m8I;h&hUhuD7pp
N4&*4_(D+]A(Z<JdaJ?ZF3V<a\!d-SFAok"[UBn!\FRtmXZtSmODo+9<b^L2p<8n3E(\+Ui?_
TE^K\c'T"/uZq-6ZaLT"e_`-B/f$nn*,"#[]AKE$U=TDm$diA#G3?Y0t=;=.L=-,eU#:4nW(d
kuG%m(('#\qVJ]A<_ula\BY08OHYEqQfpNhTmeMjs5MQ-`6B4c_=%B+d_-s:aDeXOPepF5o,g
%Q`8O/E>NMZj/Uto3D#c<([%80F=E;Z!G$uQ"F'gX[_Ku#k%RpnFL,ZA4VQ\d<)@3//,]A<=U
*NZ<lJ.sXUV1LAmQc63J#(7.<7&kCmUIa)0f>.p>8=8k'+m#r;u_k_U/^9/;#Xt8/PjCW\+,
"eT(j;u#t\]AY6(fA\g72r$isZB<<k8fU3&]AYALB%@VW5ZpEd-+!hldN))"B/&lV\A,s1"E4-
;skoXnL=\?Zliot@(:5JlfeX=lY[I.+U1Y)bL(q'5]AFR'&nO[*F`NqRjRG'&8L+YfCfhZcKj
(OHX*.KYRS%T9rlEt&7]A>=D8-`M1u1VVO!3pp3)p:FT&6T0F\rFBqk^_5<q7<1E3ClK![8#!
TVj_74cQHC/*s"lshjXm.j7#"3ic5J"&J>R)dokD,OJ+IN@FggW@iaprUf9C)khqm^n80rW]A
Ag63u`6@suLY/=,c<23Ahi:4WYn8ssbQ*J6J:jfYCL,GJqoL!%;.Xgf2QX+VpXnTu>kV?L:P
Fg'_.6mMGrcnPpAjD^8i\9T!7[&"_G$qmj3dL_P&.<6rc*P+OL.h99\j+%Qk@G/187N/$LE>
M6?\`Rdf>',uiD'$oe[K7tC_e6RMDd\t,RhC-?D&*@JK&37LV[.RA:9/!Sf%2FLbgn^:"5`t
9VXNe6WY9h(r,Y/_C<Z::bVgrE[jGg]A@agJ3S\_s'U5*%3<-FM>ZAF]Aatu+65Ykbka1bt4Ek
F?)U'^KZb'>Iu>8UHN?K'o93N[Ua*k02"B`huI[ou(>MU&_GSX9SaXB;haA4F2U5+(@DD\i1
k6]A,c::94q[8$>Bl?f=79'DkLFcrHgYa_M%'V=sl9&N@NB^K@gP2V8APnBE8"]A<cahLKmWN:
J!oW7C\N14nDlOoD\mW:,XU<`imoR22j=sZ#;uH9,Jq8A+%GXZ@9FC&njJ",g\.P/_8Y>&K]A
f>MX#),TmI5UBlGPDQZGm2WCHb]A]A,bO7Dm!WeIt?aLF_"PKhK5Fi:n$5hR#ZR]A(00OTdDiu"
ket_VprM`8X?lrBJ]Af9Jk=k$.d#32.Co1QgU-lp^+.0YRK>(S_Gh4[F&QM4_2n@I&84i;^]A3
I7MDr/\E4LT[en\>%/Ds".pg[-gmKtVZgqt`n[h_"SO+L.98c[3@&j<*KV\e"eG'0mTa(Ddm
Oe>G3Rdo>gt)Zd7RDugn+-,hjcr-aAG=2iFp!N9sD%GSN.R!JCWrTa?7s&6%HmZ)=:Q#GA@k
4#uAf!#)/>5IYdfe6b9p;suY#XaNY,4/qSff'u.i,pD]A5lK8hRQs+9@ft`FMt]A%N/iKMI+h7
UOYWdHq'/UJMK_?H)pZqk)dsAS!s-/!3e6&dobEKF<*\&Kpa*(>s3M$Id@G]A34&"SP,?L9K(
I`:'X:imaAPWJHfHfi)tF8N4nFBr.h7L6pA!W2G9\f'88HHJ.\C3Rg*oe4NM:qM>?[[J\rcZ
Is#`hD`IoT"*u-TI_=ES.=]AJ7!U(piBDYH[C*6hThIsb$r!c";B+"q"7@t6U_5^<r#/_#/mp
l\q%K.<VC@E6Eum*lj8[U?I(eTC&bZoQ0\]AcGd#[h8TOJ_O%Jl(P+nj<S=Z<aV"Q!0$[d;6f
>oQ=e-k)g,<oPeFXb3GKEtc-icg]A+0d#r"/F!m$)Z_?.E2NfKT\"uN7j5Yj=YT;t#El,/6h2
%JADpfbDF;]Amn<n5R&edS0kc3GDnXOYk=W`d2cgL/2e..@cq89-&G-mDDj7Ug_\<+I*0(0gq
VfK>9hm)ZJHf3:I&E(kE#mk%3g\j=!%,/@g1Fg>O3W."n+'L@<Oi6"dkc,melhmXsVLfn),"
--gf`t+(Y3Kj$%+1)*??aCMS48UAD%*DWQNk4U*"W(Y=+H)?KSBJHZ*B>`-2!(>FN5iQh(+E
[LR*cSR!8q_2tNlLBk"7[A6d6ZFLf.VY0fC('noV)N%a#X!1Wm6NdBbX%P/BP>^B,7jMcJFn
b=E`?CtT9(%^p+g#-]A2U@tM5V7k7hUboGh8L4%</F9)A,A-P(]A@f=)hgG06GYdDh;CT*4;M9
98B:[clppc'-Uc%ciTGe\&'X&nEZ]APOZ=Al^)"fV9?aC%V,P_+^f_S:Xc&^23@?-"G"=!LU^
BuO*N_8dkFURWGV"t1rPFM>O6e)#ilFl8f<iP&+G@??+4&"=G#T:icdLtT,A79b`s`h6(K<P
jA&6J94_)88KY-)^W@;%Q6O(B*A^qe+931mGT$JnSR6=$PL=\?:+A'4f>d"YC778!cY@DanO
JQJX0!1fJ;Dk<);qY\D=<4:Dm1q1Ql^B\A_]A"Knl+dKVg))IF1Sk'5-*N[Nd1&)B<lpf'2Hj
gjV4aS=`-EcQLBs8P?a69MDu^bG^:lV.C8LCk0nKOA895N0`m"q]AnWfW:U-HP^B8crF?M69q
a`W@06.70#b*hFekrG"M6NUs_X)q^i*Akc&!/OJ"^iK%)=>8$V2BNs4[\5[]AWEK,irn]Aft:U
NIi)C5nCu#B+U88)>HW!H/qiLm"LE5l/FL#@o#QlJ4M^04@G_2om(X3Z;GmUj*@\fh!jN-)>
3FtO!1F>D7c,j2b@Z>GPa>&Yn8?3%gM$&b?^`rq#kOC@_:dTK(>JaB)eZJFVWopok+9(HZ)5
Ts!bK@HP&N62rMCJ6e*Qlc=^d:9uCEcl#i=M="fj^OgIOGKuE_*5(DYhI+l"i7$2up/943-L
G#*G*fqQ+Bb)V)K\V?c@OZUgF`[aYHfX6E99tu79.^IkpBM:3W/o'kd?A.b/6Tu`6`sSdrgC
(X)J'6g,E=mI6XKpp9Wr4Jc5Z7jgi+f`er3&1/(Zq2iSbA/g".f^M55tM2_P+f]A$a\#/(Epe
f_kfl4)&g`Kn[]A>^6Mh<mh9V'jE5<8acfQcK8;I$mn3;A#Jap2:*@"Z=^7,Xo*-+qhu+85)l
S4ZqkXP.AhVu%,CeK"HDD3Bc#trrQU7Y^ct-6A$28R`jg[qoI0Fo[4=W;\c>,ZY$)s*lqfqh
UpDssEhfcp.F<Hq4*I&k%NhU,b\&NdT(/P`H'Ib('a/MkgQ9A9:O)fh^5JBtNB+NgT`/ET23
@1'F@TMU,s5G6fZ/HE_Zk5cFVlrZ!,+rW+h`:!pbW5:+-P^s2c_G1"W)=\4UNLoBOD8t_X5G
BKR`La1+;a=t\[n*IDfInf$235(R;I05bQHW^?CfhNr>@o:fS'HAjQjW]AoSu?r*png26]A>`S
G"ff]ALd2h?'Mm.A^^`\b52D3G!j]AfMEa'kI8VfM6FX$bY25C2(!2UM5eZ_$#O/O+"MrM8P@h
JT/?&<p>I&Z3UKJ]A84p&r;*eFS2AaSR&(8Usb1Ca;aE^b!&D?lq2`Dbu2D$@2-/Lo0g'BD]Al
=?^^pDX/9WJ&*E+>e"!c?5o%R,Fe%MkhKpa5o'nKMam<XaSa3Ru.i@M<.i>1')o+8VqQ_o1?
LE&VKJ<^fIe1T5L6F]AG%6JF5A&>S?N[%*l`$j0q+2@G[SCqk*geQU`qB*^g-"/N.qg\OL!B_
6>G8tfh]A_BY+EV17ffm'BpaPJ3S0+\*A;b,5"g&:cn9_k=2LX+iUi\<YRjepYPClq!P(\aEi
e*:'L8g*klqb?m#q[M'qoKsO9#GoR]AFq,GWCEou=Sas3'<7kfZ%l]AsCd+sj*&$mX3?NIAs]AG
OSdla_M1Hd@mZfN,[r?P$H:L::*87nVeV1l_LH1[cXaHC`=s_^7DjR31UooS*E$(?du;Ws!7
d?:T!h:YK,Eo%6;O%[&1gG+Dq`/XVDWIe(NT7G/<^htQ"*nArKmkTLC;iZHL5C7m#,a]A`(A4
>'p%hKhJ+LY$!#kb6=TO@kpcE=3"kdGf]AInT@jl0]AIsdHe:NZKmX7^/GBW%Of+e6Ti?;Dc(b
?<KN`?rOLj.]A6tfk58=k-dbt!T71Q&]A#95jNN?0^]AR?*LV-%!#LfN23Xm]A_^&b7&`q%RCJr'
e[pnC3YePk^:8m8ouaMfJ#6o2/]AONR%jIasE!kF'p:?G[QX:J_7sdS1#Q^L)(7L'Q!TI^&TV
8:nM67q5o7tHM2H[e/5X_Q^;fEW^G;g\o=K,XiVZa1l*1*Hd)('YO?srk1?-*U4i@I;c$a<c
)N9h]Aa'q+0L,/NP*qJBkTJOb$2f*YFulfXLL9AT)qP#8"'@T@2QbTRucIf+;10)0W\+HccG0
ND#1.0F<n6:bas0J(XWJhu*l)<F-eVtF*nk&(=4fiW46C,r\T9gg,UKIX'2$nt*L;c<IEO_1
]AbV/B0_;FCaQiqs-U3M8nqUhFQDL<.Kq=O]A!_W/$*a'kibAZV3=-&"kgDGu^-J,<WWeA73!f
01%?C+"4/Yc@G+r!?)T[F-+gl#]Am/BSV>'_Q$Pr`1H=5b1afbYYH'cX#;fWmTE-<0!i>#b[l
eJ[54f``Z$;Rb!R&s[.SZh.j[pak)-@j,di6An5=9k4\_Y<M^]A?J.Q+Z[+Nn0"k<\7Z?r,Z&
iR("R:m3]A=2N&qkT2(%Pea3Yh/qL[Aane<_ro8E'*mJ(<i63W8%X=fY2L>";P[IuchH#*[ck
iKGU#K8sr/;dp;BA@oJ'u]AgE_&KbMT;:AJ:8#4YpRN-)f]A<nkY!)LmFTOJA4(4L+oaZY7bl(
[:]ARR*!6W*TGO!Qs*5]AVWq^>j[T6ieem<@?$1Iu8kk/gU%<cD^ab#5p[3;[.ETls>P%A$8H_
N[:?gUn@SV^MB]A4_2H:Xn:i>==F0P6Ar+b7lq[;YbkHZ7hpsrcD6!;Pht@8R#9.di\q0_#W_
NC-;fBDD!I.*0)d'ic<^OLgW%'aUSj26m72sgd:+ZAXZFYFoKYqD0]ArF'/6i$dTnDI:S?Un(
m06\9hDQ0=Q(8>dB7--\Yir]A5m(AO.o-R-XKM0l+O)&($UaIU?f\+mp8]AT4KEc>ne),1V$Ue
R;\oh[:Gl`;fQ[eY!Oi7N=AP.Ba;jkFImB*2L+s6fG+l9]AYJF)&n;Ib`>s!5oMIG+tFSVn"p
'Zaj7-fGK1c!qMk_ifmGo!bXd)2?@?=7Tj"`)WJH8K3U@3o+daa9GL768Cqps%T"3dmDUpse
"3'hHQ$4=r'If_V<g`X($ibnE//%RsGp,;oF?#5V$6!RSh]AN2cc2E>.o["/`NpbKZgZul(S-
LI-o[_2"D$JuWcNCGI#L4g"'Ck@%Q63@Oce4CT,Osdrg_a0-Wji\3'T(&4D:Mm;/BZnadO28
jS:('N:[&JbPfuP-U\Oqh;.-42=Io<;qk4F/HJDfsoD7Xa\sl4s@6?RG(Z]A,=KMBK0'_*dp@
$joO&Gr#,XL\!p%=sqAE/'%@"e*)2![sT)GQC@or5b'DCf8,4:\@G/ji;OlGg%YS^H:qH$m:
5-Zh[L<_ZMaj%L84ciX-0ei2/jP+t,nZEDW`6hh*nsYg_l^LW:iMN()D9H,W`s-/co7]A=eh.
h)`a1hGo)+*Oa;dA9T(-31UF/2Z5IgLikYV1,D=?oXX?LJEO7V:#[8?s4<Q$s$$~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="270" width="960" height="270"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report1_c"/>
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
<WidgetName name="report1_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-8355712" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    二级类目 (上级类目：\"+$a+\")\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
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
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[0,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[一级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[二级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[利润]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[销售额占比]]></O>
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
<![CDATA[利润占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[应收金额ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[数量ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" s="0">
<O>
<![CDATA[利润ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" s="0">
<O>
<![CDATA[库存数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" s="0">
<O>
<![CDATA[库存金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="0" s="1">
<O>
<![CDATA[DOS(天)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" s="0">
<O>
<![CDATA[库存状态]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="YJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="RJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="动态参数1">
<JavaScript class="com.fr.js.ParameterJavaScript">
<Parameters>
<Parameter>
<Attributes name="b"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="YSJE_LV2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="SL_LV2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="JSLR_LV2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="YSJE_LV2_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="SL_LV2_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="JSLR_LV2_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="YSJE_LV2_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="SL_LV2_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="JSLR_LV2_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="kucun_lv2" columnName="KCSL"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[RJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="1"/>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[YJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="1"/>
</Compare>
</Condition>
</JoinCondition>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="kucun_lv2" columnName="CBZE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="1" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=L2 / (D2 / 30)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(N2 > 28, "滞销", if(N2 < 21, "缺货", "正常"))]]></Attributes>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-16776961" underline="1"/>
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
<![CDATA[#0%]]></Format>
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
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<a1Z;cihh$)'a;,ZVShat<!?QC2_<>#aPqOr<FaVR9#L1X]A;H=RT5q8@U$-TsW7.(#%B1>(
PU.Mli7h-/=Z9U*?<WL`.CtJ6W]Am,_=`hkBmO$b]ALQRVebglG0RL^a<*%[5%gMdmUncQo=TF
B%q"!0kP&N&P5kUX^%eKi^'4So494kcS*,G'jVHs;WrR)]Ap;K8qrm/,d'5m)dAU>.@HOnK;0
n6Yp>NWT'k_5;anC&o&]A"@La)-;<M]AY*QSk)_Bke\9c7d?+t%4\pR-Nr8EoM^r8tWsa@mDUY
W;F.#lk,S2k<LN\0&BFtL?>XD4H%J6tEREg6*!`4GqEuD5MY[HHpL(=m!q^=AXEN?'Bg+mmm
eg!pXeFPdVhI':jE?LeJn2B"S3pT_r!KG#hk'-6B6*M&1)-h5H)MA2$C6_65UER%dlU:uQD8
&,<,Ef<rZcdH,2:+G[gW'8Za40h`)UMKA9Q?5cHEePF,U=Z2]A)n7pJ&nWOH(!s'5*5PlIeiQ
Obi"iGl43.Z=!3jpo]A:t/53MP%0)`6b<DFk#od?q?IH^2AXU&CahZWY7SFBiQFhGon0(iIh/
AY;8/"tA0DSsT-%P-iWW:dBXg4'Ad]A:mT>2i%$U+W2c&pfV-oZNah4OrNBkW\TG=I$72/Z.8
obD]A`pqV"Q8TY^P`:W48il+l,fN,TArYUG4=C;b#+lOt'!*EY*8uIdm7cb^jo]AWQenT2*$WR
6VkTAEk3c/+1f&5lZo-h"fq-OZ2(OYX+@`lTAZ)<.IJ/@GJ4':K"V9/S:'Y0Wb$j7(Z>_4O_
Y:F22R./X!%2%%\_IQg/YotoUf_I@r-FLkW5s2G!^h>4bf.HVjVXs.StGjR)$Dr"t,jsg]A&D
1/8!ma<:>,`$s@d4cePF_(H*CF3E;-LYa3k^!=e@o*<8ajL'SR<<VM8Je')U`h%?8ObamYiI
UL(;<&e5M.e\uqY'6ClZ6Q#<"YrY%SJX?i>:n!W79!<6E#f(Y,([O-?ue#t3M]AlafG\LeWD/
hVe4[Io"ScN2d<UuhrL/(,PCBO)h$M*="aaU]AjofJd.`FX4DV^odYRm=@%.X(c=$,511^#8t
n\(b^)['H!f.5^H4<_]A&/'CLHb5kmgFeH7;?^'F!3g%%9EhGa3SYf,q@\fE-`82N6c.\8e8/
Fc<-(CY%l`Ec)hG:W7'cB)=*<e9%-"&B8*Au+%cbdTJ]A8+>h#_)I[IrhnsD9H:lePZSmFt$h
b4(n@#]A@#4QSADYhY`j0t]A<o1]AZ&O&q'O)-1(=^#t+Pm<-oQ\PTZ)WiGOEe0iLm`g]AD)=Y?g
^8[>kfU.WRseOb<C*9Q4?eC3lajf^H[uBuF6e89rKd>aX'.]ARpk!J9bXLLV9U'J<oC6cLnoS
m8n-mk2a0l'd=1dhiD^#C]Act5$#@9\jU@7g;I9fRH=_[g[-C%'>0>e"P,MpC-,%#YR07^WjL
;lQHj6tYk?-VL@4LHr\uBp[Q2XgY6;H\EpP7&8;^LeRs-BDOtR=t,,,UiMg@3<XA.L/q<2nn
iTB?_HQWB'A?*KJ(9<&UG'sJk!bHQTag7Q\R$n/OqVekV&PTE>oKi#a2e<E7g:tr:*.W!8-s
6Yon,aBiTp]A=Y4U(Eu<jt%P3#f,S,sR=5)+,N3Y^!K64;sZbuYi8flV0S+C$'qm/%.:,Z)k`
3h:mEiR`_hApt`]AQ5&>4?><T\SN_Q%ar:G)Oj@_6\gbjG;\r(eBXuAHYg]AqO_l@PWA65YYC&
ruR*G/cVk%_'hI6EU*#VWSRcbb^?Y*Y^CL19m^%F7sZ3:bAfsb`1*"5`(1uqm/=Hb\'XFY54
%0Pa.o($JB'o0W:eV9k]Am6'%:6e'`Hr"QBIQEN:+U;iB$-o<toM[TnR2[1LiEb'U"^7$#C<@
e_p96)9EQ0RJ9g<KI!7iM;XiA'AgI.?;-LPE66"N*f0%4*MKjXG6L=LCtACLL0r8#BM.S-%5
[]AHftsD-WkQ'A5<g3YhrW0`fb!L-%;fGFk"MlQUr^Wj$dcL%%u,;K>?27(dT6TMb)mU2c#P/
i]A[OOa-@/,.2m\N4b7PWdot"PpAq,&@&2e/J6hdi'o1[8$r*p+_Q";B#[]AnLt9CL+O<'1HTU
&(pT6`(,+KpF>dZ.R9&(Q6G<NNJHM.HBgBR<kGqsUWRdMC+iD8hJCU>5cN-+4l=WB(gN*0F=
M41YG-j:&<!Ea=q<qWAPIU"Eo8g?o8gNL\dQgM#_/bk@578HO9O$AN'(MD=(eEg&l`"mK5G6
^*8puATPH."/b%8/Ya8g20o2_NKdP=d.p[`Q:eF>MjGn/bae.?"kOdU9Y>oX,h[VQU3%7]A^=
O5d,U6,7S":`_E'8R)\o2rFdHiq,bdl"UL9L-BM\R`s)FKK0=)<3+2&<>dr3L`B/V79g2J*)
B`jj`8K;1n78bqFZf+HU/&!ra1uNS(9IXki-b[8hGC[5!ERg`oD5"4.=@afrnQ(7X\T4V\nZ
uIYraDC'2Ec&2<f2:D@7591D.Q/9fns]A"LsFLX[3l0E';a0op2Q(:\,->`BNqR(&G<Wb,\T'
9R:EKQUY;a)tY!aWK>no%34d[=F8EM=7hc-`&,6(.XbB5T#OnOW8d!q<7*8F=r;E)F=BfgiD
PD=37gQpPjHJ044>pLrh201(R1rNmlpLL--ZC2oKBDnclD?qCu\TuMTMCfQ-i'C#m`+e8\Am
/=N/*NEUg]Am'@!^apJLD]ADP#pZHFYd]Af_/U_.<J;PEMVE9$!l??,]ASTDf6)b,jBlmd:MP4Y6
Z.F1UZI^&6<ik4M?Je`mtn2$KOV3ID1A`P%OdNc1G=F0[PBC7*AYA#A%D&HKJ^_W884`.(t$
JRVIEF5/P@bU?=lX06O#EsT3Ut(WF'^9\1US4``Jb:+CGLATIpE=!ut^"R@pSjTnQGlkpul1
b,)GWU8.kd%GR=&)So87R98\0kO:Y4"940AWRFn!_=hhmq6hqNN4cZj>A'1,[_Y6Kc94MHP7
Xp_<\/\RJp3*pL:43LQLF7o3qY`T)-Z[8OQA&%:Pdh=b::iE"%1]A(UPhcq?M@2b;;D%'Lp!R
q#ndonmFjQ3:6A"JR]A[^N=-=D-dnX.#n=e<Gc/oP[60I=M7PZ2;K$/FI5JZQ'b+FA:q@s((F
01ZAq4)J,rF&n"!`8qoSn?fq8(<lP781ko?r/m"q,mm_&3i2!fLcfo(ISB$qOO8oQH&NhQ&H
?N2KDtuEnrY$l;q@ml1:>o_AMQjCD%8:N1d(i9R?`5.]A0F^CHFc7mqq+1+b(gV8A0[16FO/G
oR$=`rV:OC4EqRsoPasEUCrC(gFW+E4I+*%8_]AqGZCO?ATn0N%&%F@iB3DB+B<.a1pEh8G9*
%QKLc%I=)[TQWmhd"DQD\;Z'Q;b;&hCe%CT.oYL7!73\U.m8c.D%hN45REp>Ym)E\H&7hI%d
r<a8*E5+*&a9Z#+s-=7Y#[WBm*SO3#b:U]ALTP:N"6Gopo5E_(LgC!GIgZn7Su;[U%<g!+Pa=
6OS_'Y..(a`/n$rmlM"nnUUdfdKe1o3]A\CndukGe'nOqDKQ86rHQ?3aUtfrq5t`5G"XKk0;s
qs:)S44,e=&!Cu*H(Wa5(L8O4XtX1WOFHb!HSn]A@iOT=DZbLmi"?gb.F4W*A*>7-Ai')UTVh
Z6p@[AW@+Uh'ajGF6C;IEik<,I+L-CGXl*gcs*n$pe#s5m]A$Adk+*B:?u9T1mZJmlk,ST.jL
:![\[N.!mg#7Oh]A("RNNVNJW^:]An$_.JH.;[G*jD$SW1L1@d'o$R#]Ah6]Ai']ArasM9*0@2pN%
,VH/-h9Q<O[_rGJj;3n@<PE4TTRP%t33c]AJnL[Ju))4Gp[8aX<]AQL`QVWK\ii[^h\g-;?;o!
jSq\a%c\U$5RuJp13A[deIp=5bU8b^E+a9C(81B6N7L[qZ>D/-gbcdOL]A41Sb_f"nZ`?9BcT
fGNa(.:36k;DAhP0Jjm$_8mMce+hqmCtcR`"6auVP=7ZTfidR<#h^j)>GZ-$rZ1#La-0iTPN
>\2MNImBQ1XAb<a:KMtK"n-=P)`lcFBn\P"8%;T!l?ops7r0YR,4'ElUr(bf6T^uF]ADE5>8f
tRHpSs4!lbSg6?O`C&><,&TP>%/sW7Jd/Qs#o>jj7u9qQ3KnBDr@XH\2O/1k%]AF0%$@9338#
UI2/hE679Cgc@ecujsNB4lZj:bmrVe?Cs#,djkam1iZ!>o?Tb+#350cI_KQ=E)j0)TjhcJsl
M5]Ac7FF4u4<nq>e/)-_:D0440mYWRedccWN;Y?K$LcTU%p03$oNdG:jc),?$6l`\DiRDOLYu
:GOZu^c)/8K905EW5"n$)iarc*SV:""G7(kI6nQa^8`;]A!i3<^jfaa\;FV<doXB^#j(`9S3L
Fq$>98Xh]A0.X#")dBT71=4q-@<iT3;NkYFoc:'S22Nn.0+H+bGT_S:F\YC8'9L)On[:bsOia
1]A/W^JV2/'Cc\GuSBk8Q_=8r1kkCh$j$E\q3d&1,W?S9_Q%S3"pr"JV)!toW8P3HLWSDCVu^
BOeHQ]A55lRp*3`"*!rQqG45AdIjkfIRG-T>^=!Vu`Y?>GckN)?-%7Q#1U'Z6AMAfbTEDoS+M
6sST-r,@$K\b*a4)^\`$1lD:%QYS4T`L57A6YQ0@Y;FU6mD#DPgWpYjP7!pS?C:@5-lM_FAl
0*Yj*]AV40#%8oDHqk"#M?iU;GZYH,3\,LkB&85IV^(s6e`13^g&i9bMYC^kQE\8J+lq'#t\k
]A_Z#k4I#Ki;WO1nNYeg08bN(7.Zb[;2u*9A6d`B_E/%kUU50L.Y5@s-q((n1k=ipSiO[f?02
$Bbc`0oDSNHF=T4f9FkmI\`[n$!I8iJZ]AQbO/hno\Fc6,G1?(A3V/\)qU]AOO*jbHkYIKVlTO
07X=a?c9n#@m`in<RVrS;^E;10(2="Dh)5Jm\iDg?eGV>t3RqL/?J0tIg+AsLdMaq:TKSL\+
]AcVW+JC:F3!/5B8-V.69#7`F#g)iLhHCW]A',9lE`O7'MD_@%]Af[h#5e/++"o\aKA!8XZZi29
^=SEog0)bIRjljN[<!1'ZeI3eYWGk(Y>Q!p4E\*e!J>dJ4gf)!,E,%lejR8a+]Ad(90Z`7_]Ar
p^/jI,Da1N4W[VH2#^TFn,q%#KSr'>,;*(HnRZ'Q3:P%8Q'7Fb6%:[s[BGhH1HeIu@m]AMAn(
9uXq/?<nei)Z4M4,b&ZI9.1LDNdgimE#nm&L+cK,H6u/d>N0l+gqE!3C+_VqVGHEn3\r6rJd
I>i!;0@ABgdD0K6C8F1-'?pRtTGuql*od4r3F12ZCcH8/l0<?OfXe'+M%<91OqdV)??=AoV-
%r\B4@F;"0"`(%n'*o_B3A$?>YmXakK<6o;q?Tm`oiPfaC'ba:ETApUfA6"LF2bC.$&jZR>p
>NpAKuq-01+sar80g()99dI^A4#1C"`pi7?n?I/K*MD0'@^W0huldp-E"9fH=KTo5l,m[3"'
\odeFmkV6?P]Ar(E,4YePXbrqCnGpl':1d*umDV[>3.lc3k/!iQS-6S&Gs%.NP[2.[6Q$o1@0
eUY36tG)Tk/e0-:`nWpa6Bl:1r\oSK3AtmL#_STb]A.79rc1X5/__l(AXF*FFB=f\B[A1-^IE
\O\*]A^gb4nDMAa>)GCt-+jWcEs)-nb2b.C*IBT^BJhj^/]A!J#O_%h7O"nUW$\.l5MCZ+*ka?
k?s6+fGCuTB0?#HLuP@,\k>s1>=l8aiWP8_(56C0_*"1JPp@]AatUK/rN;XN_,tTT2jCs?X)l
hJKK>-5iQ6_$]AJP41PDU?>JW(hJ9`5or21Qq;h(CIhd]AhlcNj[3o7iL_]A;`XWqj-Tf)JS3TP
&n(:0mp@"@VD2Jbq]AnO29L\V\<7FPZFXKlte#NuTpQljo_H5.sLGP\gX7"9aUH@A'q7X6P&L
(9:4L_1QJ#M:!bE5#uT=:<uJYe/?M+O`q-9+>#"mBKSJo]AZt"q[aUK##`)q;Q1-YW7Vs/9Vc
PH;$^jK`7P=ea.tjjT[pAbV*0hKt4Ytk=:9#C;%Ef"A&2SOJli"qtLf>IH=i(mFcY-!EIhPe
rYWC]Ahbg9^79oU/ePh'3kD9uq8E>s&,b*Gb7;uGp_pfgShiG\O:(p:7ZQV8O[9<BQ&Z0Pffn
^1dKjpr0df'^o[R7nrR6e#,MCk;'g?`A)d++#6k]AM7-6s4=lMXrsIPh\Yp8-ZVF4S2Qq'#2b
R?3@r7V:[nP(%Y(8H.(O5D3[j(.>/UKn9KQaI"%\@`c+BIJEONNC%3$=$.:`Ci)D-P7cJ#N'
:@6TRYC'>X;m)]A;4HP<fqTB^"!>=lh/"M?K=B,qkp4(CrrQ+PP`d;J_j<W_US6n#>EbhJL\u
c,^1'GD>I)`lmHb_gVXR(g;^s),/AY&<E9G5FeUct=uP'<P<_p2.&BakL?WF,3SY(sfHtl`2
*#<kf882+XRc$n\-sQ.?18M]A!9+2o7DCH[E?O/`NJDOPrZ7mS1eR5D#k7_QIC^GTrQBkMDL[
Ms=akKEGbiSVQAgj'K^cJ8h%eH_Oum'B`i7\aiWB027>^*h<]A+jLk^QTO*6i_Vdqh"5XKZG]A
)B<]AUGm+fG*QK?NVM3hs%DL=!&c38uAp7E>3?:<*5V0Da=jE`*86u9iW*Kad#9E'3/hSn>-/
*U>`*`LP3+Q#J&'J0m'F2+1EEPq\U%J#PIT8mFQlm8EFm>r!JD7E2k^jKBasWO;!oaA52k>:
GMt@uD-`@rr<ZkN\.EPh5*AEjPNVUB/mVeZL99P\$^g$\SQW"/fEmk$l@KNWJ)^VYgPhYaU(
V($9*Dl<be0Lk>atW_Hd<3AkkOSo0j\7d`LVRJ&`<)0&WmKH\ZBu6_,43_MQ@05d]Au%j\7bb
G\,jqXP`/]A_C%]A6XNdSWUC8inUEZc8"uT6Rm*NC"?OR=U^Y=F%bOACtYj1Uh9VPX6Tr5(gTq
N2o3XS"Ik@HtBClIuJr#Ur$aMFR/_%HL<2S.H)(C$hC0J:pgY[iad'an[nXfU/VgI8e`:aaU
>pc(h<g%3O8pSk_*I^3I.N">?1Nc"+L5_=(mZ!Jd&FRp0*Z8X=j2IVc1N8AU^A@/:H>XX9R:
e82'!ff$j8DVNY4f+lgi@hR.?958*pk>5mJM.*)8M71gD]AEI[gR$3]Ab#?JB_fi++B]A;>N,e>
`eWD`r,SA0P:.-6!%>(qlS=ua2,+g#2=QBS"#^b8e"o+MY#deDc:?)YlZ,;-H=fi(8E!kJq7
mQ3_>RC0<1]A_hjg)!iZ'A]AJ%?[>GI`kZ`qgh0*GpM[h6C(MjXh-9-*l=DbBUVbaRr#B`1@32
L?fBZSnLV$F+SD/pM99>QYq4N\m!i^F@eLh_`Bnp1%gW3dl)7)Mi:rSN,-u]A6,ZOq%SO6OkZ
aS$ha0D??V!DW6E^#]A.CgGAE7EB[SF!>L.$>\dVAA6<bF89A#</Y7,?YBAo_WXns(R#HXo>q
^?5F"Qa+&fG/l$N09ihPnPd)3mBEX2+#n_)P,`#lGBM7$?OQO0iint"hes6iNF>%/aCgE7RM
IcJ^b;OBW_olHF#Gdl-J+@qsGKE<n.GNW3b)\io*o+?,[8:h%gP]A8lCBX&oB;6?_%^p-j]A#p
7tku(reSS!uQH(8nl1\;1*8.9ONU_;YiWp-(e%)=]AFlOuV:WpT.ANU+8IYJ%LqJOkj(US5Ms
keNF+S89d1W;S$UQ376@R>#Bk([#mT2[d.JV\<l+hEpEsbc]A@TA04T'Y<RAYQJml$nMV3(17
*=[5?OMO$4D03[26os[B2I<[8n\QQRYP=&o_rn'V&c8EUuD3aOK*-!:MOY>Y#M]AUZE&-8*2%
cdjCmM`KsZlW<AVN.L;P,U/_TjRUk%VZPe\_Kd$OQF?1!\2-GRqN0,N@^)(()'Z^n>`&eF.n
^s'+JEeoXE89dWF^kE4]Ac[0tLX,*RR^\qeZ<1g3L&KGDnmEI'%e=1Gh8mUu$Ej5'*8l"U`<i
4C\Jq4c!NP,nDpP^1oFAZ?;@s'1H/.)%0h`R_m?;7=DcCN]A+s/_3oNd0VWU(ItUXYW3;EK.c
[+QJSL0/8U[ZWbnl"b.jRae$SJ,%L^eCH6dm'3<p0!H6DEV5)&_@sj;D=D-j%_qs_)r1'83i
\]A*^iF+#<6ejm(rN\]A_QOsugYGD23rmOLGSA>[c?<44mr1+g,J/UYGO(@)R$,OU3mj2@6V\2
>:FpIJ]A8,QLhHNO9]A0>d=K2>f:rC58.oj/!HHTt$p2taL_;_KV#X0+qc=#2K3H`fST$n-dI-
[TF^rcj*nAiqd1N]AI=VM^aBe*>_[]A+]AV>5oc-VaL+B834'CEa]A(?tToJ=>"hqDAZU!:829jH
tToi?Ol7e"C0-:<;q:fpg/):d1.cI[<!Pt5#75W/>9[N3MMBkkL4);lL)1D/=(2#^qgTLL,r
0f0>s&U314XC.N2!\l0*8#-CAQ%2<EI4J&F?I2u(q0JCoJLq,39Ic'&D6;`"Kr#3fJqO3u/?
L7B^<,8+90\)nSSmmR3>q5qg*q4=2U6"9`Tup"cP:(?!KATKdMZ.gHfBrP-Kd0KoS5>5Ik2/
]A\#OBC=#)49dLk.H.Cj<Yr_^]A+dWFGYor<tu?_8/rEP'8IPhCDNZ!NkJq'U0A9q@9m-&,bPd
XVP75djC_,K,T_(l15b!Psi,OfQ+kHm\9\ZC8*((:u$Bdgip7)E?8f7ciYo;au-pm!NHsgR1
T[',;cMMZ*D65C="0,)qBaDF)67cE/MPJeH)>XGg/I=&*AebDF7tUFIjkQQ;Xm?DhqM9@U,U
i35r?qmD3EN_;.T2EALWFY\9;a5+BiOdJ\DN.I6gLnNM1/u9;c6+)b]AKF+$'MMpSoRlLU45C
#<)@V*en_'&:q._N5^7>1oi%l"ViOIbp8a2_oHdBW5i@o\4+A-Q,5)&_17\gXT:Zd/?j`Tu"
o<*"HgAPP77NuD@SI9Vc9Zl3)F/8WRaS-9,Ji#/(V"%oi80p%iXi#*=<[EY$b$36B]AbGM42J
6o3`G6*<)U;9gcF_aF".it"u=9,BFm<Ki3Q,bHuWoCgm=8e@7r!bRtE-/J;K-;D[j@u`R46j
!4g?MWVGIXtJ>?1MW:3L<6*UkTRe56oX^$L3</F0Wk6$i##j(fZ;WT53;"M3TE*[an$6K\6>
48WY\kb)WrA\@k?*j9b:<o0k*J\->U%D)<qU4MmHQ1bQk=TrKQkV]A='*8i]AT:utXI]AkZ/D<N
AhWT2lm5W94FW_:uc]A/.e)Di3<K^&67LLoW3'1`sn\g?2?dV!JGeG=T4B+'dO'(K3oBWKn&5
T)Nt&Dmr!A^VHKYrR@9Wa*)q#LY<pl]A(TTqM[&0Sc6^d&X\QeGQEd.5Qig\k-+httK9(th8)
:AEe!eu6HUrg5EeH'ONm?@u.c8nRcUtr&$C$4%`@f)W\W$p70$n9)Q#-koA*;F\%:'N(<V_Y
@4r5.rnRqg&_8nnT`TEBOMgCFUiDpc@$X"%a$,OldQXb$cbe]AYk#qP!MNUOa2mNAIeA\:U-s
i+FR0AD9&`$+[4T[Z3_<C0ILq4%Ve5=^nZL>hV?+2=/p/!$kFTUWajYT#T;qMhXu^Sg.5c6h
U7jffFD$=G1q+f"f+'MWt?PGY#D;oVQW6ImbFkp%bq4!lIc8_G]AIgNLKR+cpY@P?TA75Aa+r
U`u8uA3V2*L]A6Eb'S4_i&Pi=O?IXl/D+m"Ki&YW7q^+/T4meVKiqdeA:+FgEPbtkWAhCp`io
*2Vm?R%m:H:1+,,bGDMCrk%Wce*R5Pm%U36g2tR0&9&:Y1D@pLNE/-O+r8aSh";H-G)bp7ds
LSc3N^9XhHpMYCce/*tJgJjB[qJrZ8;a.f[.8U>Ml0*=^$<(YErI)D)(9p<_kQ@)02!ChQLS
[`9!DaBu>6RX9"ZGNP=M+d_k,5>q0(P)6ir<p,S7aCJAO]A.PY+Iq5>PZ8QQN.L*sIG#$OFgl
<;ca$EHM"BtbUf^/[^Y5+#0\'%52\C>Zs0BXh$L5tiC&61d3`MG1I\6?M'QV;K7;_*0&S"@9
^anOmG94sC=8-Y[R\HZaDn0^[B09t`p`1.Z)oBHD,!QAi\-`#lX'Tn!H`3^[Zn,=`NEN8>Z<
kr]A;j1*-#OfiD3"#Psf]AFRHFW7:)=Z+hIGpZ8MM?"687'$+%ec[S.+Pp@*W'f/(_i6?^'E)E
XKEN9Joloe9@QR@d4QeLe<4h6;FN,+Qkn;?N)[^4I!3-UIt<hI4,UF'Un2euJcIBOV)E(2gR
/bmJE`+5%JF]A$4N,&CjIc!M=%<UdF5G:>`+\g=.WfTqfC21G+:>Z$En.I%Gmk#YnXF4"W\bf
g$*_B3iHH-+,RolN2LUkRBI7/CRu/-rIno'Ni95e64/ppYSH2/;UZBY[KuAI9u""D!l<\X-t
G2XM"<hZ[6fV&O'gIqWJGj"Pc<JcI1A5.m`6]APaBC;86Z<UQuSDTo&@$/Z@0g1e+$c3s[5Fo
Ld8H:-19SOZ.Zni:(lLgV)P'ZT$?cK5/Z0_7%olqJ5A6kJQFs;9g>=@"j'G3\lfH3?[Kd"AN
J,de^`rOo'1e7-qMXoc<&bIiBmf3^qm660o*ehWOK^%n8lb1<u,02KL\[MIO`ls+%V"/`8;i
+gNLn70'b1"T*'2<3(,ECd7q]AD2C/pa_Q`6*N7:VS+kVUr'%f]AVE7;,Ir/bDDelQBb^:W,ec
2tP?9ig@G:BV"Sf[gKls@BUZl8.6nq1BW%>hBF>[7F'qo]ABI^>o7[^[A\jo^h2;3fsEkZ%"?
UbSEsfh]AP*+rRZA<5OP/sidUN0+4a"?i=@l5Mi3MDQcq+%Q9T+_?T.N@[sdJj)[%AB_XZj-S
pIYKjR\Z=8YekI.r`^78NUm$A$_?^l2&ah&+u[LJ$$ch1B7c,`GAdcXN[*qnYrJiShD#V;K)
dIbiRI>eEpM=,>Se_U_(c;3tT'mk5!oBs5URSFhh4)h;^:ST?<OhaI*`#pkW,/*sDUi`o5g,
i9<(RCc=fmD^IGWB$h"sVQ*s$mIc:<;1)r5TbYqMc7)Yiat^$'XTn=u4a+%;?TE5&'IQffGT
&[/,Kjk'7Z=O\ltITQrb!rTg&#5)C4)s$hk3"9BA.sB0!JC6S0uQ`K9HU,\%?N'CB%oWX,IR
=Z_3G+Q%qLd;q]A\.m+FS#l2F9*6I1+rA2"kW8ZdK-1#LI/GG4/ni#DW`3V>#//38+^C\HGp$
gA\!'.dJZ"Y+d[p/$?4YAjPW'qHDn)*>AkKm?#5p%(q84ofQVjf6b22(^KZ!'E@#Zu.Jk[iG
(eB9#ke-*Zgqc\cfqH9-5=5UV[b.f%XoT$]A9FSuDb`apjVrbsNOD+qP<T:C4I>XQ(?[0T=:W
0a:dSfC_RRc&\7fDa,5-dXa2cH]A5ne7aB,r0U`r>2U0*pErTgGq/_L[3q!r6V:K/FYr`!8d6
VIi#0O/V&=#bS1G&\+c`K\'(Ia&9@gt7b%><HIr7p)_jK6Y<$1D=K3ED@nYPkG!F'PBKo=I/
H$ai1[:?6,J)8s0..kF%R59eC9+7#NX3@e<5pGCDM:C4]At;F1ne@;1ZjT7)Dl4Z0.Fr>AA=Q
/T%Q6_IMIiAG,$W"7oGN-k5(]A)YNUj?9d=DGJ!;D&0`"226UJiumNDZ[]ARbikn!VT^t3A&C*
)RI)"#,+/b8^j6X9/0-he\C`D.N^[KNXa%IHm7\EEe3;jlA_/(DWi;GBrTDD-('Pm3M0'(rb
,>;&%%!%CQIQs8YioXtfk$0u^oV'T[_f\q*p=18-TDS&Ob:j&o?9B*d_,W^LJ</W!/M2-<]Ak
QbS$pq-f(!<Q8a9W7/DJL^k^<?$F\^U&/_C+!!kcgU\LLC9,,NsW:+>"n&4g?s=*/9_#*Q;)
lDQ(&M0elnG?336M<V;d%3+#:WY@8e9,-PT-*/%`/7ph>OiiL'h978$NoG(JgE$D9lUc>fJg
c0Ul5`=$-G[=r17[<><0f:t?4S00\es5fC<Bn]AFh`4cX@H9(O7B@"_YiTLt6^UO-\X<N,S8l
?qh:;CGQ"6#tL:7J2otd$ETF/#*FYM*_<%>pb/)T9WU#6iG*_3b[Xs9q>jct*Q4I8BqM\gKe
T.%qeOpE*T@G=+0q6A8<X3^N+I6Jb,iTOL)[HuQHCPa2h@/=Gc;hMJ.&l823!GJ2i?Om:<S6
NcM5EAY<%DHig$j=k#/h3[Bm.6,i\FOqj%m0MCZ9k.>_rtQ8UmIqc6bWLF$0)9RA@m?i"*47
/QJ9+bK798h95tg1JY0k.?rh-uB(eIomm6JabTcWeVUCnd"PER"Pam2R-,J:o2V3+^GdU6E1
0tiIcTt5p87Q&gU1IH%m:kWu;WFuqppiA7o@Y+A?us=kdltRCAq77qH=GeCb5sd&R?:gINW1
6tA:NTlL5E<\9*&d$)=hK7.tsb!_CA'Q`<$KaL*P[FGNSiA9*PRY=LVY6[GII$_Ahn5TdP1u
HhRJ2a^2T02'1B9H7pi@MWVR8c[MD[R%Sn#JhlqM@^DOXo>lkGhrb[56P%4H-e<-W`MpE9`'
j\9]A53n#5Cn-Kc#]Aa6##&7t=GHi7am^G.%`#Hs,8)Ca`Nr\'mV=8m_Kc&MI,8,/Bob^XcQL)
Yd'2J6oqcG+o(k>&fAW(*"d*3$MN=8>iLWc/!6p_&4&`A`c]A1P&(^J()[\s\VG)_o;4qG!jn
Z[o8NA@/(M,f!f*eZ>_qKQ4UD@AF%U."*f?BPo46<QMWB_l8O*B),_6.d&&'*orHq=9b6(o_
`*>/P+59+5Afh_`%f/*25^"r^/Qpr]AF8BtGlgQaq6'<p#nHQ&PY9ONAIK$g"(DOH9fp]AeoBp
Q@SfMSI(g.$DR=/T8)#1e^J9#duMNOjnP7]AOsDS]AGGh_]AX89&7Z^89j)Z2XN3C(uWY>kt7C8
?pLolIrb/K)-TR1>'e3okZoW]AG[,HSE]AU1dQ<Ufht$&%$pqSm(h-7Za`&".]AC4!,/mi0fTuQ
Y?4q#e)&g=RFc?%$n8TrUDb,TKS%p(dQDbboZpNi4?>K,'Lr.ShVk5PH`nQ3$0!PfI6XTOH-
2rD0=XU&uqfjnGENl2ZZc%i+]Ag+:ek#^We]A8q+2iTk'/Qn?In*IY&ZYm[r9o8/`5mO!lK-kT
ut;k.@2(IlPq9N_;q_CBbQO/^TW<,#Y+k^jH:!mF)n=jYft#/3e)Wl6f]A-suL;]AGjOjCb?V)
Q)pOH!j&qaKs$Er#Ri4;;pJrGa=+NOGd\S^khpfK/*h7\6>1m^:MTH17FuuVAo0/\DFGft7+
@-;.df7jb'bQG46@%3m1(+/pAl/4\it1WU4-5gRPsalPG7(FSBPKNnA89QYCrdBLN,Eo*Ih%
OqF:biR)&\7MT]AEq$1,_'@cdm25)J\DQpiA4E%q?1b/(*QU+DV6n"^Q"NiD@F9V5]A79V3b%'
ZB.HN04+"=5YrK"Q8/kA3[($^(qGO!"Hle'_YI'R%3QtK"3`U"[keHNl?#n9+73.P:(tGa^,
`8<ao#MN+jSNH=N%7gP_='jD_3s(DSg'V1HF!bTj/GR0!QS?G`kl6?qAI0,Wi[3;V8<:SQIn
Z-Pr6YlIgn-Cj,5r(,tj`-b-r9Js]A*fIYnZ4GqsGa:Qr9$rimW52VCpjh61EJRI_sPY^Z?Gk
NK5Lm*fe\be'^d^nZ<VRTQc%u&;G$[q[+Vr_'j>FCh,4<':i@=EoL@;KG[02G0TWed*=-Mu/
X7K;n!a[<h+H(N0XFTr6u2(_ULr*A0/9BCS'(SA/CJ)WgH-+"B-S)<&eOV*1aF8]A:VpVfb(g
\E(d(o@dBMi&Zo:Wi144T=d6^S33hhm$i0^=%<F,FNtJ4?g&5AKTLs[H7re_*#j-a/]ANd504
i]A>,_'AOc0QE:OMPrDt6rRZauR&<pcJ^]An!?V[V>,9;ELeJE35!Yrmu6UCCH1BaW>=B6e3Kh
-Q'p]A7lUP"lmoir^bt['UdkITi9Y_B+R)`:(HBU6!:0B?L]Aqi8S9W^#NrmbrUuhgOP*;$*np
6,!F4^.N:kSh)>3`)fb]Akn:nqb<k'']ADarN%4l-M,YR$HPBsN2,5=IhZKQbcDX*(#WVjN_.%
F%Fi@XR*UTA$,;tV/;Z9eJ##R1I[5e3Q$@]A;l*CGP?*V("ms;Qp.A:du'i-d"(25HT0"#u=\
=)s,7.N<Sc$qje=OYri"m"jWNS1(Glt=AQs)BR:dI6SSeL`6uLq!3<c\`77&Hm*)LAj$JdZ4
[2?BIED,PfTg<hp$Ug$=Ukj@";N(3G.Q\fspUPoTiEj"_j,#qmNLl6l$i-ndI]A%8jRS!4EI'
JfGF>KMOkiN^eFNep-aBJjSf$9$[cl%&a+?SF0Ni&_3p-o?/1XA-7Z@+@YT69S-YTaS<"@:V
Bb$]ALDo;g#HUmL6l&7ls>S"'uTJ<YmU4rB/i!)+Xf%bXK$1MRE$uh?&SCf.QqAHj2Wu=NJ!`
Nc@=.",JFc\qDZ!DYBtSR+C<\_:N4PY)P6I5Ja5;A>^NQ78>c_ZAOiAmq"aE758R;>j+25X:
L2LPQf;RnF!C(FA-=J0\k"QTOuT.S/=7-,n7'L"Z!;K;<18;OpU_J<aRNfMo7T/(i3<4f@ko
r4!Z^VkmEi0u<hsse]APR^XqT3WSa-?^#5PYIhk3JH%.#!u_PmG39K5NuK!02%N`'S[!_aTC7
\`L;eBl!DEkg,1eZh]AY>In4kZrrN~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="480" y="36" width="480" height="234"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report1_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    二级类目 (上级类目："+$a+")"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-8355712"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="480" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="二级类目, 上级类目："+$a]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-723724"/>
</title>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-723724" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"二级类目, 上级类目：\"+$a]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
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
<HC F="0" T="1"/>
<FC/>
<UPFCR COLUMN="true" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[0,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[一级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[二级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[销售额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<O>
<![CDATA[利润]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[销售额占比]]></O>
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
<![CDATA[利润占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[应收金额ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[数量ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" s="0">
<O>
<![CDATA[利润ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" s="0">
<O>
<![CDATA[库存数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" s="0">
<O>
<![CDATA[库存金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="0" s="1">
<O>
<![CDATA[DOS(天)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="0" s="0">
<O>
<![CDATA[库存状态]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="YJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="RJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="动态参数1">
<JavaScript class="com.fr.js.ParameterJavaScript">
<Parameters>
<Parameter>
<Attributes name="b"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="YSJE_LV2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="SL_LV2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="JSLR_LV2"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="YSJE_LV2_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="SL_LV2_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="JSLR_LV2_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="YSJE_LV2_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="SL_LV2_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv2" columnName="JSLR_LV2_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="kucun_lv2" columnName="KCSL"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[RJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="1" row="1"/>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[YJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="1"/>
</Compare>
</Condition>
</JoinCondition>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="kucun_lv2" columnName="CBZE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="13" r="1" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=L2 / (D2 / 30)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="14" r="1" s="2">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(N2 > 28, "滞销", if(N2 < 21, "缺货", "正常"))]]></Attributes>
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
<FRFont name="微软雅黑" style="0" size="72" foreground="-16776961" underline="1"/>
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
<![CDATA[#0%]]></Format>
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
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<a1b;chQDM6TILOAXa^E_.;;0^i,#MMg2PFD/j>BVh&0*Qoa4X4SVLH[q3J:oi*N6Jp4[U-
R^7V6-"Z6,G2nCt+\=8JF&'/RZ?s"!itiONTZI4(-f_ju''olV-J#hsZb9rZXH$m'ZPnT(T1
mpGr$>Q71'LQTkfWJEI;iGkP,;R*,_b3UQE#Yl@t&rqSYVUnt`nlna.6.3%Z<VQ>/XH98aBA
;Tl>7e'5_<CLZ=K`q4;RO\WUK#^!&,H1k(g:ZiFEcZ'SA'`Q$X1gU/]ANdfp\5YsSPhjbf^,7
WYO?aNV>;-^jUZHL-fSF>'J.`b6'0mf\oUMegdRka<W1AMIZZ\1:0"%3Gap*nM6<&a6mI^[h
qWqfOT8qJi*\P&-hDeo5n+r.8&OFB=$ZlpYY1]AoRE?[3^RFJ*:1@7e`OsmVQ#O5j'BBtdU,3
%lRQCDt7X-sP&R"@F;*Xq'h?r,a\d15,rPMTS@bWt/Sr^)'`,S.,H9W8)'<i'h[aNOuVC_C]A
_=Kr;(#,Hqg5lUtlCs;uMMT)aWpl%l7?jhL$RsI*HI7u]AKR+u*H.X5R-n'A/Ei?k4Q>QT#1)
t,VT-8>kR?(,H4Coh)t,>K^nVVD/.S\,ijVr-3@]A-VpG(n+VKfoBD#1+n2i-^rt-]Af+Lr.+!
QM@:LOa)njrteW>-IchXIMNG"5;QgsVPpKU.R!mikSV35+8U.EGf,q,Fq!))Islu>u2Eu^2P
?(@Yt)LEMg8u(HJK#O2@DWT);TKu=I%u9Fa<Lq;O5`i<+,T,$1";9$!gA3<8N#$(/`]A8=&Tg
F?G7$ST&q4p8X)?VX!9,'rSH;-k=-R;1[!uFXVU_%l9H4=]ANE;F`cBN%WX`]A1g:10Z!X21U,
jLGoGpXuJgG*K?Flfq!D_B_GX3>4sr=NP`cu5TfPZl46IJ+VqHsIWo2KG-Ve(nYrKc'G+6Jd
.ITZ*90m^U<)]Aq8&U$G]AkNMP)39#h*Um[C:8(@eDtW0=A5q-8hN7ndD2Q:l_=?TIU\q'=:-5
ge%su4:NP?K$,BA_jcM<7h3^[8_6+/*\Q`k(t*S>8iq5,&FD&!e&`^N9-W!)bA&Ed;?>P3(Z
Q/J2+JN9l^7gWHt!,q(a,r=K+QS"<;QEYc/pc_%a$n"%i"*YK'B5M8r'<RYJ)X-&a#cc2C5\
REQ5;kPuFPX:l/5`c$`OAXH5mo*>PmDBJ&_#!2(70#7.e)B[#=;?TPd:Z`[!\3rkLUhBrOY*
`X?3Q:,^pe_S7;s&e_3bOISnY9lBY+r`NTM4Y;5:hYT:Jj:C*Q#9gZ<:?_%l92cMf6Y*cG//
nuKmR`h!<Ynh">P=5\1*6j-n*7QsX5.1-g\%q9M&[:eGg*,]A>fY1)h,f[oYdY7TN<'$rAC$l
uB5FrP1/iNE;%jMBVr"sb"leAD34kk=6BiFV#J';2p1VY(rA*Ye*nDme\j8jDo^P/3Fh&6<Y
hn7;]A^)NB7;J]A$T*,kR<IWiX'j">[VRh4r^0g';oGo)&#!.Dd@?nCtL[kXLb#50IBKW#dL\L
=BlI![;uf_Q+t`-Kut7]AE:;@1)nRNr^\\f-IU03t,I7#QMk-5Y"1S^/TS"N.q-E.06P@rut[
1*r!=O<+8u8F>$!dL20o\19:9IGK9D"Wu#[1D(3H<>]AJ(#5pU5hnu^)50Bn+4!d0XSB(9Z<2
Bg522COG/ld8;so]AsIi030]A751Bqoj`HJbXqb]A3csaHoY!j8+0518\QW>NCCR&oUSN![I7'X
HlP!"0bleA'KqbY<!nfB(mH#mWr2=KrXbts*jFsM]ArI0<BIbD\4TdC`2(_iD_JNu`9:,Ha6I
$8X"NB6Lf]AX+X68bm\n[h>8R8ml)7aA5<qTb'X1Ag9nB*N[.U=h6MgCfr'e?8<K#_dO'aZ7d
8!+c<O@THQ^_4\-A-O-aB3$[0*%,8\BlLk`6c@KEM=9&=%\/\/'a`!O1BBn#r1.A]ADfsb!BU
DTJ3)d4AVk>&MJnNS!ku.e#:\#)/R\:H*.jU89&hhYQrrZOFKe/3p+EU,.m\!2teMUJ94^Lk
6o<:o3te8aJjS^[SNI8A<2Ml1WVDS5u]Ab>,<B@'7-NZQ(;N"X.ThQ7>Bg8mEWIkqb@rqcdYU
#k&aaZQ*B$X0kOg4H(DQ7F&_)Y=fQg,Df-1X#(a0V,cLZP7=-A>$Ac.HI/$?S5UUg%d3d9ol
"``Y-(=9C+U9<C(VIBA@$:0[qCEPC:PG/sd-Ana![V-tc.HVh^m3@-fSbK9E?^,haGZ^SUXs
:DJS681J>"MNsQ&'LOTRmBLY1"uRcl-2N=^pZ?SkBd=$51mE(%b?@26hE>[)[A%XbSraY!a5
S*nKPJFp(LnL2uMrdiechI?qI)f)b8,2<<H8guJRU#Ita)B@Y3<EObDk+m<cR!qpY??u?#B)
l,'D30"8*A5r"Z+jeVX>ZPF6MAc>3'Up2>0e<!T+lk%eNWuRqV\`O\-KdR8B?;j7`TS8n(F!
Z@2I@!bY;]AB<LG&u@:N`+K`'u5?2l9=q*`s<$Fm0O,n5/h4,DZt<&(V&F8-3PR'02(jE-qp#
c+@_ZG&\dV^mJn#=$f`GQkeu4JA\1eUlZFdJ&J!)HP!#%>N_$Dp=Y4j>A-?)9<Bkn8uJ0/lK
!qTisQ$:A`r$KrC\YkenK%PPgXZajW^]A6F?2#GB'uWI#Z_leCR%a;(7rrSK!mp6Y('/&nZrC
\p6,,4_,ad<37hIU.,4n_E9$fJiO[ddrV[0RC?VJK%.rO(\ZVo?gTc$8re/YI4aeB;=Z##r-
]A2H,g5[6Ck^8odYfV;"(?ZH;.WJ'5"='@re*-C#Xt4MhRB*_Zp1W84Rqq?-/[5/Wd2Y&\Uc9
#t;&:ku)4'_AAMQtI3L0q^dG&peV`Q5'%i5'3I?Sfj_ul&K".('tU3Zq2/^#qU-NY&MRr^g>
bpO[WI=mn>BSKiPOe%^gq&nq;S>\WVFCG1@?,Ukt%91Us/dkMpeJ5`:,C:oief5>Z#BnBO#R
/aMig_AnfKbHX>./B#8EQb9(Y=b<?1]A1D<UleK$6ds)\E.abCG5FZVAVNBGU=Tto+j`$aI.1
CO]Aa1no@F\aKfC.<*:%V[<[si8@.mVhO"i"Q[9LcNqJK826k\dBJ\:(S0R&+*?KFuWYDaR4/
gcIgB;*s"%cfM7BX-iVg>^R<kk_3u"lcZ&i'6F'eq+T_&@-&k;%#0=MLF`2s.&>i_.`s59\Q
g1`h9D8Em%4"Wlqb2<hl]A.4(9R,`?>9ZhG\%3<Dfgg^GS#=bq?lPg4DsC?UC;^@0nH5e3;DV
NnW_Q%o'ek-n&s>f6!Dsa*R:Q\YTShK7u=pl\6M^$i+6PQ(+Ds2[pj>$7[k.+n>cWA(ikh&A
d+E7:@$2-G)V()Qj2=b[sG1$XN`hf07l.F2CsY&NQTB2/uX$$ZYC97sC+5/Es+<+!').;.hX
ne9r\S>HY*("HQjn+WZ-_P[Ej"2(gI+5Pn6i=!42L;/8flar9F;L(>mE%Vo7P[!3SlH1,+Vf
\t@J9L1tHN@_?=hJ-7rWP%km-t"S6aE0O%.@+a"3>Lc<K6")3FTnOlp&Qg/Y9q`+\>D#TG^X
D0\JT;,LQtMTZk0GKmPQq'Y"Hec.ZE3lHATF`S(J-U5[f+Zc9&$>;r=X.R;[eQMSf1&BH:oW
04Qb_?6PtCZuH2p%I\=Z+)e2[FAKt.kf`Pn8i5V@*gCKLE,-1(dY8aO">'qY85-8!5+cqSbu
HKJ.]AT,NV4\PD+=Y@]A7H-]A*R*c7e]A+b2!oXlPgBG0[9jZ&NS"f^+\\"XTU"8[lTQ9']AfUfl0
W(#$LIR>oZ-^%O(h-YH=5Q.m(aORGu%.I%/)O-Yd@HTttpr[QEC[S#+Zk]A(aq)>o,_A+N*[J
LCY\aQ9O8oY2=%&Yb:jkY9.m1"^L<R--8qg!je$N[:X*@Y0JC&[<l4DrAk%%I!;ENhE>)d[[
dE8!7a[#&87Q6Y%YN;ngg_Y2VH;)quiO&.Q7M0\M`T-%:hCbI#H\c_:.eZ]A_>FpC\J2'_k(H
^X$YP@G7?`['^)jmk7u"F&K6h[j*>;.+b_PE2<GA2GqCe36>]A\J8Wd9NXlid,?TW9=ke9;QD
i`3_eB$)eFG*(1-(SBFR&.S'?lhCAjt$jj,HN[b%NJc"UWZ\%/#A>O*]A"rKSt_NG,=WKD8L[
2$n7M:Zs4]AZO2Jr[o5g&ehq9B'9*6*nFMgh<7>p-,*PH%NO^Saliq"uUBKodHN)&7bWAo+bO
MW^`+c3FY**Rb6eq4PrL2)&F/ra%Vg;?cY+"2>6p<ECf:g]A1`r,QIKe378;#agigjF*W2loL
:\.u8lpFPYVk:sNT`^e#EFZrqKNK"#Nu=+u'"Q199\ID3gKZPspEAfM(Y==?Y:k)OA:![;=<
`q=:LUanEH^?(7Ck+0V['=q3BLt<_pi_IpkcCM87='e^[U%1>,4DYlFTdH;O^5t9Nph:;EJ-
cZg_H3s>9T'&;85b63iu+0U+"(b4lV8[hN11_?>+</b8/9;@G0s:_N'(<eL3fkegKP>M8h3H
-h(/:A;W!U+ZT1$ih6MjuHc/UrWI'PcD'5eBSS8!GXlB8-/"QL@F`J<MNhZMSl[EfpX:sG9M
@p#?SKD$I)a=6IQ1^!^PEWd$h+7N565uKZm9p?3`M%5,dOj#)nKl4:R($>^g6)3&b4&L!:La
Ta]Al16Z(kZWf=4FtFcuCU+R6BG,.P,(`F!0H83,l%C.aY<6'ZN]AF,<;Y9d<kXa-X[SP#%lrO
=sa#BB"gDU]AC+JRN6coVNIACHS$"PD#$NJ"Z8sn.mtLccW"&K+L`$'fBD-`,[Dj(Rm_[=,nO
g<SW[:f4Dp_h!#sgU/68O*kY[Cg`@ar\t!/G1\%+V"?NFmgGVd7F'4Z:qpEY7]AjJM>EQ\$9W
/htS':IpekbQ3CR_@a&=UNg[f0XE:J%/&@De9?PTb2mDR@;tp]A_<Z%X+pFUtEj8sC26:Jh^D
l'!ZP`RN=_*tp.c^f?MfBT26kcL+%-IM$O^Y9N3qU3*!4uILkoZ:M*j+c8AHW:+a+5T0mKfr
%uXLYVen'pm95n/`.+LsV))m,':ENFK>LP]AH8JCH(29M014UR1-3JC%()UDCimV5Gg;oS:]AY
S+R5sX<m_clbp[K@Z$CD2'#8P[CV7=Za9UGSho_d:A$h,qJFlEdtfG_4SRS<!aWRYQU*Wa`j
G"`TVs`<.kB4OTQ/YP`;dtiS<Pu`lZ6pfr,OG+D)-B%PP=V76k-_OfnS?(EM:.rpCaBj#5i\
Ol&Ef]A%=M>EGZG]AtrdCNm!iU5qGp]A.2(\@$K$1S)J43g]A<,qH@f@WL'0<*:*CBl!L(kp]ATOI
%"r@-\CAR1:'/0DmCGkp\m#rX2V@#7(<V`VNq(*kX@1h8Br#Abh9*pTW&J]AZf6&rdL(GT,KY
'PTSd=3N1WBZKS"5A"PRDd<l#N+bdhjQTT,Mk>I,5BeC9B#r-2Qkra#;"HB(/fE_!t^jg77#
;m+pf(a8l7HGu+;-,O$)W6#Ub6dWYm3;&FWU8ZMnH<nqL9CB;_U=CdiD\t6F1<.gj3@DV>j,
UK5=?CH2KKU(hniQe`WBo4,(<;=M'iUH5G2!M\S>^-XkGe'\@?SpWH7$8l]AHZ8OEL:">MKWX
_Fuf@/rZ-E`0FOG_ebjPmHo&:>An=L-NZ?d,OB+#Al-=a!<5_i6BAa]A.cR?dO?WI+)$1J,p(
ij0+oGb->8Loo;J1Z2]A*0i]AJ"&9)%6;PiSAjc+h`KnJ/T'4LJCd8RGB:h86FdGk,_^,'7(rS
unG=>6;EkcH:-k@2:XG'"G-->kGSDZ2`FrE_51ooN<-45b-7L;GHg!.:"$!;(=X^_sje3VVU
O0E^#lnt(4X6Re#e:>j*e@q$X$0de;a^)N`SVZY0Tfi,`'Cq4^oCZS+Dn1/_JmqSb)5Ot2Z_
D$:`CkUe[fY',ZG<ujZ;8:tj`6ZHkVO_oJ3NiPC*sN]Af_[lI]A<$01]A@E01m\d#Q?pHHG%^"o
('ct[eUh>r<)An%<"(VVl>mrOoIEUOD]A[3,ro(uGnQHp8p'!4n0[6bYHE/i/NL_1@Z*tEMYN
^PnNA@qVEBbO[#NClY^p[AW4>\\NhYY=_'MIW\uTD"n&>&j:XkHq>O:PpsZDeN64TGA^!\V?
?!5!!Nbs/H;m1QDk<$UU;eCuufA%F6SoRBSAQVu\]A-21di(S]AacX`Bo'"`a;B16]A!U2c2N=s
r)AF=Q4QJb@4e&6':?g1n'68lG',D@2EMNGBpGIH5it=HU93jE?c1rTO`9#93o)@mN/!!oKl
)HD>__upMru+'JHM<c,5O#t>k/bWo7U]A!)MRPb(GM\Y/<GU^jj-5nJq9FE_ltb($N?O\dVAq
-]A&rYSL$",q@@Nl_G)3ihDL]A;qie?S/[*I;a_Hou$g1t2JRbQYuTc5WZ?/EuQj,QR++@E5&0
1[j#B'>q9%QD!Jb#+ue36eX8YQP"^@V!9J-<:pd:#n-UNLiKbp)/^oF26.0i)a`:;_+P92=e
>iY_p;(Ftt]A)aXuC$7EQ`+l0\/@h-2uYe7qRL`-J>r/-41(20pkW0$e"3(<_mFh'QE32gR=I
-J3YAJu<b+dEW+jbDXN6KF>c0%bi/jGJ<a]A&ImQG3Wa,-:NFDL"5rm%PWcahW>,Ok[qh'R]A(
t>YEMVm>KtSIjQ!pT*%!fBa>9QA'()@R#<k>&jP"d[9./Z%2r=2/opBIG&*3$)9`20"QN\2b
Q<$)O#Cq@%uRlg`DDKquH3#knbd/snd)Oh_7EdGV$mh&M@c@WZr!^+3A#n=**d?8VB38=.2W
U_mdeeTV0.66-UkO70jg9Ho\@d^qT%K!A5iXMug^YL'ca/$)<UX7XRFT39'V<iVc"&T]A>c/8
bYmFQJ5CS5$2^neKoS:&Zi%/&=XH7;uFnX(CAF4^b$P</OA>Gn=O7F,EX=j,c!K$$8HCQ(b2
p</Vs2T#F=_i4bB,8GKo-j!<s2jFRc5>;d%&4n6`TX_"@J-%4orti>1HjrCm8pmM(m!2Utlm
`PVPM!,a\PFaqEhj:9bm@\k]A\=5FUk4@KP8Iea2Q>$Z+5@`G74SgaI=H<Nl=:IPs/ZC\olO3
X).rXL&%PkVP[63#m6ao#<=.o=/a:*1BKW1,g/8rpT$h@oLNe^u?2<ZA4^W=McC`H?kIo5Z-
jJP`[(0D6@@lF[5-@73-/1ogRpUbrV)bpR3O'RVF)_E:V90prTj*%(8f_R%#i:7.VU1in+IN
<OIp!)<d3ZC;a3Rh;Y$P<rCnKo"j+Ae&m(!C<h!,-67M"Q@'XC\`7UD,BOEuo5H)a62RF:Jh
SYJftmCgO/_3[D(g0/a"RZ]Am:eJCbKCpeOrBM,M0d?r.i`[B#=WE`+*1XU'fA,RZ[pd6:%e$
fjcJ!RO4T6A'5$>"WMffhG1V-loqkLR-^:I+-[g*eD/N4*BTqNNB8Nq]AInH<Wb3ce6c3:6D*
gE)&;;e*Z$nRXZ=g^AllIn2f^N0+,3-9BN_[P'8(CoP=.13n'fC;]AYH)3`,uS+"c0n0qkIhC
l4>qf22$*J5CFNB!,npgR^h;6UG(BQWBWPVjoCK)a-Ug[[8F,!A/-4M)T):i2g.Lc5Wia6M&
JhGt'Xp?<e/`o]AjMA7EjIHA6]Ab.OKXLtkZ=uC1t?'44$m_KTO]AKsF6M3KOcoE^5$LN=)"1*O
O8ek2C=8<chV#TuGY)j4M2*R[^+kFZ13B'7^B/8;0KlGn?4O'!3-D7UVLfpVq'fs%hoXLVYJ
!#1V;H0bW:RMSkl=)61VZSe+Gp`F]AZiBFRE68XI)ot[=L"kuB^[he_u%.Z<d[*fgK[g7DUYG
PO"l*]Alm!e:ILDG93&?N>VI#-[U1o^USEV#69^%!R!STllgc1o`E&Ioo.IV;CYoD^S-"L:1-
9=k7Q]Aj(]AGnJ;,&)Z+48\?FGs"5JUc0m\$Tk\'d;j#\@L_0W&f\W+0lW5n*==msK5gnD'oTm
bf/4g=9FDhl?pVbm$gIN$Pf'/_cl)n+&1f?E)/EpMS6roVTj92@ADs6D<@S"8#pIlFVXbf;T
?*]Ahe(q72/#inrFqbee_bn_sL"MGg2$-M*2X5I.8lUHYd+5!oS=>[m.'RNuq0m0b83R2Du<H
n4OK3&H/Y"<GO;8-G$ON3pUea.7"YI]A6X!OtW6BYg[$3E^VHc>=6[W/2"o)9m5j:&>[F>`;B
$S<`-mp(C&179SWo5o"*)rL!QVm1ZZq([OR,f1\%Cid$h*`CqJ*=j\rjj*H#*Jn@q]Arc]AO`'
^ObIU]AXD.3hZ)!M+]A`fGAJOk^SQ0rBS93-e)sD$:UVbtL0-Gkn+/#ge%oXLLAo;r(?FY5gB7
Zuo(!98=FZV3W^!o1,B#VW@)V97#BdC;2XnE`,-'_jL*;>1l;(G!),"8?0'\fZG!h^*NiWA@
8[h(c.,nCejQ29,U@tk<I'DBSLX)SM)aP:H);.iq)<h7pmHM+Q8#eDM;_*B?ji!54UW&TKLn
-Ot87GV6cs'@e]AQRSB+innKA&:ZSmfABtF;!c>_Q&kA]A[2t.R]ApqMd<2c5ge:NR*Z.!P:k25
FXVT'>Bm\!]A;0-(Oi7%USEi38RdGe"&m]Am*t=Xo*nXQ982Ph\<RO*%dL*p[&R/=bjL@>*ILG
9Bl8O2cRa,0#c)89YWfZ[F5kU1IXa#+iAgoi;8hDM\?0f_SI*I$WD;a39+H#F4`Z(/*&`_B$
c*789H,mO\m9.AG*&SKj%0o#P=j`1jXLX3Re4Nt>8h)#+H9P)ckZ$*^Y7.2&+6!V9$V%:(aE
"/lOkJgN>>AK*d4iups\bc=iE]AnA.s^*:t0c=Lk-9;^c(P3TCZ,:6$T+$tl_Q<"dr;hX)=IX
!-CG]A>.pP:J@l$9.31+u8a&7)A!'4Z]A=9pm0T!p\RQDYlbX0oCaV'^qO6a9kT#,0R#$c[Ufo
\BcY*K]A_p<I':^L/&O/ia9]AfqFV5spm>e.LfD'^"?j0b1S9kcOm:m)ZaO:[mZ-<!kbg_/Ygc
]A_T!4>k+:Gr`F$.iX#OqXU#%T0iqI_!OH19Ks-hnaPUW`hNu+V(uK\.LXAf(S)&pl+UkTC:r
A`?cWaOc.aFIP8c!cZ@l_>!jJNHlG$Ij4KCPne8!0WZ!Z=^Z-aC&2%R.lU^,[p\s(/jPG!8Q
a*d&T[pf,O?aBj*)P.cc<*T`6MrmO[<D&/4/c3+o1WgAO@dPp.S2SsiV;EdAoP_V&BZ;Gh8#
Zh45gg7ZX$s.Hjo+Kf2g;V"`^^rlqT0<[`9DK[dl7eLQPLLMMSnqHShUpsXO+gT@N[CFr"CA
XRF#6Z8jsKGD&(j2.h6o./)%SMH0a!QFh@r'XUm=J6H.TD.:%cV4oC,GXU4/GI8&sQm&ooR"
P:#^UcabY"5_>\`_FY4gt:$VYHQ=l^0@/7%VX"SQ[&h,9F"i^e0Ok<R("JJUbVgHmnWTqA)^
GX/gh2'=A_Gh1)ZY0Sa?1+DB5>h;^RJWTFEcefjO5=rC"Qb&[a9ZE_QK3;RjlrgHKd<bBV-D
53("t"$.esVpGd:3[a<?P7de[3!ZH\9,9eTj^A)DGj-IE4/C-d7&FK4&<CFi/T!r5G+b$jBV
UtOZ$g#u5\A`OV"Z8L5Z<pk,\:`3fO_ch[#]A0N4DfIibO'JtY56YFpQgCS*/&79[r0d\T>2/
i52E4tLa"4Q?9I/dX`*^Qku>"cp'eSd+TuRA-o'`soMW9<@FThK61kFi1Uo$R<A!F&m)Q-1>
G:@]AZ[o^LF/3*;`;5=ahsSPEV%Z=q%IM^Y3A4-(V.`)%(s%m,(\a]A+<+4Z'P&14O%7VbpR/q
BT74eWD.HQbr:it.Npu:l9`UfA?(j0>F6G'h?=<f07f'_\G<LJn`NaI7;LP!BtdBS`=Wh-hm
AL!(]Ah7O.Ek<)o1MJg1,hEP,<Eu`K9=@hS8lgp!?Wc5)&UbS&lq#OCd4%$nX)Y[>&/S\#>o"
MR6$e<aI508GnDVeUQ,$(Rc0TL!2RbO1aG$&5Q2VL5(WFcLp%%g>UD!U*^F\9PqQS&hK(KRK
?"SU-+4<Ec=1miKoeVGC@qiUODH^0Xbp.H=GS)L]A/G,S'Q'NQdr*%lZ:b>^!0TlqT=D6!cXK
upuF278kicl/GK@SSr[NGKlNI>XpGKnF>[399kPai\[Wlic2\p;nsOn'pFtnL%It7G)f@XGT
9T1[H.G`%Z9.7FLcn'KXSd`-*"=1(K.Jho\s)`inas+fN9#:MOoT=$NY59Js_aae>:%2opel
4SPM"`*g(@NI`G!\^hmr]ADBZWeGUH%fjRMu/(-=[/FOOh'mFQ>oN%aDplHoHL_QCP@4(c9:[
J!rqXH'F@L,**p0$kLI9ZFa:0Gus?9u`bhVGDGW_1,le0A48>d+MC9RUfNL7+BW??rca<iOK
M)giY4:cB^jD3/B-C.^CYe57$iQkn;pf'8-\;#orE>%[5uG5,lu)%:>K/`KBT4o)3BV__&0e
SmD>aKBB(5LQX'O5Jc:K6H959:e2XC=g.H2+peK.B6"Y4\E/Irr%-,:T)SY/+^:An*B\^j%V
.$90jY!WVhjNnf#1(h`o]A`^DG1c&GcD>iSgpu@p.CrhfCaRc+QASW$V3/YJ+]A;FDDb^1EVh&
;f7qON6H4.46lhBU'EQLCi5hkVtGE+gj_o3jHKFObrZI.fRHFB5NO64h`#QSVka6GTW[0%Id
2TVH.p&4/7SCqmeOgtI2gm6"6Dp*6$;_TM[higbq"UE_Ep+=RThY#ZfbXM$;mT_kK^)W8E,+
8%D/l;\oU+Hkd0&sb*-13Lf'4XT3L[-.%L.j09gP6)5<+/_m+5P5XG*K**?.fkGj]AZ1iE)tL
@h<P*Xj@u_[XMWHU%=gK4[;Md-s0F@CQ-eIhf$;GIg0(]AtM,ZeOD^+N>Sp&9IA4mac3J0kMs
B$p-Ci('B5pBmf^0)@"-]AO7L((m_QBjHV$h6f%?ItNSW!V:8?/6^G8ijf?+!scgc__;10_V!
%WGjW9mafTo?*2Bi,\uaZBDueJ@jX[NQ+<\n@tJ)+5"T$U/32#fqt(m#s4(^s5DEkPIiGW$k
dPMpR,NLenq.W!4h^5%![UCq]A:6b4W%qCoY,S\cA!?l(4;DK8H"%#&Gc?tKJI13BJ1tEh3Jc
Vl[^Cl4)d7oK9/%Oqo&YT!gY8K_H\8aFtl>Gpe3o:5S%O<m0K@,*#qq%k>frr\.+Xog8S$4(
EWq8d5^uuedgnj;)'-Yn:$D@b<"G&7MJF#I>FBm@,/t('%d$,3;T/.mNnl"2<fA/pc8<EF%$
d$_;*Ftf@\:&95H)/j8#@anXutUgBm(VhE6q='ct'o8W#=a&mrN"WNmIY@NEXBjG!V7SV*Oo
(@qG&'6rns4(FE`*Ho*ZG$m!-./0/-)WB\9_TJ:-#V*a-Iu_UNAJ;q4/JFUImYf0"=:N8q."
<:7rk+64T2['sOR)`G8,oI5JC'"\*M.Q/\2Sf49&1ZoMk8#i+R;MWgU7ec#\^kLGd'Ep9<]A]A
"<"Zl=#N[3sV.P;NPX[<uHNCLSNtjFj4[f;@HALEC7!OXUA!t!h`Y3UDR))Vgco0O54,PpQm
n(0X;1;Sg>ID.g#u8L]Af)tlEK?=684OYiWWRNm/k#-R3U$f+/2.QY2UH//Zf/H;"O1+&,H`7
:lUHZn>ru'KAH`eiT`l&N@?8GmP:q'Ip4fBZkog&@_4\cKn#&`$5TQLf$rS0$n2c5*)J:m)n
,WXb'EUW^M88="a;c+q;kH38Sj!j(-GGsfgHni`h1T*CERRounF9Ic1fa@aVH(TjtO;@g*4h
4qX%P.R[X-8$Gir=6<mG?+@EVDVSR9k&F0Xh/2PMFHU@4%prZt6oA?-pg*@(51?a.iWQ+J*\
iXgi_#UC5G0m.=[2\R"T]AG*etnJ2cq$e'),eU20ltj#n62qpFujqhE*Np$Vc5UT9h>rL]A#M:
:m'*QFi)_0h:R@jAgCq".T2IYkt$oRAJV3bKG#]A&Og.<_Wsqjg[tI%#jc>dU%]Ae"U\I[V\.k
[Zo"):0C?e/(otP&3KbS51-XP._&Ai2CH+P4XRt'7-<rBT,FDa[M&Mmtn01Ts[#qfk&+)WNP
RDdHtKV'_jY1`G'X_bX^EbTU<gqC5qa:=X0>mPqhqehNT+LRYXOr8]Ab;nAVPdpIcD_a>mQ09
Ga2'Ze^99>NX9D6sEAWupT'GFi".12_SLY%hG\m/,LhB?X8ZcV.j(IK+hg4*,<+<c_s;iHT>
hBaP>(0W!q*d,O374H]A#>UZqk!<UDT%WaUH3/\<;tMUroa9b\n!KR5D)guH>6OEju1nXp>38
gr&nHTFOd$_3L,VF&HFVV#Fl3tMpBoWQ&m[B@4Ok:D'O@Pt;bhU+m`7[[?%#V;t,"1>dSh?k
8X)uK,B"K^>VJ;IgGEDC\7?L,dZfW=r217W%kbA`t1A,#srK'W@`EQX)!b5Td\r^)&8aXpNt
0j76>GQTVt$&SMZ3__EufqAX<CsU/DZWI_(_X31ri[h4RL_M-UTX4-<>MHlJ@6F)L3l(pO30
V7a,*6Lu>-)uc:Q<,BWUU(t:,r^N^_gGQQP9$PhsCOtmUaj?*fO#$`Ak`5[f$BW<_<pBe9t[
VJttG)liUM4m@%!e#^bFF4bj@mi/o*>YTD"Xbepd]A.s3\jp#im#EP(&I]A_G]A%iGu;J_dcEN"
#2fAm^0+4]A@+&FgZqE\JJ71[O$j[Nn+.oag`Q-($CPghV6OCG]AA$CQe=RJ-GV.?RAH!?eUGD
Wa]A\?`",n-aA5GY9dCRZoa#cG.\HOY0B%\rtHg'Lh&@NP7;pZJ)BqO-r7?pC=>a71>W)TKT/
Y/`4mM4u6nWJ"B_WcRWT+AZ_"1%7G,2V53r6BB"(eXiasBUf1b)3Hn!Pf?Y[T'2EbF[Y.]Ao#
mhjqtI1`<]A"MEe`U8#s7dr4^C`N:2YQ:Z?AV:32c&?I7?&OZb#0NHVK)D[s#XW7<#2X2YItg
jn*nQ?D'[>9`"g6AES=>ED4)Vk&Ngm\h;;D`!DSk:U<"9L"E\78BAgqPS"icYN"9iDrf]A,'W
X]AgX)4aloVs8RO:]A?=Y4Sn_^#S&uWVTo)bUcSOFJNI>a*:EUI.`2^#FcHd1=Qh#Z-9Si%l\f
tso2'&t94V)3U[_tG/$m630j\eIiKd`Yr="Xf:($dk_PW!Z3jGt5n7PM.B9^smBc1mBKI=.0
aus`h%msE+\PXEbY:b2n=hcM!ec/uQf!InsTX]A2VBQ"!@QX?HH2PF_]AU>LWIeTRHhdX!%#rR
===IQ[Fu.ha;kIX(<H>UD2*%))GUfA:m@Ul!#%G/$T"Z$ul6E/Y[rCXbEqn)^aVSSOs=(s75
Zk(1uGrC+43[m,XnQqSho2bk%pH/n[dBL79s?q]ANs6cq?t4XUm&e=\SjBBhmI`#m"bWR#*G,
Q>+Eh'H/(2k2&3dFtuQ+oDJ@4TOYs<MLSePLn$uX\$Fm><#tPCn*\NNALO[R4H<P\$_CeT:r
L/j%@K_/Dfn?ILfZg9J3K1i0B.m_*]ABeB0Rd**I-b!1RJO1p&]ARNi0g*<md.ng^CNX'rsG\k
r?oc"#e)%9<MOqINbKlF_*.YC([HjuCOtTWq67,kZa=<hIQk,Li#`e"<*]AGP^%gES!kpT9ou
*'Z,LKE%P9AXr#e7M>Jr&gFGM;*Y2U5MNd;Ai3Hmkrm3C22o9KnB4P>2`ZSHS$W7.o?-EqX-
"oFg]Ah6+g8e]Ak;5o3</Y1j7Blh&1M&N&_rOY1jP`d;@$RD4$7bE3QM!9_e\ZNAn)/WaNM\n5
$Mlr5)jc?XZ$p79[O)b?+Bd>M*#eGao2+R(mnX(:16K3I24=)-"N$L"?>[Xk2]A\4"a]A,bdfh
$+(2bE1g$aJcmo6bYNd$)'XEEspl$l"2*C[*j:TjQhOa6h%2<]AT]A1S18h/mEGZ7HSC;TC?@!
OXk4^SB$(EE9!Na4YV6O&;\(C^\H#VW$^_`Vj'?@:?Tg4J,$?jbk"7LpY4t9CM]A:n+Oo0%KN
]AMiRJYXRRRIcbon_@:]AbjE2#KraK@%*b7DO)1C2"WlM/*=GaVC1S'<@TTi9$3_%!cN5o<NU>
DIE1H&q[2N>V3IeYNq(`#@QqHOXUCFWTIF%FKB`A.AXiQM1[_@$DL3*]AINJi1Al1r//[umT7
a=mb5Oa."j>fR5BgC.2pPH05=n#K+<=4@T&nJ<h^\#G$W9s9k7Y&_=UW,eXI&qNNiC/@t4k%
0r!Y\EgQHdg]A;=J%*`"KPs<(*!HgTd"]A#)p)s?g2?"63be)G.U-!A,(s]A6=N0.[_)=E'M0NO
-M1K7cE.3IZN3Qh,p%`]An1']AXC]A'hZml0[,K.^ts!Sepp+e8N\3,R2*?!pXM[JQi;fdD#5!*
n6VbF'/)m5sk/I>c"rVhIf-^6U$b]A&tSNIf7j+Ngqcj>ADCqNpHQB^<911QE\UU&QLOs>3m@
RG!?/<+T).4d^tUI#FRVi`HaGD.!%N)-+sNNq7#clUB.Sm3cnku@.%rcIe[tVm;l:pDPNTZf
F3utI#uVQ74\^a!L_2\rO+ns*#Bq;^g_49:Df#rpDP*8?/+(fpuV#m^D%IDCrYj<0YZ9kV>7
mX18itl'j9]AaM5<LF\%l0!k(hadIaq_*(V1CN&HWHhr;bJsH:03Wi*"o=V$*L!C38IN-fY4#
pVLuUSur"jp@nOs~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="480" y="0" width="480" height="270"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report0_c"/>
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
<WidgetName name="report0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="1" color="-8355712" borderRadius="0" type="1" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[=\"    一级类目\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
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
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[1008000,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2448000,2743200]]></ColumnWidth>
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
<![CDATA[数量]]></O>
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
<![CDATA[销售额占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[数量占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[利润占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[应收金额ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[数量ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[利润ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="10" r="0" s="0">
<O>
<![CDATA[库存数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="11" r="0" s="0">
<O>
<![CDATA[库存金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="12" r="0" s="1">
<O>
<![CDATA[DOS(天)]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="0" s="0">
<O>
<![CDATA[库存状态]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="YJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="动态参数1">
<JavaScript class="com.fr.js.ParameterJavaScript">
<Parameters>
<Parameter>
<Attributes name="a"/>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=$$$]]></Attributes>
</O>
</Parameter>
</Parameters>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="YSJE_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="SL_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="JSLR_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="YSJE_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="SL_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="5">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="JSLR_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="YSJE_LV1_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="SL_LV1_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="4">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="JSLR_LV1_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="10" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="kucun_lv1" columnName="KCSL"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[YJFL]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="1"/>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="11" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="kucun_lv1" columnName="CBZE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="12" r="1" s="3">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=k2/(c2/30)]]></Attributes>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="13" r="1" s="4">
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[=if(m2>28,"滞销",if(m2<21,"缺货","正常"))]]></Attributes>
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
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-6908266"/>
<Bottom style="1" color="-6908266"/>
<Left style="1" color="-6908266"/>
<Right style="1" color="-6908266"/>
</Border>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-16776961" underline="1"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0%]]></Format>
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
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<s=d;cgR(%RJGkU"8J$E_1VZ6[Kf0GN>(:g6(XHMS4t/jV"[q[)gL2&'5=#RW_k+>?XrY&1
gc->)="@gle<EUI@`c0jl+I#"UG0!4h"\rcXt%ER's-ml8dFB>1#9prD`d[FVt@o02X7^2%T
`@.U6T^W.*S"os2297M?Z2$!,X!.`\/ffmJ)f*Qs&%KNdR?[D8<2[YS+%Ic0>N!=1G*tTM**
#;NI[>piK41>(KU%hs9M,J:-p16PQ\s:;PI`rd6^@i)0LuVk=rV;H<Hq(p:Zf4Mf4#a>@DAr
h&\Je.b%W$YW_]AYjAlk2W_R%8'55Sgm@[!4nh-=\3W6+"g[UapR5L),A>(h"cuf'i#d'EV2h
gHqG,Qieji-CD;'fdUul6Xc99KV9'[mFO4rG6/T7g,ZB8BF25^&/YE;Vo#*Kd*HIJFJQ;o(0
DC#FrQLD"R[]A,MW"jFeUPV%L/-t47K?[HoPrT0Y-ioY3R3\A87)aUnZ5;>B[u^B.steX$K&$
O"D,[0VT6&gdl2</^?.0@)QX.+dj!\R&6n8C@scp`j'3!P4XS^;<%UT9nqi>uEn^!o<WD\]A(
l?F6Epp/Xb,"8V@nJ^dW>difNqkCP#70W1dYk>7$YYdI*<G+fQ3h$C=u^,2K*]AiZii`S2e'B
a_$s:dQ)Epl0Hp/A(qg']AV%#NnG]A7NYu.ue1og%aD7iK3`DF.m3&g*h1r@I/ZWKR4*k@'3bP
Bp+3Q/+'o@E#g`.<6Cp2QR)B1%=5X\mSZTjIU'td0kjjS-0C[u!RKFY3ip:O%'N74@kg/7pS
Zu%_Rn;jam$%s-3;S3nIl&:B_*)'/6a5NTT@=F]A1R`3"uQRYC9mLV9Fku%_,!Q/53:/[=9K%
7So(=hr@;*kaFl8"WfH(s/p0YijoR?C-)P#_i6mZ&G:J-D\VPN*MJen'WaWeml9YLHC550Z6
RKZk`!![ObqHTnBWl6s]AX5*1KC6(SG8r/m,XB^FZG<eS.X=GLoOI+UK,Z@<.kKUe/0XKU4/T
MK/2^YQK0pFK4!HUf'Q$QZ=)3W&PcDc%(GZ2TER!A4\`R*`?c3eD%`N8<SDFt$?DnBVFi+?_
Ie%bp$lTpTmIdk:`;I9`JpYI_g*PZ,TTRDlLsZ@l;qNS"TuT<ub+h7F9O^_$h"^-[QS:Jt2*
IAI%j>]AX<%9STXHN;Q4sAaZTTW@VX+2O'^2%"SD_&&I/1l_#ErO=[J:<qY`'D'4f(X\aZVf<
r&,^(MSJkoY9n@'Wb_'kA)b6/D<f6]A:Yr-tk=)1MDXQY0fCq'Km=@t+^kEstI&[5hU[4H-_[
%t<$+RfoaDdXg:M#$@3!jW%[ZCp%`*%WsqB^,5_!;^^sE1mJU+?iRM59h87a'J\HD_1S+>Qi
@KiAo2JY129q2"Ncs<=a6rLK+^+'0)cI@UOXYM'DFrl]AWo"i52]A]A'-7t05V./Co^.DZ2^Rt&
ne%4pa:D1Z7>QT]Aq0nVDP7QZOLG/3lk=i?9=^MaPk,E;aeD:P&:m5\U$r@/:/*B<R<K"%Zm0
eL;Gp&>u&"+.+ouu!T[d!:F5!^tunG%E=,f,VlSM-JAIV.G44)NEpiIbTaM0!]ABPZS2PFumA
RAMSO+aS#kkk2Lpn2,C#ul^X^qJY$A7[1a[f8hY9(ed>]AEQ%LGE-[F7TKj[NBcQ-@Cqm6HT.
XY'$-LYVRM%Bq^Jl@P\S(o>_%@#`J)6Ncl#,ajO&;"IC4M`D2"N,Sq;a)A6EU_ZgasOr1fb&
qU8.i_M["C"V`&^'S9F#d\i"o[u=+EHX+77G/,(QHf(0c,17Ufg%PoeB^7n0,QjC"%L6",ik
%1`SSFsp9tZ`J'Oj5_``rY't:/YpXZXho):A]A@Ju!O5Y@Q[`+>Y512P;9,\R)alB./RWe%kJ
&G;M,5nX`uu*@peqQ6`m1a^jtb<&jaoq!Hh@_Bb%6(`Z4?ZJZ=b_Alf#mgAI'@."TuRa<k^V
sSpqD+)D!^`2T;_`>&CM[;9_C6/jZ/r07<[U;lI271M($&,Lb79$9(V_Nja7_s'_2,YQt5G(
qW=$RJ"BH"B[=`YuHHdA"-*%TN^%e?n(h'9"A0(1PQK;;nJ86U4OFB5Pi7n%+E^!ngD!%L/0
7IH2IdXD7gl"9bf<kPOeQXkO628W-G4"^;U^FnXRK6\u%^nBOkDORiMioC),M_PQMb,.Za.Q
SkZpI$lTXP?sg5#M(OFS1C.qcGD5f'^bn&<XQW2CGXN)FqW%DHiq%D"91)/]A["BU]AN.2A-ng
"'Z=4crAfs_Us_<YKS#M^PS[.KIe8f1g&7XiPV.4?)=8^l>XgBZfpQr)\)Ae]A[t7Wo4kER#W
r-;`R7(X/dHMCsh[<;JVMh<E+7D<eeQ_kEd,i5';hdkI_3O[bA=Z5fD6Vd7\FB[C:;gW&N=@
`ISTVWq>@Em'j1:1%8CM`C`c3c'`)aa!(\;`dABIQS[[onASJPL$i`E!16!EcA%Vb:A/1&6C
j]AE=%OjaE2hn[]A2[OSKA-aVP'55N2/r#h&Hj5kf*^.;?-hqNlAKeU_Tkd@?YP!>qnH=#MY8p
ah/Z[;eLic%DV(%#q!;4HGfuih!Xfs[1J+kf6>,Bk-MOBE03dc[)nTdD7*,Y]A#2m*.;TIbgE
,K.>KrV+668Z/NgRaZ`F$3@k3PFRjJQ0S8NHm,mDc[4&$]A,B#Y9$(Icj]AEa4R34j'cDo=4&>
q1g.`oh5:ZAJ)ESp#]A(59^PNhQ8jS54m=$D:93,rgD2S@k.K*>iOfZ_r/e4N#P;8$;o&i9JQ
R&n!/:g`fUlaoii$C(2ml`Z.aif@WSqrK4a[5@7e`0EVolGcQo^be\]ACP,>.O/VfkDdc$>90
0:MPY6F$Wj^&J3=['EQu5=,-P\8XKj0nZ[]A6.#&)`3M/C^,3sKmg0%Ot]Ag15Z19@mGj$Q!*W
420/"#n4?O_Y1E6IM^_h6S@KA>.hnec#<[;2S/KF7iZJQi14!e8kRSpW#!ael>#%hc_Pee(/
*^YSUsRMk(8\9mISrM$+Dhs++pn?Cfg(S.&3;U"[^tg,8eN<2@PoIEmuY5BX&SRRXB68+f(4
bA=\!#[VF3sUWR(sU8Aq_Adq8L3_L1\Hk,gWmfnIF;4Xrn%(<9mQL6_I,T"J^?U$(8Z7;,?N
,.'icdi6$\8oFA@B>**>d\&Z]AJR#PEUk_@,.-uJDN;2:oiC&^CMlS7%8aIQN[uR\m^S(U9@Y
[pJemI>O2/m\iEj1i]A$#8nP23_l0Igf1"cHS_!TVHn18iaD;ks\XP<HH+BkX?>RN`R--G`$S
D9_r4oPIl;m>s<`)3NF!J1[[eG6d:*VC;ZGI<j,*)YN5:GlWDf1r9;M7)XJg.&VV38=[I,/g
lu'Zk66BZ7FK\AE=4,I:6ofR7l4PFIBZk+Kdl[j_,acaNeI;:CV4lm;9sehAsX;SIL5)E=4:
9N3J3DEo0VPWW/jb",mKlAB09U(ShniB_bY+#`GN0Zu%sf#q"=,Nd(ADZ/YZlQ]A\uPEn#5+I
+Q=7=Lc0Rh<PSOlS"?X;XuJgGIA1DZuIh?-oOHG&D&B?=lE0GCUtXtg.1/sWBo8GV0[bFJ[5
Ca7d?$Dl>ss>fW"t#[hLbOALpQ/VqSRpdM(i?Cf#(W]Aegs<j4HL(0h46/*a6\Y3@:h5-A3R/
qhr@=!XXH5eXhAL]AC^)Y;h=O%h/IWI3T76e>D',K@>[;q"*Lp\</1U<hh5<i`HNl!Hf3$>5*
nE9e95Z3d(6[Cf'c(s_M!0u4@U2)09VW!puH^!Rs\R6'q02i$YdZNa79FXT!SW1/mO!9m4iq
WR*<"W?5[?OF"I95;jG@gQEe_^Ho`$LYJDs9Us"0qohA'4jRs`k8]AN\G)3:KG%iDIqhnZ@!Q
t/Erqm_89TW'%tlQ#'jC2J;]A+Od`0KMWL--#-WhX_(1t_rI5V.diWi&d14>qCnf4Y&S\2J[;
m2j^_unglZ0]AcmJ_a:XZl8I;nJ0O]A0YTGt^n=D[(/H9XCWQXdKl.Q+30u1U_ZYj'lT2DU-&U
ElbK&fc?,&Wunb;\K.=3=X@]AW5i`BmT;<ZX,#tYr.>3>YdP]AV%A;5-K'lEb(Z21G:S79PCYs
bm`SoL7F`EHM?[B7#TS*V4;LTcPm<j$F&h9.1Q3m:_Mk7@\>o45]AlNo:2QEeVcFh:*Yl(5S*
dm(E4nai\=ASK.[t9_J9eYc]An^7&R(9UBDh;BGtohQS<A1a5q8[Q@3"M&Clq=.+Y8%";P'l\
+O)#O`0*I[&)<)l+6!*kfP`>KBhha^8@Dp8+K4gBRQV-6^r.>idc'd,Yf3++\o%860;$Nn6K
JS93!Nhk8&j3E$`*rNd<1g/cj0H%4=M_U!F+?]AR.O(/DY,b9@:./:MP7G><:qm=+Y:aKeLLP
#$7;QdBq2l-Rm&8T;F%IWVI+':9U#$mH]Accg/B0d(&I+?3HDjB5M&??LQC6k\S=gEH$0pV&6
C^Rgn0tn[uocn8'?W1_8;6<MLZ)p_k<ZNP*g[7-"d1:O(`?0=8ZD]AQ&>%c@cb[J5h#_KC^s3
7U[>Ui%327P<D)f2%d`[fIql@0/61Rk<d*,1CZe-Dg($L:oq8mhk_6Iq$#^*`T-$_A.:'K6F
Ds=]A2/-X9_>3^`]AnX2)4WK#go:U3A8$(WOKec_<]AUQ9pD@UbuU(s_"@f^e2@*YVaN[b!p6k7
V"eUCrIQOH[:n3l0Z&I6hM@aT,gBtJH#2(_JcS6E89b0;U'58O[-%(n<CoQIW<X=.tlV4W\'
'NH;9UF3nM_J\)KT<SD\;1u5*5m^$>%:IMM%N)W@-R7OT>9SRj+49mCX^njLcQXchPh1uX'O
UfiFuWE/gWq"L,NQhf0m4SciItjg,Fu#K6%m"C=i-g:Dm[W<4,`'f328$'d>9M+2"175rE=&
)aD^S;+,3JN3\;qWcb'juQ;(X;rAGeuMf.n>C4Dl"ee.8ZdXL5BD[<ot:6@&RnsND$ACu(19
MeG63ch#qWR+QKGrMC^YLH5,c6l@-ZAaYs##"To8nWH5b_^RjbefdZqgM*AM3@b*)fa*%@sU
Y0"WSCPrbLo\4\5hSMkMK=`X4O5K4>__%#j:diZ6.<YjDJ^o,/l%LE^%9-A]A+c<Wi'A3oD/r
M@1be]A>OLR7r;^d_1CLT2N+qkk;7T@'sko#$L78r'(FV1)^MKnUKG5T.Io\\rE/C:cqg)X[S
-i]A$ih437<*#?$`UYHA9ml=$&98f11pGJWqUWu$VW%+QN_ntB[V^E)/]A&.&0Gu-na;o*"7-P
iGMZN?0\7TV7j!NPoT'`gHBEHU^dO]A[1ZKF[q6;^RO18Tim>(3m*r1'EW,mM8*]At]A)%N/tWU
<Wdt+;ZE\G.E7FNUXN+1pkemLh1OUU5j"s,R4@ln$q3t[5_rGVcpZ5$Uh't;W+EsnZpp-RUT
Di/4ho,((_.*^G8bROnNc_P%t2gVH#,tV5pM8R:=G-Wh-(F6#Y1he8MbH"Fc?Vmj469-5K3h
bH'OfXDEQm#E+>5D+*lVD8YK=CBNqLWf)4tV1B6oo<ol,0#!&=KX%*]ASTM=n`@K9V(fL'/oH
CMV13lN*m=9.nn,1\X'eM^Y"He,Uj=Bo@eWje:f7fhirQIB7>u#h':;3.C/6":YSiA>t6o=]A
-19kda1X05B=>8qmZPhdMZ]Aeat8KYlTEiDlk4SLdeg4U`@\+QVK@Pj/R8[<@R&nB0V>)Fi:1
0P.]AU/ILWg['Yfr6al^K5>e^Ea/l?l:mPoE+Q5!=GWR]Ab(qg>Rj*s!ZBUML)5hiVm&`sVQ07
_Q0<'#gB+78q9;1-#-??gHKK'nT_"VHN'-e+7qS,T%B9G)q(<LW7?'mL5qJQ'OV1e/e.LaIk
Nqm,(KrUVn:Ua$+i1t;M#K\?9@+B?[3]A!4#Ct+$(&T!lm^R)^TIVG2DB.17<BZLTPoR>:`G7
Vj3GXJnHK!9hVqR-SQi@[)"'k#q"H+o2pl09Z/j&s5a?soShA8p==S)W]A>Y+h;g#gcf(p$)o
1(=Y>!79#oVLV3(H^)mIA8M=7"<W4FggYlEo^S]Ac.QbM=ac1)TFOgbJ#&`DWc==uSVBd:<+F
FTh`0DGX.F^+#-+KN7l2NmS.[;EbZ,c"(k&R!50OH]A:;h4=P&i=EYU9AF,RJ)Ck8[&.t$N2/
O;4poS(VJ`!n([Qcah+PKjkoBm(PXX_'!KgLoFjr@:hM.EZ3?an#L9tdK0YB=/QHR#DQW3-T
4Q'_t`k&&&]Atg8WXR\#0fiQ2`0NJil,4bo\rF;ntAlu-I$%k7?n>IE?!X16La4U@>cLY^J%T
RK=D11l;[S3[eBtiqUrj=?*(T).!?->kRF>3hnk@jkOBs1&MBmYGM.$NPk'UmXrU2A.3VMaE
D@rhCKLQWf]AC7(A'SfQTo.Mm\G#csa*>JlYt=tI&^2g,M!/D"CVcF9K0G2*)Q>3!Yr$gNshn
tV*jQf-R]A,A1t2Z/PCG;1B1>PAuOC[9g3u"7N&cW7(9HJB5ud:s`PhA4if<plnONiamT&92k
&Hfq]A.1D8@EG%?>6YlF2@p?GB:k/HkrH$]AA6\^HK2o3'g_6L@TI;Rcq^Uc?9AU5b8n_.2T5>
+`lJ!Dm0WXDp6FKX*_9+M\+JnK1FsY#3);-#W1hD:-%gpiu#lqa@0<q:"S$$cDkZb4DSFT1>
+,(?N$;U:?ZV/qMBB^:[AK]ANR<;9hB%I<g\-a71r@'UhZZ\K[XDqLRT&Die/s\H/3J61]AW[)
+ohd;Z&[8osUsj>*i6,tW.P-5AjhhP;roQim*H6iuGEA>3CW;>C7V:n!K=4ZQ!Ic4+cNp855
0$^/f/Wa+&LJ-UNZ%=`eDQ'Sig="TN5U:kB;eJB=-18&L)ILR2ZO:WFuoP42E['(%p=W@<gD
t(doMX9W2Z;:NrUjKPl3)0PG'q$R>bBI]Aahc9XeOs,O[PoD3?m(Ja?Kg5;sc2D#k0hjCWSR1
_j]A[76*+7+rq)Z4I)3G%en\`1iN8RbpA*a#j!-]A-BdnWkj4"SeWH@,lQV5o'DnJ,jcMkYp>u
dbbU0HIgd`mr[cS$B>IPk\1JZN[&PJF%2llHo\M+t`$$K&;!G=7;n%_E-q'"u#`#mY+PmfMs
GmqF&Rb(-4:RAb'6,>k>SNNXU'M::"Nn4;MTm=s/qc-"N,?;\LuHPBls0k;D&?q!C@h;5>7e
Q=#_*3b-h)/31G"F"X0\#Lpt7Y<!0IDAHi.<mtU8ED\h]ABID=M7IBVH:Lq$JWpT/H^%lP6h-
N`Snmi,7:,Y<[P\W)_sa!*^X]Ab"8#Gj0)[s:3I3H!@^Y?T'k"N?;5quY:\CI-Nnmm]Aho\JI0
10JWg0&1\#ER@XtoihcsUc:Ep[1QnZ<dWlG>'hL'nO<Y6T!%IBX(*UcFZ%m0%m-HM\a[5:f+
!q^m;AP`WTrl/"<oAr#[RNgHSna^ZF9h/poH$qTBj*e;<Ah>j;-H$@P15;KCbu4Lk_g\n*(U
-k]A0f5Zp.&:oNn1;4@TuqM$e=kRSX6=pJo^'[;aUb,6\1rdd?j?'*Xr(3[BV^,Ber82o!NV4
A14,O[!5/(VsW=AA&^VMiF0YD`JXSP"Knng?7OW.nbS1AW2G>m02Y*Vc#>A$PB,u8,TNuYBt
&i@]AR#46;*.T$d'%26B.tX86!4Q<*Zei$cOr%%$X>[NZLh9E+=VKqiD4f@lXCn,`W$r`dBf;
=o="-\iJHh[7kulF<n5qP(KTH!KFtu7t7^&X!SQ>]Adh6/eS*]AJ^6t:ZTYDrtGW"/NUmEi0\a
nNA^)Cl31K@]A6I[?6"%!7#OBS@-TCKq<Qs)Z12L"i[Ek8eOMDQF;EkcscAD%j3K/o+s(%ktA
3R^gWeCJs%;*cJOg$fnsR>&5.N8LIZlnquW&G+5\U!QcVFBKmN+R[dYp6>SYD*Mu<IiBYf5p
Bun;?*AZ$C.IpLe]AJNTP5TL#`3q0&*s)SC991AQ*4/N#nO_D\;'U4_&;c]Ar[4\h`g%a(Tjh,
9Yf[fu<2?$B_R'q%0neWY=Z_#N#O84O9eVB/Ci*'+:kK%SZUs25rF'0>"0:OfL-2S>6B-cn@
Z[1W32R._G?>GoHIT]A&U[^daAld-Hb^sJ6YRsmlC7*3GdDRT1)72[WLT@P@;F_UO,SDM1>lS
a-WC!)$K>^J5d'YFK,\oQMpf/k]AIh/#ROautZ1@m^tbD.<N9FKE&i]AcCjb$Wk89eg67(5gc.
F;,)1m_Ih)S[7BQu:6]AY@s&M\7)s)g[!`I<344d5@eBp+,i?_4<3g1+c`n(i2q]AmK@Q?Nc:/
KE);06c0J%V?!LbchO0#u^@oUN):'I:0;PVun(CT`_<J%3MSa/f?;u[4J)7p;Z3&]Akn;t_G8
jOVt\?G25YXg`&7;6,nq-X7MXEfUZf;PA2qT+(cc&&J$&9gIJ=>=m5A>tM+j)>`I#hkN$:!o
CNpGZMh)4*0YHUWFD>H-N_V11c)q\Aj+>=L2X8&<qBk`;4<-sUYlP^n/?f/!JH1IScbn7ACU
(Eh_O!<&;!o,HG]ACAq>1+(fW9io,(M&C<D0uE/T98ajTd=gJK_d*k#oMra.5%I(Z6t6d;UK6
kY&DDG4;!X0U":nrk<DEN!uh%LL9>AFGFMtUeHEU_`T=s=CAM>67"C(%KhhfR!I)^U.Rdg]A@
pO`W;^oEaNa)VZmj,?XFW"XWWO?prRHEShWY0<1atef*YGeaie$9g07DG^^VB#noY#4Q`<7\
(Eor@bu.1>q)T\(YT5l3-9$BLe5alM'F$F_(1UuS\_i$<,*]AY!rn:G#WDD'l>1Lb,`48E]AV/
ZF6BIegnJ>2;6m=.M52,CGXl6&C`99K#'2'otmFqqN]A(!]A'f+]A`<-l=WUK=_+NGA=+g3\[''
6I>dZ?ZJZLS5Hl'A53*[k9s3UUbaD&bg!A9VK9bSTLglfZ,^QT_eW#U=%(/YpqS289)*hl<%
OV9`hbT-Wl$H>=QHDt\UW-u]AV(gThNBN=/E#DLLZPh&bK56!c\WGIQNH==$nR[IL9ghgfM\D
oZGcJd#B)"fMb*M(OobDY(s&Ylqo,,VMF/0QTVhORaJgb?I3&PM!U"\Uh62>$53]A=;5<7%TJ
Mm0ujkQct=u:h<c0r2*W1YQldTXgrQ*([kHX9(Rp$G(/g_'nO>(O&jtJJ&R9?Z`p8MubpN>F
/."Y.6f4EA/a49c4`+#h/c;7DEqJq@qqHqIqL-AJ9iF5'AINQc-X33Q]AI*cs<KqrjnSEoJB'
OrQ^(n),ptj-J+[6)OaYDY7-BPFH$VdKkP<B<7bh)OLq>A3"MtV;eZ'=ZR)B5"8MppWVoh!g
q2R@9.acCObM>G6Cm*b=X,*!m,=E4)Jijf%j63ahrkdVj\kq2"a:.n/+:R&s1j05rC`X=&V;
&Du=L,h<tA1h"de1)ViY$K$3iQSG&JOroE7?b.68od/785,GG6DZR@H>UNj`mG74NCsV"isM
mdUSUSbD%%YG8JYs2#mEb_m#\7S$A0KuIrf.G!Ye]A0?MBX8p16#HV-\&[h;[_<GmqctP5Q1]A
L/++-^>s(eQQ8%_b>gBA[3!N,AdBkWPt$5m.aVi?_Lcfp9jRbc?6G/$NcEWB'5ipV!W1HD31
iqcA'9V,XmA^V++TVdPsc$DidHU(<5WmX$rne;:/XuLCZoBu7$HtX3#U.WE<`l@[Y;0^DETH
/B_?G'WPHGOPKTP14*>8*84GF+%Ca.)M#$1(]ACGNRKnb0uo4&*@KhP`<.0gBq<+G/ON)9mDI
=(gUCX?Bqbm^'IhZDZe)1Y,%rrW=#CB6#I@O=4^N;?-cIWlQ_#W,Os,M!T)nbTH90"Q,H=)1
!^OrVKk(Af!6OcA=X!8$">_W5-aAAC>,$-UhB"5))9EHPm"?c-D\8jQfg]A>C@TMA+h]Ald!TL
)<Sfo,E;#?VY/e?)&uPu?+!W[%W5X;FB\bU?f9.l;;0KakrS/XE;Zipg_$YZp'mEp\GPf=cE
UsW\[nc9_/niIm*RUGf6>q!/D$c=BHU3%Z:ub@s&.c^!*Lt\"LcCG2=m?/B<">?q"Jgq;//3
ue66h(%SFn?.G9(fO0+Rsj,H'6d(F'onb+gE)n*o:=K+&'5b"F]Ak4VoIG=0gEK)qEOYPf"kA
T>/,Fm$L,,9(ns'>f-:HkHa!;@-f;=8^<k@UN"'`b"_8^b"/`d_*FI8kF7&q(taj=l3=O9A)
63I:Le4A%)pR>);XG7-0t\%peG(3s+P]Ape2Q.csA@BSH;rSS)]A!`IA8-A79!TGX)U`c(a>Q:
ZC\C9U;cC[KQgD^^BV1%o&]A0Jf[%0__W!buHYc1@_$FHX*b2"9UQ":*,;UW=bC&.iOAcLf]Ai
sf@=6&3In&X)^Fotg%k9VjLnTXr![e:t%6Vef\281jeb+$Es^NT*1%fD1@gdfkJ$-6!b;Vmc
&s-S\Y_"gK$qrnOBrqCPcs#Pm(Z>`D#hl#u<T2*-k6ofU;hi?CGNKLTU[2JBH<=>CC:^KIp)
M'^X4h=FF'+`*OjrX)(RI('FYm<nopGDh0)fR[K<K?\C>W)C%9t9al<PHLB;l("NIV@A,^ej
3gf]A9"aj'IuIcd_tbqe2qI8>`RE%7fj`CtG;UYZV5F[!Mus;s/Vena5u;f3rYaqE/:(I,?Vm
iZIS[1%toH,cI;Rh[._l)C@]Ac(Y35Cr)kF6k,"-\lBD20CI0!BMs:)Y5M.049M//R;5l\p=k
]A9ia+$$>@HREME45meENr&UhZm9gf7PnqG*O&pK?.S8W[IfeW'$ETNJ1'ZUik9e9)]Ac9O!H7
X@\TV6!dqIgp'F_Ms*7[Vli$\=7t;e(E//Q`?sNF^>u&"^E1Dlb#Fu2d7J=F01A<#POF40DY
nJ#*n)m0B_al+#+saEY\sG2Ba>/"mKO]AgoARd!r5M&XoCEN02g2QVSfRotQr]Ada'L?IOrIVo
[)c-I4]A?((SX+l/DM:aRGKf5F^bH6OA?iNZBEiHLY"L<]AC'T3)X[=]AC0ak?^=Lk@D!H;kN5Z
KB;G1IcSO$feNA)]AO,bPao2^bQdG<u8>Z#Yn;rFnB!0Rld6E%pXp,&@#/X-nD7o&Ps(]A!DRq
Bi"(PartQ?qiP/\(I\d8*Hmp\fSDF#4Y,kJ'W\j(SiFh.=BN>a<kboao0->N[_UR@Zmhp."#
CFYR3(,8bIYs36Mu;lP#riEY@2Cm8T_mhPqNG5fZ^E.>k(J$cb7`IMr;@Y2ULci2c9:F!Je8
g2KG?*iER38G7dDYV.^`nXLBJ^t>DR!Ra3Y75%_jLOB8Vru$Cir9<)JH7:N5Z*b97<&rEAU2
P,J\TFck`Hk>-<78_CYLc(LSA)//;[rek6;u4/qu9FZ0pPR$@+K)EYFDH^H^]ANiBYlTK:[?r
p/>'MT%F2`%kGUF-kJ_A_O30=n%F7j^T(Z^l'D33bASQ?mpGIQB`%T!+mqPTgia]AEJqB!^J)
rjDlIcSfi&&=3=&GK[J<<!b7ifXEloh)mjRKAh<57^1[%m^l,S;>61u\T*O'K:$1*aFoa/5J
(14M`OUTWsp@(0I'k+3$s\'/@'fXD?H%(;pd0%AE$rZ9FV-",&\pNXVgc#Kgs'^#(\id,qe.
=/2R5Yd:$55<uEBG<5MS`45[/IJgIP!T,4%!pY[KC&+f4S?t;ICHZ!l`"<f%FF`sS8-KI[^(
=iKJAN2p\@gG'\2tgr40M#-Wn"o+jM;?Q7lYXs7D,,*g2N<eUuoOVt#!E>+ual#D*IUX*nI0
7/E<=p-3hmAD+.<iD=`4T/g_79j;0k?J'n!AsNJkB-2-?^BFkQ"%Mkf,loU]A]A^?^hSHn.NRj
<7+QD88A@n-Z3$VCZ9lgcc-+nd$tlmV=./kVB,>oZ-,lle0;LYe4]A.A.7\+aX1fi-!q,qdV2
lq/'$rpQf(SSCWZDY.!nNOoMQcM@'\q9:;lKZcgsokU#u*N/Xf[Fpi&ci]AHaA1Mt)ZZ%A>N$
n^9fp"70.YD:mFgLln7b@?6TW-AY.B&fnu*qRa$&RLpk8,:k+k%j)HHu56iKP5WC"TTE.+EC
dSQs\fD0eEV^Z`=DK]AFEp)H[bD'W$Ld8/f[8FKOe!Ea11MVb;`$*ON`o`k]A9aEX64&qlYC)X
8,@_J"D*C!5oAX_^O"i^)-]AO]Am>gOngtl[*m\;-]A]AjlM-TZ9)t9+;8]A6=.E_5!m/$h)4qbiQ
<3MJeU)1RjP&a]A#E8"[nmYON%q''8ea1QOa\@RTH+dQ7/0C:Gmp7i@B4Wp!K,)g;fC93lb1k
Lq!Rqh:&[;mdm&g>-Td,T+/Rm#;#Hno^du1c>!+7fZCqUo>82QO5?8\5U:gD"7(hM@m_`Y_`
TtMRGB%u=a%_O\4TrpJ1p?H+O/lI]A83d'YqC.f$R/&Plr$Vbh#LDJ92\&A:1kn2iF!!sZ#*N
%L,<#Q'-Pb)a12`LN9Ll@lDeO;/ld7`7_k*(e`;9@PKgQO:CG*&jV:*E^)4c51>@7JHX+Ub^
X6po-SsCtIWu`!IYAdkY9)fE/p0L5u3(MYP<s)0Xl:o#u]Ar;23ZqXMFqmU6oDJgU=5.&Sr5]A
&q0Fs#!!4@_%d_JAM$*jc9^(m?aj5Rk2W]AuV&0BYl45E)&(O6t_$MQ$/7b7iSGqgAG(N_qoW
_kY8VV-JkHnUYWC??4b+t4@Ap;/cTah`SpT[UQr3Y.8km*!u6C\QgmDLb9uM)2%NcbH5_X,Z
9]A2#TCjB(`3/ebD*glnB\.eu*dPKG(_k.?AcQW#cr,e!:0Ik5.'N-K06pMUGf\rT"C&iU1=`
or$ECgR*!J/ZXV@ZsI_uKAL:.I,8L(1dO*YWDT"\(ML8+"&enA*Y7]AGr\Tpd/l.q*U"!5?R*
>"M/Amrhoq<jD$2HU`TOnVFON*B5Qu6O3^VLk[GWeHp@LMRlq,0uoYPUmIe2QR]AjPonWl%pC
c7:EKem3R@*LM=8rc?EaLRc/'st?S1%`9j3oP;,M<m0^p.P>:q!jr/@4cu93#e+/$S3PUR:g
p&/.PCkU1iIR+O[O.=>UR*hK[k&;?0C+2V'<rXlh4BF3(,^,oDSMMFg*L/37=S[)!CT`nk$C
Ath49;'t!cB03oESMigV,CGuiTM:^B3[j*F.Yj"aed:#iDqK7'n<0rLhNlb.:2\GFc'7J@bG
>L9h+b"lb9'*,TZ[I^m`G[&MY=K%NJKCUq9>]A!dETH`,h?I4;L'KW"f)II+CN'A%X,SB**]AI
*ocb6@+m$!M$h,OIGD5Q6Pk'5_.ri0P>]A'aK$aj_''E7SVq:"?S)`?oVNof67;,R_)!mk:.t
&*Hrte'l<=PiD]Ah4/lFSaC"D,'4q@>l&F4'%"3k7GXoK7cpm>sZ;-Z-]A\lr9LZ-d;c]A=UUKf
WVZ4-O'qZ[XW$G?ng/+bX7<kMjYE68=L:%;sJZ?;!MYoRY+3l-hNFLCYmmhs!?P+,jD:Z%l=
0-FmS.*YWRM5@"):\9F^'I1G1V*e97*4<ZXTB]Aa#9uR*$dipG"@O2P*b1sXjX/".kZ%+Uqu"
gdcpo<drEIX4g,[/4'Q3k\:>>d6n%%ha^7VRBE@d/<+XBE$d0JdE__:!QW.Foeo\3ATm892/
*OKkM/+1/?5jT7t2PPJB\,3:P^-C<TYL.SYg>10V#;=*KNQ/FkH<96;"#lAX'bqDsUo9-_St
FD/Rs^u"Y[G^oRa>u!PJ,QC*V^Yt-&0!Hme\WTIm&NU\i4o^FGc]A9h^0"0il=#UDmA`:5B6,
=)kRYaXb`VU#mmSqY5Oc4!bN_S8J_.gbt.tK2,JrrX\O;0P2]AJk&FI2YR*5"&lJD]A[81q>jY
c-1(?`N,YU*8j59J#BiT-f$rm25_f^jD%?UV_5lirdX-l']A)Cq^;WPhif;"-gk=:+($'$SG[
\YUk"$RR/6Z,h5=]A!IqNp!1la8YG9;>[`ABQ&X6)SOS/^7Q)T2o.d&-Y6>Gq^a;g.j/FVjGu
eN`skpbm'42,?R[U"\*#(%XP1Qjkl8omhJfjXc4,!]AeL-E_EqaDqZc9p=RRp(jihlmEd6[VO
'I"p,X)Ocq.1I(/iU[fb=J6/75`m[aKRd%5g0/+\eA`Y9J4?QoaI,@>*meF4A\.K?,Qag?Gl
*=V#QLBmAWH"!/.d%Skp*#Eg/sCt&FG%7Q0%%%G2@,7_cVh*:h)WJ3E5jW92_(pee77@lP>!
BJL+\e\C&R_37H^)88s:/oO/fM$qF(p_\)\A=+d:\22IR`gKe#(/T%cnL'd'5E48(E;JX5=V
7,!;6J)M=,Vqe3=;5ah,nBb_2S7kQUe>D2;?QEL[]A8O$&Zc)8VBloM<<fN1L4[X$c:q)>#`e
1PA'4k<UqRE,f$sWRQ,TNHX+VfG@Wrbqi_c@V*`kVafQIIE</]Ad"`FUdN<jbI<r()Y@9=G$9
6>M]A]A-I0G&5Y1o>Vjpk?MO<Fi;7lb[M6&el^'Xd[FNcYPN<kU-b1iDZh85G3"E#Qb:sDo<q.
BNhHV22B@14c2U3`#bhDq!uZE?%dl`;8Pg",0CH;P:&-L5*ZC0s>IGQl`K4oF`,R2p62;S\]A
/(m\s6!<71=&q\nGX72K/cZBZ@0Hp2<]ATKW0sL=5bE*@!H=/`2J@a*3K7c"$dJ8ADDeE_h;9
k%6k-^,01Xrs5AYYNp4_o&rZ;~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="36" width="480" height="234"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="Title_report0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    一级类目"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-8355712"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="480" height="36"/>
</Widget>
<title class="com.fr.form.ui.Label">
<WidgetName name="Title_report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O t="Formula" class="Formula">
<Attributes>
<![CDATA[="    近30日明细"]]></Attributes>
</O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="2" autoline="true"/>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
<Background name="ColorBackground" color="-1"/>
<border style="1" color="-8355712"/>
</title>
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
<![CDATA[=\"    近30日明细\"]]></O>
<FRFont name="微软雅黑" style="1" size="96" foreground="-8355712"/>
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
<![CDATA[1152000,1152000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3657600,2743200,2743200,2743200,3543300,2743200,2743200,3467100,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[一级分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<O>
<![CDATA[应收金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<O>
<![CDATA[数量]]></O>
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
<![CDATA[应收金额占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<O>
<![CDATA[数量占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<O>
<![CDATA[利润占比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="7" r="0" s="0">
<O>
<![CDATA[应收金额ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="8" r="0" s="0">
<O>
<![CDATA[数量ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="9" r="0" s="0">
<O>
<![CDATA[利润ABC]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="YJFL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="YSJE_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="SL_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="JSLR_LV1"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="YSJE_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="5" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="SL_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="6" r="1" s="3">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="JSLR_LV1_ZB"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="7" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="YSJE_LV1_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="8" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="SL_LV1_SORT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="9" r="1" s="1">
<O t="DSColumn">
<Attributes dsName="lv1" columnName="JSLR_LV1_SORT"/>
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
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0]]></Format>
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
<![CDATA[#0%]]></Format>
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
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<j=a'5,mFJl8VUYf\G5"]AEs`Zs','X*fSR<k#.p\'Sm%=FnC+/[bp6"pcAZW84;90%nBOW<
sMH>N7*Y,")\^:t/&3(_dZ1,_H;g5_+rLORLD_k\dHQ[PPU'Fgo-O14M9M@HMj\F.W9apGqC
Sf_]At]Ar0+IZRZ55DSm;#f[2X(pR>!Vj=6nn-\\Dj>fQ80iUE*LHp>n7)bK#jjG:"-NYC(gdI
e2V(D735S6Jl",hXT,<;8/M;ETT["H##joCKK@"l@*`p-Sr<F5Ka"f3TYVrN\17qg!P>Mr9S
fY^JbYAc%K1ec#^s\?Yr)L!<hPqB_;&q\J1I<haY*1pfeG`"Jfliem42he_U'699+T[&`P9.
Zof^sYY*WFFSTZHOc("H^&R'I<?h^2H%';C$ZHJIIj0NpCX]AN@dA1.m9>^Gk1>G:__,Fpka+
oJ%?5cu5$KBXNdocgj$a-b89UDlI*;@.h4G%M5ON3[JLpp$5=_&,_c#Q96G-mM2"5ra6eeIL
[UW3jfrA\M?>[%f7-&F)."u4MBI_Kd95LR`sC>9_=39P,9g?VH%AG)..&t:.24\S)Zn!"2Cp
X\%WiPGjQOhJN&Fm!/@S`uZACVcM)$]A!CNG0)fdn7Fuj5LFOjVE(XdB;6X11?XNM=2*6Y1GL
U=%(,LU?3TaERe7p(2C!9pY$KK,6<mf7K'?WhG?qqrCm?o.AK/.E]A<uL\V0o3<7m#<(lc2&W
Q5/e.:'R<jH8Ua>RKNkP:Ap^HYJAKLCVVu"k8PeT`f7_6HL9#_qGnq7T2iFg3enVDF%-b\`-
p?"oAdVO[mL.ta5D18W7+h2O"UOLS&PP+Oq4&E3(jJ?CC`(!iaYZDGiE42r931:ps]AjQc:jl
ZL^LI8oSY`JR:DjZr%6d>gEMHPFP@ZGQKU/tJj8t2>l8dLW4fmT\npB?S*;SgNt9KDQb9eK-
")`A\M:L$'B-7b:SdcNdGG,"/eY++OZ12tUGg.gT"u-u_QUt?4AJfO5+R?72@mB.mhd&cP5X
KhpoX=]AnT"=Bd#oBmcO]A$LC-9-hU`&%gLNk&M=T&FU*U'_Ub`+PLI<Bh\6t'oWfpE(pE%Cj+
E3n=m@sYkn1EE+:'(OA1-4=9L>'mn7H"m*hTGs27j'!h2%hc#`*[cO:hSinVPRJBXnmidJ\8
fj1k@92E_&`%=i+CW1$306CnWV0i]A>rPI??q=^_oH;/FFd`ceair2Qi1+AO(P_MakEBqNhcL
-%qO([3O.5b+P6YXDntJH7j!]AdJ+\^1&B>l:muPP,0e!F,[.rLj/:CQ6\e@6.ODK<if73b>^
V%35Lj[kOL9j;.*qHOhrE]AlAS[2A*fG\kb"-&C\EMFdH_WXX:g^lkR``kC\.]AgD2+.YKabbO
Bl[iouFBk-Wopo/=5bjo:NG^M8!p^WZ19B)umIiaVW7GJ@#KupuhGS@Dc3@Bcua7L7DN,a>m
_JK@qa\m:43k>WN0+V9DiqcpM1m9Fu\n[EH)*h%c0\*M/rg]ASHTg`0^U6#AkQ]A_g]A&,BL\it
oZY8IE`TI9J?$E.cqCNO)orM@c!<WO,Hf?X/]ADI_c:5G2DMB$]AKGjM8QAGr^`_@:TqCT8]AKk
`lgVMYcSYW[></K$.*]AW=c#;/d4BMBIM;'@5?5NRrbn5hi2#LLN.i9[+Pc'_"h,c;lA;o\KH
Z2d#%rB/Hh6uSKTBX(m#h5/b*p*6cqL2P\)S5<oiA?hsg4#app7p!XNN7M&Aq5_9SB^<`Pt:
7@*b(IU)^R72b]A83=[/k:.+`0!f`/%Z.[Y%>Dbi.&mXlDI<^emUmi7UC<Q[XNF(>'@O\<M2s
VDIc(LD;qSI7Ql)[fT$TC,S.s:0/_?NacGX*BBmFaadE&QLPl#@p>uS`a^WfG$T$o\<Z$!)s
Rn`JKi#;,\>t&\oQE0h#o0qSUi/Aq\*DYpkXq,&L\o)Kg=e*:rEZ]A>a]A0c/E9:TjC>7gSKB?
d0.jZ7j,ct2k^LWFnjr6Dk+(s8r<gh!G+r6!Ht^9A[>hZticD3BAkTrE;uXL&?(eihqAY)4P
>f`'@LX%JHj"X(dZ;2t^g!M+R=*\l0&h3qi]A9I*&CM^;\7+t+-p[4We(brD\_U7T$RH)GGun
+=L;@"B[G2(X\^68&=njF%TYL<H[$[3T!RGK.Anp%MnUA9"IXJL3Ui><Nqi7nW'phHG#<;Bl
3<^AgVK8hd84LdfOe^2Y,-Kda%/ee`F1+#U.rV:ZQA.h7j>SICX<,OI(uTd)PDF1nYWl'^:^
0fJV;YM<QE)VJ^9?!-Le/]As6*Ou_k%O5&gLA4ip<q_Ak[JrjBqaD_eCSusEO/Dd@X@75>Lq@
HEQ#maBg1/H8&KUA;J/M4W^p0@cP[%#N1Mtp2fBCfTLMGT:!8lc&(k<]AH3?-"T&Eh-"rS]AM(
A!Ws]AG*2Z"/&-H`2`atMA#q0%L\%23o%Jf]AJkKjPVo$o4P^2rK)?n(^7?\f'&.pPVDhRY<^9
a.^&5?(Hm37MlI0kl@>43)S0thQJL,=giu/28FS6g7fp6hCIRe]A#^G;utF_PeN5Qbp"&;5QH
%c.+/r)4MQ"V*PnbtFg6Ee=m&fM-lKRM0hM+E+H_N2egb&!Tt'$":FK8:OoZ[Js?+GbG+^Zb
[:2mG:!Ol)1o8dn';dZ2,l7eIWi9b+-J%(93;"aC157I$,SN3q+U.#^)t/Z/l(NU*j1p8N>#
jGGT^E\]AuboNh@Q/A!`?tR8Hsa%A0T,3iBE?E?mj`7a4(q:4/#/`Rr`$V&<!sgh7R`U_%bkA
LH@'r.9S)ag`TUAH0$m8L%bmG9%g\q4n/I2T+4]AhH_[]AGG<A"E7X84>'#H<\UDX.V+A_idVh
B+FeoM7\1!M;/\ss<9Z(3Hg;(luIltnn6%:l`jkbe[/na@*<p/<\#'COY/5f.(ATK8NAn'p_
i2sJq`_`R+[oZ(PSB.G?3'La"$"[<'pt+QF]Anb5ScLtlI+ak'q6F"U]A7Qu$Kh(D%2;ioLXDS
:8G55"-)(d4\-#"Zf3.r('C%,oLR"V&()f'&'8c-%]AbYu_*cKUoB"^5Dc>lIL/tNj[['SMdC
#1"kZgcG=2PR!Pddk"*UYm4$,hSLjmrq,T8f[S-#&2\#WW/Lr?8Z!WUu,X'Nl=Vkj#&aX;F4
R6DnQjDKmK7J\*V]A"Jto/>f&/+adE;Iai.dh(\_T]A-@Qhn6RC1+r$DUeKD.bd8lgLk?S.,)o
_NiOLFU_'BqGqfacM@du2+T;SPmF%lib-O'm=Kp2>9YhQk'i7KO0oS:D#U/0D:jnTdLMQ1.B
,>Tt3YXnhXcf(`_'W\t\E#U_+!i]A<Y+s=gsU*g1K2`''M$<*([^D!JZ%,H(sd(KfC:H>nl+I
#l$Xb[>G=TeRML1g93(tSdE(F^m#j7/l9a5D15?%Z_88M2O^]ABQIZ\W'i+=S<06iS]AE)SW+;
(1Y/k/8Lc\lY5@#5Z3MG6d:-Xk/8c%R*`Ybq&!?PrF:*=b%7oqC/ZE5d*.XP0:pbn@<9"=%/
7-YnQ0>?=Zq7$87hd7Ye(Ij4YThPo!F8^4m<,Q#[32/f3O@&(7B6'B8g'$WnB-ff@:]AY_6*W
'neO(,t,(q6=n]A.:V(.C9uYI&asN1N-oF)374Zcg]A2&WuQLK'Rr;\0'sLD/.aNYtWA/;C.-O
op$C#eX?<TokVhK=\nN+E7(1W9TE7dRI$n-@D/!ss,dU[@P\rCL]ASK=(74_`OFZji>MRE+ko
$rCqem1LGhu_H_B*\K;koS<2(c:>fd+2D^suTgn;Q'5W3%"6MDhB62$XbF2L?1aVGU.>rh7r
`G%B?23S^h+k'RK\2GnjENJo5>^l!:5D#m_MTc<gfZR]Aa$>5'dAq"?XE3U$X/J<+-r.U)$t&
>`j?I@Xjg+9u#'R=Bp"LE.W*<,JI[AYI70@&RL9T_^4&^>#N$h,*W=7HAJjjf<r:WObe=eeK
1E+nh/<.=jAP+4)YeiKHK"iUg)Oes@C"^N[o4>X!*V1Sk#&Q`$>7"%&c*9Wfs1nY-^h;`7f]A
`*<Iir0)X*1Oj'-0Z&j@VnaK8jn6OU+8eZT%G&"W<:r%acQe-+Zf-.<Q!]A+0V9'*H1^XhO2q
MY6Me1/H,_;ZH=hgo@B3FPT?AVBm%O`*M5+U7u3dTJaH^TWMM'V\X@f[-X5;b/gF`->-a`g*
a3s7I3*+_AMX>6jS-.o.E/N*AOHm!Jb;J,#K/Lt'@PXI#]AGG-lCNa;M`:CVI$bPDLW-WGN3?
^g@ua)]A?42T`%M$@W?AKEu_fZ57!Chl9'Z/If;EAUIqgNFk.c[^$.ED*/jU!07&GjVX%0.o`
X4]A6kUp[5ZiP>puK"Ul5(CA&g*Re,_#oJCEV\^JU<[SG$HqZg^JGlh2RK^UhYT6b^kcNB%r8
m"bWSDseQYgR"9_Rl%*$Lo7.c%9"?/=Yb9<=[Y?[N)O&SLb.AF(nJ@Vm`ZXhd9?eg3kJtCo[
!q3h0)Q^RO41TgN;LE,fQ3`0Zn^ngZJ:km75VPYITjTag,2-,[3G4)m'U\2G>mn#3e[u&Bjc
Y`!d]A*9_>l5jLUb@"l0nUmg$j$,lBigZ@R-H1s>Ppn5\OPoE<AIcaRiks,\c1B?XcQ*7eG/H
tNh4^n'G2dX:lsZ%(=3GE/;]A4uKqb0i2.m:GPhikml%l,p9hUF0438@+PcX"ZKU7,&c*05@[
EApZpf\p%?l2EI@%o!?rbN0^cSUKe'BT2'$s=gOSM316p=#7U5nO\nS58HCZi>K#8Ta1e54q
,N$>I0j\seJ*BX6e6c[4/+6cU:0tYgfUu/(,@jREo/gZ/^CjGaG.-oQ!92SOlm?p-nf$mL6?
VojaHQtcWj>mSE&k(,>f>-,-R#!J6m]A3C!dY,/o9<E>AMn!snf+V?X12&f7O[+\PP#E>LM"L
jS;%?ZGh8rccg$RB,=A\LSBgD5=g!R,:I:0%Fp7t:`lYlVX.<QemrH0N`c`]AqN/25oGMI5-/
,H3oW+HE.1Wp[\k;_kkI+nhV9hku?!SW[,aS6ZtOiAc\G4*g@>;&s.VXq,@=:*lc)"r\?WA\
qsXO/moohIECN(WJeY2E,\Ri%5,VB7H9OcA&)_bL8IfXFhYZTlHBai?0lB!l349@RF&4G*S$
L)ou9\q?\C1<UFUK$X[4'u,`>IgSQdD78PV@!d1k*2^-3C[ogiZ?DIp#`RTJYncs.EEKh,U-
Y3ah/*8UD"FaU;lNpDPR80-1P/lWP_@*rH!*sd79Zg(Cmpr8!osKHLGt1tSZ&di.t7ul1Ut[
ZD<M$T@AQ_c8@_XWT"Y%D/u,!$//`VsQ57B3ZU,=+;VAMR9fV8/<U:reYLE(0<l6P4bl<2Uk
E=2e&I@p,e[l45:T<7q0P'2,?f0lZa>:P+b>5!0LUf'a1L^,a[:QoH"*i:>5>Q?=e:lZT]A"L
IhRCi-Plrs`AbMcF0-Z\4S&>U&E-k#:9cYJmXnfcY;O3G+?@B+*T4A3l(8*Mh&0nZ6eId<EC
n!=c0ld\Y7=A\:(?&TT@NnLmS^07h]A`8mu\mM2YMd#g!ME]A<J2IdlVBeWju_$cl$0/i.LDqE
f_A^_5DD#onX#5,!bGM6OtQSlsc9m`9A2(>_jhL:Rac7TW6Rjn\VDE(K+"!u!%h-dNc*O/X%
?!fduSNig3W[ZoQ,"Kh7@D&8/Nr<8RIjL5)8Uc_Gl.;rLOR\1i<MUo4^!cMVJ9MW.h%=^Ca_
'-=[(NL*hK7NUb:`ZA"LD3C+5X\#AbB:e&+Sg,=NsVUCF5kRaB99Ut78;1Y.CT^377kF[)Am
+f.lkF7jSVt`qF2#\pdK(IT)>t_Ug0PSL>/-1[rJqc>pX'URgI#*pm-,*\+`>)4'>ls2Ne4+
Zb)PhS.fAbpkq(#Dh\29!J;/-mfCLY@FiC471mn:!`oTI%Qm&:bP=nGoj]A7o%7l<<W^Ct:C=
`OqA(M1'Q:2"aHuqH<f'.dqeSq;NR4e'\Ct&-%`1CjRio2M"c/%gEQ;oZOYO2SEqD<fa-bY^
a(0;WL@^aP3>k>uhjQ)WRA-8HKGKFAJT8Ihj>Y>0\n;_I#Vka$Jf@:5-XD_W;'P1Pg@&acm&
n&iXO/XQ4m]AE<5HjL[n1s.a]A<>4JeF]AkWBpC/$D8Ft5?8*'qL"%2O8A@&Il3@Tr5$G.0V:Ig
k?DCKj8^*D74BH(qq[jKc,PLd"pDL7NbHunWWSVUD0<90ctf,oS#D8E!]A)Li"JH.6bGU[ljO
l_H);0W)--54<LOqOR!sL0E`GJ2"KK[*LDC8X,8gU@F*L;-WJBNXcVmF0ql"=FW3.P>-mqBf
@:L)TS0O8%2FW,+,CIero!Ob3p[ch]ADQcHf3f<*`uLe>j3<>A$iFMLM("C(=1Ij]APHHWHn31
p4HaL-(*C"A1ISb:goHcOlufU#0(Z\e8\21I!DbJ92cIdd?sPuU_<b'AoA-7G+'h'Bhq:b%a
U*!.;,*L9'D3/=k$?*_aLY!BhJj[qYB$m)>/!_\Uo./\3G8B*4*?lEWU<c8mG7F]AV*`uRh_7
&DP/?j<g:-W/e;)g32b(3%C#VOODhsjfZg]Au0X3\FNnc#jZC?fdEQt`$b_C6ug-cK;q6,_D5
)tEsXdjJKg0RCYkr0g+imo%!b$c@1I?CbSa.TWP2,Q(?an(k`^c*P*IKb0lE3.GKJf[e)6HB
Z6ol!r@Q@fNP)1u34[Oiois,qW[]A7h0Q"QUZs'Pq(/7.+G]As*1>hk=.b2Y4+aI7UPV[C=qkG
W[:g6grMHBh'EV%9hfW7k1R%d&f)uPobF_s:e;*M76lM4g]A9&T\&4c%X5cRbdCCutGd`>RW1
]ADl`$$;YO53Ck/L96L-G'hI2'jTS9iqYmRb%otj]A**uQ1\.g3?tmC42=-j_!g/:bV_-%mL:d
X4'butDjTRS-iQ$+.eH6T#\46F]AOm/glkqCpE)6`:nA<CNMOmTL(6Y3u11Opk>.@qFi[[P7O
)5:1;qU:'E=c%fM#L6&qmdK?qNZ9LY;&j,NH7+0XZO\>La+_)c'5ZdSTe$,\:8hd?E`lX'A"
iF[g%f81Q.CBPCmj_E*8t1Gn:kW=="d;Y.QgY+]A;HQ^R3=Oh@>S.&1"b7I?[0aY(Y@;kMoMk
Z7@S:VGs3so0?BBEo_i_JTB]A=N:U#*Hfe085S1d#?h"q9-95]AVqT=nl=);:HLLmNQQEI0\0D
9FQXpV8@Ob^4q6H'\k=)g!Y)3J_6.l7L<sf?e*OL0.hmPAd;R:'6EO`kYK,1bj.bmPe1QSV?
=qUkqX6DR[1_]A&r`Q]A+B!G-^C]A,hn,#+TNsZ!4["0;=#78YHTBc/Q@&KG%Na-A$(_(Z7PVP?
EnH3.>i2YIY3<4_=(d-%R!p[tjJr)Fh&>dCN!nC<Xp2apB.T&M*C$D7C)jJ5'\DiqUWoE7bA
E`ABNK,UUA!G4g>.Yq:F%Y)(tM5G!s@A*lVVAA(UX5a(g5j?k<+*lE:pNqg:ZB$AWn7!dGlD
.dFOV"Q//\RjsiaSAZe\/\gDA;DcpHf&JL[<mAYH=m?m?o/b1e)Dm/Rt!QVB[*b3!S_^6C\A
BJEb98i<qo@.Ee,n/uU7G?KNG'gi1*Do_kE5-:>.Wtbl)UJ<%7e"@rJ?k_?hHg,D;o.)#!5&
'kpo/%Q`OM)HF6+U<)(5C//\dKFVaUD<^2mX%fB_dl-bESr?R[VKDE$V1jUIg"]AK#X\_]A?-9
\Ehf9Vu#e)SKIi!al*!0LUcDOgR8)-`S^J78i]Ac>c]Ac#QI!cEV@EqkYa_Npg7p//d-=%2!;1
1O4cS'bT`>gkf+((#6&Q';H*h"/ei\bSdL#S8kT<<2%3q#<i<\Ui[bpVdn"(c/,lO"]AJSrBr
"qfBB=D*j>IIq/J-*RalWHofEbn=Sg3qk)h0p$D]A":,!+5KYC`l#$eipV22X4JXtC,j[DQ)F
hjXIhtK<r7LoeNc]A80oTtu3T+_/eg)Le[r"b]A-\?lTGZWLXV6M_^NGkn^Ya"rOVOc7UUm-)1
1k34u=heV=`e&!KB=#sK6+7kQN9.t7\lGiAT)iI@!^ka-5&PAhZKbGg%)Kdt&i3SqHa1WR?f
I>A&?)dKePOQb-smmW-He+I\;8h^5kb0FFs>5ngf*QRD4gLt5Q0)$@iSpqiuHsbV<8B<E=f!
Q@7GPqNKMu?d-&!MD_-;H^-`aCK^FtC=WDe4*8?N?;aa'j3Wj_QGGq\D1hJ]A3ng:]A'2>Cc'm
!gqKU)m1r9Lf6d9Ak']Ae*C22uK_$l;8/cX5gQm,nV,=-`cO:J2HPY*67F]AiSNU]AtskX)Qs*A
Rg:2['s>ZZfiWB.>V3>`SnIks(9j3T\VL+?$R]Aj%o,Ue[q/OnnBH2d4=V?JL5Al6_mW_B#9r
u4-<+'n2WH9'\m?qH@>ofs:_4Y"9Z8J@(dm^5C?SI'/4Pbm?g\U%K75GG9<s&\>_SHH7hiNh
-LJ_cd'#2dNSjX8!QD31$FDBZ(g0#N8B8]A\bhleTG"J(OY$5A5pL?qL]A;>n@"TL?EV*Wce5%
<RnoS'L=P5[mn<JMikf;Nh0F;@/X`PmWjX78pMT+?-98Um&<aO$olV82sgdIQ.d2&NJ;cr_1
hlAV@Cg%b8r3G]A&$J*H+rJQSP*N$aBhbJBg'.)MPt'FaW^fc<<=HVq9XV$YT?m,naLK$ia#o
[<BuK51b7\DUr^[PNp7ibhht^Od2HBTYgU/L^_.5J:>f0u\L@kDHpSM-"-e^tjdr`e"iN:PS
/bAVF,!*mJq+7eP3s-uA=cUXBu`o1fe[Va3^0b5n2t2b:kM76_ko1\_#\4P=]A]AOoC8')gE$l
JsNCX6^g+J*Ws=>/*O#@%\W3DZJb<!SuD;!ALPpV=irh>1uJ"Js5Ut5*;'U3Pbag\2e"I:CK
P5m5.Kc+\6kA#K;%/FI`2KjM8EB[[!TL,0\0Gep7bsJUYaj[PBTX!]A+esiQPG?e4#8SOZ?0O
N`q=piY+l"BTiA9[^Joj>##q">F*]AuniXFC/NO\he<aur3[W:PGemk!#UG/k/'NQ\g0^lAf4
WpOl#/;#eA#R+NLoB&L1N<0)(,eAiit'8m(Q-!-HK,tIain";%`<*R%8fhiMD3[61$c`10IF
cA2e(o]AoAXFa.lPZ]A^GubKq7jE-Yh!FY\l9TgX$TOCPOL:a;u3.H?npA+S3?L]AO*Z<eXp93g
[o+D)l8FaKf.gs9Y*lh7Z96ge"3+rIa$%52ij[pFU<q15(h&+Ad!PO-#9"pMHn0p3>$Nm#[>
aYD1*4'RK+:\'fPe^YH"egCcI/"QVVHFGUj9bdhS]AR]AOGM#'["PZ29!X.A_no_0IL<,dXg9V
5K#P"QeKc-`Y;-QpWC+KZRU?Q#`+X(6M!kJ*`tW1:oKLDB_0s[^bHSM\QTG3UC,$I41Q3cEN
n5hu9#kUC0?q3E>QJG`44*RG!>\6>B9!kUUWf#lT%WP.\UGWs:LN5LlZGl"!FsJmD:qlSr$1
<O^rflY1JH@,2e(;YMF6^m'BdEX9@*qgf=Pf)[Z"]A:#tG\ahtMuM0;s+G=O1.$A$o%G%I9PY
W*fM]A!.2<k8<L?g-pli1XQIZhS]A@%H).]AlWS*qtTC$95CW$,KTW(_%$3m)TYO$PDoO'fY/b\
afMqc0BA3=XF!\o0<fpn>"1^Y[S[D>sWVBj%L;I^M"eQ*FZgmSYOh(sIA]A]A&=Q>Kb7<@a;gP
!=Nueb,i%-6%Ve"LgeEP&1U%'EmT)KW&bCF)<8U<Q_gu70>D^D)JuVT;<`;?;Y$\uKi3q_;8
%lVA8<#_"]AIXuH`,)bL8_c:q3[P%dmOR#rrs7V^Ea#_Se4U.-'8<]A0T?NtTP3nYi;.BiWU'G
!)nMq9C(hpi^r"M6/foO\OUgGa6UNSl%FWVI190MO26pr,N_r&K_@B5U8@:+SI9G7@`qC5P;
fCN="^(-'F[MPt\D#m\4Q:&X`XNP;pD4;eYVCe*M5)[r_k5&)8?&g`M8K[TQ=NbQ(]ApO(Q>C
P+tdeCR4BraagQ+_<mj$G<KO$*^A>S4!G<VMgo"igC\eLf_r'aBk!0t<"q@=Z,2R#AhLWt@9
Mho'g[d1I'?C36?N!YG&R5cf-j+rk2YWdc*1^_=WS]AK<HQ7`OGto[T)@r?TiK*UA]AN@IL?-S
[edmR*2[Rj8'=:]AKHP.5$qFK]A:W2ZMp=]AW@$\gSD#!0$rIQbc#ck9#3FaJ2(@$0T^B\Snb)u
j:B2-)3W%*780Wr=D9-j4ER-Ucgc4$,hr[:^6Dl*:o,.Uf06du(p-&f_G2u`+*@c!@5`>Qo'
0kpP$N%<9.G@7eGHn4NdaQK7h^t!/M<JoX_,fU?uN2'(S0UZo#K=a1NBS)&Q&>#Zc4.(;CC)
#M`gp<l7Jl1S/8ZO)pWgV7H22oMg5>?hc6IV4tAb3LMB0VeRO=tfF[g$#"rb-(\_3qRcB!gp
I#TA.>G()m:]AquG`I[/#?%'CcYc#GPN:77[K5$b)rEl_QZ+hNrY)ee!pK>.:?d'k*XNn9!iB
d5B,_KE6Cq2FQmB0F3/e2UF;AYW1<,W]ATI\==[%SE696..A?oqk.@?-%mFaZ*fZ@]Aq7b=-\Y
?-]AYJ.HbA4+I$Xs'7H<%%Q]Ake'k#Htm^+GD]AI;Gr]A$'TL)uF#>Kk$6<MJ95kl9Cn?In0IEs:
^BRSJTL0.73S0)nB7hSPr`^<`7A2sr*h?.&hEO6R%-,Q=/^T*rl(!Tg/lC*:,ah$1%24SuPS
b@e!2\8@HQOL<(JY,)86Bj0P(@[LN<&n1)$8<VS(2=,;hOUBk&G!--$%6fj+Z`2rWqKZF>8"
G%qDt4r)$P1A4@@U%C,i\CtG!jo3qFO%p_rXq%V<tCt#OSG214TG<XQ_6_P$1^5!V-DAC;(!
a((E:IgCuV?=iooPr,F!;bWf`!BVC_\qU-LB!:"Ti4.V$>)o@DOmJrH'L\giojG<T\nf`S"[
@sqo-AtkdjTW+d;P-;0_+p)\jU3*\-IY7>PV<=e1&t5EWFl/n'))C0;#eo`,R?/D&LmP@W9!
gqGfnZF>KtZC\q+/<%OZVu/#5nU`Y?7UfE=_U[fY=:6\5\7c(]A-GQ@7Jb]A#Z#tlt>Y6K*o4)
L3lW:5m$jF%FOQ<-L!>o;FEQs9aV1H@"^K7c71i6LKie.M2NjYdN0%,s.,-"*gj>(\,TbiZL
LWFI'Q#"*rGW-CA+!;3h:-h&%l$&W(03"PDXpqC3@5?EKk\Y@Fj^U(_SC@.I<h/fUkM!#g!c
Xk1"?Xk?5=d88lIj1.*c2DKB(+8tM]AMJC;EY[UeL+#sb2;O</JG5>>!!KbTp46\SS26c2R++
QH@-+sfa1Tkdm@tlc5o(>c2YRn4mbIURB@N<-OTHFKPF@(1"Y7s-o=1a73r?K'%5fst5">uj
:3UqPf3p[OTji`!iZP>n[:)&6:=i@bXMMhe)TK.DE[LOCaSqVs<g'N"bft)eg(P/Zq#ro<nf
pQhU7a-pF:m0EF.r!n9i7VUm%[JP6'eehPF_@S8m,bUh/r=K/l\8hP'IMsVGR;KMpf)@AdsQ
Xh'E6YafonK+HFTgq[PLNio]A1a;m>3+G8IsHl8FT7C@t;W*E(4`KKjpMk5ArA4<W03Z2#4.o
Kr+RLfMt6IuDi;P7C+B@ae2bmN>fECl9/]A#m10t_%44^!g.H,2CjA*b[AAl4EUQSm6-]A8Zg%
E<;?--Oe/[3;8894\\fEs`6=tE).qa(dgn/_=9NYNlb*Ll`$N~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="480" height="270"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="report0_c"/>
<Widget widgetName="report1_c"/>
<Widget widgetName="report2_c"/>
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
<TemplateID TemplateID="26749f46-c389-4158-b1eb-a37cff11813c"/>
<TemplateIdAttMark class="com.fr.base.iofileattr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="6e209a54-7bda-47fd-b46b-ce6ddfbfc59c"/>
</TemplateIdAttMark>
</Form>
