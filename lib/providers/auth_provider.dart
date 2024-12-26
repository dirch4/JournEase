import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Fungsi Registrasi
  Future<String?> register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      return "Password dan konfirmasi tidak cocok";
    }

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Null menandakan tidak ada error
    } on FirebaseAuthException catch (e) {
      // Menangkap error dari Firebase
      if (e.code == 'weak-password') {
        return "Password terlalu lemah";
      } else if (e.code == 'email-already-in-use') {
        return "Email sudah digunakan";
      }
      return "Error: ${e.message}";
    } catch (e) {
      return "Terjadi kesalahan: $e";
    }
  }

  // Fungsi Login
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Null menandakan tidak ada error
    } on FirebaseAuthException catch (e) {
      // print('FirebaseAuthException: ${e.code}, ${e.message}');
      if (e.code == 'invalid-email') {
        return "Harap Masukan Email yang benar";
      } else if (e.code == 'wrong-password') {
        return "Password salah";
      }
      return "Harap masukan Email dan Password yang benar";
    } catch (e) {
      return "Terjadi kesalahan: $e";
    }
  }

  // Fungsi Logout
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  // Mendapatkan Pengguna Saat Ini
  User? get currentUser {
    return _firebaseAuth.currentUser;
  }
}
