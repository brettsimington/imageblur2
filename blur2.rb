


class Image
  attr_reader :image_blur
  
  def initialize(image_array)
    if image_array.empty?
      puts "need image"
    end
    @image_array = image_array
      
  end
  
  def output_image
    @image_array.each do |element|   
      element.each do |sub_element|
        print sub_element     
      end
      puts
    end
  end
    
# imageblur2
  def perf_image_trans
    
    @cells_with_ones = []
    @image_blur = @image_array

    @image_array.each_with_index do |row, row_index|
      sub_element_indices = @image_array[row_index].each_index.select{|i| row[i] == 1}
      unless sub_element_indices.empty?
        sub_element_indices.each do |index|
          @cells_with_ones << [row_index, index] 
        end
      end
    end

    @cells_with_ones.each do |coords|  
      case
 
      when coords[0] == 0 && coords[1] == 0
        @image_blur[0][1] = 1
        @image_blur[1][0] = 1

      when coords[0] == 0 && coords[1] == row_length-1
        @image_blur[0][row_length-2] = 1
        @image_blur[1][row_length-1] = 1
      
      when coords[0] == image_length-1 && coords[1] == 0
        @image_blur[image_length-2][0] = 1
        @image_blur[image_length-1][1] = 1
      
      when coords[0] == image_length-1 && coords[1] == row_length-1
        @image_blur[image_length-2][row_length-1] = 1
        @image_blur[image_length-1][row_length-2] = 1
      
      when coords[0] == 0  && coords[1]-1 >= 0 && coords[1]-1 < row_length-1
        @image_blur[0][coords[1]-1] = 1
        @image_blur[0][coords[1]+1] = 1
        @image_blur[1][coords[1]] = 1
        
      when coords[1] == row_length-1 && coords[0] > 0 && coords[0] < image_length-1

        @image_blur[coords[0]-1][coords[1]] = 1
        @image_blur[coords[0]][coords[1]-1] = 1
        @image_blur[coords[0]+1][coords[1]] = 1
        
      when coords[0] == image_length-1 && coords[1] > 0 && coords[1] < image_length-1

        @image_blur[coords[0]-1][coords[1]] = 1
        @image_blur[coords[0]][coords[1]-1] = 1
        @image_blur[coords[0]][coords[1]+1] = 1
          
      when coords[1] == 0 && coords[0] > 0 && coords[0] < image_length-1

        @image_blur[coords[0]-1][coords[1]] = 1
        @image_blur[coords[0]][coords[1]+1] = 1
        @image_blur[coords[0]+1][coords[1]] = 1
        
      else
        @image_blur[coords[0]-1][coords[1]] = 1
        @image_blur[coords[0]][coords[1]+1] = 1
        @image_blur[coords[0]+1][coords[1]] = 1
        @image_blur[coords[0]][coords[1]-1] = 1
      
      end
    end

  end
  
  def image_length
    @image_array.length
  end

  def row_length
    @image_array[0].length
  end
  
end

image = Image.new([
  [1, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 1]
])

image3 = Image.new([
  [0, 0, 0, 0],
  [0, 1, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 0, 0]
])

image5 = Image.new([
  [0, 1, 1, 0],
  [1, 0, 0, 1],
  [1, 0, 0, 1],
  [0, 1, 1, 0]
])

image7 = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image9 = Image.new([
  [0, 0, 1, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0]
])

image11 = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0]
])


puts "original image 1"
image.output_image
image.perf_image_trans
puts

puts "blurred image 1"
image2 = Image.new(image.image_blur)
image2.output_image
puts

puts "original image 2"
image3.output_image
image3.perf_image_trans
puts

puts "blurred image 2"
image4 = Image.new(image3.image_blur)
image4.output_image
puts

puts "original image 3"
image5.output_image
image5.perf_image_trans
puts

puts "blurred image 3"
image6 = Image.new(image5.image_blur)
image6.output_image
puts

puts "original image 4"
image7.output_image
image7.perf_image_trans
puts

puts "blurred image 4"
image8 = Image.new(image7.image_blur)
image8.output_image
puts

puts "original image 5"
image9.output_image
image9.perf_image_trans
puts

puts "blurred image 5"
image10 = Image.new(image9.image_blur)
image10.output_image

puts "original image 6"
image11.output_image
image11.perf_image_trans
puts

puts "blurred image 6"
image12 = Image.new(image11.image_blur)
image12.output_image