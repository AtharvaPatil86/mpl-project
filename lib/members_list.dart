import 'package:flutter/material.dart';

class MembersListScreen extends StatefulWidget {
  @override
  _MembersListScreenState createState() => _MembersListScreenState();
}

class _MembersListScreenState extends State<MembersListScreen> {
  List<Map<String, String>> allMembers = [
    {"sr": "1", "name": "Rahul Sharma", "date": "01-01-2024", "type": "Regular"},
    {"sr": "2", "name": "Anjali Verma", "date": "05-02-2024", "type": "PT"},
    {"sr": "3", "name": "Amit Kumar", "date": "10-02-2024", "type": "Regular"},
    {"sr": "4", "name": "Priya Singh", "date": "15-02-2024", "type": "PT"},
  ];

  List<Map<String, String>> filteredMembers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMembers = List.from(allMembers);
  }

  void filterMembers(String query) {
    setState(() {
      filteredMembers = allMembers
          .where((member) =>
              member["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              member["type"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Members List"),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Color(0xFFF5F5DC), // Beige background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Gym Members",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            // Search Bar
            TextField(
              controller: searchController,
              onChanged: filterMembers,
              decoration: InputDecoration(
                labelText: "Search Members...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Scrollable Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(color: Colors.grey),
                  columns: [
                    DataColumn(label: Text("SR No.", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Admission Date", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Membership Type", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: filteredMembers.map((member) {
                    return DataRow(cells: [
                      DataCell(Text(member["sr"]!)),
                      DataCell(Text(member["name"]!)),
                      DataCell(Text(member["date"]!)),
                      DataCell(Text(member["type"]!)),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
