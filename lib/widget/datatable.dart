import 'package:flutter/material.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({Key key,this.vegetableList}) : super(key: key);
  final List<Map> vegetableList;

  @override
  _DataTableExampleState createState() => _DataTableExampleState(vegetableList: vegetableList);
}

class _DataTableExampleState extends State<DataTableExample> {
  _DataTableExampleState({Key key,this.vegetableList});
  final List<Map> vegetableList;
  List<Map> temp;
  int _rowsPerPage = 5;
  @override
  Widget build(BuildContext context) {
    temp = vegetableList.where((vegetable)=>vegetable['quantity']>0).toList();
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('Cart'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: <int>[5, 10, 20],
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
          });
        },
        columns: kTableColumns,
        source: DessertDataSource(desserts: List<Dessert>.generate(temp.length, (index) => Dessert(index+1,temp[index]['name'], temp[index]['price'], temp[index]['quantity'], temp[index]['price']*temp[index]['quantity']))),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: const Text('S.N.'),
  ),
  DataColumn(
    label: const Text('Particular Item'),
  ),
  DataColumn(
    label: const Text('Rate'),
    tooltip: 'The total amount of food energy in the given serving size.',
    numeric: true,
  ),
  DataColumn(
    label: const Text('Quantity'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Amount'),
    numeric: true,
  )
];

////// Data class.
class Dessert {
  Dessert(this.sn,this.name, this.rate, this.quantity, this.amount);
  final int sn;
  final String name;
  final int rate;
  final int quantity;
  final int amount;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  DessertDataSource({this.desserts});
  int _selectedCount = 0;

  List<Dessert> desserts;
 
  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= desserts.length) return null;
    final Dessert dessert = desserts[index];
    return DataRow.byIndex(
        index: index,
        cells: <DataCell>[
          DataCell(Text('${dessert.sn}')),
          DataCell(Text('${dessert.name}')),
          DataCell(Text('${dessert.rate}')),
          DataCell(Text('${dessert.quantity}')),
          DataCell(Text('${dessert.amount}')),
        ]);
  }

  @override
  int get rowCount => desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}