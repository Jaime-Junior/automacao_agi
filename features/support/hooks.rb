require "base64"
$count = 0

After do |scenario|
  time = Time.now.strftime("%Y-%m-%d_%H-%M")
  if scenario.passed?
    shot_file = page.save_screenshot("./passed_png/#{scenario.name}_#{$count}_#{time}.png")
    shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
    attach(shot_b64, "image/png")
  else
    shot_file = page.save_screenshot("./failed_png/#{scenario.name}_#{$count}_#{time}.png")
    shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
    attach(shot_b64, "image/png") #Cucumber anexa o screenshot no report
  end
  $count = $count + 1
end
