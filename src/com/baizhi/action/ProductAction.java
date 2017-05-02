package com.baizhi.action;

import com.baizhi.entity.Page;
import com.baizhi.entity.Product;
import com.baizhi.service.ProductService;
import com.baizhi.service.impl.ProductServiceImpl;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
public class ProductAction extends BaseAction {
    private Page page = new Page();
    private Integer id = 0;
    private String type = "";
    // 单个书籍
    private Product product = new Product();
    // 查询书籍列表，在主页中通过调用 action 得到数据，再通过此属性传输到对应的 jsp 页面
    private List<Product> productList = new ArrayList<>();

    public String findBooks() {
        return SUCCESS;
    }

    public String recommendBooks() {
        productList = new ProductServiceImpl().findRecommendProduct();
        return SUCCESS;
    }

    public String findBooksOrderByXX() {
        Product p = new Product();
        ProductServiceImpl service = new ProductServiceImpl();
        Page page = new Page();
        page.setPageSize(4);
        page.setPageIndex(1);
        if (type.equals("newAndHot")) {
            page.setPageSize(8);
            productList = service.findProductByCdt(p, page, "publishTime desc, count", -1);
        } else
            productList = service.findProductByCdt(p, page, type, -1);
        return type;
    }

    public String bookDetails() {
        Product p = new Product();
        p.setId(id);
        ProductService service = new ProductServiceImpl();
        List<Product> list = service.findProductByCdt(p, null, null, null);
        if (list != null && list.size() == 1) product = list.get(0);
        System.out.println(list + " " + product);
        return SUCCESS;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
