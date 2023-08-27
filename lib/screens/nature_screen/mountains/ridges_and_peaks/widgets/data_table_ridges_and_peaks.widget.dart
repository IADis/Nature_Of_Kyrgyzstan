import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class DataTableRidgesAndPeaksWidget extends StatelessWidget {
  const DataTableRidgesAndPeaksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowHeight: 80,
          border: TableBorder.all(),
          dataTextStyle: AppText.bodyTextStyle,
          headingTextStyle: AppText.dataColumnText,
          columns: const [
            DataColumn(label: Text('Хребет')),
            DataColumn(label: Text('Длина (км)')),
            DataColumn(label: Text('Ширина (км)')),
            DataColumn(label: Text('Самый высокий пик')),
            DataColumn(label: Text('Наивысшая точка\n(над уровнем моря)')),
            DataColumn(label: Text('Средняя высота\n(над уровнем моря)')),
          ],
          rows: const [
            DataRow(
              cells: [
                DataCell(Text('Какшаал-Тоо')),
                DataCell(Text('582')),
                DataCell(Text('54')),
                DataCell(Text('Победа ( Пик Победы)')),
                DataCell(Text('7439')),
                DataCell(Text('4500')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Чон-Алайский')),
                DataCell(Text('250')),
                DataCell(Text('40')),
                DataCell(Text('Пик Ленина')),
                DataCell(Text('7134')),
                DataCell(Text('5460')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Алай')),
                DataCell(Text('350')),
                DataCell(Text('20')),
                DataCell(Text('Тандыкуль')),
                DataCell(Text('5880')),
                DataCell(Text('4450')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Сары Джаз')),
                DataCell(Text('93')),
                DataCell(Text('16')),
                DataCell(Text('Пик Семенова')),
                DataCell(Text('5816')),
                DataCell(Text('4700')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Туркестан')),
                DataCell(Text('300')),
                DataCell(Text('30')),
                DataCell(Text('Пик Сабла')),
                DataCell(Text('5621')),
                DataCell(Text('4430')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Терскей-Алатау')),
                DataCell(Text('354')),
                DataCell(Text('40')),
                DataCell(Text('Пик Каракольский')),
                DataCell(Text('5280')),
                DataCell(Text('4290')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Ак-Шийрак')),
                DataCell(Text('60')),
                DataCell(Text('28')),
                DataCell(Text('Джаман-су')),
                DataCell(Text('5126')),
                DataCell(Text('4720')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Фергана')),
                DataCell(Text('206')),
                DataCell(Text('62')),
                DataCell(Text('Кара-Кульджа (Уч-Сейит)')),
                DataCell(Text('4940')),
                DataCell(Text('3620')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Киргизский')),
                DataCell(Text('454')),
                DataCell(Text('40')),
                DataCell(Text('Пик Западный Аламеддин')),
                DataCell(Text('4855')),
                DataCell(Text('3700')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Ат-баши')),
                DataCell(Text('140')),
                DataCell(Text('30')),
                DataCell(Text('Ерме')),
                DataCell(Text('4786')),
                DataCell(Text('4300')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Кунгей-Алатоо')),
                DataCell(Text('285')),
                DataCell(Text('32')),
                DataCell(Text('Чок-Тал')),
                DataCell(Text('4771')),
                DataCell(Text('4200')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Чаткал')),
                DataCell(Text('225')),
                DataCell(Text('30')),
                DataCell(Text('Пик Чаткал (Афлатун)')),
                DataCell(Text('4503')),
                DataCell(Text('3800')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Нарын-Тоо')),
                DataCell(Text('120')),
                DataCell(Text('18')),
                DataCell(Text('Байбиче')),
                DataCell(Text('4500')),
                DataCell(Text('4200')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Талас')),
                DataCell(Text('260')),
                DataCell(Text('40')),
                DataCell(Text('Пик Манас')),
                DataCell(Text('4488')),
                DataCell(Text('3930')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Джумгал-Tоо')),
                DataCell(Text('54')),
                DataCell(Text('15')),
                DataCell(Text('Мин Теке')),
                DataCell(Text('4281')),
                DataCell(Text('3800')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
