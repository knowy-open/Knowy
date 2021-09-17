class Option {
  final int oid;
  String optionInput;
  final int qid;
  int point = 0;
  Option(this.oid, this.optionInput, this.qid);

  bool equals(Option option) {
    if (option.oid == this.oid) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Option oid: " +
        oid.toString() +
        " Option point: " +
        point.toString();
  }
}
