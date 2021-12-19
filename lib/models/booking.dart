class Booking {
  String DoctorCategory;
  String DoctorName;
  String DoctorPhone;
  String email;
  String name;
  String phone;
  String resevationTime;
  String image;
  String addr;

  Booking(
      {this.DoctorCategory,
      this.DoctorName,
      this.DoctorPhone,
      this.email,
      this.name,
      this.phone,
      this.resevationTime,
      this.image,
      this.addr});

  Booking.fromJson(Map<String, dynamic> json) {
    DoctorCategory = json['DoctorCategory'];
    DoctorName = json['DoctorName'];
    DoctorPhone = json['DoctorPhone'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    resevationTime = json['resevationTime'];
    image = json['image'];
    addr = json['addr'];
  }

  //  TODO: resevationTime this should be string from angular to firebase firestore to solve the StreamProvider<UserData> issue

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DoctorCategory'] = this.DoctorCategory;
    data['DoctorName'] = this.DoctorName;
    data['DoctorPhone'] = this.DoctorPhone;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['resevationTime'] = this.resevationTime;
    data['image'] = this.image;
    data['addr'] = this.addr;
    return data;
  }
}
