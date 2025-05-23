import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patients/core/constants/text_styles.dart';

class HistoriqueWidget extends StatelessWidget {
  const HistoriqueWidget({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Historique de pics',
          style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHeight * 0.01),
        Container(
          height: screenHeight * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
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
                      String key = data.keys.elementAt(index);
                      DateTime date = DateTime.parse(key);
                      String formattedDate = '${date.day}-${date.month}-${date.year}';
                      String formattedTime = '${date.hour}:${date.minute}';
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.spMin),
                            padding: EdgeInsets.symmetric(horizontal: 20.spMin, vertical: 5.spMin),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.history, color: Colors.blue),
                                SizedBox(width: 10.spMin),
                                Expanded(flex: 2,
                                  child: Text(
                                    'Tension: ${data[key]['tension']}',
                                    style: AppTextStyles.detailTitle2,
                                  ),
                                ),
                                Expanded(flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        formattedDate,
                                        style: AppTextStyles.detailSubtitle2,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        formattedTime,
                                        style: AppTextStyles.detailSubtitle2,
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
