import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_studies/first_project/components/difficulty_widget.dart';
import 'package:flutter_studies/first_project/data/task_dao.dart';

import '../data/all_level_inheritered.dart';

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;
  Task(
      {super.key,
      required this.name,
      required this.photo,
      required this.difficulty});

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  Color color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    final photo = widget.photo;
    final difficulty = widget.difficulty;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 4),
            borderRadius: BorderRadius.circular(4.0)),
        alignment: AlignmentDirectional.topCenter,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: color),
                  // width: 370,
                  height: 146,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white),
                      // width: 370,
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 208, 208, 208),
                            ),
                            width: 90,
                            height: 120,
                            child: ClipRRect(
                              //we have to use clip when need to decorate childs of containers
                              child: photo.contains('https://')
                                  ? Image.network(
                                      photo,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Image.asset(
                                            'lib/first_project/assets/imgs/nophoto.png',
                                            fit: BoxFit.fitWidth,
                                          ),
                                        );
                                      },
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      photo,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Image.asset(
                                            'lib/first_project/assets/imgs/nophoto.png',
                                            fit: BoxFit.fitWidth,
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(widget.name,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        overflow: TextOverflow.ellipsis)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: DifficultyWidget(difficulty: difficulty),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 12.0, bottom: 8, top: 8),
                                child: SizedBox(
                                  width: 50,
                                  height: 20,
                                  child: ElevatedButton(
                                    child: const Icon(
                                      size: 18,
                                      color: Colors.white,
                                      Icons.delete_outline_rounded,
                                    ),
                                    onPressed: () {
                                      TaskDao().delete(widget.name);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 12.0,
                                ),
                                child: SizedBox(
                                  height: 55,
                                  width: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (((widget.level / difficulty) / 10) >=
                                          1) {
                                        widget.level = 1;
                                        int number = Random().nextInt(3);
                                        switch (number) {
                                          case 0:
                                            color = const Color.fromARGB(
                                                255, 0, 99, 3);
                                          case 1:
                                            color = Colors.red;

                                          case 2:
                                            color = Colors.brown;

                                          case 3:
                                            color = Colors.yellow;
                                        }
                                      } else {
                                        widget.level++;
                                        AllLevelInherited.of(context)
                                                .overAllLevel +=
                                            1 / 10 * difficulty;
                                      }
                                      setState(() {});
                                      // print(widget.level);
                                    },
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.arrow_drop_up,
                                        ),
                                        Text(
                                          'UP',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                              width: 250,
                              child: LinearProgressIndicator(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                                backgroundColor: Colors.white,
                                color: const Color.fromARGB(255, 255, 230, 0),
                                minHeight: 6,
                                value: difficulty <= 0
                                    ? 1
                                    : (widget.level / difficulty) / 10,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            'Nível ${widget.level}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
