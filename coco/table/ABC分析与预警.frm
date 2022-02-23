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
          left join (select * from spls_lrhy where rq  between to_date('${start}','YYYY-MM-DD') and to_date('${end}','YYYY-MM-DD')
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
<DelayDisplayContent delay="true"/>
<UseParamsTemplate use="true"/>
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
<![CDATA[mCR^I;eOf:^-X5U.o:"c70mV:F_IZf4H(J^,d!V898.OM?YQPd>,u<O!ebV)/(@VR>"LeXis
?@A=)#]AIX9[$B:fOf!&rRY^OFS12&4-X_T@V^HW#b%[B(c#j9tP',b?Xs4eslF/4SO7gchjf
ihFLEOI<aVd!!%\THM-C7!'hYG!!:H$"<lZuP`<riJGb,%?@MFJV$G$FKXp\sOm>UDU`YNgL
hcfJFGCqU>PS&sZsMFZmGJWDl_<h/M\",3Z>s@3Z9Ngb9j@;-O0<4hfQ3?"PpY'DSDV#tE0p
f<HkRB`__1_oILmjC)Rq-;UO_K$BN-lMRg:s1K08*ho,!(VY"S0Tda"Ng&.`J3YUooi\K\I8
T0O<G^?/<#(:'F@2Hof[aZ^5OY*A8s^iX=h0N3c.+hMb">u6Q84@WbXSSSc+Uf?hofrslhY^
B\l]A^(ofSLSsH\8X:S@7IirVdG@PYQqI?i^GO[c"%VLpM59S=p#[aRdGTc+-aW77@s%aW#_n
kNZ$&8Q@4[B)aadO^O4:YKhXqW,>)JqGA!*o)"[cCP5>`BZ6;.4)ccH-8@O+mBP?Vb+2caqO
h8Xc[[X!O?td*`JqeU]AWpdB7HUI-s*B@Dpf^E.0k:urV:6B2$.6$U.G6L.D[khYnB_,9B_?=
:PmqfS$7cHuVV^,/X'T`r2dHq+h",5he.;_5dU(Ir3JdQn3Z*kO<"0.X@;[W,8c!i@32K!Un
eOrGf`+)N1!;`AK1O!^'=lU[iQ>e2(r,jQQ@U$&hLh(H"9%@(>gp3KRdLGi!iS75OYt^Tjm'
sIJ?BDAs.#<8Khe9L;",X$F\#=gg^VCHf?(VKEFhYlW`A%I+4g":3/mpJ!gb[6W08Y<[P-mI
=OT.LtlJ:IJaCFn+$B33Po=XHJ)H^u%Q>]A7$+G_:^^(rZWZ7Lg=<V3V$P8;H(_A'kb.YClI;
,:CZ*$+p4297BWD72ZT9Bh1r>R^<T/>#ZD*eirkH[C!D6uU\P@nI5SS/K`/1Y\%4]ATRg;<P*
bIqob?dbYk+a]Auq'PDFooUGGcCFORK"/c(X#lJj5%W2J(T,[ODh#Nk`sW2J1&!M!e9e[`@$2
)N/c7b,H=1H!#+&8-g<M#&':l0"XIfm259pj$H80#&FW?V]A3B6*M(h&eus[@6YE]AAq%60lis
'M-c19cK]Ad]A6M>jg8=f:lPJMguaA5\oTp\'K^'[fVl4Q(UuZg94:2(;b*q5'1&MMM$8mQGIJ
WDkmj9#ITW-BdO>B)mD<3a3-5a`KcUHr10It/O=Q<35.SaH0d>_pLEbq&CVI,q-I/_q:IE,"
._Cp[,8OVO0ET[Qo[tWMtQ9G[o7Dn4*73R5bFA^e[pP`>S!@k<58#(0m\+%jJ&#A4]A>XB@jV
ageh5ct^R"o\#IPQig8/r?0/0[cDC"g\h;]A;aV$@PB8J-V07KYY&O90N&3Ue`diJcS\EC0k3
2B$U6[\[))f'4Lo)G7^3@A9r4q=jE3.N9\KoVF$oG,`"f3WI/q*a%GA>^nX%G$@cDIY-fN7L
^OfI=0?OV;cT(kO?CAWnX`i!^]A=>7"I]AjL>2@oL^KS$*]A5C$(.pmD'p&S<GXeUIA;=Ll>o]AV
$gKSLJ$(DrQ.a5Cr'b_`b=#fCuBGY"<acBFE]A.UYZ%7fPGFUJrom_+T(G:0S<->Z>2?^D=rk
8[M6@G"uIbe`jq0`7hY/JeOW;GN?!+bjG]A>V\'?/Lo,]ACulbKR+k:)diGYWh!R;VJs"_HU"^
(p`?Vs,CO+Qb)GhCg^r-=7WamLs[OM(8ZOa5lNYnQ3*XDN8h\qAo+%@TZkVcLC_;5\'Md&7B
;c[R_-p57Z#E_Q;[S=9=20I\`*:0Cr@*;o+</KQ<8mI&(e/$2e]AsISrn.S)bM"PRW";6nGkY
h47qR<]A:_`W*UPhV`e@BLI1A;#]A$.?&fno2@l,KAo\bn0VJO2E]Aaqk)Kb"D3[-RQA&ToZNYk
+YndgfGj)C7j02D>j:%M\Xs'#.ZR]A6;41Wo#jlDmY`\"HKn**o.GQ\a3AQJBD'tMo;<QZZlq
W>Q?6Aq9/=KWT)M&s(rm9">o3:'lZh3+.LV8SddqMtE[LP^d]A]A7WYSWc9X/'&hZ<m-5XNbZt
.@Xajc'9s)t^QqrHpRckrpHWUA`m;l\("JDUPd35g$*7nsa39^pTGAsHjW+2b)]AGb_;EDL+*
`DEW?6Q`QI>CJ3^3m;SAO2I3`lem:MMUeh0'cGH6TM-8N@='AK"2Z"DK1PR$?nBc7c#c*%AP
S3(m1V:p=O>4XiPjseW+TmK;Q5f(3bEAWJiU&6ZUJZdFmBBPYfH/d&*c0nOTQUDQ+!RiBlC9
^)RN[3E,p8f.aq#$Zc>.JMlJ69T&?i3Qc$]A;=g4)HY%Z7.?13!uSc+iVHc?QbqAXa1L=MM#N
ig>Y3-jm`5R,1ZXmt=J1Zh,)=N3f]A^P6d]A\/]AH2q\Br@ij&2+%EM;o`N4bt-=BS,-(qbn4P:
`*ON%ik03%MT;CM]A_4W6`J'fh-45F?n?T:+Mt8K>1]A=#]AN14$_msO9]A>U;,<%]AEkU+Kd2p;a
/67D6$D(KN`>3@mBL='NbLTFu7Tlm*!q<dI[NW;?,B6e)q`QO:,WcDi?1Sfo0JXhB/Fo+QY3
;9LW\8*cYbS+TNj0HMCn;n*]Ais"`9a2"HSBkdVkb<.o/@Us%-iU+mAk8HhN\okJo)/<V0)=J
ml[(*ME3kC(<q#QrJ@Fd&.d@2B[rdbco2%nVWlf_\e\g2AdAV#eUE+F78hn9<oZkD"Jfe4Sn
s7L1f-W0n/_821>T/g2KOaA!b8.KiJ^&A@DG+oA-*T5kiM[s*D97HkX,3X9De@*AUoghQ05Y
WJMVBS%=,U1+:#Bk7Us-%K@X\ke=rW,^'csu;(q$2Ja]Ae-g8'C#$%YA+%I\4Y*]A[G"0m*MS'
/>l:8Y\jT'OFS<MG59<Q<ulbFe@[sI'!j2\9<jI,!]A8UkY;^;Pj/ZYZmkXIuZ)>B4r$>o0E8
s;&es&po5p?1&6Z>sN363!q%55Ghc4ql7p+Q-ub/aRK?QXQB.gJ[sH:Q4qZ?2=qVc`cL$cdn
DnumkePfF9;K"ioem-5ZuaMp_OiFN]A=]A@_EB)G>=D9K35K&u$<m.0Us`:W,QrBhP%?]ATro#d
+#CG:uqM`iJYc559LAgn-:@sM5>^8?oAXlG+#/V_spkq"S3mKK/@FL!oTO"kaFZ<4WCVA=@;
'?3h')ZOi;FEBNQ<S)jdR=#B;]A]A8^ZUb8*QW*hoOmqGmXeY3U[5CVCSMZ3Pjo$Qu:[K5*PqQ
m7Nr@Gc=HO"SC'(Cb8c'SSTf2_Oa#J@T'm+>WZ;/f_gGfeUK+kp=9G/kpD=/?_s;l:Rlbf58
@c^?K&2L[[ps8oK9OOZCGL3@:X;g@J-^'lEU8oKsbpQCa2,FV`Hp$_5jVe)g[1q=5C`7\l.q
_T'+EV&K<inFR-AN]ABY!s]A&GD8Xlag4PUm'6-J#K<U@Du>ac3eE6.1*=hq"#MT=&A5=#M(*!
G?^,iHm)c6!<YR),0XR7^JJeGJ\aK:nKHYEnG%AS@!L_lS5^8\/oqJ6fbZ,X,+4+dkX@oLNQ
P_4C?9K5'P(m+Nk"*$D*$>Ce?T-f>N&2!GdM8D[K8-RR=@As!bK8?X1gr8nPbT8!$U[o1Ak8
'@1Z,R]A&j[Ne`!e(HmQE*qUd1D&kE=K4!M]AJu^h#Ki8LTc3]A6:22'cAC:F:a<()?o]AIQCt#P
HsJ^FVs(1sp`O^9_%InFW=%7kYSq6hm@[YZR^el4VVY^G0Wb&`IoXF[>MhV%hX?V`0B,&MKg
`-u9u4%(Nlm#1$'S?i+BqLmW=^Cuj&4R2IejR?nd-e6SXSr8Wl5]A$&5UGrAE6`UuhU_HkupA
%UYl6Ua4^<Q;n9,?c<^$q#b-a\Y:;X.YKBnQi_3(TI8Pq/E+=-]A.PJ_Xb0ncEa3FaVjjiP#M
4'F+KNQM+&"g;N4),GkkpnT?WEo`F7Nbqk12:WehNUbTf?BGB.h-l3VM,2\o2^h:c<\Iom?j
G[&(A@S?OV^t-E$lhbIC1Dc1!YHnMN(L=Mo7Q[!=*''H</MViY#8Im>Mqo@IGOju4khW`hLO
$,M:$7&,k\b3V5%)bS]AB)k@b+kP*9aQ:g+c'N9MrCE&h6kQXQhm3eY=`_/r-\)k):='kp>ZT
Xc35iHbsO<jF^fm06_a0EKBlO3'QD8RgQb3SgMIH1cLo2[4&WO1RO9.ra[_RS&_QB&?@ac35
E\n77YYN!R=4cOkJSgZO3=,_0fP&CGf+beihD*Git?:j8l'io%*KB"hrnVJ\!dIm3:'WK_N8
W4&(ohkX(29O9tBksf:l"OOH13M/%8Q.]AbF\E;<=(pIT[<Ppd,$dQ=X-GSkpJJnW`RVR1)_m
`f+s5h"$(0Rqp_iZLD$.5tI?OkZp@s3WP?U,;RIeBuj;?T:P8ep3C"5LRsaN_-Z9`VqM\!<H
pgW3Rc!;0=c@JX6AD3EE=1TERbrsB2bPd-q:Xdp+-9Jg[1/0Q,ip#fo[I$g@b[LZj(G!*B+8
"8)nRs:$/!GKE)g7j78m]APNCgFfsT]Al^7NXt8"FYc^U-kn#4:!A?sF"R7^'@I9Y5uB51Ca3R
4H<f:3tH%C!sA3rIQsPaiGN&"H2?gR$1Q.R!<pN6@8u-+crI>nqNm1X#.C8'(V?Ha,Ku$2S2
FL=<4_;HrKu1#'N(5?J-&cT-P%7$&"go0&eUH9-k3dkEbt9'!#*/MPIUPgHQZ?ZVGT0b22+'
TV_u;k7e>GN7@f<?8^%mq<Su&bV&[T'J<rV7maMHs#n"->!6p1'#6PPQXJBtZI<6U@25Du>6
m<JDFk4W5;IkhhnrkRqF*WJ`q)[Toh"&>=RKWh-973Wp-O'[F-?!2`;M=iYE34hs3qnSl71I
M-[N8+\as2c^aiVgMHu6Tj),lTHCpTI"(0T"G/cpp^*phEPr;muiMLl27mUHY0MA[Z[`QsHp
&HDsP\HoY6tGPT]A.jLPO9J2d5&,.OPi\P);"Ij'59Hk/.D$S_:9oKs\$A29R(%?XB`Xq<+=A
PbV?Y(9ShRJe^5$oF=_$(.;>uquXlRm*ZXZGGp?Mu,me26r.09e;C35Tum1tcF\Clkf>a@lb
Z(YZISb,gVlCkK";Y*(%(04K98aLuiFRk4(L4=[D787lZ3:X?S:R_80mP"d+\cb\nbNqXN3t
?$SPu^nQ[Z)>Q$-rY(QDQ+nJ.YJ#_QqtB7S&J6q6B&DN(u/K%fY\&3hL8am:5fO%:uT3R/#T
<``:KdUa,$q_A*@96VG(?Tuds7>KGZTEH%i-[aY.J%2_pE':?;;#=VNe,(\Yo6!1Hs1f9q">
/bA#R5'8NNZ\-)5%btd-a0!Q9]AEc6DN,jH1/FFup+-r$EE8:^ehlX_f>0[+'G;$u.niY!`Jj
c^9F#Roi_;[HTrP(S@^#ZN`,5,t%$Z0B'3<oHh4GprAAnM53.;9p3lID%aGNQ;W$[5\h3V(e
&QCNZO3Emeg511o+.^[P\27Pk>^jMdW7k28I7B^dj.C-ri0XUfZ*Pb@";SB%D#<1!<Z=$]Af_
k0uoq_tQ&k$/*_@9+/C.]Agm0DN1&EX[MW_f[Uq$*GHjT\?:aDf[cD;r[AKRju5IJNNR5j0B+
pRn(QHjp^8:7<Bq]A=nMK^5%C]ANd.-]AsNE--VWjcP)DIRj/p>fc;R21bRLp>H/GtTe"[NFqS7
#o/J`WQi*;X.1YiKPF\?86oOo(rapMpe&ES9j%R9W-hAW/k8]A=r^78!S?--d@HI[OKa^<]A6p
9po=c($XW4ham!OkVM'';V5eJ-4.%ob$qHaTcGl"!3nTIUYjNX43>pL1lkqEM%o#7Sf;)RL0
CQ_i*#K=SF7m>aHC(HNc>gadEI/kVM5Hn,SI`/bLZ<]Ad[imAjtBiMXVJ@=*[O@m3":84tUlr
=u\Y^B'e$EkoBiJd0]A:pAhrYrlJP(_<uCr"9+8p\BFp![#!0D2$*5VPkmqCO%QBd<g"Y+1%]A
T1eA^oHg"faWE]AY;VD<O7@0I'rJ)KS_YaaP+ZZ5:!^YZ)Oq0pXZ_hJj9"kLT`rdk0^p3=99!
_L2AFlQ3GY]As6hK[GYVcBi,>ll3IO(Ou%JFl?E_^@<q`Z?&Ah&n2GkV7Yjk#e[k5XiQkJ*eZ
9i^O9Y^b?&'a'BfuH`+Pt><)tt?/:#&'of+''A\SFL7XEsd69#hJgDB:KA%!!,^]AV=S`1,gi
IV6njcQD`lJT:k&@[4s?.S9PK7_DC_KpO)/_>"P'N%@%kSeWNnh<lcPMdTmNi`kpA1F&pZkE
p,C2sn=#)8.^9$0R3a!H<HL:thsOCDL$c\*)jG6Pc1Wio?3(A_,MdChHVs`5H??H5>i%d*_6
"Mqe@#l%lT7X,(q;f#HE5UKgu/PY17Ycj6#*0Cq:d=,5k[&(6j7p6-U8*o?(&Rf3j?#r$MuN
bBAJLkC=MjV;/N<.aH'/6Wi"EHhoi`'ZgdAWCb6i<i=.YTo^m8kAY6G:lc8<s\G2F]AOL"8@s
sf;*nIgPSXX)g'4i%eJ=L\Q=]AC_2P:"\1U$3h"s\rX3g+C@$-J.61Pb0<eZ+8E2es<#d+2CA
4">KbdST)3F+RP7pk]AoMnp.kM^XitI,^n'j`rij.-MWJ*4hnQ6/$EWEn't0bHkt"i3<mVV]A%
k#q(MHrD1_9jk"J@%W7(.Hs;P:\O3om766Af2$pCFdDL=t62UU9$TJ0X\=aa5:LV0bt)VU;N
uVbm-Om7Ap=0U@2-er#="*t+6_6n(:c6jbH*Ff?ee%q-b]Ap#%jABRYPh[_b3f@1@-r<P\&F)
-<mm'OCu%s1#-u'U9)%r8`Q#_=3u7ZUKMhd,hANr-+B5kR"_uBO.jTJkcWP,s"5r@pg8<6Ar
*B80!>8QR;rMIo:h%q8'KjL6^UQs&3KS6n'2)q.9f:TFDfgUf&qYeKkX=4$Dd6/AJKrC\;*B
?1#MMoT>p(b!A-<q;aR)ZLFo(\@+HHTh5*j-`O4<%+QagCVncbf@Ca_04AD$\DRdiq'H9h&B
!,)r(5ck)d@2U''G"Q'Fg'IZZP6@QSR:3=#_F\SG-:8P!(r_I=g0>0k8B94*fKH@2-6-9jAG
#.tn!YN;c,&PeMbFrABeDII_XQj]AO5Fk?QINh>Grn-%*^?8-Kbu7N!Jk\3?eSD^X/GAT.\]AH
8<0EgiMR+6):?dA*+\g$r7RsD`O8u%;HbgR&nt&XDn35>5/;h/*ZL%9^$JDCJ8,\/7F/nKbV
`o#(#++;ZU=uqH@QQ;8;@'[*h$>,gel,2k*IQXJ*:`1]Aa.T:Wb)N;deXnTl9QXGYDP0jRbX2
nAX[;*+lZ6ClEj)Ll;&8^-fO>D@>cS-6C(A1f^$*fl9IGJEU"@CL\k>Z@h:O18O'<\+X?KU,
F1X7GGPaq<%3:LH"7$b,@UtS^B-\)?gE>9C`k:\8CM6,]Ab\&2mu2lQ05Y1cAA]AlUN=[E4-RA
B/p.jTJ#+\$/;DScc!:u30]ANMFBr)sH(tn'XkrTNh.,`n;jNpL7F2A8tqfgl'R-GFO-A3GJ'
9]A2WH_KS)q!hj6KFjjca+]Ag=7Z/n>PsP8Qq`^2_-iq:m@3!NqU3j^;`#9.I*NAqj%1C`mds%
V6930d73/mrYRQ;MF-a0IgJ>:2#>@'tc]Aq4*VKk]A)ic&fV[;HKtp!1\\gGA_,._g9]A@=_9V6
)EO#`>+K`?OP!@'Z9se8Y@#?@e\uLWN@7-MaDkCGpk5C28687*m<*:K$55"&P"2oU`aRZA6d
P>PY^8<^@;CW%A_%R"T*5pTQE&*FOC6u";gl'.cJ;tWlMGccF?!o+;TJAHNfnu'i-7se<LM6
+*1%0r[dqu^i@'k;P%WCVpU=A%8=/uijEXUqU$E2+aV!;XFe7TXiHd"_NAB/(Gi'gLen(`0N
I;(+roh8OA(T-i)SBCU31I<P?^(oI=Q&%qK:<SbN#B;l`cbPlT;$ob7aK5U\e<<q*2[]A"D5j
!Baq!a=*p12V"SZ4%QFih;EaDI>+76Dn]A)5`fM1hJC.ZMUH'h3AC;<WBsVM]AAnU;]A+BiXG>+
MM*YLSnHt;P_-f-;HI4!cZ+7*;^:k:`9tEN]AE&-s3`kj2"UQ^UGjukNN`;3O"B^QW0"Sl5$B
sR><\T(2=T0fd%W3\eEE.3/0UkWL*Rr2jd'1XK3@@k/nRB8o9O[SY.c<JF(#!55l"R&iOdfK
n0$P;]Aba[1'>n^E`]A`cBfjUGL@Y_VIhnubDBGLM(nYm'IS1Z*n"ciPsM>6O9#Ak90B_[!#lj
TOFsp^aYL%1[]A$cmq8c?Hj&9%E<qX_XBt<>Yj>pQ-!V!&+rl$@_E0!VDDHPQ/\H?W1-9s*_X
DHQbl;oP?"%%&-q)L9h^9VSedrNItl\W>hpZSj;h0.*ZVP!/L7QY_<j`3Yj`\ea@[?WC;@td
e-WCEg#8H,71<I("koq*;,'BX>#td;*,;6i&@dF:f8YE8:La-fgf$8GfJSR[R<5$??#&-"Me
dXQBtXQmEuJ-_6b6&hnA;+bqhr46+9O$.?Jhhj`TL*9=D=Tg`W<F?;nak\L&gZ>g.F\TeROH
`2\)_#dX=7HaF&.fLatP)%1H2uD[`>2DP10hLK4o#*O1aO@41I3Cpa>+A)nB,E"$2_H,cM'D
"Z(jKf-RBn8,+(eL@lCb,NV9-?D%9>i_P$nt<@sV,k-/^M#0L'lj3-kt<hBh4^.)r'6ZA2PS
h_rsM[`:Qu%5?L-U$`n4Z3LQgEjUhfdnpD$LH<Wlps3J3/D-(M60MHq162L#qq]Anjmf)7d3R
U;!_63M!DWc5ro!,BRusU`6%!:%NlLg`a#?OdqS?'i[Akd8Z6D=ghrRojD;W9h+5b9m93<3L
O5PKAEWFnte;<8hCYLGG/`aR)1K50$o.OC:HWK&_A3r-KsbD)LTkC!50pQ*&8[]Am]Ai!`"KW-
m=p^CR*A_m0GRU=VgN8,L[RWQRP)T8R&IGW.M_/=Y1`='>Yl&-.:Jt\NNe;K?8uKC`Eu54^%
?,SYGYNNW0^]Am9Ut.oL52eOKGlK4tchM2hT:-kAcVRsu@lKE-C:\#_DoB8FDC`)D]AjC4`-9\
OpS[YgS;/g)i&BPLJD7qM8ms@oQ(ANnm7mZe"h1:Dh==PU"1@SB4;a7lUOh$#$;(UV5MfhNe
qLgajPl9!%^'d8VSX0Wr74En##+\1E8/-=eW@.##Weg&sH[!nQaJE[BST8YR61I,+9bmR:rK
!!B]AGcu>Q(HC^20b;`)oqU9AfQ@B[QN<lVo@YT[sCA(p7tLM<@5Cf8[uoK)sNAsCqHG$kn=?
_i5h(oO`Y6NII,_3c60`D)c(lW*ds8#*d/LWNlAsi.p$O,<9_RiP<ePJjP^U2ns3*?m\rQ\D
o2!=eAS>.g1q[;EaRK7]A-Y(YHS(Fc=Y5cGj02+LWqM<D/H86eW?)\jft41VAfekdN,@dYqc9
"jLXbY$W]Ai!&Io8[g`L"::2E[A]AH?ha*(or8BeY9mhJcM(lriP2XnFCl4c-qgh4e$9H2:,g$
dcA9A$E7Rc(kXtb`7@aF.^D@WeR,\Mb%NgQbYlE+]A!luZ\@^`Od6:=&0F-G>$GD=EZGT\EKC
o;LVV??4HUYVua;AmV6Wc63>MGfb^/ciB+AE6Y<Gut?GElu!mth(UI:mX4PJ-692>.I1I?RO
;AgSH(Xl[81arUfb6m%+eqJIo-bbBoOl71cuK)-?V?ucY2q#R;AMa>u56gasZ4WCL:D.KXl2
4+MrY.r?2LQR!%@egRbYjZs^h;dQMG.QKmCp#\gE4jH#);OL6q.Y9F,H>oh2+2+>RX66lZq(
AcC`8Z;,O&H@/Kmun/qU//l^J-&7F/-EqmM45'u(M;VM+D?J&rGBkH5N&4Aap+K\Tj]AM?R+r
rH8NW4IGbR6?-:&>qi(2%Ts);V4b',Uj9J(24m")_t'!pCH#55J<HH%bQFnu8bf$*A_n(<pm
8t&8&k89&g%.!+%_JKmD6jJ@MSM)q@a)fZGX:4.>oGBL(3M`J(_)*XEVCd1Zie&g^ut7gK''
`f<PHk>nP^M^'#uO.i!SR*]A%6e>as8=8]AXN]A@;*4)33h8!W>?@(*_S=oLNBU+"Na;(,$D@Xm
11Y_!G,S?au4=%LfK+4@1lo"E(9<Ti6nT=%<a[=coEXY4"mKa_1dW#c(cEujf&W&T^K;W+ue
L"&RDAT]A:eb/ZpP7=Q)^&+/igFQ/q35""pAUBaD$"%`RWtWZ`GV8k0sJnaFXfoZ\D1go;bu6
JM"K2pNkYa'Si\_Z_.=0%%*'QGgD0"qP:ph[TB&%Q:L'd$u9LASKF$fb\l&OG@\tJMVh\Z`p
O>=BP:tC0al<K%UJkjQ!k7-4k0;k`o\uGO%60.?t2Bs2(S]AWeYCH`)P:giAh)t[,66!GS/0&
>,i$n^4FU$m[HsIZ,@%A>h`60N@E#.I+cBRA%3_(`kZtsTX>%sE&VH:Q=nX*&T[:;R<c\@4`
WNp2Ap%R1i,_,)mMbkdZfY"Z]A^^jE6`^4#nQklN#K4,I@IRb'HeeV&;6_3Z*5)kpqX2b/Y,?
nC#Q>qHq>*<%.W-UUI$H%J\4B#L^(g@h#\3<.V+d-O`8)C-TmOMFRKO7%h^scn\``:.RbJ/)
<3]A%uNpoccN;KG@VIkSd^,hZo+Tee1_u<+K(jmVUo)%:\qauL&@mR&mam\g9!WT[]A^A!Y;Wc
#W0%DHafnfQ??cM6_51t(@_+lc$qL[la']AkKOF:A[$MO`IGVFo2Eb5Q8ZlU+dr2qs/;QM39[
Dha-+_T_c]ADWG]AQ.)CiLki8[[a#CgZo_7sdrDi%7c.@RE*bk#UU:-cG4ZPY*OSCUFe`rRW_X
I3m9OP^*8!,\]AY"(5:"DsdE5m&f.pg#[P)mm<6LD*qH;nRJ%eJZNg?1GD%K`55lVp]A[,\:&E
;k[fR<S"XN6=KLKdkS$)A]A%8[]A>2K/)s)0QBs[WA?hgqS\!/<9p3P*=YX>EaCko-8auqi\\S
dA1's)?!IH0Q<L&mIY\CJR?jP%X<md?kZA(icfhB;;lX5W>f=jpcX]AIqMa8gh\lId]A,o(j[N
H1g=ma+RoZ,h$a*?ISmbK[k]AmPUM50G_N=T5Ishpp0&i+\Am,O=^_Zs0.jZ&YfrO/#D>k]A`a
B^W1:RLdXrTea,`pj5kNYCdtT0%BPZSm_S/Y,:`^6&3mIe"pf3tG6/'tl/+]AZUZn1Dc]Af=74
JdL\\\PtX-3[WS[,q:Z7f^Dc%N=6>Q(^qaO[nO0#n?.n<[.`7cCjHR#+DCn3Y9;kNfL9-?]AV
RC4buFF2.92?P/+h.dm;(VN@Xrp="m2JJU^-L6+!8ZDTdoFFE&Yg50uGg:KuL!-RT:^`fE<5
g+O^&#82$Zp5L5F<Ge.qDf5b0f=;XJr!RW<EuL_,"YW95#3//l3s&D)`F7tk=DQ2X43Z^;OM
L@FBeFG;G.+S"P`:'!lrkfE?[".+rSV"LM?5O]A`TI1F.%)t$s1rn*.Amk>H@'PB?RL0DDaPU
Elps;AW_cpM7q"SHM5PeA*(=(ZhcNoLG:9d\e5PEMLSHPh2l@N;9\[/HaV&IFI4lKRM:Eat!
_:qm"o--<rrX4!SG,DmPSVI7lp_$J>QU!HZ`H6q*,5.*)W)\H^@FM3I*sND\-1@pZnV!#"oV
4KBYp#ML8VeqAfF>jhr4dGrEj/@NMrtL]AB?NJZ9CIlBcEaWTOaY<hdcIdG7]AC(:=OQsRRB_7
Tr!p*@+j^V&KuSJZ/J&J;cc?>o+&-N#m&a@Pe$c?Z?7E#b9t.ZGJ9lOpXsoGm0,XG1(/fNg?
Ua9g%jN,%A>,I0DZ=2<c/VfG-\CI4$fOSL,:\Uf(-1i<7QZQb.K#8&?<ugC1S*hOOhg`h/Bk
bE4X?o*;6A!$C9RKkbV"nJDsi$E"kn3?P4+Wb#0>"q9t;oX*o!%3c6%Ur\BAca5[2*:bm5bE
fYt%MK14&neMI4!jm^XIGPW*b.oY6hXg&KN1U*P6PW#Cl9D7uKT6LWW$kb^MHu"_IBbZG(M9
?LZ+:9]A4cA;1^Bn>5aT8MC%'fX:E6EaB2Z_:*67gnVr"sR4AM!gdiro"Uc.!b)WR]AX"KUQF@
CoSh&ieJYnYCk:O-qlB[q:Ms+b>D`VIW`_1)IPdU6n">tkG$oH[+3l>fCbB5;.97<`E=Ja\'
n$&:#"6Xo)PsmY2ZNsk^;LK[(s<I2,u&Us%!K<-45;%-A7*lPHGB>KnjH^[jFd_4LZ(X*I/c
t*?/0_7;SJ1J/[=C!a2n2d`)4g_K2<eI*#ssO8ip!/is-Em.Y=rd&=q(H!<UQ76LXLh\)Tp$
S".r!@j0*Pkfb:UA\\uTi78f-"bjiEFJ3g#UnuI\Eo[D3T1Y8@Hdk3rZ<E'&R:1nKV<iH+ft
i880bC1cAWi1l$mro\nPp8#9s*?&E3Jq"NK)[S0-/>oa$jZ>?Q;I9LWgk<YZgqrR[B@WXi`$
PXW6;Q@3A!n^D_:.bc..*'J''="d[2Ra\d;`N2<9Ye:/krVD:KJ@YQn[EA+Q/=/%:a2r?+3Y
g^&!f?H5I0:=#>nB'W7$5&]A7Uu6gVbsDe]Ahl^Bp*Tg^-9XWXg5A;.-Zf[]A=Cse%Gm>7)(Y6+
nT1!8)U`#KJ#=TugAFL2grCWo`BUlLX#>IJJOH\n$H&QGf&"tmLoX(\'<#)("^a>&E=OQ&_@
U#sadOn#25&@7%-AaUe0!sn+`4D0c-^p]AT?s^U;H!Tj4SjF[5_`g-Bl%Y]A(;03=`E-\u5;n1
oj,)s%*`LhBsNBUoTl<t-*P9(W]APed.^=726WHFg%,W)^mg,k0h!<;<(NKfk%3Qij:dVesC]A
Lk/%9@G8TF[,6WTL-t_JB\!n'Z8&YH#F,"5!G:T?kdPt(8o1AaUSYKJZPSElV0+tUjY'!%Ia
GcchBJhK@/oau'!qmYZ!&=4/cR[V^?UQHY6\-APktHbrXFCS+V_OlIU-Y.1L#gi3]A*d1Nge>
Y94/k(Z;Etc+'s@W^EV7p7`U[F)4&D&\\Kgslh\.B'I=I_V/pF2>m]AkP9)g'T1G\m%#FY8LA
_)tQSuU<<<f3Jk5\*pA:q'"9kCntkd@KaoDLWZ7onIG7#oZX(FL)?,]AAE8_:cSI>;[@50UQM
:$YR1)gs)=VnN'GNX$:$%97b41aDa@b.!s&4B!#V'<63-B(Gd1VQfe7##LRN>%"%RPHNG*T4
+,VN3(23qUq+1_)quF,Yh3Wreek0pqoQOC>Pj:1h'ZoE7"Zh8kP`9/=%j:5r!+F(?ibPJoK>
+g,R>3f$.0fG8jJ:]Ae\SNE1N>PlkQC>CZ0IWSnn<ioQ(M`qBMCI$a#Eb=HM6;/Q^BXYV\Si4
TptuU9Bf\aHrcTUaemGD;N5krVOfm=+@^MJ4IT=T&5:tF%OXQR8#A,0g>?Vb87'd4gd?>^Rb
FaKSJZ*QIQXJD>[Ea4*:tV43CdRfjb6T`GH;G;:4X0R<iP&C:Zco:RQ1Os[CmP7s/VIuD`ti
+ZG-l(4,4g.67]A,tTf-RVf@I\i3m@bR8+D&j^IILS"InJk:ca$qa%r(VoBM'\/6k6FQp:HX?
Btl6,r0WcSMpPfcUdmIfL*>%ScV6P.0gBpOl9?ICH9`0h$.(HTaQtUi]APL(+4LFG?<f8[AXc
e)?QG9g?[?A3lZASZ4jVCfHkkT5!nmN-!m8F(&^]A'ff$l]ACWI-hfqUCUWB_4aXMn*GG\nQD3
&++A'>eXVKh=',F43N_u4^N?\i$:fZKq`.I5<5f&<pu6^67\'UfXC-LjL+?VGLC[\%o,0?Eb
U1<aO5<r5<D)P<%[Ytk7cL<S&#9*e5,Y9Hnq1?L,A6ps)o[iNT6#]A]A'nugm:\brKA-+8;'[p
&",4Om?PfN\[P@8$jWB?_5Q#LmFBn)=;B0J0'[ZZ9Vn%J8@<"d]A2A`*i^N,_A_h1D#.0',40
6KJ.iL^!`!j7`WK5an$drnkE$BZIZe/W>o;N>#i`_^kK;q=LX=a0=%]Aa+I<&g>CA5d=1"l'j
k?[&)@b'VE@&$2!8@uh+l`$LP#=/K2#leZ-NB,m:_6d1FYnG_=)!K7D[?$eo6,fT`'Pk*a'p
laMUP?I`KPU?n<Yl0Q>IDo<A^SV(@mf@_sZHLBQ=bo:ngj)YCM*@[F+4*@R-JD,;km.#tW3k
5Dnd"r.0Y'7lA^EI2O1*56FASIZR`!tljVDJBA>Qs]Ag(RLH3U<oVfC9a\ANV:>!Rei,R>ISn
#b=IdFU2J_hN_TbHq1]A/kEo_EW<,eJQ=8cWl7ll$P[:sS>7^_qFTORJ4WKoq0t-kbXKS^kXY
_u4YP[nTULY2K6cr*IY7)#k@D)ua.!qu7OS.j65KUR?rSUG_4ML?0ngqn(#AB@(<YLb!+4Ia
@%Z"h47IFZ4nrR6j748*p>:-r;aiK[=+Yhd1%(0[RT6?)k,@IK4nG<rG&WjbB,QIIt8T~
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
<![CDATA[m<s7b;s1a[$:3%]A:pnjT6J>p$]A@T[?/40\\>M6\jZ.j>qHS\'jiWKAiF%B?Y<pHhS>?b#p#i
/IbgHr7W@EcSd9pHkEC4JP^A4Rh.&i*6uh%aV8h<-VqkAYYBg\:]AkO+4b3jW!(FH(XhVhsXe
C`/a5IhTma$"onYl2uiCD*s'0J%019iAp^1Ha>p$e!$Lsf2dbJ7n(HmEqAPN`NVMndl4^iY3
$Tj=DB-2HGAQAFK3PtA^GlG#`kNfJ%UO:,nOEb2/(_K)Z"WHmY?p%ZaC6f+;^i'Q0O$0CP@r
J:+<j#k&L.cr^\AQG_BS'I34f<"W_pir@Q"D#$$k0OiTcWcCTK,\'r%T)@[N'%OM8XZ5YVJo
>-C42J^3C%.NUK^L&:OU3tC$H%Mgmn$:br?VM=:=*!i%0`u2Np4D\(XGam\%*d2Qf\,F)XmL
jmb+_ZN$VoKPj_f)8XeD%&l]AC'5mo[B2_=hj,P@4$6(1TPkf5<W%tlD/1Dh_rPELfBP3rXW2
-Ck6jA1I6M6(!tF%<rUQX0%.Q(QX5uP9DNQc;=_O&d3R$RHa@-"Lo=nE)i.Gs./WmK$jK&(M
*-Md.2ss8>hHt_e/(#'<q"C4`*Wq)UTqp&)SF)(]A%(1T[*WC:'[Q01hhOen*lc6^B4:#V$*l
b)J_.;[Tqok5(fg[gU\M,%58tW:eoV\FNe\+nF_%%J"HA$X%n6oE7fnu?i8GOlaOJZIHoVJp
/udtX%Dg9cJr2gqZ]AjYfi?ZTT%[Z7DJ#1"8%q#%/,i5dt<,+gNWDQl1&rRI,n=JiZ!kno(V:
#d*r$oG)(,.7Ch0^bMZNffk&Q#X-N_es6(BM'>m@S\oQip-+iY#rmM0^0.O\<g$Sn;,hUU89
VV">h-M*8X<+J#<?eB&tlFMa9P)uX^Rj#QBn$o_i8F_(;krp]A#/Q5<bu!L1:=U'^dsDm&Uk@
VTP.,"+X%Wp.H.3YG0(1K(.%f4tcI@?NLu.NFEK6(TESf@V,eP:#Kr?s_NooCQ@!]A)q@p0Xe
B/4(:>U4K.MW9MotW_Qp:gGU9ZEe<;0X9%Q=slOi(f@5:m*4F.l<J0dHf1!f(/RVR:)pc3)0
Eld4<8q1+BnE_n7EE9[)cgeN@1_@$:,>6(GA2$`;0W<<EZ+\d'j)L1Tn(,5XoS>;Hqta5$+a
cnrlmR-bE.T`a4"6D6GX%:]AVAEM<5m-O"3i*YG:Gh<IcKQ<Y:c($E?n0%<]AO^!`b3GE6Gka4
ZcK@oFLIm@/OW`s6*koK<?nL%kO[;CU.Cmb2j1@3j)f>je.1#Z)p3aW_0sc2CdAW@[#YIpkE
dD4KnqXBg^qltm'0I8_&=+tR@;Qm_'M4@\b70G*f)HQ$)=-H/lO\)J/aC%se-%ViRW?eI>e:
NeO83.6rmT12DNleBW3<hsp$ZdrSn!7gM@pcAoc^@E2B`]AK%4jok`#=7:Q@O+dIq/c\b0,Be
S)J8&d`ibPjhDQ*3EBc8Gj!H5Y>?U$[Q!-+S&es*(8SpD%VO3oY2a[V`0V?;Z20OfVfQH0Vn
q+ZCP9^$DqTK8WT.:BJY7X.,@:5?Ms4i$8+bf*(?M!u_"GrYm%+[;+%?=hUBhjm/(?EF,h69
Df:7t#+=.1XN$=JABXWJ)-k;rmEK*t2^5_4+*IL[;ba/nRh*:uEcI>'C+?Ipc_83tb7q#2P;
5b\dT&pqrF%q*>;$L59=qOlO(i\,iMYu$a=Pb1dlR#K5jY*tC/9Rl3!S?k-XKM*A.&[kY2CJ
U``sJZgruH'8=\^hOFuUqp@.sn0$Z,OW]An"NX4FX?]A7+J+u-PGClF:ctM?f9*[j:>t-J[Y*R
GnHT#f6M($4/[Pmb#h2PRhqRUP?pjQ\#Z:oAMPrIPQ&Wn3p$\>[<@IOnk+Hm;XN@\?"Fcr<b
hm%0+QWsjiG-i<?t3=d[.ameH8#Fc,P*)rcuP8KMGd!J%gjb8<EHOH(Li;I/a:@O$Ce[9aC8
"B5=T0<Ga%RH^JF"8rj6M0.X\o&gg+`Y!N.p`1,dS2uQ$>-f3YFgJ2/l(2Q^h/Ou2%88=_QM
A!oQYK@m3e##iW&oGm?<$K!rQpD(aG:FlN^nV(Z$S18Tn('YI+@N,-h5VZA7St&W![p`cDl>
)08:g2Lo5Xt8(!EE^K)*l-IGigq)5*493:8`K9RF<@@Tj&!)^!TKn+16nD7tF(EiJSp.8sd"
!E!>gi5ZB`!-$.V(<N"T;!JdW6!n('0eYE:5<H9Vg>3P38@uD6&^,pGG)OX=$fh7\9<t`f[M
b4NbuUG'Cm1g;?<>*.U"p%hC^=e`.G)-3jgfif"^YOSTMPT'EtcB;)*/;[V_XX_N9Q&bF(H]A
qmLb)j2ZV6^3nkBuGKW>m/(>?R/MRiRfoSuT![YN53l:6fgn<P;.I%<nfUC?6@%oA9_eHVW^
fo.>T.a&?Lu1"*`d0,bCN3dj?H_FcFf-MnA#td*g"sOP$&B=Lr)l4("K=D@$n1"L)JE1GAHL
J+c2'Vb#h3J7IR)RXlDu31%[R)W'kIu9BMmXZ&XOK!%2g^LM@pV<Luk^ob's[FY6?)3MEg24
1&L.T06=O%eO<'Q&N`G[%2=M$POST'K2i,UD3.U;oWF[ZnAdsIW<-/1Q<g6lD$p`oAnFjZkJ
S(bj9]A=I6o`+!DQSN'''g)seOf*;nmTErG/Li"GkUq5>Y(]AecU0pN\Db^-ZDPrAkItWq>fa:
@'I]A:E7KSar=>i[sU(%VIJc/F94!O5;E`8<U,@Sn<Ga*)53cOITIPO[L4W23e\d?97j*""Vk
8Fq4_i6#%Z?'@;gcB#e4=Mt/0GL=aGr7[kk+05ii)#I?dJ<:bFo(k/c^kV//'O/$@>gtm^i`
kfIViObY$7:>XMS-j@u4@GX?/itBrb3m#N@@6^:5Jo;l)U^UR.u%c'ZT3QF^;>$QdD\EFPmo
!k*rBKkl=-<5D5p]Au/$;F#,E+<DaHM=_tU;>e`D5Qu)#qIKO/T+nA``_B3e<*PSE;hCF-_'h
TlPi*uWUl2%q,-!)\4Odr.I"k@-Y&(L';5RRRTDBK3JbT$hu[s,8*P09((MSZB"4J'P/0*YU
XOJnYa[<Hp-gk\Ar_*ipPdNa>[n17PP.4"5H7J/fF9:F?*-#tZGG&KA*,F6?#&Y*@Po3c[)8
lWC[nIXQs5<mLZ^K@Ao#1II>#S!F#H:Dk'?A'`Xnm9'j@sA9/EY8:ee4-p"-I.Ec^qrZiST!
Rq]A5H!.NKZ#q&!M/#k/[8$_t20jms1ju!043PikS64SBi?5o.p0dL(fI,NaO`P^^Scbns4_@
!.Ct+A5"K(_u;s8LOo*O^6gmIlZklFBLp@SP:I>/EWrYdkLR!OOkrFe"JBSh3;RG*$4ae<(Y
m#/Hqt,U3cL(g@B:2s'KAR!?A[S<f[Sile:6rSJ>ce.Jqi"?Q.1Yu+1-&`;<sXconP5go3TH
CT`!i*MWVor>="3j_l>/_42$Si$ir\^o.@f[D$QJ^r'`DJZiW6[\%Z8#.W=.pDJ^qpaP4\s'
>rXj7#m40@N2\@(q5B%KkID-"pY9:FTf&0DCMCk=bqn(_u1B0E?=pQAU,ZCm3L]A7p:Q$dOTi
eQ0]Aeo2qk&ulRKD0%c2!8W2[5-Xnm9f&%"u.D;m_j\WjF'k7\UB-N.FN-<#F/44W#![Eb)u^
'DFQ=a6.RQ4#HN_NZN%lepO3q3A:[fI85+Q<^ePjZ38O9RUse\k/QO(Z:$`%Wc+PDABi9*pa
Qk=XT!%_,3X8"f2fR4$Ead2m<Tl+Xu-WTF&T)4+)[7%6n$*oV*:S8RVm%V'r+2N=N4ZSD+CZ
DM*tPpr.1Mm$/9U!0i5Z,A?`K7GT#1M,:^kg&("WtDZe.l%J?NIPQ'X-@#J<uX>,U%;B#J9o
&511>H)CoBpPg0p5rkBb2A_hV+#%@6i773g*C^(*Z"WjZ_+!aokBP,*3>.fO:ads+j&_#%6`
8QD'<nCPY?1:&BrQS9EZlOL;1J`Z5d5Eq_KCn1gXHkR[CSckY^]AU-5Dn^FIt<cFVns@k6.FB
H*cH]A0_6.=/1T"9O_/Is\N!Fb-PH7B>h2cA[5X:kUWo:QMC[U_EuPn,`HB=I-B"T\(A"8,VJ
qU`@np3$2G*sD[u7Gg1JnWt`eU!i:^H;#HmFfJ]A%sO@Tnp==4B>+DEZ.e%A+_,m4VU=>'XhX
PF__[#'65k#C^L)[`GL?"7*IVG+?:#S3NplK>!S4:fZO*Hn7>8^KkTcCa%1`B*Sc0IjE_,>;
%s97*]Ah_m(_QC!<m###AmG@R5UVR\H?s(k?7Bl?AYNVOB6<54C,O2ZSpJjVZ-E<IIniqWMT]A
l')jstY'KY5+atc1H[KP`J>D$GF9)8>[mqac7U#K\_JIU9nQkD0pC>eP+EN?X%0ZCr3O/h'q
_,o%t?I7@'[Yknp:3^_V/R6,2bM0'A8]Atk-IG%L5'$P>TXAIO=2>Bd)kE[#n,-/d_LLe@I]Ag
?Xl:8Z0JX<P8*H^d6[%tT&Q6m(_CcSo$_+Gf*`O,q^i*?sK]A'YG0-&CE'o`1t2HD#G`BA'ED
nGB"XbS,.'\<]A&o7M<Ctk/XG6D$A2/9)3IkP01u;n=eX:9ledOiJgi&dT,5=@56j7#%C@\]AN
0i\`ro*!UODl:*!YLg%g9Q8f&rn+e,fEua;4]AQ_g]Asq(fJfKQ:h2Gn+)Z*;6.9N46(\MN;1Y
>q/HoJk1^cN!pC97!Ce2GhL3p?<EuZJaU>tQTieikHWp'<N6\fi#W+q=@BnQgs[k+Eh78I@>
j.)VXf#I6%CR"n)gP3/)c:30$/fq(N\<J&cJZQnY<>lH;le"[^l'&^RJ2ab]A^=5J=$aGL5oC
$TH:=&eY3\dH;\W]A=k0;Henn]A>kE*N(6?:ndi(gU7f`oZlQ0C_gH;7H,]A;"7&c8Q3E"pb+\7
ojj+1_L$.gDZS2/W**(0<OnVNH*!;o/k5*qmn(k>+QRrPK>`UE/D=gEcN4CF:4q3MjKXXa(Z
0p,HaY[41:hPa]A/0BNk_a@!]AU6sa2a/u08*qO,:[s+3o.6.jF"sF5[caGh`l8QF-T+o6WhU$
DXW15UPKg$CH7^VpDTWm?n0Fk>q]Akrstbb"6m`oek1**'P-Y09n\_mc@$8MOii[?RAZ"3c*G
`DRV6+O)s\G?0)D9^fDLMCpQa-D$jH^i5Lk/Mj3:gE^Kd#&h8TN8.f(TRJJKYV:J,B>8ijqm
bu-QFX]AN5e=X!EB<`M2$NH4e/RiZ2Ua(kVWBbYDSnn08l5J?nIM=W!nI+Cr&lcjXJiKV<r64
<"Y"uY@?&QjYgpAiNBE,(;a6JZqXs@*Cr:_tK'B*Z706'==a8.8^`:[>D`P^$qH:8]A3M3ZUE
".,uH#(oQR0";\O!%^>U3i;s?)(^B)%ioj2u=<bAI]AlE)9.Vc.j*co[T6;dHq;WGmdB5"-*d
R1b<3#tJmtF2Z;`Nl^PmLA+dS!$A<,_N5_Z;d2*a^73i9`o`?@H+K`Y_>gVFgph?CNif>[jQ
aRN+N_-")2djXGie_m:0CBpjfFCD2gE(*/hJY.@p+?UXJp88i/nA1j#jGJOWB`-cpER[j"VG
lY?6=Uc#UTj?4CMZHi8^Mjgqh?[1(]A(XQ_/TtaoRNsH,BUF=mfD6`beg!R]A`eX`dR*rb4tT:
^3MF`de$Y+/=@jj9T'#3gomQ_>fDMr92C!u?DD9c`nru^dU+(]Aq#=pYBPH1Ee/ahcuq\;^,3
'!3?"ktH>>mD]A(F2"cmM(Yj8[0;14Of.H<&Ec!'FK0sZ,X\RU7j@#p+pUN+MB:U<J6lsrVW!
Z%rq6p1[r\LRp[RT*E/h]A[;2aKsF'3-FU7`QX]AW4@,>)uYEkWYo)M%TT\+-MkTf)\qOmf-.u
pge"5bS1_;YqnV[mBCGY-GVBL74BZF7+$+EZRg8E.(leCpXoX/KW<f(g#1QJ3@,gV4oE\QGq
h#Pm$"trEEYTc'J%.coGLc:`aP3YqZ2+/s-Q_FMc1."H?=&=c?2Fr7I!"YG]A2d`1)c<JjEdN
Wn%ua;_Xd[KhBriZ[eBgFK`@K.%[`O:_ZeV``g(4[6W=rRC<5e:_m@P/bMQe539\WKbdRN$N
R1m.XaXHS'K+NBFYHj9r.Xl$Wit"<;k(OIFmAG]ADaVCu]A^b8!U8m*R0f2i?eXBe]AN`S)E.,o
(0<Dp2'\/D@c37D+$_rbofB:[=0:]A(sL+7ONmBlj=&Ns8WHMi's5O)XJ&*tZ[-VAG0'hD%1N
W9;M4Sq()JYF%eq&>2_-!7j&^3n2Q7qnT&K?s,YPqnpaY`i3Jdlp`1d^e^BeffgLdO8m.#l)
k[YOT(S=KRr1W5K?(rP^q$g-dFphKW"B"3C7o1&8,$>SO?B=lY(F5$Mr[R2I^eNYZoTqUt^M
EG1\@ncEVGeJ@o7?nL\_LcB!g)RNrH=83?N,$<KP-MZ_rX<j[[-)s]A::'[osJCqb0k3abklT
Z\oLR72TW^9>F]AqSoc$#k_BeBh4Dp&[(*3aUn/rC^A-X!*StB</m/J]A7U]AK:.Ulc2SiOLY,7
06^2OZCO*F)*W8gO,-pkK1!NW'a3)?R)gb.=E[?FV>;!ZT2<!:QJ\Fu@:_7]Al!EA^[)o4B@D
)p\L4,Eg:Ch;_mYa]AR`2C0H`nYVJJiKMHH%T\C2arfj_8]A[fi6lM-G>/*&)]A:9B$oEO*28j"
66]A@m-RSh377\"3O)aK.@e'>Rk9WP9,LT[-j8RD.%?>P&JU,;m.BbScNSf:sDKk3I/Nd7YhA
H9psFW*nPjbaCa3*f\WdSM%R^P->VjCeHTEcW)FV*F5HG!F:D1KpZX_h9AfId8Hmq%g(*UQL
@<;LPQ<p#>=?l,DopRArJm0qLV!Isb?Q#W>6Fd`Z*f8G.3d?@+cuO9o)?d26?Uka;a6Z=[aT
o=1?;>.^;?60G^<9aLXA<Pq"kt%$CAXWpjOFha2Tmq*Yd)$Q(AS&h+$/`a<D9*FO\C0r;g5[
0*@CgUp%bR=`h\ufkF6-;,L_P*3kQbCcD>&!rQ2q]A;Ka3]AV%(Q;'uL58F/(Fm"pLEdMsjKFo
odL_U<,9Z;*8f!&!@nVjI%noRnoc:8kUpo7KIGo)^du46qp*r/:V:3M[a#bDVG59jTe)M`E6
8kt[29Aaq>!)p*KM-qljKqVMXi%ZTVT_qMg">4aTU$Ff)l>/ITO)`nM2'[sW.a9>Lt^^bkB[
tpgebDJ$3+N3%u4;)*>0!rG*`ZKAO1"RMF&"49tT:e3P(oA,$%WWk4?ue</;I#:`la/JdX]AU
+@*\(9N]AWg,[4KZ2Yld46?$)?!l*t"1UOJV94/r*aIqc;MZmHtB76gV3a0O+F+>^seg:g4st
p<+8[&Q4QjV4&k>Q<eBS6QCfW8'.92CLiB603@+HFqq<]AekWkGon:rMA/XqrEB_4_[7Rj,nV
+&+-5g+h3^'uairF>Y'^#;:RA`O-o_SBaf.s`1(%H1-m'JEM7Pa%STc]A+Id&HYH3oK4I`+]Ac
;_UR0e<14>ci,C8mC]A#\U2XrX?KPR4:e+Eio&G7>\0;)[ADD<K?!j%8Lj88uKZ-R,NHqBM]Ab
[FG+M)#)KC,+83?KHBZA0?c(:*P8*+mG3JHL$IkoHcBs#@;8uq)lAekgE<1gYSr+7cn%ac--
Yr=M%/73o,n177auh?&$"TKU>+dBQ-g+6AL[aT.npqJ6[d=eKPN?CbB9aEjjc`igr6TTd,9X
i8!/A`n?[g9^T3"E]A=US*ZJ6*T^EFmQ`0*kA,aTe._+V+(E+,\C\):dd7?N@>I%)%EfC"RLD
#11&:I=FZc_i0THrH4qRm7i[Z$##_WR@]A@7\T+4eeC>L($?9Y^liPooF4MYeEc[OL)WGJW,^
1FVS&3MMXu+3=R<8e#d;+LdnBHH[/=hEHhp#%VAKF;:Hf=\l;#)bsE#t)aY_g+W>J6;M?Ja`
\flk9nW)4X,;;]ADNq*Bhp,I3=Lt@XeZcHdD8!'+^^5U;,Y=XgIh/3eagI[t&\*lB@LOo"<tU
"#aV<*bmG;_Lf<T2'AARj>)A[f=(+s".nn?re+?aY8W)5W0R)2bT=',4oZ3tTN=p#]AaiHGm/
H2LluY'UVp's&A@52@*CqeXEHcr-2"EbKNlkHfR%APl%_af;G%F7aH<Sq/fUQ>NmudT!\.;O
W<F"7i_#0Hq=QZ`W%`GV1s_l$SrjE,4/#U/s:RFH]A(1#t[K"LZ\PIFUeH]A0!gg=J@eTufHj+
WLFt;.-?GAX9D_<r_jWQ*':dMd;eZ.DZ,880o&6*F;90*t%BSC?\>if`;K3b]A]ASN<Bh=fA_m
-Okm-6I!E@CHhHoo:R.CC`KiTrq4FdpFJHG!nec\oBT3:VY6@pZ,'8".<ZnWDN\lqHZ,D,Ou
=AN`D`3h;4JX$6h[(==S,(:t/7#Y=DX1*2@!)\S@a_"bA881VH/_DFD;_(l>?a8H]A@^Eu^tp
Z-O#&O$>:NCj_\Qc+e2FHKi+TRI1jYHV\-^+4?O5WpU+%b*RdoTPKJF-dAESRTOQq]Am&X6!`
5%a^B[kF'A)lEN:u;SL@Ji&+0Z*;LcS0EbD3Ns7[L7]A6;4*B)R#[>o:a<5&Q:VAU'N4WknuN
.r@I7Trb`2cQ1oX'=GU1R69(o5!q5Z!<VS%k"qpU\#uE8I%MHE<IS?:3E3$(IWu"o('?Q[]A9
Sdf%.\f'G!G.Y_Xaot=,<ad*Y1Y'=ooJ$JQfefj`J,ep0,/uq.m4oHml)3ddN.p'9`=.mYKD
k`==I<-S:``tk<VOJkb&"GTS>abV]A,,?TpS"[BooME3g2\e[3,+G"Ksq?0<83@/gr0N:^$>O
+t,n+=Ue"=`5p'l/9Q14ac#0u+7"8\=,2%/[s:G^Di5'4aB7%8hMP0K_*oUO,m%g/P)FXq+9
@N1O`!?lY\>%Q2)A9WbP2Uuoo[sG5cI`dB*oQYhl+<`L_(1:)sO2q(#7;q[^#I$+0*FkMn6H
K.6p/P'V&)3m?oMqXU"72L"+Yd&st>^4YMEAG!Q?YIAa1t*<-d'FPVC!YVmddSm/afr9b^@C
cVnq0MZ2njandC.WT&&!Q08j2G_!27%A\KN7:!cq`0_3qO\U\kfl<&\]AbDU&h\lu:^#kKYe8
?<a<@^49;XmO;iikpOUC!<93V[jCQD$T_1T]A-+@GI9d!8Ho+n/]AtoV9e4W5sS?DK=MDPV<j0
%.GYS>/u/hWLJCm%\NQa1uZERp\R]AY\CJoejU"l"bHuh.Q,6dcS8E.+)lfUTY&W#Cr-FKDQt
Op_IuELTiK:3(KXo0Kqna+PSX5muAj"llOY_HgpPS0G5)rKG<M)L]A?;A87)[[lJ=LBo%Mnb+
m4JK'-@i_+68^#4Ap?rcS5Mi%n%&=i6<B`YV6a4+ak?H"XeV'R@jjpIRC20^&g0X`gm:lqoU
Jppt+h'H,g9@BUR89O,ONdA)2kg!>@KJM4cH,lZaJt'H;ej=)Obk:s&dWKj;?X_u!]A#[R",s
Djj:?&>>sOJ[6EMT!RV8EaWkZ#I="9+V]A>1*)BgiHe#*cU_&nX:1kn,(n#`AA%'[,'3.NYqi
(nrDuHq<JiVcWX7k:*QZ7[VWG_TGb<JJ"OO!ei'9dH\1Vo><,%/^J?rer9/4H(K@+j))sTra
N\%(Il!I'^.oD2iFWIFuu\.:;BbE_:*/4X"B`Yp3kEN?$h>4JSj.o6ko'eg[K#"k@'Q8fC?G
I*7\*!1\Sr2J:m1CF)Ug\[b>m$9_pc<k"WNO*i2Y<,W\uY=l`+&#n#`m*>A010??GP->$j`?
UBV3nMdNGi)l)@$-';3ic-]Af3RTuQ=DGJuHUZnL$DJX#Pt,h\*a_nm7b(8f7p/I/>-gXJUU3
T7]A`mZKD=P:Gk@;DZN1-&G0D=?Z1r;rI\!oJro@+$"i8oS?($U`1p$tl(Lb.%$01Wik,h9R#
`BNYXdC#1h"'kV31h[0Z<5+<o,[[f]A\f.N4lt6apAS/(GHEMJ!8<WMbod,OUN@ER4LUCK5>(
2J&E837d<aXJllOUr0]A>\?PV2ucL`/odoHgR1m%AhUHpQEmA-hSi]Ai4"@!mri7NX+ZY>WRRG
kB@knY<iG1V9ZG5Y,XpDY&,/0";r&mCCp+-I6DPEe+Hc,""hrZo3F`@oQ_?XRfN]A%08JZtD1
SW31UVI)BG2n.GPV&?SINRti_*`P4,AkM(aZX_*_-n@qpN3]A[S80d_03%mED7NC/E?6j"FmA
q(%;R'O&"N+&\E6br5n9nf3RoZ'?.`uCqbap7;"/&V9.R>K8W?;hqPq@X"e29]AmSl&kSP066
'H-dcDZiBb\CZ`ZLCA+u;+f<t&$DI"WN!(H]AmX-3?RW0cF<CU]A$^-5A5D^LbDbNp6d>+*uaJ
EtD;o7/-F0l]AIMD95:'BDNO\it8F@5$o^Q>`G,,[@8aS]A*j:V.-p.7@fnk/_fRZr?,ECYL-S
iMd*=U>LU]A=r=M;uTRrEh)P?6K*u!@00CsUdrj]A8E8(_;n?gIlCl1G1g:"'uKbZgX^=c/ZjY
NZ@Nq^LnBruopBi\:TC0mG\Lf,lZ94Sa6%^jm'WO!jAa4n8<F]A#,%[>$cU9nP@[$4O\5ZLbC
8,-rA\QCgerGEkXc(';fZO[!G,>D!(<%njc&C\JiG-S\nb8`;-uJq)&QLrROH;O/q^SB)a+K
s7bpOAm*]A$Qb=`f?%8h87)C\@)G9GqVV@4X#*^Mo=hSO&p%Nn<ORoYVQKI%Qa(:n.OhJR'<N
\7N5=`X6_s3;lT3N;N=gi@Ync(Ths+>=^mQ%I+--?-746.#[W0hAK#Q\MbN%F'AgT<?:!cn6
E%Zl2o)u--5f.N2t>!&1KPuOm@0Y680X+b(;\q730Si=gu\9,%")-!7p@2FZ*@!UXg2bdA-C
Zg9Z8+f\Lihu\RFQTL9$ts<tfdW898iqaB_7_YYmU*pLckKE^d:a";e\"VIj/R=$KOoP-?9=
q0\]A4GH.^=.]AY@h00)s.>`bl&O5DK%U&+XXll!l:Jq2OEV9+()aOp4]A12\(q\i;SZ]AQbDKc/
R^P<ZT)F-o`Ls87m&JB?1=M/prqLDhF=_`!gZf[8lg$&7a'<YE%OZS0ElCX-4kMsVOsKsU#/
_bT?49'dc3"9u]Adgf?/+e2]AZ'iU%bkRM1#OQEHkqcUK@[h"`qSH/Jbm[(rVI2f<FN2Yr)2>'
7IK<fQE]AJI@IR&C[?^-V&19:eVnjlp:`5Vc-C;b.`T+=-95VpnTM'5-%G'8%V%.-@Q;2cVV>
t;Rb6O1l-e)bm]Al\Rl`%9\LlK:"mD1<Y4J08Qt0Vn/d6`l]A(I4nUb1Q[%pN.A7\WVCQe%?JN
Aud*B_A5K1%N:d&u1#]As]A"Gm*+#@SB.58F;]AC?j\1RZ'>j*QHhJ7b3M>,_r&dZOYb#1hbU0Y
:-D07hb<P<ENVm1Kje6q,^K@;WFX"./,!EW"N5q:qtEQ#q='XAJ%KO,!G)VQaff,"Ah.bfqa
Xcae??`a=GotbQA#_&T\$?uLg>o56o8XHc87tWEUBRI,6EN-VL^P'.rRX$Ii^Vq/Ai#Y3Di1
,#$:cs#!S#^DecS>C@p5N(kc4J.[8NhK/Y4+FtlQ*nLiAj[gp<j#TnXQenV?mO-'W17F;&lJ
lJQ(]AWjgq=#!VKiF.*OI<4X?LkaStB-FJtX6S`(39N]Aj\$6"(&%cQ_m#R8G%e#?sA$3`U9>*
^l&M((@_QgVj_Lc_MZ#7'LY/4j234l6tUIt7G,W/`]AD"N9^\5Ku;r5n0r[;BJ#7f<+L.o="I
/5V8(C$)SDSp/?]Ao3F7joo)]Ae&%`7m0O%NgE;D@70nrm-$NC/6=6JUaQ1JV!OpWl9H$?=T;J
:'fgod)!MWd<qVb9U+G?tFBBq@Q<4Pp7co/Y/]AC[V<U\'G0)(MdKH:;4]AT.BuW:U<%60"3M2
,htmFbAd`S)gEk?U_3YU]AIR'aqU-]AKS?CT`#_3K60f\!I4/j8-H8;n_C#J2G.1"?*(&ho(#n
7<<PC.iEhkka*KjRfI0eN=@pI[ml11!0U58tLQ9[CPTc"6k:@7>WaWbYChX2dT^'meoRpH6,
_22/d?EfnGQhd5fD&kOAe<@qLB..RksmL:,b'3qbH8%\&2[NWb`AcEIR4A#qh5.dQh>=^Z_$
/_J<jid]AOT?\LdR^Igc/`7k&6!'0C.nk#%,`1/6r.Rth@"1;nLKAiuNZi;%=#5R<->Ml:`+3
Zk*%<m+d`4KTlcMuqah%G7G/q%o<)clNe`k2[4IRJZX:qn>C)*%WSRIuqe`2UtAG_C?1XMJA
DoN"EFV4!pnK`JLeApW.6TO+MTS:6e/1G+#)_uH!4\3FjQTO7.##pc&%7BG;4U'OH5kl2o`4
k"0";\B!JLi=ClW4?)Oj#3490(rkcH0=N\"IQ<cJt4+@F]A-1Ij5f_/h,r3?CG7i+$"HG/</4
srNH>YcNEQ(EY%"u;%&fA!Q!]AIJEVd/:*imMD_42fD<0$.[l*)\&2'[XW\,Cj-N-R&^46"Tf
Jo?Yc>O$bOH4R1-X9-[U.%<6ndCiX*pS%_feYhEMQ=,F6cAW'U9HmNu)geQTq"0`k$jd='Tn
%ZD;K7[Ekm!H(\qobW:8ES7hX;h%2FR5F!bO?#Z9S`QH!/Q39@hoP'4Or`[V^50P_o`.0p2V
Q?+DEg(TU%%'OJNh]A[d[gLR@&I#7ZI4Maap./DYrH>_[R5?[/i3_lgr#5FMC&2>S#ic4k9AZ
'pJff<+2s^MoL'^5WC-@GX%78"00/'`KV9_Rt625skjk$hLenYZ%aU]A8qYRBtqhE(+j#D@%j
X;Nq8'/p,"&o5JUD<7+g[IcB-]A9<eFQ7`iNL>QjWCJk/De&Fo1.WZ@'k3kM<8R_X5tZg;I6g
1)"FB`Z:9Q6ss5pFe]AmFaF-Z_rrg1gZ#u$SP(->Ch.l8/U@DJ^-c[cO,Ue1anSU9?P=q.D3/
-e.H8RUI%)16J9\^)Yr>#cH>DX:Q;?:Dj2dJ[:\LkU>b&KHDI.(c\I:b*b)L1PE-7>=5q\Ne
op4?*a,1%S4*irRcYMdTa'O!)U-\SU=\FbUgLfi2MkLGEXAbg#lbf(!Jf$A@'/us]AX7Y9<IP
_n'1f9;d*"@/L:(Dd%8_#>4/bA'KQm$H]AUI5CVR@,cIUU(\3M^(d`r_Q'B*/=*@)TQjpO;qV
E>5K:F)mOUa[_R&+9#_0giG\&0;r%!Ng7odAo5%=[klgp@XISC._kLk&f*Y!i(+WL&d_c`?Q
#0cDTA,[)1DFPCB?rS*V','Qt(o29Jc*D$B)Q`cO),3Y[r.%hl/#uZlXp">I+X&N]AT)J9jL7
(%lDr1+\oI:7BrQ*i;+?`l<L2"\U8`lAXHso<C"[^*d/5BH0@TOTj?sekD$<5F9>4>kb/Q`a
DoSEV5X@/D!Ds05eqacO<(XnT!LX+:;?@$oHFCn&,_pbfTB=&"[2h!b*NXT=0KlCm>CSM\Ml
A8LQeR+.,LnGdcVr(,gGcBNl<bg6%0Si]ACI.u+ao);W=mg5O)p,;gb-a8i^&g1g^Qd@$'pu>
u_[X?DjAKlos(LAgiP#q,\+RGV_l=PG?hUTA/<A`)as##1lknZ`B3u:+B[!_T[XQ+*XI>EQ%
PMM^67DQXZ*Yatp`P-4emqpY`X)_7.Z*;QEe+MUIcQ3*)=Wbn<'6nrSFZ$[SQK[jSF5M4jc%
W@hs)h^MhVsKbo-QX-HD1MV.38Z@2uS[]AVZ5g'q"@iT#G\7Mbp'Ab9<%HU?DM!%Rd&-UW&P,
4q)S!04gfhU7JQSg5D'R$'_"6.k5H@i2G^kC4(u('DGu,?(OjBF)lCi3;]A^'=i7TI7#eji>8
[6'Lq\oIlZIrjI#V(CN;,+Fa-usMhM."6<.r$03cd/1%:JGEq;g`p-0/mOpfE%<ci6H9j90d
^%lRrig]ABa=8&@c;7%+M-RD!PPJk<oS@-:@I&22L`#KHED9"tgJXEsDtL0Vq8O4j-U4>_Ptl
U7^J4j&:.BJ[f>uFZX+*(D,9AI#1R*ZRknUlu7kLWQ]AA?HBTjhChM%._(!9-9r$ebcSD(&R7
7Vh`a+Tl[CE[Rb>J$)EOCjn)u+R[_1;Vqb<q/VUX)o,I4=`c.pL^t6+hM0"Qc#O#3W,7F>Z/
\&,js#K>dgJ.R:2H:Z`/)PY]AX)n8\*^\LI9`1b+pXcea-K2h_YU7f?ITD-sU&2Tjs0R1D3>k
IY8eG'"[mg*C.L/]A@qu\M(Kui)`$a0[T"IP-9UjlO@a"GHcgZ$HEV(IQ$<b!Hc/.6Z8`.m.P
B44Sq1Rh.9!YI"lmMXP!0WPDZF$=@oE>e%PVX-Fh/;@jeNhnqC_E86AbX"\n:QJC0G>(h(:K
WO1H_@"nUm\Y+)U=[!F&Wkk,eHh*RW$n@,9cnMD;3Hp5.NX(DJ+cO>[Ig49GRr<+m^$>@(O8
^4~
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
