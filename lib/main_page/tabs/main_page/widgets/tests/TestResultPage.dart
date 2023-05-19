import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TestResultPage extends StatelessWidget {
  const TestResultPage({Key? key, required this.results}) : super(key: key);
  final List<int> results;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Результаты",
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Данный тест показывает выраженность склонности к разным видам деятельности. Чем выше значение, тем сильнее выраженна склонность.", textAlign: TextAlign.justify,),
              SizedBox(height: 10),
              AutoSizeText("Различие между интересами и склонностями: интересы выражаются формулой «хочу знать», а склонности «хочу делать». Можно интересоваться чем-либо, но не иметь желания этим заниматься (футбол, кино и т.п.). Профессию необходимо выбирать в соответствии со своими интересами и склонностями.", textAlign: TextAlign.justify, style: GoogleFonts.montserrat(fontStyle: FontStyle.italic),),
              SizedBox(height: 20),
              AutoSizeText("Склонность к работе с людьми", textAlign: TextAlign.justify, style: GoogleFonts.montserrat(fontWeight: FontWeight.w800),),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 15,
                    color: Colors.grey[400],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 12 * results[0],
                    height: 15,
                    color: Colors.blue[400],
                  ),
                ],
              ),
              SizedBox(height: 10),
              AutoSizeText("Профессии, связанные с обслуживанием (бытовым, медицинским, информационным), управлением, воспитанием и обучением. Люди, успешные в профессиях этой группы, должны уметь и любить общаться, находить общий язык с разными людьми, понимать их настроение, намерения и особенности.", textAlign: TextAlign.justify,),
              SizedBox(height: 20),
              AutoSizeText("Склонность к исследовательской деятельности", textAlign: TextAlign.justify, style: GoogleFonts.montserrat(fontWeight: FontWeight.w800)),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 15,
                    color: Colors.grey[400],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 12 * results[1],
                    height: 15,
                    color: Colors.blue[400],
                  ),
                ],
              ),
              SizedBox(height: 10),
              AutoSizeText("Склонность к исследовательской деятельности. Профессии, связанные с научной работой. Кроме хорошей теоретической подготовки в определенных областях науки, людям, занимающимся исследовательской деятельностью, необходимы такие качества, как рациональность, независимость и оригинальность суждений, аналитический склад ума. Как правило, им больше нравится размышлять о проблеме, чем заниматься ее реализацией.", textAlign: TextAlign.justify,),

              SizedBox(height: 20),
              AutoSizeText("Склонность к работе на производстве", textAlign: TextAlign.justify, style: GoogleFonts.montserrat(fontWeight: FontWeight.w800)),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 15,
                    color: Colors.grey[400],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 12 * results[2],
                    height: 15,
                    color: Colors.blue[400],
                  ),
                ],
              ),
              SizedBox(height: 10),
              AutoSizeText("Склонность к работе на производстве. Круг этих профессий очень широк: производство и обработка металла; сборка, монтаж приборов и механизмов; ремонт, наладка, обслуживание электронного и механического оборудования; монтаж, ремонт зданий, конструкций; обработка и использование различных материалов; управление транспортом. Профессии этой группы предъявляют повышенные требования к здоровью человека, координации движений, вниманию.", textAlign: TextAlign.justify,),
              SizedBox(height: 20),
              AutoSizeText("Склонность к эстетическим видам деятельности", textAlign: TextAlign.justify, style: GoogleFonts.montserrat(fontWeight: FontWeight.w800)),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 15,
                    color: Colors.grey[400],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 12 * results[3],
                    height: 15,
                    color: Colors.blue[400],
                  ),
                ],
              ),
              SizedBox(height: 10),
              AutoSizeText("Склонность к эстетическим видам деятельности. Профессии творческого характера, связанные с изобразительной, музыкальной, литературно-художественной, актерскосценической деятельностью. Людей творческих профессий, кроме наличия специальных способностей (музыкальных, литературных, актерских), отличает оригинальность мышления и независимость характера, стремление к совершенству.", textAlign: TextAlign.justify,),
              SizedBox(height: 20),
              AutoSizeText("Склонность к экстремальным видам деятельности", textAlign: TextAlign.justify, style: GoogleFonts.montserrat(fontWeight: FontWeight.w800)),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 15,
                    color: Colors.grey[400],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 12 * results[4],
                    height: 15,
                    color: Colors.blue[400],
                  ),
                ],
              ),
              SizedBox(height: 10),
              AutoSizeText("Склонность к экстремальным видам деятельности. Профессии, связанные с занятиями спортом, путешествиями, экспедиционной работой, охранной и оперативнорозыскной деятельностью, службой в армии. Все они предъявляют особые требования к физической подготовке, здоровью и морально-волевым качествам.", textAlign: TextAlign.justify,),
              SizedBox(height: 20),
              AutoSizeText("Склонность к планово-экономическим видам деятельности", textAlign: TextAlign.justify, style: GoogleFonts.montserrat(fontWeight: FontWeight.w800)),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 15,
                    color: Colors.grey[400],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 12 * results[5],
                    height: 15,
                    color: Colors.blue[400],
                  ),
                ],
              ),
              SizedBox(height: 10),
              AutoSizeText("Склонность к планово-экономическим видам деятельности. Профессии, связанные с расчетами и планированием (бухгалтер, экономист); делопроизводством, анализом и преобразованием текстов (редактор, переводчик, лингвист); схематическим изображением объектов (чертежник, топограф). Эти профессии требуют от человека собранности и аккуратности.", textAlign: TextAlign.justify,),
              SizedBox(height: 10),
              SizedBox(child: TextButton(onPressed: () { Get.back();  }, child: Text("Закрыть тест",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: Colors.white)), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))), width: double.infinity,)
              ],
          ),
        ),
      ),
    );
  }
}
