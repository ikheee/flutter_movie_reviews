import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 앱이 모바일이나 웹, 데스크톱, 맥 등 어떤 플랫폼에서도 자연스럽게 보이도록 지원
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 영화 제목, 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Movie Reviews",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_outline),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "영화 제목을 검색해 주세요.",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Divider(height: 1),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: dataList.length,
          //     itemBuilder: (context, index) {
          //       String category = dataList[index]["category"];
          //       String imgUrl = dataList[index]["imgUrl"];
          //       return Card(
          //         child: Stack(
          //           alignment: Alignment.center,
          //           children: [
          //             Image.network(
          //               imgUrl,
          //               width: double.infinity,
          //               height: 200,
          //               fit: BoxFit.cover,
          //             ),
          //             Container(
          //               width: double.infinity,
          //               height: 200,
          //               color: Colors.black.withOpacity(0.5),
          //             ),
          //             Text(
          //               category,
          //               style: TextStyle(
          //                 fontSize: 36,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.0,
              ),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                String category = dataList[index]["category"];
                String imgUrl = dataList[index]["imgUrl"];
                return Stack(alignment: Alignment.center, children: [
                  Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
