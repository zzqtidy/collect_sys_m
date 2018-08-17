package org.zzq.csm.service.cms.article.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zzq.csm.dao.cms.article.CmsArticleMapper;
import org.zzq.csm.entity.cms.article.CmsArticle;
import org.zzq.csm.service.cms.article.CmsArticleService;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-04
 */
@Service
public class CmsArticleServiceImpl implements CmsArticleService {
    @Autowired
    private CmsArticleMapper cmsArticleMapper;

    @Override
    public CmsArticle selectByid(int id) throws Exception {
        return cmsArticleMapper.selectByid(id);
    }

    @Override
    public List<CmsArticle> selectAll() throws Exception {
        return cmsArticleMapper.selectAll();
    }

    @Override
    public List<Map<String, Object>> selectAllHashMap() throws Exception {
        return cmsArticleMapper.selectAllHashMap();
    }

    @Override
    public void insertCmsArticle(CmsArticle cmsArticle) throws Exception {
        cmsArticleMapper.insertCmsArticle(cmsArticle);
    }

    @Override
    public void updateCmsArticle(CmsArticle cmsArticle) throws Exception {
        cmsArticleMapper.updateCmsArticle(cmsArticle);
    }

    @Override
    public void deleteCmsArticle(int id) throws Exception {
        cmsArticleMapper.deleteCmsArticle(id);
    }
}
