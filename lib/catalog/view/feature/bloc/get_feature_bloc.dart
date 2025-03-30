import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/remote/common/response_type.dart';
import '../../../domain/remote/feature/requests/get_feature_request.dart';
import '../../../domain/remote/feature/responses/get_feature_response.dart';
import '../../../infrastructure/repository/feature/feature_repository.dart';
part 'get_feature_event.dart';
part 'get_feature_state.dart';

class GetFeatureBloc extends Bloc<GetFeatureEvent, GetFeatureState> {

  final FeatureRepository featureRepository;
  GetFeatureBloc({
    required this.featureRepository,
  })  : super(GetFeatureInitial()) {
    on<GetFeature>(_onGetFeature);
  }

  Future<void> _onGetFeature(GetFeature event, emit) async {
    try {
      emit(GetFeatureLoading());
      final response = await featureRepository.getFeatures(request: event.request);

      emit(GetFeatureLoaded(response.data!));


      switch (response.responseType) {
        case ResponseType.success:
          if(response.data == null || response.data!.data!.isEmpty){
            emit(const GetFeatureIsEmpty());
          }else {
            emit(GetFeatureLoaded(response.data!));
          }
          break;
        default:
          emit(GetFeatureError(response.message));
          break;
      }
    } catch (e) {
      print(e.toString());
      emit(GetFeatureError("general_error".tr()));
    }
  }

}
