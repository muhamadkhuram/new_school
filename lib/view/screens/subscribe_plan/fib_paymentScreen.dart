import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/utils/dimensions.dart';
import '../../../core/utils/my_color.dart';
import '../../../core/utils/styles.dart';
import '../../../data/controller/payment/fib_helper.dart';

void showFibPaymentBottomSheet({
  required BuildContext context,
  required double amount,
  required int userId,
  required bool isSingleitem,
  int itemid = 0,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return FibPaymentScreen(
        amount: amount,
        userId: userId,
        isSingleitem: isSingleitem,
        itemId: itemid,
      );
    },
  );
}

class FibPaymentScreen extends StatefulWidget {
  final double amount;
  final int userId;
  bool isSingleitem;
  int itemId;
  FibPaymentScreen({
    Key? key,
    required this.amount,
    required this.userId,
    required this.isSingleitem,
    this.itemId = 0,
  }) : super(key: key);

  @override
  State<FibPaymentScreen> createState() => _FibPaymentScreenState();
}

class _FibPaymentScreenState extends State<FibPaymentScreen> {
  bool isLoading = false;
  bool isProcessing = false;
  String? error;
  Timer? _paymentCheckTimer;

  @override
  void dispose() {
    _paymentCheckTimer?.cancel();
    _paymentCheckTimer = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //  _startPaymentProcess;
  }

  Future<void> _startPaymentProcess() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      // Step 1: Authentication
      await doAuth(widget.amount);

      // Step 2: Create Payment
      await createPayment(widget.amount);

      // Step 3: Open FIB app
      if (applink != null) {
        await openLink(applink);

        // Start background payment status check
        _startPaymentStatusCheck();
      } else {
        throw Exception('Payment link not generated');
      }
    } catch (e) {
      setState(() {
        error = 'Payment initialization failed: ${e.toString()}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _startPaymentStatusCheck() {
    setState(() {
      isProcessing = true;
    });

    _paymentCheckTimer =
        Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (kDebugMode) {
        print('Checking payment status...');
      }

      try {
        final result = await checkPaymentStatus(
            widget.userId, widget.amount, widget.isSingleitem, widget.itemId);

        if (kDebugMode) {
          print('Payment status check result: $result["bool"]');
        }

        if (result["bool"]) {
          if (kDebugMode) {
            print('Payment is PAID - cancelling timer');
          }

          // Ensure timer is cancelled first
          timer.cancel();
          _paymentCheckTimer?.cancel();
          _paymentCheckTimer = null;

          // Then update the state
          if (mounted) {
            setState(() {
              isProcessing = false;
            });
          }
          Navigator.of(context).pop();

          // Show success message
          Get.snackbar('Success', result["message"],
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 3),
              backgroundGradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [MyColor.primaryColor500, MyColor.primaryColor]));

          Navigator.of(context).pop();

          // AwesomeDialog(
          //   showCloseIcon: true,
          //   context: context,
          //   dialogType: DialogType.success,
          //   animType: AnimType.rightSlide,
          //   title: 'Success',
          //   desc: result["message"],
          //   //btnCancelOnPress: () {},
          //   btnOkOnPress: () {
          //     Navigator.of(context).pop();
          //   },
          // ).show();

          //Navigate away or perform other completion actions if needed
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error in payment status check: $e');
        }

        if (mounted) {
          setState(() {
            error = 'Payment status check failed: ${e.toString()}';
            isProcessing = false;
          });
        }

        timer.cancel();
        _paymentCheckTimer?.cancel();
        _paymentCheckTimer = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            if (isLoading)
              const Center(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    SpinKitDoubleBounce(
                      color: Colors.blue,
                      size: 50.0,
                    ),
                    SizedBox(height: 16),
                    Text('Initializing payment...'),
                    const SizedBox(height: 24),
                  ],
                ),
              )
            else if (isProcessing)
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    SpinKitPulse(
                      color: Colors.green,
                      size: 50.0,
                    ),
                    SizedBox(height: 16),
                    Text('Processing payment...',
                        style: mulishSemiBold.copyWith(
                            fontSize: Dimensions.fontOverLarge,
                            color: MyColor.colorWhite)),
                    const SizedBox(height: 24),
                  ],
                ),
              )
            else if (error != null)
              Column(
                children: [
                  const SizedBox(height: 24),
                  Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    error!,
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _startPaymentProcess,
                    child: Text('Retry Payment',
                        style: mulishSemiBold.copyWith(
                            fontSize: Dimensions.fontOverLarge,
                            color: MyColor.colorWhite)),
                  ),
                  const SizedBox(height: 24),
                ],
              )
            else
              Column(
                children: [
                  const SizedBox(height: 24),
                  // if (qrCode != null)
                  //   Image.memory(
                  //     qrCode,
                  //     width: 200,
                  //     height: 200,
                  //   ),
                  const SizedBox(height: 24),
                  Text(
                    'Amount: ${widget.amount} IQD',
                    style: mulishSemiBold.copyWith(
                        fontSize: Dimensions.fontOverLarge,
                        color: MyColor.colorWhite),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You will be redirected to the Fib app',
                    style: mulishSemiBold.copyWith(
                        fontSize: Dimensions.fontDefault,
                        color: MyColor.colorWhite),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: _startPaymentProcess,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            MyColor.primaryColor500,
                            MyColor.primaryColor
                          ],
                        ),
                        color: MyColor.primaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                      ),
                      child: Text('Pay with FIB',
                          style: mulishSemiBold.copyWith(
                              fontSize: Dimensions.fontExtraLarge,
                              color: MyColor.colorWhite)),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
