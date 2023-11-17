String phoneHandle(String phone){
  if(phone.startsWith('0')){
    return phone.replaceFirst('0', '');
  } else {
    return phone;
  }
}