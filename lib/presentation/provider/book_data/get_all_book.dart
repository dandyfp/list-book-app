import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:book_app/domain/usecases/get_books/get_book.dart';
import 'package:book_app/presentation/provider/usecases/get_books_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_book.g.dart';

@riverpod
Future<List<Book>> getAllBook(GetAllBookRef ref) async {
  GetBooks getallBook = ref.read(getBooksProvider);

  var getallBookResult = await getallBook(null);

  return switch (getallBookResult) {
    Success(value: final books) => books,
    Failed(message: _) => [],
  };
}
