 {section show=$validation.processed}
    {section show=or($validation.attributes,$validation.placement,$validation.custom_rules)}

      <div class="alert alert-error fade in">
          <a class="close" data-dismiss="alert" href="#">&times;</a>
          {if or(and($validation.attributes,$validation.placement),$validation.custom_rules)}
            {"Validation failed"|i18n("design/standard/content/edit")}
          {else}
            {if $validation.attributes}
            {"Input did not validate"|i18n("design/standard/content/edit")}
            {else}
            {"Location did not validate"|i18n("design/standard/content/edit")}
            {/if}
          {/if}
          <ul>
          {section name=UnvalidatedPlacements loop=$validation.placement show=$validation.placement}
            <li>{$:item.text}</li>
          {/section}
          {section name=UnvalidatedAttributes loop=$validation.attributes show=$validation.attributes}
            <li>{$:item.name|wash}: {$:item.description}</li>
          {/section}
          {section name=UnvalidatedCustomRules loop=$validation.custom_rules show=$validation.custom_rules}
            <li>{$:item.text}</li>
          {/section}
          </ul>
      </div>

    {section-else}
  {section show=$validation_log}
  <div class="alert fade in">
      <a class="close" data-dismiss="alert" href="#">&times;</a>
      {"Input was partially stored"|i18n("design/standard/content/edit")}
      {section name=ValidationLog loop=$validation_log}
              <h4>{$:item.name|wash}:</h4>
          <ul>
          {section name=LogMessage loop=$:item.description}
              <li>{$:item}</li>
          {/section}
              </ul>
          {/section}
      </div>
  {section-else}
  <div class="alert alert-success fade in">
      <a class="close" data-dismiss="alert" href="#">&times;</a>
      {"Input was stored successfully"|i18n("design/standard/content/edit")}
  </div>
  {/section}
    {/section}
{/section}
