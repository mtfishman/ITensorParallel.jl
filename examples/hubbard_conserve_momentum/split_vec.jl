function split_vec(x::Vector, npartitions::Int)
  partition_lengths = zeros(Int, npartitions)
  which_part = 1
  for j in 1:length(x)
    partition_lengths[which_part] += 1
    which_part = mod1(which_part + 1, npartitions)
  end
  partition_stops = [0; accumulate(+, partition_lengths)]
  partition_ranges = [
    (partition_stops[j] + 1):partition_stops[j + 1] for j in 1:(length(partition_stops) - 1)
  ]
  return [x[partition_range] for partition_range in partition_ranges]
end