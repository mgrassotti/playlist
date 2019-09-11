# == Schema Information
#
# Table name: songs
#
#  id         :bigint           not null, primary key
#  name       :string
#  tab_path   :string
#  status     :integer
#  album      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ApplicationRecord
  enum album: ["Kill 'em all", "Ride the lightning", "Master of puppets",
    "...and justice for all", "Metallica", "Load, Reload, St. Anger, Garage, altri",
    "Death Magnetic", "Hardwired"]
  enum status: ["ok", "wip", "cue", "other"]

  def badge_class
    %w(success warning danger default)[Song.statuses[status]]
  end

  def status_badge
    "<span class='pull-left label lb-xs label-#{badge_class}' style='font-size: 12px;'>#{status}</span>"
  end

  def tab_path
    if path = read_attribute(:tab_path)
      'https://www.songsterr.com/a/wsa/' + path
    end
  end
end
