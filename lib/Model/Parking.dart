class Parking {
  int bkCap;
  int carCap;
  int mtCap;
  int scCap;
  var name;
  var addrs;
  var idParking;

  Parking(this.bkCap, this.carCap, this.mtCap, this.scCap, this.name,
      this.addrs, this.idParking);

  Map<String, dynamic> toJson() => {
        'Bike Capacity': bkCap,
        'Car Capacity': carCap,
        'Motorcycle Capacity': mtCap,
        'Scooters Capacity': scCap,
        'Name': name,
        'address': addrs,
        'IDParking': idParking
      };
}
