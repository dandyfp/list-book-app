import 'package:book_app/data/repository/list_book_repository.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:book_app/domain/usecases/update_book/update_book_param.dart';
import 'package:book_app/domain/usecases/usecase.dart';

class UpdateBook implements UseCase<Result, UpdateBookParam> {
  final ListBookRepository _listBookRepository;

  UpdateBook({required ListBookRepository listBookRepository}) : _listBookRepository = listBookRepository;

  @override
  Future<Result> call(UpdateBookParam params) async {
    var result = await _listBookRepository.updateBook(
      uid: params.uid,
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
