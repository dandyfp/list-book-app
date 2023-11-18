import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:book_app/domain/usecases/create_book/create_book.dart';
import 'package:book_app/domain/usecases/create_book/create_book_param.dart';
import 'package:book_app/domain/usecases/get_books/get_book.dart';
import 'package:book_app/presentation/provider/usecases/create_book_provider.dart';
import 'package:book_app/presentation/provider/usecases/get_books_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_data_provider.g.dart';

@Riverpod(keepAlive: true)
class BookData extends _$BookData {
  Future<void> createBook({
    required String bookTitle,
    String? bookCode,
    required String authorName,
    required String publisherName,
    required String publisherYear,
  }) async {
    CreateBook createBook = ref.read(createBookProvider);
    var result = await createBook(
      CreateBookParam(
        bookTitle: bookTitle,
        authorName: authorName,
        publisherName: publisherName,
        publisherYear: publisherYear,
      ),
    );

    switch (result) {
      case Success(value: final book):
        state = AsyncData(book);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData([]);
    }
  }

  Future<void> getBooks() async {
    state = const AsyncLoading();

    GetBooks getBooks = ref.read(getBooksProvider);
    var result = await getBooks(ref);

    switch (result) {
      case Success(value: final books):
        state = AsyncData(books);
      case Failed(message: _):
        state = const AsyncData([]);
    }
  }

  @override
  FutureOr<List<Book>> build() => [];
}
