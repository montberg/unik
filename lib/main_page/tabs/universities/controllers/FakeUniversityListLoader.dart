import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unik/main_page/tabs/universities/University.dart';

import 'package:unik/main_page/tabs/universities/interfaces/IUniversityListLoader.dart';
import '../widgets/UniversityCard.dart';
import '../widgets/university_page/SpecialityTile.dart';

var contacts = Contacts(
    city: 'Краснодар',
    emailAddress: 'adm@kgtu.kuban.ru',
    address: 'Красная, 134',
    phoneNumber: '+8 (861) 255-10-45');

Random r = Random();

List<Speciality> iksibSpecs = [
  Speciality(id: r.nextInt(9999), name: "Информатика и вычислительная техника", code: "09.03.01", description: "Выпускник может работать с информационными технологиями в любой отрасли. Осваиваются не менее пяти языков программирования, базы данных, операционные системы. Изучается аппаратная часть: работа микросхем, микроконтроллеров, микропроцессоров"
  , price: 135000, degree: Degree.bachelor, points: {
    "Математика": 75,
    "Русский язык": 80,
    "Физика": 95,
    "Информатика и ИКТ": 90
  }, pointsSumBudget: 212, pointsSum: 141, subjects: ["Математика", "Русский язык", "Физика",  "Информатика и ИКТ"]),
  Speciality(id: r.nextInt(9999), name: "Прикладная информатика", code: "09.03.03", description: "Моделирование прикладных бизнес-процессов. Создание, модификация, адаптация и сопровождение информационных систем. Разработка или адаптация, модификация, интеграция между собой программных решений", price: 155000, degree: Degree.bachelor, points: {
    "Математика": 75,
    "Русский язык": 80,
    "Физика": 95,
    "Информатика и ИКТ": 90
  }, pointsSumBudget: 218, pointsSum: 134, subjects: ["Математика", "Русский язык", "Физика",  "Информатика и ИКТ"]),
  Speciality(id: r.nextInt(9999), name: "Программная инженерия", code: "09.03.04", description: "Это направление подготовки программистов, готовых к индустриальному производству программного обеспечения для информационно-вычислительных систем различного назначения. Выпускники смогут осуществлять деятельность по управлению проектом разработки программного продукта, разработке программных продуктов ", price: 135000, degree: Degree.bachelor, points: {
    "Математика": 75,
    "Русский язык": 80,
    "Информатика и ИКТ": 90
  }, pointsSumBudget: 224, pointsSum: 143, subjects: ["Математика", "Русский язык",  "Информатика и ИКТ"]),
  Speciality(id: r.nextInt(9999), name: "Управление в технических системах", code: "27.03.04", description: "Специальная подготовка интегрирует знания по теории управления, информационным технологиям, профессиональному программированию и ставит своей целью подготовку выпускников к участию в процессах проектирования, создания, настройки локальных и распределенных систем управления.", price: 135000, degree: Degree.bachelor, points: {
    "Математика": 75,
    "Русский язык": 80,
    "Информатика и ИКТ": 90
  }, pointsSumBudget: 208, pointsSum: 170, subjects: ["Математика", "Русский язык", "Информатика и ИКТ"]),
  Speciality(id: r.nextInt(9999), name: "Информационная безопасность", code: "10.03.01", description: "В рамках направления ведётся подготовка специалистов в области информационных процессов, технологий, систем и сетей, их инструментального (программного, технического, организационного) обеспечения. Студенты изучают современные способы и методы проектирования, отладки, производства и эксплуатации информационных технологий в различных областях науки и техники. ", price: 135000, degree: Degree.bachelor, points: {
    "Математика": 75,
    "Русский язык": 80,
    "Информатика и ИКТ": 90
  }, pointsSumBudget: 215, pointsSum: 153, subjects: ["Математика", "Русский язык",  "Информатика и ИКТ"]),
];
Contacts iksibContacts = Contacts(address: "ул. Красная, д. 135", emailAddress: "djachenko.roman@kubstu.ru", phoneNumber: "8 (861) 259-60-83", city: "Краснодар");
Contacts mguContacts = Contacts(address: "ул. Ленинские горы, д. 1", emailAddress: "djachenko.roman@kubstu.ru", phoneNumber: "8 (861) 259-60-83", city: "Москва");

List<Institute> institutes = [
  Institute(
      name: "Институт нефти, газа и энергетики (ИНГЭ)",
      description:
          "В 1993 году в связи с началом подготовки на базе факультета энергетики инженеров нефтегазового профиля по специальностям «Разработка и эксплуатация нефтяных и газовых месторождений», «Бурение нефтяных и газовых скважин», «Оборудование нефтяных и газовых промыслов» энергетический факультет был преобразован в факультет нефти, газа и энергетики. Современный Институт нефти, газа и энергетики создан 1 сентября 2012 года приказом ректора КубГТУ № 1286-Л от 09.07.2012. Институт является правопреемником Института нефти, газа, энергетики и безопасности, организованного ранее в 2008 году.",
      specialities: iksibSpecs,
      instituteContacts: contacts,
      id: 1),
  Institute(
      name:
          "Институт компьютерных систем и информационной безопасности (ИКСиИБ)",
      description:
          "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
      specialities: iksibSpecs,
      instituteContacts: iksibContacts,
      id: 2),
  Institute(
      name:
      "Институт пищевой и перерабатывающей промышленности (ИПиПП)",
      description:
      "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
      specialities: iksibSpecs,
      instituteContacts: iksibContacts,
      id: 3),
  Institute(
      name:
      "Институт экономики, управления и бизнеса (ИЭУБ)",
      description:
      "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
      specialities: iksibSpecs,
      instituteContacts: iksibContacts,
      id: 4),
  Institute(
      name:
      "Институт строительства и транспортной инфраструктуры (ИСТИ)",
      description:
      "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
      specialities: iksibSpecs,
      instituteContacts: iksibContacts,
      id: 5),
  Institute(
      name:
      "Институт механики, робототехники, инженерии транспортных и технических систем (ИМРИТТС)",
      description:
      "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
      specialities: iksibSpecs,
      instituteContacts: iksibContacts,
      id: 6),
  Institute(
      name:
      "Инженерно-технологический колледж (ИТК)",
      description:
      "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
      specialities: iksibSpecs,
      instituteContacts: iksibContacts,
      id: 7),
  Institute(
      name:
      "Институт фундаментальных наук (ИФН)",
      description:
      "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
      specialities: iksibSpecs,
      instituteContacts: iksibContacts,
      id: 8),
];
List<UniversityCard> temp = [];
List<UniversityCard> a = [
  UniversityCard(
      universityCardInfo: UniversityCardInfo(
          favourite: true,
          university: University(
              specialities: iksibSpecs,
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
              specialities: iksibSpecs,
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
  UniversityCard(
      universityCardInfo: UniversityCardInfo(
          favourite: true,
          university: University(
              specialities: iksibSpecs,
              accreditation: true,
              image:
              "https://www.kubsu.ru/sites/default/files/news/20141012_162228_2.jpg",
              dorms: true,
              militarydep: false,
              name: 'Кубанский государственный университет',
              id: 2,
              institutes: institutes,
              universityContacts: contacts,
              description:
              'КубГУ – вуз с богатейшей историей, устоявшимися традициями и общепризнанными достижениями. Его высокий статус, подтвержденный многочисленными наградами, его сформировавшийся имидж ведущего центра образования, науки и культуры Кубани снискали вузу славу и признание не только в России, но и за рубежом.',
              ratingPlacement: 2,
              rating: 5.0,
              pricesLink: "dsd",
              budgetPlacesLink: "sfsd",
              websiteLink: "https://www.kubsu.ru/",
              logoUrl: ''))),
  UniversityCard(
      universityCardInfo: UniversityCardInfo(
          favourite: true,
          university: University(
              specialities: iksibSpecs,
              accreditation: true,
              image:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/%D0%9C%D0%93%D0%A3%2C_%D0%B2%D0%B8%D0%B4_%D1%81_%D0%B2%D0%BE%D0%B7%D0%B4%D1%83%D1%85%D0%B0.jpg/1920px-%D0%9C%D0%93%D0%A3%2C_%D0%B2%D0%B8%D0%B4_%D1%81_%D0%B2%D0%BE%D0%B7%D0%B4%D1%83%D1%85%D0%B0.jpg",
              dorms: true,
              militarydep: false,
              name: 'Московский государственный университет',
              id: 3,
              institutes: institutes,
              universityContacts: mguContacts,
              description:
              'Моско́вский госуда́рственный университе́т и́мени М. В. Ломоно́сова (с 1755 по 1917 год — Императорский Московский университет) — один из старейших и крупнейших классических университетов России, один из центров российской науки и культуры, расположенный в Москве.\n\nC 1940 года носит имя Михаила Васильевича Ломоносова. Полное название — федеральное государственное бюджетное образовательное учреждение высшего образования «Московский государственный университет имени М. В. Ломоносова». Широко используется аббревиатура «МГУ». Университет включает в себя 15 научно-исследовательских институтов, 43 факультета, более 300 кафедр и семь филиалов (в их числе шесть зарубежных — пять в странах СНГ и один в Словении). С 1992 года ректором МГУ является академик Виктор Антонович Садовничий, советский и российский математик, деятель российского высшего образования.',
              ratingPlacement: 2,
              rating: 5.0,
              pricesLink: "dsd",
              budgetPlacesLink: "sfsd",
              websiteLink: "https://www.msu.ru/",
              logoUrl: ''))),
];

class FakeUniversityListLoader implements IUniversityListLoader {
  final Filter? filter;

  FakeUniversityListLoader({this.filter});

  static Speciality getSpecialityById(int id) {
    return iksibSpecs.where((element) => element.id == id).first;
  }

  static UniversityCard getUniversityById(int id) {
    return a
        .where((element) => element.universityCardInfo.university.id == id)
        .first;
  }

  static Institute getInstituteById(int id) {
    return institutes.where((element) => element.id == id).first;
  }

  @override
  Future<List<Widget>> loadList(Filter filter) async {
    bool hasAtLeastThreeMatchingKeys(
        Map<String, int> mapA, Map<String, int> mapB) {
      print("begun check!");
      int matchingKeysCount = 0;
      for (String key in mapA.keys) {
        if (mapB[key] != null) {
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
      }
      return false;
    }

    print("filter==null? :");
    print(filter == null);
    if (filter != null) {
      print('sending...');

      print("accreditaion filter = ${filter.accreditation}");
      temp = a
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
        const Duration(seconds: 1), () => temp);
  }
}
