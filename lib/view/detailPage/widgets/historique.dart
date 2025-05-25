import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/model/detailPageData.dart';

class HistoriqueWidget extends StatelessWidget {
  const HistoriqueWidget({
    super.key,
    required this.data,
    required this.title,
    required this.show,
    required this.onPresse, required this.color,
  });
  final List<HistoriqueItem> data;
  final String title;
  final bool show;
  final VoidCallback onPresse;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   title,
        //   style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.bold),
        // ),
        // SizedBox(height: screenHeight * 0.01),
        ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            show ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
          onTap: onPresse, // Cannot mutate final field
        ),
        if (show)
          Container(
            height: screenHeight * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child:
                data.isEmpty
                    ? Center(
                      child: Text(
                        'Aucune donnée disponible',
                        style: TextStyle(fontSize: 16.spMin),
                      ),
                    )
                    : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5.spMin),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.spMin,
                                vertical: 5.spMin,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.history, color: Colors.white),
                                  SizedBox(width: 10.spMin),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Tension: ${data[index].tension}',
                                      style: AppTextStyles.detailTitle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          data[index].date,
                                          style: AppTextStyles.detailSubtitle,
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          data[index].time,
                                          style: AppTextStyles.detailSubtitle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              endIndent: 20,
                              indent: 20,
                              color: Colors.grey,
                              height: 1.spMin,
                            ),
                          ],
                        );
                      },
                    ),
          ),
      ],
    );
  }
}
