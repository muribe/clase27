class Carta
    attr_accessor :pinta, :number
    def initialize(pinta,number)
        @pinta = pinta
        @number = number
    end
    def show
        "#{@number} #{@pinta}\n"
    end
end
def save(file,value)
     begin
        File.open(file, 'a') do |f|    
            f.puts "#{value.number} #{value.pinta}"
        end        
    rescue Exception => msg
        puts msg
    end
end
def read(file)
    begin
        File.open(file, 'r').each_line do |line|    
            puts "#{line}"
        end        
    rescue Exception => msg
        puts msg
    end
end
pinta =["corazon","picas","diamantes","trébol"]
number = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
cartas = Array.new()
file = "cartas.txt"
loop do
    puts "Escriba Jugar para generar 5 cartas al azar"
    puts "Escriba Guardar para guardar las cartas en un archivo"
    puts "Escriba Mostrar para visualizar las 5 cartas generadas"
    puts "Escriba Leer para mostrar las cartas del archivo"
    puts "Escriba Salir para terminar el programa"
    puts "Ingrese opción:\n"
    op = gets.chomp
    case op.downcase
    when "jugar"
        cartas.clear
        5.times do |i|
            cartas.push(Carta.new(pinta.sample,number.sample))
        end        
    when "guardar"
        File.truncate(file, 0)        
        cartas.each do |object|
            save(file,object)
        end
    when "mostrar"
        cartas.each do |object|
            puts "#{object.number} #{object.pinta}\n"
        end
    when "leer"  
        read(file)
    when "salir"        
        break
    else
      puts "Opción no valida!, vuelva a intentarlo"
    end        
end 