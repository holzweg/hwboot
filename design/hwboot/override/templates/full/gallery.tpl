{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Gallery - Full view *}

<div class="hero-unit">

		<h2>{$node.name|wash()}</h2>

        {if $node.data_map.image.content}
            <div class="attribute-image">
                {attribute_view_gui image_class=medium attribute=$node.data_map.image.content.data_map.image}
            </div>
        {/if}

        <div class="attribute-short">
           {attribute_view_gui attribute=$node.data_map.short_description}
        </div>

        <div class="attribute-long">
           {attribute_view_gui attribute=$node.data_map.description}
        </div>

        {def $page_limit=12
             $children_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                                     'class_filter_type', 'include',
                                                                     'class_filter_array', array( 'image', 'flash_player' ) ) )}

        {if $children_count}
            {* NOTE: Remember to modify templates for classes listed in class_filter_array if filters / sort_by is changed! *}
            {def $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                             'offset', $view_parameters.offset,
                                                             'limit', $page_limit,
                                                             'class_filter_type', 'include',
                                                             'class_filter_array', array( 'image', 'flash_player' ),
                                                             'sort_by', $node.sort_array ) )}
            {* <div class="attribute-link"> *}
                {* <p> *}
					{* <a href={$children[0].url_alias|ezurl}>{'View as slideshow'|i18n( 'design/ezwebin/full/gallery' )}</a> *}
                {* </p> *}
            {* </div> *}

                {def $filters = ezini( 'gallerythumbnail', 'Filters', 'image.ini' )}

                    {foreach $filters as $filter}
                    {if or($filter|contains( "geometry/scale" ), $filter|contains( "geometry/scaledownonly" ), $filter|contains( "geometry/crop" ) )}
                        {def $image_style = $filter|explode("=").1}
                        {set $image_style = concat("width:", $image_style|explode(";").0, "px ;", "height:", $image_style|explode(";").1, "px")}
                        {break}
                    {/if}
                    {/foreach}

				<ul class="thumbnails">
					{foreach $children as $child}
						<li>
							{node_view_gui view=galleryline content_node=$child carousel_mode=false()}
						</li>
					{/foreach}
				</ul>

			{* Le Carousel! (: *}
			<div class="carousel slide" id="gallery-carousel">
				<div class="carousel-inner">
					{foreach $children as $i => $child}
						{if eq($i, 0)}
							<div class="item active">
						{else}
							<div class="item">
						{/if}
							{node_view_gui view=galleryline content_node=$child carousel_mode=true()}
						</div>
					{/foreach}
				</div>
				<a class="carousel-control left" href="#gallery-carousel" data-slide="prev">&lsaquo;</a>
				<a class="carousel-control right" href="#gallery-carousel" data-slide="next">&rsaquo;</a>
			</div>

        {/if}

		{* @todo bootstrapize navigator *}
        {include name=navigator
                 uri='design:navigator/google.tpl'
                 page_uri=$node.url_alias
                 item_count=$children_count
                 view_parameters=$view_parameters
                 item_limit=$page_limit}
</div>
