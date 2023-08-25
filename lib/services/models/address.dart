class Address {
  final String id;
  final String street;
  final String number;
  final String block;
  final String cep;

  Address({
    required this.id,
    required this.street,
    required this.number,
    required this.block,
    required this.cep,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      street: json['street'],
      number: json['number'],
      block: json['block'],
      cep: json['cep'],
    );
  }
}
