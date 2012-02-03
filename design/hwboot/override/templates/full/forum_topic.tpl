{let page_limit=20
     reply_limit=cond( $view_parameters.offset|gt( 0 ), 20,
                       19 )
     reply_offset=cond( $view_parameters.offset|gt( 0 ), sub( $view_parameters.offset, 1 ),
                        $view_parameters.offset )
     reply_count=fetch('content','list_count', hash( parent_node_id, $node.node_id ) )
     previous_topic=fetch_alias( subtree, hash( parent_node_id, $node.parent_node_id,
                                                class_filter_type, include,
                                                class_filter_array, array( 'forum_topic' ),
                                                limit, 1,
                                                attribute_filter, array( and, array( 'modified_subnode', '<', $node.modified_subnode ) ),
                                                'sort_by', array( array( 'modified_subnode', false() ), array( 'node_id', false() ) ) ) )
     next_topic=fetch_alias( subtree, hash( parent_node_id, $node.parent_node_id,
                                            class_filter_type, include,
                                            class_filter_array, array( 'forum_topic' ),
                                            limit, 1,
                                            attribute_filter, array( and, array( 'modified_subnode', '>', $node.modified_subnode ) ),
                                            'sort_by', array( array( 'modified_subnode', true() ), array( 'node_id', true() ) ) ) ) }



<div class="content">
    <div class="hero-unit">

        <div class="page-header">
            <h2>{$node.name|wash}</h2>
        </div>
        
        {section show=is_unset( $versionview_mode )}
        <div class="content-navigator">
            {section show=$previous_topic}
               
                    &laquo;&nbsp;<a href={$previous_topic[0].url_alias|ezurl} title="{$previous_topic[0].name|wash}">{'Previous topic'|i18n( 'design/ezwebin/full/forum_topic' )}</a>
               
            {section-else}
              
                   &laquo;&nbsp;{'Previous topic'|i18n( 'design/ezwebin/full/forum_topic' )}
               
            {/section}

            {section show=$previous_topic}
            |
            {section-else}
              |
            {/section}

            {let forum=$node.parent}
              <a href={$forum.url_alias|ezurl}>{$forum.name|wash}</a>
            {/let}

            {section show=$next_topic}
               |
            {section-else}
             |
            {/section}

            {section show=$next_topic}
              
                    <a href={$next_topic[0].url_alias|ezurl} title="{$next_topic[0].name|wash}">{'Next topic'|i18n( 'design/ezwebin/full/forum_topic' )}</a>&nbsp;&raquo;
                
            {section-else}
             
                    {'Next topic'|i18n( 'design/ezwebin/full/forum_topic' )}&nbsp;&raquo;
              
            {/section}
        </div>

        {section show=$node.object.can_create}
        {def $notification_access=fetch( 'user', 'has_access_to', hash( 'module', 'notification', 'function', 'use' ) )}
        <form class="form-stacked" method="post" action={"content/action/"|ezurl}>
            <input class="btn" type="submit" name="NewButton" value="{'New reply'|i18n( 'design/ezwebin/full/forum_topic' )}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$node.contentobject_id}" />
            {if $notification_access}
                <input class="btn" type="submit" name="ActionAddToNotification" value="{'Keep me updated'|i18n( 'design/ezwebin/full/forum_topic' )}" />
            {/if}
            <input type="hidden" name="NodeID" value="{$node.node_id}" />
            <input type="hidden" name="ClassIdentifier" value="forum_reply" />
            <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
        </form>
        {section-else}
           <p>
            {"You need to be logged in to get access to the forums. You can do so %login_link_start%here%login_link_end%"|i18n( "design/ezwebin/full/forum_topic",,
         hash( '%login_link_start%', concat( '<a href=', '/user/login/'|ezurl, '>' ), '%login_link_end%', '</a>' ) )}
           </p>
        {/section}
        {/section}

            <table class="table table-striped table-bordered">
            <tr>
                <th class="author">
                    {"Author"|i18n("design/ezwebin/full/forum_topic")}
                </th>
                <th class="message">
                    {"Message"|i18n("design/ezwebin/full/forum_topic")}
                 </th>
            </tr>
            {section show=$view_parameters.offset|lt( 1 )}
            <tr class="bglight">
               <td class="author">
               {let owner=$node.object.owner owner_map=$owner.data_map}
                   <p class="author">{$owner.name|wash}
                   {section show=is_set( $owner_map.title )}
                       <br/>{$owner_map.title.content|wash}
                   {/section}</p>
                   {section show=$owner_map.image.has_content}
                   <div class="authorimage">
                      {attribute_view_gui attribute=$owner_map.image image_class=small}
                   </div>
                   {/section}

                   {section show=is_set( $owner_map.location )}
                       <p>{"Location"|i18n( "design/ezwebin/full/forum_topic" )}: {$owner_map.location.content|wash}</p>
                   {/section}
                   <p>
                      {let owner_id=$node.object.owner_id}
                          {section var=author loop=$node.object.author_array}
                              {section show=eq($owner_id,$author.contentobject_id)|not()}
                                  {"Moderated by"|i18n( "design/ezwebin/full/forum_topic" )}: {$author.contentobject.name|wash}
                              {/section}
                          {/section}
                      {/let}
                   </p>

                  {section show=$node.object.can_edit}
                      <form class="form-stacked" method="post" action={"content/action/"|ezurl}>
                          <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                          <input class="btn" type="submit" name="EditButton" value="{'Edit'|i18n('design/ezwebin/full/forum_topic')}" />
                          <input type="hidden" name="ContentObjectLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                      </form>
                  {/section}
                  {section show=$node.object.can_remove}
                      <form class="form-stacked" method="post" action={"content/action/"|ezurl}>
                          <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                          <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
                          <input class="btn" type="submit" name="ActionRemove" value="{'Remove'|i18n( 'design/ezwebin/full/forum_topic' )}" title="{'Remove this item.'|i18n( 'design/ezwebin/full/forum_topic' )}" />                      </form>
                  {/section}

               </td>
               <td class="message">
                   <p class="date">{$node.object.published|l10n(datetime)}</p>
                   <p>
                       {$node.data_map.message.content|simpletags|wordtoimage|autolink}
                   </p>
                   {section show=$owner_map.signature.has_content}
                       <p class="author-signature">{$owner_map.signature.content|simpletags|autolink}</p>
                   {/section}
               </td>
               {/let}
           </tr>
           {/section}

            {if $reply_count}
                {section var=reply
                         loop=fetch('content','list', hash( 'parent_node_id', $node.node_id,
                                                            'limit', $reply_limit,
                                                            'offset', $reply_offset,
                                                            'sort_by', array( array( published, true() ) ) ) )
                         sequence=array( bgdark, bglight )}
                <tr class="{$reply.sequence}">
                    <td class="author">
                    {let owner=$reply.object.owner owner_map=$owner.data_map}
                        <p class="author">{$owner.name|wash}
                        {section show=is_set( $owner_map.title )}
                            <br/>{$owner_map.title.content|wash}
                        {/section}</p>

                        {section show=$owner_map.image.has_content}
                        <div class="authorimage">
                            {attribute_view_gui attribute=$owner_map.image image_class=small}
                        </div>
                        {/section}

                        {section show=is_set( $owner_map.location )}
                            <p>{"Location"|i18n( "design/ezwebin/full/forum_topic" )}: {$owner_map.location.content|wash}</p>
                        {/section}

                        {let owner_id=$reply.object.owner.id}
                            {section var=author loop=$reply.object.author_array}
                                {section show=ne( $reply.object.owner_id, $author.contentobject_id )}
                                    <p>
                                        {'Moderated by'|i18n( 'design/ezwebin/full/forum_topic' )}: {$author.contentobject.name|wash}
                                    </p>
                                {/section}
                            {/section}
                        {/let}

                        {switch match=$reply.object.can_edit}
                        {case match=1}
                            <form class="form-stacked" method="post" action={"content/action/"|ezurl}>
                            <input type="hidden" name="ContentObjectID" value="{$reply.object.id}" />
                            <input class="btn" type="submit" name="EditButton" value="{'Edit'|i18n('design/ezwebin/full/forum_topic')}" />
                            <input type="hidden" name="ContentObjectLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                            </form>
                        {/case}
                        {case match=0}
                        {/case}
                        {/switch}
                        {section show=$node.object.can_remove}
                            <form class="form-stacked" method="post" action={"content/action/"|ezurl}>
                                <input type="hidden" name="ContentObjectID" value="{$reply.object.id}" />
                                <input type="hidden" name="ContentNodeID" value="{$reply.node_id}" />
                                <input class="btn" type="submit" name="ActionRemove" value="{'Remove'|i18n( 'design/ezwebin/full/forum_topic' )}" title="{'Remove this item.'|i18n( 'design/ezwebin/full/forum_topic' )}" />
                                </form>
                        {/section}


                    </td>
                    <td class="message">
                        <p class="date">{$reply.object.published|l10n( datetime )}</p>

                        <a id="msg{$reply.node_id}"></a>
                        <p>
                            {$reply.object.data_map.message.content|simpletags|wordtoimage|autolink}
                        </p>

                        {section show=$owner_map.signature.has_content}
                            <p class="author-signature">{$owner_map.signature.content|simpletags|autolink}</p>
                        {/section}
                    {/let}
                    </td>
                </tr>
                {/section}
            {/if}
            </table>



{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri=$node.url_alias
         item_count=$reply_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

    </div>
</div>

{/let}
