import 'package:equatable/equatable.dart';

abstract class MoviesEvent  extends Equatable{
  const MoviesEvent(

      );
  @override
  // TODO: implement props
  List<Object?> get props => [

  ];
}

class GetNowPlayingEvent  extends MoviesEvent{

}

class GetPopularEvent  extends MoviesEvent{

}

class GetToRatedEvent  extends MoviesEvent{

}