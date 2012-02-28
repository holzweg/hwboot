{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Image - Full view *}

{def $parent        = $node.parent
     $previous_item = false()
     $next_item     = false()}

    {if is_unset( $versionview_mode )}
        {* Generate next and previous links if parent is gallery *}
        {if $parent.class_identifier|eq( 'gallery' )}
             {* Limit fetch to 10000 items to avoid very large memory use.
                If you need larger galleries then that, consider using a index in url, downside
                is that it will break bookmarks / links if somone changes sorting.
             *}
             {def $siblings = fetch( 'content', 'list', hash( 'parent_node_id',    $parent.node_id,
                                                              'as_object',         false(),
                                                              'class_filter_type', 'include',
                                                              'class_filter_array', array( 'image', 'flash_player' ),
                                                              'sort_by',            $parent.sort_array,
                                                              'limit',              10000 ) )
                  $index    = 0
                  $node_id  = $node.node_id}
             {while is_set( $siblings[$index] )}
                 {if $siblings[$index]['node_id']|eq( $node_id )}
                     {if $index}
                         {set $previous_item = fetch( 'content', 'node', hash( 'node_id', $siblings[$index|dec]['node_id'] ))}
                     {/if}
                     {if is_set( $siblings[$index|inc] )}
                         {set $next_item = fetch( 'content', 'node', hash( 'node_id', $siblings[$index|inc]['node_id'] ))}
                     {/if}
                     {break}
                 {/if}
                 {set $index = $index|inc}
             {/while}
             {undef $siblings $index $node_id}
        {/if}
		{* Bootstrap pagination *}
		<ul class="pager">
			{if $previous_item}
				<li class="previous">
						<a href={$previous_item.url_alias|ezurl} title="{$previous_item.name|wash}">&larr;&nbsp;{'Previous image'|i18n( 'design/ezwebin/full/image' )}</a>
				</li>
			{/if}
			<li>
				<a href={$parent.url_alias|ezurl}>{$parent.name|wash}</a>
			</li>

			{if $next_item}
				<li class="next">
					<a href={$next_item.url_alias|ezurl} title="{$next_item.name|wash}">{'Next image'|i18n( 'design/ezwebin/full/image' )}&nbsp;&rarr;</a>
				</li>
			{/if}
		</ul>
    {/if}

	   <a href="#" class="thumbnail" rel="popover" title="{$node.name|wash()}" data-placement="bottom">{attribute_view_gui attribute=$node.data_map.image image_class=imagelarge}</a>

            {attribute_view_gui attribute=$node.data_map.caption}

        {include uri='design:parts/image/related_content.tpl'}
