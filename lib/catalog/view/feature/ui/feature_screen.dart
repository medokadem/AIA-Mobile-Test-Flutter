import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/config/app_colors.dart';
import '../../../../common/widgets/pages/empty_widget.dart';
import '../../../../common/widgets/pages/error_widget.dart';
import '../../../../out-buildings/dependency_injector.dart';
import '../../../domain/remote/feature/requests/get_feature_request.dart';
import '../bloc/get_feature_bloc.dart';
import 'components/get_feature_loading_widget.dart';
import 'components/feature_success_data_widget.dart';

class FeatureScreen extends StatefulWidget {
  static const routeName = 'GetFeatureScreen';

  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  late GetFeatureBloc _getFeatureBloc;
  
  @override
  void initState() {
    super.initState();
    _getFeatureBloc = getIt<GetFeatureBloc>();
    _getFeatureBloc.add(GetFeature(request: GetFeatureRequest()));
  }

  @override
  void dispose() {
    _getFeatureBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.4,
          centerTitle: true,
          title: Text(
            'Feature screen'.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 16,
            ),
          )
        ),
        body: BlocBuilder<GetFeatureBloc, GetFeatureState>(
          bloc: _getFeatureBloc,
          builder: (context, state) {
            if (state is GetFeatureInitial || state is GetFeatureLoading) {
              return const FeatureLoadingWidget();
            } else if (state is GetFeatureLoaded) {
              return  FeatureSuccessDataWidget(list: state.response.data ?? []);
            } else if (state is GetFeatureIsEmpty) {
              return EmptyPage(title: "No Data to show".tr(), content: "No data to show".tr());
            } else if (state is GetFeatureError) {
              return ErrorPage(
                  errorMessage: state.message ?? "",
                  onRetryPressed: () {
                    _getFeatureBloc.add(GetFeature(request: GetFeatureRequest()));
                  });
            }
            return const SizedBox();
          },
        )
    );
  }

}
