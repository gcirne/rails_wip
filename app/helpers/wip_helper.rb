module WipHelper
  def wip
    yield if Rails.env.test?
  end
end