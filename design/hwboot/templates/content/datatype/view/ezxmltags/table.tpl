{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{set $classification = cond( and(is_set( $align ), $align ), concat( $classification, ' object-', $align ), $classification )}
<table{if $classification} class="table table-striped table-bordered"{else} class="table table-bordered"{/if} {if and(is_set( $summary ), $summary)} summary="{$summary|wash}"{/if}{if and(is_set( $title ), $title)} title="{$title|wash}"{/if}>
{if and(is_set( $caption ), $caption)}<caption>{$caption|wash}</caption>{/if}
{$rows}
</table>
