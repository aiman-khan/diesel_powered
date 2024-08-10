// import 'dart:async';

// import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
// import 'package:calculator_flutter_app/features/google_maps/domain/models/lat_lng/lat_lng_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ViewLocation extends ConsumerStatefulWidget {
//   const ViewLocation({required this.latLng, Key? key}) : super(key: key);

//   final LatLngModel latLng;

//   @override
//   ConsumerState<ViewLocation> createState() => _ViewLocationState();
// }

// class _ViewLocationState extends ConsumerState<ViewLocation> {
//   List<Marker> markers = [];
//   late GoogleMapController googleMapController;
//   final Completer<GoogleMapController> completer = Completer();

//   @override
//   void initState() {
//     super.initState();
//     _addMarker();
//   }

//   void _addMarker() {
//     markers.add(
//       Marker(
//         markerId: MarkerId(widget.latLng.toString()),
//         position: LatLng(widget.latLng.lat, widget.latLng.lng),
//       ),
//     );
//   }

//   Future<void> onMapCreated(GoogleMapController controller) async {
//     googleMapController = controller;
//     if (!completer.isCompleted) {
//       completer.complete(controller);
//     }

//     final bounds = LatLngBounds(
//       southwest: LatLng(widget.latLng.lat, widget.latLng.lng),
//       northeast: LatLng(widget.latLng.lat, widget.latLng.lng),
//     );

//     CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
//     await googleMapController.animateCamera(cameraUpdate);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapToolbarEnabled: false,
//             onMapCreated: onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(widget.latLng.lat, widget.latLng.lng),
//               zoom: 15,
//             ),
//             markers: markers.toSet(),
//           ),
//           Positioned(
//             top: 28.h,
//             child: const BackButtonWidget(),
//           ),
//         ],
//       ),
//     );
//   }
// }
