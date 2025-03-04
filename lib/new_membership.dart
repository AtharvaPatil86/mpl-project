import 'package:flutter/material.dart';

class GetMembershipScreen extends StatefulWidget {
  @override
  _GetMembershipScreenState createState() => _GetMembershipScreenState();
}

class _GetMembershipScreenState extends State<GetMembershipScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController joiningDateController = TextEditingController();
  String membershipType = "Regular"; // Default selection

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Name: ${nameController.text}");
      print("Address: ${addressController.text}");
      print("Mobile: ${mobileController.text}");
      print("Email: ${emailController.text}");
      print("Date of Birth: ${dobController.text}");
      print("Membership Type: $membershipType");
      print("Date of Joining: ${joiningDateController.text}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Membership form submitted successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Membership"),
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter Membership Details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                // Name Field
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Full Name", border: OutlineInputBorder()),
                  validator: (value) => value!.isEmpty ? "Please enter your name" : null,
                ),
                SizedBox(height: 10),

                // Address Field
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: "Address", border: OutlineInputBorder()),
                  validator: (value) => value!.isEmpty ? "Please enter your address" : null,
                ),
                SizedBox(height: 10),

                // Mobile Number Field
                TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Mobile Number", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter your mobile number";
                    if (value.length != 10) return "Enter a valid 10-digit mobile number";
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // Email Address Field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email Address", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter your email address";
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // Date of Birth Field
                TextFormField(
                  controller: dobController,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, dobController),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) => value!.isEmpty ? "Please select your date of birth" : null,
                ),
                SizedBox(height: 10),

                // Membership Type Dropdown
                DropdownButtonFormField<String>(
                  value: membershipType,
                  decoration: InputDecoration(labelText: "Membership Type", border: OutlineInputBorder()),
                  onChanged: (String? newValue) {
                    setState(() {
                      membershipType = newValue!;
                    });
                  },
                  items: ["Regular", "PT"]
                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                ),
                SizedBox(height: 10),

                // Date of Joining Field
                TextFormField(
                  controller: joiningDateController,
                  decoration: InputDecoration(
                    labelText: "Date of Joining",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, joiningDateController),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) => value!.isEmpty ? "Please select a joining date" : null,
                ),
                SizedBox(height: 20),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      backgroundColor: Colors.deepOrange,
                    ),
                    child: Text("Submit", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
