import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datepicker extends StatefulWidget {
  const Datepicker({Key? key}) : super(key: key);

  @override
  State<Datepicker> createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      readOnly: true,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.event),
        labelText: "Date",
        hintText: "Date",
      ),
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialDate: DateTime.now(),
          selectableDayPredicate: (day) => day.isBefore(DateTime.now()),
        );
        if (selectedDate != null) {
          setState(() {
            _dateController.text = DateFormat.yMd().format(selectedDate);
          }

          );
        }

        ;
      }
      ,

    );
  }

}
