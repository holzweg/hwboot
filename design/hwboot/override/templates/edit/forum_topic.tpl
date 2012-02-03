{* Forum topic - Edit *}


<div class="content">
    <div class="class-forum-topic hero-unit">

        <form class="well"  enctype="multipart/form-data" method="post" action={concat( "/content/edit/", $object.id, "/", $edit_version, "/", $edit_language|not|choose( concat( $edit_language, "/" ), '' ) )|ezurl}>

        <div class="page-header">
            <h2>{"Edit %1 - %2"|i18n("design/ezwebin/edit/forum_topic",,array($class.name|wash,$object.name|wash))}</h2>
        </div>

        {include uri="design:content/edit_validation.tpl"}

        <input type="hidden" name="MainNodeID" value="{$main_node_id}" />
        
        <div class="clearfix">
            <label>{$object.data_map.subject.contentclass_attribute.name}</label>
            {attribute_edit_gui attribute=$object.data_map.subject}
        </div>
        
        <div class="clearfix">
            <label>{$object.data_map.message.contentclass_attribute.name}</label>
            {attribute_edit_gui attribute=$object.data_map.message}
        </div>

        {def $notification_access=fetch( 'user', 'has_access_to', hash( 'module', 'notification', 'function', 'addtonotification' ) )}
        <div class="clearfix">
            {if $notification_access}
                <label>{$object.data_map.notify_me.contentclass_attribute.name}</label>
                {attribute_edit_gui attribute=$object.data_map.notify_me}
            {else}
                {attribute_edit_gui attribute=$object.data_map.notify_me type='hidden'}
            {/if}
        </div>

        {def $current_user=fetch( 'user', 'current_user' )
             $sticky_groups=ezini( 'ForumSettings', 'StickyUserGroupArray', 'forum.ini' )}

            {foreach $sticky_groups as $sticky}
                {if $current_user.groups|contains($sticky)}
                <div class="clearfix">
                    <label>{$object.data_map.sticky.contentclass_attribute.name}</label>
                        {attribute_edit_gui attribute=$object.data_map.sticky}
                </div>
                {/if}
            {/foreach}

        <div class="actions">
            <input class="defaultbutton btn" type="submit" name="PublishButton" value="{'Send for publishing'|i18n('design/ezwebin/edit/forum_topic')}" />
            <input class="btn" type="submit" name="DiscardButton" value="{'Discard'|i18n('design/ezwebin/edit/forum_topic')}" />
            <input type="hidden" name="DiscardConfirm" value="0" />
        </div>

        </form>

    </div>
</div>
