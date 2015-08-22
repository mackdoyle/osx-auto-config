FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � �
  Author: Kendall Conrad of Angelwatt.com
  Name: Open Line Up
  Created: 2010-01-18
  Updated: 2010-01-18
  Description: Creates a new line above the line currently on at appropriate indent level
     � 	 	� 
     A u t h o r :   K e n d a l l   C o n r a d   o f   A n g e l w a t t . c o m 
     N a m e :   O p e n   L i n e   U p 
     C r e a t e d :   2 0 1 0 - 0 1 - 1 8 
     U p d a t e d :   2 0 1 0 - 0 1 - 1 8 
     D e s c r i p t i o n :   C r e a t e s   a   n e w   l i n e   a b o v e   t h e   l i n e   c u r r e n t l y   o n   a t   a p p r o p r i a t e   i n d e n t   l e v e l 
   
�� 
 l    � ����  O    �    O    �    k    �       I   ������
�� .miscactvnull��� ��� obj ��  ��        r        n        1    ��
�� 
SLin  1    ��
�� 
pusl  o      ���� 0 linenum lineNum      r    !    n        1    ��
�� 
leng  4    �� 
�� 
clin  o    ���� 0 linenum lineNum  o      ���� 0 leng       !   l  " "�� " #��   " #  Move cursor to start of line    # � $ $ :   M o v e   c u r s o r   t o   s t a r t   o f   l i n e !  % & % Z   " 9 ' (���� ' ?   " % ) * ) o   " #���� 0 leng   * m   # $����   ( I  ( 5�� +��
�� .miscslctnull��� ��� obj  + n   ( 1 , - , 8   / 1��
�� 
cins - l  ( / .���� . n   ( / / 0 / 4   , /�� 1
�� 
cha  1 m   - .����  0 4   ( ,�� 2
�� 
clin 2 o   * +���� 0 linenum lineNum��  ��  ��  ��  ��   &  3 4 3 l  : :�� 5 6��   5   Find leading whitespace    6 � 7 7 0   F i n d   l e a d i n g   w h i t e s p a c e 4  8 9 8 r   : Q : ; : I  : M�� < =
�� .R*chFindMtch���     TEXT < m   : ; > > � ? ?  ( ^ [ \ s ] * ) = �� @ A
�� 
Opts @ K   < @ B B �� C��
�� 
SMod C m   = >��
�� SModGrep��   A �� D��
�� 
FnIn D 4   C G�� E
�� 
clin E l  E F F���� F o   E F���� 0 linenum lineNum��  ��  ��   ; o      ���� 0 	theresult 	theResult 9  G H G l  R R�� I J��   I ( " Set text to the white space found    J � K K D   S e t   t e x t   t o   t h e   w h i t e   s p a c e   f o u n d H  L M L r   R Y N O N m   R U P P � Q Q   O o      ���� 	0 white   M  R S R Z   Z t T U���� T n   Z b V W V 1   ] a��
�� 
Fnd? W o   Z ]���� 0 	theresult 	theResult U r   e p X Y X n   e l Z [ Z 1   h l��
�� 
MTxt [ o   e h���� 0 	theresult 	theResult Y o      ���� 	0 white  ��  ��   S  \ ] \ l  u u�� ^ _��   ^ + % Insert a return plus the white space    _ � ` ` J   I n s e r t   a   r e t u r n   p l u s   t h e   w h i t e   s p a c e ]  a b a r   u � c d c b   u | e f e o   u x���� 	0 white   f o   x {��
�� 
ret  d 1   | ��
�� 
pusl b  g�� g I  � ��� h��
�� .miscslctnull��� ��� obj  h n   � � i j i 8   � ���
�� 
cins j l  � � k���� k n   � � l m l 4   � ��� n
�� 
cha  n m   � ������� m 1   � ���
�� 
pusl��  ��  ��  ��    4   �� o
�� 
cwin o m    ����   m      p p�                                                                                  !Rch  alis    f  Macintosh HD               �ԬtH+   9��TextWrangler.app                                                ���	�        ����  	                Applications    ���      �	�G     9��  +Macintosh HD:Applications: TextWrangler.app   "  T e x t W r a n g l e r . a p p    M a c i n t o s h   H D  Applications/TextWrangler.app   / ��  ��  ��  ��       
�� q r���� s P��������   q ����������������
�� .aevtoappnull  �   � ****�� 0 linenum lineNum�� 0 leng  �� 0 	theresult 	theResult�� 	0 white  ��  ��  ��   r �� t���� u v��
�� .aevtoappnull  �   � **** t k     � w w  
����  ��  ��   u   v  p���������������������� >�������������� P��������
�� 
cwin
�� .miscactvnull��� ��� obj 
�� 
pusl
�� 
SLin�� 0 linenum lineNum
�� 
clin
�� 
leng�� 0 leng  
�� 
cha 
�� 
cins
�� .miscslctnull��� ��� obj 
�� 
Opts
�� 
SMod
�� SModGrep
�� 
FnIn�� 
�� .R*chFindMtch���     TEXT�� 0 	theresult 	theResult�� 	0 white  
�� 
Fnd?
�� 
MTxt
�� 
ret �� �� �*�k/ �*j O*�,�,E�O*��/�,E�O�j *��/�k/�3j Y hO����la *��/a  E` Oa E` O_ a ,E _ a ,E` Y hO_ _ %*�,FO*�,�i/�3j UU�� ��  s ������
�� 
Fnd?
�� boovfals��  ��  ��  ��  ascr  ��ޭ