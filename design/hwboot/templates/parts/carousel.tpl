{if not( is_set( $id ) )}{def $id="myCarousel"}{/if}
{if not( is_set( $text_attribute ) )}{def $text_attribute="intro"}{/if}
{if not( is_set( $image_class ) )}{def $image_class="campaign"}{/if}
{if not( is_set( $thumbnail_class ) )}{def $thumbnail_class="gallerythumbnail"}{/if}
{if not( is_set( $show_controls ) )}{def $show_controls=true()}{/if}
{if not( is_set( $show_navigation ) )}{def $show_navigation=false()}{/if}
{if not( is_set( $interval ) )}{def $interval=5000}{/if}

{* disable iteration and controls if only one item *}
{if $content_nodes|count()|eq(1))}
    {set $interval = 1000000000
         $show_navigation = false()
         $show_controls = false()}
{/if}

<div id="carousel-{$id}" class="carousel slide">
    <div class="carousel-inner">
        {foreach $content_nodes as $k => $node}
            <div class="item{if $k|eq(0)} active{/if}">
                {node_view_gui view="carousel_item" content_node=$node image_class=$image_class text_attribute=$text_attribute}
            </div>
        {/foreach}
    </div>

    {if $show_controls}
        <a class="carousel-control left" href="#carousel-{$id}" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#carousel-{$id}" data-slide="next">&rsaquo;</a>
    {/if}
</div>

{if $show_navigation}
    <div class="carousel-navigation well">
        {foreach $content_nodes as $k => $node}
            <a href="#" onclick="$('#carousel-{$id}').carousel({$k});return false;" class="carousel-navigation-item thumbnail{if $k|eq(0)} active{/if}">
                {attribute_view_gui attribute=$node.data_map.image image_class=$thumbnail_class}
            </a>
        {/foreach}
        <div style="clear: both;"></div>
    </div>
{/if}

<script type="text/javascript">{literal}
    $(document).ready(function() {
        $("#carousel-{/literal}{$id}{literal}").carousel({
            interval: {/literal}{$interval}{literal}
        });
    });
{/literal}</script>