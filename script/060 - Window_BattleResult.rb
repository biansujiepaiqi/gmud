#==============================================================================
# ■ Window_BattleResult
#------------------------------------------------------------------------------
# 　战斗结束时、显示获得的 EXP 及金钱的窗口。
#==============================================================================

class Window_BattleResult < Window_Base
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     gold      : 金钱
  #     item      : 物品
  #--------------------------------------------------------------------------
  def initialize(gold, item)
    @gold = gold
    @item = item
    super(160, 0, 320, 224)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.y = 160 - height / 2
    self.z =300
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    text = $data_text.battle_item.dup
    text.gsub!("gold",@gold.to_s)
    text.gsub!("item",@item)
    auto_text(text)
  end
end