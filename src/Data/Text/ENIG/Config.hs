module Data.Text.ENIG.Config where


import Data.Text.ENIG.Data


import Data.Char
import qualified Data.Vector.Unboxed as V


lastConsonantCodeList = [4520..4607]
lastConsonantList = map chr lastConsonantCodeList

vowelCodeList = [4449..4519]
vowelList = map chr vowelCodeList

hangulComponentCodeList = [4352..4607]
hangulComponentList = map chr hangulComponentCodeList


-- Not good generation code. Need to be refactored.
pppidVector = V.fromList
  [(fromEnum Eun,fromEnum Neun)
  ,(fromEnum Eul,fromEnum Leul)
  ,(fromEnum I,fromEnum Ga)
  ,(fromEnum Gwa,fromEnum Wa)
  ,(fromEnum A,fromEnum Ya)
  ,(fromEnum Ix,fromEnum X)
  ,(fromEnum Eux,fromEnum X)
  ]
