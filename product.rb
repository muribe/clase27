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
        File.open(file, 'r').each_line do |line|    
            array.push(Product.new(*line.chomp.split(',')))
        end      
        array
    rescue Exception => msg
        puts msg
    end
end
def save(file,name,azul,rojo,verde)
   begin
        File.open(file, 'a') do |f|    
            f.puts "#{name},#{azul},#{verde},#{rojo}"
        end        
    rescue Exception => msg
        puts msg
    end
end

file='bodega.txt'
array = Array.new()
array = open(file,array) 

puts "Ingrese nombre del producto\n"
name=gets.chomp
puts "Ingrese stock color azul\n"
azul=gets.chomp
puts "Ingrese stock color rojo\n"
rojo=gets.chomp
puts "Ingrese stock color verde\n"
verde=gets.chomp 
save(file,name,azul,rojo,verde)




