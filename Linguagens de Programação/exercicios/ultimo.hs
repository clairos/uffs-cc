ultimo :: [a] -> a 
ultimo [x] = x 
ultimo (_:xs) ultimo xs 

main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5]
    print lista 
    let resultado = ultimo lista 
    print resultado