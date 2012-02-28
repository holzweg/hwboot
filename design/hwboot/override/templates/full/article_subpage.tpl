{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Article (sub-page) - Full view *}

    <div class="hero-unit">

        <div class="page-header">
            <h2>{$node.data_map.title.content|wash()}</h2>
        </div>

        <div class="alert alert-info">
        {if $node.parent.data_map.author.content.is_empty|not()}
        <p class="author">
             {attribute_view_gui attribute=$node.parent.data_map.author}
        </p>
        {/if}
        <p class="date">
             {$node.parent.object.published|l10n(shortdatetime)}
        </p>
        </div>

        {include uri='design:parts/article/article_index.tpl' used_node=$node.parent}

        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        {/if}

        {include uri='design:parts/article/page_navigator.tpl' used_node=$node.parent}

        {include uri='design:parts/article/comments.tpl' used_node=$node.parent}

        {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                                      'function', 'tipafriend' ) )}
        {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
        <div class="attribute-tipafriend">
            <p><a href={concat( "/content/tipafriend/", $node.parent.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezwebin/full/article_subpage' )}">{'Tip a friend'|i18n( 'design/ezwebin/full/article_subpage' )}</a></p>
        </div>
        {/if}

    </div>
