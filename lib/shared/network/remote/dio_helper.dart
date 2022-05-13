import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/shared/components/constants.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://hawabc.herokuapp.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required String lang,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
      'Accept-Language': lang,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required data,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
    String? contentType,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      //  'Authorization': 'Bearer ${token}',
      'Accept-Language': lang,
    };
    return await dio.post(
      url,
      options: Options(
        contentType: contentType,
      ),
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    required String lang,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
      'Accept-Language': lang,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}


class SearchHelper {
  late Dio dio;
  SearchHelper(){
    BaseOptions options = BaseOptions(
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }



  Future<List<dynamic>> fetchSuggestions(
      String place,
      String sessionToken
      ) async {
    try{
      Response response = await dio.get(
          suggestionsBaseUrl,
          queryParameters: {
            'input': place,
            'sessiontoken': sessionToken,
            'types': 'address',
            'components': 'country:eg',
            'key': googleApiKey,
          }
      );
      return response.data['predictions'];

    }catch(e){
      print(e.toString());
      return [];
    }

  }



  Future<dynamic> getPlaceLocation(
      String placeId,
      String sessionToken
      ) async {
    try{
      Response response = await dio.get(
          placeLocationBaseUrl,
          queryParameters: {
            'place_id': placeId,
            'sessiontoken': sessionToken,
            'fields': 'geometry',
            'key': googleApiKey,
          }
      );
      print(response.data.toString());
      return response.data;


    }catch(error){
      print(error.toString());
      return Future.error(
          "Place Location Error : ",
          StackTrace.fromString(("this is its trace"),),
      );
    }

  }


  // Origin = Current Location
  Future<dynamic> getPlaceDirections(
      LatLng? origin,
      LatLng? destination,
      ) async {
    try{
      Response response = await dio.get(
          directionsBaseUrl,
          queryParameters: {
            'origin': '${origin!.latitude},${origin.longitude}',
            'destination': '${destination!.latitude},${destination.longitude}',
            'key': googleApiKey,
          }
      );
      print(response.data.toString());
      return response.data;


    }catch(error){
      print(error.toString());
      return Future.error(
        "Place Location Error : ",
        StackTrace.fromString(("this is its trace"),),
      );
    }

  }

}
