{def $valid_nodes = $block.valid_nodes
     $first = $valid_nodes.0
     $big_image_class = 'gallery'
     $image = $first.data_map.image.content[$big_image_class]}
<!-- BLOCK: START -->
<div class="block-type-gallery">
    <div class="block-gallery">
        {include uri='design:parts/carousel.tpl' id=$block.id content_nodes=$valid_nodes image_class=$big_image_class text_attribute="caption" show_navigation=true()}
    </div>
</div>
<!-- BLOCK: END -->
{undef $valid_nodes $first $big_image_class $image}