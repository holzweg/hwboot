{**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 *}

{* Windows media - Full view *}

<div class="content">
    <div class="hero-unit">

    <div class="page-header">
    <h2>{$node.name|wash()}</h2>
    </div>

    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.description}
    </div>

    <div class="content-media">
    {def $attribute=$node.data_map.file}
        <object ID="MediaPlayer"  CLASSID="CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6" STANDBY="Loading Windows Media Player components..." type="application/x-oleobject"
                {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section} {section show=$attribute.content.width|gt( 0 )}height="{$attribute.content.height}"{/section}>
        <param name="filename" value={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl} />
        <param name="autostart" value="{$attribute.content.is_autoplay}" />
        <param name="showcontrols" value="{$attribute.content.has_controller}" />
        <embed src={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl}
               type="application/x-mplayer2" pluginspage="{$attribute.content.pluginspage}"
               {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section} {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section} autostart="{$attribute.content.is_autoplay}"
               showcontrols="{$attribute.content.has_controller}" >
        </embed>
        </object>
    </div>

    </div>
</div>
