import 'dart:math' show Random;

var random = Random(DateTime.now().millisecondsSinceEpoch);

/// List of all male names for [mockName] function.
var maleNames = Set<String>.from([
  'Liam','Noah','William',
  'James','Logan','Benjamin',
  'Mason','Elijah','Oliver',
  'Jacob','John','Robert',
  'Michael','David','Richard',
  'Charles','Joseph','Thomas'
]);

/// List of all female names for [mockName] function.
var femaleNames = Set<String>.from([
  'Emma','Olivia','Ava',
  'Isabella','Sophia','Tylor',
  'Charlotte','Amelia','Evelyn',
  'Abigail','Mary','Patricia',
  'Linda','Barbara','Elizabeth',
  'Jennifer','Maria','Susan',
  'Margaret','Dorothy'
]);
