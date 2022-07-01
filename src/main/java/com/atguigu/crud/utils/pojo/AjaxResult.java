package com.atguigu.crud.utils.pojo;


/**
 * 返回处理结果实体
 */
public class AjaxResult {

    private static final int SUCCESS_CODE = 200;

    private static final int ERROR_CODE = 500;


    /**
     * 状态码
     */
    private int code;

    /**
     * 提示信息
     */
    private String msg;

    /**
     * 返回数据
     */
    private Object data;

    public AjaxResult(){

    }

    public AjaxResult(int code,String msg,Object data){
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static AjaxResult success(){
        return new AjaxResult(SUCCESS_CODE,"success",null);
    }

    public static AjaxResult success(Object data){
        return new AjaxResult(SUCCESS_CODE,"success",data);
    }

    public static AjaxResult success(String msg){
        return new AjaxResult(SUCCESS_CODE,msg,null);
    }

    public static AjaxResult error(){
        return new AjaxResult(ERROR_CODE,"error",null);
    }

    public static AjaxResult error(String msg){
        return new AjaxResult(ERROR_CODE,msg,null);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
