package org.zzq.csm.dao.cms.article;

import org.zzq.csm.entity.cms.article.CmsArticle;
import java.util.List;
import java.util.Map;

public interface CmsArticleMapper {
    CmsArticle selectByid(int id);
    List<CmsArticle> selectAll();
    List<Map<String,Object>> selectAllHashMap();
    void insertCmsArticle(CmsArticle cmsArticle);
    void updateCmsArticle(CmsArticle cmsArticle);
    void deleteCmsArticle(int id);
}