class Jsoninput1 {
  static const jsonInput1 = '''
[
  {
    "0": {"id": 1, "title": "Gingerbread"},
    "1": {"id": 2, "title": "Jellybean"},
    "3": {"id": 3, "title": "KitKat"}
  },
  [
    {"id": 4, "title": "Lollipop"},
    {"id": 5, "title": "Pie"},
    {"id": 6, "title": "Oreo"},
    {"id": 7, "title": "Nougat"}
  ]
]
''';

  static const test = '''[
{
"0":{"id":1,"title":"Gingerbread"},
"1":{"id":2,"title":"Jellybean"},
"3":{"id:3,"title":"KitKat"}

},
[
{"id":4,"title":"Lollipop"},
{"id":5,"title":"Pie"},
{"id":6,"title":"Oreo"},
{"id":7,"title":"Nougat"}
]
]''';
}