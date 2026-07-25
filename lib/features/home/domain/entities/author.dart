class Author {
  const Author({
    required this.name,
    this.role='Author',
    required this.image,
  });

  final String name;
  final String role;
  final String image;
}