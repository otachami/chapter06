import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> contacts = [
    {'name': '山田太郎', 'number': '0707-8945-8909', 'address': '東京都'},
    {'name': '佐藤花子', 'number': '0808-1234-5678', 'address': '大阪府'},
    {'name': '鈴木一郎', 'number': '0909-9876-5432', 'address': '北海道'},
    {'name': '田中美咲', 'number': '0505-1111-2222', 'address': '福岡県'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.phone),
              title: Text(contacts[index]['name']!),
              subtitle: Text(contacts[index]['number']!),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailPage(contact: contacts[index]);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.contact}) : super(key: key);

  final Map<String, String> contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(('${contact['name']}'))),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 30),
                  Icon(Icons.account_circle, size: 40),
                  Text(
                    '名前: ${contact['name']}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 30),
                  Icon(Icons.phone, size: 40),
                  SizedBox(width: 8),
                  Text(
                    '電話番号: ${contact['number']}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 30),
                  Icon(Icons.home, size: 40),
                  SizedBox(width: 8),
                  Text(
                    '住所: ${contact['address']}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  // 電話をかける処理をここに記述
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.phone, size: 24), Text('電話をかける')],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
