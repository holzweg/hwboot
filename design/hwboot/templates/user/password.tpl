<div class="container">
    <div class="hero-unit">
        <div class="row">
<form class="well"  action={concat($module.functions.password.uri,"/",$userID)|ezurl} method="post" name="Password">

<h2>{"Change password for user"|i18n("design/ezwebin/user/password")} {$userAccount.login}</h2>


{if $message}
{if or( $oldPasswordNotValid, $newPasswordNotMatch, $newPasswordTooShort )}
    {if $oldPasswordNotValid}
        <div class="alert">
            <h2>{'Please retype your old password.'|i18n('design/ezwebin/user/password')}</h2>
        </div>
    {/if}
    {if $newPasswordNotMatch}
        <div class="alert">
            <h2>{"Password didn't match, please retype your new password."|i18n('design/ezwebin/user/password')}</h2>
        </div>
    {/if}
    {if $newPasswordTooShort}
        <div class="alert">
            <h2>{"The new password must be at least %1 characters long, please retype your new password."|i18n( 'design/ezwebin/user/password','',array( ezini('UserSettings','MinPasswordLength') ) )}</h2>
        </div>
    {/if}

    {else}
        <div class="alert alert-info">
            <h2>{'Password successfully updated.'|i18n('design/ezwebin/user/password')}</h2>
        </div>
    {/if}

    {/if}

        <div class="clearfix">
        {if $oldPasswordNotValid}*{/if}
        <label>{"Old password"|i18n("design/ezwebin/user/password")}</label>
        <input class="halfbox" type="password" name="oldPassword" size="11" value="{$oldPassword|wash}" />
        </div>


        <div class="clearfix">
        {if $newPasswordNotMatch}*{/if}
        <label>{"New password"|i18n("design/ezwebin/user/password")}</label>
        <input class="halfbox" type="password" name="newPassword" size="11" value="{$newPassword|wash}" />
        </div>
        <div class="clearfix">
        {if $newPasswordNotMatch}*{/if}
        <label>{"Retype password"|i18n("design/ezwebin/user/password")}</label>
        <input class="halfbox" type="password" name="confirmPassword" size="11" value="{$confirmPassword|wash}" />
        </div>


        <div class="clearfix">
        <input class="btn" type="submit" name="OKButton" value="{'OK'|i18n('design/ezwebin/user/password')}" />
        <input class="btn" type="submit" name="CancelButton" value="{'Cancel'|i18n('design/ezwebin/user/password')}" />
        </div>

        </form>
       </div>
    </div>
</div>
