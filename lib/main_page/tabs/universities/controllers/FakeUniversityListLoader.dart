import 'package:flutter/material.dart';
import 'package:unik/main_page/tabs/universities/University.dart';
import 'package:unik/main_page/tabs/universities/interfaces/IUniversityListLoader.dart';
import '../widgets/UniversityCard.dart';

class FakeUniversityListLoader implements IUniversityListLoader{

  FakeUniversityListLoader();

  @override
  Future<List<Widget>> loadList() async {
    print('sending...');
    List<Widget> a = [];
    List<Speciality> specs = [
      const Speciality(
          name: "Прикладная информатика",
          code: "09.03.03",
          description: "Описание специальности 09.03.03",
          price: 150000,
          degree: Degree.bachelor),
      const Speciality(
          name: "Программная инженерия",
          code: "09.03.04",
          description: "Описание специальности 09.03.04",
          price: 150000,
          degree: Degree.bachelor),
      const Speciality(
          name: "Информационная безопасность",
          code: "10.04.01",
          description: "Описание специальности 10.04.01",
          price: 160000,
          degree: Degree.bachelor),
      const Speciality(
          name: "Информационная безопасность",
          code: "10.04.01",
          description: "Описание специальности 10.04.01",
          price: 160000,
          degree: Degree.bachelor),

      const Speciality(
          name: "Нефтегазовое дело",
          code: "21.03.01",
          description: "Описание специальности 21.03.01",
          price: 130000,
          degree: Degree.bachelor),
      const Speciality(
          name: "Нефтегазовое дело",
          code: "21.03.01",
          description: "Описание специальности 21.03.01",
          price: 130000,
          degree: Degree.bachelor),
      const Speciality(
          name: "Химическая технология (профиль Химическая технология природных энергоносителей и углеродных материалов)",
          code: "18.03.01",
          description: "Описание специальности 21.03.01",
          price: 130000,
          degree: Degree.bachelor),
    ];
    List<Institute> institutes = [
      Institute(name: "Институт нефти, газа и энергетики (ИНГЭ)", description: "В 1993 году в связи с началом подготовки на базе факультета энергетики инженеров нефтегазового профиля по специальностям «Разработка и эксплуатация нефтяных и газовых месторождений», «Бурение нефтяных и газовых скважин», «Оборудование нефтяных и газовых промыслов» энергетический факультет был преобразован в факультет нефти, газа и энергетики. Современный Институт нефти, газа и энергетики создан 1 сентября 2012 года приказом ректора КубГТУ № 1286-Л от 09.07.2012. Институт является правопреемником Института нефти, газа, энергетики и безопасности, организованного ранее в 2008 году.", specialities: specs),
      Institute(name: "Институт компьютерных систем и информационной безопасности (ИКСиИБ)", description: "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.", specialities: specs)
    ];

    for (var i = 0; i < 10; i++) {
      var fakeUni = University(
        accreditation: true,
        image: "https://proverili.ru/uploads/media/21497/1.jpg",
        dorms: true,
        militarydep: false,
        name: 'Кубанский государственный технологический университет',
        city: 'Краснодар',
        id: i,
        institutes: institutes,
        universityContacts: const Contacts(
            emailAddress: '123@123.com',
            address: 'ул. Пушкина, 123',
            phoneNumber: '+8239482428'),
        description: 'Кубанский государственный технологический университет — старейшее высшее учебное заведение на Кубани и Северном Кавказе — основан 16 июня 1918 года решением съезда Совета народного образования Кубано-Черноморской Республики как Северо-Кавказский политехнический институт.', ratingPlacement: 15, rating: 5.0, pricesLink: "dsd", budgetPlacesLink: "sfsd", websiteLink: "dsd"
      );
      var uniCardInfo =
          UniversityCardInfo(favourite: true, university: fakeUni);
      a.add(UniversityCard(universityCardInfo: uniCardInfo));
    }
    return Future<List<Widget>>.delayed(const Duration(seconds: 1), () => a);
  }
}
