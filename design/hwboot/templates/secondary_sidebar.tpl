{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<div id="secondary-sidebar" class="well">
	{if is_array( $pagedata.extra_menu )}
		{foreach $pagedata.extra_menu as $extra_menu}
			{include uri=concat('design:parts/', $extra_menu, '.tpl')}
			{delimiter}<div class="hr"></div>{/delimiter}
		{/foreach}
	{else}
		{include uri=concat('design:parts/', $pagedata.extra_menu, '.tpl')}
	{/if}
</div>
