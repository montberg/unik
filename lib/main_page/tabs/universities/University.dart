class University {
  final String id;
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
  final List<int> specialities;


  factory University.fromJson(Map<String, dynamic> json) {
    final Contacts contacts = Contacts(address: json['address'], emailAddress: json['email'], phoneNumber: json['telephone'], city: json['city']);
    return University(
      id: json['id'],
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
      image: json['logoUrl'], rating: 0, ratingPlacement: 0,
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
      required this.specialities
      });
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
  final Degree degree;
  final double price;
  final String description;
  final String code;
  final String name;

  const Speciality(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.degree});
}
