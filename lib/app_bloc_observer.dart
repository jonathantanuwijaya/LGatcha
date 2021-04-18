import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    print(bloc);
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    print('$error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
