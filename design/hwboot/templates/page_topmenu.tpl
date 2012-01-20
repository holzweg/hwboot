<div class="topbar">
    <div class="fill">
        <div class="container">
            {if eq(ezini( 'NavigationSettings', 'ShowTopMenuBrand', 'hwboot.ini' ), true)}
                <a class="brand" href={"/"|ezurl}>{ezini('SiteSettings','SiteName')|wash}</a>
            {/if}
    
        <ul class="nav" style="float:right">
            {include uri='design:page_header_languages.tpl'} 
            {include uri='design:page_header_links.tpl'}
        </ul>

        {include uri='design:page_header_logo.tpl'}


            {include uri='design:menu/widgets/searchbox.tpl'}
            {include uri=concat('design:menu/', $pagedata.top_menu, '.tpl')}
            
            
        </div>
    </div>
</div>
