import 'package:flutter/material.dart';
import '../widgets/main_layout.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  String formatDateTime(DateTime dt) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final year = dt.year;
    final month = twoDigits(dt.month);
    final day = twoDigits(dt.day);
    final hour = twoDigits(dt.hour);
    final minute = twoDigits(dt.minute);
    return '$year-$month-$day – $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> matches = List.generate(5, (index) {
      return {
        'dateTime': DateTime.now().subtract(Duration(days: index)),
        'team1': 'Team A${index + 1}',
        'team2': 'Team B${index + 1}',
        'score': '${50 + index * 10}/${5 + index}',
        'overs': 10 + index,
      };
    });

    return MainLayout(
      // This variable controls which bottom nav icon is active
      selectedIndex: 2,

      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: matches.length,
        itemBuilder: (context, i) {
          final match = matches[i];
          final formattedDate = formatDateTime(match['dateTime'] as DateTime);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date at right top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(formattedDate, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Teams and scores row
                  Row(
                    children: [
                      CircleAvatar(child: Text(match['team1'][0])),
                      const SizedBox(width: 8),
                      Expanded(child: Text(match['team1'])),
                      Text('${match['score']} (${match['overs']} overs)'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(child: Text(match['team2'][0])),
                      const SizedBox(width: 8),
                      Expanded(child: Text(match['team2'])),
                      Text('${match['score']} (${match['overs']} overs)'),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Buttons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Resume Scoreboard', style: TextStyle(color: Colors.black54)),
                        onPressed: () {
                          // Resume scoreboard logic here
                        },
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.archive),
                        onPressed: () {
                          // Archive logic here
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Delete logic here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
