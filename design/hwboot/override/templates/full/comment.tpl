{* Comment - Full view *}


<div class="content-view-full content">
    <div class="class-comment hero-unit">

    <div class="page-header">
        <h1>{$node.name|wash()}</h1>
    </div>

    <div class="attribute-byline alert-message info">
        <p class="author">{$node.data_map.author.content|wash}</p>
        <p class="date">({$node.object.published|l10n(shortdatetime)})</p>
    </div>

    <div class="attribute-long">
        {$node.data_map.message.content|wash(xhtml)|break|wordtoimage|autolink}
    </div>

    </div>
</div>
