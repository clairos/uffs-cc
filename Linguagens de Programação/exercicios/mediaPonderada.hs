mediaPonderada :: Float -> Float -> Float -> String
mediaPonderada trabalho avaliacao exame = conceito
    where
        media = (2 * trabalho + 3 * avaliacao + 5 * exame) / 10
        conceito
            | media >= 8 = "A"
            | media >= 7 = "B"
            | media >= 6 = "C"
            | media >= 5 = "D"
            | otherwise = "E"

main :: IO ()
main = do
    trabalho <- readLn
    avaliacao <- readLn
    exame <- readLn
    putStrLn (mediaPonderada trabalho avaliacao exame)
