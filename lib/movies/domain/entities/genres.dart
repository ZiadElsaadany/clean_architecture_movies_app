import 'package:equatable/equatable.dart';

class GenresEntity extends Equatable  {
  final String name;
  final int id ;

const   GenresEntity({
    required this.id,
    required this.name
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    id
  ];


}