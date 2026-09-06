part of 'topsearch_bloc.dart';

enum topSerachstatus { none, loading, success, failure }

enum topSerachtype { none, topsearch }

class TopsearchState extends Equatable {
  final List<topSearchEntity> searchResults;
  final topSerachstatus status;
  final topSerachtype type;
  final String msg;
  final List<commingSoonEntity> comingSoonResults;
  const TopsearchState({
    this.searchResults = const [],
    this.status = topSerachstatus.none,
    this.type = topSerachtype.none,
    this.msg = '',
    this.comingSoonResults = const [],
  });

  @override
  List<Object> get props => [searchResults, status, type, msg];

  TopsearchState copyWith({
    List<topSearchEntity>? searchResults,
    topSerachstatus? status,
    topSerachtype? type,
    String? msg,
    List<commingSoonEntity>? comingSoonResults,
  }) {
    return TopsearchState(
      searchResults: searchResults ?? this.searchResults,
      status: status ?? this.status,
      type: type ?? this.type,
      msg: msg ?? this.msg,
      comingSoonResults: comingSoonResults ?? this.comingSoonResults,
    );
  }
}
