class ProductDto {
    constructor(product) {
        this.id = product.id;
        this.pictureList = product.pictureList;
        this.title = product.title;
        this.prix = product.prix;
        this.categoryId = product.categoryId;
        this.description = product.description;
        this.country = product.country;
        this.postCode = product.postCode;
        this.userId = product.userId;
    }
}
