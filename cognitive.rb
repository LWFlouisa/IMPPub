require_relative "_parser/cparser.rb"

# Initialize the decision tree.
Cognitive::CognitiveML.decision_tree

# Perform cognitive parsing task from decision tree input.
Cognitive::CogExecute.check_file
