abstract class InterfaceDbService<T> {
  Future<List<T>> getAllData(); //get all
  Future<T?> getDataById(String id); //get data by id server
  Future<void> createData(T data); //create data
  Future<void> updateData(T data); //update data
  Future<void> saveData(List<T> data); //save data List from server
  Future<void> clearData(); //clear all data 
  Future<List<T>> getsyncedData(); //get all synced 
  Future<List<T>> getUnsyncedData(); //get all unsynced
  Future<void> clearSyncedData(); // clear all synced
  Future<void> clearUnsyncedData(); // clear all unsynced
  Future<List<T>> getUpdatedDataForServerSync();
  Future<void> clearServerOnlyData();
  Future<List<T>> getMergedDisplayData();

}
