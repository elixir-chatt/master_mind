##By RAM!!
##Below is the basic structure, though for our situation the vars are different.

def new_solution(difficulty_colors // 6, solution_length // 4) do
   solution = Enum.map((1..solution_length), fn(x) -> Enum.random(1..difficulty_colors) end)
end
