import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/model/patients_data.dart';

import '../../../controller/detail_page_controller.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    required this.screenHeight,
    required this.patient,
  });

  final double screenHeight;
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    DetailPageController controller = Get.find();
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.appBarColor,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.person,
                size: 80.spMin,
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.0004),
            
            Obx(()=>controller.edit.value?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Expanded(
                flex: 2,
                child: TextField(
                style: AppTextStyles.username,
                textAlign: TextAlign.center,
                controller: controller.name,
                            ),
              ),
              Spacer(),
            Expanded(
              flex: 2,
              child: TextField(
                style: AppTextStyles.username,
                textAlign: TextAlign.center,
                controller: controller.lastName,
              ),
            )
            ],):Text(
              '${patient?.name} ${patient?.lastName}',
              style: AppTextStyles.username,
            ),)
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.appBarColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Obx(()=> Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [controller.edit.value?
                  TextField(textAlign: TextAlign.center, controller: controller.age,style: AppTextStyles.detailText,):
                  Text('Âge : ${patient?.age}', style: AppTextStyles.detailText),
                  Text(
                    'Sexe : ${patient?.gender}',
                    style: AppTextStyles.detailText,
                  ),
                  Text('Antécédents :', style: AppTextStyles.detailText),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    height: 50.spMin,
                    margin: const EdgeInsets.only(top: 2),
                    child: SingleChildScrollView(
                      child: 
                      controller.edit.value?
                      TextField(textAlign: TextAlign.center, controller: controller.antecedent,style: AppTextStyles.detailSubtitle,):
                      Text(
                        '${patient?.antecedent}',
                        style: AppTextStyles.paragraph,
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ],
    );
  }
}
