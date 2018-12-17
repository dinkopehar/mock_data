/// @nodoc
import 'dart:math' show Random;

var random = Random(DateTime.now().millisecondsSinceEpoch);

var maleNames = Set<String>.from([
  'Liam','Noah','William',
  'James','Logan','Benjamin',
  'Mason','Elijah','Oliver',
  'Jacob','John','Robert',
  'Michael','David','Richard',
  'Charles','Joseph','Thomas'
]);

var femaleNames = Set<String>.from([
  'Emma','Olivia','Ava',
  'Isabella','Sophia','Tylor',
  'Charlotte','Amelia','Evelyn',
  'Abigail','Mary','Patricia',
  'Linda','Barbara','Elizabeth',
  'Jennifer','Maria','Susan',
  'Margaret','Dorothy'
]);
