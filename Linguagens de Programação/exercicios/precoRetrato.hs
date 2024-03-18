precoRetrato :: Integer -> String -> Double
precoRetrato pessoas dia = total
    where 
        preco 
            | pessoas == 1 = 100.0
            | pessoas == 2 = 130.0
            | pessoas == 3 = 150.0
            | pessoas == 4 = 165.0
            | pessoas == 5 = 175.0
            | pessoas == 6 = 180.0
            | otherwise = 185.0
        
        total = if dia == "sabado" || dia == "domingo"
                    then preco * 1.2
                    else preco 

main :: IO ()
main = do
    pessoas <- readLn
    dia <- getLine
    print (precoRetrato pessoas dia)
