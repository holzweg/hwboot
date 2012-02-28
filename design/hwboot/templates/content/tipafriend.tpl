{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}


<div class="hero-unit">

<div class="page-header">
    <h2>{"Tip a friend"|i18n("design/ezwebin/content/tipafriend")}</h2>
</div>

{switch name=Sw match=$action}
  {case match="confirm"}
    <div class="alert alert-info">
      <h2>{"The message was sent."|i18n("design/ezwebin/content/tipafriend")}</h2>
      <p><a href={concat("/content/view/full/",$node_id)|ezurl}>{"Click here to return to the original page."|i18n("design/ezwebin/content/tipafriend")}</a></p>
    </div>
  {/case}
  {case match="error"}
    <div class="alert">
      <h2>{"The message was not sent."|i18n("design/ezwebin/content/tipafriend")}</h2>
      <p>{"The message was not sent due to an unknown error. Please notify the site administrator about this error."|i18n("design/ezwebin/content/tipafriend")}</p>
      <p><a href={concat("/content/view/full/",$node_id)|ezurl}>{"Click here to return to the original page."|i18n("design/ezwebin/content/tipafriend")}</a></p>
    </div>
  {/case}
  {case}

{section show=$error_strings}
<div class="alert">
<h2>{"Please correct the following errors:"|i18n("design/ezwebin/content/tipafriend")}:</h2>
{section loop=$error_strings}
<p>{$:item}</p>
{/section}
</div>
{/section}

<form class="well" action={"/content/tipafriend/"|ezurl} method="post">

<div class="control-group">
    <label>{"Your name"|i18n("design/ezwebin/content/tipafriend")}</label><div class="labelbreak"></div>
    <input class="box" type="text" size="40" name="YourName" value="{$your_name|wash}" />
</div>

<div class="control-group">
    <label>{"Your email address"|i18n("design/ezwebin/content/tipafriend")}</label><div class="labelbreak"></div>
    <input class="box" type="text" size="40" name="YourEmail" value="{$your_email|wash}" />
</div>

<div class="control-group">
    <label>{"Recipient's email address"|i18n("design/ezwebin/content/tipafriend")}</label><div class="labelbreak"></div>
    <input class="box" type="text" size="40" name="ReceiversEmail" value="{$receivers_email|wash}" />
</div>

<div class="control-group">
    <label>{"Comment"|i18n("design/ezwebin/content/tipafriend")}</label><div class="labelbreak"></div>
    <textarea class="box" cols="40" rows="10" name="Comment">{$comment|wash}</textarea>
</div>

<div class="form-actions">
    <input class="btn btn-primary" type="submit" name="SendButton" value="{'Send'|i18n('design/ezwebin/content/tipafriend')}" />
    <input class="btn btn-danger" type="submit" name="CancelButton" value="{'Cancel'|i18n('design/ezwebin/content/tipafriend')}" />
</div>

<input type="hidden" name="NodeID" value="{$node_id}" />

</form>

  {/case}
{/switch}

</div>
