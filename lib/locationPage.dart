import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState  extends State<MapScreen>{

  final Completer<GoogleMapController> _controller = Completer();

  LocationData? currentLocation;

  BitmapDescriptor userIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation()
  {
    Location location = Location();

    location.getLocation().then(
            (location)
        {
          currentLocation = location;
        }
    );
    location.onLocationChanged.listen(
        (newLocation)
        {
          currentLocation = newLocation;
          setState(() {});
        },
    );
  }

  void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/user_icon.png").then(
        (icon)
            {
              userIcon = icon;
            }
    );
  }
  @override
  void initState()
  {
    getCurrentLocation();
    setCustomMarkerIcon();
    setState(() {});
    super.initState();
  }

  static const _initialCameraPosition =  CameraPosition(
    target: LatLng(39.19048826227373, -96.58056736198418),
    zoom: 18,
  );

  static const Polygon _HalePoly = Polygon(polygonId: PolygonId('_HalePoly'),
      points: [ LatLng(39.1903621, -96.5812466),
        LatLng(39.1903797, -96.5812225),
        LatLng(39.1903371, -96.5811661),
        LatLng(39.1903735, -96.5811125),
        LatLng(39.1903787, -96.580792),
        LatLng(39.1903486, -96.5807812),
        LatLng(39.1903299, -96.5807504),
        LatLng(39.1903797, -96.5806807),
        LatLng(39.1903787, -96.580458),
        LatLng(39.190361, -96.580454),
        LatLng(39.1903631, -96.5802046),
        LatLng(39.1903215, -96.5801697),
        LatLng(39.1903163, -96.5801013),
        LatLng(39.1903444, -96.5800624),
        LatLng(39.1904432, -96.5800571),
        LatLng(39.190438, -96.5799954),
        LatLng(39.1904816, -96.5799095),
        LatLng(39.1905596, -96.5798586),
        LatLng(39.1906241, -96.5798639),
        LatLng(39.1906895, -96.5799323),
        LatLng(39.1907186, -96.5800289),
        LatLng(39.1908897, -96.580032),
        LatLng(39.1908897, -96.580209),
        LatLng(39.1909092, -96.580212),
        LatLng(39.1909092, -96.5802539),
        LatLng(39.1908759, -96.5802529),
        LatLng(39.1908757, -96.5802901),
        LatLng(39.1908377, -96.5802911),
        LatLng(39.1908354, -96.5806718),
        LatLng(39.1909612, -96.5806724),
        LatLng(39.1909498, -96.5812925),
        LatLng(39.1907617, -96.5812997),
        LatLng(39.1907482, -96.5812983),
        LatLng(39.1907503, -96.5812782),
        LatLng(39.1905647, -96.5812742),
        LatLng(39.1904795, -96.5812717),
        LatLng(39.190427, -96.5813287),
        LatLng(39.190414, -96.5813206),
        LatLng(39.1903621, -96.5812466)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _HoltonPoly = Polygon(polygonId: PolygonId('_HoltonPoly'),
      points: [LatLng(39.190032,-96.5801009),
        LatLng(39.1900196,-96.5801827),
        LatLng(39.1898865,-96.5801746),
        LatLng(39.1898262,-96.580176),
        LatLng(39.1898242,-96.5798662),
        LatLng(39.1900206,-96.5798689),
        LatLng(39.1900217,-96.5799574),
        LatLng(39.1900986,-96.5799587),
        LatLng(39.1900986,-96.5801022),
        LatLng(39.190032,-96.5801009)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _DickensPoly = Polygon(polygonId: PolygonId('_DickensPoly'),
      points: [LatLng(39.1905539,-96.5795077),
        LatLng(39.1904775,-96.579509),
        LatLng(39.1904796,-96.5795238),
        LatLng(39.1904479,-96.5795244),
        LatLng(39.1904489,-96.5795104),
        LatLng(39.1903762,-96.5795117),
        LatLng(39.1903751,-96.579497),
        LatLng(39.1903564,-96.5794963),
        LatLng(39.1903502,-96.5791147),
        LatLng(39.1905466,-96.5791107),
        LatLng(39.1905539,-96.5795077)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _BluemontPoly = Polygon(polygonId: PolygonId('_BluemontPoly'),
      points: [LatLng(39.1902673,-96.5788876),
        LatLng(39.1902471,-96.5788887),
        LatLng(39.190245,-96.5790034),
        LatLng(39.1901613,-96.5790008),
        LatLng(39.1901603,-96.5791912),
        LatLng(39.1901062,-96.5791942),
        LatLng(39.1901002,-96.5792237),
        LatLng(39.1898785,-96.5792242),
        LatLng(39.1898796,-96.5792028),
        LatLng(39.1898245,-96.5792095),
        LatLng(39.1898286,-96.5786865),
        LatLng(39.1899139,-96.5786757),
        LatLng(39.1899118,-96.5786382),
        LatLng(39.1900968,-96.5786395),
        LatLng(39.1900947,-96.5786824),
        LatLng(39.1901488,-96.5786824),
        LatLng(39.1901488,-96.5786194),
        LatLng(39.1902662,-96.5786274),
        LatLng(39.1902673,-96.5788876)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _JustinPoly = Polygon(polygonId: PolygonId('_JustinPoly'),
      points: [LatLng(39.1898328,-96.5781111),
        LatLng(39.1899409,-96.5779797),
        LatLng(39.1899596,-96.5780011),
        LatLng(39.1900532,-96.577867),
        LatLng(39.1900516,-96.5776907),
        LatLng(39.1900568,-96.5773976),
        LatLng(39.1901971,-96.5773983),
        LatLng(39.1901992,-96.5774721),
        LatLng(39.1905225,-96.5774774),
        LatLng(39.1905204,-96.5775686),
        LatLng(39.1905464,-96.5775713),
        LatLng(39.1905402,-96.5784256),
        LatLng(39.1904819,-96.5784216),
        LatLng(39.1904819,-96.5784698),
        LatLng(39.1903499,-96.5784658),
        LatLng(39.190352,-96.5784242),
        LatLng(39.1902314,-96.5784229),
        LatLng(39.1902314,-96.5782848),
        LatLng(39.1901813,-96.5782839),
        LatLng(39.1901834,-96.5782973),
        LatLng(39.1901345,-96.5782959),
        LatLng(39.1901355,-96.5783348),
        LatLng(39.1900066,-96.5783342),
        LatLng(39.1900087,-96.5782912),
        LatLng(39.1899708,-96.5782443),
        LatLng(39.18995,-96.5782604),
        LatLng(39.1898328,-96.5781111)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _EisenhowerPoly = Polygon(polygonId: PolygonId('_EisenhowerPoly'),
      points: [LatLng(39.1899541,-96.5806445),
      LatLng(39.1895487,-96.5806391),
      LatLng(39.1894822,-96.5807035),
      LatLng(39.189476,-96.5808645),
      LatLng(39.1893242,-96.5808618),
      LatLng(39.1893305,-96.5806016),
      LatLng(39.189449,-96.5804353),
      LatLng(39.18995,-96.5804353),
      LatLng(39.1899541,-96.5806445)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _LeePoly = Polygon(polygonId: PolygonId('_LeePoly'),
      points: [LatLng(39.1902544,-96.5831481),
        LatLng(39.1898835,-96.5831577),
        LatLng(39.1898856,-96.583096),
        LatLng(39.1898336,-96.5830987),
        LatLng(39.1898399,-96.5832113),
        LatLng(39.1895197,-96.5831979),
        LatLng(39.1895197,-96.5831389),
        LatLng(39.189316,-96.583147),
        LatLng(39.1892973,-96.5831765),
        LatLng(39.1892536,-96.5831684),
        LatLng(39.1892515,-96.5829726),
        LatLng(39.189585,-96.5829791),
        LatLng(39.1895809,-96.5830193),
        LatLng(39.1898075,-96.5830113),
        LatLng(39.1898574,-96.5829952),
        LatLng(39.1898553,-96.5826867),
        LatLng(39.1899925,-96.5826841),
        LatLng(39.1899987,-96.5827297),
        LatLng(39.1902544,-96.5827323),
        LatLng(39.1902544,-96.5831481)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _SeatonPoly = Polygon(polygonId: PolygonId('_SeatonPoly'),
      points: [LatLng(39.1892142,-96.5832133),
        LatLng(39.1890396,-96.5832133),
        LatLng(39.1890687,-96.5819741),
        LatLng(39.1896134,-96.5819795),
        LatLng(39.1896217,-96.5820251),
        LatLng(39.1896674,-96.5820331),
        LatLng(39.1896653,-96.5817676),
        LatLng(39.1897339,-96.5817676),
        LatLng(39.1897339,-96.5819821),
        LatLng(39.1897942,-96.5819875),
        LatLng(39.1897984,-96.5818909),
        LatLng(39.1898711,-96.5818883),
        LatLng(39.1898732,-96.5819902),
        LatLng(39.1899252,-96.5819795),
        LatLng(39.189921,-96.5816737),
        LatLng(39.1898649,-96.5816656),
        LatLng(39.1898607,-96.5814806),
        LatLng(39.1899979,-96.5814698),
        LatLng(39.1899959,-96.5815074),
        LatLng(39.1902349,-96.5815047),
        LatLng(39.1902329,-96.5814591),
        LatLng(39.1903493,-96.5814645),
        LatLng(39.1903513,-96.5818024),
        LatLng(39.1902807,-96.5817997),
        LatLng(39.1902848,-96.5818319),
        LatLng(39.1903306,-96.5818427),
        LatLng(39.1903285,-96.582009),
        LatLng(39.1903118,-96.5820036),
        LatLng(39.1903056,-96.5824542),
        LatLng(39.1901518,-96.5824569),
        LatLng(39.1901497,-96.582363),
        LatLng(39.1900229,-96.5823603),
        LatLng(39.190025,-96.5821323),
        LatLng(39.1898254,-96.5821458),
        LatLng(39.1898254,-96.5822155),
        LatLng(39.189682,-96.5822209),
        LatLng(39.189682,-96.5823442),
        LatLng(39.1896237,-96.5823442),
        LatLng(39.1896217,-96.5823952),
        LatLng(39.1892146,-96.5824039),
        LatLng(39.1892146,-96.5824897),
        LatLng(39.1896158,-96.582487),
        LatLng(39.1896158,-96.5827526),
        LatLng(39.1892188,-96.5827499),
        LatLng(39.1892142,-96.5832133)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _UnionPoly = Polygon(polygonId: PolygonId('_UnionPoly'),
      points: [ LatLng(39.1884045,-96.5830802),
        LatLng(39.1884003,-96.5830346),
        LatLng(39.1883483,-96.5830453),
        LatLng(39.1880926,-96.5830426),
        LatLng(39.1880968,-96.5830936),
        LatLng(39.1879949,-96.5830936),
        LatLng(39.1879991,-96.5830373),
        LatLng(39.1878328,-96.5830319),
        LatLng(39.1878536,-96.5825491),
        LatLng(39.1878161,-96.5825437),
        LatLng(39.1878161,-96.5823855),
        LatLng(39.187866,-96.5823828),
        LatLng(39.187866,-96.5819885),
        LatLng(39.1880968,-96.5820073),
        LatLng(39.1880926,-96.5821119),
        LatLng(39.1881488,-96.5821334),
        LatLng(39.1881467,-96.5820851),
        LatLng(39.18855,-96.5820744),
        LatLng(39.1885479,-96.5823023),
        LatLng(39.1886207,-96.582305),
        LatLng(39.1886228,-96.5825598),
        LatLng(39.1885604,-96.5825518),
        LatLng(39.1885562,-96.5825974),
        LatLng(39.1885812,-96.5826028),
        LatLng(39.1885749,-96.5828763),
        LatLng(39.1886061,-96.5828898),
        LatLng(39.188602,-96.5830829),
        LatLng(39.1884045,-96.5830802)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _EnglishPoly = Polygon(polygonId: PolygonId('_EnglishPoly'),
      points: [LatLng(39.1907118,-96.5820754),
        LatLng(39.1907535,-96.5820723),
        LatLng(39.1907535,-96.5818644),
        LatLng(39.1905945,-96.5818644),
        LatLng(39.1905945,-96.5817075),
        LatLng(39.1907471,-96.5817146),
        LatLng(39.1907481,-96.5815443),
        LatLng(39.1908729,-96.5815497),
        LatLng(39.1908718,-96.58172),
        LatLng(39.191062,-96.5817133),
        LatLng(39.1910652,-96.5817736),
        LatLng(39.1910891,-96.581779),
        LatLng(39.191088,-96.5818715),
        LatLng(39.1908697,-96.5818769),
        LatLng(39.1908708,-96.5821451),
        LatLng(39.1907118,-96.5821478),
        LatLng(39.1907118,-96.5820754)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _EngPoly = Polygon(polygonId: PolygonId('_EngPoly'),
      points: [LatLng(39.1906049,-96.5853043),
        LatLng(39.1905049,-96.585269),
        LatLng(39.1904965,-96.5851081),
        LatLng(39.1904945,-96.5849337),
        LatLng(39.1905049,-96.5847943),
        LatLng(39.1904633,-96.5847943),
        LatLng(39.1904633,-96.5847084),
        LatLng(39.1904778,-96.5845824),
        LatLng(39.1905797,-96.5845877),
        LatLng(39.1905714,-96.5844),
        LatLng(39.1904009,-96.5844187),
        LatLng(39.1903469,-96.5844027),
        LatLng(39.1902991,-96.584341),
        LatLng(39.1902492,-96.5843866),
        LatLng(39.1902533,-96.5845663),
        LatLng(39.190245,-96.5847299),
        LatLng(39.1902596,-96.5847862),
        LatLng(39.1902221,-96.5848023),
        LatLng(39.190193,-96.5847701),
        LatLng(39.1901244,-96.5847755),
        LatLng(39.1901016,-96.5848157),
        LatLng(39.1900517,-96.584813),
        LatLng(39.1900641,-96.5847674),
        LatLng(39.1899581,-96.5847728),
        LatLng(39.1899082,-96.5847916),
        LatLng(39.1898999,-96.5845743),
        LatLng(39.1899041,-96.5841371),
        LatLng(39.1900538,-96.5841291),
        LatLng(39.1902411,-96.5841376),
        LatLng(39.1903534,-96.5841805),
        LatLng(39.1903513,-96.583746),
        LatLng(39.1908669,-96.5837379),
        LatLng(39.1908752,-96.5841939),
        LatLng(39.1908295,-96.5842046),
        LatLng(39.1908295,-96.5843226),
        LatLng(39.1908731,-96.58432),
        LatLng(39.1908731,-96.5843897),
        LatLng(39.1908357,-96.5844031),
        LatLng(39.1908274,-96.5845238),
        LatLng(39.1908295,-96.5846311),
        LatLng(39.1908669,-96.5846365),
        LatLng(39.1908856,-96.5850737),
        LatLng(39.1908627,-96.5851273),
        LatLng(39.1908606,-96.585248),
        LatLng(39.1908315,-96.5852936),
        LatLng(39.1906049,-96.5853043)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  static const Polygon _BusinessPoly = Polygon(polygonId: PolygonId('_BusinessPoly'),
      points: [LatLng(39.1895459, -96.5775603),
        LatLng(39.189535, -96.5775656),
        LatLng(39.1895231, -96.5775596),
        LatLng(39.1894513, -96.5775247),
        LatLng(39.1893339, -96.5774657),
        LatLng(39.1893245, -96.5774577),
        LatLng(39.1893916, -96.5772445),
        LatLng(39.1894051, -96.5772458),
        LatLng(39.1894316, -96.5772565),
        LatLng(39.1895386, -96.5773122),
        LatLng(39.1896114, -96.5773538),
        LatLng(39.1895459, -96.5775603)],
      strokeWidth: 2,
      strokeColor: Colors.purple,
      fillColor: Colors.transparent);

  Set<Marker> markersList = {};
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Position Tracker",
          style: TextStyle(color: Colors.black,
              fontSize: 16,
              backgroundColor: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: currentLocation == null?
      const Center(child: Text("Loading...")):
      GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        polygons: {_HalePoly, _BusinessPoly, _BluemontPoly, _DickensPoly, _EisenhowerPoly,
        _EnglishPoly, _EngPoly, _JustinPoly, _LeePoly, _SeatonPoly, _UnionPoly, _HoltonPoly},
        zoomControlsEnabled: true,
        markers:{
                  Marker(markerId: const MarkerId("currentLocation"),
                  position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                  icon: userIcon,
                  ),
                },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            setState(() {});
          },
          label: const Text("Start Session"),
          icon: const Icon(Icons.book_outlined),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
    );
  }

}
