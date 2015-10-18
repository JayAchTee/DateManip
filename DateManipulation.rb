require_relative "datemanip";

#puts("Date.beginning_of_week is #{Date.beginning_of_week}")

puts ("Date.yesterday = #{Date.yesterday()}")
puts ("Date.today = #{Date.today()}")
puts ("Date.tomorrow = #{Date.tomorrow()}")

puts;

a = Date.today();
b = Date.new(1957, 5, 21);

puts ("quarters_begin_on_month (class) = #{Date.quarters_begin_on_month()}");
puts ("quarters_begin_on_month (instance) = #{a.quarters_begin_on_month()}");

puts;

puts ("#{a}.period = #{a.period()}");
puts ("#{a}.start_of_period = #{a.start_of_period()}");
puts ("#{a}.end_of_period = #{a.end_of_period()}");
puts;	
puts ("#{b}.period = #{b.period()}");
puts ("#{b}.start_of_period = #{b.start_of_period()}");
puts ("#{b}.end_of_period = #{b.end_of_period()}");

puts;

puts ("months between #{a} and #{b} = #{a.months_between(b)}");
puts ("age from #{a} to #{b} = #{a.age(b)}");
puts ("age_to_s from #{a} to #{b} = #{a.age_to_s(b)}");

puts;

b = Date.new(1959,6,3);

puts ("months between #{a} and #{b} = #{a.months_between(b)}");
puts ("age from #{a} to #{b} = #{a.age(b)}");
puts ("age_to_s from #{a} to #{b} = #{a.age_to_s(b)}");

puts;

b = Date.today();

puts ("months between #{a} and #{b} = #{a.months_between(b)}");
puts ("age from #{a} to #{b} = #{a.age(b)}");
puts ("age_to_s from #{a} to #{b} = #{a.age_to_s(b)}");

puts;

a = Date.today();

puts("start_of_prev_year = #{a.start_of_prev_year()}");
puts("end_of_prev_year = #{a.end_of_prev_year()}");

puts("start_of_this_year = #{a.start_of_this_year()}");
puts("end_of_this_year = #{a.end_of_this_year()}");

puts("start_of_next_year = #{a.start_of_next_year()}");
puts("end_of_next_year = #{a.end_of_next_year()}");

puts;

puts("#{a}.prev_week = #{a.prev_week()}")
puts("#{a}.next_week = #{a.next_week()}")

puts;

puts ("prev_quarter = #{a.prev_quarter()}");
puts ("this_quarter = #{a.this_quarter()}");
puts ("next_quarter = #{a.next_quarter()}");

puts;

puts ("first_quarter = #{a.first_quarter()}");
puts ("second_quarter = #{a.second_quarter()}");
puts ("third_quarter = #{a.third_quarter()}");
puts ("forth_quarter = #{a.forth_quarter()}");

puts;

puts ("#{a}.quarters = #{a.quarters()}");

puts;

puts ("first_quarter.quarter_to_s = #{a.first_quarter().quarter_to_s()}");
puts ("second_quarter.quarter_to_s = #{a.second_quarter().quarter_to_s()}");
puts ("third_quarter.quarter_to_s = #{a.third_quarter().quarter_to_s()}");
puts ("forth_quarter.quarter_to_s = #{a.forth_quarter().quarter_to_s()}");

puts;

puts ("prev_quarter.quarter_to_s = #{a.prev_quarter().quarter_to_s()}");
puts ("this_quarter.quarter_to_s = #{a.this_quarter().quarter_to_s()}");
puts ("next_quarter.quarter_to_s = #{a.next_quarter().quarter_to_s()}");

puts;
