
require "csv"
require "google/apis/civicinfo_v2"
require "erb"
require "date"
filename = ARGV[0]

puts "Starting Event Manager......."

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone_number(phno)
  len = phno.length
  if len == 10
    len
  elsif len == 11
    phno[0] == 1 ? phno[1..11] : "No phone Number"
  else len < 10 || len > 11
    "No Phone Number"   end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = "AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw"

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: "country",
      roles: ["legislatorUpperBody", "legislatorLowerBody"],
    )
    legislators = legislators.officials
    legislator_names = legislators.map(&:name)
    legislator_names.join(", ")
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename, "w") do |file|
    file.puts form_letter
  end
end

if File.exists? filename
  puts "opening the #{filename}"
  contents = CSV.open filename, headers: true, header_converters: :symbol
  template_letter = File.read "form_letter.erb"
  erb_template = ERB.new template_letter
  contents.each do |row|
    id = row[0]
    p id
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    phno = row[:homephone]
    regdate = row[:regdate].gsub("/", "-")
    legislators = legislators_by_zipcode(zipcode)
    p "#{name} - #{zipcode} - #{legislators} - #{phno}"
    form_letter = erb_template.result(binding)
    save_thank_you_letter(id, form_letter)
  end
else
  puts "please enter avalid file name"
end
