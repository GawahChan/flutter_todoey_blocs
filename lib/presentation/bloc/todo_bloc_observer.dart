import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBlocObserver extends BlocObserver {
  // this is just a observer by bloc used to observe state. State changes are displayed in logs.

  // NOT NEEDED FOR BLOCS, but good for understanding state changes in console.
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
