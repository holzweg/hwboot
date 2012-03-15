<ul class="nav">
    {def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )
         $top_menu_class_filter = ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )}
    {def $fetch_parameters = hash( 'parent_node_id', $root_node.node_id,
                                       'sort_by', $root_node.sort_array,
                                       'class_filter_type', 'include',
                                       'attribute_filter', array( array( 'priority', '<', 1000 )),
                                       'class_filter_array', $top_menu_class_filter )}
    {def $top_menu_items = fetch( 'content', 'list', $fetch_parameters )
         $top_menu_items_count = $top_menu_items|count()
         $item_class = array()
         $item2_class = array()
         $level_2_items = 0
         $current_node_in_path = first_set($pagedata.path_array[1].node_id, 0  )
         $current_node_in_path_2 = first_set($pagedata.path_array[2].node_id, 0  )}

    {if $top_menu_items_count}
       {foreach $top_menu_items as $key => $item}
            {set $item_class = array()
                 $level_2_items = array()}
            {if $current_node_in_path|eq($item.node_id)}
                {set $item_class = array("selected")}
            {/if}
                {set $level_2_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
                                                                      'sort_by', $item.sort_array,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array', $top_menu_class_filter ) )}
            {if $key|eq(0)}
                {set $item_class = $item_class|append("firstli")}
            {/if}
            {if $top_menu_items_count|eq( $key|inc )}
                {set $item_class = $item_class|append("lastli")}
            {/if}
            {if and( is_set( $module_result.content_info), array( $current_node_id, $module_result.content_info.parent_node_id )|contains( $item.node_id ))}
                {set $item_class = $item_class|append("active")}
            {/if}
            {if $level_2_items|count()}
                {set $item_class = $item_class|append("dropdown")}
            {/if}
            {set $item_class = $item_class|append(
                concat( 'section-',
                        fetch( 'section', 'object', hash( 'section_id', $item.object.section_id ) ).identifier ))}

            {if eq( $item.class_identifier, 'link')}
                <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}>
                    <a {if eq( $ui_context, 'browse' )}href={concat("content/browse/", $item.node_id)|ezurl}{else}href={$item.data_map.location.content|ezurl}{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank"{/if}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item.data_map.location.data_text|wash}" class="menu-item-link" rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}
                    <b class="caret"></b></a>
            {else}
                <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}>
                    <a {if $level_2_items|count()}class="dropdown-toggle" data-toggle="dropdown"{/if}href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}"#node_id_{$item.node_id}"{/if}{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}
                    <b class="caret"></b></a>
            {/if}
                {if $level_2_items|count()}
                <ul class="dropdown-menu">
                {foreach $level_2_items as $key => $item2}
                    {set $item2_class = array()}
                    {if $current_node_in_path_2|eq($item2.node_id)}
                        {set $item2_class = array("selected")}
                    {/if}
                    {if $key|eq(0)}
                        {set $item2_class = $item2_class|append("firstli")}
                    {/if}
                    {if $top_menu_items_count|eq( $key|inc )}
                        {set $item2_class = $item2_class|append("lastli")}
                    {/if}
                    {if $item2.node_id|eq( $current_node_id )}
                        {set $item2_class = $item2_class|append("active")}
                    {/if}

                    {if eq( $item2.class_identifier, 'link')}
                        <li id="node_id_{$item2.node_id}"{if $item2_class} class="{$item2_class|implode(" ")}"{/if}>
                            <a {if eq( $ui_context, 'browse' )}href={concat("content/browse/", $item2.node_id)|ezurl}{else}href={$item2.data_map.location.content|ezurl}{if and( is_set( $item2.data_map.open_in_new_window ), $item2.data_map.open_in_new_window.data_int )} target="_blank"{/if}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item2.data_map.location.data_text|wash}" class="menu-item-link" rel={$item2.url_alias|ezurl}>{if $item2.data_map.location.data_text}{$item2.data_map.location.data_text|wash()}{else}{$item2.name|wash()}{/if}</a>
                        </li>
                    {else}
                        <li id="node_id_{$item2.node_id}"{if $item2_class} class="{$item2_class|implode(" ")}"{/if}>
                            <a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item2.node_id)|ezurl}{else}{$item2.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}>{$item2.name|wash()}</a>
                        </li>
                    {/if}
                {/foreach}
                    {*if $level_2_items|count()|gt(1)}
                        <li class="divider"></li>
                        <li{if $current_node_id|eq($item.node_id)} class="active"{/if}><a href={$item.url_alias|ezurl}>{"View all"|i18n("design/topbar")}</a></li>
                    {/if*}
                </ul>
                {/if}
                </li>
        {/foreach}
    {/if}
</ul>

{undef $level_2_items $root_node $top_menu_items $item_class $top_menu_items_count $current_node_in_path $current_node_in_path_2}
<!-- Top menu content: END -->

{literal}
  <script type="text/javascript">
    $(document).ready( function() {
      $('.dropdown-toggle').dropdown();
    } );
  </script>
{/literal}