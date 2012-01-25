<div class="container">

    <div class="hero-unit">
        <div class="row">
        <h2>{"Activate account"|i18n("design/ezwebin/user/activate")}</h2>
            <div class="alert-message warning">
                <p>
                {if $account_activated}
                    {if $is_pending}
                        {'Your email address has been confirmed. An administrator needs to approve your sign up request, before your login becomes valid.'|i18n('design/standard/user')}
                    {else}
                        {'Your account is now activated.'|i18n('design/standard/user')}
                    {/if}
                {elseif $already_active}
                    {'Your account is already active.'|i18n('design/standard/user')}
                {else}
                    {'Sorry, the key submitted was not a valid key. Account was not activated.'|i18n('design/standard/user')}
                {/if}
                </p>
            </div>

            <form class="form-stacked" action={"/user/login"|ezurl} method="post">
                <input class="btn" type="submit" value="{'OK'|i18n( 'design/ezwebin/user/activate' )}" />
            </form>

        </div>
    </div>
</div>