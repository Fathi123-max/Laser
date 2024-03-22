class PaymentDetails {
  final int? orderId;
  final int? numberOfServices;
  final String? price;
  final String? walletAmount;
  final String? priceAfterWallet;

  PaymentDetails({
    this.orderId,
    this.numberOfServices,
    this.price,
    this.walletAmount,
    this.priceAfterWallet,
  });

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'numberOfServices': numberOfServices,
        'price': price,
        'walletAmount': walletAmount,
        'priceAfterWallet': priceAfterWallet,
      };

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
        orderId: json['orderId'],
        numberOfServices: json['numberOfServices'],
        price: json['price'],
        walletAmount: json['walletAmount'],
        priceAfterWallet: json['priceAfterWallet'],
      );

  PaymentDetails copyWith({
    int? orderId,
    int? numberOfServices,
    String? price,
    String? walletAmount,
    String? priceAfterWallet,
  }) =>
      PaymentDetails(
        orderId: orderId ?? this.orderId,
        numberOfServices: numberOfServices ?? this.numberOfServices,
        price: price ?? this.price,
        walletAmount: walletAmount ?? this.walletAmount,
        priceAfterWallet: priceAfterWallet ?? this.priceAfterWallet,
      );
}
