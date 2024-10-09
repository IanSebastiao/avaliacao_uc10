import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppVidaPage extends StatefulWidget {
  const AppVidaPage({super.key});

  @override
  State<AppVidaPage> createState() => _AppVidaPageState();
}

class _AppVidaPageState extends State<AppVidaPage> {
  String resultFaseDaVida = '';

  TextEditingController idadeController = TextEditingController();

  determinarFaseDaVida() {
    int idade = int.parse(idadeController.text);

    if (idade < 3) {
      resultFaseDaVida = 'Infância';
    } else if (idade >= 3 && idade <= 12) {
      resultFaseDaVida = 'Pré-adolescência';
    } else if (idade >= 13 && idade <= 19) {
      resultFaseDaVida = 'Adolescência';
    } else if (idade >= 20 && idade <= 35) {
      resultFaseDaVida = 'Juventude';
    } else if (idade >= 36 && idade <= 55) {
      resultFaseDaVida = 'Meia-idade"';
    } else if (idade >= 56 && idade <= 130) {
      resultFaseDaVida = 'Terceira Idade';
    } else {
      resultFaseDaVida = 'Idade Inválida';
    }

    setState(() {
      resultFaseDaVida;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fase da Vida',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 23, 255),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: 300), // Largura máxima de 300
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: idadeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Idade',
                    labelStyle: const TextStyle(fontSize: 18),
                    prefixIcon:
                        const Icon(Icons.person), // Ícone de altura à esquerda
                  ), //inputFormatters
                  inputFormatters: [
                    FilteringTextInputFormatter
                        .digitsOnly, //Permite apenas números
                  ],
                  onSubmitted: (value) => determinarFaseDaVida(),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: determinarFaseDaVida,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Calcular Tempo de Vida',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 32),
                resultFaseDaVida == ''
                    ? const Text('')
                    : Text(
                        'Você está na: $resultFaseDaVida',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
