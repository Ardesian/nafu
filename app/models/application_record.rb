class ApplicationRecord < ActiveRecord::Base
  include Defaults

  self.abstract_class = true

  def self.has_notes
    has_many :notes

    define_method("notes=") do |note_attrs|
      return if note_attrs[:body].blank?

      self.notes.create(note_attrs)
    end
  end
end
