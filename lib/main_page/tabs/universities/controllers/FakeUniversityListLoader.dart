import 'package:flutter/material.dart';
import 'package:unik/main_page/tabs/universities/University.dart';

import 'package:unik/main_page/tabs/universities/interfaces/IUniversityListLoader.dart';
import '../widgets/UniversityCard.dart';
import '../widgets/university_page/SpecialityTile.dart';

var contacts = Contacts(
    city: 'Краснодар',
    emailAddress: '123@123.com',
    address: 'Пушкина, 123',
    phoneNumber: '+8239482428');
List<Speciality> specs = [
  const Speciality(
      id: 0,
      name: "Прикладная информатика",
      code: "09.03.03",
      description:
      """В рамках направления ведётся подготовка квалифицированных профессионалов в сферах системного анализа прикладной области информатизации и цифровизации; формализации решения прикладных задач и процессов информационных систем; разработки проектов автоматизации и информатизации прикладных процессов и создания информационных систем в прикладных областях; разработки проектов цифровизации; выполнения работ по созданию, модификации, внедрению и сопровождению информационных систем и управления этими работами. Студенты изучают прикладные и информационные процессы, информационные системы и технологии, требующие применения практических навыков анализа, моделирования, реинжиниринга, проектирования, разработки и сопровождения.""",
      price: 150000,
      degree: Degree.bachelor,
      points: {
        "Математика": 77,
        "Русский язык": 78,
        "Физика": 76,
        "Информатика и ИКТ": 68
      }),
  const Speciality(
      id: 1,
      name: "Программная инженерия",
      code: "09.03.04",
      description:
      "В рамках направления ведётся подготовка профессионалов в широком спектре технологий индустриального производства программного обеспечения для информационно-вычислительных систем различного назначения, в том числе в сферах применения современных методов и технологий проектирования, а также стандартов, регламентирующих жизненный цикл ПО. Обучение включает овладение навыками программирования на различных инструментальных платформах, а также изучение подходов к использованию готовых программных компонентов и методов их интеграции. Студенты изучают методы и инструменты разработки программного продукта, а также концепцию его жизненного цикла, установленную российскими и международными стандартами ГОСТ 34.601-90, ISO/IEC/IEEE 12207:2017 и ГОСТ Р ИСО/МЭК 12207-2010.",
      price: 150000,
      degree: Degree.bachelor,
      points: {
        "Математика": 69,
        "Русский язык": 68,
        "Физика": 70,
        "Информатика и ИКТ": 78
      }),
  const Speciality(
      id: 2,
      name: "Информационная безопасность",
      code: "10.04.01",
      description:
      "Основными видами деятельности магистра являются: проведение научных и прикладных исследований, преподавание дисциплин, относящихся к сфере «Информационная безопасность», ведение аналитической, проектной и организационной работы в области менеджмента по информационной безопасности региональных информационных объектов, включая и финансово-кредитные структуры.",
      price: 160000,
      degree: Degree.bachelor,
      points: {
        "Математика": 75,
        "Русский язык": 80,
        "Физика": 95,
        "Информатика и ИКТ": 90
      }),
  const Speciality(
      id:3,
      name: "Нефтегазовое дело",
      code: "21.03.01",
      description: "Описание специальности 21.03.01",
      price: 130000,
      degree: Degree.bachelor,
      points: {
        "Математика": 75,
        "Русский язык": 80,
        "Физика": 95,
        "Информатика и ИКТ": 90
      }),
  const Speciality(
      id: 4,
      name: "Нефтегазовое дело",
      code: "21.03.01",
      description: "Описание специальности 21.03.01",
      price: 130000,
      degree: Degree.bachelor,
      points: {
        "Математика": 75,
        "Русский язык": 80,
        "Физика": 95,
        "Информатика и ИКТ": 90
      }),
  const Speciality(
      id: 5,
      name:
      "Химическая технология (профиль Химическая технология природных энергоносителей и углеродных материалов)",
      code: "18.03.01",
      description: "Описание специальности 21.03.01",
      price: 130000,
      degree: Degree.bachelor,
      points: {
        "Математика": 75,
        "Русский язык": 80,
        "Физика": 95,
        "Информатика и ИКТ": 90
      }),
];
List<Institute> institutes = [
  Institute(
      name: "Институт нефти, газа и энергетики (ИНГЭ)",
      description:
      "В 1993 году в связи с началом подготовки на базе факультета энергетики инженеров нефтегазового профиля по специальностям «Разработка и эксплуатация нефтяных и газовых месторождений», «Бурение нефтяных и газовых скважин», «Оборудование нефтяных и газовых промыслов» энергетический факультет был преобразован в факультет нефти, газа и энергетики. Современный Институт нефти, газа и энергетики создан 1 сентября 2012 года приказом ректора КубГТУ № 1286-Л от 09.07.2012. Институт является правопреемником Института нефти, газа, энергетики и безопасности, организованного ранее в 2008 году.",
      specialities: specs,
      instituteContacts: contacts,
      id: 1),
  Institute(
      name:
      "Институт компьютерных систем и информационной безопасности (ИКСиИБ)",
      description:
      "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
      specialities: specs,
      instituteContacts: contacts,
      id: 2)
];
List<UniversityCard> a = [
  UniversityCard(
      universityCardInfo: UniversityCardInfo(
          favourite: true,
          university: University(
              specialities: specs,
              accreditation: true,
              image: "https://proverili.ru/uploads/media/21497/1.jpg",
              dorms: true,
              militarydep: false,
              name: 'Кубанский государственный технологический университет',
              id: 1,
              institutes: institutes,
              universityContacts: contacts,
              description:
              'Кубанский государственный технологический университет — старейшее высшее учебное заведение на Кубани и Северном Кавказе — основан 16 июня 1918 года решением съезда Совета народного образования Кубано-Черноморской Республики как Северо-Кавказский политехнический институт.',
              ratingPlacement: 1,
              rating: 5.0,
              pricesLink:
              "https://kubstu.ru/data/struct/0042/%D0%91%D1%83%D0%BA%D0%BB%D0%B5%D1%82%202023.pdf",
              budgetPlacesLink:
              "https://kubstu.ru/data/struct/0042/%D0%91%D1%83%D0%BA%D0%BB%D0%B5%D1%82%202023.pdf",
              websiteLink: "https://kubstu.ru/",
              logoUrl: ''))),
  UniversityCard(
      universityCardInfo: UniversityCardInfo(
          favourite: true,
          university: University(
              specialities: specs,
              accreditation: true,
              image:
              "https://smapse.ru/storage/2022/04/kubanskij-gosudarstvennyj-agrarnyj-universitet-im-i-t-trubilina-smapse1.png",
              dorms: true,
              militarydep: false,
              name: 'Кубанский государственный аграрный университет',
              id: 0,
              institutes: institutes,
              universityContacts: contacts,
              description:
              'Кубанский государственный аграрный университет им. И.Т. Трубилина (КубГАУ) – одно из крупнейших аграрных учреждений высшего образования в России. В 1918 году был создан сельскохозяйственный отдел при Кубанском политехникуме, который в 1922 году был преобразован в самостоятельное учреждение. Спустя почти 70 лет вуз получил своё нынешнее название.\n\nВ университете обучаются порядка 35 000 студентов очной и заочной форм. Около 4000 высококвалифицированных преподавателей ведут дисциплины различных областей. В КубГАУ можно получить диплом бакалавра, специалиста, магистратуры, аспирантуры.',
              ratingPlacement: 2,
              rating: 5.0,
              pricesLink: "dsd",
              budgetPlacesLink: "sfsd",
              websiteLink: "https://kubsau.ru/",
              logoUrl: ''))),
];
class FakeUniversityListLoader implements IUniversityListLoader {
  final Filter? filter;

  FakeUniversityListLoader({this.filter});

  static Speciality getSpecialityById(int id){
    return specs.where((element) => element.id==id).first;
  }

  static UniversityCard getUniversityById(int id){
    return a.where((element) => element.universityCardInfo.university.id==id).first;
  }
  static Institute getInstituteById(int id){
    return institutes.where((element) => element.id==id).first;
  }

  @override
  Future<List<Widget>> loadList(Filter filter) async {

    bool hasAtLeastThreeMatchingKeys(
        Map<String, int> mapA, Map<String, int> mapB) {
      print("begun check!");
      int matchingKeysCount = 0;
      for (String key in mapA.keys) {
        if (mapA.containsKey(key) && mapB[key]! <= mapA[key]!) {
          print("вуз MapB[$key] ${mapB[key]}");
          print("мы MapA[$key] ${mapA[key]}");
          matchingKeysCount += 1;
          if (matchingKeysCount >= 3) {
            print(">=3");
            return true;
          }
        }
      }
      return false;
    }

    print("filter==null? :");
    print(filter == null);
    if (filter != null) {
      print('sending...');

      print("accreditaion filter = ${filter.accreditation}");
      a = a
          .where((card) =>
              (filter.militartdepartament == null ||
                  card.universityCardInfo.university.militarydep ==
                      filter.militartdepartament) &&
              (filter.accreditation == null ||
                  card.universityCardInfo.university.accreditation ==
                      filter.accreditation) &&
              (filter.dorms == null ||
                  card.universityCardInfo.university.dorms == filter.dorms) &&
              (filter.name == null ||
                  card.universityCardInfo.university.name == filter.name) &&
              (filter.city == null ||
                  card.universityCardInfo.university.universityContacts.city ==
                      filter.city) &&
              (filter.militartdepartament == null ||
                  card.universityCardInfo.university.militarydep ==
                      filter.militartdepartament) &&
              (filter.accreditation == null ||
                  card.universityCardInfo.university.accreditation ==
                      filter.accreditation) &&
              (filter.dorms == null ||
                  card.universityCardInfo.university.dorms == filter.dorms) &&
              (filter.points == null ||
                  card.universityCardInfo.university.specialities
                          .where((speciality) => hasAtLeastThreeMatchingKeys(
                              filter.points!, speciality.points))
                          .length >=
                      3))
          .toList();
    }
    return Future<List<UniversityCard>>.delayed(
        const Duration(seconds: 1), () => a);
  }
}
