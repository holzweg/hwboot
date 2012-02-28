{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{set $classification = cond( and(is_set( $align ), $align ), concat( $classification, ' text-', $align ), $classification )}
<td{if $classification} class="{$classification|wash}"{/if}{if $colspan} colspan="{$colspan}"{/if}{if $rowspan} rowspan="{$rowspan}"{/if}{if $width} width="{$width}"{/if}{if and(is_set( $scope ), $scope)} scope="{$scope|wash}"{/if}{if and(is_set( $abbr ), $abbr)} abbr="{$abbr|wash}"{/if} valign="{first_set( $valign, 'top')}">
{switch name=Sw match=$content}
  {case match="<p></p>"}
  &nbsp;
  {/case}
  {case match=""}
  &nbsp;
  {/case}
  {case}
  {$content}
  {/case}
{/switch}
</td>
