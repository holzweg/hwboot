{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Product - List embed view *}
{if $object.data_map.image.content}
<div class="attribute-image">
	{attribute_view_gui image_class=listitem attribute=$object.data_map.image href=$object.main_node.url_alias|ezurl}
</div>
{else}
<div class="attribute-short">
	{attribute_view_gui attribute=$object.data_map.short_description}
</div>
{/if}


<p><a href={$object.main_node.url_alias|ezurl}>{$object.name|wash}</a></p>

<div class="attribute-price">
	{attribute_view_gui attribute=$object.data_map.price}
</div>

