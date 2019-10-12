package com.perfect.bean.pojo.fs;

import lombok.Data;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

/**
 * @author zhangxh
 */
@Slf4j
@ToString
@Data
public class UploadFileResultPojo
{
    /**
     * 文件ID
     */
    private String fileUuid;
    /**
     * 文件名
     */
    private String fileName;
    /**
     * 文件大小(B)
     */
    private Long file_size;
    /**
     * uri Disk
     */
    private String uriDisk;

    /**
     * 除了disk，其他的类型
     * mongodb,qiniu,fastdfs,alioss
     */
    private String fsType;

    /**
     * url fs
     */
    private String uriFs;

    /**
     * 除了disk，其他的类型
     * mongodb,qiniu,fastdfs,alioss所对应的url
     */
    private String fsType2Url;
}
