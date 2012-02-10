{* Blog - Line view *}
<div class="class-blog">

    <h2><a href={$node.url_alias|ezurl} title="{$node.name|wash}">{$node.name|wash}</a></h2>

    <div class="attribute-description">
        {attribute_view_gui attribute=$node.data_map.description}
    </div>

</div>
