// To parse this JSON data, do
//
//     final cryptoCurrencyListingModel = cryptoCurrencyListingModelFromJson(jsonString);

import 'dart:convert';

CryptoCurrencyListingModel cryptoCurrencyListingModelFromJson(String str) =>
    CryptoCurrencyListingModel.fromJson(json.decode(str));

String cryptoCurrencyListingModelToJson(CryptoCurrencyListingModel data) =>
    json.encode(data.toJson());

class CryptoCurrencyListingModel {
  final Status? status;
  final List<Datum>? data;

  CryptoCurrencyListingModel({
    this.status,
    this.data,
  });

  CryptoCurrencyListingModel copyWith({
    Status? status,
    List<Datum>? data,
  }) =>
      CryptoCurrencyListingModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory CryptoCurrencyListingModel.fromJson(Map<String, dynamic> json) =>
      CryptoCurrencyListingModel(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  final int? cmcRank;
  final int? numMarketPairs;
  final int? circulatingSupply;
  final int? totalSupply;
  final int? maxSupply;
  final dynamic infiniteSupply;
  final DateTime? lastUpdated;
  final DateTime? dateAdded;
  final List<String>? tags;
  final dynamic platform;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedMarketCap;
  final Quote? quote;

  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.cmcRank,
    this.numMarketPairs,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.infiniteSupply,
    this.lastUpdated,
    this.dateAdded,
    this.tags,
    this.platform,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.quote,
  });

  Datum copyWith({
    int? id,
    String? name,
    String? symbol,
    String? slug,
    int? cmcRank,
    int? numMarketPairs,
    int? circulatingSupply,
    int? totalSupply,
    int? maxSupply,
    dynamic infiniteSupply,
    DateTime? lastUpdated,
    DateTime? dateAdded,
    List<String>? tags,
    dynamic platform,
    dynamic selfReportedCirculatingSupply,
    dynamic selfReportedMarketCap,
    Quote? quote,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        slug: slug ?? this.slug,
        cmcRank: cmcRank ?? this.cmcRank,
        numMarketPairs: numMarketPairs ?? this.numMarketPairs,
        circulatingSupply: circulatingSupply ?? this.circulatingSupply,
        totalSupply: totalSupply ?? this.totalSupply,
        maxSupply: maxSupply ?? this.maxSupply,
        infiniteSupply: infiniteSupply ?? this.infiniteSupply,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        dateAdded: dateAdded ?? this.dateAdded,
        tags: tags ?? this.tags,
        platform: platform ?? this.platform,
        selfReportedCirculatingSupply:
            selfReportedCirculatingSupply ?? this.selfReportedCirculatingSupply,
        selfReportedMarketCap:
            selfReportedMarketCap ?? this.selfReportedMarketCap,
        quote: quote ?? this.quote,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        cmcRank: json["cmc_rank"],
        numMarketPairs: json["num_market_pairs"],
        circulatingSupply: json["circulating_supply"],
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        infiniteSupply: json["infinite_supply"],
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
        dateAdded: json["date_added"] == null
            ? null
            : DateTime.parse(json["date_added"]),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        platform: json["platform"],
        selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
        selfReportedMarketCap: json["self_reported_market_cap"],
        quote: json["quote"] == null ? null : Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "cmc_rank": cmcRank,
        "num_market_pairs": numMarketPairs,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "infinite_supply": infiniteSupply,
        "last_updated": lastUpdated?.toIso8601String(),
        "date_added": dateAdded?.toIso8601String(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "platform": platform,
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_market_cap": selfReportedMarketCap,
        "quote": quote?.toJson(),
      };
}

class Quote {
  final Usd? usd;

  Quote({
    this.usd,
  });

  Quote copyWith({
    Usd? usd,
  }) =>
      Quote(
        usd: usd ?? this.usd,
      );

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: json["USD"] == null ? null : Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd?.toJson(),
      };
}

class Usd {
  final double? price;
  final int? volume24H;
  final double? volumeChange24H;
  final double? percentChange1H;
  final double? percentChange24H;
  final double? percentChange7D;
  final double? marketCap;
  final int? marketCapDominance;
  final double? fullyDilutedMarketCap;
  final DateTime? lastUpdated;

  Usd({
    this.price,
    this.volume24H,
    this.volumeChange24H,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.lastUpdated,
  });

  Usd copyWith({
    double? price,
    int? volume24H,
    double? volumeChange24H,
    double? percentChange1H,
    double? percentChange24H,
    double? percentChange7D,
    double? marketCap,
    int? marketCapDominance,
    double? fullyDilutedMarketCap,
    DateTime? lastUpdated,
  }) =>
      Usd(
        price: price ?? this.price,
        volume24H: volume24H ?? this.volume24H,
        volumeChange24H: volumeChange24H ?? this.volumeChange24H,
        percentChange1H: percentChange1H ?? this.percentChange1H,
        percentChange24H: percentChange24H ?? this.percentChange24H,
        percentChange7D: percentChange7D ?? this.percentChange7D,
        marketCap: marketCap ?? this.marketCap,
        marketCapDominance: marketCapDominance ?? this.marketCapDominance,
        fullyDilutedMarketCap:
            fullyDilutedMarketCap ?? this.fullyDilutedMarketCap,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"]?.toDouble(),
        volume24H: json["volume_24h"],
        volumeChange24H: json["volume_change_24h"]?.toDouble(),
        percentChange1H: json["percent_change_1h"]?.toDouble(),
        percentChange24H: json["percent_change_24h"]?.toDouble(),
        percentChange7D: json["percent_change_7d"]?.toDouble(),
        marketCap: json["market_cap"]?.toDouble(),
        marketCapDominance: json["market_cap_dominance"],
        fullyDilutedMarketCap: json["fully_diluted_market_cap"]?.toDouble(),
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_change_24h": volumeChange24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "market_cap": marketCap,
        "market_cap_dominance": marketCapDominance,
        "fully_diluted_market_cap": fullyDilutedMarketCap,
        "last_updated": lastUpdated?.toIso8601String(),
      };
}

class Status {
  final DateTime? timestamp;
  final int? errorCode;
  final dynamic errorMessage;
  final int? elapsed;
  final int? creditCount;
  final dynamic notice;

  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  Status copyWith({
    DateTime? timestamp,
    int? errorCode,
    dynamic errorMessage,
    int? elapsed,
    int? creditCount,
    dynamic notice,
  }) =>
      Status(
        timestamp: timestamp ?? this.timestamp,
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        elapsed: elapsed ?? this.elapsed,
        creditCount: creditCount ?? this.creditCount,
        notice: notice ?? this.notice,
      );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
      };
}
