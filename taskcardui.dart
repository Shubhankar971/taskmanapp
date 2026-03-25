return Container(
  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: isBlocked ? Colors.grey[200] : Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        blurRadius: 10,
        color: Colors.black12,
        offset: Offset(0, 4),
      )
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(task.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(height: 6),
      Text(task.description, style: TextStyle(color: Colors.grey)),

      SizedBox(height: 10),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Chip(
            label: Text(task.status),
            backgroundColor: getStatusColor(task.status),
          ),
          Text("Due: ${task.dueDate.split(" ")[0]}"),
        ],
      )
    ],
  ),
);