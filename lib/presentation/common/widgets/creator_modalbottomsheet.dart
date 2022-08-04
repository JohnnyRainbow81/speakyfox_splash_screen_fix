import 'package:flutter/material.dart';
import 'package:flutter_starterkit/presentation/common/widgets/buttons/long_rounded_confirm_button.dart';
import 'package:flutter_starterkit/presentation/common/widgets/buttons/payment_amount_button.dart';
import 'buttons/close_x_button.dart';

class CreatorModalBottomSheet extends StatelessWidget {
  const CreatorModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CloseXButton(),
          const Text(
            "Video erstellt von",
            style: TextStyle(
              fontFamily: 'SourceSansProBold',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset('assets/images/paula_lynn.png'),
          const SizedBox(height: 16),
          const Text(
            "Paula Lynn",
            style: TextStyle(
              fontFamily: 'SourceSansProBold',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 72),
            child: const Text(
              "Deine Spende inklusive der Zahlungsgebühren geht an Paula Lynn.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              PaymentAmountButton("0,99"),
              SizedBox(width: 8),
              PaymentAmountButton("1,99"),
              SizedBox(width: 8),
              PaymentAmountButton("4,99"),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Anderen Betrag wählen",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          const LongRoundedConfirmButton("Zahlen")
        ],
      ),
    );
  }
}


