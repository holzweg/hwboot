{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{def $page_limit=10
     $col_count=2
     $sub_children=0
     $children=fetch('content','list',hash('parent_node_id', $node.node_id,
                                           'limit', $page_limit,
                                           'offset', $view_parameters.offset,
 

                                          'sort_by', $node.sort_array))}
<div class="hero-unit">
<div class="page-header">
    <h2>{"Site map"|i18n("design/ezwebin/view/sitemap")} {$node.name|wash}</h1>
</div>
    <table class="table table-striped table-bordered">
        <tr>
            {foreach $children as $key => $child}
            <td>
                <h2><a href={$child.url_alias|ezurl}>{$child.name}</a></h2>
                {if $child.class_identifier|eq( 'event_calendar' )}
                {set $sub_children=fetch('content','list',hash( 'parent_node_id', $child.node_id, 
                'limit', $page_limit,
                'sort_by', array( 'attribute', false(), 'event/from_time' ) ) )}
                {else}
                {set $sub_children=fetch('content','list',hash( 'parent_node_id', $child.node_id,
                'limit', $page_limit,
                'sort_by', $child.sort_array))}
                {/if}
                <ul>
                    {foreach $sub_children as $sub_child}
                    <li><a href={$sub_child.url_alias|ezurl}>{$sub_child.name}</a></li>
                    {/foreach}
                </ul>
            </td>
            {if ne( $key|mod($col_count), 0 )}
        </tr>
        <tr>
            {/if}
            {/foreach}
        </tr>
    </table>

</div>
