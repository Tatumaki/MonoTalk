module MonoTalk
  class SampleRoutine
    def self.call(params)
      return "CLASS routed: SampleRoutine in class. params => #{params.to_s}"
    end
  end

  SAMPLE_ROUTINE ={
    "TEST"  => proc{|params| "Test succeed."},
    "CLASS" => SampleRoutine,
  }
end
