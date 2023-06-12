import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/main_page/tabs/main_page/widgets/tests/Question.dart';
import 'package:unik/main_page/tabs/main_page/widgets/tests/SelectedAnswer.dart';

import 'TestResultPage.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class TestDescription extends StatefulWidget {
  const TestDescription({Key? key}) : super(key: key);

  @override
  State<TestDescription> createState() => _TestDescriptionState();
}

class _TestDescriptionState extends State<TestDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Опросник Л. Йоваши",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Опросник профессиональных склонностей Л. Йовайши (модификация Г. В. Резапкиной) направлен на выявление склонностей учащихся к разным сферам профессиональной деятельности: работе с людьми, практической, интеллектуальной, эстетической, планово-экономической или экстремальной. \n\nМетодика основана на косвенных вопросах, которые выявляют скрытую мотивацию, в отличие от других методик, где используются более прямолинейные вопросы.",
              style: GoogleFonts.montserrat(
                  height: 1.3, fontWeight: FontWeight.w500),
              textAlign: TextAlign.justify,
            ),
            Text("Количество вопросов — 24",
                style: GoogleFonts.montserrat(
                    height: 1.3, fontWeight: FontWeight.w500)),
            TextButton(
              onPressed: () {
                Get.to(() => TestPage());
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Продолжить",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TestPageState extends State<TestPage> {
  final List<SelectedAnswer> selectedAnswers =
      List.generate(24, (index) => SelectedAnswer(index, -1));
  final List<Question> questionList = [
    //1
    Question("Мне хотелось бы в своей профессиональной деятельности", [
      'общаться с самыми разными людьми',
      'что-нибудь делать своими руками – мебель, одежду, машины и т.д',
      'снимать фильмы, рисовать, писать книги, выступать на сцене и т.д'
    ], [
      0,
      5,
      3
    ]),
    //2
    Question("В книге или кинофильме меня больше всего привлекает", [
      'художественная форма, мастерство писателя или режиссера',
      'сюжет, действие героев',
      'информация, которая может пригодиться в жизни'
    ], [
      3,
      4,
      1
    ]),
    //3
    Question("Меня обрадует Нобелевская премия", [
      'в области науки',
      'за общественную деятельность',
      'в области искусства'
    ], [
      1,
      0,
      3
    ]),
    //4
    Question("Я скорее соглашусь стать", [
      'управляющим банка',
      'главным инженером на производстве',
      'начальником экспедиции'
    ], [
      5,
      2,
      4
    ]),
    //5
    Question("Будущее людей определяет", [
      'достижение науки',
      'развитие производства',
      'взаимопонимание среди людей'
    ], [
      1,
      2,
      0
    ]),
    //6
    Question("На месте директора школы я прежде всего займусь", [
      'благоустройством школы (столовая, спортзал, компьютеры)',
      'созданием дружного, сплоченного коллектива',
      'разработкой новых технологий обучения'
    ], [
      5,
      0,
      1
    ]),
    //7
    Question("На технической выставке меня больше всего привлечет", [
      'внешний вид экспонатов (цвет, форма)',
      'внутреннее устройство экспонатов (механизм)',
      'практическое применение экспонатов'
    ], [
      3,
      1,
      2
    ]),
    //8
    Question("В людях я ценю прежде всего", [
      'мужество, смелость, выносливость',
      'дружелюбие, чуткость, отзывчивость',
      'ответственность, аккуратность'
    ], [
      4,
      0,
      5
    ]),
    //9
    Question("В свободное от работы время я буду", [
      'писать стихи или музыку или рисовать',
      'ставить различные опыты',
      'тренироваться'
    ], [
      3,
      1,
      4
    ]),
    //10
    Question("В заграничных поездках меня больше всего привлечет", [
      'экстремальный туризм (альпинизм, виндсерфинг, горные лыжи)',
      'деловое общение',
      'возможность знакомства с историей и культурой другой страны'
    ], [
      4,
      5,
      3
    ]),
    //11
    Question("Мне интереснее беседовать", [
      'о машине нового типа',
      'о новой научной теории',
      'о человеческих взаимоотношениях'
    ], [
      2,
      1,
      0
    ]),
    //12
    Question("Если бы в моей школе было всего три кружка, я бы выбрал",
        ['технический', 'музыкальный', 'спортивный'], [2, 3, 4]),
    //13
    Question("В школе больше внимания следует уделять", [
      'улучшению взаимопонимания между учителями и учениками',
      'поддержанию здоровья учащихся, занятиям спортом',
      'укреплению дисциплины'
    ], [
      0,
      4,
      5
    ]),
    //14
    Question("Я с большим интересом смотрю", [
      'научно-популярные фильмы',
      'программы о культуре и спорте',
      'спортивные программы'
    ], [
      3,
      1,
      4
    ]),
    //15
    Question("Мне было бы интереснее работать", [
      'с машинами, механизмами',
      'с объектами природы',
      'с детьми или сверстниками'
    ], [
      2,
      4,
      1
    ]),
    //16
    Question("Школа в первую очередь должна", [
      'давать знания и умения',
      'учить общению с другими людьми',
      'обучать навыкам работы'
    ], [
      2,
      5,
      0
    ]),
    //17
    Question("Каждый человек должен", [
      'вести здоровый образ жизни',
      'иметь возможность заниматься творчеством',
      'иметь удобные бытовые условия'
    ], [
      4,
      3,
      5
    ]),
    //18
    Question("Для благополучия общества в первую очередь необходима", [
      'защита интересов и прав граждан',
      'забота о материальном благополучии людей',
      'наука и технический прогресс'
    ], [
      0,
      2,
      1
    ]),
    //19
    Question("Мне больше всего нравятся уроки",
        ['физкультуры', 'математики', 'труда'], [4, 5, 2]),
    //20
    Question("Мне интереснее было бы", [
      'планировать производство продукции',
      'изготавливать изделия',
      'заниматься сбытом продукции'
    ], [
      5,
      2,
      0
    ]),
    //21
    Question("Я предпочитаю читать статьи", [
      'о выдающихся ученых и их открытиях',
      'о творчестве ученых и музыкантов',
      'об интересных изобретениях'
    ], [
      1,
      3,
      2
    ]),
    //22
    Question("Свободное время я охотнее провожу", [
      'делая что-то по хозяйству',
      'с книгой',
      'на выставках, концертах и пр.'
    ], [
      2,
      1,
      3
    ]),
    //23
    Question("Больший интерес у меня вызовет сообщение", [
      'о художественной выставке',
      'о ситуации на фондовой бирже',
      'о научном открытии'
    ], [
      3,
      5,
      1
    ]),
    //24
    Question("Я предпочитаю работать", [
      'в помещении, где много людей',
      'в необычных условиях',
      'в обычном кабинете'
    ], [
      0,
      4,
      5
    ]),
  ];
  int currentQuestion = 0;
  List<int> columns = [0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(8),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    color: Colors.blue,
                    height: 8,
                    width: MediaQuery.of(context).size.width /
                        questionList.length *
                        (currentQuestion + 1)))),
        title: Text("Тест на профориентацию",
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Text(columns.toString()),
              AutoSizeText(
                "${questionList[currentQuestion].text}:",
                style: GoogleFonts.montserrat(fontSize: 21, height: 1.5),
                textAlign: TextAlign.justify,
                maxLines: 2,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questionList[currentQuestion].answers.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) => ListTile(
                      tileColor: (() {
                        //print("currentQuestion = $currentQuestion");
                        if (selectedAnswers.isNotEmpty) {
                          print(selectedAnswers[currentQuestion].answer);
                          if (selectedAnswers[currentQuestion].answer == index)
                            return Colors.blue;
                        }
                        return Colors.white;
                      }()),
                      contentPadding: const EdgeInsets.all(20),
                      title: Text(
                        questionList[currentQuestion].answers[index],
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1.5),
                      ),
                      onTap: () {
                        if (currentQuestion + 1 == questionList.length) {
                          Get.off(() => TestResultPage(results: columns));
                        } else {
                          _goForward(index);
                        }
                      })),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: currentQuestion == 0
                          ? null
                          : () => _goBack(currentQuestion)),
                  Text("${currentQuestion + 1}/${questionList.length}",
                      style: GoogleFonts.montserrat(
                          fontSize: 30, fontWeight: FontWeight.w700)),
                  Visibility(
                    child: IconButton(
                        icon: const Icon(Icons.arrow_forward_rounded),
                        onPressed: () {}),
                    visible: false,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _goBack(int index) {
    setState(() {
      var lastAnswer = selectedAnswers[currentQuestion];
      columns[questionList[currentQuestion - 1]
          .indexes[selectedAnswers[currentQuestion - 1].answer]]--;
      currentQuestion--;
    });
  }

  void _goForward(int selectedAnswer) {
    setState(() {
      selectedAnswers[currentQuestion] =
          SelectedAnswer(currentQuestion, selectedAnswer);
      columns[questionList[currentQuestion]
          .indexes[selectedAnswers[currentQuestion].answer]]++;
      currentQuestion++;
    });
  }
}
