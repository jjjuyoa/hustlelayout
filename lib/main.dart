import 'package:flutter/material.dart';
import 'memberPage.dart';

void main() {
  runApp(const MyApp());
}

class University {
  final String name;
  final List<Club> clubs;

  University(this.name, this.clubs);
}

class Club {
  final String name;
  final String imageURL;

  Club(this.name, this.imageURL);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 변수 추가: 검색창 관련
  String searchValue = '';

  // 대학 및 동아리 정보 생성
  List<University> universities = [
    University('가톨릭대학교', [
      Club('바스타즈', 'https://randomuser.me/api/portraits/men/18.jpg'),
      // 다른 동아리 정보 추가
    ]),
    University('한양대학교', [
      Club('한양동아리1', 'https://randomuser.me/api/portraits/men/19.jpg'),
      // 다른 동아리 정보 추가
    ]),
    University('서울대학교', [
      Club('서울동아리', 'https://randomuser.me/api/portraits/men/20.jpg'),
      // 다른 동아리 정보 추가
    ]),
    University('연세대학교', [
      Club('연세동아리1', 'https://randomuser.me/api/portraits/men/21.jpg'),
      // 다른 동아리 정보 추가
    ]),
    University('고려대학교', [
      Club('고려동아리1', 'https://randomuser.me/api/portraits/men/22.jpg'),
      // 다른 동아리 정보 추가
    ]),
    University('중앙대학교', [
      Club('중앙동아리1', 'https://randomuser.me/api/portraits/men/23.jpg'),
      // 다른 동아리 정보 추가
    ]),
    University('인하대학교', [
      Club('인하동아리1', 'https://randomuser.me/api/portraits/men/24.jpg'),
      // 다른 동아리 정보 추가
    ]),
    University('국민대학교', [
      Club('국민동아리1', 'https://randomuser.me/api/portraits/men/25.jpg'),
      // 다른 동아리 정보 추가
    ]),
    // 다른 대학 정보 추가
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text("동아리", style: TextStyle(
              color: Colors.black,
            ),),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 275.0, // 검색창 폭을 300.0으로 설정
                  child: _buildSearchBar(),
                ),
              ],
            ),
            Expanded(
              child: _buildList(),
            ),
          ],
        ),
      ),
    );
  }

  // 위젯 추가: 검색창
  Widget _buildSearchBar() {
    return Container(
      alignment: Alignment.centerLeft, // 좌측 정렬
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: '대학 또는 동아리명을 입력하세요.',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // 테두리 경계 반지름을 12로 설정
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // 여백 조절
        ),
        onChanged: (value) {
          setState(() {
            searchValue = value;
          });
        },
      ),
    );
  }

  Widget _buildList() {
    // 검색어를 기반으로 필터링된 대학 및 동아리 정보를 생성
    List<University> filteredUniversities = universities
        .where((university) =>
    university.name.toLowerCase().contains(searchValue.toLowerCase()) ||
        university.clubs
            .any((club) =>
            club.name.toLowerCase().contains(searchValue.toLowerCase()))
    )
        .toList();

    return ListView.builder(
      itemCount: filteredUniversities.length,
      itemBuilder: (BuildContext context, int index) {
        final university = filteredUniversities[index];
        final clubNames = university.clubs.map((club) => club.name).join(', ');
        return Container(
          margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: InkWell(
            onTap: () {
              // 클릭한 대학의 정보를 여기에서 처리하거나 다른 화면으로 이동할 수 있습니다.
              print('클릭된 대학: ${university.name} 클릭된 동아리명: ${clubNames}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      memberPage(
                        universityName: university.name,
                        clubNames: clubNames,
                      ),
                ),
              );
            },
            child: _universityTile(university),
          ),
        );
      },
    );
  }

  Widget _universityTile(University university) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: university.clubs.length,
          itemBuilder: (BuildContext context, int index) {
            return _clubTile(university.clubs[index], university);
          },
        ),
      ],
    );
  }

  Widget _clubTile(Club club, University university) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1), // 테두리 스타일
        borderRadius: BorderRadius.circular(12), // 경계 반지름
      ),
      child: ListTile(
        title: Text(club.name),
        subtitle: Text(university.name),
        leading: Image.network(club.imageURL),
      ),
    );
  }
}
