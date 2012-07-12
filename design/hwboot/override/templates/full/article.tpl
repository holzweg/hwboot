{* Article - Full view *}

<div class="content-view-full">
    <div class="class-article">

        <div class="attribute-header page-header">
            <h2>{$node.data_map.title.content|wash()}</h2>
        </div>

        {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
        {if $node.data_map.image.has_content}
        <div class="thumbnail content-image">
            {attribute_view_gui attribute=$node.data_map.image image_class=medium}

            {if $node.data_map.caption.has_content}
            <div class="caption" style="width: {$node.data_map.image.content.medium.width}px">

                {attribute_view_gui attribute=$node.data_map.caption}
            </div>
            {/if}
        </div>
        {/if}
        {/if}

        {if eq( ezini( 'article', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
        {if $node.data_map.intro.content.is_empty|not}
        <div class="attribute-short">

            {attribute_view_gui attribute=$node.data_map.intro}
        </div>
        {/if}
        {/if}

        {if $node.data_map.body.content.is_empty|not}
        <div class="attribute-long">
       {attribute_view_gui attribute=$node.data_map.body}
        </div>
        {/if}

        {include uri='design:parts/metainfo.tpl'}

        <div class="attribute-star-rating thumbnail">
            {attribute_view_gui attribute=$node.data_map.star_rating}

            {if is_unset( $versionview_mode )}
                {if $node.data_map.enable_comments.data_int}
                <h5>{"Comments"|i18n("design/ezwebin/full/article")}</h5>
                    {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                    {node_view_gui view='line' content_node=$comment}
                    {/foreach}

                    {if fetch( 'content', 'access', hash( 'access', 'create',
                    'contentobject', $node,
                    'contentclass_id', 'comment' ) )}
                        <form method="post" action={"content/action"|ezurl}>
                              <input type="hidden" name="ClassIdentifier" value="comment" />
                            <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                            <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                            <input class="btn btn-success" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/ezwebin/full/article' )}" />
                        </form>
                    {else}
                        {if ezmodule( 'user/register' )}
                            <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/ezwebin/full/article', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
                        {else}
                            <p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/ezwebin/article/comments', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>' ) )}</p>
                        {/if}
                    {/if}
                {/if}
            {/if}

        </div>

        {include uri='design:parts/related_content.tpl'}

        {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content',
        'function', 'tipafriend' ) )}
        {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
        <div class="attribute-tipafriend">
            <a class="btn" href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}"><i class="icon-envelope"></i>&nbsp;{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}</a>
        </div>
        {/if}
    </div>
</div>

