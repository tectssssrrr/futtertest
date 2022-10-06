

class ListUtil{


  static bool isNull(List<dynamic>? list){
    if(list == null){
      return true;
    }
    return list.isEmpty;
  }
}