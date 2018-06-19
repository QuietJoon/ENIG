module Data.Text.ENIG.Data where


import           Data.Text               (Text)
import qualified Data.Text               as T


-- TODO: Optimize order of PPPI by Hangul statistical data
-- EN: 은/는, EL: 을/를, IG: 이/가, WG: 와/과, Ix: 이/null
data PPPCategory = EN | EL | IG | WG | IX
                      deriving (Eq,Ord,Enum,Bounded,Show,Read)

data PPPIdentity  = Eun | Neun | Eul | Leul | I | Ga | Wa | Gwa | Ix | X
                      deriving (Eq,Ord,Enum,Bounded,Show,Read)
