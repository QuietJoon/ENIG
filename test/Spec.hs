import qualified Test.Framework as Test

import Test.ENIG.Premise


main :: IO ()
main = do
  Test.defaultMain [
    Test.ENIG.Premise.tests
    ]
