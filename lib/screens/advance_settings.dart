import 'package:cricket_scorer_app/widgets/radio_option.dart';
import 'package:flutter/material.dart';

import '../widgets/CustomButton.dart';
import '../widgets/input_box.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final TextEditingController playersPerTeamController = TextEditingController();
  final TextEditingController noBallRunsController = TextEditingController();
  final TextEditingController wideBallRunsController = TextEditingController();
bool NEnabled = true;
  bool WEnabled = true;

  String noBallOption = 'Re Ball';
  String wideBallOption = 'Re Ball';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('Match Settings'),
      ),
      backgroundColor: const Color(0xFFEFEFEF),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Players per team
              const Text(
                'Players per Team?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  // fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              NInputBox(
                child: TextField(
                  controller: playersPerTeamController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'e.g. 11',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              /// No Ball
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    'No Ball',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                  OptionSelector(

                    isSwitch: true,

                    switchValue: NEnabled,
                    onSwitchChanged: (val) {
                      setState(() {
                        NEnabled = val;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 2),
              NInputBox(
                child: Column(
                  children: [
                    // Switch Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Re Ball"),
                        // Switch first (Right)
                        Switch(
                          activeColor: Colors.green,
                          value: NEnabled,

                          onChanged: (val) {
                            setState(() {
                              NEnabled = val;
                            });
                          },
                        ),
                        // Text last (right)

                      ],
                    ),

                    const SizedBox(height: 16),

                    // Input Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('No ball run'),
                        // Input first (left)
                        SizedBox(
                          width: 60, // set a fixed width if needed
                          child: TextField(
                            controller: wideBallRunsController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '1',

                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        // Text last (right)

                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              /// Wide Ball
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wide Ball',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      // fontStyle: FontStyle.italic,
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),

                  OptionSelector(

                    isSwitch: true,
                    switchValue: WEnabled,
                    onSwitchChanged: (val) {
                      setState(() {
                        WEnabled = val;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 8),
              NInputBox(
                child: Column(
                  children: [
                    // Switch Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Re Ball"),
                        // Switch first (Right)
                        Switch(
                          activeColor: Colors.green,
                          value: WEnabled,

                          onChanged: (val) {
                            setState(() {
                              WEnabled = val;
                            });
                          },
                        ),
                        // Text last (right)

                      ],
                    ),

                    const SizedBox(height: 8),

                    // Input Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Wide Ball Run'),
                        // Input first (left)
                        SizedBox(
                          width: 60, // set a fixed width if needed
                          child: TextField(
                            controller: wideBallRunsController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: '1'
                            ),
                          ),
                        ),
                        // Text last (right)
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  label: "Save Settings",
                  color: Colors.green,
                  textColor: Colors.white,
                  radius: 2, // now works!
                  onPressed: () => Navigator.pushNamed(context, '/home'),
                  type: ButtonType.elevated,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}