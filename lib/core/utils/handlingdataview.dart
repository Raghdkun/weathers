import 'package:lottie/lottie.dart';
import 'package:weather_app/core/app_export.dart';


class HandlingDataView extends StatelessWidget {
  final LoadDataState statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == LoadDataState.loading
        ? Center(
            child: Lottie.asset(AssetsImages.lottieLoading,
                width: 250, height: 250))
        : statusRequest == LoadDataState.offline
            ? Center(
                child: Lottie.asset(AssetsImages.lottieNoconnection,
                    width: 250, height: 250))
            : statusRequest == LoadDataState.serverfailure
                ? Center(
                    child: Lottie.asset(AssetsImages.lottieTimeout,
                        width: 250, height: 250))
                : statusRequest == LoadDataState.timeout
                    ? Center(
                        child: Lottie.asset(AssetsImages.lottieNodata,
                            width: 250, height: 250, repeat: true))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final LoadDataState statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == LoadDataState.loading
        ? Center(
            child: Lottie.asset(AssetsImages.lottieLoading,
                width: 250, height: 250))
        : statusRequest == LoadDataState.offline
            ? Center(
                child: Lottie.asset(AssetsImages.lottieNoconnection,
                    width: 250, height: 250))
            : statusRequest == LoadDataState.serverfailure
                ? Center(
                    child: Lottie.asset(AssetsImages.lottieTimeout,
                        width: 250, height: 250))
                : widget;
  }
}
