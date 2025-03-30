import 'package:dio/dio.dart';
import '../../../domain/remote/common/errors.dart';
import '../../../domain/remote/common/response_wrapper.dart';
import '../../../../catalog/domain/remote/common/response_type.dart' as res_type;
import '../../../domain/remote/feature/requests/get_feature_request.dart';
import '../../../domain/remote/feature/responses/get_feature_response.dart';
import '../../data_source/feature/feature_remote_data_source.dart';

class FeatureRepository {

  final FeatureRemoteDataSource featureRemoteDataSource;

  const FeatureRepository({required this.featureRemoteDataSource});


  Future<ResponseWrapper<GetFeatureResponse>> getFeatures({required GetFeatureRequest request}) async {

    Response response = await featureRemoteDataSource.getFeatures(request: request);
    if (response.statusCode == 200) {
      String code = response.data['code'];
      if (code == '200') {
        var res = ResponseWrapper<GetFeatureResponse>();
        res.responseType = res_type.ResponseType.success;
        res.data = GetFeatureResponse.fromJson(response.data);
        res.message = response.data['message'];
        return res;
      }
      else {
        var res = ResponseWrapper<GetFeatureResponse>();
        res.responseType = res_type.ResponseType.validationError;
        res.message = response.data['message'];
        if (response.data['errors']["global"] != null) {
          res.errors = Errors.fromJson(response.data['errors']);
        }
        return res;
      }
    } else {
      var res = ResponseWrapper<GetFeatureResponse>();
      res.message = response.data['message'];
      res.responseType = res_type.ResponseType.serverError;
      return res;
    }
  }
}