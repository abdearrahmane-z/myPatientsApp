import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/user_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/fonctions/show_message.dart';
import 'package:my_patients/model/patients_data.dart';
import 'package:my_patients/view/detailPage/detail_page.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({super.key, required this.patient, required this.con_text});
  final Patient patient;
  final BuildContext con_text;

  @override
  Widget build(BuildContext context) {
    UserContrller user = Get.find();
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
          color: AppColors.appBarColor,
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
            Expanded(
              child: Icon(
                Icons.person,
                size: 50.spMin,
                color: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  '${patient.name} ${patient.lastName}',
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                subtitle: Text(
                  'Age: ${patient.age.toString()}',
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 14.spMin,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder:
                      (ctx) => AlertDialog(
                        title: const Text('Confirm Delete'),
                        content: const Text(
                          'Are you sure you want to remove this patient?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(true),
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                );
                if (confirm == true) {
                  final success = await Patient.removePatient(
                    patient,
                    user.userID,
                  );

                  if (success) {
                    showGlobalSnackBar(
                      con_text,
                      "Supprimé avec succès",
                      Colors.green,
                    );
                  } else {
                    showGlobalSnackBar(
                      con_text,
                      "erreur supprimer le patient",
                      Colors.red,
                    );
                  }
                }
              },
              icon: Icon(Icons.delete, color: Colors.red, size: 30.spMin),
            ),
          ],
        ),
      ),
    );
  }
}
