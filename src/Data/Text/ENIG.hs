{-# LANGUAGE OverloadedStrings #-}

module Data.Text.ENIG where

import Data.Text.ENIG.Config
import Data.Text.ENIG.Data
import Data.Text.ENIG.Detect
import Data.Text.ENIG.Show


import Data.Char

import           Data.Text (Text)
import qualified Data.Text as T

import Data.Text.Normalize

import qualified Data.Vector.Unboxed as V


-- | Return proper and minimal PPP about given text
--   주어진 단어와 조사의 종류에 대해서 최소한의 적절한 조사의 문자열을 반환함
--
-- >>> enigPPP "과자" WG
-- "와"
-- >>> enigPPP "무엇" WG
-- "과"
enigPPP :: Text -> PPPCategory -> Text
enigPPP inputStr pppCa =
  if isHangul lastComponent
    then tShowPPPId . (toEnum :: Int -> PPPIdentity) $
      if isSecondType
        then snd selectedPPPIPair
        else fst selectedPPPIPair
    else if isDigit lastComponent
      then error "enigPPPByDigit is not implemented"
      else tShowPPPCa pppCa
  where
    isSecondType = isLastVowel lastComponent || (pppCa == EuX && isLastR lastComponent)
    selectedPPPIPair = pppidVector V.! fromEnum pppCa
    -- preprocessForPPP for handling parenthesis, quatation, etc.
    preprocessForPPP = id
    preprocessed = preprocessForPPP inputStr
    lastComponent = getLastComponentCode preprocessed
    -- handling PPP with digit is not implemented
    isDigit _ = False

-- | Return proper PPP about given text with post text
--   주어진 단어와 조사의 종류에 대해서 적절한 조사의 문자열을 반환함
--
-- >>> enigPPP "과자" EuX "로"
-- "로"
-- >>> enigPPP "무엇" EuX "로"
-- "으로"
enigPPPWithPost :: Text -> PPPCategory -> Text -> Text
enigPPPWithPost inputStr pppCa postStr = T.append (enigPPP inputStr pppCa) postStr

