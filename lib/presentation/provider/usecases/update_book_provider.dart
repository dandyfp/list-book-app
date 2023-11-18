import 'package:book_app/domain/usecases/update_book/update_book.dart';
import 'package:book_app/presentation/provider/repository/book_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_book_provider.g.dart';

@riverpod
UpdateBook updateBook(UpdateBookRef ref) => UpdateBook(listBookRepository: ref.watch(listBookRepositoryProvider));
