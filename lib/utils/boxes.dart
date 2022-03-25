import 'package:hive/hive.dart';

class Boxes {
  final Box getTokenBox = Hive.box('token');
  final Box getUserDetails = Hive.box('userDetails');
}
