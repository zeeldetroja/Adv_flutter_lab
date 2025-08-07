
// import 'package:get/get_connect/http/src/response/response.dart' as http show Response;
import 'package:http/http.dart' as http;

class ApiService{
  String BaseURL = 'https://67d69555286fdac89bc2542a.mockapi.io/users';

  Future<http.Response> getAllUsers() async {
    return await http.get(Uri.parse(BaseURL));
  }

  Future<http.Response> addUser({dynamic data}) async {
    return await http.post(Uri.parse(BaseURL),body: data);
  }

  Future<http.Response> deleteUser({dynamic id}) async {
    return await http.delete(Uri.parse(BaseURL + '$id'));
  }

}