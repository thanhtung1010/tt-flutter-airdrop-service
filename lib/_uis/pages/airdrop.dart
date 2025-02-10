import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tt_flutter_airdrop_service/_uis/widgets/filters.dart';

@RoutePage()
class AirdropPage extends StatefulWidget {
  const AirdropPage({super.key});

  @override
  State<AirdropPage> createState() => _AirdropPageState();
}

class _AirdropPageState extends State<AirdropPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedPriority = 'All';

  List<Map<String, dynamic>> airdropList = [
    {
      'avatar': 'JD',
      'name': 'John Doe',
      'phone': '123-456-7890',
      'priority': 'High'
    },
    {
      'avatar': 'AS',
      'name': 'Alice Smith',
      'phone': '987-654-3210',
      'priority': 'Medium'
    },
    {
      'avatar': 'BJ',
      'name': 'Bob Johnson',
      'phone': '555-666-7777',
      'priority': 'Low'
    },
  ];

  List<Map<String, dynamic>> get filteredList {
    return airdropList.where((item) {
      bool matchName = item['name']
          .toLowerCase()
          .contains(_searchController.text.toLowerCase());
      bool matchPriority =
          _selectedPriority == 'All' || item['priority'] == _selectedPriority;
      return matchName && matchPriority;
    }).toList();
  }

  void _addNewItem() {
    // Logic thêm item mới (tùy theo yêu cầu)
  }

  void _editItem(int index) {
    // Logic chỉnh sửa item
  }

  void _deleteItem(int index) {
    setState(() {
      airdropList.removeAt(index);
    });
  }

  void _onReset() {
    print("_onReset Clicked!");
    setState(() {});
  }

  void _onSearch() {
    print("Search Clicked!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Airdrop List')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FiltersWidget(
              onSearch: _onSearch,
              onReset: _onReset,
              customButton: ElevatedButton.icon(
                onPressed: _addNewItem,
                icon: Icon(Icons.add),
                label: Text("Add New"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
              customFilters: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                      ],
                    ),

                    // Radio Button chọn Priority
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Priority:"),
                        Row(
                          children: ['All', 'High', 'Medium', 'Low'].map((priority) {
                            return Row(
                              children: [
                                Radio<String>(
                                  value: priority,
                                  groupValue: _selectedPriority,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedPriority = value!;
                                    });
                                  },
                                ),
                                Text(priority),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  var item = filteredList[index];
                  return _buildAirdropCard(item, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget tạo Card cho mỗi item
  Widget _buildAirdropCard(Map<String, dynamic> item, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withValues(),
          child: Text(item['avatar']),
        ),
        title: Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item['phone']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Nút Edit
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _editItem(index),
            ),

            // Nút Delete
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteItem(index),
            ),
          ],
        ),
      ),
    );
  }
}


