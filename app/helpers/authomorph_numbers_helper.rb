module AuthomorphNumbersHelper
  def authomorph_number?(num)
    num_squared = (num**2).to_s
    num_str = num.to_s
    num_squared[-num_str.length()..-1] == num_str
  end
end
