{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<div class="well">
    {attribute_view_gui attribute=$node.data_map.image image_class=listitem href=$node.url_alias|ezurl() title=$node.name popover=$node.name link_title=$node.name popover=$node.name popover_content=$node.data_map.caption.content.input.input_xml}
</div>
