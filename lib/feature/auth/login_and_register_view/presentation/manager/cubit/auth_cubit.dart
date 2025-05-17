import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final bool hasLetters = password.contains(RegExp(r'[A-Za-z]'));
    final bool hasNumbers = password.contains(RegExp(r'\d'));
    if (password.length < 8) {
      emit(
        RegisterFailure(
          errorMessage: 'Password must be at least 8 characters.',
        ),
      );
      return;
    }

    if (!hasLetters || !hasNumbers) {
      emit(
        RegisterFailure(
          errorMessage: 'Password must contain both letters and numbers.',
        ),
      );
      return;
    }

    emit(RegisterLoading());

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(name);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'The account already exists.'));
      } else {
        emit(
          RegisterFailure(
            errorMessage: e.message ?? 'An unknown error occurred.',
          ),
        );
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          LoginFailure(errorMessage: 'Wrong password provided for that user.'),
        );
      } else if (e.code == 'user-disabled') {
        emit(LoginFailure(errorMessage: 'User account has been disabled.'));
      } else {
        emit(
          LoginFailure(errorMessage: e.message ?? 'An unknown error occurred.'),
        );
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
