require 'rice_playground'

def f(i)
    puts('sleep start')
    if i == 0
        sleep(3)
    else
        RicePlayground::ToyClass.new.sleep(3)
    end
    puts('sleep end')
end

2.times{|i|
    thread = Thread.start{f(i)}
    5.times{sleep(0.1);puts('hello')}
    thread.join
}

__END__
sleep start
hello # main-thread's hello can be executed during sleep(3)
hello
hello
hello
hello
sleep end
sleep start
hello # took 3 secs to show the first hello; RicePlayground::ToyClass.new.sleep(3) blocks execution
sleep end
hello
hello
hello
hello
