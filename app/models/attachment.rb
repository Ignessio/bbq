require 'activestorage/validator'

class Attachment < ApplicationRecord
  MAX_FILE_SIZE_MEGABYTES = 20
  ATTACHABLE_TYPES = {
    extra: { type: 'TimecardExtra', id_field: :timecard_extra_id },
    signature: { type: 'Signature', id_field: :signature_id },
    timecard: { type: 'Timecard', id_field: :timecard_id }
  }.freeze

  belongs_to :attachable, polymorphic: true

  has_one_attached :file

  validates :file,
    blob: {
      content_type: %w[application/pdf image/jpg image/png image/svg],
      size_range: 0..MAX_FILE_SIZE_MEGABYTES.megabytes
    },
    presence: true

  ATTACHABLE_TYPES.each do |_k, type|
    define_method(type[:id_field]) do
      attachable_id if attachable_type == type[:type]
    end
  end
end
