import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamber_choir_outreach/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MobileView extends StatefulWidget {
  double breakPoint;

  MobileView({super.key, required this.breakPoint});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final videoURL = "https://youtu.be/YaMSwHWv0io?si=3iHcr9QysB7cVqXH";
  final videoID = "YaMSwHWv0io";

  final YoutubePlayerController _youtubeController = YoutubePlayerController();
  final ScrollController _scrollController = ScrollController();
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();

    _youtubeController.cueVideoById(videoId: videoID);
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      setState(() {
        _progress = currentScroll / maxScroll;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###,###,###');
    // //* 후원금액
    // int donation = 1000000;
    // int donationPercent = ((donation / 8765000) * 100).toInt();
    // //* 후원자
    // int donor = 100;
    // //*

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          LinearProgressBar(
            minHeight: 5,
            maxSteps: 100000,
            currentStep: (_progress * 100000).toInt(),
            progressType: LinearProgressBar.progressTypeLinear,
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.breakPoint),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/2023outreach.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          const AutoSizeText(
                            '하나님 앞에서, 챔가대 아웃리치 사역',
                            maxFontSize: 36,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              //* 모인 금액 확인
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "후원 금액",
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            f.format(Data.donation),
                                            style: const TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(" 원"),
                                          const SizedBox(width: 10),
                                          Text(
                                            "${Data.donationPercent}%",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: size.width * 0.12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "후원자",
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            "${Data.donor}",
                                            style: const TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(" 명"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "후원금액과 후원자 수는 매일 오전 중으로 업데이트됩니다.",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                              const SizedBox(height: 20),
                              const Divider(),
                              const SizedBox(height: 20),
                              //*
                              const AutoSizeText(
                                "안녕하세요!\n저희는 악기와 목소리로 하나님을 찬양하는 한동대학교 소속 신앙공동체로 한동의 주일 오전예배를 섬기고 있는 챔가대입니다.",
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Image.asset('assets/images/chamberchoir.jpg'),
                              const SizedBox(height: 20),
                              const Text(
                                '저희 챔가대는 매년 여름 방학 기간동안 학기중에 드린 찬양의 고백을 실천하고자 아웃리치를 떠나고 있습니다. 이번에는 일손 부족으로 어려움을 겪는 농가가 많은 괴산지역으로 가게 되었습니다.저희의 섬김과 위로가 가는 곳곳 마다 잘 전해지기를 함께 응원해 주시고 기도해 주세요.',
                              ),
                              const SizedBox(height: 20),
                              const Divider(),
                              const SizedBox(height: 20),

                              //*-----주제 소개------
                              const AutoSizeText(
                                "주제 소개",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                  text: const TextSpan(children: [
                                TextSpan(text: "이번 2024 아웃리치의 주제는 "),
                                TextSpan(
                                    text: "'코람데오: 하나님 앞에서'",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "입니다."),
                              ])),
                              const Text(
                                  "중심을 잃어가는 세상 속 하나님의 자녀된 우리는 그분 앞에서 어떠한 삶의 형태로 살아가야 할지 함께 고민하고 나누는 시간을 갖고자 합니다. 많은 응원과 기도 부탁드립니다!"),

                              const SizedBox(height: 20),
                              const Divider(),
                              const SizedBox(height: 20),

                              //* 아웃리치 활동 내용
                              const AutoSizeText(
                                "아웃리치 활동 내용",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(height: 20),
                              const AutoSizeText("일정",
                                  maxLines: 1,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const AutoSizeText(
                                "합숙 기간: 07/17 ~ 07/18",
                                maxLines: 1,
                              ),
                              const AutoSizeText(
                                "현지 사역: 07/19 ~ 07/29",
                                maxLines: 1,
                              ),
                              const SizedBox(height: 20),

                              const AutoSizeText("장소",
                                  maxLines: 1,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const AutoSizeText(
                                "충북 괴산군 칠성면 칠성로2길 18-6 새찬양교회",
                                maxLines: 1,
                              ),

                              const SizedBox(height: 20),
                              const Divider(),
                              const SizedBox(height: 20),

                              const AutoSizeText(
                                "아웃리치 사역 소개",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),

                              const SizedBox(height: 10),
                              const Text("우리가 앞으로 하게 될 사역에 대해 소개합니다."),
                              const Text("크게 4가지 활동이 이루어집니다."),

                              //* 1. 농촌 일손 돕기
                              const SizedBox(height: 20),
                              const AutoSizeText(
                                "1. 농촌 일손 돕기",
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Image.asset('assets/images/outreach_work.JPEG'),
                              const SizedBox(height: 20),
                              const AutoSizeText(
                                  "마을 어르신들을 돕기 위해 농촌 일손을 지원합니다. 괴산 지역의 많은 농가가 일손 부족으로 어려움을 겪고 있어 청년들의 도움이 절실하다고 합니다. 이를 위해 약 45-50명의 청년 군사들을 보유하고 있는 챔가대가 출동합니다!"),

                              //* 2. 미니 드림
                              const SizedBox(height: 20),
                              const AutoSizeText(
                                "2. 미니 드림",
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Image.asset('assets/images/outreach_dream.JPEG'),
                              const SizedBox(height: 20),
                              const AutoSizeText(
                                  "사역지에서 진행하는 챔가대 소규모 문화사역과 예배 입니다. 지역 주민들을 초청하여 챔가대의 음악과 다양한 컨텐츠를 통하여 복음을 전하는 문화사역입니다!흥 콘텐츠, 워십 콘텐츠, 스킷, 그리고 챔버와 챔가대 찬양의  순서로 이루어집니다."),

                              //* 3. 캠프
                              const SizedBox(height: 20),
                              const AutoSizeText(
                                "3. 캠프",
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Image.asset('assets/images/outreach_camp.jpeg'),
                              const SizedBox(height: 20),

                              const AutoSizeText(
                                  "2024 아웃리치에서는 어르신들을 위한 노인 대학과 아이들을 위한 어린이 캠프가 함께 이루어집니다! 특히,이번에는 처음으로 어르신들을 대상으로 하는 노인 대학이 준비되었습니다. 어르신들과의 소중한 교제를 통해 믿음 있는 청년들의 밝은 에너지를 전달하고, 우리도 어른들에게서 삶의 지혜를 배워오길 기대합니다."),

                              //* 4. 벽화
                              const SizedBox(height: 20),
                              const AutoSizeText(
                                "4. 벽화",
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Image.asset('assets/images/outreach_draw.JPEG'),
                              const SizedBox(height: 20),
                              const AutoSizeText(
                                  "노후된 벽에 생기를 불어넣어주는 벽화 그리기 봉사가 진행됩니다! 예쁜 벽화를 통해 괴산지역에 활기나 넘치길 기대합니다."),

                              const SizedBox(height: 40),
                              Image.asset('assets/images/outreach_camp3.jpeg'),

                              const SizedBox(height: 20),
                              const Text(
                                  "이러한 활동이 이루어질 수 있도록 총무팀, 예배팀,디자인팀, 메딕팀, 캠프팀, 미니드림팀, 셰프팀, 미디어팀 등 다양한  팀으로 나눠져 아웃리치를 준비하고 있습니다."),

                              const SizedBox(height: 20),
                              const Divider(),
                              const SizedBox(height: 20),

                              const AutoSizeText(
                                "보다 구체적인 활동은 아래 링크와 영상을 통해 확인해주시면 감사하겠습니다!",
                                maxLines: 2,
                              ),

                              const SizedBox(height: 20),
                              YoutubePlayer(
                                controller: _youtubeController,
                                aspectRatio: 16 / 9,
                              ),
                              const SizedBox(height: 20),

                              const Text("챔가대와 아웃리치가 더 궁금하다면?"),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      launchUrl(
                                        Uri.parse(
                                            "https://youtube.com/playlist?list=PLfX39K5jcwTp6yYuXRKo-3PTZTFmW34m9&si=YNIOLz30o340lW97"),
                                      );
                                    },
                                    child: const Text(
                                      "작년 아웃리치 영상 보러가기",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        // decoration: TextDecoration.underline,
                                        // decorationColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      launchUrl(
                                        Uri.parse(
                                            "https://www.instagram.com/hdchamchoir_official?igsh=N2dqbDhwMXM3anh6"),
                                      );
                                    },
                                    child: const Text(
                                      "챔가대 인스타그램 보러가기",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        // decoration: TextDecoration.underline,
                                        // decorationColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),
                              const Divider(),
                              const SizedBox(height: 20),

                              const AutoSizeText(
                                "아웃리치 예산안",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),

                              const SizedBox(height: 20),
                              Image.asset('assets/images/budget.jpeg'),
                              const SizedBox(height: 20),

                              const Text(
                                  "2주간의 봉사를 위해서는 시간뿐만 아니라 물질적인 지원도 필요합니다. 학생의 신분으로 학기 중에 아르바이트를 하는 것이 어려운 상황에서, 매년 후원자분들의 귀한 섬김을 통해 아웃리치를 만들어 나가고 있습니다. 후원자 분들의 사랑의 섬김과 함께 소중한 봉사를 이루어 나가길 소망합니다!"),

                              const SizedBox(height: 20),
                              const Divider(),
                              const SizedBox(height: 20),

                              const AutoSizeText(
                                "기도제목",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),

                              const SizedBox(height: 10),
                              const Text("기도제목을 나눕니다!"),
                              const SizedBox(height: 20),

                              //* 1. 괴산 지역을 위해서
                              const Text(
                                "1. 괴산 지역을 위해서",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15.5),
                                child: Text(
                                    "괴산 지역에 하나님의 씨앗이 심겨져 주님을 아는 기쁨을 경험할 수 있도록, 주민들의 삶의 결이 하나님과 닮아가기를 기도해주세요."),
                              ),

                              //* 2. 아웃리치를 위해서
                              const Text(
                                "2. 아웃리치를 위해서",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15.5),
                                child: Text(
                                    "이번 아웃리치를 통해 우리의 고백이 하나님께 기쁨이 되기를 바랍니다. 우리의 섬김이 드러나는 것이 아니라 하나님의 사랑이 드러나는 2주간의 여정이 되기를 기도해주세요."),
                              ),

                              //* 3. 챔가대 공동체를 위해서
                              const Text(
                                "3. 챔가대 공동체를 위해서",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15.5),
                                child: Text(
                                    "챔가대 공동체의 주인이 되어 주셔서 우리 안에서 건강한 교제가 이루어지기를, 또한 극심한 더위 속에서도 우리의 몸과 마음이 건강하기를 기도해주세요."),
                              ),

                              //* 4. 공동체원 개인을 위해서
                              const Text(
                                "4. 공동체원 개인을 위해서",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15.5),
                                child: Text(
                                    "아웃리치를 통해 하나님 앞에서의 삶을 고민하며, 그 과정에서 개인에게 한결같이 역사하시는 하나님을 만나기를, 그분과의 깊은 교제가 이루어지기를 기도해주세요."),
                              ),

                              const SizedBox(height: 20),
                              const Divider(),
                              const SizedBox(height: 20),

                              //*--------------------------------------------------------------
                              const AutoSizeText(
                                "후원 계좌 및 안내사항",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                  "아웃리치를 위한 재정을 공동체 계좌로 후원받고 있습니다! 후원하실 때, 후원자의 이름을 함께 기입해주시면 감사하겠습니다. 아웃리치에 필요한 재정은 소중한 후원을 통해 채워지게 됩니다. 귀한 섬김을 통해 함께 챔가대 아웃리치에 동참해 주시길 기대합니다! 감사합니다!"),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text(
                                    "후원 계좌 | ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SelectableText(
                                      "토스뱅크 100128189335 김현기(챔가대 아웃리치)"),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton.icon(
                            onPressed: () {
                              Clipboard.setData(const ClipboardData(
                                  text: "토스뱅크 100128189335"));
                              SnackBar snackBar = const SnackBar(
                                content: Text("계좌번호가 복사되었습니다."),
                                duration: Duration(seconds: 1),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              fixedSize: const Size(double.maxFinite, 40),
                            ),
                            icon: const Icon(
                              FontAwesomeIcons.moneyCheckDollar,
                              size: 16,
                            ),
                            label: const Text(
                              "후원계좌번호 복사하기",
                              // style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              launchUrl(
                                Uri.parse(
                                    "https://link.kakaopay.com/_/UcbO9wc"),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              fixedSize: const Size(double.maxFinite, 40),
                            ),
                            icon: const Icon(
                              FontAwesomeIcons.solidComment,
                              color: Colors.black,
                              size: 16,
                            ),
                            label: const Text(
                              "카카오페이로 후원하기",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              launchUrl(
                                Uri.parse(
                                    "supertoss://send?amount=0&bank=%ED%86%A0%EC%8A%A4%EB%B1%85%ED%81%AC&accountNo=100128189335"),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: const Size(double.maxFinite, 40),
                            ),
                            icon: Image.asset(
                              'assets/images/toss_icon.png',
                              width: 24,
                              height: 24,
                            ),
                            label: const Text(
                              "토스송금으로 후원하기",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
