{* eZ Less dependent implementation *}
{array(
"less/bootstrap.less",
"less/prettify.less",
"less/websitetoolbar.less",
"less/hwboot.less"
						)|ezless_add()}
{ezless()}

{* @todo Implement a fallback to default CSS? *}
{* {ezcss_load( array(  *}
				  {* ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ), *}
				  {* ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) ))} *}

{* Disabled fallback when $load_css_file_list is false, as it seems to come straight out of configuration hell. *}
{* {if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

{if $load_css_file_list}
  {ezcss_load( array( 
                      ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
                      ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) ))}
{else}
  {ezcss_load( array( 'bootstrap.min.css',
					  'hwboot.css' ))}
{/if} *}
