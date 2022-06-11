Signal.trap(0) { puts "Terminating: #{$$}" }
Signal.trap("CLD")  { puts "Child died" }
fork && Process.wait
