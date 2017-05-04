package com.baizhi.entity;

/**
 * Created by gjp06 on 17.4.23.
 */

import java.io.Serializable;

/**
 * Created by gjp06 on 17.4.12.
 */
public class Page implements Serializable {
    private Integer pageIndex;
    private Integer pageSize;
    private Integer totalRows;
    private Integer totalPages;

    public Page() {
        this(1, 3);
    }

    public Page(Integer pageIndex, Integer pageSize, Integer totalRows, Integer totalPages) {
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.totalRows = totalRows;
        this.totalPages = totalPages;
    }

    public Page(Integer pageIndex, Integer pageSize) {
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
    }

    /**
     * @return 当前页第一行行数
     */
    public int getFirstRow() {
        return pageSize * (pageIndex - 1) + 1;
    }

    /**
     * @return 当前页最后一行行数
     */
    public int getLastRow() {
        return pageSize * pageIndex;
    }

    public boolean getHasNextPage() {
        return pageIndex < totalPages;
    }

    public boolean getHasPrePage() {
        return pageIndex > 1;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRows() {
        return totalRows;
    }

    /**
     * 查询到总行数后要计算总页面数
     *
     * @param totalRows 所查询表的总行数
     */
    public void setTotalRows(Integer totalRows) {
        this.totalRows = totalRows;
        int k = totalRows % pageSize;
        if (k == 0) totalPages = totalRows / pageSize;
        else totalPages = totalRows / pageSize + 1;
//        this.totalPages = totalRows % pageSize == 0 ? totalRows / pageSize : totalRows / pageSize + 1;
    }


    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }
}
