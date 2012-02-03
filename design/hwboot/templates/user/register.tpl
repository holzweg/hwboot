<div class="container">
    <div class="hero-unit">
        <div class="row">
            <form class="well"  enctype="multipart/form-data"  action={"/user/register/"|ezurl} method="post" name="Register">

            <h2>{"Register user"|i18n("design/ezwebin/user/register")}</h2>

            {if and( and( is_set( $checkErrNodeId ), $checkErrNodeId ), eq( $checkErrNodeId, true() ) )}
                <div class="alert-message error">
                    <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {$errMsg}</h2>
                </div>
            {/if}

            {if $validation.processed}

                {if $validation.attributes|count|gt(0)}
            <div class="alert-message warning">
                    <h2>{"Input did not validate"|i18n("design/ezwebin/user/register")}</h2>
                    <ul>
                    {foreach $validation.attributes as $attribute}
                        <li>{$attribute.name}: {$attribute.description}</li>
                    {/foreach}
                    </ul>
            </div>
                {else}
                    <div class="alert-message success">
                    <h2>{"Input was stored successfully"|i18n("design/ezwebin/user/register")}</h2>
                    </div>
                {/if}

            {/if}

            {if count($content_attributes)|gt(0)}
                {foreach $content_attributes as $attribute}
                <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
                <div class="clearfix">
                    <label for="xlInput">{$attribute.contentclass_attribute.name}</label>
                    {attribute_edit_gui attribute=$attribute}
                </div>
                {/foreach}

                <div class="clearfix">
                     <input class="btn" type="hidden" name="UserID" value="{$content_attributes[0].contentobject_id}" />
                {if and( is_set( $checkErrNodeId ), $checkErrNodeId )|not()}
                    <input class="btn" type="submit" id="PublishButton" name="PublishButton" value="{'Register'|i18n('design/ezwebin/user/register')}" onclick="window.setTimeout( disableButtons, 1 ); return true;" />
                {else}    
                       <input class="btn" type="submit" id="PublishButton" name="PublishButton" disabled="disabled" value="{'Register'|i18n('design/ezwebin/user/register')}" onclick="window.setTimeout( disableButtons, 1 ); return true;" />
                {/if}
                <input class="btn" type="submit" id="CancelButton" name="CancelButton" value="{'Discard'|i18n('design/ezwebin/user/register')}" onclick="window.setTimeout( disableButtons, 1 ); return true;" />
                </div>
            {else}

                     <h2><span class="label warning">{"Unable to register new user"|i18n("design/ezwebin/user/register")}</span></h2>

                <input class="btn" type="submit" id="CancelButton" name="CancelButton" value="{'Back'|i18n('design/ezwebin/user/register')}" onclick="window.setTimeout( disableButtons, 1 ); return true;" />
            {/if}
            </form>
        </div>
    </div>
</div>

{literal}
<script type="text/javascript">
<!--
    function disableButtons()
    {
        document.getElementById( 'PublishButton' ).disabled = true;
        document.getElementById( 'CancelButton' ).disabled = true;
    }
-->
</script>
{/literal}
