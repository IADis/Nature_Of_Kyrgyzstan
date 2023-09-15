import 'package:flutter/material.dart';

import '../../../../components/app_text.dart';
import 'red_book_status.dart';

class RedBookInfoList extends StatelessWidget {
  const RedBookInfoList({
    super.key,
    required this.redBookName,
    required this.redBookDes,
    required this.redBookListName,
    required this.redBookList,
    required this.redBookDef,
    required this.redBookBodyName,
    required this.redBookBodyDes,
    required this.redBookStatus,
    required this.statusEx,
    required this.statusEw,
    required this.statusCr,
    required this.statusEn,
    required this.statusVu,
    required this.statusCd,
    required this.statusNt,
    required this.statusLc,
    required this.statusDd,
    required this.statusNe,
  });

  final String redBookName;
  final String redBookDes;
  final String redBookListName;
  final String redBookList;
  final String redBookDef;
  final String redBookBodyName;
  final String redBookBodyDes;
  final String redBookStatus;
  final String statusEx;
  final String statusEw;
  final String statusCr;
  final String statusEn;
  final String statusVu;
  final String statusCd;
  final String statusNt;
  final String statusLc;
  final String statusDd;
  final String statusNe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 15,
          left: 15,
          bottom: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              redBookName,
              style: AppText.mainTitleTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              redBookDes,
              style: AppText.bodyTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              redBookDes,
              style: AppText.mainTitleTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              redBookList.toString().replaceAll('\\n', '\n'),
              style: AppText.bodyTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              redBookDef.toString().replaceAll('\\n', '\n'),
              style: AppText.bodyTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              redBookBodyName,
              style: AppText.mainTitleTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              redBookBodyDes.toString().replaceAll('\\n', '\n'),
              style: AppText.bodyTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              redBookStatus,
              style: AppText.mainTitleTextStyle,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RedBookStatus(
                  textColor: Colors.red,
                  color: Colors.black,
                  name: 'EX',
                  textStatus: statusEx,
                ),
                RedBookStatus(
                  textColor: Colors.white,
                  color: Colors.black,
                  name: 'EW',
                  textStatus: statusEw,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RedBookStatus(
                  textColor: Colors.white,
                  color: Colors.red,
                  name: 'CR',
                  textStatus: statusCr,
                ),
                RedBookStatus(
                  textColor: Colors.white,
                  color: Colors.orange,
                  name: 'EN',
                  textStatus: statusEn,
                ),
                RedBookStatus(
                  textColor: Colors.white,
                  color: Colors.yellow,
                  name: 'VU',
                  textStatus: statusVu,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RedBookStatus(
                    textColor: Colors.white,
                    color: const Color.fromARGB(255, 39, 95, 41),
                    name: 'CD',
                    textStatus: statusCd),
                RedBookStatus(
                  textColor: Colors.white,
                  color: Colors.green,
                  name: 'NT',
                  textStatus: statusNt,
                ),
                RedBookStatus(
                  textColor: Colors.white,
                  color: Colors.greenAccent,
                  name: 'LC',
                  textStatus: statusLc,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RedBookStatus(
                  textColor: Colors.white,
                  color: const Color.fromARGB(255, 84, 84, 84),
                  name: 'DD',
                  textStatus: statusDd,
                ),
                RedBookStatus(
                  textColor: Colors.white,
                  color: Colors.grey,
                  name: 'NE',
                  textStatus: statusNe,
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
