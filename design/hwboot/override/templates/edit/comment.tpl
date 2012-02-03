

<div class="content">
    <div class="class-comment hero-unit">

    <form class="well"  enctype="multipart/form-data" method="post" action={concat( "/content/edit/", $object.id, "/", $edit_version, "/", $edit_language|not|choose( concat( $edit_language, "/" ), '' ) )|ezurl}>

    <div class="page-header">
        <h1 class="long">{"Edit %1 - %2"|i18n("design/ezwebin/edit/comment",,array( $class.name|wash(), $object.name|wash() ) )}</h1>
    </div>

    {include uri="design:content/edit_validation.tpl"}

    <div class="clearfix">
       {def $attribute=$object.data_map.subject}
       <label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
       <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
       <input class="box" type="text" size="70" name="ContentObjectAttribute_ezstring_data_text_{$attribute.id}" value="" />
    </div>

    {def $current_user=fetch( 'user', 'current_user' )
         $attribute=$object.data_map.author}
    <div class="clearfix">
        {if $current_user.is_logged_in}
        <input type="hidden" name="ContentObjectAttribute_ezstring_data_text_{$attribute.id}" value="{$current_user.contentobject.name|wash}" />
        {else}
            <label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
        <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
        <input class="box" type="text" size="70" name="ContentObjectAttribute_ezstring_data_text_{$attribute.id}" value="" />
        {/if}
    </div>

    <div class="clearfix">
       {def $attribute=$object.data_map.message}
       <label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
       <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
       <textarea class="box" cols="70" rows="10" name="ContentObjectAttribute_data_text_{$attribute.id}"></textarea>
    </div>

    <div class="actions">
        <input class="defaultbutton btn" type="submit" name="PublishButton" value="{'Send for publishing'|i18n('design/ezwebin/edit/comment')}" />
        <input class="btn" type="submit" name="DiscardButton" value="{'Discard'|i18n('design/ezwebin/edit/comment')}" />
        <input type="hidden" name="MainNodeID" value="{$main_node_id }" />
        <input type="hidden" name="DiscardConfirm" value="0" />
    </div>

    </form>

    </div>
</div>
