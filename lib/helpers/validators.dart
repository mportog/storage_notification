bool emailValid(String email) {
  final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
  return regex.hasMatch(email);
}

String nameValid(String name) {
  if (name.isEmpty) {
    return 'Campo obrigatório';
  }
  if (name.trim().split(' ').length <= 1) {
    return 'Preencha o nome Completo';
  }
  return null;
}
