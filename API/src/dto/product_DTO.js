class ProductDto {
    constructor(product) {
        this.id = product.id;
        this.pictureList = product.pictureList;
        this.title = product.title;
        this.prix = product.prix;
        this.category = product.Category.category_name;
        this.description = product.description;
        this.date = product.date;
        this.city = product.city;
        this.postCode = product.postCode;
        this.username = product.User.username;
        this.profilPicture = product.User.picture;
    }
}


module.exports = ProductDto;