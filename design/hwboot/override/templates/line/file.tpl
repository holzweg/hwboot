{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* File - Line view *}

<div class="content-view-line">
    <div class="class-file">
    <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>

    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.description}
    </div>

    <div class="attribute-file">
        <p>{attribute_view_gui attribute=$node.data_map.file icon_size='small' icon_title=$node.name icon='yes'}</p>
    </div>

    </div>
</div>
