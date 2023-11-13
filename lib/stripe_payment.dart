class StripePaymnet {
  static final StripePaymnet _singleton = StripePaymnet._internal();

  factory StripePaymnet() {
    return _singleton;
  }

  StripePaymnet._internal();
}
