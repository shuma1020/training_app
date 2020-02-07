class ChangeStatusTitlePriceImageDescriptionToProducts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :products, :title , false
    change_column_null :products, :status , false
    change_column_null :products, :price , false
    change_column_null :products, :description , false
  end
end
