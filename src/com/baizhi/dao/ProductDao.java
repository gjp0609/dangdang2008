package com.baizhi.dao;

import com.baizhi.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
public interface ProductDao {

    public List<Product> selectProductByCdt(@Param("product") Product product,
                                            @Param("firstRow") Integer firstRow,
                                            @Param("lastRow") Integer lastRow,
                                            @Param("orderName") String orderName,
                                            @Param("order") Integer order);

    public List<Product> selectRecommendProduct(@Param("list") List<Integer> list);

    public int selectTotalRows(Product product);
}
