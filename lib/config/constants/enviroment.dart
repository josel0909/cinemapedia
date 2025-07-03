import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String movieDbKey = dotenv.env['THE_MOVIEDB_KEY']?? 'No ha definido key en THE_MOVIEDB_KEY';
}