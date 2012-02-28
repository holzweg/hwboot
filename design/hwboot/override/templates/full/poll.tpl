{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Poll - Full view *}


<div class="content">
    <div class="class-poll hero-unit">

        <div class="page-header">
            <h1>{$node.name|wash()}</h1>
        </div>

        <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.description}
        </div>

        <form class="well"  method="post" action={"content/action"|ezurl}>
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
        <input type="hidden" name="ViewMode" value="full" />

        <div class="content-question">
        {attribute_view_gui attribute=$node.data_map.question}
        </div>

        {if is_unset( $versionview_mode )}
        <input class="btn" type="submit" name="ActionCollectInformation" value="{"Vote"|i18n("design/ezwebin/full/poll")}" />
        {/if}

        </form>

        <div class="content-results">
            <div class="attribute-link">
                <p><a href={concat( "/content/collectedinfo/", $node.node_id, "/" )|ezurl}>{"Result"|i18n("design/ezwebin/full/poll")}</a></p>
            </div>
        </div>

    </div>
</div>
