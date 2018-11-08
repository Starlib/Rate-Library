C----------------------------------------------------------------------------
      program reduceNet
C-------------------------------------------------------------------------
c     Uses STARLIB as input and produces REACTIONS.DAT, which is 
c     a subset of interactions; only those links appear in the latter 
c     file if each species can be found in SUNET.DAT
C-------------------------------------------------------------------------                                                                                
      integer i,j,k,numspec,geta,niso,n,m,nhelp,help
      integer atotal,inatotal,add,total,totin,totout
      character*5 translate,spec(6),spec2(6),iso(10000)
      character*70 instring,ratedatafile
      real*8 temp(60),rate(60),uncert(60)

      write(6,*) 'Enter name of starlib file to be truncated:'
      read(5,*) ratedatafile

      OPEN(20,FILE='sunet.dat',STATUS='unknown')
      OPEN(30,FILE=ratedatafile,STATUS='unknown')
      open(40,file='reactions.dat',status='unknown')

      numspec=6
      j=1
  11  read(20,1010,end=19) iso(j)
      if(iso(j).eq.'     ') goto 19
      j=j+1
      goto 11  

  19  niso=j-1
            
      write(6,*) 'Number of isotopes: ',niso
c ----------------------------------------------------------
c ----------------------------------------------------------

  60  READ(30,1000,end=25) INSTRING
      do 12 i=1,60
         read(30,*) temp(i),rate(i),uncert(i)
  12  continue
      
c------------------------------------------------------------
c     analyze instring
c------------------------------------------------------------
      DO 126 K=1,NUMSPEC
         SPEC(K) = INSTRING((1+K*5):(5+K*5))
         SPEC2(K) = TRANSLATE( SPEC(K) )
 126  CONTINUE
c------------------------------------------------------------
c     find total number of species
c------------------------------------------------------------
      K=1
 130  IF ((SPEC2(K).NE.'     ').AND.(K.LE.NUMSPEC)) THEN
         K=K+1
         GOTO 130
      ENDIF
      TOTAL = K-1

      ATOTAL=0
      DO 125 K=1,TOTAL
         ATOTAL=ATOTAL+GETA(SPEC2(K))
 125  CONTINUE
      INATOTAL=ATOTAL/2
c------------------------------------------------------------
c     find total number of incident and outgoing particles
c------------------------------------------------------------
      ADD=0
      K=0
 135  IF (ADD.LT.INATOTAL) THEN
         K=K+1
         ADD=ADD+GETA(SPEC2(K))
         GOTO 135
      ENDIF
      TOTIN=K
      TOTOUT=TOTAL-TOTIN
c-----------------------------------------------------------------
c     choice=y means: all species in instring have been found in
c     SUNET.DAT!
c-----------------------------------------------------------------          
      nhelp=0
     
      do 599 m=1,numspec
         if(spec(m).ne.'     ') then
            do 567 n=1,niso
               if(spec(m).eq.iso(n)) then
                  nhelp=nhelp+1
                  goto 599
               endif      
  567       continue
         endif
  599 continue

      if(total.eq.nhelp) then
         write(40,1000) instring
         do 14 i=1,60
            write(40,1012) temp(i),rate(i),uncert(i)
  14     continue
         goto 60
      else
         goto 60      
      endif
      	        
   25 continue 

 1000 FORMAT(A70)          
 1010 format(a5)
 1012 format(1pE8.2,5x,2(1pE9.3,5x))

      close(20)
      close(30)
      close(40)

 937  write(6,*) 'Truncated output can be found in reactions.dat'
      write(6,*)
           
      END
                                                      
C----------------------------------------------------------------------------
C----------------------------------------------------------------------------
      INTEGER FUNCTION GETA(STRING)
C -------------------------------------
C Takes a string like the
C output from TRANSLATE
C and give the hadron
C number of the nucleus.
C -------------------------------------

      CHARACTER*5 STRING
      CHARACTER*9 NUMBERS

      NUMBERS = '123456789'
      
      IF (STRING(3:3).EQ.' ') THEN
      
         GETA= 10 * INDEX(NUMBERS,STRING(4:4))
     *         + INDEX(NUMBERS,STRING(5:5))
      ELSE

         GETA= 100 * INDEX(NUMBERS,STRING(3:3))
     *         + 10 * INDEX(NUMBERS,STRING(4:4))
     *         + INDEX(NUMBERS,STRING(5:5))
      
      ENDIF
            
      IF((STRING.EQ.'AL -6').OR.(STRING.EQ.'AL *6').or.
     &   (STRING.EQ.'AL 01').or.(STRING.EQ.'AL 02').or.
     &   (STRING.EQ.'AL 03'))THEN
        GETA = 26
      ENDIF

      RETURN
      END
c-----------------------------------------------------------------------
C-----------------------------------------------------------------------
      CHARACTER*5 FUNCTION TRANSLATE(INSTRING)
C ----------------------------------------------------------------------
C For example:
C      n    ->   NE  1
C      d    ->   H   2
C     c9    ->   C   9
C   mg22    ->   MG 22
C --------------------------

      CHARACTER*26 SMCASE
      CHARACTER*26 LGCASE

      CHARACTER*10 NUMERAL
      PARAMETER (NUMERAL='0123456789')

      CHARACTER*5 INSTRING
      INTEGER I,J

      TRANSLATE = '     '
      SMCASE='abcdefghijklmnopqrstuvwxyz'
      LGCASE='ABCDEFGHIJKLMNOPQRSTUVWXYZ'

      IF (INSTRING .EQ. '    n') THEN
        TRANSLATE = 'NE  1'
      ELSE IF (INSTRING .EQ. '    p') THEN
        TRANSLATE = 'H   1'
      ELSE IF (INSTRING .EQ. '    d') THEN
        TRANSLATE = 'H   2'
      ELSE IF (INSTRING .EQ. '    t') THEN
        TRANSLATE = 'H   3'
      ELSE IF (INSTRING .EQ. '     ') THEN
        TRANSLATE = '     '
      ELSE IF (INSTRING .EQ. ' al-6') THEN
        TRANSLATE = 'AL -6'
      ELSE IF (INSTRING .EQ. ' al*6') THEN
        TRANSLATE = 'AL *6'
      ELSE IF (INSTRING .EQ. ' al01') THEN
        TRANSLATE = 'AL 01'
      ELSE IF (INSTRING .EQ. ' al02') THEN
        TRANSLATE = 'AL 02'
      ELSE IF (INSTRING .EQ. ' al03') THEN
        TRANSLATE = 'AL 03'	
      ELSE
        I = 1

C---- Go forward until we hit a letter.
30      IF (INSTRING(I:I).EQ.' ') THEN
          I = I + 1
          GOTO 30
        ENDIF

C---- Upcase the first letter.
        J = INDEX(SMCASE,INSTRING(I:I))
        TRANSLATE(1:1) =  LGCASE(J:J)

C---- See if there's a second letter and upcase it.
        IF (INDEX(SMCASE,INSTRING(I+1:I+1)).NE.0) THEN
          J = INDEX(SMCASE,INSTRING(I+1:I+1))
          TRANSLATE(2:2) = LGCASE(J:J)
        ENDIF

C---- Get last numeral.
        TRANSLATE(5:5) = INSTRING(5:5)

C---- See if there's a second numeral and get it.
        IF( INDEX( NUMERAL,INSTRING(4:4) ).NE.0 ) THEN
          TRANSLATE(4:4) = INSTRING(4:4)
        ENDIF

C---- See if there's a third numeral and get it.
        IF( INDEX( NUMERAL,INSTRING(3:3) ).NE.0 ) THEN
          TRANSLATE(3:3) = INSTRING(3:3)
        ENDIF

      ENDIF

      RETURN
      END

