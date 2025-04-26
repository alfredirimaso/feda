import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mockItems = [
      {
        'name': 'Milk',
        'expiry': '2025-04-15',
        'category': 'Dairy',
      },
      {
        'name': 'Frozen Peas',
        'expiry': '2025-05-01',
        'category': 'Frozen',
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Inventory",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: mockItems.isEmpty
                  ? const Center(child: Text("No items added yet."))
                  : ListView.builder(
                      itemCount: mockItems.length,
                      itemBuilder: (context, index) {
                        final item = mockItems[index];
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.fastfood, color: Colors.green),
                            title: Text(item['name']!),
                            subtitle: Text("Expires: ${item['expiry']!}\nCategory: ${item['category']!}"),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
