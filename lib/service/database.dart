import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addTodayWork(Map<String, dynamic> userTodayMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Today")
        .doc(id)
        .set(userTodayMap);
  }

  Future addTomorrowWork(Map<String, dynamic> userTodayMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Tomorrow")
        .doc(id)
        .set(userTodayMap);
  }

  Future addNextWeekWork(Map<String, dynamic> userTodayMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("NextWeek")
        .doc(id)
        .set(userTodayMap);
  }

  Future<Stream<QuerySnapshot>> getalltheWork(String day) async {
    return await FirebaseFirestore.instance.collection(day).snapshots();
  }

  updateifTicked(String id, String day) async {
    return await FirebaseFirestore.instance
        .collection(day)
        .doc(id)
        .update({"Yes": true});
  }
}
