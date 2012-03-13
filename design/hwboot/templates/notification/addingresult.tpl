{def $node=fetch( content, node, hash( node_id, $node_id) )}
<div class="hero-unit">

    {if $already_exists}
        <div class="alert alert-warning fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            <p><strong>{"Notification for node <%node_name> already exists."
            |i18n( 'design/ezwebin/notification/addingresult',,
                   hash( '%node_name', $node.name ) )|wash}</strong></h2>
            <form class="well"  method="post" action={$redirect_url|ezurl}>
                <input class="btn btn-primary" type="submit" name="OK" value="{'OK'|i18n('design/ezwebin/notification/addingresult')}" />
            </form>
        </div>
    {else}
        <div class="alert alert-success fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            <p><strong>{"Notification for node <%node_name> was added successfully."
            |i18n( 'design/ezwebin/notification/addingresult',,
                   hash( '%node_name', $node.name ) )|wash}</strong></h2>
            <form class="well"  method="post" action={$redirect_url|ezurl}>
                <input class="btn btn-primary" type="submit" name="OK" value="{'OK'|i18n('design/ezwebin/notification/addingresult')}" />
            </form>
        </div>
    {/if}

</div>
