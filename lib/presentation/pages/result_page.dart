import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Результаты'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.yellow[100],
              child: Text(
                'Общие результаты:\n\nСтатистика по:\nпроцент речевых с ошибкой\nпроцент слов из всего объема с ошибкой и сегментированный по ролям и без нее\n\nОтображать статистику на время',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Детализированные результаты:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Схема на регламент'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Прослушать аудио'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Скачать аудио'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Жалоба от роли'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.yellow[100],
                            child: Text(
                              'Было:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            color: Colors.yellow[50],
                            child: Text(
                              'Role 1: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac ex mauris. Cras ultrices, elit pellentesque quam, non fermentum erat enim sed ligula. Maecenas pharetra, erat a cursus iaculis, arcu massa lobortis purus, quis ultricies ante ac mi ut. Phasellus tincidunt sit amet ante nec cursus. \n\n'
                              'Role 2: Curabitur vel tempus orci. In pharetra arcu non mollis aliquam. Fusce tellus urna, dignissim eget hendrerit dignissim odio, eget bibendum felis imperdiet ut. Nunc nec tellus felis. \n\n'
                              'Role3: Praesent elementum vulputate vestibulum. Sed dictum ex vel lacus aliquam rutrum. Phasellus tincidunt Lorem ipsum at malesuada imperdiet, pulvinar nec lectus. Proin nunc enim, malesuada et amet bibendum arcu ac dui metus. Fusce maximus nec sapien eu tristique. Suspendisse iaculis sit amet arcu sit amet posuere. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quis sapien ante. \n\n'
                              'Role 2: Pellentesque sed diam vel nibh malesuada condimentum sit in sapien. Etiam convallis arcu ac dolor, nec venenatis lacus posuere. Sed accumsan augue neque nec purus semper blandit. Duis ultricies nibh augue. Phasellus tincidunt Lorem ipsum. Curabitur vestibulum, arcu nec cursus posuere, metus dolor ornare enim, at tristique ex lacus non dui. Integer nec bibum, laoreet lacus quis, fusce fermentum scelerisque. Nam tincidunt eu tortor ultricies pretium. Maecenas vitae varius orci.',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.yellow[100],
                            child: Text(
                              'Стало:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            color: Colors.yellow[50],
                            child: Text(
                              'Role 1: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac ex mauris. Cras ultrices, elit pellentesque quam, non fermentum erat enim sed ligula. Maecenas pharetra, erat a cursus iaculis, arcu massa lobortis purus, quis ultricies ante ac mi ut. Lorem ipsum sit amet ante nec cursus. \n\n'
                              'Role 2: Curabitur vel tempus orci. In pharetra arcu non mollis aliquam. Fusce tellus urna, dignissim eget hendrerit dignissim odio, eget bibendum felis imperdiet ut. Nunc nec tellus felis. \n\n'
                              'Role3: Praesent elementum vulputate vestibulum. Sed dictum ex vel lacus aliquam rutrum. Phasellus tincidunt Lorem ipsum at malesuada imperdiet, pulvinar nec lectus. Proin nunc enim, malesuada et amet bibendum arcu ac dui metus. Fusce maximus nec sapien eu tristique. Suspendisse iaculis sit amet arcu sit amet posuere. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quis sapien ante. \n\n'
                              'Role 2: Pellentesque sed diam vel nibh malesuada condimentum sit in sapien. Etiam convallis arcu ac dolor, nec venenatis lacus posuere. Sed accumsan augue neque nec purus semper blandit. Duis ultricies nibh augue. Phasellus tincidunt Lorem ipsum. Curabitur vestibulum, arcu nec cursus posuere, metus dolor ornare enim, at tristique ex lacus non dui. Integer nec bibum, laoreet lacus quis, fusce fermentum scelerisque. Nam tincidunt eu tortor ultricies pretium. Maecenas vitae varius orci.',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
