import 'package:flutter/material.dart';

void main() {
  runApp(StockTrackerApp());
}

class StockTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockTrackerHomePage(),
    );
  }
}

class StockTrackerHomePage extends StatefulWidget {
  @override
  _StockTrackerHomePageState createState() => _StockTrackerHomePageState();
}

class _StockTrackerHomePageState extends State<StockTrackerHomePage> {
  String _productUrl = ''; // Kullanıcının girdiği ürün linki
  String _stockStatus = 'Bilinmiyor'; // Stok durumu başlangıç değeri
  bool _isTracking = false;

  // Ürün kontrol simülasyonu
  void _checkStockStatus() async {
    setState(() {
      _stockStatus = 'Kontrol ediliyor...';
    });

    // Simülasyon için gecikme
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      // Burada gerçek API çağrısını yapabilirsiniz.
      _stockStatus = 'Stokta var'; // Örnek sonuç
    });
  }

  // Stok takip etmeye başla
  void _startTracking() {
    setState(() {
      _isTracking = true;
    });

    // Belirli aralıklarla kontrol et (örnek: 10 saniyede bir)
    Future.doWhile(() async {
      if (!_isTracking) return false;
      _checkStockStatus();
      await Future.delayed(Duration(seconds: 10));
      return _isTracking;
    });
  }

  // Takibi durdur
  void _stopTracking() {
    setState(() {
      _isTracking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Ürün Linki',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _productUrl = value;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Stok Durumu: $_stockStatus',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            _isTracking
                ? ElevatedButton(
                    onPressed: _stopTracking,
                    child: Text('Takibi Durdur'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      if (_productUrl.isNotEmpty) {
                        _startTracking();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Lütfen bir ürün linki girin!'),
                          ),
                        );
                      }
                    },
                    child: Text('Takibi Başlat'),
                  ),
          ],
        ),
      ),
    );
  }
}