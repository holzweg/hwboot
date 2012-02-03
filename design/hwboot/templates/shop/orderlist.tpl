

<div class="hero-unit">

<form class="form-stacked" action={concat("/shop/orderlist")|ezurl} method="post" name="Orderlist">
<div class="page-header">
  <h2>{"Order list"|i18n("design/ezwebin/shop/orderlist")}</h2>
</div>
    
{'Sort result by'|i18n('design/ezwebin/shop/orderlist')}: <select name="SortField" >
     <option value="created" {switch match=$sort_field}{case match="created"} selected="selected"{/case}{case}{/case}{/switch}>{'Order time'|i18n('design/ezwebin/shop/orderlist')}</option>
     <option value="user_name" {switch match=$sort_field}{case match="user_name"} selected="selected"{/case}{case}{/case}{/switch}>{'User name'|i18n('design/ezwebin/shop/orderlist')}</option>
     <option value="order_nr" {switch match=$sort_field}{case match="order_nr"} selected="selected"{/case}{case}{/case}{/switch}>{'Order ID'|i18n('design/ezwebin/shop/orderlist')}</option>
</select>
<img src={"asc-transp.gif"|ezimage} alt="{'Ascending'|i18n('design/ezwebin/shop/orderlist')}" title="{'Sort ascending'|i18n('design/ezwebin/shop/orderlist')}" /><input type="radio" name="SortOrder" value="asc" {section show=eq($sort_order,"asc")}checked="checked"{/section} />
<img src={"desc-transp.gif"|ezimage} alt="{'Descending'|i18n('design/ezwebin/shop/orderlist')}" title="{'Sort descending'|i18n('design/ezwebin/shop/orderlist')}" /><input type="radio" name="SortOrder" value="desc" {section show=eq($sort_order,"desc")}checked="checked"{/section} />
{include uri="design:gui/button.tpl" class="btn" name=Sort id_name=SortButton value="Sort"|i18n("design/ezwebin/shop/orderlist")}
<br><br>
{section show=$order_list}
<table class="table table-striped table-bordered">
<tr>
    <th width="1">&nbsp;
    
    </th>
    <th>
    {"ID"|i18n("design/ezwebin/shop/orderlist")}
    </th>
    <th>
    {"Date"|i18n("design/ezwebin/shop/orderlist")}
    </th>
    <th>
    {"Customer"|i18n("design/ezwebin/shop/orderlist")}
    </th>
    <th>
    {"Total ex. VAT"|i18n("design/ezwebin/shop/orderlist")}
    </th>
    <th>
    {"Total inc. VAT"|i18n("design/ezwebin/shop/orderlist")}
    </th>
    <th>
    </th>
</tr>
{section name="Order" loop=$order_list sequence=array(bglight,bgdark)}
<tr class="{$Order:sequence}">
    <td>
    <input type="checkbox" name="OrderIDArray[]" value="{$Order:item.id}" />
    </td>
    <td>
    {$Order:item.order_nr}
    </td>
    <td>
    {$Order:item.created|l10n(shortdatetime)}
    </td>
    <td>
    <a href={concat("/shop/customerorderview/",$Order:item.user_id,"/",$Order:item.account_email)|ezurl}>{$Order:item.account_name}</a>
    </td>
    <td>
    {$Order:item.total_ex_vat|l10n(currency)}
    </td>
    <td>
    {$Order:item.total_inc_vat|l10n(currency)}
    </td>
    <td>
    <a href={concat("/shop/orderview/",$Order:item.id,"/")|ezurl}>[ view ]</a>
    </td>
</tr>
{/section}
</table>
{section-else}

<div class="feedback">
  <h2>{"The order list is empty"|i18n("design/ezwebin/shop/orderlist")}</h2>
</div>

{/section}

<div class="actions">
<input type="submit" class="btn" name="ArchiveButton" value="{'Archive'|i18n('design/ezwebin/shop/orderlist')}" />
</div>

{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri='/shop/orderlist'
         item_count=$order_list_count
         view_parameters=$view_parameters
         item_limit=$limit}
</form>

</div>
