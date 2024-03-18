-- module Aula2 where 
module Main (main) where

soma :: Int -> Int -> Int
soma x y = x + y

(+++) :: Int -> Int -> Int 
(+++) x y = x + y

areaCirculo r = pi * r^2

teste :: Int -> String
teste x = if x >= 0 then
            "positivo"
          else
            "negativo"

vabs :: Int -> Int
vabs n | n >= 0    = n
       | otherwise = -n 

sinal :: Int -> Int 
sinal n | n < 0     = -1
        | n == 0    = 0
        | otherwise = 1

areaTriangulo a b c = let s = (a + b + c) / 2
                        in sqrt (s * (s-a) * (s-b) * (s-c))

areaTriangulo2 a b c = sqrt ( s * (s-a) * (s-b) * (s-c))
    where
        s = (a + b + c) / 2

empty yn = if not (null yn)
           then head yn
           else "empty"

main :: IO ()
main = do putStrLn "Qual seu nome?"
          nome <- getLine
          putStr nome 
          putStrLn ", seja bem vindo(a)!"
