import 'package:dio/dio.dart';
import '../../../../common/config/api_urls.dart';
import '../../../domain/remote/feature/requests/get_feature_request.dart';

class FeatureRemoteDataSource {

  FeatureRemoteDataSource(this.dio);

  final Dio dio;

  Future<dynamic> getFeatures({required GetFeatureRequest request}) async {

    Response response = await dio.post(APIUrls.feature);
    return response;
  }

}
