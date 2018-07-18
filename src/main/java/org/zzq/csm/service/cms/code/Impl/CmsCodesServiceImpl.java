package org.zzq.csm.service.cms.code.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zzq.csm.dao.cms.code.CmsCodesMapper;
import org.zzq.csm.entity.cms.code.CmsCodes;
import org.zzq.csm.service.cms.code.CmsCodesService;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-17
 */
@Service
public class CmsCodesServiceImpl implements CmsCodesService {
    @Autowired
    private CmsCodesMapper cmsCodesMapper;

    @Override
    public CmsCodes selectByid(int id) throws Exception {
        return cmsCodesMapper.selectByid(id);
    }

    @Override
    public List<CmsCodes> selectAll() throws Exception {
        return cmsCodesMapper.selectAll();
    }

    @Override
    public void insertCmsCodes(CmsCodes cmsCodes) throws Exception {
        cmsCodesMapper.insertCmsCodes(cmsCodes);
    }

    @Override
    public void updateCmsCodes(CmsCodes cmsCodes) throws Exception {
        cmsCodesMapper.updateCmsCodes(cmsCodes);
    }

    @Override
    public void deleteCmsCodes(int id) throws Exception {
        cmsCodesMapper.deleteCmsCodes(id);
    }
}
