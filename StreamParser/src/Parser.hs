{-# OPTIONS_GHC -Wno-missing-export-lists #-}
{-# LANGUAGE OverloadedStrings #-}
module Parser where

import Data.Aeson
import Data.String

data Log = Log { log_body :: String, stream :: String, time :: String } deriving (Show, Eq)

instance FromJSON Log where
  parseJSON (Object v) = Log
    <$> v .: "log_body"
    <*> v .: "stream"
    <*> v .: "time"
  parseJSON _ = fail "Expected an object for Log"

instance ToJSON Log where
  toJSON (Log _log _stream _time) = object
    [ "log_body" .= _log
    , "stream" .= _stream
    , "time" .= _time
    ]

parseLog :: String -> Maybe Log
parseLog = decode . fromString
