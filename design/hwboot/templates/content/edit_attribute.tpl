{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{default $view_parameters            = array()
         $attribute_categorys        = ezini( 'ClassAttributeSettings', 'CategoryList', 'content.ini' )
         $attribute_default_category = ezini( 'ClassAttributeSettings', 'DefaultCategory', 'content.ini' )}

{foreach $content_attributes_grouped_data_map as $attribute_group => $content_attributes_grouped}
{if $attribute_group|ne( $attribute_default_category )}
	<fieldset>
	<legend><a href="JavaScript:void(0);">{$attribute_categorys[$attribute_group]}</a></legend>
{/if}
{foreach $content_attributes_grouped as $attribute_identifier => $attribute}
{def $contentclass_attribute = $attribute.contentclass_attribute}
{* Show view GUI if we can't edit, otherwise: show edit GUI. *}
{if and( eq( $attribute.can_translate, 0 ), ne( $object.initial_language_code, $attribute.language_code ) )}
    <label>{first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.can_translate|not} ({'not translatable'|i18n( 'design/admin/content/edit_attribute' )}){/if}:
        {if $contentclass_attribute.description} {first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}{/if}
    </label>
    {if $is_translating_content}
        {attribute_view_gui attribute_base=$attribute_base attribute=$attribute view_parameters=$view_parameters}
        <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
    {else}
        {attribute_view_gui attribute_base=$attribute_base attribute=$attribute view_parameters=$view_parameters}
        <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
    {/if}
{else}
    {if $is_translating_content}
        <div class="control-group{if $attribute.has_validation_error} error{/if}">
            <label>{first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
                {if $attribute.is_required} <span class="label label-warning">{'required'|i18n( 'design/admin/content/edit_attribute' )}</span>{/if}
                {if $attribute.is_information_collector} <span class="label label-info">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</span>{/if}:
                {if $contentclass_attribute.description} <span class="label">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</span>{/if}
            </label>
        </div>
        <div class="original">
            {attribute_view_gui attribute_base=$attribute_base attribute=$from_content_attributes_grouped_data_map[$attribute_group][$attribute_identifier] view_parameters=$view_parameters}
        </div>
        <div class="translation">
        {if $attribute.display_info.edit.grouped_input}
            <fieldset>
            {attribute_edit_gui attribute_base=$attribute_base attribute=$attribute view_parameters=$view_parameters}
            <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
            </fieldset>
        {else}
            {attribute_edit_gui attribute_base=$attribute_base attribute=$attribute view_parameters=$view_parameters}
            <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
        {/if}
        </div>
    {else}
        {if $attribute.display_info.edit.grouped_input}
            <fieldset>
            <div class="control-group{if $attribute.has_validation_error} error{/if}">
                <legend>{first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
                    {if $attribute.is_information_collector} <span class="collector">({'information collector'|i18n( 'design/admin/content/edit_attribute' )})</span>{/if}
                    {if $contentclass_attribute.description} <span class="classattribute-description">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</span>{/if}
                </legend>
            </div>
                {attribute_edit_gui attribute_base=$attribute_base attribute=$attribute view_parameters=$view_parameters}
            <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
            </fieldset>
        {else}
            <div class="control-group{if $attribute.has_validation_error} error{/if}">
                <label>{first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
                    {if $attribute.is_required} <span class="label label-warning">{'required'|i18n( 'design/admin/content/edit_attribute' )}</span>{/if}
                    {if $attribute.is_information_collector} <span class="collector">({'information collector'|i18n( 'design/admin/content/edit_attribute' )})</span>{/if}
                    {if $contentclass_attribute.description} <span class="classattribute-description">{first_set( $contentclass_attribute.descriptionList[$content_language], $contentclass_attribute.description)|wash}</span>{/if}
                </label>
                <div class="controls">{attribute_edit_gui attribute_base=$attribute_base attribute=$attribute view_parameters=$view_parameters}</div>
            </div>
            <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
        {/if}
    {/if}
{/if}
{undef $contentclass_attribute}
{/foreach}
{if $attribute_group|ne( $attribute_default_category )}
    </fieldset>
{/if}
{/foreach}

{* @todo Build some collapsing functionality with bootstrap-collapse *}

{* {run-once} *}
{* [> if is_set( $content_attributes_grouped_data_map[1] ) <] *}
{* {ezscript_require(array( 'ezjsc::jquery' ) )} *}
{* <script type="text/javascript"> *}
{* <!-- *}
{* {literal} *}

{* jQuery(function( $ ) *}
{* { *}
    {* $('fieldset.ezcca-collapsible legend a').click( function() *}
    {* { *}
		{* var container = $( this.parentNode.parentNode ), inner = container.find('div.ezcca-collapsible-fieldset-content'); *}
		{* if ( container.hasClass('ezcca-collapsed') ) *}
		{* { *}
			{* container.removeClass('ezcca-collapsed'); *}
			{* inner.slideDown( 150 ); *}
		{* } *}
		{* else *}
		{* { *}
			{* inner.slideUp( 150, function(){ *}
                {* $( this.parentNode ).addClass('ezcca-collapsed'); *}
            {* }); *}
        {* } *}
    {* }); *}
    {* // Collapse by default *}
    {* $('fieldset.ezcca-collapsible').addClass('ezcca-collapsed').find('div.ezcca-collapsible-fieldset-content').hide(); *}
{* }); *}

{* {/literal} *}
{* --> *}
{* </script> *}
{* [> /if <] *}
{* {/run-once} *}

{/default}
