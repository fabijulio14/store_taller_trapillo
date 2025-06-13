class Producto {
  //final String id;
  final String nombre;
  final String descripcion;
  final String imagen;
  final double precio;
  final bool destacado;

  Producto({
    //required this.id,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    required this.precio,
    this.destacado = false,
  });

  // Ejemplo de método para crear un Producto desde un mapa (por ejemplo, de JSON)
  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      //id: map['id'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      imagen: map['imagen'],
      precio: map['precio'].toDouble(),
      destacado: map['destacado'] ?? false,
    );
  }

  // Ejemplo de método para convertir un Producto a un mapa
  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'imagen': imagen,
      'precio': precio,
      'destacado': destacado,
    };
  }
}
