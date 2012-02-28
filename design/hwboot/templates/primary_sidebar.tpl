{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<div id="primary-sidebar">
	{if is_array( $pagedata.left_menu )}
	{foreach $pagedata.left_menu as $left_menu}
		{include uri=concat('design:menu/', $left_menu, '.tpl')}
		{delimiter}<div class="hr"></div>{/delimiter}
	{/foreach}
	{else}
	{include uri=concat('design:menu/', $pagedata.left_menu, '.tpl')}
	{/if}
</div>
