
class Utils
  # TODO: Complete el método viewArray para ver de manera bonira todos los elementos que estan dentro del array
  def viewArray(my_array)
    my_array.each do |element|
      if element.class == Hash
        viewHash(element)
      else
        puts element
      end

    end
  end

  def viewHash(my_hash)
    my_hash.each do |key, value|
      puts "#{key}: #{value}"
    end
  end
end