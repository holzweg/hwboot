<div class="container">

    <div class="hero-unit">

    {def $number_of_items=10
         $browse_list_count=fetch( content, list_count, hash( parent_node_id, $node_id, depth, 1 ) )
         $node_array=fetch( content, list, hash( parent_node_id, $node_id, depth, 1, offset, $view_parameters.offset, limit, $number_of_items, sort_by, $main_node.sort_array ) )
         $select_name='SelectedObjectIDArray'
         $select_type='checkbox'
         $select_attribute='contentobject_id'}
    {if eq( $browse.return_type, 'NodeID' )}
        {set $select_name='SelectedNodeIDArray'}
        {set $select_attribute='node_id'}
    {/if}
    {if eq( $browse.selection, 'single' )}
        {set $select_type='radio'}
    {/if}

        <form class="form-stacked" name="browse" action={$browse.from_page|ezurl} method="post">

        {if $browse.description_template}
            {include name=Description uri=$browse.description_template browse=$browse main_node=$main_node}
        {else}

            <h2>{'Browse'|i18n( 'design/ezwebin/content/browse' )} - {$main_node.name|wash}</h2>


            <p>{'To select objects, choose the appropriate radiobutton or checkbox(es), and click the "Select" button.'|i18n( 'design/ezwebin/content/browse' )}</p>
            <p>{'To select an object that is a child of one of the displayed objects, click the parent object name to display a list of its children.'|i18n( 'design/ezwebin/content/browse' )}</p>
        {/if}

        {def $current_node=fetch( content, node, hash( node_id, $browse.start_node ) )}
        {if $browse.start_node|gt( 1 )}
            <h2>
            <a href={concat( '/content/browse/', $main_node.parent_node_id, '/' )|ezurl}><img src={'back-button-16x16.gif'|ezimage} alt="{'Back'|i18n( 'design/ezwebin/content/browse' )}" /></a>
            {$current_node.name|wash}&nbsp;[{$current_node.children_count}]</h2>
        {else}
            <h2><img src={'back-button-16x16.gif'|ezimage} alt="Back" />&nbsp;{'Top level'|i18n( 'design/ezwebin/content/browse' )}&nbsp;[{$current_node.children_count}]</h2>
        {/if}

        {include uri='design:content/browse_mode_list.tpl'}

        {include name=Navigator
                 uri='design:navigator/google.tpl'
                 page_uri=concat('/content/browse/',$main_node.node_id)
                 item_count=$browse_list_count
                 view_parameters=$view_parameters
                 item_limit=$number_of_items}


        {if $browse.persistent_data|count()}
        {foreach $browse.persistent_data as $key => $data_item}
            <input type="hidden" name="{$key|wash}" value="{$data_item|wash}" />
        {/foreach}
        {/if}

        <input type="hidden" name="BrowseActionName" value="{$browse.action_name}" />
        {if $browse.browse_custom_action}
        <input type="hidden" name="{$browse.browse_custom_action.name}" value="{$browse.browse_custom_action.value}" />
        {/if}

        <input class="btn" type="submit" name="SelectButton" value="{'Select'|i18n('design/ezwebin/content/browse')}" />


        {if $cancel_action}
        <input type="hidden" name="BrowseCancelURI" value="{$cancel_action}" />
        {/if}
         <input class="btn" type="submit" name="BrowseCancelButton" value="{'Cancel'|i18n( 'design/ezwebin/content/browse' )}" />
        </form>

    </div>

</div>