import 'package:ai_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo  {
 
  Future<Either<Failure,List<Map<String, dynamic>>>> fetchUserData();

}