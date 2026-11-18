import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code/features/scanning/widget/enter_number_manually.dart';

class ScanScreen extends StatelessWidget {
  ScanScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مسح رموز الاستجابة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              Text(
                'مسح رموز الاستجابة',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 12),

              const Text(
                'ضع رمز الاستجابة السريعة داخل الإطار لمسح السيارة.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: 280,
                height: 280,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MobileScanner(
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;

                      for (final barcode in barcodes) {
                        final String? value = barcode.rawValue;

                        if (value != null) {
                          print('QR Value: $value');
                        }
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).focusColor),
                  onPressed: () {
                    context.push("/rfr_details");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code_scanner,color: Theme.of(context).cardColor,),
                      SizedBox(width: 8),
                      Text('مسح رموز الاستجابة',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              EnterNumberManually(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}