class BusinessCardModel {
  String name;
  String? title;
  String? email;
  String? phone;
  String? imagePath;
  String? background;
  String? company;
  String? qr;
  String? cardTemplate;

  BusinessCardModel({
    required this.name,
    this.title,
    this.email,
    this.phone,
    this.imagePath,
    this.company,
    this.background,
    this.qr,
    required this.cardTemplate,
  });

  Map<String, dynamic> toJson() => {
    //Convert to json to store on db
    'name': name,
    'title': title,
    'email': email,
    'phone': phone,
    'imagePath': imagePath,
    'background': background,
    'company': company,
    'qr': qr,
    'cardTemplate': cardTemplate,
  };

  factory BusinessCardModel.fromJson(
    Map<String, dynamic> json,
  ) => // Convert json to BusinessCardObject
  BusinessCardModel(
    name: json['name'],
    title: json['title'],
    email: json['email'],
    phone: json['phone'],
    imagePath: json['imagePath'],
    company: json['company'],
    background: json['background'],
    qr: json['qr'],
    cardTemplate: json['cardTemplate'],
  );
}
