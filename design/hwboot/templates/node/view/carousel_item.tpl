{if not( is_set( $text_attribute ) )}{def $text_attribute="intro"}{/if}
{if not( is_set( $image_class ) )}{def $image_class="campaign"}{/if}

{def $image = $node.data_map.image.content[$image_class]}
<img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" alt="{$node.name|wash}" />
<figcaption class="attribute-caption carousel-caption">
    <h4><a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a></h4>
    {if $node.data_map[$text_attribute].has_content}
        {attribute_view_gui attribute=$node.data_map[$text_attribute]}
    {/if}
</figcaption>
{undef $image}