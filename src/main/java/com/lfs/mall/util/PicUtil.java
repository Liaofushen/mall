package com.lfs.mall.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class PicUtil {

    public static String picDir = "/root/mall/imghub/";
    private static String url = "/imghub/";


    public static String save(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) return "";

        String path = picDir;
        String filename = UUID.randomUUID() + ".jpg";

        File filepath = new File(path, filename);
        //判断路径是否存在，如果不存在就创建一个
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文件当中

        file.transferTo(new File(path + File.separator + filename));

        return url + filename;
    }
}
