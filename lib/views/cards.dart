import 'package:appcards/models/cores.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/cardEdit');
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                //backgroundImage: AssetImage('assets/goku.jpg'),
                backgroundColor: azulGrowdev[900],
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: laranjaGrowdev,
                ),
              ),
              accountName: Text(
                'Édson L. M. Nunes',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                'edsonmartins3110@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/kame_house.jpg'),
              //     fit: BoxFit.cover,
              //     alignment: Alignment.bottomCenter,
              //   ),
              // ),
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () async {
                //final prefs = await SharedPreferences.getInstance();
                //prefs.remove('isLogged');
                Navigator.pushReplacementNamed(context, '/');
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              builCards(
                  numero: '1',
                  titulo: 'Um titulo qualquer para o card que...',
                  texto: '' +
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ' +
                      'Etiam eget ligula eu lectus lobortis condimentum. Aliquam ' +
                      'nonummy auctor massa. Pellentesque habitant morbi tristique ' +
                      'senectus et netus et malesuada fames ac turpis egestas. Nulla ' +
                      'at risus. Quisque purus magna, auctor et, sagittis ac, posuere ' +
                      'eu, lectus. Nam mattis, felis ut adipiscing.',
                  tituloBotao: 'Editar',
                  acao: () {}),
              builCards(
                  numero: '2',
                  titulo: 'Um titulo qualquer para o card',
                  texto: '' +
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ' +
                      'Etiam eget ligula eu lectus lobortis condimentum. Aliquam ' +
                      'nonummy auctor massa. Pellentesque habitant morbi tristique ' +
                      'senectus et netus et malesuada fames ac turpis egestas. Nulla ' +
                      'at risus. Quisque purus magna, auctor et, sagittis ac, posuere ' +
                      'eu, lectus. Nam mattis, felis ut adipiscing.',
                  tituloBotao: 'Editar',
                  acao: () {}),
              builCards(
                  numero: '3',
                  titulo: 'Um titulo qualquer para o card',
                  texto: 'Um conteúdo qualquer para nos testar',
                  tituloBotao: 'Editar',
                  acao: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

Widget builCards({
  required String numero,
  required String titulo,
  required String texto,
  required String tituloBotao,
  required void Function() acao,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: laranjaGrowdev, width: 3)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 240,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: laranjaGrowdev,
                      child: Text(
                        numero,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    titulo,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2.0, color: Colors.black38),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 110,
                child: Text(
                  texto,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.fade,
                  maxLines: 7,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      tituloBotao,
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: acao,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
