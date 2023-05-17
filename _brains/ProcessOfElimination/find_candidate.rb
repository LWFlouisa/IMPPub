# Go through candidate process, process input, and create rss release.
system("ruby process.rb; markdown _posts/input.md > _posts/input.txt; ruby create_issue.rb")
