import 'package:isar/isar.dart';
part 'sync_queue_model.g.dart';

@Collection()
class SyncQueue  {
  // id local db isar
  Id id = Isar.autoIncrement;

  late String collectionName; // eg: 'Book'
  late String operation; // CREATE, UPDATE, DELETE
  late String payload; // JSON string

  // @Enumerated(EnumType.values,'status')
  @enumerated
  late Status status = Status.pending; // pending, synced, failed
  late String link; // stored link to server
  String? errorMessage;
  late DateTime createdAt;
}


enum Status {
  pending,
  success,
  failed,
}