enum TargetOfKunjugan {
  anakTidakHadir,
  anakStunting,
  ibuHamil,
}

enum Status {
  belumDiMulai,
  berjalan,
  selesai,
}

class KunjunganItem {
  DateTime date;
  TargetOfKunjugan target;
  Status status;
  double distance;
  KunjunganItem({
    required this.date,
    required this.target,
    required this.status,
    required this.distance,
  });
}
