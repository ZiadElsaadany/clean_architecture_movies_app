import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
   String ?imgPath  ;
final int id ;
   RecommendationEntity({
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