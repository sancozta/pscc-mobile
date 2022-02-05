class Contact {
  String address;
  String email;
  String phone;
  String facebook;
  String instagram;
  String twitter;
  String youtube;
  String link;

  Contact({
    this.address,
    this.email,
    this.phone,
    this.facebook,
    this.instagram,
    this.twitter,
    this.youtube,
    this.link,
  });

  Contact.fromMap(Map data) {
    address = data['address'] ?? '';
    email = data['email'] ?? '';
    phone = data['phone'] ?? '';
    facebook = data['facebook'] ?? '';
    instagram = data['instagram'] ?? '';
    twitter = data['twitter'] ?? '';
    youtube = data['youtube'] ?? '';
    link = data['link'] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'email': email,
      'phone': phone,
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
      'youtube': youtube,
      'link': link,
    };
  }
}
