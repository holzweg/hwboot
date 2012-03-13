<div class="hero-unit">

    <form class="well"  name="notification" method="post" action={"/notification/settings/"|ezurl}>


        <h2>{'Notification settings'|i18n( 'design/ezwebin/notification/settings' )}</h2>


        {def $handlers=fetch( 'notification', 'handler_list' )}

            {foreach $handlers as $handler}
                {if eq( $handler.id_string, $handlers.ezsubtree.id_string )}
                    {skip}
                {/if}
                {include handler=$handler uri=concat( 'design:notification/handler/', $handler.id_string, '/settings/edit.tpl' )}
            {/foreach}
        
        <br />

        <input class="btn btn-primary" type="submit" name="Store" value="{'Apply changes'|i18n('design/ezwebin/notification/settings')}" />

        <br />

        {include handler=$handlers.ezsubtree view_parameters=$view_parameters uri=concat( 'design:notification/handler/', $handlers.ezsubtree.id_string, '/settings/edit.tpl' )}

    </form>

</div>
