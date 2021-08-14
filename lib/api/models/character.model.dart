import 'package:equatable/equatable.dart';

class Character extends Equatable {
  const Character({
    required this.id,
    required this.name,
    required this.characterClass,
    required this.league,
    required this.level,
    required this.experience,
  });

  final String id;
  final String name;
  final String characterClass;
  final String league;
  final int level;
  final int experience;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        characterClass: json['class'],
        league: json['league'],
        level: json['level'],
        experience: json['experience'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'class': characterClass,
        'league': league,
        'level': level,
        'experience': experience,
      };

  @override
  String toString() {
    return '$id\n$name\n$characterClass\n$level\n$league\n$experience';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        characterClass,
        league,
        level,
        experience,
      ];
}
