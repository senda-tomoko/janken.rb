def janken
  puts "じゃんけん..."
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"

  input = gets.chomp
  if input.match?(/\A[0-3]\z/)
    player_hand = input.to_i
  else
    puts "0〜3の数字を入力してください"
    return true 
  end

  computer_hand = rand(3)
  janken_hands = ["グー", "チョキ", "パー"]

  if player_hand == 3
    puts "戦いをやめました"
    return false  
  end

  puts "ホイ!"
  puts "あなた：#{janken_hands[player_hand]}を出しました"
  puts "相手：#{janken_hands[computer_hand]}を出しました"

  if player_hand == computer_hand
    puts "あいこで..."
    return true 
  elsif (player_hand == 0 && computer_hand == 1) || (player_hand == 1 && computer_hand == 2) || (player_hand == 2 && computer_hand == 0)
    @winner = 'player'
  else
    @winner = 'computer'
  end

  return atchi_muite_hoi  
end

def atchi_muite_hoi
  directions = ["上", "下", "左", "右"]
  puts "あっち向いて〜"
  puts "0(上) 1(下) 2(左) 3(右)"

  input = gets.chomp
  if input.match?(/\A[0-3]\z/)
    player_direction = input.to_i
  else
    puts "0〜3の数字を入力してください"
    return atchi_muite_hoi  
  end

  computer_direction = rand(4)

  puts "ホイ!"
  puts "あなた：#{directions[player_direction]}"
  puts "相手：#{directions[computer_direction]}"

  if player_direction == computer_direction
    if @winner == 'player'
      puts "あなたの勝ちです！"
    else
      puts "あなたの負けです..."
    end
    return false  
  else
    puts "もう一度じゃんけんから始めます。"
    return true  
  end
end

continue_game = true
while continue_game
  continue_game = janken
end
