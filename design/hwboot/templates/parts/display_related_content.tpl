{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

<div class="attribute-relatedcontent">
    <h2>{"Related content"|i18n("design/ezwebin/full/article")}</h2>
    <ul>
    {foreach $related_content|reverse() as $related_object max 7}
        <li><a href="{$related_object.url_alias|ezurl( 'no' )}" title="{$related_object.name|wash()}">{$related_object.name|wash()}</a></li>
    {/foreach}
    </ul>
</div>
