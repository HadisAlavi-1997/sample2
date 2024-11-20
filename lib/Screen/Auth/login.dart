import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';

class LoginResponsive extends StatefulWidget {
  const LoginResponsive({super.key});

  @override
  State<LoginResponsive> createState() =>
      _LoginResponsiveState();
}

class _LoginResponsiveState extends State<LoginResponsive> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return _buildPhoneLayout(themeData);
          } else if (sizingInformation.isTablet) {
            return _buildTabletLayout(themeData );
          } else {
            return _buildDesktopLayout(themeData);
          }
        },
      ),
    );
  }
////////////////////////////////////////////////////////////PhoneLayout
  Widget _buildPhoneLayout(themeData, ) {
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: Assets.images.login.userlogo.image(width: 100)

              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    color: themeData.colorScheme.primary,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = loginTab;
                                });
                              },
                              child: Text(
                                'Login'.toUpperCase(),
                                style: themeData.textTheme.bodyLarge?.apply(
                                    color: selectedTabIndex == loginTab
                                        ? Colors.white
                                        : Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = signUpTab;
                                });
                              },
                              child: Text(
                                'Sign Up'.toUpperCase(),
                                style: themeData.textTheme.bodyLarge?.apply(
                                    color: selectedTabIndex == signUpTab
                                        ? Colors.white
                                        : Colors.white54),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              ),
                              color: themeData.colorScheme.surface,
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(32, 48, 32, 32),
                                  child: selectedTabIndex == loginTab
                                      ? _Login(
                                    themeData: themeData,

                                  )
                                      : _SignUp(
                                    themeData: themeData, )),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
/////////////////////////////////////////////////////////////////TabletLayout
  Widget _buildTabletLayout(ThemeData themeData) {
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 500,
              height: 800,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child:  Assets.images.login.userlogo.image(width: 50)
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        color: themeData.colorScheme.primary,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedTabIndex = loginTab;
                                    });
                                  },
                                  child: Text(
                                    'Login'.toUpperCase(),
                                    style: themeData.textTheme.bodyLarge?.apply(
                                        color: selectedTabIndex == loginTab
                                            ? Colors.white
                                            : Colors.white54),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedTabIndex = signUpTab;
                                    });
                                  },
                                  child: Text(
                                    'Sign Up'.toUpperCase(),
                                    style: themeData.textTheme.bodyLarge?.apply(
                                        color: selectedTabIndex == signUpTab
                                            ? Colors.white
                                            : Colors.white54),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  ),
                                  color: themeData.colorScheme.surface,
                                ),
                                child: SingleChildScrollView(
                                  child: Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(32, 48, 32, 32),
                                      child: selectedTabIndex == loginTab
                                          ? _Login(
                                        themeData: themeData,

                                      )
                                          : _SignUp(
                                        themeData: themeData, )),
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
////////////////////////////////////////////////////////////////////DesktopLayout
  Widget _buildDesktopLayout(ThemeData themeData,) {
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 500,
              height: 800,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child:  Assets.images.login.userlogo.image(width:150),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        color: themeData.colorScheme.primary,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedTabIndex = loginTab;
                                    });
                                  },
                                  child: Text(
                                    'Login'.toUpperCase(),
                                    style: themeData.textTheme.bodyLarge?.apply(
                                        color: selectedTabIndex == loginTab
                                            ? Colors.white
                                            : Colors.white54),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedTabIndex = signUpTab;
                                    });
                                  },
                                  child: Text(
                                    'Sign Up'.toUpperCase(),
                                    style: themeData.textTheme.bodyLarge?.apply(
                                        color: selectedTabIndex == signUpTab
                                            ? Colors.white
                                            : Colors.white54),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  ),
                                  color: themeData.colorScheme.surface,
                                ),
                                child: SingleChildScrollView(
                                  child: Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(32, 48, 32, 32),
                                      child: selectedTabIndex == loginTab
                                          ? _Login(
                                        themeData: themeData,

                                      )
                                          : _SignUp(
                                        themeData: themeData, )),
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
/////////////////////////////////////////////////////////////////////classes
class _Login extends StatelessWidget {
  final ThemeData themeData;

  const _Login({
    Key? key,
    required this.themeData,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: themeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(label: Text('Username',style: themeData.textTheme.bodyMedium,)),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(

          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( themeData.colorScheme.primary,), // رنگ پس‌زمینه
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          child: Text(
            style: themeData.textTheme.bodyLarge,
            'Login'.toUpperCase(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forgot your password?', style: themeData.textTheme.bodySmall,),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              child:  Text('Reset here',style: themeData.textTheme.bodySmall),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'OR SIGN IN WITH',
            style:  TextStyle(letterSpacing: 2,  fontFamily: FontFamily.avenir,
                color: themeData.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 14),

          ),
        ),

        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  final ThemeData themeData;

  const _SignUp({
    Key? key,
    required this.themeData,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to blog club',
          style: themeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'please enter your information',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(label: Text('Fullname',style: themeData.textTheme.bodyMedium)),
        ),
        TextField(
          decoration: InputDecoration(label: Text('Username',style: themeData.textTheme.bodyMedium)),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( themeData.colorScheme.primary,), // رنگ پس‌زمینه
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          child: Text(
            style: themeData.textTheme.bodyLarge,

            'Sign up'.toUpperCase(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'OR SIGN UP WITH',
            style:  TextStyle(letterSpacing: 2,  fontFamily: FontFamily.avenir,
                color: themeData.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {

  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final  ThemeData themeData = Theme.of(context);
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: Text('Password',style: themeData.textTheme.bodyMedium,),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'Show' : 'Hide',
            style: TextStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}