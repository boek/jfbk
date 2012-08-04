class SetDefaultCount < ActiveRecord::Migration
  def up
  	change_column_default(:urls, :count, 0)
  end

  def down
  end
end
