extension DoubleUtil on double {
  double max(double? value) {
    return value != null ? (this > value ? this : value) : this;
  }

  double min(double? value) {
    return value != null ? (this < value ? this : value) : this;
  }

}

extension IntUtil on int {
  int max(int? value) {
    return value != null ? (this > value ? this : value) : this;
  }

  int min(int? value) {
    return value != null ? (this < value ? this : value) : this;
  }
}