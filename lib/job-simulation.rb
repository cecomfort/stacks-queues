require './Stack.rb'
require './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll

  def initialize (jobs_available, job_seekers)
    # assume jobs_available and job_seekers are ints
    # assume always more job_seekers than jobs_available
    raise ArgumentError.new("The economy is bad. There will always be more job seekers than jobs.") if jobs_available > job_seekers

    @workers = Stack.new
    (1..jobs_available).each do |worker|
      @workers.push("Worker ##{worker}")
    end

    @waiting = Queue.new
    # seekers_left = job_seekers - jobs_available
    ((jobs_available + 1)..job_seekers).each do |worker|
      @waiting.enqueue("Worker ##{worker}")
    end

    @roll
  end

  def cycle
    roll
    puts "Managers roll a #{@roll}"

    # fire workers specified by the roll, removing them from the hired list
    # and adding them to the waiting list
    (1..@roll).each do
      fired_worker = @workers.pop
      puts "Fire: #{fired_worker}"
      @waiting.enqueue(fired_worker)
    end

    # hire workers specified by the roll, removing them from the waiting list
    # and adding them to the hired list
    (1..@roll).each do
      hired_worker = @waiting.dequeue
      puts "Hire: #{hired_worker}"
      @workers.push(hired_worker)
    end

  end

  private

  def roll
    # Assume managers rolling a 6 sided die
    @roll = rand(1..6)
  end
end

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(6,10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

count = 0
until gets.chomp != ""
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end

# Code would probably be better organized by making hired and fired private methods
