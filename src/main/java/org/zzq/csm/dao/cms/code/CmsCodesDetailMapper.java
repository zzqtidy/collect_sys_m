package org.zzq.csm.dao.cms.code;

import org.zzq.csm.entity.cms.code.CmsCodesDetail;

import java.util.List;
import java.util.Map;

public interface CmsCodesDetailMapper {
    CmsCodesDetail selectByid(int id);
    List<CmsCodesDetail> selectByTypename(String typename);
    List<Map<String,Object>> selectByTypenameMap(String typename);
    List<CmsCodesDetail> selectAll();
    void insertCmsCodesDetail(CmsCodesDetail cmsCodesDetail);
    void updateCmsCodesDetail(CmsCodesDetail cmsCodesDetail);
    void deleteCmsCodesDetail(int id);
    void deleteCmsCodesDetailByCode(String codename);
    void deleteCmsCodesDetailByTypename(String typename);
}