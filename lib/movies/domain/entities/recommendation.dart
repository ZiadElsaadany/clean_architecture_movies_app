import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final String ?imgPath  ;
final int id ;
 const  RecommendationEntity({
     this.imgPath,
   required this.id
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    imgPath,
    id
  ];

}