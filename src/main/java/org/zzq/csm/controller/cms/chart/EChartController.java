package org.zzq.csm.controller.cms.chart;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * Created with IntelliJ IDEA.
 * Description:百度图表
 * User: TYLER
 */
@Controller
public class EChartController {
    @RequestMapping("cms_chart/graph_echarts")
    public String graph_echarts(Model model) throws Exception{
        return "cms/chart/graph_echarts";
    }
}
