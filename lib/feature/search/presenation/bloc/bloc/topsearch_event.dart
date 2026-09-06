part of 'topsearch_bloc.dart';

sealed class TopsearchEvent extends Equatable {
  const TopsearchEvent();

  @override
  List<Object> get props => [];
}

class GetTopSearchesEvent extends TopsearchEvent {
  final String query;

  const GetTopSearchesEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class GetComingSoonEvent extends TopsearchEvent {
  const GetComingSoonEvent();

  @override
  List<Object> get props => [];
}
