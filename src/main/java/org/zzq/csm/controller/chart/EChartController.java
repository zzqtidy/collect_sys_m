package org.zzq.csm.controller.chart;
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
    @RequestMapping("chart/graph_echarts")
    public String graph_echarts(Model model) throws Exception{
        return "chart/graph_echarts";
    }
}
