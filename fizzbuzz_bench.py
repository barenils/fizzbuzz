try:
    import timeit
except ImportError:
    # Package is not installed, so install it
    import subprocess
    subprocess.check_call(['pip', 'install', 'timeit']) 
    import timeit  # Now you can use the package


def fizzbuzz(len_fizz): # Org fizz buss
    for i in range(1, len_fizz + 1):
        if i % 3 == 0 and i % 5 == 0: # 
            print("FizzBuzz")
        elif i % 3 == 0:
            print("Fizz")
        elif i % 5 == 0:
            print("Buzz")
        else:
            print(i)

# Same as above but saves the output
# Added it to simply check if logic is correct
def fizzbuzz_output(len_fizz): 
    output = []
    for i in range(1, len_fizz + 1):
        if i % 3 == 0 and i % 5 == 0:
            output.append("FizzBuzz")
        elif i % 3 == 0:
            output.append("Fizz")
        elif i % 5 == 0:
            output.append("Buzz")
        else:
            output.append(str(i))
    return print(output)

# Creating vectors instead of loops
def fizz_vectorized(len_fizz):
    x = ["FizzBuzz" if i % 3 == 0 and i % 5 == 0 else "Fizz" 
            if i % 3 == 0 else "Buzz" if i % 5 == 0 else str(i) 
            for i in range(1, len_fizz + 1)]
    return print(x)

fizzbuzz_output(100) == fizz_vectorized(100) # Check if the functions have the same output

fizzbuzz_time = timeit.timeit(lambda: fizzbuzz(100), number=1000)
fizzbuzz_output_time = timeit.timeit(lambda: fizzbuzz_output(100), number=1000, unit = "msec")
fizz_vectorized_time = timeit.timeit(lambda: fizz_vectorized(100), number=1000)

time_ratio = fizzbuzz_output_time / fizz_vectorized_time

print(time_ratio)
# Checking for equality




