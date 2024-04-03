// import 'dart:async';

// import 'package:calculator_flutter_app/common/extensions/num.dart';
// import 'package:calculator_flutter_app/common/widgets/app_filled_button.dart';
// import 'package:calculator_flutter_app/util/loading/loading.dart';
// import 'package:calculator_flutter_app/util/resources/r.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geocoding/geocoding.dart'; // For reverse geocoding
// import 'package:go_router/go_router.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';

// class SearchLocation extends ConsumerStatefulWidget {
//   const SearchLocation({Key? key}) : super(key: key);

//   @override
//   ConsumerState<SearchLocation> createState() => _SearchLocationState();
// }

// class _SearchLocationState extends ConsumerState<SearchLocation> {
//   List<Marker> markers = [];
//   late GoogleMapController googleMapController;
//   final Completer<GoogleMapController> completer = Completer();
//   TextEditingController searchController = TextEditingController();
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _addMarker(LatLng position) {
//     markers.clear();
//     markers.add(
//       Marker(
//         markerId: MarkerId(position.toString()),
//         position: position,
//         draggable: true,
//         onDragEnd: (newPosition) {
//           _updateAddress(newPosition);
//         },
//       ),
//     );
//     setState(() {});
//   }

//   Future<void> _updateAddress(LatLng position) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     if (placemarks.isNotEmpty) {
//       Placemark place = placemarks.first;
//       searchController.text =
//           "${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.country}";
//     }
//   }

//   Future<void> onMapCreated(GoogleMapController controller) async {
//     googleMapController = controller;
//     if (!completer.isCompleted) {
//       completer.complete(controller);
//     }

//     CameraUpdate cameraUpdate =
//         CameraUpdate.newLatLngZoom(const LatLng(0, 0), 2);
//     await googleMapController.animateCamera(cameraUpdate);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(top: 18.h),
//         child: Stack(
//           children: [
//             GoogleMap(
//               mapToolbarEnabled: false,
//               onMapCreated: onMapCreated,
//               initialCameraPosition: const CameraPosition(
//                 target: LatLng(0, 0),
//                 zoom: 2,
//               ),
//               markers: markers.toSet(),
//               onTap: (position) {
//                 position = position;
//                 _addMarker(position);
//                 _updateAddress(position);
//               },
//             ),
//             Positioned(
//               top: 28.h,
//               child: Row(
//                 children: [
//                   InkWell(
//                     borderRadius: BorderRadius.circular(66.r),
//                     radius: 55,
//                     onTap: () => GoRouter.of(context).pop(),
//                     child: Icon(
//                       Icons.chevron_left,
//                       size: 32.r,
//                       color: R.colors.primary,
//                     ),
//                   ),
//                   12.wb,
//                   SizedBox(
//                     width: 324.w,
//                     child: GooglePlaceAutoCompleteTextField(
//                       textStyle: const TextStyle(fontFamily: 'Urbanist'),
//                       boxDecoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.r),
//                         color: R.colors.white,
//                         border: Border.all(
//                           color: R.colors.black,
//                         ),
//                       ),
//                       textEditingController: searchController,
//                       googleAPIKey: 'GOOGLE_API_KEY',
//                       inputDecoration: InputDecoration(
//                         hintText: 'Search Location',
//                         hintStyle: TextStyle(
//                           color: R.colors.orange,
//                           fontSize: 14.sp,
//                           fontFamily: 'Urbanist',
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                           borderSide: BorderSide(
//                             color: R.colors.white,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                           borderSide: BorderSide(
//                             color: R.colors.white,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                           borderSide: BorderSide(
//                             color: R.colors.white,
//                           ),
//                         ),
//                         filled: true,
//                         fillColor: R.colors.white,
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal: 12.w,
//                         ),
//                       ),
//                       itemClick: (pred) {
//                         searchController.text = pred.description!;
//                         if (pred.lat == null || pred.lng == null) {
//                           loading(context);
//                         } else {
//                           dismissLoading();

//                           googleMapController.animateCamera(
//                             CameraUpdate.newLatLng(
//                               LatLng(
//                                 double.parse(pred.lat!),
//                                 double.parse(pred.lng!),
//                               ),
//                             ),
//                           );
//                           _addMarker(
//                             LatLng(
//                               double.parse(pred.lat!),
//                               double.parse(pred.lng!),
//                             ),
//                           );
//                         }
//                       },
//                       getPlaceDetailWithLatLng: (pred) {
//                         if (pred.lat == null || pred.lng == null) {
//                           loading(context);
//                         } else {
//                           dismissLoading();
//                           googleMapController.animateCamera(
//                             CameraUpdate.newLatLng(
//                               LatLng(
//                                 double.parse(pred.lat!),
//                                 double.parse(pred.lng!),
//                               ),
//                             ),
//                           );
//                           _addMarker(
//                             LatLng(
//                               double.parse(pred.lat!),
//                               double.parse(pred.lng!),
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 20.h,
//               right: 62.w,
//               left: 62.w,
//               child: AppFilledButton(
//                 width: 220,
//                 text: 'Done',
//                 onTap: () {
//                   GoRouter.of(context).pop();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
