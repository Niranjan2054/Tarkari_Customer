import 'package:flutter/material.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({Key key}) : super(key: key);

  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
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
        source: DessertDataSource(),
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
  final double quantity;
  final int amount;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    new Dessert('Frozen yogurt', 159, 6.0, 24),
    new Dessert('Ice cream sandwich', 237, 9.0, 37),
    new Dessert('Eclair', 262, 16.0, 24),
    new Dessert('Cupcake', 305, 3.7, 67),
    new Dessert('Gingerbread', 356, 16.0, 49),
    new Dessert('Jelly bean', 375, 0.0, 94),
    new Dessert('Lollipop', 392, 0.2, 98),
    new Dessert('Honeycomb', 408, 3.2, 87),
    new Dessert('Donut', 452, 25.0, 51),
    new Dessert('KitKat', 518, 26.0, 65),
    new Dessert('Frozen yogurt with sugar', 168, 6.0, 26),
    new Dessert('Ice cream sandwich with sugar', 246, 9.0, 39),
    new Dessert('Eclair with sugar', 271, 16.0, 26),
    new Dessert('Cupcake with sugar', 314, 3.7, 69),
    new Dessert('Gingerbread with sugar', 345, 16.0, 51),
    new Dessert('Jelly bean with sugar', 364, 0.0, 96),
    new Dessert('Lollipop with sugar', 401, 0.2, 100),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
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
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}