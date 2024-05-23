while true
  puts "実施したい処理を選択してください"
  puts "1:評価ポイントとコメントを入力する"
  puts "2:今までの結果を確認する"
  puts "3:やめる"
  num = gets.to_i

  case num
  when 1
    puts "1から5で評価を入力してください"
    point = gets.to_i

    until (1..5).include?(point)
      puts "1から5で入力してください"
      point = gets.to_i
    end

    puts "コメントを入力してください"
    comment = gets.chomp
    post = "ポイント：#{point} コメント：#{comment}"

    File.open("data.txt", "a") do |file|
      file.puts(post)
    end

  when 2
    puts "これまでの結果"
    if File.exist?("data.txt")
      File.foreach("data.txt") { |line| puts line }
    end

  when 3
    puts "終了します"
    break

  else
    puts "1から3で入力してください"
  end
end



# 新たにメソッドを定義し、処理が分割されていること
# メソッド名は処理と関係のある命名がなされていること
# 実施する処理の選択で1から3以外を入力した際、”1から3で入力してください”というメッセージが表示され、再度選択させる処理が実行されること
# 評価ポイントの入力で1から5以外を入力した場合、”1から5で入力してください”というメッセージが表示され、再度評価ポイントを入力させる処理が実行されること
# 評価ポイントとコメントが入力できること
# 今までの結果を確認できること
# 処理を終了できること