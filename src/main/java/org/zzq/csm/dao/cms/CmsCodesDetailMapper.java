package org.zzq.csm.dao.cms;

import org.zzq.csm.entity.cms.CmsCodesDetail;

import java.util.List;

public interface CmsCodesDetailMapper {
    CmsCodesDetail selectByid(int id);
    List<CmsCodesDetail> selectAll();
    void insertCmsCodesDetail(CmsCodesDetail cmsCodesDetail);
    void updateCmsCodesDetail(CmsCodesDetail cmsCodesDetail);
    void deleteCmsCodesDetail(int id);
}