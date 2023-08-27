import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class DataTableReservoirsWidget extends StatelessWidget {
  const DataTableReservoirsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder.all(),
        headingTextStyle: AppText.dataColumnText,
        dataTextStyle: AppText.bodyTextStyle,
        columns: const [
          DataColumn(label: Text('Водохранилище')),
          DataColumn(label: Text('Год создания')),
          DataColumn(label: Text('Река')),
          DataColumn(label: Text('Объем, млн. м3')),
          DataColumn(label: Text('Площадь, км2')),
          DataColumn(label: Text('Высота плотины, м')),
        ],
        rows: const [
          DataRow(
            cells: [
              DataCell(Text('Токтогульское')),
              DataCell(Text('1974')),
              DataCell(Text('Нарын')),
              DataCell(Text('195000')),
              DataCell(Text('284')),
              DataCell(Text('215')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Кировское')),
              DataCell(Text('1975')),
              DataCell(Text('Талас')),
              DataCell(Text('550')),
              DataCell(Text('26.5')),
              DataCell(Text('83.7')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Орто-Токойское')),
              DataCell(Text('1956')),
              DataCell(Text('Чу')),
              DataCell(Text('470')),
              DataCell(Text('25')),
              DataCell(Text('52')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Курпсайское')),
              DataCell(Text('1981')),
              DataCell(Text('Нарын')),
              DataCell(Text('270')),
              DataCell(Text('12')),
              DataCell(Text('110')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Папанское')),
              DataCell(Text('1981')),
              DataCell(Text('Ак-Бура ')),
              DataCell(Text('260')),
              DataCell(Text('7.1')),
              DataCell(Text('120')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Турткульское')),
              DataCell(Text('1971')),
              DataCell(Text('Исфана')),
              DataCell(Text('90')),
              DataCell(Text('6.6')),
              DataCell(Text('3')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Уч-Коргонское')),
              DataCell(Text('1964')),
              DataCell(Text('Нарын')),
              DataCell(Text('52.5')),
              DataCell(Text('4')),
              DataCell(Text('31')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Наиманское')),
              DataCell(Text('1968')),
              DataCell(Text('Абшир-Сай')),
              DataCell(Text('40')),
              DataCell(Text('3.2')),
              DataCell(Text('40.5')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Ала-Арчинское')),
              DataCell(Text('1968')),
              DataCell(Text('Ала-Арча')),
              DataCell(Text('39')),
              DataCell(Text('5.21')),
              DataCell(Text('22')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Базар-Корганское')),
              DataCell(Text('1962')),
              DataCell(Text('Кара Ункур')),
              DataCell(Text('30')),
              DataCell(Text('2.8')),
              DataCell(Text('25')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Сокулукское')),
              DataCell(Text('1968')),
              DataCell(Text('Сокулук')),
              DataCell(Text('11.5')),
              DataCell(Text('1.77')),
              DataCell(Text('28')),
            ],
          ),
        ],
      ),
    );
  }
}
