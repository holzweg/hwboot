{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{set $classification = cond( and(is_set( $align ), $align ), concat( $classification, ' object-', $align ), $classification )}
<table class="{$classification|wash}"{if ne($border|trim,'')} border="{$border}"{/if} cellpadding="{first_set($cellpadding, '2')}" cellspacing="0"{if ne($width|trim,'')} width="{$width}"{/if}{if and(is_set( $summary ), $summary)} summary="{$summary|wash}"{/if}{if and(is_set( $title ), $title)} title="{$title|wash}"{/if}>
{if and(is_set( $caption ), $caption)}<caption>{$caption|wash}</caption>{/if}
{section loop=$col_count|inc sequence=array('bglight','bgdark')}
<col class="{$sequence}" />
{/section}
{$rows}
</table>
