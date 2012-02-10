{* Forum topic - Edit *}



<div class="hero-unit">

    <form class="well"  enctype="multipart/form-data" method="post" action={concat( "/content/edit/", $object.id, "/", $edit_version, "/", $edit_language|not|choose( concat( $edit_language, "/" ), '' ) )|ezurl}>

    <h2>{"Edit %1 - %2"|i18n("design/ezwebin/edit/forum_topic",,array($class.name|wash,$object.name|wash))}</h2>

    {include uri="design:content/edit_validation.tpl"}

    <input type="hidden" name="MainNodeID" value="{$main_node_id}" />
    
    <label>{$object.data_map.subject.contentclass_attribute.name}</label>
    {attribute_edit_gui attribute=$object.data_map.subject}
    
    <label>{$object.data_map.message.contentclass_attribute.name}</label>
    {attribute_edit_gui attribute=$object.data_map.message}

    {def $notification_access=fetch( 'user', 'has_access_to', hash( 'module', 'notification', 'function', 'addtonotification' ) )}
    {if $notification_access}
        <label class="checkbox">{$object.data_map.notify_me.contentclass_attribute.name}
        {attribute_edit_gui attribute=$object.data_map.notify_me}</label>
    {else}
        {attribute_edit_gui attribute=$object.data_map.notify_me type='hidden'}
    {/if}

    {def $current_user=fetch( 'user', 'current_user' )
         $sticky_groups=ezini( 'ForumSettings', 'StickyUserGroupArray', 'forum.ini' )}

        {foreach $sticky_groups as $sticky}
            {if $current_user.groups|contains($sticky)}
            <label class="checkbox">{$object.data_map.sticky.contentclass_attribute.name}
                {attribute_edit_gui attribute=$object.data_map.sticky}</label>
            {/if}
        {/foreach}

    <div class="actions">
        <input class="btn btn-primary" type="submit" name="PublishButton" value="{'Send for publishing'|i18n('design/ezwebin/edit/forum_topic')}" />
        <input class="btn " type="submit" name="DiscardButton" value="{'Discard'|i18n('design/ezwebin/edit/forum_topic')}" />
        <input type="hidden" name="DiscardConfirm" value="0" />
    </div>

    </form>

</div>
