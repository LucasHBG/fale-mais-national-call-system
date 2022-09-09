import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/app_context_extension.dart';
import 'widgets/number_only_input_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _originDDD;
  late final TextEditingController _destinyDDD;

  String _dropdownPlanValue = "FaleMais 30";

  @override
  void initState() {
    _originDDD = TextEditingController();
    _destinyDDD = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _originDDD.dispose();
    _destinyDDD.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/fale_mais_logo.png",
                width: 365,
                height: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // First box which sets caller's DDD
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ORIGEM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      NumberOnlyRoundedInputBox(
                        context: context,
                        controller: _originDDD,
                        maxLengthTextInput: 2,
                      ),
                    ],
                  ),

                  // Second box which sets the caller's destiny DDD
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DESTINO',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      NumberOnlyRoundedInputBox(
                          context: context, controller: _destinyDDD),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MINUTOS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Minutes input TextField
                      InputMinutesTextField(context: context),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PLANO',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 140.0,
                          height: 50.0,
                          color: context.resources.color.colorNeutral,
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          alignment: AlignmentDirectional.center,
                          child: DropdownButtonFormField(
                            items: const [
                              DropdownMenuItem<String>(
                                value: "FaleMais 30",
                                child: Text("FaleMais 30"),
                              ),
                              DropdownMenuItem<String>(
                                value: "FaleMais 60",
                                child: Text("FaleMais 60"),
                              ),
                              DropdownMenuItem<String>(
                                value: "FaleMais 120",
                                child: Text("FaleMais 120"),
                              ),
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: context.resources.color.colorNeutralText
                                    .withOpacity(0.5),
                              ),
                            ),
                            value: _dropdownPlanValue,
                            onChanged: dropdownPlanCallback,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 200.0, maxHeight: 80.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4),
                      backgroundColor: MaterialStateProperty.all(
                          context.resources.color.colorAccent),
                    ),
                    child: Text(
                      "LIGAR",
                      style: TextStyle(
                          color: context.resources.color.colorAccentText),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: simulateCostsDataTable(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void dropdownPlanCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownPlanValue = selectedValue;
      });
    }
  }
}

class InputMinutesTextField extends StatelessWidget {
  const InputMinutesTextField({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: 80,
        height: 50,
        color: context.resources.color.colorNeutral,
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Ex: 20',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: context.resources.color.colorNeutralText.withOpacity(0.5),
            ),
          ),
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(5),
          ],
        ),
      ),
    );
  }
}

DataTable simulateCostsDataTable(BuildContext context) {
  return DataTable(
    columns: const <DataColumn>[
      DataColumn(label: Text('Tempo')),
      DataColumn(label: Text('Plano FaleMais')),
      DataColumn(label: Text('Com FaleMais'), numeric: true),
      DataColumn(label: Text('Sem FaleMais'), numeric: true),
    ],
    rows: const <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('20')),
          DataCell(Text('FaleMais 30')),
          DataCell(Text('\$ 0,00')),
          DataCell(Text('\$ 38,00')),
        ],
      ),
    ],
  );
}
