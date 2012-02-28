{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Folder - Embed *}

<div class="content-view-embed">
    <div class="class-folder">

    <h2><a href={$object.main_node.url_alias|ezurl}>{$object.name|wash()}</a></h2>

    <div class="attribute-short">
        {attribute_view_gui attribute=$object.main_node.object.data_map.short_description}
    </div>

    </div>
</div>
