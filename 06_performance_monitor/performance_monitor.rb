def measure(repeat = 1) 
    start_process_at = Time.now
    repeat.times { yield }
    end_process_at = Time.now

    return (end_process_at - start_process_at) / repeat
end
