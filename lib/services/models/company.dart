class Company {
  final int id;
  final String name;
  final String description;
  final String logoUrl;
  final String websiteUrl;
  final String phoneNumber;
  final String address;

  Company({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.logoUrl,
    required this.websiteUrl,
    required this.phoneNumber,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
      logoUrl: json['logoUrl'],
      websiteUrl: json['websiteUrl'],
      phoneNumber: json['phoneNumber'],
    );
  }

  static final Company getCompany = Company.list[0];

  static final List<Company> list = [
    Company(
      id: 1,
      name: 'CEULP/ULBRA',
      description:
          'A ULBRA Palmas tem uma série de motivos para ser a sua Universidade. \nSão 30 anos de atuação promovendo formação de qualidade para você que busca tornar-se um profissional de sucesso',
      logoUrl: 'https://www.calendariodovestibular.com.br/wp-content/uploads/2016/05/post_ceulp.png',
      address: 'Q. 101 Sul Avenida LO 3, S/N - Plano Diretor Sul, Palmas - TO, 77015-002',
      websiteUrl: 'https://ulbra-to.br/',
      phoneNumber: '(063) 3219-8000',
    )
  ];
}
