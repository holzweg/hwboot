{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<div class="hero-unit">

    <form class="well"  action={concat($module.functions.edit.uri,"/",$userID)|ezurl} method="post" name="Edit">


          <h2>{"User profile"|i18n("design/ezwebin/user/edit")}</h2>

          <label>{"Username"|i18n("design/ezwebin/user/edit")}</label>
          <p>{$userAccount.login|wash}</p>

          <label>{"Email"|i18n("design/ezwebin/user/edit")}</label>
          <p>{$userAccount.email|wash}</p>

          <label>{"Name"|i18n("design/ezwebin/user/edit")}</label>
          <p>{$userAccount.contentobject.name|wash}</p>


            {if fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                      'function', 'edit' ) )}
            <p><a class="btn btn-info" href={"content/draft"|ezurl}><i class="icon-user icon-white"></i> {"My drafts"|i18n("design/ezwebin/user/edit")}</a></p>
            {/if}
            {if fetch( 'user', 'has_access_to', hash( 'module', 'shop',
                                                      'function', 'administrate' ) )}
            <p><a class="btn btn-info" href={concat("/shop/customerorderview/", $userID, "/", $userAccount.email)|ezurl}><i class="icon-user icon-white"></i> {"My orders"|i18n("design/ezwebin/user/edit")}</a></p>
            {/if}
            {if fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                      'function', 'pendinglist' ) )}
            <p><a class="btn btn-info" href={"/content/pendinglist"|ezurl}><i class="icon-user icon-white"></i> {"My pending items"|i18n("design/ezwebin/user/edit")}</a></p>
            {/if}
            {if fetch( 'user', 'has_access_to', hash( 'module', 'notification',
                                                      'function', 'use' ) )}
            <p><a class="btn btn-info" href={"notification/settings"|ezurl}><i class="icon-user icon-white"></i> {"My notification settings"|i18n("design/ezwebin/user/edit")}</a></p>
            {/if}
            {if fetch( 'user', 'has_access_to', hash( 'module', 'shop',
                                                      'function', 'buy' ) )}
            <p><a class="btn btn-info "href={"/shop/wishlist"|ezurl}><i class="icon-user icon-white"></i> {"My wish list"|i18n("design/ezwebin/user/edit")}</a></p>
            {/if}

            <div class="form-actions">
                <input class="btn btn-primary" type="submit" name="EditButton" value="{'Edit profile'|i18n('design/ezwebin/user/edit')}" />
                <input class="btn btn-warning" type="submit" name="ChangePasswordButton" value="{'Change password'|i18n('design/ezwebin/user/edit')}" />
            </div>



    </form>


</div>
