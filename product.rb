class Product    
    def initialize(name,azul,rojo,verde)
        @name=name
        @azul=azul
        @verde=verde
        @rojo=rojo
    end
end

def open(file,array)
    begin
        File.open(file, 'r') do |f|    
            f.each_line do |line|
                words = line.split(',')
                array.push(Product.new(words[0].chomp,words[1].chomp,words[2].chomp,words[3].chomp))
            end
            array
        end        
    rescue Exception => msg
        puts msg
    end
end
def save(file,producto)
   begin
        File.open(file, 'a') do |f|    
            f.puts "#{producto}"
        end        
    rescue Exception => msg
        puts msg
    end
end

file='bodega.txt'
array = Array.new()
array = open(file,array) 

puts "Ingrese producto con su stock separado por comas ej(producto,1,2,3) NR para no registrar en la bodega:\n\n\n"
producto=gets.chomp 
save(file,producto)




