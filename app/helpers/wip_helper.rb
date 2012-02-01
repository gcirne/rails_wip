module WipHelper
  def wip(&block)
    capture(&block) if Rails.env.test? || Rails.env.development? || params[:wip] == "true"
  end
end
