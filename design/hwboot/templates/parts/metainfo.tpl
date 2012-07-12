<ul class="breadcrumb">
    {if $node.data_map.author.content.is_empty|not()}
        <li>
            {attribute_view_gui attribute=$node.data_map.author}
        </li>
    {/if}
    <li class="pull-right">{$node.object.published|l10n(shortdatetime)}</li>
</ul>