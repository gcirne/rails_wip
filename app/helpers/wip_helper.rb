module WipHelper
  def wip
    yield if Rails.env.test? || Rails.env.development?
  end
end