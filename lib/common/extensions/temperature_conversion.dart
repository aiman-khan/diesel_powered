extension TemperatureConversion on double {
  String toCelsius() {
    return "${(this - 273.15).toStringAsFixed(1)}°";
  }
}
