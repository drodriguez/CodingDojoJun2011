require 'open4'

XCODE_TARGET = 'CodingDojoTests'
XCODE_CONF = 'Debug'
PASS_TITLE = 'Test passed'
PASS_IMAGE = 'happy-mac.gif'
FAIL_TITLE = 'Test failed'
FAIL_IMAGE = 'sad-mac.gif'

def growl(title, message, image)
  system %{growlnotify --image #{image} --message '#{message}' '#{title}'}
end

def run_xcodebuild(target, configuration)
  output = []
  exit_status = Open4.popen4("xcodebuild -target #{target} -configuration #{configuration}") do |pid, cin, cout, cerr|
    until cout.eof?
      line = cout.readline
      output << line
      puts line
    end
  end

  summary_line = output.find { |l| l =~ /Executed \d+ tests?, with \d+ failures? \(\d unexpected\)/ }
  error_lines = output.find_all { |l| l =~ /: error:/ }

  growl_text = [summary_line.to_s] + error_lines
  growl_text = growl_text.compact.join("\n")

  if exit_status.to_i == 0
    growl(PASS_TITLE, growl_text, PASS_IMAGE)
  else
    growl(FAIL_TITLE, growl_text, FAIL_IMAGE)
  end
end

watch('Classes/.*\.(h|m)') { run_xcodebuild(XCODE_TARGET, XCODE_CONF) }
watch('Tests/.*\.m') { run_xcodebuild(XCODE_TARGET, XCODE_CONF) }
