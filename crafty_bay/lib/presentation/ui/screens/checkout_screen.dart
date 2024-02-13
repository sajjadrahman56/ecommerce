import 'package:crafty_bay/presentation/ui/screens/payment_webview_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/create_invoice_controller.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: GetBuilder<CreateInvoiceController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenterCircularProgressIndication();
        }
        final invoiceWrapper = controller.paymentMethodList.data!.first;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 4, top: 8, right: 4, bottom: 4),
            child: Column(
              children: [
                Text(
                  'Total: ${invoiceWrapper.total}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'Vat: ${invoiceWrapper.vat}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'Payable: ${invoiceWrapper.payable}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: invoiceWrapper.paymentMethodList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() =>
                            PaymentWebView(
                                url: invoiceWrapper.paymentMethodList![index]
                                    .redirectGatewayURL!));
                      },
                      leading: Image.network(
                          invoiceWrapper.paymentMethodList![index].logo ?? ''),
                      title: Text(
                          invoiceWrapper.paymentMethodList![index].name ?? ''),
                      trailing: const Icon(Icons.arrow_forward_outlined),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const Divider();
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Checkout'),
    );
  }
}
