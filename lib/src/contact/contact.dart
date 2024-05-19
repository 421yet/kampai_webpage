import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampai_webpage/src/appbar/bodyfulsliverappbar.dart';
import 'package:kampai_webpage/src/constants.dart';
import 'package:kampai_webpage/src/drawer/kampai_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// AND HOURS!
///
class Contact extends StatefulWidget {
  const Contact({super.key});

  static const routeName = '/Contact';

  @override
  State<StatefulWidget> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  ScrollController controller = ScrollController();
  final _formKey = GlobalKey<FormState>();

  String _title2Send = '';
  // String _email2Send = '';
  String _body2Send = '';

  Future openEmail() async {
    // const String recepient = 'kampai4949stl@gmail.com';
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'kampai4949stl@google.com',
        queryParameters: {'subject': _title2Send, 'body': _body2Send});
// mailto:smith@example.com?subject=Example+Subject+%26+Symbols+are+allowed%21
    launchUrl(emailLaunchUri);

    showSnackBar(
        'Your default email app is launching. '
        'But if that didn\'t work, scroll down!',
        context);

    // try {
    //   // showSnackBar('Your email was sent successfully.');
    // } catch (error) {
    //   // showSnackBar('Error sending email, $error');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.black,
      drawer: KampaiDrawer(context).builder(),
      body: CustomScrollView(
        controller: controller,
        slivers: BodyfulSliverAppBar.build(
          context,
          Flex(
            direction: deviceHeight(context) > deviceWidth(context)
                ? Axis.vertical
                : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Column of hours
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lunch.',
                          style: GoogleFonts.prata(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Divider(),
                        const Text('MON – FRI: 11am – 2pm')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dinner.',
                          style: GoogleFonts.prata(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Divider(),
                        const Text('MON – THU: 5pm – 10pm'),
                        const Text('FRI – SAT: 5pm – 11pm'),
                        const Text('SUN: 5pm – 9pm'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side:
                              BorderSide(color: Colors.white.withOpacity(.5))),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Contact'),
                            Icon(Icons.arrow_drop_down_sharp),
                          ],
                        ),
                      ),
                      onPressed: () => controller
                          .jumpTo(controller.position.maxScrollExtent),
                    ),
                  )
                ],
              ),

              /// email column
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Send Us an Email.',
                        style: GoogleFonts.prata(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const Divider(thickness: 0),
                      // const Text('kampai4949stl@gmail.com'),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          ),
                          validator: (String? value) {
                            return (value != null && value.isEmpty)
                                ? 'Empty Title'
                                : null;
                          },
                          onSaved: (String? value) {
                            _title2Send = value!;
                          },
                        ),
                      ),
                      // SizedBox(
                      //   width: 300,
                      //   child: TextFormField(
                      //     decoration: const InputDecoration(
                      //       labelText: 'Your Email',
                      //     ),
                      //     validator: (String? value) {
                      //       if (value != null) {
                      //         RegExp exp = RegExp(
                      //             // very long regex for validating emails
                      //             r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''');
                      //         return (exp.hasMatch(value))
                      //             ? null
                      //             : 'Invalid address';
                      //       } else {
                      //         return null;
                      //       }
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                              minLines: 7,
                              maxLines: null,
                              decoration: const InputDecoration(
                                labelText: 'Body',
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                return (value != null && value.isEmpty)
                                    ? 'Empty message'
                                    : null;
                              },
                              onSaved: (String? value) {
                                _body2Send = value!;
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(.75)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Send',
                                style: TextStyle(color: Colors.black)),
                          ),
                          onPressed: () {
                            FormState? state = _formKey.currentState;
                            if (state == null) {
                              return;
                            } else if (state.validate()) {
                              // TODO send email using backend... omg
                              // sendEmail(context);
                              state.save();
                              openEmail();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
