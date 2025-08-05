import 'package:auto_care_project/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
Uint8List? _imageBytes;
class SellYourCarScreen extends StatefulWidget {
  const SellYourCarScreen({super.key});

  @override
  State<SellYourCarScreen> createState() => _SellYourCarScreenState();
}

class _SellYourCarScreenState extends State<SellYourCarScreen> {
  File? selectedImage;
  final picker = ImagePicker();

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Sell Your Car",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'RobotoR',
              color: myColor.secondaryColor,
            ),
          ),
        ),
        backgroundColor: myColor.backgroundColor,
      ),
      backgroundColor: myColor.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Picker Section
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                height: 200,
                child: Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                    border: const DashedBorder.fromBorderSide(
                      side: BorderSide(
                        color: myColor.backgroundColor,
                        width: 2,
                      ),
                      dashLength: 10,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _imageBytes != null
                          ? Image.memory(_imageBytes!,
                              width: 200, height: 200, fit: BoxFit.cover)
                          : Text("No Image Selected"),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _pickImageFromGallery,
                        child: Text("Pick Image from Gallery"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Car Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CarDetailsList(),
            ),
            const SizedBox(height: 20),
            // Contact Information Section
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Image Picker Options
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: myColor.backgroundColor,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.photo,
                            size: 40,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      //_pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.camera,
                            size: 40,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // Adjust image quality
    );

    if (pickedFile != null) {
      final Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    } else {
      print("No image selected");
    }
  }
}

class CarDetailsList extends StatefulWidget {
  @override
  _CarDetailsListState createState() => _CarDetailsListState();
}

class _CarDetailsListState extends State<CarDetailsList> {
  final Map<String, List<String>> carBrandsWithModels = {
    'Honda': [
      'Civic',
      'City',
      'BR-V',
      'Vezel',
      'Fit',
      'Freed',
      'N WGN',
      'N Box',
      'Accord'
    ],
    'Hyundai': [
      'Elantra',
      'Tucson',
      'Sonata',
      'Santa Fe',
      'H-100 Porter',
      'Shehzore'
    ],
    'Audi': ['A3', 'A4', 'A5', 'A6', 'A7', 'Q2', 'Q3', 'Q5', 'Q7'],
    'BMW': [
      '3 Series',
      '5 Series',
      '7 Series',
      'X1',
      'X3',
      'X5',
      'Z4 Roadster'
    ],
    'Suzuki': [
      'Alto',
      'Cultus',
      'Wagon R',
      'Swift',
      'Bolan',
      'Ravi',
      'Mehran',
      'Liana',
      'Khyber'
    ],
    'Toyota': [
      'Corolla (XLi)',
      'Corolla (GLi)',
      'Corolla (Altis)',
      'Corolla (Grande)',
      'Yaris',
      'Vitz',
      'Passo',
      'Aqua',
      'Prius',
      'Hilux Revo',
      'Fortuner',
      'Land Cruiser'
    ],
    'Land Rover / Range Rover': ['Evoque', 'Sport', 'Vogue', 'Defender'],
    'Rolls Royce': ['Phantom', 'Ghost', 'Cullinan'],
    'Ferrari': ['458', '488', 'F8 Tributo', 'Portofino'],
    'Lamborghini': ['Aventador', 'Huracán', 'Urus'],
    'Ford': ['Mustang'],
    'Chevrolet': ['Joy', 'Spark', 'Cruze', 'Optra'],
    'Tesla': ['Model S', 'Model 3', 'Model X'],
    'Changan': ['Alsvin', 'Karvaan', 'Oshan X7', 'M9 Sherpa'],
    'Daihatsu': ['Mira', 'Move', 'Terios', 'Cuore'],
    'Kia': ['Sportage', 'Picanto', 'Stonic', 'Sorento', 'Carnival'],
    'Mercedes-Benz': ['C-Class', 'E-Class', 'S-Class', 'GLC', 'GLE', 'G-Wagon'],
    'Mitsubishi': ['Pajero', 'Lancer', 'EK Wagon'],
    'Nissan': ['Dayz', 'Note', 'AD Van', 'Juke', 'Bluebird'],
    'MG': ['MG HS', 'MG ZS EV'],
    'FAW': ['V2', 'XPV', 'Carrier'],
    'DFSK / Prince': ['Pearl', 'Glory 580', 'K07', 'C37'],
    'United': ['Bravo', 'Alpha'],
    'Regal': ['Prince Pearl'],
    'Adam': ['Revo'],
  };

  final List<String> cities = [
    'Lahore',
    'Karachi',
    'Rawalpindi',
    'Faisalabad',
    'Multan',
    'Gujranwala',
    'Sialkot',
    'Bahawalpur',
    'Sargodha',
    'Rahim Yar Khan',
    'Sheikhupura',
    'Gujrat',
    'Jhelum',
    'Dera Ghazi Khan',
    'Murree',
    'Narowal',
    'Okara',
    'Kasur',
    'Mianwali',
    'Chakwal',
    'Bhakkar',
    'Vehari',
    'Layyah',
    'Attock',
    'Hyderabad',
    'Sukkur',
    'Larkana',
    'Nawabshah',
    'Mirpur Khas',
    'Jacobabad',
    'Shikarpur',
    'Dadu',
    'Khairpur',
    'Peshawar',
    'Mardan',
    'Abbottabad',
    'Swat (Mingora)',
    'Kohat',
    'Bannu',
    'Dera Ismail Khan',
    'Charsadda',
    'Nowshera',
    'Mansehra',
    'Hangu',
    'Haripur',
    'Quetta',
    'Gwadar',
    'Turbat',
    'Khuzdar',
    'Sibi',
    'Zhob',
    'Chaman',
    'Dera Murad Jamali',
    'Hub Loralai',
    'Muzaffarabad',
    'Mirpur',
    'Bagh',
    'Rawalakot',
    'Kotli',
    'Gilgit',
    'Skardu',
    'Hunza',
    'Chilas',
    'Ghizer'
  ];

  final Map<String, List<String>> additionalFields = {
    'Registered In': [
      "1990",
      "1991",
      '1992',
      '1993',
      '1994',
      '1995',
      '1996',
      '1997',
      '1998',
      '1999',
      '2000',
      '2001',
      '2002',
      '2003',
      '2004',
      '2005',
      '2006',
      '2007',
      '2008',
      '2009',
      '2010',
      '2011',
      '2012',
      '2013',
      '2014',
      '2015',
      '2016',
      '2017',
      '2018',
      '2019',
      '2020',
      '2021',
      '2022',
      '2023',
      '2024',
      '2025'
    ],

    'Body Color': [
      'Red',
      'Blue',
      'White',
      'Black',
      'Silver',
      'Gray',
      'Red',
      'Blue',
      'Green',
      'Yellow',
      'Orange',
      'Brown',
      'Gold',
      'Beige',
      'Maroon',
      'Purple',
      'Pink',
      'Bronze',
      'Teal',
      'Navy Blue',
      'Sky Blue',
      'Dark Green'
    ],

    'Fuel Type': ['Petrol', 'Hybrid', 'Automatic'],
    // 'KMs Driven': ['1000km', '5000km'],
    // 'Price (PKR)': ['10lac', '50lac'],
    //
    // 'Engine Capacity': ['3000cc', '7644cc']
  };

  String? selectedBrand;
  String? selectedModel;
  String? selectedCity;
  Map<String, String?> additionalValues = {};
  @override
  void initState() {
    super.initState();
    additionalFields.forEach((key, value) {
      additionalValues[key] = null;
    });
  }

  void _showSearchableBottomSheet(String fieldName, List<String> options,
      void Function(String) onSelected) {
    List<String> filteredOptions = List.from(options);
    TextEditingController searchController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Search $fieldName",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: (value) {
                      setModalState(() {
                        filteredOptions = options
                            .where((option) => option
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredOptions.length,
                      itemBuilder: (context, index) {
                        final option = filteredOptions[index];
                        return ListTile(
                          title: Text(option),
                          onTap: () {
                            onSelected(option);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDropdownField(String label, String? value, List<String> options,
      void Function(String) onSelected) {
    return GestureDetector(
      onTap: () => _showSearchableBottomSheet(label, options, onSelected),
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            hintText: 'Select $label',
            suffixIcon: Icon(
              CupertinoIcons.arrow_down,
              size: 15,
            ),
          ),
          controller: TextEditingController(text: value ?? ''),
          readOnly: true,
        ),
      ),
    );
  }

  bool isAutomatic = true; // Transmission options
  bool isManual = false;
  bool isImported = false; // Assembly options
  bool isLocal = true;
  bool allowTradeInOption = false;
  bool isAllowed = false;
  bool isNotAllowed = false;
  //bool allowTradeInOption = false; // Switch state
  String name = "";
  String mobileNumber = "";

  final postController = TextEditingController();
  final locationController = TextEditingController();
  final carModelController = TextEditingController();
  final registeredInController = TextEditingController();
  final bodyColorController = TextEditingController();
  final kmsDrivenController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final engineCapacityController = TextEditingController();
  final FuelTypeController = TextEditingController();
  final nameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref('post_your_ad');

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildDropdownField(
          'Location',
          selectedCity,
          cities,
          (value) => setState(() => selectedCity = value),
        ),
        SizedBox(height: 16),
        _buildDropdownField(
          'Car Brand',
          selectedBrand,
          carBrandsWithModels.keys.toList(),
          (brand) => setState(() {
            selectedBrand = brand;
            selectedModel = null;
          }),
        ),
        if (selectedBrand != null)
          Column(
            children: [
              SizedBox(height: 16),
              _buildDropdownField(
                'Car Model',
                selectedModel,
                carBrandsWithModels[selectedBrand!]!,
                (model) => setState(() => selectedModel = model),
              ),
            ],
          ),
        SizedBox(height: 16),
        for (String field in additionalFields.keys) ...[
          _buildDropdownField(
            field,
            additionalValues[field],
            additionalFields[field]!,
            (value) => setState(() => additionalValues[field] = value),
          ),
          SizedBox(height: 16),
        ],
        buildTextFieldListTile(
          title: "Engine Capacity",
          title1: "3000cc, 7644cc",
          controller: engineCapacityController,
        ),
        SizedBox(height: 16),
        buildTextFieldListTile(
          title: "KMs Driven",
          title1: "1000km, 5000km",
          controller: kmsDrivenController,
        ),
        SizedBox(height: 16),
        buildTextFieldListTile(
          title: "Price (PKR)",
          title1: "10lac, 50lac",
          controller: priceController,
        ),
        SizedBox(height: 16),
        buildTextFieldListTile(
          title: "Description",
          title1: "Anything",
          controller: descriptionController,
        ),
        const SizedBox(height: 20),
        const Text(
          "Transmission",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            buildToggleButton("Automatic", isAutomatic, (selected) {
              setState(() {
                isAutomatic = true;
                isManual = false;
              });
            }),
            const SizedBox(width: 10),
            buildToggleButton("Manual", isManual, (selected) {
              setState(() {
                isAutomatic = false;
                isManual = true;
              });
            }),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "Assembly",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            buildToggleButton("Imported", isImported, (selected) {
              setState(() {
                isImported = true;
                isLocal = false;
              });
            }),
            const SizedBox(width: 10),
            buildToggleButton("Local", isLocal, (selected) {
              setState(() {
                isImported = false;
                isLocal = true;
              });
            }),
          ],
        ),

        const SizedBox(height: 20),
        const Text(
          "Trade In Option",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            buildToggleButton("Allowed", isAllowed, (selected) {
              setState(() {
                isAllowed = true;
                isNotAllowed = false;
                allowTradeInOption = true;
              });
            }),
            const SizedBox(width: 10),
            buildToggleButton("Not Allowed", isNotAllowed, (selected) {
              setState(() {
                isAllowed = false;
                isNotAllowed = true;
                allowTradeInOption = false;
              });
            }),
          ],
        ),

        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Features",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: features.keys.map((feature) {
                return GestureDetector(
                  onTap: () => toggleFeature(feature),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        features[feature]!
                            ? CupertinoIcons.circle_fill
                            : CupertinoIcons
                                .circle, // Change icon based on selection
                        color: features[feature]!
                            ? myColor.backgroundColor
                            : Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(
                        feature,
                        style: TextStyle(
                          fontSize: 16,
                          color: features[feature]!
                              ? myColor.backgroundColor
                              : myColor.textColor,
                          fontWeight: features[feature]!
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contact Information",
              style: TextStyle(
                fontFamily: 'RobotoR',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            buildTextFieldTile(
              controller: nameController,
              title: "Name",
              hintText: "Enter your name",
              icon: CupertinoIcons.person,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 20),
            buildTextFieldTile(
              controller: mobileNumberController,
              title: "Mobile Number",
              hintText: "Enter your mobile number",
              icon: CupertinoIcons.phone,
              onChanged: (value) {
                setState(() {
                  mobileNumber = value;
                });
              },
            ),
            const SizedBox(height: 20),

          ],
        ),
        TextButton(
          onPressed: () async {
            print("Ad Submitted!");
            print("Name: $name");
            print("Mobile Number: $mobileNumber");
            print("Trade In Option Allowed: $allowTradeInOption");

            try {
              // if (locationController.text.isEmpty ||
              //     carModelController.text.isEmpty) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(content: Text("Please fill all required fields")),
              //   );
              //   return;
              // }
              String id = DateTime.now().microsecondsSinceEpoch.toString();
              String? imageUrl;
              final user = FirebaseAuth.instance.currentUser;

              // 🔼 Upload Image if selected
              if (_imageBytes != null) {
                final storageRef = FirebaseStorage.instance.ref().child('car_images/$id.jpg');

                final uploadTask = await storageRef.putData(_imageBytes!);
                imageUrl = await storageRef.getDownloadURL();
                print("Image uploaded: $imageUrl");
              }

              // String id = DateTime.now().microsecondsSinceEpoch.toString();
              Map<String, bool> selectedFeatures = features.entries
                  .where((entry) => entry.value)
                  .fold<Map<String, bool>>(
                {},
                (map, entry) {
                  map[entry.key] = entry.value;
                  return map;
                },
              );

              await databaseRef.child(id).set({
                "userId": user?.uid,
                'id': id,
                'imageUrl': imageUrl ?? "",
                'location': selectedCity,
                'carBrand': selectedBrand,
                'carModel': selectedModel,
                'registeredIn': additionalValues['Registered In'],
                'fuelType': additionalValues['Fuel Type'],
                'bodyColor': additionalValues['Body Color'],
                //'location': locationController.text,
                //'carModel': carModelController.text,
                //'registeredIn': registeredInController.text,
                //'bodyColor': bodyColorController.text,
                'kmsDriven': kmsDrivenController.text,
                'price': priceController.text,
                'description': descriptionController.text,
                //'fuelType': FuelTypeController.text,
                'engineCapacity': engineCapacityController.text,
                'name': nameController.text,
                'mobileNumber': mobileNumberController.text,
                'transmission': isAutomatic ? "Automatic" : "Manual",
                'assembly': isImported ? "Imported" : "Local",
                'tradeInOption': isAllowed ? "Allowed" : "Not Allowed",
                'selectedFeatures': selectedFeatures,
              });




              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Data added successfully!")),
              );

              // Clear fields after saving
              _imageBytes = null;
              locationController.clear();
              carModelController.clear();
              registeredInController.clear();
              bodyColorController.clear();
              kmsDrivenController.clear();
              priceController.clear();
              descriptionController.clear();
              FuelTypeController.clear();
              engineCapacityController.clear();
              mobileNumberController.clear();
              nameController.clear();

              setState(() {
                features.updateAll((key, value) => false);
              });
            } catch (e) {
              print("Error: $e");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Failed to add data: $e")),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: myColor.backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: const Text(
            "Post Your Ad",
            style: TextStyle(
                fontFamily: 'RobotoR', fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildTextFieldTile({
    required String title,
    required String hintText,
    required IconData icon,
    required Function(String) onChanged,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: myColor.greyColor,
          child: Icon(icon, color: myColor.backgroundColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: title,
              hintText: hintText,
              border: const OutlineInputBorder(),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget buildTextFieldListTile({
    required String title,
    required String title1,
    required TextEditingController controller, // Add individual controller
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "RobotoR",
            //fontWeight: FontWeight.bold,
            //color: myColor.backgroundColor,
          ),
        ),
        SizedBox(
          height: 23,
          child: TextField(
            controller: controller, // Use the specific controller
            decoration: InputDecoration(
              hintText: title1,
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 25),
      child: Divider(
        thickness: 0.5,
      ),
    );
  }

  Widget buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(fontSize: 10),
      ),
      backgroundColor: myColor.greyColor,
    );
  }

  // Widget buildDropdownTile({
  //   required String title,
  //   required String? value,
  //   required IconData icon,
  //   required List<String> options,
  //   required Function(String?) onChanged,
  // }) {
  //   return Row(
  //     children: [
  //       CircleAvatar(
  //         backgroundColor: Colors.grey[200],
  //         child: Icon(icon, color: Colors.blue),
  //       ),
  //       const SizedBox(width: 10),
  //       Expanded(
  //         child: DropdownButtonFormField<String>(
  //           value: value,
  //           decoration: InputDecoration(
  //             labelText: title,
  //           ),
  //           items: options
  //               .map((option) => DropdownMenuItem(
  //                     value: option,
  //                     child: Text(option),
  //                   ))
  //               .toList(),
  //           onChanged: onChanged,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget buildToggleButton(
      String label, bool isSelected, Function(bool) onPressed) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onPressed,
      selectedColor: myColor.backgroundColor,
      backgroundColor: myColor.secondaryColor,
      labelStyle: TextStyle(
        color: isSelected ? myColor.secondaryColor : myColor.textColor,
      ),
    );
  }

  Map<String, bool> features = {
    "ABS": false,
    "Air Bags": false,
    "Alloy Rims": false,
    "Cruise Control": false,
    "Keyless Entry": false,
    "AM/FM Radio": false,
    "Air Conditioning": false,
    "CD Player": false,
  };

  void toggleFeature(String feature) {
    setState(() {
      features[feature] = !features[feature]!;
    });
    databaseRef.child("selected_features").set(features);
  }
}
