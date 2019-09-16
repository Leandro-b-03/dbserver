module AllureCucumber
  module DSL

    def attach_file(title, file, attach_to_step=true)
      @tracker = AllureCucumber::FeatureTracker.tracker
      options = {:file => file, :title => title}
      options.merge!(:step_id => @tracker.step_id) if attach_to_step
      if @tracker.scenario_name
        AllureRubyAdaptorApi::Builder.add_attachment(@tracker.feature_name, @tracker.scenario_name, options)
      else
        # TODO: This is possible for background steps.  
        # puts "Cannot attach #{title} to step #{@tracker.step_name} as scenario name is undefined"
        puts "Background step #{title}, please verify the screenshot on report/screenshots"
      end
    end

  end
end
