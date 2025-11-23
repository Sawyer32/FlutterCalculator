import 'package:flutter/material.dart';

import '../models/model.dart';

class HistoryWidget extends StatelessWidget {
  final List<HistoryItem> history;
  final VoidCallback onClearHistory;
  const HistoryWidget({super.key, required this.history, required this.onClearHistory});

  void onHistoryOpen(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsetsGeometry.directional(start: 18), child: Text("Historik", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                      if (history.isNotEmpty)
                        Padding(
                          padding: EdgeInsetsGeometry.directional(end: 18),
                          child: IconButton(
                            icon: Icon(Icons.disabled_visible),
                            onPressed: onClearHistory,
                          ),
                        ),
                    ],
                  ),
                  Flexible(
                    child: ListView(
                        shrinkWrap: true,
                        children: [
                          if (history.isEmpty)
                            Padding(
                              padding: EdgeInsetsGeometry.directional(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Ingen historik"),
                                ],
                              ),
                            )
                          else
                            for (var entry in history)
                              ListTile(
                                title: Text(entry.result),
                                subtitle: Text(entry.expression),
                                trailing: Text(entry.date),
                              ),
                        ]
                    ),
                  ),
                ],
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onHistoryOpen(context),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Icon(Icons.history),
      ),
    );
  }
}
