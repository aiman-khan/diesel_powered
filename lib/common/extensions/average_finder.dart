extension ListAverageExtension on List<num?> {
  double get average {
    if (isEmpty) {
      return 0.0;
    }
    num? sum = reduce((a, b) => a! + b!);
    return (sum ?? 0.0) / length;
  }
}
