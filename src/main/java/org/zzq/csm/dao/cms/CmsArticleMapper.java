package org.zzq.csm.dao.cms;

import org.zzq.csm.entity.cms.CmsArticle;
import java.util.List;

public interface CmsArticleMapper {
    CmsArticle selectByid(int id);
    List<CmsArticle> selectAll();
    CmsArticle insertCmsArticle(CmsArticle cmsArticle);
    CmsArticle updateCmsArticle(CmsArticle cmsArticle);
    CmsArticle deleteCmsArticle(int id);
}