import 'package:flutter/material.dart';

class imcPage extends StatefulWidget {
  const imcPage({super.key});

  @override
  State<imcPage> createState() => _imcPageState();
}

class _imcPageState extends State<imcPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  var resultado = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Calculadora IMC",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: nomeController,
                      decoration: const InputDecoration(
                        label: Text("Nome"),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: alturaController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("Altura em metros"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: pesoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("Peso kg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Text(resultado)),
              TextButton(
                onPressed: () {
                  // peso/altura*altura
                  var altura = double.parse(alturaController.text.replaceAll(',', "."));
                  var peso = double.parse(pesoController.text.replaceAll(',', "."));

                  var imc = peso / (altura * altura);

                  setState(() {
                    resultado =
                        "O ${nomeController.text} seu IMC calculado é ${imc.round()}";
                  });
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                child: const Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
