{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{def $number_of_items=10
     $subscribed_nodes_count=fetch( 'notification', 'subscribed_nodes_count' )}

<br />

<h2>{'My item notifications [%notification_count]'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit', , hash( '%notification_count', $subscribed_nodes_count ) )}</h2>

{if $subscribed_nodes_count}

<table class="table table-bordered table-striped">
<tr>
    <th>
        <img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}" title="{'Invert selection.'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}" onclick="ezjs_toggleCheckboxes( document.notification, 'SelectedRuleIDArray_{$handler.id_string}[]' ); return false;" />
    </th>
    <th>
    {'Name'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}
    </th>
    <th>
    {'Type'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}
    </th>
    <th>
    {'Section'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}
    </th>
</tr>

{foreach fetch( 'notification', 'subscribed_nodes', hash( 'limit', $number_of_items,
                                                          'offset', $view_parameters.offset ) ) as $rule
        }
<tr>
    <td>
          <input type="checkbox" name="SelectedRuleIDArray_{$handler.id_string}[]" value="{$rule.id}" />
    </td>
    <td>
    <a href={$rule.node.url_alias|ezurl}>
    {$rule.node.name|wash()}
        </a>
    </td>
    <td>
    {$rule.node.object.content_class.name|wash}
    </td>
    <td>
    {def $section_object=fetch( 'section', 'object', hash( 'section_id', $rule.node.object.section_id ) )}{if $section_object}{$section_object.name|wash()}{else}<i>{'Unknown'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}</i>{/if}
    {undef $section_object}
    </td>
</tr>
{/foreach}
</table>

{else}
<p>{'You have not subscribed to receive notifications about any items.'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}</p>
{/if}

{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri='/notification/settings'
         item_count=$subscribed_nodes_count
         view_parameters=$view_parameters
         item_limit=$number_of_items}

{if $subscribed_nodes_count}
<input class="btn btn-danger" type="submit" name="RemoveRule_{$handler.id_string}" value="{'Remove selected'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}" /> 
{/if}
<input class="btn btn-success" type="submit" name="NewRule_{$handler.id_string}" value="{'Add items'|i18n( 'design/ezwebin/notification/handler/ezsubtree/settings/edit' )}" />
