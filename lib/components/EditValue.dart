import 'package:flutter/material.dart';

class EditValue extends StatefulWidget {
  final String oldValue;
  final String label;
  final Function onChange;
  EditValue(
      {@required this.oldValue, @required this.label, @required this.onChange});
  @override
  _EditValueState createState() => _EditValueState();
}

class _EditValueState extends State<EditValue> {
  final _formKey = GlobalKey<FormState>();
  final controllerText = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerText.text = widget.oldValue;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controllerText,
            decoration: InputDecoration(labelText: widget.label),
            validator: (value) {
              if (value.isEmpty) {
                return 'Inserire il valore';
              }
              return null;
            },
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  widget.onChange(controllerText.text);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
