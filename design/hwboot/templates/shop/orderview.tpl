
<div class="hero-unit">

<div class="page-header">
  <h2>{'Order %order_id [%order_status]'|i18n( 'design/ezwebin/shop/orderview',,
       hash( '%order_id', $order.order_nr,
             '%order_status', $order.status_name ) )}
  </h2>
</div>

{shop_account_view_gui view=html order=$order}

{def $currency = fetch( 'shop', 'currency', hash( 'code', $order.productcollection.currency_code ) )
         $locale = false()
         $symbol = false()}

{if $currency}
    {set locale = $currency.locale
         symbol = $currency.symbol}
{/if}

<br />

<h3>{'Product items'|i18n( 'design/ezwebin/shop/orderview' )}</h3>
<table class="table table-striped table-bordered">
<tr>
    <th>
    {'Product'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
    <th>
    {'Count'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
    <th>
    {'VAT'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
    <th>
    {'Price inc. VAT'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
    <th>
    {'Discount'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
    <th>
    {'Total price ex. VAT'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
    <th>
    {'Total price inc. VAT'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
</tr>
{if $order.product_items|count()}
{foreach $order.product_items as $product_item sequence array( 'bglight', 'bgdark' ) as $style}
<tr class="{$style}">
    <td>
    <a href={concat( "/content/view/full/", $product_item.node_id )|ezurl}>{$product_item.object_name}</a>
    </td>
    <td>
    {$product_item.item_count}
    </td>
    <td>
    {$product_item.vat_value} %
    </td>
    <td>
    {$product_item.price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    <td>
    {$product_item.discount_percent}%
    </td>
    <td>
    {$product_item.total_price_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    <td>
    {$product_item.total_price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
{/foreach}
{/if}
</table>

<h3>{'Order summary'|i18n( 'design/ezwebin/shop/orderview' )}:</h3>
<table class="table table-striped table-bordered">
<tr>
    <th>
    {'Summary'|i18n( 'design/ezwebin/shop/orderview' )}:
    </th>
    <th>
    {'Total price ex. VAT'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
    <th>
    {'Total price inc. VAT'|i18n( 'design/ezwebin/shop/orderview' )}
    </th>
</tr>
<tr class="bglight">
    <td>
    {'Subtotal of items'|i18n( 'design/ezwebin/shop/orderview' )}:
    </td>
    <td>
    {$order.product_total_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    <td>
    {$order.product_total_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
{if $order.order_items|count()}
{foreach $order.order_items as $order_item sequence array( 'bglight', 'bgdark' ) as $style}
<tr class="{$style}">
    <td>
    {$order_item.description}:
    </td>
    <td>
    {$order_item.price_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    <td>
    {$order_item.price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
{/foreach}
{/if}
<tr class="bgdark">
    <td>
        {'Order total'|i18n( 'design/ezwebin/shop/orderview' )}
    </td>
    <td>
        {$order.total_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    <td>
        {$order.total_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
</table>


<h3>{'Order history'|i18n( 'design/ezwebin/shop/orderview' )}:</h3>
<table class="table table-striped table-bordered">
<tr>
    <th>{'Date'|i18n( 'design/ezwebin/shop/orderview' )}</th>
    <th>{'Order status'|i18n( 'design/ezwebin/shop/orderview' )}</th>
</tr>
{def $order_status_history=fetch( 'shop', 'order_status_history', hash( 'order_id', $order.order_nr ) )}
{if $order_status_history|count()}
{foreach $order_status_history as $history sequence array( 'bglight', 'bgdark' ) as $style}
<tr class="{$style} ">
    <td class="date">{$history.modified|l10n( 'shortdatetime' )}</td>
    <td>{$history.status_name|wash}</td>
</tr>
{/foreach}
{/if}
</table>

</div>
