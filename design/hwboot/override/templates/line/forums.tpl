{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Forums - Line view *}

<div class="content-view-line">
    <div class="class-forums">

        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>

       {section show=$node.data_map.description.content.is_empty|not}
        <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.description}
        </div>
       {/section}

    </div>
</div>
