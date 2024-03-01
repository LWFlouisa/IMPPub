# Require Ruby gems
require "naive_bayes"

# Make the labels of Naive base resemble naturalistic descriptions.
a = NaiveBayes.new(  :complement,           :noncomplement,
                     :complementary_flavor, :noncomplementary_flavor,
                     :complementary_colors, :noncomplementary_colors,
                     :poisonous,
)

a.db_filepath = "_data/complements/complements.nb"

# Train t
a.train(:complement,           "Things that go well together", "word")
a.train(:noncomplement, "Things that don't go well together.", "word")

# Complementary Flavors
a.train(:complementary_flavor,       "sweet and salty", "word")
a.train(:complementary_flavor, "peanuts and chocolate", "word")
a.train(:complementary_flavor, "caramel and chocolate", "word")
a.train(:complementary_flavor,      "cream and coffee", "word")
a.train(:complementary_flavor,  "pepper and sourkraut", "word")
a.train(:complementary_flavor, "ketchup and sourkraut", "word")

# Non Complementary Flavors
a.train(:noncomplementary_flavor,   "ketchup and chocolate", "word")
a.train(:noncomplementary_flavor, "chocolate and sourkraut", "word")
a.train(:noncomplementary_flavor,     "caramel and ketchup", "word")

a.train(:poisonous, "ammonia and chocolate", "word")

a.save
