import 'dart:convert';

MatchModel matchModelFromJson(String str) => MatchModel.fromJson(json.decode(str));

String matchModelToJson(MatchModel data) => json.encode(data.toJson());

class MatchModel {
  final Matchdetail? matchdetail;
  final List<String>? nuggets;
  final List<Inning>? innings;
  final Map<String, Team>? teams;
  final Map<String, List<String>>? notes;

  MatchModel({
    this.matchdetail,
    this.nuggets,
    this.innings,
    this.teams,
    this.notes,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
    matchdetail: json["Matchdetail"] == null ? null : Matchdetail.fromJson(json["Matchdetail"]),
    nuggets: json["Nuggets"] == null ? [] : List<String>.from(json["Nuggets"]!.map((x) => x)),
    innings: json["Innings"] == null ? [] : List<Inning>.from(json["Innings"]!.map((x) => Inning.fromJson(x))),
    teams: Map.from(json["Teams"]!).map((k, v) => MapEntry<String, Team>(k, Team.fromJson(v))),
    notes: Map.from(json["Notes"]!).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "Matchdetail": matchdetail?.toJson(),
    "Nuggets": nuggets == null ? [] : List<dynamic>.from(nuggets!.map((x) => x)),
    "Innings": innings == null ? [] : List<dynamic>.from(innings!.map((x) => x.toJson())),
    "Teams": Map.from(teams!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "Notes": Map.from(notes!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
  };
}

class Inning {
  final String? number;
  final String? battingteam;
  final String? total;
  final String? wickets;
  final String? overs;
  final String? runrate;
  final String? byes;
  final String? legbyes;
  final String? wides;
  final String? noballs;
  final String? penalty;
  final String? allottedOvers;
  final List<InningBatsman>? batsmen;
  final PartnershipCurrent? partnershipCurrent;
  final List<Bowler>? bowlers;
  final List<FallofWicket>? fallofWickets;
  final PowerPlay? powerPlay;
  final String? target;

  Inning({
    this.number,
    this.battingteam,
    this.total,
    this.wickets,
    this.overs,
    this.runrate,
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.penalty,
    this.allottedOvers,
    this.batsmen,
    this.partnershipCurrent,
    this.bowlers,
    this.fallofWickets,
    this.powerPlay,
    this.target,
  });

  factory Inning.fromJson(Map<String, dynamic> json) => Inning(
    number: json["Number"],
    battingteam: json["Battingteam"],
    total: json["Total"],
    wickets: json["Wickets"],
    overs: json["Overs"],
    runrate: json["Runrate"],
    byes: json["Byes"],
    legbyes: json["Legbyes"],
    wides: json["Wides"],
    noballs: json["Noballs"],
    penalty: json["Penalty"],
    allottedOvers: json["AllottedOvers"],
    batsmen: json["Batsmen"] == null ? [] : List<InningBatsman>.from(json["Batsmen"]!.map((x) => InningBatsman.fromJson(x))),
    partnershipCurrent: json["Partnership_Current"] == null ? null : PartnershipCurrent.fromJson(json["Partnership_Current"]),
    bowlers: json["Bowlers"] == null ? [] : List<Bowler>.from(json["Bowlers"]!.map((x) => Bowler.fromJson(x))),
    fallofWickets: json["FallofWickets"] == null ? [] : List<FallofWicket>.from(json["FallofWickets"]!.map((x) => FallofWicket.fromJson(x))),
    powerPlay: json["PowerPlay"] == null ? null : PowerPlay.fromJson(json["PowerPlay"]),
    target: json["Target"],
  );

  Map<String, dynamic> toJson() => {
    "Number": number,
    "Battingteam": battingteam,
    "Total": total,
    "Wickets": wickets,
    "Overs": overs,
    "Runrate": runrate,
    "Byes": byes,
    "Legbyes": legbyes,
    "Wides": wides,
    "Noballs": noballs,
    "Penalty": penalty,
    "AllottedOvers": allottedOvers,
    "Batsmen": batsmen == null ? [] : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
    "Partnership_Current": partnershipCurrent?.toJson(),
    "Bowlers": bowlers == null ? [] : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
    "FallofWickets": fallofWickets == null ? [] : List<dynamic>.from(fallofWickets!.map((x) => x.toJson())),
    "PowerPlay": powerPlay?.toJson(),
    "Target": target,
  };
}

class InningBatsman {
  final String? batsman;
  final String? runs;
  final String? balls;
  final String? fours;
  final String? sixes;
  final String? dots;
  final String? strikerate;
  final String? dismissal;
  final String? howout;
  final String? bowler;
  final String? fielder;
  final bool? isonstrike;

  InningBatsman({
    this.batsman,
    this.runs,
    this.balls,
    this.fours,
    this.sixes,
    this.dots,
    this.strikerate,
    this.dismissal,
    this.howout,
    this.bowler,
    this.fielder,
    this.isonstrike,
  });

  factory InningBatsman.fromJson(Map<String, dynamic> json) => InningBatsman(
    batsman: json["Batsman"],
    runs: json["Runs"],
    balls: json["Balls"],
    fours: json["Fours"],
    sixes: json["Sixes"],
    dots: json["Dots"],
    strikerate: json["Strikerate"],
    dismissal: json["Dismissal"],
    howout: json["Howout"],
    bowler: json["Bowler"],
    fielder: json["Fielder"],
    isonstrike: json["Isonstrike"],
  );

  Map<String, dynamic> toJson() => {
    "Batsman": batsman,
    "Runs": runs,
    "Balls": balls,
    "Fours": fours,
    "Sixes": sixes,
    "Dots": dots,
    "Strikerate": strikerate,
    "Dismissal": dismissal,
    "Howout": howout,
    "Bowler": bowler,
    "Fielder": fielder,
    "Isonstrike": isonstrike,
  };
}

class Bowler {
  final String? bowler;
  final String? overs;
  final String? maidens;
  final String? runs;
  final String? wickets;
  final String? economyrate;
  final String? noballs;
  final String? wides;
  final String? dots;
  final bool? isbowlingtandem;
  final bool? isbowlingnow;
  final List<ThisOver>? thisOver;

  Bowler({
    this.bowler,
    this.overs,
    this.maidens,
    this.runs,
    this.wickets,
    this.economyrate,
    this.noballs,
    this.wides,
    this.dots,
    this.isbowlingtandem,
    this.isbowlingnow,
    this.thisOver,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
    bowler: json["Bowler"],
    overs: json["Overs"],
    maidens: json["Maidens"],
    runs: json["Runs"],
    wickets: json["Wickets"],
    economyrate: json["Economyrate"],
    noballs: json["Noballs"],
    wides: json["Wides"],
    dots: json["Dots"],
    isbowlingtandem: json["Isbowlingtandem"],
    isbowlingnow: json["Isbowlingnow"],
    thisOver: json["ThisOver"] == null ? [] : List<ThisOver>.from(json["ThisOver"]!.map((x) => ThisOver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Bowler": bowler,
    "Overs": overs,
    "Maidens": maidens,
    "Runs": runs,
    "Wickets": wickets,
    "Economyrate": economyrate,
    "Noballs": noballs,
    "Wides": wides,
    "Dots": dots,
    "Isbowlingtandem": isbowlingtandem,
    "Isbowlingnow": isbowlingnow,
    "ThisOver": thisOver == null ? [] : List<dynamic>.from(thisOver!.map((x) => x.toJson())),
  };
}

class ThisOver {
  final String? t;
  final String? b;

  ThisOver({
    this.t,
    this.b,
  });

  factory ThisOver.fromJson(Map<String, dynamic> json) => ThisOver(
    t: json["T"],
    b: json["B"],
  );

  Map<String, dynamic> toJson() => {
    "T": t,
    "B": b,
  };
}

class FallofWicket {
  final String? batsman;
  final String? score;
  final String? overs;

  FallofWicket({
    this.batsman,
    this.score,
    this.overs,
  });

  factory FallofWicket.fromJson(Map<String, dynamic> json) => FallofWicket(
    batsman: json["Batsman"],
    score: json["Score"],
    overs: json["Overs"],
  );

  Map<String, dynamic> toJson() => {
    "Batsman": batsman,
    "Score": score,
    "Overs": overs,
  };
}

class PartnershipCurrent {
  final String? runs;
  final String? balls;
  final List<PartnershipCurrentBatsman>? batsmen;

  PartnershipCurrent({
    this.runs,
    this.balls,
    this.batsmen,
  });

  factory PartnershipCurrent.fromJson(Map<String, dynamic> json) => PartnershipCurrent(
    runs: json["Runs"],
    balls: json["Balls"],
    batsmen: json["Batsmen"] == null ? [] : List<PartnershipCurrentBatsman>.from(json["Batsmen"]!.map((x) => PartnershipCurrentBatsman.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Runs": runs,
    "Balls": balls,
    "Batsmen": batsmen == null ? [] : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
  };
}

class PartnershipCurrentBatsman {
  final String? batsman;
  final String? runs;
  final String? balls;

  PartnershipCurrentBatsman({
    this.batsman,
    this.runs,
    this.balls,
  });

  factory PartnershipCurrentBatsman.fromJson(Map<String, dynamic> json) => PartnershipCurrentBatsman(
    batsman: json["Batsman"],
    runs: json["Runs"],
    balls: json["Balls"],
  );

  Map<String, dynamic> toJson() => {
    "Batsman": batsman,
    "Runs": runs,
    "Balls": balls,
  };
}

class PowerPlay {
  final String? pp1;
  final String? pp2;

  PowerPlay({
    this.pp1,
    this.pp2,
  });

  factory PowerPlay.fromJson(Map<String, dynamic> json) => PowerPlay(
    pp1: json["PP1"],
    pp2: json["PP2"],
  );

  Map<String, dynamic> toJson() => {
    "PP1": pp1,
    "PP2": pp2,
  };
}

class Matchdetail {
  final String? teamHome;
  final String? teamAway;
  final Match? match;
  final Series? series;
  final Venue? venue;
  final Officials? officials;
  final String? weather;
  final String? tosswonby;
  final String? status;
  final String? statusId;
  final String? playerMatch;
  final String? result;
  final String? winningteam;
  final String? winmargin;
  final String? equation;

  Matchdetail({
    this.teamHome,
    this.teamAway,
    this.match,
    this.series,
    this.venue,
    this.officials,
    this.weather,
    this.tosswonby,
    this.status,
    this.statusId,
    this.playerMatch,
    this.result,
    this.winningteam,
    this.winmargin,
    this.equation,
  });

  factory Matchdetail.fromJson(Map<String, dynamic> json) => Matchdetail(
    teamHome: json["Team_Home"],
    teamAway: json["Team_Away"],
    match: json["Match"] == null ? null : Match.fromJson(json["Match"]),
    series: json["Series"] == null ? null : Series.fromJson(json["Series"]),
    venue: json["Venue"] == null ? null : Venue.fromJson(json["Venue"]),
    officials: json["Officials"] == null ? null : Officials.fromJson(json["Officials"]),
    weather: json["Weather"],
    tosswonby: json["Tosswonby"],
    status: json["Status"],
    statusId: json["Status_Id"],
    playerMatch: json["Player_Match"],
    result: json["Result"],
    winningteam: json["Winningteam"],
    winmargin: json["Winmargin"],
    equation: json["Equation"],
  );

  Map<String, dynamic> toJson() => {
    "Team_Home": teamHome,
    "Team_Away": teamAway,
    "Match": match?.toJson(),
    "Series": series?.toJson(),
    "Venue": venue?.toJson(),
    "Officials": officials?.toJson(),
    "Weather": weather,
    "Tosswonby": tosswonby,
    "Status": status,
    "Status_Id": statusId,
    "Player_Match": playerMatch,
    "Result": result,
    "Winningteam": winningteam,
    "Winmargin": winmargin,
    "Equation": equation,
  };
}

class Match {
  final String? livecoverage;
  final String? id;
  final String? code;
  final String? league;
  final String? number;
  final String? type;
  final String? date;
  final String? time;
  final String? offset;
  final String? daynight;

  Match({
    this.livecoverage,
    this.id,
    this.code,
    this.league,
    this.number,
    this.type,
    this.date,
    this.time,
    this.offset,
    this.daynight,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    livecoverage: json["Livecoverage"],
    id: json["Id"],
    code: json["Code"],
    league: json["League"],
    number: json["Number"],
    type: json["Type"],
    date: json["Date"],
    time: json["Time"],
    offset: json["Offset"],
    daynight: json["Daynight"],
  );

  Map<String, dynamic> toJson() => {
    "Livecoverage": livecoverage,
    "Id": id,
    "Code": code,
    "League": league,
    "Number": number,
    "Type": type,
    "Date": date,
    "Time": time,
    "Offset": offset,
    "Daynight": daynight,
  };
}

class Officials {
  final String? umpires;
  final String? referee;

  Officials({
    this.umpires,
    this.referee,
  });

  factory Officials.fromJson(Map<String, dynamic> json) => Officials(
    umpires: json["Umpires"],
    referee: json["Referee"],
  );

  Map<String, dynamic> toJson() => {
    "Umpires": umpires,
    "Referee": referee,
  };
}

class Series {
  final String? id;
  final String? name;
  final String? status;
  final String? tour;
  final String? tourName;

  Series({
    this.id,
    this.name,
    this.status,
    this.tour,
    this.tourName,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
    id: json["Id"],
    name: json["Name"],
    status: json["Status"],
    tour: json["Tour"],
    tourName: json["Tour_Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Status": status,
    "Tour": tour,
    "Tour_Name": tourName,
  };
}

class Venue {
  final String? id;
  final String? name;

  Venue({
    this.id,
    this.name,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
  };
}

class Team {
  final String? nameFull;
  final String? nameShort;
  final Map<String, Player>? players;

  Team({
    this.nameFull,
    this.nameShort,
    this.players,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    nameFull: json["Name_Full"],
    nameShort: json["Name_Short"],
    players: Map.from(json["Players"]!).map((k, v) => MapEntry<String, Player>(k, Player.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "Name_Full": nameFull,
    "Name_Short": nameShort,
    "Players": Map.from(players!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Player {
  final String? position;
  final String? nameFull;
  final Batting? batting;
  final Bowling? bowling;
  final bool? iscaptain;
  final bool? iskeeper;

  Player({
    this.position,
    this.nameFull,
    this.batting,
    this.bowling,
    this.iscaptain,
    this.iskeeper,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    position: json["Position"],
    nameFull: json["Name_Full"],
    batting: json["Batting"] == null ? null : Batting.fromJson(json["Batting"]),
    bowling: json["Bowling"] == null ? null : Bowling.fromJson(json["Bowling"]),
    iscaptain: json["Iscaptain"],
    iskeeper: json["Iskeeper"],
  );

  Map<String, dynamic> toJson() => {
    "Position": position,
    "Name_Full": nameFull,
    "Batting": batting?.toJson(),
    "Bowling": bowling?.toJson(),
    "Iscaptain": iscaptain,
    "Iskeeper": iskeeper,
  };

  String getFormattedPlayerName() {
    String name = nameFull ?? "Unknown";
    List<String> highlights = [];
    if (iscaptain == true) highlights.add("C");
    if (iskeeper == true) highlights.add("WK");
    return highlights.isNotEmpty ? "$name (${highlights.join(" & ")})" : name;
  }
}

class Batting {
  final String? style;
  final String? average;
  final String? strikerate;
  final String? runs;

  Batting({
    this.style,
    this.average,
    this.strikerate,
    this.runs,
  });

  factory Batting.fromJson(Map<String, dynamic> json) => Batting(
    style: json["Style"],
    average: json["Average"],
    strikerate: json["Strikerate"],
    runs: json["Runs"],
  );

  Map<String, dynamic> toJson() => {
    "Style": style,
    "Average": average,
    "Strikerate": strikerate,
    "Runs": runs,
  };
}

class Bowling {
  final String? style;
  final String? average;
  final String? economyrate;
  final String? wickets;

  Bowling({
    this.style,
    this.average,
    this.economyrate,
    this.wickets,
  });

  factory Bowling.fromJson(Map<String, dynamic> json) => Bowling(
    style: json["Style"],
    average: json["Average"],
    economyrate: json["Economyrate"],
    wickets: json["Wickets"],
  );

  Map<String, dynamic> toJson() => {
    "Style": style,
    "Average": average,
    "Economyrate": economyrate,
    "Wickets": wickets,
  };
}
