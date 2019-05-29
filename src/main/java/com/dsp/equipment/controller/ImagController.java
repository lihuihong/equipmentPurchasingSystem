package com.dsp.equipment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RequestMapping(value="/sys")
@Controller
public class ImagController {

    @RequestMapping(value = "/upload/img", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {

        // 如果文件内容不为空，则写入上传路径
        if (!file.isEmpty()) {
            BufferedImage image = null;
            try {
                image = ImageIO.read(file.getInputStream());
            } catch (IOException e) {
                e.printStackTrace();
            }
            if (image != null) {
                //如果image=null 表示上传的不是图片格式
                // 上传文件名
                String filename = file.getOriginalFilename();
                String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" +
                        request.getServerPort() + request.getContextPath() +"/static/images/";//存储路径
                String path = request.getSession().getServletContext().getRealPath("/static/images"); //文件存储位置（工程目录）
                String fileF = filename.substring(filename.lastIndexOf("."), filename.length());//文件后缀
                filename=new Date().getTime()+"_"+new Random().nextInt(1000)+fileF;//新的文件名
                //先判断文件是否存在
                SimpleDateFormat simpdate = new SimpleDateFormat("yyyyMMdd");
                String fileAdd = simpdate.format(new Date());//以yyyyMMdd格式的时间做为一个文件夹
                //获取文件夹路径
                File file1 =new File(path+"/"+fileAdd);

                // 判断该文件夹路径是否存在，没有就创建一个
                if (!file1.exists()) {
                    file1.mkdirs();
                }

                // 将上传文件保存到一个目标文档中
                File filesave = new File(file1 + File.separator + filename);
                try {
                    file.transferTo(filesave);
                } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                Map<String, Object> res = new HashMap<String, Object>();
                // 返回的是一个url对象
                res.put("url", returnUrl+fileAdd+"/"+filename);
                return res;
            }else {
                return null;
            }
        }else {
            return null;
        }
    }
}
