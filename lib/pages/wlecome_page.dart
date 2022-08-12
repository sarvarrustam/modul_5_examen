import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:modul_5_examen/pages/home_page.dart';

class WelcomePage extends StatefulWidget {
  static const id = "/wlecome page";
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
          return desktopBody;
        }
        return mobileBody;
      }),
    );
  }

  Widget get mobileBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset("assets/images/intro.png")),
        Padding(
          padding: EdgeInsets.only(top: _size!.height * 0.08, bottom: 16),
          child: Center(
            child: Text(
              "Welcome to \n Uno To Do!",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Start using the best To Do app",
              style: TextStyle(color: Colors.indigo),
            )),
        SizedBox(
          height: _size!.height * 0.08,
        ),
        CupertinoButton(
            child: Container(
                height: _size!.height * 0.06,
                width: _size!.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.indigo,
                ),
                child: const Center(
                    child: Text(
                  "Get started",
                  style: TextStyle(color: Colors.white),
                ))),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.id);
            })
      ],
    );
  }

  Widget get desktopBody {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: _size!.height * 0.08, bottom: 16),
                child: Center(
                  child: Text(
                    "Welcome to \n Uno To Do!",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Start using the best To Do app",
                    style: TextStyle(color: Colors.indigo),
                  )),
              SizedBox(
                height: _size!.height * 0.08,
              ),
              CupertinoButton(
                  child: Container(
                      height: _size!.height * 0.06,
                      width: _size!.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.indigo,
                      ),
                      child: const Center(
                          child: Text(
                        "Get started",
                        style: TextStyle(color: Colors.white),
                      ))),
                  onPressed: () {
                    Navigator.pushNamed(context, HomePage.id);
                  })
            ],
          ),
        ),
        VerticalDivider(
          thickness: 2,
        ),
        Expanded(
          flex: 3,
          child: Center(child: Image.asset("assets/images/intro.png")),
        ),
      ],
    );
  }
}
