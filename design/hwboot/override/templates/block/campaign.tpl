{def $valid_nodes = $block.valid_nodes
     $images = array()}

<!-- BLOCK: START -->
<div id="carousel-{$block.id}" class="block-type-campaign">
    {if $block.name|has_content}
        <div class="attribute-header">
            <h2>{$block.name|wash()}</h2>
        </div>
    {/if}
    {include uri='design:parts/carousel.tpl' id=$block.id content_nodes=$valid_nodes image_class="campaign" text_attribute="intro"}
</div>
<!-- BLOCK: END -->
{undef $valid_nodes $images}
