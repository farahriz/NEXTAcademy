# If bitcoin price today is …
price =9302
trend = 'down'

if price >= 10000 and trend == 'down'
	puts 'sell'
elsif price >= 9000 and trend == 'up'
	puts 'buy'
else
	puts 'do nothing'
end


# 1. Equals to or more than 10000 AND you think it'll go down
    #    You want to sell.

# 2. Equals to or more than 9000 AND you think it'll go up
    #    You want to buy.

# 3. You are unsure
    #    Do nothing