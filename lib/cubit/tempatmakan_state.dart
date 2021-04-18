part of 'tempatmakan_cubit.dart';

abstract class TempatmakanState extends Equatable {
  const TempatmakanState();
}

class TempatmakanInitial extends TempatmakanState {
  @override
  List<Object> get props => [];
}
class TempatmakanLoading extends TempatmakanState {
  @override
  List<Object> get props => [];
}

class TempatmakanLoaded extends TempatmakanState {
  final List<TempatMakan> tempatMakan;

  TempatmakanLoaded(this.tempatMakan);

  @override
  List<Object> get props => [tempatMakan];
}
class TempatMakanFailedLoaded extends TempatmakanState {
  final String message;

  TempatMakanFailedLoaded(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
