{if is_unset( $disabled ) }
    {def $disabled=false()};
{/if}
{if $disabled}
<input class="btn disabled" disabled="disabled" type="submit" name="{$id_name}" value="{$value}" />
{else}
<input class="btn {$extra_btn_classes}" type="submit" name="{$id_name}" value="{$value}" />
{/if}
{undef $disabled}
