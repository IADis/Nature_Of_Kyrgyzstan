import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/app_colors.dart';
import '../../../../components/app_text.dart';

class DetailScreenItems extends StatelessWidget {
  const DetailScreenItems({
    super.key,
    required this.name,
    required this.nameLat,
    required this.status,
    required this.color,
    required this.colorStatus,
    required this.statusBody,
    required this.descriptionBody,
    required this.distributionBody,
    required this.habitatBody,
    required this.numberBody,
    required this.lifeCycleBody,
    required this.limitBody,
    required this.breedingBody,
    required this.existingBody,
    required this.recommendedBody,
  });

  final String name;
  final String nameLat;
  final String status;
  final Color color;
  final Color colorStatus;
  final String statusBody;
  final String descriptionBody;
  final String distributionBody;
  final String habitatBody;
  final String numberBody;
  final String lifeCycleBody;
  final String limitBody;

  final String breedingBody;
  final String existingBody;
  final String recommendedBody;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 30,
        left: 15,
        right: 15,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Text(
              name,
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              nameLat,
              style: GoogleFonts.raleway(
                fontSize: 18,
                color: AppColors.arthropodsColors,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  'Статус',
                  style: AppText.redBookTitleText,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: GoogleFonts.raleway(
                        fontSize: 21,
                        color: colorStatus,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              statusBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Описание',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              descriptionBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Распространение',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              distributionBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Места обитания',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              habitatBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Численность.',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              numberBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Жизненный цикл',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              lifeCycleBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Лимитирующие факторы',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              limitBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Разведение',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              breedingBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Меры охраны существующие',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              existingBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
            Text(
              'Меры охраны рекомендуемые',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 5),
            Text(
              recommendedBody,
              style: AppText.redBookBodyText,
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
