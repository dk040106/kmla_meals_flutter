import 'package:cloud_firestore/cloud_firestore.dart';

class Meal {
  Map meal;

  static DateTime now = new DateTime.now();
  static int date = now.day;
  static String day = date.toString();

  Future<void> getMeal() async {
    try {
      await Firestore.instance
          .collection('meals')
          .document(day)
          .get()
          .then((DocumentSnapshot ds) async {
            // use ds as a snapshot
            return ds['meal'].toString();
          }).then((mealData) {
            // parse meal data
            if (mealData == null) {
              meal = null;
            }
            else {
              // erase the dots on the end of meal data
              mealData = mealData.replaceAll('.', '');

              // erase the numbers on the end of meal data
              for (int i = 0; i <= 9; i++) {
                mealData = mealData.replaceAll(i.toString(), '');
              }

              // 대괄호 '['가 전체에서 3번 나오기 때문에 대괄호를 기준으로
              // 문자열을 자르면 각 식사별로 나눌 수 있게 된다.
              List check = new List(3);
              int count = 0;

              for (int i = 0; i < mealData.length; i++) {
                if (mealData[i] == '[') {
                  check[count] = i;
                  count++;
                }
              }

              meal['breakfast'] = mealData.substring(check[0] + 4, check[1]);
              meal['lunch'] = mealData.substring(check[1] + 4, check[2]);
              meal['dinner'] = mealData.substring(check[2] + 4);
            }
          });
    } catch(error) {
      print('Error Caught: $error');
      meal['error'] = 'Error: Could not fetch the meal data';
    }
  }
}