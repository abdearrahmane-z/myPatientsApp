import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/model/patients_page_data.dart';
import 'package:my_patients/view/detailPage/detail_page.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({super.key, required this.patient});
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => DetailPage(patient: patient),
          transition: Transition.leftToRight,
          duration: const Duration(milliseconds: 400),
        );
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.appBarColor.withOpacity(0.1),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Icon(Icons.person, size: 50.spMin)),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    '${patient.name} ${patient.lastName}',
                    style: TextStyle(
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(
                    'Age: ${patient.age.toString()}',
                    style: TextStyle(
                      fontSize: 14.spMin,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.red, size: 30.spMin),
              ),
            ],
          ),
        ),
    );
  }
}
