<div class="content-view-horizontallylistedsubitems">
    <div class="content-image">
    {attribute_view_gui attribute=$node.data_map.image image_class=listitem href=$node.url_alias|ezurl() title=$node.name popover=$node.name link_title=$node.name popover=$node.name popover_content=$node.data_map.caption.content.input.input_xml}
    </div>
    <div class="caption">
        <a href="{$node.url_alias|ezurl(no)}">{$node.name}</a>
    </div>
</div>