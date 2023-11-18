import 'package:book_app/data/repository/list_book_repository.dart';
import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:book_app/domain/usecases/usecase.dart';

class GetBooks implements UseCase<Result<List<Book>>, void> {
  final ListBookRepository _listBookRepository;

  GetBooks({required ListBookRepository listBookRepository}) : _listBookRepository = listBookRepository;
  @override
  Future<Result<List<Book>>> call(void params) async {
    var result = await _listBookRepository.getBooks();
    return switch (result) {
      Success(value: final movies) => Result.success(movies),
      Failed(:final message) => Result.failed(message),
    };
  }
}
