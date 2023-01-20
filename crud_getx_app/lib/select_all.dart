import 'dart:convert';
import 'package:crud_getx_app/delete_student.dart';
import 'package:crud_getx_app/insert_student.dart';
import 'package:crud_getx_app/update_student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SelectAll extends StatefulWidget {
  const SelectAll({super.key});

  @override
  State<SelectAll> createState() => _SelectAllState();
}

class _SelectAllState extends State<SelectAll> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Students'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const InsertStudent();
                  },
                ),
              ).then((value) => getJSONData());
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          const UpdateStudent(),
                          arguments: [
                            data[index]['code'],
                            data[index]['name'],
                            data[index]['dept'],
                            data[index]['phone'],
                          ],
                        )?.then((value) => getJSONData());
                      },
                      onLongPress: () {
                        Get.to(
                          const DeleteStudent(),
                          arguments: [
                            data[index]['code'],
                            data[index]['name'],
                            data[index]['dept'],
                            data[index]['phone'],
                          ],
                        )?.then((value) => getJSONData());
                      },
                      child: Dismissible(
                        key: Key(data[index]['code']),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        child: Slidable(
                          key: Key(data[index]['code']),
                          startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              dismissible: DismissiblePane(onDismissed: () {}),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    Get.to(
                                      const DeleteStudent(),
                                      arguments: [
                                        data[index]['code'],
                                        data[index]['name'],
                                        data[index]['dept'],
                                        data[index]['phone'],
                                      ],
                                    )?.then((value) => getJSONData());
                                  },
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    Get.to(
                                      const UpdateStudent(),
                                      arguments: [
                                        data[index]['code'],
                                        data[index]['name'],
                                        data[index]['dept'],
                                        data[index]['phone'],
                                      ],
                                    )?.then((value) => getJSONData());
                                  },
                                  backgroundColor: Color(0xFF21B7CA),
                                  foregroundColor: Colors.white,
                                  icon: Icons.update,
                                  label: 'Update',
                                ),
                              ]),
                          child: Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text('Code : '),
                                      Text(
                                        data[index]['code'],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text('Name : '),
                                      Text(
                                        data[index]['name'],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text('Dept : '),
                                      Text(
                                        data[index]['dept'],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text('Phone : '),
                                      Text(
                                        data[index]['phone'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  // --- Functions
  Future<bool> getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    // print(response.body);
    data.clear();
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    return true;
  }
} // End
