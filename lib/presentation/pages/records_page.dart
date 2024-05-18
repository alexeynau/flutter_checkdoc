import 'package:flutter/material.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Документы'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/upload');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Поиск по времени, дате, имени файла',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Название файла')),
                  DataColumn(label: Text('Время начала записи')),
                  DataColumn(label: Text('Длительность')),
                  DataColumn(label: Text('Статус обработки')),
                  DataColumn(label: Text('Статус проверки')),
                  DataColumn(label: Text('Действия')),
                ],
                rows: documents.map((doc) {
                  return DataRow(cells: [
                    DataCell(Text(doc.name)),
                    DataCell(Text(doc.time)),
                    DataCell(Text('${doc.startTime} - ${doc.endTime}')),
                    DataCell(Text(doc.processingStatus)),
                    DataCell(Text(doc.verificationStatus)),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.pause),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.download),
                          onPressed: () {},
                        ),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
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
