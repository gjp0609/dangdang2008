package com.baizhi.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by gjp06 on 17.5.2.
 */
public class Product implements Serializable {
    private Integer id;
    private String title;
    private Double realPrice;
    private Double price;
    private String series;
    private String author;
    private Integer count;
    private String publisher;
    private Date publishTime;
    private String publishEdtion;
    private Date printTime;
    private String printEdtion;
    private String isbn;
    private Integer wordCount;
    private Integer pageCount;
    private Integer bookSize;
    private String paper;
    private String pack;
    private String imgSrc;
    private Double star;
    private String recommend;
    private String details;
    private String authorDetails;
    private String catalogue;
    private String commend;
    private String digest;
    private Category category;

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", realPrice=" + realPrice +
                ", price=" + price +
                ", series='" + series + '\'' +
                ", author='" + author + '\'' +
                ", count=" + count +
                ", publisher='" + publisher + '\'' +
                ", publishTime='" + publishTime + '\'' +
                ", publishEdtion='" + publishEdtion + '\'' +
                ", printTime='" + printTime + '\'' +
                ", printEdtion='" + printEdtion + '\'' +
                ", isbn='" + isbn + '\'' +
                ", wordCount=" + wordCount +
                ", pageCount=" + pageCount +
                ", bookSize=" + bookSize +
                ", paper='" + paper + '\'' +
                ", pack='" + pack + '\'' +
                ", imgSrc='" + imgSrc + '\'' +
                ", star=" + star +
                ", recommend='" + recommend + '\'' +
                ", details='" + details + '\'' +
                ", authorDetails='" + authorDetails + '\'' +
                ", catalogue='" + catalogue + '\'' +
                ", commend='" + commend + '\'' +
                ", digest='" + digest + '\'' +
                ", category=" + category +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getRealPrice() {
        return realPrice;
    }

    public void setRealPrice(Double realPrice) {
        this.realPrice = realPrice;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }


    public String getPublishEdtion() {
        return publishEdtion;
    }

    public void setPublishEdtion(String publishEdtion) {
        this.publishEdtion = publishEdtion;
    }


    public String getPrintEdtion() {
        return printEdtion;
    }

    public void setPrintEdtion(String printEdtion) {
        this.printEdtion = printEdtion;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Integer getWordCount() {
        return wordCount;
    }

    public void setWordCount(Integer wordCount) {
        this.wordCount = wordCount;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getBookSize() {
        return bookSize;
    }

    public void setBookSize(Integer bookSize) {
        this.bookSize = bookSize;
    }

    public String getPaper() {
        return paper;
    }

    public void setPaper(String paper) {
        this.paper = paper;
    }

    public String getPack() {
        return pack;
    }

    public void setPack(String pack) {
        this.pack = pack;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public Double getStar() {
        return star;
    }

    public void setStar(Double star) {
        this.star = star;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getAuthorDetails() {
        return authorDetails;
    }

    public void setAuthorDetails(String authorDetails) {
        this.authorDetails = authorDetails;
    }

    public String getCatalogue() {
        return catalogue;
    }

    public void setCatalogue(String catalogue) {
        this.catalogue = catalogue;
    }

    public String getCommend() {
        return commend;
    }

    public void setCommend(String commend) {
        this.commend = commend;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getPrintTime() {
        return printTime;
    }

    public void setPrintTime(Date printTime) {
        this.printTime = printTime;
    }
}
