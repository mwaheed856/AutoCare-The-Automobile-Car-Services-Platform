import 'package:flutter/material.dart';
import 'package:auto_care_project/colors.dart';
//import '../filtered_result.dart';
import 'buy_car.dart';

class BuyCarsPage extends StatefulWidget {
  const BuyCarsPage({super.key});

  @override
  State<BuyCarsPage> createState() => _BuyCarsPageState();
}

class _BuyCarsPageState extends State<BuyCarsPage> {
  final Map<String, List<String>> brandModels = {
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

  final List<String> allCities = [
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

  final List<String> allColors = [
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
  ];
  final List<String> transmissions = ["Automatic", "Manual"];
  final List<int> prices = [300, 500, 700, 1000, 1500];
  final List<int> years = [1990, 1991, 1992, 1993, 1994,
    1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003,
    2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012,
    2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021,
    2022, 2023, 2024, 2025];

  String? selectedBrand;
  String? selectedModel;
  String? selectedCity;
  String? selectedTransmission;
  int? selectedPrice;
  int? selectedRegisteredIn;
  String? selectedColor;

  List<String> get availableModels =>
      selectedBrand != null ? brandModels[selectedBrand!] ?? [] : [];

  void resetFilters() {
    setState(() {
      selectedBrand = null;
      selectedModel = null;
      selectedCity = null;
      selectedTransmission = null;
      selectedPrice = null;
      selectedRegisteredIn = null;
      selectedColor = null;
    });
  }

  void showSearchableSheet({
    required BuildContext context,
    required List<String> items,
    required String title,
    required Function(String) onItemSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        String query = '';
        List<String> filteredItems = [...items];

        return StatefulBuilder(builder: (context, setModalState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Search $title"),
                  onChanged: (value) {
                    query = value.toLowerCase();
                    setModalState(() {
                      filteredItems = items
                          .where((item) =>
                          item.toLowerCase().contains(query.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(filteredItems[index]),
                        onTap: () {
                          Navigator.pop(context);
                          onItemSelected(filteredItems[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Widget buildSheetSelector({
    required String label,
    required String? selected,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            margin: const EdgeInsets.only(top: 6, bottom: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(selected ?? "Select $label"),
          ),
        ),
      ],
    );
  }

  Widget buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> options,
    required Function(T?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<T>(
          value: value,
          isExpanded: true,
          hint: Text("Select $label"),
          onChanged: onChanged,
          items: options.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor.backgroundColor,
        title: const Text("Buy a Car", style: TextStyle(color: myColor.secondaryColor)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildSheetSelector(
                      label: "Brand",
                      selected: selectedBrand,
                      onTap: () {
                        showSearchableSheet(
                          context: context,
                          title: "Brand",
                          items: brandModels.keys.toList(),
                          onItemSelected: (brand) {
                            setState(() {
                              selectedBrand = brand;
                              selectedModel = null; // reset model
                            });
                          },
                        );
                      },
                    ),
                    if (selectedBrand != null)
                      buildSheetSelector(
                        label: "Model",
                        selected: selectedModel,
                        onTap: () {
                          showSearchableSheet(
                            context: context,
                            title: "Model",
                            items: availableModels,
                            onItemSelected: (model) {
                              setState(() => selectedModel = model);
                            },
                          );
                        },
                      ),
                    buildSheetSelector(
                      label: "City",
                      selected: selectedCity,
                      onTap: () {
                        showSearchableSheet(
                          context: context,
                          title: "City",
                          items: allCities,
                          onItemSelected: (city) {
                            setState(() => selectedCity = city);
                          },
                        );
                      },
                    ),
                    buildSheetSelector(
                      label: "Transmission",
                      selected: selectedTransmission,
                      onTap: () {
                        showSearchableSheet(
                          context: context,
                          title: "Transmission",
                          items: transmissions,
                          onItemSelected: (val) {
                            setState(() => selectedTransmission = val);
                          },
                        );
                      },
                    ),

                    buildSheetSelector(
                      label: "Registered In (Year)",
                      selected: selectedRegisteredIn?.toString(),
                      onTap: () {
                        showSearchableSheet(
                          context: context,
                          title: "Registered In",
                          items: years.map((e) => e.toString()).toList(),
                          onItemSelected: (val) {
                            setState(() => selectedRegisteredIn = int.parse(val));
                          },
                        );
                      },
                    ),
                    buildSheetSelector(
                      label: "Body Color",
                      selected: selectedColor,
                      onTap: () {
                        showSearchableSheet(
                          context: context,
                          title: "Body Color",
                          items: allColors,
                          onItemSelected: (val) {
                            setState(() => selectedColor = val);
                          },
                        );
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: resetFilters, child: const Text("Reset")),
                        ElevatedButton(
                          onPressed: () {
                            final filters = {
                              "carBrand": selectedBrand,
                              "carModel": selectedModel,
                              "location": selectedCity,
                              "transmission": selectedTransmission,
                              "bodyColor": selectedColor,
                              "registeredIn": selectedRegisteredIn,
                            };
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => PostYourAd(filters: filters)),
                            );
                          },
                          child: const Text("Apply Filters", style: TextStyle(
                            fontFamily: 'RobotoR',
                            color: myColor.backgroundColor,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
