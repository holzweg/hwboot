<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            {if eq(ezini( 'NavigationSettings', 'ShowTopMenuBrand', 'hwboot.ini' ), true)}
                <a class="brand" href={"/"|ezurl}>{ezini('SiteSettings','SiteName')|wash}</a>
            {/if}
            <div class="nav-collapse collapse" style="height: 0px;">
                {include uri=concat('design:menu/', $pagedata.top_menu, '.tpl')}
                {include uri='design:menu/widgets/searchbox.tpl'}
            </div>
        </div>
    </div>
</div>