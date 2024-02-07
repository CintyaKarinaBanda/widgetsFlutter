import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Aplicación con Diseño'),
          backgroundColor: Colors.teal,
        ),
        body: const MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Encabezado - Widget de Diseño
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Bienvenido a mi aplicación',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Widget básico - Card
          Card(
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.star, color: Colors.yellow),
              title: const Text('Item 1'),
              subtitle: const Text('Descripción del Item 1'),
              onTap: () {
                // Acción al tocar el ListTile
                _mostrarMensaje(context, 'Tocaste el ListTile');
              },
            ),
          ),
          // Espaciado
          const SizedBox(height: 20),
          // Widget de diseño - Container con imagen
          GestureDetector(
            onTap: () {
              // Acción al tocar la imagen
              _mostrarMensaje(context, 'Tocaste la imagen de fondo');
            },
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/564x/96/2d/fe/962dfe6c83f7094a87884412c2af9ae4.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Imagen de Fondo',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Espaciado
          const SizedBox(height: 20),
          // Widget básico - ElevatedButton
          ElevatedButton(
            onPressed: () {
              // Acción al presionar el botón
              _mostrarMensaje(context, 'Presionaste el botón');
            },
            child: const Text('Presionar'),
          ),
        ],
      ),
    );
  }

  void _mostrarMensaje(BuildContext context, String mensaje) {
    // Función para mostrar un SnackBar con el mensaje
    final snackBar = SnackBar(content: Text(mensaje));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
