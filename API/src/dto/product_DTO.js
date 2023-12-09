class ProductDto {
    constructor(product) {
        this.id = product.id;
        this.pictureList = product.pictureList;
        this.title = product.title;
        this.prix = product.prix;
        this.category = product.category;
        this.description = product.description;
        this.date = product.date;
        this.country = product.country;
        this.postCode = product.postCode;
        this.username = product.username;
        this.profilPicture = product.profilPicture;
    }
}
