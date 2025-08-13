import 'package:flutter/material.dart';
import '../widgets/main_layout.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.blueGrey,
    Colors.limeAccent,
    Colors.purpleAccent,
  ];

  List<Map<String, String>> teams = List.generate(
    7,
        (i) => {'title': 'Team ${i + 1}', 'subtitle': 'Matches: 1 Won: 0 Lost: 0'},
  );

  void _showTeamDialog({int? index}) {
    final titleCtrl = TextEditingController(text: index != null ? teams[index]['title'] : '');
    final subCtrl = TextEditingController(text: index != null ? teams[index]['subtitle'] : '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? 'Add New Team' : 'Edit Team'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: subCtrl, decoration: const InputDecoration(labelText: 'Subtitle')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              final title = titleCtrl.text.trim();
              if (title.isEmpty) return;
              setState(() {
                final subtitle = subCtrl.text.trim().isEmpty ? 'Matches: 0 Won: 0 Lost: 0' : subCtrl.text.trim();
                if (index == null) {
                  teams.add({'title': title, 'subtitle': subtitle});
                } else {
                  teams[index] = {'title': title, 'subtitle': subtitle};
                }
              });
              Navigator.pop(context);
            },
            child: Text(index == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  void _deleteTeam(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Team'),
        content: Text('Delete "${teams[index]['title']}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              setState(() => teams.removeAt(index));
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      selectedIndex: 1,
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: teams.length,
            itemBuilder: (context, i) {
              final team = teams[i];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colors[i % colors.length],
                    child: Text(
                      (team['title'] ?? 'T')[0],
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(team['title'] ?? ''),
                  subtitle: Text(team['subtitle'] ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: const Icon(Icons.edit, color: Colors.grey), onPressed: () => _showTeamDialog(index: i)),
                      IconButton(icon: const Icon(Icons.delete, color: Colors.grey), onPressed: () => _deleteTeam(i)),
                    ],
                  ),
                ),
              );
            },
          ),

          // Positioned FAB for adding new team
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () => _showTeamDialog(),
              child: const Icon(Icons.add),
              tooltip: 'Add New Team',
            ),
          ),
        ],
      ),
    );
  }
}
