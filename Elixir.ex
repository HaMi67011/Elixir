# type iex in terminal at where your files are

# type c("file name")

# type crtl+c and then a to exit

# define  module is must to start in elixir
#module is class
defmodule Rough do

  def main do #define a main/any function

    name = IO.gets "ENTER YOUR NAME " #get the input form user
    IO.puts "WELCOME #{name}" #output the data

    variables_statement #calling the Variavle function used always small letter
    arithmetic_operators
    comparison_operators
    maps


  end

  #checking for varables function in Elixir
  def variables_statement do

    #int,octal,binary,hex
    num_int = 12345
    num_hex = 0xF1
    num_binary = 0b1101

    IO.puts "NUM IN INT #{num_int} NUM IN HEX #{num_hex}
            NUM IN BINARY #{num_binary}"

    #ATOMS constants whose name is their value. They can be created using the color(:)
    atom = :"I AM ATOMS"

    IO.puts "ATOM = #{atom}"

    #STRING
    string = "String"

    IO.puts "STRING IS #{string}"

    #Binaries are sequences of bytes enclosed in << >> separated with a comma. store 0 to 255 in each value.
    binaries = <<15,15,15>>

    IO.puts "BINARIES ARE #{binaries}"

    #LIST
    list = ['1','2','3','4','5','6','7','8','9']

    IO.puts "LIST IS #{list}"

    #TUPLE
    # tuple = {1, 2, true, 3}
    # IO.puts "TUPLE IS #{tuple}"

  end

  def arithmetic_operators do

    add = 1+3
    IO.puts "ADD 1+3 #{add}"
    sub = 1-3
    IO.puts "SUB 1-3 #{sub}"
    mul = 1*3
    IO.puts "MUL 1*3 #{mul}"
    float_Div = 1/3
    IO.puts "Float DIV 1/3 #{float_Div}"
    int_Div = div(1,3)
    IO.puts "Int DIV 1/3  #{int_Div}"
    rem_of = rem(1,3)
    IO.puts "Reminder 1/3 #{rem_of}"

  end

  def comparison_operators do

    #main difference is of equal signs
    #== check for value not type and === check for value and type

    eq1 = 123
    eq2 = "12345"

    IO.puts "Double Equal = #{eq1 == eq2}"
    IO.puts "Triple Equal = #{eq1 === eq2}"

    IO.puts "Double Not Equal = #{eq1 != eq2}"
    IO.puts "Triple Not Equal = #{eq1 !== eq2}"

  end

  def logic_operator do

    #and - or - not and use && || !

    IO.puts "AND is #{true and true} #{false and true} #{true and false} #{false and false}" |> String.trim
    IO.puts "OR is #{true or true} #{false or true} #{true or false} #{false or false}" |> String.trim
    IO.puts "NOT is #{not true} #{not false}"


  end

  def maps do

    map = %{:a => 1, 2 => :b}
    IO.puts(map[:a])
    IO.puts(map[2])

    new_map = Dict.put_new(map, :new_val, "value")
    IO.puts(new_map[:new_val])

    new_map = %{ map | a: 25}
    IO.puts(new_map[:a])

  end

  def aliases_work do

    # Alias the module so it can be called as Bar instead of Foo.Bar
    # alias Foo.Bar, as: Bar

    # Ensure the module is compiled and available (usually for macros)
    # require Foo

    # Import functions from Foo so they can be called without the `Foo.` prefix
    # import Foo

    # Invokes the custom code defined in Foo as an extension point
    # use Foo

  end


  def functions do
    #fn to define the function and & and def
    sum = fn (a, b) -> a + b
  end
  end

    IO.puts(sum.(1, 5))

    sum = &(&1 + &2)
    IO.puts(sum.(1, 2))

  def sum(a, b) do
    a + b
  end

   #private function
  defp phrase, do: "Hello "

   #defeault values
  def hello(name, country \\ "en") do
    phrase(country) <> name
  end

  #recursion
  def fact(res, num) do
    if num === 1 do
       res
    else
       new_res = res * num
       fact(new_res, num-1)
      end
  end

  #loop
  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts msg
  end

  def print_multiple_times(msg, n) do
      IO.puts msg
      print_multiple_times(msg, n - 1)
  end

  #An enumerable is an object that may be enumerated. "Enumerated" means to count off the members of a set/collection/category one by one (usually in order, usually by name).
  #When we use all? function, the entire collection must evaluate to true otherwise false will be returned.
  res = Enum.all?([1, 2, 3, 4], fn(s) -> rem(s,2) == 1 end)
  IO.puts(res)

  #As the name suggests, this function returns true if any element of the collection evaluates to true
  res = Enum.any?([1, 2, 3, 4], fn(s) -> rem(s,2) == 1 end)
  IO.puts(res)

  #This function divides our collection into small chunks of the size provided as the second argument
  res = Enum.chunk([1, 2, 3, 4, 5, 6], 2)
  IO.puts(res)

  #It may be necessary to iterate over a collection without producing a new value, for this case we use the each function −
  Enum.each(["Hello", "Every", "one"], fn(s) -> IO.puts(s) end)


  #struct
  defmodule User do
    defstruct name: "John", age: 27
  end

  john = %User{}
  ayush = %User{name: "Ayush", age: 20}
  megan = %User{name: "Megan"}

  #To access name and age of John,
  IO.puts(john.name)
  IO.puts(john.age)

  # Protocols are a mechanism to achieve polymorphism in Elixir. Dispatching on a protocol is available to any data type as long as it implements the protocol.

  #Defining the protocol
defprotocol Blank do
  def blank?(data)
end

#Implementing the protocol for lists
defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_), do: false
end

#Implementing the protocol for strings
defimpl Blank, for: BitString do
  def blank?(""), do: true
  def blank?(_), do: false
end

#Implementing the protocol for maps
defimpl Blank, for: Map do
  def blank?(map), do: map_size(map) == 0
end

IO.puts(Blank.blank? [])
IO.puts(Blank.blank? [:true, "Hello"])
IO.puts(Blank.blank? "")
IO.puts(Blank.blank? "Hi")

#file handling
IO.puts(Path.join("dir", "file"))

#write file
File.write("newfile", "Hello")

#open file
{:ok, file} = File.open("newfile")
file = File.open!("newfile")

#read file
IO.puts(File.read("newfile"))

#close files
File.close(file)

#sending and receiving msg during process
send(self(), {:hello, "Hi people"})

receive do
   {:hello, msg} -> IO.puts(msg)
   {:another_case, msg} -> IO.puts("This one won't match!")
  after
    1_000 -> "nothing after 1s"
end

#for raising error use raise

#error handling
#ex1
err = try do
  1 + "Hello"
rescue
  RuntimeError -> "You've got a runtime error!"
  ArithmeticError -> "You've got a Argument error!"
end

IO.puts(err)

#ex2
val = try do
  Enum.each 20..100, fn(x) ->
     if rem(x, 13) == 0, do: throw(x)
  end
  "Got nothing"
catch
  x -> "Got #{x}"
end

IO.puts(val)

#ex3
val = try do
  exit "I am exiting"
catch
  :exit, _ -> "not really"
end

IO.puts(val)

#ex4
{:ok, file} = File.open "sample", [:utf8, :write]
try do
   IO.write file, "olá"
   raise "oops, something went wrong"
after
   File.close(file)
end

#defing marcro
defmacro unless(expr, do: block) do
  quote do
     if !unquote(expr), do: unquote(block)
  end
end
#to call Marcrio
require OurMacro

#graph

digraph = :digraph.new()
coords = [{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
[v0, v1, v2] = (for c <- coords, do: :digraph.add_vertex(digraph, c))
:digraph.add_edge(digraph, v0, v1)
:digraph.add_edge(digraph, v1, v2)
for point <- :digraph.get_short_path(digraph, v0, v2) do
   {x, y} = point
   IO.puts("#{x}, #{y}")
end

#queue
q = :queue.new
q = :queue.in("A", q)
q = :queue.in("B", q)
{{:value, val}, q} = :queue.out(q)
IO.puts(val)
{{:value, val}, q} = :queue.out(q)
IO.puts(val)


end
