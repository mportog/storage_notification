String getErrorString(String code) {
  switch (code) {
    case 'ERROR_WEAK_PASSWORD':
      return 'Sua senha é muito fraca.';
    case 'ERROR_INVALID_EMAIL':
      return 'E-mail inválido.';
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return 'E-mail já em uso por outro usuário.';
    case 'ERROR_INVALID_CREDENTIAL':
      return 'E-mail inválido.';
    case 'ERROR_WRONG_PASSWORD':
      return 'Senha está incorreta.';
    case 'ERROR_USER_NOT_FOUND':
      return 'E-mail não cadastrado para um usuário .';
    case 'ERROR_USER_DISABLED':
      return 'Usuário foi desabilitado.';
    case 'ERROR_TOO_MANY_REQUESTS':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'Operação não permitida.';

    default:
      return 'Erro indefinido: $code';
  }
}
