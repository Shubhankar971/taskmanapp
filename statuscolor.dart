Color getStatusColor(String status) {
  switch (status) {
    case "Done":
      return Colors.green.shade200;
    case "In Progress":
      return Colors.orange.shade200;
    default:
      return Colors.red.shade200;
  }
}