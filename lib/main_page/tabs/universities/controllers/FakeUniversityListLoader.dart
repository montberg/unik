import 'package:flutter/material.dart';
import 'package:unik/main_page/tabs/universities/University.dart';
import 'package:unik/main_page/tabs/universities/interfaces/IUniversityListLoader.dart';
import '../widgets/UniversityCard.dart';

class FakeUniversityListLoader implements IUniversityListLoader {
  FakeUniversityListLoader();

  @override
  Future<List<UniversityCard>> loadList() async {
    print('sending...');

    var contacts = Contacts(
        city: 'Краснодар',
        emailAddress: '123@123.com',
        address: 'Пушкина, 123',
        phoneNumber: '+8239482428');


    List<Speciality> specs = [
      const Speciality(
          name: "Прикладная информатика",
          code: "09.03.03",
          description: """В рамках направления ведётся подготовка квалифицированных профессионалов в сферах системного анализа прикладной области информатизации и цифровизации; формализации решения прикладных задач и процессов информационных систем; разработки проектов автоматизации и информатизации прикладных процессов и создания информационных систем в прикладных областях; разработки проектов цифровизации; выполнения работ по созданию, модификации, внедрению и сопровождению информационных систем и управления этими работами. Студенты изучают прикладные и информационные процессы, информационные системы и технологии, требующие применения практических навыков анализа, моделирования, реинжиниринга, проектирования, разработки и сопровождения.""",
          price: 150000,
          degree: Degree.bachelor),
      const Speciality(
          name: "Программная инженерия",
          code: "09.03.04",
          description: "В рамках направления ведётся подготовка профессионалов в широком спектре технологий индустриального производства программного обеспечения для информационно-вычислительных систем различного назначения, в том числе в сферах применения современных методов и технологий проектирования, а также стандартов, регламентирующих жизненный цикл ПО. Обучение включает овладение навыками программирования на различных инструментальных платформах, а также изучение подходов к использованию готовых программных компонентов и методов их интеграции. Студенты изучают методы и инструменты разработки программного продукта, а также концепцию его жизненного цикла, установленную российскими и международными стандартами ГОСТ 34.601-90, ISO/IEC/IEEE 12207:2017 и ГОСТ Р ИСО/МЭК 12207-2010.",
          price: 150000,
          degree: Degree.bachelor),
      const Speciality(
          name: "Информационная безопасность",
          code: "10.04.01",
          description: "Основными видами деятельности магистра являются: проведение научных и прикладных исследований, преподавание дисциплин, относящихся к сфере «Информационная безопасность», ведение аналитической, проектной и организационной работы в области менеджмента по информационной безопасности региональных информационных объектов, включая и финансово-кредитные структуры.",
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
          name:
              "Химическая технология (профиль Химическая технология природных энергоносителей и углеродных материалов)",
          code: "18.03.01",
          description: "Описание специальности 21.03.01",
          price: 130000,
          degree: Degree.bachelor),
    ];
    List<Institute> institutes = [
      Institute(
          name: "Институт нефти, газа и энергетики (ИНГЭ)",
          description:
              "В 1993 году в связи с началом подготовки на базе факультета энергетики инженеров нефтегазового профиля по специальностям «Разработка и эксплуатация нефтяных и газовых месторождений», «Бурение нефтяных и газовых скважин», «Оборудование нефтяных и газовых промыслов» энергетический факультет был преобразован в факультет нефти, газа и энергетики. Современный Институт нефти, газа и энергетики создан 1 сентября 2012 года приказом ректора КубГТУ № 1286-Л от 09.07.2012. Институт является правопреемником Института нефти, газа, энергетики и безопасности, организованного ранее в 2008 году.",
          specialities: specs,
          instituteContacts: contacts,
          id: 99),
      Institute(
          name:
              "Институт компьютерных систем и информационной безопасности (ИКСиИБ)",
          description:
              "В 1961 году в университете была создана кафедра автоматизации производственных процессов, на базе которой в 1976 году был создан факультет оборудования и автоматизации производственных процессов, который окончил министр сельского хозяйства РФ А. Н. Ткачев.",
          specialities: specs,
          instituteContacts: contacts,
          id: 99)
    ];

    //for (var i = 0; i < 10; i++) {
    //  var fakeUni = University(
    //    specialities: [1,2,3,4,5,6,7],
    //      accreditation: true,
    //      image: "https://proverili.ru/uploads/media/21497/1.jpg",
    //      dorms: true,
    //      militarydep: false,
    //      name: 'Кубанский государственный технологический университет',
    //      id: i.toString(),
    //      institutes: institutes,
    //      universityContacts: contacts,
    //      description:
    //          'Кубанский государственный технологический университет — старейшее высшее учебное заведение на Кубани и Северном Кавказе — основан 16 июня 1918 года решением съезда Совета народного образования Кубано-Черноморской Республики как Северо-Кавказский политехнический институт.',
    //      ratingPlacement: 15,
    //      rating: 5.0,
    //      pricesLink: "dsd",
    //      budgetPlacesLink: "sfsd",
    //      websiteLink: "dsd", logoUrl: '');
    //  var uniCardInfo =
    //      UniversityCardInfo(favourite: true, university: fakeUni);
    //  a.add(UniversityCard(universityCardInfo: uniCardInfo));
    //}
    List<UniversityCard> a = [

      UniversityCard(universityCardInfo: UniversityCardInfo(favourite: true, university: University(
          specialities: [1,2,3,4,5,6,7],
          accreditation: true,
          image: "https://proverili.ru/uploads/media/21497/1.jpg",
          dorms: true,
          militarydep: false,
          name: 'Кубанский государственный технологический университет',
          id: 1.toString(),
          institutes: institutes,
          universityContacts: contacts,
          description:
          'Кубанский государственный технологический университет — старейшее высшее учебное заведение на Кубани и Северном Кавказе — основан 16 июня 1918 года решением съезда Совета народного образования Кубано-Черноморской Республики как Северо-Кавказский политехнический институт.',
          ratingPlacement: 1,
          rating: 5.0,
          pricesLink: "https://kubstu.ru/data/struct/0042/%D0%91%D1%83%D0%BA%D0%BB%D0%B5%D1%82%202023.pdf",
          budgetPlacesLink: "https://kubstu.ru/data/struct/0042/%D0%91%D1%83%D0%BA%D0%BB%D0%B5%D1%82%202023.pdf",
          websiteLink: "https://kubstu.ru/", logoUrl: ''))),
      UniversityCard(universityCardInfo: UniversityCardInfo(favourite: true, university: University(
          specialities: [1,2,3,4,5,6,7],
          accreditation: true,
          image: "https://smapse.ru/storage/2022/04/kubanskij-gosudarstvennyj-agrarnyj-universitet-im-i-t-trubilina-smapse1.png",
          dorms: true,
          militarydep: false,
          name: 'Кубанский государственный аграрный университет',
          id: 0.toString(),
          institutes: institutes,
          universityContacts: contacts,
          description:
          'Кубанский государственный аграрный университет им. И.Т. Трубилина (КубГАУ) – одно из крупнейших аграрных учреждений высшего образования в России. В 1918 году был создан сельскохозяйственный отдел при Кубанском политехникуме, который в 1922 году был преобразован в самостоятельное учреждение. Спустя почти 70 лет вуз получил своё нынешнее название.\n\nВ университете обучаются порядка 35 000 студентов очной и заочной форм. Около 4000 высококвалифицированных преподавателей ведут дисциплины различных областей. В КубГАУ можно получить диплом бакалавра, специалиста, магистратуры, аспирантуры.',
          ratingPlacement: 2,
          rating: 5.0,
          pricesLink: "dsd",
          budgetPlacesLink: "sfsd",
          websiteLink: "https://kubsau.ru/", logoUrl: ''))),
    ];
    return Future<List<UniversityCard>>.delayed(const Duration(seconds: 1), () => a);
  }
}
