class AddPriceToLineItems < ActiveRecord::Migration[7.1]
  def up
    add_column :line_items, :price, :decimal, precision: 8, scale: 2

    # Populate price for existing line items based on their associated product price
    LineItem.reset_column_information
    LineItem.all.each do |line_item|
      product = Product.find_by(id: line_item.product_id)
      line_item.update(price: product.price) if product
    end
  end

  def down
    remove_column :line_items, :price
  end
end
