import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _emailHasFocus = false;
  bool _passwordHasFocus = false;
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_onEmailFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
  }

  void _onEmailFocusChange() {
    setState(() {
      _emailHasFocus = _emailFocusNode.hasFocus;
    });
  }

  void _onPasswordFocusChange() {
    setState(() {
      _passwordHasFocus = _passwordFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_onEmailFocusChange);
    _passwordFocusNode.removeListener(_onPasswordFocusChange);
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _showText = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                )),
            Image.asset(
              'assets/images/Netflix_Logo.png',
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          color: Colors.black,
        ),
        Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Center(
                  child: TextField(
                    cursorColor: Colors.white,
                    focusNode: _emailFocusNode,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      filled: true,
                      fillColor:
                          _emailHasFocus ? Colors.grey[700] : Colors.grey[800],
                      floatingLabelStyle: TextStyle(color: Colors.grey[400]),
                      labelStyle: const TextStyle(color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Email or phone number',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Center(
                  child: TextField(
                    cursorColor: Colors.white,
                    focusNode: _passwordFocusNode,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      filled: true,
                      fillColor: _passwordHasFocus
                          ? Colors.grey[700]
                          : Colors.grey[800],
                      floatingLabelStyle: TextStyle(color: Colors.grey[400]),
                      labelStyle: const TextStyle(color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Acción a realizar cuando se presiona el botón
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 40, 50),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  foregroundColor: Colors.grey,
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(width: 2, color: Colors.grey),
                ),
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Need Help?',
                    style: TextStyle(color: Colors.grey[600]),
                  )),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'New to Netfix? Sign up now.',
                    style: TextStyle(color: Colors.grey[500]),
                  )),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  children: [
                    const TextSpan(
                      text:
                          'Sign-in is protected by Google reCAPTCHA to ensure you\'re not\n',
                    ),
                    TextSpan(
                      text: 'a bot. ',
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _showText = true;
                              });
                            },
                            child: Text(
                              'Learn more.',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[800]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_showText) ...{
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                        children: const [
                          TextSpan(
                            text:
                                'The information collected by Google reCAPTCHA is subject to the Google. ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text:
                                '. It is used for providing, maintaining and improving the reCAPTCHA service and for general security purposes (it is not used for personalized advertising by Google).',
                          ),
                        ],
                      ),
                    )),
              }
            ],
          )),
        ),
      ]),
    );
  }
}
