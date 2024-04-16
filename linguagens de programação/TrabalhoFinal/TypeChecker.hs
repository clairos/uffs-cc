module TypeChecker where 

import Lexer 
import Parser
import Interpreter

type Ctx = [(String,Ty)]

typeof :: Ctx -> Expr -> Maybe Ty 
typeof ctx BTrue = Just TBool 
typeof ctx BFalse = Just TBool 
typeof ctx (Num _) = Just TNum 

typeof ctx (Add e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing 
typeof ctx (Sub e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof ctx (Mul e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing

typeof ctx (And e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TBool, Just TBool) -> Just TBool 
                       _                        -> Nothing
typeof ctx (Or e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                        (Just TBool, Just TBool) -> Just TBool 
                        _                        -> Nothing
-- typeof ctx (Or e1 e2) = case (typeof ctx e1, typeof ctx e2) of
--                        (Just TBool, _)          -> Just TBool
--                        _                        -> Nothing


typeof ctx (If e1 e2 e3) = case typeof ctx e1 of 
                         Just TBool -> case (typeof ctx e2, typeof ctx e3) of
                                         (Just t1, Just t2)       -> if (t1 == t2) then
                                                                       Just t1 
                                                                     else 
                                                                       Nothing
                                         _                        -> Nothing
                         _          -> Nothing

typeof ctx (Equal e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                        (Just TNum, Just TNum)   -> Just TBool 
                        _                        -> Nothing
typeof ctx (Great e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                        (Just TNum, Just TNum)   -> Just TBool 
                        _                        -> Nothing
typeof ctx (Less e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                        (Just TNum, Just TNum)   -> Just TBool 
                        _                        -> Nothing

typeof ctx (Var x) = lookup x ctx 
typeof ctx (Lam v t1 b) = let ctx' = (v, t1):ctx 
                            in case typeof ctx' b of 
                                 Just t2 -> Just (TFun t1 t2)
                                 _       -> Nothing
typeof ctx (App e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                           (Just (TFun t11 t12), Just t2) -> if (t11 == t2) then 
                                                               Just t12
                                                             else 
                                                               Nothing 
                           _  -> Nothing
typeof ctx (Let v e1 e2) = case typeof ctx e1 of 
                             Just t1 -> typeof ((v, t1):ctx) e2 
                             _       -> Nothing 

typeof ctx (Paren e) = typeof ctx e

-- typeof ctx (Tuple e1 e2) = case typeof ctx e1 of  -- faltou tipo ???????? 
--                              Just t1 -> typeof ((t1):ctx) e2
--                              _       -> Nothing

typeof ctx (Tuple t e1 e2) = case typeof ctx e1 of
                              Just t1 -> if t == t1 
                                           then case typeof ctx e2 of 
                                              Just (TTuple t2) -> Just (TTuple t)
                                              Nothing -> Nothing 
                                           else Nothing
                              _ -> Nothing

typeof ctx (Emp t) = Just (TTuple t)

typeof ctx (IsEmp t e1) = case typeof ctx e1 of 
                              Just t1 -> if t1 == (TTuple t)
                                           then Just TBool 
                                           else Nothing
                              _ -> Nothing

typeof ctx (First t e1) = case typeof ctx e1 of 
                              Just t1 -> if t1 == (TTuple t)
                                           then Just TBool 
                                           else Nothing
                              _ -> Nothing

typeof ctx (Rest t e1) = case typeof ctx e1 of 
                              Just t1 -> if t1 == (TTuple t)
                                           then Just TBool 
                                           else Nothing
                              _ -> Nothing

typecheck :: Expr -> Expr 
typecheck e = case typeof [] e of 
                Just _ -> e 
                _      -> error "Type error!"