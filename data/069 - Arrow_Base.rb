#==============================================================================
# ■ Arrow_Base
#------------------------------------------------------------------------------
# 　在战斗画面使用的箭头光标的活动块。本类作为
# Arrow_Enemy 类与 Arrow_Actor 类的超级类使用。
#==============================================================================

class Arrow_Base < Sprite
  #--------------------------------------------------------------------------
  # ● 定义实例变量
  #--------------------------------------------------------------------------
  attr_reader   :index                    # 光标位置
  attr_reader   :help_window              # 帮助窗口
  #--------------------------------------------------------------------------
  # ● 初始化对像
  #     viewport : 显示端口
  #--------------------------------------------------------------------------
  def initialize(viewport)
    super(viewport)
    self.bitmap = RPG::Cache.windowskin($game_system.windowskin_name)
    self.ox = 16
    self.oy = 64
    self.z = 2500
    @blink_count = 0
    @index = 0
    @help_window = nil
    update
  end
  #--------------------------------------------------------------------------
  # ● 设置光标位置
  #     index : 新的光标位置
  #--------------------------------------------------------------------------
  def index=(index)
    @index = index
    update
  end
  #--------------------------------------------------------------------------
  # ● 设置帮助窗口
  #     help_window : 新的帮助窗口
  #--------------------------------------------------------------------------
  def help_window=(help_window)
    @help_window = help_window
    # 刷新帮助文本 (update_help 定义了继承目标)
    if @help_window != nil
      update_help
    end
  end
  #--------------------------------------------------------------------------
  # ● 刷新画面
  #--------------------------------------------------------------------------
  def update
    # 刷新闪烁记数
    @blink_count = (@blink_count + 1) % 8
    # 设置传送源矩形
    if @blink_count < 4
      self.src_rect.set(128, 96, 32, 32)
    else
      self.src_rect.set(160, 96, 32, 32)
    end
    # 刷新帮助文本 (update_help 定义了继承目标)
    if @help_window != nil
      update_help
    end
  end
end
