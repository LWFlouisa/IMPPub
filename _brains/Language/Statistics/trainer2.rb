require 'rubygems'
require 'naive_bayes'

a = NaiveBayes.new(:spam, :ham)
a.db_filepath = 'path/to/anywhere.nb'

a.train(:spam, 'bad', 'word')
a.train(:ham, 'good', 'word')

a.save
