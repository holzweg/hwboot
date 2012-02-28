{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{foreach $tag_cloud as $tag}
    <a href={concat( "/content/keyword/", $tag['tag']|rawurlencode )|ezurl()} style="font-size: {$tag['font_size']}%" title="{$tag['count']} objects tagged with '{$tag['tag']|wash()}'">{$tag['tag']|wash()}</a> 
{/foreach}
