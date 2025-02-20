import 'package:ai_app/Features/Profile/data/repos/profile_repo.dart';
import 'package:ai_app/core/errors/failures.dart';
import 'package:ai_app/core/supabase_methods.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

 class ProfileRepoImp implements ProfileRepo {
 
  Future<Either<Failure,List<Map<String, dynamic>>>> fetchUserData()async{
  


           try {
       final response = await SupabaseMethods.instance.supabase
          .from('users')
          .select()
          .eq(
              'user_id',
              SupabaseMethods.instance.supabase.auth.currentUser!
                  .id); // Fetch data where 'user_id' matches the logged-in user's UID

      // Extract the data from the response
      final List<dynamic> data = response as List<dynamic>;
        


      return right(List<Map<String, dynamic>>.from(data ?? []));
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

}