{if and( is_set( $DesignKeys:used.url_alias ), $DesignKeys:used.url_alias|count|ge(1) )}
    {def $avail_translation = language_switcher( $DesignKeys:used.url_alias )}
{else}
    {def $avail_translation = language_switcher( $site.uri.original_uri)}
{/if}

<div class="btn-group">
{def $locale = "" }
{def $directory = "" }
{foreach $avail_translation as $siteaccess => $lang}
    <a class="btn btn-small{if $siteaccess|eq($access_type.sub)} btn-primary{/if}" href={$lang.url|ezurl}><i class="icon-language" style="background-image: url({concat('share/icons/flags/', $lang.locale, '.gif')|ezroot(no)});"></i>{$lang.text|wash}</a>
{/foreach}
</div>
