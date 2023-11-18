import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/presentation/helpers/spacing.dart';
import 'package:flutter/material.dart';

Widget itemBook({
  required Book e,
  required VoidCallback onTapEdit,
  required VoidCallback onTapDelete,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      child: ListTile(
        title: Text(e.bookTitle ?? ""),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Penulis ${e.authorName}'),
            Text('Tahun ${e.publisherYear}'),
            Text('Penerbi ${e.publisherName}'),
          ],
        ),
        trailing: Column(
          children: [
            GestureDetector(onTap: onTapEdit, child: const Icon(Icons.edit)),
            verticalSpace(8),
            GestureDetector(onTap: onTapDelete, child: const Icon(Icons.delete)),
          ],
        ),
      ),
    ),
  );
}
