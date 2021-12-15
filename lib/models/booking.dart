class Booking {
  String DoctorCategory;
  String DoctorName;
  String DoctorPhone;
  String email;
  String name;
  String phone;
  String resevationTime;

  Booking({
    this.DoctorCategory,
    this.DoctorName,
    this.DoctorPhone,
    this.email,
    this.name,
    this.phone,
    this.resevationTime,
  });

  Booking.fromJson(Map<String, dynamic> json) {
    DoctorCategory = json['DoctorCategory'];
    DoctorName = json['DoctorName'];
    DoctorPhone = json['DoctorPhone'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    resevationTime = json['resevationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DoctorCategory'] = this.DoctorCategory;
    data['DoctorName'] = this.DoctorName;
    data['DoctorPhone'] = this.DoctorPhone;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['resevationTime'] = this.resevationTime;
    return data;
  }
}
