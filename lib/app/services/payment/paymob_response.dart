class PaymentPaymobResponse {
  final String? id;
  final String? pending;
  final String? amountCents;
  final String? success;
  final String? isAuth;
  final String? isCapture;
  final String? isStandalonePayment;
  final String? isVoided;
  final String? isRefunded;
  final String? is3DSecure;
  final String? integrationId;
  final String? profileId;
  final String? hasParentTransaction;
  final String? order;
  final DateTime? createdAt;
  final String? currency;
  final String? merchantCommission;
  final List<dynamic>? discountDetails;
  final String? isVoid;
  final String? isRefund;
  final String? errorOccurred;
  final String? refundedAmountCents;
  final String? capturedAmount;
  final DateTime? updatedAt;
  final String? isSettled;
  final String? billBalanced;
  final String? isBill;
  final String? owner;
  final String? dataMessage;
  final String? sourceDataType;
  final String? sourceDataPan;
  final String? sourceDataSubType;
  final String? acqResponseCode;
  final String? txnResponseCode;
  final String? hmac;

  PaymentPaymobResponse({
    this.id,
    this.pending,
    this.amountCents,
    this.success,
    this.isAuth,
    this.isCapture,
    this.isStandalonePayment,
    this.isVoided,
    this.isRefunded,
    this.is3DSecure,
    this.integrationId,
    this.profileId,
    this.hasParentTransaction,
    this.order,
    this.createdAt,
    this.currency,
    this.merchantCommission,
    this.discountDetails,
    this.isVoid,
    this.isRefund,
    this.errorOccurred,
    this.refundedAmountCents,
    this.capturedAmount,
    this.updatedAt,
    this.isSettled,
    this.billBalanced,
    this.isBill,
    this.owner,
    this.dataMessage,
    this.sourceDataType,
    this.sourceDataPan,
    this.sourceDataSubType,
    this.acqResponseCode,
    this.txnResponseCode,
    this.hmac,
  });

  factory PaymentPaymobResponse.fromJson(Map<String, dynamic> json) =>
      PaymentPaymobResponse(
        id: json['id']?.toString(),
        pending: json['pending']?.toString(),
        amountCents: json['amount_cents']?.toString(),
        success: json['success']?.toString(),
        isAuth: json['is_auth']?.toString(),
        isCapture: json['is_capture']?.toString(),
        isStandalonePayment: json['is_standalone_payment']?.toString(),
        isVoided: json['is_voided']?.toString(),
        isRefunded: json['is_refunded']?.toString(),
        is3DSecure: json['is_3d_secure']?.toString(),
        integrationId: json['integration_id']?.toString(),
        profileId: json['profile_id']?.toString(),
        hasParentTransaction: json['has_parent_transaction']?.toString(),
        order: json['order']?.toString(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        currency: json['currency']?.toString(),
        merchantCommission: json['merchant_commission']?.toString(),
        discountDetails: [],
        isVoid: json['is_void']?.toString(),
        isRefund: json['is_refund']?.toString(),
        errorOccurred: json['error_occurred']?.toString(),
        refundedAmountCents: json['refunded_amount_cents']?.toString(),
        capturedAmount: json['captured_amount']?.toString(),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        isSettled: json['is_settled']?.toString(),
        billBalanced: json['bill_balanced']?.toString(),
        isBill: json['is_bill']?.toString(),
        owner: json['owner']?.toString(),
        dataMessage: json['data_message']?.toString(),
        sourceDataType: json['source_data_type']?.toString(),
        sourceDataPan: json['source_data_pan']?.toString(),
        sourceDataSubType: json['source_data_sub_type']?.toString(),
        acqResponseCode: json['acq_response_code']?.toString(),
        txnResponseCode: json['txn_response_code']?.toString(),
        hmac: json['hmac']?.toString(),
      );

  // from json
}
