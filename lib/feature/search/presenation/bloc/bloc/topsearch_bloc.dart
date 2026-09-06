import 'package:bloc/bloc.dart';
import 'package:court_flix/feature/search/domain/entity/comingsoon_entity.dart';
import 'package:court_flix/feature/search/domain/entity/search_enetity.dart';
import 'package:court_flix/feature/search/domain/usecase/comingsoon_usecase.dart';
import 'package:court_flix/feature/search/domain/usecase/topsearch_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_event_transformers/bloc_event_transformers.dart';

part 'topsearch_event.dart';
part 'topsearch_state.dart';

class TopsearchBloc extends Bloc<TopsearchEvent, TopsearchState> {
  final TopsearchUsecase usecase;
  final ComingsoonUsecase comingsoonUsecase;
  TopsearchBloc(this.usecase, this.comingsoonUsecase) : super(TopsearchState()) {
    on<GetTopSearchesEvent>(transformer: debounce(const Duration(milliseconds: 400)), topsearch);
    on<GetComingSoonEvent>(comingsoon);
  }

  topsearch(GetTopSearchesEvent event, Emitter<TopsearchState> emit) async {
    emit(state.copyWith(status: topSerachstatus.loading, msg: ''));
    try {
      final result = await usecase.call(event.query);
      result.fold(
        (l) => emit(state.copyWith(status: topSerachstatus.failure, msg: l.message)),
        (r) => emit(state.copyWith(status: topSerachstatus.success, searchResults: r)),
      );
    } catch (e) {
      emit(state.copyWith(status: topSerachstatus.failure, msg: e.toString()));
    }
  }

  comingsoon(GetComingSoonEvent event, Emitter<TopsearchState> emit) async {
    emit(state.copyWith(status: topSerachstatus.loading, msg: ''));
    try {
      final result = await comingsoonUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(status: topSerachstatus.failure, msg: l.message)),
        (r) => emit(state.copyWith(status: topSerachstatus.success, comingSoonResults: r)),
      );
    } catch (e) {
      emit(state.copyWith(status: topSerachstatus.failure, msg: e.toString()));
    }
  }
}
