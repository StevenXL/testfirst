def add(first, second)
    first + second
end

def subtract(first, second)
    first - second
end

def sum(integers)
  integers.reduce(0,:+)
end

def multiply(integers)
  integers.reduce(1,:*)
end

def power(integers)
  base, power = integers

  base ** power
end

def factorial(integer)
  return 1 if integer <= 1

  integer * factorial(integer - 1)
end
