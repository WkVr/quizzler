import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:quizzler/score.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Score> scoreKeeper = [];

  final List<Question> _questionBank = [
    Question(
        question: 'Some cats are actually allergic to humans', answer: true),
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true),
    Question(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    Question(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
    Question(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    Question(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    Question(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    Question(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    Question(
        question: 'Google was originally called \"Backrub\".', answer: true),
    Question(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    Question(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

  Question? question;

  QuizBrain() {
    question = _questionBank[_questionNumber];
  }

  String getQuestionText() => question!.question;

  void _nextQuestion() {
    if (!determineEndOfQuiz()) {
      _questionNumber++;
      question = _questionBank[_questionNumber];
    }
  }

  bool determineEndOfQuiz() => _questionNumber + 1 == _questionBank.length;

  void resetQuiz() {
    scoreKeeper = [];
    _questionNumber = 0;
    question = _questionBank[_questionNumber];
  }

  void determineAnswer(bool answer) {
    if (!determineEndOfQuiz()) {
      bool correctResult = question!.answer == answer;
      scoreKeeper.add(Score(
        icon: Icon(
          correctResult ? Icons.check : Icons.close,
          color: correctResult ? Colors.green : Colors.red,
        ),
        correct: correctResult,
      ));
      _nextQuestion();
    }
  }

  String determineScore() =>
      '${scoreKeeper.where((i) => i.correct).length}/${_questionBank.length}';
}
