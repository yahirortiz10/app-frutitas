class v1 {
  final String producto;
  final String precio;
  final String cantidad;

  v1({required this.producto, required this.precio, required this.cantidad});

  factory v1.fromJson(Map<String, dynamic> json) {
    return v1(
        producto: json["producto"],
        precio: json["precio"],
        cantidad: json["cantidad"]);
  }
}
