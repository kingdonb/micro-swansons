module TableDecorator
  extend ActiveSupport::Concern

  def table_deco
    "#{name} (##{table_id})"
  end
end
