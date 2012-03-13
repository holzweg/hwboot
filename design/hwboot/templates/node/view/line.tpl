<div class="content-view-line">
    <div class="class-{$node.object.class_identifier}">

{* HwBoot Demo Content *}
{def	$class = ""}
{if is_set( $large_green_buttons )}
	{set $class = "btn large"}
{/if}

{if is_set( $node.url_alias )}
         <h2><a href="{$node.url_alias|ezurl('no')}" title="{$node.name|wash()}" class="{$class}">{$node.name|wash()}</a></h2>
{else}
         <h2>{$node.name|wash()}</h2>
{/if}
    </div>
</div>
