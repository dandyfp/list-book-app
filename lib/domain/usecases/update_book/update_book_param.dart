class UpdateBookParam {
  String bookTitle;
  String? bookCode;
  String authorName;
  String publisherName;
  String uid;
  String publisherYear;
  UpdateBookParam({
    required this.bookTitle,
    this.bookCode,
    required this.authorName,
    required this.uid,
    required this.publisherName,
    required this.publisherYear,
  });
}
