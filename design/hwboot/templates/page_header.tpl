{include uri='design:page_header_logo.tpl'}

{* Website Toolbar just above meta nav, if using a double top menu (since it would interfere with navigation level 2 if placed below the top menu.) *}
{if and( $pagedata.website_toolbar, $pagedata.is_edit|not, eq($pagedata.top_menu, 'double_top') )}
        {include uri='design:page_toolbar.tpl'}
        {set $top_padding = sum( $top_padding, $toolbar_height )}	
{/if}

<div id="metanav" class="alert well">
	<div class="container">
		<ul>
			{include uri='design:page_header_languages.tpl'}
		</ul>
		<ul>
			{include uri='design:page_header_links.tpl'}
		</ul>
	</div>
</div>
