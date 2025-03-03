import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<String> dataColumn;
  final List<String> dataRow;
  DataTableWidget({super.key,required this.dataColumn, required this.dataRow});

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      columns: const [
        DataColumn2(
          size: ColumnSize.M,
          label: Text('Day'),
          numeric: true,
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: Text('L'),
          numeric: true,
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: Text('M'),
          numeric: true,
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: Text('S'),
          numeric: true,
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: Text('SD4neg'),
          numeric: true,
        ),
        DataColumn2(
          size: ColumnSize.M,
          label: Text('SD3neg'),
          numeric: true,
        ),
        DataColumn2(
          label: Text('SD2neg'),
          numeric: true,
        ),
        DataColumn2(
          label: Text('SD1neg'),
          numeric: true,
        ),
        DataColumn2(
          label: Text('SD0'),
          numeric: true,
        ),
        DataColumn2(
          label: Text('SD1'),
          numeric: true,
        ),
        DataColumn2(
          label: Text('SD2'),
          numeric: true,
        ),
        DataColumn2(
          label: Text('SD3'),
          numeric: true,
        ),
        DataColumn2(
          label: Text('SD4'),
          numeric: true,
        ),
      ],
      rows: [
        DataRow(cells: [
          DataCell(
              Text('0')
          ),
          DataCell(Text(' 1')),
          DataCell(Text('49,8842')),
          DataCell(Text('0,03795')),
          DataCell(Text('42,312')),
          DataCell(Text('44,205')),
          DataCell(Text('46,098')),
          DataCell(Text('47,991')),
          DataCell(Text('49,884')),
          DataCell(Text('51,777')),
          DataCell(Text('53,67')),
          DataCell(Text('55,564')),
          DataCell(Text('57,457')),
        ]),
      ],
    );
  }
}
