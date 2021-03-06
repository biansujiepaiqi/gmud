#==============================================================================
# ■ Window_ShopDialog
#------------------------------------------------------------------------------
# 　商店画面、显示商人对话的窗口
#==============================================================================

class Window_ShopDialog < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #--------------------------------------------------------------------------
  def initialize(type)
    super(0, 0, 640, 64)
    @type=type
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    case @type
    when 0 # 卖出
      self.contents.draw_text(4, 0, 602, 32, $data_text.shop_sell_text)
    when 1 # 买入
      self.contents.draw_text(4, 0, 602, 32, $data_text.shop_buy_text)
    end
    update
  end
end