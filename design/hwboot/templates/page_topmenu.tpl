{* top navigation *}
{if eq(ezini( 'NavigationSettings', 'ShowTopMenuNav', 'hwboot.ini' ), true)}

	<!-- Topbar
	================================================== -->
	<div class="topbar" data-scrollspy="scrollspy" >
		<div class="topbar-inner">
			<div class="container">
				{if eq(ezini( 'NavigationSettings', 'ShowTopMenuBrand', 'hwboot.ini' ), true)}
					<a class="brand" href={"/"|ezurl}>{ezini('SiteSettings','SiteName')|wash}</a>
				{/if}
				{include uri=concat('design:menu/', $pagedata.top_menu, '.tpl')}
			</div>
		</div>
	</div>

{/if}
{* /top navigation *}

{* ezwebin top utility bar *}
{if eq(ezini( 'NavigationSettings', 'ShowTopMenuUtilityBar', 'hwboot.ini' ), true)}

	<ul class="nav" style="float:right">
	{include uri='design:page_header_languages.tpl'} 
	{include uri='design:page_header_links.tpl'}
	</ul>

	{include uri='design:page_header_logo.tpl'}


	{include uri='design:menu/widgets/searchbox.tpl'}

{/if}
{* /ezwebin top utility bar *}

{* considered part of the ezwebin top utility bar *}
{if eq(ezini( 'NavigationSettings', 'ShowTopMenuUtilityBar', 'hwboot.ini' ), true)}
	{if $pagedata.show_path}
		{include uri='design:page_toppath.tpl'}
	{/if}

	{if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
		{include uri='design:page_toolbar.tpl'}
	{/if}
{/if}
{* /considered part of the ezwebin top utility bar *}
