import Test.Hspec
import Parser (parseLog, Log(..))

spec :: Spec
spec = do
  describe "parseLog" $ do
    it "parses a valid log JSON object" $ do
      let jsonString = "{\"log_body\": \"Hello, world!\", \"stream\": \"stdout\", \"time\": \"2022-03-28T09:00:00Z\"}"
          expectedLog = Log { log_body = "Hello, world!", stream = "stdout", time = "2022-03-28T09:00:00Z" }
      parseLog jsonString `shouldBe` Just expectedLog

    it "returns Nothing for invalid input" $ do
      let jsonString = "invalid JSON"
      parseLog jsonString `shouldBe` Nothing


main :: IO ()
main = hspec spec
