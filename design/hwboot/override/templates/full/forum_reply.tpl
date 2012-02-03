

<div class="page-header">
    <h2>{"Message preview"|i18n("design/ezwebin/full/forum_reply")}</h2>
</div>

<div class="forum_level4 hero-unit">
<table class="table table-striped table-bordered">
<tr>
    <th class="author">
    {"Author"|i18n("design/ezwebin/full/forum_reply")}
    </th>
    <th class="message">
    {"Topic"|i18n("design/ezwebin/full/forum_reply")}
    </th>
</tr>
<tr class="bglightforum">
    <td class="author">
    {def $owner=$node.object.owner
         $owner_map=$owner.data_map}
        <p class="author">{$owner.name|wash}
        {if is_set( $owner_map.title )}
            <br />{$owner_map.title.content|wash}
        {/if}</p>
        {if $owner_map.image.has_content}
        <div class="authorimage media-grid">
            {attribute_view_gui attribute=$owner_map.image image_class=small}
        </div>
        {/if}

        {if is_set( $owner_map.location )}
            <p>{"Location"|i18n("design/ezwebin/full/forum_reply")}:{$owner_map.location.content|wash}</p>
        {/if}
        <p>
        {def $owner_id=$node.object.owner.id}
            {foreach $node.object.author_array as $author}
                {if eq($owner_id,$author.contentobject_id)|not()}
                    {"Moderated by"|i18n("design/ezwebin/full/forum_reply")}: {$author.contentobject.name|wash}
                 {/if}
             {/foreach}
        </p>

        {if $node.object.can_edit}
        <form class="form-stacked" method="post" action={"content/action/"|ezurl}>

        <br/>

        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
        <input class="btn" type="submit" name="EditButton" value="{'Edit'|i18n('design/ezwebin/full/forum_reply')}" />
        <input type="hidden" name="ContentObjectLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
        </form>
        {/if}

    </td>
    <td class="message">
        <p class="date">{$node.object.published|l10n(datetime)}</p>

        <h3>{$node.name|wash}</h3>

        <p>
            {$node.data_map.message.content|simpletags|wordtoimage|autolink}
        </p>
        {if $owner_map.signature.has_content}
            <p class="author-signature">{$owner_map.signature.content|simpletags|autolink}</p>
        {/if}
    </td>
</tr>
</table>
</div>
