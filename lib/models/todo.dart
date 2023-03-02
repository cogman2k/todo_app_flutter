class ToDo {
  String? id;
  String? title;
  String? date;
  bool done;

  ToDo({
    required this.id,
    required this.title,
    this.date = "",
    this.done = false,
  });

  static List<ToDo> initTodoList() {
    return [
      ToDo(
          id: '01',
          title: 'Doing homework',
          date: '2023/03/01 8:00',
          done: false),
      ToDo(
          id: '02',
          title: 'Morning Excercise',
          date: '2023/03/01 8:00',
          done: true),
      ToDo(
          id: '03',
          title: 'Send mail to David',
          date: '2023/03/01 8:00',
          done: false),
      ToDo(
          id: '04',
          title: 'Buy some food',
          date: '2023/03/01 8:00',
          done: true),
    ];
  }
}
