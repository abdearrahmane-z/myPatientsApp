import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:my_patients/view/detailPage/detail_page.dart';

class ItemForm extends StatelessWidget {
   const ItemForm({super.key, required this.name, required this.details, required this.time, required this.id, this.data});
  final String id;
  final String name;
  final String details;
  final String time;
  final Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => DetailPage(
            data: data,
          ),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
        );
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 700,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
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
                  title: Text(name, style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
                  subtitle: Text(details, style: TextStyle(fontSize: 14.spMin, overflow: TextOverflow.ellipsis)),
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red, size: 30.spMin)),
              const SizedBox(width: 10),
              Expanded(child: Text(time, style: TextStyle(fontSize: 16.spMin))),

            ],
          ),
        ),
      ),
    );
  }
}