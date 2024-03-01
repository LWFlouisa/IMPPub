# Writes a post, converts to txt input, uses input to create a magazine issue.
system("nano _posts/input.md; markdown _posts/input.md > _posts/input.txt; ruby create_issue.rb")
