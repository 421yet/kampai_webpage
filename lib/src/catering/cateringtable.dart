import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CateringTable extends StatefulWidget {
  final List<List<dynamic>> _data;

  const CateringTable(this._data, {super.key});

  @override
  State<CateringTable> createState() => _CateringTableState();
}

class _CateringTableState extends State<CateringTable> {
  List<List<dynamic>> get data => widget._data;
  late List<TableRow> tableSkeleton = [];
  // late List<int> counts;

  @override
  initState() {
    super.initState();
    // counts = List.filled(data.length - 1, 0);
    _populateTable();
  }

  _populateTable() {
    tableSkeleton.add(TableRow(
        children: data.first.getRange(0, data.first.length - 1).map((cell) {
      return TableCell(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(cell.toString(), style: GoogleFonts.prata())));
    }).toList()));
    tableSkeleton.addAll(data.getRange(1, data.length - 1).map((row) {
      return TableRow(
          children: row.getRange(0, row.length - 1).map((column) {
        return TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              column.toString(),
            ),
          ),
        );
      }).toList());
    }).toList());

    /// DOESNT FUCKING WORK AND I DONT KNOW WHY
    // establish 0th row as column names
    // tableSkeleton.add(TableRow(
    //   children: [
    //     TableCell(child: Text(data.first.first)),
    //     Table(children: [
    //       TableRow(children: [
    //         for (String cell in data.first.getRange(1, data.first.length))
    //           TableCell(
    //             verticalAlignment: TableCellVerticalAlignment.middle,
    //             child: Padding(
    //               padding: const EdgeInsets.all(8),
    //               child: Text(
    //                 cell,
    //                 style: GoogleFonts.prata(fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //           ),
    //       ])
    //     ]),
    //   ],
    // ));

    // List<Widget> catContent = [];
    // List<TableRow> subTableChildren = [];

    // // populate with data
    // for (List<dynamic> row in data.getRange(1, data.length)) {
    //   if (row.first.isNotEmpty) // gauranteed String; if new category
    //   {
    //     catContent
    //         .add(Table(children: subTableChildren)); // add prev cat as table
    //     tableSkeleton.add(TableRow(children: catContent));
    //     subTableChildren = [];
    //     catContent = []; // establish new catergory
    //     catContent.add(TableCell(child: Text(row.first))); // category name
    //   }
    //   // add all columns as tablerow
    //   List<TableCell> subTableRowChildren = [];
    //   for (dynamic cell
    //       in row.getRange(1, row.length - 1)) // every column except count!
    //   {
    //     // making each row
    //     subTableRowChildren.add(TableCell(child: Text(cell.toString())));
    //   }
    //   subTableRowChildren.add(const TableCell(
    //       child: Text('0'))); // adding count, TODO make Object oriented
    //   subTableChildren.add(TableRow(children: subTableRowChildren)); //
    // }
    // catContent.add(Table(children: subTableChildren)); // add last cat as table
    // tableSkeleton.add(TableRow(children: catContent));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              const Text('Explore our catering options in depth using our '),
              ElevatedButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero, // Set this
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 8), // and this
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Google Sheets'),
                    SvgPicture.asset(
                      'images/menu/Google_Sheets.svg',
                      height: 20,
                    ),
                    const Text(' Tool'),
                  ],
                ),
                onPressed: () {
                  launchUrl(Uri.parse(
                      'https://docs.google.com/spreadsheets/d/1QAZJdcIPVDhRowuiLAdVRS17LTFZOzQlP35ylqamZcw/edit?usp=sharing'));
                },
              ),
              const Text('.'),
            ],
          ),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.symmetric(
            inside: BorderSide(color: Colors.white.withOpacity(.25)),
            outside: BorderSide(color: Colors.white.withOpacity(.25)),
          ),
          children: tableSkeleton,
        ),
      ],
    );
  }
}
