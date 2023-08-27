import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class DataTableGlaciersWidget extends StatelessWidget {
  const DataTableGlaciersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(),
          dataTextStyle: AppText.bodyTextStyle,
          headingTextStyle: AppText.dataColumnText,
          columns: const [
            DataColumn(label: Text('Ледник')),
            DataColumn(label: Text('Местонахождение')),
            DataColumn(label: Text('Река')),
            DataColumn(label: Text('Длина (км)')),
            DataColumn(label: Text('Площадь(кв. км)')),
            DataColumn(label: Text('Высота у подножья')),
          ],
          rows: const [
            DataRow(
              cells: [
                DataCell(Text('Южный Иныльчек')),
                DataCell(Text('Победа/Хан Тенгри')),
                DataCell(Text('Иныльчек')),
                DataCell(Text('60.5')),
                DataCell(Text('632.3')),
                DataCell(Text('2980')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Северный Иныльчек')),
                DataCell(Text('Победа/Хан Тенгри')),
                DataCell(Text('Озера Мерцбахера')),
                DataCell(Text('32.8')),
                DataCell(Text('215.2')),
                DataCell(Text('3400')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Кайингды')),
                DataCell(Text('Победа/Хан Тенгри')),
                DataCell(Text('Кайингдыv')),
                DataCell(Text('29.0')),
                DataCell(Text('97.2')),
                DataCell(Text('3400')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Коржиневского')),
                DataCell(Text('Запайский хребет')),
                DataCell(Text('Джанай Дартак')),
                DataCell(Text('21.5')),
                DataCell(Text('99.4')),
                DataCell(Text('3890')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Мушкетова')),
                DataCell(Text('Победа/Хан Тенгри')),
                DataCell(Text('Арир Тер')),
                DataCell(Text('20.5')),
                DataCell(Text('71.3')),
                DataCell(Text('3440')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Семенова')),
                DataCell(Text('Победа/Хан Тенгри')),
                DataCell(Text('Сары Джаз')),
                DataCell(Text('20.2')),
                DataCell(Text('64.5')),
                DataCell(Text('3340')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Ленина')),
                DataCell(Text('Ленин')),
                DataCell(Text('Ачик Таш')),
                DataCell(Text('13.5')),
                DataCell(Text('58.1')),
                DataCell(Text('3760')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Мушкетова')),
                DataCell(Text('Какшаал')),
                DataCell(Text('Котур')),
                DataCell(Text('13.3')),
                DataCell(Text('23.0')),
                DataCell(Text('3940')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Наливкина')),
                DataCell(Text('Какшаал')),
                DataCell(Text('Ай-Тала')),
                DataCell(Text('13.2')),
                DataCell(Text('19.5')),
                DataCell(Text('3960')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Кеикал')),
                DataCell(Text('Победа/Хан Тенгри')),
                DataCell(Text('Теректи')),
                DataCell(Text('12.9')),
                DataCell(Text('26.8')),
                DataCell(Text('3380')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
