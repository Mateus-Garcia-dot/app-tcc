import 'package:uuid/uuid.dart';

class Linha {
  String id;
  String COD;
  String NOME;
  String SOMENTE_CARTAO;
  String NOME_COR;

  Linha({
    required this.id,
    required this.COD,
    required this.NOME,
    required this.NOME_COR,
    required this.SOMENTE_CARTAO,
  });


  Linha.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        COD = map['COD'],
        NOME = map['NOME'],
        NOME_COR = map['NOME_COR'],
        SOMENTE_CARTAO = map['SOMENTE_CARTAO'];

  @override
  String toString() {
    return "$id \COD: $COD";
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'COD': COD,
      'NOME': NOME,
      'NOME_COR': NOME_COR,
      'SOMENTE_CARTAO': SOMENTE_CARTAO,
    };
  }
}
