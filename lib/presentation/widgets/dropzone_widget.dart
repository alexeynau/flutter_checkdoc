import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_checkdoc/domain/use_cases/upload_file.dart';
import 'package:flutter_checkdoc/service_locator.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../../domain/entities/document.dart';
import '../../domain/use_cases/validate_document.dart';

class DropzoneWidget extends StatefulWidget {
  String targetClass;

  DropzoneWidget({required this.targetClass});
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
          radius: const Radius.circular(10),
          borderPadding: const EdgeInsets.all(10),
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
    final UploadDocument uploadDocument = getIt.get<UploadDocument>();
    final ValidateDocument validateDocument = getIt.get<ValidateDocument>();
    setState(() {
      isHovered = false;
    });
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);
    final data = await controller.getFileData(event);

    print('Name: $name');
    print('Mime: $mime');
    print('Bytes: $bytes');
    print('Url: $url');

    final uploaded = await uploadDocument(UploadDocumentParams(
      document: UserDocument(
        name: name,
        targetClass: widget.targetClass,
        content: data,
      ),
    ));

    if (uploaded.isRight()) {
      // polling logic
      bool getValidation = false;

      while (!getValidation) {
        final toValidate = await validateDocument(
          ValidateDocumentParams(
            docId: uploaded.fold((l) => '', (r) => r.docId),
          ),
        );

        if (toValidate.isRight()) {
          toValidate.fold((l) => null, (r) {
            if (r.verified != null) {
              if (r.verified!) {
                getValidation = true;
                setState(() {
                  isReady = true;
                });
              } else {
                // To do: handle failed validation
                getValidation = false;
              }
            }
          });
        } else {
          await Future.delayed(const Duration(seconds: 1));
        }
      }
    } else {
      print('Error: ${uploaded.fold((l) => l.cause, (r) => '')}');
    }
  }
}
