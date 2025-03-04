import 'package:flutter/material.dart';

class PersonalTrainersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trainers = [
    {
      "trainer": "Amit Sharma",
      "clients": ["Rahul Verma", "Sneha Singh", "Arjun Mehta"]
    },
    {
      "trainer": "Priya Kapoor",
      "clients": ["Karan Joshi", "Neha Patil", "Vikas Rathi"]
    },
    {
      "trainer": "Rohan Das",
      "clients": ["Ananya Sen", "Siddharth Rao", "Aakash Mishra", "Vivek Sharma"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Trainers"),
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
        color: Color(0xFFF5F5DC), // Beige background
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Personal Trainers & Their Clients",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9, // Wider table
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columnSpacing: 40.0, // Adds space between columns
                      border: TableBorder.all(color: Colors.grey),
                      columns: [
                        DataColumn(label: Text("Trainer Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                        DataColumn(label: Text("Clients", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                      ],
                      rows: trainers.map((trainer) {
                        return DataRow(cells: [
                          DataCell(Text(trainer["trainer"]!, style: TextStyle(fontSize: 16))),
                          DataCell(
                            Text(
                              trainer["clients"].join(", "), // Display clients horizontally
                              style: TextStyle(fontSize: 16),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
