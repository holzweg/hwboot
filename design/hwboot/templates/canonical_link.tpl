{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{if $pagedata.canonical_url}
    {* Multiple locations, pointing Search Engines to the original *}
    <link rel="canonical" href="{$pagedata.canonical_url|ezurl('no','full')}" />
{elseif $pagedata.canonical_language_url}
    {* Language url, generated with LanguageSwitcherClass *}
    <link rel="canonical" href="{$pagedata.canonical_language_url|wash}" />
{/if}
