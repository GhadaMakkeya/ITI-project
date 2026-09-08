import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_grad_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthCubit(this._authRemoteDataSource) : super(AuthInitial());

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final userCredential = await _authRemoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess(userCredential.user!));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final userCredential = await _authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess(userCredential.user!));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}