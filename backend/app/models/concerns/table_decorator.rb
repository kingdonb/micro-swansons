module TableDecorator
  extend ActiveSupport::Concern

  def table_deco
    "#{name} (##{id})"
  end
end
