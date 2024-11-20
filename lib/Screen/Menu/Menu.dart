import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../Auth/login.dart';

class HoverMenu extends StatefulWidget {
  @override
  _HoverMenuState createState() => _HoverMenuState();
}

class _HoverMenuState extends State<HoverMenu> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: width,
        height: _isHovered ? 120 : 50,
        decoration: const BoxDecoration(
          color: Color(0xffdfe3ea),
          boxShadow: [
            BoxShadow(blurRadius: 3, color: Color(0xaa0D253C)),
          ],
        ),
        child: Row(
          children: [
            // فقط در حالت hover سه ویجت نمایش داده می‌شود
             const Expanded(child: PopUpMenu()),
            if (_isHovered)  Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child:Assets.icons.home.image()
                )),
            if (_isHovered)  Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child:Assets.icons.search.image()
                )),if (_isHovered)  Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child:Assets.icons.articles.image()
                )),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  GlobalKey popUpButtonKey = GlobalKey();

  openPopUpItem() {
    GestureDetector? detector;

    // جستجو برای GestureDetector
    searchForGestureDetector(BuildContext element) {
      element.visitChildElements((element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector;
        } else {
          searchForGestureDetector(element);
        }
      });
    }
    searchForGestureDetector(popUpButtonKey.currentContext!);
    detector!.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onHover: (value) {
              if (value) openPopUpItem();
            },
            onTap: () {},
            child: PopupMenuButton(
              key: popUpButtonKey,
              color: Color(0xFFFFFFFF),
              tooltip: '',
              position: PopupMenuPosition.under,
              child: Assets.icons.menu.image(width: 25, height: 25),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    title: InkWell(
                      onTap: (){
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => const LoginResponsive   ()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    title: Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
