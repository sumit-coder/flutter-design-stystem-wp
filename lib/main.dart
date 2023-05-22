import 'dart:math';

import 'package:design_system_start/screens/test_book_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'screens/book_demo.dart';
import 'screens/demo.dart';
import 'screens/screenshot_app_mvp.dart';
// import 'screens/stats_maker_screen/stats_maker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const DesignSystemDemo(),
      // home: const BookDemoScreen(),
      // home: StatsMaker(),
      // home: const MyHomePage(),
      // home: ScreenshotApp(),
      home: LeetCodeTest(),
    );
  }
}

class LeetCodeTest extends StatelessWidget {
  LeetCodeTest({Key? key}) : super(key: key);

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.deepPurple,
                onPressed: () {
                  // print('${firstMissingPositive([1])} == 2');
                  // print('${firstMissingPositive([0])} == 1');
                  // print('${firstMissingPositive([1, 2, 0])} == 3');
                  // print('${firstMissingPositive([1, 2, 3])} == 4');
                  // print('${firstMissingPositive([1, 2, 3, 4])} == 5');
                  // print('${firstMissingPositive([-5])} == 1');
                  // print('${firstMissingPositive([3, 4, -1, 1])} == 2');
                  // print('${firstMissingPositive([7, 8, 9, 11, 12])} == 1');
                  // print('${spiralOrder([
                  //       [1, 2, 3, 4],
                  //       [5, 6, 7, 8],
                  //       [9, 10, 11, 12],
                  //       [13, 14, 15, 16]
                  //     ])} == []');

                  // print(strongPasswordChecker('a'));
                  // print(strongPasswordChecker('aA1'));
                  // print(strongPasswordChecker('1337C0d3'));
                  // print(strongPasswordChecker('aaa123'));
                  // print(strongPasswordChecker('bbaaaaaaaaaaaaaaacccccc'));
                  // print(strongPasswordChecker('aaA1ab'));
                  // print(strongPasswordChecker('aaaB1'));
                  // print(strongPasswordChecker('aaa111'));
                  // print(strongPasswordChecker('aa123'));
                  // print(strongPasswordChecker('ABABABABABABABABABAB1'));
                  // print(strongPasswordChecker('bbaaa aaa aaa aaa aaa ccc ccc'));

                  // countOperationsToEmptyArray([3, 4, -1]);
                  // // countOperationsToEmptyArray([1, 2, 4, 3]);
                  // countOperationsToEmptyArray([1, 2, 4, 3]);
                  // countOperationsToEmptyArray([1, 2, 3]);
                  // print(isHappy(5));
                  // reverseString(['a', 'b', 'c']);
                  // addToArrayForm('564655665', '5565656');
                  print(isSubsequence("aaaaaa", "bbaaaa"));
                },
                child: const Text('Check'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool isSubsequence(String s, String t) {
  if (s.isEmpty) return true;

  List<String> sList = s.split("");
  List<String> tList = t.split("");
  List<int> lastList = [];

  for (var i = 0; i < sList.length; i++) {
    lastList.add(tList.indexOf(sList[i]));
  }
  if (lastList.contains(-1)) {
    return false;
  }

  for (var i = 0; i < lastList.length; i++) {
    if (i == lastList.length - 1) {
      return true;
    }
    if (lastList[i + 1] < lastList[i]) {
      return false;
    }
  }

  print(lastList);

  return false;
}

// List<int> addToArrayForm(List<int> num, int k) {
//   return int.parse(num.join()) + k;
// }
int maxProfit(List<int> prices) {
  int leftP = 0;
  int rightP = 1;

  List<int> maxProfitList = [];

  for (var i = 0; i < prices.length; i++) {
    if (i != prices.length - 1 && prices[i] < prices[i + 1]) {
      int maxProfit = prices[i + 1] - prices[i];
      maxProfitList.add(maxProfit);
    }
  }
  maxProfitList.sort();

  return 0;
}

String addStrings(String num1, String num2) {
  int getFromStringToInt(String numString) {
    int newNumInt = 0;
    numString.split('').forEach((element) {
      Map<int, String> numberList = {0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7', 8: '8', 9: '9'};
      numberList.removeWhere((key, value) {
        if (element == value) {
          newNumInt = (newNumInt * 10) + key;
          return true;
        }
        return false;
      });
    });

    return newNumInt;
  }

  int newNum1 = getFromStringToInt(num1);
  int newNum2 = getFromStringToInt(num2);

  return "${newNum1 + newNum2}";
}

void reverseString(List<String> s) {
  int sLength = s.length;
  for (var i = 0; i < sLength; i++) {
    s.add(s[sLength - i - 1]);
  }
  s.removeRange(0, sLength);
  print(s);
}

bool containsNearbyDuplicate(List<int> nums, int k) {
  // Set<int> newMap = nums.toSet();

  bool setReturnValue = false;

  nums = [...nums.reversed];

  for (var i = 0; i < nums.length; i++) {
    for (var j = 0; j < nums.length; j++) {
      if (i != j && nums[i] == nums[j]) {
        if ((i - j).abs() <= k) {
          setReturnValue = true;
        }
      }
    }
  }

  return setReturnValue;
}

// bool isHappy(int n) {
//   List<String> newN = n.toString().split('');
//   for (var element in newN) {
//     newN.f
//   }

//   return false;
// }

int countOperationsToEmptyArray(List<int> nums) {
  List<int> newList = [...nums];
  newList.sort();

  int count = 0;

  for (var i = 0; i < newList.length; i++) {
    if (newList.length - 1 == i) {
      count++;
      print(count);
      return count;
    }
    if (nums.indexOf(newList[i]) == i) {
      count = count + 1;
      continue;
    }
    count = count + 2;
  }

  return 0;
}

bool containsDuplicateAns(List<int> nums) {
  Set<int> newMap = nums.toSet();

  if (newMap.length < nums.length) {
    return true;
  }

  return false;
}

int majorityElement(List<int> nums) {
  Random random = new Random();
  int? starElement = null;
  int half = (nums.length / 2).round();

  while (starElement == null) {
    int randomIteam = random.nextInt(nums.length);
    Iterable<int> newList = nums.where((element) => element == nums[randomIteam]);
    print(newList);

    if (newList.length >= half) {
      starElement = newList.first;
    }
  }

  return starElement;
}

void rotate(List<int> nums, int k) {
  if (k > nums.length) {
    for (var i = 0; i < k; i++) {
      nums.insertAll(0, [nums.last]);
      nums.removeLast();
    }
  } else {
    List<int> reversedListB = nums.sublist(nums.length - k).toList();
    nums.removeRange(nums.length - k, nums.length);

    nums.insertAll(0, reversedListB);
  }
}

int removeDuplicates(List<int> nums) {
  if (nums.length < 3) {
    return nums.length;
  }
  for (var i = 0; i < nums.length; i++) {
    if (i == nums.length - 2) {
      break;
    }
    if (nums[i] == nums[i + 1] && nums[i] == nums[i + 2]) {
      nums.removeAt(i--);
      print(nums);
    }
  }
  return nums.length;
}

//
int strongPasswordChecker2(String password) {
  int totalSepts = 0;
  int otherSepts = 0;

  final alphanumeric = RegExp('(?=.*[a-z])');
  final alphanumeric2 = RegExp('(?=.*[A-Z])');
  final alphanumeric3 = RegExp('(?=.*[0-9])');
  final alphanumeric4 = RegExp('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}');

  // checkUnderSix() {}

  checkMatchedPassword() {
    if (alphanumeric4.hasMatch(password)) {
      List<String> characters = password.split('');
      for (var i = 0; i < characters.length; i++) {
        if (i + 2 >= characters.length) {
          // print('end');
          // totalSepts = totalSepts + 1;
          // break;
        } else {
          if (characters[i] == characters[i + 1] && characters[i + 1] == characters[i + 2]) {
            print(characters[i] + characters[i + 1] + characters[i + 2]);
            totalSepts = totalSepts + 1;

            characters.removeAt(i);
            characters.removeAt(i + 1);
            // characters.removeAt(i + 2);
          }
        }
      }
      return totalSepts;
    }
  }

  return totalSepts;
}

int strongPasswordChecker(String password) {
  int totalSepts = 0;
  int otherSepts = 0;
  bool firstTime = false;

  final alphanumeric = RegExp('(?=.*[a-z])');
  final alphanumeric2 = RegExp('(?=.*[A-Z])');
  final alphanumeric3 = RegExp('(?=.*[0-9])');
  final alphanumeric4 = RegExp('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}');
  //

  if (alphanumeric4.hasMatch(password)) {
    List<String> characters = password.split('');
    for (var i = 0; i < characters.length; i++) {
      if (i + 2 >= characters.length) {
        // print('end');
        // totalSepts = totalSepts + 1;
        // break;
      } else {
        if (characters[i] == characters[i + 1] && characters[i + 1] == characters[i + 2]) {
          print(characters[i] + characters[i + 1] + characters[i + 2]);
          totalSepts = totalSepts + 1;

          characters.removeAt(i);
          characters.removeAt(i + 1);
          // characters.removeAt(i + 2);
        }
      }
    }
    return totalSepts;
  }

  if (password.length < 6) {
    totalSepts = 6 - password.length;
  }
  if (password.length > 20) {
    otherSepts = password.length - 20;
    print('objectadfasd fadsf asdfa ');
  }
  if (!alphanumeric.hasMatch(password)) {
    otherSepts++;
  }
  if (!alphanumeric2.hasMatch(password)) {
    otherSepts++;
  }
  if (!alphanumeric3.hasMatch(password)) {
    otherSepts++;
  }

  List<String> characters = password.split('');
  for (var i = 0; i < characters.length; i++) {
    if (i + 2 >= characters.length) {
      // print('end');
      // totalSepts = totalSepts + 1;
      // break;
    } else {
      if (characters[i] == characters[i + 1] && characters[i + 1] == characters[i + 2]) {
        // print(characters[i] + characters[i + 1] + characters[i + 2]);

        if (password.length < 6) {
        } else {
          totalSepts = totalSepts + 1;
        }

        // print(totalSepts);

        characters.removeAt(i);
        characters.removeAt(i + 1);
        // characters.removeAt(i + 2);
      }
    }
  }

  // print("$totalSepts" + "$otherSepts" + "= $totalSepts");

  if (totalSepts > otherSepts) {
    // int adfadf =
    print("total");

    return totalSepts;
  } else {
    print("other");
    // print(otherSepts);
    return otherSepts;
  }

  // print(totalSepts);
  // return totalSepts;
}

// [1,2,3,4,5]
// [15,16,17,18,6]
// [14,24,25,19,7]
// [13,22,21,20,8]
// [12,11,10,9,8]

// [1,2,3,4,   ] || [1,2,3,4]
// [12,13,14,5,] || [5,6,7,8]
// [11,16,15,6,] || [9,10,11,12]
// [10,9,8,7,  ] || [13,14,15,16]

// [[1,2,3,4], [12, 13,14,5], [11,16,15,6,],[10,9,8,7,]]

// [()]

// [ [1234,] [(1,1),(1,2),(1,3),(1,4) (2,4), (3,4),(3,3),(3,2),(3,1), (2,1)]
//   [1235,]
//   [9876,]
//  [1,2,3,4,5,6,7,8,9,]
// ]
//
// 5873 ]

// List<List<int>> generateMatrix(int n) {
//   List<int> newList = [];

//   aToB() {
//     for (var i = 0; i < n; i++) {
//       newList.add(i + 1);
//     }
//   }

//   bToC() {
//     for (var i = 0; i < n - 2; i++) {
//       newList.add(i + 1);
//     }
//   }

//   cToD() {
//     var lastList = matrix.last.reversed;
//     newList.addAll(lastList);
//     matrix.removeAt(matrix.length - 1);
//   }

//   dToA() {
//     for (var j = 0; j < matrix.length; j++) {
//       if (matrix[j].isEmpty) {
//         return;
//       }
//       newList.add(matrix[j][0]);
//       matrix[j].removeAt(0);
//     }
//   }

//   while (n == 0) {
//     if (n == 0) break;
//     aToB();

//     bToC();

//     cToD();

//     dToA();
//   }

//   return newList;
// }

List<int> spiralOrder2(List<List<int>> matrix) {
  List<int> newList = [];

  aToB() {
    newList = [...newList, ...matrix[0]];
    matrix.removeAt(0);
  }

  bToC() {
    for (var i = 0; i < matrix.length; i++) {
      if (matrix[i].isEmpty) {
        return;
      }
      if (i + 1 == matrix.length) {
      } else {
        newList.add(matrix[i].last);
        matrix[i].removeAt(matrix[i].length - 1);
      }
    }
  }

  cToD() {
    var lastList = matrix.last.reversed;
    newList.addAll(lastList);
    matrix.removeAt(matrix.length - 1);
  }

  dToA() {
    for (var j = 0; j < matrix.length; j++) {
      if (matrix[j].isEmpty) {
        return;
      }
      newList.add(matrix[j][0]);
      matrix[j].removeAt(0);
    }
  }

  while (matrix.isNotEmpty) {
    if (matrix.isEmpty) break;
    aToB();

    if (matrix.isEmpty) break;
    bToC();

    if (matrix.isEmpty) break;
    cToD();

    if (matrix.isEmpty) break;
    dToA();
  }

  return newList;
}

List<int> spiralOrder(List<List<int>> matrix) {
  List<int> newList = [];

  removeValue() {
    // 1st
    newList = [...newList, ...matrix[0]];
    matrix.removeAt(0);

    for (var i = 0; i < matrix.length; i++) {
      if (i + 1 == matrix.length) {
        // 3rd
        var lastList = matrix.last.reversed;
        newList.addAll(lastList);
        matrix.removeAt(matrix.length - 1);

        // 4th item
        for (var j = 0; j < matrix.length; j++) {
          newList.add(matrix[j].first);
          matrix[j].removeAt(0);
        }
        break;
      }

      if (!(i + 1 == matrix.length)) {
        // 2nd
        newList.add(matrix[i].last);
        matrix[i].removeAt(matrix[i].length - 1);
      }
    }
  }

  while (matrix.isNotEmpty) {
    removeValue();
  }

  return newList;
}

// int firstMissingPositive(List<int> nums) {
//   int returnValue = 0;

//   int half = (nums.length / 2).ceilToDouble().toInt();
//   // print(half);

//   if (nums.length < 2) {
//     if (!nums.contains(1) && nums.first > 0) {
//       returnValue = 1;
//     }
//     if (!nums.contains(2) && nums.first > 0) {
//       returnValue = 2;
//     }
//     return returnValue;
//   }

//   for (var i = 0; i < half; i++) {
//     if (!nums.contains(i + 1) || !nums.contains(i + 2)) {
//       if (!nums.contains(i + 1)) {
//         returnValue = i + 1;
//       }
//       if (!nums.contains(i + 2)) {
//         returnValue = i + 2;
//       }
//       // returnValue = i + 1;
//       break;
//     }

//     if (i + 1 == half) {
//       if (nums.length.isOdd) {
//         returnValue = nums.length + 1;
//       } else {
//         returnValue = nums.length + 1;
//       }
//     }
//   }

//   return returnValue;
// }

// int firstMissingPositivee(List<int> nums) {
//   int returnValue = 0;

//   // nums.sort();

//   for (var i = 0; i < nums.length; i++) {
//     if (nums[i] > 0) {
//       if (!nums.contains(i + 1)) {
//         returnValue = i + 1;
//         break;
//       }
//       if (nums.length == i) {
//         returnValue = i + 1;
//       }
//     } else {
//       returnValue = 1;
//     }
//     //
//   }

//   return returnValue;
// }

// int removeElement(List<int> nums, int val) {
//   nums.removeWhere((item) => item == 5);
//   // print(nums.length);
//   // print(nums);
//   return nums.length;
// }

//  class ListNode {
//    int val;
//    ListNode? next;
//    ListNode([this.val = 0, this.next]);
//  }

// double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
//   List<int> numbers = [...nums1, ...nums2];

//   if (numbers.length == 1) {
//     return numbers.first.toDouble();
//   }

//   double returnValue = 0.0;

//   numbers.sort();
//   int index = (numbers.length / 2).floor();

//   if (numbers.length.isOdd) {
//     returnValue = numbers[index].toDouble();
//   }

//   if (numbers.length.isEven) {
//     returnValue = (numbers[index] + numbers[index - 1]) / 2;
//   }

//   return returnValue;
// }

// int diagonalSum(List<List<int>> mat) {
//   int added = 0;
//   for (var i = 0; i < mat.length; i++) {
//     for (var j = 0; j < mat[i].length; j++) {
//       // if(mat.length -)
//       // if () {

//       // }
//       added = added + mat[i][i];
//     }
//   }

//   print(added);

//   return 0;
// }

// String longestCommonPrefix(List<String> strs) {
//   String startingWord = strs.first.substring(0, 1);
//   String commonPrefix = "";

//   for (var element in strs) {
//     if (!element.startsWith(startingWord)) {
//       commonPrefix = '';
//       break;
//     } else {
//       var kfaldkfl = element.split(''); // ['f', 'o', 'w']

//       for (var i = 0; i < kfaldkfl.length; i++) {}
//       commonPrefix = 'd';
//     }
//   }

//   print(commonPrefix);

//   return commonPrefix;
// }
