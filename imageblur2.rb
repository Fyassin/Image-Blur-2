class Image

  def initialize (pic)
    @pic = pic
  end

  def output_image
    @pic.each do |data|
      puts data.join
    end
  end

  def blur
   ones = []
   @pic.each_with_index do |rows, row|
       rows.each_with_index do |num, col|
          ones << [row, col] if num == 1
       end
   end
   ones.each do |row, col|
     #row, col = index
     @pic[row-1][col]=1 if row-1 >= 0
     @pic[row+1][col]=1 if row+1 < num_rows
     @pic[row][col-1]=1 if col-1 >= 0
     @pic[row][col+1]=1 if col+1 < num_cols
   end
 end

  def num_rows
    @pic.length
  end

  def num_cols
    @pic[0].length
  end
end


image = Image.new([
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0],
])


image.blur
puts
image.output_image
