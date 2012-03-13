{* Link - Full view *}


<div class="content">
    <div class="class-link hero-unit">

    <div class="page-header">
        <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
    </div>
    {if $node.data_map.description.content.is_empty|not}
        <div class="attribute-long">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
    {/if}

    {if ne( $node.data_map.location.content, '' )}
        <div class="attribute-link">
            <p><a href="{$node.data_map.location.content}" target="_blank">{$node.data_map.location.data_text}</a></p>
        </div>
    {/if}

    </div>
</div>
