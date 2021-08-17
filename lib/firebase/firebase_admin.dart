import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:der_homberger_app/screens/shared/error_screen.dart';
import 'package:der_homberger_app/utility/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAdmin {
  static Future<bool> createCollection(BuildContext context, String collectionName) async {
    CollectionReference collectionsRef = FirebaseFirestore.instance.collection("collections");
    bool successful = false;

    print("createCollection");

    await collectionsRef.add({
      'name': cleanUpStrings(collectionName),
    }).then((_) {
      showBottomSheet(context: context, builder: (context) => SnackBar(content: Text("Erfolg!")));
    }).catchError((error) {
      print("catchError");
      Functions.pushScreen(
          context,
          ErrorScreen(
            message: "Oof something went wrong",
            exception: error,
          ));
    });

    Functions.bringHome(context);
    return successful;
  }

  static String cleanUpStrings(String dirtyString) {
    return dirtyString.trim();
  }
}
