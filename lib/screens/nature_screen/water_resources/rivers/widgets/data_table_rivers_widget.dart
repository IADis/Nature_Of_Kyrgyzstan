import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class DataTableRiversWidget extends StatelessWidget {
  const DataTableRiversWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingTextStyle: AppText.dataColumnText,
          sortColumnIndex: 0,
          dataTextStyle: AppText.bodyTextStyle,
          border: TableBorder.all(),
          columns: const [
            DataColumn(
              label: Text('Река'),
            ),
            DataColumn(
              label: Text('Длинна (км)'),
            ),
            DataColumn(
              label: Text('Размер бассейна реки (тыс.квадрат.км)'),
            ),
          ],
          rows: const [
            DataRow(
              cells: [
                DataCell(Text('Нарын')),
                DataCell(Text('616')),
                DataCell(Text('50.1')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Талас')),
                DataCell(Text('294')),
                DataCell(Text('10.8')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Чуй (Чу)')),
                DataCell(Text('221')),
                DataCell(Text('22.8')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Кара - Дарья')),
                DataCell(Text('189')),
                DataCell(Text('16.2')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Сары - Джаз')),
                DataCell(Text('165')),
                DataCell(Text('12.1')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Чаткал')),
                DataCell(Text('155')),
                DataCell(Text('6.9')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Кизил - Су')),
                DataCell(Text('128')),
                DataCell(Text('7.8')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Кеке - Мерен')),
                DataCell(Text('108')),
                DataCell(Text('8.3')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
