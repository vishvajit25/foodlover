import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mobile_view.dart';
import 'tablet_view.dart';
import 'desktop_view.dart';

void main() {
  runApp(FoodLoverApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 1200) {
      return DesktopView();
    } else if (width >= 600) {
      return TabletView();
    } else {
      return MobileView();
    }
  }
}

class FoodLoverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodLover',
      theme: ThemeData(
        primarySwatch: blackMaterialColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: RestaurantHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

const MaterialColor blackMaterialColor = MaterialColor(
  0xFF000000,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(0xFF000000),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

class RestaurantHomePage extends StatefulWidget {
  @override
  _RestaurantHomePageState createState() => _RestaurantHomePageState();
}

class _RestaurantHomePageState extends State<RestaurantHomePage> {
  final ScrollController _scrollController = ScrollController();
  String selectedCategory = 'All';

  final List<Map<String, String>> foodItems = [
    {
      'name': 'Paneer Butter Masala',
      'image':
          'https://media.istockphoto.com/id/1463279736/photo/cheese-cottage-curry.jpg?s=1024x1024&w=is&k=20&c=e8ipACb0vIXOlXiWJwWebVSnXDTsISyogrGZ4Zb8g3k=',
      'price': '₹200',
      'category': 'Main Course'
    },
    {
      'name': 'Chicken Biryani',
      'image':
          'https://media.istockphoto.com/id/479660444/photo/shrimps-curry-with-rice-on-plate-horizontal-view-from-above.jpg?s=1024x1024&w=is&k=20&c=LlwTpnFVCT4sV7gDH2QuQ96syMhviDMiAMpJJEYtPog=',
      'price': '₹200',
      'category': 'Main Course'
    },
    {
      'name': 'Chocolate Cake',
      'image':
          'https://media.istockphoto.com/id/1370520449/photo/slice-of-chocolate-cake-with-glaze.jpg?s=1024x1024&w=is&k=20&c=bJfEJGn76XIw13A1fKRYKywbVvQ8th5Ece8TwuU6m18=',
      'price': '₹150',
      'category': 'Dessert'
    },
    {
      'name': 'Pizza Margherita',
      'image':
          'https://media.istockphoto.com/id/1168754685/photo/pizza-margarita-with-cheese-top-view-isolated-on-white-background.jpg?s=1024x1024&w=is&k=20&c=Ybp1mNRr-a1PqiIa09aMl3aboUC1LP_ITXdoE8ln9t8=',
      'price': '₹250',
      'category': 'Main Course'
    },
    {
      'name': 'Caesar Salad',
      'image':
          'https://media.istockphoto.com/id/1454741285/photo/roast-fish-and-vegetable-salad-on-wooden-background.jpg?s=1024x1024&w=is&k=20&c=wdcyonmdYE1vfBV-xmUoLP0QNbD6c_x816x4dESFBkk=',
      'price': '₹180',
      'category': 'Appetizer'
    },
    {
      'name': 'Spring Rolls',
      'image':
          'https://media.istockphoto.com/id/1371154829/photo/fried-spring-roll-with-chicken-vietnamese-food-top-view.jpg?s=1024x1024&w=is&k=20&c=8hQc7OESdeKPzNzN3LdqCqhb3zhYSYNI2Y9biKaANQ0=',
      'price': '₹120',
      'category': 'Appetizer'
    },
    {
      'name': 'Tiramisu',
      'image':
          'https://media.istockphoto.com/id/1248489319/photo/tiramisu-cake-with-mint.jpg?s=1024x1024&w=is&k=20&c=q6XRuaBTAGtNF5BLak0Y_ZL_f-33HsIJTJEDhQrVVJA=',
      'price': '₹180',
      'category': 'Dessert'
    },
    {
      'name': 'Pasta Carbonara',
      'image':
          'https://media.istockphoto.com/id/1581084025/photo/plate-with-spaghetti-carbonara-on-a-laid-table.jpg?s=1024x1024&w=is&k=20&c=DZc8mPKV15Ymdi_32EwsiIHKi52K9DXLDct2Ufm_AGg=',
      'price': '₹220',
      'category': 'Main Course'
    },
    {
      'name': 'Garlic Bread',
      'image':
          'https://media.istockphoto.com/id/1181825866/photo/garlic-bread-on-rustic-wooden-table.jpg?s=1024x1024&w=is&k=20&c=BRLii6tRtvkzRbwYFeDSCCtULDxQwRwpHBwx7nPFIak=',
      'price': '₹80',
      'category': 'Appetizer'
    },
    {
      'name': 'Lemon Meringue Pie',
      'image':
          'https://media.istockphoto.com/id/471687339/photo/lemon-meringue-pie.jpg?s=1024x1024&w=is&k=20&c=q5_0zq9Lc9qXahoCGCKwwPCXp3Ak06KdCVREF5_u3_I=',
      'price': '₹150',
      'category': 'Dessert'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    int gridCount;
    double imageSize;

    if (width >= 1200) {
      // Desktop
      gridCount = 4; // 4 items per row
      imageSize = 190; // Larger image size
    } else if (width >= 600) {
      // Tablet
      gridCount = 3; // 3 items per row
      imageSize = 160; // Medium image size
    } else if (width >= 400) {
      gridCount = 2; // 3 items per row
      imageSize = 80; // Small image size
    } else {
      // Mobile
      gridCount = 1; // 2 items per row
      imageSize = 160; // Medium image size
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'FoodLover',
            style: TextStyle(
              fontSize: width >= 1200 ? 24 : (width >= 600 ? 20 : 18),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => _scrollToSection(0),
              child: Text('Home', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(1),
              child: Text('Stats', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(2),
              child:
                  Text('Special Dishes', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(3),
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(4),
              child: Text('Contact', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Stack(
                children: [
                  Image.network(
                    'https://static.vecteezy.com/system/resources/previews/026/396/677/non_2x/flat-catering-logo-templates-free-vector.jpg',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to FoodLover',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                width >= 1200 ? 36 : (width >= 600 ? 30 : 24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Where Taste Meets the Soul',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                width >= 1200 ? 24 : (width >= 600 ? 18 : 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Stats Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DynamicCounter(title: 'Dishes', start: 1, end: 250),
                    DynamicCounter(
                        title: 'Happy Customers', start: 100, end: 20000),
                    DynamicCounter(title: 'Branches', start: 1, end: 22),
                  ],
                ),
              ),

              // Special Dishes Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Special Dishes',
                      style: TextStyle(
                        fontSize: width >= 1200 ? 24 : (width >= 600 ? 20 : 18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            gridCount, // Adjust the grid for 2 items per row
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: 3, // Show only 3 items
                      itemBuilder: (context, index) {
                        var item = foodItems[index]; // Only the first 3 items
                        return FoodItemCard(
                          item: item,
                          imageSize: imageSize, // Pass the image size
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Menu Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: width >= 1200 ? 24 : (width >= 600 ? 20 : 18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              setState(() => selectedCategory = 'All'),
                          child: Text('All'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              setState(() => selectedCategory = 'Main Course'),
                          child: Text('Main Course'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              setState(() => selectedCategory = 'Appetizer'),
                          child: Text('Appetizer'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              setState(() => selectedCategory = 'Dessert'),
                          child: Text('Dessert'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Food Items Grid Section for Menu
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCount,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: foodItems
                      .where((item) =>
                          selectedCategory == 'All' ||
                          item['category'] == selectedCategory)
                      .length,
                  itemBuilder: (context, index) {
                    var item = foodItems
                        .where((item) =>
                            selectedCategory == 'All' ||
                            item['category'] == selectedCategory)
                        .toList()[index];
                    return FoodItemCard(
                      item: item,
                      imageSize: imageSize,
                    );
                  },
                ),
              ),

              // Contact Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContactDetail(
                          title: 'Phone',
                          content: '123-456-7890',
                        ),
                        ContactDetail(
                          title: 'Email',
                          content: 'info@foodlover.com',
                        ),
                        ContactDetail(
                          title: 'Address',
                          content: '123 Food Street, City',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // Scroll function
  void _scrollToSection(int index) {
    double offset = 0;
    switch (index) {
      case 1:
        offset = 100;
        break;
      case 2:
        offset = 500;
        break;
      case 3:
        offset = 800;
        break;
      case 4:
        offset = 2400;
        break;
    }
    _scrollController.animateTo(offset,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }
}

// DynamicCounter
class DynamicCounter extends StatefulWidget {
  final String title;
  final int start;
  final int end;

  const DynamicCounter(
      {required this.title, required this.start, required this.end});

  @override
  _DynamicCounterState createState() => _DynamicCounterState();
}

class _DynamicCounterState extends State<DynamicCounter> {
  late int currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.start;
    _animateCounter();
  }

  void _animateCounter() async {
    for (int i = widget.start; i <= widget.end; i++) {
      await Future.delayed(Duration(milliseconds: 10));
      if (mounted) {
        setState(() {
          currentValue = i;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '$currentValue',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// Food Item Card Widget
class FoodItemCard extends StatelessWidget {
  final Map<String, String> item;
  final double imageSize;

  const FoodItemCard({Key? key, required this.item, required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 4,
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                item['image']!,
                width: imageSize * 1.1,
                height: imageSize * 1.1,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
              Text(
                item['name']!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2),
              Text(
                item['category']!,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 4),
              MouseRegion(
                onEnter: (_) {},
                onExit: (_) {},
                child: Text(
                  item['price']!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to handle price visibility
void showPrice(String price) {
  print('Price: $price');
}

void hidePrice() {
  print('Hide price');
}

// ContactDetail Widget for contact information
class ContactDetail extends StatelessWidget {
  final String title;
  final String content;

  const ContactDetail({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(content),
      ],
    );
  }
}
