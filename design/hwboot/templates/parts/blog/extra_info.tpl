                        <div class="attribute-tag-cloud well">
                        <p>
                            {eztagcloud( hash( 'class_identifier', 'blog_post',
                                               'parent_node_id', $used_node.node_id ) )}
                        </p>
                        </div>

                    {if is_set( $used_node.object.data_map.description}
                        <div class="attribute-description well">
                            {attribute_view_gui attribute=$used_node.object.data_map.description}
                        </div>
                    {/if}

                        <div class="attribute-tags well">
                            <h2>{"Tags"|i18n("design/ezwebin/blog/extra_info")}</h2>
                            <ul class="unstyled">
                            {foreach ezkeywordlist( 'blog_post', $used_node.node_id ) as $keyword}
                                <li><a class="btn btn-small btn-info" href={concat( $used_node.url_alias, "/(tag)/", $keyword.keyword|rawurlencode )|ezurl} title="{$keyword.keyword}"><i class="icon-tags icon-white"></i> {$keyword.keyword} ({fetch( 'content', 'keyword_count', hash( 'alphabet', $keyword.keyword, 'classid', 'blog_post','parent_node_id', $used_node.node_id ) )})</a></li>
                            {/foreach}
                            </ul>
                        </div>

                        <div class="attribute-archive well">
                            <h2>{"Archive"|i18n("design/ezwebin/blog/extra_info")}</h2>
                            <ul class="nav navlist">
                            {foreach ezarchive( 'blog_post', $used_node.node_id ) as $archive}
                                <li><a href={concat( $used_node.url_alias, "/(month)/", $archive.month, "/(year)/", $archive.year )|ezurl} title=""><i class="icon-folder-open"></i> {$archive.timestamp|datetime( 'custom', '%F %Y' )}</a></li>
                            {/foreach}
                            </ul>
                        </div>

                        {include uri='design:parts/blog/calendar.tpl'}
