package com.model;

public class WebsiteTemplate {

    private int templateId;
    private String templateName;
    private String description;
    private String category;
    private double price;
    private String demoImage;
    private String status;

    public WebsiteTemplate() {
    }

    public WebsiteTemplate(String templateName, String description,
                           String category, double price,
                           String demoImage, String status) {

        this.templateName = templateName;
        this.description = description;
        this.category = category;
        this.price = price;
        this.demoImage = demoImage;
        this.status = status;
    }

    public int getTemplateId() {
        return templateId;
    }

    public void setTemplateId(int templateId) {
        this.templateId = templateId;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDemoImage() {
        return demoImage;
    }

    public void setDemoImage(String demoImage) {
        this.demoImage = demoImage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}