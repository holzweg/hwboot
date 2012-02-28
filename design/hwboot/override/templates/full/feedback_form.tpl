{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Feedback form - Full view *}
    <div class="hero-unit">

        <h2>{$node.name|wash()}</h1>

        {include name=Validation uri='design:content/collectedinfo_validation.tpl'
                 class='alert'
                 validation=$validation collection_attributes=$collection_attributes}

        <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.description}
        </div>
        <form class="well" method="post" action={"content/action"|ezurl}>

        <h4>{$node.data_map.sender_name.contentclass_attribute.name}</h4>
            {attribute_view_gui attribute=$node.data_map.sender_name}

        <h4>{$node.data_map.email.contentclass_attribute.name}</h4>
            {attribute_view_gui attribute=$node.data_map.email}

        <h4>{$node.data_map.subject.contentclass_attribute.name}</h4>
            {attribute_view_gui attribute=$node.data_map.subject}

        <h4>{$node.data_map.message.contentclass_attribute.name}</h4>
            {attribute_view_gui attribute=$node.data_map.message}

        <div class="actions">
            <input type="submit" class="btn btn-primary" name="ActionCollectInformation" value="{"Send form"|i18n("design/ezwebin/full/feedback_form")}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="ViewMode" value="full" />
        </div>
        </form>

    </div>


