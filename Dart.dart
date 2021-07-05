import 'dart:convert'; //constructor Json

void main() {
  var nombre1 = 'Carlos';
  print('Hola, $nombre1');

  int empleados = 10;
  double pi = 3.141592654;
  var numero = 1.0;

  String nombre = 'Carlos';
  print(nombre[0]);
  print(nombre[nombre.length - 1]);

  bool activado = true;
  if (!activado) {
    print('Motor ON');
  } else {
    print('Motor OFF');
  }

  List<int> numeros_ = [
    1,
    2,
    3,
    4,
    5
  ]; // dynamico puede ser cualquier tipo de dato
  numeros_.add(6);
  print(numeros_);

  List masNumeros = List(10);
  //masNumeros.add(1); //no puede ser ejecutado
  masNumeros[0] = 1;
  print(masNumeros);

  Map<String, dynamic> persona = {
    'nombre': 'Carlos',
    'edad': 28,
    'soltero': false
  };
  String nombre2 = persona['nombre'];
  print("Tu nombre es: $nombre2");
  persona.addAll({'ocupacion': 'developer'});
  print(persona);

  Saludar('Carlos');
  var suma = 5 + numero1();
  print(suma);

  //Clase
  //final leon = new Carro('1.8L','gris'); //constante o dato que nunca cambiara
  //print(leon.motor);
  //print(leon.color);

  //CLASE FromJson
  final rawJson = '{ "motor": "1.8L", "color": "gris"}';
  Map parsedJson = json.decode(rawJson);
  final leon = new Carro.fromJson(parsedJson);
  print(leon.motor);
  print(leon.color);

  //Getters y setters
  final cuadrado = new Cuadrado();
  cuadrado.lado = 10.0;
  print(cuadrado);
  print('El area es: ${cuadrado.area}');

  //claseAbtracta
  final perro = Perro();
  perro.emitirSonido();

  //Future
  mainFuture();
}

void Saludar(nombre) {
  print('Hola, $nombre!');
}

int numero1() => 5; //la flecha significa return

class Carro {
  //metodo esta dentro de una clase y funcion fuera
  //Propiedades
  String motor = '';
  String color = '';

  //Constructor
  Carro(this.motor, this.color); //debe de tener el mismo name que la clase
  //Constructor con nombre (Json)
  Carro.fromJson(Map parsedJson) {
    motor = parsedJson['motor'];
    color = parsedJson['color'];
  }

  String toString() => '${this.motor} - ${this.color}';
}

//Getters y setters
class Cuadrado {
  double _lado = 0.0; //variable privada

  set lado(double valor) {
    if (valor <= 0) {
      throw ('El lado no puede menor o cero');
    }
    _lado = valor;
  }

  double get area => _lado * _lado;

  toString() => 'El lado es: $_lado';
}

//clase abstracta
abstract class Animal {
  int patas = 0;

  void emitirSonido();
}

class Perro implements Animal {
  int patas = 0;
  int colas = 0;

  void emitirSonido() => print('Guau!');
}

//Future
void mainFuture() async {
  //Future
  print('Inicio, solicitando datos...');
  String data = await httpGet('https://nasa.com/aliens');
  print(data);
  print('Fin');
}

Future<String> httpGet(String url) {
  return Future.delayed(new Duration(seconds: 4), () {
    return 'Datos enviados';
  });
}
