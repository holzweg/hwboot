{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Infobox - Full view *}



<div class="content">
    <div class="hero-unit">

        <div class="page-header">
            <h2>{attribute_view_gui attribute=$node.object.data_map.header}</h2>
        </div>
        
        <div class="thumbnail">
            {attribute_view_gui attribute=$node.object.data_map.image image_class='infoboximage'}
        </div>
        
        <div class="attribute-content">
            {attribute_view_gui attribute=$node.object.data_map.content}
        </div>
        
        <div class="attribute-link">
            {attribute_view_gui attribute=$node.object.data_map.url}
        </div>

    </div>
</div>

