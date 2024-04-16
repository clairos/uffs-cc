salarioLiquido :: Float -> Float
salarioLiquido salarioBase =
  let
    gratificacao = salarioBase * 0.1
    imposto = salarioBase * 0.07
  in
    salarioBase + gratificacao - imposto

main :: IO ()
main = do
  salarioBase <- readLn
  print $ salarioLiquido salarioBase
