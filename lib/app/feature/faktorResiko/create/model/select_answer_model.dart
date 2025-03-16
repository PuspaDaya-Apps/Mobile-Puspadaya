class SelectAnswerModel {
  final String questionId;
  final List<String> answerId;
  final bool isMultipleChoice;
  final String? otherAnswer;

  const SelectAnswerModel({
    required this.questionId,
    required this.answerId,
    required this.isMultipleChoice,
    this.otherAnswer, // ✅ Bisa kosong atau null
  });
}
