// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// const String _url = "https://tmt18.tpos.vn";

// class RestApiClient {
//   static final RestApiClient _singleton = RestApiClient._internal();

//   factory RestApiClient() {
//     return _singleton;
//   }

//   RestApiClient._internal();

//   Future<Response> httpGet(String path) async {
//     final prefs = await SharedPreferences.getInstance();
//     // print(prefs.getString('token')!);
//     return await http.get(
//       Uri.parse('$_url$path'),
//       headers: {
//         "Authorization": prefs.getString('token')!,
//       },
//     );
//   }

//   Future<Response> httpPostLogin({
//     required String path,
//     required String username,
//     required String password,
//   }) async {
//     return await http.post(
//       Uri.parse(
//         '$_url$path',
//       ),
//       body:
//           "grant_type=password&username=$username&password=$password&client_id=tmtWebApp",
//     );
//   }
// }
