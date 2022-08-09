class v2 {
  final String cliente;
  final String nombre;
  final String telefono;

  v2({required this.cliente, required this.nombre, required this.telefono});

  factory v2.fromJson(Map<String, dynamic> json) {
    return v2(
        cliente: json["cliente"],
        nombre: json["nombre"],
        telefono: json["telefono"]);
  }
}
