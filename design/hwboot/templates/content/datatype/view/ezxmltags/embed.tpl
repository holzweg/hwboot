{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* <div class="{if $object_parameters.align}object-{$object_parameters.align}{/if}{if ne($classification|trim,'')} {$classification|wash}{/if}"{if is_set($object_parameters.id)} id="{$object_parameters.id}"{/if}> *}
{content_view_gui view=$view link_parameters=$link_parameters object_parameters=$object_parameters content_object=$object classification=$classification}
{* </div> *}
