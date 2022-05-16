xor :: Bool -> Bool -> Bool
xor a b = (a /= b)

impl :: Bool -> Bool -> Bool
impl a b = or [(not a),b]

equiv :: Bool -> Bool -> Bool
equiv a b = (impl a b) && (impl b a)

