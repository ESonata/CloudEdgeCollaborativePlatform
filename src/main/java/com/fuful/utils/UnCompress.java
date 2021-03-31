package com.fuful.utils;

/**
 * Created by SunRuiBin on 2020/3/12.
 */

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.apache.commons.compress.archivers.tar.TarArchiveInputStream;
import org.apache.commons.compress.archivers.tar.TarArchiveOutputStream;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 解压缩
 * @author Administrator
 *
 */
public class UnCompress {



    private static final String BASE_DIR = "";

    // 符号"/"用来作为目录标识判断符
    private static final String PATH = File.separator;
    private static final int BUFFER = 1024;

    private static final String EXT = ".tar";

    /**
     * 归档
     *
     * @param srcPath
     * @param destPath
     * @throws Exception
     */
    public static void archive(String srcPath, String destPath)
            throws Exception {

        File srcFile = new File(srcPath);

        archive(srcFile, destPath);

    }

    /**
     * 归档
     *
     * @param srcFile
     *            源路径
     * @param destFile
     *            目标路径
     * @throws Exception
     */
    public static void archive(File srcFile, File destFile) throws Exception {

        TarArchiveOutputStream taos = new TarArchiveOutputStream(
                new FileOutputStream(destFile));

        archive(srcFile, taos, BASE_DIR);

        taos.flush();
        taos.close();
    }

    /**
     * 归档
     *
     * @param srcFile
     * @throws Exception
     */
    public static void archive(File srcFile) throws Exception {
        String name = srcFile.getName();
        String basePath = srcFile.getParent();
        String destPath = basePath+File.separator + name + EXT;
        archive(srcFile, destPath);
    }

    /**
     * 归档文件
     *
     * @param srcFile
     * @param destPath
     * @throws Exception
     */
    public static void archive(File srcFile, String destPath) throws Exception {
        archive(srcFile, new File(destPath));
    }

    /**
     * 归档
     *
     * @param srcPath
     * @throws Exception
     */
    public static void archive(String srcPath) throws Exception {
        File srcFile = new File(srcPath);

        archive(srcFile);
    }

    /**
     * 归档
     *
     * @param srcFile
     *            源路径
     * @param taos
     *            TarArchiveOutputStream
     * @param basePath
     *            归档包内相对路径
     * @throws Exception
     */
    private static void archive(File srcFile, TarArchiveOutputStream taos,
                                String basePath) throws Exception {
        if (srcFile.isDirectory()) {
            archiveDir(srcFile, taos, basePath);
        } else {
            archiveFile(srcFile, taos, basePath);
        }
    }

    /**
     * 目录归档
     *
     * @param dir
     * @param taos
     *            TarArchiveOutputStream
     * @param basePath
     * @throws Exception
     */
    private static void archiveDir(File dir, TarArchiveOutputStream taos,
                                   String basePath) throws Exception {

        File[] files = dir.listFiles();

        if (files.length < 1) {
            TarArchiveEntry entry = new TarArchiveEntry(basePath
                    + dir.getName() + PATH);

            taos.putArchiveEntry(entry);
            taos.closeArchiveEntry();
        }

        for (File file : files) {

            // 递归归档
            archive(file, taos, basePath + dir.getName() + PATH);

        }
    }


    private static void archiveFile(File file, TarArchiveOutputStream taos,
                                    String dir) throws Exception {

        /**
         * 归档内文件名定义
         *
         * <pre>
         * 如果有多级目录，那么这里就需要给出包含目录的文件名
         * 如果用WinRAR打开归档包，中文名将显示为乱码
         * </pre>
         */
        TarArchiveEntry entry = new TarArchiveEntry(dir + file.getName());
        //如果打包不需要文件夹，就用 new TarArchiveEntry(file.getName())

        entry.setSize(file.length());

        taos.putArchiveEntry(entry);

        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(
                file));
        int count;
        byte data[] = new byte[BUFFER];
        while ((count = bis.read(data, 0, BUFFER)) != -1) {
            taos.write(data, 0, count);
        }

        bis.close();

        taos.closeArchiveEntry();
    }

    /**
     * 解归档
     *
     * @param srcFile
     * @throws Exception
     */
    public static void dearchive(File srcFile) throws Exception {
        String basePath = srcFile.getParent();
        dearchive(srcFile, basePath);
    }

    /**
     * 解归档
     *
     * @param srcFile
     * @param destFile
     * @throws Exception
     */
    public static void dearchive(File srcFile, File destFile) throws Exception {

        TarArchiveInputStream tais = new TarArchiveInputStream(
                new FileInputStream(srcFile));
        dearchive(destFile, tais);

        tais.close();

    }

    /**
     * 解归档
     *
     * @param srcFile
     * @param destPath
     * @throws Exception
     */
    public static void dearchive(File srcFile, String destPath)
            throws Exception {
        dearchive(srcFile, new File(destPath));

    }

    /**
     * 文件 解归档
     *
     * @param destFile
     *            目标文件
     * @param tais
     *            ZipInputStream
     * @throws Exception
     */
    private static void dearchive(File destFile, TarArchiveInputStream tais)
            throws Exception {

        TarArchiveEntry entry = null;
        while ((entry = tais.getNextTarEntry()) != null) {

            // 文件
            String dir = destFile.getPath() + File.separator + entry.getName();

            File dirFile = new File(dir);

            // 文件检查
            fileProber(dirFile);

            if (entry.isDirectory()) {
                dirFile.mkdirs();
            } else {
                dearchiveFile(dirFile, tais);
            }

        }
    }

    /**
     * 文件 解归档
     *
     * @param srcPath
     *            源文件路径
     *
     * @throws Exception
     */
    public static void dearchive(String srcPath) throws Exception {
        File srcFile = new File(srcPath);

        dearchive(srcFile);
    }

    /**
     * 文件 解归档
     *
     * @param srcPath
     *            源文件路径
     * @param destPath
     *            目标文件路径
     * @throws Exception
     */
    public static void dearchive(String srcPath, String destPath)
            throws Exception {

        File srcFile = new File(srcPath);
        dearchive(srcFile, destPath);
    }

    /**
     * 文件解归档
     *
     * @param destFile
     *            目标文件
     * @param tais
     *            TarArchiveInputStream
     * @throws Exception
     */
    private static void dearchiveFile(File destFile, TarArchiveInputStream tais)
            throws Exception {

        BufferedOutputStream bos = new BufferedOutputStream(
                new FileOutputStream(destFile));

        int count;
        byte data[] = new byte[BUFFER];
        while ((count = tais.read(data, 0, BUFFER)) != -1) {
            bos.write(data, 0, count);
        }

        bos.close();
    }

    /**
     * 文件探针
     *
     * <pre>
     * 当父目录不存在时，创建目录！
     * </pre>
     *
     * @param dirFile
     */
    private static void fileProber(File dirFile) {

        File parentFile = dirFile.getParentFile();
        if (!parentFile.exists()) {

            // 递归寻找上级目录
            fileProber(parentFile);

            parentFile.mkdir();
        }

    }

    public static String getImageName(String tempFilePath) throws Exception{
        System.out.println("tempFilePath = " + tempFilePath);
        String dirPath = tempFilePath.substring(0, tempFilePath.lastIndexOf("."));
        File dirFile = new File(dirPath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        UnCompress.dearchive(tempFilePath, dirPath);
        if (!dirPath.endsWith(File.separator)) {
            dirPath += File.separator;
        }
        //目标文件
        String destFilePath = dirPath + "manifest.json";
        File destFile = new File(destFilePath);
        if (!destFile.exists()) {
            return null;
        }
        StringBuilder sb = new StringBuilder("");
        InputStream io = new FileInputStream(new File(destFilePath));
        byte[] bytes = new byte[1024];
        int len = 0;
        while ((len = io.read(bytes)) > 0) {
            sb.append(new String(bytes, 0, len));
        }
        String content = sb.toString();
        //只取第一个配置项
        List<JSONObject> jsonList = (List<JSONObject>) JSONArray.parse(content);
        System.out.println("jsonList = " + jsonList);
        return ((List<String>)jsonList.get(0).get("RepoTags")).get(0);
        /*if (content.startsWith("[")) {
            content = content.substring(1, content.length() - 2);
        }
        System.out.println("content = " + content);
        JSONObject json = JSONObject.parseObject(content.toString());
        List<String> list = (List<String>) json.get("RepoTags");
        System.out.println("list = " + list);
        return list.get(0);*/
    }

    /*public static void main(String[] args) throws Exception {
        String str = getImageName("E:\\temp\\osmcs_redis.tar");
        System.err.println(str);
    }*/

    /*public static void main(String[] args) {
        List<JSONObject> jsonList = (List<JSONObject>) JSONArray.parse("[{'Config':'05af71dd925161e515a980a129868929ee200bd5f896f6be61cf0a25fb5912df.json','RepoTags':['tomcat:latest'],'Layers':['cdc670427c7f26730bc075317993e7e72eea6df68e1be0ddf785cb3b774edc7c/layer.tar','5872a7aa42489b9517d31cc4ae83876cb38a21111acb0303a270ad6156c180f1/layer.tar','a34ac92b6f61c316eb200d74a3333c9f6fb24efdd15f2e1415474a9a96d0be62/layer.tar','0318148a6b1a640ef69623d9b97b59eed85285401e8250d71008e72f637cae31/layer.tar','86de30dac6602cac8b9b788a867daf10feaba9fd86f258a215e6396f34c94582/layer.tar','0a493e1fcea7fb5ecd1a72a3b5793ecf75de5af77e59280d4a54e0b01a5245cc/layer.tar','84421a45d2a124bd8817cbc127020e54ea805f77eb845174e1339d3d191c0f03/layer.tar','779b0e2cbb049d99e0802f5691bcd87c3ecf1d6c1469a9ddec2ff08522967672/layer.tar','87c68fcc6b34277e18005b0b436dc41064ca21db2337325ed75402d97a911a14/layer.tar','b5d3df54bc2ef8eaf83d2ea17e905821ba7fd186b2dbe4715e792cfc082dbeaa/layer.tar','617232c843330e0a4b9b2c7054188226497a5bc2338261bb23265de0c94d504e/layer.tar','75c4928affc72da624cbecc4b7d5b9896262d2e07cbbd13409b127f33c423cd8/layer.tar']},{'Config':'05a60462f8bafb215ddc5c20a364b5fb637670200a74a5bb13a1b23f64515561.json','RepoTags':['nginx:1.11.5'],'Layers':['3cae701620ae8eaf6a7f9988227eb21175b74f42e37a8187af521e0211555286/layer.tar','cb1fb070144286bf18e01b22d594e5e8eda2e5e39a28f5e1618105fee0e469e2/layer.tar','b52be048d4d2ebc586ef1134e94116a2189e36abe19975c650bb0b226c2ce81d/layer.tar']}]");
        for (JSONObject jsonObject : jsonList) {
            System.out.println(((List<String>)jsonObject.get("RepoTags")).get(0));
        }
    }*/

}