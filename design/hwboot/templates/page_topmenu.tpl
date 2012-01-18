<div class="topbar">
    <div class="fill">
        <div class="container">
            {if eq(ezini( 'NavigationSettings', 'ShowTopMenuBrand', 'hwboot.ini' ), true)}
                <a class="brand" href={"/"|ezurl}>{ezini('SiteSettings','SiteName')|wash}</a>
            {/if}
            {include uri=concat('design:menu/', $pagedata.top_menu, '.tpl')}
            {include uri='design:menu/widgets/searchbox.tpl'}
        </div>
    </div>
</div>
