# 📘 Handbook Flutter: Dasar-Dasar Pengembangan Aplikasi Mobile

## 🎯 1. Pengantar Flutter & Struktur Project

### Apa itu Flutter?

Flutter adalah framework open-source dari Google untuk membuat aplikasi native yang indah dan cepat untuk mobile, web, dan desktop dari satu codebase. Flutter menggunakan bahasa pemrograman Dart yang mudah dipelajari dan memiliki performa tinggi karena menggunakan mesin rendering sendiri.

### Keunggulan Flutter

- **Hot Reload**: Perubahan code langsung terlihat tanpa restart aplikasi
- **Cross-Platform**: Satu codebase untuk iOS, Android, web, dan desktop
- **Widget Rich**: Kumpulan widget yang lengkap dan customizable
- **Performance**: Kompilasi native ARM code untuk performa optimal

### Struktur Project Flutter

```vi
my_flutter_app/
├── android/          # File native Android (Java/Kotlin)
├── ios/              # File native iOS (Swift/Objective-C)
├── lib/              # Kode Dart utama (99% development di sini)
│   └── main.dart     # Entry point aplikasi
├── test/             # File testing (unit test, widget test)
├── assets/           # Gambar, font, file JSON, dll.
├── web/              # File untuk build web
└── pubspec.yaml      # Dependencies dan metadata project
```

### File `pubspec.yaml` - Jantungnya Project Flutter

File ini berisi konfigurasi project, dependencies, dan asset management:

```yaml
name: my_flutter_app
description: Aplikasi Flutter pertama saya untuk belajar dasar-dasar

version: 1.0.0+1 # Format: versionName+versionCode

environment:
  sdk: ">=3.0.0 <4.0.0" # Versi Dart SDK yang diperlukan

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2 # Icon library untuk iOS style
  http: ^1.1.0 # Package untuk HTTP requests

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0 # Static analysis untuk kode yang lebih baik

flutter:
  uses-material-design: true # Menggunakan Material Design
  assets:
    - assets/images/ # Path untuk gambar
    - assets/data/ # Path untuk data files
  fonts:
    - family: Roboto # Custom fonts
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
```

## Uji Coba Aplikasi Flutter Pertama

https://codelabs.developers.google.com/codelabs/flutter-codelab-first?hl=id#1

## 🧱 2. Widget Dasar Flutter

### Konsep Dasar Widget

Widget adalah building block dari aplikasi Flutter. Semua komponen UI adalah widget, dari text hingga layout. Flutter menggunakan composition over inheritance - widget kecil disusun menjadi widget yang lebih kompleks.

### Text Widget

Widget Text digunakan untuk menampilkan teks dengan berbagai style dan format.

**Implementasi Dasar:**

```dart
Text(
  'Selamat Datang di Flutter!',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue[800],
    fontFamily: 'Roboto',
  ),
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,  // Handle teks yang terlalu panjang
  maxLines: 2,  // Maksimal 2 baris
)
```

**Pengembangan Lebih Spesifik:**

```dart
// RichText untuk teks dengan multiple styles
RichText(
  text: TextSpan(
    text: 'Hello ',
    style: TextStyle(color: Colors.black, fontSize: 18),
    children: <TextSpan>[
      TextSpan(
        text: 'bold',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      TextSpan(text: ' world!'),
    ],
  ),
)

// Text dengan gradient
ShaderMask(
  shaderCallback: (bounds) => LinearGradient(
    colors: [Colors.red, Colors.blue],
  ).createShader(bounds),
  child: Text(
    'Gradient Text',
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
)
```

### Image Widget

Widget Image digunakan untuk menampilkan gambar dari berbagai sumber.

**Implementasi Dasar:**

```dart
// Image dari assets
Image.asset(
  'assets/images/logo.png',
  width: 200,
  height: 200,
  fit: BoxFit.contain,  // Cara gambar menyesuaikan container
)

// Image dari network dengan loading dan error handling
Image.network(
  'https://example.com/image.jpg',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error, color: Colors.red);
  },
)

// Circle avatar image
CircleAvatar(
  backgroundImage: AssetImage('assets/images/profile.jpg'),
  radius: 50,
)
```

### Row dan Column Widget

Row dan Column adalah widget layout untuk mengatur children secara horizontal (Row) dan vertikal (Column).

**Implementasi Row:**

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Spasi merata
  crossAxisAlignment: CrossAxisAlignment.center,      // Posisi vertikal
  mainAxisSize: MainAxisSize.max,                     // Gunakan semua space horizontal
  children: [
    Icon(Icons.star, color: Colors.yellow),
    Icon(Icons.star, color: Colors.yellow),
    Icon(Icons.star, color: Colors.yellow),
    Icon(Icons.star_half, color: Colors.yellow),
    Icon(Icons.star_border, color: Colors.yellow),
  ],
)
```

**Implementasi Column:**

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch,  // Anak widget memenuhi lebar
  children: [
    Text('Nama Produk', style: TextStyle(fontSize: 20)),
    SizedBox(height: 10),  // Spacer
    Text('Deskripsi produk yang panjang dan detail...',
         textAlign: TextAlign.center),
    SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {},
      child: Text('Beli Sekarang'),
    ),
  ],
)
```

**Layout Kompleks dengan Kombinasi Row dan Column:**

```dart
Column(
  children: [
    // Header dengan icon dan teks
    Row(
      children: [
        Icon(Icons.shopping_cart, size: 30),
        SizedBox(width: 10),
        Expanded(
          child: Text('Keranjang Belanja',
                      style: TextStyle(fontSize: 24)),
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    ),

    // List items
    Expanded(
      child: ListView(
        children: [
          ListTile(
            leading: Image.asset('assets/item1.jpg', width: 50),
            title: Text('Produk 1'),
            subtitle: Text('Rp 100.000'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          // More list items...
        ],
      ),
    ),

    // Footer dengan total harga
    Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total:', style: TextStyle(fontSize: 18)),
          Text('Rp 500.000',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  ],
)
```

### Container Widget

Container adalah widget serba guna untuk decorating, positioning, dan sizing child widget.

**Implementasi Dasar:**

```dart
Container(
  width: 200,
  height: 100,
  margin: EdgeInsets.all(16),      // Spasi di luar container
  padding: EdgeInsets.all(20),     // Spasi di dalam container
  decoration: BoxDecoration(
    color: Colors.blue[50],
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.blue,
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 8,
        offset: Offset(4, 4),
      ),
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue[100]!, Colors.blue[300]!],
    ),
  ),
  alignment: Alignment.center,     // Posisi child di tengah
  child: Text(
    'Container Indah',
    style: TextStyle(
      color: Colors.blue[900],
      fontWeight: FontWeight.bold,
    ),
  ),
)
```

### Stack Widget

Stack digunakan untuk menumpuk widget di atas widget lainnya, berguna untuk overlay, badges, dll.

**Implementasi Dasar:**

```dart
Stack(
  alignment: Alignment.center,  // Posisi default untuk children
  children: [
    // Background image
    Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),

    // Overlay gelap
    Container(
      color: Colors.black.withOpacity(0.4),
      height: 200,
      width: double.infinity,
    ),

    // Content di tengah
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Judul Banner',
             style: TextStyle(color: Colors.white, fontSize: 24)),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: Text('Explore Now'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
          ),
        ),
      ],
    ),

    // Badge di pojok kanan atas
    Positioned(
      top: 10,
      right: 10,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text('NEW',
               style: TextStyle(color: Colors.white, fontSize: 12)),
      ),
    ),
  ],
)
```

## 🧭 3. Navigasi & Multi-Screen App

### Konsep Navigasi

Navigasi adalah cara berpindah dari satu screen ke screen lainnya. Flutter menggunakan stack-based navigation dimana screen baru ditumpuk di atas screen sebelumnya.

**Basic Navigation dengan push/pop:**

```dart
// Navigasi ke screen baru
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailScreen()),
);

// Kembali ke screen sebelumnya
Navigator.pop(context);

// Navigasi dengan mengirim data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(product: selectedProduct),
  ),
);

// Navigasi dan menghapus semua screen sebelumnya
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
  (route) => false,  // Hapus semua routes
);
```

### Named Routes untuk Navigasi yang Terorganisir

```dart
// Define routes di MaterialApp
MaterialApp(
  title: 'My E-Commerce App',
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/products': (context) => ProductListScreen(),
    '/productDetail': (context) => ProductDetailScreen(),
    '/cart': (context) => CartScreen(),
    '/checkout': (context) => CheckoutScreen(),
    '/profile': (context) => ProfileScreen(),
  },
)

// Navigasi dengan named route
Navigator.pushNamed(context, '/products');

// Navigasi dengan arguments
Navigator.pushNamed(
  context,
  '/productDetail',
  arguments: {
    'productId': 123,
    'productName': 'Smartphone XYZ',
  },
);

// Menerima arguments di screen tujuan
class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final productId = args['productId'];
    final productName = args['productName'];

    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: // ... rest of the screen
    );
  }
}
```

### Contoh Lengkap Multi-Screen E-Commerce App

```dart
// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return ProductItem(
            productId: index,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/productDetail',
                arguments: {
                  'productId': index,
                  'productName': 'Product ${index + 1}',
                },
              );
            },
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        ],
      ),
    );
  }
}

// Product Detail Screen dengan stateful widget
class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;

  void _addToCart() {
    // Logic untuk menambah ke keranjang
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['productName']),
        actions: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/product_${args['productId']}.jpg'),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product ${args['productId'] + 1}',
                       style: TextStyle(fontSize: 24)),
                  SizedBox(height: 10),
                  Text('Rp 1.000.000',
                       style: TextStyle(fontSize: 20, color: Colors.green)),
                  SizedBox(height: 20),
                  Text('Deskripsi produk yang sangat menarik dan detail...'),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Quantity:'),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (_quantity > 1) {
                            setState(() {
                              _quantity--;
                            });
                          }
                        },
                      ),
                      Text('$_quantity'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _addToCart,
          child: Text('Add to Cart - Rp ${_quantity * 1000000}'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}
```

## ⚡ 4. State Management Dasar

### Konsep State dalam Flutter

State adalah data yang dapat berubah selama runtime aplikasi. Flutter memiliki dua jenis widget:

- **StatelessWidget**: Widget yang tidak memiliki state (immutable)
- **StatefulWidget**: Widget yang memiliki state yang dapat berubah (mutable)

### Stateful Widget dengan setState

**Implementasi Counter App:**

```dart
class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;
  String _message = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
      _updateMessage();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
      _updateMessage();
    });
  }

  void _updateMessage() {
    if (_counter == 0) {
      _message = 'Mulai menghitung!';
    } else if (_counter < 5) {
      _message = 'Masih sedikit...';
    } else if (_counter < 10) {
      _message = 'Sudah lumayan!';
    } else {
      _message = 'Wah, sudah banyak!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

### ListView Widget untuk Menampilkan Data Dinamis

**Implementasi List View dengan Data Dinamis:**

```dart
class TodoListApp extends StatefulWidget {
  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  final List<String> _todoItems = [];
  final TextEditingController _textController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
        _textController.clear();
      });
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        return _buildTodoItem(_todoItems[index], index);
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return Dismissible(
      key: Key('$todoText$index'),
      background: Container(color: Colors.red),
      onDismissed: (direction) => _removeTodoItem(index),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          title: Text(todoText),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => _removeTodoItem(index),
          ),
          onTap: () {
            // Edit functionality
            _showEditDialog(index, todoText);
          },
        ),
      ),
    );
  }

  void _showEditDialog(int index, String currentText) {
    final editController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(controller: editController),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _todoItems[index] = editController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          if (_todoItems.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_sweep),
              onPressed: () {
                setState(() {
                  _todoItems.clear();
                });
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'Add new task',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: _addTodoItem,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addTodoItem(_textController.text),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(child: _buildTodoList()),
        ],
      ),
    );
  }
}
```

### GridView Widget untuk Layout Berbasis Grid

**Implementasi Product Grid:**

```dart
class Product {
  final String name;
  final double price;
  final String imageUrl;
  final int stock;

  Product({required this.name, required this.price, required this.imageUrl, required this.stock});
}

class ProductGridApp extends StatefulWidget {
  @override
  _ProductGridAppState createState() => _ProductGridAppState();
}

class _ProductGridAppState extends State<ProductGridApp> {
  final List<Product> _products = [
    Product(name: 'Laptop', price: 12000000, imageUrl: 'assets/laptop.jpg', stock: 15),
    Product(name: 'Smartphone', price: 5000000, imageUrl: 'assets/phone.jpg', stock: 30),
    Product(name: 'Headphones', price: 800000, imageUrl: 'assets/headphones.jpg', stock: 25),
    Product(name: 'Keyboard', price: 600000, imageUrl: 'assets/keyboard.jpg', stock: 20),
    Product(name: 'Mouse', price: 300000, imageUrl: 'assets/mouse.jpg', stock: 40),
    Product(name: 'Monitor', price: 2500000, imageUrl: 'assets/monitor.jpg', stock: 10),
  ];

  final List<Product> _cart = [];
  int _selectedIndex = 0;

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} ditambahkan ke keranjang'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.image, size: 50),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Rp ${product.price.toStringAsFixed(0)}',
                      style: TextStyle(color: Colors.green[700]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Stok: ${product.stock}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => _addToCart(product),
                      child: Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 36),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Store'),
        actions: [
          Badge(
            label: Text('${_cart.length}'),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Navigate to cart screen
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _buildProductGrid(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
```

## ⌨️ 5. Input & Interaksi

### TextField Widget untuk Input Pengguna

**Implementasi Form Input yang Komprehensif:**

```dart
class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String _selectedGender = 'Laki-laki';
  DateTime _selectedDate = DateTime.now();
  bool _agreeToTerms = false;
  bool _showPassword = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      // Process form data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pendaftaran berhasil!'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap setuju dengan syarat dan ketentuan'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pendaftaran')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  if (value.length < 3) {
                    return 'Nama minimal 3 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: !_showPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Konfirmasi password tidak boleh kosong';
                  }
                  if (value != _passwordController.text) {
                    return 'Password tidak cocok';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Jenis Kelamin', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Radio(
                    value: 'Laki-laki',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                  ),
                  Text('Laki-laki'),
                  SizedBox(width: 20),
                  Radio(
                    value: 'Perempuan',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                  ),
                  Text('Perempuan'),
                ],
              ),
              SizedBox(height: 20),
              Text('Tanggal Lahir', style: TextStyle(fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                trailing: Icon(Icons.arrow_drop_down),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Show terms and conditions
                      },
                      child: Text(
                        'Saya menyetujui syarat dan ketentuan',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Daftar', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
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
```

### GestureDetector untuk Interaksi Kustom

**Implementasi Interactive Widget:**

```dart
class InteractiveWidget extends StatefulWidget {
  @override
  _InteractiveWidgetState createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget> {
  double _scale = 1.0;
  double _rotation = 0.0;
  Offset _position = Offset.zero;
  Color _color = Colors.blue;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _position += details.delta;
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = details.scale.clamp(0.5, 2.0);
      _rotation += details.rotation;
    });
  }

  void _changeColor() {
    setState(() {
      _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  void _reset() {
    setState(() {
      _scale = 1.0;
      _rotation = 0.0;
      _position = Offset.zero;
      _color = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interactive Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _changeColor,
              onDoubleTap: _reset,
              onPanUpdate: _onPanUpdate,
              onScaleUpdate: _onScaleUpdate,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(_position.dx, _position.dy)
                  ..scale(_scale)
                  ..rotateZ(_rotation),
                alignment: FractionalOffset.center,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.star,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Interaksi:\n'
              '- Tap: Ubah warna\n'
              '- Double tap: Reset\n'
              '- Drag: Pindahkan\n'
              '- Pinch: Zoom & rotate',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reset,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎓 6. Best Practices & Tips

### Tips Pengembangan

1. **Widget Composition**: Pisahkan widget besar menjadi widget kecil yang reusable
2. **const Constructor**: Gunakan const untuk widget yang tidak berubah
3. **Error Handling**: Selalu handle potential errors dengan try-catch
4. **Performance**: Gunakan ListView.builder untuk list yang panjang
5. **Code Organization**: Pisahkan kode berdasarkan feature/module

### Struktur Folder yang Disarankan:

```
lib/
├── models/          # Data models (Product, User, etc.)
├── widgets/         # Reusable widgets
│   ├── common/      # Common widgets
│   └── custom/      # Custom widgets
├── screens/         # Screen widgets
│   ├── home/        # Home screen related
│   ├── product/     # Product related screens
│   └── auth/        # Authentication screens
├── services/        # API services, database
├── utils/           # Utilities, helpers, constants
└── main.dart        # Entry point
```

## 📋 7. Checklist Pembelajaran

- [ ] Memahami perbedaan Stateless vs Stateful Widget
- [ ] Menguasai penggunaan setState untuk state management
- [ ] Dapat membuat dan mengelola ListView & GridView
- [ ] Mengimplementasikan form dengan validasi
- [ ] Memahami berbagai jenis input dan interaksi
- [ ] Dapat membuat navigasi multi-screen

## 🚀 Next Steps

Setelah menguasai dasar-dasar ini, lanjutkan dengan:

- **Advanced State Management**: Provider, Riverpod, Bloc
- **API Integration**: HTTP requests, REST API, GraphQL
- **Local Storage**: SharedPreferences, SQLite, Hive
- **Firebase Integration**: Authentication, Firestore, Cloud Functions
- **Animations**: Custom animations, page transitions
- **Testing**: Unit test, widget test, integration test

**Selamat Belajar dan Happy Coding!** 🎉
