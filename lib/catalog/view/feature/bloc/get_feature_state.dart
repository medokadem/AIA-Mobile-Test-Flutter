part of 'get_feature_bloc.dart';

abstract class GetFeatureState extends Equatable {

  const GetFeatureState();

  @override
  List<Object?> get props => [];

}

class GetFeatureInitial extends GetFeatureState {}

class GetFeatureLoading extends GetFeatureState {}

class GetFeatureNextPageLoading extends GetFeatureState {}

class GetFeatureLoaded extends GetFeatureState {
  final GetFeatureResponse response;
  const GetFeatureLoaded(this.response);
}

class GetFeatureIsEmpty extends GetFeatureState {
  const GetFeatureIsEmpty();
}


class GetFeatureError extends GetFeatureState {
  final String? message;
  const GetFeatureError(this.message);
}