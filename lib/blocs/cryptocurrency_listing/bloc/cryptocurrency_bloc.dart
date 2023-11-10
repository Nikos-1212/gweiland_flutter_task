import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gweiland_flutter_task/domain/entity/user_model.dart';
import 'package:gweiland_flutter_task/domain/repository/api_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
part 'cryptocurrency_event.dart';
part 'cryptocurrency_state.dart';

class CryptocurrencyBloc
    extends Bloc<CryptocurrencyEvent, CryptocurrencyState> {
  CryptocurrencyBloc() : super(CryptocurrencyLoading()) {
    on<InitialEvent>(initialEvent);
    on<FilterEventByPrice>(filterEventByPrice);
  }
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  FutureOr<void> initialEvent(
      InitialEvent event, Emitter<CryptocurrencyState> emit) async {
    try {
      final res = await ApiService()
          .getCryptoListing(event.start, event.limit, event.convertInto);
      if (res.status?.errorCode == 0) {
        res.data ?? [];
        res.data?.sort((a, b) {
          final first = a.cmcRank ?? 0;
          final second = b.cmcRank ?? 0;
          return first.compareTo(second);
        });
        emit(CryptocurrencyLoaded(cryptoCurrencyListingModel: res));
      } else {
        emit(CryptocurrencyError(error: res.toString()));
      }
    } catch (e) {
      emit(CryptocurrencyError(error: e.toString()));
    }
  }

  FutureOr<void> filterEventByPrice(
      FilterEventByPrice event, Emitter<CryptocurrencyState> emit) {
    if (state is CryptocurrencyLoaded) {
      final currentState = state as CryptocurrencyLoaded;
      final list = currentState.cryptoCurrencyListingModel.data ?? [];
      if (event.filterNo == 1) {
        list.sort((a, b) {
          final first = a.quote?.usd?.price ?? 0.0;
          final second = b.quote?.usd?.price ?? 0.0;
          return first.compareTo(second);
        });
      } else if (event.filterNo == 2) {
        list.sort((a, b) {
          final first = a.quote?.usd?.volumeChange24H ?? 0.0;
          final second = b.quote?.usd?.volumeChange24H ?? 0.0;
          return first.compareTo(second);
        });
      }
      emit(CryptocurrencyLoaded(
          cryptoCurrencyListingModel:
              currentState.cryptoCurrencyListingModel.copyWith(data: list)));
    }
  }
}
