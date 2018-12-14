names = ['Sheng', 'Kevin', 'Audrey', 'KJ', 'Delilah', 'Josh', 'Mack', 'Rey']

countries = ['Japan', 'South Korea', 'Italy', 'Germany', "America"]

countries.each_with_index {|item, index|
	p "My "+ index.to_s + " favourite country to visit is "+item
}