class CodeChallenge
  def initialize(file)
    @data = data(file)
  end

  def get_unique_full_names
    group_data(@data).count
  end

  def get_unique_last_names
    group_data(last_names).count
  end

  def get_unique_first_names
    group_data(first_names).count
  end

  def get_ten_common_last_names
    group_data(last_names).max_by(10){|key,value| value}.to_h
  end

  def get_ten_common_first_names
    group_data(first_names).max_by(10){|key,value| value}.to_h
  end

  def get_specially_unique(number)
    names = @data.map do |line|
      line.split(', ')
    end
    array = []
    index = 0
    while array.size < number do
      first_names = array.map do |ele|
        ele[:first_name]
      end
      last_names = array.map do |ele|
        ele[:last_name]
      end
      if !last_names.include?(names[index][0]) && !first_names.include?(names[index][1])
        array << { first_name: names[index].last,
                  last_name: names[index].first }
      end
      index += 1
    end
    array.map do |ele|
      "#{ele[:last_name]}, #{ele[:first_name]}"
    end
  end

  def get_modified_names(number)
    split_names = get_specially_unique(number).map do |ele|
      ele.split(', ')
    end
    names_array = split_names.each_with_index.map do |name, index|
      if index < split_names.count - 1
        "#{name.first}, #{split_names[index + 1][1]}"
      else
        "#{name.first}, #{split_names.first.last}"
      end
    end
    puts "The modified names are: #{names_array}"
  end

  private

  def group_data(info)
    info.group_by{|ele| ele}.map{|key, value| [key, value.length]}.to_h
  end

  def data(file)
    opened_file = File.open(file) do |file|
      remove_second_line = file.readlines().each_slice(2).map(&:first)
    end
    data = opened_file.map do |string|
      string[/[^--]+/].chop
    end
  end

  def last_names
    @data.map do |name|
      name.split(',').first
    end
  end

  def first_names
    @data.map do |name|
      name.split(',').last
    end
  end
end

code = CodeChallenge.new('data.txt')
puts "There are #{code.get_unique_full_names} unique full names"
puts "There are #{code.get_unique_last_names} unique last names"
puts "There are #{code.get_unique_first_names} unique first names"
puts "The ten most common last names are #{code.get_ten_common_last_names}"
puts "The ten most common first names are #{code.get_ten_common_first_names}"
puts "The specially unique names are: #{code.get_specially_unique(25)}"
puts code.get_modified_names(25)
