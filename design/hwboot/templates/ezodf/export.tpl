{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<div class="container">
    <div class="hero-unit">

<form class="well"  enctype="multipart/form-data" method="post" action={"/ezodf/export"|ezurl}>

<div class="page-header">
    <h2>{"OpenOffice.org export"|i18n("design/ezwebin/ezodf/export")}</h2>
</div>

<div class="object-right">
<img src={"ooo_logo.gif"|ezimage} alt="OpenOffice.org" />
</div>

<h2>{"Export eZ publish content to OpenOffice.org"|i18n("design/ezwebin/ezodf/export")}</h2>

{section show=$error_string}
   <h3>{"Error"|i18n("design/ezwebin/ezodf/export")}: {$error_string}</h3>
{/section}

<p>
{"Here you can export any eZ publish content object to an OpenOffice.org Writer document format."|i18n("design/ezwebin/ezodf/export")}
</p>

<div class="clearfix">
    <input class="btn" type="submit" name="ExportButton" value="{'Export Object'|i18n('design/ezwebin/ezodf/export')}" />
</div>

</form>

</div>
</div>
