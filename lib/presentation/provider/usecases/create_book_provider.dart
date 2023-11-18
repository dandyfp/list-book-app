import 'package:book_app/domain/usecases/create_book/create_book.dart';
import 'package:book_app/presentation/provider/repository/book_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_book_provider.g.dart';

@riverpod
CreateBook createBook(CreateBookRef ref) => CreateBook(listBookRepository: ref.watch(listBookRepositoryProvider));
