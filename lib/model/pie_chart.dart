enum PieChartType {
  EXPENSE,
  INCOME,
}

class PieChartModel {
  PieChartType type;
  double amount;

  PieChartModel({
    this.type,
    this.amount,
  });
}
