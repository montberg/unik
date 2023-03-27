class University {
  final int id;
  final String description;
  final List<Institute> institutes;
  final Contacts universityContacts;
  final String image;
  final String city;
  final String name;
  final bool accreditation;
  final bool dorms;
  final bool militarydep;
  final double rating;
  final double ratingPlacement;
  final String pricesLink;
  final String budgetPlacesLink;
  final String websiteLink;
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
      required this.city,
      required this.name,
      required this.accreditation,
      required this.dorms,
      required this.militarydep});
}

class Institute {
  final String name;
  final String description;
  final List<Speciality> specialities;
  const Institute(
      {required this.name,
      required this.description,
      required this.specialities});
}

class Contacts {
  final String phoneNumber;
  final String emailAddress;
  final String address;
  const Contacts(
      {required this.address,
      required this.emailAddress,
      required this.phoneNumber});
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
