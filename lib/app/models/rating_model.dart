class RatingModel {
  final String id;
  final String userId;
  final String productId;
  final double rating;

  RatingModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.rating,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "rating": rating,
      };
}
