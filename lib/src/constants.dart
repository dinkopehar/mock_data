import 'dart:math' show Random;

var random = Random(DateTime.now().millisecondsSinceEpoch);

// List of all male names for mockName function.
var maleNames = Set<String>.from([
  'Liam','Noah','William',
  'James','Logan','Benjamin',
  'Mason','Elijah','Oliver',
  'Jacob','John','Robert',
  'Michael','David','Richard',
  'Charles','Joseph','Thomas',
  'Owen','Dylan','Luke',
  'Gabriel','Anthony','Isaac',
  'Grayson','Jack','Levi',
  'Christopher','Joshua','Andrew',
  'Lincoln','Mateo','Ryan',
  'Aron','Jonathan','Connor',
  'Nolan','Nicholas','Austin',
  'Evan','Maverick','Parker',
  'Kevin','Miles','Luis',
  'Justin','Max','Ivan',
  'Eric', 'Blake'
]);

// List of all female names for mockName function.
var femaleNames = Set<String>.from([
  'Emma','Olivia','Ava',
  'Isabella','Sophia','Tylor',
  'Charlotte','Amelia','Evelyn',
  'Abigail','Mary','Patricia',
  'Linda','Barbara','Elizabeth',
  'Jennifer','Maria','Susan',
  'Margaret','Dorothy', 'Emily',
  'Madison','Hannah','Olivia',
  'Abigail','Ashley','Samantha',
  'Alexa','Alexis','Sarah',
  'Alyssa','Grace','Sophia',
  'Rachel','Megan','Kaitlyn',
  'Katherine','Savannah','Ella',
  'Alexandra','Haley','Allison',
  'Maria','Nicole','Kaylee',
  'Lily','Stephanie','Melanie',
  'Marissa','Claire'
]);

// Random build parts for mockUrl function.
var path = List<String>()..addAll(['foo', 'bar', 'buz', 'qux']);
var query = List<String>()..addAll(['b=3', 'd=4', 'username=waldo', 'q=xyzzy']);
var fragment = List<String>()..addAll(['here', 'there', 'near', 'above', 'below']);
