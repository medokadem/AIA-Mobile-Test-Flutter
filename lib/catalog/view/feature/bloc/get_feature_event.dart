part of 'get_feature_bloc.dart';

abstract class GetFeatureEvent extends Equatable {
  const GetFeatureEvent();

  @override
  List<Object> get props => [];
}

class GetFeature extends GetFeatureEvent {
  final GetFeatureRequest request;
  const GetFeature({required this.request});
}