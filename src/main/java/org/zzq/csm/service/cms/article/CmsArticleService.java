package org.zzq.csm.service.cms.article;

import org.zzq.csm.entity.cms.article.CmsArticle;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-04
 */
public interface CmsArticleService {
    public CmsArticle selectByid(int id) throws Exception;
    public List<CmsArticle> selectAll() throws Exception;
    public List<Map<String,Object>> selectAllHashMap() throws Exception;
    public void insertCmsArticle(CmsArticle cmsArticle) throws Exception;
    public void updateCmsArticle(CmsArticle cmsArticle) throws Exception;
    public void deleteCmsArticle(int id) throws Exception;
}
