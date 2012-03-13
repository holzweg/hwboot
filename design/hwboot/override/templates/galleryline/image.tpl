{if and( is_set( $carousel_mode ), $carousel_mode )}

{* Image - Gallery line carousel view *}
	{attribute_view_gui attribute=$node.data_map.image image_class=gallerythumbnail popover=true()
						   href=$node.url_alias|ezurl
						   title=$node.name|wash
						   alt_text=$node.name|wash}

{else}

{* Image - Gallery line view *}
<div class="thumbnail">
	{attribute_view_gui attribute=$node.data_map.image image_class=gallerythumbnail popover=true()
						   href=$node.url_alias|ezurl
						   title=$node.name|wash
						   alt_text=$node.name|wash}

	<h5>{$node.name|shorten(14)|wash}</h5>
</div>

{/if}

{* <div class="attribute-image"{if is_set($#image_style)} style="{$#image_style}"{/if}> *}
	{* <p>{attribute_view_gui attribute=$node.data_map.image image_class=gallerythumbnail *}
						   {* href=$node.url_alias|ezurl}</p> *}
{* </div> *}

{* <div class="attribute-name"{if is_set($#image_style)} style="{$#image_style|explode(';').0}"{/if}> *}
	{* <p>{$node.name|shorten(14)|wash}</p> *}
{* </div> *}
