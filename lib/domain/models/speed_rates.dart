// ignore_for_file: public_member_api_docs, sort_constructors_first
class SpeedRate {
  Rate speed;
  num value;
  SpeedRate({
    required this.speed,
    required this.value,
  });
}

enum Rate { normal, extremlySlow, superSlow, slow, fast }

final List<SpeedRate> speedRates = [
  SpeedRate(speed: Rate.extremlySlow, value: 0.5),
  SpeedRate(speed: Rate.superSlow, value: 0.7),
  SpeedRate(speed: Rate.slow, value: 0.85),
  SpeedRate(speed: Rate.normal, value: 1),
  SpeedRate(speed: Rate.fast, value: 1.25)
];


