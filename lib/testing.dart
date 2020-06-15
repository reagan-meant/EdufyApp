import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:sqflite/sqflite.dart';
/*
Future<List<Object>> databaseSetup() async{
  final input = new File('classes.csv').openRead();
  final fields = await input
      .transform(utf8.decoder)
      .transform(new CsvToListConverter())
      .toList();
  return fields;
}
 
Database database = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
  await db.execute(
      'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
});


 insertClients(List<Client> clients) async {
    final db = await database;
    var buffer = new StringBuffer();
    clients.forEach((c) {
      if (buffer.isNotEmpty) {
        buffer.write(",\n");
      }
      buffer.write("('");
      buffer.write(c.firstName);
      buffer.write("', '");
      buffer.write(c.lastName);
      buffer.write("', '");
      buffer.write(c.address);
      buffer.write("')");
    });
    var raw =
        await db.rawInsert("INSERT Into Clients (firstName,lastName,address)"
            " VALUES ${buffer.toString()}");
    return raw;
  } */