part of 'cryptocurrency_bloc.dart';

sealed class CryptocurrencyState extends Equatable {
  const CryptocurrencyState();

  @override
  List<Object> get props => [];
}

final class CryptocurrencyInitial extends CryptocurrencyState {
  @override
  List<Object> get props => [];
}

final class CryptocurrencyLoading extends CryptocurrencyState {
  @override
  List<Object> get props => [];
}

final class CryptocurrencyLoaded extends CryptocurrencyState {
  final CryptoCurrencyListingModel cryptoCurrencyListingModel;
  const CryptocurrencyLoaded({required this.cryptoCurrencyListingModel});
  @override
  List<Object> get props => [cryptoCurrencyListingModel];
}

final class CryptocurrencyError extends CryptocurrencyState {
  final String error;

  const CryptocurrencyError({required this.error});
  @override
  List<Object> get props => [error];
}
