import 'package:flutter/material.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<List> screens = [
      ["Productos", "listProduct", Icons.inventory],
      ["Categorías", "listCategory", Icons.category],
      ["Proveedores", "listProvider", Icons.person]
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SimpleUpperBar(
          screenName: "Inicio",
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ListView.builder(
          itemCount: screens.length,
          itemBuilder: (context, index) {
            final screen = screens[index];
            return ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Icon(screen[2]),
                  ),
                  Text(screen[0]),
                  const Expanded(child: Text("")),
                  const Icon(Icons.navigate_next)
                ],
              ),
              onTap: () => Navigator.pushNamed(context, screen[1]),
            );
          },
        ),
      ),
    );
  }
}
