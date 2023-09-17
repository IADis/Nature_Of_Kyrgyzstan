import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/components/app_text.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({
    super.key,
    required this.name,
    required this.nameLat,
    required this.statusBody,
    required this.descriptionBody,
    required this.featuresOfBiologyBody,
    required this.spreadingBody,
    required this.placesBody,
    required this.numberBody,
    required this.limitBody,
    required this.cultivationBody,
    required this.existingBody,
    required this.recommendedBody,
    required this.color,
    required this.status,
    required this.colorStatus,
    required this.hero,
  });

  final String name;
  final String nameLat;
  final String statusBody;
  final String descriptionBody;
  final String featuresOfBiologyBody;
  final String spreadingBody;
  final String placesBody;
  final String numberBody;
  final String limitBody;
  final String cultivationBody;
  final String existingBody;
  final String recommendedBody;
  final Color color;
  final String status;
  final Color colorStatus;
  final String hero;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        bottom: 30,
        left: 15,
        right: 15,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            const SizedBox(height: 10),
            Hero(
              tag: hero,
              child: Text(
                name,
                style: AppText.redBookTitleText,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              nameLat,
              style: GoogleFonts.raleway(
                fontSize: 18,
                color: AppColors.activeColors,
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
            Text(statusBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Описание',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(descriptionBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Особенности биологии',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(featuresOfBiologyBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Распространение',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(spreadingBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Места произрастания',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(placesBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Численность',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(numberBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Лимитирующие факторы',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(limitBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Культивирование',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(cultivationBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Меры охраны существующие',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(existingBody, style: AppText.redBookBodyText),
            const SizedBox(height: 25),
            Text(
              'Меры охраны рекомендуемые',
              style: AppText.redBookTitleText,
            ),
            const SizedBox(height: 7),
            Text(recommendedBody, style: AppText.redBookBodyText),
          ],
        ),
      ),
    );
  }
}
