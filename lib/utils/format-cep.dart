String formatCEP(String cep) {
  final cleanCep = cep.replaceAll(RegExp(r'[^\d]'), '');

  if (cleanCep.length != 8) {
    return cep;
  }

  final firstPart = cleanCep.substring(0, 5);
  final secondPart = cleanCep.substring(5, 8);

  return '$firstPart-$secondPart';
}
