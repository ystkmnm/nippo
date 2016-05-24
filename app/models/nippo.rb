# frozen_string_literal: true
# == Schema Information
#
# Table name: nippos
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  reported_for :date             not null
#  subject_yaml :text(65535)
#  body         :text(65535)
#  sent_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_nippos_on_user_id                   (user_id)
#  index_nippos_on_user_id_and_reported_for  (user_id,reported_for) UNIQUE
#
# Foreign Keys
#
#  fk_rails_91f86e392f  (user_id => users.id)
#

class Nippo < ApplicationRecord
  belongs_to :user
end
