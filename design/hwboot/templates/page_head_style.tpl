{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

{if $load_css_file_list}
	{array( 
		"reset.less", 
		"variables.less",
		"mixins.less",
		"scaffolding.less",
		"type.less",
		"forms.less",
		"tables.less",
		"patterns.less",
		"hwboot.less"
			)|ezless_add()}
	{ezless()}
{else}

{/if}
