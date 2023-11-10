part of 'cryptocurrency_bloc.dart';

sealed class CryptocurrencyEvent extends Equatable {
  const CryptocurrencyEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends CryptocurrencyEvent {
  final int start;
  final int limit;
  final String convertInto;

  const InitialEvent(
      {required this.start, required this.limit, required this.convertInto});
  @override
  List<Object> get props => [start, limit, convertInto];
}

class FilterEventByPrice extends CryptocurrencyEvent {
  final int filterNo;
  const FilterEventByPrice({required this.filterNo});
  @override
  List<Object> get props => [filterNo];
}

class LoadMoreEvent extends CryptocurrencyEvent {
  final int start;
  final int limit;
  final String convertInto;
  const LoadMoreEvent(
      {required this.start, required this.limit, required this.convertInto});
  @override
  List<Object> get props => [start, limit, convertInto];
}
