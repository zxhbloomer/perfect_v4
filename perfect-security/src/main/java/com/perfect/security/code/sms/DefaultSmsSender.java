package com.perfect.security.code.sms;

import com.perfect.security.properties.PerfectSecurityProperties;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpStatus;
import org.hibernate.validator.internal.util.privilegedactions.GetMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;

import java.net.URLDecoder;

@Slf4j
public class DefaultSmsSender implements SmsCodeSender {

    private PerfectSecurityProperties perfectSecurityProperties;

    @Value("${perfect.security.code.sms.expire-in}")
    private long expireIn;

    @Autowired
    private RestTemplate restTemplate;

    @Override
    public void send(String mobile, String code) {
        String apiUri = perfectSecurityProperties.getCode().getSms().getApiUri();
        String account = perfectSecurityProperties.getCode().getSms().getAccount();
        String pswd = perfectSecurityProperties.getCode().getSms().getPswd();
        /** 是否需要状态报告，需要true，不需要false */
        boolean needstatus = true;
        /** 扩展码 */
        String extno = null;

        log.debug("手机号：" + mobile + "的短信验证码为：" + code + "，有效时间：" + expireIn + " 秒");
    }

    public  String batchSend(String url,String account,String pswd,String mobile,String msg,boolean needstatus,
        String extno) throws Exception{

        restTemplate.exchange()

        HttpClient client=new HttpClient();
        GetMethod method=new GetMethod();
        try{
            URI base=new URI(url,false);
            method.setURI(new URI(base,"HttpBatchSendSM",false));
            method.setQueryString(new NameValuePair[]{
                new NameValuePair("account",account),
                new NameValuePair("pswd",pswd),
                new NameValuePair("mobile",mobile),
                new NameValuePair("needstatus",
                    String.valueOf(needstatus)),
                new NameValuePair("msg",msg),
                new NameValuePair("extno",extno),
            });
            int result=client.executeMethod(method);
            if(result== HttpStatus.SC_OK) {
                InputStream in=method.getResponseBodyAsStream();
                ByteArrayOutputStream baos=new ByteArrayOutputStream();
                byte[] buffer=new byte[1024];
                int len=0;
                while((len=in.read(buffer))!=-1){
                    baos.write(buffer,0,len);
                }
                return URLDecoder.decode(baos.toString(),"UTF-8");
            }else{
                throw new Exception("HTTP ERROR Status: "+method.getStatusCode()+":"+method.getStatusText());
            }
        }finally{
            method.releaseConnection();
        }
    }
}
