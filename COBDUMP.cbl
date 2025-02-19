 146                IF WS-Output-SUB = 16
   147                    CALL "C$PRINTABLE" USING WS-OD-ASCII-Data-TXT
   148                    DISPLAY WS-Output-Detail-TXT UPON SYSERR
   149                    MOVE SPACES TO WS-Output-Detail-TXT
   150                    MOVE 0 TO WS-Output-SUB
   151                    SET WS-Addr-PTR UP BY 16
   152                    PERFORM 100-Generate-Address
   153                END-IF
   154            END-PERFORM
   155            IF WS-Output-SUB > 0
   156                CALL "C$PRINTABLE" USING WS-OD-ASCII-Data-TXT
   157                DISPLAY WS-Output-Detail-TXT UPON SYSERR
   158            END-IF
   159            EXIT PROGRAM
   160            .
   161        100-Generate-Address SECTION.
   162            MOVE 8 TO WS-Addr-SUB
   163            MOVE WS-Addr-NUM TO WS-Addr-Value-NUM
   164            MOVE ALL '0' TO WS-OD-Addr-TXT
   165            PERFORM WITH TEST BEFORE UNTIL WS-Addr-Value-NUM = 0
   166                DIVIDE WS-Addr-Value-NUM BY 16
   167                    GIVING WS-Addr-Value-NUM
   168                    REMAINDER WS-Nibble-SUB
   169                ADD 1 TO WS-Nibble-SUB
   170                MOVE WS-Hex-Digit-CHR (WS-Nibble-SUB)
   171                  TO WS-OD-Addr-Hex-CHR (WS-Addr-SUB)
   172                SUBTRACT 1 FROM WS-Addr-SUB
   173            END-PERFORM
