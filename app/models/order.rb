class Order < ApplicationRecord
  enum pay_type: {
    "Check"           => 0,
    "Credit card"     => 1,
    "Puurchase order" => 2
  }
end
