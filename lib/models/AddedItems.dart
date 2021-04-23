class Additems
{
  String productId;
  String final_price;
  String final_quantity;

  Additems(this.productId,this.final_price,this.final_quantity);

  Map toJson() => {
    'productId': productId,
    'final_price': final_price,
    'final_quantity': final_quantity,
  };
}