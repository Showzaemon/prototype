require 'singleton'

# Parameters 
DMC_INTERVAL = 2  # Interval time by second

class DelayedMethodCaller
  include Singleton
  
  attr_reader :cycle

  def initialize()
    @interval = DMC_INTERVAL     # cycle length by second.
    @cycle = 0                   # current cycle number.
    @started = false             # falg indicates started or not
  end
  
  def enqueue(object, cycles)    # delayed cycles
    if @started then
      begin
        sc = @cycle + cycles     # scheduled cycle
        ro = RequestObject.create(cycle: sc, class_name: object.class,
                                 instance_id:object.getId)
        ro ? sc : nil            # return scheduled cycle
      rescue
        logger.fatal("[Fatal] DMC fails to enqueue #{object.inspect}")
      end if @started
    else
      return nil
    end
  end
  
  def dequeue(object, scheduled_cycle)
    RequestObject.where(cycle:scheduled_cycle, class_name: object.class,
                        instance_id: object.getId).delete
  end
  
  def start()
    @started = true
    @dmct = Thread.new() do
      tg = ThreadGroup.new
      tg.add(Thread.current)
      while @started
        Thread.new do
          sleep(@interval)
        end
        ros = Array.new.concat(RequestObject.where(cycle: @cycle))
        for ro in ros
          object = ro.referInstance
          Thread.new(object) do |obj|
            begin
              obj.update()
            ensure
              obj.activate() if obj.repeat?
              obj.destroy
            end
          end if object.present?
        end
        (tg.list - [Thread.current]).each {|t| t.join}
        @cycle += 1
      end
    end
  end

  def stop()
    @started = false
    @dmct.join
  end 
end