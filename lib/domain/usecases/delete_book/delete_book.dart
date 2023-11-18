import 'package:book_app/data/repository/list_book_repository.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:book_app/domain/usecases/delete_book/delete_book_param.dart';
import 'package:book_app/domain/usecases/usecase.dart';

class DeleteBook implements UseCase<Result<void>, DeleteBookParam> {
  final ListBookRepository _listBookRepository;

  DeleteBook({required ListBookRepository listBookRepository}) : _listBookRepository = listBookRepository;
  @override
  Future<Result<void>> call(DeleteBookParam params) async {
    var result = await _listBookRepository.deleteBook(uidBook: params.uid);
    return switch (result) {
      Success(value: final delete) => Result.success(delete),
      Failed(:final message) => Result.failed(message),
    };
  }
}
