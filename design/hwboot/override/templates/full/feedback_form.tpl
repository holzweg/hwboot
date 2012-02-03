{* Feedback form - Full view *}


    <div class="hero-unit">

        <div class="page-header">
            <h2>{$node.name|wash()}</h1>
        </div>

        {include name=Validation uri='design:content/collectedinfo_validation.tpl'
                 class='alert'
                 validation=$validation collection_attributes=$collection_attributes}

        <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.description}
        </div>
        <form class="well" method="post" action={"content/action"|ezurl}>

        <h4>{$node.data_map.sender_name.contentclass_attribute.name}</h4>
        <div class="clearfix">
                {attribute_view_gui attribute=$node.data_map.sender_name}
        </div>

        <h4>{$node.data_map.email.contentclass_attribute.name}</h4>
        <div class="clearfix">
                {attribute_view_gui attribute=$node.data_map.email}
        </div>

        <h4>{$node.data_map.subject.contentclass_attribute.name}</h4>
        <div class="clearfix">
                {attribute_view_gui attribute=$node.data_map.subject}
        </div>

        <h4>{$node.data_map.message.contentclass_attribute.name}</h4>
        <div class="clearfix">
                {attribute_view_gui attribute=$node.data_map.message}
        </div>

        <div class="actions">
            <input type="submit" class="btn" name="ActionCollectInformation" value="{"Send form"|i18n("design/ezwebin/full/feedback_form")}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="ViewMode" value="full" />
        </div>
        </form>

    </div>


