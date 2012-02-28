{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<h2><a href={$object.main_node.url_alias|ezurl}>{$object.name|wash()}</a></h2>

<div class="alert alert-block alert-info">

    {def $children = array()
         $limit = 5
         $offset = 0}

    {if is_set( $object_parameters.limit )}
        {set $limit = $object_parameters.limit}
    {/if}

    {if is_set( $object_parameters.offset )}
        {set $offset = $object_parameters.offset}
    {/if}

    {set $children = fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                                 'limit', $limit,
                                                 'offset', $offset,
                                                 'sort_by', $object.main_node.sort_array ) ) }

    {if $children|count()}
    <ul>
    {foreach $children as $child}
       <li>
               <a href={$child.url_alias|ezurl}>{$child.name|wash()}</a>
            <div class="attribute-byline float-break">
                   <p>{$child.object.published|datetime( 'custom', '%d %M %Y %H:%i' )}</p>
                <p><span class="label">{$child.object.owner.name}</span></p>
            </div>
       </li>
    {/foreach}
    </ul>
    {/if}



</div>
