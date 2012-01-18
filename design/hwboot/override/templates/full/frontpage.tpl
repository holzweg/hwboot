{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false(),
                                           'show_path', false())}

{def $frontpagestyle='noleftcolumn norightcolumn'}

{if $node.object.data_map.left_column.has_content}
    {set $frontpagestyle='leftcolumn norightcolumn'}
{/if}

{if eq( $frontpagestyle, 'leftcolumn norightcolumn')}
    {if $node.object.data_map.right_column.has_content}
        {set $frontpagestyle='leftcolumn rightcolumn'}
    {/if}
{else}
    {if $node.object.data_map.right_column.has_content}
        {set $frontpagestyle='noleftcolumn rightcolumn'}
    {/if}
{/if}

<div class="content-view-full">
    <div class="class-frontpage {$frontpagestyle}">

    {if $node.object.data_map.billboard.has_content}
        <div class="attribute-billboard">
            {content_view_gui view=billboard content_object=$node.object.data_map.billboard.content}
        </div>
    {/if}

    <div class="row">
        <div class="left-column span4">
            <!-- Content: START -->
            {attribute_view_gui attribute=$node.object.data_map.left_column}
            <!-- Content: END -->
        </div>
        <div class="center-column span12">
            <!-- Content: START -->
            {attribute_view_gui attribute=$node.object.data_map.center_column}
            <!-- Content: END -->
        </div>
        <div class="right-column span4">
            <!-- Content: START -->
                  {attribute_view_gui attribute=$node.object.data_map.right_column}
            <!-- Content: END -->
        </div>
    </div>

    <div class="attribute-bottom-column">
        {attribute_view_gui attribute=$node.object.data_map.bottom_column}
    </div>

    </div>
</div>