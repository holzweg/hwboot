<div class="hero-unit">
    <form class="well"  action={concat($module.functions.password.uri,"/",$userID)|ezurl} method="post" name="Password">

    <h2>{"Change password for user"|i18n("design/ezwebin/user/password")} {$userAccount.login}</h2>


    {if $message}
    {if or( $oldPasswordNotValid, $newPasswordNotMatch, $newPasswordTooShort )}
    {if $oldPasswordNotValid}
        <div class="alert alert-error fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            {'Please retype your old password.'|i18n('design/ezwebin/user/password')}
        </div>
    {/if}
    {if $newPasswordNotMatch}
        <div class="alert alert-error fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            {"Password didn't match, please retype your new password."|i18n('design/ezwebin/user/password')}
        </div>
    {/if}
    {if $newPasswordTooShort}
        <div class="alert alert-error fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            {"The new password must be at least %1 characters long, please retype your new password."|i18n( 'design/ezwebin/user/password','',array( ezini('UserSettings','MinPasswordLength') ) )}
        </div>
    {/if}

    {else}
        <div class="alert alert-success fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            {'Password successfully updated.'|i18n('design/ezwebin/user/password')}
        </div>
    {/if}

    {/if}

        <div class="control-group{if $oldPasswordNotValid} error{/if}">
            <label class="control-label">{"Old password"|i18n("design/ezwebin/user/password")}
                <input type="password" name="oldPassword" size="11" value="{$oldPassword|wash}" />
            </label>
        </div>


        <div class="control-group{if $newPasswordNotMatch} error{/if}">
            <label class="control-label">{"New password"|i18n("design/ezwebin/user/password")}
                <input type="password" name="newPassword" size="11" value="{$newPassword|wash}" />
            </label>
        </div>

        <div class="control-group{if $newPasswordNotMatch} error{/if}">
            <label class="control-label">{"Retype password"|i18n("design/ezwebin/user/password")}
                <input type="password" name="confirmPassword" size="11" value="{$confirmPassword|wash}" />
            </label>
        </div>


        <input class="btn btn-primary" type="submit" name="OKButton" value="{'OK'|i18n('design/ezwebin/user/password')}" />
        <input class="btn" type="submit" name="CancelButton" value="{'Cancel'|i18n('design/ezwebin/user/password')}" />

        </form>
</div>
