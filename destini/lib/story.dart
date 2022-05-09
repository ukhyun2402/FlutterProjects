class Story {
  late String _storyTitle;
  late String _choice1;
  late String _choice2;

  Story(
      {required String storyTitle,
      required String choice1,
      required String choice2}) {
    _storyTitle = storyTitle;
    _choice1 = choice1;
    _choice2 = choice2;
  }

  String get storyTitle => _storyTitle;
  String get choice1 => _choice1;
  String get choice2 => _choice2;
}
