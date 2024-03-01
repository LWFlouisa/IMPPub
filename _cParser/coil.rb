#       8       1               3
#       +       +               +
#      / \     / \             / \
#     /   \   /   \           /   \
#    /     \ /     \         /     \
# 7 +       X       + 2     /       \
#    \     / \     /       /         \
#     \   /   \   /       /           \
#      \ /     \ /     9 +-------------+ 6
#       +       +        
#       5       4


module IMPBrain
  class Coil
 
    # User Decisions
    def self.imagery
      system("cd  _brains/Imagery/Generation; generate.rb")
      system("cd _brains/Imagery/Recognition; generate.rb")
    end

    def self.language
      system("cd _brains/Language/Statistics; ruby get_frequency.rb")
    end

    def self.memories
      system("cd _brains/Memories; ruby get_memories.rb")
    end

    def self.aiml
      system("ruby IMPChat.rb")
    end

    def self.tuning
      system("cd _brains/Tuning; ruby generate_xenharmonic.rb")
    end

    ## Admin Decisions
    def self.poetry
    end

    def self.cooking
    end

    def self.blogging
    end

    def self.user_decisions
      require "decisiontree"

      attribute = ["First Branch"]

      training = [
                           [8.0, "imagery"],  [1.0, "language"],
        [7.0, "memories"],                                       [2.0, "elimination"],
                           [5.0,    "aiml"],  [4.0,   "tuning"],
      ]

      dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
      dec_tree.train

      test     = [user_input]
      decision = dec_tree.predict(test)
    end

    def self.admin_decisions
      require "decisiontree"

      attribute = ["Second Branch"]

      training = [
                         [3.0, "blogging"],
        [6.0, "poetry"],                    [9.0, "cooking"],
      ]

      dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
      dec_tree.train

      test     = [admin_input]
      decision = dec_tree.predict(test)
    end
  end
end
