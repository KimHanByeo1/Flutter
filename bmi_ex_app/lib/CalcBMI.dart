import 'package:bmi_ex_app/model/message.dart';
import 'package:flutter/material.dart';

class CalcBMI extends StatefulWidget {
  const CalcBMI({super.key});

  @override
  State<CalcBMI> createState() => _HomeState();
}

class _HomeState extends State<CalcBMI> {
  late TextEditingController height;
  late TextEditingController weight;
  late double height2;
  late double totalHeight;
  late double bmi;
  late String result;
  late double hCount;
  late double wCount;
  late String imageFile;
  late String textResult;

  @override
  void initState() {
    super.initState();

    height = TextEditingController();
    height.text = '0.0';
    weight = TextEditingController();
    weight.text = '0.0';
    height2 = 0;
    totalHeight = 0;
    bmi = 0.0;
    result = '';
    hCount = 0;
    wCount = 0;
    imageFile = 'images/pig.gif';
    textResult = '꿀꿀?꿀?꿀?';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI'),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu1.png'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu2.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu3.png'),
                ),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.calculate_sharp,
                color: Colors.black,
              ),
              title: const Text('BMI 계산하기'),
              onTap: () {
                Navigator.pushNamed(context, '/CalcBMI');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.abc,
                color: Colors.black,
              ),
              title: const Text('결과'),
              onTap: () {
                Navigator.pushNamed(context, '/resultPage2');
              },
            ),
          ],
        )),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          hCount = double.parse(height.text);
                          hCount--;
                          height.text = hCount.toString();
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: height,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: '신장 cm',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          hCount = double.parse(height.text);
                          hCount++;
                          height.text = hCount.toString();
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          wCount = double.parse(weight.text);
                          wCount--;
                          weight.text = wCount.toString();
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: weight,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: '체중 kg',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          wCount = double.parse(weight.text);
                          wCount++;
                          weight.text = wCount.toString();
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bmiCal();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(400, 50)),
                    child: const Text(
                      '계산하기',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    imageFile,
                    height: 300,
                  ),
                  Text(
                    textResult,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (bmi < 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('BMI 측정 후 클릭하세요.'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (bmi < 18.5) {
                        Navigator.pushNamed(context, '/resultPage');
                      } else if (bmi > 22.9 && bmi < 25) {
                        Navigator.pushNamed(context, '/resultPage2');
                      }
                    },
                    child: const Text(
                      '결과보러가기',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ----- Function ----
  bmiCal() {
    setState(() {
      height2 = double.parse(height.text) / 100;
      totalHeight = height2 * height2;
      bmi = (double.parse(weight.text) / totalHeight);

      if (bmi < 18.5) {
        result = '계산 결과 BMI 수치는 ${bmi.toStringAsFixed(2)}이며, 저체중 입니다.';
        imageFile = 'images/image04.jpeg';
        textResult = '살 좀 찌우셔야 겠어요. 조만간 개껌이 될 것 같은데요??';
      } else if (bmi > 18.4 && bmi < 23) {
        result = '계산 결과 BMI 수치는 ${bmi.toStringAsFixed(2)}이며, 정상체중 입니다.';
        textResult = '관리를 잘 하셨네요!!';
        imageFile = 'images/image03.jpeg';
      } else if (bmi > 22.9 && bmi < 25) {
        result = '계산 결과 BMI 수치는 ${bmi.toStringAsFixed(2)}이며, 과체중 입니다.';
        imageFile = 'images/image01.jpeg';
        textResult = '돼지같은넘 ㅋㅋ';
      } else if (bmi > 24.9 && bmi < 30) {
        result = '계산 결과 BMI 수치는 ${bmi.toStringAsFixed(2)}이며, 고도 비만 입니다.';
        imageFile = 'images/image02.jpeg';
        textResult = '살 좀 빼세요! 조만간 삼겹살이 될지도 몰라요.';
      } else if (bmi > 29.9) {
        result = '계산 결과 BMI 수치는 ${bmi.toStringAsFixed(2)}이며, 초고도 비만 입니다.';
        imageFile = 'images/image02.jpeg';
        textResult = '살 좀 빼세요! 조만간 삼겹살이 될지도 몰라요.';
      }

      Message.height1 = double.parse(height.text);
      Message.weight1 = double.parse(weight.text);
      Message.bmi = double.parse(bmi.toStringAsFixed(2));
    });
  }
} // End
