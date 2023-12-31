import 'package:book_app/data/database_helper/database_helper.dart';
import 'package:book_app/data/repository/list_book_repository.dart';
import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/entities/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseListBook implements ListBookRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseListBook({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final DatabaseHelper _databaseHelper = DatabaseHelper();
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
  Future<Result<void>> deleteBook({required String uidBook}) async {
    DocumentReference<Map<String, dynamic>> doc = _firebaseFirestore.doc('books/$uidBook');
    await doc.delete();

    DocumentSnapshot<Map<String, dynamic>> result = await doc.get();
    if (result.exists) {
      await getBooks();
      return const Result.failed('Failed delete book');
    } else {
      return const Result.success(null);
    }
  }

  @override
  Future<Result<List<Book>>> getBooks() async {
    CollectionReference<Map<String, dynamic>> book = _firebaseFirestore.collection('books');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await book.get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Book> bookList = querySnapshot.docs.map((e) => Book.fromSnapshot(e)).toList();
      bookList.map((e) => _databaseHelper.insertBook(e.toJson()));

      return Result.success(bookList);
    } else {
      List<Map<String, dynamic>> result = await _databaseHelper.getBukuList();
      List<Book> list = result.map((e) => Book.fromJson(e)).toList();
      return Result.success(list);
    }
  }

  @override
  Future<Result> updateBook({
    required String bookTitle,
    required String uid,
    required String authorName,
    required String publisherName,
    required String publisherYear,
  }) async {
    DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore.doc('books/$uid');
    await documentReference.update(Book(
      bookTitle: bookTitle,
      authorName: authorName,
      publisherName: publisherName,
      publisherYear: publisherYear,
    ).toJson());
    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();

    if (result.exists) {
      await getBooks();
      return Result.success(updateBook);
    } else {
      return const Result.failed('Failed to update book');
    }
  }
}
