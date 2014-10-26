class DmcConsoleController < ApplicationController
  def show
  end
  def change
  	dmc = DelayedMethodCaller.instance
  	puts params
  	if params.has_key?('start')
  		dmc.start if not dmc.started?
		elsif params.has_key?('stop')
	  	dmc.stop if dmc.started?
	  end
  	render 'show'
  end
end
