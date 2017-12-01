package org.zzq.csm.exception;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: zzq
 * Date: 2017-12-01
 * Time: 17:37
 */
public class CustomException extends Exception {

    //异常信息
    private String message;

    public CustomException(String message) {
        super();
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}