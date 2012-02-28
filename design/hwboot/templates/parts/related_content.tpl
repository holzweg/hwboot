{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{def $related_content = $node.data_map.tags.content.related_objects}

{if $related_content}
    {include uri='design:parts/display_related_content.tpl'}
{/if}

{undef $related_content}
