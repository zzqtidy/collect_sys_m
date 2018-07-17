package org.zzq.csm.service.cms.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zzq.csm.dao.cms.CmsCodesDetailMapper;
import org.zzq.csm.dao.cms.CmsCodesMapper;
import org.zzq.csm.entity.cms.CmsCodes;
import org.zzq.csm.entity.cms.CmsCodesDetail;
import org.zzq.csm.service.cms.CmsCodesDetailService;
import org.zzq.csm.service.cms.CmsCodesService;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-17
 */
@Service
public class CmsCodesDetailServiceImpl implements CmsCodesDetailService {
    @Autowired
    private CmsCodesDetailMapper cmsCodesDetailMapper;

    @Override
    public CmsCodesDetail selectByid(int id) throws Exception {
        return cmsCodesDetailMapper.selectByid(id);
    }

    @Override
    public List<CmsCodesDetail> selectAll() throws Exception {
        return cmsCodesDetailMapper.selectAll();
    }

    @Override
    public void insertCmsCodesDetail(CmsCodesDetail cmsCodesDetail) throws Exception {
        cmsCodesDetailMapper.insertCmsCodesDetail(cmsCodesDetail);
    }

    @Override
    public void updateCmsCodesDetail(CmsCodesDetail cmsCodesDetail) throws Exception {
        cmsCodesDetailMapper.updateCmsCodesDetail(cmsCodesDetail);
    }

    @Override
    public void deleteCmsCodesDetail(int id) throws Exception {
        cmsCodesDetailMapper.deleteCmsCodesDetail(id);
    }
}
