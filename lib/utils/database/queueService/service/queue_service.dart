import 'package:isar/isar.dart';
import '../../../../utils/network_utils/network_utils.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../logger/logger.dart';
import '../../database_service.dart';
import '../model/sync_queue_model.dart';

class QueueService {
  // queue sync digunakan untuk operation post & put ketika creatae pasti pending
  Future<void> addQueue(
    String collectionName,
    String opreation,
    String payload,
    String link,
  ) async {
    final queue = SyncQueue()
      ..collectionName = collectionName
      ..operation = opreation
      ..payload = payload
      ..link = link
      ..status = Status.pending
      ..createdAt = DateTime.now();

    // Gunakan DatabaseService.db untuk mengakses instance Isar
    await DatabaseService.db.writeTxn(() async {
      await DatabaseService.db.syncQueues.put(queue);
    });
  }

  Future<void> syncQueue() async {
    final pendingQueue = await DatabaseService.db.syncQueues
        .filter()
        .statusEqualTo(Status.pending)
        .findAll();

    for (final queue in pendingQueue) {
      try {
        logger.d("Syncing queue: ${queue.collectionName} ${queue.operation}");

        bool success;
        String? errorMessage;

        if (queue.operation == 'post') {
          (success, errorMessage) = await postToServer(queue);
        } else if (queue.operation == 'patch') {
          (success, errorMessage) = await patchToServer(queue);
        } else {
          // If operation is not recognized, mark as failed
          success = false;
          errorMessage = 'Unknown operation: ${queue.operation}';
        }

        queue.status = success ? Status.success : Status.failed;
        queue.errorMessage = errorMessage;

        await DatabaseService.db.writeTxn(() async {
          await DatabaseService.db.syncQueues.put(queue);
        });
      } catch (e) {
        logger.e("Sync failed: $e");
        queue.status = Status.failed;

        await DatabaseService.db.writeTxn(() async {
          await DatabaseService.db.syncQueues.put(queue);
        });
      }
    }

    // after sync, delete all success queue
    await DatabaseService.db.writeTxn(() async {
      await DatabaseService.db.syncQueues
          .filter()
          .statusEqualTo(Status.success)
          .deleteAll();
    });

    // ? setelah berhasil mengpost data ke server maka kita perlu untuk menghapus data local 
    //! namun disini terlalu boilerplate jika kita memiliki banyak fitur yang perlu offline first approch
    //! PROBLEM 
    // after sync delete all success task
    // await DatabaseService.db.writeTxn(() async {
    //   await DatabaseService.db.bookLocalModels
    //       .filter()
    //       .isSyncedEqualTo(false)
    //       .deleteAll();
    // });
  }

  Future<(bool success, String? errorMessage)> postToServer(
    SyncQueue queue,
  ) async {
    final String? accessToken = await SharedPrefUtils().getAccessToken();
    final String body = queue.payload;
    final String link = queue.link;

    try {
      final response = await NetworkUtils(token: accessToken).post(link, body);
      logger.d(response.toString());

      final int statusCode = response[0] as int;
      if (statusCode != 201) {
        return (false, response[1] as String?);
      }
      return (true, null);
    } catch (e) {
      logger.e("Post failed: $e");
      return (false, e.toString());
    }
  }

  Future<(bool success, String? errorMessage)> patchToServer(
    SyncQueue queue,
  ) async {
    final String? accessToken = await SharedPrefUtils().getAccessToken();
    final String body = queue.payload;
    final String link = queue.link;

    try {
      final response = await NetworkUtils(token: accessToken).patch(link, body);
      // final response = await NetworkUtils(token: accessToken).put(link, body);
      logger.d(response.toString());

      final int statusCode = response[0] as int;
      if (statusCode != 200) {
        return (false, response[1] as String?);
      }
      return (true, null);
    } catch (e) {
      logger.e("Patch failed: $e");
      return (false, e.toString());
    }
  }

  Future<void> clearQueue() async {
    await DatabaseService.db.writeTxn(() async {
      await DatabaseService.db.syncQueues.clear();
    });
  }

  Future<void> deleteQueue(int id) async {
    await DatabaseService.db.writeTxn(() async {
      await DatabaseService.db.syncQueues.delete(id);
    });
  }
  Future<List<SyncQueue>> getAllQueue() async {
    return await DatabaseService.db.syncQueues.where().findAll();
  }
}
