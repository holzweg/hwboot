{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Event Calendar - Full view *}
{set-block scope=root variable=cache_ttl}400{/set-block}

{include uri=concat("design:full/event_view_", $node.data_map.view.class_content.options[$node.data_map.view.value[0]].name|downcase(), ".tpl") }
