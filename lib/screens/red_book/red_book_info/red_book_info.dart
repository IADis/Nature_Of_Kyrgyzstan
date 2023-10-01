import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';
import 'widgets/red_book_list.dart';

class RedBookInfo extends StatefulWidget {
  const RedBookInfo({super.key});

  @override
  State<RedBookInfo> createState() => _RedBookInfoState();
}

class _RedBookInfoState extends State<RedBookInfo> {
  Stream<QuerySnapshot> redBook =
      FirebaseFirestore.instance.collection('redBook').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        foregroundColor: AppColors.appBarForegruoundColor,
        backgroundColor: AppColors.appBarBackgroundColor,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: redBook,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('ERROR'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }

          if (snapshot.hasData) {
            final data = snapshot.data!.docs[0];
            return RedBookInfoList(
              redBookName: data['redBookName'],
              redBookDes: data['redBookDes'],
              redBookListName: data['redBookListName'],
              redBookList: data['redBookList'],
              redBookDef: data['redBookDef'],
              redBookBodyName: data['redBookBodyName'],
              redBookBodyDes: data['redBookBodyDes'],
              redBookStatus: data['redBookStatus'],
              statusEx: data['statusEx'],
              statusEw: data['statusEw'],
              statusCr: data['statusCr'],
              statusEn: data['statusEn'],
              statusVu: data['statusVu'],
              statusCd: data['statusCd'],
              statusNt: data['statusNt'],
              statusLc: data['statusLc'],
              statusDd: data['statusDd'],
              statusNe: data['statusNe'],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
