import 'package:crypto_cal/constants/type_future.dart';

class Entry {
  final int step = 1;
  int cross = 0;
  TypeFuture? type = TypeFuture.short;
  double entry = 0;
  double takeProfit = 0;
  double stopLoss = 0;
  int percentTakeProfit = 0;
  int percentStopLoss = 0;

  double valueTakeProfit = 0;
  double valueStopLoss = 0;

  Entry(this.cross, this.type, this.entry, this.takeProfit, this.stopLoss,
      this.percentTakeProfit, this.percentStopLoss);

  double getValueTakeProfit() {
    valueTakeProfit = entry;
    if (percentTakeProfit > 0) {
      if (type == TypeFuture.short) {
        valueTakeProfit = entry * (100 - (percentTakeProfit / cross)) / 100;
      } else {
        valueTakeProfit = entry * (100 + (percentTakeProfit / cross)) / 100;
      }
    }

    return valueTakeProfit;
  }

  double getValueStopLoss() {
    valueStopLoss = entry;
    if (percentStopLoss > 0) {
      if (type == TypeFuture.short) {
        valueStopLoss = entry * (100 + (percentStopLoss / cross)) / 100;
      } else {
        valueStopLoss = entry * (100 - (percentStopLoss / cross)) / 100;
      }
    }

    return valueStopLoss;
  }
}
