package org.zzq.csm.service.cms.code.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zzq.csm.dao.cms.code.CmsCodesDetailMapper;
import org.zzq.csm.entity.cms.code.CmsCodesDetail;
import org.zzq.csm.service.cms.code.CmsCodesDetailService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public List<CmsCodesDetail> selectByTypename(String typename) throws Exception {
        return cmsCodesDetailMapper.selectByTypename(typename);
    }
    public List<Map<String,Object>> selectByTypenameMap(String typename) throws Exception{
        return cmsCodesDetailMapper.selectByTypenameMap(typename);
    }
    @Override
    public Map<String,List<Map<String,String>>> selectByArrayTypenames(String []typenames,String emptyCode,String emptyValue) throws Exception{
        Map<String,List<Map<String,String>>> maps = new HashMap<String,List<Map<String,String>>>();
        for(String typename:typenames){
            List<Map<String,String>> mapList = new ArrayList<Map<String,String>>();
            mapList=selectByTypenameMap(typename,emptyCode,emptyValue);
            maps.put(typename,mapList);
        }
        return maps;
    }

    @Override
    public List<Map<String,String>> selectByTypenameMap(String typename,String emptyCode,String emptyValue) throws Exception{
        List<CmsCodesDetail> cmsCodesDetails = cmsCodesDetailMapper.selectByTypename(typename);
        List<Map<String,String>> mapList = new ArrayList<Map<String,String>>();
        if(emptyCode!=null&&!"".equals(emptyCode)){
            Map<String,String> map = new HashMap<String,String>();
            map.put("code",emptyCode);
            map.put("value",emptyValue);
        }
        for (CmsCodesDetail cmsCodesDetail:cmsCodesDetails) {
            Map<String,String> map = new HashMap<String,String>();
            map.put("code",cmsCodesDetail.getCodename());
            map.put("value",cmsCodesDetail.getDescription());
            mapList.add(map);
        }
        return mapList;
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
    @Override
    public void deleteCmsCodesDetailByCode(String code) throws Exception{
        cmsCodesDetailMapper.deleteCmsCodesDetailByCode(code);
    }
    @Override
    public void deleteCmsCodesDetailByTypename(String typename) throws Exception{
        cmsCodesDetailMapper.deleteCmsCodesDetailByTypename(typename);
    }
}
