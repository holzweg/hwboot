{def $node=fetch( content, node, hash( node_id, $node_id) )}
<div class="container">

    <div class="hero-unit">

        <h1>
            {'Add to my notifications'|i18n( 'design/ezwebin/notification/addingresult')}
        </h1>


        <p>
        {if $already_exists}
            {"Notification for node <%node_name> already exists."
            |i18n( 'design/ezwebin/notification/addingresult',,
                   hash( '%node_name', $node.name ) )|wash}
        {else}
            {"Notification for node <%node_name> was added successfully."
            |i18n( 'design/ezwebin/notification/addingresult',,
                   hash( '%node_name', $node.name ) )|wash}
        {/if}
        </p>


            <form class="form-stacked" method="post" action={$redirect_url|ezurl}>
                <input class="btn" type="submit" name="OK" value="{'OK'|i18n('design/ezwebin/notification/addingresult')}" />
            </form>


    </div>

</div>