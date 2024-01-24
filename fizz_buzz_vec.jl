try
    import BenchmarkTools
catch
    # If not installed, install the 'BenchmarkTools' package
    import Pkg
    Pkg.add("BenchmarkTools")
end

function fizzbuzz(len_fizz)
    # Original fizzbuzz which does not save output
    for i in 1:len_fizz
        if i % 3 == 0 && i % 5 == 0
            println("FizzBuzz")
        elseif i % 3 == 0
            println("Fizz")
        elseif i % 5 == 0
            println("Buzz")
        else
            println(i)
        end
    end
end

function fizzbuzz_output(len_fizz)
    results = Vector{String}(undef, len_fizz)

    for i in 1:len_fizz
        if i % 3 == 0 && i % 5 == 0
            results[i] = "FizzBuzz"
        elseif i % 3 == 0
            results[i] = "Fizz"
        elseif i % 5 == 0
            results[i] = "Buzz"
        else
            results[i] = string(i)
        end
    end

    print(results)
    return results
end

function fizz_vectorized(len_fizz)
    range = 1:len_fizz
    three = range .% 3 .== 0
    five = range .% 5 .== 0

    out = ifelse.(three .& five, "FizzBuzz",
                  ifelse.(three, "Fizz",
                          ifelse.(five, "Buzz", string.(range))))
    print(out)
    return out
end

# Benchmark the functions
ben_fb = @benchmark begin
        fizzbuzz(100)
end

ben_fb_out = @benchmark begin
    fizzbuzz_output(100)
end

ben_fb_vec = @benchmark begin
    fizz_vectorized(100)
end

time(ben_fb)/time(ben_fb_vec) #Time diff.

# Check if the outputs of fizzbuzz_output and fizz_vectorized are equal
println(all(fizzbuzz_output(100) .== fizz_vectorized(100)))
