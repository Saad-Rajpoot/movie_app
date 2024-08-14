import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;

  ConnectivityBloc(this._connectivity) : super(ConnectivityInitial()) {
    on<ConnectivityChanged>(_onConnectivityChanged);

    // Initial check for connectivity
    _checkInitialConnectivity();

    // Listen for connectivity changes
    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      add(ConnectivityChanged(connectivityResult)); // Wrap in list
    });
  }

  Future<void> _checkInitialConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    add(ConnectivityChanged(connectivityResult)); // Wrap in list
  }

  void _onConnectivityChanged(
      ConnectivityChanged event, Emitter<ConnectivityState> emit) {
    final results = event.connectivityResults;

    if (results.contains(ConnectivityResult.none)) {
      emit(ConnectivityOffline());
    } else if (results.contains(ConnectivityResult.mobile)) {
      emit(ConnectivityOnline());
    } else if (results.contains(ConnectivityResult.wifi)) {
      emit(ConnectivityOnline());
    } else if (results.contains(ConnectivityResult.ethernet)) {
      emit(ConnectivityOnline());
    } else if (results.contains(ConnectivityResult.vpn)) {
      emit(ConnectivityOnline());
    } else if (results.contains(ConnectivityResult.bluetooth)) {
      emit(ConnectivityOnline());
    } else if (results.contains(ConnectivityResult.other)) {
      emit(ConnectivityOnline());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
