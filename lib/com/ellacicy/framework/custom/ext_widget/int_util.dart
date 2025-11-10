extension IntUtil on int {

  ///计算刻度
  int computeScale(){
    int input=this;

    getN0(int input){
      String inputStr=input.toString();
      String ten0="00000000000000";

      String result="";
      int start=int.parse(inputStr.substring(0,1));
      if(start<9){

        int otherStart=int.parse(input.toString().substring(1,input.toString().length)[0]);
        if(otherStart>5){
          result="${start+1}"+ten0.substring(0,inputStr.length-1);
        }else{
          result="${start}5"+ten0.substring(0,inputStr.length-2);
        }

      }else{
        result="1"+ten0.substring(0,inputStr.length);
      }

      return int.parse(result);
    }

    int ninput=input.toInt();
    int scale=ninput;
    if(ninput<5){
      scale=5;
    }else if(5<ninput && ninput<=10){
      scale=10;
    }else{
      int n0=getN0(ninput);
      if(ninput>n0/2){
        scale=n0;
      }else{
        scale=n0~/2;
      }
    }
    return scale;
  }

}