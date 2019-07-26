package com.etc.exam.Utils;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;
import org.apache.poi.ss.usermodel.Workbook;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

/**
 * @author Administrator
 * excel 工具类
 */
public class ExcelUtils {

    /**
     * 保存模板excel文件
     *
     * @param request      webapp路径下
     * @param templatePath 模板路径
     * @param outFolder    输出的文件夹
     * @param fileName     文件名
     * @param data         数据
     */
       public static void saveTemplateFile(HttpServletRequest request, String templatePath, String outFolder, String fileName, Map<String, Object> data) throws Exception {
        File outPath = new File(request.getServletContext().getRealPath(outFolder));
        if (!outPath.exists() && !outPath.isDirectory()) {
            outPath.mkdir();
        }
        TemplateExportParams params = new TemplateExportParams(request.getServletContext().getRealPath(templatePath));
        Workbook workbook = ExcelExportUtil.exportExcel(params, data);
        try {
            FileOutputStream fos = new FileOutputStream(request.getServletContext().getRealPath(outFolder + "/" + fileName));
            workbook.write(fos);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
