class University {
  final int id;
  final String description;
  final List<dynamic> institutes;
  final Contacts universityContacts;
  final String image;
  final String name;
  final bool accreditation;
  final bool dorms;
  final bool militarydep;
  final double? rating;
  final double? ratingPlacement;
  final String pricesLink;
  final String budgetPlacesLink;
  final String websiteLink;
  final String? logoUrl;
  final List<Speciality> specialities;

  factory University.fromJson(Map<String, dynamic> json) {
    final Contacts contacts = Contacts(
        address: json['address'],
        emailAddress: json['email'],
        phoneNumber: json['telephone'],
        city: json['city']);
    return University(
      id: int.parse(json['id']),
      universityContacts: contacts,
      name: json['name'],
      logoUrl: json['logoUrl'],
      accreditation: json['accreditation'],
      dorms: json['dormitory'],
      militarydep: json['militaryDepartment'],
      description: json['description'],
      budgetPlacesLink: json['budgetPlacesFileUrl'],
      pricesLink: json['pricesFileUrl'],
      websiteLink: json['websiteUrl'],
      institutes: json['institutes'],
      image: json['logoUrl'],
      rating: 0,
      ratingPlacement: 0,
      specialities: [],
    );
  }

  const University(
      {required this.rating,
      required this.ratingPlacement,
      required this.pricesLink,
      required this.budgetPlacesLink,
      required this.websiteLink,
      required this.institutes,
      required this.description,
      required this.universityContacts,
      required this.id,
      required this.image,
      required this.name,
      required this.accreditation,
      required this.dorms,
      required this.militarydep,
      required this.logoUrl,
      required this.specialities});
}

class Institute {
  final int id;
  final String name;
  final String description;
  final List<Speciality> specialities;
  final Contacts instituteContacts;
  const Institute(
      {required this.id,
      required this.name,
      required this.description,
      required this.specialities,
      required this.instituteContacts});
}

class Contacts {
  final String phoneNumber;
  final String emailAddress;
  final String address;
  final String city;
  const Contacts(
      {required this.address,
      required this.emailAddress,
      required this.phoneNumber,
      required this.city});
}

enum Degree { bachelor, specialty, master }

class Speciality {
  final int id;
  final Degree degree;
  final double price;
  final String description;
  final String code;
  final String name;
  final int pointsSumBudget;
  final int pointsSum;
  final List<String> subjects;
  final Map<String, int> points;

  const Speciality(
      {required this.subjects,
        required this.id,
      required this.name,
      required this.pointsSumBudget,
      required this.pointsSum,
      required this.code,
      required this.description,
      required this.price,
      required this.degree,
      required this.points});

  Map<String, dynamic> toJson() => {
        'id': id,
        'degree': degree.toString().split('.').last,
        'price': price,
        'description': description,
        'code': code,
        'name': name,
        'points': points,
        'pointsSum': pointsSum,
        'pointsSumBudget': pointsSumBudget,
    'subjects':subjects
      };

  factory Speciality.fromJson(Map<String, dynamic> json) {
    var pointsMap = json['points'] != null
        ? Map<String, int>.from(json['points'])
        : Map<String, int>();

    return Speciality(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        description: json['description'],
        price: json['price'],
        degree: Degree.bachelor,
        points: pointsMap,
        pointsSum: json['pointsSum'],
        pointsSumBudget: json['pointsSumBudget'],
        subjects: List<String>.from(json['subjects'] as List<dynamic>),
    );
  }
}
