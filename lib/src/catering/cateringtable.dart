import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    tableSkeleton = data.map((row) {
      List<Widget> countlessRow = row.getRange(0, row.length - 1).map((column) {
        return Text(
          column.toString(),
        );
      }).toList();
      countlessRow.add();
      return TableRow(children: countlessRow);
    }).toList();

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
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      // border: TableBorder.symmetric(
      // inside: BorderSide(color: Colors.white.withOpacity(.5)),
      // outside: BorderSide.none,
      // ),
      children: tableSkeleton,
    );
  }
}
