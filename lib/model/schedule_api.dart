
import 'package:dio/dio.dart';
import 'package:schedule_app/model/schedule_model.dart';
class ScheduleApi {
  final Dio _dio = Dio(BaseOptions(baseUrl:'https://alpha.classaccess.io/api/challenge' ));
  
  //get request
  Future<ScheduleModel?> getData({required String id}) async{
    ScheduleModel data;
    try {         
   Response userData = await _dio.get('/v2/schedule/id');
    data = ScheduleModel.fromJson(userData.data);
    return data;
    }
     catch (e) {
      //print(e);
     }
     return null;
  
  }
  //post request
  Future createData({required ScheduleModel userData}) async{
    ScheduleModel? retrievedData;
    try {
   Response response = await _dio.post('/v1/save/schedule',data: userData.toJson(),);
       retrievedData = ScheduleModel.fromJson(response.data);
       return retrievedData;
    }
    catch(e) {
    //print(e);
    }
    return null;

  }
}