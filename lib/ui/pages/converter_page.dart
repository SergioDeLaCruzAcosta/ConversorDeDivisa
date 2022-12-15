import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../widgets/key_pad.dart';
import '../widgets/selection_item.dart';

// un widget con estado en el cual mantenemos los dos indices mayores
// de las monedas que vamos a convertir
class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  // el estado del widget
  int currency1 = 1;
  int currency2 = 0;

  //   función para construir el selector de monedas
  List<Widget> _buildItems() {
    return currencies
        .map((val) => SelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // El siguiente widget en el arbol es el Scaffold
    return Scaffold(
        backgroundColor: const Color.fromRGBO(187, 81, 181, 1.00),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(147, 17, 126, 1),
            elevation: 20,
            
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),

            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/Logo.png',
                scale: 1.5,
              ),
              const Text(
                '   Combertidor de monedas ',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),
              )
            ]
            )
            ),
        body: Column(
          
          children: [
          Row(
            children: [
              Expanded(
                // selector para la primera moneda
                child: DirectSelect(
                    itemExtent: 45.0,
                    selectedIndex: currency1,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onSelectedItemChanged: (index) {
                      // aquí cambiamos el estado del widget
                      setState(() {
                        currency1 = index ?? 0;
                      });
                    },
                    items: _buildItems(),
                    child: SelectionItem(
                      isForList: false,
                      title: currencies[currency1],
                    )),
              ),
              Expanded(
                // selector para la segunda moneda
                child: DirectSelect(
                    
                    
                    itemExtent: 45.0,
                    selectedIndex: currency2,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onSelectedItemChanged: (index) {
                      // aquí cambiamos el estado del widget
                      setState(() {
                        currency2 = index ?? 0;
                      });
                    },
                    items: _buildItems(),
                    child: SelectionItem(
                      isForList: false,
                      title: currencies[currency2],
                    )),
              ),
            ],
          ),
          Expanded(
            // los nombres de las monedas se pueden obtener en la lista currencies
            // la tasa de cambio se puede obtener en la estructura de datos rates

            child: KeyPad(
                textCurrency1: currencies[currency1],
                textCurrency2: currencies[currency2],
                rate: rates[currency1][currency2]),
          )
        ]));
  }
}
