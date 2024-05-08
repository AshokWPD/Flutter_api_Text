import 'package:dev_api/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}


class MyCompanyDropDown extends StatefulWidget {
  final TextEditingController txtcontroller;
  final double? dropwidth;
  final String hinttxt;
  final ValueChanged<CompanyGetModel?>? onChanged;
  final String? initialValue;
  final List<CompanyGetModel> datas;

  const MyCompanyDropDown({
    Key? key,
    required this.txtcontroller,
    required this.hinttxt,
    this.dropwidth,
    this.onChanged,
    this.initialValue,
    required this.datas,
  }) : super(key: key);

  @override
  _MyCompanyDropDownState createState() => _MyCompanyDropDownState();
}

class _MyCompanyDropDownState extends State<MyCompanyDropDown> {
  CompanyGetModel? selectedCompany;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isWideScreen = width > 900;

    return SizedBox(
      width: isWideScreen ? width * 0.412 : width * 0.412,
      height: 60,
      child: SearchableDropdown<String>.paginated(
        isDialogExpanded: false,
        hintText: Text(widget.hinttxt),
        width: width * 0.4,
        margin: const EdgeInsets.all(15),
        paginatedRequest: (int page, String? searchKey) async {
          final companyList =
              await getCompanyList(page: page, searchKey: searchKey ?? "");
          return companyList
              .map((company) => SearchableDropdownMenuItem<String>(
                    value: company.companyName,
                    child: Text(company.companyName),
                    label: 'Select company',
                  ))
              .toList();
        },
        requestItemCount: 10, // Adjust as needed
        onChanged: (String? value) {
          setState(() {
            selectedCompany = value != null
                ? CompanyGetModel.fromJson(json.decode(value))
                : null;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(selectedCompany);
          }
        },
      ),
    );
  }

  Future<List<CompanyGetModel>> getCompanyList(
      {required int page, required String searchKey}) async {
    try {
      String url =
          "$ApiUrl/api/company?limit=10&page=$page&searchString=$searchKey";
      var response = await http.get(Uri.parse(url));

      print(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => CompanyGetModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load company list: ${response.statusCode}');
      }
    } catch (exception) {
      throw Exception('Failed to load company list: $exception');
    }
  }
}
