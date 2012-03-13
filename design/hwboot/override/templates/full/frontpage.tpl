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


    {if $node.object.data_map.billboard.has_content}
        <div class="attribute-billboard">
            {content_view_gui view=billboard content_object=$node.object.data_map.billboard.content}
        </div>
    {/if}

	{* @todo make columns configurable! *}
	{* calculate span widths *}
	{def $span_left  = 3
		 $span_main  = 9
		 $span_right = 3}
	{if and($node.object.data_map.left_column.content.is_empty, $node.object.data_map.right_column.content.is_empty)}
		{set $span_main = 12}
	{/if}
	{if and($node.object.data_map.left_column.content.is_empty|not, $node.object.data_map.right_column.content.is_empty|not)}
		{set $span_main = 6}
	{/if}

	<div class="row">
	{if $node.object.data_map.left_column.content.is_empty|not}
        <div id="primary-sidebar" class="span{$span_left}">
            <!-- Content: START -->
			<div class="well">
				{attribute_view_gui attribute=$node.object.data_map.left_column}
			</div>
            <!-- Content: END -->
        </div>
	{/if}
		<div class="span{$span_main}">
            <!-- Content: START -->
            {attribute_view_gui attribute=$node.object.data_map.center_column}
            <!-- Content: END -->
		</div>
	{if $node.object.data_map.right_column.content.is_empty|not}
        <div id="secondary-sidebar" class="span{$span_right}">
            <!-- Content: START -->
			<div class="well">
                  {attribute_view_gui attribute=$node.object.data_map.right_column}
			</div>
            <!-- Content: END -->
        </div>
	{/if}
	</div>

    <div class="attribute-bottom-column">
        {attribute_view_gui attribute=$node.object.data_map.bottom_column}
    </div>
