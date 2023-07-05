data() {
  List<String> list = ['x', 'l', 'i', 'k', 'k', 'k', 'h', 'u', 'u'];

  for (int i =''; i < list.length; i++) {
      int count = 0;
    if (list[i] == 'k' || list[i] == 'u') {
      count++;
    }
 
  }
     print('$count');
  
}
