import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DropzoneWidget extends StatefulWidget {
  @override
  _DropzoneWidgetState createState() => _DropzoneWidgetState();
}

class _DropzoneWidgetState extends State<DropzoneWidget> {
  late DropzoneViewController controller;
  bool isHovered = false;
  bool isReady = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 200,
        width: 200,
        color: isHovered
            ? Colors.grey
            : ColorScheme.fromSeed(seedColor: Colors.deepPurple).surface,
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: const Color.fromARGB(255, 0, 0, 0),
          radius: Radius.circular(10),
          borderPadding: EdgeInsets.all(10),
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              DropzoneView(
                onCreated: (controller) => this.controller = controller,
                onDrop: acceptFile,
                onHover: () {
                  setState(() {
                    isHovered = true;
                  });
                },
                onLeave: () {
                  setState(() {
                    isHovered = false;
                  });
                },
              ),
              Center(
                child: !isReady
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file,
                            size: 100,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Column(
                            children: [
                              Text(
                                'Загрузите файл',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '(.pdf, .docx, .xls)',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(
                        color: Colors.green,
                        child: const Center(
                          child: ClipRRect(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.done),
                                Text(" Загружено"),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future acceptFile(dynamic event) async {
    setState(() {
      isReady = true;
      isHovered = false;
    });
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name: $name');
    print('Mime: $mime');
    print('Bytes: $bytes');
    print('Url: $url');
  }
}
