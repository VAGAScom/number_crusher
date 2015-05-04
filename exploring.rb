require "number_crusher"
require "json"
include NumberCrusher

@sample = JSON.parse(File.read("data.json"))
@xs = (500..2000).step(10)
@kernel = Gauss()

def kde(bandwidth)
  KernelDensityEstimator(@sample,
                         function: @kernel,
                         xs: @xs,
                         bandwidth: bandwidth)
end

k = nil
band = (1..2_000)
band.bsearch do |width|
  p width
  k = kde(width)
  k.each_cons(3).none? do |(a, b, c)|
    a[1] > b[1] && b[1] < c[1]
  end
end

k.each do |(x, y)|
  printf("%d\t%f\n", x, y)
end
