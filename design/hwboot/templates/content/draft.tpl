{ezcss_require( 'bootstrap.css' ) }
<div class="container">

    <div class="hero-unit">
        <div class="row">
<script type="text/javascript">
<!--
{literal}
function checkAll()
{
{/literal}
    if ( document.draftaction.selectall.value == "{'Select all'|i18n('design/ezwebin/content/draft')}" )
{literal}
    {
{/literal}
        document.draftaction.selectall.value = "{'Deselect all'|i18n('design/ezwebin/content/draft')}";
{literal}
        with (document.draftaction) 
    {
            for (var i=0; i < elements.length; i++) 
        {
                if (elements[i].type == 'checkbox' && elements[i].name == 'DeleteIDArray[]')
                     elements[i].checked = true;
        }
        }
     }
     else
     {
{/literal}
         document.draftaction.selectall.value = "{'Select all'|i18n('design/ezwebin/content/draft')}";
{literal}
         with (document.draftaction) 
     {
            for (var i=0; i < elements.length; i++) 
        {
                if (elements[i].type == 'checkbox' && elements[i].name == 'DeleteIDArray[]')
                     elements[i].checked = false;
        }
         }
     }
}
{/literal}
//-->
</script>
{def $page_limit=30
     $list_count=fetch('content','draft_count')}

        <form class="form-stacked" name="draftaction" action={concat("content/draft/")|ezurl} method="post" >

            <h2>{"My drafts"|i18n("design/ezwebin/content/draft")}</h2>


        {if $list_count}


        <input class="btn" type="submit" name="EmptyButton" value="{'Empty draft'|i18n('design/ezwebin/content/draft')}" />


        <p>
            {"These are the current objects you are working on. The drafts are owned by you and can only be seen by you.
              You can either edit the drafts or remove them if you don't need them any more."|i18n("design/ezwebin/content/draft")|nl2br}
        </p>

        <table class="table table-striped table-bordered">

        <tr>
            <th></th>
            <th class="blue">{"Name"|i18n("design/ezwebin/content/draft")}</th>
            <th class="blue">{"Class"|i18n("design/ezwebin/content/draft")}</th>
            <th class="blue">{"Section"|i18n("design/ezwebin/content/draft")}</th>
            <th class="blue">{"Version"|i18n("design/ezwebin/content/draft")}</th>
            <th class="blue">{"Language"|i18n("design/ezwebin/content/draft")}</th>
            <th class="blue">{"Last modified"|i18n("design/ezwebin/content/draft")}</th>
            <th class="blue">{"Edit"|i18n("design/ezwebin/content/draft")}</th>
        </tr>


        {foreach fetch('content', 'draft_version_list', hash( 'limit', $page_limit, 'offset', $view_parameters.offset ) ) as $draft
                 sequence array(bglight,bgdark) as $style}
        <tr class="{$style}">
            <td align="left" width="1">
                <input type="checkbox" name="DeleteIDArray[]" value="{$draft.id}" />
            </td>
            <td>
                <a href={concat("/content/versionview/",$draft.contentobject.id,"/",$draft.version,"/")|ezurl}>{$draft.version_name|wash}</a>
            </td>
            <td>
                {$draft.contentobject.content_class.name|wash}
            </td>
            <td>
                {$draft.contentobject.section_id}
            </td>
            <td>
                {$draft.version}
            </td>
            <td>
                {$draft.initial_language.name|wash}
            </td>
            <td>
                {$draft.modified|l10n(datetime)}
            </td>
            <td width="1">
                <a href={concat("/content/edit/",$draft.contentobject.id,"/",$draft.version,"/")|ezurl}><img src={"edit.gif"|ezimage} alt="{'Edit'|i18n('design/ezwebin/content/draft')}" /></a>
            </td>
        </tr>
        {/foreach}
        <tr class="bgdark">
            <td colspan="1" align="left" width="1">
                <input type="image" name="RemoveButton" value="{'Remove'|i18n('design/ezwebin/content/draft')}" src={"trash.gif"|ezimage} />
            </td>
            <td colspan="7">
            </td>
        </tr>

        </table>
        <input class="btn" name="selectall" onclick=checkAll() type="button" value="{'Select all'|i18n('design/ezwebin/content/draft')}" />
        {include name=navigator
                 uri='design:navigator/google.tpl'
                 page_uri='/content/draft'
                 item_count=$list_count
                 view_parameters=$view_parameters
                 item_limit=$page_limit}

        {else}

        <div class="feedback">
        <h2>{"You have no drafts"|i18n("design/ezwebin/content/draft")}</h2>
        </div>

        {/if}

        </form>
        </div>
    </div>


</div>
