import 'package:appcards/models/cores.dart';
import 'package:flutter/material.dart';

class CardEdit extends StatefulWidget {
  CardEdit({Key? key}) : super(key: key);

  @override
  _CardEditState createState() => _CardEditState();
}

class _CardEditState extends State<CardEdit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Card: Novo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    buildInput(
                      label: 'Titulo',
                      validator: (_) {},
                      onSaved: (_) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildInput(
                      label: 'Conteúdo',
                      validator: (_) {},
                      onSaved: (_) {},
                      tipotexto: TextInputType.multiline,
                      linhas: 10,
                    ),
                  ],
                ),
              ),
              Align(
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: Builder(builder: (ctx) {
                    var isLoading = false;
                    return ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        primary: laranjaGrowdev,
                      ),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              'Salvar',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput({
    required String label,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
    TextEditingController? controller,
    TextInputType? tipotexto,
    int? linhas,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        counterStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      style: TextStyle(
        color: Colors.grey,
      ),
      cursorColor: Colors.grey,
      cursorWidth: 4,
      keyboardType: tipotexto,
      maxLines: linhas,
    );
  }
}
