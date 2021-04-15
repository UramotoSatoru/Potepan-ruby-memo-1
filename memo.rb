require "csv"

puts "1(新規でメモを作成) 2(既存のメモ追記する)"

memo_type = gets.to_i

#####新規メモを作成する際の処理#####
if memo_type == 1 then
  p "拡張子を抜いたフィルタを記載してください"
  newFile = gets.chomp+".csv"
  # 同じ階層のファイル名を一覧に入力したファイル名が無いか確認(ruby ファイル名 一覧で検索)
  Dir.foreach('.') do |item|
    next if item == '.' or item == '..'
      # 末尾がcsvのみ取得
      if(item.slice(-3,3) == "csv") then
        # もし、同じファイル名があればプログラムを強制終了
        if(item == newFile) then
          p newFile+"は既に存在しているため作成できません"
          p "ruby memo.rbを再度入力して半角英数で1を入力して別のファイル名を記載してください"
          exit
        end
      end
  end
  # コマンドから入力した値を取得して新規ファイルが作成
  p "メモしたい内容を記入してください"
  p "入力完了したらctrl + D"
  inputs = readlines
  File.open(newFile,"w") do |csv|
    inputs.each do |input|
      csv << input
    end
  end
  p newFile + "が作成されました"
#####既存メモの追記する処理#####
elsif memo_type == 2 then
  puts "csvファイル一覧"
  # 階層のcsvファイルのみを一覧で出力(ruby ファイル名 一覧で検索)
  Dir.foreach('.') do |item|
    next if item == '.' or item == '..'
      # 末尾がcsvのみ取得
      if(item.slice(-3,3) == "csv") then
        puts item
      end
  end
  # コマンドから入力したファイル名を取得して既存のファイルに追記
  p "編集したいファイルを拡張子をのぞいて入力してください"
  editFile = gets.chomp+".csv"
  p editFile + "に入力した文字を追記します"
  p "入力完了したらctrl + D"
  inputs = readlines
  File.open(editFile,"a") do |csv|
    inputs.each do |input|
      csv << input
    end
  end
  p editFile + "が編集されました"
#####正しい値が入力されなかった時の処理#####
else
  p "ruby memo.rbを再度入力して半角英数で1or2を入力してください"
end
