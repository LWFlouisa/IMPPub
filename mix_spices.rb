# Writes a post, converts to txt input, uses input to create a magazine issue.
# system("nano _posts/input.md; markdown _posts/input.md > _posts/input.txt; ruby create_issue.rb")

# execute script and write results to md file.
# create issue.
system("ruby spices_with_heat.rb; markdown _posts/input.md > _posts/input.txt; ruby create_issue.rb")
