// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class IRespository {
  Future<Answer> doSomething(Message bla);
}

class Repository implements IRespository {
  @override
  Future<Answer> doSomething(Message str) async {
    print(str);
    return Answer(answ: "original");
  }
}

class MyService {
  IRespository repo;

  MyService({
    required this.repo,
  });

  void useRepo(String mg) async {
    Answer answer = await repo.doSomething(Message(str: mg));
    print(answer.answ);
  }
}

class Message {
  String str;

  Message({
    required this.str,
  });
}

class Answer {
  String answ;
  Answer({
    required this.answ,
  });
  
}
