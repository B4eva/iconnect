import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iconnect/core/network/logger.dart';

class DatabaseService {
  final log = getLogger('Database');

  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: username)
        .get()
        .then((value) =>
            log.i('user info from database ${value.docs[0]['name']}'));
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .where('name', isEqualTo: username)
    //     .snapshots()
    //     .listen(
    //         (data) => log.i('user info from database ${data.docs[0]['name']}'))
    //     .onError((e) {
    //   log.i('user info from database $e');
    // });
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection('users').add(userMap).catchError((e) {
      log.e('uploadUserInfo Exception ${e.toString()}.');
    });
  }
}
