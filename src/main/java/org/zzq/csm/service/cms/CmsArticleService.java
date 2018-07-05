package org.zzq.csm.service.cms;

import org.zzq.csm.entity.cms.CmsArticle;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-04
 */
public interface CmsArticleService {
    public CmsArticle selectByid(int id) throws Exception;
    public List<CmsArticle> selectAll() throws Exception;
    public CmsArticle insertCmsArticle(CmsArticle cmsArticle) throws Exception;
    public CmsArticle updateCmsArticle(CmsArticle cmsArticle) throws Exception;
    public CmsArticle deleteCmsArticle(int id) throws Exception;
}
