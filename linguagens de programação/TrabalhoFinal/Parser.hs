{-# OPTIONS_GHC -w #-}
module Parser where

import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,360) ([49184,49753,517,0,0,0,0,40958,23589,0,0,0,0,8192,22976,1474,0,0,0,8,512,9628,92,2048,0,0,1412,0,22592,0,33792,5,16384,88,39938,23589,0,22592,0,0,0,0,0,0,1412,49184,49753,517,9628,8284,22976,1474,0,16,65504,49881,5,0,57346,23551,1474,0,0,49184,49753,517,9628,8284,22976,1474,39938,23589,49184,49753,517,9628,8284,22976,1474,39938,23589,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49184,49753,5,33792,5,0,0,39938,23589,65504,57945,517,11676,92,0,0,0,0,0,0,0,512,0,0,0,0,1412,0,0,512,9628,57436,23039,1478,0,2,65504,49757,517,9628,8284,22976,1474,39938,23589,0,0,512,11676,92,32768,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Exp","Type","num","'+'","'-'","'*'","'=='","'>'","'<'","'&&'","'||'","true","false","if","then","else","var","'\\\\'","'->'","'('","')'","'='","let","in","Bool","Num","':'","Tuple","First","Rest","Emp","IsEmp","%eof"]
        bit_start = st Prelude.* 36
        bit_end = (st Prelude.+ 1) Prelude.* 36
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..35]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (6) = happyShift action_2
action_0 (15) = happyShift action_4
action_0 (16) = happyShift action_5
action_0 (17) = happyShift action_6
action_0 (20) = happyShift action_7
action_0 (21) = happyShift action_8
action_0 (23) = happyShift action_9
action_0 (26) = happyShift action_10
action_0 (31) = happyShift action_11
action_0 (32) = happyShift action_12
action_0 (33) = happyShift action_13
action_0 (35) = happyShift action_14
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (6) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (6) = happyShift action_2
action_3 (7) = happyShift action_28
action_3 (8) = happyShift action_29
action_3 (9) = happyShift action_30
action_3 (10) = happyShift action_31
action_3 (11) = happyShift action_32
action_3 (12) = happyShift action_33
action_3 (13) = happyShift action_34
action_3 (14) = happyShift action_35
action_3 (15) = happyShift action_4
action_3 (16) = happyShift action_5
action_3 (17) = happyShift action_6
action_3 (20) = happyShift action_7
action_3 (21) = happyShift action_8
action_3 (23) = happyShift action_9
action_3 (26) = happyShift action_10
action_3 (31) = happyShift action_11
action_3 (32) = happyShift action_12
action_3 (33) = happyShift action_13
action_3 (35) = happyShift action_14
action_3 (36) = happyAccept
action_3 (4) = happyGoto action_27
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 (6) = happyShift action_2
action_6 (15) = happyShift action_4
action_6 (16) = happyShift action_5
action_6 (17) = happyShift action_6
action_6 (20) = happyShift action_7
action_6 (21) = happyShift action_8
action_6 (23) = happyShift action_9
action_6 (26) = happyShift action_10
action_6 (31) = happyShift action_11
action_6 (32) = happyShift action_12
action_6 (33) = happyShift action_13
action_6 (35) = happyShift action_14
action_6 (4) = happyGoto action_26
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_13

action_8 (20) = happyShift action_25
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (6) = happyShift action_2
action_9 (15) = happyShift action_4
action_9 (16) = happyShift action_5
action_9 (17) = happyShift action_6
action_9 (20) = happyShift action_7
action_9 (21) = happyShift action_8
action_9 (23) = happyShift action_9
action_9 (26) = happyShift action_10
action_9 (31) = happyShift action_11
action_9 (32) = happyShift action_12
action_9 (33) = happyShift action_13
action_9 (35) = happyShift action_14
action_9 (4) = happyGoto action_24
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (20) = happyShift action_23
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (23) = happyShift action_16
action_11 (28) = happyShift action_17
action_11 (29) = happyShift action_18
action_11 (31) = happyShift action_19
action_11 (5) = happyGoto action_22
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (23) = happyShift action_16
action_12 (28) = happyShift action_17
action_12 (29) = happyShift action_18
action_12 (31) = happyShift action_19
action_12 (5) = happyGoto action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (23) = happyShift action_16
action_13 (28) = happyShift action_17
action_13 (29) = happyShift action_18
action_13 (31) = happyShift action_19
action_13 (5) = happyGoto action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (23) = happyShift action_16
action_14 (28) = happyShift action_17
action_14 (29) = happyShift action_18
action_14 (31) = happyShift action_19
action_14 (5) = happyGoto action_15
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (6) = happyShift action_2
action_15 (15) = happyShift action_4
action_15 (16) = happyShift action_5
action_15 (17) = happyShift action_6
action_15 (20) = happyShift action_7
action_15 (21) = happyShift action_8
action_15 (23) = happyShift action_9
action_15 (26) = happyShift action_10
action_15 (31) = happyShift action_11
action_15 (32) = happyShift action_12
action_15 (33) = happyShift action_13
action_15 (35) = happyShift action_14
action_15 (4) = happyGoto action_54
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (23) = happyShift action_16
action_16 (28) = happyShift action_17
action_16 (29) = happyShift action_18
action_16 (31) = happyShift action_19
action_16 (5) = happyGoto action_53
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_24

action_18 _ = happyReduce_25

action_19 (23) = happyShift action_16
action_19 (28) = happyShift action_17
action_19 (29) = happyShift action_18
action_19 (31) = happyShift action_19
action_19 (5) = happyGoto action_52
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (6) = happyShift action_2
action_20 (15) = happyShift action_4
action_20 (16) = happyShift action_5
action_20 (17) = happyShift action_6
action_20 (20) = happyShift action_7
action_20 (21) = happyShift action_8
action_20 (23) = happyShift action_9
action_20 (26) = happyShift action_10
action_20 (31) = happyShift action_11
action_20 (32) = happyShift action_12
action_20 (33) = happyShift action_13
action_20 (35) = happyShift action_14
action_20 (4) = happyGoto action_51
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (6) = happyShift action_2
action_21 (15) = happyShift action_4
action_21 (16) = happyShift action_5
action_21 (17) = happyShift action_6
action_21 (20) = happyShift action_7
action_21 (21) = happyShift action_8
action_21 (23) = happyShift action_9
action_21 (26) = happyShift action_10
action_21 (31) = happyShift action_11
action_21 (32) = happyShift action_12
action_21 (33) = happyShift action_13
action_21 (35) = happyShift action_14
action_21 (4) = happyGoto action_50
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (6) = happyShift action_2
action_22 (15) = happyShift action_4
action_22 (16) = happyShift action_5
action_22 (17) = happyShift action_6
action_22 (20) = happyShift action_7
action_22 (21) = happyShift action_8
action_22 (23) = happyShift action_49
action_22 (26) = happyShift action_10
action_22 (31) = happyShift action_11
action_22 (32) = happyShift action_12
action_22 (33) = happyShift action_13
action_22 (35) = happyShift action_14
action_22 (4) = happyGoto action_48
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (25) = happyShift action_47
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (6) = happyShift action_2
action_24 (7) = happyShift action_28
action_24 (8) = happyShift action_29
action_24 (9) = happyShift action_30
action_24 (10) = happyShift action_31
action_24 (11) = happyShift action_32
action_24 (12) = happyShift action_33
action_24 (13) = happyShift action_34
action_24 (14) = happyShift action_35
action_24 (15) = happyShift action_4
action_24 (16) = happyShift action_5
action_24 (17) = happyShift action_6
action_24 (20) = happyShift action_7
action_24 (21) = happyShift action_8
action_24 (23) = happyShift action_9
action_24 (24) = happyShift action_46
action_24 (26) = happyShift action_10
action_24 (31) = happyShift action_11
action_24 (32) = happyShift action_12
action_24 (33) = happyShift action_13
action_24 (35) = happyShift action_14
action_24 (4) = happyGoto action_27
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (30) = happyShift action_45
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (6) = happyShift action_2
action_26 (7) = happyShift action_28
action_26 (8) = happyShift action_29
action_26 (9) = happyShift action_30
action_26 (10) = happyShift action_31
action_26 (11) = happyShift action_32
action_26 (12) = happyShift action_33
action_26 (13) = happyShift action_34
action_26 (14) = happyShift action_35
action_26 (15) = happyShift action_4
action_26 (16) = happyShift action_5
action_26 (17) = happyShift action_6
action_26 (18) = happyShift action_44
action_26 (20) = happyShift action_7
action_26 (21) = happyShift action_8
action_26 (23) = happyShift action_9
action_26 (26) = happyShift action_10
action_26 (31) = happyShift action_11
action_26 (32) = happyShift action_12
action_26 (33) = happyShift action_13
action_26 (35) = happyShift action_14
action_26 (4) = happyGoto action_27
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (6) = happyShift action_2
action_27 (7) = happyShift action_28
action_27 (8) = happyShift action_29
action_27 (9) = happyShift action_30
action_27 (10) = happyShift action_31
action_27 (11) = happyShift action_32
action_27 (12) = happyShift action_33
action_27 (13) = happyShift action_34
action_27 (14) = happyShift action_35
action_27 (15) = happyShift action_4
action_27 (16) = happyShift action_5
action_27 (17) = happyShift action_6
action_27 (20) = happyShift action_7
action_27 (21) = happyShift action_8
action_27 (23) = happyShift action_9
action_27 (26) = happyShift action_10
action_27 (31) = happyShift action_11
action_27 (32) = happyShift action_12
action_27 (33) = happyShift action_13
action_27 (35) = happyShift action_14
action_27 (4) = happyGoto action_27
action_27 _ = happyReduce_15

action_28 (6) = happyShift action_2
action_28 (15) = happyShift action_4
action_28 (16) = happyShift action_5
action_28 (17) = happyShift action_6
action_28 (20) = happyShift action_7
action_28 (21) = happyShift action_8
action_28 (23) = happyShift action_9
action_28 (26) = happyShift action_10
action_28 (31) = happyShift action_11
action_28 (32) = happyShift action_12
action_28 (33) = happyShift action_13
action_28 (35) = happyShift action_14
action_28 (4) = happyGoto action_43
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (6) = happyShift action_2
action_29 (15) = happyShift action_4
action_29 (16) = happyShift action_5
action_29 (17) = happyShift action_6
action_29 (20) = happyShift action_7
action_29 (21) = happyShift action_8
action_29 (23) = happyShift action_9
action_29 (26) = happyShift action_10
action_29 (31) = happyShift action_11
action_29 (32) = happyShift action_12
action_29 (33) = happyShift action_13
action_29 (35) = happyShift action_14
action_29 (4) = happyGoto action_42
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (6) = happyShift action_2
action_30 (15) = happyShift action_4
action_30 (16) = happyShift action_5
action_30 (17) = happyShift action_6
action_30 (20) = happyShift action_7
action_30 (21) = happyShift action_8
action_30 (23) = happyShift action_9
action_30 (26) = happyShift action_10
action_30 (31) = happyShift action_11
action_30 (32) = happyShift action_12
action_30 (33) = happyShift action_13
action_30 (35) = happyShift action_14
action_30 (4) = happyGoto action_41
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (6) = happyShift action_2
action_31 (15) = happyShift action_4
action_31 (16) = happyShift action_5
action_31 (17) = happyShift action_6
action_31 (20) = happyShift action_7
action_31 (21) = happyShift action_8
action_31 (23) = happyShift action_9
action_31 (26) = happyShift action_10
action_31 (31) = happyShift action_11
action_31 (32) = happyShift action_12
action_31 (33) = happyShift action_13
action_31 (35) = happyShift action_14
action_31 (4) = happyGoto action_40
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (6) = happyShift action_2
action_32 (15) = happyShift action_4
action_32 (16) = happyShift action_5
action_32 (17) = happyShift action_6
action_32 (20) = happyShift action_7
action_32 (21) = happyShift action_8
action_32 (23) = happyShift action_9
action_32 (26) = happyShift action_10
action_32 (31) = happyShift action_11
action_32 (32) = happyShift action_12
action_32 (33) = happyShift action_13
action_32 (35) = happyShift action_14
action_32 (4) = happyGoto action_39
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (6) = happyShift action_2
action_33 (15) = happyShift action_4
action_33 (16) = happyShift action_5
action_33 (17) = happyShift action_6
action_33 (20) = happyShift action_7
action_33 (21) = happyShift action_8
action_33 (23) = happyShift action_9
action_33 (26) = happyShift action_10
action_33 (31) = happyShift action_11
action_33 (32) = happyShift action_12
action_33 (33) = happyShift action_13
action_33 (35) = happyShift action_14
action_33 (4) = happyGoto action_38
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (6) = happyShift action_2
action_34 (15) = happyShift action_4
action_34 (16) = happyShift action_5
action_34 (17) = happyShift action_6
action_34 (20) = happyShift action_7
action_34 (21) = happyShift action_8
action_34 (23) = happyShift action_9
action_34 (26) = happyShift action_10
action_34 (31) = happyShift action_11
action_34 (32) = happyShift action_12
action_34 (33) = happyShift action_13
action_34 (35) = happyShift action_14
action_34 (4) = happyGoto action_37
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (6) = happyShift action_2
action_35 (15) = happyShift action_4
action_35 (16) = happyShift action_5
action_35 (17) = happyShift action_6
action_35 (20) = happyShift action_7
action_35 (21) = happyShift action_8
action_35 (23) = happyShift action_9
action_35 (26) = happyShift action_10
action_35 (31) = happyShift action_11
action_35 (32) = happyShift action_12
action_35 (33) = happyShift action_13
action_35 (35) = happyShift action_14
action_35 (4) = happyGoto action_36
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (6) = happyShift action_2
action_36 (15) = happyShift action_4
action_36 (16) = happyShift action_5
action_36 (17) = happyShift action_6
action_36 (20) = happyShift action_7
action_36 (21) = happyShift action_8
action_36 (23) = happyShift action_9
action_36 (26) = happyShift action_10
action_36 (31) = happyShift action_11
action_36 (32) = happyShift action_12
action_36 (33) = happyShift action_13
action_36 (35) = happyShift action_14
action_36 (4) = happyGoto action_27
action_36 _ = happyReduce_11

action_37 (6) = happyShift action_2
action_37 (15) = happyShift action_4
action_37 (16) = happyShift action_5
action_37 (17) = happyShift action_6
action_37 (20) = happyShift action_7
action_37 (21) = happyShift action_8
action_37 (23) = happyShift action_9
action_37 (26) = happyShift action_10
action_37 (31) = happyShift action_11
action_37 (32) = happyShift action_12
action_37 (33) = happyShift action_13
action_37 (35) = happyShift action_14
action_37 (4) = happyGoto action_27
action_37 _ = happyReduce_10

action_38 (6) = happyShift action_2
action_38 (15) = happyShift action_4
action_38 (16) = happyShift action_5
action_38 (17) = happyShift action_6
action_38 (20) = happyShift action_7
action_38 (21) = happyShift action_8
action_38 (23) = happyShift action_9
action_38 (26) = happyShift action_10
action_38 (31) = happyShift action_11
action_38 (32) = happyShift action_12
action_38 (33) = happyShift action_13
action_38 (35) = happyShift action_14
action_38 (4) = happyGoto action_27
action_38 _ = happyReduce_9

action_39 (6) = happyShift action_2
action_39 (15) = happyShift action_4
action_39 (16) = happyShift action_5
action_39 (17) = happyShift action_6
action_39 (20) = happyShift action_7
action_39 (21) = happyShift action_8
action_39 (23) = happyShift action_9
action_39 (26) = happyShift action_10
action_39 (31) = happyShift action_11
action_39 (32) = happyShift action_12
action_39 (33) = happyShift action_13
action_39 (35) = happyShift action_14
action_39 (4) = happyGoto action_27
action_39 _ = happyReduce_8

action_40 (6) = happyShift action_2
action_40 (15) = happyShift action_4
action_40 (16) = happyShift action_5
action_40 (17) = happyShift action_6
action_40 (20) = happyShift action_7
action_40 (21) = happyShift action_8
action_40 (23) = happyShift action_9
action_40 (26) = happyShift action_10
action_40 (31) = happyShift action_11
action_40 (32) = happyShift action_12
action_40 (33) = happyShift action_13
action_40 (35) = happyShift action_14
action_40 (4) = happyGoto action_27
action_40 _ = happyReduce_7

action_41 (6) = happyShift action_2
action_41 (15) = happyShift action_4
action_41 (16) = happyShift action_5
action_41 (17) = happyShift action_6
action_41 (20) = happyShift action_7
action_41 (21) = happyShift action_8
action_41 (23) = happyShift action_9
action_41 (26) = happyShift action_10
action_41 (31) = happyShift action_11
action_41 (32) = happyShift action_12
action_41 (33) = happyShift action_13
action_41 (35) = happyShift action_14
action_41 (4) = happyGoto action_27
action_41 _ = happyReduce_6

action_42 (6) = happyShift action_2
action_42 (15) = happyShift action_4
action_42 (16) = happyShift action_5
action_42 (17) = happyShift action_6
action_42 (20) = happyShift action_7
action_42 (21) = happyShift action_8
action_42 (23) = happyShift action_9
action_42 (26) = happyShift action_10
action_42 (31) = happyShift action_11
action_42 (32) = happyShift action_12
action_42 (33) = happyShift action_13
action_42 (35) = happyShift action_14
action_42 (4) = happyGoto action_27
action_42 _ = happyReduce_5

action_43 (6) = happyShift action_2
action_43 (15) = happyShift action_4
action_43 (16) = happyShift action_5
action_43 (17) = happyShift action_6
action_43 (20) = happyShift action_7
action_43 (21) = happyShift action_8
action_43 (23) = happyShift action_9
action_43 (26) = happyShift action_10
action_43 (31) = happyShift action_11
action_43 (32) = happyShift action_12
action_43 (33) = happyShift action_13
action_43 (35) = happyShift action_14
action_43 (4) = happyGoto action_27
action_43 _ = happyReduce_4

action_44 (6) = happyShift action_2
action_44 (15) = happyShift action_4
action_44 (16) = happyShift action_5
action_44 (17) = happyShift action_6
action_44 (20) = happyShift action_7
action_44 (21) = happyShift action_8
action_44 (23) = happyShift action_9
action_44 (26) = happyShift action_10
action_44 (31) = happyShift action_11
action_44 (32) = happyShift action_12
action_44 (33) = happyShift action_13
action_44 (35) = happyShift action_14
action_44 (4) = happyGoto action_60
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_16
action_45 (28) = happyShift action_17
action_45 (29) = happyShift action_18
action_45 (31) = happyShift action_19
action_45 (5) = happyGoto action_59
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_16

action_47 (6) = happyShift action_2
action_47 (15) = happyShift action_4
action_47 (16) = happyShift action_5
action_47 (17) = happyShift action_6
action_47 (20) = happyShift action_7
action_47 (21) = happyShift action_8
action_47 (23) = happyShift action_9
action_47 (26) = happyShift action_10
action_47 (31) = happyShift action_11
action_47 (32) = happyShift action_12
action_47 (33) = happyShift action_13
action_47 (35) = happyShift action_14
action_47 (4) = happyGoto action_58
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (6) = happyShift action_2
action_48 (7) = happyShift action_28
action_48 (8) = happyShift action_29
action_48 (9) = happyShift action_30
action_48 (10) = happyShift action_31
action_48 (11) = happyShift action_32
action_48 (12) = happyShift action_33
action_48 (13) = happyShift action_34
action_48 (14) = happyShift action_35
action_48 (15) = happyShift action_4
action_48 (16) = happyShift action_5
action_48 (17) = happyShift action_6
action_48 (20) = happyShift action_7
action_48 (21) = happyShift action_8
action_48 (23) = happyShift action_9
action_48 (26) = happyShift action_10
action_48 (30) = happyShift action_57
action_48 (31) = happyShift action_11
action_48 (32) = happyShift action_12
action_48 (33) = happyShift action_13
action_48 (35) = happyShift action_14
action_48 (4) = happyGoto action_27
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (6) = happyShift action_2
action_49 (15) = happyShift action_4
action_49 (16) = happyShift action_5
action_49 (17) = happyShift action_6
action_49 (20) = happyShift action_7
action_49 (21) = happyShift action_8
action_49 (23) = happyShift action_9
action_49 (24) = happyShift action_56
action_49 (26) = happyShift action_10
action_49 (31) = happyShift action_11
action_49 (32) = happyShift action_12
action_49 (33) = happyShift action_13
action_49 (35) = happyShift action_14
action_49 (4) = happyGoto action_24
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (6) = happyShift action_2
action_50 (7) = happyShift action_28
action_50 (8) = happyShift action_29
action_50 (9) = happyShift action_30
action_50 (10) = happyShift action_31
action_50 (11) = happyShift action_32
action_50 (12) = happyShift action_33
action_50 (13) = happyShift action_34
action_50 (14) = happyShift action_35
action_50 (15) = happyShift action_4
action_50 (16) = happyShift action_5
action_50 (17) = happyShift action_6
action_50 (20) = happyShift action_7
action_50 (21) = happyShift action_8
action_50 (23) = happyShift action_9
action_50 (26) = happyShift action_10
action_50 (31) = happyShift action_11
action_50 (32) = happyShift action_12
action_50 (33) = happyShift action_13
action_50 (35) = happyShift action_14
action_50 (4) = happyGoto action_27
action_50 _ = happyReduce_21

action_51 (6) = happyShift action_2
action_51 (7) = happyShift action_28
action_51 (8) = happyShift action_29
action_51 (9) = happyShift action_30
action_51 (10) = happyShift action_31
action_51 (11) = happyShift action_32
action_51 (12) = happyShift action_33
action_51 (13) = happyShift action_34
action_51 (14) = happyShift action_35
action_51 (15) = happyShift action_4
action_51 (16) = happyShift action_5
action_51 (17) = happyShift action_6
action_51 (20) = happyShift action_7
action_51 (21) = happyShift action_8
action_51 (23) = happyShift action_9
action_51 (26) = happyShift action_10
action_51 (31) = happyShift action_11
action_51 (32) = happyShift action_12
action_51 (33) = happyShift action_13
action_51 (35) = happyShift action_14
action_51 (4) = happyGoto action_27
action_51 _ = happyReduce_22

action_52 _ = happyReduce_27

action_53 (22) = happyShift action_55
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (6) = happyShift action_2
action_54 (7) = happyShift action_28
action_54 (8) = happyShift action_29
action_54 (9) = happyShift action_30
action_54 (10) = happyShift action_31
action_54 (11) = happyShift action_32
action_54 (12) = happyShift action_33
action_54 (13) = happyShift action_34
action_54 (14) = happyShift action_35
action_54 (15) = happyShift action_4
action_54 (16) = happyShift action_5
action_54 (17) = happyShift action_6
action_54 (20) = happyShift action_7
action_54 (21) = happyShift action_8
action_54 (23) = happyShift action_9
action_54 (26) = happyShift action_10
action_54 (31) = happyShift action_11
action_54 (32) = happyShift action_12
action_54 (33) = happyShift action_13
action_54 (35) = happyShift action_14
action_54 (4) = happyGoto action_27
action_54 _ = happyReduce_23

action_55 (23) = happyShift action_16
action_55 (28) = happyShift action_17
action_55 (29) = happyShift action_18
action_55 (31) = happyShift action_19
action_55 (5) = happyGoto action_66
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_18

action_57 (6) = happyShift action_2
action_57 (15) = happyShift action_4
action_57 (16) = happyShift action_5
action_57 (17) = happyShift action_6
action_57 (20) = happyShift action_7
action_57 (21) = happyShift action_8
action_57 (23) = happyShift action_65
action_57 (26) = happyShift action_10
action_57 (31) = happyShift action_11
action_57 (32) = happyShift action_12
action_57 (33) = happyShift action_13
action_57 (35) = happyShift action_14
action_57 (4) = happyGoto action_64
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (6) = happyShift action_2
action_58 (7) = happyShift action_28
action_58 (8) = happyShift action_29
action_58 (9) = happyShift action_30
action_58 (10) = happyShift action_31
action_58 (11) = happyShift action_32
action_58 (12) = happyShift action_33
action_58 (13) = happyShift action_34
action_58 (14) = happyShift action_35
action_58 (15) = happyShift action_4
action_58 (16) = happyShift action_5
action_58 (17) = happyShift action_6
action_58 (20) = happyShift action_7
action_58 (21) = happyShift action_8
action_58 (23) = happyShift action_9
action_58 (26) = happyShift action_10
action_58 (27) = happyShift action_63
action_58 (31) = happyShift action_11
action_58 (32) = happyShift action_12
action_58 (33) = happyShift action_13
action_58 (35) = happyShift action_14
action_58 (4) = happyGoto action_27
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (22) = happyShift action_62
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (6) = happyShift action_2
action_60 (7) = happyShift action_28
action_60 (8) = happyShift action_29
action_60 (9) = happyShift action_30
action_60 (10) = happyShift action_31
action_60 (11) = happyShift action_32
action_60 (12) = happyShift action_33
action_60 (13) = happyShift action_34
action_60 (14) = happyShift action_35
action_60 (15) = happyShift action_4
action_60 (16) = happyShift action_5
action_60 (17) = happyShift action_6
action_60 (19) = happyShift action_61
action_60 (20) = happyShift action_7
action_60 (21) = happyShift action_8
action_60 (23) = happyShift action_9
action_60 (26) = happyShift action_10
action_60 (31) = happyShift action_11
action_60 (32) = happyShift action_12
action_60 (33) = happyShift action_13
action_60 (35) = happyShift action_14
action_60 (4) = happyGoto action_27
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (6) = happyShift action_2
action_61 (15) = happyShift action_4
action_61 (16) = happyShift action_5
action_61 (17) = happyShift action_6
action_61 (20) = happyShift action_7
action_61 (21) = happyShift action_8
action_61 (23) = happyShift action_9
action_61 (26) = happyShift action_10
action_61 (31) = happyShift action_11
action_61 (32) = happyShift action_12
action_61 (33) = happyShift action_13
action_61 (35) = happyShift action_14
action_61 (4) = happyGoto action_71
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (6) = happyShift action_2
action_62 (15) = happyShift action_4
action_62 (16) = happyShift action_5
action_62 (17) = happyShift action_6
action_62 (20) = happyShift action_7
action_62 (21) = happyShift action_8
action_62 (23) = happyShift action_9
action_62 (26) = happyShift action_10
action_62 (31) = happyShift action_11
action_62 (32) = happyShift action_12
action_62 (33) = happyShift action_13
action_62 (35) = happyShift action_14
action_62 (4) = happyGoto action_70
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (6) = happyShift action_2
action_63 (15) = happyShift action_4
action_63 (16) = happyShift action_5
action_63 (17) = happyShift action_6
action_63 (20) = happyShift action_7
action_63 (21) = happyShift action_8
action_63 (23) = happyShift action_9
action_63 (26) = happyShift action_10
action_63 (31) = happyShift action_11
action_63 (32) = happyShift action_12
action_63 (33) = happyShift action_13
action_63 (35) = happyShift action_14
action_63 (4) = happyGoto action_69
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (6) = happyShift action_2
action_64 (7) = happyShift action_28
action_64 (8) = happyShift action_29
action_64 (9) = happyShift action_30
action_64 (10) = happyShift action_31
action_64 (11) = happyShift action_32
action_64 (12) = happyShift action_33
action_64 (13) = happyShift action_34
action_64 (14) = happyShift action_35
action_64 (15) = happyShift action_4
action_64 (16) = happyShift action_5
action_64 (17) = happyShift action_6
action_64 (20) = happyShift action_7
action_64 (21) = happyShift action_8
action_64 (23) = happyShift action_9
action_64 (26) = happyShift action_10
action_64 (31) = happyShift action_11
action_64 (32) = happyShift action_12
action_64 (33) = happyShift action_13
action_64 (35) = happyShift action_14
action_64 (4) = happyGoto action_27
action_64 _ = happyReduce_20

action_65 (6) = happyShift action_2
action_65 (15) = happyShift action_4
action_65 (16) = happyShift action_5
action_65 (17) = happyShift action_6
action_65 (20) = happyShift action_7
action_65 (21) = happyShift action_8
action_65 (23) = happyShift action_9
action_65 (24) = happyShift action_68
action_65 (26) = happyShift action_10
action_65 (31) = happyShift action_11
action_65 (32) = happyShift action_12
action_65 (33) = happyShift action_13
action_65 (35) = happyShift action_14
action_65 (4) = happyGoto action_24
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (24) = happyShift action_67
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_26

action_68 _ = happyReduce_19

action_69 (6) = happyShift action_2
action_69 (7) = happyShift action_28
action_69 (8) = happyShift action_29
action_69 (9) = happyShift action_30
action_69 (10) = happyShift action_31
action_69 (11) = happyShift action_32
action_69 (12) = happyShift action_33
action_69 (13) = happyShift action_34
action_69 (14) = happyShift action_35
action_69 (15) = happyShift action_4
action_69 (16) = happyShift action_5
action_69 (17) = happyShift action_6
action_69 (20) = happyShift action_7
action_69 (21) = happyShift action_8
action_69 (23) = happyShift action_9
action_69 (26) = happyShift action_10
action_69 (31) = happyShift action_11
action_69 (32) = happyShift action_12
action_69 (33) = happyShift action_13
action_69 (35) = happyShift action_14
action_69 (4) = happyGoto action_27
action_69 _ = happyReduce_17

action_70 (6) = happyShift action_2
action_70 (7) = happyShift action_28
action_70 (8) = happyShift action_29
action_70 (9) = happyShift action_30
action_70 (10) = happyShift action_31
action_70 (11) = happyShift action_32
action_70 (12) = happyShift action_33
action_70 (13) = happyShift action_34
action_70 (14) = happyShift action_35
action_70 (15) = happyShift action_4
action_70 (16) = happyShift action_5
action_70 (17) = happyShift action_6
action_70 (20) = happyShift action_7
action_70 (21) = happyShift action_8
action_70 (23) = happyShift action_9
action_70 (26) = happyShift action_10
action_70 (31) = happyShift action_11
action_70 (32) = happyShift action_12
action_70 (33) = happyShift action_13
action_70 (35) = happyShift action_14
action_70 (4) = happyGoto action_27
action_70 _ = happyReduce_14

action_71 (6) = happyShift action_2
action_71 (7) = happyShift action_28
action_71 (8) = happyShift action_29
action_71 (9) = happyShift action_30
action_71 (10) = happyShift action_31
action_71 (11) = happyShift action_32
action_71 (12) = happyShift action_33
action_71 (13) = happyShift action_34
action_71 (14) = happyShift action_35
action_71 (15) = happyShift action_4
action_71 (16) = happyShift action_5
action_71 (17) = happyShift action_6
action_71 (20) = happyShift action_7
action_71 (21) = happyShift action_8
action_71 (23) = happyShift action_9
action_71 (26) = happyShift action_10
action_71 (31) = happyShift action_11
action_71 (32) = happyShift action_12
action_71 (33) = happyShift action_13
action_71 (35) = happyShift action_14
action_71 (4) = happyGoto action_27
action_71 _ = happyReduce_12

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn4
		 (Num happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn4
		 (BTrue
	)

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (BFalse
	)

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Add happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Equal happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Great happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Less happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (And happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Or happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 6 4 happyReduction_12
happyReduction_12 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_1  4 happyReduction_13
happyReduction_13 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 6 4 happyReduction_14
happyReduction_14 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_2  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Paren happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 6 4 happyReduction_17
happyReduction_17 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Emp happy_var_2
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 6 4 happyReduction_19
happyReduction_19 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tuple happy_var_2 happy_var_3 (Emp happy_var_2)
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 5 4 happyReduction_20
happyReduction_20 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Tuple happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_3  4 happyReduction_21
happyReduction_21 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (First happy_var_2 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Rest happy_var_2 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  4 happyReduction_23
happyReduction_23 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (IsEmp happy_var_2 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  5 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn5
		 (TBool
	)

happyReduce_25 = happySpecReduce_1  5 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn5
		 (TNum
	)

happyReduce_26 = happyReduce 5 5 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TFun happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_2  5 happyReduction_27
happyReduction_27 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (TTuple happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenNum happy_dollar_dollar -> cont 6;
	TokenAdd -> cont 7;
	TokenSub -> cont 8;
	TokenMul -> cont 9;
	TokenEqual -> cont 10;
	TokenGreat -> cont 11;
	TokenLess -> cont 12;
	TokenAnd -> cont 13;
	TokenOr -> cont 14;
	TokenTrue -> cont 15;
	TokenFalse -> cont 16;
	TokenIf -> cont 17;
	TokenThen -> cont 18;
	TokenElse -> cont 19;
	TokenVar happy_dollar_dollar -> cont 20;
	TokenLam -> cont 21;
	TokenArrow -> cont 22;
	TokenLParen -> cont 23;
	TokenRParen -> cont 24;
	TokenEq -> cont 25;
	TokenLet -> cont 26;
	TokenIn -> cont 27;
	TokenBoolean -> cont 28;
	TokenNumber -> cont 29;
	TokenColon -> cont 30;
	TokenTuple -> cont 31;
	TokenFirst -> cont 32;
	TokenRest -> cont 33;
	TokenEmp -> cont 34;
	TokenIsEmp -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parserError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parserError :: [Token] -> a 
parserError _ = error "Syntax error!"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
