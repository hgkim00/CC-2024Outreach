import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataController extends ChangeNotifier {
  final db = FirebaseFirestore.instance;

  int donation = 0;
  int donationPercent = 0;
  int donor = 0;

  DataController() {
    getInfo();
  }

  Future<void> getInfo() async {
    final doc = await db.collection('data').doc('donation').get();
    donation = doc['donation'];
    donationPercent = ((donation / 8765000) * 100).toInt();
    donor = doc['donor'];

    Map<String, int> data = {
      'donation': donation,
      'donationPercent': donationPercent,
      'donor': donor,
    };

    log("get data: ");
    notifyListeners();
    // return data;
  }
}
