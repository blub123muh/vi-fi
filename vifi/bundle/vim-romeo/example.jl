# factorial.jl

#=

Print some factorials, just for fun.
=#
function factorial(n)
    if n <= 1
        return 1
    else
        return n * factorial(n-1)
    end
end

function fancyfunction(n)
    if n > 3
        println("nice n")
        if n > 8
            println("huge n")
        else
            println("but not so huge")
        end
        if n < 5
            println("medicore n")
        end

    end
end


function print_facs(n)
    for i in (1:10)
        println(factorial(i))
        typeof(i)
    end
end

print_facs(10)
