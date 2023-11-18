class CreateBookParam {
  String bookTitle;
  String? bookCode;
  String authorName;
  String publisherName;
  String publisherYear;
  CreateBookParam({
    required this.bookTitle,
    this.bookCode,
    required this.authorName,
    required this.publisherName,
    required this.publisherYear,
  });
}
