import 'package:book_app/presentation/helpers/app_colors.dart';
import 'package:book_app/presentation/helpers/connectivity_service.dart';
import 'package:book_app/presentation/pages/book_page/methods/item_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:book_app/presentation/helpers/spacing.dart';
import 'package:book_app/presentation/provider/book_data/book_data_provider.dart';
import 'package:book_app/presentation/widget/text_field.dart';

class BookPage extends ConsumerStatefulWidget {
  const BookPage({super.key});

  @override
  ConsumerState<BookPage> createState() => _BookPageState();
}

class _BookPageState extends ConsumerState<BookPage> {
  final ConnectivityService connectivityService = ConnectivityService();
  final TextEditingController nameBookController = TextEditingController();
  final TextEditingController publishYearController = TextEditingController();
  final TextEditingController authNameController = TextEditingController();
  final TextEditingController publisherNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: backgroundColor,
        forceMaterialTransparency: true,
        elevation: 0.0,
        title: const Text('Lsit book'),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          nameBookController.clear();
          publishYearController.clear();
          publisherNameController.clear();
          authNameController.clear;

          showDialog(
            context: context,
            builder: (context) {
              return DialogFormBook(
                nameBookController: nameBookController,
                publishYearController: publishYearController,
                publisherNameController: publisherNameController,
                authNameController: authNameController,
                onTap: () {
                  ref
                      .read(bookDataProvider.notifier)
                      .createBook(
                        bookTitle: nameBookController.text,
                        authorName: authNameController.text,
                        publisherName: publisherNameController.text,
                        publisherYear: publishYearController.text,
                      )
                      .whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookPage(),
                        ));
                  });
                },
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 35, right: 10),
          child: Container(
            decoration: BoxDecoration(
              color: saffron,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.add,
                    color: backgroundColor,
                  ),
                  horizontalSpace(4),
                  const Text(
                    'Add Book',
                    style: TextStyle(color: backgroundColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ...(ref.watch(bookDataProvider).when(
                        error: (error, stackTrace) => [
                          Center(
                            child: Text(error.toString()),
                          )
                        ],
                        loading: () => [
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                        data: (data) {
                          return data!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: itemBook(
                                      e: e,
                                      onTapEdit: () {
                                        nameBookController.text = e.bookTitle ?? '';
                                        authNameController.text = e.authorName ?? '';
                                        publishYearController.text = e.publisherYear ?? '';
                                        publisherNameController.text = e.publisherName ?? '';
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return DialogFormBook(
                                              nameBookController: nameBookController,
                                              publishYearController: publishYearController,
                                              publisherNameController: publisherNameController,
                                              authNameController: authNameController,
                                              onTap: () {
                                                ref
                                                    .read(bookDataProvider.notifier)
                                                    .updateBook(
                                                      uid: e.id ?? '',
                                                      bookTitle: nameBookController.text,
                                                      authorName: authNameController.text,
                                                      publisherName: publisherNameController.text,
                                                      publisherYear: publishYearController.text,
                                                    )
                                                    .whenComplete(() {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => const BookPage(),
                                                      ));
                                                });
                                              },
                                            );
                                          },
                                        );
                                      },
                                      onTapDelete: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ConfirmationDelete(
                                              onTapDelete: () {
                                                ref.read(bookDataProvider.notifier).deleteBook(e.id ?? '').whenComplete(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ))
                              .toList();
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationDelete extends StatelessWidget {
  final VoidCallback onTapDelete;
  const ConfirmationDelete({
    required this.onTapDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Yakin ingin hapus?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: onTapDelete,
                    child: const Text(
                      'Hapus',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Batal',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DialogFormBook extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController nameBookController;
  final TextEditingController authNameController;
  final TextEditingController publisherNameController;
  final TextEditingController publishYearController;
  const DialogFormBook({
    Key? key,
    required this.onTap,
    required this.nameBookController,
    required this.authNameController,
    required this.publisherNameController,
    required this.publishYearController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Name book',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            KTextfield(
              controller: nameBookController,
            ),
            verticalSpace(10),
            const Text(
              'Author Name',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            KTextfield(
              controller: authNameController,
            ),
            verticalSpace(10),
            const Text(
              'Publish Year',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            KTextfield(
              controller: publishYearController,
            ),
            verticalSpace(10),
            const Text(
              'Publisher Name',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            KTextfield(
              controller: publisherNameController,
            ),
            verticalSpace(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onTap,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
