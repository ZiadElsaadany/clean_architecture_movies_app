import 'package:clean_architecture_movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract  class BaseUseCase <T,parameters>{
  // T استقبل التايب ايا كان عشان مسنفعش احدد انها ليست من الافلام
 Future<Either<Failure , T>> call(parameters parameter);

}

class NoParameter extends Equatable  {
 const NoParameter();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}