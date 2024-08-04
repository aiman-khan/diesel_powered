class WeatherModel {
  final String main;
  final String icon;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final String description;
  final double uvIndex;

  WeatherModel({
    required this.main,
    required this.icon,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.description,
    required this.uvIndex,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      pressure: json['main']['pressure'],
      description: json['weather'][0]['description'],
      uvIndex: json['uvIndex'] ?? 0.0, // Replace with actual value if available
    );
  }
}
