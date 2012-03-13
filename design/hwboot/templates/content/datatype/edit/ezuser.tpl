{default attribute_base=ContentObjectAttribute}

{* User ID. *}
<div class="control-group">
    <label>{'User ID'|i18n( 'design/standard/content/datatype' )} </label>
    <div class="controls noinput">
        {$attribute.content.contentobject_id}
    </div>
</div>

{if ne( $attribute_base, 'ContentObjectAttribute' )}
    {def $id_base = concat( 'ezcoa-', $attribute_base, '-', $attribute.contentclassattribute_id, '_', $attribute.contentclass_attribute_identifier )}
{else}
    {def $id_base = concat( 'ezcoa-', $attribute.contentclassattribute_id, '_', $attribute.contentclass_attribute_identifier )}
{/if}


{* Username. *}

    <div class="control-group">
        <label for="{$id_base}_login">
            {'Username'|i18n( 'design/standard/content/datatype' )}
        </label>
        {if $attribute.content.has_stored_login}
            <div class="controls"><input id="{$id_base}_login" type="text" name="{$attribute_base}_data_user_login_{$attribute.id}_stored_login" size="16" value="{$attribute.content.login}" disabled="disabled" /></div>
            <input id="{$id_base}_login_hidden" type="hidden" name="{$attribute_base}_data_user_login_{$attribute.id}" value="{$attribute.content.login}" />
        {else}
            <div class="controls"><input id="{$id_base}_login" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_user_login_{$attribute.id}" size="16" value="{$attribute.content.login}" /></div>
        {/if}
    </div>

{* Password #1. *}

    <div class="control-group">
        <label for="{$id_base}_password">
            {'Password'|i18n( 'design/standard/content/datatype' )}
        </label>
        <div class="controls"><input id="{$id_base}_password" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="password" name="{$attribute_base}_data_user_password_{$attribute.id}" size="16" value="{if $attribute.content.original_password}{$attribute.content.original_password}{else}{if $attribute.content.has_stored_login}_ezpassword{/if}{/if}" /></div>
    </div>

{* Password #2. *}

{debug-log var=$attribute}
    <div class="control-group">
        <label for="{$id_base}_password_confirm">
            {'Confirm password'|i18n( 'design/standard/content/datatype' )}
        </label>
        <div class="controls"><input id="{$id_base}_password_confirm" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="password" name="{$attribute_base}_data_user_password_confirm_{$attribute.id}" size="16" value="{if $attribute.content.original_password_confirm}{$attribute.content.original_password_confirm}{else}{if $attribute.content.has_stored_login}_ezpassword{/if}{/if}" /></div>
    </div>

{* Email. *}

    <div class="control-group">
        <label for="{$id_base}_email">
            {'Email'|i18n( 'design/standard/content/datatype' )}
        </label>
        <div class="controls"><input id="{$id_base}_email" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="email" name="{$attribute_base}_data_user_email_{$attribute.id}" size="28" value="{$attribute.content.email|wash( xhtml )}" /></div>
    </div>

{* Email #2. Require e-mail confirmation *}
{if ezini( 'UserSettings', 'RequireConfirmEmail' )|eq( 'true' )}

    <div class="control-group">
        <label for="{$id_base}_email_confirm">
            {'Confirm email'|i18n( 'design/standard/content/datatype' )}
        </label>
        <div class="controls"><input id="{$id_base}_email_confirm" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="email" name="{$attribute_base}_data_user_email_confirm_{$attribute.id}" size="28" value="{cond( ezhttp_hasvariable( concat( $attribute_base, '_data_user_email_confirm_', $attribute.id ), 'post' ), ezhttp( concat( $attribute_base, '_data_user_email_confirm_', $attribute.id ), 'post')|wash( xhtml ), $attribute.content.email )}" /></div>
    </div>
{/if}


{* Status *}

    <div class="control-group">
        <label>
            {'Current account status'|i19n( 'design/standard/content/datatype' )}
        </label>
        <div class="controls noinput">
            {if $attribute.content.is_enabled}
                <span class="userstatus-enabled">{'enabled'|i18n( 'design/standard/content/datatype' )}</span>
            {else}
                <span class="userstatus-disabled"> {'disabled'|i18n( 'design/standard/content/datatype' )}</span>
            {/if}
        </div>
    </div>

{/default}
