import 'package:flutter/material.dart';
import 'package:tarkari_customer/widget/cart.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({Key key,this.vegetableList}) : super(key: key);
  final List<Map> vegetableList;

  @override
  _DataTableExampleState createState() => _DataTableExampleState(vegetableList: vegetableList);
}

class _DataTableExampleState extends State<DataTableExample> {
  _DataTableExampleState({Key key,this.vegetableList});
  final List<Map> vegetableList;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    print('datatable');
    print(vegetableList);
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
        source: DessertDataSource(desserts: List<Dessert>.generate(vegetableList.length, (index) => Dessert(vegetableList[index]['name'], vegetableList[index]['price'], vegetableList[index]['quantity'], vegetableList[index]['price']*vegetableList[index]['quantity']))),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
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
  Dessert(this.name, this.rate, this.quantity, this.amount);
  final String name;
  final int rate;
  final int quantity;
  final int amount;
}

Dessert Convert(Map vegetable){
  return new Dessert(vegetable['name'], vegetable['price'], vegetable['quantity'],  vegetable['price']* vegetable['quantity']);
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  DessertDataSource({this.desserts});
  int _selectedCount = 0;
  // final List<Map> vegetableList;
  
  List<Dessert> desserts;
  
  //  = <Dessert>[
  //   new Dessert('Frozen yogurt', 159, 6.0, 24),
  //   new Dessert('Ice cream sandwich', 237, 9.0, 37),
  // ];
  

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= desserts.length) return null;
    final Dessert dessert = desserts[index];
    return DataRow.byIndex(
        index: index,
        cells: <DataCell>[
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