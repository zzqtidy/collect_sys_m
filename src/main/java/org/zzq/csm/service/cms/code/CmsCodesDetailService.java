package org.zzq.csm.service.cms.code;

import org.zzq.csm.entity.cms.code.CmsCodesDetail;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-17
 */
public interface CmsCodesDetailService {
    public CmsCodesDetail selectByid(int id) throws Exception;
    public List<CmsCodesDetail> selectAll() throws Exception;
    public void insertCmsCodesDetail(CmsCodesDetail cmsCodesDetail) throws Exception;
    public void updateCmsCodesDetail(CmsCodesDetail cmsCodesDetail) throws Exception;
    public void deleteCmsCodesDetail(int id) throws Exception;
}
