{* Image - Full view *}

{def $parent        = $node.parent
     $previous_item = false()
     $next_item     = false()}

<div class="hero-unit">


            <h2>{$node.name|wash()}</h2>


    {if is_unset( $versionview_mode )}
        {* Generate next and previous links if parent is gallery *}
        {if $parent.class_identifier|eq( 'gallery' )}
             {* Limit fetch to 10000 items to avoid very large memory use.
                If you need larger galleries then that, consider using a index in url, downside
                is that it will break bookmarks / links if somone changes sorting.
             *}
             {def $siblings = fetch( 'content', 'list', hash( 'parent_node_id',    $parent.node_id,
                                                              'as_object',         false(),
                                                              'class_filter_type', 'include',
                                                              'class_filter_array', array( 'image', 'flash_player' ),
                                                              'sort_by',            $parent.sort_array,
                                                              'limit',              10000 ) )
                  $index    = 0
                  $node_id  = $node.node_id}
             {while is_set( $siblings[$index] )}
                 {if $siblings[$index]['node_id']|eq( $node_id )}
                     {if $index}
                         {set $previous_item = fetch( 'content', 'node', hash( 'node_id', $siblings[$index|dec]['node_id'] ))}
                     {/if}
                     {if is_set( $siblings[$index|inc] )}
                         {set $next_item = fetch( 'content', 'node', hash( 'node_id', $siblings[$index|inc]['node_id'] ))}
                     {/if}
                     {break}
                 {/if}
                 {set $index = $index|inc}
             {/while}
             {undef $siblings $index $node_id}
        {/if}
        <div class="clearfix">
            {if $previous_item}
               
                    &laquo;&nbsp;<a href={$previous_item.url_alias|ezurl} title="{$previous_item.name|wash}">{'Previous image'|i18n( 'design/ezwebin/full/image' )}</a>
               
                |
            {else}
              
                    &laquo;&nbsp;{'Previous image'|i18n( 'design/ezwebin/full/image' )}
                
                |
            {/if}

            <a href={$parent.url_alias|ezurl}>{$parent.name|wash}</a>

            {if $next_item}
                |
      
                    <a href={$next_item.url_alias|ezurl} title="{$next_item.name|wash}">{'Next image'|i18n( 'design/ezwebin/full/image' )}</a>&nbsp;&raquo;
               
            {else}
           |
               
                    {'Next image'|i18n( 'design/ezwebin/full/image' )}&nbsp;&raquo;
               
            {/if}
        </div>
    {/if}

        <div class="media-grid">
           <a href="#"> <p>{attribute_view_gui attribute=$node.data_map.image image_class=imagelarge}</p></a>
        </div>

        <div class="clearfix">
            {attribute_view_gui attribute=$node.data_map.caption}
        </div>

        {include uri='design:parts/image/related_content.tpl'}




</div>
