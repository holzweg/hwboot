{* Folder - Full view *}
{def $rss_export = fetch( 'rss', 'export_by_node', hash( 'node_id', $node.node_id ) )}


<div class="hero-unit">

<div class="page-header">
    <h2>{attribute_view_gui attribute=$node.data_map.name}</h2>
</div>
    {if $rss_export}
    <div class="attribute-rss-icon">
        <a href="{concat( '/rss/feed/', $rss_export.access_url )|ezurl( 'no' )}" title="{$rss_export.title|wash()}"><img src="{'rss-icon.gif'|ezimage( 'no' )}" alt="{$rss_export.title|wash()}" /></a>
    </div>
    {/if}



    {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
    {if $node.object.data_map.short_description.has_content}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.short_description}
    </div>
    {/if}
    {/if}

    {if $node.object.data_map.description.has_content}
    <div class="attribute-long">
        {attribute_view_gui attribute=$node.data_map.description}
    </div>
    {/if}

    {if $node.object.data_map.show_children.data_int}
    {def $page_limit = 10
    $classes = ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' )
    $children = array()
    $children_count = ''}

    {if le( $node.depth, '3')}
    {set $classes = $classes|merge( ezini( 'ChildrenNodeList', 'ExcludedClasses', 'content.ini' ) )}
    {/if}

    {set $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
    'class_filter_type', 'exclude',
    'class_filter_array', $classes ) )}

    <div class="content-view-children">
        {if $children_count}
        {foreach fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
        'offset', $view_parameters.offset,
        'sort_by', array( 'priority', true ),
        'class_filter_type', 'exclude',
        'class_filter_array', array(),
        'limit', $page_limit ) ) as $child }
        {node_view_gui view='line' content_node=$child large_green_buttons=true()}
        {/foreach}
        {/if}
    </div>

    {include name=navigator
    uri='design:navigator/google.tpl'
    page_uri=$node.url_alias
    item_count=$children_count
    view_parameters=$view_parameters
    item_limit=$page_limit}

    {/if}
</div>
