package org.zzq.csm.dao.cms;

import org.zzq.csm.entity.cms.CmsCodes;

import java.util.List;

public interface CmsCodesMapper {
    CmsCodes selectByid(int id);
    List<CmsCodes> selectAll();
    void insertCmsCodes(CmsCodes cmsCodes);
    void updateCmsCodes(CmsCodes cmsCodes);
    void deleteCmsCodes(int id);
}