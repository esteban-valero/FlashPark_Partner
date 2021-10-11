class Parking {
  int bkCap;
  int carCap;
  int mtCap;
  int scCap;
  String name;
  String addrs;

  Parking(
      this.bkCap, this.carCap, this.mtCap, this.scCap, this.name, this.addrs);

  Map<String, dynamic> toJson() => {
        'Bike Capacity': bkCap,
        'Car Capacity': carCap,
        'Motorcycle Capacity': mtCap,
        'Scooters Capacity': scCap,
        'Name': name,
        'address': addrs,
      };
}
