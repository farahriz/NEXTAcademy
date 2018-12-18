page_1 = "Chapter 1: This is page one"
page_2 = "This is page two"
page_3 = "This is page three"
page_4 = "Chapter 2: This is page four"
page_5 = "This is page five"
page_6 = "This is page six"
page_7 = "Chapter 3: This is page seven"
page_8 = "This is page eight"
page_9 = "This is page nine"
page_10 = "This is page ten"
page_11 = "Chapter 4: This is page eleven"
page_12 = "This is page twelve"
page_13 = "This is page thirteen"

pages = [page_1, page_2, page_3, page_4, page_5, page_6, page_7, page_8, page_9, page_10, page_11, page_12, page_13]

mulan_pages = ["Chapter 1: There was once a girl named Mulan.", 
  "She was the only child of her family.",
  "She had no brothers.",
  "Her father was once an officer in the last war.",
  "Now he was old, and lived happily with his family.",
  "Chapter 2: War",
  "One day, a magistrate came to town saying all men had been called to join the army",
  "Mulan knew her father was old and would have trouble in the war",
  "Mulan disguised herself as a man to join the army in her father's place",
  "Chapter 3: Victory",
  "Mulan was revealed as a woman.",
  "But she saved all of China, so it was cool.",
  "Chapter 4: End",
  "Mulan went home to her living parents.",
  "Everyone lived happily ever after"]

tableau = {
 "Chapter 1" => 0, 
 "Chapter 2" => 3,
 "Chapter 3" => 6,
 "Chapter 4" => 10,
 "Chapter 5" => 12 
}

mulan_tableau = {
 "Chapter 1" => 0, 
 "Chapter 2" => 5,
 "Chapter 3" => 9,
 "Chapter 4" => 12,
}

# p tableau["Chapter 1"]

class Book
  def initialize(pages, tableau)
    @pages = pages
    @current_page = 1 # current page starts from zero
    @table_of_contents = tableau
  end

  def read_page(page_number)
    index = page_number - 1

    puts @pages[index]
  end

  def turn_page
    @current_page += 1 # turning a page increments current page by one
  end

  def read_current_page
    read_page(@current_page)
  end

  def table_of_contents
    @table_of_contents
  end

  def read_chapter(chapter_title)
    chapter_start = @table_of_contents[chapter_title]+1
    @current_page = @table_of_contents[chapter_title]+1
    read_page(@current_page)
  end
end

peter_pan = Book.new(pages, tableau)
peter_pan.read_current_page
peter_pan.read_chapter("Chapter 1")
peter_pan.turn_page
peter_pan.read_current_page

mulan = Book.new(mulan_pages, mulan_tableau)
mulan.read_current_page
mulan.read_chapter("Chapter 2")
mulan.turn_page
mulan.read_current_page
