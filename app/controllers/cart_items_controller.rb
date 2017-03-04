class CartItemsController < ApplicationController

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = " 成功将 #{@product.title} 从购物车中删除！"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @cart_item.update(cart_item_params)

    redirect_to carts_path
  end

    #
    # @product = @cart_item.product
    #
    # old_quantity = @product.quantity
    # update_quantity = cart_item_params[:quantity].to_i
    #
    # #if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
    # if old_quantity >= update_quantity
    #     @cart_item.update(cart_item_params)
    #     flash[:notice] = "成功变更数量"
    #
    #     new_quantity = old_quantity - update_quantity
    #     @product.quantity = new_quantity
    # else
    #     flash[:warning] = "库存不足以加入购物车"
    # end
    #
    # redirect_to carts_path
  


  private

    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end
end
