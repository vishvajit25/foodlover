import 'package:flutter/material.dart';

class TabletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('FoodLover - Tablet'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add Tablet-specific widgets here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tablet View',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Item ${index + 1}'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
