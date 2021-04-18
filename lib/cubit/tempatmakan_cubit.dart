import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lgatcha/model/model.dart';
import 'package:lgatcha/services/services.dart';

part 'tempatmakan_state.dart';

class TempatmakanCubit extends Cubit<TempatmakanState> {
  TempatmakanCubit() : super(TempatmakanInitial());


  Future<void> getDataTempatMakan() async {
    List<TempatMakan> result = await TMKnServices.getAll();
    if (result != null) {
      emit(TempatmakanLoaded(result));
    } else {
      emit(TempatMakanFailedLoaded('Gagal Diload'));
    }
  }

  Future<void> submitDataTempatMakan(String nmTempat, String lokasi) async {
    try {
      await TMKnServices.saveTempatMakan(nmTempat, lokasi);
      emit(TempatmakanLoaded((state as TempatmakanLoaded).tempatMakan));
    } catch (e) {
      emit(TempatMakanFailedLoaded(e.toString()));
    }
  }

  Future<void> updateDataTempatMakan(
      String id, String nmTempat, String lokasi) async {
    try {
      await TMKnServices.updateTempatMakan(id, nmTempat, lokasi);
      emit(TempatmakanLoaded((state as TempatmakanLoaded).tempatMakan));
    } catch (e) {
      emit(TempatMakanFailedLoaded(e.toString()));
    }
  }

  Future<void> deleteDataTempatMakan(String docsId) async {
    try {
      await TMKnServices.deleteTempatMakan(docsId);
      emit(TempatmakanLoaded((state as TempatmakanLoaded).tempatMakan));
    } catch (e) {
      emit(TempatMakanFailedLoaded(e.toString()));
    }
  }
}
