<div class="container">
    <div class="hero-unit">
            <div class="row">
                 <form class="well"  method="post" action={"/user/login/"|ezurl} name="loginform">

                    <h2>{"Login"|i18n("design/ezwebin/user/login")}</h2>

                    {if $User:warning.bad_login}
                    <div class="alert-message warning">
                    <h2>{"Could not login"|i18n("design/ezwebin/user/login")}</h2>
                    <ul>
                        <li>{"A valid username and password is required to login."|i18n("design/ezwebin/user/login")}</li>
                    </ul>
                    </div>
                    {else}

                    {if $site_access.allowed|not}
                    <div class="alert-message warning">
                    <h2>{"Access not allowed"|i18n("design/ezwebin/user/login")}</h2>
                    <ul>
                        <li>{"You are not allowed to access %1."|i18n("design/ezwebin/user/login",,array($site_access.name))}</li>
                    </ul>
                    </div>
                    {/if}

                    {/if}

                    <div class="clearfix">
                    <label for="xlInput">{"Username"|i18n("design/ezwebin/user/login",'User name')}</label>

                    <input class="xlarge" type="text" size="10" name="Login" id="id1" value="{$User:login|wash}" tabindex="1" />

                    <label for="xlInput">{"Password"|i18n("design/ezwebin/user/login")}</label>

                    <input class="xlarge" type="password" size="10" name="Password" id="id2" value="" tabindex="1" />

                    </div>
                    {if ezini( 'SiteSettings', 'AdditionalLoginFormActionURL' )}
                        <div class="clearfix">
                        <a href="{ezini( 'SiteSettings', 'AdditionalLoginFormActionURL' )}">{"Log in to the eZ Publish Administration Interface"|i18n("design/ezwebin/user/login")}</a>
                        </div>
                    {/if}
                    {if ezini( 'Session', 'RememberMeTimeout' )}
                    <div class="clearfix">
                    <input type="checkbox" tabindex="1" name="Cookie" id="id4" /><label for="id4" style="display:inline;">{"Remember me"|i18n("design/ezwebin/user/login")}</label>
                    </div>
                    {/if}

                    <div class="clearfix">
                    <input class="btn" type="submit" name="LoginButton" value="{'Login'|i18n('design/ezwebin/user/login','Button')}" tabindex="1" />
                    {if ezmodule( 'user/register' )}
                        <input class="btn" type="submit" name="RegisterButton" id="RegisterButton" value="{'Sign up'|i18n('design/ezwebin/user/login','Button')}" tabindex="1" />
                    {/if}
                    </div>

                    {if ezini( 'SiteSettings', 'LoginPage' )|eq( 'custom' )}
                        <p><a href={'/user/forgotpassword'|ezurl}>{'Forgot your password?'|i18n( 'design/ezwebin/user/login' )}</a></p>
                    {/if}

                    <input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />

                    {if and( is_set( $User:post_data ), is_array( $User:post_data ) )}
                      {foreach $User:post_data as $key => $postData}
                         <input name="Last_{$key}" value="{$postData}" type="hidden" /><br/>
                      {/foreach}
                    {/if}

             </form>
        </div>
    </div>

</div>
