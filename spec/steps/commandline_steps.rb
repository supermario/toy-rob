
step 'we\'re using the CLI' do
  @stdout = StringIO.new
  @stdin = StdinFaker.new
  @cli = CLI.new(@stdout, @stdin)
end

step 'we send the command "PLACE :x,:y,:direction"' do |x, y, direction|
  @stdin << "PLACE #{x},#{y},#{direction}"
end

step 'we send the command "MOVE"' do
  @stdin << 'MOVE'
end

step 'we send the command "RIGHT"' do
  @stdin << 'RIGHT'
end

step 'we send the command "LEFT"' do
  @stdin << 'LEFT'
end

step 'we send the command "REPORT"' do
  @stdin << 'REPORT'
end

step 'we should see :output' do |output|
  @cli.run
  expect(@stdout.string).to eq(output)
end
