{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{if is_unset( $disabled ) }
    {def $disabled=false()};
{/if}
{if $disabled}
<input class="btn disabled" disabled="disabled" type="submit" name="{$id_name}" value="{$value}" />
{else}
<input class="btn {$extra_btn_classes}" type="submit" name="{$id_name}" value="{$value}" />
{/if}
{undef $disabled}
