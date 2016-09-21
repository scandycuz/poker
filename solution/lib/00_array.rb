class Array
  def my_uniq(arr = self)
    res = []
    arr.each do |el|
      res << el if !res.include?(el)
    end
    return res
  end

  def two_sum
    indices = []
    self.each_with_index do |el1, idx1|
      self.each_with_index do |el2,idx2|
        indices << [idx1,idx2] if el1 + el2 == 0 && idx1 != idx2 && !indices.include?([idx2,idx1])
      end
    end
    return indices
  end

  def my_transpose(arr)
    transposed_array = Array.new(arr.length) { [] }

    arr.each do |row|
      row.each_with_index do |num, idx|
        transposed_array[idx] << num
      end
    end
    transposed_array
  end

  def stock_picker
    max_profit = 0
    profit_indices = []
    i = 0
    while i < self.length-1
      j = i+1
      while j < self.length
        profit = self[j]-self[i]
        if profit > max_profit
          max_profit = profit
          profit_indices = [i,j]
        end
        j +=1
      end
      i +=1
    end
    return profit_indices
  end
end
