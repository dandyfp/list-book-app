import 'package:book_app/data/repository/list_book_repository.dart';
import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseListBook implements ListBookRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseListBook({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<Result> createBook(
      {required String bookTitle, String? bookCode, required String authorName, required String publisherName, required String publisherYear}) async {
    CollectionReference<Map<String, dynamic>> book = _firebaseFirestore.collection('books');
    var id = '';
    await book.add({
      'bookTitle': bookTitle,
      'bookCode': book.id,
      'authorName': authorName,
      'publisherName': publisherName,
      'publisherYear': publisherYear,
    }).then((value) {
      id = value.id;
      return Result.success(value);
    }).onError((error, stackTrace) {
      return Result.failed(error.toString());
    });
    DocumentSnapshot<Map<String, dynamic>> result = await book.doc(id).get();

    if (result.exists) {
      if (result.exists) {
        return Result.success(
          Book.fromJson(result.data()!),
        );
      } else {
        return const Result.failed('failed to create book');
      }
    }

    return Result.success(result);
  }

  @override
  Future<Result<void>> deleteBook({required String uidBook}) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<Result<Book>> getBook({required String uidBook}) {
    // TODO: implement getBook
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Book>>> getBooks() async {
    CollectionReference<Map<String, dynamic>> book = _firebaseFirestore.collection('books');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await book.get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Book> bookList = querySnapshot.docs.map((e) => Book.fromSnapshot(e)).toList();

      return Result.success(bookList);
    } else {
      return const Result.failed('Failed fetch data');
    }
  }

  @override
  Future<Result> updateBook(
      {required String bookTitle,
      required String bookCode,
      required String authorName,
      required String publisherName,
      required String publisherYear}) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }
}
