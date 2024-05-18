import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecordListPage extends StatelessWidget {
  final List<Document> documents = [
    Document('Justin Septimus', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Проверен'),
    Document('Anika Rhiel Madsen', '14:35:55 18.05.2024', '00:00', '02:57',
        'В очереди', 'Проверен'),
    Document('Miracle Vaccaro', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Проверен'),
    Document('Erin Levin', '14:35:55 18.05.2024', '00:00', '02:57',
        'В обработке', 'Проверен'),
    Document('Mira Herwitz', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Ожидает проверки'),
    Document('Jaxson Siphron', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Проверен'),
    Document('Mira Levin', '14:35:55 18.05.2024', '00:00', '02:57', 'Обработан',
        'Ожидает проверки'),
    Document('Lincoln Levin', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Проверен'),
    Document('Lincoln Levin', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Проверен'),
    Document('Cheyenne Ekstrom Bothman', '14:35:55 18.05.2024', '00:00',
        '02:57', 'Обработан', 'Ожидает проверки'),
    Document('Justin Septimus', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Проверен'),
    Document('Anika Rhiel Madsen', '14:35:55 18.05.2024', '00:00', '02:57',
        'В очереди', 'Проверен'),
    Document('Miracle Vaccaro', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Проверен'),
    Document('Erin Levin', '14:35:55 18.05.2024', '00:00', '02:57',
        'В обработке', 'Проверен'),
    Document('Mira Herwitz', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Ожидает проверки'),
    Document('Jaxson Siphron', '14:35:55 18.05.2024', '00:00', '02:57',
        'Обработан', 'Проверен'),
  ];

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
          width: 1130,
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
                        onTap: () {
                          Navigator.of(context).pushNamed('/upload');
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
                  child: DataTable(
                    dividerThickness: 0,
                    headingRowColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5);
                        }
                        return const Color.fromARGB(
                            237, 237, 237, 237); // Use the default value.
                      },
                    ),
                    dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5);
                        }
                        return const Color.fromARGB(
                            255, 255, 255, 255); // Use the default value.
                      },
                    ),
                    columns: [
                      const DataColumn(label: Text('Название файла')),
                      const DataColumn(label: Text('Время начала записи')),
                      const DataColumn(label: Text('Длительность')),
                      const DataColumn(label: Text('Статус обработки')),
                      const DataColumn(label: Text('Статус проверки')),
                      const DataColumn(label: Text('Действия')),
                    ],
                    rows: documents.map((doc) {
                      return DataRow(
                          color: WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return const Color(0xededed).withOpacity(0.08);
                              }
                              if (states.contains(WidgetState.hovered)) {
                                return const Color(0xededed).withOpacity(0.08);
                              }
                              return Colors.white; // Use the default value.
                            },
                          ),
                          cells: [
                            DataCell(
                              Text(doc.name),
                              onTap: () {
                                Navigator.of(context).pushNamed('/results');
                              },
                            ),
                            DataCell(Text(doc.time)),
                            DataCell(Text('${doc.startTime} - ${doc.endTime}')),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.play_arrow),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.pause),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.download),
                                  onPressed: () {},
                                ),
                              ],
                            )),
                            DataCell(Text(doc.processingStatus)),
                            DataCell(Text(doc.verificationStatus)),
                          ]);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Document {
  final String name;
  final String time;
  final String startTime;
  final String endTime;
  final String processingStatus;
  final String verificationStatus;

  Document(this.name, this.time, this.startTime, this.endTime,
      this.processingStatus, this.verificationStatus);
}
