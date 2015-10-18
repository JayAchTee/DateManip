require "date";

class Date 
	@@yesterday = Date.today().prev_day();

	def self.yesterday()
		@@yesterday;
	end;

	@@tomorrow = Date.today().next_day();

	def self.tomorrow()
		@@tomorrow;
	end;

	def number_of_days_in_month(checkDate)
		testDate = checkDate || self;

		case (testDate.month())
			when 1, 3, 5, 7, 8, 10, 12
				31
			when 2
				if (testDate.leap?)
					29
				else 
					28
				end
			else  
				30
		end
	end;

	def self.quarters_begin_on_month()
		[1, 4, 7, 10];
	end;
	def quarters_begin_on_month()
		[1, 4, 7, 10];
	end;

	def months_between(checkDate)
		if (self > checkDate) then 
			biggerDate = self;
			smallerDate = checkDate;
		else 
			smallerDate = self;
			biggerDate = checkDate;
		end;

		result = 0;

		while (smallerDate < biggerDate) do
			result += 1;

			smallerDate = smallerDate.next_month();
		end

		if (smallerDate.month() != biggerDate.month())
			result -= 1;
		end;

		result;
	end;

	def age(checkDate)
		mb = self.months_between(checkDate);

		d = self.day() - checkDate.day();
		m = mb % 12;
		y = mb / 12;

		if (d < 0)
			m -= 1;
			d += self.number_of_days_in_month(self < checkDate ? self : checkDate)
		end;
		
		{ :years => y, :months => m, :days => d }
	end;

	def age_to_s(checkDate)
		a = self.age(checkDate);

		d = a[:days];
		m = a[:months];
		y = a[:years];

		if (d < 0)
			m -= 1;
			d += self.number_of_days_in_month(self < checkDate ? self : checkDate)
		end;
		
		result = "";

		result += "#{y} year" if (y == 1);
		result += "#{y} years" if (y > 1);

		if (m != 0)
			result += ", " if (result.length() > 0);
		
			result += "#{m} month" if (m == 1);
			result += "#{m} months" if (m > 1);
		end;

		if (d != 0)
			result += ", " if (result.length() > 0);
		
			result += "#{d} day" if (d == 1);
			result += "#{d} days" if (d > 1);
		end;

		result = "same" if (result.length() == 0);

		result;
	end;

	def period()
		(self.year() * 100) + self.month();
	end;

	def start_of_period()
		Date.new(self.year(), self.month(), 1);
	end;

	def end_of_period()
		Date.new(self.year(), self.month(), 1).next_month().prev_day();
	end;

	def start_of_prev_year()
		self.start_of_this_year.prev_year();
	end;

	def start_of_this_year()
		Date.new(self.year(),1,1);
	end;

	def start_of_next_year()
		self.start_of_this_year.next_year();
	end;

	def end_of_prev_year()
		self.end_of_this_year.prev_year();
	end;

	def end_of_this_year()
		Date.new(self.year(),12,31);
	end;

	def end_of_next_year()
		self.end_of_this_year.next_year();
	end;

	def prev_week()
		this = self;

		until (this.monday?)
			this = this.prev_day();
		end;

		this.prev_day(7);
	end;

	def this_week()
		this = self;

		until (this.monday?)
			this = this.prev_day();
		end;

		this;
	end;

	def next_week()
		this = self;

		until (this.monday?)
			this = this.prev_day();
		end;

		this.next_day(7);
	end;

	def prev_quarter()
		this = self.this_quarter();

		result = this.next_month(-3);

		result;
	end;

	def this_quarter()
		q = self.quarters_begin_on_month();

		result = self;

		until (q.include?(result.month()))
			result = result.prev_month();
		end;

		until (result.day() == 1)
			result = result.prev_day();
		end;

		result;
	end;

	def next_quarter()
		this = self.this_quarter();

		result = this.next_month(3);

		result;
	end;

	def first_quarter()
		Date.new(self.year(),1,1);
	end;

	def second_quarter()
		Date.new(self.year(),4,1);
	end;

	def third_quarter()
		Date.new(self.year(),7,1);
	end;

	def forth_quarter()
		Date.new(self.year(),10,1);
	end;

	def quarters() 
		[ self.first_quarter(), self.second_quarter(), self.third_quarter(), self.forth_quarter() ]
	end;

	def quarter_to_s()
		case 
			when self.this_quarter().month() == 1 
				self.year().to_s() + "Q1" 
			when self.this_quarter().month() == 4 
				self.year().to_s() + "Q2" 
			when self.this_quarter().month() == 7 
				self.year().to_s() + "Q3" 
			when self.this_quarter().month() == 10
				self.year().to_s() + "Q4" 
			else 
				self.to_s()
		end; 
	end;
end 
