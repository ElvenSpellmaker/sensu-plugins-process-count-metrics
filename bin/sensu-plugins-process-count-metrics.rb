#! /usr/bin/env ruby

require 'sensu-plugin/metric/cli'
require 'time'
require 'open3'

class CountCpuMetrics < Sensu::Plugin::Metric::CLI::Graphite
  option :scheme,
         description: 'Metric naming scheme, text to prepend to metric',
         short: '-s SCHEME',
         long: '--scheme SCHEME',
         default: 'sensu'

  option :process_name,
         description: 'The process part(s) to `pgrep` for',
         short: '-p',
         long: '--pgrep-name Process Name',
         default: nil

  option :full_check,
         description: 'Whether to check the full process string, or just the name',
         short: '-f',
         long: '--full-check',
         boolean: true

  def run
    time = Time.now.utc.to_i

    process_name = config[:process_name]

    full_command = config[:full_check] ? ['-f', process_name] : [process_name]

    if (process_name).to_s.empty?
      critical '`process_name`/`p` shouldn\'t be empty!'
    end

    metric, err, status = Open3.capture3('pgrep', *full_command)

    critical "Failed to `pgrep` with message: #{err}" if ! [0, 1].include?(status.exitstatus)

    # We need to count up here, and remove the Ruby process from pgrep's result
    # if present, hence not using `-c`.
    count = 0
    process_number = Process.pid.to_s
    metric.each_line do |line|
      count += 1 unless line.chomp == process_number
    end

    output [config[:scheme], 'process_count', process_name, 'count'].join('.'), count, time

    ok
  end
end
