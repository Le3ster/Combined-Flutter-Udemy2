import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // The actual question text
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                // The user's chosen answer (in red)
                Text(
                  itemData['user_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 203, 68, 54),
                  ),
                ),
                // The correct answer (in green)
                Text(
                  itemData['correct_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 40, 128, 81),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
