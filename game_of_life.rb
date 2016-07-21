#############################################################################
#                                                                           #
#                           CONWAY's GAME OF LIFE                           #
#                           Author : Vishal Nagda                           #
#                                                                           #
#############################################################################
def count_nbr (grid, i, j)
  n_count = 0
  n_count+=1 if grid[i-1][j-1] >= 1 if i-1 >= 0 && j-1 >= 0
  n_count+=1 if grid[i-1][j] >= 1   if i-1 >= 0
  n_count+=1 if grid[i-1][j+1] >= 1 if i-1 >= 0 && j+1 < grid.length
  n_count+=1 if grid[i][j-1] >= 1   if j-1 >= 0
  n_count+=1 if grid[i][j+1] >= 1   if j+1 < grid.length
  n_count+=1 if grid[i+1][j-1] >= 1 if i+1 < grid.length && j-1 >=0
  n_count+=1 if grid[i+1][j] >= 1   if i+1 < grid.length
  n_count+=1 if grid[i+1][j+1] >= 1 if i+1 < grid.length && j+1 < grid.length
  return n_count;
end


grid = [
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
          [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        ]

#neighbour_count = Marshal.load(Marshal.dump(grid)) #createing an actual copy of array.
neighbour_count = Array.new(grid.length){Array.new(grid.length)} #creating an empty 2D array.

(0..30).each do |steps|
  system "clear"

  (0..grid.length-1).each do |i|
    puts "\n\n"
    (0..grid.length-1).each do |j|
      grid[i][j] == 1 ? print("\t[]") : print("\t.")
      neighbour_count[i][j] = count_nbr(grid,i,j)
    end
  end

  (0..grid.length-1).each do |i|
    (0..grid.length-1).each do |j|
      grid[i][j] = 0 if neighbour_count[i][j] <= 1 || neighbour_count[i][j] >= 4 if grid[i][j] >= 1
      grid[i][j] = 1 if neighbour_count[i][j] == 3
    end
  end

  puts "\n\n"
  sleep 0.5

end