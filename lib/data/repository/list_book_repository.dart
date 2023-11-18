import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/entities/result.dart';

abstract interface class ListBookRepository {
  Future<Result> createBook({
    required String bookTitle,
    String? bookCode,
    required String authorName,
    required String publisherName,
    required String publisherYear,
  });

  Future<Result<List<Book>>> getBooks();

  Future<Result<void>> deleteBook({required String uidBook});

  Future<Result> updateBook({
    required String bookTitle,
    required String uid,
    required String authorName,
    required String publisherName,
    required String publisherYear,
  });
}
