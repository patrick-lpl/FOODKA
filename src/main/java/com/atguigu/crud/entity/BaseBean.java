package com.atguigu.crud.entity;

public class BaseBean {

    // 第多少页
    private Integer offset;

    // 每页显示多少条数
    private Integer limit;

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
