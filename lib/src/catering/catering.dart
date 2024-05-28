import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampai_webpage/src/appbar/bodyfulsliverappbar.dart';
import 'package:kampai_webpage/src/catering/cateringtable.dart';
import 'package:kampai_webpage/src/drawer/kampai_drawer.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart';

class Catering extends StatelessWidget {
  const Catering({super.key});

  static const routeName = '/Catering';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: KampaiDrawer(context).builder(),
      body: CustomScrollView(
        slivers: BodyfulSliverAppBar.build(
          context,
          const _CateringBody(),
        ),
      ),
    );
  }
}

class _CateringBody extends StatefulWidget {
  const _CateringBody();

  @override
  State<_CateringBody> createState() => _CateringBodyState();
}

class _CateringBodyState extends State<_CateringBody> {
  late List<List<dynamic>>? _data = [];

  @override
  initState() {
    super.initState();
    _procureData().then((List<List<dynamic>>? value) {
      if (value != null) {
        setState(() {
          _data = value;
        });
      } else {
        _data = null;
      }
    }, onError: (error) {
      if (kDebugMode) {
        print('Error procuring data: $error');
      }
      throw Exception('Error procuring data');
    });
  }

  Future<List<List<dynamic>>?> _procureData() async {
    Client client = Client();
    final Response response = await client.get(Uri.parse(
        'https://docs.google.com/spreadsheets/d/e/2PACX-1vQD-UkoOOc2dsrGFeeU11Q9-q_pB7bf4xvT_Dcr67_remlmtfJtxHPggR3X3qFv0gHm5jBR0DbbGI5t/pub?gid=696974383&single=true&output=csv'));
    if (response.statusCode == 200) {
      List<List> rows = const CsvToListConverter().convert(response.body);
      return rows;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (_data == null)
            ? Column(
                children: [
                  Text('Oops!', style: GoogleFonts.prata(fontSize: 25)),
                  const Text(
                      'There was an error loading our catering information.'),
                  const Text(
                      'Please contact us directly via email (kampai4949stl@gmail.com) or phone ((314) 367-2020).'),
                ],
              )
            : (_data!.isEmpty)
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CateringTable(_data!),
                  ),
      ],
    );
  }
}
