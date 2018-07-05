package org.zzq.csm.service.cms.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zzq.csm.dao.cms.CmsArticleMapper;
import org.zzq.csm.entity.cms.CmsArticle;
import org.zzq.csm.service.cms.CmsArticleService;

import java.util.List;

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
    public CmsArticle insertCmsArticle(CmsArticle cmsArticle) throws Exception {
        return cmsArticleMapper.insertCmsArticle(cmsArticle);
    }

    @Override
    public CmsArticle updateCmsArticle(CmsArticle cmsArticle) throws Exception {
        return cmsArticleMapper.updateCmsArticle(cmsArticle);
    }

    @Override
    public CmsArticle deleteCmsArticle(int id) throws Exception {
        return cmsArticleMapper.deleteCmsArticle(id);
    }
}
