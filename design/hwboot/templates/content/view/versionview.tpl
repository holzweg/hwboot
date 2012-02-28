{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}


{include uri='design:parts/website_toolbar_versionview.tpl'}

{node_view_gui view=full with_children=false() versionview_mode=true() is_editable=false() is_standalone=false() content_object=$object node_name=$object.name content_node=$node node=$node}
