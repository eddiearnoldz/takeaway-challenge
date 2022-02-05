puts "Welcome to Nonna's. Please choose your dishes from the menu below"

class UberEatz
 
  ITALIAN = {
    "Focaccia" => 4, 'Burrata' => 8, 'Salad' => 5, 'Brusscetta' => 5, 'Salami' => 6,
    'Lasagne' => 5, 'Pizza Margheritta' => 10,'Arrabiata' => 10, 'Penne a la Vodka' => 12, 
    'Canelloni' => 15, 'Pumpkin Ravioli' => 12, 'Eggplant Parmigiana' => 13, 'Spaghetti Puttanesca' => 10,
    'Penne Pomodoro' => 9, 'Tiramisu' => 6, 'Afogato' => 7
  }.freeze
  attr_reader :my_order, :italian

  def initialize
    @my_order = []
  end

  def view_menu
    ITALIAN.each do |key, value|
      puts "#{key},  £#{value}"
    end
  end

  def add_dish(dish, quantity)
    raise "You need to specify how many you want. Write a number between 1-10" unless quantity.is_a?(Integer)
    raise "You can only order 10 of the same dish" if quantity > 10
    raise "Sorry, thats not on the menu" unless ITALIAN.include? dish
    quantity.times do
      @my_order << ITALIAN.select { |k,_v| k == dish }
    end
  end 

  def view_my_order
    raise "You haven't chosen anything yet" if order_is_empty?
    print_out_my_order
    total
  end

  private

  def total
    total = @my_order.map { |hash| hash.values }.flatten.sum
    puts "You're total is £#{total}"
  end

  def order_is_empty?
    @my_order.empty?
  end

  def print_out_my_order
    @my_order.each do |hash| 
      hash.each { |dish, price| puts "#{dish},  £#{price}" }
    end
  end
end