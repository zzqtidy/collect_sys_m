package org.zzq.csm.dao.cms;

import org.zzq.csm.entity.cms.CmsArticle;
import java.util.List;

public interface CmsArticleMapper {
    CmsArticle selectByid(int id);
    List<CmsArticle> selectAll();
    void insertCmsArticle(CmsArticle cmsArticle);
    void updateCmsArticle(CmsArticle cmsArticle);
    void deleteCmsArticle(int id);
}