class Reserve {
  String estado;
  String idParking;
  String idUser;
  String time;
  String vehiculo;

  Reserve(this.estado, this.idParking, this.idUser, this.time, this.vehiculo);

  Map<String, dynamic> toJson() => {
        'Estado': estado,
        'IDParking': idParking,
        'IDUser': idUser,
        'Time': time,
        'Vehiculo': vehiculo
      };
}
