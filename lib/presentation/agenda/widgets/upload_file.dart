import 'dart:io';
import 'package:flutter/material.dart';

class AttachmentNotifier extends ValueNotifier<AttachmentNotifier> {
  AttachmentNotifier() : super(AttachmentNotifier());

  File? _attachmentFile;
  String? _attachmentFileName;

  File? get attachmentFile => _attachmentFile;
  String? get attachmentFileName => _attachmentFileName;

  void setAttachment(File? file, String? name) {
    _attachmentFile = file;
    _attachmentFileName = name;
    notifyListeners();
  }
}
