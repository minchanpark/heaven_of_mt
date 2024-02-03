import 'package:flutter/material.dart';

class ChurchDiscoOnboarding extends StatelessWidget {
  const ChurchDiscoOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        SizedBox(
            width: width * 0.43,
            height: height * 0.806,
            child:
                Image.asset('assets/images/back_image.png', fit: BoxFit.fill)),
        Padding(
          padding: EdgeInsets.only(left: width * 0.028, top: height * 0.043),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.222,
                    height: height * 0.222,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/onboarding_church_disco.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 35 / 1280),
                  Column(
                    children: [
                      SizedBox(height: height * 0.019),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "권장인원:",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          const Text(
                            "4-5명",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.037),
                          const Text(
                            "난이도:",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          const Text(
                            "☆☆☆☆☆",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.299,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "제시된 단어를 보고, 그 단어가 들어간",
                    style: TextStyle(
                      fontFamily: 'DungGeunMo',
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "찬양을 한 소절 불러주세요.",
                    style: TextStyle(
                      fontFamily: 'DungGeunMo',
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.395,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "앞에 나온 찬양을 제외하고",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "다른 찬양을 한 소절씩 불러주세요.",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
        ),
        Positioned(
          top: height * 0.49,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "모든 팀원이 서로 다른 찬양을 부르면",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "성공입니다!",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
        ),
        Positioned(
          top: height * 0.587,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ex.",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "사랑",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "너무나 많이 ‘사랑'한 죄~",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  ": FT아일랜드 - 사랑앓이",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
        )
      ],
    );
  }
}

class ChurchCaptainOnboarding extends StatelessWidget {
  const ChurchCaptainOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        SizedBox(
            width: width * 0.43,
            height: height * 0.806,
            child:
                Image.asset('assets/images/back_image.png', fit: BoxFit.fill)),
        Padding(
          padding: EdgeInsets.only(left: width * 0.028, top: height * 0.043),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.222,
                    height: height * 0.222,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/onboarding_church_captain.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 35 / 1280),
                  Column(
                    children: [
                      SizedBox(height: height * 0.019),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "권장인원:",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          const Text(
                            "5명",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.037),
                          const Text(
                            "난이도:",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          const Text(
                            "☆",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.299,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "술래 혼자 문제를 확인하세요.",
                    style: TextStyle(
                      fontFamily: 'DungGeunMo',
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.355,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "술래가 생각하기에 가장 문제와 어울리는",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "1등, 2등, 3등을 뽑아주세요.",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
        ),
        Positioned(
          top: height * 0.45,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "술래가 뽑은 세 명을 보고,",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "다른 사람들은 문제를 맞춰주세요.",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
        ),
        Positioned(
          top: height * 0.545,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "4)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "문제를 맞춘 사람이 다음 술래가 되어",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "게임을 진행하세요.",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
        ),
      ],
    );
  }
}

class ChurchFourOnboarding extends StatelessWidget {
  const ChurchFourOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        SizedBox(
          width: width * 0.43,
          height: height * 0.806,
          child: Image.asset('assets/images/back_image.png', fit: BoxFit.fill),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.028, top: height * 0.043),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.222,
                    height: height * 0.222,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/onboarding_church_four.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 35 / 1280),
                  Column(
                    children: [
                      SizedBox(height: height * 0.019),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "권장인원:",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          const Text(
                            "4-5명",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.037),
                          const Text(
                            "난이도:",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          const Text(
                            "☆☆",
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.299,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "순서를 정하세요.",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.356,
          left: width * 0.028,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2)",
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "제시된 두 글자를 보고,",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "뒤에 이어질 두 글자를 답해주세요.",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
        ),
        Positioned(
          top: height * 0.45,
          left: width * 0.028,
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ex.",
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "'그리 _ _’ = 그리'스도'!",
                    style: TextStyle(
                      fontFamily: 'DungGeunMo',
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
              ]),
        )
      ],
    );
  }
}
