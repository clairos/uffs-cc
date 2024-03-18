main :: IO ()
main = do
    -- let lista = 1:2:3:[]
    -- print lista

    -- let l = [[], ['a', 'b']]
    -- print (null l || null (head l))

    -- let l = ['a', 'b']
    -- print (not (null l) && null (tail l))

    let l = "anilina"
    print (l == reverse l)