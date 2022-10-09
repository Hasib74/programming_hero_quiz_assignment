/// questions : [{"question":"Wann wurde CHECK24 gegründet?","answers":{"A":"1997","B":"1999","C":"2001","D":"2004"},"questionImageUrl":null,"correctAnswer":"B","score":200},{"question":"Wo befindet sich der CHECK24 Hauptsitz?","answers":{"A":"Berlin","B":"Hamburg","C":"München","D":"Frankfurt"},"questionImageUrl":"https://app.check24.de/vg2-quiz/images/vg2_building_001.jpg","correctAnswer":"C","score":100},{"question":"Was ist <u>keine</u> Leitlinie von CHECK24?","answers":{"A":"Der Kunde ist König.","B":"Der Kunde isst Könige."},"questionImageUrl":"null","correctAnswer":"B","score":50},{"question":"Wie heissen die beiden Familien aus den beliebten CHECK24 Werbespots?","answers":{"A":"Bundy & Jefferson","B":"Pritchett & Dunphy","C":"Heffernan & Spooner","D":"Kruger & Bergmann"},"questionImageUrl":"https://app.check24.de/vg2-quiz/images/vg2_family_001.jpg","correctAnswer":"D","score":200},{"question":"Wie ist das aktuelle Rating der CHECK24 App?","answers":{"A":"Weniger als 1 Stern","B":"2 bis 3 Sterne","C":"3 bis 4 Sterne","D":"über 4 Sterne (fast 5)"},"correctAnswer":"D","score":100},{"question":"Wo checkt man Alles?","answers":{"A":"CHECK23","B":"CHECK24","C":"CHECK1337","D":"CHECK42"},"correctAnswer":"B","score":50},{"question":"Welche App hat mehr Downloads?","answers":{"A":"CHECK24","B":"Verivox"},"correctAnswer":"A","score":50},{"question":"Wie heißt Mary Bergmann aus den belieben CHECK24 Werbespots auf Instagram?","answers":{"A":"ferrerorielle","B":"rocherielle","C":"moncherielle","D":"buenorielle"},"questionImageUrl":"https://app.check24.de/vg2-quiz/images/vg2_mary_001.jpg","correctAnswer":"C","score":200}]

class QuizeModel {
  QuizeModel({
      List<Questions>? questions,}){
    _questions = questions;
}

  QuizeModel.fromJson(dynamic json) {
    if (json['questions'] != null) {
      _questions = [];
      json['questions'].forEach((v) {
        _questions?.add(Questions.fromJson(v));
      });
    }
  }
  List<Questions>? _questions;
QuizeModel copyWith({  List<Questions>? questions,
}) => QuizeModel(  questions: questions ?? _questions,
);
  List<Questions>? get questions => _questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_questions != null) {
      map['questions'] = _questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// question : "Wann wurde CHECK24 gegründet?"
/// answers : {"A":"1997","B":"1999","C":"2001","D":"2004"}
/// questionImageUrl : null
/// correctAnswer : "B"
/// score : 200

class Questions {
  Questions({
      String? question, 
      Answers? answers, 
      dynamic questionImageUrl, 
      String? correctAnswer, 
      num? score,}){
    _question = question;
    _answers = answers;
    _questionImageUrl = questionImageUrl;
    _correctAnswer = correctAnswer;
    _score = score;
}

  Questions.fromJson(dynamic json) {
    _question = json['question'];
    _answers = json['answers'] != null ? Answers.fromJson(json['answers']) : null;
    _questionImageUrl = json['questionImageUrl'];
    _correctAnswer = json['correctAnswer'];
    _score = json['score'];
  }
  String? _question;
  Answers? _answers;
  dynamic _questionImageUrl;
  String? _correctAnswer;
  num? _score;
Questions copyWith({  String? question,
  Answers? answers,
  dynamic questionImageUrl,
  String? correctAnswer,
  num? score,
}) => Questions(  question: question ?? _question,
  answers: answers ?? _answers,
  questionImageUrl: questionImageUrl ?? _questionImageUrl,
  correctAnswer: correctAnswer ?? _correctAnswer,
  score: score ?? _score,
);
  String? get question => _question;
  Answers? get answers => _answers;
  dynamic get questionImageUrl => _questionImageUrl;
  String? get correctAnswer => _correctAnswer;
  num? get score => _score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    if (_answers != null) {
      map['answers'] = _answers?.toJson();
    }
    map['questionImageUrl'] = _questionImageUrl;
    map['correctAnswer'] = _correctAnswer;
    map['score'] = _score;
    return map;
  }

}

/// A : "1997"
/// B : "1999"
/// C : "2001"
/// D : "2004"

class Answers {
  Answers({
      String? a, 
      String? b, 
      String? c, 
      String? d,}){
    _a = a;
    _b = b;
    _c = c;
    _d = d;
}

  Answers.fromJson(dynamic json) {
    _a = json['A'];
    _b = json['B'];
    _c = json['C'];
    _d = json['D'];
  }
  String? _a;
  String? _b;
  String? _c;
  String? _d;
Answers copyWith({  String? a,
  String? b,
  String? c,
  String? d,
}) => Answers(  a: a ?? _a,
  b: b ?? _b,
  c: c ?? _c,
  d: d ?? _d,
);
  String? get a => _a;
  String? get b => _b;
  String? get c => _c;
  String? get d => _d;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['A'] = _a;
    map['B'] = _b;
    map['C'] = _c;
    map['D'] = _d;
    return map;
  }

}