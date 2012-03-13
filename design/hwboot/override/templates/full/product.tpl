{* Product - Full view *}


<form class="well"  method="post" action={"content/action"|ezurl}>
    <div class="hero-unit">

        <h2>{$node.name|wash()}</h1>
        
        {if $node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=medium attribute=$node.data_map.image}
            {if $node.data_map.caption.has_content}
            <div class="caption">
                {attribute_view_gui attribute=$node.data_map.caption}
            </div>
            {/if}
        </div>
        {/if}

           {attribute_view_gui attribute=$node.object.data_map.product_number}

           {attribute_view_gui attribute=$node.object.data_map.short_description}

           {attribute_view_gui attribute=$node.object.data_map.description}

		    <div class="well">
				{attribute_view_gui attribute=$node.object.data_map.price}
			</div>

           {attribute_view_gui attribute=$node.object.data_map.additional_options}

        {* Category. *}
        {def $product_category_attribute=ezini( 'VATSettings', 'ProductCategoryAttribute', 'shop.ini' )}
        {if and( $product_category_attribute, is_set( $node.data_map.$product_category_attribute ) )}
        <div class="attribute-long">
          <p>Category:&nbsp;{attribute_view_gui attribute=$node.data_map.$product_category_attribute}</p>
        </div>
        {/if}
        {undef $product_category_attribute}

		<div class="well">

			<input type="submit" class="btn btn-primary" name="ActionAddToBasket" value="{"Add to basket"|i18n("design/ezwebin/full/product")}" />
			<input class="btn" type="submit" name="ActionAddToWishList" value="{"Add to wish list"|i18n("design/ezwebin/full/product")}" />
			<input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
			<input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
			<input type="hidden" name="ViewMode" value="full" />

		</div>

       {* Related products. *}
       {def $related_purchase=fetch( 'shop', 'related_purchase', hash( 'contentobject_id', $node.object.id, 'limit', 10 ) )}
       {if $related_purchase}
            <h2>{'People who bought this also bought'|i18n( 'design/ezwebin/full/product' )}</h2>

            <ul>
            {foreach $related_purchase as $product}
                <li>{content_view_gui view=text_linked content_object=$product}</li>
            {/foreach}
            </ul>
       {/if}
       {undef $related_purchase}
   </div>
</form>
