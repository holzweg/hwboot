{set $classification = cond( and(is_set( $align ), $align ), concat( $classification, ' object-', $align ), $classification )}
<table{if $classification} class="table table-striped table-bordered"{else} class="table table-bordered"{/if} {if and(is_set( $title ), $title)} title="{$title|wash}"{/if}>
{if and(is_set( $caption ), $caption)}<caption>{$caption|wash}</caption>{/if}
{$rows}
</table>
