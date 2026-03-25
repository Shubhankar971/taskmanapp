class Task {
  int? id;
  String title;
  String description;
  String dueDate;
  String status;
  int? blockedBy;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.status,
    this.blockedBy,
  });

  factory Task.fromJson(List data) {
    return Task(
      id: data[0],
      title: data[1],
      description: data[2],
      dueDate: data[3],
      status: data[4],
      blockedBy: data[5],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "due_date": dueDate,
      "status": status,
      "blocked_by": blockedBy,
    };
  }
}