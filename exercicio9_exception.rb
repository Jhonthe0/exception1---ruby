class Account
  attr_accessor :number, :holder, :balance, :withdraw_limit

  def initialize (number, holder, balance, withdraw_limit)
    @number = number
    @holder = holder
    @balance = balance
    @withdraw_limit = withdraw_limit
  end

  def deposit (amount)
    @balance += amount
  end

  def withdraw (amount)
    raise "The amount exceeds withdraw limit" if amount > @withdraw_limit
    raise "Not enough balance" if amount > @balance

    @balance -= amount
  end
end

  begin
    puts "Enter account data"
    puts "Number: "
    number = gets.chomp.to_i

    puts "Holder: "
    holder = gets.chomp.to_s

    puts "Initial balance: "
    balance = gets.chomp.to_f

    puts "Withdraw limit: "
    withdraw_limit = gets.chomp.to_f

    account = Account.new(number, holder, balance, withdraw_limit)

    puts "Enter amount for withdraw: "
    amount = gets.chomp.to_f

    account.withdraw(amount)

    puts "New balance: #{account.balance}"
  rescue Exception => e
    puts "Withdraw error:" + e.message
  end
