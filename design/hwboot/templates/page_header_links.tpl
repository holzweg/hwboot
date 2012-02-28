{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{if $pagedesign.data_map.tag_cloud_url.data_text|ne('')}
    {if $pagedesign.data_map.tag_cloud_url.content|eq('')}
        <li id="tagcloud"><a class="btn btn-small" href={concat("/content/view/tagcloud/", $pagedata.root_node)|ezurl} title="{$pagedesign.data_map.tag_cloud_url.data_text|wash}"><i class="icon-map-marker"></i>{$pagedesign.data_map.tag_cloud_url.data_text|wash}</a></li>
    {else}
        <li id="tagcloud"><a class="btn btn-small" href={$pagedesign.data_map.tag_cloud_url.content|ezurl} title="{$pagedesign.data_map.tag_cloud_url.data_text|wash}"><i class="icon-map-marker"></i>{$pagedesign.data_map.tag_cloud_url.data_text|wash}</a></li>
    {/if}
{/if}

{if $pagedesign.data_map.site_map_url.data_text|ne('')}
    {if $pagedesign.data_map.site_map_url.content|eq('')}
        <li id="sitemap"><a class="btn btn-small" href={concat("/content/view/sitemap/", $pagedata.root_node)|ezurl} title="{$pagedesign.data_map.site_map_url.data_text|wash}"><i class="icon-list-alt"></i>{$pagedesign.data_map.site_map_url.data_text|wash}</a></li>
    {else}
        <li id="sitemap"><a class="btn btn-small" href={$pagedesign.data_map.site_map_url.content|ezurl} title="{$pagedesign.data_map.site_map_url.data_text|wash}"><i class="icon-list-alt"></i>{$pagedesign.data_map.site_map_url.data_text|wash}</a></li>
    {/if}
{/if}

{if $basket_is_empty|not()}
    <li id="shoppingbasket"><a class="btn btn-small" href={"/shop/basket/"|ezurl} title="{$pagedesign.data_map.shopping_basket_label.data_text|wash}"><i class="icon-shopping-cart"></i>{$pagedesign.data_map.shopping_basket_label.data_text|wash}</a></li>
{/if}

{if $current_user.is_logged_in}
    {if $pagedesign.data_map.my_profile_label.has_content}
        <li id="myprofile"><a class="btn btn-small btn-info" href={"/user/edit/"|ezurl} title="{$pagedesign.data_map.my_profile_label.data_text|wash}"><i class="icon-user icon-white"></i>{$pagedesign.data_map.my_profile_label.data_text|wash}</a></li>
    {/if}
    {if $pagedesign.data_map.logout_label.has_content}
        <li id="logout"><a class="btn btn-small btn-danger" href={"/user/logout"|ezurl} title="{$pagedesign.data_map.logout_label.data_text|wash}"><i class="icon-off icon-white"></i>{$pagedesign.data_map.logout_label.data_text|wash} ( {$current_user.contentobject.name|wash} )</a></li>
    {/if}
{else}
    {if and( $pagedesign.data_map.register_user_label.has_content, ezmodule( 'user/register' ) )}
        <li id="registeruser"><a class="btn btn-small" href={"/user/register"|ezurl} title="{$pagedesign.data_map.register_user_label.data_text|wash}"><i class="icon-user"></i>{$pagedesign.data_map.register_user_label.data_text|wash}</a></li>
    {/if}
    {if $pagedesign.data_map.login_label.has_content}
        <li id="login"><a class="btn btn-small btn-success" href={"/user/login"|ezurl} title="{$pagedesign.data_map.login_label.data_text|wash}"><i class="icon-user icon-white"></i>{$pagedesign.data_map.login_label.data_text|wash}</a></li>
    {/if}
{/if}

{if $pagedesign.can_edit}
    <li id="sitesettings"><a class="btn btn-small btn-warning" href={concat( "/content/edit/", $pagedesign.id, "/a" )|ezurl} title="{$pagedesign.data_map.site_settings_label.data_text|wash}"><i class="icon-cog icon-white"></i>{$pagedesign.data_map.site_settings_label.data_text|wash}</a></li>
{/if}
