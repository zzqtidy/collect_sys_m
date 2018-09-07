package org.zzq.csm.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.zzq.csm.service.cms.code.CmsCodesDetailService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-08-03
 * Time: 22:58
 */
@Controller
public class ComboBoxController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private final String EMPTY_CODE="-1";
    private final String EMPTY_VALUE="无数据";
    @Autowired
    private CmsCodesDetailService cmsCodesDetailService;

    @RequestMapping(value = "common/comboboxinfo/getcodesdetailmap", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<Map<String,String>> getCodesDetailList(String typename,String emptyCode,String emptyValue) throws Exception {
        return cmsCodesDetailService.selectByTypenameMap(typename,emptyCode,emptyValue);
    }

    @RequestMapping(value = "common/comboboxinfo/getcodesdetailmaps", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public Map<String,List<Map<String,String>>> getCodesDetailLists(@RequestParam(value = "typenames[]")String []typenames) throws Exception {

        return cmsCodesDetailService.selectByArrayTypenames(typenames,EMPTY_CODE,EMPTY_VALUE);
    }

}
