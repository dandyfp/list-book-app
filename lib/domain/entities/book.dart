import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    String? bookTitle,
    String? bookCode,
    String? authorName,
    String? publisherName,
    String? publishYear,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  factory Book.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Book(
      publisherName: snapshot.data()?['publisherName'],
      bookTitle: snapshot.data()?['bookTitle'],
      authorName: snapshot.data()?['authorName'],
      publishYear: snapshot.data()?['publishYear'],
      bookCode: snapshot.data()?['bookCode'],
    );
  }
}
