class Ggg {
 int countPairs(List<int> nums, int k) {
    List<List<int>> dubs = [];
    int count = 0;
    int duplicate = nums.where((element) => nums.where((e) =>e == element).length > 1).length;
    for (int i = 0; i < nums.length; i++) {
        bool check = nums.where((element) => element == nums[i] && (nums.indexOf(element) *i) % k == 0).length > 0;
        print(check);
      if (check == true) {
             dubs.add([]);
        count++;
        print(count);
      }
    }
    if (duplicate==0) {
      return 0;
    } else {
          return count-1;

    }
  }

   String repeatedCharacter(String s) {
    List<String > chars= s.split('');
    List<String > repeatedChars= [];

    String repeated = "";
    for (var i = 0; i < chars.length; i++) {
      if (!chars.contains(chars[i])) {
           repeatedChars.add(chars[i]);
         } else {
           repeated = chars[i];
           break;
         }
    }
         return repeated;
  }
}
