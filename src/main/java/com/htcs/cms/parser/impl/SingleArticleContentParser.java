package com.htcs.cms.parser.impl;

import com.htcs.cms.entity.ArticleEntity;
import com.mingsoft.parser.IParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SingleArticleContentParser extends IParser {

    /**
     * 查找HTML中栏目列表的正则表达式的开始位置标签 栏目父标签 {ms:channel type=”sun” typeid=””}
     */
    private final static String SAC = "\\{ms:sac.*?/\\}";


    public static final String SAC_TYPEID = "typeid";

    public static final String SAC_LEN = "len";


    public SingleArticleContentParser(String htmlCotent, ArticleEntity articleEntity, int len) {
        // 在HTML模版中标记出要用内容替换的标签

        String articleContent = articleEntity.getArticleContent();
        int al = articleContent.length();
        // 经过遍历后的数组标签
        if (len == 0 || len >= al) {
            super.newCotent = articleContent;
        } else {
            super.newCotent = articleContent.substring(0, len)
                    + "<a id='more' href='/html/1" + articleEntity.getArticleUrl() + "'>查看更多</a>";
        }

        super.htmlCotent = htmlCotent;
    }

    @Override
    public String parse() {
        return this.replaceFirst(SAC);
    }

    // ——————————————————————————————————解析父标签中的属性开始——————————————————————————————————

    /**
     * 获取模版文件中栏目列表的个数
     *
     * @param html 文件模版
     * @return 返回该字符串的个数
     */
    public static int sacNum(String html) {
        int channelNumBegin = count(html, SAC);
        return channelNumBegin;
    }

    /**
     * 定位栏目标签中所有的属性
     */
    private final static String SAC_PROPERTY = "\\{ms:sac(.*)?\\}";

    /**
     * 取出栏目标签中的属性
     *
     * @param html HTML模版
     * @return 属性集合
     */
    public static Map<String, String> sacProperty(String html) {
        Map<String, String> listPropertyMap = new HashMap<String, String>();
        String listProperty = parseFirst(html, SAC_PROPERTY, 1);

        List<String> listPropertyName = parseAll(listProperty, PRORETY_NAME, 1);
        List<String> listPropertyValue = parseAll(listProperty, PROPERTY_VALUE, 1);
        for (int i = 0; i < listPropertyName.size(); i++) {
            listPropertyMap.put(listPropertyName.get(i).toString(), listPropertyValue.get(i).toString());
        }
        return listPropertyMap;
    }
    // ——————————————————————————————————解析父标签中的属性结束——————————————————————————————————

}
