class Hotel {
  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final AboutTheHotel aboutTheHotel;

  Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      address: json['adress'],
      minimalPrice: json['minimal_price'],
      priceForIt: json['price_for_it'],
      rating: json['rating'],
      ratingName: json['rating_name'],
      imageUrls: List<String>.from(json['image_urls']),
      aboutTheHotel: AboutTheHotel.fromJson(json['about_the_hotel']),
    );
  }
}
class AboutTheHotel {
  final String description;
  final List<String> peculiarities;

  AboutTheHotel({required this.description, required this.peculiarities});

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) {
    return AboutTheHotel(
      description: json['description'],
      peculiarities: List<String>.from(json['peculiarities']),
    );
  }
}