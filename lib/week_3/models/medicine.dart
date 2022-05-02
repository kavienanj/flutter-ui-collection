class Product {
  final String name;
  final String image;
  final String manufacture;
  final String price;
  bool isLiked;
  bool isInCart;

  Product({
    this.name,
    this.image,
    this.manufacture,
    this.price,
    this.isInCart = false,
    this.isLiked = false,
  });

  void addToCart() => this.isInCart = true;

  void removeFromCart() => this.isInCart = false;

  void addToLiked() => this.isLiked = true;

  void removeFromLiked() => this.isLiked = false;

}

final List<Product> itemList = [
  Product(
    image: "assets/week_3/pro-vac.png",
    name: "Pro-Vac Venco Pro-Vac",
    manufacture: "by baximco",
    price: "\$34.50",
    isInCart: true,
    isLiked: true,
  ),
  Product(
    image: "assets/week_3/live-b1.png",
    name: "Disease Vaccine",
    manufacture: "by B1 Strain",
    price: "\$21.44",
  ),
];
