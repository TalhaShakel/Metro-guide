import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  static  String iD=" ";
  static Future<void> addItem({
    required String type,
    required String Id,
    required String Duration,
    required String Price,
    required String Description,
  })async{
    DocumentReference documentReference = FirebaseFirestore.instance.
    collection('tickets').
    doc();
    Map<String,dynamic> data = <String,dynamic>{
      "type": type,
      'Id':Id,
      'Duration':Duration,
      'Price':Price,
      'description':Description,
    };
    await documentReference.set(data).whenComplete(() => print('note item inserted to Database')).catchError((e) =>print(e));
  }
  static Future<void> updateItem({
    required String type,
    required String Id,
    required String Duration,
    required String Price,
    required String docId,
    required String Description,
  }) async {
    DocumentReference documentReference = FirebaseFirestore.instance.
    collection('tickets').doc(docId);
    Map<String,dynamic> data = <String,dynamic>{
      "type": type,
      'Id':Id,
      'Duration':Duration,
      'Price':Price,
      'description':Description,
    };
    await documentReference.set(data).whenComplete(() => print('note item updated in Database')).catchError((e) =>print(e));
  }
  static Future<void> deleteItem({

    required String docId,
  }) async {
    DocumentReference documentReference = FirebaseFirestore.instance.
    collection('tickets').doc(docId);
    await documentReference.delete().whenComplete(() => print('item deleted from firebase')).catchError((e) =>print(e));
  }
  static Stream<QuerySnapshot> readItem(){
    CollectionReference notesItemcollection = FirebaseFirestore.instance.
    collection('tickets');
    return notesItemcollection.snapshots();
  }
  static Future<void> addstation({
    required String name,
    required String Id,
  })async{
    DocumentReference documentReference = FirebaseFirestore.instance.
    collection('admin').
    doc(FirebaseAuth.instance.currentUser!.uid).
    collection('stations').
    doc();
    Map<String,dynamic> data = <String,dynamic>{
      'Id':Id,
      'Station name':name,
    };
    await documentReference.set(data).whenComplete(() => print('note item inserted to Database')).catchError((e) =>print(e));
  }
  static Future<void> updatestation({
    required String name,
    required String Id,
    required String docId,
  }) async {
    DocumentReference documentReference = FirebaseFirestore.instance.
    collection('admin').doc(FirebaseAuth.instance.currentUser!.uid).collection('stations').doc(docId);
    Map<String,dynamic> data = <String,dynamic>{
      'Id':Id,
      'Station name':name,
    };
    await documentReference.set(data).whenComplete(() => print('note item updated in Database')).catchError((e) =>print(e));
  }
  static Stream<QuerySnapshot> readstation(){
    CollectionReference notesStationcollection = FirebaseFirestore.instance.
    collection('admin').doc(FirebaseAuth.instance.currentUser!.uid).collection('stations');
    return notesStationcollection.snapshots();
  }

  static Future<void> deletestation({

    required String docId,
  }) async {
    DocumentReference documentReference = FirebaseFirestore.instance.
    collection('admin').doc(FirebaseAuth.instance.currentUser!.uid).collection('stations').doc(docId);

    await documentReference.delete().whenComplete(() => print('item deleted from firebase')).catchError((e) =>print(e));
  }


}