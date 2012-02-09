{* Documentation page - Full view *}

<div class="class-documentation-page hero-unit">

		<h2>{attribute_view_gui attribute=$node.object.data_map.title}</h2>

	{if eztoc( $node.object.data_map.body )}
	<div class="attribute-toc">
		<h2>{'Table of contents'|i18n( 'design/ezwebin/full/documentation_page' )}</h2>
		{eztoc( $node.object.data_map.body )}
	</div>
	{/if}

	<div class="attribute-body">
		{attribute_view_gui attribute=$node.object.data_map.body}
	</div>
	
	<div class="alert alert-info fade in">
		<a href="#" class="close" data-dismiss="alert">x</a>
		<p><span class="label label-info">{'Created'|i18n( 'design/ezwebin/full/documentation_page' )}</span> {$node.object.published|l10n(shortdatetime)}</p>
		<p><span class="label label-important">{'Modified'|i18n( 'design/ezwebin/full/documentation_page' )}</span> {$node.object.modified|l10n(shortdatetime)}</p>
	</div>

	{if $node.object.data_map.show_children.data_int}
		{def $page_limit=10
			 $children_count=fetch_alias( 'children_count', hash( parent_node_id, $node.node_id,
														 class_filter_type, exclude,
														 class_filter_array, ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' ) ) )}

			{if $children_count}
				{foreach fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
														'offset', $view_parameters.offset,
														'sort_by', $node.sort_array,
														'class_filter_type', exclude,
														'class_filter_array', ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' ),
														'limit', $page_limit ) ) as $child }
					{node_view_gui view='line' content_node=$child}
				{/foreach}
			{/if}

		{include name=navigator
				 uri='design:navigator/google.tpl'
				 page_uri=$node.url_alias
				 item_count=$children_count
				 view_parameters=$view_parameters
				 item_limit=$page_limit}

	{/if}
</div>
