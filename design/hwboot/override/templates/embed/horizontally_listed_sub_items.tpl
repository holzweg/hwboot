<div class="content">
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

        {def $i=0}

<ul class="thumbnails">
            {foreach $children as $child}
            {if eq($i, 3)} {break} {/if}

               <li class="span3">     
                    {node_view_gui view=horizontallylistedsubitems content_node=$child}
                 </li>  
                    
            {set $i=inc( $i )}
            {/foreach}

</ul>

</div>
