<ul class="breadcrumb">
    {foreach $pagedata.path_array as $path}
        {if $path.url}
            <li><a href={cond( is_set( $path.url_alias ), $path.url_alias, $path.url )|ezurl}>{$path.text|wash}</a>{delimiter}<span>/</span>{/delimiter}</li>
        {else}
            <li class="active">{$path.text|wash}{delimiter}<span>/</span>{/delimiter}</li>
        {/if}
    {/foreach}
</ul>