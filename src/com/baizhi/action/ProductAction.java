package com.baizhi.action;

import com.baizhi.entity.Page;
import com.baizhi.entity.Product;
import com.baizhi.service.ProductService;
import com.baizhi.service.impl.ProductServiceImpl;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品相关
 * Created by gjp06 on 17.5.2.
 */
public class ProductAction extends BaseAction {
    // 分页
    private Page page = new Page();
    private Integer id = 0;
    // 单个书籍
    private Product product = new Product();
    // 查询书籍列表，在主页中通过调用 action 得到数据，再通过此属性传输到对应的 jsp 页面
    private List<Product> productList = new ArrayList<>();
    // 结果根据此属性排序
    private String type = "publishTime"; // orderName
    // 决定排序顺序 1 代表升序（默认），-1 代表降序
    private Integer order = 1;


    public String findBooks() {
        return SUCCESS;
    }

    /**
     * 获取推荐图书
     *
     * @return 跳转至 recommend.jsp
     */
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
        return SUCCESS;
    }

    public String bookList() {
//        System.out.println("\nproduct->" + product + "\ntype->" + type + "\norder->" + order + "\n");
        ProductServiceImpl service = new ProductServiceImpl();
        productList = service.findProductByCdt(product, page, type, order);
//        System.out.println(productList);
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

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }
}
