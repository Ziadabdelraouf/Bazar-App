class Vendor{
  final String name;
  final String? imageUrl;
  final double? rating;

  Vendor(
    {
      required this.name,
      this.imageUrl,
      this.rating,
    }
  );
}