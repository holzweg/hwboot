
<div class="content">
    <div class="class-file hero-unit">

    <form class="form-stacked" enctype="multipart/form-data" method="post" action={concat( "/content/edit/", $object.id, "/", $edit_version, "/", $edit_language|not|choose( concat( $edit_language, "/" ), '' ) )|ezurl}>


    {include uri='design:parts/website_toolbar_edit.tpl'}

    <div class="page-header">
        <h2>{"Edit %1 - %2"|i18n("design/ezwebin/edit/file",,array($class.name|wash,$object.name|wash))}</h2>
    </div>

    {include uri="design:content/edit_validation.tpl"}

    <input type="hidden" name="MainNodeID" value="{$main_node_id}" />

    {include uri="design:content/edit_attribute.tpl"}

    <div class="actions">
        <input class="defaultbutton btn" type="submit" name="PublishButton" value="{'Send for publishing'|i18n('design/ezwebin/edit/file')}" />
        <input class="btn" type="submit" name="DiscardButton" value="{'Discard'|i18n('design/ezwebin/edit/file')}" />
        <input type="hidden" name="DiscardConfirm" value="0" />
    </div>

    </form>

    </div>
</div>
