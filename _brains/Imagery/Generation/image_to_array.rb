system("clear")

system("jp2a images/image_1.jpg > image_text/image_1.txt;
        jp2a images/image_2.png > image_text/image_2.txt")

image_1 = File.readlines("image_text/image_1.txt")
image_2 = File.readlines("image_text/image_2.txt")

total_size = image_1.size.to_i
interval = 0

open("_posts/input.md", "w") { |f|
  f.puts "<pre>"

  total_size.times do
    f.puts image_1[interval]

    interval = interval + 1
  end

  f.puts "</pre>"
}
