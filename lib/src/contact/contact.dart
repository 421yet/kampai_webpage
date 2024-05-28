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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white.withOpacity(.5))),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 12,
                      bottom: 7,
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Contact'),
                        Icon(Icons.arrow_drop_down_sharp),
                      ],
                    ),
                  ),
                  onPressed: () =>
                      controller.jumpTo(controller.position.maxScrollExtent),
                ),
              ),
              Flex(
                direction: deviceWidth(context) < 500
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment
                    .start, // TODO (visual) figure out of center or start looks better
                children: <Widget>[
                  /// Column of hours
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Lunch.',
                          style: GoogleFonts.prata(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Divider(thickness: 0),
                        const Text('MON – FRI: 11am – 2pm'),
                        const SizedBox(height: 40),
                        Text(
                          'Dinner.',
                          style: GoogleFonts.prata(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Divider(thickness: 0),
                        const Text('MON – THU: 5pm – 10pm'),
                        const Text('FRI – SAT: 5pm – 11pm'),
                        const Text('SUN: 5pm – 9pm'),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: deviceWidth(context) / 10,
                    height: deviceHeight(context) / 10,
                  ),

                  /// email column
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
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
                          SizedBox(
                            /// TODO (frozen until...) textInputController might need some touches:
                            /// when on mobile web, when editing text,
                            /// when screen is displaying fields on its lower half-ish
                            /// the keyboard has a big box above it covering most,
                            /// the box seems to scale with where the scroll is
                            /// TURNS OUT: https://github.com/flutter/flutter/issues/73752
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
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                  minLines: 7,
                                  maxLines: null,
                                  decoration: const InputDecoration(
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
                                  backgroundColor:
                                      Colors.white.withOpacity(.75)),
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
                                  // TODO (low) send email using backend? ugh
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
            ],
          ),
        ),
      ),
    );
  }
}
