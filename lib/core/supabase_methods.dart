import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseMethods {
  SupabaseMethods._internal();
  // static final GetStorage getStorage = GetStorage();
  static final instance = SupabaseMethods._internal();
  factory SupabaseMethods() => instance;
  SupabaseClient supabase = Supabase.instance.client;

  Future<void> fetchTableData(String tableName) async {
    try {
      final response = await supabase.from(tableName).select('*');

      if (response.isEmpty) {
        print("No recipes found");
      }
    } catch (e) {
      print("Error fetching recipes: $e");
    }
  }

  Future insertTableData(String tableName, Map<String, dynamic> data) async {
    try {
      final response = await supabase.from(tableName).insert(data);

      if (response.error != null) {
        print('Error: ${response.error.message}');
      } else {
        print('Recipe added successfully!');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
      );
      print("Signup successful! Check your email.");
    } catch (e) {
      print("Error signing up: $e");
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print("Login successful!");
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    print("Signed out successfully.");
  }

  Future<void> insertUser(String email, String password, String name,
      String mobile, String userId) async {
    final response = await Supabase.instance.client
        .from('users') // Replace with your table name
        .insert({
      "user_id": userId,
      "phone": mobile,
      'name': name,
      'email': email,
      "password": password,
    });

    print(response);
  }

  Future<void> updateUser(String name) async {
    final response = await Supabase.instance.client
        .from('users')
        .update({'name': name}).eq('id', 1);

    print(response);
  }

  Future<void> deleteUser() async {
    final response =
        await Supabase.instance.client.from('users').delete().eq('id', 1);

    print(response);
  }

SupabaseStreamBuilder fetchUserData()  {

    final response =  supabase.from('users').stream(primaryKey: ['id']).eq(
            'user_id',
            supabase.auth.currentUser!
                .id);
    return response;
}

  Future<void> getAllUsers() async {
    final response = await Supabase.instance.client
        .from('users') // Replace with your table name
        .select('*');

    print(response);
  }

  Future<void> uploadFile(
      Uint8List fileBytes, String fileName, String tableName) async {
    await Supabase.instance.client.storage
        .from(tableName) // Replace with your bucket name
        .uploadBinary(fileName, fileBytes);
  }

  Future<String> getFileUrl(String fileName, String tableName) async {
    final url =
        Supabase.instance.client.storage.from(tableName).getPublicUrl(fileName);
    return url;
  }
}
