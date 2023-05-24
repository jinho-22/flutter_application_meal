import 'dart:convert';

import 'package:http/http.dart' as http;

class NeisApi {
  Future<List<dynamic>> getMeal(
      {required String fromDate, required String toDate}) async {
    String site =
        'https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=9f20b697a94d428a9d09151c44ef11e2&Type=json&ATPT_OFCDC_SC_CODE=J10&SD_SCHUL_CODE=7551041&MLSV_FROM_YMD=$fromDate&MLSV_TO_YMD=$toDate';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      try {
        var meals = jsonDecode(response.body)['mealServiceDietInfo'][1]['row']
            as List<dynamic>;
        return meals;
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }
}
