import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class ThemeControll {
  static final ThemeControll _singleton = ThemeControll._internal();

  factory ThemeControll() {
    return _singleton;
  }

  ThemeControll._internal();
  ThemeMode _themeMode = ThemeMode.dark;
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeControll()._themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if(ThemeControll()._themeMode == ThemeMode.dark) {
              ThemeControll()._themeMode = ThemeMode.light;
            } else {
              ThemeControll()._themeMode = ThemeMode.dark;

            }
          });
        },
      ),
    );
  }
}

class MyAppThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.dark;

  ThemeData getTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: primaryColor,
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: appBarColor,foregroundColor: primaryTextColor),
      fontFamily: 'Lato',
      textTheme: TextTheme(
        caption: TextStyle(color: secondaryTextColor),
          bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
          bodyText1: TextStyle(fontSize: 13, color: secondaryTextColor),
          headline6:
              TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
          subtitle1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryTextColor)),
      dividerTheme: DividerThemeData(
          thickness: 1, indent: 32, endIndent: 32, color: surfaceColor),
      inputDecorationTheme: InputDecorationTheme(labelStyle: TextStyle(color: primaryTextColor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: surfaceColor,
        prefixIconColor: primaryTextColor
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

   const MyHomePage({super.key, required this.toggleThemeMode});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SkillType {
  photoshop,
  xd,
  illustrator,
  afterEffect,
  lightRoom,
}

class _MyHomePageState extends State<MyHomePage> {
  SkillType _skill = SkillType.photoshop;

  void updateSelectedSkill(SkillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mohammad Shahbazi'),
          actions: [
            Icon(CupertinoIcons.chat_bubble),
            InkWell(
              onTap: () => widget.toggleThemeMode(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                child: Icon(ThemeControll()._themeMode==ThemeMode.dark?CupertinoIcons.sun_min_fill:CupertinoIcons.moon_fill),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/profile_image.jpeg',
                          width: 60,
                          height: 60,
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Masoud Shahbazi',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text('Full Stack Web Developer '),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.placemark,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                size: 14,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Tehran, Iran',
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  "Lorem ipsum dolor sit amet, aliquid liberavisse per at, qui ad amet facete. Per alterum adipisci ea. Equidem pericula ex eos, nullam nusquam erroribus eam an, paulo homero reprehendunt ne nec Lobortis.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Skills",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 12,
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Skill(
                        title: "Photoshop",
                        type: SkillType.photoshop,
                        isActivated: _skill == SkillType.photoshop,
                        imagePath: "assets/images/app_icon_01.png",
                        shadowColor: Colors.blueAccent,
                        onTap: () {
                          updateSelectedSkill(SkillType.photoshop);
                        }),
                    Skill(
                        title: "Adobe XD",
                        type: SkillType.xd,
                        isActivated: _skill == SkillType.xd,
                        imagePath: "assets/images/app_icon_02.png",
                        shadowColor: Colors.pinkAccent,
                        onTap: () {
                          updateSelectedSkill(SkillType.xd);
                        }),
                    Skill(
                        title: "Illustrator",
                        type: SkillType.illustrator,
                        isActivated: _skill == SkillType.illustrator,
                        imagePath: "assets/images/app_icon_03.png",
                        shadowColor: Colors.orangeAccent,
                        onTap: () {
                          updateSelectedSkill(SkillType.illustrator);
                        }),
                    Skill(
                        title: "After Effect",
                        type: SkillType.afterEffect,
                        isActivated: _skill == SkillType.afterEffect,
                        imagePath: "assets/images/app_icon_04.png",
                        shadowColor: Colors.blue.shade800,
                        onTap: () {
                          updateSelectedSkill(SkillType.afterEffect);
                        }),
                    Skill(
                        title: "Lightroom",
                        type: SkillType.lightRoom,
                        isActivated: _skill == SkillType.lightRoom,
                        imagePath: "assets/images/app_icon_05.png",
                        shadowColor: Colors.blueAccent,
                        onTap: () {
                          updateSelectedSkill(SkillType.lightRoom);
                        }),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Information",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(CupertinoIcons.at)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(CupertinoIcons.lock)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Save")),
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
}

class Skill extends StatelessWidget {
  final SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActivated;
  final Function() onTap;

  const Skill({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActivated,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);

    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTap,
      child: Container(
        decoration: isActivated
            ? BoxDecoration(
                color: Theme.of(context).dividerTheme.color,
                borderRadius: defaultBorderRadius)
            : null,
        width: 110,
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActivated
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(imagePath, width: 40, height: 40),
            ),
            SizedBox(
              height: 8,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
