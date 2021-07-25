String? nameCheck(String? value){
  if(value != ""){
    return null;
  }else{
    return '닉네임을 입력해주세요';
  }
}


String? emailCheck(String? value) {
  var text = value ?? '';
  var pattern = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]';
  var regex = RegExp(pattern);
  if (!regex.hasMatch(text)) {
    return "이메일 형식이 아닙니다.";
  } else if (value == null || value.isEmpty){
    return '이메일을 입력해주세요';
  }
  else {
    return null;
  }
}

String? pwCheck(String? value) {
  if (value == null || value.isEmpty) {
    return "비밀번호를 입력해주세요";
  } else {
    return null;
  }
}