// import 'package:http/http.dart' as http;
//
// import '../Pages/Login.dart';
// import '../Service/Sharedpreferences_service.dart';
//
//
// class ProcessResponse{
//   dynamic processResponse(http.Response response) async {
//     switch (response.statusCode) {
//         case 400:
//           return _LoginState().message('Server Error');
//         case 401:
//           return _LoginState().message('Wrong Bip ID or Password');
//         default:
//           return _LoginState().message('Something Wrong. Try again later');
//       }
//     // switch (response.statusCode) {
//     //   case 400:
//     //     Sharedpreferences_service().keep_case_data_commonError('error', "Server Error");
//     //     break;
//     //   case 401:
//     //     Sharedpreferences_service().keep_case_data_commonError('error', "Wrong Bip ID or Password");
//     //     break;
//     //   default:
//     //     Sharedpreferences_service().keep_case_data_commonError('error', "Something Wrong. Try again later");
//     //     break;
//     // }
//   }
// }
//
