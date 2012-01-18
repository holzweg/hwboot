<div class="content-view-embed">
    {def $children = array()
         $limit = 3
         $offset = 0}

    {if is_set( $object_parameters.limit )}
        {set $limit = $object_parameters.limit}
    {/if}

    {if is_set( $object_parameters.offset )}
        {set $offset = $object_parameters.offset}
    {/if}

    {set $children=fetch( 'content', 'list', hash( 'parent_node_id', $object.main_node_id,
                                               'limit', $limit,
                                               'offset', $offset,
                                               'class_filter_type', 'exclude',
                                               'class_filter_array', ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' ),
                                               'sort_by', $object.main_node.sort_array ) ) }
    <h2>{$object.name|wash()}</h2>

    <ul class="media-grid">
        <li>
            <!-- Content: START -->
            {if is_set( $children.0 )}
                {node_view_gui view=horizontallylistedsubitems content_node=$children.0}
            {/if}
            <!-- Content: END -->
        </li>
        <li>
            <!-- Content: START -->
            {if is_set( $children.2 )}
                {node_view_gui view=horizontallylistedsubitems content_node=$children.2}
            {/if}
            <!-- Content: END -->
        </li>
        <li>
            <!-- Content: START -->
            {if is_set( $children.1 )}
                {node_view_gui view=horizontallylistedsubitems content_node=$children.1}
            {/if}
            <!-- Content: END -->
        </li>
    </ul>
</div>