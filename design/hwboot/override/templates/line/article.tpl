{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Article - Line view *}
<div class="well">

<h2><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>

{section show=$node.data_map.image.has_content}
	<div class="attribute-image">
		{attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.image}
	</div>
{/section}

{section show=$node.data_map.intro.content.is_empty|not}
<div class="attribute-short">
	{attribute_view_gui attribute=$node.data_map.intro}
</div>
{/section}

</div>
