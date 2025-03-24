// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

enum _STORAGE_CHAVES {
  NOME,
  PESO,
  ALTURA,
  IMC_CALCULADO,
}

class AppStorageService {
  setNome(String nome) async {
    _setString(_STORAGE_CHAVES.NOME.toString(), nome);
  }

  Future<String> getNome() async {
    return await _getString(_STORAGE_CHAVES.NOME.toString());
  }

  setImc(String imc) async {
    _setString(_STORAGE_CHAVES.IMC_CALCULADO.toString(), imc);
  }

    Future<String> getImc() async {
    return await _getString(_STORAGE_CHAVES.IMC_CALCULADO.toString());
  }

  _setString(String chave, String valor) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(chave, valor);
  }

  Future<String> _getString(String chave) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(chave) ?? "";
  }

  Future<double> _getDouble(String chave) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(chave) ?? 0;
  }

  _setDouble(String chave, double valor) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble(chave, valor);
  }
}
