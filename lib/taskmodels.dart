
import 'package:hive/hive.dart';
part 'taskmodels.g.dart';

@HiveType(typeId: 0) // typeId must be unique across all your adapters


class Task extends HiveObject{
  @HiveField(0)
   final String title;
  
  @HiveField(1)
  final DateTime dateTime;

  @HiveField(2)
  bool isCompleted;

  Task({required this.title, required this.dateTime, required this.isCompleted});

}