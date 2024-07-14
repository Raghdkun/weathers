// import 'package:weather_app/core/network/handlingrequests/handlingstatus/handlingstatus.dart';

// import '../../../app_export.dart';

// class HandlingDataView extends StatelessWidget {
//   final LoadDataState statusRequest;
//   final Widget widget;
//   final void Function()? onPressed;

//   const HandlingDataView(
//       {Key? key,
//       required this.statusRequest,
//       required this.widget,
//       this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == LoadDataState.loading
//         ? Center(child: LoadingStatus())
//         : statusRequest == LoadDataState.offline
//             ? Center(
//                 child: NoInternetStatus(
//                 onPressed: onPressed,
//               ))
//             : statusRequest == LoadDataState.serverfailure
//                 ? Center(
//                     child: ErrorStatus(
//                     onPressed: onPressed,
//                   ))
//                 : statusRequest == LoadDataState.error
//                     ? Center(
//                         child: ErrorStatus(
//                         onPressed: onPressed,
//                       ))
//                     : widget;
//   }
// }

// class HandlingDataRequest extends StatelessWidget {
//   final LoadDataState statusRequest;
//   final Widget widget;
//   final void Function()? onPressed;

//   const HandlingDataRequest(
//       {Key? key,
//       required this.statusRequest,
//       required this.widget,
//       this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == LoadDataState.loading
//         ? Center(child: LoadingStatus())
//         : statusRequest == LoadDataState.offline
//             ? Center(
//                 child: NoInternetStatus(
//                 onPressed: onPressed,
//               ))
//             : statusRequest == LoadDataState.serverfailure
//                 ? Center(
//                     child: ErrorStatus(
//                     onPressed: onPressed,
//                   ))
//                 : widget;
//   }
// }
