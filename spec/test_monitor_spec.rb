require 'open3'

test_cases = [
	[
		'Counts the number of running `foobs` processes',
    ['-p', 'foobs'],
    'sensu.process_count.foobs.count 0'
  ],
  [
    'Counts the number of running `foobs` processes with full flag',
    ['-p', 'foobs', '-f'],
    'sensu.process_count.foobs.count 0',
  ],
  [
    'Expects error with no process name',
    [],
    "`process_name`/`p` shouldn\'t be empty!\n",
  ],
]

script_name = 'bin/sensu-plugins-process-count-metrics.rb'

RSpec.describe 'ProcessCountMetrics' do
  context "" do
    test_cases.each do |test_name, arguments, expected|
      it test_name do
        metrics, _, _ = Open3.capture3('ruby', script_name, *arguments)

        expect(metrics).to start_with(expected)
      end
    end
  end
end
