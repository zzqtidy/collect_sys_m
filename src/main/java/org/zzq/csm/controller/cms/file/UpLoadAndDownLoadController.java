package org.zzq.csm.controller.cms.file;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * Created with IntelliJ IDEA.
 * Description:文件上传下载，利用springMvc上传方法
 * User: TYLER
 * Date: 2018-08-08
 */
@Controller
public class UpLoadAndDownLoadController {

    @RequestMapping(value = "cms_file/upload/show")
    public String uploadPageShow(Model model){
        return "cms/file/upload";
    }
    /**
     * 文件上传功能
     *
     * @param file
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "cms_file/upload", method = RequestMethod.POST)
    @ResponseBody
    public String upload(MultipartFile file, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("upload"); //上传文件存放服务器上的路径
        String fileName = file.getOriginalFilename();
        File dir = new File(path, fileName);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);
        return "ok!";
    }

    /**
     * 文件下载功能
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("cms_file/down")
    public void down(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //模拟文件，myfile.txt为需要下载的文件
        String fileName = request.getSession().getServletContext().getRealPath("upload") + "/myfile.txt";
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String filename = "下载文件.txt";
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename, "UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while ((len = bis.read()) != -1) {
            out.write(len);
            out.flush();
        }
        out.close();
    }
}
