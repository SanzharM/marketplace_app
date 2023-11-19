import 'package:marketplace_app/src/common/api/api.dart';

abstract class MarketDatasource {}

class MarketDatasourceImpl implements MarketDatasource {
  final Api _api;

  MarketDatasourceImpl(this._api);
}
