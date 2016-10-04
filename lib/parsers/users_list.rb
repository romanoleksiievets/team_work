require 'pp'
require 'rubyXL'
require 'yomu'

def split_data(data)
  result = {}
  data = data.split("\n")
  data = data.first.rpartition(" ") if data.count == 1 && data.first.include?("@") && data.first.include?("0")
  email, mobile = data.select{|d| d.include?("@")}.first, data.select{|d| d.include?("0")}.first
  result[:email] = email if email
  result[:mobile] = mobile.delete(' ') if mobile
  result
end

def parse_file(file_to_parse)
  city = file_to_parse.split[1]
  data = File.read file_to_parse
  text = Yomu.read :text, data
  records = []
  text.split("\n\n\n\n\t").last.split("\n\n\t").each do |record|
    one_user_data = record.split("\n\t")
    if one_user_data.count > 1 && one_user_data[1].size > 2
      one_user_data = one_user_data.first.split("\n\t") if one_user_data.count == 1

      records << {user: one_user_data[1], city: city}.merge(split_data(one_user_data.last))
    end
  end
  records
end

files_to_parse = Dir["tmp/docx/*"]
all_records = []

files_to_parse.each do |file|
  all_records << parse_file(file)
end
all_records.flatten!


workbook = RubyXL::Workbook.new
worksheet = workbook[0]

worksheet.insert_cell(0, 0, "Name")
worksheet.insert_cell(0, 1, "City")
worksheet.insert_cell(0, 2, "Mobile")
worksheet.insert_cell(0, 3, "Email")

all_records.each_with_index do |record, i|
  worksheet.insert_cell(i+1, 0, record[:user])
  worksheet.insert_cell(i+1, 1, record[:city])
  worksheet.insert_cell(i+1, 2, record[:mobile])
  worksheet.insert_cell(i+1, 3, record[:email])
end
workbook.write("tmp/all_records.xlsx")
