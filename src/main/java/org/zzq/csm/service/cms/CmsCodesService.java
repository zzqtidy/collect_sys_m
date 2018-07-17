package org.zzq.csm.service.cms;

import org.zzq.csm.entity.cms.CmsCodes;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-17
 */
public interface CmsCodesService {
    public CmsCodes selectByid(int id) throws Exception;
    public List<CmsCodes> selectAll() throws Exception;
    public void insertCmsCodes(CmsCodes cmsCodes) throws Exception;
    public void updateCmsCodes(CmsCodes cmsCodes) throws Exception;
    public void deleteCmsCodes(int id) throws Exception;
}
