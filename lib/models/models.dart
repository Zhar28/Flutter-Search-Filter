class Weather {
  final String city;
  final String icon;
  final String temp;
  final String condition;

  const Weather ({
    required this.city,
    required this.icon,
    required this.temp,
    required this.condition,
  });
}

const allWeather = [
  Weather(
    city: 'Malang',
    temp: '24',
    condition: 'Rainy',
    icon: 'https://openweathermap.org/img/wn/09d.png'
    ),
  Weather(
    city: 'Surabaya',
    temp: '32',
    condition: 'Rainy',
    icon: 'https://openweathermap.org/img/wn/09d.png'
    ),
  Weather(
    city: 'jakarta',
    icon: 'https://openweathermap.org/img/wn/01d.png',
    temp: '30',
    condition: 'Sunny'
    ),
  Weather(
    city: 'Bandung',
    icon: 'https://openweathermap.org/img/wn/03d.png',
    temp: '24',
    condition: 'Cloudy'
    ),
   Weather(
    city: 'Yogyakarta',
    icon: 'https://openweathermap.org/img/wn/11d.png',
    temp: '24',
    condition: 'Thunderstorm'
    ),
  Weather(
    city: 'Bali',
    icon: 'https://openweathermap.org/img/wn/01d.png',
    temp: '31',
    condition: 'Clear'
    ) 
];
