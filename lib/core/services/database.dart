import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iconnect/core/network/logger.dart';

class DatabaseService {
  final log = getLogger('Database');

  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: username)
        .get()
        .then((value) => log.i('user info from database ${value}'));
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

  getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .get()
        .then((value) =>
            log.i('user info from database ${value.docs[0].data()}'));
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection('users').add(userMap).catchError((e) {
      log.e('uploadUserInfo Exception ${e.toString()}.');
    });
  }

  // create chatroom

  createChatRoom(String chatRoomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection('chatRoom')
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      log.e('create room Exception ${e.toString}');
    });
  }
}
