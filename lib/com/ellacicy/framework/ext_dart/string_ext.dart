extension MapExt on String {


  ///裁剪字符串显示：长度超过masShowLen，就只显示shortLength个字符，后面用...填满
  String truncateWithEllipsis(int masShowLen,int shortLength) {
    return this.length > masShowLen ? '${this.substring(0, shortLength)}...' : this;
  }

  T map<T>(T Function(String) covert){
    return covert.call(this);
  }

  String getFileNameFromUrl() {
    Uri uri = Uri.parse(this);
    return uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
  }


  String betterForFloat(){
    double v=double.parse(this);
    if(v==0){
      return "0";
    }
    return toString();
  }

}