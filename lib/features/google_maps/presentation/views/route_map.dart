// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:calculator_flutter_app/features/google_maps/domain/models/lat_lng/lat_lng_model.dart';
// import 'package:calculator_flutter_app/features/google_maps/presentation/providers/request_location_permission_provider.dart';
// import 'package:calculator_flutter_app/features/image_picker/presentation/views/popups/allow_permission_popup.dart';
// import 'package:calculator_flutter_app/gen/assets.gen.dart';
// import 'package:calculator_flutter_app/util/exceptions/message_exception.dart';
// import 'package:calculator_flutter_app/util/resources/r.dart';
// import 'package:calculator_flutter_app/util/toast/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class RouteMapWidget extends ConsumerStatefulWidget {
//   final List<LatLngModel> points;

//   const RouteMapWidget({
//     required this.points,
//     Key? key,
//   }) : super(key: key);

//   @override
//   ConsumerState createState() => _RouteMapWidgetState();
// }

// class _RouteMapWidgetState extends ConsumerState<RouteMapWidget> {
//   List<Marker> markers = [];
//   PolylinePoints polylinePoints = PolylinePoints();
//   Map<PolylineId, Polyline> polylines = {};
//   late GoogleMapController googleMapController;
//   final Completer<GoogleMapController> completer = Completer();

//   BitmapDescriptor? transparentMarker;
//   BitmapDescriptor? firstPointMarker;
//   BitmapDescriptor? lastPointMarker;

//   @override
//   void initState() {
//     super.initState();
//     loadCustomMarkers();
//   }

//   Future<void> _requestLocationPermission() async {
//     try {
//       await ref.read(requestLocationPermissionProvider.future);

//       return;
//     } on MessageException catch (e) {
//       showToast(msg: e.message);
//       return;
//     } on LocationPermissionDenied {
//       showToast(msg: 'Location Permission is denied');
//       return;
//     } on LocationPermissionDeniedPermanently {
//       if (mounted) {
//         await showDialog<void>(
//           context: context,
//           builder: (context) => const RequestPermissionWidget(
//             icon: Icons.camera,
//             description:
//                 'Allow app to access you location while you use the app',
//           ),
//         );
//       }
//       return;
//     } catch (e) {
//       showToast(msg: 'Something went wrong');
//     }
//     return;
//   }

//   Future<void> loadCustomMarkers() async {
//     _requestLocationPermission();
//     transparentMarker = await createTransparentMarker();

//     firstPointMarker = await BitmapDescriptor.asset(
//       const ImageConfiguration(),
//       Assets.pngs.originIcon.path,
//     );

//     lastPointMarker = await BitmapDescriptor.asset(
//       const ImageConfiguration(),
//       Assets.pngs.destinationIcon.path,
//     );

//     initMarkersAndRoute();
//   }

//   Future<BitmapDescriptor> createTransparentMarker() async {
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint = Paint()..color = Colors.transparent;
//     const Size size = Size(1.0, 1.0);
//     canvas.drawRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height), paint);
//     final ui.Image image = await pictureRecorder
//         .endRecording()
//         .toImage(size.width.toInt(), size.height.toInt());
//     final ByteData? byteData =
//         await image.toByteData(format: ui.ImageByteFormat.png);
//     final Uint8List byteDataList = byteData!.buffer.asUint8List();
//     return BitmapDescriptor.bytes(byteDataList);
//   }

//   Future<void> fitMarkersIntoView() async {
//     LatLngBounds bounds;
//     if (markers.length == 2) {
//       bounds = LatLngBounds(
//         southwest: LatLng(
//           markers[0].position.latitude < markers[1].position.latitude
//               ? markers[0].position.latitude
//               : markers[1].position.latitude,
//           markers[0].position.longitude < markers[1].position.longitude
//               ? markers[0].position.longitude
//               : markers[1].position.longitude,
//         ),
//         northeast: LatLng(
//           markers[0].position.latitude > markers[1].position.latitude
//               ? markers[0].position.latitude
//               : markers[1].position.latitude,
//           markers[0].position.longitude > markers[1].position.longitude
//               ? markers[0].position.longitude
//               : markers[1].position.longitude,
//         ),
//       );
//     } else {
//       bounds = LatLngBounds(
//         southwest: LatLng(
//           markers
//               .map((m) => m.position.latitude)
//               .reduce((a, b) => a < b ? a : b),
//           markers
//               .map((m) => m.position.longitude)
//               .reduce((a, b) => a < b ? a : b),
//         ),
//         northeast: LatLng(
//           markers
//               .map((m) => m.position.latitude)
//               .reduce((a, b) => a > b ? a : b),
//           markers
//               .map((m) => m.position.longitude)
//               .reduce((a, b) => a > b ? a : b),
//         ),
//       );
//     }
//     CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
//     await googleMapController.animateCamera(cameraUpdate);
//   }

//   void initMarkersAndRoute() {
//     for (int i = 0; i < widget.points.length; i++) {
//       addMarker(
//         LatLng(
//           widget.points[i].lat,
//           widget.points[i].lng,
//         ),
//         markerIcon(i),
//       );
//     }

//     if (markers.length > 1) {
//       // getDirections(markers);
//     }
//   }

//   void onMapCreated(GoogleMapController controller) {
//     googleMapController = controller;
//     if (!completer.isCompleted) {
//       completer.complete(controller);
//     }

//     fitMarkersIntoView();
//   }

//   void addMarker(LatLng latLng, BitmapDescriptor markerIcon) {
//     markers.add(
//       Marker(
//         markerId: MarkerId(latLng.toString()),
//         position: latLng,
//         icon: markerIcon,
//       ),
//     );
//   }

//   BitmapDescriptor markerIcon(int index) {
//     if (index == 0) {
//       return firstPointMarker!;
//     } else if (index == widget.points.length - 1) {
//       return lastPointMarker!;
//     } else {
//       return transparentMarker!;
//     }
//   }

//   // Future<void> getDirections(List<Marker> markers) async {
//   //   List<LatLng> polylineCoordinates = [];
//   //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//   //     request: PolylineRequest(),
//   //     AppString.googleMapApiKey,
//   //     PointLatLng(
//   //         markers.first.position.latitude, markers.first.position.longitude),
//   //     PointLatLng(
//   //         markers.last.position.latitude, markers.last.position.longitude),
//   //   );

//   //   if (result.points.isNotEmpty) {
//   //     for (var point in result.points) {
//   //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//   //     }
//   //   } else {
//   //     log('$result.errorMessage');
//   //   }

//   //   addPolyLine(polylineCoordinates);
//   // }

//   void addPolyLine(List<LatLng> polylineCoordinates) {
//     PolylineId id = const PolylineId("poly");
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: R.colors.primary,
//       points: polylineCoordinates,
//       width: 4,
//       jointType: JointType.round,
//     );
//     polylines[id] = polyline;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       mapToolbarEnabled: false,
//       onMapCreated: onMapCreated,
//       polylines: Set<Polyline>.of(polylines.values),
//       initialCameraPosition: CameraPosition(
//         target: LatLng(widget.points.first.lat, widget.points.first.lng),
//         zoom: 10,
//       ),
//       markers: markers.toSet(),
//     );
//   }
// }
