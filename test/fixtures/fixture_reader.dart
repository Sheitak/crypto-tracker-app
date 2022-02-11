import 'dart:io';

// String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
String getCoinByIdFixture(String name) => File('test/fixtures/getCoinById/$name').readAsStringSync();
String getCoinsListFixture(String name) => File('test/fixtures/getCoinsList/$name').readAsStringSync();