package org.zzq.csm.service.cms.code;

import org.zzq.csm.entity.cms.code.CmsCodesDetail;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-17
 */
public interface CmsCodesDetailService {
    CmsCodesDetail selectByid(int id) throws Exception;
    List<CmsCodesDetail> selectByTypename(String typename) throws Exception;
    Map<String,List<Map<String,String>>> selectByArrayTypenames(String []typenames,String emptyCode,String emptyValue) throws Exception;
    List<Map<String,Object>> selectByTypenameMap(String typename) throws Exception;
    List<Map<String,String>> selectByTypenameMap(String typename,String emptyCode,String emptyValue) throws Exception;
    List<CmsCodesDetail> selectAll() throws Exception;
    void insertCmsCodesDetail(CmsCodesDetail cmsCodesDetail) throws Exception;
    void updateCmsCodesDetail(CmsCodesDetail cmsCodesDetail) throws Exception;
    void deleteCmsCodesDetail(int id) throws Exception;
    void deleteCmsCodesDetailByCode(String code) throws Exception;
    void deleteCmsCodesDetailByTypename(String typename) throws Exception;
}
