INSERT = 1
PRINT = 2
SEARCH = 3
GET_OUT = 4

def welcome
  'Bem vindo ao Diário de Estudos, seu companheiro para Estudar !'
end

def menu
  puts "[#{INSERT}] - Para Cadastrar um item para estudar"
  puts "[#{PRINT}] - Ver Todos os itens cadastrados"
  puts "[#{SEARCH}] - Buscar um item de estudo"
  puts "[#{GET_OUT}] - Sair"
  print "Escolha sua opção: "
  gets.to_i
end

def register_study_item
  print 'Digite o título do seu item de estudo: '
  title = gets.chomp
  print 'Digite a categoria do seu item de estudo: '
  category = gets.chomp
  puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
  { title: title, category: category }
end

def print_items(collection)
  puts "=========== Itens Cadastrados =========== "  
  puts "Nenhum Item cadastrado" if collection.empty?
  collection.each_with_index do |item, index|
    puts "# #{index + 1} - #{item[:title]} - #{item[:category]}"
  end
end

def search_item(collection)
  print 'Digite uma palavra para buscar: '
  term = gets.chomp
  found_items = collection.filter do |item|
    item[:title].include? term
end
print_items(found_items)
end

study_items = []
puts welcome
option = menu
system('clear')
  loop do
    system('clear')
    if option == INSERT    
      study_items << register_study_item
    elsif option == PRINT
      print_items(study_items)
    elsif option == SEARCH
      search_item(study_items)
    elsif option == GET_OUT
      break
    end

  option = menu
  system('clear')
  end
  
  puts 'Obrigado por usar o Diário de Estudos'