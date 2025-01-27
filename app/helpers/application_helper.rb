module ApplicationHelper

  # 独自メソッド　半角
  # @param [Object] str
  def to_hankaku(str)
    str.tr("A-Za-z", "A-Za-z")
  end
end
