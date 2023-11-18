import 'package:book_app/data/repository/list_book_repository.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:book_app/domain/usecases/create_book/create_book_param.dart';
import 'package:book_app/domain/usecases/usecase.dart';

class CreateBook implements UseCase<Result, CreateBookParam> {
  final ListBookRepository _listBookRepository;

  CreateBook({required ListBookRepository listBookRepository}) : _listBookRepository = listBookRepository;

  @override
  Future<Result> call(CreateBookParam params) async {
    var result = await _listBookRepository.createBook(
      bookTitle: params.bookTitle,
      authorName: params.authorName,
      publisherName: params.publisherName,
      publisherYear: params.publisherYear,
    );

    if (result.isSuccess) {
      return Result.success(result.resultValue);
    } else {
      return Result.failed(result.errorMessagge.toString());
    }
  }
}
