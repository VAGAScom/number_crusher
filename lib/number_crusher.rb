require "number_crusher/version"

module NumberCrusher
end

require "number_crusher/support/enumerator_extension"

require "number_crusher/average"
require "number_crusher/quantile"
require "number_crusher/resampling_with_replacement"
require "number_crusher/bootstrapping"
require "number_crusher/bootstrapped_confidence_interval"
require "number_crusher/kernel_density_estimator"
require "number_crusher/kde_bandwidth_finder"
require "number_crusher/kernel/epanechnikov"
require "number_crusher/kernel/gauss"
