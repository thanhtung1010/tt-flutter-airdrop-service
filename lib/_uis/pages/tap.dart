import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tt_flutter_airdrop_service/_uis/screens/add_airdrop_project.dart';
import 'package:tt_flutter_airdrop_service/_uis/screens/add_tap_info.dart';
import 'package:tt_flutter_airdrop_service/_uis/widgets/filters.dart';

@RoutePage()
class TapPage extends StatefulWidget {
  const TapPage({super.key});

  @override
  State<TapPage> createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedPriority = 'All';
  CollectionReference tapInformation =
      FirebaseFirestore.instance.collection('TAP_INFORMATION');
  List<Map<String, dynamic>> airdropList = [];

  @override
  void initState() {
    super.initState();
    getTapInforList().then((resp) {
      setState(() {
        airdropList = resp;
      });
    });
  }

  Future<List<Map<String, dynamic>>> getTapInforList(
      {Map<String, dynamic>? filters}) async {
    try {
      QuerySnapshot querySnapshot = await tapInformation.get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Lỗi khi lấy dữ liệu: $e");
      return [];
    }
  }

  void onclickAddTapInformation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTapAccount();
      },
    ).then(<DocumentReference>(value) {
      if (value != null) {
        getTapInforList().then((resp) {
          setState(() {
            airdropList = resp;
          });
        });
      }
    });
  }

  void onclickAddAirdrop() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddAirdropProject();
      },
    ).then(<DocumentReference>(value) {
      if (value != null) {
        print('get list');
      }
    });
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

  void onSearch() {
    print('click search');
    getTapInforList().then((resp) {
      setState(() {
        airdropList = resp;
      });
      print(resp);
    });
  }

  void handleMenuSelection(String value) {
    if (value == 'add_tap') {
      onclickAddTapInformation();
    } else if (value == 'add_airdrop') {
      onclickAddAirdrop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FiltersWidget(
              onSearch: onSearch,
              onReset: _onReset,
              customButton: PopupMenuButton<String>(
                onSelected: handleMenuSelection,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'add_tap',
                    child: Text('Add Tap'),
                  ),
                  PopupMenuItem(
                    value: 'add_airdrop',
                    child: Text('Add Airdrop'),
                  ),
                ],
                child: Icon(
                  Icons.add_circle,
                  color: Colors.green,
                ),
              ),
              // customButton: IconButton(
              //   onPressed: onclickAddTapInformation,
              //   icon: Icon(
              //     Icons.add,
              //     color: Colors.white,
              //   ),
              //   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              //   tooltip: "Add Account",
              // ),
              customFilters: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          labelText: 'Search',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Priority:"),
                        Row(
                          children:
                              ['All', 'High', 'Medium', 'Low'].map((priority) {
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
                itemCount: airdropList.length,
                itemBuilder: (context, index) {
                  var item = airdropList[index];
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
        // leading: CircleAvatar(
        //   backgroundColor:
        //       Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        //           .withValues(),
        //   child: Text(item['avatar']),
        // ),
        title:
            Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item['phone']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Nút Edit
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _editItem(index),
              tooltip: "Edit",
            ),

            // Nút Delete
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteItem(index),
              tooltip: "Delete",
            ),
          ],
        ),
      ),
    );
  }
}
