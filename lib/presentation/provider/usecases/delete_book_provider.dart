import 'package:book_app/domain/usecases/delete_book/delete_book.dart';
import 'package:book_app/presentation/provider/repository/book_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_book_provider.g.dart';

@riverpod
DeleteBook deleteBook(DeleteBookRef ref) => DeleteBook(listBookRepository: ref.watch(listBookRepositoryProvider));
