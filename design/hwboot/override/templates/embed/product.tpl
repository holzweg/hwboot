{* Product - List embed view *}

<div class="content-view-embed">
    <div class="class-product">

<div class="border-box productbox-header">

    {if $object.data_map.image.content}
    <div class="attribute-image">
        {attribute_view_gui image_class=listitem attribute=$object.data_map.image href=$object.main_node.url_alias|ezurl}
    </div>
    {else}
    <div class="attribute-short">
        {attribute_view_gui attribute=$object.data_map.short_description}
    </div>
    {/if}

</div>
<div class="border-box productbox">

    <p><a href={$object.main_node.url_alias|ezurl}>{$object.name|wash}</a></p>

    <div class="attribute-price">
        {attribute_view_gui attribute=$object.data_map.price}
    </div>

</div>

    </div>
</div>