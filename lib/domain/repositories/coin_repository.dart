abstract class CoinRepository<T> {
  Future<List> getCoinById(String selectedCoin);
}