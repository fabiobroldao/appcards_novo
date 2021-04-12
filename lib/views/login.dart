import 'package:appcards/models/cores.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isLoading = false;
  var showPass = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  String? email;
  String? pass;

  bool _isCheck = true;

  void doLogin(ctx) {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState?.save();

    Navigator.of(context).pushReplacementNamed('/cards');
  }

  void showFailureLogin() async {
    showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: Text('Ops, algo deu errado!'),
          contentPadding: EdgeInsets.all(20),
          children: [
            Text('Usuário ou senha inválidos, Tente novamente'),
          ],
        );
      },
    );
  }

  void showSnackBar(String text, _) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Container(
            color: azulGrowdev,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 45, 15, 25),
              child: Container(
                color: azulGrowdev[300],
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Image.asset(
                          'assets/growdev_branco.png',
                          scale: 3.2,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Novo por aqui? ',
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                                child: Text("Crie a sua conta aqui",
                                    style: TextStyle(
                                        //decoration: TextDecoration.underline,
                                        color: laranjaGrowdev)),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/CadUsuario');
                                }),
                          ],
                        ),
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildInput(
                              cor: azulGrowdev.shade900,
                              icon: Icons.mail,
                              label: 'E-mail',
                              validator: (value) {
                                if (!EmailValidator.validate(value!)) {
                                  return 'E-mail inválido';
                                }

                                return null;
                              },
                              onSaved: (value) => email = value,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            buildInput(
                              cor: azulGrowdev.shade900,
                              icon: Icons.lock,
                              label: 'Password',
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Senha inválida';
                                }

                                return null;
                              },
                              onSaved: (value) => pass = value,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor:
                                            azulGrowdev[900]),
                                    child: Checkbox(
                                        autofocus: true,
                                        visualDensity: VisualDensity.compact,
                                        activeColor: azulGrowdev[900],
                                        value: _isCheck,
                                        onChanged: (value) {
                                          setState(() {
                                            _isCheck = value!;
                                          });
                                        }),
                                  ),
                                ),
                                Text(
                                  'Mantenha-me conectado',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Builder(builder: (ctx) {
                                  return ElevatedButton(
                                    onPressed:
                                        isLoading ? null : () => doLogin(ctx),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      primary: laranjaGrowdev,
                                    ),
                                    child: isLoading
                                        ? CircularProgressIndicator()
                                        : Text(
                                            'Entrar',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                  );
                                }),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInput({
    required String label,
    required IconData icon,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
    TextEditingController? controller,
    bool obscureText = false,
    required Color cor,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText && !showPass,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        fillColor: cor,
        filled: true,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: cor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: cor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        counterStyle: TextStyle(
          color: Colors.white,
        ),
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  showPass ? Icons.visibility : Icons.visibility_off,
                  //color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    showPass = !showPass;
                  });
                },
              )
            : IconButton(
                icon: Icon(
                  icon,
                  //color: Colors.white,
                ),
                onPressed: () {},
              ),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      cursorWidth: 4,
      cursorRadius: Radius.circular(10),
      keyboardType: TextInputType.text,
    );
  }
}
