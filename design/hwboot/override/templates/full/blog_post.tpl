{* Blog post - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
'extra_menu', false())}

<div class="content">

    <div class="span7 hero-unit" style="float:left">

        <div class="attribute-header page-header">
            <h2>{$node.data_map.title.content|wash}</h2>
        </div>

        <div class="attribute-byline alert-message info">
            <p class="date">{$node.data_map.publication_date.content.timestamp|l10n(shortdatetime)}</p>
            <p class="author">{$node.object.owner.name}</p>
            <p class="tags"> {"Tags:"|i18n("design/ezwebin/full/blog_post")}
                {foreach $node.data_map.tags.content.keywords as $keyword}
                <a href={concat( $node.parent.url_alias, "/(id)/", $node.parent.node_id, "/(tag)/", $keyword|rawurlencode )|ezurl} title="{$keyword}">{$keyword}</a>
                {delimiter}
                ,
                {/delimiter}
                {/foreach}
            </p>
        </div>

        <div class="attribute-body float-break">
            {attribute_view_gui attribute=$node.data_map.body}
        </div>

        {include uri='design:parts/related_content.tpl'}

        {if $node.data_map.enable_comments.data_int}
        <div class="attribute-comments">
            <a name="comments" id="comments"></a>
            <h2>{"Comments"|i18n("design/ezwebin/full/blog_post")}</h2>
            <div class="content-view-children">
                {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                {node_view_gui view='line' content_node=$comment}
                {/foreach}
            </div>

            {if fetch( 'content', 'access', hash( 'access', 'create', 'contentobject', $node, contentclass_id, 'comment' ) )}
            <form class="form-stacked" method="post" action={"content/action"|ezurl}>
                  <input type="hidden" name="ClassIdentifier" value="comment" />
                <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                <input class="btn" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/ezwebin/full/article' )}" />
            </form>
            {else}
            {if ezmodule( 'user/register' )}
            <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/ezwebin/full/blog_post', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
            {else}
            <p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/ezwebin/article/comments', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>' ) )}</p>
            {/if}
            {/if}
        </div>
        {/if}
    </div>





<div class="span5 hero-unit" style="float:left;margin-left:20px">
    {include uri='design:parts/blog/extra_info.tpl' used_node=$node.parent}
</div>


</div>

