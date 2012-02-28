{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<div class="content-view-embed">
    <div class="class-{$node.object.class_identifier}">
{if is_set( $node.url_alias )}
         <h2><a href="{$node.url_alias|ezurl('no')}" title="{$node.name|wash()}">{$node.name|wash()}</a></h2>
{else}
         <h2>{$node.name|wash()}</h2>
{/if}
    </div>
</div>
