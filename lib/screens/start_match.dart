import 'package:flutter/material.dart';
import '../widgets/CustomButton.dart';
import '../widgets/input_box.dart';


class startMatchScreen extends StatelessWidget {
  const startMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Opening Players"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Sticker Text
              const Text(
                'Sticker',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  // fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 18,

                ),
              ),


              /// Input Box
              InputBox(
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,

                      decoration: const InputDecoration(
                        labelText: 'Player Name',
                        border: UnderlineInputBorder(),

                      ),
                    ),
                  ],
                ),
              ),


              const Text(
                'Non-Sticker',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  // fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),

              /// Input Box
              InputBox(
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Player Name',
                        border: UnderlineInputBorder(),
                      ),
                    ),

                  ],
                ),
              ),
              const Text(
                'Opening bowler',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  // fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),

              /// Input Box
              InputBox(
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Opening Bowler',
                        border: UnderlineInputBorder(),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  label: "Start Match",
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
