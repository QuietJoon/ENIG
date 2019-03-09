{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Test.ENIG where

import Test.Framework
import Test.Framework.Providers.HUnit
import Test.Framework.TH
import Test.HUnit.Base

import qualified Data.Text as T
import Data.Text.Normalize

import Data.Text.ENIG
import Data.Text.ENIG.Data
import Data.Text.ENIG.Show


tests = $(testGroupGenerator)


test_UsualCases =
  [ testCase "과자을(를) = 과자를" c_01
  , testCase "무엇을(를) = 무엇을" c_02
  , testCase "한글을(를) = 한글을" c_03
  ]
test_EuXCases =
  [ testCase "과자(으)로 = 과자로" c_11
  , testCase "무엇(으)로 = 무엇으로" c_12
  , testCase "한글(으)로 = 한글로" c_13
  ]

preHangulStrList = ["과자", "무엇", "한글", "ㄱ", "ㅏ"]
preNotHangulStrList = ["1", "2", "test", "harm"]

c_01 = tShowPPPId Leul @?= (enigPPP  arg EL)
  where arg = preHangulStrList !! 0
c_02 = tShowPPPId Eul @?= (enigPPP  arg EL)
  where arg = preHangulStrList !! 1
c_03 = tShowPPPId Eul @?= (enigPPP  arg EL)
  where arg = preHangulStrList !! 3

c_11 = tShowPPPId X @?= (enigPPP  arg EuX)
  where arg = preHangulStrList !! 0
c_12 = tShowPPPId Eux @?= (enigPPP  arg EuX)
  where arg = preHangulStrList !! 1
c_13 = tShowPPPId X @?= (enigPPP  arg EuX)
  where arg = preHangulStrList !! 2
