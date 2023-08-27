import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';

class GeneralInfoScreen extends StatefulWidget {
  const GeneralInfoScreen({super.key});

  @override
  State<GeneralInfoScreen> createState() => _GeneralInfoScreenState();
}

class _GeneralInfoScreenState extends State<GeneralInfoScreen> {
  final Stream<QuerySnapshot> generalInfo =
      FirebaseFirestore.instance.collection('generalInfo').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: StreamBuilder(
        stream: generalInfo,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final data = snapshot.data!.docs[0];
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              children: [
                Text(
                  data['name'],
                  style: AppText.mainTitleTextStyle,
                ),
                const SizedBox(height: 20),
                Text(
                  data['bodyText'].toString().replaceAll('\\n', '\n'),
                  style: AppText.descritionTextStyle,
                ),
                const SizedBox(height: 20),
                Text(
                  data['nameFirstCategory'],
                  style: AppText.titleTextStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  data['descriptionFirstCategory'],
                  style: AppText.descritionTextStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  data['listFirstCategory'].toString().replaceAll('\\n', '\n'),
                  style: AppText.bodyTextStyle,
                ),
                const SizedBox(height: 20),
                Text(
                  data['nameSecondCategory'],
                  style: AppText.titleTextStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  data['descriptionSecondCategory'],
                  style: AppText.descritionTextStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  data['listSecondCategory'].toString().replaceAll('\\n', '\n'),
                  style: AppText.bodyTextStyle,
                ),
                const SizedBox(height: 20),
                Text(
                  data['nameThirdCategory'],
                  style: AppText.titleTextStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  data['listThirdCategory'].toString().replaceAll('\\n', '\n'),
                  style: AppText.bodyTextStyle,
                ),
                const SizedBox(height: 20),
                Text(
                  data['nameFourthCategory'],
                  style: AppText.titleTextStyle,
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingTextStyle: AppText.dataColumnText,
                    dataTextStyle: AppText.bodyTextStyle,
                    border: TableBorder.all(),
                    columns: const [
                      DataColumn(label: Text('Заказники')),
                      DataColumn(label: Text('Количество')),
                      DataColumn(label: Text('Общая площадь (га)')),
                    ],
                    rows: const [
                      DataRow(
                        cells: [
                          DataCell(Text('Лесные')),
                          DataCell(Text('11')),
                          DataCell(Text('22 587,3')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Охотничьи (зоологические)')),
                          DataCell(Text('16')),
                          DataCell(Text('262482')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Ботаническиe')),
                          DataCell(Text('23')),
                          DataCell(Text('6114,5')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Комплексные заказники')),
                          DataCell(Text('2')),
                          DataCell(Text('10142')),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
