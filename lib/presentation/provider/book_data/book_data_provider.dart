import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:book_app/domain/usecases/create_book/create_book.dart';
import 'package:book_app/domain/usecases/create_book/create_book_param.dart';
import 'package:book_app/domain/usecases/delete_book/delete_book.dart';
import 'package:book_app/domain/usecases/delete_book/delete_book_param.dart';
import 'package:book_app/domain/usecases/get_books/get_book.dart';
import 'package:book_app/domain/usecases/update_book/update_book.dart';
import 'package:book_app/domain/usecases/update_book/update_book_param.dart';
import 'package:book_app/presentation/provider/usecases/create_book_provider.dart';
import 'package:book_app/presentation/provider/usecases/delete_book_provider.dart';
import 'package:book_app/presentation/provider/usecases/get_books_provider.dart';
import 'package:book_app/presentation/provider/usecases/update_book_provider.dart';
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
      case Success():
        getBooks();
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData([]);
    }
  }

  Future<void> updateBook({
    required String uid,
    required String bookTitle,
    String? bookCode,
    required String authorName,
    required String publisherName,
    required String publisherYear,
  }) async {
    UpdateBook updateBook = ref.read(updateBookProvider);
    var result = await updateBook(
      UpdateBookParam(
        uid: uid,
        bookTitle: bookTitle,
        authorName: authorName,
        publisherName: publisherName,
        publisherYear: publisherYear,
      ),
    );

    switch (result) {
      case Success():
        getBooks();
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

  Future<void> deleteBook(String uid) async {
    state = const AsyncLoading();

    DeleteBook deleteBook = ref.read(deleteBookProvider);
    var result = await deleteBook(DeleteBookParam(uid: uid));

    switch (result) {
      case Success():
        getBooks();
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData([]);
    }
  }

  @override
  FutureOr<List<Book>?> build() async {
    GetBooks getallBook = ref.read(getBooksProvider);

    var getallBookResult = await getallBook(null);

    return switch (getallBookResult) {
      Success(value: final books) => books,
      Failed(message: _) => [],
    };
  }
}
