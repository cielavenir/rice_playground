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
