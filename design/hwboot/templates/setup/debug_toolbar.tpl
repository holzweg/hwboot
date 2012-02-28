{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<div class="well alert">

<div class="element">
<h3>Clear cache:</h3>
{include uri='design:setup/clear_cache.tpl'}
</div>

<div class="element">
<h3>Quick settings:</h3>
{let siteaccess=is_set( $access_type )|choose( '', $access_type.name )
     select_siteaccess=false}
{include uri='design:setup/quick_settings.tpl'}
{/let}
</div>
<div class="break"></div>

</div>
