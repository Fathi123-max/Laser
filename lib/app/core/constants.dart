class Constants {
  static const baseUrl = 'https://admin.lazer-sa.com/api/technician';
  static const registerUrl = '$baseUrl/register';
  static const activateUrl = '$baseUrl/activate';
  static const loginUrl = '$baseUrl/login';
  static const forgetPasswordUrl = '$baseUrl/forgot-password';
  static const resetPasswordUrl = '$baseUrl/reset-password';
  static const tokenValidatorUrl = '$baseUrl/token-validator';
  static const deviceTypesUrl = '$baseUrl/device-types';
  static const deviceBrandsUrl = '$baseUrl/get-brands';
  static const modelsUrl = '$baseUrl/get-models';
  static const getServicesUrl = '$baseUrl/get-services';
  static const logoutUrl = '$baseUrl/logout';
  static const getworkingtimeUrl = '$baseUrl/get-working-time';
  static const createMaintenanceOrderUrl = '$baseUrl/create-maintenance-order';
  static const cancelOrderUrl = '$baseUrl/cancel-order';
  static const rescheduleOrderUrl = '$baseUrl/reschedule-order';
  static const paymentreceiptUrl = '$baseUrl/payment-receipt';
  static const paymentScreenDetailsUrl = '$baseUrl/payment-screen-details';
  static const paymentSuccessUrl = '$baseUrl/payment-success';

  static const orderDetailsUrl = '$baseUrl/maintenance-order-detail';
  static String getAllMaintenanceOrderUrl(int index) {
    return '$baseUrl/get-all-maintenance-orders?per_page=3&page=$index';
  }
}
