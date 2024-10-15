import 'dart:io';

// Ürün sınıfı
class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

// Alışveriş Sepeti sınıfı
class ShoppingCart {
  double totalAmount = 0.0;
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product); //Listeye ürünün eklenmesi
    totalAmount += product.price; //Net tutarın hesaplanması
  }

  void displayProducts() {
    //Liste ile ürünlerin ve toplam tutarın gösterilmesi
    print('Eklenen Ürünler:');
    for (var product in products) {
      print('Ürün: ${product.name}, Fiyat: ${product.price}');
    }
    print('Toplam Tutar: $totalAmount');
  }
}

void main() {
  int age;
  String customerNumber;

  stdout.write('Yaşınızı girin: ');
  age = int.parse(stdin.readLineSync()!);

  stdout.write('Müşteri numaranızı girin: ');
  customerNumber = stdin.readLineSync()!;

  // Yaşa göre indirim miktarını hesapla
  double discount;
  if (age < 18) {
    discount = 0.10;
  } else if (age >= 18 && age <= 60) {
    discount = 0.05;
  } else {
    discount = 0.15;
  }

  ShoppingCart cart =
      ShoppingCart(); //ShoppingCart sınıfından cart nesnesinin oluşturulması

  while (true) {
    stdout.write('Ürün adını girin (çıkmak için "q" yazın): ');
    String productName = stdin.readLineSync()!;
    if (productName.toLowerCase() == 'q') {
      break;
    }

    stdout.write('Fiyatı girin: ');
    double productPrice = double.parse(stdin.readLineSync()!);

    Product product = Product(productName, productPrice);
    cart.addProduct(product);
    cart.displayProducts();
  }

  // Toplam tutara indirimi uygula
  double finalAmount = cart.totalAmount - (cart.totalAmount * discount);

  print('Müşteri Numarası: $customerNumber');
  print('Uygulanan indirim: ${discount * 100}%');
  print('Ödenecek toplam tutar: $finalAmount');
}
