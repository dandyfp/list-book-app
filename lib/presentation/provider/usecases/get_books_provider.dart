import 'package:book_app/domain/usecases/get_books/get_book.dart';
import 'package:book_app/presentation/provider/repository/book_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_books_provider.g.dart';

@riverpod
GetBooks getBooks(GetBooksRef ref) => GetBooks(listBookRepository: ref.watch(listBookRepositoryProvider));
