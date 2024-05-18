import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_checkdoc/presentation/widgets/dropzone_widget.dart';
import 'package:flutter_checkdoc/service_locator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Документы'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () {
      //         Navigator.of(context).pushNamed('/upload');
      //       },
      //     ),
      //   ],
      // ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          // padding: EdgeInsets.only(top: 20),
          width: 1140,
          // height: 650,
          decoration: BoxDecoration(
            color: const Color.fromARGB(237, 237, 237, 237),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: const Row(
                          children: [
                            Icon(Icons.filter_alt, size: 40, color: Colors.red),
                            Text('Фильтр'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Поиск по времени, дате, имени файла',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/rzd_logo.png',
                      width: 65,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                // clipBehavior: Clip.antiAlias,
                                child: Card(
                                  child: Container(
                                    width: 500,
                                    height: 500,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        DropzoneWidget(targetClass: "audio"),
                                        const DropdownMenu(
                                          dropdownMenuEntries: <DropdownMenuEntry>[
                                            DropdownMenuEntry(
                                                value: 0,
                                                label: "Устав 1 . . ."),
                                            DropdownMenuEntry(
                                                value: 1,
                                                label: "Устав 2 . . ."),
                                          ],
                                        ),
                                        Container(
                                          width: 129,
                                          height: 39,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'ЗАГРУЗИТЬ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                          // Navigator.of(context).pushNamed('/upload');
                        },
                        child: Container(
                          width: 211,
                          height: 39,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add,
                                  size: 30,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              SizedBox(width: 10),
                              Text(
                                'ДОБАВИТЬ ЗАПИСЬ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: FutureBuilder(
                      future: fetchDocuments(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                          case ConnectionState.done:
                            return DataTable(
                              dividerThickness: 0,
                              headingRowColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.hovered)) {
                                    return Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5);
                                  }
                                  return const Color.fromARGB(237, 237, 237,
                                      237); // Use the default value.
                                },
                              ),
                              dataRowColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.hovered)) {
                                    return Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5);
                                  }
                                  return const Color.fromARGB(255, 255, 255,
                                      255); // Use the default value.
                                },
                              ),
                              columns: const [
                                DataColumn(label: Text('Название файла')),
                                DataColumn(label: Text('Время начала записи')),
                                DataColumn(label: Text('Длительность')),
                                DataColumn(label: Text('Статус обработки')),
                                DataColumn(label: Text('Статус проверки')),
                                DataColumn(label: Text('Действия')),
                              ],
                              rows: snapshot.hasData
                                  ? snapshot.data!.map((doc) {
                                      return DataRow(
                                          color: WidgetStateProperty
                                              .resolveWith<Color?>(
                                            (Set<WidgetState> states) {
                                              if (states.contains(
                                                  WidgetState.selected)) {
                                                return const Color(0xededed)
                                                    .withOpacity(0.08);
                                              }
                                              if (states.contains(
                                                  WidgetState.hovered)) {
                                                return const Color(0xededed)
                                                    .withOpacity(0.08);
                                              }
                                              return Colors
                                                  .white; // Use the default value.
                                            },
                                          ),
                                          cells: [
                                            DataCell(
                                              Text(doc.name),
                                              onTap: () {
                                                Navigator.of(context)
                                                    .pushNamed('/results');
                                              },
                                            ),
                                            DataCell(Text(doc.createdAt)),
                                            DataCell(
                                              Text(
                                                  // '${doc.startTime} - ${doc.endTime}',
                                                  "00.00 - 02.57"),
                                            ),
                                            DataCell(Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                      Icons.play_arrow),
                                                  onPressed: () {},
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.pause),
                                                  onPressed: () {},
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                      Icons.download),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            )),
                                            DataCell(Text(doc.verified
                                                ? 'Проверен'
                                                : 'Не проверен')),
                                            DataCell(Text(doc.verified
                                                ? 'Обработан'
                                                : 'Не обработан')),
                                          ]);
                                    }).toList()
                                  : [],
                            );

                          default:
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Document>> fetchDocuments() async {
    String url = dotenv.env['URL']! + 'v1/documents';
    String? accessToken = getIt<GlobalVariables>().accessToken;
    var _dio = getIt<Dio>();
    return _dio.get(
      url,
      queryParameters: {"auth_token": accessToken},
    ).then(
      (response) {
        if (response.statusCode == 200) {
          List<Document> documents = [];
          for (var doc in response.data) {
            documents.add(Document.fromJson(doc));
          }
          return documents;
        } else {
          throw Exception('Failed to load documents');
        }
      },
    );
  }
}

// class Document {
//   final String name;
//   final String time;
//   final String startTime;
//   final String endTime;
//   final String processingStatus;
//   final String verificationStatus;

//   Document(this.name, this.time, this.startTime, this.endTime,
//       this.processingStatus, this.verificationStatus);
class Document {
  final bool verified;
  final String id;
  final String createdAt;
  final bool isDeleted;
  final String cancellationReason;
  final String name;

  Document({
    required this.verified,
    required this.id,
    required this.createdAt,
    required this.isDeleted,
    required this.cancellationReason,
    required this.name,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      verified: json['verified'] ?? false,
      id: json['id'] ?? '',
      createdAt: json['created_at'] ?? '',
      isDeleted: json['is_deleted'] ?? false,
      cancellationReason: json['cancellation_reason'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
