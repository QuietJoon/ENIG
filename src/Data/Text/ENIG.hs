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


enigPPP :: Text -> PPPCategory -> Text
enigPPP inputStr pppCa =
  if isHangul lastComponent
    then tShowPPPId . (toEnum :: Int -> PPPIdentity) $
      if isLastVowel lastComponent
        then snd selectedPPPIPair
        else fst selectedPPPIPair
    else if isDigit lastComponent
      then error "enigPPPByDigit is not implemented"
      else tShowPPPCa pppCa
  where
    selectedPPPIPair = pppidVector V.! fromEnum pppCa
    -- preprocessForPPP for handling parenthesis, quatation, etc.
    preprocessForPPP = id
    preprocessed = preprocessForPPP inputStr
    lastComponent = getLastComponentCode preprocessed
    -- handling PPP with digit is not implemented
    isDigit _ = False

enigPPPWithPost :: Text -> PPPCategory -> Text -> Text
enigPPPWithPost inputStr pppCa postStr = T.append (enigPPP inputStr pppCa) postStr

