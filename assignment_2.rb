def snake_camel(snake_str)
  string = snake_str.gsub(/(_[a-z])/) {|match| match[1].upcase}
end

def find_by(attribute, value)
  answer = connection.execute <<-SQL
    SELECT #{attribute} FROM #{table}
    WHERE value = #{value}
  SQL
  answer
end
