
p 'pls enter path to the file you want to encrypt'
file_path = gets.chomp
p 'pls enter shift'
shift = gets.chomp.to_i
p 'pls enter path to encrypted file'
encrypted_file = gets.chomp

def rotate_alphabets(alphabets, shift)
  caesar_dict = Hash.new 
  alphabets.each do |alphabet|
    caesar_dict = caesar_dict.merge(Hash[alphabet.zip(alphabet.rotate(shift))])
  end
  caesar_dict
end

def caesar(text, shift, alphabets)
  caesar_dict = rotate_alphabets(alphabets, shift)
  line = ''
  text.each_char{|ch| line << caesar_dict.fetch(ch, ch) }
  line
end

File.open('encrypted_file', 'w'){}

alphabets = []
alphabets << ('A'..'Z').to_a
alphabets << ('a'..'z').to_a
alphabets << ('А'..'Я').to_a
alphabets << ('а'..'я').to_a
alphabets << ('0'..'9').to_a


File.open('/home/runner/task2/to_histogram/lolkek.txt', 'r') do |file|
    for line in file
      File.open(encrypted_file, 'a'){|f| f.write(caesar(line, shift, alphabets))}
    end  
end
