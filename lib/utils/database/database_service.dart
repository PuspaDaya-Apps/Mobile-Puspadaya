import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'queueService/model/sync_queue_model.dart';

class DatabaseService {
  // setiap membuat shcema selalu daftarkan disini
  static late final Isar db;
  static Future<void> setup() async {
    final appDir = await getApplicationDocumentsDirectory();
    db = await Isar.open([SyncQueueSchema], inspector: true, directory: appDir.path);
  }
}
