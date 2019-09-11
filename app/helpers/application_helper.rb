module ApplicationHelper
  def badge_class(status)
    %w(success warning danger default)[Song.statuses[status]]
  end
end
