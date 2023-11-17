/// A Method to launch the Google Maps app with a given address.
/// It get [lat] and [lng] from the Request and then launch the app.
/// [lang] is the language of the map.
/// [zoomFactor] is the zoom factor of the map.
String googleMapsLink(
  String lat,
  String lng, {
  String lang = 'ar',
  double zoomFactor = 17.0,
}) {
  return 'https://maps.google.com/maps?q=$lat%2C$lng&z=$zoomFactor&hl=$lang';
}
