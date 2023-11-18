import 'package:book_app/data/data_source/firebase_list_book.dart';
import 'package:book_app/data/repository/list_book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_repository_provider.g.dart';

@riverpod
ListBookRepository listBookRepository(ListBookRepositoryRef ref) => FirebaseListBook();
