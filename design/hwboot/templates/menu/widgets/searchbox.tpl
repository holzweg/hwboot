<form action={"/content/search"|ezurl} class="pull-right form-search">
    {if $pagedata.is_edit}
        <input id="searchtext" class="input-medium disabled search-query" type="text" name="SearchText" value="" placeholder="{'Search text'|i18n('design/ezwebin/pagelayout')}">
        <button id="searchbutton" class="btn disabled" title="{'Search'|i18n('design/ezwebin/pagelayout')}" type="button">{'Search'|i18n('design/ezwebin/pagelayout')}</button>
    {else}
        <input id="searchtext" class="input-medium search-query" type="text" name="SearchText" value="" placeholder="{'Search text'|i18n('design/ezwebin/pagelayout')}">
        <button id="searchbutton" class="btn" title="{'Search'|i18n('design/ezwebin/pagelayout')}" type="submit">{'Search'|i18n('design/ezwebin/pagelayout')}</button>
        {if eq( $ui_context, 'browse' )}<input name="Mode" type="hidden" value="browse" />{/if}
    {/if}
</form>

<!--
  <form  action={"/content/search"|ezurl}>
    {if $pagedata.is_edit}
        <input id="searchtext" class="search-query" name="SearchText" type="text" value="" size="12" disabled="disabled" />
        <input id="searchbutton" class="button-disabled btn" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" title="{'Search'|i18n('design/ezwebin/pagelayout')}" disabled="disabled" />
    {else}
        <input id="searchtext" class="search-query" name="SearchText" type="text" value="" size="12" />
        <input id="searchbutton" class="button btn" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" title="{'Search'|i18n('design/ezwebin/pagelayout')}" />

    {/if}
  </form>-->