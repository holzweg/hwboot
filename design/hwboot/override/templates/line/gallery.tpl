{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Gallery - Line view *}

<div class="content-view-line">
    <div class="class-gallery">

        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>

    {section show=$node.data_map.image.content}
        <div class="attribute-image">
            {attribute_view_gui image_class=small attribute=$node.data_map.image.content.data_map.image href=$node.url_alias|ezurl}
        </div>
    {/section}

        <div class="attribute-short">
           {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
    </div>
</div>
