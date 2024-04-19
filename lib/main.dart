
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Imc(),
    )
  );
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String inform = "Informe seus dados";

  void resetCampos()
  {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      inform = "Informe seus dados";
    });
  }

  void calcular()
  {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);

      // print do imc
      if(imc < 18.5)
      {
        inform = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9)
      {
        inform = "Peso Normal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25 && imc <= 29.9)
      {
        inform = "Sobrepeso (${imc.toStringAsPrecision(3)})";
      } else if(imc >= 30 && imc <= 34.9)
      {
        inform = "Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
      } else 
      {
        inform = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: resetCampos, icon: Icon(Icons.refresh, color: Colors.white,))
        ],
      ),

      body: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.person_outlined, size: 120, color: Colors.green,),
          
          TextField(
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              labelText: "Peso(Kg)",
              labelStyle: TextStyle(color: Colors.green),
            ),  
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
            controller:pesoController,
          ),

          TextField(
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              labelText: "Altura(cm)",
              labelStyle: TextStyle(color: Colors.green),
            ),  
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
            controller:alturaController,
          ),

          ElevatedButton(
            onPressed: calcular, 
            child: Text("Calcular"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: TextStyle(color: Colors.white, fontSize: 25)
            )
          ),

          Text(inform,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25),
          )

        ],
      )
      )
    );
  }
}