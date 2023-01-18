
import 'package:http/http.dart' as http;
import '../utils/api.dart';
class Services{
Future<http.Response> getUsers({int limit = 10}) async {
    return sendToApiGet(limit: limit);
  }
}
