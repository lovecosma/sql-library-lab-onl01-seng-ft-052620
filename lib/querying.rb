def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL
  SELECT books.title, books.year
  FROM books
  JOIN series
  ON books.series_id = series.id
  WHERE series.id = 1
  ORDER BY books.year;
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  <<-SQL
  SELECT characters.name, characters.motto
  FROM characters
  ORDER BY LENGTH(characters.motto) DESC
  LIMIT 1;
  SQL
end


def select_value_and_count_of_most_prolific_species
  <<-SQL
  SELECT characters.species, COUNT(characters.id)
  FROM characters
  GROUP BY characters.species
  ORDER BY COUNT(characters.id) DESC
  LIMIT 1;
  SQL
end

def select_name_and_series_subgenres_of_authors
  <<-SQL
  SELECT authors.name, subgenres.name
  FROM authors
  JOIN series
  ON authors.id = series.author_id
  JOIN subgenres
  ON subgenres.id = series.subgenre_id
  SQL
end

def select_series_title_with_most_human_characters
  <<-SQL
  SELECT series.title
  FROM series
  JOIN books
  ON series.id = books.series_id
  JOIN character_books
  ON character_books.book_id = books.id
  JOIN characters
  ON characters.id  = character_books.id
  WHERE characters.species = "human"
  GROUP BY series.title
  ORDER BY COUNT(characters.id) DESC
  SQL
end

def select_character_names_and_number_of_books_they_are_in
  <<-SQL
  SELECT chararcters.name, COUNT(books.id)
  FROM characters
  JOIN character_books
  ON books.id = character_books.book_id
  GROUP BY characters.name
  ORDER BY COUNT(books.id) DESC, characters.name ASC
  SQL
end
