class CartModel {
  String? id;
  String? title;
  double? quantity = 0;
  double? price = 0;
  String? image;

  CartModel({this.id, this.title, this.quantity, this.price, this.image});
}
