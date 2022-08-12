import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  static const id = "/home page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size? _size;
  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          return decktopBody;
        }
        return moblieBody;
      }),
    );
  }

  Future<void> openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text("New List"),
            content: const TextField(
              decoration: InputDecoration(hintText: "Enter list title"),
            ),
            actions: [
              TextButton(onPressed: () {}, child: const Text("+ Create"))
            ],
          ));

  Widget get moblieBody {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              top: _size!.height * 0.06,
              left: _size!.width * 0.05,
              right: _size!.width * 0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.indigo),
                        child: const Center(
                            child: Text(
                          "AB",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        width: _size!.width * 0.03,
                      ),
                      const Text(
                        "Antonio Bonilla",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: _size!.width * 0.3 + 20,
                  // ),
                  const Icon(
                    Icons.search,
                    color: Colors.indigo,
                  ),
                ],
              ),
              HomeCardView(
                  size: _size,
                  text: "Important",
                  icon: const Icon(
                    Icons.star,
                    color: Colors.pink,
                  )),
              HomeCardView(
                  size: _size,
                  text: "Tasks       ",
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Colors.indigo,
                  )),
              SizedBox(
                height: _size!.height * 0.05,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: _size!.height * 0.02,
              ),
              HomeCardView(
                  size: _size,
                  text: "Task List",
                  icon: Icon(
                    Icons.list,
                    color: Colors.indigo[300],
                  )),
              HomeCardView(
                  size: _size,
                  text: "House List",
                  icon: Icon(
                    Icons.list,
                    color: Colors.indigo[300],
                  )),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.transparent,
            elevation: .0,
            onPressed: () {
              openDialog();
            },
            label: const Text(
              '+ New List',
              style: TextStyle(color: Colors.indigo),
            )));
  }

  Widget get decktopBody {
    return Row(
      children: [
        Expanded(
            child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.only(
                      top: _size!.height * 0.06,
                      left: _size!.width * 0.02,
                      right: _size!.width * 0.02),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.indigo),
                                child: const Center(
                                    child: Text(
                                  "AB",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              SizedBox(
                                width: _size!.width * 0.03,
                              ),
                              const Text(
                                "Antonio Bonilla",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   width: _size!.width * 0.3 + 20,
                          // ),
                          const Icon(
                            Icons.search,
                            color: Colors.indigo,
                          ),
                        ],
                      ),
                      HomeCardView(
                          size: _size,
                          text: "Important",
                          icon: const Icon(
                            Icons.star,
                            color: Colors.pink,
                          )),
                      HomeCardView(
                          size: _size,
                          text: "Tasks       ",
                          icon: const Icon(
                            Icons.home_outlined,
                            color: Colors.indigo,
                          )),
                      SizedBox(
                        height: _size!.height * 0.05,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: _size!.height * 0.02,
                      ),
                      HomeCardView(
                          size: _size,
                          text: "Task List",
                          icon: Icon(
                            Icons.list,
                            color: Colors.indigo[300],
                          )),
                      HomeCardView(
                          size: _size,
                          text: "House List",
                          icon: Icon(
                            Icons.list,
                            color: Colors.indigo[300],
                          )),
                    ],
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startFloat,
                floatingActionButton: FloatingActionButton.extended(
                    backgroundColor: Colors.transparent,
                    elevation: .0,
                    onPressed: () {
                      openDialog();
                    },
                    label: const Text(
                      '+ New List',
                      style: TextStyle(color: Colors.indigo),
                    )))),
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.deepPurple,
            )),
      ],
    );
  }
}

class HomeCardView extends StatelessWidget {
  final String text;
  final Icon icon;
  const HomeCardView({
    Key? key,
    required Size? size,
    required this.text,
    required this.icon,
  })  : _size = size,
        super(key: key);

  final Size? _size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              SizedBox(
                width: _size!.width * 0.03,
              ),
              Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }
}
