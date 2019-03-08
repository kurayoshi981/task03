class BarController < ApplicationController
  def index
  end

  def change
    puts "##################################"
    puts "change_color action が呼ばれました"
    puts "##################################"

    percent = (params[:percent]).to_i   #intergerに変換

    #データをActiveRecordで保存する
    Percent.create(value:percent)

    #ActiveRecordを用いて合計、平均、最大、最小を計算する
    sum = (Percent.sum(:value)).round(2)
    ave = (Percent.average(:value)).round(2)
    max = Percent.maximum(:value)
    min = Percent.minimum(:value)

    #bootstrapの色を変えるためのパラメータを決定する
    if percent < 30
      color_mode = "progress-bar progress-bar-striped active"
    elsif percent > 70
      color_mode = "progress-bar progress-bar-danger progress-bar-striped active"
    else
      color_mode = "progress-bar progress-bar-success progress-bar-striped active"
    end

    data_hash = {"sum" => sum, "ave" => ave, "max" => max, "min" => min, "color_mode" => color_mode}
    data_json = data_hash.to_json
    puts "data_json:#{data_json}"
    render json: data_json

  end

end
