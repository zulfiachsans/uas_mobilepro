class PopularPhone {
  late int id;
  late String name;
  late String imageUrl;
  late bool isPopular;
  PopularPhone({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isPopular = false,
  });
}
