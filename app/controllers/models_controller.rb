class ModelsController < ApplicationController
  def show
    @fees = Fee.where(:model_id => params[:id])
    logger.debug("fees: " + @fees.count.to_s)
  end

end
