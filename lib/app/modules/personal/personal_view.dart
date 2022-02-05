import 'package:flutter/material.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'personal_controller.dart';

class PersonalView extends GetView<PersonalController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meus Dados'),
          backgroundColor: Colors.green[300],
          elevation: 1,
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.save_rounded,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Theme(
                        data: ThemeData(hintColor: Colors.grey),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Digite seu nome...',
                            labelText: 'Nome',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Theme(
                        data: ThemeData(hintColor: Colors.grey),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Digite seu cpf...',
                            labelText: 'CPF',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Theme(
                        data: ThemeData(hintColor: Colors.grey),
                        child: Obx(
                          () => DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Selecione o sexo...',
                              labelText: 'Sexo',
                            ),
                            isExpanded: true,
                            value: controller.f3.value,
                            items: controller.listOptions
                                .map(
                                  (String value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ),
                                )
                                .toList(),
                            onChanged: (v) => controller.f3.value = v,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Theme(
                        data: ThemeData(hintColor: Colors.grey),
                        child: DateTimeField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Digite sua data de nascimento...',
                            labelText: 'Data de Nascimento',
                            suffixIcon: Icon(Icons.date_range),
                          ),
                          format: DateFormat("dd/MM/yyyy"),
                          onShowPicker: (_, value) => showDatePicker(
                            context: _,
                            firstDate: DateTime(1920),
                            initialDate: value ?? DateTime.now(),
                            lastDate: DateTime(2050),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Theme(
                        data: ThemeData(hintColor: Colors.grey),
                        child: TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Sobre você...',
                            labelText: 'Sobre',
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
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
