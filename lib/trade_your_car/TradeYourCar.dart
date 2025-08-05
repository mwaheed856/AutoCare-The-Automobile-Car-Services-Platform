// import 'package:auto_care_project/trade_your_car/CompareCars.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import 'CompareCars.dart';

class TradeYourCar extends StatefulWidget {
  final Map<String, dynamic> carData; // 👈 Add this

  const TradeYourCar({Key? key, required this.carData})
      : super(key: key); // 👈 Constructor

  @override
  _TradeYourCarState createState() => _TradeYourCarState();
}

class _TradeYourCarState extends State<TradeYourCar> {
  final Map<String, List<String>> carBrandsWithModels = {
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
    'Daihatsu': ['Mira', 'Move', 'Terios', 'Cuore'],
    'Nissan': ['Dayz', 'Note', 'AD Van', 'Juke', 'Bluebird'],
    'Mitsubishi': ['Pajero', 'Lancer', 'EK Wagon'],
    'Kia': ['Sportage', 'Picanto', 'Stonic', 'Sorento', 'Carnival'],
    'Hyundai': [
      'Elantra',
      'Tucson',
      'Sonata',
      'Santa Fe',
      'H-100 Porter',
      'Shehzore'
    ],
    'Changan': ['Alsvin', 'Karvaan', 'Oshan X7', 'M9 Sherpa'],
    'MG': ['MG HS', 'MG ZS EV'],
    'FAW': ['V2', 'XPV', 'Carrier'],
    'DFSK / Prince': ['Pearl', 'Glory 580', 'K07', 'C37'],
    'United': ['Bravo', 'Alpha'],
    'Regal': ['Prince Pearl'],
    'Adam': ['Revo'],
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
    'Mercedes-Benz': ['C-Class', 'E-Class', 'S-Class', 'GLC', 'GLE', 'G-Wagon'],
    'Land Rover / Range Rover': ['Evoque', 'Sport', 'Vogue', 'Defender'],
    'Rolls Royce': ['Phantom', 'Ghost', 'Cullinan'],
    'Ferrari': ['458', '488', 'F8 Tributo', 'Portofino'],
    'Lamborghini': ['Aventador', 'Huracán', 'Urus'],
    'Ford': ['Mustang'],
    'Chevrolet': ['Joy', 'Spark', 'Cruze', 'Optra'],
    'Tesla': ['Model S', 'Model 3', 'Model X']
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
  TextEditingController engineCapacityController = TextEditingController();
  TextEditingController kmsDrivenController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Enter your Car Details here",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoM',
              color: myColor.secondaryColor,
            ),
          ),
        ),
        backgroundColor: myColor.backgroundColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
            buildTextFieldListTileForTradeCar(
              title: "Engine Capacity",
              title1: "3000cc, 7644cc",
              icon: CupertinoIcons.envelope_circle,
              controller: engineCapacityController,
            ),
            SizedBox(height: 16),
            buildTextFieldListTileForTradeCar(
              title: "KMs Driven",
              title1: "1000km, 5000km",
              icon: CupertinoIcons.speedometer,
              controller: kmsDrivenController,
            ),
            SizedBox(height: 16),
            buildTextFieldListTileForTradeCar(
              title: "Price (PKR)",
              title1: "10lac, 50lac",
              icon: CupertinoIcons.tag_fill,
              controller: priceController,
            ),
            SizedBox(height: 16),
            const Text(
              "Transmission",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildToggleButtonForTradeCar("Automatic", isAutomatic, (selected) {
                  setState(() {
                    isAutomatic = true;
                    isManual = false;
                  });
                }),
                const SizedBox(width: 10),
                buildToggleButtonForTradeCar("Manual", isManual, (selected) {
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
                buildToggleButtonForTradeCar("Imported", isImported, (selected) {
                  setState(() {
                    isImported = true;
                    isLocal = false;
                  });
                }),
                const SizedBox(width: 10),
                buildToggleButtonForTradeCar("Local", isLocal, (selected) {
                  setState(() {
                    isImported = false;
                    isLocal = true;
                  });
                }),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedCity != null &&
                      selectedBrand != null &&
                      selectedModel != null) {
                    Map<String, dynamic> tradeCarData = {
                      "brand": selectedBrand!,
                      "model": selectedModel!,
                      "location": selectedCity!,
                      "engineCapacity": engineCapacityController.text,
                      "kmsDriven": kmsDrivenController.text,
                      "transmission": isAutomatic
                          ? "Automatic"
                          : isManual
                              ? "Manual"
                              : "Not selected",
                      "assembly": isImported
                          ? "Imported"
                          : isLocal
                              ? "Local"
                              : "Not selected",
                      ...additionalValues,
                    "price": priceController.text,
                    };
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompareCars(
                          carData: widget.carData,
                          tradeCarData: tradeCarData,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Please select all required fields")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: myColor.backgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Compare Both Cars",
                  style: TextStyle(
                      fontFamily: 'RobotoR', fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldListTileForTradeCar({
    required String title,
    required String title1,
    required IconData icon,
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

  Widget buildToggleButtonForTradeCar(
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
}
