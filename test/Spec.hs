import qualified Test.Framework as Test

import Test.ENIG
import Test.ENIG.Premise


main :: IO ()
main = do
  Test.defaultMain
    [ Test.ENIG.Premise.tests
    , Test.ENIG.tests
    ]
