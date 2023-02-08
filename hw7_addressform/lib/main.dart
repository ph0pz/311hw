import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Address Form'),
          ),
          body: const MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final zipController = TextEditingController();
  final distictController = TextEditingController();

  Map<String,List> data = {
    'Mueang Chiang Mai': [
      'Si Phum',
      'Phra Sing',
      'Hai Ya',
      'Chang Moi',
      'Chang Khlan',
      'Wat Ket',
      'Chang Phueak',
      'Suthep',
      'Mae Hia',
      'Pa Daet',
      'Nong Hoi',
      'Tha Sala',
      'Nong Pa Khrang',
      'Fa Ham',
      'Pa Tan',
      'San Phi Suea'
    ],
    'Chom Thong': [
      'Ban Luang',
      'Khuang Pao',
      'Sop Tia',
      'Ban Pae',
      'Doi Kaeo',
      'Mae Soi'
    ],
    'Mae Chaem': [
      'Chang Khoeng',
      'The Pha',
      'Ban Thap',
      'Mae Suek',
      'Mae Na Chon',
      'Pang Hin Fon',
      'Kong Khaek'
    ],
    'Chiang Dao': [
      'Chiang Dao',
      'Mueang Na',
      'Mueang Ngai',
      'Mae Na',
      'Mueang Khong',
      'Ping Khong',
      'Thung Khao Phuang'
    ],
    'Doi Saket': [
      'Choeng Doi',
      'San Pu Loei',
      'Luang Nuea',
      'Pa Pong',
      'Sa-nga Ban',
      'Pa Lan',
      'Talat Khwan',
      'Samran Rat',
      'Mae Khue',
      'Talat Yai',
      'Mae Hoi Ngoen',
      'Mae Pong',
      'Pa Miang',
      'Thep Sadet'
    ],
    'Mae Taeng': [
      'San Maha Phon',
      'Mae Taeng',
      'Khilek',
      'Cho Lae',
      'Mae Ho Phra',
      'Sop Poeng',
      'Ban Pao',
      'San Pa Yang',
      'Pa Pae',
      'Mueang Kai',
      'Ban Chang',
      'Kuet Chang',
      'Inthakhin'
    ],
    'Mae Rim': [
      'Rim Tai',
      'Rim Nuea',
      'San Pong',
      'Khilek',
      'Saluang',
      'Huai Sai',
      'Mae Raem',
      'Pong Yaeng',
      'Mae Sa',
      'Don Kaeo',
      'Mueang Kaeo'
    ],
    'Samoeng': ['Samoeng Tai', 'Samoeng Nuea', 'Mae Sap', 'Bo Kaeo', 'Yang Moen'],
    'Fang': [
      'Wiang',
      'Mon Pin',
      'Mae Ngon',
      'Mae Sun',
      'San Sai',
      'Mae Kha',
      'Mae Kha',
      'Pong Nam Ron'
    ],
    'Mae Ai': [
      'Mae Ai',
      'Mae Sao',
      'San Ton Mue',
      'Mae Na Wang',
      'Tha Ton',
      'Ban Luang',
      'Malika'
    ],
    'Phrao': [
      'Wiang',
      'Thung Luang',
      'Pa Tum',
      'Pa Nai',
      'San Sai',
      'Ban Pong',
      'Nam Phrae',
      'Khuean Phak',
      'Mae Waen',
      'Mae Pang',
      'Long Khot'
    ],
    'San Pa Tong': [
      'Yu Wa',
      'San Klang',
      'Tha Wang Phrao',
      'Makham Luang',
      'Mae Ka',
      'Ban Mae',
      'Ban Klang',
      'Thung Satok',
      'Thung Tom',
      'Nam Bo Luang',
      'Makhun Wan'
    ],
    'San Kamphaeng': [
      'San Kamphaeng',
      'Sai Mun',
      'Rong Wua Daeng',
      'Buak Khang',
      'Chae Chang',
      'On Tai',
      'Mae Pu Kha',
      'Huai Sai',
      'Ton Pao',
      'San Klang'
    ],
    'San Sai': [
      'San Sai Luang',
      'San Sai Noi',
      'San Phra Net',
      'San Na Meng',
      'San Pa Pao',
      'Nong Yaeng',
      'Nong Chom',
      'Nong Han',
      'Mae Faek',
      'Mae Faek Mai',
      'Mueang Len',
      'Pa Phai'
    ],
    'Hang Dong': [
      'Hang Dong',
      'Nong Kaeo',
      'Han Kaeo',
      'Nong Tong',
      'Khun Khong',
      'Sop Mae Kha',
      'Ban Waen',
      'San Phak Wan',
      'Nong Khwai',
      'Ban Pong',
      'Nam Phrae'
    ],
    'Hot': ['Hang Dong', 'Hot', 'Ban Tan', 'Bo Luang', 'Bo Sali', 'Na Kho Ruea'],
    'Doi Tao': [
      'Doi Tao',
      'Tha Duea',
      'Muet Ka',
      'Ban Aen',
      'Bong Tan',
      'Pong Thung'
    ],
    'Omkoi': [
      'Omkoi',
      'Yang Piang',
      'Mae Tuen',
      'Mon Chong',
      'Sop Khong',
      'Na Kian'
    ],
    'Saraphi': [
      'Yang Noeng',
      'Saraphi',
      'Chomphu',
      'Chai Sathan',
      'Khua Mung',
      'Nong Faek',
      'Nong Phueng',
      'Tha Kwang',
      'Don Kaeo',
      'Tha Wang Tan',
      'San Sai',
      'Pa Bong'
    ],
    'Wiang Haeng': ['Mueang Haeng', 'Piang Luang', 'Saen Hai'],
    'Chai Prakan': ['Pong Tam', 'Si Dong Yen', 'Mae Thalop', 'Nong Bua'],
    'Mae Wang': [
      'Ban Kat',
      'Thung Pi',
      'Thung Ruang Thong',
      'Mae Win',
      'Don Pao'
    ],
    'Mae On': [
      'On Nuea',
      'On Klang',
      'Ban Sahakon',
      'Huai Kaeo',
      'Mae Tha',
      'Tha Nuea'
    ],
    'Doi Lo': ['Doi Lo', 'Song Khwae', 'Yang Khram', 'Santi Suk'],
    'Galayani Vadhana': ['Ban Chan', 'Mae Daet', 'Chaem Luang']
  };
  final emailFormat = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
  final zipFormat = RegExp(r"^[1-9][0-9]{4}$");

  @override
  Widget build(BuildContext context) {
    String selectedKey ="";

    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter Email Address"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please write your Email";
              }
              if (!emailFormat.hasMatch(value)) {
                return "Invalid Email Format";
              }
              else {
                return null;
              }
            },
            controller: nameController,
          ),

          TextFormField(
            decoration: const InputDecoration(labelText: "Enter Zipcode"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please write your Zipcode";
              }
              if (!zipFormat.hasMatch(value)) {
                return "Invalid Zip code Format";
              }
              else {
                return null;
              }
            },
            controller: zipController,
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: const Text("Province: Chiang Mai",
                  style: TextStyle(
                    fontSize: 25,
                  ))

          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("District",
                style: TextStyle(
                  fontSize: 25,
                )),
          ),
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return const Iterable<String>.empty();
              } else {
                return data.keys.where((String key) {
                  return key.toLowerCase().contains(textEditingValue.text.toLowerCase());
                });
              }
            },
            onSelected: (String selected) {
              selectedKey = selected;
            },
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Tambon",
                style: TextStyle(
                  fontSize: 25,
                )),
          ),
          selectedKey != null
              ? Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return data[selectedKey]?.cast<String>() ?? [];

              } else {
                return data[selectedKey]?.cast<String>().where((value) {
                  return value.toLowerCase().contains(textEditingValue.text.toLowerCase());
                }) ?? [];
              }
            },
          )
              : Container(),
          ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "Processing Data")));
                }
              },
              child: const Text("Submit"))
        ],
      ),

    );
  }

}