import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/CustomButton.dart';
import '../widgets/input_box.dart';
import '../widgets/radio_option.dart';
import '/widgets/main_layout.dart';

class MatchSetupScreen extends StatefulWidget {
  const MatchSetupScreen({super.key});

  @override
  State<MatchSetupScreen> createState() => _MatchSetupScreenState();
}

class _MatchSetupScreenState extends State<MatchSetupScreen> {
  final TextEditingController hostController = TextEditingController();
  final TextEditingController visitorController = TextEditingController();
  final TextEditingController oversController = TextEditingController();

  String tossWinner = 'Host';
  String optedTo = 'Bat';

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      selectedIndex: 0, // Bottom nav bar active index
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Teams',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              InputBox(
                child: Column(
                  children: [
                    TextField(
                      controller: hostController,
                      decoration: const InputDecoration(
                        labelText: 'Host Team',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: visitorController,
                      decoration: const InputDecoration(
                        labelText: 'Visitor Team',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Toss won by?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Row(
                  children: [
                    OptionSelector(
                      title: 'Host',
                      groupValue: tossWinner,
                      value: 'Host',
                      onRadioChanged: (value) => setState(() => tossWinner = value!),
                    ),
                    OptionSelector(
                      title: 'Visitor',
                      groupValue: tossWinner,
                      value: 'Visitor',
                      onRadioChanged: (value) => setState(() => tossWinner = value!),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Opted to?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Row(
                  children: [
                    OptionSelector(
                      title: 'Bat',
                      groupValue: optedTo,
                      value: 'Bat',
                      onRadioChanged: (value) => setState(() => optedTo = value!),
                    ),
                    OptionSelector(
                      title: 'Bowl',
                      groupValue: optedTo,
                      value: 'Bowl',
                      onRadioChanged: (value) => setState(() => optedTo = value!),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Overs?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: TextField(
                  controller: oversController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'e.g. 10',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      label: "Advanced Settings",
                      color: Colors.black,
                      textColor: Colors.black,
                      onPressed: () => Navigator.pushNamed(context, '/settings'),
                      type: ButtonType.textButton,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: CustomButton(
                      label: "Start Match",
                      textColor: Colors.white,
                      color: Colors.green,
                      onPressed: () => Navigator.pushNamed(context, '/startMatch'),
                      type: ButtonType.elevated,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
