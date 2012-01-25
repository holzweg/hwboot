<div class="container">

    <form class="form-stacked" action={concat($module.functions.edit.uri,"/",$userID)|ezurl} method="post" name="Edit">

        <div class="hero-unit">

            <div class="row">
                <div class="span-one-third">
                      <h2>{"User profile"|i18n("design/ezwebin/user/edit")}</h2>

                      <label>{"Username"|i18n("design/ezwebin/user/edit")}</label>
                      <p>{$userAccount.login|wash}</p>

                      <label>{"Email"|i18n("design/ezwebin/user/edit")}</label>
                      <p>{$userAccount.email|wash}</p>

                      <label>{"Name"|i18n("design/ezwebin/user/edit")}</label>
                      <p>{$userAccount.contentobject.name|wash}</p>


                        {if fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                                  'function', 'edit' ) )}
                        <p><a href={"content/draft"|ezurl}>{"My drafts"|i18n("design/ezwebin/user/edit")}</a></p>
                        {/if}
                        {if fetch( 'user', 'has_access_to', hash( 'module', 'shop',
                                                                  'function', 'administrate' ) )}
                        <p><a href={concat("/shop/customerorderview/", $userID, "/", $userAccount.email)|ezurl}>{"My orders"|i18n("design/ezwebin/user/edit")}</a></p>
                        {/if}
                        {if fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                                  'function', 'pendinglist' ) )}
                        <p><a href={"/content/pendinglist"|ezurl}>{"My pending items"|i18n("design/ezwebin/user/edit")}</a></p>
                        {/if}
                        {if fetch( 'user', 'has_access_to', hash( 'module', 'notification',
                                                                  'function', 'use' ) )}
                        <p><a href={"notification/settings"|ezurl}>{"My notification settings"|i18n("design/ezwebin/user/edit")}</a></p>
                        {/if}
                        {if fetch( 'user', 'has_access_to', hash( 'module', 'shop',
                                                                  'function', 'buy' ) )}
                        <p><a href={"/shop/wishlist"|ezurl}>{"My wish list"|i18n("design/ezwebin/user/edit")}</a></p>
                        {/if}


                        <input class="btn" type="submit" name="EditButton" value="{'Edit profile'|i18n('design/ezwebin/user/edit')}" />
                        <input class="btn" type="submit" name="ChangePasswordButton" value="{'Change password'|i18n('design/ezwebin/user/edit')}" />

                </div>
            </div>
        </div>
    </form>


</div>