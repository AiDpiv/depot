class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    #замена нескольких записей для одного и того же товара в корзине одной записью
    Cart.all.each do |cart|
      # подсчет количества каждого товара в кокрзине
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |pruduct_id, quantity|
        if quantity > 1
          # удаление отдельных записей
          cart.line_items.where(product_id: pruduct_id).delete_all
          # замена одной записью
          item = cart.line_items.build(product_id: pruduct_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

end

#разобраться с этким!
