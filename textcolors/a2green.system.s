        .setcpu "6502"
        .include "apple2.inc"

        .include "../inc/apple2.inc"
        .include "../inc/prodos.inc"

        .org SYS_ADDR

        cld

        bit     ROMIN2
        sta     CLR80VID
        sta     CLRALTCHAR
        sta     CLR80COL
        jsr     SETVID
        jsr     SETKBD
        jsr     SETNORM
        jsr     INIT
        jsr     HOME

        lda     #$C0            ; text: bright greeen on black
        sta     TBCOLOR
        lda     #$00            ; border: black
        sta     CLOCKCTL

        MLI_CALL QUIT, quit_params
        brk

        DEFINE_QUIT_PARAMS quit_params
