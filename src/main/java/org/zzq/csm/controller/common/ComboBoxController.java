package org.zzq.csm.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zzq.csm.service.cms.code.CmsCodesDetailService;

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
    @Autowired
    private CmsCodesDetailService cmsCodesDetailService;

    @RequestMapping(value = "common/comboboxinfo/getcodesdetailmap", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<Map<String,String>> getCodesDetailList(String typename,String emptyCode,String emptyValue) throws Exception {
        return cmsCodesDetailService.selectByTypenameMap(typename,emptyCode,emptyValue);
    }
}
